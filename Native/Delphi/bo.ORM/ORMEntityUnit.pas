unit ORMEntityUnit;

interface

uses
  Classes,
  Contnrs,
  DBClient,
  ADODB, SysUtils,
  DB, NullablesUnit,
  Generics.Collections,
  Generics.Defaults,
  DataSetEnumeratorUnit, DataSetHelperUnit,
  MSConnectionLayerUnit,
  MSConnectionDataModuleUnit,
  ADOConnectionStringBuilderUnit, JoinedColumnPairUnit, MSDMLQueryRecordUnit,
  ClientDataSetSupportingCalculatedAndLookupFieldsUnit, SqlWhereCriterionsUnit,
  ClientDataSetSupportingWhereOrderByUnit, GenericExceptionUnit;

type
  TPostAction = (paEdit, paInsert);

type
  TEntity = class;
  TEntityClass = class of TEntity;
  TReadOnlyEntityList = class;
  TEntityList = class;
  TEntityListClass = class of TEntityList;

  TLookupEntityListManager = class;

  TEntity = class(TPersistent)
  strict private
    FDictionaryID: Integer;
    FEntityList: TReadOnlyEntityList;
  strict protected
    function GetCanDelete: Boolean; virtual;
    function GetEntityList: TReadOnlyEntityList; virtual;
    function GetEntityListClass: TEntityListClass; virtual;
    function GetLookupEntityListManager: TLookupEntityListManager; virtual;
    procedure SetDictionaryID(const Value: Integer); virtual;
  public
    constructor Create(const EntityList: TReadOnlyEntityList);
    procedure ExecuteAtBookmarkInEditMode(const Proc: TProc); overload;
    procedure ExecuteAtDictionaryID(const Proc: TProc); overload;
    procedure GetData(const SelectQuery: TADOQuery); virtual;
    procedure LocateInEntityList; virtual;
    property CanDelete: Boolean read GetCanDelete;
    property DictionaryID: Integer read FDictionaryID write SetDictionaryID;
    property EntityList: TReadOnlyEntityList read GetEntityList;
    property EntityListClass: TEntityListClass read GetEntityListClass;
    property LookupEntityListManager: TLookupEntityListManager read GetLookupEntityListManager;
  end;

  TIntegerDictionaryOfEntity = TDictionary<Integer, TEntity>;
  TEntityObjectList = TObjectList<TEntity>;
  TReadOnlyEntityList = class(TClientDataSetSupportingWhereOrderBy)
  strict private
    FEntityDictionary: TIntegerDictionaryOfEntity;
    FEntityList: TEntityObjectList;
    FNeedsFill: Boolean;
    FSelectQuery: TDBQuery;
  strict protected
    procedure AddFilterCriterions; virtual;
    procedure AddOrderByItems; virtual;
    procedure ApplyOrderByClause(const ReadQuery: TDBQuery); virtual;
    procedure CalculateCalculatedFields; virtual;
    procedure ClearList; virtual;
    function CreateQuery: TDBQuery; virtual;
    function GetContainsID(ID: TNullableInteger): Boolean; virtual;
    function GetCount: Integer; virtual;
    function GetCurrentEntity: TEntity; virtual;
    function GetData: Integer; overload; virtual;
    function GetDataModule: TMSConnectionDataModule; virtual;
    function GetDataModuleConnection: TDBConnection; virtual;
    function GetDictionaryID: TNullableInteger; virtual;
    function GetDictionaryIDField: TField; virtual;
    function GetDictionaryIDFieldName: string; virtual;
    function GetDictionaryIDNullableInteger: TNullableInteger; virtual;
    function GetEntityById(ID: TNullableInteger): TEntity; virtual;
    function GetEntityClass: TEntityClass; virtual;
    function GetLookupEntityListManager: TLookupEntityListManager; virtual;
    function GetParentTableName: string; virtual;
    function GetProviderType: TProviderType;
    function GetSelectQuery: TDBQuery; virtual;
    function GetTableName: string; virtual;
    procedure HideIDColumns; virtual;
    procedure InternalAssignDataFrom(const DataSet: TDataSet); virtual;
    procedure InternalFill; virtual;
    function IsIDField(const Field: TField): Boolean; virtual;
    function Locate(const NewDictionaryID: Integer): Boolean; overload; virtual;
    function LocatedAtDictionaryId(const ADictionaryID: Integer): Boolean; overload; virtual;
    procedure OwnThisEntity(NewEntity: TEntity); virtual;
    procedure SetNeedsFill(const Value: Boolean); virtual;
    procedure SetReadQueryText(const ReadQuery: TDBQuery); virtual;
    property DataModule: TMSConnectionDataModule read GetDataModule;
    property DataModuleConnection: TDBConnection read GetDataModuleConnection;
    property EntityDictionary: TIntegerDictionaryOfEntity read FEntityDictionary;
    property EntityList: TEntityObjectList read FEntityList;
    property SelectQuery: TDBQuery read GetSelectQuery;
  protected
    procedure DoOnCalcFields; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AssignDataFrom(const DataSet: TDataSet); virtual;
    procedure ExecuteAtDictionaryID(const NewDictionaryID: Integer; const Proc: TProc); overload;
    procedure Fill; virtual;
    //1 Support for ... in loop providing TDataSetEnumerationRecord
    function GetEnumerator: TDataSetEnumerator;
    function Locate(const Entity: TEntity): Boolean; overload; virtual;
    procedure Refill; virtual;
    function ToString: string; override;
    property ContainsID[ID: TNullableInteger]: Boolean read GetContainsID;
    property Count: Integer read GetCount;
    property CurrentEntity: TEntity read GetCurrentEntity;
    property DictionaryID: TNullableInteger read GetDictionaryID;
    property DictionaryIDField: TField read GetDictionaryIDField;
    property DictionaryIDFieldName: string read GetDictionaryIDFieldName;
    property DictionaryIDNullableInteger: TNullableInteger read GetDictionaryIDNullableInteger;
    property EntityById[ID: TNullableInteger]: TEntity read GetEntityById;
    property EntityClass: TEntityClass read GetEntityClass;
    property LookupEntityListManager: TLookupEntityListManager read GetLookupEntityListManager;
    property NeedsFill: Boolean read FNeedsFill write SetNeedsFill;
    property ParentTableName: string read GetParentTableName;
    property ProviderType: TProviderType read GetProviderType;
    property TableName: string read GetTableName;
  end;

  TLookupEntityListDictionaryKeyValueType = (vtInteger, vtString);
  TLookupEntityListDictionaryKey = record
  strict private
    FEntityListClass: TEntityListClass;
    FFilterCriterionFieldName: string;
    FValueType: TLookupEntityListDictionaryKeyValueType;
    FFilterCriterionIntegerValue: TNullableInteger;
    FFilterCriterionStringValue: TNullableString;
  public
    class function Create(const EntityListClass: TEntityListClass): TLookupEntityListDictionaryKey; overload; static;
    class function Create(const EntityListClass: TEntityListClass; const FilterCriterionFieldName: string; const FilterCriterionValue: TNullableString):
        TLookupEntityListDictionaryKey; overload; static;
    class function Create(const EntityListClass: TEntityListClass; const FilterCriterionFieldName: string; const
        FilterCriterionValue: TNullableInteger): TLookupEntityListDictionaryKey; overload; static;
    function CreateReadOnlyEntityList(const Owner: TComponent): TReadOnlyEntityList;
    function ToString: string;
  end;

  TLookupEntityListDictionary = TDictionary<string, TReadOnlyEntityList>;

  TLookupEntityListManager = class(TComponent)
  strict private
    FLookupEntityListDictionary: TLookupEntityListDictionary;
  strict protected
    function GetLookupEntityList(Key: TLookupEntityListDictionaryKey): TReadOnlyEntityList;
    function GetLookupEntityListDictionary: TLookupEntityListDictionary;
  public
    destructor Destroy; override;
    procedure RefillAll(const EntityListClass: TEntityListClass);
    property LookupEntityList[Key: TLookupEntityListDictionaryKey]: TReadOnlyEntityList read GetLookupEntityList;
    property LookupEntityListDictionary: TLookupEntityListDictionary read GetLookupEntityListDictionary;
  end;

  TEntityList = class(TReadOnlyEntityList)
  strict private
    FDeleteQuery: TDBQuery;
    FIdentityQuery: TDBQuery;
    FInsertQuery: TDBQuery;
    FUpdateQuery: TDBQuery;
  strict protected
    function GetDeleteQuery: TDBQuery; virtual;
    function GetIdentityQuery: TDBQuery; virtual;
    function GetInsertQuery: TDBQuery; virtual;
    function GetLatestIdentity: Integer; virtual;
    function GetUpdateQuery: TDBQuery; virtual;
    property DeleteQuery: TDBQuery read GetDeleteQuery;
    property IdentityQuery: TDBQuery read GetIdentityQuery;
    property InsertQuery: TDBQuery read GetInsertQuery;
    property UpdateQuery: TDBQuery read GetUpdateQuery;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TFillQueryRecordListMethod = procedure (const InsertQueryRecordList: TMSDMLQueryRecordList) of object;

  TEntityListClientDataSet = class(TEntityList)
  strict private
    FInsertedIdentity: TNullableInteger;
  strict protected
    procedure AssertChangeCountIs0; virtual;
    procedure AssertChangeCountIs1; virtual;
    procedure ConfirmChanges; virtual;
    function CreateFilledEntityQueryRecordList(const FillQueryRecordListMethod: TFillQueryRecordListMethod; const FillQueryRecordListMethodName: string):
        TMSDMLQueryRecordList; virtual;
    procedure DoDelete; virtual;
    procedure DoEdit; virtual;
    procedure DoInsert; virtual;
    procedure DoInternalPost(StartState: TDataSetState); virtual;
    procedure ExecuteAndVerifyCountIs1(const DMLQuery: TDBQuery; const ID: TNullableInteger); overload; virtual;
    procedure ExecuteAndVerifyCountIs1(const QueryRecord: TMSDMLQueryRecord); overload; virtual;
    procedure FillDeleteQueryRecordList(const DeleteQueryRecordList: TMSDMLQueryRecordList); virtual;
    procedure FillInsertQueryRecordList(const InsertQueryRecordList: TMSDMLQueryRecordList); virtual;
    procedure FillUpdateQueryRecordList(const UpdateQueryRecordList: TMSDMLQueryRecordList); virtual;
    procedure ReleaseThisEntity(NewEntity: TEntity); virtual;
    procedure SetDictionaryIDFieldValue(const NewIdValue: Integer); virtual;
    procedure SetIDFieldValue(const IDFieldName: string; const NewIdValue: Integer); virtual;
    procedure WrapInTransaction(const Proc: TProc); virtual;
    property InsertedIdentity: TNullableInteger read FInsertedIdentity;
  protected
    procedure DoAfterDelete; override;
    procedure DoAfterPost; override;
    procedure DoBeforeDelete; override;
    procedure DoOnNewRecord; override;
    procedure InternalCancel; override;
    procedure InternalDelete; override;
    procedure InternalInsert; override;
    procedure InternalPost; override;
  public
    procedure Dump;
  end;

  EEntityListClientDataSet = EGenericException<TEntityListClientDataSet>;

  TEntityListEnumerator = class(TDataSetEnumerator)
  public
    function GetCurrent: TEntity;
    property Current: TEntity read GetCurrent;
  end;

