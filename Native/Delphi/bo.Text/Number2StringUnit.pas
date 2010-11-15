unit Number2StringUnit;

interface

uses
  SysUtils, ConcreteCollectionsUnit;

// other languages: http://www.mijnwoordenboek.nl/tellen.php
// french: http://www.rgagnon.com/javadetails/java-0426.html

type
  // short versus long: http://en.wikipedia.org/wiki/Long_and_short_scales
  TNumber2StringScale = (n2ssShort, n2ssLong);
  TNumber2StringLanguage = (n2sEnShort, n2sEnLong, n2sDu);

  INumber2String = interface(IInterface)
    function GetIsDecimal: Boolean; stdcall;
    function GetScaleType: TNumber2StringScale; stdcall;
    function ToString(const Number: Int64): string; stdcall;
    property IsDecimal: Boolean read GetIsDecimal;
    property ScaleType: TNumber2StringScale read GetScaleType;
  end;

  TNumber2String = class(TObject)
  public
    class procedure Number2StringDu(const Number: Integer; const StringBuilder: TStringBuilder); overload; static;
    class procedure Number2StringEnLong(const Number: Integer; const StringBuilder: TStringBuilder); overload; static;
    class procedure Number2StringEnShort(const Number: Integer; const StringBuilder: TStringBuilder); overload; static;
    class function ToString(const Number: Integer; const Number2StringLanguage: TNumber2StringLanguage = n2sEnShort): string; reintroduce; overload; static;
    class procedure ToString(const Number: Integer; const StringBuilder: TStringBuilder; const Number2StringLanguage: TNumber2StringLanguage = n2sEnShort);
        reintroduce; overload; static;
  end;

  TThousandsExponent = (teThousands, teMillions, teBillions, teTrillions, teQuadrillions, teQuintillions);

  TStringArrayOfTThousandsExponent = array[TThousandsExponent] of string;
  TStringArray10 = array[0..9] of string;
  TStringArray20 = array[0..19] of string;

  INumber2StringStaticProperties = interface(IInterface)
    function GetAndConjunctionString: string; stdcall;
    function GetHundredToString: string; stdcall;
    function GetIncludeUnit1Before1000Powers: Boolean; stdcall;
    function GetIncludeUnit1Before1000OnlyIfNotExactly1000: Boolean; stdcall;
    function GetMinusToString: string; stdcall;
    function GetNumbersNames: TStringArray20; stdcall;
    function GetPowerOfThousandPluralSuffixToString: string; stdcall;
    function GetPowersOfThousandNames: TStringArrayOfTThousandsExponent; stdcall;
    function GetPrefix1000WithSpace: Boolean; stdcall;
    function GetPrefixHundredsWithSpace: Boolean; stdcall;
    function GetTensNames: TStringArray10; stdcall;
    function GetUseAndConjunction: Boolean; stdcall;
    function GetZeroToString: string; stdcall;
    property AndConjunctionString: string read GetAndConjunctionString;
    property HundredToString: string read GetHundredToString;
    property IncludeUnit1Before1000Powers: Boolean read GetIncludeUnit1Before1000Powers;
    property IncludeUnit1Before1000OnlyIfNotExactly1000: Boolean read GetIncludeUnit1Before1000OnlyIfNotExactly1000;
    property MinusToString: string read GetMinusToString;
    property NumbersNames: TStringArray20 read GetNumbersNames;
    property PowerOfThousandPluralSuffixToString: string read GetPowerOfThousandPluralSuffixToString;
    property PowersOfThousandNames: TStringArrayOfTThousandsExponent read GetPowersOfThousandNames;
    property Prefix1000WithSpace: Boolean read GetPrefix1000WithSpace;
    property PrefixHundredsWithSpace: Boolean read GetPrefixHundredsWithSpace;
    property TensNames: TStringArray10 read GetTensNames;
    property UseAndConjunction: Boolean read GetUseAndConjunction;
    property ZeroToString: string read GetZeroToString;
  end;

  TAbstractNumber2String = class(TInterfacedObject, INumber2String)
  strict protected
    function GetIsDecimal: Boolean; virtual; stdcall; abstract;
    function GetScaleType: TNumber2StringScale; virtual; stdcall; abstract;
    function ToString(const Number: Int64): string; reintroduce; virtual; stdcall; abstract;
  public
    const Hundred = 100;
    const None = 'none';
    const Space = ' ';
    const Ten = 10;
    const Thousand = 1000;
    const Twenty = 20;
    const Zero = 0;
    const One = 1;
  end;

  TAbstractNumber2DecimalString = class(TAbstractNumber2String, INumber2String)
  strict private
  class var
    //jpl: Note that class vars are specific to the class: they are static, and not repeated for descending classes
    FNumber2StringStaticProperties: INumber2StringStaticProperties;
  var
  strict protected
    function CombineWithAndConjunctionStringIfNeeded(const LessThan100: string): string; virtual;
    function GetAndConjunctionString: string; virtual;
    function GetHundredToString: string;
    function GetIncludeUnit1Before1000Powers: Boolean;
    function GetInclude1ForHundreds: Boolean; virtual; stdcall;
    function GetIncludeUnit1Before1000OnlyIfNotExactly1000: Boolean; stdcall;
    function GetMinusToString: string;
    function GetNumber2StringStaticProperties: INumber2StringStaticProperties; virtual;
    function GetNumbersNames: TStringArray20;
    function GetPowerOfThousandPluralSuffixToString: string;
    function GetPowersOfThousandNames: TStringArrayOfTThousandsExponent;
    function GetPrefix1000WithSpace: Boolean; stdcall;
    function GetPrefixHundredsWithSpace: Boolean; stdcall;
    function GetTensNames: TStringArray10;
    function GetUseAndConjunction: Boolean; virtual;
    function GetZeroToString: string; virtual; stdcall;
    function HundredsToString(StringBuilder: TStringBuilder; Hundreds: Int64): Boolean; virtual;
    procedure LessThan1000ToString(const StringBuilder: TStringBuilder; const Number: Int64); virtual; stdcall;
    procedure LessThan100ToString(const StringBuilder: TStringBuilder; const AppendedHundreds: Boolean; const LessThan100: string; const CombineWithAndConjunction:
        Boolean); virtual;
    procedure PowerToString(const StringBuilder: TStringBuilder; const Number, Power: Int64; const Exponent: TThousandsExponent); virtual; stdcall;
    function TensAndUnitsToString(const Tens, Units: Int64): string; virtual;
    function ToString(const Number: Int64): string; override; stdcall;
    property AndConjunctionString: string read GetAndConjunctionString;
    property HundredToString: string read GetHundredToString;
    property IncludeUnit1Before1000Powers: Boolean read GetIncludeUnit1Before1000Powers;
    property Include1ForHundreds: Boolean read GetInclude1ForHundreds;
    property IncludeUnit1Before1000OnlyIfNotExactly1000: Boolean read GetIncludeUnit1Before1000OnlyIfNotExactly1000;
    property MinusToString: string read GetMinusToString;
    property NumbersNames: TStringArray20 read GetNumbersNames;
    property PowerOfThousandPluralSuffixToString: string read GetPowerOfThousandPluralSuffixToString;
    property PowersOfThousandNames: TStringArrayOfTThousandsExponent read GetPowersOfThousandNames;
    property Prefix1000WithSpace: Boolean read GetPrefix1000WithSpace;
    property PrefixHundredsWithSpace: Boolean read GetPrefixHundredsWithSpace;
    property TensNames: TStringArray10 read GetTensNames;
    property UseAndConjunction: Boolean read GetUseAndConjunction;
    property ZeroToString: string read GetZeroToString;
  public
    function GetIsDecimal: Boolean; override; stdcall;
  end;

