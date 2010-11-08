unit OutputDebugViewLoggerUnit;

interface

uses
  ReporterUnit, ReportingLoggerUnit;

type
  TOutputDebugViewLogger = class(TReportingLogger)
  public
    constructor Create;
  end;

implementation

uses
  OutputDebugViewReporterUnit;

constructor TOutputDebugViewLogger.Create;
var
  Reporter: IReporter;
begin
  Reporter := TOutputDebugViewReporter.Create();
  inherited Create(Reporter);
end;

end.
