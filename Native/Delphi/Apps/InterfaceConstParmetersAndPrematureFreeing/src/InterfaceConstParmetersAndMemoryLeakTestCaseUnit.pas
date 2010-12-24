unit InterfaceConstParmetersAndMemoryLeakTestCaseUnit;

interface

uses
  TestFramework,
  InterfaceConstParmetersBaseTestCaseUnit;

type
  TInterfaceConstParmetersAndMemoryLeakTestCase = class(TInterfaceConstParmetersBaseTestCaseUnit)
  published
    procedure Run_Leak_ConstArrayParameter_InlineCreate;
    procedure Run_Leak_ConstParameter_InlineCreate_HardCast;
    procedure Run_Leak_ConstParameter_InlineCreate_NoCast;
    procedure Run_Leak_ValueArrayParameter_InlineCreate;
    procedure Run_Leak_ValueParameter_InlineCreate;
    procedure Run_NoLeak_ConstParameter_Create_LocalVariable;
    procedure Run_NoLeak_ConstParameter_FunctionCreate;
    procedure Run_NoLeak_ConstParameter_InlineCreate_SafeCast;
  end;

implementation

uses
  MyInterfacedObjectUnit;

procedure TInterfaceConstParmetersAndMemoryLeakTestCase.Run_Leak_ConstArrayParameter_InlineCreate;
begin
  ReferToByConstArray([TMyInterfacedObject.Create()]); // does leak
end;

procedure TInterfaceConstParmetersAndMemoryLeakTestCase.Run_Leak_ConstParameter_InlineCreate_HardCast;
begin
  ReferToByConst(IInterface(TMyInterfacedObject.Create())); // does leak; see also QC 71015/RAID 268053
end;

procedure TInterfaceConstParmetersAndMemoryLeakTestCase.Run_Leak_ConstParameter_InlineCreate_NoCast;
begin
  ReferToByConst(TMyInterfacedObject.Create()); // does leak; see also QC 71015/RAID 268053 and QC 75036/RAID 270259
end;

procedure TInterfaceConstParmetersAndMemoryLeakTestCase.Run_Leak_ValueArrayParameter_InlineCreate;
begin
  ReferToByValueArray([TMyInterfacedObject.Create()]); // does not leak
end;

procedure TInterfaceConstParmetersAndMemoryLeakTestCase.Run_Leak_ValueParameter_InlineCreate;
begin
  ReferToByValue(TMyInterfacedObject.Create()); // does not leak
end;

procedure TInterfaceConstParmetersAndMemoryLeakTestCase.Run_NoLeak_ConstParameter_Create_LocalVariable;
var
  Reference: IInterface;
begin
  Reference := TMyInterfacedObject.Create();
  ReferToByConst(Reference); // does not leak; see also QC 75036/RAID 270259
end;

procedure TInterfaceConstParmetersAndMemoryLeakTestCase.Run_NoLeak_ConstParameter_FunctionCreate;
begin
  ReferToByConst(Self.CreateIInterfaceInstance()); // does not leak
end;

procedure TInterfaceConstParmetersAndMemoryLeakTestCase.Run_NoLeak_ConstParameter_InlineCreate_SafeCast;
begin
  ReferToByConst(TMyInterfacedObject.Create() as IInterface); // does not leak; see also QC 71015/RAID 268053
end;

initialization
  TestFramework.RegisterTest(TInterfaceConstParmetersAndMemoryLeakTestCase.Suite);
end.
