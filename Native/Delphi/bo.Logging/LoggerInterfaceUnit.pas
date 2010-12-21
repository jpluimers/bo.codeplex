unit LoggerInterfaceUnit;

interface

uses
  SysUtils,
  TypInfo;

type
  IReportProxyLogger = interface(IInterface)
    procedure Log(const Line: string); overload;
    procedure Log(const FormatMask: string; const Arguments: array of const); overload;
    procedure Log(const FormatMask: string; const Arguments: array of const; const FormatSettings: TFormatSettings); overload;
  end;

  IDescriptionLogger = interface(IReportProxyLogger)
    procedure Log(const Description: string; const Item: Boolean); overload;
    procedure Log(const Description: string; const Item: Integer); overload;
    procedure Log(const Description: string; const Item: Pointer); overload;
    procedure Log(const Description: string; const Item: string); overload;
    procedure Log(const Description: string; const TypeInfo: PTypeInfo; const Value: Integer); overload;
    procedure Log(const Description: string; const TypeTypeInfo: PTypeInfo; const Prefix: string = ''); overload;
    procedure Log(const Description: string; const Item: ShortStringBase); overload;
  end;

  IIndexLogger = interface(IDescriptionLogger)
    procedure Log(const Description: string; const Index: Integer; const Item: Boolean); overload;
    procedure Log(const Description: string; const Index: Integer; const Item: Integer); overload;
    procedure Log(const Description: string; const Index: Integer; const Item: Pointer); overload;
    procedure Log(const Description: string; const Index: Integer; const Item: string); overload;
    procedure Log(const Description: string; const Index: Integer; const DescriptionSuffix: string; const Item: Boolean); overload;
    procedure Log(const Description: string; const Index: Integer; const DescriptionSuffix: string; const Item: Integer); overload;
    procedure Log(const Description: string; const Index: Integer; const DescriptionSuffix: string; const Item: Pointer); overload;
    procedure Log(const Description: string; const Index: Integer; const DescriptionSuffix, Item: string); overload;
  end;

  ILogger = interface(IIndexLogger)
    procedure Flush;
    procedure Log; overload;
    procedure Log(const E: Exception); overload;
    procedure LogMulti(const Description: string; const Items: array of string); overload;
  end;

implementation

end.
