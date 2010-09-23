unit GenderBaseUnit;

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
  TGenderBase = class;
  TGenderListBase = class;

  TGenderBase = class(TBaseEntity)
  strict protected
    function GetGenderListBase(): TGenderListBase; virtual;
    function GetEntityListClass(): TEntityListClass; override;
    function GetID_Gender(): TNullableInteger; virtual;
    procedure SetID_Gender(const Value: TNullableInteger); virtual;
    function GetEID_BaseEntity(): TNullableInteger; virtual;
    procedure SetEID_BaseEntity(const Value: TNullableInteger); virtual;
    function GetName(): TNullableString; virtual;
    procedure SetName(const Value: TNullableString); virtual;
    property GenderList: TGenderListBase read GetGenderListBase;
  public
    property ID_Gender: TNullableInteger read GetID_Gender write SetID_Gender;
    property EID_BaseEntity: TNullableInteger read GetEID_BaseEntity write SetEID_BaseEntity;
    property Name: TNullableString read GetName write SetName;
  end;

  TGenderListBaseClientDataSet = class(TBaseEntityList)
  strict protected
    procedure FillValidCriterionFieldNames(); override;
    function GetData(): Integer; overload; override;
    function GetEntityClass(): TEntityClass; overload; override;
    function GetID_GenderField(): TIntegerField; virtual;
    function GetEID_BaseEntityField(): TIntegerField; virtual;
    function GetNameField(): TStringField; virtual;
  public
    const
      ID_GenderFieldName = 'ID_Gender';
      ID_Gender_ChangedParameterName = 'ID_Gender_Changed';
      EID_BaseEntityFieldName = 'EID_BaseEntity';
      EID_BaseEntity_ChangedParameterName = 'EID_BaseEntity_Changed';
      NameFieldName = 'Name';
      Name_ChangedParameterName = 'Name_Changed';
    property ID_GenderField: TIntegerField read GetID_GenderField;
    property EID_BaseEntityField: TIntegerField read GetEID_BaseEntityField;
    property NameField: TStringField read GetNameField;
  end;

  TGenderBaseEnumerator = class(TEntityListEnumerator)
  strict private
    function GetCurrent(): TGenderBase;
  public
    property Current: TGenderBase read GetCurrent;
  end;

  TGenderListBase = class(TGenderListBaseClientDataSet)
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
    function GetID_Gender(): TNullableInteger; virtual;
    procedure SetID_Gender(const Value: TNullableInteger); virtual;
    function GetEID_BaseEntity(): TNullableInteger; virtual;
    procedure SetEID_BaseEntity(const Value: TNullableInteger); virtual;
    function GetName(): TNullableString; virtual;
    procedure SetName(const Value: TNullableString); virtual;
  public
    const
      Gender_TableName = 'Gender';
    function GetEnumerator(): TGenderBaseEnumerator;
    property ID_Gender: TNullableInteger read GetID_Gender write SetID_Gender;
    property EID_BaseEntity: TNullableInteger read GetEID_BaseEntity write SetEID_BaseEntity;
    property Name: TNullableString read GetName write SetName;
  end;

implementation

uses
  FieldHelperUnit;

{ TGenderBase }

function TGenderBase.GetGenderListBase(): TGenderListBase;
begin
  Result := EntityList as TGenderListBase;
end;

function TGenderBase.GetEntityListClass(): TEntityListClass;
begin
  Result := TGenderListBase;
end;

function TGenderBase.GetID_Gender(): TNullableInteger;
var
  Value: TNullableInteger;
begin
  ExecuteAtDictionaryID(
  procedure
  begin
    Value := GenderList.ID_Gender;
  end
  );
  Result := Value;
end;

procedure TGenderBase.SetID_Gender(const Value: TNullableInteger);
var
  NewValue: TNullableInteger;
begin
  NewValue := Value;
  ExecuteAtBookmarkInEditMode(
    procedure
    begin
      GenderList.ID_Gender := NewValue;
    end
  );
end;

function TGenderBase.GetEID_BaseEntity(): TNullableInteger;
var
  Value: TNullableInteger;
begin
  ExecuteAtDictionaryID(
  procedure
  begin
    Value := GenderList.EID_BaseEntity;
  end
  );
  Result := Value;
