unit NaturalPersonUnit;

interface

uses
  ORMEntityUnit,
  NaturalPersonBaseUnit,
  NullablesUnit,
  Classes;

type
  TNaturalPerson = class;
  TNaturalPersonList = class;

  TNaturalPerson = class(TNaturalPersonBase)
  strict protected
    function GetNaturalPersonList(): TNaturalPersonList; virtual;
    function GetEntityListClass(): TEntityListClass; override;
  public
    destructor Destroy(); override;
    property NaturalPersonList: TNaturalPersonList read GetNaturalPersonList;
  end;

  TNaturalPersonEnumerator = class(TNaturalPersonBaseEnumerator)
  public
    function GetCurrent(): TNaturalPerson;
    property Current: TNaturalPerson read GetCurrent;
  end;

  TNaturalPersonList = class(TNaturalPersonListBase)
  strict private
    function GetCurrent(): TNaturalPerson;
  strict protected
    function GetData(): Integer; override;
    function GetEntityClass(): TEntityClass; override;
    function GetById(ID: TNullableInteger): TNaturalPerson;
  public
    function GetEnumerator(): TNaturalPersonEnumerator;
    property ById[ID: TNullableInteger]: TNaturalPerson read GetById;
    property Current: TNaturalPerson read GetCurrent;
  end;

implementation

uses
  SysUtils;

{ TNaturalPerson }

function TNaturalPerson.GetNaturalPersonList(): TNaturalPersonList;
begin
  Result := EntityList as TNaturalPersonList;
end;

function TNaturalPerson.GetEntityListClass(): TEntityListClass;
begin
  Result := TNaturalPersonList;
end;

destructor TNaturalPerson.Destroy();
begin
  inherited Destroy;
end;

{ TNaturalPersonEnumerator }

function TNaturalPersonEnumerator.GetCurrent(): TNaturalPerson;
var
  Value: TNaturalPersonBase;
begin
  Value := inherited Current;
  Result := Value as TNaturalPerson;
end;

{ TNaturalPersonList }

function TNaturalPersonList.GetData(): Integer;
begin
  Result := inherited GetData();
  HideIDColumns();
end;

function TNaturalPersonList.GetEntityClass(): TEntityClass;
begin
  Result := TNaturalPerson;
end;

function TNaturalPersonList.GetEnumerator(): TNaturalPersonEnumerator;
begin
  Result := TNaturalPersonEnumerator.Create(Self);
end;

function TNaturalPersonList.GetById(ID: TNullableInteger): TNaturalPerson;
begin
  Result := GetEntityById(ID) as TNaturalPerson;
end;

function TNaturalPersonList.GetCurrent(): TNaturalPerson;
begin
  Result := CurrentEntity as TNaturalPerson;
end;

end.
