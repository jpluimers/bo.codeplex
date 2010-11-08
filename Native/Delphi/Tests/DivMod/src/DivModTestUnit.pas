unit DivModTestUnit;

interface

uses
  Classes, SysUtils, TestFrameWork;

type
  TDivModTestCase = class(TTestCase)
  strict protected
    procedure CheckEquals64(expected, actual: Int64; AsHex:boolean = False; msg: string = ''); virtual;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    {$IFDEF CLR}[Test]{$ENDIF}
    procedure Test_IDivMod;
    {$IFDEF CLR}[Test]{$ENDIF}
    procedure Test_I64DivMod;
    {$IFDEF CLR}[Test]{$ENDIF}
    procedure Test_I64LWDivMod;
    {$IFDEF CLR}[Test]{$ENDIF}
    procedure Test_UDivMod;
  end;

implementation

uses
  DivModUnit, Windows;

//--------------------------------------------------------------------------------
// This is the naive approach to IDivMod64, the ASM version should be much faster:
procedure I64DivMod_Naive(const Dividend, Divisor: Int64; var Result, Remainder: Int64);
begin
  Result := Dividend div Divisor;
  Remainder := Dividend mod Divisor;
end; // proc IDivMod64

{ TDivModTestCase }

procedure TDivModTestCase.SetUp;
begin
  // Setup
end;

procedure TDivModTestCase.TearDown;
begin
  // Clean up
end;

//******************************************************************************
// Method Name:      TDivModTestCase.Test_IDivMod
// Input parameters: None
// Exceptions:       ..
// Side effects:     ..
// Conditions:       ..
// Description:      This method tests the global function IDivMod
// Notes:            ..
//******************************************************************************
procedure TDivModTestCase.Test_IDivMod;
var
  i: LongInt;
  procedure CheckIDivMod(const Dividend, Divisor, Result, Remainder: LongInt);
  var
    DivResult, Rest: LongInt;
    dstr: string;
  begin
    dstr := 'IDivMod('+IntToStr(Dividend)+':'+IntToStr(Divisor)+'): ';
    try
      IDivMod(Dividend, Divisor, DivResult, Rest);
      if Divisor=0 then
        Fail('Divisor=0 yet no EDivByZero!');
    except
      on E:Exception do
        if Divisor <> 0 then
          raise Exception.Create(dstr+'Msg='+E.Message)
        else
          Exit; // <= if Divisor=0 then we exit normally, exception seen as expected
    end;
    // continues here only if no exceptions at all:
    CheckEquals(Result, DivResult, dstr+'DivResult ');
    CheckEquals(Remainder, Rest, dstr+'Rest ');
  end;
begin
  CheckIDivMod( 1, 0, 0, 0); // checks for EDivByZero
  CheckIDivMod( 1, 1, 1, 0); // 1/1
  CheckIDivMod( 0, 1, 0, 0); // 0/1
  CheckIDivMod(-1, 1,-1, 0); // negative dividend
  CheckIDivMod( 1,-1,-1, 0); // negative divisor
  CheckIDivMod( 1, 1, 1, 0); // 1/1
  for i := 2 to $FFF do
  begin
    CheckIDivMod( i,  1, i, 0);   // Identity division
    CheckIDivMod( i,i+1, 0, i); // Just-less-than-one
    if i > 3 then
    begin
      CheckIDivMod(i, i-1, 1, 1); // this one fails for i<2
      CheckIDivMod(i, (i div 2), 2, (i mod 2)); // this fails for i<4
      if i > 8 then
        CheckIDivMod(i, (i div 3), 3, (i mod 3)); // this fails for i<9
    end;
  end;
  CheckIDivMod( $7FFFFFFF, $40000000, 1, $3FFFFFFF); // max reach
end; // proc Test_IDivMod

