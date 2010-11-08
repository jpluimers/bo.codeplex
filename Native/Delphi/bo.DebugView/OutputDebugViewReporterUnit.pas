unit OutputDebugViewReporterUnit;

interface

uses
  ReporterUnit;

type
  TOutputDebugViewReporter = class(TReporter)
  public
    procedure Report(const Line: string); override;
  end;

implementation

uses
  OutputDebugViewUnit;

procedure TOutputDebugViewReporter.Report(const Line: string);
begin
  OutputDebugViewU(PChar(Line));
end;

end.
