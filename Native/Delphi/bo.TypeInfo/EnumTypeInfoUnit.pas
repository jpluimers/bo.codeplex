unit EnumTypeInfoUnit;

interface

uses
  TypInfo;

function GetEnumNameAndOrdValue(const TypeInfo: PTypeInfo; const Value: Integer): string; overload;

//1 find the EnumUnitName inside the TypeInfo
function GetEnumUnitName(const TypeInfo: PTypeInfo): string; overload;

//1 get a CSV list of names for the enumeration values
function GetEnumCsvNameList(const TypeInfo: PTypeInfo): string; overload;

implementation

uses
  SysUtils;

function GetEnumNameAndOrdValue(const TypeInfo: PTypeInfo; const Value: Integer): string;
begin
  Result := Format('%s (%d)', [GetEnumName(TypeInfo, Value), Value]);
end;

function GetEnumUnitName(const TypeInfo: PTypeInfo): string; overload;
var
  TypeTypeData: PTypeData;
  ValueIndex: Integer;
  P: ^ShortString;
begin
  TypeTypeData := TypInfo.GetTypeData(TypeInfo);
  if TypeInfo.Kind = tkEnumeration then
  begin
    ValueIndex := TypeTypeData.MaxValue - TypeTypeData.MinValue;
    P := @TypeTypeData.NameList;
    while ValueIndex >= 0 do
    begin
      // length plus one extra length byte per entry
      Inc(Integer(P), Length(P^) + 1);
      Dec(ValueIndex);
    end;
    // we counted all the values, so now we are at EnumUnitName:
    Result := string(P^);
  end
  else
    Result := '';
end;

function GetEnumCsvNameList(const TypeInfo: PTypeInfo): string; overload;
var
  TypeTypeData: PTypeData;
  ValueIndex: Integer;
  P: ^ShortString;
begin
  Result := '';
  TypeTypeData := TypInfo.GetTypeData(TypeInfo);
  if TypeInfo.Kind = tkEnumeration then
  begin
    ValueIndex := TypeTypeData.MaxValue - TypeTypeData.MinValue;
    P := @TypeTypeData.NameList;
    while ValueIndex >= 0 do
    begin
      if Result = '' then
        Result := string(P^)
      else
        Result := Result + ',' + string(P^);
      // length plus one extra length byte per entry
      Inc(Integer(P), Length(P^) + 1);
      Dec(ValueIndex);
    end;
  end;
end;

end.