//******************************************************************************
// Method Name:      TDivModTestCase.Test_UDivMod
// Input parameters: None
// Exceptions:       ..
// Side effects:     ..
// Conditions:       ..
// Description:      This method tests the global proc UDivMod
// Notes:            ..
//******************************************************************************
procedure TDivModTestCase.Test_UDivMod;
var
  i: LongWord;
  procedure CheckUDivMod(const Dividend, Divisor, Result, Remainder: LongWord);
  var
    DivResult, Rest: LongWord;
    dstr: string;
  begin
    dstr := 'UDivMod('+IntToStr(Dividend)+':'+IntToStr(Divisor)+'): ';
    try
      UDivMod(Dividend, Divisor, DivResult, Rest);
      if Divisor=0 then
        Fail('Divisor=0 yet no EDivByZero!');
    except
      on E:Exception do
        if Divisor <> 0 then
          raise Exception.Create(dstr+'Msg='+E.Message)
        else
          Exit; // <= if Divisor=0 then we exit normally, exception seen as expected
    end;
    // continues here only if no exceptions at all:
    CheckEquals(Result, DivResult, dstr+'DivResult ');
    CheckEquals(Remainder, Rest, dstr+'Rest ');
  end;
begin
  CheckUDivMod( 1, 0, 0, 0); // checks for EDivByZero
  CheckUDivMod( 1, 1, 1, 0); // 1/1
  CheckUDivMod( 0, 1, 0, 0); // 0/1
  CheckUDivMod( 1, 1, 1, 0); // 1/1
  for i := 2 to $FFF do
  begin
    CheckUDivMod( i,  1, i, 0);   // Identity division
    CheckUDivMod( i,i+1, 0, i); // Just-less-than-one
    if i > 3 then
    begin
      CheckUDivMod(i, i-1, 1, 1); // this one fails for i<2
      CheckUDivMod(i, (i div 2), 2, (i mod 2)); // this fails for i<4
      if i > 8 then
        CheckUDivMod(i, (i div 3), 3, (i mod 3)); // this fails for i<9
    end;
  end;
  CheckUDivMod( $FFFFFFFF, $80000000, 1, $7FFFFFFF); // max reach
end; // proc Test_UDivMod


//******************************************************************************
// Method Name:      TDivModTestCase.CheckEquals64
// Input parameters: expected, actual: Expected and Actual values
//                   AsHex: TRUE  -> Show numbers in failure message in Hex
//                          FALSE -> Show numbers in failure message in Decimal
//                   msg:   Optional description tag for failure message
// Exceptions:       ETestFailure if equality comparison fails
// Side effects:     ..
// Conditions:       ..
// Description:      Performs equality check on two 64-bit integers (extension to DUnit.TTestCase)
// Notes:            ..
//******************************************************************************
procedure TDivModTestCase.CheckEquals64(expected, actual: Int64; AsHex:boolean = False; msg: string = '');
begin
  if (expected <> actual) then
    if AsHex then
      FailNotEquals('0x'+IntToHex(expected,16), '0x'+IntToHex(actual,16), msg, CallerAddr)
    else
      FailNotEquals(IntToStr(expected), IntToStr(actual), msg, CallerAddr);
end; // proc CheckEquals64

//******************************************************************************
// Method Name:      TDivModTestCase.Test_I64DivMod
// Input parameters: None
// Exceptions:       ..
// Side effects:     ..
// Conditions:       ..
// Description:      This method tests the global function IDivMod64
// Notes:            ..
//******************************************************************************
procedure TDivModTestCase.Test_I64DivMod;
var
  i, n1, n2: Int64;
  j: Int32;
  res1, res2, StartTick: LongWord;

  procedure CheckI64DivMod(const Dividend, Divisor, Result, Remainder: Int64; const AsHex: boolean = False);
  var
    DivResult, Rest:Int64;
    dstr: string;
  begin
    if AsHex then // display as many hex digits as needed to fit number:
      dstr := 'I64DivMod(0x'+IntToHex(Dividend, 1)+':0x'+IntToHex(Divisor, 1)+'): '
    else
      dstr := 'I64DivMod('+IntToStr(Dividend)+':'+IntToStr(Divisor)+'): ';
    try
      I64DivMod(Dividend, Divisor, DivResult, Rest);
      if Divisor=0 then
        Fail('Divisor=0 yet no EDivByZero!');
    except
      on E:Exception do
        if Divisor <> 0 then
          raise Exception.Create(dstr+'Msg='+E.Message)
        else
          Exit; // <= if Divisor=0 then we exit normally, exception seen as expected
    end;
    // continues here only if no exceptions at all:
    CheckEquals64(Result, DivResult, AsHex, dstr+'DivResult ');
    CheckEquals64(Remainder, Rest, AsHex, dstr+'Rest ');
  end;

