unit BaseEntityBaseUnit;

interface

uses
  MSConnectionLayerUnit,
  SysUtils,
  ORMEntityUnit,
  DataSetEnumeratorUnit,
  NullablesUnit,
  db,
  ADODB,
  JoinedColumnPairUnit,
  MSDMLQueryRecordUnit;

type
  TBaseEntityBase = class;
  TBaseEntityListBase = class;

  TBaseEntityBase = class(TEntity)
  strict protected
    function GetBaseEntityListBase(): TBaseEntityListBase; virtual;
    function GetEntityListClass(): TEntityListClass; override;
    function GetID_BaseEntity(): TNullableInteger; virtual;
    procedure SetID_BaseEntity(const Value: TNullableInteger); virtual;
    function GetExternalID(): TNullableString; virtual;
    procedure SetExternalID(const Value: TNullableString); virtual;
    function GetID_UserPersonInsert(): TNullableInteger; virtual;
    procedure SetID_UserPersonInsert(const Value: TNullableInteger); virtual;
    function GetTimeStampInsert(): TNullableDateTime; virtual;
    procedure SetTimeStampInsert(const Value: TNullableDateTime); virtual;
    function GetID_UserPersonUpdate(): TNullableInteger; virtual;
    procedure SetID_UserPersonUpdate(const Value: TNullableInteger); virtual;
    function GetTimeStampLastUpdate(): TNullableDateTime; virtual;
    procedure SetTimeStampLastUpdate(const Value: TNullableDateTime); virtual;
    function GetStartDateTime(): TNullableDateTime; virtual;
    procedure SetStartDateTime(const Value: TNullableDateTime); virtual;
    function GetFinishDateTime(): TNullableDateTime; virtual;
    procedure SetFinishDateTime(const Value: TNullableDateTime); virtual;
    function GetRemark(): TNullableString; virtual;
    procedure SetRemark(const Value: TNullableString); virtual;
    property BaseEntityList: TBaseEntityListBase read GetBaseEntityListBase;
  public
    property ID_BaseEntity: TNullableInteger read GetID_BaseEntity write SetID_BaseEntity;
    property ExternalID: TNullableString read GetExternalID write SetExternalID;
    property ID_UserPersonInsert: TNullableInteger read GetID_UserPersonInsert write SetID_UserPersonInsert;
    property TimeStampInsert: TNullableDateTime read GetTimeStampInsert write SetTimeStampInsert;
    property ID_UserPersonUpdate: TNullableInteger read GetID_UserPersonUpdate write SetID_UserPersonUpdate;
    property TimeStampLastUpdate: TNullableDateTime read GetTimeStampLastUpdate write SetTimeStampLastUpdate;
    property StartDateTime: TNullableDateTime read GetStartDateTime write SetStartDateTime;
    property FinishDateTime: TNullableDateTime read GetFinishDateTime write SetFinishDateTime;
    property Remark: TNullableString read GetRemark write SetRemark;
  end;

  TBaseEntityListBaseClientDataSet = class(TEntityListClientDataSet)
  strict protected
    function GetData(): Integer; overload; override;
    function GetEntityClass(): TEntityClass; overload; override;
    function GetID_BaseEntityField(): TIntegerField; virtual;
    function GetExternalIDField(): TStringField; virtual;
    function GetID_UserPersonInsertField(): TIntegerField; virtual;
    function GetTimeStampInsertField(): TDateTimeField; virtual;
    function GetID_UserPersonUpdateField(): TIntegerField; virtual;
    function GetTimeStampLastUpdateField(): TDateTimeField; virtual;
    function GetStartDateTimeField(): TDateTimeField; virtual;
    function GetFinishDateTimeField(): TDateTimeField; virtual;
    function GetRemarkField(): TStringField; virtual;
  public
    const
      ID_BaseEntityFieldName = 'ID_BaseEntity';
      ID_BaseEntity_ChangedParameterName = 'ID_BaseEntity_Changed';
      ExternalIDFieldName = 'ExternalID';
      ExternalID_ChangedParameterName = 'ExternalID_Changed';
      ID_UserPersonInsertFieldName = 'ID_UserPersonInsert';
      ID_UserPersonInsert_ChangedParameterName = 'ID_UserPersonInsert_Changed';
      TimeStampInsertFieldName = 'TimeStampInsert';
      TimeStampInsert_ChangedParameterName = 'TimeStampInsert_Changed';
      ID_UserPersonUpdateFieldName = 'ID_UserPersonUpdate';
      ID_UserPersonUpdate_ChangedParameterName = 'ID_UserPersonUpdate_Changed';
      TimeStampLastUpdateFieldName = 'TimeStampLastUpdate';
      TimeStampLastUpdate_ChangedParameterName = 'TimeStampLastUpdate_Changed';
      StartDateTimeFieldName = 'StartDateTime';
      StartDateTime_ChangedParameterName = 'StartDateTime_Changed';
      FinishDateTimeFieldName = 'FinishDateTime';
      FinishDateTime_ChangedParameterName = 'FinishDateTime_Changed';
      RemarkFieldName = 'Remark';
      Remark_ChangedParameterName = 'Remark_Changed';
    property ID_BaseEntityField: TIntegerField read GetID_BaseEntityField;
    property ExternalIDField: TStringField read GetExternalIDField;
    property ID_UserPersonInsertField: TIntegerField read GetID_UserPersonInsertField;
    property TimeStampInsertField: TDateTimeField read GetTimeStampInsertField;
    property ID_UserPersonUpdateField: TIntegerField read GetID_UserPersonUpdateField;
    property TimeStampLastUpdateField: TDateTimeField read GetTimeStampLastUpdateField;
    property StartDateTimeField: TDateTimeField read GetStartDateTimeField;
    property FinishDateTimeField: TDateTimeField read GetFinishDateTimeField;
    property RemarkField: TStringField read GetRemarkField;
  end;

  TBaseEntityBaseEnumerator = class(TEntityListEnumerator)
  strict private
    function GetCurrent(): TBaseEntityBase;
  public
    property Current: TBaseEntityBase read GetCurrent;
  end;

  TBaseEntityListBase = class(TBaseEntityListBaseClientDataSet)
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
    function GetID_BaseEntity(): TNullableInteger; virtual;
    procedure SetID_BaseEntity(const Value: TNullableInteger); virtual;
    function GetExternalID(): TNullableString; virtual;
    procedure SetExternalID(const Value: TNullableString); virtual;
    function GetID_UserPersonInsert(): TNullableInteger; virtual;
    procedure SetID_UserPersonInsert(const Value: TNullableInteger); virtual;
    function GetTimeStampInsert(): TNullableDateTime; virtual;
    procedure SetTimeStampInsert(const Value: TNullableDateTime); virtual;
    function GetID_UserPersonUpdate(): TNullableInteger; virtual;
    procedure SetID_UserPersonUpdate(const Value: TNullableInteger); virtual;
    function GetTimeStampLastUpdate(): TNullableDateTime; virtual;
    procedure SetTimeStampLastUpdate(const Value: TNullableDateTime); virtual;
    function GetStartDateTime(): TNullableDateTime; virtual;
    procedure SetStartDateTime(const Value: TNullableDateTime); virtual;
    function GetFinishDateTime(): TNullableDateTime; virtual;
    procedure SetFinishDateTime(const Value: TNullableDateTime); virtual;
    function GetRemark(): TNullableString; virtual;
    procedure SetRemark(const Value: TNullableString); virtual;
  public
    const
      BaseEntity_TableName = 'BaseEntity';
    function GetEnumerator(): TBaseEntityBaseEnumerator;
    property ID_BaseEntity: TNullableInteger read GetID_BaseEntity write SetID_BaseEntity;
    property ExternalID: TNullableString read GetExternalID write SetExternalID;
    property ID_UserPersonInsert: TNullableInteger read GetID_UserPersonInsert write SetID_UserPersonInsert;
    property TimeStampInsert: TNullableDateTime read GetTimeStampInsert write SetTimeStampInsert;
    property ID_UserPersonUpdate: TNullableInteger read GetID_UserPersonUpdate write SetID_UserPersonUpdate;
    property TimeStampLastUpdate: TNullableDateTime read GetTimeStampLastUpdate write SetTimeStampLastUpdate;
    property StartDateTime: TNullableDateTime read GetStartDateTime write SetStartDateTime;
    property FinishDateTime: TNullableDateTime read GetFinishDateTime write SetFinishDateTime;
    property Remark: TNullableString read GetRemark write SetRemark;
  end;

