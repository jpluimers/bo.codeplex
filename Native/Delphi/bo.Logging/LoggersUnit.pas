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
  public
    constructor Create(const Strings: TStrings);
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

end.
