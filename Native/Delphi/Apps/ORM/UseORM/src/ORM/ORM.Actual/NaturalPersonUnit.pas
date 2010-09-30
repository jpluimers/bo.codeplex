unit NaturalPersonUnit;

interface

uses
  ORMEntityUnit,
  NaturalPersonBaseUnit,
  NullablesUnit,
  Classes, DB;

type
  TNaturalPerson = class;
  TNaturalPersonList = class;

  TNaturalPerson = class(TNaturalPersonBase)
  strict protected
    function GetNaturalPersonList(): TNaturalPersonList; virtual;
    function GetEntityListClass(): TEntityListClass; override;
    function GetFullName: string; virtual;
  public
    destructor Destroy(); override;
    property FullName: string read GetFullName;
    property NaturalPersonList: TNaturalPersonList read GetNaturalPersonList;
  end;

  TNaturalPersonEnumerator = class(TNaturalPersonBaseEnumerator)
  public
    function GetCurrent(): TNaturalPerson;
    property Current: TNaturalPerson read GetCurrent;
  end;

  TNaturalPersonList = class(TNaturalPersonListBase)
  strict private
    FGenderFieldName: string;
    function GetCurrent(): TNaturalPerson;
  strict protected
    procedure CalculateCalculatedFields; override;
    procedure CreateCalculatedFields; override;
    procedure CreateLookupFields; override;
    function GetData(): Integer; override;
    function GetEntityClass(): TEntityClass; override;
    function GetById(ID: TNullableInteger): TNaturalPerson;
    function GetGenderField: TStringField; virtual;
    function GetGenderList: TReadOnlyEntityList; virtual;
    function GetFullName: string; virtual;
    function GetFullNameField: TStringField; virtual;
  public
  const
    FullNameFieldName = 'FullName';
    function GetEnumerator(): TNaturalPersonEnumerator;
    property ById[ID: TNullableInteger]: TNaturalPerson read GetById;
    property GenderField: TStringField read
        GetGenderField;
    property GenderFieldName: string read
        FGenderFieldName;
    property GenderList: TReadOnlyEntityList read
        GetGenderList;
    property Current: TNaturalPerson read GetCurrent;
    property FullName: string read GetFullName;
    property FullNameField: TStringField read GetFullNameField;
  end;

implementation

uses
  SysUtils, GenderUnit, Variants;

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

function TNaturalPerson.GetFullName: string;
begin
  Result := (EntityList as TNaturalPersonList).FullName;
end;

{ TNaturalPersonEnumerator }

function TNaturalPersonEnumerator.GetCurrent(): TNaturalPerson;
var
  Value: TNaturalPersonBase;
begin
  Value := inherited Current;
  Result := Value as TNaturalPerson;
end;

procedure TNaturalPersonList.CalculateCalculatedFields;
begin
  inherited CalculateCalculatedFields();

  FullNameField.AsString := Self.FullName;
end;

procedure TNaturalPersonList.CreateCalculatedFields;
begin
  inherited CreateCalculatedFields();

  CreateCalculatedField(FullNameFieldName,
  [
    // these fields will now be hidden in the Grid:
    Self.FirstNameFieldName,
    Self.InitialsFieldName,
    Self.LastNameFieldName
  ],
    // the lookup field will be in the Grid at the position of this field:
    Self.LastNameFieldName);
end;

procedure TNaturalPersonList.CreateLookupFields;
begin
  inherited CreateLookupFields();

  FGenderFieldName := CreateLookupField(GenderList,
    TGenderList.ID_GenderFieldName, TGenderList.NameFieldName,
    Self.ID_GenderFieldName).FieldName;
end;

{ TNaturalPersonList }

function TNaturalPersonList.GetData(): Integer;
begin
  Result := inherited GetData();
  HideIDColumns();

  TimeStampInsertField.Visible := False;
  TimeStampLastUpdateField.Visible := False;
  StartDateTimeField.Visible := False;
  FinishDateTimeField.Visible := False;
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

function TNaturalPersonList.GetGenderField: TStringField;
begin
  Result := FieldByName(GenderFieldName) as TStringField;
end;

function TNaturalPersonList.GetGenderList: TReadOnlyEntityList;
var
  Key: TLookupEntityListDictionaryKey;
begin
//  Key := TLookupEntityListDictionaryKey.Create(
//    TGenderList,
//    TGenderList.NameFieldName, 'Male'); //##jpl: Filtered list: Field-name + filter-value needed
  Key := TLookupEntityListDictionaryKey.Create(TGenderList);
  Result := LookupEntityListManager.LookupEntityList[Key];
end;

function TNaturalPersonList.GetCurrent(): TNaturalPerson;
begin
  Result := CurrentEntity as TNaturalPerson;
end;

function TNaturalPersonList.GetFullName: string;

  procedure Append(const Value: string);
  begin
    // add a space in the middle when needed (to avoid a complex trim later on)
    if Value <> NullAsStringValue then
    begin
      if Result = NullAsStringValue then
        Result := Value
      else
        Result := Format('%s %s', [Result, Value]);
    end;
  end;

begin
  Result := NullAsStringValue;

  Append(FirstName.Value);
  if Initials.IsFilled then
  begin
    Append(Format('(%s)', [Initials.Value]));
  end;
  Append(LastName.Value);
end;

function TNaturalPersonList.GetFullNameField: TStringField;
begin
  Result := Fields.FieldByName(Self.FullNameFieldName) as TStringField;
end;

end.