implementation

uses
  FieldHelperUnit;

{ TBaseEntityBase }

function TBaseEntityBase.GetBaseEntityListBase(): TBaseEntityListBase;
begin
  Result := EntityList as TBaseEntityListBase;
end;

function TBaseEntityBase.GetEntityListClass(): TEntityListClass;
begin
  Result := TBaseEntityListBase;
end;

function TBaseEntityBase.GetID_BaseEntity(): TNullableInteger;
var
  Value: TNullableInteger;
begin
  ExecuteAtDictionaryID(
  procedure
  begin
    Value := BaseEntityList.ID_BaseEntity;
  end
  );
  Result := Value;
end;

procedure TBaseEntityBase.SetID_BaseEntity(const Value: TNullableInteger);
var
  NewValue: TNullableInteger;
begin
  NewValue := Value;
  ExecuteAtBookmarkInEditMode(
    procedure
    begin
      BaseEntityList.ID_BaseEntity := NewValue;
    end
  );
end;

function TBaseEntityBase.GetExternalID(): TNullableString;
var
  Value: TNullableString;
begin
  ExecuteAtDictionaryID(
  procedure
  begin
    Value := BaseEntityList.ExternalID;
  end
  );
  Result := Value;
end;

procedure TBaseEntityBase.SetExternalID(const Value: TNullableString);
var
  NewValue: TNullableString;
