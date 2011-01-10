unit AbstractTestNumber2StringUnit;

interface

uses
  Number2StringUnit,
  TestFramework,
  ConcreteCollectionsUnit;

type
  TAbstractTestTNumber2String = class(TTestCase)
  strict private
    FMatches: TInt64StringPairList;
    FNumber2String: INumber2String;
  strict protected
    procedure AddMatch(const Key: Int64; const Value: string); virtual;
    procedure AddMatches; virtual;
    function CreateNumber2String: INumber2String; virtual;
    procedure TestMatches(const Number2String: INumber2String); virtual;
    property Matches: TInt64StringPairList read FMatches;
    property Number2String: INumber2String read FNumber2String;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestNumber2String;
  end;

implementation

uses
  SysUtils;

procedure TAbstractTestTNumber2String.AddMatch(const Key: Int64; const Value: string);
begin
  Matches.Add(TInt64StringPair.Create(Key, Value));
end;

procedure TAbstractTestTNumber2String.AddMatches;
begin
end;

function TAbstractTestTNumber2String.CreateNumber2String: INumber2String;
begin
  Result := nil; //TAbstractNumber2DecimalString.Create();
end;

procedure TAbstractTestTNumber2String.SetUp;
begin
  inherited;
  FNumber2String := CreateNumber2String();
  FMatches := TInt64StringPairList.Create();
  AddMatches();
end;

procedure TAbstractTestTNumber2String.TearDown;
begin
  FMatches.Free;
  FMatches := nil;
  inherited;
end;

procedure TAbstractTestTNumber2String.TestMatches(const Number2String: INumber2String);
var
  Match: TInt64StringPair;
  Result: string;
  Key: Int64;
  Value: string;
begin
  CheckTrue(Assigned(Number2String), 'Null Number2String; cannot test');
  CheckTrue(FMatches.Count > 0, 'Matches.Count must be larger than zero');
  for Match in FMatches do
  begin
    Key := Match.Key;
    Result := Number2String.ToString(Key);
    Value := Match.Value;
    if Result <> Value then // retry for debugging
      Result := Number2String.ToString(Key);
    Self.CheckEquals(Value, Result, Format('Key=%d', [Key]));
  end;
end;

procedure TAbstractTestTNumber2String.TestNumber2String;
begin
  TestMatches(Number2String);
end;

end.
