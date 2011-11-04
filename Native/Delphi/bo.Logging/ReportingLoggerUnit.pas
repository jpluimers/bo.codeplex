{ Copyright (c) 2007-2011 Jeroen Wiert Pluimers for BeSharp.net and better office benelux.
Full BSD License is available at http://besharp.codeplex.com/license and http://bo.codeplex.com/license }

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
  inherited Create();
end;

procedure TReportingLogger.Report(const Line: string);
begin
  inherited Report(Line);
  if Enabled then
    if Assigned(FReporter) then
      FReporter.Report(Line);
end;

end.