begin
  NewValue := Value;
  ExecuteAtBookmarkInEditMode(
    procedure
    begin
      BaseEntityList.ExternalID := NewValue;
    end
  );
end;

function TBaseEntityBase.GetID_UserPersonInsert(): TNullableInteger;
var
  Value: TNullableInteger;
begin
  ExecuteAtDictionaryID(
  procedure
  begin
    Value := BaseEntityList.ID_UserPersonInsert;
  end
  );
  Result := Value;
end;

procedure TBaseEntityBase.SetID_UserPersonInsert(const Value: TNullableInteger);
var
  NewValue: TNullableInteger;
begin
  NewValue := Value;
  ExecuteAtBookmarkInEditMode(
    procedure
    begin
      BaseEntityList.ID_UserPersonInsert := NewValue;
    end
  );
end;

function TBaseEntityBase.GetTimeStampInsert(): TNullableDateTime;
var
  Value: TNullableDateTime;
begin
  ExecuteAtDictionaryID(
  procedure
  begin
    Value := BaseEntityList.TimeStampInsert;
  end
  );
  Result := Value;
end;

procedure TBaseEntityBase.SetTimeStampInsert(const Value: TNullableDateTime);
var
  NewValue: TNullableDateTime;
begin
  NewValue := Value;
  ExecuteAtBookmarkInEditMode(
    procedure
    begin
      BaseEntityList.TimeStampInsert := NewValue;
    end
  );
end;

function TBaseEntityBase.GetID_UserPersonUpdate(): TNullableInteger;
var
  Value: TNullableInteger;
begin
  ExecuteAtDictionaryID(
  procedure
  begin
    Value := BaseEntityList.ID_UserPersonUpdate;
  end
  );
  Result := Value;
end;

procedure TBaseEntityBase.SetID_UserPersonUpdate(const Value: TNullableInteger);
var
  NewValue: TNullableInteger;
begin
  NewValue := Value;
  ExecuteAtBookmarkInEditMode(
    procedure
    begin
      BaseEntityList.ID_UserPersonUpdate := NewValue;
    end
  );
end;

function TBaseEntityBase.GetTimeStampLastUpdate(): TNullableDateTime;
var
  Value: TNullableDateTime;
begin
  ExecuteAtDictionaryID(
  procedure
  begin
    Value := BaseEntityList.TimeStampLastUpdate;
  end
  );
  Result := Value;
end;

procedure TBaseEntityBase.SetTimeStampLastUpdate(const Value: TNullableDateTime);
var
  NewValue: TNullableDateTime;
begin
  NewValue := Value;
  ExecuteAtBookmarkInEditMode(
    procedure
    begin
      BaseEntityList.TimeStampLastUpdate := NewValue;
    end
  );
end;

function TBaseEntityBase.GetStartDateTime(): TNullableDateTime;
var
  Value: TNullableDateTime;
begin
  ExecuteAtDictionaryID(
  procedure
  begin
    Value := BaseEntityList.StartDateTime;
  end
  );
  Result := Value;
end;