procedure AssertIsClass(const Context: TObject; const ValueName: string; const Value: TObject; const ValueClass: TClass);

procedure AssertRightDataSetClass(const DataSource: TDataSource; const EntityListClass: TEntityListClass);

implementation

uses
  Variants, Provider, ScreenSupportUnit, StrUtils, DBCommon, FieldHelperUnit, StringUtilsUnit, DbCrackerUnit, FieldNameHelperUnit,
  SqlConstsUnit, Windows, ComObj, IdGlobal;

procedure AssertIsClass(const Context: TObject; const ValueName: string; const Value: TObject; const ValueClass: TClass);
begin
  Assert(Value is ValueClass,
    Format('In %s, %s is of class %s but should be of class %s', [
      Context.ClassName, ValueName, Value.ClassName, ValueClass.ClassName]));
end;

procedure AssertRightDataSetClass(const DataSource: TDataSource; const EntityListClass: TEntityListClass);
begin
  AssertIsClass(DataSource.Owner, 'DataSource.DataSet', DataSource.DataSet, EntityListClass);
end;

constructor TEntityList.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  ReadOnly := False;
end;

function TEntityList.GetDeleteQuery: TDBQuery;
begin
  //Only create the DeleteQuery when REALLY needed
  if not Assigned(FDeleteQuery) then
    FDeleteQuery := CreateQuery();
  Result := FDeleteQuery;