end;

procedure TGenderBase.SetEID_BaseEntity(const Value: TNullableInteger);
var
  NewValue: TNullableInteger;
begin
  NewValue := Value;
  ExecuteAtBookmarkInEditMode(
    procedure
    begin
      GenderList.EID_BaseEntity := NewValue;
    end
  );
end;

function TGenderBase.GetName(): TNullableString;
var
  Value: TNullableString;
begin
  ExecuteAtDictionaryID(
  procedure
  begin
    Value := GenderList.Name;
  end
  );
  Result := Value;
end;

procedure TGenderBase.SetName(const Value: TNullableString);
var
  NewValue: TNullableString;
begin
  NewValue := Value;
  ExecuteAtBookmarkInEditMode(
    procedure
    begin
      GenderList.Name := NewValue;
    end
  );
end;

{ TGenderListBaseClientDataSet }

procedure TGenderListBaseClientDataSet.FillValidCriterionFieldNames();
begin
  inherited FillValidCriterionFieldNames();
  ValidCriterionFieldNames.Add(ID_GenderFieldName);
  ValidCriterionFieldNames.Add(EID_BaseEntityFieldName);
  ValidCriterionFieldNames.Add(NameFieldName);
end;

function TGenderListBaseClientDataSet.GetData(): Integer;
begin
  Result := inherited GetData();
end;

function TGenderListBaseClientDataSet.GetEntityClass(): TEntityClass;
begin
  Result := TGenderBase;
end;

function TGenderListBaseClientDataSet.GetID_GenderField(): TIntegerField;
begin
  Result := Fields.FieldByName(ID_GenderFieldName) as TIntegerField;
end;

function TGenderListBaseClientDataSet.GetEID_BaseEntityField(): TIntegerField;
begin
  Result := Fields.FieldByName(EID_BaseEntityFieldName) as TIntegerField;
end;

function TGenderListBaseClientDataSet.GetNameField(): TStringField;
begin
  Result := Fields.FieldByName(NameFieldName) as TStringField;
end;

{ TGenderBaseEnumerator }

function TGenderBaseEnumerator.GetCurrent(): TGenderBase;
var
  Entity: TEntity;
begin
  Entity := inherited Current;
  Result := Entity as TGenderBase;
end;

{ TGenderListBase }

procedure TGenderListBase.SetDeleteQueryText(var DeleteQueryText: string);
begin
  DeleteQueryText := 'DELETE FROM Gender WHERE ID_Gender = :ID_Gender';
end;

procedure TGenderListBase.SetInsertQueryText(var InsertQueryText: string);
begin
  InsertQueryText :=
  'INSERT INTO Gender (' +
  '  EID_BaseEntity, ' +
  '  Name  ) VALUES (' +
  '  :EID_BaseEntity_Changed, ' +
  '  :Name_Changed  )';
end;

procedure TGenderListBase.SetReadQueryText(const ReadQuery: TDBQuery);
begin
  ReadQuery.SQL.Add('   SELECT ' +
  '  Gender.ID_Gender, ' +
  '  Gender.EID_BaseEntity, ' +
  '  Gender.Name, ' +
  '  BaseEntity.ID_BaseEntity, ' +
  '  BaseEntity.ExternalID, ' +
  '  BaseEntity.ID_UserPersonInsert, ' +
  '  BaseEntity.TimeStampInsert, ' +
  '  BaseEntity.ID_UserPersonUpdate, ' +
  '  BaseEntity.TimeStampLastUpdate, ' +
  '  BaseEntity.StartDateTime, ' +
  '  BaseEntity.FinishDateTime, ' +
  '  BaseEntity.Remark ' +
  '   FROM ( Gender ' +
  '   LEFT JOIN BaseEntity ON BaseEntity.ID_BaseEntity = Gender.EID_BaseEntity) ' +
  'WHERE (1=1) '
  );
end;

procedure TGenderListBase.SetUpdateQueryText(var UpdateQueryText: string);
begin
  UpdateQueryText :=
  'UPDATE Gender ' + 'SET ' +
  '  EID_BaseEntity = :EID_BaseEntity_Changed, ' +
  '  Name = :Name_Changed ' +
  'WHERE ID_Gender = :ID_Gender ';
end;

