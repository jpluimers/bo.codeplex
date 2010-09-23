unit LegalPersonBaseUnit;

interface

uses
  MSConnectionLayerUnit,
  SysUtils,
  ORMEntityUnit,
  DataSetEnumeratorUnit,
  NullablesUnit,
  DB,
  ADODB,
  BaseEntityUnit,
  JoinedColumnPairUnit,
  MSDMLQueryRecordUnit;

type
  TLegalPersonBase = class;
  TLegalPersonListBase = class;

  TLegalPersonBase = class(TBaseEntity)
  strict protected
    function GetLegalPersonListBase(): TLegalPersonListBase; virtual;
    function GetEntityListClass(): TEntityListClass; override;
    function GetID_LegalPerson(): TNullableInteger; virtual;
    procedure SetID_LegalPerson(const Value: TNullableInteger); virtual;
    function GetEID_BaseEntity(): TNullableInteger; virtual;
    procedure SetEID_BaseEntity(const Value: TNullableInteger); virtual;
    function GetName(): TNullableString; virtual;
    procedure SetName(const Value: TNullableString); virtual;
    function GetLegalCode(): TNullableString; virtual;
    procedure SetLegalCode(const Value: TNullableString); virtual;
    property LegalPersonList: TLegalPersonListBase read GetLegalPersonListBase;
  public
    property ID_LegalPerson: TNullableInteger read GetID_LegalPerson write SetID_LegalPerson;
    property EID_BaseEntity: TNullableInteger read GetEID_BaseEntity write SetEID_BaseEntity;
    property Name: TNullableString read GetName write SetName;
    property LegalCode: TNullableString read GetLegalCode write SetLegalCode;
  end;

  TLegalPersonListBaseClientDataSet = class(TBaseEntityList)
  strict protected
    procedure FillValidCriterionFieldNames(); override;
    function GetData(): Integer; overload; override;
    function GetEntityClass(): TEntityClass; overload; override;
    function GetID_LegalPersonField(): TIntegerField; virtual;
    function GetEID_BaseEntityField(): TIntegerField; virtual;
    function GetNameField(): TStringField; virtual;
    function GetLegalCodeField(): TStringField; virtual;
  public
    const
      ID_LegalPersonFieldName = 'ID_LegalPerson';
      ID_LegalPerson_ChangedParameterName = 'ID_LegalPerson_Changed';
      EID_BaseEntityFieldName = 'EID_BaseEntity';
      EID_BaseEntity_ChangedParameterName = 'EID_BaseEntity_Changed';
      NameFieldName = 'Name';
      Name_ChangedParameterName = 'Name_Changed';
      LegalCodeFieldName = 'LegalCode';
      LegalCode_ChangedParameterName = 'LegalCode_Changed';
    property ID_LegalPersonField: TIntegerField read GetID_LegalPersonField;
    property EID_BaseEntityField: TIntegerField read GetEID_BaseEntityField;
    property NameField: TStringField read GetNameField;
    property LegalCodeField: TStringField read GetLegalCodeField;
  end;

  TLegalPersonBaseEnumerator = class(TEntityListEnumerator)
  strict private
    function GetCurrent(): TLegalPersonBase;
  public
    property Current: TLegalPersonBase read GetCurrent;
  end;

  TLegalPersonListBase = class(TLegalPersonListBaseClientDataSet)
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
    function GetID_LegalPerson(): TNullableInteger; virtual;
    procedure SetID_LegalPerson(const Value: TNullableInteger); virtual;
    function GetEID_BaseEntity(): TNullableInteger; virtual;
    procedure SetEID_BaseEntity(const Value: TNullableInteger); virtual;
    function GetName(): TNullableString; virtual;
    procedure SetName(const Value: TNullableString); virtual;
    function GetLegalCode(): TNullableString; virtual;
    procedure SetLegalCode(const Value: TNullableString); virtual;
  public
    const
      LegalPerson_TableName = 'LegalPerson';
    function GetEnumerator(): TLegalPersonBaseEnumerator;
    property ID_LegalPerson: TNullableInteger read GetID_LegalPerson write SetID_LegalPerson;
    property EID_BaseEntity: TNullableInteger read GetEID_BaseEntity write SetEID_BaseEntity;
    property Name: TNullableString read GetName write SetName;
    property LegalCode: TNullableString read GetLegalCode write SetLegalCode;
  end;