end;

function TEntityList.GetIdentityQuery: TDBQuery;
begin
  //Only create the IdentityQuery when REALLY needed
  if not Assigned(FIdentityQuery) then
    FIdentityQuery := CreateQuery();
  Result := FIdentityQuery;
end;

function TEntityList.GetInsertQuery: TDBQuery;
begin
  //Only create the InsertQuery when REALLY needed
  if not Assigned(FInsertQuery) then
    FInsertQuery := CreateQuery();
  Result := FInsertQuery;
end;

function TEntityList.GetLatestIdentity: Integer;
begin
  // jpl: 20091216: werkt voor zowel Access als SQL Server
  // http://databases.aspfaq.com/general/how-do-i-get-the-identity/autonumber-value-for-the-row-i-inserted.html
  // http://msdn.microsoft.com/en-us/library/ks9f57t0(VS.71).aspx
  // http://www.swissdelphicenter.ch/torry/showcode.php?id=1749
  IdentityQuery.SQL.Text := 'SELECT @@IDENTITY';
  IdentityQuery.Open();
  try
    Result := IdentityQuery.Fields[0].AsInteger; //jpl: first field
  finally
    IdentityQuery.Close();
  end;
end;

function TEntityList.GetUpdateQuery: TDBQuery;
begin
  //##jpl: splitsen in verschillende queries voor de verschillende taken SelectQuery, UpdateQuery, InsertQuery, DeleteQuery?
  //Only create the UpdateQuery when REALLY needed
  if not Assigned(FUpdateQuery) then
    FUpdateQuery := CreateQuery();
  Result := FUpdateQuery;
end;

procedure TEntityListClientDataSet.AssertChangeCountIs0;
begin
  Assert(ChangeCount = 0, Format('Processing of %s resulted in a non-zero ChangeCount=%d', [ClassName, ChangeCount]));
end;

procedure TEntityListClientDataSet.AssertChangeCountIs1;
begin
  Assert(ChangeCount = 1, Format('%s can only process one change at a time, but ChangeCount=%d', [ClassName, ChangeCount]));
end;

procedure TEntityListClientDataSet.ConfirmChanges;
begin
  MergeChangeLog;
  // jpl: ClientDataSet way of telling that the updates have been applied.
  AssertChangeCountIs0;
end;

function TEntityListClientDataSet.CreateFilledEntityQueryRecordList(const FillQueryRecordListMethod: TFillQueryRecordListMethod; const
    FillQueryRecordListMethodName: string): TMSDMLQueryRecordList;
var
  EntityQueryRecordList: TMSDMLQueryRecordList;
  EntityQueryRecord: TMSDMLQueryRecord;
begin
  EntityQueryRecordList := TMSDMLQueryRecordList.Create();
  try
    FillQueryRecordListMethod(EntityQueryRecordList);
    Assert(EntityQueryRecordList.Count > 0, Format('%s.%s delivers an empty list', [Self.ClassName, FillQueryRecordListMethodName]));
    for EntityQueryRecord in EntityQueryRecordList do
    begin
      if EntityQueryRecord.JoinedColumnPair.IsJoin then
        Assert(EntityQueryRecordList.Count > 1, Format(
          '%s performs a JOIN but delivers only one item in %s', [Self.ClassName, FillQueryRecordListMethodName]));
    end;
  except
    EntityQueryRecordList.Free;
    raise;
  end;
  Result := EntityQueryRecordList;
end;

procedure TEntityListClientDataSet.DoAfterDelete;
begin
  inherited DoAfterDelete;
  ConfirmChanges();
  OutputDebugString('DoAfterDelete:');
  Dump();
end;

procedure TEntityListClientDataSet.DoAfterPost;
var
  EntityListClass: TEntityListClass;
begin
  inherited DoAfterPost;
  ConfirmChanges();
  OutputDebugString('DoAfterPost:');
  Dump();
  if InsertedIdentity.IsFilled then
  begin
    if Assigned(LookupEntityListManager) then
    begin
      EntityListClass := TEntityListClass(Self.ClassType);
      LookupEntityListManager.RefillAll(EntityListClass)
    end
    else
    begin
      if not Assigned(Owner) or (Self.Owner <> LookupEntityListManager) then
        Refill();
    end;
    Locate(InsertedIdentity.Value);
    InsertedIdentity.Clear();
  end;
end;

procedure TEntityListClientDataSet.DoBeforeDelete;
begin
  inherited DoBeforeDelete;
  ConfirmChanges();
end;

procedure TEntityListClientDataSet.DoDelete;
var
  DeleteQueryRecordList: TMSDMLQueryRecordList;
  DeleteQueryRecord: TMSDMLQueryRecord;
begin
  AssertChangeCountIs1();
  DeleteQueryRecordList := CreateFilledEntityQueryRecordList(FillDeleteQueryRecordList, 'FillDeleteQueryRecordList');
  try
    //jpl: ga van Mentor -> NatuurlijkPersoon -> Entity
    // (niet andersom, want dan ben je de ID's kwijt, en gaan de FK's niet goed!)
    DeleteQueryRecordList.Reverse; //jpl: 20100130 - Delete moet in omgekeerde volgorde in verband met de referentiele integriteit van de FK's
    for DeleteQueryRecord in DeleteQueryRecordList do
    begin
      ExecuteAndVerifyCountIs1(DeleteQueryRecord);
    end;
  finally
    DeleteQueryRecordList.Free;
  end;
end;

procedure TEntityListClientDataSet.DoEdit;
var
  UpdateQueryRecordList: TMSDMLQueryRecordList;
  UpdateQueryRecord: TMSDMLQueryRecord;
