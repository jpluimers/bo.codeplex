unit UserPersonBaseUnit;

interface

uses
  MSConnectionLayerUnit,
  SysUtils,
  ORMEntityUnit,
  DataSetEnumeratorUnit,
  NullablesUnit,
  db,
  ADODB,
  NaturalPersonUnit,
  JoinedColumnPairUnit,
  MSDMLQueryRecordUnit;

type
  TUserPersonBase = class;
  TUserPersonListBase = class;

  TUserPersonBase = class(TNaturalPerson)
  strict protected
    function GetUserPersonListBase(): TUserPersonListBase; virtual;
    function GetEntityListClass(): TEntityListClass; override;
    function GetID_UserPerson(): TNullableInteger; virtual;
    procedure SetID_UserPerson(const Value: TNullableInteger); virtual;
    function GetEID_NaturalPerson(): TNullableInteger; virtual;
    procedure SetEID_NaturalPerson(const Value: TNullableInteger); virtual;
    function GetUserPersonsName(): TNullableString; virtual;
    procedure SetUserPersonsName(const Value: TNullableString); virtual;
    function GetPasswordMD5Hash(): TNullableString; virtual;
    procedure SetPasswordMD5Hash(const Value: TNullableString); virtual;
    property UserPersonList: TUserPersonListBase read GetUserPersonListBase;
  public
    property ID_UserPerson: TNullableInteger read GetID_UserPerson write SetID_UserPerson;
    property EID_NaturalPerson: TNullableInteger read GetEID_NaturalPerson write SetEID_NaturalPerson;
    property UserPersonsName: TNullableString read GetUserPersonsName write SetUserPersonsName;
    property PasswordMD5Hash: TNullableString read GetPasswordMD5Hash write SetPasswordMD5Hash;
  end;

  TUserPersonListBaseClientDataSet = class(TNaturalPersonList)
  strict protected
    procedure FillValidCriterionFieldNames(); override;
    function GetData(): Integer; overload; override;
    function GetEntityClass(): TEntityClass; overload; override;
    function GetID_UserPersonField(): TIntegerField; virtual;
    function GetEID_NaturalPersonField(): TIntegerField; virtual;
    function GetUserPersonsNameField(): TStringField; virtual;
    function GetPasswordMD5HashField(): TStringField; virtual;
  public
    const
      ID_UserPersonFieldName = 'ID_UserPerson';
      ID_UserPerson_ChangedParameterName = 'ID_UserPerson_Changed';
      EID_NaturalPersonFieldName = 'EID_NaturalPerson';
      EID_NaturalPerson_ChangedParameterName = 'EID_NaturalPerson_Changed';
      UserPersonsNameFieldName = 'UserPersonsName';
      UserPersonsName_ChangedParameterName = 'UserPersonsName_Changed';
      PasswordMD5HashFieldName = 'PasswordMD5Hash';
      PasswordMD5Hash_ChangedParameterName = 'PasswordMD5Hash_Changed';
    property ID_UserPersonField: TIntegerField read GetID_UserPersonField;
    property EID_NaturalPersonField: TIntegerField read GetEID_NaturalPersonField;
    property UserPersonsNameField: TStringField read GetUserPersonsNameField;
    property PasswordMD5HashField: TStringField read GetPasswordMD5HashField;
  end;

  TUserPersonBaseEnumerator = class(TEntityListEnumerator)
  strict private
    function GetCurrent(): TUserPersonBase;
  public
    property Current: TUserPersonBase read GetCurrent;
  end;

  TUserPersonListBase = class(TUserPersonListBaseClientDataSet)
  strict private
    procedure SetDeleteQueryText(var DeleteQueryText: string);
    procedure SetInsertQueryText(var InsertQueryText: string);
    procedure SetUpdateQueryText(var UpdateQueryText: string);
    procedure SetParams(const DBQuery: TDBQuery);
    function FillJoinedColumnPair(): TJoinedColumnPair;
  strict protected
    procedure SetReadQueryText(const ReadQuery: TDBQuery); override;
    procedure FillDeleteQueryRecordList(const DeleteQueryRecordList: TMSDMLQueryRecordList); override;
    procedure FillInsertQueryRecordList(const InsertQueryRecordList: TMSDMLQueryRecordList); override;
    procedure FillUpdateQueryRecordList(const UpdateQueryRecordList: TMSDMLQueryRecordList); override;
    function GetID_UserPerson(): TNullableInteger; virtual;
    procedure SetID_UserPerson(const Value: TNullableInteger); virtual;
    function GetEID_NaturalPerson(): TNullableInteger; virtual;
    procedure SetEID_NaturalPerson(const Value: TNullableInteger); virtual;
    function GetUserPersonsName(): TNullableString; virtual;
    procedure SetUserPersonsName(const Value: TNullableString); virtual;
    function GetPasswordMD5Hash(): TNullableString; virtual;
    procedure SetPasswordMD5Hash(const Value: TNullableString); virtual;
  public
    const
      UserPerson_TableName = 'UserPerson';
    function GetEnumerator(): TUserPersonBaseEnumerator;
    property ID_UserPerson: TNullableInteger read GetID_UserPerson write SetID_UserPerson;
    property EID_NaturalPerson: TNullableInteger read GetEID_NaturalPerson write SetEID_NaturalPerson;
    property UserPersonsName: TNullableString read GetUserPersonsName write SetUserPersonsName;
    property PasswordMD5Hash: TNullableString read GetPasswordMD5Hash write SetPasswordMD5Hash;
  end;