type
  TDutchNumber2DecimalString = class(TAbstractNumber2DecimalString, INumber2String)
  strict private
  class var
    //jpl: Note that class vars are specific to the class: they are static, and not repeated for descending classes
    FNumber2StringStaticProperties: INumber2StringStaticProperties;
  strict protected
    function GetInclude1ForHundreds: Boolean; override; stdcall;
    function GetNumber2StringStaticProperties: INumber2StringStaticProperties; override;
    function GetScaleType: TNumber2StringScale; override; stdcall;
    function TensAndUnitsToString(const Tens, Units: Int64): string; override;
  end;

type
  TEnglishNumber2DecimalString = class(TAbstractNumber2DecimalString, INumber2String)
  strict private
  class var
    //jpl: Note that class vars are specific to the class: they are static, and not repeated for descending classes
    FNumber2StringStaticProperties: INumber2StringStaticProperties;
  strict protected
    function GetNumber2StringStaticProperties: INumber2StringStaticProperties; override;
    function GetScaleType: TNumber2StringScale; override; stdcall;
  public
    class constructor Create;
  end;

type
  //1 http://en.wikipedia.org/wiki/Roman_numerals
  TNumber2RomanString = class(TAbstractNumber2String, INumber2String)
  strict private
  class var
    FNumber2RomanMap: TIntegerStringPairList;
  strict protected
    class procedure InitializeNumber2RomanMap; virtual;
  public
    const MaxmumRomanNumber = 4000000;
    const Special1000Threshold = 4000;
    const Special1000Value = '(I)';
    class constructor Create;
    class destructor Destroy;
    function GetIsDecimal: Boolean; override; stdcall;
    function Parse(const S: string): Int64; stdcall;
    function ToString(const Number: Int64): string; override; stdcall;
    class property Number2RomanMap: TIntegerStringPairList read FNumber2RomanMap;
  end;

type
  TNumber2StringStaticProperties = class(TInterfacedObject, INumber2StringStaticProperties)
  strict private
    FAndConjunctionString: string;
    FHundredToString: string;
    FIncludeUnit1Before1000OnlyIfNotExactly1000: Boolean;
    FIncludeUnit1Before1000Powers: Boolean;
    FMinusToString: string;
    FNumbersNames: TStringArray20;
    FPowerOfThousandPluralSuffixToString: string;
    FPowersOfThousandNames: TStringArrayOfTThousandsExponent;
    FPrefix1000WithSpace: Boolean;
    FPrefixHundredsWithSpace: Boolean;
    FTensNames: TStringArray10;
    FUseAndConjunction: Boolean;
    FZeroToString: string;
  strict protected
    function GetAndConjunctionString: string; stdcall;
    function GetHundredToString: string; stdcall;
    function GetIncludeUnit1Before1000OnlyIfNotExactly1000: Boolean; stdcall;
    function GetIncludeUnit1Before1000Powers: Boolean; stdcall;
    function GetMinusToString: string; stdcall;
    function GetNumbersNames: TStringArray20; stdcall;
    function GetPowerOfThousandPluralSuffixToString: string; stdcall;
    function GetPowersOfThousandNames: TStringArrayOfTThousandsExponent; stdcall;
    function GetPrefix1000WithSpace: Boolean; stdcall;
    function GetPrefixHundredsWithSpace: Boolean; stdcall;
    function GetTensNames: TStringArray10; stdcall;
    function GetUseAndConjunction: Boolean; stdcall;
    function GetZeroToString: string; stdcall;
  public
    constructor Create(const AndConjunctionString, HundredToString: string; const IncludeUnit1Before1000Powers, IncludeUnit1Before1000OnlyIfNotExactly1000: Boolean; const
        MinusToString: string; const NumbersNames: TStringArray20; const PowerOfThousandPluralSuffixToString: string; const PowersOfThousandNames: TStringArrayOfTThousandsExponent;
        const Prefix1000WithSpace, PrefixHundredsWithSpace: Boolean; const TensNames: TStringArray10; const UseAndConjunction: Boolean; const ZeroToString: string);
    property AndConjunctionString: string read GetAndConjunctionString;
    property HundredToString: string read GetHundredToString;
    property IncludeUnit1Before1000OnlyIfNotExactly1000: Boolean read GetIncludeUnit1Before1000OnlyIfNotExactly1000;
    property IncludeUnit1Before1000Powers: Boolean read GetIncludeUnit1Before1000Powers;
    property MinusToString: string read GetMinusToString;
    property NumbersNames: TStringArray20 read GetNumbersNames;
    property PowerOfThousandPluralSuffixToString: string read GetPowerOfThousandPluralSuffixToString;
    property PowersOfThousandNames: TStringArrayOfTThousandsExponent read GetPowersOfThousandNames;
    property Prefix1000WithSpace: Boolean read GetPrefix1000WithSpace;
    property PrefixHundredsWithSpace: Boolean read GetPrefixHundredsWithSpace;
    property TensNames: TStringArray10 read GetTensNames;
    property UseAndConjunction: Boolean read GetUseAndConjunction;
    property ZeroToString: string read GetZeroToString;
  end;