begin
  UpdateQueryRecordList := CreateFilledEntityQueryRecordList(FillUpdateQueryRecordList, 'FillUpdateQueryRecordList');
  try
    for UpdateQueryRecord in UpdateQueryRecordList do
    begin
      ExecuteAndVerifyCountIs1(UpdateQueryRecord);
    end;
  finally
    UpdateQueryRecordList.Free;
  end;
end;

procedure TEntityListClientDataSet.DoInsert;
const
  NullID = -1;
var
  NewID: Integer;
  InsertQueryRecordList: TMSDMLQueryRecordList;
  InsertQueryRecord: TMSDMLQueryRecord;
  JoinedColumnPair: TJoinedColumnPair;
  JoinDescription: string;
  ParentID: Integer;
begin
  NewID := NullID;
  InsertQueryRecordList := CreateFilledEntityQueryRecordList(FillInsertQueryRecordList, 'FillInsertQueryRecordList');
  try
    for InsertQueryRecord in InsertQueryRecordList do
    begin
      JoinedColumnPair := InsertQueryRecord.JoinedColumnPair;
      if JoinedColumnPair.IsJoin then
      begin
        JoinDescription := JoinedColumnPair.ToString();
        Assert(NewID <> NullID, Format('Processing JOIN for %s but no Parent ID to update child (%s)', [
          Self.ClassName, JoinDescription]));
        ParentID := FieldByName(JoinedColumnPair.ParentColumn).AsInteger;
        Assert(ParentID = NewID, Format('Processing JOIN for %s, but ParentID %d does not match NewID %d (%s)', [
          Self.ClassName, ParentID, NewID, JoinDescription]));
        SetIDFieldValue(JoinedColumnPair.ChildColumn, NewID);
        InsertQueryRecord.SetupQuery(InsertQuery);
        ExecuteAndVerifyCountIs1(InsertQuery, DictionaryIDNullableInteger);
        NewID := GetLatestIdentity();
      end
      else
      begin
        InsertQueryRecord.SetupQuery(InsertQuery);
        ExecuteAndVerifyCountIs1(InsertQuery, DictionaryIDNullableInteger);
        NewID := GetLatestIdentity();
      end;
      SetIDFieldValue(IDFieldName(JoinedColumnPair.ChildTable), NewID);
      InsertedIdentity.Value := NewID;
    end;
  finally
    InsertQueryRecordList.Free;
  end;
end;

procedure TEntityListClientDataSet.DoInternalPost(StartState: TDataSetState);
var
  Count: Integer;
  PostAction: TPostAction;
  TheDictionaryIDFieldName: string;
  TheTableName: string;
begin
  AssertChangeCountIs1();
  try
    //##jpl: uitbreiden naar een insert/update over meerdere datasets heen zodat we van Entity -> NatuurlijkPersoon -> Mentor lopen
    // (niet andersom, want dan ben je de ID's kwijt, en gaan de FK's niet goed!)
    if VarIsNull(DictionaryIDField.OldValue) then
      PostAction := paInsert
    else
    begin
      TheDictionaryIDFieldName := DictionaryIDFieldName;
      TheTableName := TableName;
      SelectQuery.SQL.Text := Format('select count(*) from %s where %s.%s = :%s', [TheTableName, TheTableName, TheDictionaryIDFieldName, TheDictionaryIDFieldName]);
      SelectQuery.AssignParam(DictionaryIDNullableInteger, TheDictionaryIDFieldName);
      SelectQuery.Open;
      Count := SelectQuery.Fields[0].AsInteger;
      case Count of
        0:
          PostAction := paInsert;
        1:
          PostAction := paEdit;
      else
        Assert(False, Format('InternalPost of %s found %d matching records in table %s for ID field %s, but expected 0 or 1', [ClassName, Count, TheTableName, TheDictionaryIDFieldName]));
      end;
    end;
    WrapInTransaction(procedure
    begin
        case PostAction of
          paEdit:
            DoEdit;
          paInsert:
            DoInsert;
        end;
      end);
  except
    on E: Exception do
    begin
      Self.RevertRecord;
      AssertChangeCountIs0;
      case StartState of
        dsInactive:
          ;
        dsBrowse:
          ;
        dsEdit:
          Edit;
        dsInsert:
          Insert;
        dsSetKey:
          ;
        dsCalcFields:
          ;
        dsFilter:
          ;
        dsNewValue:
          ;
        dsOldValue:
          ;
        dsCurValue:
          ;
        dsBlockRead:
          ;
        dsInternalCalc:
          ;
        dsOpening:
          ;
      end;
      raise ;
    end;
  end;
end;

procedure TEntityListClientDataSet.DoOnNewRecord;
var
  NewEntity: TEntity;
  NewEntityClass: TEntityClass;
  NewIdValue: Integer;
begin
  // jpl: doet het Insert gedrag, maar tijdens InternalInsert staat State nog niet op dsInsert, maar in DoOnNewRecord wel.
  // een undo moet in InternalCancel gebeuren.
  inherited DoOnNewRecord;
  NewIdValue := -1 - EntityDictionary.Count;
  SetDictionaryIDFieldValue(NewIdValue);
  NewEntityClass := Self.EntityClass;
  NewEntity := NewEntityClass.Create(Self);
  OwnThisEntity(NewEntity);
end;

procedure TEntityListClientDataSet.Dump;
var
  Index: TDataSetEnumerationRecord;
begin
  for Index in Self do
    OutputDebugString(PChar(ToString()));
end;

procedure TEntityListClientDataSet.ExecuteAndVerifyCountIs1(const DMLQuery: TDBQuery; const ID: TNullableInteger);
var
  Count: Integer;
  Index: TCollectionItem;
  Parameter: TParameter;
  ParameterStringValue: string;
  ParameterValue: Variant;
  StringBuilder: TStringBuilder;
  ErrorMessage: string;
