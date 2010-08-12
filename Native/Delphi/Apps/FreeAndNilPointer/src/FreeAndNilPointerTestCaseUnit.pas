unit FreeAndNilPointerTestCaseUnit;

interface

uses
  Classes, SysUtils, TestFrameWork;

type
  TFreeAndNilPointerTestCase = class(TTestCase)
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    {$IFDEF CLR}[Test]{$ENDIF}
    procedure Test;
  end;

implementation

uses
  FreeAndNilPointerUnit;

procedure TFreeAndNilPointerTestCase.SetUp;
begin
  // Setup
end;

procedure TFreeAndNilPointerTestCase.TearDown;
begin
  // Clean up
end;

procedure TFreeAndNilPointerTestCase.Test;
var
  Memory: Pointer;
begin
  GetMem(Memory, 20);
  FreeMemAndNil(Memory, 20);
  Self.CheckTrue(Memory = nil, 'Memory should be nil after a call to "FreeMemAndNil"');
end;

initialization
  RegisterTest('', TFreeAndNilPointerTestCase.Suite);
end.