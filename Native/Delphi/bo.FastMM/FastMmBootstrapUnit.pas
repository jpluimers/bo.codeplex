// if you want to enable FastMM, use this unit as the first one in your project

// note you also need something like this in your postbuild event:
// copy /y "..\..\FastMM\UnderConstruction\FullDebugMode DLL\Precompiled\FastMM_FullDebugMode.dll"  $(OUTPUTDIR)

unit FastMmBootstrapUnit;

interface

{$Include ..\..\FastMM\UnderConstruction\FastMM4Options.inc}

{$IFDEF FastMM}
uses
  FastMM4,
  IdStack,
  IdThread;
{$ENDIF FastMM}

type
  TMethod = procedure;

procedure Main(const Method: TMethod);

implementation

uses
  SysUtils, IdGlobal, Classes, Windows;

procedure Main(const Method: TMethod);
begin
{$IFDEF FastMM}
  ReportMemoryLeaksOnShutdown := true;
  RegisterExpectedMemoryLeak(IdThread.GThreadCount);
{$ENDIF FastMM}
  Method();
end;

{$IFDEF FastMM}
var
  GSocketListClassPointer: Pointer;
  GStackCriticalSectionPointer: Pointer;
  GStackCriticalSection: ^TIdCriticalSection;

{$IFDEF FullDebugMode}

function BlockContains(const AFullDebugBlockHeader: PFullDebugBlockHeader; const APointer: Cardinal): Boolean; overload;
var
  Start: Cardinal;
  Finish: Cardinal;
begin
  Start := Cardinal(AFullDebugBlockHeader);
  try
     Finish := Start + AFullDebugBlockHeader.UserSize + SizeOf(TFullDebugBlockHeader);
  except
     Finish := Start + SizeOf(TFullDebugBlockHeader);
  end;
  Result := APointer >= Start;
  if Result then
    Result := Result and (APointer < Finish);
end;

function BlockContains(const AFullDebugBlockHeader: PFullDebugBlockHeader; const APointer: Pointer): Boolean; overload;
begin
  Result := BlockContains(AFullDebugBlockHeader, Cardinal(APointer));
end;

function MatchesAllocationNumber(const AFullDebugBlockHeader: PFullDebugBlockHeader; const AMinAllocationNumberToTrack: Cardinal;
  const
  AMaxAllocationNumberToTrack: Cardinal): Boolean; overload;
begin
  Result := False;
  if AMinAllocationNumberToTrack <> 0 then
  begin
    try
      if AMaxAllocationNumberToTrack <> 0 then
      begin
        Result := AFullDebugBlockHeader.AllocationNumber >= AMinAllocationNumberToTrack;
        Result := Result and (AFullDebugBlockHeader.AllocationNumber <= AMaxAllocationNumberToTrack);
      end
      else
        Result := AFullDebugBlockHeader.AllocationNumber = AMinAllocationNumberToTrack;
    except
      Result := False;
    end;
  end;
end;

function IsObject(Address: Pointer): Boolean; assembler;
// ##jpl: Borrowed from JCL
asm
// or IsClass(Pointer(Address^));
        MOV     EAX, [Address]
        CMP     EAX, EAX.vmtSelfPtr
        JNZ     @False
        MOV     Result, True
        JMP     @Exit
@False:
        MOV     Result, False
@Exit:
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
  InterfaceMT: PInterfaceMT;
  InterfaceRef: TInterfaceRef;
  QueryInterfaceThunk: PAdjustSelfThunk;
begin
  try
    Result := I;
    if Assigned(I) then
    begin
      //      if IsBadReadPtr(I, SizeOf(Pointer)) then
      //        Result := nil
      //      else
      begin
        InterfaceRef := TInterfaceRef(I);
        InterfaceMT := InterfaceRef^;
        if not Assigned(InterfaceMT) then
          Result := nil
        else
        begin
          if IsBadReadPtr(InterfaceMT, SizeOf(Pointer)) then
            Result := nil
          else
          begin
            QueryInterfaceThunk := InterfaceMT.QueryInterfaceThunk;
            try
              case QueryInterfaceThunk.AddInstruction of
                AddByte:
                  Inc(PChar(Result), QueryInterfaceThunk.AdjustmentByte);
                AddLong:
                  Inc(PChar(Result), QueryInterfaceThunk.AdjustmentLong);
              else
                Result := nil;
              end;
            except
              Result := nil;
            end;
          end;
        end;
      end;
    end;
    if Assigned(Result) then
      if not IsObject(Result) then
        Result := nil;
  except
    Result := nil;
  end;
