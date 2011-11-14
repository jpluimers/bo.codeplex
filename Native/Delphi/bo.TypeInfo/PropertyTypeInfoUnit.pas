unit PropertyTypeInfoUnit;

interface

uses
  TypInfo;

type
  TNRttiCallBack = function(const PropName: string; Instance: TObject; PropInfo: PPropInfo): Boolean of object;
  { Called by the enumeration function to handle one Property.
    CallBack returns TRUE to stop enumeration and FALSE to continue enumeration. }
  TNRttiDelimiter = (rdDot, rdNone, rdUnderscore, rdPipe);

  TAbstractPropertyTypeInfoiEnumerator = class(TObject)
  private
    FBaseName: String;
    FInstance: TObject;
    FFound: Boolean;
    FDelimiter: TNRttiDelimiter;
  protected
    function Enumerator(const PropName: string; ObjectInstance: TObject; PropInfo: PPropInfo): Boolean; virtual; abstract;
    function Enumerate: Boolean; virtual;
    property BaseName: string read FBaseName write FBaseName;
    property Instance: TObject read FInstance;
    property Delimiter: TNRttiDelimiter read FDelimiter write FDelimiter default rdDot;
  public
    constructor Create(AnInstance: TObject);
    destructor Destroy; override;
    function Execute: Boolean; virtual;
    property Found: Boolean read FFound default False;
  end;

  TPropertyInfoFinder = class(TAbstractPropertyTypeInfoiEnumerator)
  private
    FPropertyName: string;
    FPropertyInfo: PPropInfo;
    FPropertyInstance: TObject;
  protected
    function Enumerator(const PropName: string; ObjectInstance: TObject; PropInfo: PPropInfo): Boolean; override;
    property PropertyName: string read FPropertyName write FPropertyName;
    property PropertyInfo: PPropInfo read FPropertyInfo;
    property PropertyInstance: TObject read FPropertyInstance;
  public
    constructor Create(AnInstance: TObject; const APropertyName: string);
    function Execute: Boolean; override;
  end;

{== Enumeration routines ==}

function EnumInstanceRtti(const BaseName: string; Instance: TObject;
  Delimiter: TNRttiDelimiter; CallBack: TNRttiCallBack): Boolean;
  { Enumerates the RTTI for Instance, calling CallBack for every property entry in the
    RTTI hierarchy of Instance.

    CallBack is called with Instance pointing to the property to be enumerated,
    PropInfo pointing to the RTTI information of that property and BaseName plus
    suffixes depending on Delimiter and the position of that property in the hierarchy.

    CallBack should return TRUE to stop enumeration and FALSE to continue enumeration.

    EnumInstanceRtti returns FALSE if CallBack always returned FALSE and TRUE if
    CallBack returned TRUE once }

function EnumClassRtti(const BaseName: string; ClassTypeInfo: PTypeInfo;
  Delimiter: TNRttiDelimiter; CallBack: TNRttiCallBack): Boolean;
  { Enumerates the RTTI for ClassTypeInfo, calling CallBack for every property
    entry in the RTTI hierarchy of ClassTypeInfo.

    CallBack is called with Instance nil (because we only enumerate a class
    and not an instance), PropInfo pointing to the RTTI information of the
    property to be enumerated and BaseName plus suffixes depending on Delimiter
    and the position of that property in the hierarchy.

    CallBack should return TRUE to stop enumeration and FALSE to continue enumeration.

    EnumClassRtti returns FALSE if CallBack always returned FALSE and TRUE if
    CallBack returned TRUE once }

