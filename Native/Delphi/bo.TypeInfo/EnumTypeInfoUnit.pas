{ Copyright (c) 2007-2012 Jeroen Wiert Pluimers for BeSharp.net and better office benelux.
Full BSD License is available at http://besharp.codeplex.com/license and http://bo.codeplex.com/license }

unit EnumTypeInfoUnit;

interface

uses
  TypInfo;

function GetEnumNameAndOrdValue(const TypeInfo: PTypeInfo; const Value: Integer): string; overload;

//1 find the EnumUnitName inside the TypeInfo
function GetEnumUnitName(const TypeInfo: PTypeInfo): string; overload;

//1 get a CSV list of names for the enumeration values
function GetEnumCsvNameList(const TypeInfo: PTypeInfo): string; overload;

function EnumerationAsString(const Value: Integer; const PrefixToStrip: string; Info: PTypeInfo): string;
function EnumerationName(const Value: Integer; const Info: PTypeInfo): string;

//1 returns information about an enumeration, or the exception if it is not an enumeration
function EnumerationInfo(Value: Integer; Info: PTypeInfo): string;

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

function EnumerationAsString(const Value: Integer; const PrefixToStrip: string; Info: PTypeInfo): string;
begin
  Result := EnumerationName(Value, Info);
  if (PrefixToStrip <> '') and (Pos(PrefixToStrip, Result) = 1) then  // there is a PrefixToStrip
    Delete(Result, 1, Length(PrefixToStrip)); // remove the PrefixToStrip
end; { EnumerationAsString }

(*
procedure CharArrayFromString(var CharArray; s: string; CharArraySize: TMaxCharsRange);

procedure CharArrayFromString(var CharArray; s: string; CharArraySize: TMaxCharsRange);
var
  CharIndex: TMaxCharsRange;
  MaxChar: PMaxChar;
  StringLength: Integer;
begin
  StringLength := Length(s);
  if (CharArraySize <> 0) and (StringLength > 0) then
  begin
    MaxChar := @CharArray;
    for CharIndex := 0 to CharArraySize-1 do
    begin
      if CharIndex+1 > StringLength then
        MaxChar^[CharIndex] := #0
      else
        MaxChar^[CharIndex] := s[CharIndex+1];
    end;
  end;
end;
*)

{ Copied from nnRtti, since nnRtti sucks in Controls: }

function EnumerationName(const Value: Integer; const Info: PTypeInfo): string;
var
  Data: PTypeData;
begin
  if Info^.Kind = tkEnumeration then
  begin
    Data := GetTypeData(Info);
    if (Value < Data^.MinValue) or (Value > Data^.MaxValue) then
      raise Exception.CreateFmt(
        'Value %d outside enumeration range [%d..%d] for type %s',
        [Value, Data^.MinValue, Data^.MaxValue, Info^.Name])
    else
      Result := GetEnumName(Info, Value)
  end
  else
    raise Exception.CreateFmt('Info %s is not an enumerated type',
      [Info^.Name]);
end; { EnumerationName }

function EnumerationInfo(Value: Integer; Info: PTypeInfo): string;
begin
  try
    Result := EnumerationName(Value, Info);
  except
    on E: Exception do
      Result := E.Message;
  end;
end; { EnumerationInfo }

end.
