unit ApplicationHelperUnit;

interface

uses
  Forms, SysUtils, Types, Variants, Classes;

type
  TApplicationHelper = class helper for TApplication
  protected // strict protected werkt niet in deze application helper: compiler bug?
    function GetProcessId: DWORD; virtual;
  public
    function Directory: string;
    function Filename: string;
    function Pathname: string;
    function FileNameRelativeTo(const Extension: string): string;
    function DesktopFoldername: string;
    procedure TerminateDuringStartup;
  end;

implementation

uses
  Windows, PsAPI, ShlObj;

function TApplicationHelper.DesktopFoldername: string;
var
  buf: array[0..MAX_PATH] of char;
  pidList: PItemIDList;
begin
  Result := NullAsStringValue;
  SHGetSpecialFolderLocation(Application.Handle, CSIDL_DESKTOP, pidList);

  if (pidList <> nil) then
    if (SHGetPathFromIDList(pidList, buf)) then
      Result := buf;
end;

function TApplicationHelper.Directory: string;
begin
  Result := ExtractFilePath(Self.Pathname);
end;

function TApplicationHelper.Filename: string;
begin
  Result := ExtractFileName(Self.Pathname);
end;

function TApplicationHelper.Pathname: string;
const
  //#if WINVER >= 0x600
  //#  define PROCESS_GET_IMAGE_NAME (PROCESS_QUERY_INFORMATION | PROCESS_QUERY_LIMITED_INFORMATION | PROCESS_VM_READ)
  //#else
  PROCESS_GET_IMAGE_NAME = PROCESS_QUERY_INFORMATION or PROCESS_VM_READ;
  //#endif
var
  ProcessId: DWORD;
  ProcessHandle: THandle;
begin
  // jpl: new way that works if you rename the .EXE when it is running:
  // http://www.delphitricks.com/source-code/windows/get_exe_path_from_window_handle.html
  // http://stackoverflow.com/questions/687001/queryfullprocessimagename-failing-with-valid-hinstance
  ProcessId := Self.GetProcessId;
  ProcessHandle := OpenProcess(PROCESS_GET_IMAGE_NAME, False, ProcessId);
  try
    SetLength(Result, MAX_PATH);
    if GetModuleFileNameEx(ProcessHandle, 0, PChar(Result), MAX_PATH) = 0 then
    begin
      Result := NullAsStringValue;
      RaiseLastOSError();
    end
    else
      SetLength(Result, StrLen(PChar(Result)));
  finally
    CloseHandle(ProcessHandle);
  end;
  // jpl: old way, but this fails if you rename the .EXE when it is running:
  //  Result := Self.ExeName;
end;

function TApplicationHelper.FileNameRelativeTo(const Extension: string): string;
begin
  Result := Self.Pathname;
  Result := ChangeFileExt(Result, Extension);
end;

function TApplicationHelper.GetProcessId: DWORD;
begin
  if (GetWindowThreadProcessID(Self.Handle, Result) = 0) then
    RaiseLastOSError();
end;

procedure TApplicationHelper.TerminateDuringStartup;
begin
  Self.ShowMainForm := False;
  Self.Terminate;
end;

end.