implementation

uses
  FieldHelperUnit;

{ TUserPersonBase }

function TUserPersonBase.GetUserPersonListBase(): TUserPersonListBase;
begin
  Result := EntityList as TUserPersonListBase;
end;

function TUserPersonBase.GetEntityListClass(): TEntityListClass;
begin
  Result := TUserPersonListBase;
end;

function TUserPersonBase.GetID_UserPerson(): TNullableInteger;
var
  Value: TNullableInteger;
begin
  ExecuteAtDictionaryID(
  procedure
  begin
    Value := UserPersonList.ID_UserPerson;
  end
  );
  Result := Value;
end;

procedure TUserPersonBase.SetID_UserPerson(const Value: TNullableInteger);
var
  NewValue: TNullableInteger;
begin
  NewValue := Value;
  ExecuteAtBookmarkInEditMode(
    procedure
    begin
      UserPersonList.ID_UserPerson := NewValue;
    end
  );
end;

function TUserPersonBase.GetEID_NaturalPerson(): TNullableInteger;
var
  Value: TNullableInteger;
begin
  ExecuteAtDictionaryID(
  procedure
  begin
    Value := UserPersonList.EID_NaturalPerson;
  end
  );
  Result := Value;
end;

procedure TUserPersonBase.SetEID_NaturalPerson(const Value: TNullableInteger);
var
  NewValue: TNullableInteger;
begin
  NewValue := Value;
  ExecuteAtBookmarkInEditMode(
    procedure
    begin
      UserPersonList.EID_NaturalPerson := NewValue;
    end
  );
end;

function TUserPersonBase.GetUserPersonsName(): TNullableString;
var
  Value: TNullableString;
begin
  ExecuteAtDictionaryID(
  procedure
  begin
    Value := UserPersonList.UserPersonsName;
  end
  );
  Result := Value;
end;

procedure TUserPersonBase.SetUserPersonsName(const Value: TNullableString);
var
  NewValue: TNullableString;
begin
  NewValue := Value;
  ExecuteAtBookmarkInEditMode(
    procedure
    begin
      UserPersonList.UserPersonsName := NewValue;
    end
  );
end;

function TUserPersonBase.GetPasswordMD5Hash(): TNullableString;
var
  Value: TNullableString;
begin
  ExecuteAtDictionaryID(
  procedure
  begin
    Value := UserPersonList.PasswordMD5Hash;
  end
  );
  Result := Value;
end;

procedure TUserPersonBase.SetPasswordMD5Hash(const Value: TNullableString);
var
  NewValue: TNullableString;
begin
  NewValue := Value;
  ExecuteAtBookmarkInEditMode(
    procedure
    begin
      UserPersonList.PasswordMD5Hash := NewValue;
    end
  );
end;

{ TUserPersonListBaseClientDataSet }

procedure TUserPersonListBaseClientDataSet.FillValidCriterionFieldNames();
begin
  inherited FillValidCriterionFieldNames();
  ValidCriterionFieldNames.Add(ID_UserPersonFieldName);
  ValidCriterionFieldNames.Add(EID_NaturalPersonFieldName);
  ValidCriterionFieldNames.Add(UserPersonsNameFieldName);
  ValidCriterionFieldNames.Add(PasswordMD5HashFieldName);
