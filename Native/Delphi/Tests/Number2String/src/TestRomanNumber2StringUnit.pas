unit TestRomanNumber2StringUnit;

interface

uses
  TestFramework,
  Number2StringUnit,
  SysUtils,
  ConcreteCollectionsUnit;

type
  // Test methods for class TRomanNumber2String
  TestTRomanNumber2String = class(TTestCase)
  strict private
    FMatches: TInt64StringPairList;
  strict protected
    procedure AddRomanMatches; virtual;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestNumber2String;
    procedure TestString2Number;
  end;

implementation

procedure TestTRomanNumber2String.SetUp;
begin
  inherited SetUp();
  FMatches := TInt64StringPairList.Create();
end;

procedure TestTRomanNumber2String.TearDown;
begin
  FMatches.Free;
  FMatches := nil;
  inherited TearDown();
end;

procedure TestTRomanNumber2String.TestNumber2String;
var
  Number2RomanString: TNumber2RomanString;

  Match: TInt64StringPair;
  Result: string;
  Key: Int64;
  Value: string;
begin
  Number2RomanString := TNumber2RomanString.Create();
  try
    for Match in FMatches do
    begin
      Key := Match.Key;
      Result := Number2RomanString.ToString(Key);
      Value := Match.Value;
      if Result <> Value then // retry for debugging
        Result := Number2RomanString.ToString(Key);
      Self.CheckEquals(Value, Result, Format('Key=%d', [Key]));
    end;

  finally
    Number2RomanString.Free;
  end;
end;

