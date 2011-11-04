unit DbWinLoggerUnit;

interface

uses
  ReporterUnit,
  ReportingLoggerUnit;

type
  TDbWinLogger = class(TReportingLogger)
  public
    constructor Create;
  end;

implementation

uses
  DbWinReporterUnit;

constructor TDbWinLogger.Create;
var
  Reporter: IReporter;
begin
  Reporter := TDbWinReporter.Create();
  inherited Create(Reporter);
end;

end.
