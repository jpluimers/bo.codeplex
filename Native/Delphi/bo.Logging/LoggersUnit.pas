{ Copyright (c) 2007-2011 Jeroen Wiert Pluimers for BeSharp.net and better office benelux.
Full BSD License is available at http://besharp.codeplex.com/license and http://bo.codeplex.com/license }

unit LoggersUnit;

interface

uses
  ReporterUnit,
  ReportingLoggerUnit,
  Classes;

type
  TConsoleLogger = class(TReportingLogger)
  public
    constructor Create;
  end;

  TStringsLogger = class(TReportingLogger)
  strict private
    FStringsOwnerToWatchObserver: TComponent;
  strict protected
    property StringsOwnerToWatchObserver: TComponent read FStringsOwnerToWatchObserver;
  public
    constructor Create(const Strings: TStrings); overload;
    constructor Create(const Strings: TStrings; const StringsOwnerToWatch: TComponent); overload;
    destructor Destroy; override;
  end;

  TStringsOwnerToWatchObserver = class(TComponent)
  strict private
    FStringsOwnerToWatch: TComponent;
    FStringsLogger: TStringsLogger;
  strict protected
    property StringsOwnerToWatch: TComponent read FStringsOwnerToWatch;
    property StringsLogger: TStringsLogger read FStringsLogger;
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(const StringsLogger: TStringsLogger; const StringsOwnerToWatch: TComponent); reintroduce;
  end;

implementation

uses
  ReportersUnit;

constructor TConsoleLogger.Create;
var
  Reporter: IReporter;
begin
  Reporter := TConsoleReporter.Create();
  inherited Create(Reporter);
end;

constructor TStringsLogger.Create(const Strings: TStrings);
var
  Reporter: IReporter;
begin
  Reporter := TStringsReporter.Create(Strings);
  inherited Create(Reporter);
end;

constructor TStringsLogger.Create(const Strings: TStrings; const StringsOwnerToWatch: TComponent);
begin
  if Assigned(StringsOwnerToWatch) then
    FStringsOwnerToWatchObserver := TStringsOwnerToWatchObserver.Create(Self, StringsOwnerToWatch);
  Create(Strings);
end;

destructor TStringsLogger.Destroy;
begin
  StringsOwnerToWatchObserver.Free;
  FStringsOwnerToWatchObserver := nil;
  inherited Destroy();
end;

constructor TStringsOwnerToWatchObserver.Create(const StringsLogger: TStringsLogger; const StringsOwnerToWatch: TComponent);
begin
  FStringsOwnerToWatch := StringsOwnerToWatch;
  FStringsLogger := StringsLogger;
  if Assigned(StringsOwnerToWatch) then
    StringsOwnerToWatch.FreeNotification(Self);
  inherited Create(nil);
end;

procedure TStringsOwnerToWatchObserver.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if Operation = opRemove then
    if AComponent = StringsOwnerToWatch then
      StringsLogger.Enabled := False;
end;

end.
