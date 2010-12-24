unit InterfaceConstParmetersAndPrematureFreeingTestCaseUnit;

interface

uses
  TestFrameWork, InterfaceConstParmetersBaseTestCaseUnit;

type
  TInterfaceConstParmetersAndPrematureFreeingTestCase = class(TInterfaceConstParmetersBaseTestCaseUnit)
  strict protected
    procedure NoPrematureFree(Reference: IInterface);
    procedure PrematureFree_Crash(const Reference: IInterface);
  published
    procedure Run_NoPrematureFree_Create_WithLocalVar;
    procedure Run_NoPrematureFree_FunctionCreate;
    procedure Run_NoPrematureFree_InlineCreate_NoCast;
    procedure Run_NoPrematureFree_InlineCreate_SafeCast;
    procedure Run_PrematureFree_Crash_InlineCreate_HardCast;
    procedure Run_PrematureFree_Crash_InlineCreate_NoCast;
    procedure Run_PrematureFree_Create_WithFunction;
    procedure Run_PrematureFree_InlineCreate;
  end;

implementation

uses
  MyInterfacedObjectUnit;

procedure TInterfaceConstParmetersAndPrematureFreeingTestCase.NoPrematureFree(Reference: IInterface);
begin
  ReferToByValue(Reference); // now we do not premature free because the non-const parameter has an implicit reference count
  ReferToByValue(Reference); // so we do not crash here
end;

procedure TInterfaceConstParmetersAndPrematureFreeingTestCase.PrematureFree_Crash(const Reference: IInterface);
begin
  ReferToByValue(Reference); // now we might premature free because the caller does not keep a reference to us
  ReferToByValue(Reference); // if it got freed, we might crash inside ReferToByValue
end;

procedure TInterfaceConstParmetersAndPrematureFreeingTestCase.Run_NoPrematureFree_Create_WithLocalVar;
var
  Reference: IInterface;
begin
  Reference := TMyInterfacedObject.Create; // no premature free; see also QC 31164
  NoPrematureFree(Reference);
end;

procedure TInterfaceConstParmetersAndPrematureFreeingTestCase.Run_NoPrematureFree_FunctionCreate;
begin
  NoPrematureFree(CreateIInterfaceInstance);
end;

procedure TInterfaceConstParmetersAndPrematureFreeingTestCase.Run_NoPrematureFree_InlineCreate_NoCast;
begin
  NoPrematureFree(TMyInterfacedObject.Create());
end;

procedure TInterfaceConstParmetersAndPrematureFreeingTestCase.Run_NoPrematureFree_InlineCreate_SafeCast;
begin
  NoPrematureFree(TMyInterfacedObject.Create() as IInterface);
end;

procedure TInterfaceConstParmetersAndPrematureFreeingTestCase.Run_PrematureFree_Crash_InlineCreate_HardCast;
begin
  // this will crash inside PrematureFreeCrash because there is no temporary
  // reference kept here to the parameter as TInterfacedObject.Create
  // and since PrematureFreeCrash has a const Reference: IInterface parameter,
  // PrematureFreeCrash will not perform reference counting either.
  // Inside PrematureFreeCrash, the first call to ReferTo will _AddRef and _Release
  // the ValueReference: IInterface parameter
  // the _Release will decrement the RefCount of the TInterfacedObject instance
  // to zero, and free it.
  // Then the second call to ReferTo now points to an object that has been freed.
  // Depending on the memory manager settings, it will either fail immediately
  // on calling _AddRef, or it will fail when calling _Release (as it tries to
  // re-Destroy the same object for the second time).
  PrematureFree_Crash(IInterface(TMyInterfacedObject.Create()));
end;

procedure TInterfaceConstParmetersAndPrematureFreeingTestCase.Run_PrematureFree_Crash_InlineCreate_NoCast;
begin
  // this will crash inside PrematureFreeCrash because there is no temporary
  // reference kept here to the parameter as TInterfacedObject.Create
  // and since PrematureFreeCrash has a const Reference: IInterface parameter,
  // PrematureFreeCrash will not perform reference counting either.
  // Inside PrematureFreeCrash, the first call to ReferTo will _AddRef and _Release
  // the ValueReference: IInterface parameter
  // the _Release will decrement the RefCount of the TInterfacedObject instance
  // to zero, and free it.
  // Then the second call to ReferTo now points to an object that has been freed.
  // Depending on the memory manager settings, it will either fail immediately
  // on calling _AddRef, or it will fail when calling _Release (as it tries to
  // re-Destroy the same object for the second time).
  PrematureFree_Crash(TMyInterfacedObject.Create());
end;

procedure TInterfaceConstParmetersAndPrematureFreeingTestCase.Run_PrematureFree_Create_WithFunction;
begin
  PrematureFree_Crash(CreateIInterfaceInstance);
end;

procedure TInterfaceConstParmetersAndPrematureFreeingTestCase.Run_PrematureFree_InlineCreate;
begin
  PrematureFree_Crash(TMyInterfacedObject.Create()); // crash because of premature free; see also QC 31164
end;

initialization
  TestFramework.RegisterTest(TInterfaceConstParmetersAndPrematureFreeingTestCase.Suite);
end.
