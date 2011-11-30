unit HiddenExecuteArgumentsUnit;

interface

uses
  CommandParser,
  LoggerInterfaceUnit,
  HiddenExecuteSettingsUnit;

type
  THiddenExecuteArguments = class(TObject)
    procedure ActSaveOptionsAccept(Sender: TObject);
  strict private
    FCommandLine: TCommandParser;
    FCommandsProcessed: Boolean;
  private
    FLogger: ILeveledLogger;
    FHiddenExecuteSettings: THiddenExecuteSettings;
  strict protected
    procedure DisplayHelp; virtual;
    function GetCommandLine: TCommandParser; virtual;
    procedure InitCommandLine; virtual;
    function ProcessCommandLine: Boolean; virtual;
    property CommandLine: TCommandParser read GetCommandLine;
    property Logger: ILeveledLogger read FLogger write FLogger;
    //1 needs to be read write because InitCommandLine otherwise fails with a E2130 Cannot read write-only property
    property HiddenExecuteSettings: THiddenExecuteSettings read FHiddenExecuteSettings write FHiddenExecuteSettings;
  public
    function Run(const Logger: ILeveledLogger; const HiddenExecuteSettings: THiddenExecuteSettings): Boolean;
    destructor Destroy; override;
    function HelpText: string;
  end;

implementation

uses
  SysUtils;

function THiddenExecuteArguments.Run(const Logger: ILeveledLogger; const HiddenExecuteSettings:
    THiddenExecuteSettings): Boolean;
begin
  Assert(Assigned(HiddenExecuteSettings), 'TCas400MqConversationArguments.Run requires HiddenExecuteSettings');
  Assert(Assigned(Logger), 'TCas400MqConversationArguments.Run requires Logger');
  FHiddenExecuteSettings := HiddenExecuteSettings;
  FLogger := Logger;
  InitCommandLine();
  Result := ProcessCommandLine();
end;

destructor THiddenExecuteArguments.Destroy;
begin
  FreeAndNil(FCommandLine);
  inherited Destroy();
end;

procedure THiddenExecuteArguments.ActSaveOptionsAccept(Sender: TObject);
begin
  CommandLine.SaveOptions(ChangeFileExt(CommandLine.EnvArg, '.settings.txt'));
end;

procedure THiddenExecuteArguments.DisplayHelp;
begin
  Logger.Warn.Log(CommandLine.HelpText);
end;

function THiddenExecuteArguments.GetCommandLine: TCommandParser;
begin
  if not Assigned(FCommandLine) then
    InitCommandLine;
  Result := FCommandLine;
end;

function THiddenExecuteArguments.HelpText: string;
begin
  Result := CommandLine.HelpText;
end;

procedure THiddenExecuteArguments.InitCommandLine;
const
  YN: array [Boolean] of string = ('off', 'on');
begin
  FCommandLine := TCommandParser.Create(HiddenExecuteSettings, False, 'HiddenExecute: execute a process hidden',
    'HiddenExecute'); // Do not translate
  FCommandLine.AddSwitch('h', stBoolean, False, YN[HiddenExecuteSettings.ShowHelp],
    'Show this help page', 'help', 'ShowHelp');
  FCommandLine.AddSwitch('v', stInteger, False, IntToStr(Ord(HiddenExecuteSettings.VerbosityLevel)),
    'Verbosity Level (0=Off, 1=Fatal, 2=Error, 3=Warn, 4=Info, 5=Debug, 6=Trace, 7=All)', 'VerbosityLevel', 'VerbosityLevelInteger');

  FCommandLine.AddSwitch('d', stBoolean, False, YN[HiddenExecuteSettings.DbWinLoggerIsEnabled],
    'Enable logging through DbWin (OutputDebugString and DBWIN_BUFFER_READY/DBWIN_DATA_READY/DBWIN_BUFFER shared memory', 'DbWinLoggerIsEnabled', 'DbWinLoggerIsEnabled');
end;

function THiddenExecuteArguments.ProcessCommandLine: Boolean;
begin
  if FCommandsProcessed then
    Result := True
  else
  begin
    FCommandsProcessed := True;
    Result := (CommandLine.ProcessCommandLine) and (CommandLine.ArgumentCount <> 0) and (not HiddenExecuteSettings.ShowHelp);
    if not Result then
      DisplayHelp;
  end;
end;

end.