var
  HiWord1: Int64;
begin
  // Standard cases (same as in Test_IDivMod):
  CheckI64DivMod( 1, 0, 0, 0); // checks for EDivByZero
  CheckI64DivMod( 1, 1, 1, 0); // 1/1
  CheckI64DivMod( 0, 1, 0, 0); // 0/1
  CheckI64DivMod(-1, 1,-1, 0); // negative dividend
  CheckI64DivMod( 1,-1,-1, 0); // negative divisor
  CheckI64DivMod( 1, 1, 1, 0); // 1/1
  // Standard Int32 battery of tests (same as in Test_IDivMod):
  for j := 2 to $FFF do
  begin
    i := j; // cannot use Int64 as loop variable
    CheckI64DivMod( i,  1, i, 0);   // Identity division
    CheckI64DivMod( i,i+1, 0, i); // Just-less-than-one
    if i > 3 then
    begin
      CheckI64DivMod(i, i-1, 1, 1); // this one fails for i<2
      CheckI64DivMod(i, (i div 2), 2, (i mod 2)); // this fails for i<4
      if i > 8 then
        CheckI64DivMod(i, (i div 3), 3, (i mod 3)); // this fails for i<9
    end;
  end;
  // cases with high 32-bits <> 0
  HiWord1 := $100000000;
  CheckI64DivMod( HiWord1,       0, 0, 0); // checks for EDivByZero
  CheckI64DivMod( HiWord1, HiWord1, 1, 0); // 1/1
  CheckI64DivMod(       0, HiWord1, 0, 0); // 0/1
  CheckI64DivMod(-HiWord1, HiWord1,-1, 0); // negative dividend
  CheckI64DivMod( HiWord1,-HiWord1,-1, 0); // negative divisor
  CheckI64DivMod( HiWord1, HiWord1, 1, 0); // 1/1

  CheckI64DivMod( HiWord1, 0,       0, 0); // checks for EDivByZero
  CheckI64DivMod( HiWord1, 1, HiWord1, 0); // 1/1
  CheckI64DivMod(-HiWord1, 1,-HiWord1, 0); // negative dividend
  CheckI64DivMod( HiWord1,-1,-HiWord1, 0); // negative divisor
  CheckI64DivMod( HiWord1, 1, HiWord1, 0); // 1/1

  CheckI64DivMod( $7FFFFFFF, $40000000, 1, $3FFFFFFF, True); // max Int32 reach
  // Specially for Int64 case:
  CheckI64DivMod( 160000000015,             2,  80000000007,  1 );
  CheckI64DivMod( -160000000015, -80000000008,  1, -80000000007 );
  CheckI64DivMod( 480000000060,  -80000000008, -6,  12 );
  // Max Int64 reach:
  CheckI64DivMod( $7FFFFFFFFFFFFFFF, $4000000000000000,  1, $3FFFFFFFFFFFFFFF , True); // Max +ve
  CheckI64DivMod( $7FFFFFFFFFFFFFFF, 1,  $7FFFFFFFFFFFFFFF, 0 , True);
  CheckI64DivMod( $7FFFFFFFFFFFFFFF, $8000000000000000,  0, $7FFFFFFFFFFFFFFF , True);
  CheckI64DivMod( $7FFFFFFFFFFFFFFF, Int64($C000000000000000), -1, $3FFFFFFFFFFFFFFF , True);
  CheckI64DivMod( Int64($8000000000000000), $4000000000000000, -2, 0 , True); // Max -ve
  CheckI64DivMod( Int64($FFFFFFFFFFFFFFFF), $7FFFFFFFFFFFFFFF,  0, Int64($FFFFFFFFFFFFFFFF), True); // -1:<Max+>

  //-------------------------------------------
  // Performance Comparison vs I64DivMod_Naive:
  //-------------------------------------------

  StartTick := GetTickCount;
  for j := 1 to 100000 do
  begin
    i := j;
    I64DivMod( 100000*i, 5, n1, n2);
    I64DivMod(-100000*i, 5, n1, n2);
    I64DivMod( Int64($FFFFFFFFFFFFFFFF), $7FFFFFFFFFFFFFFF, n1, n2);
    I64DivMod( -160000000015, -80000000008, n1, n2 );
  end;
  Res1 := GetTickCount - StartTick;

  Sleep(5);

  StartTick := GetTickCount;
  for j := 1 to 100000 do
  begin
    i := j;
    I64DivMod_Naive( 100000*i, 5, n1, n2);
    I64DivMod_Naive(-100000*i, 5, n1, n2);
    I64DivMod_Naive( Int64($FFFFFFFFFFFFFFFF), $7FFFFFFFFFFFFFFF, n1, n2);
    I64DivMod_Naive( -160000000015, -80000000008, n1, n2 );
  end;
  Res2 := GetTickCount - StartTick;

  Check( Res2 >= Res1, 'I64DivMod NOT faster than I64DivMod_Naive: '
             + IntToStr(Res1)+' vs '+IntToStr(Res2));