procedure TBaseEntityBase.SetStartDateTime(const Value: TNullableDateTime);
var
  NewValue: TNullableDateTime;
begin
  NewValue := Value;
  ExecuteAtBookmarkInEditMode(
    procedure
    begin
      BaseEntityList.StartDateTime := NewValue;
    end
  );
end;

function TBaseEntityBase.GetFinishDateTime(): TNullableDateTime;
var
  Value: TNullableDateTime;
begin
  ExecuteAtDictionaryID(
  procedure
  begin
    Value := BaseEntityList.FinishDateTime;
  end
  );
  Result := Value;
end;

procedure TBaseEntityBase.SetFinishDateTime(const Value: TNullableDateTime);
var
  NewValue: TNullableDateTime;
begin
  NewValue := Value;
  ExecuteAtBookmarkInEditMode(
    procedure
    begin
      BaseEntityList.FinishDateTime := NewValue;
    end
  );
end;

function TBaseEntityBase.GetRemark(): TNullableString;
var
  Value: TNullableString;
begin
  ExecuteAtDictionaryID(
  procedure
  begin
    Value := BaseEntityList.Remark;
  end
  );
  Result := Value;
end;

procedure TBaseEntityBase.SetRemark(const Value: TNullableString);
var
  NewValue: TNullableString;
begin
  NewValue := Value;
  ExecuteAtBookmarkInEditMode(
    procedure
    begin
      BaseEntityList.Remark := NewValue;
    end
  );
end;

{ TBaseEntityListBaseClientDataSet }

function TBaseEntityListBaseClientDataSet.GetData(): Integer;
begin
  Result := inherited GetData();
end;

function TBaseEntityListBaseClientDataSet.GetEntityClass(): TEntityClass;
begin
  Result := TBaseEntityBase;
end;

function TBaseEntityListBaseClientDataSet.GetID_BaseEntityField(): TIntegerField;
begin
  Result := Fields.FieldByName(ID_BaseEntityFieldName) as TIntegerField;
end;

function TBaseEntityListBaseClientDataSet.GetExternalIDField(): TStringField;
begin
  Result := Fields.FieldByName(ExternalIDFieldName) as TStringField;
end;

function TBaseEntityListBaseClientDataSet.GetID_UserPersonInsertField(): TIntegerField;
begin
  Result := Fields.FieldByName(ID_UserPersonInsertFieldName) as TIntegerField;
end;

function TBaseEntityListBaseClientDataSet.GetTimeStampInsertField(): TDateTimeField;
begin
  Result := Fields.FieldByName(TimeStampInsertFieldName) as TDateTimeField;
end;

function TBaseEntityListBaseClientDataSet.GetID_UserPersonUpdateField(): TIntegerField;
begin
  Result := Fields.FieldByName(ID_UserPersonUpdateFieldName) as TIntegerField;
end;

function TBaseEntityListBaseClientDataSet.GetTimeStampLastUpdateField(): TDateTimeField;
begin
  Result := Fields.FieldByName(TimeStampLastUpdateFieldName) as TDateTimeField;
end;

function TBaseEntityListBaseClientDataSet.GetStartDateTimeField(): TDateTimeField;
begin
  Result := Fields.FieldByName(StartDateTimeFieldName) as TDateTimeField;
end;

function TBaseEntityListBaseClientDataSet.GetFinishDateTimeField(): TDateTimeField;
begin
  Result := Fields.FieldByName(FinishDateTimeFieldName) as TDateTimeField;
end;

function TBaseEntityListBaseClientDataSet.GetRemarkField(): TStringField;
begin
  Result := Fields.FieldByName(RemarkFieldName) as TStringField;
end;

{ TBaseEntityBaseEnumerator }

function TBaseEntityBaseEnumerator.GetCurrent(): TBaseEntityBase;
var
  Entity: TEntity;
begin
  Entity := inherited Current;
  Result := Entity as TBaseEntityBase;
end;

{ TBaseEntityListBase }

procedure TBaseEntityListBase.SetDeleteQueryText(var DeleteQueryText: string);
begin
  DeleteQueryText := 'DELETE FROM BaseEntity WHERE ID_BaseEntity = :ID_BaseEntity';
end;

