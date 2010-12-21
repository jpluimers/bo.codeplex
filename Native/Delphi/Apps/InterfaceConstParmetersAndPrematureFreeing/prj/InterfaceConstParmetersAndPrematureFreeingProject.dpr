program InterfaceConstParmetersAndPrematureFreeingProject;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Windows;

type
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
  Writeln('_AddRef ', FRefCount);
end;

function TMyInterfacedObject._Release: Integer;
begin
  Result := InterlockedDecrement(FRefCount);
  Writeln('_Release ', FRefCount);
  if Result = 0 then
  begin
    Writeln('_Release Destroy');
    Destroy;
  end;
end;

procedure NoLeak(Reference: IInterface);
begin
  Writeln('2.NoLeak begin');
  Supports(Reference, IInterface); // now we do not leak because the non-const parameter has an implicit reference count
  Writeln('2.NoLeak end');
end;

procedure Leak(const Reference: IInterface);
begin
  Writeln('2.Leak begin');
  Supports(Reference, IInterface); // now we leak because the caller does not keep a reference to us
  Writeln('2.Leak end');
end;

procedure Run();
begin
  Writeln('1.Run begin');
  Writeln('1.Run NoLeak');
  NoLeak(TMyInterfacedObject.Create());
  Writeln('1.Run Leak');
  Leak(TMyInterfacedObject.Create());
  Writeln('1.Run end');
end;

begin
  try
    Run();
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  Readln;
end.
