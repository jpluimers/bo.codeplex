{ Copyright (c) 2007-2011 Jeroen Wiert Pluimers for BeSharp.net and better office benelux.
Full BSD License is available at http://besharp.codeplex.com/license and http://bo.codeplex.com/license }

// all classes should implement IInterface, and instances should be referenced as interfaces.
// there should not be any circular dependencies (otherwise the release mechanism will leak)

unit LoggerUnit;

interface

uses
  SysUtils,
  Classes,
  TypInfo,
  ReporterUnit,
  ReportProxyUnit,
  ReportProxyInterfaceUnit,
  LoggerInterfaceUnit,
  StringListWrapperUnit;

type
  TStringArray = array of string;

  // all loggers by default will log at the llWarn level
  TEnabledLogger = class(TReportProxy, IEnabledLogger)
  strict private
    FEnabled: Boolean;
  strict protected
    procedure Initialize; override;
  protected
    function GetEnabled: Boolean; virtual;
    procedure Report(const Line: string); overload; override;
    procedure SetEnabled(const Value: Boolean); virtual;
    property Enabled: Boolean read GetEnabled write SetEnabled;
  end;

  TReportProxyLogger = class(TEnabledLogger, IReportProxyLogger)
  strict private
    FTraceLevel: Integer;
    //TODO ##jpl: make these properties
    DoTraceOnlyEnabled: Boolean; { trace all except disabled }
    TraceLevels: IStringListWrapper; { list of String='-1/0' } //TODO ##jpl: replace with TQueue<Boolean>
    DoTrace: IStringListWrapper; { sorted list of String=ClassName/Object=TClass }
    DoNotTrace: IStringListWrapper; { sorted list of String=ClassName/Object=TClass }
  strict protected
    procedure EnterTraceLevel; virtual;
    function FormatLine(const Line: string): string; virtual;
    function IsADoNotTraceInstance(Instance: TObject): Boolean; virtual;
    function IsADoTraceInstance(Instance: TObject): Boolean; virtual;
    procedure LeaveTraceLevel; virtual;
    procedure Report(const FormatMask: string; const Arguments: array of const); overload; virtual;
    procedure Report(const FormatMask: string; const Arguments: array of const; const FormatSettings: TFormatSettings); overload; virtual;
    procedure SetTraceLevel(const Value: Integer); virtual;
    property TraceLevel: Integer read FTraceLevel write SetTraceLevel;
  protected
    function CanTraceInstance(Instance: TObject): Boolean;
    procedure Log(const Line: string); overload; virtual;
    procedure Log(const FormatMask: string; const Arguments: array of const); overload; virtual;
    procedure Log(const FormatMask: string; const Arguments: array of const; const FormatSettings: TFormatSettings); overload; virtual;
    procedure Enter(const MethodName: string); overload; virtual;
    procedure Enter(const Instance: TObject; const MethodName: string); overload; virtual;
    procedure Enter(const Instance: TObject; const Mask: string; const Args: array of const); overload; virtual;
    procedure IndentAndReport(const Line: string); overload; virtual;
    procedure Leave(const MethodName: string); overload; virtual;
    procedure Leave(const Instance: TObject; const MethodName: string); overload; virtual;
    procedure Leave(const Instance: TObject; const Mask: string; const Args: array of const); overload; virtual;
    procedure Report(const Line: string); overload; override;
  public
    constructor Create;
  end;

  TBaseLogger = class(TReportProxyLogger)
  protected
    function PointerToString(const Item: Pointer): string;
  end;

  TDescriptionLogger = class(TBaseLogger, IDescriptionLogger)
  protected
    procedure Log(const Description: string; const Item: Boolean); overload; virtual;
    procedure Log(const Description: string; const Item: Integer); overload; virtual;
    procedure Log(const Description: string; const Item: Pointer); overload; virtual;
    procedure Log(const Description: string; const Item: string); overload; virtual;
    procedure Log(const Description: string; const TypeInfo: PTypeInfo; const Value: Integer); overload; virtual;
    procedure Log(const Description: string; const TypeTypeInfo: PTypeInfo; const Prefix: string = ''); overload; virtual;
    procedure Log(const Description: string; const Item: ShortStringBase); overload; virtual;
  end;

  TIndexLogger = class(TDescriptionLogger, IIndexLogger)
  protected
    procedure Log(const Description: string; const Index: Integer; const Item: Boolean); overload; virtual;
    procedure Log(const Description: string; const Index: Integer; const Item: Integer); overload; virtual;
    procedure Log(const Description: string; const Index: Integer; const Item: Pointer); overload; virtual;
    procedure Log(const Description: string; const Index: Integer; const Item: string); overload; virtual;
    procedure Log(const Description: string; const Index: Integer; const DescriptionSuffix: string; const Item: Boolean); overload; virtual;
    procedure Log(const Description: string; const Index: Integer; const DescriptionSuffix: string; const Item: Integer); overload; virtual;
    procedure Log(const Description: string; const Index: Integer; const DescriptionSuffix: string; const Item: Pointer); overload; virtual;
    procedure Log(const Description: string; const Index: Integer; const DescriptionSuffix, Item: string); overload; virtual;
  end;

  TLogger = class abstract(TIndexLogger, ILogger)
  protected
    procedure Flush; virtual;
    procedure Log(); overload; virtual;
    procedure Log(const E: Exception); overload; virtual;
    procedure LogMulti(const Description: string; const Items: array of string); overload; virtual;
  end;

  TLeveledLogger = class(TLogger, ILeveledLogger)
  strict private
    FAll: ILeveledLogger;
    FDebug: ILeveledLogger;
    FError: ILeveledLogger;
    FFatal: ILeveledLogger;
    FInfo: ILeveledLogger;
    FTrace: ILeveledLogger;
    FVerbosityLevel: TVerbosityLevel;
    FVerbosityLevelString: string;
    FWarn: ILeveledLogger;
  strict protected
    function FormatLine(const Line: string): string; override;
  protected
    function GetAll: ILeveledLogger; virtual;
    function GetDebug: ILeveledLogger; virtual;
    function GetError: ILeveledLogger; virtual;
    function GetFatal: ILeveledLogger; virtual;
    function GetInfo: ILeveledLogger; virtual;
    function GetTrace: ILeveledLogger; virtual;
    function GetVerbosityLevel: TVerbosityLevel; virtual;
    function GetVerbosityLevelString: string; virtual;
    function GetWarn: ILeveledLogger; virtual;
    procedure SetVerbosityLevel(const Value: TVerbosityLevel); virtual;
  public
    constructor Create;
    class function CreateIfNeeded(var FLogger: ILeveledLogger): ILeveledLogger;
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

  TReportProxies = array of IReportProxy;

  // show difference between open arrays and array types: http://stackoverflow.com/questions/3780235/delphi-array-of-char-and-tchararray-incompatible-types
  TTeeLogger = class(TLeveledLogger)
  strict private
    FReportProxies: TReportProxies;
  strict protected
    procedure Report(const ReportProxy: IReportProxy; const Line: string); overload; virtual;
    property ReportProxies: TReportProxies read FReportProxies;
  protected
    function BuildReportProxies(const ReportProxyArray: array of IReportProxy): TReportProxies; virtual;
    procedure Report(const Line: string); overload; override;
    procedure SetEnabled(const Value: Boolean); override;
  public
    constructor Create(const ReportProxyArray: array of IReportProxy); overload;
    constructor Create(const ReportProxies: TReportProxies); overload;
  end;

  TNullLogger = class(TLeveledLogger)
  protected
    procedure Report(const Line: string); overload; override;
  end;

procedure GlobalDisableTrace;
procedure GlobalEnableTrace;

implementation

uses
  RecordTypeInfoUnit,
  SetTypeInfoUnit,
  EnumTypeInfoUnit, StrUtils;

var
  GlobalLogEnabled: Boolean = true; { global trace state -
    if FALSE, then NO trace is performed resulting in minimal CPU time spent }

procedure GlobalDisableTrace;
begin
  GlobalLogEnabled := False;
end;

procedure GlobalEnableTrace;
begin
  GlobalLogEnabled := True;
end;


function SafeClassName(Instance: TObject): string;
begin
  if Instance = nil then
    Result := '(NIL)'
  else try
    Result := Instance.ClassName;
  except
    on E: Exception do
      Result := 'Exception: '+E.Message;
  end;
end;


function SafeFormat(const Format: string; const Args: array of const): string; overload;
begin
  try
    Result := SysUtils.Format(Format, Args);
  except
    on E: Exception do
      Result := E.Message;
  end;
end;


function ClassMethod(Instance: TObject; MethodName: string): string;
begin
  Result := Format('%s[%p].%s', [SafeClassName(Instance), Pointer(Instance), MethodName]);
end;


function SafeFormat(const Format: string; const Args: array of const; const FormatSettings: TFormatSettings): string; overload;
begin
  try
    Result := SysUtils.Format(Format, Args, FormatSettings);
  except
    on E: Exception do
      Result := E.Message;
  end;
end;

function FindInstanceInClassList(Instance: TObject; ClassList: IStringListWrapper): Boolean;
var
  Index: Integer;
  CurrentClassObject: TObject;
  CurrentClass: TClass;
begin
  Result := False;
  for Index := 0 to ClassList.Count - 1 do    { Iterate }
  begin
    CurrentClassObject := ClassList.Objects[Index];
    CurrentClass := TClass(CurrentClassObject);
    if (Instance is CurrentClass) then
    begin
      Result := True;
      Break;
    end;
  end;
end;


type
  TIndirectToLeveledLogger = class(TTeeLogger)
  strict protected
    procedure Report(const ReportProxy: IReportProxy; const Line: string); overload; override;
  end;

procedure TLogger.Flush;
begin
  // allow descendants to override.
end;

procedure TLogger.Log;
begin
  if not GlobalLogEnabled then exit;
  Log('');
end;

procedure TLogger.Log(const E: Exception);
begin
  if not GlobalLogEnabled then exit;
  Log('Exception "%s", at %p: "%s"', [E.ClassName, ExceptAddr, E.Message]);
end;

procedure TLogger.LogMulti(const Description: string; const Items: array of string);
var
  Item: string;
  Index: Integer;
begin
  if not GlobalLogEnabled then exit;
  Index := 0;
  for Item in Items do
  begin
    Index := Index + 1;
    Log(SafeFormat('%s[%d]', [Description, Index]), Item);
  end;
end;

function TReportProxyLogger.FormatLine(const Line: string): string;
var
  NowDateTimeString: string;
begin
  // TODO ##jpl ISO 8601 compliant date-time formatting
  // http://stackoverflow.com/questions/3572128/delphi-equivalent-of-nets-datetime-tostrings-datetime-sortable
  NowDateTimeString := FormatDateTime('yyyy"-"mm"-"dd"T"hh":"mm":"ss', Now);
  Result := SafeFormat('%s %-*d %s', [NowDateTimeString, TraceLevel+1, TraceLevel, Line]);
end;

procedure TReportProxyLogger.Log(const Line: string);
begin
  if not GlobalLogEnabled then exit;
  IndentAndReport(Line);
end;

procedure TReportProxyLogger.Log(const FormatMask: string; const Arguments: array of const);
begin
  if not GlobalLogEnabled then exit;
  Report(FormatMask, Arguments);
end;

procedure TReportProxyLogger.Log(const FormatMask: string; const Arguments: array of const; const FormatSettings: TFormatSettings);
begin
  if not GlobalLogEnabled then exit;
  Report(FormatMask, Arguments, FormatSettings);
end;

procedure TReportProxyLogger.Enter(const MethodName: string);
begin
  if not GlobalLogEnabled then exit;
  Log('>' + MethodName);
  EnterTraceLevel;
end;

procedure TReportProxyLogger.Enter(const Instance: TObject; const MethodName: string);
var
  NewTraceEnabled: Boolean;
begin
  if not GlobalLogEnabled then exit;
  NewTraceEnabled := CanTraceInstance(Instance);
  if NewTraceEnabled then
    Enter(ClassMethod(Instance, MethodName))
  else
    EnterTraceLevel;
  Enabled := NewTraceEnabled;
end;

procedure TReportProxyLogger.Enter(const Instance: TObject; const Mask: string; const Args: array of const);
begin
  if not GlobalLogEnabled then exit;
  Enter(Instance, SafeFormat(Mask, Args));
end;

procedure TReportProxyLogger.Leave(const Instance: TObject; const MethodName: string);
begin
  if not GlobalLogEnabled then exit;
  if CanTraceInstance(Instance) then
    Leave(ClassMethod(Instance, MethodName))
  else
    LeaveTraceLevel;
end;

procedure TReportProxyLogger.Leave(const Instance: TObject; const Mask: string; const Args: array of const);
begin
  if not GlobalLogEnabled then exit;
  Leave(Instance, SafeFormat(Mask, Args));
end;

procedure TReportProxyLogger.Leave(const MethodName: string);
begin
  if not GlobalLogEnabled then exit;
  LeaveTraceLevel();
  Log('<' + MethodName);
end;

function TReportProxyLogger.IsADoTraceInstance(Instance: TObject): Boolean;
begin
  Result := FindInstanceInClassList(Instance, DoTrace);
end;

function TReportProxyLogger.IsADoNotTraceInstance(Instance: TObject): Boolean;
begin
  Result := FindInstanceInClassList(Instance, DoNotTrace);
end;

constructor TReportProxyLogger.Create;
begin
  inherited Create();
  DoTraceOnlyEnabled := False;
  TraceLevels := TStringListWrapper.Create();
  DoTrace := TStringListWrapper.Create();
  DoNotTrace := TStringListWrapper.Create();
end;

function TReportProxyLogger.CanTraceInstance(Instance: TObject): Boolean;
begin
  if DoTraceOnlyEnabled then
    Result := IsADoTraceInstance(Instance)
  else
    Result := not IsADoNotTraceInstance(Instance);
end;

procedure TReportProxyLogger.EnterTraceLevel;
var
  TraceLevelEnabledString: string;
begin
  TraceLevel := TraceLevel + 1;
  if Assigned(TraceLevels) then
  begin
    TraceLevelEnabledString := BoolToStr(Enabled);
    TraceLevels.Add(TraceLevelEnabledString);
  end;
end;

procedure TReportProxyLogger.IndentAndReport(const Line: string);
var
  IndentedLine: string;
begin
  if not GlobalLogEnabled then exit;
  IndentedLine := DupeString('  ', TraceLevel) + Line;
  Report(IndentedLine);
end;

procedure TReportProxyLogger.LeaveTraceLevel;
var
  TraceLevelEnabledString: string;
  TraceLevelsCount: Integer;
begin
  if Assigned(TraceLevels) then
  begin
    TraceLevelsCount := TraceLevels.Count;
    if TraceLevelsCount > 0 then
    begin
      TraceLevelEnabledString := TraceLevels[TraceLevelsCount-1];
      Enabled := StrToBool(TraceLevelEnabledString);
      TraceLevels.Delete(TraceLevelsCount-1);
    end;
  end;
  TraceLevel := TraceLevel - 1;
end;

procedure TReportProxyLogger.Report(const FormatMask: string; const Arguments: array of const);
var
  Line: string;
begin
  Line := SafeFormat(FormatMask, Arguments);
  IndentAndReport(Line);
end;

procedure TReportProxyLogger.Report(const FormatMask: string; const Arguments: array of const; const FormatSettings: TFormatSettings);
var
  Line: string;
begin
  Line := SafeFormat(FormatMask, Arguments, FormatSettings);
  IndentAndReport(Line);
end;

procedure TReportProxyLogger.Report(const Line: string);
var
  FormattedLine: string;
  Indent: string;
begin
  if not GlobalLogEnabled then exit;
  FormattedLine := FormatLine(Line);
  Indent := DupeString('  ', TraceLevel);
  FormattedLine := Indent + FormattedLine;
  inherited Report(FormattedLine);
end;

procedure TReportProxyLogger.SetTraceLevel(const Value: Integer);
begin
  FTraceLevel := Value;
end;

constructor TTeeLogger.Create(const ReportProxyArray: array of IReportProxy);
var
  ReportProxies: TReportProxies;
  Index: Integer;
begin
  SetLength(ReportProxies, Length(ReportProxyArray));
  for Index := Low(ReportProxyArray) to High(ReportProxyArray) do
    ReportProxies[Index] := ReportProxyArray[Index];
  Create(ReportProxies);
end;

constructor TTeeLogger.Create(const ReportProxies: TReportProxies);
begin
  inherited Create();
  FReportProxies := ReportProxies;
end;

function TTeeLogger.BuildReportProxies(const ReportProxyArray: array of IReportProxy): TReportProxies;
var
  Index: Integer;
begin
  SetLength(Result, Length(ReportProxyArray));
  for Index := Low(ReportProxyArray) to High(ReportProxyArray) do
    Result[Index] := ReportProxyArray[Index];
end;

procedure TTeeLogger.Report(const Line: string);
var
  ReportProxy: IReportProxy;
begin
  if not GlobalLogEnabled then exit;
  inherited Report(Line);
  for ReportProxy in ReportProxies do
    Report(ReportProxy, Line);
end;

procedure TTeeLogger.Report(const ReportProxy: IReportProxy; const Line: string);
begin
  ReportProxy.Report(Line);
end;

procedure TTeeLogger.SetEnabled(const Value: Boolean);
var
  ReportProxy: IReportProxy;
  EnabledLogger: IEnabledLogger;
begin
  inherited SetEnabled(Value);
  for ReportProxy in ReportProxies do
    if Supports(ReportProxy, IEnabledLogger, EnabledLogger) then
      EnabledLogger.Enabled := Value;
end;

procedure TIndexLogger.Log(const Description: string; const Index: Integer; const Item: Boolean);
begin
  if not GlobalLogEnabled then exit;
  Log(Description, Index, BoolToStr(Item));
end;

procedure TIndexLogger.Log(const Description: string; const Index: Integer; const Item: Integer);
begin
  if not GlobalLogEnabled then exit;
  Log(Description, Index, IntToStr(Item));
end;

procedure TIndexLogger.Log(const Description: string; const Index: Integer; const Item: Pointer);
begin
  if not GlobalLogEnabled then exit;
  Log(Description, Index, PointerToString(Item));
end;

procedure TIndexLogger.Log(const Description: string; const Index: Integer; const Item: string);
begin
  if not GlobalLogEnabled then exit;
  Log('%s[%d]:%s', [Description, Index, Item]);
end;

procedure TIndexLogger.Log(const Description: string; const Index: Integer; const DescriptionSuffix: string; const Item: Boolean);
begin
  if not GlobalLogEnabled then exit;
  Log(Description, Index, DescriptionSuffix, BoolToStr(Item));
end;

procedure TIndexLogger.Log(const Description: string; const Index: Integer; const DescriptionSuffix: string; const Item: Integer);
begin
  if not GlobalLogEnabled then exit;
  Log(Description, Index, DescriptionSuffix, IntToStr(Item));
end;

procedure TIndexLogger.Log(const Description: string; const Index: Integer; const DescriptionSuffix: string; const Item: Pointer);
begin
  if not GlobalLogEnabled then exit;
  Log(Description, Index, DescriptionSuffix, PointerToString(Item));
end;

procedure TIndexLogger.Log(const Description: string; const Index: Integer; const DescriptionSuffix, Item: string);
begin
  if not GlobalLogEnabled then exit;
  Log('%s[%d].%s:%s', [Description, Index, DescriptionSuffix, Item]);
end;

function TBaseLogger.PointerToString(const Item: Pointer): string;
begin
  Result := SafeFormat('%p', [Item]);
end;

procedure TDescriptionLogger.Log(const Description: string; const Item: Boolean);
begin
  if not GlobalLogEnabled then exit;
  Log(Description, BoolToStr(Item));
end;

procedure TDescriptionLogger.Log(const Description: string; const Item: Integer);
begin
  if not GlobalLogEnabled then exit;
  Log(Description, IntToStr(Item));
end;

procedure TDescriptionLogger.Log(const Description: string; const Item: Pointer);
begin
  if not GlobalLogEnabled then exit;
  Log(Description, PointerToString(Item));
end;

procedure TDescriptionLogger.Log(const Description: string; const Item: string);
begin
  if not GlobalLogEnabled then exit;
  Log('%s:%s', [Description, Item]);
end;

procedure TDescriptionLogger.Log(const Description: string; const TypeInfo: PTypeInfo; const Value: Integer);
var
  Item: string;
begin
  if not GlobalLogEnabled then exit;
  Item := GetEnumNameAndOrdValue(TypeInfo, Value);
  Log(Description, Item);
end;

procedure TDescriptionLogger.Log(const Description: string; const TypeTypeInfo: PTypeInfo; const Prefix: string = '');
var
  TypeTypeData: PTypeData;
  TTypeKindTypeInfo: PTypeInfo;
  TOrdTypeTypeInfo: PTypeInfo;
  TFloatTypeTypeInfo: PTypeInfo;
  TMethodKindTypeInfo: PTypeInfo;
  TIntfFlagsBaseTypeInfo: PTypeInfo;
  IntfFlagsString: string;
  RecordFieldTable: PFieldTable;
  FieldIndex: Integer;
  RecordFieldPrefix: string;
  NewPrefix: string;
  RecordFieldTableField: TFieldInfo;
begin
  if not GlobalLogEnabled then exit;
  if not Assigned(TypeTypeInfo) then
    Exit;
  Log('%s: TypeInfo for type %s', [Description, TypeTypeInfo.Name]);

  TTypeKindTypeInfo := TypeInfo(TTypeKind);
  NewPrefix := Prefix + '  ';
  Log(NewPrefix + 'TypeInfo.Kind', TTypeKindTypeInfo, Ord(TypeTypeInfo.Kind));

  // uses IntfInfo ;
  // uses TypInfo ;
  TypeTypeData := TypInfo.GetTypeData(TypeTypeInfo);
  case TypeTypeInfo.Kind of
    tkUnknown, tkLString, tkWString, tkVariant: ;
    tkInteger, tkChar, tkEnumeration, tkSet, tkWChar:
      begin
        TOrdTypeTypeInfo := TypeInfo(TOrdType);
        Log(NewPrefix + 'OrdType', TOrdTypeTypeInfo, Ord(TypeTypeData.OrdType));
        case TypeTypeInfo.Kind of
          tkInteger, tkChar, tkEnumeration, tkWChar:
            begin
              Log(NewPrefix + 'MinValue', TypeTypeData.MinValue);
              Log(NewPrefix + 'MaxValue', TypeTypeData.MaxValue);
              case TypeTypeInfo.Kind of
                tkInteger, tkChar, tkWChar: ;
                tkEnumeration:
                  begin
                    if Assigned(TypeTypeData.BaseType) then
                      Log(NewPrefix + 'BaseType', TypeTypeData.BaseType^, NewPrefix);
                    Log(NewPrefix + 'NameList', GetEnumCsvNameList(TypeTypeInfo));
                    Log(NewPrefix + 'EnumUnitName', GetEnumUnitName(TypeTypeInfo));
                  end;
              end;
            end;
          tkSet:
            begin
              if Assigned(TypeTypeData.CompType) then
                Log(Prefix + 'CompType', TypeTypeData.CompType^, NewPrefix);
            end;
        end;
      end;
    tkFloat:
      begin
        TFloatTypeTypeInfo := TypeInfo(TFloatType);
        Log(NewPrefix + 'FloatType', TFloatTypeTypeInfo, Ord(TypeTypeData.FloatType));
      end;
    tkString:
      begin
        Log(NewPrefix + 'MaxLength', TypeTypeData.MaxLength);
      end;
    tkClass:
      begin
        Log(NewPrefix + 'ClassType', TypeTypeData.ClassType.ClassName);
        if Assigned(TypeTypeData.ParentInfo) then
          Log(NewPrefix + 'ParentInfo', TypeTypeData.ParentInfo^, NewPrefix);
        Log(NewPrefix + 'PropCount', TypeTypeData.PropCount);
        Log(NewPrefix + 'UnitName', TypeTypeData.UnitName);
        {PropData: TPropData};
      end;
    tkMethod:
      begin
        TMethodKindTypeInfo := typeInfo(TMethodKind);
        Log(NewPrefix + 'MethodKind', TMethodKindTypeInfo, Ord(TypeTypeData.MethodKind));
        Log(NewPrefix + 'ParamCount', ParamCount);
        // ParamList: array[0..1023] of Char
        {ParamList: array[1..ParamCount] of
           record
             Flags: TParamFlags;
             ParamName: ShortString;
             TypeName: ShortString;
           end;
         ResultType: ShortString};
      end;
    tkInterface:
      begin
        if Assigned(TypeTypeData.IntfParent) then
          Log(NewPrefix + 'IntfParent', TypeTypeData.IntfParent^, NewPrefix); { ancestor }
        TIntfFlagsBaseTypeInfo := TypeInfo(TIntfFlagsBase);
        IntfFlagsString := SetToString(TIntfFlagsBaseTypeInfo, TypeTypeData.IntfFlags, True);
        Log(NewPrefix + 'IntfFlags', IntfFlagsString);
        Log(NewPrefix + 'Guid', GUIDToString(TypeTypeData.Guid));
        Log(NewPrefix + 'IntfUnit', TypeTypeData.IntfUnit);
        {PropData: TPropData};
      end;
    tkInt64:
      begin
        Log(NewPrefix + 'MinInt64Value', TypeTypeData.MinInt64Value);
        Log(NewPrefix + 'MaxInt64Value', TypeTypeData.MaxInt64Value);
      end;
    tkDynArray:
      begin
        Log(NewPrefix + 'elSize', TypeTypeData.elSize);
        if Assigned(TypeTypeData.elType) then
          Log(NewPrefix + 'elType', TypeTypeData.elType^, NewPrefix); // nil if type does not require cleanup
        Log(NewPrefix + 'varType', TypeTypeData.varType); // Ole Automation varType equivalent
        if Assigned(TypeTypeData.elType2) then
          Log(NewPrefix + 'elType2', TypeTypeData.elType2^, NewPrefix); // independent of cleanup
        Log(NewPrefix + 'DynUnitName', TypeTypeData.DynUnitName);
      end;
    tkRecord:
      begin //jpl: 20080908
        RecordFieldTable := GetFieldTable(TypeTypeInfo);
        Log(NewPrefix + 'RecordFieldTable.X', RecordFieldTable.X);
        Log(NewPrefix + 'RecordFieldTable.Size', RecordFieldTable.Size);
        Log(NewPrefix + 'RecordFieldTable.Count', RecordFieldTable.Count);
        for FieldIndex := 0 to RecordFieldTable.Count - 1 do
        begin
          RecordFieldTableField := RecordFieldTable.Fields[FieldIndex];
          RecordFieldPrefix := SafeFormat('%s  RecordFieldTable[%d] Offset %8.8x',
            [Prefix, FieldIndex, RecordFieldTableField.Offset]);
          if Assigned(RecordFieldTableField.TypeInfo^) then
            Log(RecordFieldPrefix, RecordFieldTableField.TypeInfo^, NewPrefix);
        end;
      end;
  end;
end;

procedure TDescriptionLogger.Log(const Description: string; const Item: ShortStringBase);
begin
  if not GlobalLogEnabled then exit;
  Log(Description, string(Item));
end;

function TEnabledLogger.GetEnabled: Boolean;
begin
  Result := FEnabled;
end;

procedure TEnabledLogger.Initialize;
begin
  Enabled := True;
end;

procedure TEnabledLogger.Report(const Line: string);
begin
  if not GlobalLogEnabled then exit;
  if Enabled then
    inherited Report(Line);
end;

procedure TEnabledLogger.SetEnabled(const Value: Boolean);
begin
  FEnabled := Value;
end;

constructor TLeveledLogger.Create;
begin
  inherited Create();
  if Self is TIndirectToLeveledLogger then
    Exit;
  // there is no FOff, because that would be of no use
  FFatal := TIndirectToLeveledLogger.Create([Self]);
  FFatal.VerbosityLevel := vlFatal;
  FError := TIndirectToLeveledLogger.Create([Self]);
  FError.VerbosityLevel := vlError;
  FWarn := TIndirectToLeveledLogger.Create([Self]);
  FWarn.VerbosityLevel := vlWarn;
  FInfo := TIndirectToLeveledLogger.Create([Self]);
  FInfo.VerbosityLevel := vlInfo;
  FDebug := TIndirectToLeveledLogger.Create([Self]);
  FDebug.VerbosityLevel := vlDebug;
  FTrace := TIndirectToLeveledLogger.Create([Self]);
  FTrace.VerbosityLevel := vlTrace;
  FAll := TIndirectToLeveledLogger.Create([Self]);
  FAll.VerbosityLevel := vlAll;
  VerbosityLevel := vlWarn;
end;

class function TLeveledLogger.CreateIfNeeded(var FLogger: ILeveledLogger): ILeveledLogger;
begin
  if not Assigned(FLogger) then
    FLogger := TLeveledLogger.Create();
  Result := FLogger;
end;

function TLeveledLogger.FormatLine(const Line: string): string;
var
  Character: Char;
  CleanedLine: string;
  Index: Integer;
begin
  CleanedLine := Line;
  if VerbosityLevel < vlAll then
    for Index := 1 to Length(CleanedLine) do
    begin
      Character := Line[Index];
      if (Character < #32) or (Character > #127) then
        if (Character <> #10) and (Character <> #13) then
          CleanedLine[Index] := '.';
    end;
  Result := SafeFormat('%s: %s', [VerbosityLevelString, CleanedLine]);
  Result := inherited FormatLine(Result);
end;

function TLeveledLogger.GetAll: ILeveledLogger;
begin
  Result := FAll;
end;

function TLeveledLogger.GetDebug: ILeveledLogger;
begin
  Result := FDebug;
end;

function TLeveledLogger.GetError: ILeveledLogger;
begin
  Result := FError;
end;

function TLeveledLogger.GetFatal: ILeveledLogger;
begin
  Result := FFatal;
end;

function TLeveledLogger.GetInfo: ILeveledLogger;
begin
  Result := FInfo;
end;

function TLeveledLogger.GetTrace: ILeveledLogger;
begin
  Result := FTrace;
end;

function TLeveledLogger.GetVerbosityLevel: TVerbosityLevel;
begin
  Result := FVerbosityLevel;
end;

function TLeveledLogger.GetVerbosityLevelString: string;
begin
  Result := FVerbosityLevelString;
end;

function TLeveledLogger.GetWarn: ILeveledLogger;
begin
  Result := FWarn;
end;

procedure TLeveledLogger.SetVerbosityLevel(const Value: TVerbosityLevel);
begin
  FVerbosityLevel := Value;
  Enabled := Value <> vlOff;
  FVerbosityLevelString := EnumerationAsString(Ord(Value), 'vl', TypeInfo(TVerbosityLevel));
end;

procedure TIndirectToLeveledLogger.Report(const ReportProxy: IReportProxy; const Line: string);
var
  LeveledLogger: ILeveledLogger;
  FormattedLine: string;
begin
  if Supports(ReportProxy, ILeveledLogger, LeveledLogger) then
  begin
    if LeveledLogger.VerbosityLevel >= Self.VerbosityLevel then
    begin
      FormattedLine := FormatLine(Line); // we have to redo formatting here, as we are sending it to the proxy, which will do it's own formatting, not our formatting
      inherited Report(ReportProxy, FormattedLine);
    end;
  end;
end;

procedure TNullLogger.Report(const Line: string);
begin
  // NOP: null logger doesn't report
end;

end.
