unit MD5TestCaseUnit;

//##jpl: some more test cases from http://en.wikipedia.org/wiki/MD5

interface

uses
  Classes, SysUtils, TestFrameWork, MD5BaseCalculatorUnit;

type
  //##jpl: you need to add the "constructor" constraint, otherwise you cannot call the Create constructor.
  TMD5BaseTestCase<T: TMD5BaseCalculator, constructor> = class(TTestCase)
  strict protected
    MD5BaseCalculator: TMD5BaseCalculator;
    procedure Calculate(const Value:string; var MD5Hash: string); overload; virtual;
    procedure Test(const ExpectedMD5Hash, Value: string); overload; virtual;
    procedure VerifyTestResult(const ExpectedMD5Hash, MD5Hash, Description: string); virtual;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  end;

  TMD5FileTestCase<T: TMD5BaseCalculator, constructor> = class(TMD5BaseTestCase<T>)
  strict protected
    procedure Calculate(const Filename:string; var MD5Hash: string); overload; override;
    procedure Test(const RelativeFileName: string); overload; virtual;
  published
    {$IFDEF CLR}[Test]{$ENDIF}
    procedure Test_EmptyFileName; overload;
    {$IFDEF CLR}[Test]{$ENDIF}
    procedure Test_DamnSmallLinuxBootFloppy; overload;
  end;

  TMD5StringTestCase<T: TMD5BaseCalculator, constructor> = class(TMD5BaseTestCase<T>)
  strict protected
    procedure Calculate(const Buffer:string; var MD5Hash: string); overload; override;
  published
    {$IFDEF CLR}[Test]{$ENDIF}
    procedure Test_; overload;
    {$IFDEF CLR}[Test]{$ENDIF}
    procedure Test_12345678901234567890123456789012345678901234567890123456789012345678901234567890; overload;
    {$IFDEF CLR}[Test_a]{$ENDIF}
    procedure Test_a; overload;
    {$IFDEF CLR}[Test]{$ENDIF}
    procedure Test_abc; overload;
    {$IFDEF CLR}[Test]{$ENDIF}
    procedure Test_abcdefghijklmnopqrstuvwxyz; overload;
    {$IFDEF CLR}[Test]{$ENDIF}
    procedure Test_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789; overload;
    {$IFDEF CLR}[Test]{$ENDIF}
    procedure Test_message_digest; overload;
    {$IFDEF CLR}[Test]{$ENDIF}
    procedure Test_The_quick_brown_fox_jumps_over_the_lazy_dog; overload;
    {$IFDEF CLR}[Test]{$ENDIF}
    procedure Test_The_quick_brown_fox_jumps_over_the_lazy_dog_; overload;
  end;

//##jpl: [DCC Error] MD5TestCaseUnit.pas(109): E2506 Method of parameterized type declared in interface section must not use local symbol 'SExpectedHash_d41d8cd98f00b204e9800998ecf8427e_'
const
  S_ = '';
  S_12345678901234567890123456789012 = '12345678901234567890123456789012345678901234567890123456789012345678901234567890';
  S_a = 'a';
  S_abc = 'abc';
  S_abcdefghijklmnopqrstuvwxyz = 'abcdefghijklmnopqrstuvwxyz';
  S_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdef = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  S_message_digest = 'message digest';

  SExpectedHash_d41d8cd98f00b204e9800998ecf8427e_ = 'd41d8cd98f00b204e9800998ecf8427e';
  SExpectedHash_57edf4a22be3c955ac49da2e2107b67a_12345678901234567890123456789012345678901234567890123456789012345678901234567890 = '57edf4a22be3c955ac49da2e2107b67a';
  SExpectedHash_0cc175b9c0f1b6a831c399e269772661_a = '0cc175b9c0f1b6a831c399e269772661';
  SExpectedHash_900150983cd24fb0d6963f7d28e17f72_abc = '900150983cd24fb0d6963f7d28e17f72';
  SExpectedHash_c3fcd3d76192e4007dfb496cca67e13b_abcdefghijklmnopqrstuvwxyz = 'c3fcd3d76192e4007dfb496cca67e13b';
  SExpectedHash_d174ab98d277d9f5a5611c2c9f419d9f_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 = 'd174ab98d277d9f5a5611c2c9f419d9f';
  SExpectedHash_f96b697d7cb7938d525a2f31aaf161d0_message_digest = 'f96b697d7cb7938d525a2f31aaf161d0';

  S_The_quick_brown_fox_jumps_over_the_lazy_dog = 'The quick brown fox jumps over the lazy dog';
  S_The_quick_brown_fox_jumps_over_the_lazy_dog_ = 'The quick brown fox jumps over the lazy dog.';

  SExpectedHash_e4d909c290d0fb1ca068ffaddf22cbd0_The_quick_brown_fox_jumps_over_the_lazy_dog_ = 'e4d909c290d0fb1ca068ffaddf22cbd0';
  SExpectedHash_S9e107d9d372bb6826bd81d3542a419d6_S_The_quick_brown_fox_jumps_over_the_lazy_dog = '9e107d9d372bb6826bd81d3542a419d6';

implementation

uses
  MD5, Variants;


procedure TMD5BaseTestCase<T>.SetUp;
begin
  MD5BaseCalculator := T.Create();
end;

procedure TMD5BaseTestCase<T>.TearDown;
begin
  MD5BaseCalculator.Free;
end;

procedure TMD5BaseTestCase<T>.Calculate(const Value:string; var MD5Hash: string);
begin