type
  TGermanNumber2DecimalString = class(TAbstractNumber2DecimalString, INumber2String)
  strict private
  class var
    //jpl: Note that class vars are specific to the class: they are static, and not repeated for descending classes
    FNumber2StringStaticProperties: INumber2StringStaticProperties;
  strict protected
    function GetInclude1ForHundreds: Boolean; override; stdcall;
    function GetNumber2StringStaticProperties: INumber2StringStaticProperties; override;
    function GetScaleType: TNumber2StringScale; override; stdcall;
    procedure LessThan1000ToString(const StringBuilder: TStringBuilder; const Number: Int64); override; stdcall;
    function TensAndUnitsToString(const Tens, Units: Int64): string; override;
  end;

implementation

uses
  StrUtils, SysConst, MathUnit, Variants, DivModUnit;

class procedure TNumber2String.Number2StringDu(const Number: Integer; const StringBuilder: TStringBuilder);
begin
end;

class procedure TNumber2String.Number2StringEnLong(const Number: Integer; const StringBuilder: TStringBuilder);
begin
end;

class procedure TNumber2String.Number2StringEnShort(const Number: Integer; const StringBuilder: TStringBuilder);
begin
end;

class function TNumber2String.ToString(const Number: Integer; const Number2StringLanguage: TNumber2StringLanguage = n2sEnShort): string;
var
  StringBuilder: TStringBuilder;
begin
  StringBuilder := TStringBuilder.Create();
  try
    ToString(Number, StringBuilder, Number2StringLanguage);
    Result := StringBuilder.ToString();
  finally
    StringBuilder.Free;
  end;
end;

class procedure TNumber2String.ToString(const Number: Integer; const StringBuilder: TStringBuilder; const Number2StringLanguage: TNumber2StringLanguage =
    n2sEnShort);
begin
  case Number2StringLanguage of
    n2sEnShort: ;
    n2sEnLong: ;
    n2sDu: ;
  end;
end;

function TAbstractNumber2DecimalString.GetIsDecimal: Boolean;
begin
  Result := True;
end;

function TAbstractNumber2DecimalString.CombineWithAndConjunctionStringIfNeeded(const LessThan100: string): string;
begin
  if UseAndConjunction then
    Result := AndConjunctionString + Trim(LessThan100)
  else
    Result := LessThan100;
end;

function TAbstractNumber2DecimalString.GetAndConjunctionString: string;
begin
  Result := GetNumber2StringStaticProperties.AndConjunctionString;
end;

function TAbstractNumber2DecimalString.GetHundredToString: string;
begin
  Result := GetNumber2StringStaticProperties.HundredToString;
end;

function TAbstractNumber2DecimalString.GetIncludeUnit1Before1000Powers: Boolean;
begin
  Result := GetNumber2StringStaticProperties.IncludeUnit1Before1000Powers;
end;

procedure TAbstractNumber2DecimalString.LessThan100ToString(const StringBuilder: TStringBuilder; const AppendedHundreds: Boolean; const LessThan100: string;
    const CombineWithAndConjunction: Boolean);
begin
//  if AppendedHundreds and CombineWithAndConjunction then
//    StringBuilder.Append(CombineWithAndConjunctionStringIfNeeded(LessThan100))
//  else
    StringBuilder.Append(LessThan100);
end;

function TAbstractNumber2DecimalString.HundredsToString(StringBuilder: TStringBuilder; Hundreds: Int64): Boolean;
begin
  Result := Hundreds <> 0;
  if Result then
  begin
    if (Hundreds <> 1) or Include1ForHundreds then
      LessThan1000ToString(StringBuilder, Hundreds);
    if PrefixHundredsWithSpace then
      StringBuilder.Append(Space);
    StringBuilder.Append(HundredToString);
  end;
end;

function TAbstractNumber2DecimalString.GetInclude1ForHundreds: Boolean;
begin
  Result := True;
end;

function TAbstractNumber2DecimalString.GetIncludeUnit1Before1000OnlyIfNotExactly1000: Boolean;
begin
  Result := GetNumber2StringStaticProperties.IncludeUnit1Before1000OnlyIfNotExactly1000;
end;

function TAbstractNumber2DecimalString.GetMinusToString: string;
begin
  Result := GetNumber2StringStaticProperties.MinusToString;
end;

function TAbstractNumber2DecimalString.GetNumber2StringStaticProperties: INumber2StringStaticProperties;
var
  LAndConjunctionString: string;
  LHundredToString: string;
  LIncludeUnit1Before1000Powers: Boolean;
  LIncludeUnit1Before1000OnlyIfNotExactly1000: Boolean;
  LMinusToString: string;
  LNumbersNames: TStringArray20;
  LPowerOfThousandPluralSuffixToString: string;
  LPowersOfThousandNames: TStringArrayOfTThousandsExponent;
  LPrefix1000WithSpace: Boolean;
  LPrefixHundredsWithSpace: Boolean;
  LTensNames: TStringArray10;
  LUseAndConjunction: Boolean;
  LZeroToString: string;
  Index: Integer;
  ThousandsExponentIndex: TThousandsExponent;
