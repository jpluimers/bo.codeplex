{ Copyright (c) 2007-2012 Jeroen Wiert Pluimers for BeSharp.net and better office benelux.
Full BSD License is available at http://besharp.codeplex.com/license and http://bo.codeplex.com/license }

unit ReportProxyInterfaceUnit;

interface

type
  TReportEvent = procedure(const Line: string) of object;

  IReportProxy = interface(IInterface)
    ['{DAE6E497-D6C1-434F-970D-02C0C67351EE}']
    function GetOnReport: TReportEvent; stdcall;
    procedure Report(const Line: string); overload;
    procedure SetOnReport(const Value: TReportEvent); stdcall;
    property OnReport: TReportEvent read GetOnReport write SetOnReport;
  end;

implementation

end.