implementation

uses
  FieldHelperUnit;

{ TLegalPersonBase }

function TLegalPersonBase.GetLegalPersonListBase(): TLegalPersonListBase;
begin
  Result := EntityList as TLegalPersonListBase;
end;

function TLegalPersonBase.GetEntityListClass(): TEntityListClass;
begin
  Result := TLegalPersonListBase;
end;

function TLegalPersonBase.GetID_LegalPerson(): TNullableInteger;
var
  Value: TNullableInteger;
begin
  ExecuteAtDictionaryID(
  procedure
  begin
    Value := LegalPersonList.ID_LegalPerson;
  end
  );
  Result := Value;
end;

procedure TLegalPersonBase.SetID_LegalPerson(const Value: TNullableInteger);
var
  NewValue: TNullableInteger;
begin
  NewValue := Value;
  ExecuteAtBookmarkInEditMode(
    procedure
    begin
      LegalPersonList.ID_LegalPerson := NewValue;
    end
  );
end;

function TLegalPersonBase.GetEID_BaseEntity(): TNullableInteger;
var
  Value: TNullableInteger;
begin
  ExecuteAtDictionaryID(
  procedure
  begin
    Value := LegalPersonList.EID_BaseEntity;
  end
  );
  Result := Value;
end;

procedure TLegalPersonBase.SetEID_BaseEntity(const Value: TNullableInteger);
var
  NewValue: TNullableInteger;
begin
  NewValue := Value;
  ExecuteAtBookmarkInEditMode(
    procedure
    begin
      LegalPersonList.EID_BaseEntity := NewValue;
    end
  );
end;

function TLegalPersonBase.GetName(): TNullableString;
var
  Value: TNullableString;
begin
  ExecuteAtDictionaryID(
  procedure
  begin
    Value := LegalPersonList.Name;
  end
  );
  Result := Value;
end;

procedure TLegalPersonBase.SetName(const Value: TNullableString);
var
  NewValue: TNullableString;
begin
  NewValue := Value;
  ExecuteAtBookmarkInEditMode(
    procedure
    begin
      LegalPersonList.Name := NewValue;
    end
  );
end;

function TLegalPersonBase.GetLegalCode(): TNullableString;
var
  Value: TNullableString;
begin
  ExecuteAtDictionaryID(
  procedure
  begin
    Value := LegalPersonList.LegalCode;
  end
  );
  Result := Value;
end;

procedure TLegalPersonBase.SetLegalCode(const Value: TNullableString);
var
  NewValue: TNullableString;
begin
  NewValue := Value;
  ExecuteAtBookmarkInEditMode(
    procedure
    begin
      LegalPersonList.LegalCode := NewValue;
    end
  );
end;

{ TLegalPersonListBaseClientDataSet }

procedure TLegalPersonListBaseClientDataSet.FillValidCriterionFieldNames();
begin
  inherited FillValidCriterionFieldNames();
  ValidCriterionFieldNames.Add(ID_LegalPersonFieldName);
  ValidCriterionFieldNames.Add(EID_BaseEntityFieldName);
  ValidCriterionFieldNames.Add(NameFieldName);
  ValidCriterionFieldNames.Add(LegalCodeFieldName);
end;

function TLegalPersonListBaseClientDataSet.GetData(): Integer;
begin
  Result := inherited GetData();
end;

function TLegalPersonListBaseClientDataSet.GetEntityClass(): TEntityClass;
begin
  Result := TLegalPersonBase;
end;

function TLegalPersonListBaseClientDataSet.GetID_LegalPersonField(): TIntegerField;
begin
  Result := Fields.FieldByName(ID_LegalPersonFieldName) as TIntegerField;
end;

function TLegalPersonListBaseClientDataSet.GetEID_BaseEntityField(): TIntegerField;
begin
  Result := Fields.FieldByName(EID_BaseEntityFieldName) as TIntegerField;
end;

function TLegalPersonListBaseClientDataSet.GetNameField(): TStringField;
begin
  Result := Fields.FieldByName(NameFieldName) as TStringField;
end;

