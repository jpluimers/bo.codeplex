unit HiddenExecuteUnit;

// Debug parameter: ..\..\..\src\TestHiddenExecute-by-making-directories-in-TEMP.bat

interface

uses
  Classes,
  StringListWrapperUnit,
  HiddenExecuteArgumentsUnit, HiddenExecuteSettingsUnit, LoggerInterfaceUnit;

type
  IHiddenExecute = interface(IInterface)
    procedure Run;
  end;

  THiddenExecute = class(TInterfacedObject, IHiddenExecute)
  strict private
    FLogger: ILeveledLogger;
  private
    FHiddenExecuteArguments: THiddenExecuteArguments;
    FHiddenExecuteSettings: THiddenExecuteSettings;
  strict protected
    function GetHiddenExecuteArguments: THiddenExecuteArguments; virtual;
    function GetHiddenExecuteSettings: THiddenExecuteSettings; virtual;
    function GetLogger: ILeveledLogger; virtual;
    procedure RunCommandLineAsHiddenProcess(const CommandLineStrings: IStringListWrapper);
    procedure SetLogger(const Value: ILeveledLogger); virtual;
    procedure ShowHelp;
    property HiddenExecuteArguments: THiddenExecuteArguments read GetHiddenExecuteArguments;
    property HiddenExecuteSettings: THiddenExecuteSettings read GetHiddenExecuteSettings;
  protected
    procedure Run;
  public
    destructor Destroy; override;
    class procedure Main;
    property Logger: ILeveledLogger read GetLogger write SetLogger;
  end;

implementation

uses
  DbWinLoggerUnit,
  OSProcessUnit,
  CommandLineUnit,
  Windows, LoggerUnit, SysUtils;

destructor THiddenExecute.Destroy;
begin
  inherited Destroy();
  FHiddenExecuteArguments.Free;
  FHiddenExecuteArguments := nil;
  FHiddenExecuteSettings.Free;
  FHiddenExecuteSettings := nil;
end;

function THiddenExecute.GetHiddenExecuteArguments: THiddenExecuteArguments;
begin
  if not Assigned(FHiddenExecuteArguments) then
    FHiddenExecuteArguments := THiddenExecuteArguments.Create();
  Result := FHiddenExecuteArguments;
end;

function THiddenExecute.GetHiddenExecuteSettings: THiddenExecuteSettings;
begin
  if not Assigned(FHiddenExecuteSettings) then
    FHiddenExecuteSettings := THiddenExecuteSettings.Create(nil);
  Result := FHiddenExecuteSettings;
end;

function THiddenExecute.GetLogger: ILeveledLogger;
begin
  Result := TLeveledLogger.CreateIfNeeded(FLogger);
end;

class procedure THiddenExecute.Main;
var
  HiddenExecute: IHiddenExecute;
begin
  HiddenExecute := THiddenExecute.Create();
  HiddenExecute.Run();
end;

procedure THiddenExecute.Run;
var
  CommandLineStrings: IStringListWrapper;
begin
  try
    HiddenExecuteArguments.Run(Logger, HiddenExecuteSettings);
    if HiddenExecuteSettings.DbWinLoggerIsEnabled then
      Logger := TDbWinLogger.Create(); // TTeeLogger.Create(Logger, TDbWinLogger.Create());
    Logger.VerbosityLevel := HiddenExecuteSettings.VerbosityLevel;
    CommandLineStrings := TStringListWrapper.Create();
    CommandLineStrings.CommaText := CommandLine();
    if HiddenExecuteSettings.ShowHelp or (CommandLineStrings.Count = 1) then
      ShowHelp() // only our executable (ParamStr(0))
    else
      RunCommandLineAsHiddenProcess(CommandLineStrings); // full commandline
  except
    on E: Exception do
    begin
      Logger.Log('Error; Full path to EXE: %s', [ExpandFileName(ParamStr(0))]);
      CommandLineStrings.CommaText := CommandLine();
      if CommandLineStrings.Count > 1 then
      begin
        Logger.Log('CommandLineStrings: %s', [CommandLineStrings.Text]);
        Logger.Log('Full path to CommandLineStrings[1]: %s', [ExpandFileName(CommandLineStrings[1])]);
      end;
      Logger.Log(E);
      raise;
    end;
  end;
end;

procedure THiddenExecute.RunCommandLineAsHiddenProcess(const CommandLineStrings: IStringListWrapper);
var
  OSProcess: TOSProcess;
begin
  CommandLineStrings.Delete(0); // delete our own Process
  OSProcess := TOSProcess.Create(nil);
  try
    OSProcess.Logger := Logger;
    OSProcess.ModuleName := CommandLineStrings[0];
    CommandLineStrings.Delete(0);
    CommandLineStrings.Delimiter := ' '; // space
    CommandLineStrings.QuoteChar := '"'; // double quote
    OSProcess.Params := CommandLineStrings.DelimitedText;
    OSProcess.ShowWindow := swHide;
    OSProcess.ExecuteAndWait();
  finally
    OSProcess.Free();
  end;
end;

procedure THiddenExecute.SetLogger(const Value: ILeveledLogger);
begin
  FLogger := Value;
end;

procedure THiddenExecute.ShowHelp;
var
  HelpMessage: IStringListWrapper;
begin
  HelpMessage := TStringListWrapper.Create();
  HelpMessage.Add('Set the environment variable HiddenExecute with additional options.');
  HelpMessage.Add(HiddenExecuteArguments.HelpText);
  MessageBox(0, PChar(HelpMessage.Text), PChar(ClassName), MB_ICONINFORMATION);
end;

end.