procedure TestTRomanNumber2String.AddRomanMatches;
begin
  // http://mathworld.wolfram.com/RomanNumerals.html
  // http://en.wikipedia.org/wiki/Roman_numerals
  FMatches.Add(TInt64StringPair.Create(0, 'none'));
  FMatches.Add(TInt64StringPair.Create(1, 'I'));
  FMatches.Add(TInt64StringPair.Create(2, 'II'));
  FMatches.Add(TInt64StringPair.Create(3, 'III'));
  FMatches.Add(TInt64StringPair.Create(4, 'IV'));
  FMatches.Add(TInt64StringPair.Create(5, 'V'));
  FMatches.Add(TInt64StringPair.Create(6, 'VI'));
  FMatches.Add(TInt64StringPair.Create(7, 'VII'));
  FMatches.Add(TInt64StringPair.Create(8, 'VIII'));
  FMatches.Add(TInt64StringPair.Create(9, 'IX'));
  FMatches.Add(TInt64StringPair.Create(10, 'X'));
  FMatches.Add(TInt64StringPair.Create(11, 'XI'));
  FMatches.Add(TInt64StringPair.Create(12, 'XII'));
  FMatches.Add(TInt64StringPair.Create(13, 'XIII'));
  FMatches.Add(TInt64StringPair.Create(14, 'XIV'));
  FMatches.Add(TInt64StringPair.Create(15, 'XV'));
  FMatches.Add(TInt64StringPair.Create(16, 'XVI'));
  FMatches.Add(TInt64StringPair.Create(17, 'XVII'));
  FMatches.Add(TInt64StringPair.Create(18, 'XVIII'));
  FMatches.Add(TInt64StringPair.Create(19, 'XIX'));
  FMatches.Add(TInt64StringPair.Create(20, 'XX'));
  FMatches.Add(TInt64StringPair.Create(21, 'XXI'));
  FMatches.Add(TInt64StringPair.Create(25, 'XXV'));
  FMatches.Add(TInt64StringPair.Create(30, 'XXX'));
  FMatches.Add(TInt64StringPair.Create(35, 'XXXV'));
  FMatches.Add(TInt64StringPair.Create(40, 'XL'));
  FMatches.Add(TInt64StringPair.Create(45, 'XLV'));
  FMatches.Add(TInt64StringPair.Create(49, 'XLIX'));
  FMatches.Add(TInt64StringPair.Create(50, 'L'));
  FMatches.Add(TInt64StringPair.Create(60, 'LX'));
  FMatches.Add(TInt64StringPair.Create(69, 'LXIX'));
  FMatches.Add(TInt64StringPair.Create(70, 'LXX'));
  FMatches.Add(TInt64StringPair.Create(76, 'LXXVI'));
  FMatches.Add(TInt64StringPair.Create(80, 'LXXX'));
  FMatches.Add(TInt64StringPair.Create(90, 'XC'));
  FMatches.Add(TInt64StringPair.Create(99, 'XCIX'));
  FMatches.Add(TInt64StringPair.Create(100, 'C'));
  FMatches.Add(TInt64StringPair.Create(110, 'CX'));
  FMatches.Add(TInt64StringPair.Create(150, 'CL'));
  FMatches.Add(TInt64StringPair.Create(200, 'CC'));
  FMatches.Add(TInt64StringPair.Create(300, 'CCC'));
  FMatches.Add(TInt64StringPair.Create(400, 'CD'));
  FMatches.Add(TInt64StringPair.Create(499, 'CDXCIX'));
  FMatches.Add(TInt64StringPair.Create(500, 'D'));
  FMatches.Add(TInt64StringPair.Create(600, 'DC'));
  FMatches.Add(TInt64StringPair.Create(666, 'DCLXVI'));
  FMatches.Add(TInt64StringPair.Create(700, 'DCC'));
  FMatches.Add(TInt64StringPair.Create(800, 'DCCC'));
  FMatches.Add(TInt64StringPair.Create(900, 'CM'));
  FMatches.Add(TInt64StringPair.Create(999, 'CMXCIX'));
  FMatches.Add(TInt64StringPair.Create(1000, 'M'));
  FMatches.Add(TInt64StringPair.Create(1444, 'MCDXLIV'));
  FMatches.Add(TInt64StringPair.Create(1666, 'MDCLXVI'));
  FMatches.Add(TInt64StringPair.Create(1990, 'MCMXC'));
  FMatches.Add(TInt64StringPair.Create(1999, 'MCMXCIX'));
  FMatches.Add(TInt64StringPair.Create(2000, 'MM'));
  FMatches.Add(TInt64StringPair.Create(2001, 'MMI'));
  FMatches.Add(TInt64StringPair.Create(2010, 'MMX'));
  FMatches.Add(TInt64StringPair.Create(2012, 'MMXII'));
  FMatches.Add(TInt64StringPair.Create(2500, 'MMD'));
  FMatches.Add(TInt64StringPair.Create(3000, 'MMM'));
  FMatches.Add(TInt64StringPair.Create(3888, 'MMMDCCCLXXXVIII'));
  FMatches.Add(TInt64StringPair.Create(3999, 'MMMCMXCIX'));
  FMatches.Add(TInt64StringPair.Create(4000, '(I)(V)'));
  FMatches.Add(TInt64StringPair.Create(5000, '(V)'));
  FMatches.Add(TInt64StringPair.Create(6666, '(V)MDCLXVI'));
  // 6666 uses M as thousand, not (I)
  FMatches.Add(TInt64StringPair.Create(10000, '(X)'));
  FMatches.Add(TInt64StringPair.Create(50000, '(L)'));
  FMatches.Add(TInt64StringPair.Create(100000, '(C)'));
  FMatches.Add(TInt64StringPair.Create(500000, '(D)'));
  FMatches.Add(TInt64StringPair.Create(1000000, '(M)'));
  FMatches.Add(TInt64StringPair.Create(1444000, '(M)(C)(D)(X)(L)(I)(V)'));
  FMatches.Add(TInt64StringPair.Create(1666000, '(M)(D)(C)(L)(X)(V)M'));
  // note: wikipedia states (M)(D)(C)(L)(X)(V)(I), but (I) should be M to be consistent with 6666
  FMatches.Add(TInt64StringPair.Create(2000000, '(M)(M)'));
  FMatches.Add(TInt64StringPair.Create(3888000, '(M)(M)(M)(D)(C)(C)(C)(L)(X)(X)(X)(V)MMM'));
  // note: (M)(M)(M)(D)(C)(C)(C)(L)(X)(X)(X)(V)(I)(I)(I), but (I) should be M to be consistent with 6666
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
    for Match in FMatches do
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


