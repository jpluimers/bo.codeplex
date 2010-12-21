unit ReportProxyInterfaceUnit;

interface

type
  TReportEvent = procedure(const Line: string) of object;

  IReportProxy = interface(IInterface)
    function GetOnReport: TReportEvent; stdcall;
    procedure Report(const Line: string); overload;
    procedure SetOnReport(const Value: TReportEvent); stdcall;
    property OnReport: TReportEvent read GetOnReport write SetOnReport;
  end;

implementation

end.
