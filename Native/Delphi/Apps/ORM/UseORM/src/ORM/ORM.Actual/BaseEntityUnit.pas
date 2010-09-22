unit BaseEntityUnit;

interface

uses
  ORMEntityUnit,
  BaseEntityBaseUnit,
  NullablesUnit,
  Classes;

type
  TBaseEntity = class;
  TBaseEntityList = class;

  TBaseEntity = class(TBaseEntityBase)
  strict protected
    function GetBaseEntityList(): TBaseEntityList; virtual;
    function GetEntityListClass(): TEntityListClass; override;
  public
    destructor Destroy(); override;
    property BaseEntityList: TBaseEntityList read GetBaseEntityList;
  end;

  TBaseEntityEnumerator = class(TBaseEntityBaseEnumerator)
  public
    function GetCurrent(): TBaseEntity;
    property Current: TBaseEntity read GetCurrent;
  end;

  TBaseEntityList = class(TBaseEntityListBase)
  strict private
    function GetCurrent(): TBaseEntity;
  strict protected
    function GetData(): Integer; override;
    function GetEntityClass(): TEntityClass; override;
    function GetById(ID: TNullableInteger): TBaseEntity;
  public
    function GetEnumerator(): TBaseEntityEnumerator;
    property ById[ID: TNullableInteger]: TBaseEntity read GetById;
    property Current: TBaseEntity read GetCurrent;
  end;

implementation

uses
  SysUtils;

{ TBaseEntity }

function TBaseEntity.GetBaseEntityList(): TBaseEntityList;
begin
  Result := EntityList as TBaseEntityList;
end;

function TBaseEntity.GetEntityListClass(): TEntityListClass;
begin
  Result := TBaseEntityList;
end;

destructor TBaseEntity.Destroy();
begin
  inherited Destroy;
end;

{ TBaseEntityEnumerator }

function TBaseEntityEnumerator.GetCurrent(): TBaseEntity;
var
  Value: TBaseEntityBase;
begin
  Value := inherited Current;
  Result := Value as TBaseEntity;
end;

{ TBaseEntityList }

function TBaseEntityList.GetData(): Integer;
begin
  Result := inherited GetData();
  HideIDColumns();
end;

function TBaseEntityList.GetEntityClass(): TEntityClass;
begin
  Result := TBaseEntity;
end;

function TBaseEntityList.GetEnumerator(): TBaseEntityEnumerator;
begin
  Result := TBaseEntityEnumerator.Create(Self);
end;

function TBaseEntityList.GetById(ID: TNullableInteger): TBaseEntity;
begin
  Result := GetEntityById(ID) as TBaseEntity;
end;

function TBaseEntityList.GetCurrent(): TBaseEntity;
begin
  Result := CurrentEntity as TBaseEntity;
end;

end.