end;

//--------------------------------------------------------------------------------------------------
const // TOracleAQPayload($7FEB5850); Pointer(Result) = $7FEB5868;
  InterfaceInstanceToTrack: Pointer = Pointer($0); // Pointer($7FEB5868); //Pointer($0); // $7FABB530
  // $7FB3E304, if you want to track an interface that is been used after it is freed 0x7FB3E304
  MinAllocationNumberToTrack = 0; // 3400; // 135025; 128823; // 0 if none to check
  MaxAllocationNumberToTrack = 0; // 3402; // 0 if only MinAllocationNumberToTrack is being checked as the only one to check
  BreakOnMyOnDebugGetMemFinish = True;
  BreakOnMyOnDebugFreeMemStart = False;
  BreakOnMyOnDebugFreeMemFinish = False;

var
  InstanceClassName: string;
  InstanceName: string;

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
    InstanceClassName := ObjectInstance.ClassName;
    if ObjectInstance is TComponent then
      InstanceName := TComponent(ObjectInstance).Name;
  end;
end;

procedure DebugBreak;
asm
  int 3
end;

procedure MyOnDebugGetMemFinish(const AAllocatedFullDebugBlockHeader: PFullDebugBlockHeader; const ASize: Integer);
begin
  if BreakOnMyOnDebugGetMemFinish then
  begin
    if MatchesAllocationNumber(AAllocatedFullDebugBlockHeader, MinAllocationNumberToTrack, MaxAllocationNumberToTrack) then
      DebugBreak;
    if BlockContains(AAllocatedFullDebugBlockHeader, InterfaceInstanceToTrack) then
    begin
      DetermineInstanceClassName;
      DebugBreak;
    end;
  end;
end;

procedure MyOnDebugFreeMemStart(const AToFreeFullDebugBlockHeader: PFullDebugBlockHeader);
begin
  if BreakOnMyOnDebugFreeMemStart then
  begin
    if MatchesAllocationNumber(AToFreeFullDebugBlockHeader, MinAllocationNumberToTrack, MaxAllocationNumberToTrack) then
      DebugBreak;
    if BlockContains(AToFreeFullDebugBlockHeader, InterfaceInstanceToTrack) then
    begin
      DetermineInstanceClassName;
      DebugBreak;
    end;
  end;
end;

procedure MyOnDebugFreeMemFinish(const AFreedFullDebugBlockHeader: PFullDebugBlockHeader; const AResult: Integer);
begin
  if BreakOnMyOnDebugFreeMemFinish then
  begin
    if MatchesAllocationNumber(AFreedFullDebugBlockHeader, MinAllocationNumberToTrack, MaxAllocationNumberToTrack) then
      DebugBreak;
    if BlockContains(AFreedFullDebugBlockHeader, InterfaceInstanceToTrack) then
    begin
      DetermineInstanceClassName;
      DebugBreak;
    end;
  end;
end;

procedure MyOnDebugReallocMemStart(const AToReallocateFullDebugBlockHeader: PFullDebugBlockHeader; const ANewSize: Integer);
begin
end;

procedure MyOnDebugReallocMemFinish(const AReallocatedFullDebugBlockHeader: PFullDebugBlockHeader; const ANewSize: Integer);
begin
end;
{$ENDIF FullDebugMode}

initialization
{$IFDEF FullDebugModeCallBacks}
  OnDebugGetMemFinish := MyOnDebugGetMemFinish;
  OnDebugFreeMemStart := MyOnDebugFreeMemStart;
  OnDebugFreeMemFinish := MyOnDebugFreeMemFinish;
  OnDebugReallocMemStart := MyOnDebugReallocMemStart;
  OnDebugReallocMemFinish := MyOnDebugReallocMemFinish;
{$ENDIF FullDebugModeCallBacks}

finalization
  SysUtils.FreeAndNil(GThreadCount);
  GSocketListClassPointer := @GSocketListClass;
  GStackCriticalSectionPointer := Pointer(Cardinal(GSocketListClassPointer) + 8);
  GStackCriticalSection := GStackCriticalSectionPointer;
  SysUtils.FreeAndNil(GStackCriticalSection^);
{$ENDIF FastMM}
end.