end;

function TUserPersonListBaseClientDataSet.GetData(): Integer;
begin
  Result := inherited GetData();
  UserPersonsNameField.Required := True;
  PasswordMD5HashField.Required := True;
end;

function TUserPersonListBaseClientDataSet.GetEntityClass(): TEntityClass;
begin
  Result := TUserPersonBase;
end;

function TUserPersonListBaseClientDataSet.GetID_UserPersonField(): TIntegerField;
begin
  Result := Fields.FieldByName(ID_UserPersonFieldName) as TIntegerField;
end;

function TUserPersonListBaseClientDataSet.GetEID_NaturalPersonField(): TIntegerField;
begin
  Result := Fields.FieldByName(EID_NaturalPersonFieldName) as TIntegerField;
end;

function TUserPersonListBaseClientDataSet.GetUserPersonsNameField(): TStringField;
begin
  Result := Fields.FieldByName(UserPersonsNameFieldName) as TStringField;
end;

function TUserPersonListBaseClientDataSet.GetPasswordMD5HashField(): TStringField;
begin
  Result := Fields.FieldByName(PasswordMD5HashFieldName) as TStringField;
end;

{ TUserPersonBaseEnumerator }

function TUserPersonBaseEnumerator.GetCurrent(): TUserPersonBase;
var
  Entity: TEntity;
begin
  Entity := inherited Current;
  Result := Entity as TUserPersonBase;
end;

{ TUserPersonListBase }

procedure TUserPersonListBase.SetDeleteQueryText(var DeleteQueryText: string);
begin
  DeleteQueryText := 'DELETE FROM UserPerson WHERE ID_UserPerson = :ID_UserPerson';
end;

procedure TUserPersonListBase.SetInsertQueryText(var InsertQueryText: string);
begin
  InsertQueryText :=
  'INSERT INTO UserPerson (' +
  '  EID_NaturalPerson, ' +
  '  UserPersonsName, ' +
  '  PasswordMD5Hash  ) VALUES (' +
  '  :EID_NaturalPerson_Changed, ' +
  '  :UserPersonsName_Changed, ' +
  '  :PasswordMD5Hash_Changed  )';
end;

procedure TUserPersonListBase.SetReadQueryText(const ReadQuery: TDBQuery);
begin
  ReadQuery.SQL.Add('   SELECT ' +
  '  UserPerson.ID_UserPerson, ' +
  '  UserPerson.EID_NaturalPerson, ' +
  '  UserPerson.UserPersonsName, ' +
  '  UserPerson.PasswordMD5Hash, ' +
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
  '   FROM (( UserPerson ' +
  '   LEFT JOIN NaturalPerson ON NaturalPerson.ID_NaturalPerson = UserPerson.EID_NaturalPerson) ' +
  '   LEFT JOIN BaseEntity ON BaseEntity.ID_BaseEntity = NaturalPerson.EID_BaseEntity) ' +
  'WHERE (1=1) '
  );
end;

procedure TUserPersonListBase.SetUpdateQueryText(var UpdateQueryText: string);
begin
  UpdateQueryText :=
  'UPDATE UserPerson ' + 'SET ' +
  '  EID_NaturalPerson = :EID_NaturalPerson_Changed, ' +
  '  UserPersonsName = :UserPersonsName_Changed, ' +
  '  PasswordMD5Hash = :PasswordMD5Hash_Changed ' +
  'WHERE ID_UserPerson = :ID_UserPerson ';
end;

procedure TUserPersonListBase.SetParams(const DBQuery: TDBQuery);
begin
  DBQuery.AssignParam(EID_NaturalPerson, EID_NaturalPerson_ChangedParameterName);
  DBQuery.AssignParam(UserPersonsName, UserPersonsName_ChangedParameterName);
  DBQuery.AssignParam(PasswordMD5Hash, PasswordMD5Hash_ChangedParameterName);
end;

function TUserPersonListBase.FillJoinedColumnPair(): TJoinedColumnPair;
begin
  Result := TJoinedColumnPair.Create(UserPerson_TableName, EID_NaturalPersonFieldName, NaturalPerson_TableName, ID_NaturalPersonFieldName);
end;

