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
    {$IFDEF CLR}[Test_FreeAndNil]{$ENDIF}
    procedure Test_FreeAndNil;
    {$IFDEF CLR}[Test_FreeMemAndNil]{$ENDIF}
    procedure Test_FreeMemAndNil;
    {$IFDEF CLR}[Test_FreeMemAndNilSized]{$ENDIF}
    procedure Test_FreeMemAndNilSized;
  const
    MemorySize = 20;
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

procedure TFreeAndNilPointerTestCase.Test_FreeAndNil;
var
  Instance: TObject;
begin
  Instance := TObject.Create();
  Self.CheckTrue(Instance <> nil, 'Memory should not nil after an object allocation');
  FreeAndNil(Instance);
  Self.CheckTrue(Instance = nil, 'Memory should be nil after a call to "FreeAndNil"');
end;

procedure TFreeAndNilPointerTestCase.Test_FreeMemAndNil;
var
  Memory: Pointer;
begin
  GetMem(Memory, MemorySize);
  Self.CheckTrue(Memory <> nil, 'Memory should not nil after a memory allocation');
  FreeMemAndNil(Memory);
  Self.CheckTrue(Memory = nil, 'Memory should be nil after a call to "FreeMemAndNil"');
end;

procedure TFreeAndNilPointerTestCase.Test_FreeMemAndNilSized;
var
  Memory: Pointer;
begin
  GetMem(Memory, MemorySize);
  Self.CheckTrue(Memory <> nil, 'Memory should not nil after a memory allocation');
  FreeMemAndNil(Memory, MemorySize);
  Self.CheckTrue(Memory = nil, 'Memory should be nil after a call to "FreeMemAndNil"');
end;

initialization
  RegisterTest('', TFreeAndNilPointerTestCase.Suite);
end.