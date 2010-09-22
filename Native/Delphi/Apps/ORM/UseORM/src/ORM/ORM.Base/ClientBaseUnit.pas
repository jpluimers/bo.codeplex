unit ClientBaseUnit;

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
  TClientBase = class;
  TClientListBase = class;

  TClientBase = class(TNaturalPerson)
  strict protected
    function GetClientListBase(): TClientListBase; virtual;
    function GetEntityListClass(): TEntityListClass; override;
    function GetID_Client(): TNullableInteger; virtual;
    procedure SetID_Client(const Value: TNullableInteger); virtual;
    function GetEID_NaturalPerson(): TNullableInteger; virtual;
    procedure SetEID_NaturalPerson(const Value: TNullableInteger); virtual;
    function GetID_Company_LegalPerson(): TNullableInteger; virtual;
    procedure SetID_Company_LegalPerson(const Value: TNullableInteger); virtual;
    property ClientList: TClientListBase read GetClientListBase;
  public
    property ID_Client: TNullableInteger read GetID_Client write SetID_Client;
    property EID_NaturalPerson: TNullableInteger read GetEID_NaturalPerson write SetEID_NaturalPerson;
    property ID_Company_LegalPerson: TNullableInteger read GetID_Company_LegalPerson write SetID_Company_LegalPerson;
  end;

  TClientListBaseClientDataSet = class(TNaturalPersonList)
  strict protected
    function GetData(): Integer; overload; override;
    function GetEntityClass(): TEntityClass; overload; override;
    function GetID_ClientField(): TIntegerField; virtual;
    function GetEID_NaturalPersonField(): TIntegerField; virtual;
    function GetID_Company_LegalPersonField(): TIntegerField; virtual;
  public
    const
      ID_ClientFieldName = 'ID_Client';
      ID_Client_ChangedParameterName = 'ID_Client_Changed';
      EID_NaturalPersonFieldName = 'EID_NaturalPerson';
      EID_NaturalPerson_ChangedParameterName = 'EID_NaturalPerson_Changed';
      ID_Company_LegalPersonFieldName = 'ID_Company_LegalPerson';
      ID_Company_LegalPerson_ChangedParameterName = 'ID_Company_LegalPerson_Changed';
    property ID_ClientField: TIntegerField read GetID_ClientField;
    property EID_NaturalPersonField: TIntegerField read GetEID_NaturalPersonField;
    property ID_Company_LegalPersonField: TIntegerField read GetID_Company_LegalPersonField;
  end;

  TClientBaseEnumerator = class(TEntityListEnumerator)
  strict private
    function GetCurrent(): TClientBase;
  public
    property Current: TClientBase read GetCurrent;
  end;

  TClientListBase = class(TClientListBaseClientDataSet)
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
    function GetID_Client(): TNullableInteger; virtual;
    procedure SetID_Client(const Value: TNullableInteger); virtual;
    function GetEID_NaturalPerson(): TNullableInteger; virtual;
    procedure SetEID_NaturalPerson(const Value: TNullableInteger); virtual;
    function GetID_Company_LegalPerson(): TNullableInteger; virtual;
    procedure SetID_Company_LegalPerson(const Value: TNullableInteger); virtual;
  public
    const
      Client_TableName = 'Client';
    function GetEnumerator(): TClientBaseEnumerator;
    property ID_Client: TNullableInteger read GetID_Client write SetID_Client;
    property EID_NaturalPerson: TNullableInteger read GetEID_NaturalPerson write SetEID_NaturalPerson;
    property ID_Company_LegalPerson: TNullableInteger read GetID_Company_LegalPerson write SetID_Company_LegalPerson;
  end;

implementation

uses
  FieldHelperUnit;

{ TClientBase }

function TClientBase.GetClientListBase(): TClientListBase;
begin
  Result := EntityList as TClientListBase;
end;

function TClientBase.GetEntityListClass(): TEntityListClass;
begin
  Result := TClientListBase;
end;

function TClientBase.GetID_Client(): TNullableInteger;
var
  Value: TNullableInteger;
begin
  ExecuteAtDictionaryID(
  procedure
  begin
    Value := ClientList.ID_Client;
  end
  );
  Result := Value;