function TLegalPersonListBaseClientDataSet.GetLegalCodeField(): TStringField;
begin
  Result := Fields.FieldByName(LegalCodeFieldName) as TStringField;
end;

{ TLegalPersonBaseEnumerator }

function TLegalPersonBaseEnumerator.GetCurrent(): TLegalPersonBase;
var
  Entity: TEntity;
begin
  Entity := inherited Current;
  Result := Entity as TLegalPersonBase;
end;

{ TLegalPersonListBase }

procedure TLegalPersonListBase.SetDeleteQueryText(var DeleteQueryText: string);
begin
  DeleteQueryText := 'DELETE FROM LegalPerson WHERE ID_LegalPerson = :ID_LegalPerson';
end;

procedure TLegalPersonListBase.SetInsertQueryText(var InsertQueryText: string);
begin
  InsertQueryText :=
  'INSERT INTO LegalPerson (' +
  '  EID_BaseEntity, ' +
  '  Name, ' +
  '  LegalCode  ) VALUES (' +
  '  :EID_BaseEntity_Changed, ' +
  '  :Name_Changed, ' +
  '  :LegalCode_Changed  )';
end;

procedure TLegalPersonListBase.SetReadQueryText(const ReadQuery: TDBQuery);
begin
  ReadQuery.SQL.Add('   SELECT ' +
  '  LegalPerson.ID_LegalPerson, ' +
  '  LegalPerson.EID_BaseEntity, ' +
  '  LegalPerson.Name, ' +
  '  LegalPerson.LegalCode, ' +
  '  BaseEntity.ID_BaseEntity, ' +
  '  BaseEntity.ExternalID, ' +
  '  BaseEntity.ID_UserPersonInsert, ' +
  '  BaseEntity.TimeStampInsert, ' +
  '  BaseEntity.ID_UserPersonUpdate, ' +
  '  BaseEntity.TimeStampLastUpdate, ' +
  '  BaseEntity.StartDateTime, ' +
  '  BaseEntity.FinishDateTime, ' +
  '  BaseEntity.Remark ' +
  '   FROM ( LegalPerson ' +
  '   LEFT JOIN BaseEntity ON BaseEntity.ID_BaseEntity = LegalPerson.EID_BaseEntity) ' +
  'WHERE (1=1) '
  );
end;

procedure TLegalPersonListBase.SetUpdateQueryText(var UpdateQueryText: string);
begin
  UpdateQueryText :=
  'UPDATE LegalPerson ' + 'SET ' +
  '  EID_BaseEntity = :EID_BaseEntity_Changed, ' +
  '  Name = :Name_Changed, ' +
  '  LegalCode = :LegalCode_Changed ' +
  'WHERE ID_LegalPerson = :ID_LegalPerson ';
end;

procedure TLegalPersonListBase.SetParams(const DBQuery: TDBQuery);
begin
  DBQuery.AssignParam(EID_BaseEntity, EID_BaseEntity_ChangedParameterName);
  DBQuery.AssignParam(Name, Name_ChangedParameterName);
  DBQuery.AssignParam(LegalCode, LegalCode_ChangedParameterName);
end;

function TLegalPersonListBase.FillJoinedColumnPair(): TJoinedColumnPair;
begin
  Result := TJoinedColumnPair.Create(LegalPerson_TableName, EID_BaseEntityFieldName, BaseEntity_TableName, ID_BaseEntityFieldName);
end;

procedure TLegalPersonListBase.FillDeleteQueryRecordList(const DeleteQueryRecordList: TMSDMLQueryRecordList);
var
  DeleteQueryRecord: TMSDMLQueryRecord;
begin
  inherited FillDeleteQueryRecordList(DeleteQueryRecordList);
  DeleteQueryRecord.SetQueryTextMethod := Self.SetDeleteQueryText;
  DeleteQueryRecord.SetParamsMethod := nil;
  DeleteQueryRecord.JoinedColumnPair := FillJoinedColumnPair();
  DeleteQueryRecordList.Add(DeleteQueryRecord);
end;

procedure TLegalPersonListBase.FillInsertQueryRecordList(const InsertQueryRecordList: TMSDMLQueryRecordList);
var
  InsertQueryRecord: TMSDMLQueryRecord;
