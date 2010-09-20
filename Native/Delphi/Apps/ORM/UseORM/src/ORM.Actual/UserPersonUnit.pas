unit UserPersonUnit;

interface

uses
  ORMEntityUnit,
  UserPersonBaseUnit,
  NullablesUnit,
  Classes;

type
  TUserPerson = class;
  TUserPersonList = class;

  TUserPerson = class(TUserPersonBase)
  strict protected
    function GetUserPersonList(): TUserPersonList; virtual;
    function GetEntityListClass(): TEntityListClass; override;
  public
    destructor Destroy(); override;
    property UserPersonList: TUserPersonList read GetUserPersonList;
  end;

  TUserPersonEnumerator = class(TUserPersonBaseEnumerator)
  public
    function GetCurrent(): TUserPerson;
    property Current: TUserPerson read GetCurrent;
  end;

  TUserPersonList = class(TUserPersonListBase)
  strict private
    function GetCurrent(): TUserPerson;
  strict protected
    function GetData(): Integer; override;
    function GetEntityClass(): TEntityClass; override;
    function GetById(ID: TNullableInteger): TUserPerson;
  public
    function GetEnumerator(): TUserPersonEnumerator;
    property ById[ID: TNullableInteger]: TUserPerson read GetById;
    property Current: TUserPerson read GetCurrent;
  end;

implementation

uses
  SysUtils;

{ TUserPerson }

function TUserPerson.GetUserPersonList(): TUserPersonList;
begin
  Result := EntityList as TUserPersonList;
end;

function TUserPerson.GetEntityListClass(): TEntityListClass;
begin
  Result := TUserPersonList;
end;

destructor TUserPerson.Destroy();
begin
  inherited Destroy;
end;

{ TUserPersonEnumerator }

function TUserPersonEnumerator.GetCurrent(): TUserPerson;
var
  Value: TUserPersonBase;
begin
  Value := inherited Current;
  Result := Value as TUserPerson;
end;

{ TUserPersonList }

function TUserPersonList.GetData(): Integer;
begin
  Result := inherited GetData();
  HideIDColumns();
end;

function TUserPersonList.GetEntityClass(): TEntityClass;
begin
  Result := TUserPerson;
end;

function TUserPersonList.GetEnumerator(): TUserPersonEnumerator;
begin
  Result := TUserPersonEnumerator.Create(Self);
end;

function TUserPersonList.GetById(ID: TNullableInteger): TUserPerson;
begin
  Result := GetEntityById(ID) as TUserPerson;
end;

function TUserPersonList.GetCurrent(): TUserPerson;
begin
  Result := CurrentEntity as TUserPerson;
end;

end.
