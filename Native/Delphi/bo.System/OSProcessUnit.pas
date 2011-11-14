unit OSProcessUnit;

interface

//{$R *.RES}            // TODO ##jpl: component icon

uses
  SysUtils,
  Windows, // TStartupInfo
  Classes, // TComponent
  ActivatableUnit; // TActivatable

type
  // see the ShowWindow() parameter at http://msdn.microsoft.com/en-us/library/ms686331(VS.85).aspx
  TShowWindow = (
    swHide,
    swShowNormal,
    swShowMinimized,
    swShowMaximized,
    swMaximize,
    swShowNoActivate,
    swShow,
    swMinimize,
    swShowMinNoActive,
    swShowNA,
    swRestore,
    swShowDefault,
    swMax);

  EOSProcess = class(Exception)
  end;

  TCustomOSProcess = class(TActivatable)
  { "Activation" logic }
  protected
    procedure InternalAfterOpen; override;
    procedure InternalAfterClose; override;
  { "OSProcess" properties }
  private
    FModuleName: string;
    FParams: string;
    FCaption: string;
    FDirectory: string;
    FShowWindow: TShowWindow;
    FOSProcessWaitThread: TThread;
  protected
    procedure AssertInActive; virtual;
    procedure SetModuleName(Value: string); virtual;
    procedure SetParams(Value: string); virtual;
    procedure SetCaption(Value: string); virtual;
    procedure SetDirectory(Value: string); virtual;
    procedure SetShowWindow(Value: TShowWindow); virtual;
    property ModuleName: string read FModuleName write SetModuleName;
    property Params: string read FParams write SetParams;
    property Caption: string read FCaption write SetCaption;
    property Directory: string read FDirectory write SetDirectory;
    property ShowWindow: TShowWindow read FShowWindow write SetShowWindow default swShowNormal;
  { "OSProcess" logic }
  private
    FStartupInfo: TStartupInfo;
    FProcessInfo: TProcessInformation;
    FExitCode: UINT;
  protected
    function GetProcessHandle: THandle; virtual;
    procedure ClearProcessInfo; virtual;
    procedure StartProcess; virtual;
    procedure StopProcess; virtual;
    procedure ProcessTerminates(Sender: TObject); virtual;
    function CheckExitCodeProcess: Boolean; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Execute; virtual;
    procedure ExecuteAndWait; virtual;
  public
    property ProcessHandle: THandle read GetProcessHandle;
    property ExitCode: UINT read FExitCode;
  end;

  TOSProcess = class(TCustomOSProcess)
  published
    property Active;
    property ModuleName;
    property Params;
    property Caption;
    property Directory;
    property ShowWindow;
  end;

implementation

uses
  LoggerInterfaceUnit,
  LoggerUnit,
  EnumTypeInfoUnit;

type
  TOSProcessWaitThread = class(TThread)
  strict private
    FLogger: ILeveledLogger;
    FProcessHandle: THandle;
  strict protected
    function GetLogger: ILeveledLogger; virtual;
    procedure SetLogger(const Value: ILeveledLogger); virtual;
    procedure Execute; override;
  public
    constructor Create(AProcessHandle: THandle); overload;
    constructor Create(const AProcessHandle: THandle; const Logger: ILeveledLogger); overload;
    property Logger: ILeveledLogger read GetLogger write SetLogger;
    property Terminated;
  end;

constructor TOSProcessWaitThread.Create(AProcessHandle: THandle);
begin
  Logger.Log('TOSProcessWaitThread.Create(%d)',[AProcessHandle]);
  FProcessHandle := AProcessHandle;
  FreeOnTerminate := True;
  inherited Create(False);
end;

constructor TOSProcessWaitThread.Create(const AProcessHandle: THandle; const Logger: ILeveledLogger);
begin
  Create(AProcessHandle);
  FLogger := Logger;
end;

procedure TOSProcessWaitThread.Execute;
begin
  Logger.Enter(Self, 'WaitForSingleObject %d',[FProcessHandle]);
  WaitForSingleObject(FProcessHandle, INFINITE);
  Logger.Leave(Self, 'WaitForSingleObject %d',[FProcessHandle]);
end;

function TOSProcessWaitThread.GetLogger: ILeveledLogger;
begin
  Result := TLeveledLogger.CreateIfNeeded(FLogger);
end;

procedure TOSProcessWaitThread.SetLogger(const Value: ILeveledLogger);
begin
  FLogger := Value;
end;

{ "Activation" logic }

resourcestring
{$ifdef English}
  sCanNotChangePropertyWhileActive = 'Can not change property while active';
{$else}
  sCanNotChangePropertyWhileActive = 'Kan property niet wijzigen als object actief is';
{$endif English}

procedure TCustomOSProcess.InternalAfterOpen;
begin
  StartProcess();
end;

procedure TCustomOSProcess.InternalAfterClose;
begin
  StopProcess();
end;

{ "OSProcess" properties }

procedure TCustomOSProcess.AssertInActive;
begin
  if Active and not (csLoading in ComponentState) then
    raise EOSProcess.Create(sCanNotChangePropertyWhileActive);
end;