procedure TBaseEntityListBase.SetInsertQueryText(var InsertQueryText: string);
begin
  InsertQueryText :=
  'INSERT INTO BaseEntity (' +
  '  ExternalID, ' +
  '  ID_UserPersonInsert, ' +
  '  TimeStampInsert, ' +
  '  ID_UserPersonUpdate, ' +
  '  TimeStampLastUpdate, ' +
  '  StartDateTime, ' +
  '  FinishDateTime, ' +
  '  Remark  ) VALUES (' +
  '  :ExternalID_Changed, ' +
  '  :ID_UserPersonInsert_Changed, ' +
  '  :TimeStampInsert_Changed, ' +
  '  :ID_UserPersonUpdate_Changed, ' +
  '  :TimeStampLastUpdate_Changed, ' +
  '  :StartDateTime_Changed, ' +
  '  :FinishDateTime_Changed, ' +
  '  :Remark_Changed  )';
end;

procedure TBaseEntityListBase.SetReadQueryText(const ReadQuery: TDBQuery);
begin
  ReadQuery.SQL.Add('   SELECT ' +
  '  BaseEntity.ID_BaseEntity, ' +
  '  BaseEntity.ExternalID, ' +
  '  BaseEntity.ID_UserPersonInsert, ' +
  '  BaseEntity.TimeStampInsert, ' +
  '  BaseEntity.ID_UserPersonUpdate, ' +
  '  BaseEntity.TimeStampLastUpdate, ' +
  '  BaseEntity.StartDateTime, ' +
  '  BaseEntity.FinishDateTime, ' +
  '  BaseEntity.Remark ' +
  '   FROM  BaseEntity ' +
  'WHERE (1=1) '
  );
end;

procedure TBaseEntityListBase.SetUpdateQueryText(var UpdateQueryText: string);
begin
  UpdateQueryText :=
  'UPDATE BaseEntity ' + 'SET ' +
  '  ExternalID = :ExternalID_Changed, ' +
  '  ID_UserPersonInsert = :ID_UserPersonInsert_Changed, ' +
  '  TimeStampInsert = :TimeStampInsert_Changed, ' +
  '  ID_UserPersonUpdate = :ID_UserPersonUpdate_Changed, ' +
  '  TimeStampLastUpdate = :TimeStampLastUpdate_Changed, ' +
  '  StartDateTime = :StartDateTime_Changed, ' +
  '  FinishDateTime = :FinishDateTime_Changed, ' +
  '  Remark = :Remark_Changed ' +
  'WHERE ID_BaseEntity = :ID_BaseEntity ';
end;

procedure TBaseEntityListBase.SetParams(const DBQuery: TDBQuery);
begin
  DBQuery.AssignParam(ExternalID, ExternalID_ChangedParameterName);
  DBQuery.AssignParam(ID_UserPersonInsert, ID_UserPersonInsert_ChangedParameterName);
  DBQuery.AssignParam(TimeStampInsert, TimeStampInsert_ChangedParameterName);
  DBQuery.AssignParam(ID_UserPersonUpdate, ID_UserPersonUpdate_ChangedParameterName);
  DBQuery.AssignParam(TimeStampLastUpdate, TimeStampLastUpdate_ChangedParameterName);
  DBQuery.AssignParam(StartDateTime, StartDateTime_ChangedParameterName);
  DBQuery.AssignParam(FinishDateTime, FinishDateTime_ChangedParameterName);
  DBQuery.AssignParam(Remark, Remark_ChangedParameterName);
end;

function TBaseEntityListBase.FillJoinedColumnPair(): TJoinedColumnPair;
begin
  Result := TJoinedColumnPair.Create(BaseEntity_TableName, ID_BaseEntityFieldName);
end;

procedure TBaseEntityListBase.FillDeleteQueryRecordList(const DeleteQueryRecordList: TMSDMLQueryRecordList);
var
  DeleteQueryRecord: TMSDMLQueryRecord;
begin
  inherited FillDeleteQueryRecordList(DeleteQueryRecordList);
  DeleteQueryRecord.SetQueryTextMethod := Self.SetDeleteQueryText;
  DeleteQueryRecord.SetParamsMethod := nil;
  DeleteQueryRecord.JoinedColumnPair := FillJoinedColumnPair();
  DeleteQueryRecordList.Add(DeleteQueryRecord);
end;

procedure TBaseEntityListBase.FillInsertQueryRecordList(const InsertQueryRecordList: TMSDMLQueryRecordList);
var
  InsertQueryRecord: TMSDMLQueryRecord;
