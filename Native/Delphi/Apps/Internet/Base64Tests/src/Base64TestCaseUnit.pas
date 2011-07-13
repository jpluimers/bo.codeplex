unit Base64TestCaseUnit;

interface

uses
  Classes, SysUtils, TestFrameWork, Generics.Collections;

{
 base64 test vectors: http://tools.ietf.org/html/rfc4648
   BASE64("") = ""
   BASE64("f") = "Zg=="
   BASE64("fo") = "Zm8="
   BASE64("foo") = "Zm9v"
   BASE64("foob") = "Zm9vYg=="
   BASE64("fooba") = "Zm9vYmE="
   BASE64("foobar") = "Zm9vYmFy"
}
const
  Key_ = '';
  Value_ = '';
  Key_f = 'f';
  Value_f = 'Zg==';
  Key_fo = 'fo';
  Value_fo = 'Zm8=';
  Key_foo = 'foo';
  Value_foo = 'Zm9v';
  Key_foob = 'foob';
  Value_foob = 'Zm9vYg==';
  Key_fooba = 'fooba';
  Value_fooba = 'Zm9vYmE=';
  Key_foobar = 'foobar';
  Value_foobar = 'Zm9vYmFy';
// binary test vector
  Key_binary = #1#2#3#4;
  Value_binary = 'AQIDBA==';

type
  TStringStringDictionary = TDictionary<string, string>;
  TBase64TestCase = class(TTestCase)
  strict private
    FBase64VectorsDictionary: TStringStringDictionary;
  strict protected
    procedure DecodeTestOneKey(const ExpectedKey: string); virtual;
    procedure EncodeTestOneKey(const ActualKey: string); virtual;
    property Base64VectorsDictionary: TStringStringDictionary read FBase64VectorsDictionary;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    {$IFDEF CLR}[Test]{$ENDIF}
    procedure Base64_DecodeString_Test_;
    {$IFDEF CLR}[Test]{$ENDIF}
    procedure Base64_DecodeString_Test_binary;
    {$IFDEF CLR}[Test]{$ENDIF}
    procedure Base64_DecodeString_Test_f;
    {$IFDEF CLR}[Test]{$ENDIF}
    procedure Base64_DecodeString_Test_fo;
    {$IFDEF CLR}[Test]{$ENDIF}
    procedure Base64_DecodeString_Test_foo;
    {$IFDEF CLR}[Test]{$ENDIF}
    procedure Base64_DecodeString_Test_foob;
    {$IFDEF CLR}[Test]{$ENDIF}
    procedure Base64_DecodeString_Test_fooba;
    {$IFDEF CLR}[Test]{$ENDIF}
    procedure Base64_DecodeString_Test_foobar;
    {$IFDEF CLR}[Test]{$ENDIF}
    procedure Base64_EncodeString_Test_;
    {$IFDEF CLR}[Test]{$ENDIF}
    procedure Base64_EncodeString_Test_binary;
    {$IFDEF CLR}[Test]{$ENDIF}
    procedure Base64_EncodeString_Test_f;
    {$IFDEF CLR}[Test]{$ENDIF}
    procedure Base64_EncodeString_Test_fo;
    {$IFDEF CLR}[Test]{$ENDIF}
    procedure Base64_EncodeString_Test_foo;
    {$IFDEF CLR}[Test]{$ENDIF}
    procedure Base64_EncodeString_Test_foob;
    {$IFDEF CLR}[Test]{$ENDIF}
    procedure Base64_EncodeString_Test_fooba;
    {$IFDEF CLR}[Test]{$ENDIF}
    procedure Base64_EncodeString_Test_foobar;
  end;

implementation

uses
  EncdDecd;

procedure TBase64TestCase.Base64_DecodeString_Test_;
begin
  DecodeTestOneKey(Key_);
end;

procedure TBase64TestCase.Base64_DecodeString_Test_binary;
begin
  DecodeTestOneKey(Key_binary);
end;

procedure TBase64TestCase.Base64_DecodeString_Test_f;
begin
  DecodeTestOneKey(Key_f);
end;

procedure TBase64TestCase.Base64_DecodeString_Test_fo;
begin
  DecodeTestOneKey(Key_fo);
end;

procedure TBase64TestCase.Base64_DecodeString_Test_foo;
begin
  DecodeTestOneKey(Key_foo);
end;

procedure TBase64TestCase.Base64_DecodeString_Test_foob;
begin
  DecodeTestOneKey(Key_foob);
end;

procedure TBase64TestCase.Base64_DecodeString_Test_fooba;
begin
  DecodeTestOneKey(Key_fooba);
end;

procedure TBase64TestCase.Base64_DecodeString_Test_foobar;
begin
  DecodeTestOneKey(Key_foobar);
end;

procedure TBase64TestCase.SetUp;
begin
  FBase64VectorsDictionary := TStringStringDictionary.Create();
  FBase64VectorsDictionary.Add(Key_, Value_);
  FBase64VectorsDictionary.Add(Key_f, Value_f);
  FBase64VectorsDictionary.Add(Key_fo, Value_fo);
  FBase64VectorsDictionary.Add(Key_foo, Value_foo);
  FBase64VectorsDictionary.Add(Key_foob, Value_foob);
  FBase64VectorsDictionary.Add(Key_fooba, Value_fooba);
  FBase64VectorsDictionary.Add(Key_foobar, Value_foobar);
  FBase64VectorsDictionary.Add(Key_binary, Value_binary);
end;

procedure TBase64TestCase.TearDown;
begin
  FBase64VectorsDictionary.Free();
  FBase64VectorsDictionary := nil;
end;

procedure TBase64TestCase.Base64_EncodeString_Test_;
begin
  EncodeTestOneKey(Key_);
end;

procedure TBase64TestCase.Base64_EncodeString_Test_binary;
begin
  EncodeTestOneKey(Key_binary);
end;

procedure TBase64TestCase.Base64_EncodeString_Test_f;
begin
  EncodeTestOneKey(Key_f);
end;

procedure TBase64TestCase.Base64_EncodeString_Test_fo;
begin
  EncodeTestOneKey(Key_fo);
end;

procedure TBase64TestCase.Base64_EncodeString_Test_foo;
begin
  EncodeTestOneKey(Key_foo);
end;

procedure TBase64TestCase.Base64_EncodeString_Test_foob;
begin
  EncodeTestOneKey(Key_foob);
end;

procedure TBase64TestCase.Base64_EncodeString_Test_fooba;
begin
  EncodeTestOneKey(Key_fooba);
end;

procedure TBase64TestCase.Base64_EncodeString_Test_foobar;
begin
  EncodeTestOneKey(Key_foobar);
end;

procedure TBase64TestCase.DecodeTestOneKey(const ExpectedKey: string);
var
  ActualKey: string;
  ExpectedValue: string;
begin
  ExpectedValue := FBase64VectorsDictionary[ExpectedKey];
  ActualKey := DecodeString(ExpectedValue);
  Self.CheckEquals(ExpectedKey, ActualKey, Format('base64 decode of "%s" should be "%s"', [ExpectedValue, ExpectedKey]));
end;

procedure TBase64TestCase.EncodeTestOneKey(const ActualKey: string);
var
  ActualValue: string;
  ExpectedValue: string;
begin
  ExpectedValue := FBase64VectorsDictionary[ActualKey];
  ActualValue := EncodeString(ActualKey);
  Self.CheckEquals(ExpectedValue, ActualValue, Format('base64 of "%s" should be "%s"', [ActualKey, ExpectedValue]));
end;

initialization
  RegisterTest('', TBase64TestCase.Suite);
end.