procedure TUserPersonListBase.FillDeleteQueryRecordList(const DeleteQueryRecordList: TMSDMLQueryRecordList);
var
  DeleteQueryRecord: TMSDMLQueryRecord;
begin
  inherited FillDeleteQueryRecordList(DeleteQueryRecordList);
  DeleteQueryRecord.SetQueryTextMethod := Self.SetDeleteQueryText;
  DeleteQueryRecord.SetParamsMethod := nil;
  DeleteQueryRecord.JoinedColumnPair := FillJoinedColumnPair();
  DeleteQueryRecordList.Add(DeleteQueryRecord);
end;

procedure TUserPersonListBase.FillInsertQueryRecordList(const InsertQueryRecordList: TMSDMLQueryRecordList);
var
  InsertQueryRecord: TMSDMLQueryRecord;
begin
  inherited FillInsertQueryRecordList(InsertQueryRecordList);
  InsertQueryRecord.SetQueryTextMethod := Self.SetInsertQueryText;
  InsertQueryRecord.SetParamsMethod := Self.SetParams;
  InsertQueryRecord.JoinedColumnPair := FillJoinedColumnPair();
  InsertQueryRecordList.Add(InsertQueryRecord);
end;

procedure TUserPersonListBase.FillUpdateQueryRecordList(const UpdateQueryRecordList: TMSDMLQueryRecordList);
var
  UpdateQueryRecord: TMSDMLQueryRecord;
begin
  inherited FillUpdateQueryRecordList(UpdateQueryRecordList);
  UpdateQueryRecord.SetQueryTextMethod := Self.SetUpdateQueryText;
  UpdateQueryRecord.SetParamsMethod := Self.SetParams;
  UpdateQueryRecord.JoinedColumnPair := FillJoinedColumnPair();
  UpdateQueryRecordList.Add(UpdateQueryRecord);
end;

function TUserPersonListBase.GetID_UserPerson(): TNullableInteger;
begin
  Result := ID_UserPersonField.AsNullableInteger;
end;

procedure TUserPersonListBase.SetID_UserPerson(const Value: TNullableInteger);
begin
  ID_UserPersonField.AsNullableInteger := Value;
end;

function TUserPersonListBase.GetEID_NaturalPerson(): TNullableInteger;
begin
  Result := EID_NaturalPersonField.AsNullableInteger;
end;

procedure TUserPersonListBase.SetEID_NaturalPerson(const Value: TNullableInteger);
begin
  EID_NaturalPersonField.AsNullableInteger := Value;
end;

function TUserPersonListBase.GetUserPersonsName(): TNullableString;
begin
  Result := UserPersonsNameField.AsNullableString;
end;

procedure TUserPersonListBase.SetUserPersonsName(const Value: TNullableString);
begin
  UserPersonsNameField.AsNullableString := Value;
end;

function TUserPersonListBase.GetPasswordMD5Hash(): TNullableString;
begin
  Result := PasswordMD5HashField.AsNullableString;
end;

procedure TUserPersonListBase.SetPasswordMD5Hash(const Value: TNullableString);
begin
  PasswordMD5HashField.AsNullableString := Value;
end;

function TUserPersonListBase.GetEnumerator(): TUserPersonBaseEnumerator;
begin
  Result := TUserPersonBaseEnumerator.Create(Self);
end;

