unit DbWinReporterUnit;

interface

uses
  ReporterUnit;

type
  TDbWinReporter = class(TReporter)
  public
    procedure Report(const Line: string); override;
  end;

implementation

uses
  DbWinUnit;

procedure TDbWinReporter.Report(const Line: string);
begin
{$ifdef UNICODE}
  DbWin__OutputDebugStringU(PChar(Line));
{$else}
  DbWin__OutputDebugString(PChar(Line));
{$endif UNICODE}
end;

end.
