unit MyInterfacedObjectUnit;

interface

type
{$ifdef plain}
  TMyInterfacedObject = TInterfacedObject;
{$else}
  // Adpoted copy of TInterfacedObject for debugging
  TMyInterfacedObject = class(TObject, IInterface)
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
{$endif plain}

implementation

uses
  Windows;

{$ifndef plain}

procedure TMyInterfacedObject.AfterConstruction;
begin
  InterlockedDecrement(FRefCount);
end;

procedure TMyInterfacedObject.BeforeDestruction;
begin
  if RefCount <> 0 then
    System.Error(reInvalidPtr);
end;

class function TMyInterfacedObject.NewInstance: TObject;
begin
  Result := inherited NewInstance;
  TMyInterfacedObject(Result).FRefCount := 1;
end;

function TMyInterfacedObject.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  if GetInterface(IID, Obj) then
    Result := 0
  else
    Result := E_NOINTERFACE;
end;

function TMyInterfacedObject._AddRef: Integer;
begin
  Result := InterlockedIncrement(FRefCount);
end;

function TMyInterfacedObject._Release: Integer;
begin
  Result := InterlockedDecrement(FRefCount);
  if Result = 0 then
    Destroy;
end;

{$endif plain}

end.
