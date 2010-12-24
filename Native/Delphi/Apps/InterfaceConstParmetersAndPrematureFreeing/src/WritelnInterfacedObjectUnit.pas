unit WritelnInterfacedObjectUnit;

interface

type
  // Adpoted copy of TInterfacedObject for debugging
  TWritelnInterfacedObject = class(TObject, IInterface)
  protected
    FRefCount: Integer;
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
  public
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
    class function NewInstance: TObject; override;
    property RefCount: Integer read FRefCount;
  end;

implementation

uses
  Windows;

procedure TWritelnInterfacedObject.AfterConstruction;
begin
  InterlockedDecrement(FRefCount);
  Writeln('     AfterConstruction ', FRefCount);
end;

procedure TWritelnInterfacedObject.BeforeDestruction;
begin
  Writeln('     BeforeDestruction ', FRefCount);
  if RefCount <> 0 then
    System.Error(reInvalidPtr);
end;

class function TWritelnInterfacedObject.NewInstance: TObject;
begin
  Result := inherited NewInstance;
  TWritelnInterfacedObject(Result).FRefCount := 1;
  Writeln('     NewInstance ', TWritelnInterfacedObject(Result).FRefCount);
end;

function TWritelnInterfacedObject.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  Writeln('     QueryInterface ', FRefCount);
  if GetInterface(IID, Obj) then
    Result := 0
  else
    Result := E_NOINTERFACE;
end;

function TWritelnInterfacedObject._AddRef: Integer;
begin
  Result := InterlockedIncrement(FRefCount);
  Writeln('     _AddRef ', FRefCount);
end;

function TWritelnInterfacedObject._Release: Integer;
begin
  Result := InterlockedDecrement(FRefCount);
  Writeln('     _Release ', FRefCount);
  if Result = 0 then
  begin
    Writeln('     _Release Destroy');
    Destroy;
  end;
end;

end.