begin
{$ifdef DEBUG}
  StringBuilder := TStringBuilder.Create();
  try
    StringBuilder.AppendLine(DMLQuery.SQL.Text);
    for Index in DMLQuery.Parameters do
    begin
      try
        Parameter := TParameter(Index);
        ParameterValue := Parameter.Value;
        if VarIsNull(ParameterValue) then
          ParameterStringValue := '<<NULL>>'
        else
          ParameterStringValue := string(ParameterValue);
      except
        on E: Exception do
          ParameterStringValue := E.Message;
      end;
      StringBuilder.AppendLine(Format('Parameter %s=%s', [Parameter.Name, ParameterStringValue]));
    end;
    OutputDebugString(PChar(StringBuilder.ToString()));
  finally
    StringBuilder.Free;
  end;
{$endif DEBUG}
  try
    Count := DMLQuery.ExecSQL;
  except
    on E: EOleException do
    begin
      ErrorMessage := Format('EOleException ErrorCode: 0x%x(%d), HelpFile: "%s", Source:"%s", Message:"%s"',
        [E.ErrorCode, E.ErrorCode, E.HelpFile, E.Source, E.Message]);
      OutputDebugString(PChar(ErrorMessage));
      raise;
    end;
  end;
  Assert(Count = 1, Format('Update of %s for ID %d in the database should result in 1 record change, but the number of changed records was %d',
      [ClassName, ID.Value, Count]));
end;

procedure TEntityListClientDataSet.ExecuteAndVerifyCountIs1(const QueryRecord: TMSDMLQueryRecord);
var
  FieldName: string;
  ParameterValue: TNullableInteger;
  IDField: TIntegerField;
begin
  FieldName := IDFieldName(QueryRecord.JoinedColumnPair.ChildTable);
  IDField := FieldByName(FieldName) as TIntegerField;
  ParameterValue := IDField.AsNullableInteger;
  QueryRecord.SetupQuery(UpdateQuery);
  if ParameterValue.IsNull then
    raise EEntityListClientDataSet.CreateFmt('Entity %s, Field %s is NULL but should have a value to execute the query "%s", %s',
      [ClassName, FieldName, UpdateQuery.SQL.Text, ToString()]);
  UpdateQuery.AssignParam(ParameterValue, IDField.FieldName);
  ExecuteAndVerifyCountIs1(UpdateQuery, ParameterValue);
end;

{ TGebruikerBaseCollection }

procedure TEntityListClientDataSet.FillDeleteQueryRecordList(const DeleteQueryRecordList: TMSDMLQueryRecordList);
begin
  // descendants can override
end;

procedure TEntityListClientDataSet.FillInsertQueryRecordList(const InsertQueryRecordList: TMSDMLQueryRecordList);
begin
  // descendants can override
end;

procedure TEntityListClientDataSet.FillUpdateQueryRecordList(const UpdateQueryRecordList: TMSDMLQueryRecordList);
begin
  // descendants can override
end;

procedure TEntityListClientDataSet.InternalCancel;
var
  NewEntity: TEntity;
begin
  NewEntity := CurrentEntity;
  inherited InternalCancel;
  if State = dsInsert then
    ReleaseThisEntity(NewEntity);
end;

procedure TEntityListClientDataSet.InternalDelete;
begin
  AssertChangeCountIs0();
  inherited InternalDelete; // zodat de ChangeCount op 1 komt te staan
  AssertChangeCountIs1();
  WrapInTransaction(procedure
    begin
      DoDelete();
    end);
end;

procedure TEntityListClientDataSet.InternalInsert;
begin
  inherited InternalInsert;
end;

procedure TEntityListClientDataSet.InternalPost;
var
  StartState: TDataSetState;
begin
  StartState := State;
  AssertChangeCountIs0();
  ClearEmptyStringFields();
  inherited InternalPost; // zodat de ChangeCount op 1 of 0 komt te staan; komt voor als je een veld wijzigt, en daarna met Undo het veld weer terugzet.
  if ChangeCount <> 0 then
    DoInternalPost(StartState);
end;

procedure TEntityListClientDataSet.ReleaseThisEntity(NewEntity: TEntity);
begin
//  EntityList.Remove(NewEntity); //##jpl: memory leak; show FastMM
  EntityDictionary.Remove(NewEntity.DictionaryID);
end;

procedure TEntityListClientDataSet.SetDictionaryIDFieldValue(const NewIdValue: Integer);
var
  OldReadOnly: Boolean;
begin
  OldReadOnly := DictionaryIDField.ReadOnly;
  try
    DictionaryIDField.ReadOnly := False;
    DictionaryIDField.AsInteger := NewIdValue;
  finally
    DictionaryIDField.ReadOnly := OldReadOnly;
  end;
end;

procedure TEntityListClientDataSet.SetIDFieldValue(const IDFieldName: string; const NewIdValue: Integer);
var
  IDField: TField;
  OldReadOnly: Boolean;
  WasEditing: Boolean;
begin
  IDField := FieldByName(IDFieldName);
  OldReadOnly := IDField.ReadOnly;
  try
    IDField.ReadOnly := False;
    WasEditing := State in dsEditModes;
    if not WasEditing then
      Edit;
    try
      IDField.AsInteger := NewIdValue;
    finally
      if not WasEditing then
        Post;
    end;
    Edit;
  finally
    IDField.ReadOnly := OldReadOnly;
  end;
end;

procedure TEntityListClientDataSet.WrapInTransaction(const Proc: TProc);
var
  PerformTransactionManagement: Boolean;
begin
  PerformTransactionManagement := not DataModuleConnection.InTransaction;
  //##jpl: 20100129 - later overstappen op nested transactions, zie http://delphi.about.com/od/database/l/aa010202a.htm
  try
    if PerformTransactionManagement then
      DataModuleConnection.BeginTrans;
    Proc();
    if PerformTransactionManagement then
      DataModuleConnection.CommitTrans;
  except
    if PerformTransactionManagement then
      DataModuleConnection.RollbackTrans;
    raise;
  end;
end;

constructor TEntity.Create(const EntityList: TReadOnlyEntityList);
begin
  Assert(EntityList is EntityListClass, Format('While creating a %s, EntityList should be descending of class %s but is class %s',
    [Self.ClassName, EntityListClass.ClassName, EntityList.ClassName]));
  inherited Create();
  FEntityList := EntityList;
  FDictionaryID := Self.EntityList.DictionaryID.Value;
end;

procedure TEntity.ExecuteAtBookmarkInEditMode(const Proc: TProc);
begin
  ExecuteAtDictionaryID(
  procedure
  begin
    EntityList.Edit;
    Proc();
  end);
