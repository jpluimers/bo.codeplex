unit FileVersionUnit;

interface

uses
  Windows;

type
  //1 Based on FileVersionInfo in .NET
  /// http://msdn.microsoft.com/en-us/library/system.diagnostics.fileversioninfo(VS.
  /// 71).aspx
  /// The first 16 bits are the FileMajorPart number.
  /// The next 16 bits are the FileMinorPart number.
  /// The third set of 16 bits are the FileBuildPart number.
  /// The last 16 bits are the FilePrivatePart number.
  TFileVersion = record
  strict private
    FVSFixedFileInfo: TVSFixedFileInfo;
    function GetFileMajorPart: Integer;
    function GetFileMinorPart: Integer;
    function GetFileBuildPart: Integer;
    function GetFilePrivatePart: Integer;
  public
    constructor Create(const VSFixedFileInfo: TVSFixedFileInfo); overload;
    //1 based on the SysUtils.GetFileVersion() function
    constructor Create(const AFileName: string); overload;
    function ToString: string;
    property FileMajorPart: Integer read GetFileMajorPart;
    property FileMinorPart: Integer read GetFileMinorPart;
    property FileBuildPart: Integer read GetFileBuildPart;
    property FilePrivatePart: Integer read GetFilePrivatePart;
    property VSFixedFileInfo: TVSFixedFileInfo read FVSFixedFileInfo;
(*
  tagVS_FIXEDFILEINFO = packed record
    dwSignature: DWORD;        { e.g. $feef04bd }
    dwStrucVersion: DWORD;     { e.g. $00000042 = "0.42" }
    dwFileVersionMS: DWORD;    { e.g. $00030075 = "3.75" }
    dwFileVersionLS: DWORD;    { e.g. $00000031 = "0.31" }
    dwProductVersionMS: DWORD; { e.g. $00030010 = "3.10" }
    dwProductVersionLS: DWORD; { e.g. $00000031 = "0.31" }
    dwFileFlagsMask: DWORD;    { = $3F for version "0.42" }
    dwFileFlags: DWORD;        { e.g. VFF_DEBUG | VFF_PRERELEASE }
    dwFileOS: DWORD;           { e.g. VOS_DOS_WINDOWS16 }
    dwFileType: DWORD;         { e.g. VFT_DRIVER }
    dwFileSubtype: DWORD;      { e.g. VFT2_DRV_KEYBOARD }
    dwFileDateMS: DWORD;       { e.g. 0 }
    dwFileDateLS: DWORD;       { e.g. 0 }
  end;
*)

  end;

implementation

uses
  SysUtils;

constructor TFileVersion.Create(const VSFixedFileInfo: TVSFixedFileInfo);
begin
  FVSFixedFileInfo := VSFixedFileInfo;
end;

constructor TFileVersion.Create(const AFileName: string);
var
  FileName: string;
  InfoSize, Wnd: DWORD;
  VerBuf: Pointer;
  FI: PVSFixedFileInfo;
  VerSize: DWORD;
begin
  FillChar(FVSFixedFileInfo, SizeOf(FVSFixedFileInfo), 0);

  // GetFileVersionInfo modifies the filename parameter data while parsing.
  // Copy the string const into a local variable to create a writeable copy.
  FileName := AFileName;
  UniqueString(FileName);
  InfoSize := GetFileVersionInfoSize(PChar(FileName), Wnd);
  if InfoSize <> 0 then
  begin
    GetMem(VerBuf, InfoSize);
    try
      if GetFileVersionInfo(PChar(FileName), Wnd, InfoSize, VerBuf) then
        if VerQueryValue(VerBuf, '\', Pointer(FI), VerSize) then
          Create(FI^);
    finally
      FreeMem(VerBuf);
    end;
  end;
end;

function TFileVersion.GetFileMajorPart: Integer;
begin
  Result := HiWord(VSFixedFileInfo.dwFileVersionMS);
end;

function TFileVersion.GetFileMinorPart: Integer;
begin
  Result := LoWord(VSFixedFileInfo.dwFileVersionMS);
end;

function TFileVersion.GetFileBuildPart: Integer;
begin
  Result := HiWord(VSFixedFileInfo.dwFileVersionLS);
end;

function TFileVersion.GetFilePrivatePart: Integer;
begin
  Result := LoWord(VSFixedFileInfo.dwFileVersionLS);
end;

function TFileVersion.ToString: string;
begin
  Result := Format('%d.%d.%d.%d', [Self.FileMajorPart, Self.FileMinorPart, Self.FileBuildPart, self.FilePrivatePart]);
end;

end.
