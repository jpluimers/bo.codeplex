unit ReportProxyUnit;

interface

type
  TReportEvent = procedure(const Line: string) of object;

  IReportProxy = interface(IInterface)
    function GetOnReport: TReportEvent; stdcall;
    procedure Report(const Line: string); overload;
    procedure SetOnReport(const Value: TReportEvent); stdcall;
    property OnReport: TReportEvent read GetOnReport write SetOnReport;
  end;

  TReportProxy = class(TInterfacedObject, IReportProxy)
  strict private
    FOnReport: TReportEvent;
  strict protected
    constructor Create(const OnLog: TReportEvent);
    property OnReport: TReportEvent read FOnReport write FOnReport;
  protected
    function GetOnReport: TReportEvent; virtual; stdcall;
    procedure Report(const Line: string); overload; virtual;
    procedure SetOnReport(const Value: TReportEvent); virtual; stdcall;
  end;

implementation

constructor TReportProxy.Create(const OnLog: TReportEvent);
begin
  inherited Create();
  FOnReport := OnLog;
end;

function TReportProxy.GetOnReport: TReportEvent;
begin
  Result := FOnReport;
end;

procedure TReportProxy.Report(const Line: string);
var
  OnLog: TReportEvent;
begin
  OnLog := Self.OnReport;
  if Assigned(OnLog) then
    OnLog(Line);
end;

procedure TReportProxy.SetOnReport(const Value: TReportEvent);
begin
  FOnReport := Value;
end;

end.