{ Copyright (c) 2007-2011 Jeroen Wiert Pluimers for BeSharp.net and better office benelux.
Full BSD License is available at http://besharp.codeplex.com/license and http://bo.codeplex.com/license }

unit ReportProxyUnit;

interface

uses
  ReportProxyInterfaceUnit;

type
  TReportProxy = class(TInterfacedObject, IReportProxy)
  strict private
    FOnReport: TReportEvent;
  strict protected
    constructor Create(const OnLog: TReportEvent); overload;
    procedure Initialize; virtual;
    property OnReport: TReportEvent read FOnReport write FOnReport;
  protected
    function GetOnReport: TReportEvent; virtual; stdcall;
    procedure Report(const Line: string); overload; virtual;
    procedure SetOnReport(const Value: TReportEvent); virtual; stdcall;
  public
    constructor Create; overload;
  end;

implementation

constructor TReportProxy.Create(const OnLog: TReportEvent);
begin
  inherited Create();
  FOnReport := OnLog;
  Initialize();
end;

constructor TReportProxy.Create;
begin
  inherited Create();
  Initialize();
end;

function TReportProxy.GetOnReport: TReportEvent;
begin
  Result := FOnReport;
end;

procedure TReportProxy.Initialize;
begin
  // placeholder for descending classes
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
