unit DebuggingUnit;

interface

uses
  SysUtils;

type
  TWindowsPlatform = (wpWin32s, wpWin9x, wpWinNT);

function GetWindowsPlatform: TWindowsPlatform;

function DoesOutputDebugStringRedirectToDebugView: Boolean;

function IsRunningUnderDelphiDebugger: Boolean;

function IsRunningUnderAnyDebugger: Boolean;

type
  EDebuggingException = class(Exception);

implementation

uses
  Windows;

function GetWindowsPlatform: TWindowsPlatform;
begin
  case Win32Platform of
    VER_PLATFORM_WIN32s:
      Result := wpWin32s;
    VER_PLATFORM_WIN32_WINDOWS:
      Result := wpWin32s;
    VER_PLATFORM_WIN32_NT:
      Result := wpWin32s;
  else
    raise EDebuggingException.CreateFmt
      ('Unsupported SysUtils.Win32Platform value %d', [Win32Platform]);
  end;
end;

function DoesOutputDebugStringRedirectToDebugView: Boolean;
begin
  { The regular OutputDebugString only redirects to DebugView/DBWin32 under the following circumstances:
    - Windows 95: never
    - Windows NT: only if not run under the Delphi debugger (DebugHook=0)
    - Win32s: never
  }
  // TODO ##jpl: check if IsRunningUnderDelphiDebugger should be IsRunningUnderAnyDebugger, and the second "not" check can go away
  Result := (GetWindowsPlatform = wpWinNT);
  Result := Result and not IsRunningUnderDelphiDebugger;
  Result := Result and not IsRunningUnderAnyDebugger;
end;

function IsRunningUnderDelphiDebugger: Boolean;
begin
{$WARN SYMBOL_PLATFORM OFF}
  Result := (DebugHook <> 0) { running as part of Delphi? }
  // prevent [DCC Warning] ....pas(52): W1002 Symbol 'DebugHook' is specific to a platform
{$WARN SYMBOL_PLATFORM OFF}
end;

function IsRunningUnderAnyDebugger: Boolean;
var
  IsDebuggerPresent: function: Boolean; stdcall;
  KernelHandle: THandle;
  P: Pointer;
begin
  KernelHandle := GetModuleHandle(kernel32);
  @IsDebuggerPresent := GetProcAddress(KernelHandle, 'IsDebuggerPresent');
  if Assigned(IsDebuggerPresent) then // Win98+/NT4+ only
    Result := IsDebuggerPresent
  else
  begin // Win9x uses thunk pointer outside the module when under a debugger
    P := GetProcAddress(KernelHandle, 'GetProcAddress');
    Result := (DWORD(P) < KernelHandle);
  end;
end;

// TODO ##jpl: check if IsRunningUnderAnyDebugger really convers IsDebuggerAttached
function IsDebuggerAttached: Boolean;
var
  TheRegister: integer;
begin
  asm
    push eax	// Preserve the registers
    push ecx
    mov	eax, fs:[$18]	// Get the TIB's linear address
    mov	eax, dword ptr [eax + $30]
    mov	ecx, dword ptr [eax]	// Get the whole DWORD
    mov	TheRegister, ecx	// Save it
    pop ecx	// Restore the registers
    pop eax
  end;
  // The 3rd byte is the byte we really need to check for the
  // presence of a debugger.  // Check the 3rd byte
  Result := (TheRegister and $00010000) <> 0;
end;

end.