function EnumPropertyRtti(const BaseName: string; Instance: TObject; PropInfo: PPropInfo;
  Delimiter: TNRttiDelimiter; CallBack: TNRttiCallBack): Boolean;
  { Enumerates the RTTI for Instance and PropInfo, calling CallBack for every
    property and sub-property entry in the RTTI hierarchy of Instance/PropInfo.

    CallBack is called with Instance either nil (when the original Instance was nil)
    or pointing to the property to be enumerated, PropInfo pointing to the RTTI
    information of the property to be enumerated and BaseName plus suffixes depending
    on Delimiter and the position of that property in the hierarchy.

    CallBack should return TRUE to stop enumeration and FALSE to continue enumeration.

    EnumPropertyRtti returns FALSE if CallBack always returned FALSE and TRUE if
    CallBack returned TRUE once }

{== TypeInfo routines ==}

function GetPropTypeInfo(PropInfo: PPropInfo): PTypeInfo;
  { Get the TypeInfo part of PropInfo - this is done differently in D1, D2 and D3 }

{== property information routines ==}

function IsPropertyName(Instance: TObject; const PropName: string): Boolean;
function GetPropInfoByName(Instance: TObject; const PropName: string): PPropInfo;

function IsOrdPropInfo(PropInfo: PPropInfo): Boolean;
function IsStrPropInfo(PropInfo: PPropInfo): Boolean;
function IsFloatPropInfo(PropInfo: PPropInfo): Boolean;
{$ifdef win32}
function IsVariantPropInfo(PropInfo: PPropInfo): Boolean;
{$endif win32}
function IsMethodPropInfo(PropInfo: PPropInfo): Boolean;

{== property Get/Set/Assign-ByName routines ==}

  { These functions perform the same tasks as Get/Set/Assign-XxxProp, but
    use a PropName in stead of PropInfo parameter. The PropName must be
    separated with dots (i.e. 'Font.Name' or 'Font.Size').
    Returns FALSE if the PropName is not found, or TRUE when found.
    If it returns TRUE, then the corresponding Get/Set/Assign-XxxProp will
    be performed }

function GetOrdPropByName(Instance: TObject; const PropName: string;
  var Value: Longint): Boolean;
function SetOrdPropByName(Instance: TObject; const PropName: string;
  Value: Longint): Boolean;
function AssignOrdPropByName(Instance: TObject; const PropName: string;
  Value: Longint): Boolean;

function GetStrPropByName(Instance: TObject; const PropName: string;
  var Value: string): Boolean;
function SetStrPropByName(Instance: TObject; const PropName: string;
  const Value: string): Boolean;
function AssignStrPropByName(Instance: TObject; const PropName: string;
  const Value: string): Boolean;

function GetFloatPropByName(Instance: TObject; const PropName: string;
  var Value: Extended): Boolean;
function SetFloatPropByName(Instance: TObject; const PropName: string;
  const Value: Extended): Boolean;
function AssignFloatPropByName(Instance: TObject; const PropName: string;
  const Value: Extended): Boolean;

{$ifdef win32}
function GetVariantPropByName(Instance: TObject; const PropName: string;
  var Value: Variant): Boolean;
function SetVariantPropByName(Instance: TObject; const PropName: string;
  const Value: Variant): Boolean;
function AssignVariantPropByName(Instance: TObject; const PropName: string;
  const Value: Variant): Boolean;
{$endif win32}

function GetMethodPropByName(Instance: TObject; const PropName: string;
  var Value: TMethod): Boolean;
function SetMethodPropByName(Instance: TObject; const PropName: string;
  const Value: TMethod): Boolean;
function AssignMethodPropByName(Instance: TObject; const PropName: string;
  const Value: TMethod): Boolean;

{== Assignment routines ==}

  { These routines perform a SetXxxProp, but skip the setting if the original
    value is already the same }

function AssignOrdProp(Instance: TObject; PropInfo: PPropInfo;
  Value: Longint): Boolean;
function AssignStrProp(Instance: TObject; PropInfo: PPropInfo;
  const Value: string): Boolean;
function AssignFloatProp(Instance: TObject; PropInfo: PPropInfo;
  const Value: Extended): Boolean;
{$ifdef win32}
function AssignVariantProp(Instance: TObject; PropInfo: PPropInfo;
  const Value: Variant): Boolean;
{$endif win32}
function AssignMethodProp(Instance: TObject; PropInfo: PPropInfo;
  const Value: TMethod): Boolean;

