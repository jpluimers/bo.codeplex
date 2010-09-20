unit ClientUnit;

interface

uses
  ORMEntityUnit,
  ClientBaseUnit,
  NullablesUnit,
  Classes;

type
  TClient = class;
  TClientList = class;

  TClient = class(TClientBase)
  strict protected
    function GetClientList(): TClientList; virtual;
    function GetEntityListClass(): TEntityListClass; override;
  public
    destructor Destroy(); override;
    property ClientList: TClientList read GetClientList;
  end;

  TClientEnumerator = class(TClientBaseEnumerator)
  public
    function GetCurrent(): TClient;
    property Current: TClient read GetCurrent;
  end;

  TClientList = class(TClientListBase)
  strict private
    function GetCurrent(): TClient;
  strict protected
    function GetData(): Integer; override;
    function GetEntityClass(): TEntityClass; override;
    function GetById(ID: TNullableInteger): TClient;
  public
    function GetEnumerator(): TClientEnumerator;
    property ById[ID: TNullableInteger]: TClient read GetById;
    property Current: TClient read GetCurrent;
  end;

implementation

uses
  SysUtils;

{ TClient }

function TClient.GetClientList(): TClientList;
begin
  Result := EntityList as TClientList;
end;

function TClient.GetEntityListClass(): TEntityListClass;
begin
  Result := TClientList;
end;

destructor TClient.Destroy();
begin
  inherited Destroy;
end;

{ TClientEnumerator }

function TClientEnumerator.GetCurrent(): TClient;
var
  Value: TClientBase;
begin
  Value := inherited Current;
  Result := Value as TClient;
end;

{ TClientList }

function TClientList.GetData(): Integer;
begin
  Result := inherited GetData();
  HideIDColumns();
end;

function TClientList.GetEntityClass(): TEntityClass;
begin
  Result := TClient;
end;

function TClientList.GetEnumerator(): TClientEnumerator;
begin
  Result := TClientEnumerator.Create(Self);
end;

function TClientList.GetById(ID: TNullableInteger): TClient;
begin
  Result := GetEntityById(ID) as TClient;
end;

function TClientList.GetCurrent(): TClient;
begin
  Result := CurrentEntity as TClient;
end;

end.
