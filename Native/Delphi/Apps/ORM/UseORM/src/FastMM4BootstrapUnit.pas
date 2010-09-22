{$I Defines.inc}
{$Include ..\..\..\..\..\..\Forks\FastMM\FastMM4Options.inc}
{.define EnhanceFastMM}

unit FastMM4BootstrapUnit;

interface

{.$define MaskIndyGThreadCount}
{$define MaskIndyGStackCriticalSection}

{$IFDEF FastMM}
uses
  FastMM4
{$ifdef MaskIndyGStackCriticalSection}
  ,IdStack
{$endif MaskIndyGStackCriticalSection}
{$ifdef MaskIndyGThreadCount}
  ,IdThread
{$endif MaskIndyGThreadCount}
  ;
{$ENDIF FastMM}

procedure FastMM4Bootstrap;

implementation

uses
  SysUtils,
{$ifdef MaskIndyGStackCriticalSection}
  IdGlobal,
{$endif MaskIndyGStackCriticalSection}
  Classes;

procedure FastMM4Bootstrap;
begin
{$IFDEF FastMM}
  ReportMemoryLeaksOnShutdown := true;
{$ifdef MaskIndyGThreadCount}
  RegisterExpectedMemoryLeak(IdThread.GThreadCount);
{$endif MaskIndyGThreadCount}
{$ENDIF FastMM}
end;

{$IFDEF FastMM}
{$ifdef MaskIndyGStackCriticalSection}
var
  GSocketListClassPointer: Pointer;
  GStackCriticalSectionPointer: Pointer;
  GStackCriticalSection: ^TIdCriticalSection;
{$endif MaskIndyGStackCriticalSection}

{$ifdef FullDebugMode}
{$ifdef EnhanceFastMM}
function BlockContains(const AFullDebugBlockHeader: PFullDebugBlockHeader; const APointer: Cardinal): Boolean; overload;
var
  Start: Cardinal;
  Finish: Cardinal;
begin
  Start := Cardinal(AFullDebugBlockHeader);
  Finish := Start + AFullDebugBlockHeader.UserSize + SizeOf(TFullDebugBlockHeader);
  Result := APointer >= Start;
  if Result then
    Result := Result and (APointer < Finish);
end;

function BlockContains(const AFullDebugBlockHeader: PFullDebugBlockHeader; const APointer: Pointer): Boolean; overload;
begin
  try
    Result := BlockContains(AFullDebugBlockHeader, Cardinal(APointer));
  except
    Result := False;
  end;
end;

function MatchesAllocationNumber(const AFullDebugBlockHeader: PFullDebugBlockHeader; const AAllocationNumberToTrack: Cardinal): Boolean; overload;
begin
  Result := False;
  if AAllocationNumberToTrack <> 0 then
    Result := AFullDebugBlockHeader.AllocationNumber = AAllocationNumberToTrack;
end;

function GetImplementorOfInterface(const I: Pointer): TObject;
// ##jpl: Borrowed from JCL, Original code by Hallvard Vassbotn, changed to use Pointer and try/except to avoid AV's when you do not actually pass an IInterface reference
const
  AddByte = $04244483; // opcode for ADD DWORD PTR [ESP+4], Shortint
  AddLong = $04244481; // opcode for ADD DWORD PTR [ESP+4], Longint
type
  PAdjustSelfThunk = ^TAdjustSelfThunk;
  TAdjustSelfThunk = packed record
    case AddInstruction: Longint of
      AddByte: (AdjustmentByte: ShortInt);
      AddLong: (AdjustmentLong: Longint);
  end;
  PInterfaceMT = ^TInterfaceMT;
  TInterfaceMT = packed record
    QueryInterfaceThunk: PAdjustSelfThunk;
  end;
  TInterfaceRef = ^PInterfaceMT;
var
  QueryInterfaceThunk: PAdjustSelfThunk;
begin
  try
    Result := Pointer(I);
    if Assigned(Result) then
    begin
      QueryInterfaceThunk := TInterfaceRef(I)^.QueryInterfaceThunk;
      try
        case QueryInterfaceThunk.AddInstruction of
          AddByte:
            Inc(PByte(Result), QueryInterfaceThunk.AdjustmentByte);
          AddLong:
            Inc(PByte(Result), QueryInterfaceThunk.AdjustmentLong);
        else
          Result := nil;
        end;
      except
        Result := nil;
      end;
    end;
  except
    Result := nil;
  end;
end;

