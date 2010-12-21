unit TestRomanNumber2StringUnit;

interface

uses
  TestFramework,
  Number2StringUnit,
  SysUtils,
  ConcreteCollectionsUnit,
  AbstractTestNumber2StringUnit;

type
  TestTRomanNumber2String = class(TAbstractTestTNumber2String)
  strict protected
    procedure AddMatches; override;
    function CreateNumber2String: INumber2String; override;
  published
    procedure TestString2Number;
  end;

implementation

procedure TestTRomanNumber2String.AddMatches;
begin
  // http://mathworld.wolfram.com/RomanNumerals.html
  // http://en.wikipedia.org/wiki/Roman_numerals
  AddMatch(0, 'none');
  AddMatch(1, 'I');
  AddMatch(2, 'II');
  AddMatch(3, 'III');
  AddMatch(4, 'IV');
  AddMatch(5, 'V');
  AddMatch(6, 'VI');
  AddMatch(7, 'VII');
  AddMatch(8, 'VIII');
  AddMatch(9, 'IX');
  AddMatch(10, 'X');
  AddMatch(11, 'XI');
  AddMatch(12, 'XII');
  AddMatch(13, 'XIII');
  AddMatch(14, 'XIV');
  AddMatch(15, 'XV');
  AddMatch(16, 'XVI');
  AddMatch(17, 'XVII');
  AddMatch(18, 'XVIII');
  AddMatch(19, 'XIX');
  AddMatch(20, 'XX');
  AddMatch(21, 'XXI');
  AddMatch(25, 'XXV');
  AddMatch(30, 'XXX');
  AddMatch(35, 'XXXV');
  AddMatch(40, 'XL');
  AddMatch(45, 'XLV');
  AddMatch(49, 'XLIX');
  AddMatch(50, 'L');
  AddMatch(60, 'LX');
  AddMatch(69, 'LXIX');
  AddMatch(70, 'LXX');
  AddMatch(76, 'LXXVI');
  AddMatch(80, 'LXXX');
  AddMatch(90, 'XC');
  AddMatch(99, 'XCIX');
  AddMatch(100, 'C');
  AddMatch(110, 'CX');
  AddMatch(150, 'CL');
  AddMatch(200, 'CC');
  AddMatch(300, 'CCC');
  AddMatch(400, 'CD');
  AddMatch(499, 'CDXCIX');
  AddMatch(500, 'D');
  AddMatch(600, 'DC');
  AddMatch(666, 'DCLXVI');
  AddMatch(700, 'DCC');
  AddMatch(800, 'DCCC');
  AddMatch(900, 'CM');
  AddMatch(999, 'CMXCIX');
  AddMatch(1000, 'M');
  AddMatch(1444, 'MCDXLIV');
  AddMatch(1666, 'MDCLXVI');
  AddMatch(1990, 'MCMXC');
  AddMatch(1999, 'MCMXCIX');
  AddMatch(2000, 'MM');
  AddMatch(2001, 'MMI');
  AddMatch(2010, 'MMX');
  AddMatch(2012, 'MMXII');
  AddMatch(2500, 'MMD');
  AddMatch(3000, 'MMM');
  AddMatch(3888, 'MMMDCCCLXXXVIII');
  AddMatch(3999, 'MMMCMXCIX');
  AddMatch(4000, '(I)(V)');
  AddMatch(5000, '(V)');
  AddMatch(6666, '(V)MDCLXVI');
  // 6666 uses M as thousand, not (I)
  AddMatch(10000, '(X)');
  AddMatch(50000, '(L)');
  AddMatch(100000, '(C)');
  AddMatch(500000, '(D)');
  AddMatch(1000000, '(M)');
  AddMatch(1444000, '(M)(C)(D)(X)(L)(I)(V)');
  AddMatch(1666000, '(M)(D)(C)(L)(X)(V)M');
  // note: wikipedia states (M)(D)(C)(L)(X)(V)(I), but (I) should be M to be consistent with 6666
  AddMatch(2000000, '(M)(M)');
  AddMatch(3888000, '(M)(M)(M)(D)(C)(C)(C)(L)(X)(X)(X)(V)MMM');
  // note: (M)(M)(M)(D)(C)(C)(C)(L)(X)(X)(X)(V)(I)(I)(I), but (I) should be M to be consistent with 6666
end;

function TestTRomanNumber2String.CreateNumber2String: INumber2String;
begin
  Result := TNumber2RomanString.Create;
end;

procedure TestTRomanNumber2String.TestString2Number;
var
  Key: Int64;
  Match: TInt64StringPair;
  Number2RomanString: TNumber2RomanString;
  Value: string;
begin
  Number2RomanString := TNumber2RomanString.Create();
  try
    for Match in Matches do
    begin
      Value := Match.Value;
      Key := Number2RomanString.Parse(Value);
      Self.CheckEquals(Match.Key, Key, Format('Value=%s', [Value]));
    end;
  finally
    Number2RomanString.Free;
  end;
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTRomanNumber2String.Suite);
end.