implementation

uses
  SysUtils;

{== TAbstractPropertyTypeInfoiEnumerator ==}

function TAbstractPropertyTypeInfoiEnumerator.Enumerate: Boolean;
begin
  if Assigned(FInstance) then
    Result := EnumInstanceRtti(BaseName, FInstance, Delimiter, Enumerator)
  else
    Result := False;
end; { Enumerate }

constructor TAbstractPropertyTypeInfoiEnumerator.Create(AnInstance: TObject);
begin
  inherited Create;
  FInstance := AnInstance;
  FFound := False;
  FDelimiter := rdDot;
end; { Create }

destructor TAbstractPropertyTypeInfoiEnumerator.Destroy;
begin
  inherited Destroy;
end; { Destroy }

function TAbstractPropertyTypeInfoiEnumerator.Execute: Boolean;
begin
  FFound := False;
  try
    FFound := Enumerate;
  finally
    Result := Found;
  end;
end; { Execute }

{== TPropertyInfoFinder ==}

function TPropertyInfoFinder.Enumerator(const PropName: string; ObjectInstance: TObject; PropInfo: PPropInfo): Boolean;
begin
  Result := False; { continue enumerating }
  if AnsiCompareText(PropName,PropertyName) = 0 then
  begin
//  if PropName = PropertyName then begin
    FPropertyInfo := PropInfo;
    FPropertyInstance := ObjectInstance;
    Result := True; { stop enumerating }
  end;
end; { Enumerator }

function TPropertyInfoFinder.Execute: Boolean;
begin
  FPropertyInfo := nil;
  FPropertyInstance := nil;
  Result := inherited Execute;
end; { Execute }

constructor TPropertyInfoFinder.Create(AnInstance: TObject; const APropertyName: string);
begin
  inherited Create(AnInstance);
  FPropertyName := APropertyName;
  FPropertyInfo := nil;
  FPropertyInstance := nil;
end; { Create }

{- internal -}

function EnumClassInstanceRtti(const BaseName: string; Instance: TObject; ClassTypeInfo: PTypeInfo;
  Delimiter: TNRttiDelimiter; CallBack: TNRttiCallBack): Boolean;
var
  TypeData: PTypeData;
  ClassType: TClass;
  I, Count: Integer;
  PropList: PPropList;
begin
  Result := False;
  TypeData := GetTypeData(ClassTypeInfo);
  ClassType := TypeData^.ClassType;
  Count := TypeData^.PropCount;

  GetMem(PropList, Count * SizeOf(Pointer));
  try
    GetPropInfos(ClassType.ClassInfo, PropList);
    for I := 0 to Count - 1 do begin
      Result := EnumPropertyRtti(BaseName, Instance, PropList^[I], Delimiter, CallBack);
      if Result then break;
    end;
  finally
    FreeMem(PropList, Count * SizeOf(Pointer));
  end; { try }
end; { EnumClassInstanceRtti }

{- public -}

function EnumInstanceRtti(const BaseName: string; Instance: TObject;
  Delimiter: TNRttiDelimiter; CallBack: TNRttiCallBack): Boolean;
begin
  Result := EnumClassInstanceRtti(BaseName, Instance, Instance.ClassType.ClassInfo, Delimiter, CallBack);
end; { EnumInstanceRtti }

function EnumClassRtti(const BaseName: string; ClassTypeInfo: PTypeInfo;
  Delimiter: TNRttiDelimiter; CallBack: TNRttiCallBack): Boolean;
begin
  Result := EnumClassInstanceRtti(BaseName, nil, ClassTypeInfo, Delimiter, CallBack);
end; { EnumClassRtti }

const
  Formatting: array[TNRttiDelimiter] of string = (
    { rdDot, rdNone, rdUnderscore, rdPipe }
    '%s.%s',
    '%s%s',
    '%s_%s',
    '%s|%s'
  );

