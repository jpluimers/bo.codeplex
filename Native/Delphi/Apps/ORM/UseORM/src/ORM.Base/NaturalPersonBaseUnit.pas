unit NaturalPersonBaseUnit;

interface

uses
  MSConnectionLayerUnit,
  SysUtils,
  ORMEntityUnit,
  DataSetEnumeratorUnit,
  NullablesUnit,
  db,
  ADODB,
  BaseEntityUnit;

type
  TNaturalPersonBase = class;
  TNaturalPersonListBase = class;

  TNaturalPersonBase = class(TBaseEntity)
  strict protected
    function GetNaturalPersonListBase(): TNaturalPersonListBase; virtual;
    function GetEntityListClass(): TEntityListClass; override;
    function GetID_NaturalPerson(): TNullableInteger; virtual;
    procedure SetID_NaturalPerson(const Value: TNullableInteger); virtual;
    function GetEID_BaseEntity(): TNullableInteger; virtual;
    procedure SetEID_BaseEntity(const Value: TNullableInteger); virtual;
    function GetFirstName(): TNullableString; virtual;
    procedure SetFirstName(const Value: TNullableString); virtual;
    function GetInitials(): TNullableString; virtual;
    procedure SetInitials(const Value: TNullableString); virtual;
    function GetLastName(): TNullableString; virtual;
    procedure SetLastName(const Value: TNullableString); virtual;
    function GetBirthDate(): TNullableDateTime; virtual;
    procedure SetBirthDate(const Value: TNullableDateTime); virtual;
    function GetPlaceOfBirth(): TNullableString; virtual;
    procedure SetPlaceOfBirth(const Value: TNullableString); virtual;
    function GetSSN(): TNullableString; virtual;
    procedure SetSSN(const Value: TNullableString); virtual;
    property NaturalPersonList: TNaturalPersonListBase read GetNaturalPersonListBase;
  public
    property ID_NaturalPerson: TNullableInteger read GetID_NaturalPerson write SetID_NaturalPerson;
    property EID_BaseEntity: TNullableInteger read GetEID_BaseEntity write SetEID_BaseEntity;
    property FirstName: TNullableString read GetFirstName write SetFirstName;
    property Initials: TNullableString read GetInitials write SetInitials;
    property LastName: TNullableString read GetLastName write SetLastName;
    property BirthDate: TNullableDateTime read GetBirthDate write SetBirthDate;
    property PlaceOfBirth: TNullableString read GetPlaceOfBirth write SetPlaceOfBirth;
    property SSN: TNullableString read GetSSN write SetSSN;
  end;

  TNaturalPersonListBaseClientDataSet = class(TBaseEntityList)
  strict protected
    function GetData(): Integer; overload; override;
    function GetEntityClass(): TEntityClass; overload; override;
    function GetID_NaturalPersonField(): TIntegerField; virtual;
    function GetEID_BaseEntityField(): TIntegerField; virtual;
    function GetFirstNameField(): TStringField; virtual;
    function GetInitialsField(): TStringField; virtual;
    function GetLastNameField(): TStringField; virtual;
    function GetBirthDateField(): TDateTimeField; virtual;
    function GetPlaceOfBirthField(): TStringField; virtual;
    function GetSSNField(): TStringField; virtual;
  public
    const
      ID_NaturalPersonFieldName = 'ID_NaturalPerson';
      ID_NaturalPerson_ChangedParameterName = 'ID_NaturalPerson_Changed';
      EID_BaseEntityFieldName = 'EID_BaseEntity';
      EID_BaseEntity_ChangedParameterName = 'EID_BaseEntity_Changed';
      FirstNameFieldName = 'FirstName';
      FirstName_ChangedParameterName = 'FirstName_Changed';
      InitialsFieldName = 'Initials';
      Initials_ChangedParameterName = 'Initials_Changed';
      LastNameFieldName = 'LastName';
      LastName_ChangedParameterName = 'LastName_Changed';
      BirthDateFieldName = 'BirthDate';
      BirthDate_ChangedParameterName = 'BirthDate_Changed';
      PlaceOfBirthFieldName = 'PlaceOfBirth';
      PlaceOfBirth_ChangedParameterName = 'PlaceOfBirth_Changed';
      SSNFieldName = 'SSN';
      SSN_ChangedParameterName = 'SSN_Changed';
    property ID_NaturalPersonField: TIntegerField read GetID_NaturalPersonField;
    property EID_BaseEntityField: TIntegerField read GetEID_BaseEntityField;
    property FirstNameField: TStringField read GetFirstNameField;
    property InitialsField: TStringField read GetInitialsField;
    property LastNameField: TStringField read GetLastNameField;
    property BirthDateField: TDateTimeField read GetBirthDateField;
    property PlaceOfBirthField: TStringField read GetPlaceOfBirthField;
    property SSNField: TStringField read GetSSNField;
  end;

  TNaturalPersonBaseEnumerator = class(TEntityListEnumerator)
  strict private
    function GetCurrent(): TNaturalPersonBase;
  public
    property Current: TNaturalPersonBase read GetCurrent;
  end;

  TNaturalPersonListBase = class(TNaturalPersonListBaseClientDataSet)
  strict private
    procedure SetDeleteQueryText(var DeleteQueryText: string);
    procedure SetInsertQueryText(var InsertQueryText: string);
    procedure SetUpdateQueryText(var UpdateQueryText: string);
    procedure SetParams(const DBQuery: TDBQuery);
    function FillJoinedColumnPair(): TJoinedColumnPair;
  strict protected
    procedure SetReadQueryText(const ReadQuery: TDBQuery); override;
    procedure FillDeleteQueryRecordList(const DeleteQueryRecordList: TEntityQueryRecordList); override;
    procedure FillInsertQueryRecordList(const InsertQueryRecordList: TEntityQueryRecordList); override;
    procedure FillUpdateQueryRecordList(const UpdateQueryRecordList: TEntityQueryRecordList); override;
    function GetID_NaturalPerson(): TNullableInteger; virtual;
    procedure SetID_NaturalPerson(const Value: TNullableInteger); virtual;
    function GetEID_BaseEntity(): TNullableInteger; virtual;
    procedure SetEID_BaseEntity(const Value: TNullableInteger); virtual;
    function GetFirstName(): TNullableString; virtual;
    procedure SetFirstName(const Value: TNullableString); virtual;
    function GetInitials(): TNullableString; virtual;
    procedure SetInitials(const Value: TNullableString); virtual;
    function GetLastName(): TNullableString; virtual;
    procedure SetLastName(const Value: TNullableString); virtual;
    function GetBirthDate(): TNullableDateTime; virtual;
    procedure SetBirthDate(const Value: TNullableDateTime); virtual;
    function GetPlaceOfBirth(): TNullableString; virtual;
    procedure SetPlaceOfBirth(const Value: TNullableString); virtual;
    function GetSSN(): TNullableString; virtual;
    procedure SetSSN(const Value: TNullableString); virtual;
  public
    const
      NaturalPerson_TableName = 'NaturalPerson';
    function GetEnumerator(): TNaturalPersonBaseEnumerator;
    property ID_NaturalPerson: TNullableInteger read GetID_NaturalPerson write SetID_NaturalPerson;
    property EID_BaseEntity: TNullableInteger read GetEID_BaseEntity write SetEID_BaseEntity;
    property FirstName: TNullableString read GetFirstName write SetFirstName;
    property Initials: TNullableString read GetInitials write SetInitials;
    property LastName: TNullableString read GetLastName write SetLastName;
    property BirthDate: TNullableDateTime read GetBirthDate write SetBirthDate;
    property PlaceOfBirth: TNullableString read GetPlaceOfBirth write SetPlaceOfBirth;
    property SSN: TNullableString read GetSSN write SetSSN;
  end;