procedure TGenderListBase.SetParams(const DBQuery: TDBQuery);
begin
  DBQuery.AssignParam(EID_BaseEntity, EID_BaseEntity_ChangedParameterName);
  DBQuery.AssignParam(Name, Name_ChangedParameterName);
end;

function TGenderListBase.FillJoinedColumnPair(): TJoinedColumnPair;
begin
  Result := TJoinedColumnPair.Create(Gender_TableName, EID_BaseEntityFieldName, BaseEntity_TableName, ID_BaseEntityFieldName);
end;

procedure TGenderListBase.FillDeleteQueryRecordList(const DeleteQueryRecordList: TMSDMLQueryRecordList);
var
  DeleteQueryRecord: TMSDMLQueryRecord;
begin
  inherited FillDeleteQueryRecordList(DeleteQueryRecordList);
  DeleteQueryRecord.SetQueryTextMethod := Self.SetDeleteQueryText;
  DeleteQueryRecord.SetParamsMethod := nil;
  DeleteQueryRecord.JoinedColumnPair := FillJoinedColumnPair();
  DeleteQueryRecordList.Add(DeleteQueryRecord);
end;

procedure TGenderListBase.FillInsertQueryRecordList(const InsertQueryRecordList: TMSDMLQueryRecordList);
var
  InsertQueryRecord: TMSDMLQueryRecord;
begin
  inherited FillInsertQueryRecordList(InsertQueryRecordList);
  InsertQueryRecord.SetQueryTextMethod := Self.SetInsertQueryText;
  InsertQueryRecord.SetParamsMethod := Self.SetParams;
  InsertQueryRecord.JoinedColumnPair := FillJoinedColumnPair();
  InsertQueryRecordList.Add(InsertQueryRecord);
end;

procedure TGenderListBase.FillUpdateQueryRecordList(const UpdateQueryRecordList: TMSDMLQueryRecordList);
var
  UpdateQueryRecord: TMSDMLQueryRecord;
begin
  inherited FillUpdateQueryRecordList(UpdateQueryRecordList);
  UpdateQueryRecord.SetQueryTextMethod := Self.SetUpdateQueryText;
  UpdateQueryRecord.SetParamsMethod := Self.SetParams;
  UpdateQueryRecord.JoinedColumnPair := FillJoinedColumnPair();
  UpdateQueryRecordList.Add(UpdateQueryRecord);
end;

function TGenderListBase.GetID_Gender(): TNullableInteger;
begin
  Result := ID_GenderField.AsNullableInteger;
end;

procedure TGenderListBase.SetID_Gender(const Value: TNullableInteger);
begin
  ID_GenderField.AsNullableInteger := Value;
end;

function TGenderListBase.GetEID_BaseEntity(): TNullableInteger;
begin
  Result := EID_BaseEntityField.AsNullableInteger;
end;

procedure TGenderListBase.SetEID_BaseEntity(const Value: TNullableInteger);
begin
  EID_BaseEntityField.AsNullableInteger := Value;
end;

function TGenderListBase.GetName(): TNullableString;
begin
  Result := NameField.AsNullableString;
end;

procedure TGenderListBase.SetName(const Value: TNullableString);
begin
  NameField.AsNullableString := Value;
end;

function TGenderListBase.GetEnumerator(): TGenderBaseEnumerator;
begin
  Result := TGenderBaseEnumerator.Create(Self);
end;

