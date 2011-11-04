{ Copyright (c) 2007-2011 Jeroen Wiert Pluimers for BeSharp.net and better office benelux.
Full BSD License is available at http://besharp.codeplex.com/license and http://bo.codeplex.com/license }

unit LoggerInterfaceUnit;

interface

uses
  SysUtils,
  TypInfo,
  ReportProxyInterfaceUnit;

type
  IEnabledLogger = interface(IReportProxy)
    ['{FD2A7766-B978-4FDF-964D-CE1663B23ACE}']
    function GetEnabled: Boolean;
    procedure SetEnabled(const Value: Boolean); 
    property Enabled: Boolean read GetEnabled write SetEnabled;
  end;
  
  IReportProxyLogger = interface(IEnabledLogger)
    ['{F85CB281-D557-4708-9A48-4F90AFC99D6A}']
    procedure Enter(const MethodName: string); overload;
    procedure Leave(const MethodName: string); overload;
    procedure Log(const Line: string); overload;
    procedure Log(const FormatMask: string; const Arguments: array of const); overload;
    procedure Log(const FormatMask: string; const Arguments: array of const; const FormatSettings: TFormatSettings); overload;
  end;

  IDescriptionLogger = interface(IReportProxyLogger)
    ['{6DFE2ADF-27F2-4ABE-824C-EE963D9CB8E4}']
    procedure Log(const Description: string; const Item: Boolean); overload;
    procedure Log(const Description: string; const Item: Integer); overload;
    procedure Log(const Description: string; const Item: Pointer); overload;
    procedure Log(const Description: string; const Item: string); overload;
    procedure Log(const Description: string; const TypeInfo: PTypeInfo; const Value: Integer); overload;
    procedure Log(const Description: string; const TypeTypeInfo: PTypeInfo; const Prefix: string = ''); overload;
    procedure Log(const Description: string; const Item: ShortStringBase); overload;
  end;

  IIndexLogger = interface(IDescriptionLogger)
    ['{49C8BB13-0D1C-497C-A594-2D2EED88BF1E}']
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
    ['{2082C8CB-B903-4E6E-8DA4-112D19010F3B}']
    procedure Flush;
    procedure Log; overload;
    procedure Log(const E: Exception); overload;
    procedure LogMulti(const Description: string; const Items: array of string); overload;
  end;

  // http://stackoverflow.com/questions/1394661/why-isnt-there-a-trace-level-in-log4net
  // http://logging.apache.org/log4j/1.2/apidocs/org/apache/log4j/Level.html
  // pitty that http://log4delphi.sourceforge.net/ never became a 1.0
  // http://logging.apache.org/log4net/release/sdk/log4net.Core.LevelMembers.html
  TVerbosityLevel = (vlOff, vlFatal, vlError, vlWarn, vlInfo, vlDebug, vlTrace, vlAll);

  ILeveledLogger = interface(ILogger)
    ['{95368CF3-E360-4471-8A7C-2E799E5723EA}']
    function GetAll: ILeveledLogger; 
    function GetDebug: ILeveledLogger; 
    function GetError: ILeveledLogger; 
    function GetFatal: ILeveledLogger; 
    function GetInfo: ILeveledLogger; 
    function GetTrace: ILeveledLogger; 
    function GetVerbosityLevel: TVerbosityLevel;
    function GetVerbosityLevelString: string;
    function GetWarn: ILeveledLogger;
    procedure SetVerbosityLevel(const Value: TVerbosityLevel);
    property All: ILeveledLogger read GetAll;
    property Debug: ILeveledLogger read GetDebug;
    property Error: ILeveledLogger read GetError;
    property Fatal: ILeveledLogger read GetFatal;
    property Info: ILeveledLogger read GetInfo;
    property Trace: ILeveledLogger read GetTrace;
    property VerbosityLevel: TVerbosityLevel read GetVerbosityLevel write SetVerbosityLevel;
    property VerbosityLevelString: string read GetVerbosityLevelString;
    property Warn: ILeveledLogger read GetWarn;
  end;

implementation

end.

