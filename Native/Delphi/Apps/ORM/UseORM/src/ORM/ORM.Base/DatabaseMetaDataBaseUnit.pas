unit DatabaseMetaDataBaseUnit;

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
  TDatabaseMetaDataBase = class;
  TDatabaseMetaDataListBase = class;

  TDatabaseMetaDataBase = class(TEntity)
  strict protected
    function GetDatabaseMetaDataListBase(): TDatabaseMetaDataListBase; virtual;
    function GetEntityListClass(): TEntityListClass; override;
    function GetID_DatabaseMetaData(): TNullableInteger; virtual;
    procedure SetID_DatabaseMetaData(const Value: TNullableInteger); virtual;
    function GetVersion(): TNullableString; virtual;
    procedure SetVersion(const Value: TNullableString); virtual;
    function GetLastUpdate(): TNullableDateTime; virtual;
    procedure SetLastUpdate(const Value: TNullableDateTime); virtual;
    property DatabaseMetaDataList: TDatabaseMetaDataListBase read GetDatabaseMetaDataListBase;
  public
    property ID_DatabaseMetaData: TNullableInteger read GetID_DatabaseMetaData write SetID_DatabaseMetaData;
    property Version: TNullableString read GetVersion write SetVersion;
    property LastUpdate: TNullableDateTime read GetLastUpdate write SetLastUpdate;
  end;

  TDatabaseMetaDataListBaseClientDataSet = class(TEntityListClientDataSet)
  strict protected
    function GetData(): Integer; overload; override;
    function GetEntityClass(): TEntityClass; overload; override;
    function GetID_DatabaseMetaDataField(): TIntegerField; virtual;
    function GetVersionField(): TStringField; virtual;
    function GetLastUpdateField(): TDateTimeField; virtual;
  public
    const
      ID_DatabaseMetaDataFieldName = 'ID_DatabaseMetaData';
      ID_DatabaseMetaData_ChangedParameterName = 'ID_DatabaseMetaData_Changed';
      VersionFieldName = 'Version';
      Version_ChangedParameterName = 'Version_Changed';
      LastUpdateFieldName = 'LastUpdate';
      LastUpdate_ChangedParameterName = 'LastUpdate_Changed';
    property ID_DatabaseMetaDataField: TIntegerField read GetID_DatabaseMetaDataField;
    property VersionField: TStringField read GetVersionField;
    property LastUpdateField: TDateTimeField read GetLastUpdateField;
  end;

  TDatabaseMetaDataBaseEnumerator = class(TEntityListEnumerator)
  strict private
    function GetCurrent(): TDatabaseMetaDataBase;
  public
    property Current: TDatabaseMetaDataBase read GetCurrent;
  end;

  TDatabaseMetaDataListBase = class(TDatabaseMetaDataListBaseClientDataSet)
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
    function GetID_DatabaseMetaData(): TNullableInteger; virtual;
    procedure SetID_DatabaseMetaData(const Value: TNullableInteger); virtual;
    function GetVersion(): TNullableString; virtual;
    procedure SetVersion(const Value: TNullableString); virtual;
    function GetLastUpdate(): TNullableDateTime; virtual;
    procedure SetLastUpdate(const Value: TNullableDateTime); virtual;
  public
    const
      DatabaseMetaData_TableName = 'DatabaseMetaData';
    function GetEnumerator(): TDatabaseMetaDataBaseEnumerator;
    property ID_DatabaseMetaData: TNullableInteger read GetID_DatabaseMetaData write SetID_DatabaseMetaData;
    property Version: TNullableString read GetVersion write SetVersion;
    property LastUpdate: TNullableDateTime read GetLastUpdate write SetLastUpdate;
  end;

implementation

uses
  FieldHelperUnit;

{ TDatabaseMetaDataBase }

function TDatabaseMetaDataBase.GetDatabaseMetaDataListBase(): TDatabaseMetaDataListBase;
begin
  Result := EntityList as TDatabaseMetaDataListBase;
end;

function TDatabaseMetaDataBase.GetEntityListClass(): TEntityListClass;
begin
  Result := TDatabaseMetaDataListBase;
end;

function TDatabaseMetaDataBase.GetID_DatabaseMetaData(): TNullableInteger;
var
  Value: TNullableInteger;
begin
  ExecuteAtDictionaryID(
  procedure
  begin
    Value := DatabaseMetaDataList.ID_DatabaseMetaData;
  end
  );
  Result := Value;
end;

procedure TDatabaseMetaDataBase.SetID_DatabaseMetaData(const Value: TNullableInteger);
var
  NewValue: TNullableInteger;
begin
  NewValue := Value;
  ExecuteAtBookmarkInEditMode(
    procedure
    begin
      DatabaseMetaDataList.ID_DatabaseMetaData := NewValue;
    end
  );