end;

procedure TMD5BaseTestCase<T>.Test(const ExpectedMD5Hash, Value: string);
var
  MD5Hash: string;
begin
  Calculate(Value, MD5Hash);
  MD5Hash := LowerCase(MD5Hash); //##jpl: bug - putting a breakpoint here only breaks for TMD5StringTestCase<TMD5BaseCalculator>
  VerifyTestResult(ExpectedMD5Hash, MD5Hash, Value);
end;

procedure TMD5BaseTestCase<T>.VerifyTestResult(const ExpectedMD5Hash, MD5Hash, Description: string);
begin
  Self.CheckEquals(ExpectedMD5Hash, MD5Hash, Format('while calculating MD5 for "%s"', [Description]));
end;


procedure TMD5FileTestCase<T>.Calculate(const Filename:string; var MD5Hash: string);
begin
  MD5BaseCalculator.CalculateFile(Filename, MD5Hash);
end;

procedure TMD5FileTestCase<T>.Test(const RelativeFileName: string);
var
  ExpectedMD5Hash: string;
  BinaryFileName: string;
  Md5FileName: string;
begin
  if RelativeFileName <> NullAsStringValue then
  begin
    // expect these files to exist:
    // ..\data\RelativeFileName
    // ..\data\RelativeFileName.md5.txt
    BinaryFileName := Format('..\data\%s', [RelativeFileName]);
    Md5FileName := Format('%s.md5.txt', [BinaryFileName]);
    with TStreamReader.Create(Md5FileName) do
    try
      ExpectedMD5Hash := LowerCase(ReadToEnd());
      ExpectedMD5Hash := Copy(ExpectedMD5Hash, 1, 32);
    finally
      Free;
    end;
    Test(ExpectedMD5Hash, BinaryFileName);
  end;
end;

procedure TMD5FileTestCase<T>.Test_EmptyFileName;
begin
  Test(S_);
end;

procedure TMD5FileTestCase<T>.Test_DamnSmallLinuxBootFloppy;
begin
  Test('damn-small-linux.bootfloppy.img');
end;

procedure TMD5StringTestCase<T>.Calculate(const Buffer:string; var MD5Hash: string);
begin
  MD5BaseCalculator.CalculateString(Buffer, MD5Hash);
end;

procedure TMD5StringTestCase<T>.Test_;
begin
  Test(SExpectedHash_d41d8cd98f00b204e9800998ecf8427e_, S_);
end;

procedure TMD5StringTestCase<T>.Test_12345678901234567890123456789012345678901234567890123456789012345678901234567890;
begin
  Test(SExpectedHash_57edf4a22be3c955ac49da2e2107b67a_12345678901234567890123456789012345678901234567890123456789012345678901234567890, S_12345678901234567890123456789012);
end;

procedure TMD5StringTestCase<T>.Test_a;
begin
  Test(SExpectedHash_0cc175b9c0f1b6a831c399e269772661_a, S_a);
end;

procedure TMD5StringTestCase<T>.Test_abc;
begin
  Test(SExpectedHash_900150983cd24fb0d6963f7d28e17f72_abc, S_abc);
end;

procedure TMD5StringTestCase<T>.Test_abcdefghijklmnopqrstuvwxyz;
begin
  Test(SExpectedHash_c3fcd3d76192e4007dfb496cca67e13b_abcdefghijklmnopqrstuvwxyz, S_abcdefghijklmnopqrstuvwxyz);
end;

procedure TMD5StringTestCase<T>.Test_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789;
begin
  Test(SExpectedHash_d174ab98d277d9f5a5611c2c9f419d9f_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789, S_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdef);
end;

procedure TMD5StringTestCase<T>.Test_message_digest;
begin
  Test(SExpectedHash_f96b697d7cb7938d525a2f31aaf161d0_message_digest, S_message_digest);
end;

procedure TMD5StringTestCase<T>.Test_The_quick_brown_fox_jumps_over_the_lazy_dog;
begin
  Test(SExpectedHash_S9e107d9d372bb6826bd81d3542a419d6_S_The_quick_brown_fox_jumps_over_the_lazy_dog, S_The_quick_brown_fox_jumps_over_the_lazy_dog);
end;

procedure TMD5StringTestCase<T>.Test_The_quick_brown_fox_jumps_over_the_lazy_dog_;
begin
  Test(SExpectedHash_e4d909c290d0fb1ca068ffaddf22cbd0_The_quick_brown_fox_jumps_over_the_lazy_dog_, S_The_quick_brown_fox_jumps_over_the_lazy_dog_);
end;


initialization
  // should fail:
  RegisterTest('', TMD5StringTestCase<TMD5BaseCalculator>.Suite);
  // should succeed:
  RegisterTest('', TMD5StringTestCase<TMD5Calculator>.Suite);
  RegisterTest('', TMD5StringTestCase<TMessageDigest_5Calculator>.Suite);
  RegisterTest('', TMD5StringTestCase<TIdHashMessageDigest5Calculator>.Suite);
//  RegisterTest('', TMD5StringTestCase<TMD5AndWriterCalculator>.Suite);
  RegisterTest('', TMD5FileTestCase<TMD5Calculator>.Suite);
  RegisterTest('', TMD5FileTestCase<TMessageDigest_5Calculator>.Suite);
  RegisterTest('', TMD5FileTestCase<TIdHashMessageDigest5Calculator>.Suite);
end.
