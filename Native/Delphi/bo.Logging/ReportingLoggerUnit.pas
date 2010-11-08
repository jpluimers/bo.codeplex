unit ReportingLoggerUnit;

interface

uses
  LoggerUnit, ReporterUnit;

type
  TReportingLogger = class(TLogger)
  strict private
    FReporter: IReporter;
  strict protected
    property Reporter: IReporter read FReporter;
    procedure Report(const Line: string); overload; override;
  public
    constructor Create(const Reporter: IReporter);
    property OnReport;
  end;

implementation

constructor TReportingLogger.Create(const Reporter: IReporter);
begin
  FReporter := Reporter;
  inherited Create(nil);
end;

procedure TReportingLogger.Report(const Line: string);
begin
  inherited Report(Line);
  FReporter.Report(Line);
end;

end.