begin
  if not Assigned(FNumber2StringStaticProperties) then
  begin
    LAndConjunctionString := ClassName;
    LHundredToString := ClassName;
    LIncludeUnit1Before1000Powers := False;
    LIncludeUnit1Before1000OnlyIfNotExactly1000 := False;
    LMinusToString := ClassName;
    for Index := Low(LNumbersNames) to High(LNumbersNames) do
      LNumbersNames[Index] := ClassName;
    LPowerOfThousandPluralSuffixToString := ClassName;
    for ThousandsExponentIndex := Low(LPowersOfThousandNames) to High(LPowersOfThousandNames) do
      LPowersOfThousandNames[ThousandsExponentIndex] := ClassName;
    for Index := Low(LTensNames) to High(LTensNames) do
      LTensNames[Index] := ClassName;
    LPrefix1000WithSpace := False;
    LPrefixHundredsWithSpace := False;
    LUseAndConjunction := False;
    LZeroToString := ClassName;

    FNumber2StringStaticProperties := TNumber2StringStaticProperties.Create(
      LAndConjunctionString,
      LHundredToString,
      LIncludeUnit1Before1000Powers,
      LIncludeUnit1Before1000OnlyIfNotExactly1000,
      LMinusToString,
      LNumbersNames,
      LPowerOfThousandPluralSuffixToString,
      LPowersOfThousandNames,
      LPrefix1000WithSpace,
      LPrefixHundredsWithSpace,
      LTensNames,
      LUseAndConjunction,
      LZeroToString
    );
  end;
  Result := FNumber2StringStaticProperties;
end;

function TAbstractNumber2DecimalString.GetNumbersNames: TStringArray20;
begin
  Result := GetNumber2StringStaticProperties.NumbersNames;
end;

function TAbstractNumber2DecimalString.GetPowerOfThousandPluralSuffixToString: string;
begin
  Result := GetNumber2StringStaticProperties.PowerOfThousandPluralSuffixToString;
end;

function TAbstractNumber2DecimalString.GetPowersOfThousandNames: TStringArrayOfTThousandsExponent;
begin
  Result := GetNumber2StringStaticProperties.PowersOfThousandNames;
end;

function TAbstractNumber2DecimalString.GetPrefix1000WithSpace: Boolean;
begin
  Result := GetNumber2StringStaticProperties.Prefix1000WithSpace;
end;

function TAbstractNumber2DecimalString.GetPrefixHundredsWithSpace: Boolean;
begin
  Result := GetNumber2StringStaticProperties.PrefixHundredsWithSpace;
end;

function TAbstractNumber2DecimalString.GetTensNames: TStringArray10;
begin
  Result := GetNumber2StringStaticProperties.TensNames;
end;

function TAbstractNumber2DecimalString.GetUseAndConjunction: Boolean;
begin
  Result := GetNumber2StringStaticProperties.UseAndConjunction;
end;

function TAbstractNumber2DecimalString.GetZeroToString: string;
begin
  Result := GetNumber2StringStaticProperties.ZeroToString;
end;

function TAbstractNumber2DecimalString.TensAndUnitsToString(const Tens, Units: Int64): string;
begin
  Result := TensNames[Tens] + NumbersNames[Units];
end;

procedure TAbstractNumber2DecimalString.LessThan1000ToString(const StringBuilder: TStringBuilder; const Number: Int64);
var
  AppendedHundreds: Boolean;
  Hundreds: Int64;
  LessThanTwenty: string;
  Remainder: Int64;
  Tens: Int64;
  TensAndUnits: string;
  Units: Int64;
begin
  Assert(Number < Thousand);
  I64LWDivMod(Number, Hundred, Hundreds, Remainder);
  AppendedHundreds := HundredsToString(StringBuilder, Hundreds);
  if Remainder < Twenty then
  begin
    if (Remainder = 0) and (StringBuilder.Length = 0) then
      LessThanTwenty := ZeroToString
    else
      LessThanTwenty := NumbersNames[Remainder];
    if LessThanTwenty <> NullAsStringValue then
      LessThan100ToString(StringBuilder, AppendedHundreds, LessThanTwenty, True);
  end
  else
  begin
    I64LWDivMod(Remainder, Ten, Tens, Units);
    TensAndUnits := TensAndUnitsToString(Tens, Units);
    LessThan100ToString(StringBuilder, AppendedHundreds, TensAndUnits, False);
  end;
end;

procedure TAbstractNumber2DecimalString.PowerToString(const StringBuilder: TStringBuilder; const Number, Power: Int64; const Exponent: TThousandsExponent);
begin
  if (Power > Zero) then
  begin
    if IncludeUnit1Before1000Powers or (Power > One) or (Exponent > teThousands) then
    begin
      if IncludeUnit1Before1000OnlyIfNotExactly1000 and (Exponent = teThousands) and (Power = One) and (Number = Thousand) then
        // do nothing
      else
      begin
        LessThan1000ToString(StringBuilder, Power);
        if Prefix1000WithSpace or (Exponent > teThousands) then
          StringBuilder.Append(Space);
      end;
    end;
    StringBuilder.Append(PowersOfThousandNames[Exponent]);
    if Exponent > teThousands then // million and up: append plural suffix
      if Power > One then
        StringBuilder.Append(PowerOfThousandPluralSuffixToString);
  end;
end;

function TAbstractNumber2DecimalString.ToString(const Number: Int64): string;
var
  StringBuilder: TStringBuilder;
  PositiveNumber: Int64;
  WorkingPositiveNumber: Int64;
  Remainder: Int64;
  Thousands: Int64;
  Millions: Int64;
  Billions: Int64;
  Trillions: Int64;
  Quadrillions: Int64;
  Quintillions: Int64;
begin
  StringBuilder := TStringBuilder.Create();
  try
    if (Number = Zero) then
      StringBuilder.Append(ZeroToString)
    else
    begin
      if Number < 0 then
      begin
        StringBuilder.Append(MinusToString);
        PositiveNumber := -Number;
      end
      else
        PositiveNumber := Number;
