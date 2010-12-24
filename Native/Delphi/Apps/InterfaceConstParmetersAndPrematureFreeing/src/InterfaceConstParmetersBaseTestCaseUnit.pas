unit InterfaceConstParmetersBaseTestCaseUnit;

interface

uses
  TestFramework;

type
  TInterfaceConstParmetersBaseTestCaseUnit = class(TTestCase)
  strict protected
    function CreateIInterfaceInstance: IInterface;
    procedure ReferToByConst(const ConstReference: IInterface);
    procedure ReferToByConstArray(const ConstReferences: array of IInterface);
    procedure ReferToByValueArray(ConstReferences: array of IInterface);
    procedure ReferToByValue(ValueReference: IInterface);
  protected
    procedure SetUp; override;
  end;

implementation

uses
  MyInterfacedObjectUnit;

function TInterfaceConstParmetersBaseTestCaseUnit.CreateIInterfaceInstance: IInterface;
begin
  Result := TMyInterfacedObject.Create;
end;

procedure TInterfaceConstParmetersBaseTestCaseUnit.ReferToByConst(const ConstReference: IInterface);
begin
  // we have no implicit _AddRef/_Release here because ConstReference: IInterface is a const parameter
  if Assigned(ConstReference) then // even if you actually refer, intentionally there is no extra _AddRef/_Release is added
    ;
end;

procedure TInterfaceConstParmetersBaseTestCaseUnit.ReferToByConstArray(const ConstReferences: array of IInterface);
var
  i: Integer;
begin
  // we have no implicit _AddRef/_Release calls here (through AddRefArray and FinalizeArray) because ConstReferences: IInterface is a const array parameter
  for i := Low(ConstReferences) to High(ConstReferences) do
    if Assigned(ConstReferences[i]) then
      ;
end;

procedure TInterfaceConstParmetersBaseTestCaseUnit.ReferToByValueArray(ConstReferences: array of IInterface);
var
  i: Integer;
begin
  // we have implicit _AddRef/_Release calls here (through AddRefArray and FinalizeArray) because ValueReference: IInterface is a value array parameter
  for i := Low(ConstReferences) to High(ConstReferences) do
    if Assigned(ConstReferences[i]) then
      ;
end;

procedure TInterfaceConstParmetersBaseTestCaseUnit.ReferToByValue(ValueReference: IInterface);
begin
  // we have an implicit _AddRef/_Release here because ValueReference: IInterface is a value parameter
  // (a const parameter would not perform _AddRef/_Release, which is by design)
  if Assigned(ValueReference) then // actually refer; this is needed for Delphi <= 2009 as otherwise it will optimize away the _AddRef/_Relase
    ;
end;

procedure TInterfaceConstParmetersBaseTestCaseUnit.SetUp;
begin
  inherited SetUp();
  FailsOnMemoryLeak := True;
end;

end.