end;

function TDatabaseMetaDataBase.GetVersion(): TNullableString;
var
  Value: TNullableString;
begin
  ExecuteAtDictionaryID(
  procedure
  begin
    Value := DatabaseMetaDataList.Version;
  end
  );
  Result := Value;
end;

procedure TDatabaseMetaDataBase.SetVersion(const Value: TNullableString);
var
  NewValue: TNullableString;
begin
  NewValue := Value;
  ExecuteAtBookmarkInEditMode(
    procedure
    begin
      DatabaseMetaDataList.Version := NewValue;
    end
  );
end;

function TDatabaseMetaDataBase.GetLastUpdate(): TNullableDateTime;
var
  Value: TNullableDateTime;
begin
  ExecuteAtDictionaryID(
  procedure
  begin
    Value := DatabaseMetaDataList.LastUpdate;
  end
  );
  Result := Value;
end;

procedure TDatabaseMetaDataBase.SetLastUpdate(const Value: TNullableDateTime);
var
  NewValue: TNullableDateTime;
begin
  NewValue := Value;
  ExecuteAtBookmarkInEditMode(
    procedure
    begin
      DatabaseMetaDataList.LastUpdate := NewValue;
    end
  );
end;

{ TDatabaseMetaDataListBaseClientDataSet }

function TDatabaseMetaDataListBaseClientDataSet.GetData(): Integer;
begin
  Result := inherited GetData();
end;

function TDatabaseMetaDataListBaseClientDataSet.GetEntityClass(): TEntityClass;
begin
  Result := TDatabaseMetaDataBase;
end;

function TDatabaseMetaDataListBaseClientDataSet.GetID_DatabaseMetaDataField(): TIntegerField;
begin
  Result := Fields.FieldByName(ID_DatabaseMetaDataFieldName) as TIntegerField;
end;

function TDatabaseMetaDataListBaseClientDataSet.GetVersionField(): TStringField;
begin
  Result := Fields.FieldByName(VersionFieldName) as TStringField;
end;

function TDatabaseMetaDataListBaseClientDataSet.GetLastUpdateField(): TDateTimeField;
begin
  Result := Fields.FieldByName(LastUpdateFieldName) as TDateTimeField;
end;

{ TDatabaseMetaDataBaseEnumerator }

function TDatabaseMetaDataBaseEnumerator.GetCurrent(): TDatabaseMetaDataBase;
var
  Entity: TEntity;
begin
  Entity := inherited Current;
  Result := Entity as TDatabaseMetaDataBase;
end;

{ TDatabaseMetaDataListBase }

procedure TDatabaseMetaDataListBase.SetDeleteQueryText(var DeleteQueryText: string);
begin
  DeleteQueryText := 'DELETE FROM DatabaseMetaData WHERE ID_DatabaseMetaData = :ID_DatabaseMetaData';
end;

procedure TDatabaseMetaDataListBase.SetInsertQueryText(var InsertQueryText: string);
begin
  InsertQueryText :=
  'INSERT INTO DatabaseMetaData (' +
  '  Version, ' +
  '  LastUpdate  ) VALUES (' +
  '  :Version_Changed, ' +
  '  :LastUpdate_Changed  )';
end;

procedure TDatabaseMetaDataListBase.SetReadQueryText(const ReadQuery: TDBQuery);
begin
  ReadQuery.SQL.Add('   SELECT ' +
  '  DatabaseMetaData.ID_DatabaseMetaData, ' +
  '  DatabaseMetaData.Version, ' +
  '  DatabaseMetaData.LastUpdate ' +
  '   FROM  DatabaseMetaData ' +
  'WHERE (1=1) '
  );
end;

procedure TDatabaseMetaDataListBase.SetUpdateQueryText(var UpdateQueryText: string);
begin
  UpdateQueryText :=
  'UPDATE DatabaseMetaData ' + 'SET ' +
  '  Version = :Version_Changed, ' +
  '  LastUpdate = :LastUpdate_Changed ' +
  'WHERE ID_DatabaseMetaData = :ID_DatabaseMetaData ';
end;

procedure TDatabaseMetaDataListBase.SetParams(const DBQuery: TDBQuery);
begin
  DBQuery.AssignParam(Version, Version_ChangedParameterName);
  DBQuery.AssignParam(LastUpdate, LastUpdate_ChangedParameterName);
end;

function TDatabaseMetaDataListBase.FillJoinedColumnPair(): TJoinedColumnPair;
begin
  Result := TJoinedColumnPair.Create(DatabaseMetaData_TableName, ID_DatabaseMetaDataFieldName);
end;

procedure TDatabaseMetaDataListBase.FillDeleteQueryRecordList(const DeleteQueryRecordList: TMSDMLQueryRecordList);
var
  DeleteQueryRecord: TMSDMLQueryRecord;