//Min int64 value = -9223372036854775808 = -9,223,372,036,854,775,808
//Max int64 value = 9223372036854775807 = 9,223,372,036,854,775,807: almost nine quintillions
      WorkingPositiveNumber := PositiveNumber;
      I64LWDivMod(WorkingPositiveNumber, Thousand, WorkingPositiveNumber, Remainder);
      I64LWDivMod(WorkingPositiveNumber, Thousand, WorkingPositiveNumber, Thousands);
      I64LWDivMod(WorkingPositiveNumber, Thousand, WorkingPositiveNumber, Millions);
      I64LWDivMod(WorkingPositiveNumber, Thousand, WorkingPositiveNumber, Billions);
      I64LWDivMod(WorkingPositiveNumber, Thousand, WorkingPositiveNumber, Trillions);
      I64LWDivMod(WorkingPositiveNumber, Thousand, WorkingPositiveNumber, Quadrillions);
      I64LWDivMod(WorkingPositiveNumber, Thousand, WorkingPositiveNumber, Quintillions);
      Assert(WorkingPositiveNumber = Zero,
        Format('WorkingPositiveNumber should be zero but is %d, started with Number = %d',
        [WorkingPositiveNumber, Number]));
      PowerToString(StringBuilder, PositiveNumber, Quintillions, teQuintillions);
      PowerToString(StringBuilder, PositiveNumber, Quadrillions, teQuadrillions);
      PowerToString(StringBuilder, PositiveNumber, Trillions, teTrillions);
      PowerToString(StringBuilder, PositiveNumber, Billions, teBillions);
      PowerToString(StringBuilder, PositiveNumber, Millions, teMillions);
      PowerToString(StringBuilder, PositiveNumber, Thousands, teThousands);
      LessThan1000ToString(StringBuilder, Remainder);
    end;
    result := StringBuilder.toString();
    result := Trim(Result);
  finally
    StringBuilder.Free;
  end;
end;

function TDutchNumber2DecimalString.GetInclude1ForHundreds: Boolean;
begin
  Result := False;
end;

function TDutchNumber2DecimalString.GetNumber2StringStaticProperties: INumber2StringStaticProperties;
var
  LAndConjunctionString: string;
  LHundredToString: string;
  LIncludeUnit1Before1000Powers: Boolean;
  LIncludeUnit1Before1000OnlyIfNotExactly1000: Boolean;
  LMinusToString: string;
  LNumbersNames: TStringArray20;
  LPowerOfThousandPluralSuffixToString: string;
  LPowersOfThousandNames: TStringArrayOfTThousandsExponent;
  LPrefix1000WithSpace: Boolean;
  LPrefixHundredsWithSpace: Boolean;
  LTensNames: TStringArray10;
  LUseAndConjunction: Boolean;
  LZeroToString: string;
  Index: Integer;
begin
  if not Assigned(FNumber2StringStaticProperties) then
  begin
    LAndConjunctionString := 'en';
    LHundredToString := 'honderd';
    LIncludeUnit1Before1000Powers := False;
    LIncludeUnit1Before1000OnlyIfNotExactly1000 := False;
    LMinusToString := 'min '; // space suffix, becuase NumberNames, etc don't have space prefixes
    LNumbersNames[0] := '';
    LNumbersNames[1] := 'een';
    LNumbersNames[2] := 'twee';
    LNumbersNames[3] := 'drie';
    LNumbersNames[4] := 'vier';
    LNumbersNames[5] := 'vijf';
    LNumbersNames[6] := 'zes';
    LNumbersNames[7] := 'zeven';
    LNumbersNames[8] := 'acht';
    LNumbersNames[9] := 'negen';
    LNumbersNames[10] := 'tien';
    LNumbersNames[11] := 'elf';
    LNumbersNames[12] := 'twaalf';
    LNumbersNames[13] := 'dertien';
    LNumbersNames[14] := 'veertien';
    LNumbersNames[15] := 'vijftien';
    LNumbersNames[16] := 'zestien';
    LNumbersNames[17] := 'zeventien';
    LNumbersNames[18] := 'achttien';
    LNumbersNames[19] := 'negentien';
    LPowerOfThousandPluralSuffixToString := '';
    // http://nl.wikipedia.org/wiki/Duizend
    // duizend - miljoen - miljard - biljoen - biljard - triljoen - triljard
    LPowersOfThousandNames[teThousands] := 'duizend ';
    LPowersOfThousandNames[teMillions] := 'miljoen ';
    LPowersOfThousandNames[teBillions] := 'miljard ';
    LPowersOfThousandNames[teTrillions] := 'biljoen ';
    LPowersOfThousandNames[teQuadrillions] := 'biljard ';
    LPowersOfThousandNames[teQuintillions] := 'triljoen ';
    LPrefix1000WithSpace := False;
    LPrefixHundredsWithSpace := False;
    LTensNames[0] := '';
    LTensNames[1] := 'tien';
    LTensNames[2] := 'twintig';
    LTensNames[3] := 'dertig';
    LTensNames[4] := 'veertig';
    LTensNames[5] := 'vijftig';
    LTensNames[6] := 'zestig';
    LTensNames[7] := 'zeventig';
    LTensNames[8] := 'tachtig';
    LTensNames[9] := 'negentig';
    LUseAndConjunction := True;
    LZeroToString := 'nul';

    FNumber2StringStaticProperties := TNumber2StringStaticProperties.Create(
      LAndConjunctionString,
      LHundredToString,
      LIncludeUnit1Before1000Powers,
      LIncludeUnit1Before1000OnlyIfNotExactly1000,
      LMinusToString,
      LNumbersNames,
      LPowerOfThousandPluralSuffixToString,
      LPowersOfThousandNames,
      LPrefix1000WithSpace,
      LPrefixHundredsWithSpace,
      LTensNames,
      LUseAndConjunction,
      LZeroToString
    );
  end;
  Result := FNumber2StringStaticProperties;
end;

function TDutchNumber2DecimalString.GetScaleType: TNumber2StringScale;
begin
  Result := n2ssShort;
end;

function TDutchNumber2DecimalString.TensAndUnitsToString(const Tens, Units: Int64): string;
var
  TensName: string;
  UnitName: string;
begin
  UnitName := NumbersNames[Units];
  TensName := TensNames[Tens];
  if UnitName <> NullAsStringValue then
    Result := UnitName + CombineWithAndConjunctionStringIfNeeded(TensName)
  else
    Result := TensName;
