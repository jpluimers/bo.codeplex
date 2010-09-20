unit StringUtilsUnit;

interface

uses
  StdCtrls; // TEllipsisPosition

function CommaSeparated(const Values: array of string): string; overload;

//1 Mike_Heydon_UnCamelCase - http://delphi.about.com/od/delphichallengesexercises/qt/delphi-challenge-CaptionFromCamelCase.htm
function UnCamelCase(const CamelCaseString: string): string;

function RemoveWhiteSpace(const Original: string): string;

function AnsiStartsAnyText(const ASubTexts: array of string; const AText: string): Boolean;

function CaptionFromCamelCase(const CamelCaseString: string; const SuffixClassToStrip: TClass = nil): string;

function EllipsisText(const Value: string; const MaxLength: Integer; const FWordWrap: Boolean = True; const FEllipsisPosition: TEllipsisPosition =
    epWordEllipsis): string;

function StripClassPrefixT(const ClassName: string): string;

function StripSuffix(const Value, Suffix: string): string;

function CreateNewGuidString: string;

function StripLowercasePrefix(const Value: string): string;

const
  sDefaultClassPrefixT = 'T';
  sTab = #9;

implementation

uses
  StrUtils, SysUtils, Character, Variants, ComObj;

function CommaSeparated(const Values: array of string): string;
var
  Value: string;
begin
  Result := NullAsStringValue;
  for Value in Values do
    if Result = NullAsStringValue then
      Result := Value
    else
      Result := Format('%s, %s', [Result, Value]);
end;

function IsUpperCase(const Ch: Char): Boolean;
var
  UpperCh: string;
begin
  UpperCh := TCharacter.ToUpper(Ch);
  Result := UpperCh = Ch;
end;

function RemoveWhiteSpace(const Original: string): string;
var
  I: Integer;
begin
  Result := Original;
  for I := Length(Result) downto 1 do
    if Result[I] <= ' ' then
      Delete(Result, I, 1);
end;

function AnsiStartsAnyText(const ASubTexts: array of string; const AText: string): Boolean;
var
  SubText: string;
begin
  Result := False;
  for SubText in ASubTexts do
  begin
    Result := AnsiStartsText(SubText, AText);
    if Result then
      Break;
  end;
end;

function StripSuffix(const Value, Suffix: string): string;
var
  SuffixLength: Integer;
begin
  if EndsStr(Suffix, Value) then
  begin
    SuffixLength := Length(Suffix);
    Result := LeftStr(Value, Length(Value) - SuffixLength)
  end
  else
    Result := Value;
end;

function StripSuffixClass(const CamelCaseString: string; const SuffixClassToStrip: TClass): string;
var
  Suffix: string;
begin
  if Assigned(SuffixClassToStrip) then
  begin
    Suffix := StripClassPrefixT(SuffixClassToStrip.ClassName);
    Result := StripSuffix(CamelCaseString, Suffix);
    Result := UnCamelCase(Result);
  end
  else
    Result := UnCamelCase(CamelCaseString);
end;

function CaptionFromCamelCase(const CamelCaseString: string; const SuffixClassToStrip: TClass = nil): string;
begin
  if CamelCaseString = NullAsStringValue then
    Result := NullAsStringValue
  else
  begin
    if Pos(' ', CamelCaseString) > 0 then
      Result := CamelCaseString;
    Result := StripSuffixClass(CamelCaseString, SuffixClassToStrip);
    Result := AnsiReplaceStr(Result, 'Modal Data ', NullAsStringValue); //JR: 20-04-2010 --> dit wil je niet in de caption van het Form hebben staan.
    Result := AnsiReplaceStr(Result, 'Modal ', NullAsStringValue);      //idem...
    Result := LowerCase(Result);
    Result[1] := CamelCaseString[1];
  end;
end;

function UnCamelCase(const CamelCaseString: string): string;
var
  CamelCaseStringIndex: Integer;
  CamelCaseStringLength: Integer;
  ResultIndex: Integer;
  NumberOfUpperCaseCharactersInCamelCaseString: Integer;
begin
  CamelCaseStringLength := Length(CamelCaseString);
  NumberOfUpperCaseCharactersInCamelCaseString := 0;

  for CamelCaseStringIndex := 1 to CamelCaseStringLength do
    if IsUpperCase(CamelCaseString[CamelCaseStringIndex]) then
      Inc(NumberOfUpperCaseCharactersInCamelCaseString);

  if (NumberOfUpperCaseCharactersInCamelCaseString = 0) or (NumberOfUpperCaseCharactersInCamelCaseString = CamelCaseStringLength) then
    Result := CamelCaseString
  else
  begin
    Result := StringOfChar(' ', CamelCaseStringLength + NumberOfUpperCaseCharactersInCamelCaseString - 1);
    Result[Length(Result)] := CamelCaseString[CamelCaseStringLength];
    ResultIndex := 1;

    for CamelCaseStringIndex := 1 to CamelCaseStringLength - 1 do
    begin
      Result[ResultIndex] := CamelCaseString[CamelCaseStringIndex];

      if IsUpperCase(CamelCaseString[CamelCaseStringIndex + 1]) then
        Inc(ResultIndex, 2)
      else
        Inc(ResultIndex);
    end;
  end;
end;

function EllipsisText(const Value: string; const MaxLength: Integer; const FWordWrap: Boolean = True; const FEllipsisPosition: TEllipsisPosition =
    epWordEllipsis): string;
// code partially borrowed from TCustomLabel.DoDrawText
const
  EllipsisStr = '...';
  EllipsisCharacterWidthDivisor = 2; // count a '.' as half a character for display
var
  NettoMaxLength: Integer;
  Text: string;
  DelimitedText: string;
  DelimiterPosition: Integer;
begin
  Result := NullAsStringValue;
  Text := Value;
  if (FEllipsisPosition <> epNone) then
  begin
    if FWordWrap and (FEllipsisPosition in [epEndEllipsis, epWordEllipsis]) then
    begin
      NettoMaxLength := MaxLength - Length(EllipsisStr) div EllipsisCharacterWidthDivisor;
      repeat
        if (Length(Text) > NettoMaxLength) then
        begin
          DelimiterPosition := LastDelimiter(' '+sTab+sLineBreak, Text);
          if DelimiterPosition = 0 then
            DelimiterPosition := Length(Text);
          Dec(DelimiterPosition);
{$IF NOT DEFINED(CLR)}
          if ByteType(Text, DelimiterPosition) = mbLeadByte then
            Dec(DelimiterPosition);
{$IFEND}
          Text := Copy(Text, 1, DelimiterPosition);
          DelimitedText := Text + EllipsisStr;
          if Text = NullAsStringValue then
            Break;
        end
        else
          Break;
      until False;
    end;
    if Text <> NullAsStringValue then
      Result := DelimitedText;
  end;
end;

function StripClassPrefixT(const ClassName: string): string;
begin
  Result := ClassName;
  if StrUtils.StartsStr(SDefaultClassPrefixT, Result) then
    Delete(Result, 1, Length(SDefaultClassPrefixT));
end;

function CreateNewGuidString: string;
begin
  Result := CreateClassID;
end;

function StripLowercasePrefix(const Value: string): string;
var
  First: Char;
begin
  Result := Value;
  while Result <> '' do
  begin
    First := Result[1];
    if LowerCase(First) = First then
      Delete(Result, 1, 1)
    else
      Exit;
  end;
end;

end.