end;

procedure TEntity.ExecuteAtDictionaryID(const Proc: TProc);
begin
  EntityList.ExecuteAtDictionaryID(Self.DictionaryID, Proc);
end;

function TEntity.GetCanDelete: Boolean;
begin
  Result := True;
end;

{ TEntity }

procedure TEntity.GetData(const SelectQuery: TADOQuery);
begin
  // override in descending classes
end;

function TEntity.GetEntityList: TReadOnlyEntityList;
begin
  Result := FEntityList;
end;

function TEntity.GetEntityListClass: TEntityListClass;
begin
  Result := TEntityList;
end;

function TEntity.GetLookupEntityListManager: TLookupEntityListManager;
begin
  Result := EntityList.LookupEntityListManager;
end;

procedure TEntity.LocateInEntityList;
begin
  EntityList.Locate(Self);
end;

procedure TEntity.SetDictionaryID(const Value: Integer);
var
  OldID: Integer;
begin
  OldID := DictionaryID;
  if OldID <> Value then
  begin
    FDictionaryID := Value;
    Assert(Assigned(EntityList.CurrentEntity)); // check if it can be found using the new DictionaryID
  end;
end;

{ TEntityListEnumerator }

function TEntityListEnumerator.GetCurrent: TEntity;
var
  Index: TDataSetEnumerationRecord;
  EntityList: TEntityList;
  Entity: TEntity;
begin
  Index := inherited Current;
  EntityList := Index.DataSet as TEntityList;
  Entity := EntityList.CurrentEntity;
  Result := Entity;
end;

destructor TLookupEntityListManager.Destroy;
begin
  if Assigned(FLookupEntityListDictionary) then
    FLookupEntityListDictionary.Clear();
  inherited Destroy;
  FreeAndNil(FLookupEntityListDictionary);
end;

function TLookupEntityListManager.GetLookupEntityList(Key: TLookupEntityListDictionaryKey): TReadOnlyEntityList;
var
  KeyValue: string;
  NewValue: TReadOnlyEntityList;
begin
  KeyValue := Key.ToString();
  if not LookupEntityListDictionary.ContainsKey(KeyValue) then
  begin
    NewValue := Key.CreateReadOnlyEntityList(Self);
    NewValue.Fill();
    LookupEntityListDictionary.Add(KeyValue, NewValue);
  end;
  Result := LookupEntityListDictionary[KeyValue];
end;

function TLookupEntityListManager.GetLookupEntityListDictionary: TLookupEntityListDictionary;
begin
  if not Assigned(FLookupEntityListDictionary) then
    FLookupEntityListDictionary := TLookupEntityListDictionary.Create();
  Result := FLookupEntityListDictionary;
end;

procedure TLookupEntityListManager.RefillAll(const EntityListClass: TEntityListClass);
var
  Index: TComponent;
  EntityList: TEntityList;
begin
  for Index in Self do
  begin
    if Index is TEntityList then
    begin
      EntityList := Index as TEntityList;
      if EntityList is EntityListClass then
        EntityList.Refill();
    end;
  end;
end;

procedure TReadOnlyEntityList.AddFilterCriterions;
begin
  // descendants can override
end;

procedure TReadOnlyEntityList.AddOrderByItems;
begin
  // descendants can override
end;

procedure TReadOnlyEntityList.ApplyOrderByClause(const ReadQuery: TDBQuery);
var
  AddingFirstOrderByItem: Boolean;
  FoundDefaultOrderByClause: Boolean;
  procedure AddCriterion(const ColumnName: string; const OrderByDirection: TOrderByDirection);
  var
    Direction: string;
    Section: string;
    Expression: string;
  begin
    if AddingFirstOrderByItem and not FoundDefaultOrderByClause then
      Section := DefaultOrderByClause
    else
      Section := ',';
    case OrderByDirection of
      obdDefault:
        Direction := NullAsStringValue;
      obdAscending:
        Direction := ' ASCENDING'; // let op: spatie!
      obdDescending:
        Direction := ' DESCENDING'; // let op: spatie!
    end;
    // jpl: let op: spatie aan het begin voor als er een CRLF Aan het einde van ReadQuery.SQL staat.
    Expression := Format(' %s %s%s', [Section, ColumnName, Direction]);
    ReadQuery.SQL.Add(Expression);
    AddingFirstOrderByItem := False;
  end;

var
  OrderByItem: TStringOrderByDirectionPair;
begin
  FoundDefaultOrderByClause := AnsiContainsText(ReadQuery.SQL.Text, DefaultOrderByClause);

  AddingFirstOrderByItem := True;

  for OrderByItem in OrderByItems do
    AddCriterion(OrderByItem.Key, OrderByItem.Value);
end;

procedure TReadOnlyEntityList.CalculateCalculatedFields;
begin
  // descendants can override
end;

procedure TReadOnlyEntityList.ClearList;
begin
  if not Assigned(FEntityList) then
    Exit;

  EntityList.Clear;
  EntityDictionary.Clear();
end;

function TReadOnlyEntityList.CreateQuery: TDBQuery;
begin
  Result := DataModule.CreateQuery();
  Self.InsertComponent(Result);
end;

function TReadOnlyEntityList.GetContainsID(ID: TNullableInteger): Boolean;
var
  IDValue: Integer;
begin
  if ID.IsFilled then
  begin
    IDValue := ID.Value;
    Result := EntityDictionary.ContainsKey(IDValue);
  end
  else
    Result := False;
end;

function TReadOnlyEntityList.GetCount: Integer;
begin
  Result := Self.RecordCount;
end;

function TReadOnlyEntityList.GetCurrentEntity: TEntity;
var
  CurrentDictionaryID: TNullableInteger;
begin
  CurrentDictionaryID := DictionaryID;
  if CurrentDictionaryID.IsNull then
    Result := nil

  // JR: 04-05-2010 ========================================================================
  // Controleer eerst even of de KEY wel in de DICTIONARY zit.
  // Ik liep tegen het probleem aan dat dit werd aangeroepen terwijl de dictionary
  // nog niet helemaal gevuld was.
  // Dat probleem trad op bij "TContactpersoonList.CalculateCalculatedFields;"
  else if (not EntityDictionary.ContainsKey(CurrentDictionaryID.Value)) then
    Result := nil
  // =======================================================================================

  else
    Result := EntityDictionary.Items[CurrentDictionaryID.Value];