end;

class constructor TEnglishNumber2DecimalString.Create;
begin
  //##jpl: Delphi compiler bug?  "inherited;" does not call the inherited constructor, and "inherited Create;" gives a compiler error!
  // [DCC Error] Number2StringUnit.pas(149): E2075 This form of method call only allowed in methods of derived types
end;

function TEnglishNumber2DecimalString.GetNumber2StringStaticProperties: INumber2StringStaticProperties;
var
  LAndConjunctionString: string;
  LHundredToString: string;
  LIncludeUnit1Before1000Powers: Boolean;
  LIncludeUnit1Before1000OnlyIfNotExactly1000: Boolean;
  LMinusToString: string;
  LNumbersNames: TStringArray20;
  LPowerOfThousandPluralSuffixToString: string;
  LPowersOfThousandNames: TStringArrayOfTThousandsExponent;
  LPrefix1000WithSpace: Boolean;
  LPrefixHundredsWithSpace: Boolean;
  LTensNames: TStringArray10;
  LUseAndConjunction: Boolean;
  LZeroToString: string;
  Index: Integer;
begin
  if not Assigned(FNumber2StringStaticProperties) then
  begin
    LAndConjunctionString := '';
    LHundredToString := 'hundred';
    LIncludeUnit1Before1000Powers := True;
    LIncludeUnit1Before1000OnlyIfNotExactly1000 := False;
    LMinusToString := 'minus';
    LNumbersNames[0] := '';
    LNumbersNames[1] := ' one';
    LNumbersNames[2] := ' two';
    LNumbersNames[3] := ' three';
    LNumbersNames[4] := ' four';
    LNumbersNames[5] := ' five';
    LNumbersNames[6] := ' six';
    LNumbersNames[7] := ' seven';
    LNumbersNames[8] := ' eight';
    LNumbersNames[9] := ' nine';
    LNumbersNames[10] := ' ten';
    LNumbersNames[11] := ' eleven';
    LNumbersNames[12] := ' twelve';
    LNumbersNames[13] := ' thirteen';
    LNumbersNames[14] := ' fourteen';
    LNumbersNames[15] := ' fifteen';
    LNumbersNames[16] := ' sixteen';
    LNumbersNames[17] := ' seventeen';
    LNumbersNames[18] := ' eighteen';
    LNumbersNames[19] := ' nineteen';
    LPowerOfThousandPluralSuffixToString := 's';
    LPowersOfThousandNames[teThousands] := 'thousand';
    LPowersOfThousandNames[teMillions] := 'million';
    LPowersOfThousandNames[teBillions] := 'billion';
    LPowersOfThousandNames[teTrillions] := 'trillion';
    LPowersOfThousandNames[teQuadrillions] := 'quadrillion';
    LPowersOfThousandNames[teQuintillions] := 'quintillion';
    LPrefix1000WithSpace := True;
    LPrefixHundredsWithSpace := True;
    LTensNames[0] := '';
    LTensNames[1] := ' ten';
    LTensNames[2] := ' twenty';
    LTensNames[3] := ' thirty';
    LTensNames[4] := ' forty';
    LTensNames[5] := ' fifty';
    LTensNames[6] := ' sixty';
    LTensNames[7] := ' seventy';
    LTensNames[8] := ' eighty';
    LTensNames[9] := ' ninety';
    LUseAndConjunction := False;
    LZeroToString := 'zero';

    FNumber2StringStaticProperties := TNumber2StringStaticProperties.Create(
      LAndConjunctionString,
      LHundredToString,
      LIncludeUnit1Before1000Powers,
      LIncludeUnit1Before1000OnlyIfNotExactly1000,
      LMinusToString,
      LNumbersNames,
      LPowerOfThousandPluralSuffixToString,
      LPowersOfThousandNames,
      LPrefix1000WithSpace,
      LPrefixHundredsWithSpace,
      LTensNames,
      LUseAndConjunction,
      LZeroToString
    );
  end;
  Result := FNumber2StringStaticProperties;
end;

function TEnglishNumber2DecimalString.GetScaleType: TNumber2StringScale;
begin
  Result := n2ssShort;
end;

class constructor TNumber2RomanString.Create;
begin
  //##jpl: Delphi compiler bug?  "inherited;" does not call the inherited constructor, and "inherited Create;" gives a compiler error!
  // [DCC Error] Number2StringUnit.pas(149): E2075 This form of method call only allowed in methods of derived types
  InitializeNumber2RomanMap();
end;

class destructor TNumber2RomanString.Destroy;
begin
  inherited;
  FNumber2RomanMap.Free;
  FNumber2RomanMap := nil;
end;

function TNumber2RomanString.GetIsDecimal: Boolean;
begin
  Result := False;
end;

class procedure TNumber2RomanString.InitializeNumber2RomanMap;
begin
  if not Assigned(FNumber2RomanMap) then
  begin
    FNumber2RomanMap := TIntegerStringPairList.Create();