procedure TCustomOSProcess.SetModuleName(Value: string);
begin
  if Value <> ModuleName then
  begin
    AssertInActive();
    FModuleName := Value;
  end;
end;

procedure TCustomOSProcess.SetParams(Value: string);
begin
  if Value <> Params then
  begin
    AssertInActive();
    FParams := Value;
  end;
end;

procedure TCustomOSProcess.SetCaption(Value: string);
begin
  if Value <> Caption then
  begin
    AssertInActive();
    FCaption := Value;
  end;
end;

procedure TCustomOSProcess.SetDirectory(Value: string);
begin
  if Value <> Directory then
  begin
    AssertInActive();
    FDirectory := Value;
  end;
end;

procedure TCustomOSProcess.SetShowWindow(Value: TShowWindow);
begin
  if Value <> ShowWindow then
  begin
    AssertInActive();
    FShowWindow := Value;
  end;
end;

{ "OSProcess" logic }

function TCustomOSProcess.GetProcessHandle: THandle;
begin
  Result := FProcessInfo.hProcess;
end;

procedure TCustomOSProcess.ClearProcessInfo;
begin
  FillChar(FProcessInfo, Sizeof(FProcessInfo), #0); // for GetProcessHandle to return null if no process
end;

procedure TCustomOSProcess.StartProcess;
var
  ApplicationName: string;
  CurrentDirectory: PChar;
begin
  ApplicationName := Format('%s %s', [ModuleName, Params]);
  CurrentDirectory := Pointer(Directory); // returns NIL if Directory=''

  FStartupInfo.wShowWindow := Ord(ShowWindow);
  Logger.Log('CreateProcess ShowWindow=%s, Directory=%s, Application=%s',
    [EnumerationInfo(Ord(ShowWindow), TypeInfo(TShowWindow)),
     ApplicationName,
     Directory]);
  if CreateProcess(
    nil,                           { don't use this parameter, it doesnot work under NT }
    PChar(ApplicationName),        { pointer to command line string }
    nil,                           { pointer to process SECURITY_ATTRIBUTES }
    nil,                           { pointer to thread SECURITY_ATTRIBUTES }
    false,                         { handle inheritance flag }
    CREATE_NEW_CONSOLE or          { creation flags }
    NORMAL_PRIORITY_CLASS,
    nil,                           { pointer to new environment block }
    CurrentDirectory,              { pointer to current directory name }
    FStartupInfo,                  { pointer to STARTUPINFO }
    FProcessInfo)                  { pointer to PROCESS_INFORMATION }
  then
  begin
    FOSProcessWaitThread := TOSProcessWaitThread.Create(ProcessHandle, Logger);
    FOSProcessWaitThread.OnTerminate := ProcessTerminates;
    FExitCode := 0;
    CheckExitCodeProcess();
    with FProcessInfo do
    begin
      Logger.Log('hProcess=%d; hThread=%d', [hProcess, hThread]);
      Logger.Log('dwProcessId=%d; dwThreadId=%d', [dwProcessId, dwThreadId]);
    end;
  end
  else
    RaiseLastOSError();
end;

procedure TCustomOSProcess.StopProcess;
var
  Result: Boolean;
begin
  if CheckExitCodeProcess then
  begin
    if ExitCode = STILL_ACTIVE then
    begin
      Result := TerminateProcess(ProcessHandle, LongWord(-1));
      Logger.Log('TerminateProcess returns %d',[Ord(Result)]);
      CheckExitCodeProcess();
    end;
  end;
  CloseHandle(FProcessInfo.hProcess);
  CloseHandle(FProcessInfo.hThread);
  ClearProcessInfo();
end;

procedure TCustomOSProcess.ProcessTerminates(Sender: TObject);
begin
  Logger.Log('ProcessTerminates %d',[ProcessHandle]);
  Close();
end;

function TCustomOSProcess.CheckExitCodeProcess: Boolean;
begin
  Result := GetExitCodeProcess(ProcessHandle, FExitCode);
  Logger.Log('GetExitCodeProcess returns %d with code %d',[Ord(Result), ExitCode]);
end;

{= public =}

constructor TCustomOSProcess.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ClearProcessInfo();
  FillChar(FStartupInfo, Sizeof(FStartupInfo), #0);
  FStartupInfo.cb := Sizeof(FStartupInfo);
  FStartupInfo.dwFlags := STARTF_USESHOWWINDOW;
  FStartupInfo.wShowWindow := SW_SHOWNORMAL;
  FShowWindow := swShowNormal;
end;

destructor TCustomOSProcess.Destroy;
begin
  inherited Destroy();
  if Assigned(FOSProcessWaitThread) then
  begin
    FOSProcessWaitThread.OnTerminate := nil;
    if TOSProcessWaitThread(FOSProcessWaitThread).Terminated then
      FOSProcessWaitThread.Free()
    else
      FOSProcessWaitThread.FreeOnTerminate := True;
  end;
end;

procedure TCustomOSProcess.Execute;
begin
  Open();
end;

procedure TCustomOSProcess.ExecuteAndWait;
begin
  Execute();
  WaitForSingleObject(ProcessHandle, INFINITE);
end;

end.