implementation

uses
  FieldHelperUnit;

{ TNaturalPersonBase }

function TNaturalPersonBase.GetNaturalPersonListBase(): TNaturalPersonListBase;
begin
  Result := EntityList as TNaturalPersonListBase;
end;

function TNaturalPersonBase.GetEntityListClass(): TEntityListClass;
begin
  Result := TNaturalPersonListBase;
end;

function TNaturalPersonBase.GetID_NaturalPerson(): TNullableInteger;
var
  Value: TNullableInteger;
begin
  ExecuteAtDictionaryID(
  procedure
  begin
    Value := NaturalPersonList.ID_NaturalPerson;
  end
  );
  Result := Value;
end;

procedure TNaturalPersonBase.SetID_NaturalPerson(const Value: TNullableInteger);
var
  NewValue: TNullableInteger;
begin
  NewValue := Value;
  ExecuteAtBookmarkInEditMode(
    procedure
    begin
      NaturalPersonList.ID_NaturalPerson := NewValue;
    end
  );
end;

function TNaturalPersonBase.GetEID_BaseEntity(): TNullableInteger;
var
  Value: TNullableInteger;
begin
  ExecuteAtDictionaryID(
  procedure
  begin
    Value := NaturalPersonList.EID_BaseEntity;
  end
  );
  Result := Value;