begin
  inherited FillDeleteQueryRecordList(DeleteQueryRecordList);
  DeleteQueryRecord.SetQueryTextMethod := Self.SetDeleteQueryText;
  DeleteQueryRecord.SetParamsMethod := nil;
  DeleteQueryRecord.JoinedColumnPair := FillJoinedColumnPair();
  DeleteQueryRecordList.Add(DeleteQueryRecord);
end;

procedure TDatabaseMetaDataListBase.FillInsertQueryRecordList(const InsertQueryRecordList: TMSDMLQueryRecordList);
var
  InsertQueryRecord: TMSDMLQueryRecord;
begin
  inherited FillInsertQueryRecordList(InsertQueryRecordList);
  InsertQueryRecord.SetQueryTextMethod := Self.SetInsertQueryText;
  InsertQueryRecord.SetParamsMethod := Self.SetParams;
  InsertQueryRecord.JoinedColumnPair := FillJoinedColumnPair();
  InsertQueryRecordList.Add(InsertQueryRecord);
end;

procedure TDatabaseMetaDataListBase.FillUpdateQueryRecordList(const UpdateQueryRecordList: TMSDMLQueryRecordList);
var
  UpdateQueryRecord: TMSDMLQueryRecord;
begin
  inherited FillUpdateQueryRecordList(UpdateQueryRecordList);
  UpdateQueryRecord.SetQueryTextMethod := Self.SetUpdateQueryText;
  UpdateQueryRecord.SetParamsMethod := Self.SetParams;
  UpdateQueryRecord.JoinedColumnPair := FillJoinedColumnPair();
  UpdateQueryRecordList.Add(UpdateQueryRecord);
end;

function TDatabaseMetaDataListBase.GetID_DatabaseMetaData(): TNullableInteger;
begin
  Result := ID_DatabaseMetaDataField.AsNullableInteger;
end;

procedure TDatabaseMetaDataListBase.SetID_DatabaseMetaData(const Value: TNullableInteger);
begin
  ID_DatabaseMetaDataField.AsNullableInteger := Value;
end;

function TDatabaseMetaDataListBase.GetVersion(): TNullableString;
begin
  Result := VersionField.AsNullableString;
end;

procedure TDatabaseMetaDataListBase.SetVersion(const Value: TNullableString);
begin
  VersionField.AsNullableString := Value;
end;

function TDatabaseMetaDataListBase.GetLastUpdate(): TNullableDateTime;
begin
  Result := LastUpdateField.AsNullableDateTime;
end;

procedure TDatabaseMetaDataListBase.SetLastUpdate(const Value: TNullableDateTime);
begin
  LastUpdateField.AsNullableDateTime := Value;
end;

function TDatabaseMetaDataListBase.GetEnumerator(): TDatabaseMetaDataBaseEnumerator;
begin
  Result := TDatabaseMetaDataBaseEnumerator.Create(Self);
end;

{
object ID_DatabaseMetaDataDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 8
  Width = 165
  Height = 17
  FocusControl = ID_DatabaseMetaDataDbEdit
end
object ID_DatabaseMetaDataDbEdit: TDBEdit
  Left = 10
  Top = 22
  Width = 221
  Height = 21
  TabOrder = 0
end
object VersionDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 50
  Width = 165
  Height = 17
  FocusControl = VersionDbEdit
end
object VersionDbEdit: TDBEdit
  Left = 10
  Top = 64
  Width = 221
  Height = 21
  TabOrder = 1
end
object LastUpdateDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 92
  Width = 165
  Height = 17
  FocusControl = LastUpdateDbEdit
end
object LastUpdateDbEdit: TDBEdit
  Left = 10
  Top = 106
  Width = 221
  Height = 21
  TabOrder = 2
end

procedure TDatabaseMetaDataWijzigenForm.SetDatabaseMetaData(const Value: TDatabaseMetaData);
var
  DatabaseMetaDataList: TDatabaseMetaDataList;
begin
  if Assigned(Value) then
  begin
    DatabaseMetaDataList:= Value.DatabaseMetaDataList;
    AssignDataField(Self.ID_DatabaseMetaDataDbDisplayLabel, Self.ID_DatabaseMetaDataDbEdit, DatabaseMetaDataList.ID_DatabaseMetaDataField);
    AssignDataField(Self.VersionDbDisplayLabel, Self.VersionDbEdit, DatabaseMetaDataList.VersionField);
    AssignDataField(Self.LastUpdateDbDisplayLabel, Self.LastUpdateDbEdit, DatabaseMetaDataList.LastUpdateField);
    FDatabaseMetaData := Value;
    DataSource.DataSet := DatabaseMetaDataList;
  end
  else
    DataSource.DataSet := nil;
end;
}
end.