begin
  inherited FillInsertQueryRecordList(InsertQueryRecordList);
  InsertQueryRecord.SetQueryTextMethod := Self.SetInsertQueryText;
  InsertQueryRecord.SetParamsMethod := Self.SetParams;
  InsertQueryRecord.JoinedColumnPair := FillJoinedColumnPair();
  InsertQueryRecordList.Add(InsertQueryRecord);
end;

procedure TBaseEntityListBase.FillUpdateQueryRecordList(const UpdateQueryRecordList: TMSDMLQueryRecordList);
var
  UpdateQueryRecord: TMSDMLQueryRecord;
begin
  inherited FillUpdateQueryRecordList(UpdateQueryRecordList);
  UpdateQueryRecord.SetQueryTextMethod := Self.SetUpdateQueryText;
  UpdateQueryRecord.SetParamsMethod := Self.SetParams;
  UpdateQueryRecord.JoinedColumnPair := FillJoinedColumnPair();
  UpdateQueryRecordList.Add(UpdateQueryRecord);
end;

function TBaseEntityListBase.GetID_BaseEntity(): TNullableInteger;
begin
  Result := ID_BaseEntityField.AsNullableInteger;
end;

procedure TBaseEntityListBase.SetID_BaseEntity(const Value: TNullableInteger);
begin
  ID_BaseEntityField.AsNullableInteger := Value;
end;

function TBaseEntityListBase.GetExternalID(): TNullableString;
begin
  Result := ExternalIDField.AsNullableString;
end;

procedure TBaseEntityListBase.SetExternalID(const Value: TNullableString);
begin
  ExternalIDField.AsNullableString := Value;
end;

function TBaseEntityListBase.GetID_UserPersonInsert(): TNullableInteger;
begin
  Result := ID_UserPersonInsertField.AsNullableInteger;
end;

procedure TBaseEntityListBase.SetID_UserPersonInsert(const Value: TNullableInteger);
begin
  ID_UserPersonInsertField.AsNullableInteger := Value;
end;

function TBaseEntityListBase.GetTimeStampInsert(): TNullableDateTime;
begin
  Result := TimeStampInsertField.AsNullableDateTime;
end;

procedure TBaseEntityListBase.SetTimeStampInsert(const Value: TNullableDateTime);
begin
  TimeStampInsertField.AsNullableDateTime := Value;
end;

function TBaseEntityListBase.GetID_UserPersonUpdate(): TNullableInteger;
begin
  Result := ID_UserPersonUpdateField.AsNullableInteger;
end;

procedure TBaseEntityListBase.SetID_UserPersonUpdate(const Value: TNullableInteger);
begin
  ID_UserPersonUpdateField.AsNullableInteger := Value;
end;

function TBaseEntityListBase.GetTimeStampLastUpdate(): TNullableDateTime;
begin
  Result := TimeStampLastUpdateField.AsNullableDateTime;
end;

procedure TBaseEntityListBase.SetTimeStampLastUpdate(const Value: TNullableDateTime);
begin
  TimeStampLastUpdateField.AsNullableDateTime := Value;
end;

function TBaseEntityListBase.GetStartDateTime(): TNullableDateTime;
begin
  Result := StartDateTimeField.AsNullableDateTime;
end;

procedure TBaseEntityListBase.SetStartDateTime(const Value: TNullableDateTime);
begin
  StartDateTimeField.AsNullableDateTime := Value;
end;

function TBaseEntityListBase.GetFinishDateTime(): TNullableDateTime;
begin
  Result := FinishDateTimeField.AsNullableDateTime;
end;

procedure TBaseEntityListBase.SetFinishDateTime(const Value: TNullableDateTime);
begin
  FinishDateTimeField.AsNullableDateTime := Value;
end;

function TBaseEntityListBase.GetRemark(): TNullableString;
begin
  Result := RemarkField.AsNullableString;
end;

procedure TBaseEntityListBase.SetRemark(const Value: TNullableString);
begin
  RemarkField.AsNullableString := Value;
end;

function TBaseEntityListBase.GetEnumerator(): TBaseEntityBaseEnumerator;
begin
  Result := TBaseEntityBaseEnumerator.Create(Self);
end;