end;

procedure TNaturalPersonBase.SetEID_BaseEntity(const Value: TNullableInteger);
var
  NewValue: TNullableInteger;
begin
  NewValue := Value;
  ExecuteAtBookmarkInEditMode(
    procedure
    begin
      NaturalPersonList.EID_BaseEntity := NewValue;
    end
  );
end;

function TNaturalPersonBase.GetFirstName(): TNullableString;
var
  Value: TNullableString;
begin
  ExecuteAtDictionaryID(
  procedure
  begin
    Value := NaturalPersonList.FirstName;
  end
  );
  Result := Value;
end;

procedure TNaturalPersonBase.SetFirstName(const Value: TNullableString);
var
  NewValue: TNullableString;
begin
  NewValue := Value;
  ExecuteAtBookmarkInEditMode(
    procedure
    begin
      NaturalPersonList.FirstName := NewValue;
    end
  );
end;

function TNaturalPersonBase.GetInitials(): TNullableString;
var
  Value: TNullableString;
begin
  ExecuteAtDictionaryID(
  procedure
  begin
    Value := NaturalPersonList.Initials;
  end
  );
  Result := Value;
end;

procedure TNaturalPersonBase.SetInitials(const Value: TNullableString);
var
  NewValue: TNullableString;
begin
  NewValue := Value;
  ExecuteAtBookmarkInEditMode(
    procedure
    begin
      NaturalPersonList.Initials := NewValue;
    end
  );
end;

function TNaturalPersonBase.GetLastName(): TNullableString;
var
  Value: TNullableString;
begin
  ExecuteAtDictionaryID(
  procedure
  begin
    Value := NaturalPersonList.LastName;
  end
  );
  Result := Value;
end;

procedure TNaturalPersonBase.SetLastName(const Value: TNullableString);
var
  NewValue: TNullableString;
begin
  NewValue := Value;
  ExecuteAtBookmarkInEditMode(
    procedure
    begin
      NaturalPersonList.LastName := NewValue;
    end
  );
end;

function TNaturalPersonBase.GetBirthDate(): TNullableDateTime;
var
  Value: TNullableDateTime;
begin
  ExecuteAtDictionaryID(
  procedure
  begin
    Value := NaturalPersonList.BirthDate;
  end
  );
  Result := Value;
end;

procedure TNaturalPersonBase.SetBirthDate(const Value: TNullableDateTime);
var
  NewValue: TNullableDateTime;
begin
  NewValue := Value;
  ExecuteAtBookmarkInEditMode(
    procedure
    begin
      NaturalPersonList.BirthDate := NewValue;
    end
  );
end;

function TNaturalPersonBase.GetPlaceOfBirth(): TNullableString;
var
  Value: TNullableString;
