unit GenderUnit;

interface

uses
  ORMEntityUnit,
  GenderBaseUnit,
  NullablesUnit,
  Classes;

type
  TGender = class;
  TGenderList = class;

  TGender = class(TGenderBase)
  strict protected
    function GetGenderList(): TGenderList; virtual;
    function GetEntityListClass(): TEntityListClass; override;
  public
    destructor Destroy(); override;
    property GenderList: TGenderList read GetGenderList;
  end;

  TGenderEnumerator = class(TGenderBaseEnumerator)
  public
    function GetCurrent(): TGender;
    property Current: TGender read GetCurrent;
  end;

  TGenderList = class(TGenderListBase)
  strict private
    function GetCurrent(): TGender;
  strict protected
    function GetData(): Integer; override;
    function GetEntityClass(): TEntityClass; override;
    function GetById(ID: TNullableInteger): TGender;
  public
    function GetEnumerator(): TGenderEnumerator;
    property ById[ID: TNullableInteger]: TGender read GetById;
    property Current: TGender read GetCurrent;
  end;

implementation

uses
  SysUtils;

{ TGender }

function TGender.GetGenderList(): TGenderList;
begin
  Result := EntityList as TGenderList;
end;

function TGender.GetEntityListClass(): TEntityListClass;
begin
  Result := TGenderList;
end;

destructor TGender.Destroy();
begin
  inherited Destroy;
end;

{ TGenderEnumerator }

function TGenderEnumerator.GetCurrent(): TGender;
var
  Value: TGenderBase;
begin
  Value := inherited Current;
  Result := Value as TGender;
end;

{ TGenderList }

function TGenderList.GetData(): Integer;
begin
  Result := inherited GetData();
  HideIDColumns();
end;

function TGenderList.GetEntityClass(): TEntityClass;
begin
  Result := TGender;
end;

function TGenderList.GetEnumerator(): TGenderEnumerator;
begin
  Result := TGenderEnumerator.Create(Self);
end;

function TGenderList.GetById(ID: TNullableInteger): TGender;
begin
  Result := GetEntityById(ID) as TGender;
end;

function TGenderList.GetCurrent(): TGender;
begin
  Result := CurrentEntity as TGender;
end;

end.