{
object ID_BaseEntityDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 8
  Width = 165
  Height = 17
  FocusControl = ID_BaseEntityDbEdit
end
object ID_BaseEntityDbEdit: TDBEdit
  Left = 10
  Top = 22
  Width = 221
  Height = 21
  TabOrder = 0
end
object ExternalIDDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 50
  Width = 165
  Height = 17
  FocusControl = ExternalIDDbEdit
end
object ExternalIDDbEdit: TDBEdit
  Left = 10
  Top = 64
  Width = 221
  Height = 21
  TabOrder = 1
end
object ID_UserPersonInsertDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 92
  Width = 165
  Height = 17
  FocusControl = ID_UserPersonInsertDbEdit
end
object ID_UserPersonInsertDbEdit: TDBEdit
  Left = 10
  Top = 106
  Width = 221
  Height = 21
  TabOrder = 2
end
object TimeStampInsertDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 134
  Width = 165
  Height = 17
  FocusControl = TimeStampInsertDbEdit
end
object TimeStampInsertDbEdit: TDBEdit
  Left = 10
  Top = 148
  Width = 221
  Height = 21
  TabOrder = 3
end
object ID_UserPersonUpdateDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 176
  Width = 165
  Height = 17
  FocusControl = ID_UserPersonUpdateDbEdit
end
object ID_UserPersonUpdateDbEdit: TDBEdit
  Left = 10
  Top = 190
  Width = 221
  Height = 21
  TabOrder = 4
end
object TimeStampLastUpdateDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 218
  Width = 165
  Height = 17
  FocusControl = TimeStampLastUpdateDbEdit
end
object TimeStampLastUpdateDbEdit: TDBEdit
  Left = 10
  Top = 232
  Width = 221
  Height = 21
  TabOrder = 5
end
object StartDateTimeDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 260
  Width = 165
  Height = 17
  FocusControl = StartDateTimeDbEdit
end
object StartDateTimeDbEdit: TDBEdit
  Left = 10
  Top = 274
  Width = 221
  Height = 21
  TabOrder = 6
end
object FinishDateTimeDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 302
  Width = 165
  Height = 17
  FocusControl = FinishDateTimeDbEdit
end
object FinishDateTimeDbEdit: TDBEdit
  Left = 10
  Top = 316
  Width = 221
  Height = 21
  TabOrder = 7
end
object RemarkDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 344
  Width = 165
  Height = 17
  FocusControl = RemarkDbEdit
end
object RemarkDbEdit: TDBEdit
  Left = 10
  Top = 358
  Width = 221
  Height = 21
  TabOrder = 8
end

procedure TBaseEntityWijzigenForm.SetBaseEntity(const Value: TBaseEntity);
var
  BaseEntityList: TBaseEntityList;
begin
  if Assigned(Value) then
  begin
    BaseEntityList:= Value.BaseEntityList;
    AssignDataField(Self.ID_BaseEntityDbDisplayLabel, Self.ID_BaseEntityDbEdit, BaseEntityList.ID_BaseEntityField);
    AssignDataField(Self.ExternalIDDbDisplayLabel, Self.ExternalIDDbEdit, BaseEntityList.ExternalIDField);
    AssignDataField(Self.ID_UserPersonInsertDbDisplayLabel, Self.ID_UserPersonInsertDbEdit, BaseEntityList.ID_UserPersonInsertField);
    AssignDataField(Self.TimeStampInsertDbDisplayLabel, Self.TimeStampInsertDbEdit, BaseEntityList.TimeStampInsertField);
    AssignDataField(Self.ID_UserPersonUpdateDbDisplayLabel, Self.ID_UserPersonUpdateDbEdit, BaseEntityList.ID_UserPersonUpdateField);
    AssignDataField(Self.TimeStampLastUpdateDbDisplayLabel, Self.TimeStampLastUpdateDbEdit, BaseEntityList.TimeStampLastUpdateField);
    AssignDataField(Self.StartDateTimeDbDisplayLabel, Self.StartDateTimeDbEdit, BaseEntityList.StartDateTimeField);
    AssignDataField(Self.FinishDateTimeDbDisplayLabel, Self.FinishDateTimeDbEdit, BaseEntityList.FinishDateTimeField);
    AssignDataField(Self.RemarkDbDisplayLabel, Self.RemarkDbEdit, BaseEntityList.RemarkField);
    FBaseEntity := Value;
    DataSource.DataSet := BaseEntityList;
  end
  else
    DataSource.DataSet := nil;
end;
}
end.