begin
  ExecuteAtDictionaryID(
  procedure
  begin
    Value := NaturalPersonList.PlaceOfBirth;
  end
  );
  Result := Value;
end;

procedure TNaturalPersonBase.SetPlaceOfBirth(const Value: TNullableString);
var
  NewValue: TNullableString;
begin
  NewValue := Value;
  ExecuteAtBookmarkInEditMode(
    procedure
    begin
      NaturalPersonList.PlaceOfBirth := NewValue;
    end
  );
end;

function TNaturalPersonBase.GetSSN(): TNullableString;
var
  Value: TNullableString;
begin
  ExecuteAtDictionaryID(
  procedure
  begin
    Value := NaturalPersonList.SSN;
  end
  );
  Result := Value;
end;

procedure TNaturalPersonBase.SetSSN(const Value: TNullableString);
var
  NewValue: TNullableString;
begin
  NewValue := Value;
  ExecuteAtBookmarkInEditMode(
    procedure
    begin
      NaturalPersonList.SSN := NewValue;
    end
  );
end;

{ TNaturalPersonListBaseClientDataSet }

function TNaturalPersonListBaseClientDataSet.GetData(): Integer;
begin
  Result := inherited GetData();
end;

function TNaturalPersonListBaseClientDataSet.GetEntityClass(): TEntityClass;
begin
  Result := TNaturalPersonBase;
end;

function TNaturalPersonListBaseClientDataSet.GetID_NaturalPersonField(): TIntegerField;
begin
  Result := Fields.FieldByName(ID_NaturalPersonFieldName) as TIntegerField;
end;

function TNaturalPersonListBaseClientDataSet.GetEID_BaseEntityField(): TIntegerField;
begin
  Result := Fields.FieldByName(EID_BaseEntityFieldName) as TIntegerField;
end;

function TNaturalPersonListBaseClientDataSet.GetFirstNameField(): TStringField;
begin
  Result := Fields.FieldByName(FirstNameFieldName) as TStringField;
end;

function TNaturalPersonListBaseClientDataSet.GetInitialsField(): TStringField;
begin
  Result := Fields.FieldByName(InitialsFieldName) as TStringField;
end;

function TNaturalPersonListBaseClientDataSet.GetLastNameField(): TStringField;
begin
  Result := Fields.FieldByName(LastNameFieldName) as TStringField;
end;

function TNaturalPersonListBaseClientDataSet.GetBirthDateField(): TDateTimeField;
begin
  Result := Fields.FieldByName(BirthDateFieldName) as TDateTimeField;
end;

function TNaturalPersonListBaseClientDataSet.GetPlaceOfBirthField(): TStringField;
begin
  Result := Fields.FieldByName(PlaceOfBirthFieldName) as TStringField;
end;

function TNaturalPersonListBaseClientDataSet.GetSSNField(): TStringField;
begin
  Result := Fields.FieldByName(SSNFieldName) as TStringField;
end;

{ TNaturalPersonBaseEnumerator }

function TNaturalPersonBaseEnumerator.GetCurrent(): TNaturalPersonBase;
var
  Entity: TEntity;
begin
  Entity := inherited Current;
  Result := Entity as TNaturalPersonBase;
end;

{ TNaturalPersonListBase }

procedure TNaturalPersonListBase.SetDeleteQueryText(var DeleteQueryText: string);
begin
  DeleteQueryText := 'DELETE FROM NaturalPerson WHERE ID_NaturalPerson = :ID_NaturalPerson';
end;

procedure TNaturalPersonListBase.SetInsertQueryText(var InsertQueryText: string);
begin
  InsertQueryText :=
  'INSERT INTO NaturalPerson (' +
  '  EID_BaseEntity, ' +
  '  FirstName, ' +
  '  Initials, ' +
  '  LastName, ' +
  '  BirthDate, ' +
  '  PlaceOfBirth, ' +
  '  SSN  ) VALUES (' +
  '  :EID_BaseEntity_Changed, ' +
  '  :FirstName_Changed, ' +
  '  :Initials_Changed, ' +
  '  :LastName_Changed, ' +
  '  :BirthDate_Changed, ' +
  '  :PlaceOfBirth_Changed, ' +
  '  :SSN_Changed  )';