(*
Symbol	Value
overline V or (V)	five thousand
overline X or (X)	ten thousand
overline L or (L)	fifty thousand
overline C or (C)	one hundred thousand
overline D or (D)	five hundred thousand
overline M or (M)	one million
*)
    FNumber2RomanMap.Add(TIntegerStringPair.Create(1000000, '(M)'));
    FNumber2RomanMap.Add(TIntegerStringPair.Create(9000000, '(C)(M)'));
    FNumber2RomanMap.Add(TIntegerStringPair.Create(500000, '(D)'));
    FNumber2RomanMap.Add(TIntegerStringPair.Create(400000, '(C)(D)'));
    FNumber2RomanMap.Add(TIntegerStringPair.Create(100000, '(C)'));
    FNumber2RomanMap.Add(TIntegerStringPair.Create(900000, '(X)(C)'));
    FNumber2RomanMap.Add(TIntegerStringPair.Create(50000, '(L)'));
    FNumber2RomanMap.Add(TIntegerStringPair.Create(40000, '(X)(L)'));
    FNumber2RomanMap.Add(TIntegerStringPair.Create(10000, '(X)'));
    FNumber2RomanMap.Add(TIntegerStringPair.Create(9000, '(I)(X)'));
    FNumber2RomanMap.Add(TIntegerStringPair.Create(5000, '(V)'));
    FNumber2RomanMap.Add(TIntegerStringPair.Create(4000, '(I)(V)'));
    FNumber2RomanMap.Add(TIntegerStringPair.Create(1000, 'M'));
    FNumber2RomanMap.Add(TIntegerStringPair.Create(900, 'CM'));
    FNumber2RomanMap.Add(TIntegerStringPair.Create(500, 'D'));
    FNumber2RomanMap.Add(TIntegerStringPair.Create(400, 'CD'));
    FNumber2RomanMap.Add(TIntegerStringPair.Create(100, 'C'));
    FNumber2RomanMap.Add(TIntegerStringPair.Create(90, 'XC'));
    FNumber2RomanMap.Add(TIntegerStringPair.Create(50, 'L'));
    FNumber2RomanMap.Add(TIntegerStringPair.Create(40, 'XL'));
    FNumber2RomanMap.Add(TIntegerStringPair.Create(10, 'X'));
    FNumber2RomanMap.Add(TIntegerStringPair.Create(9, 'IX'));
    FNumber2RomanMap.Add(TIntegerStringPair.Create(5, 'V'));
    FNumber2RomanMap.Add(TIntegerStringPair.Create(4, 'IV'));
    FNumber2RomanMap.Add(TIntegerStringPair.Create(1, 'I'));
  end;
end;

function TNumber2RomanString.Parse(const S: string): Int64;
var
  Found: Boolean;
  Number2RomanPair: TIntegerStringPair;
  StringValue: string;
  Value: string;
  ValueLength: Integer;
begin
  Result := Zero;
  StringValue := AnsiUpperCase(S);
  if S = None then
    Exit;

  while StringValue <> '' do
  begin
    Found := False;
    for Number2RomanPair in Number2RomanMap do
    begin
      Value := Number2RomanPair.Value;
      ValueLength := Length(Value);
      while AnsiSameText(Copy(StringValue, 1, ValueLength), Value) do
      begin
        Found := True;
        Result := Result + Number2RomanPair.Key;
        Delete(StringValue, 1, ValueLength);
      end;
    end;
    if not Found then
      raise EConvertError.CreateFmt('Parse can not convert "%s" at substring "%s"', [S, StringValue]);
  end;
end;

function TNumber2RomanString.ToString(const Number: Int64): string;
var
  Count: Integer;
  Key: Int64;
  Number2RomanPair: TIntegerStringPair;
  Roman: TStringBuilder;
  NumberValue: Integer;
  Value: string;
begin
  if (Number < Zero) or (Number >= MaxmumRomanNumber) then
    raise ERangeError.CreateRes(@SRangeError);
  if Number = Zero then
    Exit(None);

  Roman := TStringBuilder.Create();
  try
    NumberValue := Number;
    for Number2RomanPair in Number2RomanMap do
    begin
      Key := Number2RomanPair.Key;
      Count := NumberValue div Key;
      if Count <> 0 then
      begin
//        if (Key = Thousand) and (Number > Special1000Threshold) then
//          Value := Special1000Value
//        else
          Value := Number2RomanPair.Value;
        Roman.Append(DupeString(Value, Count));
      end;
      NumberValue := NumberValue mod Key;
    end;
//  foreach ($roman_numerals as $roman => $number)
  {
  /*** divide to get matches ***/
  $matches = intval($n / $number);

  /*** assign the roman char * $matches ***/
  $res .= str_repeat($roman, $matches);

  /*** substract from the number ***/
  $n = $n % $number;end;
  }
    Result := Roman.ToString();
  finally
    Roman.Free;
  end;
end;

constructor TNumber2StringStaticProperties.Create(const AndConjunctionString, HundredToString: string; const IncludeUnit1Before1000Powers,
    IncludeUnit1Before1000OnlyIfNotExactly1000: Boolean; const MinusToString: string; const NumbersNames: TStringArray20; const
    PowerOfThousandPluralSuffixToString: string; const PowersOfThousandNames: TStringArrayOfTThousandsExponent; const Prefix1000WithSpace, PrefixHundredsWithSpace: Boolean; const
    TensNames: TStringArray10; const UseAndConjunction: Boolean; const ZeroToString: string);
begin
  inherited Create();
  FAndConjunctionString := AndConjunctionString;
  FHundredToString := HundredToString;
  FIncludeUnit1Before1000Powers := IncludeUnit1Before1000Powers;
  FIncludeUnit1Before1000OnlyIfNotExactly1000 := IncludeUnit1Before1000OnlyIfNotExactly1000;
  FMinusToString := MinusToString;
  FNumbersNames := NumbersNames;
  FPowerOfThousandPluralSuffixToString := PowerOfThousandPluralSuffixToString;
  FPowersOfThousandNames := PowersOfThousandNames;
  FPrefix1000WithSpace := Prefix1000WithSpace;
  FPrefixHundredsWithSpace := PrefixHundredsWithSpace;
  FTensNames := TensNames;
  FUseAndConjunction := UseAndConjunction;
  FZeroToString := ZeroToString;
end;

function TNumber2StringStaticProperties.GetAndConjunctionString: string;
begin
  Result := FAndConjunctionString;
end;

function TNumber2StringStaticProperties.GetHundredToString: string;
begin
  Result := FHundredToString;
end;

function TNumber2StringStaticProperties.GetIncludeUnit1Before1000OnlyIfNotExactly1000: Boolean;
begin
  Result := FIncludeUnit1Before1000OnlyIfNotExactly1000;
end;

function TNumber2StringStaticProperties.GetIncludeUnit1Before1000Powers: Boolean;
begin
  Result := FIncludeUnit1Before1000Powers;
end;

function TNumber2StringStaticProperties.GetMinusToString: string;
begin
  Result := FMinusToString;
end;