end;

procedure TClientBase.SetID_Client(const Value: TNullableInteger);
var
  NewValue: TNullableInteger;
begin
  NewValue := Value;
  ExecuteAtBookmarkInEditMode(
    procedure
    begin
      ClientList.ID_Client := NewValue;
    end
  );
end;

function TClientBase.GetEID_NaturalPerson(): TNullableInteger;
var
  Value: TNullableInteger;
begin
  ExecuteAtDictionaryID(
  procedure
  begin
    Value := ClientList.EID_NaturalPerson;
  end
  );
  Result := Value;
end;

procedure TClientBase.SetEID_NaturalPerson(const Value: TNullableInteger);
var
  NewValue: TNullableInteger;
begin
  NewValue := Value;
  ExecuteAtBookmarkInEditMode(
    procedure
    begin
      ClientList.EID_NaturalPerson := NewValue;
    end
  );
end;

function TClientBase.GetID_Company_LegalPerson(): TNullableInteger;
var
  Value: TNullableInteger;
begin
  ExecuteAtDictionaryID(
  procedure
  begin
    Value := ClientList.ID_Company_LegalPerson;
  end
  );
  Result := Value;
end;

procedure TClientBase.SetID_Company_LegalPerson(const Value: TNullableInteger);
var
  NewValue: TNullableInteger;
begin
  NewValue := Value;
  ExecuteAtBookmarkInEditMode(
    procedure
    begin
      ClientList.ID_Company_LegalPerson := NewValue;
    end
  );
end;

{ TClientListBaseClientDataSet }

function TClientListBaseClientDataSet.GetData(): Integer;
begin
  Result := inherited GetData();
end;

function TClientListBaseClientDataSet.GetEntityClass(): TEntityClass;
begin
  Result := TClientBase;
end;

function TClientListBaseClientDataSet.GetID_ClientField(): TIntegerField;
begin
  Result := Fields.FieldByName(ID_ClientFieldName) as TIntegerField;
end;

function TClientListBaseClientDataSet.GetEID_NaturalPersonField(): TIntegerField;
begin
  Result := Fields.FieldByName(EID_NaturalPersonFieldName) as TIntegerField;
end;

function TClientListBaseClientDataSet.GetID_Company_LegalPersonField(): TIntegerField;
begin
  Result := Fields.FieldByName(ID_Company_LegalPersonFieldName) as TIntegerField;
end;

{ TClientBaseEnumerator }

function TClientBaseEnumerator.GetCurrent(): TClientBase;
var
  Entity: TEntity;
begin
  Entity := inherited Current;
  Result := Entity as TClientBase;
end;

{ TClientListBase }

procedure TClientListBase.SetDeleteQueryText(var DeleteQueryText: string);
begin
  DeleteQueryText := 'DELETE FROM Client WHERE ID_Client = :ID_Client';
end;

procedure TClientListBase.SetInsertQueryText(var InsertQueryText: string);
begin
  InsertQueryText :=
  'INSERT INTO Client (' +
  '  EID_NaturalPerson, ' +
  '  ID_Company_LegalPerson  ) VALUES (' +
  '  :EID_NaturalPerson_Changed, ' +
  '  :ID_Company_LegalPerson_Changed  )';
end;

procedure TClientListBase.SetReadQueryText(const ReadQuery: TDBQuery);
begin
  ReadQuery.SQL.Add('   SELECT ' +
  '  Client.ID_Client, ' +
  '  Client.EID_NaturalPerson, ' +
  '  Client.ID_Company_LegalPerson, ' +
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
  '   FROM (( Client ' +
  '   LEFT JOIN NaturalPerson ON NaturalPerson.ID_NaturalPerson = Client.EID_NaturalPerson) ' +
  '   LEFT JOIN BaseEntity ON BaseEntity.ID_BaseEntity = NaturalPerson.EID_BaseEntity) ' +
  'WHERE (1=1) '
  );
end;