end;

procedure TNaturalPersonListBase.SetReadQueryText(const ReadQuery: TDBQuery);
begin
  ReadQuery.SQL.Add('   SELECT ' +
  '  NaturalPerson.ID_NaturalPerson, ' +
  '  NaturalPerson.EID_BaseEntity, ' +
  '  NaturalPerson.FirstName, ' +
  '  NaturalPerson.Initials, ' +
  '  NaturalPerson.LastName, ' +
  '  NaturalPerson.BirthDate, ' +
  '  NaturalPerson.PlaceOfBirth, ' +
  '  NaturalPerson.SSN, ' +
  '  BaseEntity.ID_BaseEntity, ' +
  '  BaseEntity.ExternalID, ' +
  '  BaseEntity.ID_UserPersonInsert, ' +
  '  BaseEntity.TimeStampInsert, ' +
  '  BaseEntity.ID_UserPersonUpdate, ' +
  '  BaseEntity.TimeStampLastUpdate, ' +
  '  BaseEntity.StartDateTime, ' +
  '  BaseEntity.FinishDateTime, ' +
  '  BaseEntity.Remark ' +
  '   FROM ( NaturalPerson ' +
  '   LEFT JOIN BaseEntity ON BaseEntity.ID_BaseEntity = NaturalPerson.EID_BaseEntity) ' +
  'WHERE (1=1) '
  );
end;

procedure TNaturalPersonListBase.SetUpdateQueryText(var UpdateQueryText: string);
begin
  UpdateQueryText :=
  'UPDATE NaturalPerson ' + 'SET ' +
  '  EID_BaseEntity = :EID_BaseEntity_Changed, ' +
  '  FirstName = :FirstName_Changed, ' +
  '  Initials = :Initials_Changed, ' +
  '  LastName = :LastName_Changed, ' +
  '  BirthDate = :BirthDate_Changed, ' +
  '  PlaceOfBirth = :PlaceOfBirth_Changed, ' +
  '  SSN = :SSN_Changed ' +
  'WHERE ID_NaturalPerson = :ID_NaturalPerson ';
end;

procedure TNaturalPersonListBase.SetParams(const DBQuery: TDBQuery);
begin
  DBQuery.AssignParam(EID_BaseEntity, EID_BaseEntity_ChangedParameterName);
  DBQuery.AssignParam(FirstName, FirstName_ChangedParameterName);
  DBQuery.AssignParam(Initials, Initials_ChangedParameterName);
  DBQuery.AssignParam(LastName, LastName_ChangedParameterName);
  DBQuery.AssignParam(BirthDate, BirthDate_ChangedParameterName);
  DBQuery.AssignParam(PlaceOfBirth, PlaceOfBirth_ChangedParameterName);
  DBQuery.AssignParam(SSN, SSN_ChangedParameterName);
end;

function TNaturalPersonListBase.FillJoinedColumnPair(): TJoinedColumnPair;
begin
  Result := TJoinedColumnPair.Create(NaturalPerson_TableName, EID_BaseEntityFieldName, BaseEntity_TableName, ID_BaseEntityFieldName);
end;

procedure TNaturalPersonListBase.FillDeleteQueryRecordList(const DeleteQueryRecordList: TEntityQueryRecordList);
var
  DeleteQueryRecord: TEntityQueryRecord;
begin
  inherited FillDeleteQueryRecordList(DeleteQueryRecordList);
  DeleteQueryRecord.SetQueryTextMethod := Self.SetDeleteQueryText;
  DeleteQueryRecord.SetParamsMethod := nil;
  DeleteQueryRecord.JoinedColumnPair := FillJoinedColumnPair();
  DeleteQueryRecordList.Add(DeleteQueryRecord);
