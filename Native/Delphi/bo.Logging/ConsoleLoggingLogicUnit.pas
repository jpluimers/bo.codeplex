{ Copyright (c) 2007-2012 Jeroen Wiert Pluimers for BeSharp.net and better office benelux.
Full BSD License is available at http://besharp.codeplex.com/license and http://bo.codeplex.com/license }

unit ConsoleLoggingLogicUnit;

interface

uses
  LoggerInterfaceUnit;

type
  TConsoleLoggingLogic = class;
  TConsoleLoggingLogicClass = class of TConsoleLoggingLogic;
  TConsoleLoggingLogic = class(TObject)
  strict private
    FLogger: ILogger;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    class procedure Run(const ConsoleLoggingLogicClass: TConsoleLoggingLogicClass); static;
    procedure Go; virtual;
    property Logger: ILogger read FLogger;
  end;

implementation

uses
  LoggerUnit,
  LoggersUnit;

constructor TConsoleLoggingLogic.Create;
begin
  inherited;
  FLogger := TConsoleLogger.Create();
end;

destructor TConsoleLoggingLogic.Destroy;
begin
  inherited;
  FLogger := nil;
end;

class procedure TConsoleLoggingLogic.Run(const ConsoleLoggingLogicClass: TConsoleLoggingLogicClass);
var
  Instance: TConsoleLoggingLogic;
begin
  Instance := ConsoleLoggingLogicClass.Create();
  try
    Instance.Go();
  finally
    Instance.Free();
    Write('Press <Enter>...');
    Readln;
  end;
end;

procedure TConsoleLoggingLogic.Go;
begin
end;

end.