function TNumber2StringStaticProperties.GetNumbersNames: TStringArray20;
begin
  Result := FNumbersNames;
end;

function TNumber2StringStaticProperties.GetPowerOfThousandPluralSuffixToString: string;
begin
  Result := FPowerOfThousandPluralSuffixToString;
end;

function TNumber2StringStaticProperties.GetPowersOfThousandNames: TStringArrayOfTThousandsExponent;
begin
  Result := FPowersOfThousandNames;
end;

function TNumber2StringStaticProperties.GetPrefix1000WithSpace: Boolean;
begin
  Result := FPrefix1000WithSpace;
end;

function TNumber2StringStaticProperties.GetPrefixHundredsWithSpace: Boolean;
begin
  Result := FPrefixHundredsWithSpace;
end;

function TNumber2StringStaticProperties.GetTensNames: TStringArray10;
begin
  Result := FTensNames;
end;

function TNumber2StringStaticProperties.GetUseAndConjunction: Boolean;
begin
  Result := FUseAndConjunction;
end;

function TNumber2StringStaticProperties.GetZeroToString: string;
begin
  Result := FZeroToString;
end;

function TGermanNumber2DecimalString.GetInclude1ForHundreds: Boolean;
begin
  Result := False;
end;

function TGermanNumber2DecimalString.GetNumber2StringStaticProperties: INumber2StringStaticProperties;
var
  LAndConjunctionString: string;
  LHundredToString: string;
  LIncludeUnit1Before1000Powers: Boolean;
  LIncludeUnit1Before1000OnlyIfNotExactly1000: Boolean;
  LMinusToString: string;
  LNumbersNames: TStringArray20;
  LPowerOfThousandPluralSuffixToString: string;
  LPowersOfThousandNames: TStringArrayOfTThousandsExponent;
  LPrefix1000WithSpace: Boolean;
  LPrefixHundredsWithSpace: Boolean;
  LTensNames: TStringArray10;
  LUseAndConjunction: Boolean;
  LZeroToString: string;
  Index: Integer;
begin
  if not Assigned(FNumber2StringStaticProperties) then
  begin
    LAndConjunctionString := 'und';
    LHundredToString := 'hundert';
    LIncludeUnit1Before1000Powers := True;
    LIncludeUnit1Before1000OnlyIfNotExactly1000 := True;
    LMinusToString := 'minus '; // space suffix, becuase NumberNames, etc don't have space prefixes
    LNumbersNames[0] := '';
    LNumbersNames[1] := 'ein';
    LNumbersNames[2] := 'zwei';
    LNumbersNames[3] := 'drei';
    LNumbersNames[4] := 'vier';
    LNumbersNames[5] := 'fünf';
    LNumbersNames[6] := 'sechs';
    LNumbersNames[7] := 'sieben';
    LNumbersNames[8] := 'acht';
    LNumbersNames[9] := 'neun';
    LNumbersNames[10] := 'zehn';
    LNumbersNames[11] := 'elf';
    LNumbersNames[12] := 'zwölf';
    LNumbersNames[13] := 'dreizehn';
    LNumbersNames[14] := 'vierzehn';
    LNumbersNames[15] := 'fünfzehn';
    LNumbersNames[16] := 'sechszehn';
    LNumbersNames[17] := 'siebzehn';
    LNumbersNames[18] := 'achtzehn';
    LNumbersNames[19] := 'neunzehn';
    LPowerOfThousandPluralSuffixToString := '';
    // http://www.jsoftware.com/jwiki/Essays/Number%20in%20Words
    // http://nl.wikipedia.org/wiki/Duizend
    // duizend - miljoen - miljard - biljoen - biljard - triljoen - triljard
    LPowersOfThousandNames[teThousands] := 'tausend';
    LPowersOfThousandNames[teMillions] := 'million';
    LPowersOfThousandNames[teBillions] := 'milliarde';
    LPowersOfThousandNames[teTrillions] := 'billion';
    LPowersOfThousandNames[teQuadrillions] := 'billiarde';
    LPowersOfThousandNames[teQuintillions] := 'trillion';
    LPrefix1000WithSpace := False;
    LPrefixHundredsWithSpace := False;
    LTensNames[0] := '';
    LTensNames[1] := 'zehn';
    LTensNames[2] := 'zwanzig';
    LTensNames[3] := 'dreißig';
    LTensNames[4] := 'vierzig';
    LTensNames[5] := 'fünfzig';
    LTensNames[6] := 'sechzig';
    LTensNames[7] := 'siebzig';
    LTensNames[8] := 'achtzig';
    LTensNames[9] := 'neunzig';
    LUseAndConjunction := True;
    LZeroToString := 'null';

    FNumber2StringStaticProperties := TNumber2StringStaticProperties.Create(
      LAndConjunctionString,
      LHundredToString,
      LIncludeUnit1Before1000Powers,
      LIncludeUnit1Before1000OnlyIfNotExactly1000,
      LMinusToString,
      LNumbersNames,
      LPowerOfThousandPluralSuffixToString,
      LPowersOfThousandNames,
      LPrefix1000WithSpace,
      LPrefixHundredsWithSpace,
      LTensNames,
      LUseAndConjunction,
      LZeroToString
    );
  end;
  Result := FNumber2StringStaticProperties;
end;

function TGermanNumber2DecimalString.GetScaleType: TNumber2StringScale;
begin
  Result := n2ssShort;
end;

procedure TGermanNumber2DecimalString.LessThan1000ToString(const StringBuilder: TStringBuilder; const Number: Int64);
begin
  inherited LessThan1000ToString(StringBuilder, Number);
  if Number = 1 then
    StringBuilder.Append('s'); // 'ein' -> 'eins'
end;

function TGermanNumber2DecimalString.TensAndUnitsToString(const Tens, Units: Int64): string;
var
  TensName: string;
  UnitName: string;
begin
  UnitName := NumbersNames[Units];
  TensName := TensNames[Tens];
  if UnitName <> NullAsStringValue then
    Result := UnitName + CombineWithAndConjunctionStringIfNeeded(TensName)
  else
    Result := TensName;
end;

end.
