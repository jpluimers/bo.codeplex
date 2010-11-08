unit OutputDebugViewUnit;

interface

{ TODO: Fix a bug in Windows 95 that prevents OutputDebugString to be visible in DBWIN32 / DebugView }

procedure OutputDebugViewA(lpOutputString: PAnsiChar); stdcall;
procedure OutputDebugViewW(lpOutputString: PWideChar); stdcall;
{$ifdef UNICODE}
procedure OutputDebugViewU(lpOutputString: PWideChar); stdcall;
{$endif UNICODE}
procedure OutputDebugView(lpOutputString: PAnsiChar); stdcall;

implementation

uses
  SysUtils,
{$ifdef win32}
  Windows;
{$else}
  WinTypes, WinProcs;
{$endif win32}

type
  PSharedMem = ^TSharedMem;
  TSharedMem = record
    ProcessID: DWord;
{$ifdef UNICODE}
    CharBuffer: array[0..500] of AnsiChar;
{$else}
    CharBuffer: array[0..500] of Char;
{$endif UNICODE}
  end;

procedure OutputDebugViewA(lpOutputString: PAnsiChar); stdcall;
var
  Utf8String: string;
begin
  Utf8String := UTF8ToString(lpOutputString);
{$ifdef UNICODE}
  OutputDebugViewU(PChar(Utf8String));
{$else}
  OutputDebugView(PChar(Utf8String));
{$endif UNICODE}
end;

procedure OutputDebugViewW(lpOutputString: PWideChar); stdcall;
begin
{$ifdef UNICODE}
  OutputDebugViewU(lpOutputString);
{$else}
  OutputDebugView(PChar(WideCharToString(lpOutputString)));
{$endif UNICODE}
end;

{$ifdef UNICODE}
procedure OutputDebugViewU(lpOutputString: PWideChar); stdcall;
var
  Utf8String: RawByteString;
begin
  Utf8String := UTF8Encode(lpOutputString);
  OutputDebugView(PAnsiChar(Utf8String));
end;
{$endif UNICODE}

procedure OutputDebugView(lpOutputString: PAnsiChar); stdcall;
{$ifdef win32}
var
  heventDBWIN: THandle;  { DBWIN32 synchronization object }
  heventData: THandle;   { data passing synch object }
  hSharedFile: THandle;  { memory mapped file shared data }
  SharedMem: PSharedmem; { shared data }
  VerInfo: TOSVERSIONINFO;
begin
{ Do a regular OutputDebugString so that the output is
  still seen in the debugger window if it exists. }
{$ifdef UNICODE}
  Windows.OutputDebugStringA(lpOutputString);
{$else}
  Windows.OutputDebugString(lpOutputString);
{$endif UNICODE}
{ The regular OutputDebugString only works in the following circumstances:
    - Windows 95: never
    - Windows NT: only if run as part of Delphi (DebugHook=0)
    - Win32s: never
}
{ bail if OutputDebugString is supposed to work }
  VerInfo.dwOSVersionInfoSize := sizeof(TOSVERSIONINFO);
  GetVersionEx(VerInfo);
  with VerInfo do
    if (dwPlatformId = VER_PLATFORM_WIN32_NT) and
       (DebugHook=0) { running as part of Delphi? }
    then
      exit;
{ make sure DBWIN is open and waiting }
  heventDBWIN := OpenEvent(EVENT_MODIFY_STATE, FALSE, 'DBWIN_BUFFER_READY');
  if heventDBWIN = 0 then begin
    // MessageBox(0, 'DBWIN_BUFFER_READY nonexistent', nil, MB_OK);
    exit;
  end;
{ get a handle to the data synch object }
  heventData := OpenEvent(EVENT_MODIFY_STATE, FALSE, 'DBWIN_DATA_READY');
  if heventData = 0 then begin
    // MessageBox(0, 'DBWIN_DATA_READY nonexistent', nil, MB_OK);
    CloseHandle(heventDBWIN);
    exit;
  end;
{ get a handle to the memory mapped file }
  hSharedFile := CreateFileMapping(THANDLE(-1), nil, PAGE_READWRITE, 0, 4096, 'DBWIN_BUFFER');
  if hSharedFile = 0 then begin
    // MessageBox(0, 'DebugTrace: Unable to create file mapping object DBWIN_BUFFER', 'Error', MB_OK);
    CloseHandle(heventDBWIN);
    CloseHandle(heventData);
    exit;
  end;
{ get a pointer to the memory mapped file
  (this points to the shared memory between our process and the DBWIN32 process) }
  SharedMem := MapViewOfFile(hSharedFile, FILE_MAP_WRITE, 0, 0, 512);
  if SharedMem = nil then begin
    // MessageBox(0, 'DebugTrace: Unable to map shared memory', 'Error', MB_OK);
    CloseHandle(heventDBWIN);
    CloseHandle(heventData);
    exit;
  end;
{ wait for buffer event }
  WaitForSingleObject(heventDBWIN, INFINITE);
{ write it to the shared memory }
  SharedMem.ProcessId := GetCurrentProcessId;
  StrLCopy(SharedMem.CharBuffer, lpOutputString, 500);
{ signal data ready event }
  SetEvent(heventData);
{ clean up handles }
  if not UnMapViewOfFile(SharedMem) then
    MessageBox(0, 'DebugTrace: Unable to un-map shared memory', 'Error', MB_OK);
  CloseHandle(hSharedFile);
  CloseHandle(heventData);
  CloseHandle(heventDBWIN);
end;
{$else}
begin
  WinProcs.OutputDebugString(lpOutputString);
end;
{$endif}

end.

