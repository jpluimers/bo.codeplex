unit GenericReportingLoggerUnit;

interface

uses
  ReporterUnit, ReportingLoggerUnit;

type
  TReportingLogger<T: TReporter, constructor> = class(TReportingLogger)
  public
    constructor Create;
    property OnReport;
  end;

implementation

constructor TReportingLogger<T>.Create;
var
  Reporter: TReporter;
  ReporterReference: IReporter;
begin
  Reporter := T.Create(); // Delphi 2009 compiler is not smart enough; check XE and 2010
  ReporterReference := Reporter;
  inherited Create(ReporterReference);
end;

end.