begin
  inherited FillInsertQueryRecordList(InsertQueryRecordList);
  InsertQueryRecord.SetQueryTextMethod := Self.SetInsertQueryText;
  InsertQueryRecord.SetParamsMethod := Self.SetParams;
  InsertQueryRecord.JoinedColumnPair := FillJoinedColumnPair();
  InsertQueryRecordList.Add(InsertQueryRecord);
end;

procedure TLegalPersonListBase.FillUpdateQueryRecordList(const UpdateQueryRecordList: TMSDMLQueryRecordList);
var
  UpdateQueryRecord: TMSDMLQueryRecord;
begin
  inherited FillUpdateQueryRecordList(UpdateQueryRecordList);
  UpdateQueryRecord.SetQueryTextMethod := Self.SetUpdateQueryText;
  UpdateQueryRecord.SetParamsMethod := Self.SetParams;
  UpdateQueryRecord.JoinedColumnPair := FillJoinedColumnPair();
  UpdateQueryRecordList.Add(UpdateQueryRecord);
end;

function TLegalPersonListBase.GetID_LegalPerson(): TNullableInteger;
begin
  Result := ID_LegalPersonField.AsNullableInteger;
end;

procedure TLegalPersonListBase.SetID_LegalPerson(const Value: TNullableInteger);
begin
  ID_LegalPersonField.AsNullableInteger := Value;
end;

function TLegalPersonListBase.GetEID_BaseEntity(): TNullableInteger;
begin
  Result := EID_BaseEntityField.AsNullableInteger;
end;

procedure TLegalPersonListBase.SetEID_BaseEntity(const Value: TNullableInteger);
begin
  EID_BaseEntityField.AsNullableInteger := Value;
end;

function TLegalPersonListBase.GetName(): TNullableString;
begin
  Result := NameField.AsNullableString;
end;

procedure TLegalPersonListBase.SetName(const Value: TNullableString);
begin
  NameField.AsNullableString := Value;
end;

function TLegalPersonListBase.GetLegalCode(): TNullableString;
begin
  Result := LegalCodeField.AsNullableString;
end;

procedure TLegalPersonListBase.SetLegalCode(const Value: TNullableString);
begin
  LegalCodeField.AsNullableString := Value;
end;

function TLegalPersonListBase.GetEnumerator(): TLegalPersonBaseEnumerator;
begin
  Result := TLegalPersonBaseEnumerator.Create(Self);
end;

