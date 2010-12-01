unit DebuggingUnit;

interface

uses
   SysUtils;

type
   TWindowsPlatform = (wpWin32s, wpWin9x, wpWinNT);

function GetWindowsPlatform: TWindowsPlatform;

function DoesOutputDebugStringRedirectToDebugView: Boolean;

function IsRunningUnderDelphiDebugger: Boolean;

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
      raise EDebuggingException.CreateFmt('Unsupported SysUtils.Win32Platform value %d', [Win32Platform]);
   end;
end;

function DoesOutputDebugStringRedirectToDebugView: Boolean;
begin
   { The regular OutputDebugString only redirects to DebugView/DBWin32 under the following circumstances:
       - Windows 95: never
       - Windows NT: only if not run under the Delphi debugger (DebugHook=0)
       - Win32s: never
   }
   Result := (GetWindowsPlatform = wpWinNT) and not IsRunningUnderDelphiDebugger;
end;

function IsRunningUnderDelphiDebugger: Boolean;
begin
{$WARN SYMBOL_PLATFORM OFF}
   Result := (DebugHook <> 0) { running as part of Delphi? } // prevent [DCC Warning] ....pas(52): W1002 Symbol 'DebugHook' is specific to a platform
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
   else begin // Win9x uses thunk pointer outside the module when under a debugger
      P := GetProcAddress(KernelHandle, 'GetProcAddress');
      Result := (DWORD(P) < KernelHandle);
   end;
end;

end.