{
object ID_GenderDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 8
  Width = 165
  Height = 17
  FocusControl = ID_GenderDbEdit
end
object ID_GenderDbEdit: TDBEdit
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
object ID_BaseEntityDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 134
  Width = 165
  Height = 17
  FocusControl = ID_BaseEntityDbEdit
end
object ID_BaseEntityDbEdit: TDBEdit
  Left = 10
  Top = 148
  Width = 221
  Height = 21
  TabOrder = 3
end
object ExternalIDDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 176
  Width = 165
  Height = 17
  FocusControl = ExternalIDDbEdit
end
object ExternalIDDbEdit: TDBEdit
  Left = 10
  Top = 190
  Width = 221
  Height = 21
  TabOrder = 4
end
object ID_UserPersonInsertDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 218
  Width = 165
  Height = 17
  FocusControl = ID_UserPersonInsertDbEdit
end
object ID_UserPersonInsertDbEdit: TDBEdit
  Left = 10
  Top = 232
  Width = 221
  Height = 21
  TabOrder = 5
end
object TimeStampInsertDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 260
  Width = 165
  Height = 17
  FocusControl = TimeStampInsertDbEdit
end
object TimeStampInsertDbEdit: TDBEdit
  Left = 10
  Top = 274
  Width = 221
  Height = 21
  TabOrder = 6
end
object ID_UserPersonUpdateDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 302
  Width = 165
  Height = 17
  FocusControl = ID_UserPersonUpdateDbEdit
end
object ID_UserPersonUpdateDbEdit: TDBEdit
  Left = 10
  Top = 316
  Width = 221
  Height = 21
  TabOrder = 7
end
object TimeStampLastUpdateDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 344
  Width = 165
  Height = 17
  FocusControl = TimeStampLastUpdateDbEdit
end
object TimeStampLastUpdateDbEdit: TDBEdit
  Left = 10
  Top = 358
  Width = 221
  Height = 21
  TabOrder = 8
end
object StartDateTimeDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 386
  Width = 165
  Height = 17
  FocusControl = StartDateTimeDbEdit
end
object StartDateTimeDbEdit: TDBEdit
  Left = 10
  Top = 400
  Width = 221
  Height = 21
  TabOrder = 9
end
object FinishDateTimeDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 428
  Width = 165
  Height = 17
  FocusControl = FinishDateTimeDbEdit
end
object FinishDateTimeDbEdit: TDBEdit
  Left = 10
  Top = 442
  Width = 221
  Height = 21
  TabOrder = 10
end
object RemarkDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 470
  Width = 165
  Height = 17
  FocusControl = RemarkDbEdit
end
object RemarkDbEdit: TDBEdit
  Left = 10
  Top = 484
  Width = 221
  Height = 21
  TabOrder = 11
end

procedure TGenderDetailForm.SetGender(const Value: TGender);
var
  GenderList: TGenderList;
begin
  if Assigned(Value) then
  begin
    GenderList:= Value.GenderList;
    AssignDataField(DataSource, Self.ID_GenderDbDisplayLabel, Self.ID_GenderDbEdit, GenderList.ID_GenderField);
    AssignDataField(DataSource, Self.EID_BaseEntityDbDisplayLabel, Self.EID_BaseEntityDbEdit, GenderList.EID_BaseEntityField);
    AssignDataField(DataSource, Self.NameDbDisplayLabel, Self.NameDbEdit, GenderList.NameField);
    AssignDataField(DataSource, Self.ID_BaseEntityDbDisplayLabel, Self.ID_BaseEntityDbEdit, GenderList.ID_BaseEntityField);
    AssignDataField(DataSource, Self.ExternalIDDbDisplayLabel, Self.ExternalIDDbEdit, GenderList.ExternalIDField);
    AssignDataField(DataSource, Self.ID_UserPersonInsertDbDisplayLabel, Self.ID_UserPersonInsertDbEdit, GenderList.ID_UserPersonInsertField);
    AssignDataField(DataSource, Self.TimeStampInsertDbDisplayLabel, Self.TimeStampInsertDbEdit, GenderList.TimeStampInsertField);
    AssignDataField(DataSource, Self.ID_UserPersonUpdateDbDisplayLabel, Self.ID_UserPersonUpdateDbEdit, GenderList.ID_UserPersonUpdateField);
    AssignDataField(DataSource, Self.TimeStampLastUpdateDbDisplayLabel, Self.TimeStampLastUpdateDbEdit, GenderList.TimeStampLastUpdateField);
    AssignDataField(DataSource, Self.StartDateTimeDbDisplayLabel, Self.StartDateTimeDbEdit, GenderList.StartDateTimeField);
    AssignDataField(DataSource, Self.FinishDateTimeDbDisplayLabel, Self.FinishDateTimeDbEdit, GenderList.FinishDateTimeField);
    AssignDataField(DataSource, Self.RemarkDbDisplayLabel, Self.RemarkDbEdit, GenderList.RemarkField);
    FGender := Value;
    DataSource.DataSet := GenderList;
  end
  else
    DataSource.DataSet := nil;
end;
}
end.