end; // proc Test_I64DivMod

//******************************************************************************
// Method Name:      TDivModTestCase.Test_I64LWDivMod
// Input parameters: None
// Exceptions:       ..
// Side effects:     ..
// Conditions:       ..
// Description:      This method tests the global function IDivMod64
// Notes:            ..
//******************************************************************************
procedure TDivModTestCase.Test_I64LWDivMod;
var
  i, n1, n2: Int64;
  j: Int32;
  res1, res2, StartTick: LongWord;

  procedure CheckI64LWDivMod(const Dividend: Int64; const Divisor: LongWord; const Result, Remainder: Int64; const AsHex: boolean = False);
  var
    DivResult, Rest: Int64;
    dstr: string;
  begin
    if AsHex then // display as many hex digits as needed to fit number:
      dstr := 'I64LWDivMod(0x'+IntToHex(Dividend, 1)+':0x'+IntToHex(Divisor, 1)+'): '
    else
      dstr := 'I64LWDivMod('+IntToStr(Dividend)+':'+IntToStr(Divisor)+'): ';
    try
      I64LWDivMod(Dividend, Divisor, DivResult, Rest);
      if Divisor = 0 then
        Fail('Divisor=0 yet no EDivByZero!');
    except
      on E:Exception do
        if Divisor <> 0 then
          raise Exception.Create(dstr+'Msg='+E.Message)
        else
          Exit; // <= if Divisor=0 then we exit normally, exception seen as expected
    end;
    // continues here only if no exceptions at all:
    CheckEquals64(Result, DivResult, AsHex, dstr+'DivResult ');
    CheckEquals64(Remainder, Rest, AsHex, dstr+'Rest ');
  end;

var
  HiWord1: Int64;
begin
  // Standard cases (same as in Test_IDivMod):
  CheckI64LWDivMod( 1, 0, 0, 0); // checks for EDivByZero
  CheckI64LWDivMod( 1, 1, 1, 0); // 1/1
  CheckI64LWDivMod( 0, 1, 0, 0); // 0/1
  CheckI64LWDivMod(-1, 1,-1, 0); // negative dividend