{
object ID_UserPersonDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 8
  Width = 165
  Height = 17
  FocusControl = ID_UserPersonDbEdit
end
object ID_UserPersonDbEdit: TDBEdit
  Left = 10
  Top = 22
  Width = 221
  Height = 21
  TabOrder = 0
end
object EID_NaturalPersonDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 50
  Width = 165
  Height = 17
  FocusControl = EID_NaturalPersonDbEdit
end
object EID_NaturalPersonDbEdit: TDBEdit
  Left = 10
  Top = 64
  Width = 221
  Height = 21
  TabOrder = 1
end
object UserPersonsNameDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 92
  Width = 165
  Height = 17
  FocusControl = UserPersonsNameDbEdit
end
object UserPersonsNameDbEdit: TDBEdit
  Left = 10
  Top = 106
  Width = 221
  Height = 21
  TabOrder = 2
end
object PasswordMD5HashDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 134
  Width = 165
  Height = 17
  FocusControl = PasswordMD5HashDbEdit
end
object PasswordMD5HashDbEdit: TDBEdit
  Left = 10
  Top = 148
  Width = 221
  Height = 21
  TabOrder = 3
end
object ID_NaturalPersonDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 176
  Width = 165
  Height = 17
  FocusControl = ID_NaturalPersonDbEdit
end
object ID_NaturalPersonDbEdit: TDBEdit
  Left = 10
  Top = 190
  Width = 221
  Height = 21
  TabOrder = 4
end
object EID_BaseEntityDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 218
  Width = 165
  Height = 17
  FocusControl = EID_BaseEntityDbEdit
end
object EID_BaseEntityDbEdit: TDBEdit
  Left = 10
  Top = 232
  Width = 221
  Height = 21
  TabOrder = 5
end
object FirstNameDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 260
  Width = 165
  Height = 17
  FocusControl = FirstNameDbEdit
end
object FirstNameDbEdit: TDBEdit
  Left = 10
  Top = 274
  Width = 221
  Height = 21
  TabOrder = 6
end
object InitialsDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 302
  Width = 165
  Height = 17
  FocusControl = InitialsDbEdit
end
object InitialsDbEdit: TDBEdit
  Left = 10
  Top = 316
  Width = 221
  Height = 21
  TabOrder = 7
end
object LastNameDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 344
  Width = 165
  Height = 17
  FocusControl = LastNameDbEdit
end
object LastNameDbEdit: TDBEdit
  Left = 10
  Top = 358
  Width = 221
  Height = 21
  TabOrder = 8
end
object BirthDateDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 386
  Width = 165
  Height = 17
  FocusControl = BirthDateDbEdit
end
object BirthDateDbEdit: TDBEdit
  Left = 10
  Top = 400
  Width = 221
  Height = 21
  TabOrder = 9
end
object PlaceOfBirthDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 428
  Width = 165
  Height = 17
  FocusControl = PlaceOfBirthDbEdit
end
object PlaceOfBirthDbEdit: TDBEdit
  Left = 10
  Top = 442
  Width = 221
  Height = 21
  TabOrder = 10
end
object SSNDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 470
  Width = 165
  Height = 17
  FocusControl = SSNDbEdit
end
object SSNDbEdit: TDBEdit
  Left = 10
  Top = 484
  Width = 221
  Height = 21
  TabOrder = 11
end
object ID_BaseEntityDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 512
  Width = 165
  Height = 17
  FocusControl = ID_BaseEntityDbEdit
end
object ID_BaseEntityDbEdit: TDBEdit
  Left = 10
  Top = 526
  Width = 221
  Height = 21
  TabOrder = 12
end
object ExternalIDDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 554
  Width = 165
  Height = 17
  FocusControl = ExternalIDDbEdit
end
object ExternalIDDbEdit: TDBEdit
  Left = 10
  Top = 568
  Width = 221
  Height = 21
  TabOrder = 13
end
object ID_UserPersonInsertDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 596
  Width = 165
  Height = 17
  FocusControl = ID_UserPersonInsertDbEdit
end
object ID_UserPersonInsertDbEdit: TDBEdit
  Left = 10
  Top = 610
  Width = 221
  Height = 21
  TabOrder = 14
end
object TimeStampInsertDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 638
  Width = 165
  Height = 17
  FocusControl = TimeStampInsertDbEdit
end
object TimeStampInsertDbEdit: TDBEdit
  Left = 10
  Top = 652
  Width = 221
  Height = 21
  TabOrder = 15
end
object ID_UserPersonUpdateDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 680
  Width = 165
  Height = 17
  FocusControl = ID_UserPersonUpdateDbEdit
end
object ID_UserPersonUpdateDbEdit: TDBEdit
  Left = 10
  Top = 694
  Width = 221
  Height = 21
  TabOrder = 16
end
object TimeStampLastUpdateDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 722
  Width = 165
  Height = 17
  FocusControl = TimeStampLastUpdateDbEdit
end
object TimeStampLastUpdateDbEdit: TDBEdit
  Left = 10
  Top = 736
  Width = 221
  Height = 21
  TabOrder = 17
end
object StartDateTimeDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 764
  Width = 165
  Height = 17
  FocusControl = StartDateTimeDbEdit
end
object StartDateTimeDbEdit: TDBEdit
  Left = 10
  Top = 778
  Width = 221
  Height = 21
  TabOrder = 18
end
object FinishDateTimeDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 806
  Width = 165
  Height = 17
  FocusControl = FinishDateTimeDbEdit
end
object FinishDateTimeDbEdit: TDBEdit
  Left = 10
  Top = 820
  Width = 221
  Height = 21
  TabOrder = 19
end
object RemarkDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 848
  Width = 165
  Height = 17
  FocusControl = RemarkDbEdit
end
object RemarkDbEdit: TDBEdit
  Left = 10
  Top = 862
  Width = 221
  Height = 21
  TabOrder = 20
end

procedure TUserPersonWijzigenForm.SetUserPerson(const Value: TUserPerson);
var
  UserPersonList: TUserPersonList;
begin
  if Assigned(Value) then
  begin
    UserPersonList:= Value.UserPersonList;
    AssignDataField(Self.ID_UserPersonDbDisplayLabel, Self.ID_UserPersonDbEdit, UserPersonList.ID_UserPersonField);
    AssignDataField(Self.EID_NaturalPersonDbDisplayLabel, Self.EID_NaturalPersonDbEdit, UserPersonList.EID_NaturalPersonField);
    AssignDataField(Self.UserPersonsNameDbDisplayLabel, Self.UserPersonsNameDbEdit, UserPersonList.UserPersonsNameField);
    AssignDataField(Self.PasswordMD5HashDbDisplayLabel, Self.PasswordMD5HashDbEdit, UserPersonList.PasswordMD5HashField);
    AssignDataField(Self.ID_NaturalPersonDbDisplayLabel, Self.ID_NaturalPersonDbEdit, UserPersonList.ID_NaturalPersonField);
    AssignDataField(Self.EID_BaseEntityDbDisplayLabel, Self.EID_BaseEntityDbEdit, UserPersonList.EID_BaseEntityField);
    AssignDataField(Self.FirstNameDbDisplayLabel, Self.FirstNameDbEdit, UserPersonList.FirstNameField);
    AssignDataField(Self.InitialsDbDisplayLabel, Self.InitialsDbEdit, UserPersonList.InitialsField);
    AssignDataField(Self.LastNameDbDisplayLabel, Self.LastNameDbEdit, UserPersonList.LastNameField);
    AssignDataField(Self.BirthDateDbDisplayLabel, Self.BirthDateDbEdit, UserPersonList.BirthDateField);
    AssignDataField(Self.PlaceOfBirthDbDisplayLabel, Self.PlaceOfBirthDbEdit, UserPersonList.PlaceOfBirthField);
    AssignDataField(Self.SSNDbDisplayLabel, Self.SSNDbEdit, UserPersonList.SSNField);
    AssignDataField(Self.ID_BaseEntityDbDisplayLabel, Self.ID_BaseEntityDbEdit, UserPersonList.ID_BaseEntityField);
    AssignDataField(Self.ExternalIDDbDisplayLabel, Self.ExternalIDDbEdit, UserPersonList.ExternalIDField);
    AssignDataField(Self.ID_UserPersonInsertDbDisplayLabel, Self.ID_UserPersonInsertDbEdit, UserPersonList.ID_UserPersonInsertField);
    AssignDataField(Self.TimeStampInsertDbDisplayLabel, Self.TimeStampInsertDbEdit, UserPersonList.TimeStampInsertField);
    AssignDataField(Self.ID_UserPersonUpdateDbDisplayLabel, Self.ID_UserPersonUpdateDbEdit, UserPersonList.ID_UserPersonUpdateField);
    AssignDataField(Self.TimeStampLastUpdateDbDisplayLabel, Self.TimeStampLastUpdateDbEdit, UserPersonList.TimeStampLastUpdateField);
    AssignDataField(Self.StartDateTimeDbDisplayLabel, Self.StartDateTimeDbEdit, UserPersonList.StartDateTimeField);
    AssignDataField(Self.FinishDateTimeDbDisplayLabel, Self.FinishDateTimeDbEdit, UserPersonList.FinishDateTimeField);
    AssignDataField(Self.RemarkDbDisplayLabel, Self.RemarkDbEdit, UserPersonList.RemarkField);
    FUserPerson := Value;
    DataSource.DataSet := UserPersonList;
  end
  else
    DataSource.DataSet := nil;
end;
}
end.