function EnumPropertyRtti(const BaseName: string; Instance: TObject; PropInfo: PPropInfo;
  Delimiter: TNRttiDelimiter; CallBack: TNRttiCallBack): Boolean;
var
  PropTypeInfo: PTypeInfo;
  PropInstance: TObject;
  PropBaseName: string;
begin
  if BaseName = '' then
    PropBaseName := PropInfo^.Name
  else
    PropBaseName :=
      Format(Formatting[Delimiter],
        [BaseName, PropInfo^.Name]);
  Result := CallBack(PropBaseName, Instance, PropInfo);
  PropTypeInfo := GetPropTypeInfo(PropInfo);
  if (not Result) and (PropTypeInfo^.Kind = tkClass) then
  begin
    if Instance = nil then
      PropInstance := nil
    else
    try
      PropInstance := TObject(GetOrdProp(Instance, PropInfo));
    except
      PropInstance := nil; {##jp:  GetOrdProp can fail if the Read-method throws an exception. For instance TBitBnt.Glyph if the FGlyph has not been initialized yet. ##}
    end;
    Result := EnumClassInstanceRtti(
      PropBaseName, PropInstance, PropTypeInfo, Delimiter, CallBack);
  end;
end; { EnumPropertyRtti }

{== TypeInfo routines ==}

function GetPropTypeInfo(PropInfo: PPropInfo): PTypeInfo;
begin
{$ifdef ver80}
  GetPropTypeInfo := PropInfo^.PropType;
{$else} {$ifdef ver90}
  GetPropTypeInfo := PropInfo^.PropType;
{$else}
  GetPropTypeInfo := PropInfo^.PropType^;
{$endif ver90}
{$endif ver80}
end; { GetPropTypeInfo }

{== property information routines ==}

function IsPropertyName(Instance: TObject; const PropName: string): Boolean;
begin
  Result := GetPropInfoByName(Instance, PropName) <> nil;
end; { IsPropertyName }

function GetPropInfoByName(Instance: TObject; const PropName: string): PPropInfo;
begin
  Result := nil;
  if Assigned(Instance) then
    with TPropertyInfoFinder.Create(Instance, PropName) do
      try
        if Execute then
          Result := PropertyInfo;
      finally
        Free;
      end;
end; { GetPropInfoByName }

function IsOrdPropInfo(PropInfo: PPropInfo): Boolean;
begin
  Result := (PropInfo <> nil) and
    (PropInfo^.PropType^.Kind in
      [tkClass, tkInteger, tkChar, tkEnumeration, tkSet, tkWChar]);
end; { IsOrdPropInfo }

function IsStrPropInfo(PropInfo: PPropInfo): Boolean;
begin
  Result :=  (PropInfo <> nil) and
    (PropInfo^.PropType^.Kind in [tkString, tkLString, tkWString]);
end; { IsStrPropInfo }

function IsFloatPropInfo(PropInfo: PPropInfo): Boolean;
begin
  Result :=  (PropInfo <> nil) and
    (PropInfo^.PropType^.Kind = tkFloat);
end; { IsFloatPropInfo }

{$ifdef win32}
function IsVariantPropInfo(PropInfo: PPropInfo): Boolean;
begin
  Result :=  (PropInfo <> nil) and
    (PropInfo^.PropType^.Kind = tkVariant); {## is this all right: might need extension? ##}
end; { IsVariantPropInfo }
{$endif win32}

function IsMethodPropInfo(PropInfo: PPropInfo): Boolean;
begin
  Result :=  (PropInfo <> nil) and
    (PropInfo^.PropType^.Kind = tkMethod);
end; { IsMethodPropInfo }

{== property Get/Set/Assign-ByName routines ==}

function GetOrdPropByName(Instance: TObject; const PropName: string;
  var Value: Longint): Boolean;
var
  PropInfo: PPropInfo;
begin
  PropInfo := GetPropInfoByName(Instance, PropName);
  Result := IsOrdPropInfo(PropInfo);
  if Result then
    Value := GetOrdProp(Instance, PropInfo);
end; { GetOrdPropByName }

function SetOrdPropByName(Instance: TObject; const PropName: string;
  Value: Longint): Boolean;
var
  PropInfo: PPropInfo;
begin
  PropInfo := GetPropInfoByName(Instance, PropName);
  Result := IsOrdPropInfo(PropInfo);
  if Result then
    SetOrdProp(Instance, PropInfo, Value);
end; { SetOrdPropByName }

function AssignOrdPropByName(Instance: TObject; const PropName: string;
  Value: Longint): Boolean;
var
  PropInfo: PPropInfo;
begin
  PropInfo := GetPropInfoByName(Instance, PropName);
  Result := IsOrdPropInfo(PropInfo);
  if Result then
    AssignOrdProp(Instance, PropInfo, Value);
end; { AssignOrdPropByName }

function GetStrPropByName(Instance: TObject; const PropName: string;
  var Value: string): Boolean;
var
  PropInfo: PPropInfo;
begin
  try
    PropInfo := GetPropInfoByName(Instance, PropName);
  except
    on E: Exception do begin
      Value := 'GetPropInfoByName Exception: '+E.Message;
      Result := True;
      exit;
    end;
  end;
  try
    Result := IsStrPropInfo(PropInfo);
  except
    on E: Exception do begin
      Value := 'IsStrPropInfo Exception: '+E.Message;
      Result := True;
      exit;
    end;
  end;
  if Result then
    try
      Value := GetStrProp(Instance, PropInfo);
    except
      on E: Exception do begin
        Value := 'GetStrProp Exception: '+E.Message;
        Result := True;
      end;
    end;
end; { GetStrPropByName }

function SetStrPropByName(Instance: TObject; const PropName: string;
  const Value: string): Boolean;
var
  PropInfo: PPropInfo;
begin
  PropInfo := GetPropInfoByName(Instance, PropName);
  Result := IsStrPropInfo(PropInfo);
  if Result then
    SetStrProp(Instance, PropInfo, Value);
end; { SetStrPropByName }

function AssignStrPropByName(Instance: TObject; const PropName: string;
  const Value: string): Boolean;
var
  PropInfo: PPropInfo;
begin
  PropInfo := GetPropInfoByName(Instance, PropName);
  Result := IsStrPropInfo(PropInfo);
  if Result then
    AssignStrProp(Instance, PropInfo, Value);
end; { AssignStrPropByName }


function GetFloatPropByName(Instance: TObject; const PropName: string;
  var Value: Extended): Boolean;
var
  PropInfo: PPropInfo;
begin
  PropInfo := GetPropInfoByName(Instance, PropName);
  Result := IsFloatPropInfo(PropInfo);
  if Result then
    Value := GetFloatProp(Instance, PropInfo);
end; { GetFloatPropByName }

function SetFloatPropByName(Instance: TObject; const PropName: string;
  const Value: Extended): Boolean;
var
  PropInfo: PPropInfo;
begin
  PropInfo := GetPropInfoByName(Instance, PropName);
  Result := IsFloatPropInfo(PropInfo);
  if Result then
    SetFloatProp(Instance, PropInfo, Value);
end; { SetFloatPropByName }

function AssignFloatPropByName(Instance: TObject; const PropName: string;
  const Value: Extended): Boolean;
var
  PropInfo: PPropInfo;
begin
  PropInfo := GetPropInfoByName(Instance, PropName);
  Result := IsFloatPropInfo(PropInfo);
  if Result then
    AssignFloatProp(Instance, PropInfo, Value);
end; { AssignFloatPropByName }

{$ifdef win32}
function GetVariantPropByName(Instance: TObject; const PropName: string;
  var Value: Variant): Boolean;
var
  PropInfo: PPropInfo;
begin
  PropInfo := GetPropInfoByName(Instance, PropName);
  Result := IsVariantPropInfo(PropInfo);
  if Result then
    Value := GetVariantProp(Instance, PropInfo);
end; { GetVariantPropByName }

function SetVariantPropByName(Instance: TObject; const PropName: string;
  const Value: Variant): Boolean;
var
  PropInfo: PPropInfo;
begin
  PropInfo := GetPropInfoByName(Instance, PropName);
  Result := IsVariantPropInfo(PropInfo);
  if Result then
    SetVariantProp(Instance, PropInfo, Value);
end; { SetVariantPropByName }

function AssignVariantPropByName(Instance: TObject; const PropName: string;
  const Value: Variant): Boolean;
var
  PropInfo: PPropInfo;
begin
  PropInfo := GetPropInfoByName(Instance, PropName);
  Result := IsVariantPropInfo(PropInfo);
  if Result then
    AssignVariantProp(Instance, PropInfo, Value);
end; { AssignVariantPropByName }
{$endif win32}

function GetMethodPropByName(Instance: TObject; const PropName: string;
  var Value: TMethod): Boolean;
var
  PropInfo: PPropInfo;
begin
  PropInfo := GetPropInfoByName(Instance, PropName);
  Result := IsMethodPropInfo(PropInfo);
  if Result then
    Value := GetMethodProp(Instance, PropInfo);
end; { GetMethodPropByName }

function SetMethodPropByName(Instance: TObject; const PropName: string;
  const Value: TMethod): Boolean;
var
  PropInfo: PPropInfo;
begin
  PropInfo := GetPropInfoByName(Instance, PropName);
  Result := IsMethodPropInfo(PropInfo);
  if Result then
    SetMethodProp(Instance, PropInfo, Value);
end; { SetMethodPropByName }

function AssignMethodPropByName(Instance: TObject; const PropName: string;
  const Value: TMethod): Boolean;
var
  PropInfo: PPropInfo;
begin
  PropInfo := GetPropInfoByName(Instance, PropName);
  Result := IsMethodPropInfo(PropInfo);
  if Result then
    AssignMethodProp(Instance, PropInfo, Value);
end; { AssignMethodPropByName }

{== Assignment routines ==}

function AssignOrdProp(Instance: TObject; PropInfo: PPropInfo;
  Value: Longint): Boolean;
begin
  Result := GetOrdProp(Instance, PropInfo) <> Value;
  if Result then
    SetOrdProp(Instance, PropInfo, Value);
end; { AssignOrdProp }

function AssignStrProp(Instance: TObject; PropInfo: PPropInfo;
  const Value: string): Boolean;
begin
  Result := GetStrProp(Instance, PropInfo) <> Value;
  if Result then
    SetStrProp(Instance, PropInfo, Value);
end; { AssignStrProp }

function AssignFloatProp(Instance: TObject; PropInfo: PPropInfo;
  const Value: Extended): Boolean;
begin
  Result := GetFloatProp(Instance, PropInfo) <> Value;
  if Result then
    SetFloatProp(Instance, PropInfo, Value);
end; { AssignFloatProp }

{$ifdef win32}
function AssignVariantProp(Instance: TObject; PropInfo: PPropInfo;
  const Value: Variant): Boolean;
begin
  Result := GetVariantProp(Instance, PropInfo) <> Value;
  if Result then
    SetVariantProp(Instance, PropInfo, Value);
end; { AssignVariantProp }
{$endif win32}

function AssignMethodProp(Instance: TObject; PropInfo: PPropInfo;
  const Value: TMethod): Boolean;
var
  Method: TMethod;
begin
  Method := GetMethodProp(Instance, PropInfo);
  Result := (Method.Code <> Value.Code) or (Method.Data <> Value.Data);
  if Result then
    SetMethodProp(Instance, PropInfo, Value);
end; { AssignMethodProp }

end.