end;

function TReadOnlyEntityList.GetData: Integer;
var
  NewEntityClass: TEntityClass;
  NewEntity: TEntity;
  Index: TDataSetEnumerationRecord;
begin
  Result := 0;
  AssignDataFrom(SelectQuery);
  UpdateFieldDisplayLabels();

  NewEntityClass := Self.EntityClass;

  for Index in Self do // jpl: 20091218 niet nogmaals over de query heenlopen!
  begin
    NewEntity := NewEntityClass.Create(Self);

    NewEntity.GetData(SelectQuery);
    OwnThisEntity(NewEntity);
    Inc(Result);
  end;

  FNeedsFill := False;
end;

function TReadOnlyEntityList.GetDataModule: TMSConnectionDataModule;
begin
  Result := MSConnectionDataModuleFactory.DataModule;
end;

function TReadOnlyEntityList.GetDataModuleConnection: TDBConnection;
begin
  Result := DataModule.Connection;
end;

function TReadOnlyEntityList.GetDictionaryID: TNullableInteger;
var
  Field: TIntegerField;
begin
  Field := Self.DictionaryIDField as TIntegerField;
  Result := Field.AsNullableInteger;
end;

function TReadOnlyEntityList.GetDictionaryIDField: TField;
begin
  Result := Self.FieldByName(DictionaryIDFieldName);
end;

function TReadOnlyEntityList.GetDictionaryIDFieldName: string;
var
  TableName: string;
begin
  TableName := GetTableName();
  Result := IDFieldName(TableName);
end;

function TReadOnlyEntityList.GetDictionaryIDNullableInteger: TNullableInteger;
begin
  Result := (Self.DictionaryIDField as TIntegerField).AsNullableInteger;
end;

function TReadOnlyEntityList.GetEntityById(ID: TNullableInteger): TEntity;
var
  IDValue: Integer;
begin
  if ID.IsFilled then
  begin
    IDValue := ID.Value;
    try
      Result := EntityDictionary.Items[IDValue];
    except
      on E: Exception do
        raise EEntityListClientDataSet.CreateFmt('%s for %s with ID %d', [E.Message, ClassName, IDValue]);
    end;
  end
  else
    Result := nil;
end;

function TReadOnlyEntityList.GetEntityClass: TEntityClass;
begin
  Result := TEntity;
end;

function TReadOnlyEntityList.GetLookupEntityListManager: TLookupEntityListManager;
begin
  Result := Owner as TLookupEntityListManager;
end;

function TReadOnlyEntityList.GetParentTableName: string;
var
  ClassParent: TClass;
begin
  Result := NullAsStringValue;
  ClassParent := Self.EntityClass.ClassParent;
  if Assigned(ClassParent) then
  begin
    ClassParent := ClassParent.ClassParent;
    if Assigned(ClassParent) then
      Result := StripClassPrefixT(ClassParent.ClassName);
  end;
end;

function TReadOnlyEntityList.GetProviderType: TProviderType;
begin
  Result := MSConnectionDataModuleFactory.ProviderType;
end;

function TReadOnlyEntityList.GetSelectQuery: TDBQuery;
begin
  if not Assigned(FSelectQuery) then
  begin
    FSelectQuery := CreateQuery();
  end;
  Result := FSelectQuery;
end;

function TReadOnlyEntityList.GetTableName: string;
const
  Lookup = 'Lookup';
begin
  Result := StripClassPrefixT(Self.EntityClass.ClassName);
  Result := StripSuffix(Result, Lookup);
end;

procedure TReadOnlyEntityList.HideIDColumns;
var
  Field: TField;
begin
  for Field in Fields do
  begin
    if IsIDField(Field) then
      Field.Visible := False;
  end;
end;

procedure TReadOnlyEntityList.InternalAssignDataFrom(const DataSet: TDataSet);
var
  DSProv: TDataSetProvider;
begin
  if not Assigned(DataSet) then
    Exit;

  if (DataSet is TCustomClientDataSet) then
    Self.Data := TCustomClientDataSet(DataSet).Data
  else
  begin
    DSProv := TDataSetProvider.Create(nil);
    try
      DSProv.DataSet := DataSet;
      Self.Data := DSProv.Data;
    finally
      DSProv.Free;
    end;
  end;
end;

var
  QueryCount: Integer = 0; //jpl: voor het debuggen: als deze heel snel in waarde stijgt, is er meestal iets recursief mis.

procedure TReadOnlyEntityList.InternalFill;
begin
  ClearList;

  SelectQuery.SQL.Clear();
  SetReadQueryText(SelectQuery);
  FilterCriterions.ApplyWhereClause(SelectQuery);
  SearchCriterions.ApplyWhereClause(SelectQuery);
  ApplyOrderByClause(SelectQuery);

  Inc(QueryCount); //##jpl: to watch stray queries
  OutputDebugString(PChar(Format('At ticks %d, QueryCount=%d, SQL=%s', [Ticks, QueryCount, SelectQuery.SQL.Text])));

  SelectQuery.Open;
  try
    GetData();
    First();
  finally
    SelectQuery.Close;
  end;
end;

function TReadOnlyEntityList.IsIDField(const Field: TField): Boolean;
var
  FieldName: string;
begin
  FieldName := Field.FieldName;
  Result := IsIDFieldName(FieldName);
end;

function TReadOnlyEntityList.Locate(const NewDictionaryID: Integer): Boolean;
var
  DictionaryIDFieldName: string;
begin
  if LocatedAtDictionaryId(NewDictionaryID) then
    Result := True
  else
  begin
    DictionaryIDFieldName := GetDictionaryIDFieldName;
    Result := Self.Locate(DictionaryIDFieldName, NewDictionaryID, []);
  end;
end;

function TReadOnlyEntityList.LocatedAtDictionaryId(const ADictionaryID: Integer): Boolean;
begin
  Result := Self.DictionaryID = ADictionaryID;