end;

procedure TNaturalPersonListBase.FillInsertQueryRecordList(const InsertQueryRecordList: TEntityQueryRecordList);
var
  InsertQueryRecord: TEntityQueryRecord;
begin
  inherited FillInsertQueryRecordList(InsertQueryRecordList);
  InsertQueryRecord.SetQueryTextMethod := Self.SetInsertQueryText;
  InsertQueryRecord.SetParamsMethod := Self.SetParams;
  InsertQueryRecord.JoinedColumnPair := FillJoinedColumnPair();
  InsertQueryRecordList.Add(InsertQueryRecord);
end;

procedure TNaturalPersonListBase.FillUpdateQueryRecordList(const UpdateQueryRecordList: TEntityQueryRecordList);
var
  UpdateQueryRecord: TEntityQueryRecord;
begin
  inherited FillUpdateQueryRecordList(UpdateQueryRecordList);
  UpdateQueryRecord.SetQueryTextMethod := Self.SetUpdateQueryText;
  UpdateQueryRecord.SetParamsMethod := Self.SetParams;
  UpdateQueryRecord.JoinedColumnPair := FillJoinedColumnPair();
  UpdateQueryRecordList.Add(UpdateQueryRecord);
end;

function TNaturalPersonListBase.GetID_NaturalPerson(): TNullableInteger;
begin
  Result := ID_NaturalPersonField.AsNullableInteger;
end;

procedure TNaturalPersonListBase.SetID_NaturalPerson(const Value: TNullableInteger);
begin
  ID_NaturalPersonField.AsNullableInteger := Value;
end;

function TNaturalPersonListBase.GetEID_BaseEntity(): TNullableInteger;
begin
  Result := EID_BaseEntityField.AsNullableInteger;
end;

procedure TNaturalPersonListBase.SetEID_BaseEntity(const Value: TNullableInteger);
begin
  EID_BaseEntityField.AsNullableInteger := Value;
end;

function TNaturalPersonListBase.GetFirstName(): TNullableString;
begin
  Result := FirstNameField.AsNullableString;
end;

procedure TNaturalPersonListBase.SetFirstName(const Value: TNullableString);
begin
  FirstNameField.AsNullableString := Value;
end;

function TNaturalPersonListBase.GetInitials(): TNullableString;
begin
  Result := InitialsField.AsNullableString;
end;

procedure TNaturalPersonListBase.SetInitials(const Value: TNullableString);
begin
  InitialsField.AsNullableString := Value;
end;

function TNaturalPersonListBase.GetLastName(): TNullableString;
begin
  Result := LastNameField.AsNullableString;
end;

procedure TNaturalPersonListBase.SetLastName(const Value: TNullableString);
begin
  LastNameField.AsNullableString := Value;
end;

function TNaturalPersonListBase.GetBirthDate(): TNullableDateTime;
begin
  Result := BirthDateField.AsNullableDateTime;
end;

procedure TNaturalPersonListBase.SetBirthDate(const Value: TNullableDateTime);
begin
  BirthDateField.AsNullableDateTime := Value;
end;

function TNaturalPersonListBase.GetPlaceOfBirth(): TNullableString;
begin
  Result := PlaceOfBirthField.AsNullableString;
end;

procedure TNaturalPersonListBase.SetPlaceOfBirth(const Value: TNullableString);
begin
  PlaceOfBirthField.AsNullableString := Value;
end;

function TNaturalPersonListBase.GetSSN(): TNullableString;
begin
  Result := SSNField.AsNullableString;
end;

procedure TNaturalPersonListBase.SetSSN(const Value: TNullableString);
begin
  SSNField.AsNullableString := Value;
end;

function TNaturalPersonListBase.GetEnumerator(): TNaturalPersonBaseEnumerator;
begin
  Result := TNaturalPersonBaseEnumerator.Create(Self);
end;