//  CheckI64LWDivMod( 1,-1,-1, 0); // negative divisor
  CheckI64LWDivMod( 1, 1, 1, 0); // 1/1
  // Standard Int32 battery of tests (same as in Test_IDivMod):
  for j := 2 to $FFF do
  begin
    i := j; // cannot use Int64 as loop variable
    CheckI64LWDivMod( i,  1, i, 0);   // Identity division
    CheckI64LWDivMod( i,i+1, 0, i); // Just-less-than-one
    if i > 3 then
    begin
      CheckI64LWDivMod(i, i-1, 1, 1); // this one fails for i<2
      CheckI64LWDivMod(i, (i div 2), 2, (i mod 2)); // this fails for i<4
      if i > 8 then
        CheckI64LWDivMod(i, (i div 3), 3, (i mod 3)); // this fails for i<9
    end;
  end;
  // cases with high 32-bits <> 0
  HiWord1 := $100000000;
  CheckI64LWDivMod( HiWord1, 0,       0, 0); // checks for EDivByZero
  CheckI64LWDivMod( HiWord1, 1, HiWord1, 0); // 1/1
  CheckI64LWDivMod(-HiWord1, 1,-HiWord1, 0); // negative dividend
//  CheckI64LWDivMod( HiWord1,-1,-HiWord1, 0); // negative divisor
  CheckI64LWDivMod( HiWord1, 1, HiWord1, 0); // 1/1

  CheckI64LWDivMod( $7FFFFFFF, $40000000, 1, $3FFFFFFF, True); // max Int32 reach
  // Specially for Int64 case:
  CheckI64LWDivMod(  160000000015,   2,   80000000007, 1 );
  CheckI64LWDivMod( -160000000015,   2,  -80000000007,-1 );
  CheckI64LWDivMod(  480000000060, 400,    1200000000, 60);
  // Max Int64 reach:
  CheckI64LWDivMod( $7FFFFFFFFFFFFFFF, $40000000,  $1FFFFFFFF, $3FFFFFFF, True); // Max +ve
  CheckI64LWDivMod( $7FFFFFFFFFFFFFFF, 1,  $7FFFFFFFFFFFFFFF, 0, True);
  CheckI64LWDivMod( $7FFFFFFFFFFFFFFF, LongWord($80000000), $FFFFFFFF, $7FFFFFFF, True);
  CheckI64LWDivMod( $7FFFFFFFFFFFFFFF, LongWord($C0000000), $AAAAAAAA, $7FFFFFFF, True);
  CheckI64LWDivMod( Int64($8000000000000000), $40000000, Int64($FFFFFFFE00000000), 0, True); // Max -ve
  CheckI64LWDivMod( Int64($FFFFFFFFFFFFFFFF), $7FFFFFFF,  0, Int64($FFFFFFFFFFFFFFFF), True); // -1:<Max+>

  //-------------------------------------------
  // Performance Comparison vs I64DivMod_Naive:
  //-------------------------------------------

  StartTick := GetTickCount;
  for j := 1 to 100000 do
  begin
    i := j;
    I64LWDivMod( 100000*i, 5, n1, n2);
    I64LWDivMod(-100000*i, 5, n1, n2);
    I64LWDivMod( Int64($FFFFFFFFFFFFFFFF), $7FFFFFFF, n1, n2);
    I64LWDivMod( -160000000015, 8000008, n1, n2 );
  end;
  Res1 := GetTickCount - StartTick;

  Sleep(5);

  StartTick := GetTickCount;
  for j := 1 to 100000 do
  begin
    i := j;
    I64DivMod_Naive( 100000*i, 5, n1, n2);
    I64DivMod_Naive(-100000*i, 5, n1, n2);
    I64DivMod_Naive( Int64($FFFFFFFFFFFFFFFF), $7FFFFFFF, n1, n2);
    I64DivMod_Naive( -160000000015, 8000008, n1, n2 );
  end;
  Res2 := GetTickCount - StartTick;

  Check( Res2 >= Res1, 'I64LWDivMod NOT faster than I64DivMod_Naive: '
             + IntToStr(Res1)+' vs '+IntToStr(Res2));

end; // proc Test_I64LWDivMod


initialization
  RegisterTest('', TDivModTestCase.Suite);
end.