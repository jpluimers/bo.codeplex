unit LegalPersonUnit;

interface

uses
  ORMEntityUnit,
  LegalPersonBaseUnit,
  NullablesUnit,
  Classes;

type
  TLegalPerson = class;
  TLegalPersonList = class;

  TLegalPerson = class(TLegalPersonBase)
  strict protected
    function GetLegalPersonList(): TLegalPersonList; virtual;
    function GetEntityListClass(): TEntityListClass; override;
  public
    destructor Destroy(); override;
    property LegalPersonList: TLegalPersonList read GetLegalPersonList;
  end;

  TLegalPersonEnumerator = class(TLegalPersonBaseEnumerator)
  public
    function GetCurrent(): TLegalPerson;
    property Current: TLegalPerson read GetCurrent;
  end;

  TLegalPersonList = class(TLegalPersonListBase)
  strict private
    function GetCurrent(): TLegalPerson;
  strict protected
    function GetData(): Integer; override;
    function GetEntityClass(): TEntityClass; override;
    function GetById(ID: TNullableInteger): TLegalPerson;
  public
    function GetEnumerator(): TLegalPersonEnumerator;
    property ById[ID: TNullableInteger]: TLegalPerson read GetById;
    property Current: TLegalPerson read GetCurrent;
  end;

implementation

uses
  SysUtils;

{ TLegalPerson }

function TLegalPerson.GetLegalPersonList(): TLegalPersonList;
begin
  Result := EntityList as TLegalPersonList;
end;

function TLegalPerson.GetEntityListClass(): TEntityListClass;
begin
  Result := TLegalPersonList;
end;

destructor TLegalPerson.Destroy();
begin
  inherited Destroy;
end;

{ TLegalPersonEnumerator }

function TLegalPersonEnumerator.GetCurrent(): TLegalPerson;
var
  Value: TLegalPersonBase;
begin
  Value := inherited Current;
  Result := Value as TLegalPerson;
end;

{ TLegalPersonList }

function TLegalPersonList.GetData(): Integer;
begin
  Result := inherited GetData();
  HideIDColumns();
end;

function TLegalPersonList.GetEntityClass(): TEntityClass;
begin
  Result := TLegalPerson;
end;

function TLegalPersonList.GetEnumerator(): TLegalPersonEnumerator;
begin
  Result := TLegalPersonEnumerator.Create(Self);
end;

function TLegalPersonList.GetById(ID: TNullableInteger): TLegalPerson;
begin
  Result := GetEntityById(ID) as TLegalPerson;
end;

function TLegalPersonList.GetCurrent(): TLegalPerson;
begin
  Result := CurrentEntity as TLegalPerson;
end;

end.