procedure TClientListBase.SetUpdateQueryText(var UpdateQueryText: string);
begin
  UpdateQueryText :=
  'UPDATE Client ' + 'SET ' +
  '  EID_NaturalPerson = :EID_NaturalPerson_Changed, ' +
  '  ID_Company_LegalPerson = :ID_Company_LegalPerson_Changed ' +
  'WHERE ID_Client = :ID_Client ';
end;

procedure TClientListBase.SetParams(const DBQuery: TDBQuery);
begin
  DBQuery.AssignParam(EID_NaturalPerson, EID_NaturalPerson_ChangedParameterName);
  DBQuery.AssignParam(ID_Company_LegalPerson, ID_Company_LegalPerson_ChangedParameterName);
end;

function TClientListBase.FillJoinedColumnPair(): TJoinedColumnPair;
begin
  Result := TJoinedColumnPair.Create(Client_TableName, EID_NaturalPersonFieldName, NaturalPerson_TableName, ID_NaturalPersonFieldName);
end;

procedure TClientListBase.FillDeleteQueryRecordList(const DeleteQueryRecordList: TMSDMLQueryRecordList);
var
  DeleteQueryRecord: TMSDMLQueryRecord;
begin
  inherited FillDeleteQueryRecordList(DeleteQueryRecordList);
  DeleteQueryRecord.SetQueryTextMethod := Self.SetDeleteQueryText;
  DeleteQueryRecord.SetParamsMethod := nil;
  DeleteQueryRecord.JoinedColumnPair := FillJoinedColumnPair();
  DeleteQueryRecordList.Add(DeleteQueryRecord);
end;

procedure TClientListBase.FillInsertQueryRecordList(const InsertQueryRecordList: TMSDMLQueryRecordList);
var
  InsertQueryRecord: TMSDMLQueryRecord;
begin
  inherited FillInsertQueryRecordList(InsertQueryRecordList);
  InsertQueryRecord.SetQueryTextMethod := Self.SetInsertQueryText;
  InsertQueryRecord.SetParamsMethod := Self.SetParams;
  InsertQueryRecord.JoinedColumnPair := FillJoinedColumnPair();
  InsertQueryRecordList.Add(InsertQueryRecord);
end;

procedure TClientListBase.FillUpdateQueryRecordList(const UpdateQueryRecordList: TMSDMLQueryRecordList);
var
  UpdateQueryRecord: TMSDMLQueryRecord;
begin
  inherited FillUpdateQueryRecordList(UpdateQueryRecordList);
  UpdateQueryRecord.SetQueryTextMethod := Self.SetUpdateQueryText;
  UpdateQueryRecord.SetParamsMethod := Self.SetParams;
  UpdateQueryRecord.JoinedColumnPair := FillJoinedColumnPair();
  UpdateQueryRecordList.Add(UpdateQueryRecord);
end;

function TClientListBase.GetID_Client(): TNullableInteger;
begin
  Result := ID_ClientField.AsNullableInteger;
end;

procedure TClientListBase.SetID_Client(const Value: TNullableInteger);
begin
  ID_ClientField.AsNullableInteger := Value;
end;

function TClientListBase.GetEID_NaturalPerson(): TNullableInteger;
begin
  Result := EID_NaturalPersonField.AsNullableInteger;
end;

procedure TClientListBase.SetEID_NaturalPerson(const Value: TNullableInteger);
begin
  EID_NaturalPersonField.AsNullableInteger := Value;
end;

function TClientListBase.GetID_Company_LegalPerson(): TNullableInteger;
begin
  Result := ID_Company_LegalPersonField.AsNullableInteger;
end;

procedure TClientListBase.SetID_Company_LegalPerson(const Value: TNullableInteger);
begin
  ID_Company_LegalPersonField.AsNullableInteger := Value;
end;

function TClientListBase.GetEnumerator(): TClientBaseEnumerator;
begin
  Result := TClientBaseEnumerator.Create(Self);
end;