end;

procedure TReadOnlyEntityList.OwnThisEntity(NewEntity: TEntity);
begin
  EntityList.Add(NewEntity);
  EntityDictionary.Add(NewEntity.DictionaryID, NewEntity);
end;

procedure TReadOnlyEntityList.SetNeedsFill(const Value: Boolean);
begin
  FNeedsFill := Value;
end;

procedure TReadOnlyEntityList.SetReadQueryText(const ReadQuery: TDBQuery);
begin
end;

procedure TReadOnlyEntityList.DoOnCalcFields;
begin
  CalculateCalculatedFields();
  inherited DoOnCalcFields();
end;

constructor TReadOnlyEntityList.Create(AOwner: TComponent);
begin
  Assert(AOwner is TLookupEntityListManager, Format('While creating %s, Owner should be of type %s but is of type %s',
    [Self.ClassName, TLookupEntityListManager.ClassName, AOwner.ClassName]));

  inherited Create(AOwner);

  ReadOnly := True;

  FEntityDictionary := TIntegerDictionaryOfEntity.Create();
  FEntityList := TEntityObjectList.Create(True); //##jpl: 20100922 EntityList does own the objects as the objects are TPersistent

  FNeedsFill := True;
end;

destructor TReadOnlyEntityList.Destroy;
begin
  FreeAndNil(FEntityDictionary);
  FreeAndNil(FEntityList);

  inherited Destroy;
end;

procedure TReadOnlyEntityList.AssignDataFrom(const DataSet: TDataSet);
begin
  if not Assigned(DataSet) then
    Exit;

  TScreenSupport.ExecuteWithWaitCursor(
  procedure
  begin
    InternalAssignDataFrom(DataSet)
  end
  );
end;

procedure TReadOnlyEntityList.ExecuteAtDictionaryID(const NewDictionaryID: Integer; const Proc: TProc);
var
  NeedToRestoreBookmark: Boolean;
  CurrentBookmark: TBookmark;
begin
  NeedToRestoreBookmark := not LocatedAtDictionaryId(NewDictionaryID);
  if NeedToRestoreBookmark then
    CurrentBookmark := Self.GetBookmark;
  try
    Locate(NewDictionaryID);
    Proc();
  finally
    if NeedToRestoreBookmark then
      Self.GotoBookmark(CurrentBookmark);
  end;
end;

procedure TReadOnlyEntityList.Fill;
var
  Line: string;
begin
  if not NeedsFill then
  begin
    Line := Format('%s does not need Fill', [ClassName]);
    OutputDebugString(PChar(Line));
    Exit;
  end;

  AddFilterCriterions();
  AddOrderByItems();
  InternalFill();
end;

function TReadOnlyEntityList.GetEnumerator: TDataSetEnumerator;
begin
  Result := TDataSetEnumerator.Create(Self);
end;

function TReadOnlyEntityList.Locate(const Entity: TEntity): Boolean;
begin
  Result := Locate(Entity.DictionaryID);
end;

{ TGebruikerBaseCollection }

procedure TReadOnlyEntityList.Refill;
var
  DictionaryIDLocation: TNullableInteger;
begin
  NeedsFill := True;
  DictionaryIDLocation := DictionaryID;
  InternalFill();
  if DictionaryID.IsFilled then
    Locate(DictionaryIDLocation.Value);
end;

function TReadOnlyEntityList.ToString: string;
var
  Field: TField;
begin
  Result := inherited ToString();
  for Field in Fields do
    Result := Result + Format('; %s="%s"(%d)', [Field.FieldName, Field.AsString, Ord(Field.IsNull)]);
end;

class function TLookupEntityListDictionaryKey.Create(const EntityListClass: TEntityListClass): TLookupEntityListDictionaryKey;
begin
  Result.FEntityListClass := EntityListClass;
  Result.FFilterCriterionFieldName := NullAsStringValue;
  Result.FFilterCriterionStringValue.Clear();
  Result.FValueType := vtString;
end;

class function TLookupEntityListDictionaryKey.Create(const EntityListClass: TEntityListClass; const FilterCriterionFieldName: string; const
    FilterCriterionValue: TNullableString): TLookupEntityListDictionaryKey;
begin
  Result := TLookupEntityListDictionaryKey.Create(EntityListClass);
  Result.FFilterCriterionFieldName := FilterCriterionFieldName;
  Result.FFilterCriterionStringValue := FilterCriterionValue;
  Result.FValueType := vtString;
end;

class function TLookupEntityListDictionaryKey.Create(const EntityListClass: TEntityListClass; const
    FilterCriterionFieldName: string; const FilterCriterionValue: TNullableInteger): TLookupEntityListDictionaryKey;
begin
  Result := TLookupEntityListDictionaryKey.Create(EntityListClass);
  Result.FFilterCriterionFieldName := FilterCriterionFieldName;
  Result.FFilterCriterionIntegerValue := FilterCriterionValue;
  Result.FValueType := vtInteger;
end;

function TLookupEntityListDictionaryKey.CreateReadOnlyEntityList(const Owner: TComponent): TReadOnlyEntityList;
begin
  Result := FEntityListClass.Create(Owner);
  if FFilterCriterionFieldName <> NullAsStringValue then
  begin
    case FValueType of
      vtInteger:
        Result.AddFilterCriterion(FFilterCriterionFieldName, FFilterCriterionIntegerValue);
      vtString:
        Result.AddFilterCriterion(FFilterCriterionFieldName, FFilterCriterionStringValue);
    end;
  end;
end;

function TLookupEntityListDictionaryKey.ToString: string;
var
  ValueIsNull: Boolean;
  ValueString: string;
begin
  case FValueType of
    vtInteger:
    begin
      ValueIsNull := FFilterCriterionIntegerValue.IsNull;
      ValueString := FFilterCriterionIntegerValue.ToString();
    end;
    vtString:
    begin
      ValueIsNull := FFilterCriterionStringValue.IsNull;
      ValueString := FFilterCriterionStringValue.Value;
    end;
  end;
  Result := Format('%s.%s.%d.%s',
    [FEntityListClass.ClassName, FFilterCriterionFieldName, Ord(ValueIsNull), ValueString]);
end;

end.