{
object ID_LegalPersonDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 8
  Width = 165
  Height = 17
  FocusControl = ID_LegalPersonDbEdit
end
object ID_LegalPersonDbEdit: TDBEdit
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
object NameDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 92
  Width = 165
  Height = 17
  FocusControl = NameDbEdit
end
object NameDbEdit: TDBEdit
  Left = 10
  Top = 106
  Width = 221
  Height = 21
  TabOrder = 2
end
object LegalCodeDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 134
  Width = 165
  Height = 17
  FocusControl = LegalCodeDbEdit
end
object LegalCodeDbEdit: TDBEdit
  Left = 10
  Top = 148
  Width = 221
  Height = 21
  TabOrder = 3
end
object ID_BaseEntityDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 176
  Width = 165
  Height = 17
  FocusControl = ID_BaseEntityDbEdit
end
object ID_BaseEntityDbEdit: TDBEdit
  Left = 10
  Top = 190
  Width = 221
  Height = 21
  TabOrder = 4
end
object ExternalIDDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 218
  Width = 165
  Height = 17
  FocusControl = ExternalIDDbEdit
end
object ExternalIDDbEdit: TDBEdit
  Left = 10
  Top = 232
  Width = 221
  Height = 21
  TabOrder = 5
end
object ID_UserPersonInsertDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 260
  Width = 165
  Height = 17
  FocusControl = ID_UserPersonInsertDbEdit
end
object ID_UserPersonInsertDbEdit: TDBEdit
  Left = 10
  Top = 274
  Width = 221
  Height = 21
  TabOrder = 6
end
object TimeStampInsertDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 302
  Width = 165
  Height = 17
  FocusControl = TimeStampInsertDbEdit
end
object TimeStampInsertDbEdit: TDBEdit
  Left = 10
  Top = 316
  Width = 221
  Height = 21
  TabOrder = 7
end
object ID_UserPersonUpdateDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 344
  Width = 165
  Height = 17
  FocusControl = ID_UserPersonUpdateDbEdit
end
object ID_UserPersonUpdateDbEdit: TDBEdit
  Left = 10
  Top = 358
  Width = 221
  Height = 21
  TabOrder = 8
end
object TimeStampLastUpdateDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 386
  Width = 165
  Height = 17
  FocusControl = TimeStampLastUpdateDbEdit
end
object TimeStampLastUpdateDbEdit: TDBEdit
  Left = 10
  Top = 400
  Width = 221
  Height = 21
  TabOrder = 9
end
object StartDateTimeDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 428
  Width = 165
  Height = 17
  FocusControl = StartDateTimeDbEdit
end
object StartDateTimeDbEdit: TDBEdit
  Left = 10
  Top = 442
  Width = 221
  Height = 21
  TabOrder = 10
end
object FinishDateTimeDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 470
  Width = 165
  Height = 17
  FocusControl = FinishDateTimeDbEdit
end
object FinishDateTimeDbEdit: TDBEdit
  Left = 10
  Top = 484
  Width = 221
  Height = 21
  TabOrder = 11
end
object RemarkDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 512
  Width = 165
  Height = 17
  FocusControl = RemarkDbEdit
end
object RemarkDbEdit: TDBEdit
  Left = 10
  Top = 526
  Width = 221
  Height = 21
  TabOrder = 12
end

procedure TLegalPersonDetailForm.SetLegalPerson(const Value: TLegalPerson);
var
  LegalPersonList: TLegalPersonList;
begin
  if Assigned(Value) then
  begin
    LegalPersonList:= Value.LegalPersonList;
    AssignDataField(DataSource, Self.ID_LegalPersonDbDisplayLabel, Self.ID_LegalPersonDbEdit, LegalPersonList.ID_LegalPersonField);
    AssignDataField(DataSource, Self.EID_BaseEntityDbDisplayLabel, Self.EID_BaseEntityDbEdit, LegalPersonList.EID_BaseEntityField);
    AssignDataField(DataSource, Self.NameDbDisplayLabel, Self.NameDbEdit, LegalPersonList.NameField);
    AssignDataField(DataSource, Self.LegalCodeDbDisplayLabel, Self.LegalCodeDbEdit, LegalPersonList.LegalCodeField);
    AssignDataField(DataSource, Self.ID_BaseEntityDbDisplayLabel, Self.ID_BaseEntityDbEdit, LegalPersonList.ID_BaseEntityField);
    AssignDataField(DataSource, Self.ExternalIDDbDisplayLabel, Self.ExternalIDDbEdit, LegalPersonList.ExternalIDField);
    AssignDataField(DataSource, Self.ID_UserPersonInsertDbDisplayLabel, Self.ID_UserPersonInsertDbEdit, LegalPersonList.ID_UserPersonInsertField);
    AssignDataField(DataSource, Self.TimeStampInsertDbDisplayLabel, Self.TimeStampInsertDbEdit, LegalPersonList.TimeStampInsertField);
    AssignDataField(DataSource, Self.ID_UserPersonUpdateDbDisplayLabel, Self.ID_UserPersonUpdateDbEdit, LegalPersonList.ID_UserPersonUpdateField);
    AssignDataField(DataSource, Self.TimeStampLastUpdateDbDisplayLabel, Self.TimeStampLastUpdateDbEdit, LegalPersonList.TimeStampLastUpdateField);
    AssignDataField(DataSource, Self.StartDateTimeDbDisplayLabel, Self.StartDateTimeDbEdit, LegalPersonList.StartDateTimeField);
    AssignDataField(DataSource, Self.FinishDateTimeDbDisplayLabel, Self.FinishDateTimeDbEdit, LegalPersonList.FinishDateTimeField);
    AssignDataField(DataSource, Self.RemarkDbDisplayLabel, Self.RemarkDbEdit, LegalPersonList.RemarkField);
    FLegalPerson := Value;
    DataSource.DataSet := LegalPersonList;
  end
  else
    DataSource.DataSet := nil;
end;
}
end.