{
object ID_ClientDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 8
  Width = 165
  Height = 17
  FocusControl = ID_ClientDbEdit
end
object ID_ClientDbEdit: TDBEdit
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
object ID_Company_LegalPersonDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 92
  Width = 165
  Height = 17
  FocusControl = ID_Company_LegalPersonDbEdit
end
object ID_Company_LegalPersonDbEdit: TDBEdit
  Left = 10
  Top = 106
  Width = 221
  Height = 21
  TabOrder = 2
end
object ID_NaturalPersonDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 134
  Width = 165
  Height = 17
  FocusControl = ID_NaturalPersonDbEdit
end
object ID_NaturalPersonDbEdit: TDBEdit
  Left = 10
  Top = 148
  Width = 221
  Height = 21
  TabOrder = 3
end
object EID_BaseEntityDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 176
  Width = 165
  Height = 17
  FocusControl = EID_BaseEntityDbEdit
end
object EID_BaseEntityDbEdit: TDBEdit
  Left = 10
  Top = 190
  Width = 221
  Height = 21
  TabOrder = 4
end
object FirstNameDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 218
  Width = 165
  Height = 17
  FocusControl = FirstNameDbEdit
end
object FirstNameDbEdit: TDBEdit
  Left = 10
  Top = 232
  Width = 221
  Height = 21
  TabOrder = 5
end
object InitialsDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 260
  Width = 165
  Height = 17
  FocusControl = InitialsDbEdit
end
object InitialsDbEdit: TDBEdit
  Left = 10
  Top = 274
  Width = 221
  Height = 21
  TabOrder = 6
end
object LastNameDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 302
  Width = 165
  Height = 17
  FocusControl = LastNameDbEdit
end
object LastNameDbEdit: TDBEdit
  Left = 10
  Top = 316
  Width = 221
  Height = 21
  TabOrder = 7
end
object BirthDateDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 344
  Width = 165
  Height = 17
  FocusControl = BirthDateDbEdit
end
object BirthDateDbEdit: TDBEdit
  Left = 10
  Top = 358
  Width = 221
  Height = 21
  TabOrder = 8
end
object PlaceOfBirthDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 386
  Width = 165
  Height = 17
  FocusControl = PlaceOfBirthDbEdit
end
object PlaceOfBirthDbEdit: TDBEdit
  Left = 10
  Top = 400
  Width = 221
  Height = 21
  TabOrder = 9
end
object SSNDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 428
  Width = 165
  Height = 17
  FocusControl = SSNDbEdit
end
object SSNDbEdit: TDBEdit
  Left = 10
  Top = 442
  Width = 221
  Height = 21
  TabOrder = 10
end
object ID_BaseEntityDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 470
  Width = 165
  Height = 17
  FocusControl = ID_BaseEntityDbEdit
end
object ID_BaseEntityDbEdit: TDBEdit
  Left = 10
  Top = 484
  Width = 221
  Height = 21
  TabOrder = 11
end
object ExternalIDDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 512
  Width = 165
  Height = 17
  FocusControl = ExternalIDDbEdit
end
object ExternalIDDbEdit: TDBEdit
  Left = 10
  Top = 526
  Width = 221
  Height = 21
  TabOrder = 12
end
object ID_UserPersonInsertDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 554
  Width = 165
  Height = 17
  FocusControl = ID_UserPersonInsertDbEdit
end
object ID_UserPersonInsertDbEdit: TDBEdit
  Left = 10
  Top = 568
  Width = 221
  Height = 21
  TabOrder = 13
end
object TimeStampInsertDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 596
  Width = 165
  Height = 17
  FocusControl = TimeStampInsertDbEdit
end
object TimeStampInsertDbEdit: TDBEdit
  Left = 10
  Top = 610
  Width = 221
  Height = 21
  TabOrder = 14
end
object ID_UserPersonUpdateDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 638
  Width = 165
  Height = 17
  FocusControl = ID_UserPersonUpdateDbEdit
end
object ID_UserPersonUpdateDbEdit: TDBEdit
  Left = 10
  Top = 652
  Width = 221
  Height = 21
  TabOrder = 15
end
object TimeStampLastUpdateDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 680
  Width = 165
  Height = 17
  FocusControl = TimeStampLastUpdateDbEdit
end
object TimeStampLastUpdateDbEdit: TDBEdit
  Left = 10
  Top = 694
  Width = 221
  Height = 21
  TabOrder = 16
end
object StartDateTimeDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 722
  Width = 165
  Height = 17
  FocusControl = StartDateTimeDbEdit
end
object StartDateTimeDbEdit: TDBEdit
  Left = 10
  Top = 736
  Width = 221
  Height = 21
  TabOrder = 17
end
object FinishDateTimeDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 764
  Width = 165
  Height = 17
  FocusControl = FinishDateTimeDbEdit
end
object FinishDateTimeDbEdit: TDBEdit
  Left = 10
  Top = 778
  Width = 221
  Height = 21
  TabOrder = 18
end
object RemarkDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 806
  Width = 165
  Height = 17
  FocusControl = RemarkDbEdit
end
object RemarkDbEdit: TDBEdit
  Left = 10
  Top = 820
  Width = 221
  Height = 21
  TabOrder = 19
end

procedure TClientWijzigenForm.SetClient(const Value: TClient);
var
  ClientList: TClientList;
begin
  if Assigned(Value) then
  begin
    ClientList:= Value.ClientList;
    AssignDataField(Self.ID_ClientDbDisplayLabel, Self.ID_ClientDbEdit, ClientList.ID_ClientField);
    AssignDataField(Self.EID_NaturalPersonDbDisplayLabel, Self.EID_NaturalPersonDbEdit, ClientList.EID_NaturalPersonField);
    AssignDataField(Self.ID_Company_LegalPersonDbDisplayLabel, Self.ID_Company_LegalPersonDbEdit, ClientList.ID_Company_LegalPersonField);
    AssignDataField(Self.ID_NaturalPersonDbDisplayLabel, Self.ID_NaturalPersonDbEdit, ClientList.ID_NaturalPersonField);
    AssignDataField(Self.EID_BaseEntityDbDisplayLabel, Self.EID_BaseEntityDbEdit, ClientList.EID_BaseEntityField);
    AssignDataField(Self.FirstNameDbDisplayLabel, Self.FirstNameDbEdit, ClientList.FirstNameField);
    AssignDataField(Self.InitialsDbDisplayLabel, Self.InitialsDbEdit, ClientList.InitialsField);
    AssignDataField(Self.LastNameDbDisplayLabel, Self.LastNameDbEdit, ClientList.LastNameField);
    AssignDataField(Self.BirthDateDbDisplayLabel, Self.BirthDateDbEdit, ClientList.BirthDateField);
    AssignDataField(Self.PlaceOfBirthDbDisplayLabel, Self.PlaceOfBirthDbEdit, ClientList.PlaceOfBirthField);
    AssignDataField(Self.SSNDbDisplayLabel, Self.SSNDbEdit, ClientList.SSNField);
    AssignDataField(Self.ID_BaseEntityDbDisplayLabel, Self.ID_BaseEntityDbEdit, ClientList.ID_BaseEntityField);
    AssignDataField(Self.ExternalIDDbDisplayLabel, Self.ExternalIDDbEdit, ClientList.ExternalIDField);
    AssignDataField(Self.ID_UserPersonInsertDbDisplayLabel, Self.ID_UserPersonInsertDbEdit, ClientList.ID_UserPersonInsertField);
    AssignDataField(Self.TimeStampInsertDbDisplayLabel, Self.TimeStampInsertDbEdit, ClientList.TimeStampInsertField);
    AssignDataField(Self.ID_UserPersonUpdateDbDisplayLabel, Self.ID_UserPersonUpdateDbEdit, ClientList.ID_UserPersonUpdateField);
    AssignDataField(Self.TimeStampLastUpdateDbDisplayLabel, Self.TimeStampLastUpdateDbEdit, ClientList.TimeStampLastUpdateField);
    AssignDataField(Self.StartDateTimeDbDisplayLabel, Self.StartDateTimeDbEdit, ClientList.StartDateTimeField);
    AssignDataField(Self.FinishDateTimeDbDisplayLabel, Self.FinishDateTimeDbEdit, ClientList.FinishDateTimeField);
    AssignDataField(Self.RemarkDbDisplayLabel, Self.RemarkDbEdit, ClientList.RemarkField);
    FClient := Value;
    DataSource.DataSet := ClientList;
  end
  else
    DataSource.DataSet := nil;
end;
}
end.