//--------------------------------------------------------------------------------------------------
const
  // for both values: 0 or $0 means skip.
  AllocationNumberToTrack = 0;
  InterfaceInstanceToTrack: Pointer = Pointer($0); // ($7FF9BB98); // ($0); // ($7FF9ABB4);
{
InterfaceInstanceToTrack is for tracking messages like this:

---------------------------
ActiveMQDemoServerProject.exe: Memory Error Detected
---------------------------
FastMM has detected an attempt to use an interface of a freed object. An access violation will now be raised in order to abort the current operation.‚

EAX (VMT) was 0x54C7C8
EDX (interface instance) was 0x7FF9BB98
object instance cannot be determined (yet?)

The current thread ID is 0xF44, and the stack trace (return addresses) leading to this error is:
4087BF
4BF036
4BF621
4BF8FD
4BF5C7
53CC89
53C94C
53CA92
53CAB3
487DB9
48BD54

---------------------------
OK
---------------------------
}

var
  InstanceClassName: string; // of the InterfaceInstanceToTrack
  InstanceName: string; // of the InterfaceInstanceToTrack
//--------------------------------------------------------------------------------------------------

procedure DetermineInstanceClassName;
var
  InterfaceInstance: Pointer;
  ObjectInstance: TObject;
begin
  InterfaceInstance := InterfaceInstanceToTrack;
  ObjectInstance := GetImplementorOfInterface(InterfaceInstance);
  if Assigned(ObjectInstance) then
  begin
    try
      InstanceClassName := ObjectInstance.ClassName;
    except
      on E: Exception do
        InstanceClassName := E.Message;
    end;
    try
      if ObjectInstance is TComponent then
        InstanceName := TComponent(ObjectInstance).Name;
    except
      on E: Exception do
        InstanceName := E.Message;
    end;
  end;
end;

procedure DebugBreak;
asm
  int 3
end;

procedure MyOnDebugGetMemFinish(const AAllocatedFullDebugBlockHeader: PFullDebugBlockHeader; const ASize: Integer);
begin
  if MatchesAllocationNumber(AAllocatedFullDebugBlockHeader, AllocationNumberToTrack) then
    DebugBreak;
  if BlockContains(AAllocatedFullDebugBlockHeader, InterfaceInstanceToTrack) then
  begin
    DetermineInstanceClassName;
    DebugBreak;
  end;
end;

procedure MyOnDebugFreeMemStart(const AToFreeFullDebugBlockHeader: PFullDebugBlockHeader);
begin
  if MatchesAllocationNumber(AToFreeFullDebugBlockHeader, AllocationNumberToTrack) then
    DebugBreak;
  if BlockContains(AToFreeFullDebugBlockHeader, InterfaceInstanceToTrack) then
  begin
    DetermineInstanceClassName;
    DebugBreak;
  end;
end;

procedure MyOnDebugFreeMemFinish(const AFreedFullDebugBlockHeader: PFullDebugBlockHeader; const AResult: Integer);
begin
  if MatchesAllocationNumber(AFreedFullDebugBlockHeader, AllocationNumberToTrack) then
    DebugBreak;
  if BlockContains(AFreedFullDebugBlockHeader, InterfaceInstanceToTrack) then
  begin
    DetermineInstanceClassName;
    DebugBreak;
  end;
end;

procedure MyOnDebugReallocMemStart(const AToReallocateFullDebugBlockHeader: PFullDebugBlockHeader; const ANewSize: Integer);
begin
end;

procedure MyOnDebugReallocMemFinish(const AReallocatedFullDebugBlockHeader: PFullDebugBlockHeader; const ANewSize: Integer);
begin
end;
{$endif EnhanceFastMM}
{$endif FullDebugMode}

initialization
{$ifdef FullDebugMode}
{$ifdef EnhanceFastMM}
  OnDebugGetMemFinish := MyOnDebugGetMemFinish;
  OnDebugFreeMemStart := MyOnDebugFreeMemStart;
  OnDebugFreeMemFinish := MyOnDebugFreeMemFinish;
  OnDebugReallocMemStart := MyOnDebugReallocMemStart;
  OnDebugReallocMemFinish := MyOnDebugReallocMemFinish;
{$endif EnhanceFastMM}
{$endif FullDebugMode}

finalization
{$ifdef MaskIndyGThreadCount}
  SysUtils.FreeAndNil(GThreadCount);
{$endif MaskIndyGThreadCount}
{$ifdef MaskIndyGStackCriticalSection}
  GSocketListClassPointer := @GSocketListClass;
  GStackCriticalSectionPointer := Pointer(Cardinal(GSocketListClassPointer) + 8);
  GStackCriticalSection := GStackCriticalSectionPointer;
  SysUtils.FreeAndNil(GStackCriticalSection^);
{$endif MaskIndyGStackCriticalSection}
{$ENDIF FastMM}
end.