{
object ID_NaturalPersonDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 8
  Width = 165
  Height = 17
  FocusControl = ID_NaturalPersonDbEdit
end
object ID_NaturalPersonDbEdit: TDBEdit
  Left = 10
  Top = 22
  Width = 221
  Height = 21
  TabOrder = 0
end
object EID_BaseEntityDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 50
  Width = 165
  Height = 17
  FocusControl = EID_BaseEntityDbEdit
end
object EID_BaseEntityDbEdit: TDBEdit
  Left = 10
  Top = 64
  Width = 221
  Height = 21
  TabOrder = 1
end
object FirstNameDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 92
  Width = 165
  Height = 17
  FocusControl = FirstNameDbEdit
end
object FirstNameDbEdit: TDBEdit
  Left = 10
  Top = 106
  Width = 221
  Height = 21
  TabOrder = 2
end
object InitialsDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 134
  Width = 165
  Height = 17
  FocusControl = InitialsDbEdit
end
object InitialsDbEdit: TDBEdit
  Left = 10
  Top = 148
  Width = 221
  Height = 21
  TabOrder = 3
end
object LastNameDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 176
  Width = 165
  Height = 17
  FocusControl = LastNameDbEdit
end
object LastNameDbEdit: TDBEdit
  Left = 10
  Top = 190
  Width = 221
  Height = 21
  TabOrder = 4
end
object BirthDateDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 218
  Width = 165
  Height = 17
  FocusControl = BirthDateDbEdit
end
object BirthDateDbEdit: TDBEdit
  Left = 10
  Top = 232
  Width = 221
  Height = 21
  TabOrder = 5
end
object PlaceOfBirthDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 260
  Width = 165
  Height = 17
  FocusControl = PlaceOfBirthDbEdit
end
object PlaceOfBirthDbEdit: TDBEdit
  Left = 10
  Top = 274
  Width = 221
  Height = 21
  TabOrder = 6
end
object SSNDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 302
  Width = 165
  Height = 17
  FocusControl = SSNDbEdit
end
object SSNDbEdit: TDBEdit
  Left = 10
  Top = 316
  Width = 221
  Height = 21
  TabOrder = 7
end
object ID_BaseEntityDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 344
  Width = 165
  Height = 17
  FocusControl = ID_BaseEntityDbEdit
end
object ID_BaseEntityDbEdit: TDBEdit
  Left = 10
  Top = 358
  Width = 221
  Height = 21
  TabOrder = 8
end
object ExternalIDDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 386
  Width = 165
  Height = 17
  FocusControl = ExternalIDDbEdit
end
object ExternalIDDbEdit: TDBEdit
  Left = 10
  Top = 400
  Width = 221
  Height = 21
  TabOrder = 9
end
object ID_UserPersonInsertDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 428
  Width = 165
  Height = 17
  FocusControl = ID_UserPersonInsertDbEdit
end
object ID_UserPersonInsertDbEdit: TDBEdit
  Left = 10
  Top = 442
  Width = 221
  Height = 21
  TabOrder = 10
end
object TimeStampInsertDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 470
  Width = 165
  Height = 17
  FocusControl = TimeStampInsertDbEdit
end
object TimeStampInsertDbEdit: TDBEdit
  Left = 10
  Top = 484
  Width = 221
  Height = 21
  TabOrder = 11
end
object ID_UserPersonUpdateDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 512
  Width = 165
  Height = 17
  FocusControl = ID_UserPersonUpdateDbEdit
end
object ID_UserPersonUpdateDbEdit: TDBEdit
  Left = 10
  Top = 526
  Width = 221
  Height = 21
  TabOrder = 12
end
object TimeStampLastUpdateDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 554
  Width = 165
  Height = 17
  FocusControl = TimeStampLastUpdateDbEdit
end
object TimeStampLastUpdateDbEdit: TDBEdit
  Left = 10
  Top = 568
  Width = 221
  Height = 21
  TabOrder = 13
end
object StartDateTimeDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 596
  Width = 165
  Height = 17
  FocusControl = StartDateTimeDbEdit
end
object StartDateTimeDbEdit: TDBEdit
  Left = 10
  Top = 610
  Width = 221
  Height = 21
  TabOrder = 14
end
object FinishDateTimeDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 638
  Width = 165
  Height = 17
  FocusControl = FinishDateTimeDbEdit
end
object FinishDateTimeDbEdit: TDBEdit
  Left = 10
  Top = 652
  Width = 221
  Height = 21
  TabOrder = 15
end
object RemarkDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 680
  Width = 165
  Height = 17
  FocusControl = RemarkDbEdit
end
object RemarkDbEdit: TDBEdit
  Left = 10
  Top = 694
  Width = 221
  Height = 21
  TabOrder = 16
end

procedure TNaturalPersonWijzigenForm.SetNaturalPerson(const Value: TNaturalPerson);
var
  NaturalPersonList: TNaturalPersonList;
begin
  if Assigned(Value) then
  begin
    NaturalPersonList:= Value.NaturalPersonList;
    AssignDataField(Self.ID_NaturalPersonDbDisplayLabel, Self.ID_NaturalPersonDbEdit, NaturalPersonList.ID_NaturalPersonField);
    AssignDataField(Self.EID_BaseEntityDbDisplayLabel, Self.EID_BaseEntityDbEdit, NaturalPersonList.EID_BaseEntityField);
    AssignDataField(Self.FirstNameDbDisplayLabel, Self.FirstNameDbEdit, NaturalPersonList.FirstNameField);
    AssignDataField(Self.InitialsDbDisplayLabel, Self.InitialsDbEdit, NaturalPersonList.InitialsField);
    AssignDataField(Self.LastNameDbDisplayLabel, Self.LastNameDbEdit, NaturalPersonList.LastNameField);
    AssignDataField(Self.BirthDateDbDisplayLabel, Self.BirthDateDbEdit, NaturalPersonList.BirthDateField);
    AssignDataField(Self.PlaceOfBirthDbDisplayLabel, Self.PlaceOfBirthDbEdit, NaturalPersonList.PlaceOfBirthField);
    AssignDataField(Self.SSNDbDisplayLabel, Self.SSNDbEdit, NaturalPersonList.SSNField);
    AssignDataField(Self.ID_BaseEntityDbDisplayLabel, Self.ID_BaseEntityDbEdit, NaturalPersonList.ID_BaseEntityField);
    AssignDataField(Self.ExternalIDDbDisplayLabel, Self.ExternalIDDbEdit, NaturalPersonList.ExternalIDField);
    AssignDataField(Self.ID_UserPersonInsertDbDisplayLabel, Self.ID_UserPersonInsertDbEdit, NaturalPersonList.ID_UserPersonInsertField);
    AssignDataField(Self.TimeStampInsertDbDisplayLabel, Self.TimeStampInsertDbEdit, NaturalPersonList.TimeStampInsertField);
    AssignDataField(Self.ID_UserPersonUpdateDbDisplayLabel, Self.ID_UserPersonUpdateDbEdit, NaturalPersonList.ID_UserPersonUpdateField);
    AssignDataField(Self.TimeStampLastUpdateDbDisplayLabel, Self.TimeStampLastUpdateDbEdit, NaturalPersonList.TimeStampLastUpdateField);
    AssignDataField(Self.StartDateTimeDbDisplayLabel, Self.StartDateTimeDbEdit, NaturalPersonList.StartDateTimeField);
    AssignDataField(Self.FinishDateTimeDbDisplayLabel, Self.FinishDateTimeDbEdit, NaturalPersonList.FinishDateTimeField);
    AssignDataField(Self.RemarkDbDisplayLabel, Self.RemarkDbEdit, NaturalPersonList.RemarkField);
    FNaturalPerson := Value;
    DataSource.DataSet := NaturalPersonList;
  end
  else
    DataSource.DataSet := nil;
end;
}
end.
