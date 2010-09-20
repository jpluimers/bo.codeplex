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
  ADOConnectionStringBuilderUnit;

type
  TListOfInteger = TList<Integer>;

type
  TPostAction = (paInsert, paUpdate);
  TCreateCalculatedFieldOption = (coHideFields, coAddSizeOfStringFields);
  TCreateCalculatedFieldOptions = set of TCreateCalculatedFieldOption;

const
  AllCreateCalculatedFieldOptions = [Low(TCreateCalculatedFieldOption)..High(TCreateCalculatedFieldOption)];

type
  TEntity = class;
  TEntityClass = class of TEntity;
  TReadOnlyEntityList = class;
  TEntityList = class;
  TEntityListClass = class of TEntityList;

  TJoinedColumnPair = record
  strict private
    FChildColumn: string;
    FChildTable: string;
    FIsJoin: Boolean;
    FNewID: TNullableInteger;
    FOldID: TNullableInteger;
    FParentColumn: string;
    FParentTable: string;
  public
    class function Create(const ChildTable: string; const ChildColumn: string): TJoinedColumnPair; overload; static;
    class function Create(const ChildTable: string; const ChildColumn: string; const ParentTable: string; const ParentColumn: string): TJoinedColumnPair;
        overload; static;
    procedure ModifyID(const OldID, NewID: TNullableInteger);
    function ToString: string;
    property ChildColumn: string read FChildColumn;
    property ChildTable: string read FChildTable;
    property IsJoin: Boolean read FIsJoin;
    property NewID: TNullableInteger read FNewID;
    property OldID: TNullableInteger read FOldID;
    property ParentColumn: string read FParentColumn;
    property ParentTable: string read FParentTable;
  end;
  TJoinedColumnPairList = TList<TJoinedColumnPair>;

  TSetQueryTextMethod = procedure(var QueryText: string) of object;
  TSetParamsMethod = procedure(const DBQuery: TDBQuery) of object;

  TEntityQueryRecord = record
    JoinedColumnPair: TJoinedColumnPair;
    SetQueryTextMethod: TSetQueryTextMethod;
    SetParamsMethod: TSetParamsMethod;
    procedure SetupQuery(const DBQuery: TDBQuery);
    procedure SetupQueryText(const DBQuery: TDBQuery);
  end;

  TEntityQueryRecordList = TList<TEntityQueryRecord>;
  TFillQueryRecordListMethod = procedure (const InsertQueryRecordList: TEntityQueryRecordList) of object;

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

  TSqlTools = class(TClientDataSet)
  strict protected
    function CreateCalculatedField(const FieldName: string; const SourceFieldNames: array of string; const FieldNameToPositionAfter: string = ''; const
        CreateCalculatedFieldOptions: TCreateCalculatedFieldOptions = AllCreateCalculatedFieldOptions): TField; virtual;
    procedure CreateCalculatedFields; virtual;
    function CreateLookupField(const LookupDataSet: TDataSet; const LookupKeyFieldName, LookupResultFieldName: string;
      const KeyFieldName: string = ''; const FieldName: string = ''): TField; virtual;
    procedure CreateLookupFields; virtual;
    procedure HookFieldsOnGetTextEvents; virtual;
    procedure MemoFieldsOnGetText(Sender: TField; var Text: string; DisplayText: Boolean); virtual;
  protected
    procedure CreateFields; override;
  public
    function GetEndOfWherePosition(const SqlText: string): Integer;
  end;

  TCriterionKey = record
    FieldName: string;
    JoinEntityClass: TEntityClass;
    JoinEntityKeyFieldName: string;
    EntityClass: TEntityClass;
    EntityLookupFieldName: string;
    class function Create(const FieldName: string; const JoinEntityClass: TEntityClass = nil; const JoinEntityKeyFieldName: string = ''; const EntityClass:
        TEntityClass = nil; const EntityLookupFieldName: string = ''): TCriterionKey; static;
    function IsJoin: Boolean;
  end;
  TStringDictionaryOfNullableDateTime = TDictionary<TCriterionKey, TNullableDateTime>;
  TStringDictionaryOfNullableInteger = TDictionary<TCriterionKey, TNullableInteger>;
  TStringDictionaryOfNullableString = TDictionary<TCriterionKey, TNullableString>;
  TStringNullableDateTimePair = TPair<TCriterionKey, TNullableDateTime>;
  TStringNullableIntegerPair = TPair<TCriterionKey, TNullableInteger>;
  TStringNullableStringPair = TPair<TCriterionKey, TNullableString>;

  TOrderByDirection = (obdDefault, obdAscending, obdDescending);
  TStringOrderByDirectionPair = TPair<string, TOrderByDirection>;
  TListOfStringOrderByDirectionPair = TList<TStringOrderByDirectionPair>;

  TCriterions = class(TObject)
  strict private
    FNullableDateTimeCriterions: TStringDictionaryOfNullableDateTime;
    FNullableIntegerCriterions: TStringDictionaryOfNullableInteger;
    FNullableStringCriterions: TStringDictionaryOfNullableString;
    FPrefix: string;
    FUseLikeForStrings: Boolean;
  strict protected
    function GetNullableDateTimeCriterions: TStringDictionaryOfNullableDateTime;
    function GetNullableIntegerCriterions: TStringDictionaryOfNullableInteger;
    function GetNullableStringCriterions: TStringDictionaryOfNullableString;
  public
    constructor Create(const Prefix: string; const UseLikeForStrings: Boolean = False);
    destructor Destroy; override;
    procedure ApplyWhereClause(const ReadQuery: TDBQuery); virtual;
    procedure Clear; virtual;
    property NullableDateTimeCriterions: TStringDictionaryOfNullableDateTime read GetNullableDateTimeCriterions;
    property NullableIntegerCriterions: TStringDictionaryOfNullableInteger read GetNullableIntegerCriterions;
    property NullableStringCriterions: TStringDictionaryOfNullableString read GetNullableStringCriterions;
    property Prefix: string read FPrefix;
    property UseLikeForStrings: Boolean read FUseLikeForStrings;
  end;

  TWhereOrderBySupport = class(TSqlTools)
  strict private
    FFilterCriterions: TCriterions;
    FOrderByItems: TListOfStringOrderByDirectionPair;
    FSearchCriterions: TCriterions;
  strict protected
    function GetFilterCriterions: TCriterions;
    function GetOrderByItems: TListOfStringOrderByDirectionPair;
    function GetSearchCriterions: TCriterions;
    property FilterCriterions: TCriterions read GetFilterCriterions;
    property OrderByItems: TListOfStringOrderByDirectionPair read GetOrderByItems;
    property SearchCriterions: TCriterions read GetSearchCriterions;
  public
    destructor Destroy; override;
    procedure AddFilterCriterion(const FieldName: string; const Value: TNullableInteger); overload; virtual;
    procedure AddFilterCriterion(const FieldName: string; const Value: TNullableString); overload; virtual;
    procedure AddOrderByItem(const ColumnName: string; const OrderByDirection: TOrderByDirection = obdDefault); overload; virtual;
    procedure AddSearchCriterion(const Value: TNullableDateTime; const FieldName: string); overload; virtual;
    procedure AddSearchCriterion(const Value: TNullableInteger; const FieldName: string); overload; virtual;
    procedure AddSearchCriterion(const Value: TNullableString; const FieldName: string; const JoinEntityClass: TEntityClass = nil; const
        JoinEntityKeyFieldName: string = ''; const EntityClass: TEntityClass = nil; const EntityLookupFieldName: string = ''); overload; virtual;
    procedure ClearFilterCriterions; overload; virtual;
    procedure ClearSearchCriterions; overload; virtual;
  end;

  EEntityListException = class(SysUtils.EArgumentOutOfRangeException)
  end;

  TIntegerDictionaryOfEntity = TDictionary<Integer, TEntity>;
  TEntityObjectList = TObjectList<TEntity>;
  TReadOnlyEntityList = class(TWhereOrderBySupport)
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
    function GetContainsID(ID: TNullableInteger): Boolean; virtual;
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
    property Count: Integer read GetCount;
    property CurrentEntity: TEntity read GetCurrentEntity;
    property DictionaryID: TNullableInteger read GetDictionaryID;
    property DictionaryIDField: TField read GetDictionaryIDField;
    property DictionaryIDFieldName: string read GetDictionaryIDFieldName;
    property DictionaryIDNullableInteger: TNullableInteger read GetDictionaryIDNullableInteger;
    property EntityById[ID: TNullableInteger]: TEntity read GetEntityById;
    property ContainsID[ID: TNullableInteger]: Boolean read GetContainsID;
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

  TEntityList = class(TReadOnlyEntityList) //##jpl: merge TEntityListClientDataSet into this
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

  TEntityListClientDataSet = class(TEntityList)
  strict private
    FInsertedIdentity: TNullableInteger;
  strict protected
    procedure AssertChangeCountIs0; virtual;
    procedure AssertChangeCountIs1; virtual;
    procedure ConfirmChanges; virtual;
    function CreateFilledEntityQueryRecordList(const FillQueryRecordListMethod: TFillQueryRecordListMethod; const FillQueryRecordListMethodName: string):
        TEntityQueryRecordList; virtual;
    procedure DoDelete; virtual;
    procedure DoInsert; virtual;
    procedure DoInternalPost(StartState: TDataSetState); virtual;
    procedure DoUpdate; virtual;
    procedure ExecuteAndVerifyCountIs1(const DMLQuery: TDBQuery; const ID: TNullableInteger); overload; virtual;
    procedure ExecuteAndVerifyCountIs1(const QueryRecord: TEntityQueryRecord); overload; virtual;
    procedure FillDeleteQueryRecordList(const DeleteQueryRecordList: TEntityQueryRecordList); virtual;
    procedure FillInsertQueryRecordList(const InsertQueryRecordList: TEntityQueryRecordList); virtual;
    procedure FillUpdateQueryRecordList(const UpdateQueryRecordList: TEntityQueryRecordList); virtual;
    procedure SetDictionaryIDFieldValue(const NewIdValue: Integer); virtual;
    procedure SetIDFieldValue(const IDFieldName: string; const NewIdValue: Integer); virtual;
    procedure WrapInTransaction(const Proc: TProc); virtual;
    property InsertedIdentity: TNullableInteger read FInsertedIdentity;
  protected
    procedure DoAfterDelete; override;
    procedure DoBeforeDelete; override;
    procedure DoAfterPost; override;
    procedure DoOnNewRecord; override;
    procedure InternalCancel; override;
    procedure InternalDelete; override;
    procedure InternalInsert; override;
    procedure InternalPost; override;
  public
    procedure Dump;
  end;

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
    FillQueryRecordListMethodName: string): TEntityQueryRecordList;
var
  EntityQueryRecordList: TEntityQueryRecordList;
  EntityQueryRecord: TEntityQueryRecord;
begin
  EntityQueryRecordList := TEntityQueryRecordList.Create();
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

procedure TEntityListClientDataSet.DoBeforeDelete;
begin
  inherited DoBeforeDelete;
  ConfirmChanges();
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

procedure TEntityListClientDataSet.DoDelete;
var
  DeleteQueryRecordList: TEntityQueryRecordList;
  DeleteQueryRecord: TEntityQueryRecord;
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

procedure TEntityListClientDataSet.DoInsert;
const
  NullID = -1;
var
  NewID: Integer;
  InsertQueryRecordList: TEntityQueryRecordList;
  InsertQueryRecord: TEntityQueryRecord;
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
          PostAction := paUpdate;
      else
        Assert(False, Format('InternalPost of %s found %d matching records in table %s for ID field %s, but expected 0 or 1', [ClassName, Count, TheTableName, TheDictionaryIDFieldName]));
      end;
    end;
    WrapInTransaction(procedure
    begin
        case PostAction of
          paInsert:
            DoInsert;
          paUpdate:
            DoUpdate;
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
  EntityDictionary.Add(NewEntity.DictionaryID, NewEntity);
end;

procedure TEntityListClientDataSet.DoUpdate;
var
  UpdateQueryRecordList: TEntityQueryRecordList;
  UpdateQueryRecord: TEntityQueryRecord;
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

procedure TEntityListClientDataSet.ExecuteAndVerifyCountIs1(const QueryRecord: TEntityQueryRecord);
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
    raise EEntityListException.CreateFmt('Entity %s, Field %s is NULL but should have a value to execute the query "%s", %s',
      [ClassName, FieldName, UpdateQuery.SQL.Text, ToString()]);
  UpdateQuery.AssignParam(ParameterValue, IDField.FieldName);
  ExecuteAndVerifyCountIs1(UpdateQuery, ParameterValue);
end;

{ TGebruikerBaseCollection }

procedure TEntityListClientDataSet.FillDeleteQueryRecordList(const DeleteQueryRecordList: TEntityQueryRecordList);
begin
  //jpl: 20100130 - voor descendants om te overriden
end;

procedure TEntityListClientDataSet.FillInsertQueryRecordList(const InsertQueryRecordList: TEntityQueryRecordList);
begin
  //jpl: 20100129 - voor descendants om te overriden
end;

procedure TEntityListClientDataSet.FillUpdateQueryRecordList(const UpdateQueryRecordList: TEntityQueryRecordList);
begin
  //jpl: 20100129 - voor descendants om te overriden
end;

procedure TEntityListClientDataSet.InternalCancel;
var
  NewEntity: TEntity;
begin
  NewEntity := CurrentEntity;
  inherited InternalCancel;
  if State = dsInsert then
  begin
    EntityDictionary.Remove(NewEntity.DictionaryID);
    NewEntity.Free();
  end;
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

function TSqlTools.CreateCalculatedField(const FieldName: string; const SourceFieldNames: array of string; const FieldNameToPositionAfter: string =
    ''; const CreateCalculatedFieldOptions: TCreateCalculatedFieldOptions = AllCreateCalculatedFieldOptions): TField;
var
  StringFieldSize: Integer;
  FirstSourceField: TField;
  SourceField: TField;
  SourceFieldClass: TFieldClass;
  SourceFieldName: string;
  CalculatedField: TField;
  ActualFieldIndex: Integer;
  FieldToPositionAfter: TField;
begin
  FirstSourceField := nil;
  SourceFieldClass := nil;
  ActualFieldIndex := 0;

  StringFieldSize := 0;
  for SourceFieldName in SourceFieldNames do
  begin
    SourceField := Self.FieldByName(SourceFieldName);
    if coAddSizeOfStringFields in CreateCalculatedFieldOptions then
      if SourceField is TStringField then
        StringFieldSize := StringFieldSize + SourceField.Size;
    if ActualFieldIndex < SourceField.Index then
      ActualFieldIndex := SourceField.Index + 1;
    if Assigned(SourceFieldClass) then
    begin
      Assert(SourceField.InheritsFrom(SourceFieldClass), Format('SourceField %s.%s of type %s does not match LookupKeyField %s.%s of type %s',
          [Self.ClassName, SourceField.FieldName, SourceField.ClassName, Self.ClassName, FirstSourceField.FieldName, FirstSourceField.ClassName]));
    end
    else
    begin
      FirstSourceField := SourceField;
      SourceFieldClass := Self.GetFieldClass(SourceField.DataType);
    end;
  end;

  if FieldNameToPositionAfter <> NullAsStringValue then
  begin
    FieldToPositionAfter := Self.FieldByName(FieldNameToPositionAfter);
    ActualFieldIndex := FieldToPositionAfter.Index + 1;
  end;

  if Assigned(SourceFieldClass) then
    CalculatedField := SourceFieldClass.Create(Self)
  else
    CalculatedField := TStringField.Create(Self);
  try
    if coAddSizeOfStringFields in CreateCalculatedFieldOptions then
      if CalculatedField is TStringField then
        if StringFieldSize <> 0 then
          CalculatedField.Size := StringFieldSize;

    //JR: 04-05-2010
    //Hier moet even een goede oplossing voor komen.
    //De size lijkt goed gezet te worden, maar is toch te smal voor bijvoorbeeld de emailadressen.
    //Zet het nu even hard op 500, dan wordt hij niet te breed, maar past het goed.
    CalculatedField.Size := 500;

    CalculatedField.FieldKind := fkCalculated;
    CalculatedField.FieldName := FieldName;
    CalculatedField.DataSet := Self; //jpl: 20100124 - mag pas na de assignment van FieldName
    CalculatedField.Index := ActualFieldIndex;
    //  CalculatedField.Calculated := True; //jpl: 20100124 - niet nodig, vanwege "CalculatedField.FieldKind := fkCalculated;"
    //  Self.Fields.Add(CalculatedField); //jpl: 20100124 - mag niet, vanwege "CalculatedField.DataSet := Self;"
  except
    CalculatedField.Free;
    raise ;
  end;

  if coHideFields in CreateCalculatedFieldOptions then
    for SourceFieldName in SourceFieldNames do
    begin
      SourceField := Self.FieldByName(SourceFieldName);
      SourceField.Visible := False;
    end;
  Result := CalculatedField;
end;

procedure TSqlTools.CreateCalculatedFields;
begin
  //jpl: 20100124 - voor descendants om te overriden
end;

procedure TSqlTools.CreateFields;
begin
  inherited CreateFields;
  CreateLookupFields();
  CreateCalculatedFields();
  HookFieldsOnGetTextEvents();
end;

function TSqlTools.CreateLookupField(const LookupDataSet: TDataSet; const LookupKeyFieldName, LookupResultFieldName: string;
  const KeyFieldName: string = ''; const FieldName: string = ''): TField;
var
  LookupField: TField;
  ActualKeyFieldName: string;
  ActualFieldName: string;
  KeyField: TField;
  LookupKeyField: TField;
  LookupResultField: TField;
  FieldClass: TFieldClass;
begin
  LookupKeyField := LookupDataSet.FieldByName(LookupKeyFieldName);
  LookupResultField := LookupDataSet.FieldByName(LookupResultFieldName);

  if KeyFieldName = NullAsStringValue then
    ActualKeyFieldName := LookupKeyFieldName
  else
    ActualKeyFieldName := KeyFieldName;

  KeyField := Self.FieldByName(ActualKeyFieldName);
  Assert(LookupKeyField.InheritsFrom(KeyField.ClassType), Format('KeyField %s.%s of type %s does not match LookupKeyField %s.%s of type %s',
      [KeyField.DataSet.ClassName, KeyField.FieldName, KeyField.ClassName, LookupKeyField.DataSet.ClassName, LookupKeyField.FieldName,
      LookupKeyField.ClassName]));

  if FieldName = NullAsStringValue then
    ActualFieldName := StripIDFromFieldName(ActualKeyFieldName) + LookupResultFieldName
  else
    ActualFieldName := FieldName;

  FieldClass := Self.GetFieldClass(LookupResultField.DataType);
  LookupField := FieldClass.Create(Self);
  try
    if LookupField is TStringField then
      if LookupResultField is TStringField then
        TStringField(LookupField).Size := TStringField(LookupResultField).Size;

    LookupField.FieldKind := fkLookup;

    LookupField.LookupDataSet := LookupDataSet;
    LookupField.LookupKeyFields := LookupKeyFieldName;
    LookupField.LookupResultField := LookupResultFieldName;

    LookupField.KeyFields := ActualKeyFieldName;
    LookupField.FieldName := ActualFieldName;
    LookupField.DataSet := Self; //jpl: 20100122 - mag pas na de assignment van FieldName

    LookupField.Index := KeyField.Index + 1;

    //  LookupField.Lookup := True; //jpl: 20100122 - niet nodig, vanwege "LookupField.FieldKind := fkLookup;"
    //  Self.Fields.Add(LookupField); //jpl: 20100122 - mag niet, vanwege "LookupField.DataSet := Self;"
  except
    LookupField.Free;
    raise ;
  end;

  Result := LookupField;
end;

procedure TSqlTools.CreateLookupFields;
begin
  //jpl: 20100122 - voor descendants om te overriden
end;

function TSqlTools.GetEndOfWherePosition(const SqlText: string): Integer;
begin
  Result := -1;
end;

procedure TSqlTools.HookFieldsOnGetTextEvents;
var
  Field: TField;
begin
  for Field in Fields do
    Field.OnGetText := Self.MemoFieldsOnGetText;
end;

procedure TSqlTools.MemoFieldsOnGetText(Sender: TField; var Text: string; DisplayText: Boolean);
var
  GetTextText: string;
  ClassDesc: string;
begin
  GetTextText := Text;
  FieldGetText(Sender, GetTextText, DisplayText);
  ClassDesc := FieldGetClassDesc(Sender);
  if GetTextText = ClassDesc then
  begin
    Text := Sender.AsString;
    if DisplayText then
      if Length(Text) > Sender.DisplayWidth then
        Text := EllipsisText(Text, Sender.DisplayWidth);
  end
  else if (Text = NullAsStringValue) and not Sender.IsNull then
    Text := Sender.AsString;
end;

class function TJoinedColumnPair.Create(const ChildTable: string; const ChildColumn: string): TJoinedColumnPair;
begin
  Result.FChildTable := ChildTable;
  Result.FChildColumn := ChildColumn;
  Result.FIsJoin := False;
  Result.FNewID.Clear();
  Result.FOldID.Clear();
end;

class function TJoinedColumnPair.Create(const ChildTable: string; const ChildColumn: string; const ParentTable: string; const ParentColumn: string):
    TJoinedColumnPair;
begin
  Result.FChildTable := ChildTable;
  Result.FChildColumn := ChildColumn;
  Result.FParentTable := ParentTable;
  Result.FParentColumn := ParentColumn;
  Result.FIsJoin := True;
  Result.FNewID.Clear();
  Result.FOldID.Clear();
end;

procedure TJoinedColumnPair.ModifyID(const OldID, NewID: TNullableInteger);
begin
  Self.FOldID := OldID;
  Self.FNewID := NewID;
end;

function TJoinedColumnPair.ToString: string;
begin
  Result := Format('IsJoin=%s, Parent=%s.%s, Child=%s.%s', [BoolToStr(IsJoin), ParentTable, ParentColumn, ChildTable, ChildColumn]);
end;

procedure TEntityQueryRecord.SetupQuery(const DBQuery: TDBQuery);
begin
  SetupQueryText(DBQuery);
  if Assigned(SetParamsMethod) then
    SetParamsMethod(DBQuery);
end;

procedure TEntityQueryRecord.SetupQueryText(const DBQuery: TDBQuery);
var
  QueryText: string;
begin
  SetQueryTextMethod(QueryText);
  DBQuery.SQL.Text := QueryText;
end;

constructor TCriterions.Create(const Prefix: string; const UseLikeForStrings: Boolean = False);
begin
  inherited Create;
  FPrefix := Prefix;
  FUseLikeForStrings := UseLikeForStrings;
end;

destructor TCriterions.Destroy;
begin
  FreeAndNil(FNullableDateTimeCriterions);
  FreeAndNil(FNullableIntegerCriterions);
  FreeAndNil(FNullableStringCriterions);
  inherited Destroy;
end;

procedure TCriterions.ApplyWhereClause(const ReadQuery: TDBQuery);
var
  AddingFirstCriterion: Boolean;
  FoundDefaultWhereClause: Boolean;
  function Prefixed(const Key: TCriterionKey): string;
  begin
    Result := Prefix+Key.FieldName; //##jpl: uitbreiden voor joins
  end;
  procedure AddCriterion(const Key: TCriterionKey; const IsStringCriterion: Boolean = False);
  var
    FieldName: string;
    Section: string;
    Expression: string;
    Mask: string;
    Prefix: string;
    Suffix: string;
    JoinEntityTableName: string;
    EntityTableName: string;
  begin
    FieldName := Key.FieldName;
    if AddingFirstCriterion and not FoundDefaultWhereClause then
      Section := DefaultWhereClause
    else
      Section := 'AND';
    if Key.IsJoin()  then
    begin
      // AND (EXISTS (SELECT * FROM Adres WHERE Adres.ID_Entiteit = Entiteit.ID_Entiteit AND Adres.Woonplaats LIKE '*zoetermeer*'))
      JoinEntityTableName := StripClassPrefixT(Key.JoinEntityClass.ClassName);
      EntityTableName := StripClassPrefixT(Key.EntityClass.ClassName);
      Prefix := Format('EXISTS (SELECT * FROM %s WHERE %s.%s = %s.%s AND %s.',
        [JoinEntityTableName, JoinEntityTableName, Key.JoinEntityKeyFieldName, EntityTableName, Key.EntityLookupFieldName, JoinEntityTableName]);
      Suffix := ')';
    end
    else
    begin
      // AND (NatuurlijkPersoon.Voornamen LIKE '*OHA*')
      Prefix := NullAsStringValue;
      Suffix := NullAsStringValue;
    end;
    // jpl: let op: spatie aan het begin voor als er een CRLF Aan het einde van ReadQuery.SQL staat.
    if IsStringCriterion and UseLikeForStrings then
      Mask := ' %s (%s%s LIKE :%s%s) '
    else
      Mask := ' %s (%s%s = :%s%s) ';
    Expression := Format(Mask, [Section, Prefix, FieldName, Prefixed(Key), Suffix]);
    ReadQuery.SQL.Add(Expression);
    AddingFirstCriterion := False;
  end;
var
  NullableDateTimeCriterion: TStringNullableDateTimePair;
  NullableIntegerCriterion: TStringNullableIntegerPair;
  NullableStringCriterion: TStringNullableStringPair;
begin
  FoundDefaultWhereClause := AnsiContainsText(ReadQuery.SQL.Text, DefaultWhereClause);

  AddingFirstCriterion := True;

  for NullableDateTimeCriterion in NullableDateTimeCriterions do
    AddCriterion(NullableDateTimeCriterion.Key);
  for NullableIntegerCriterion in NullableIntegerCriterions do
    AddCriterion(NullableIntegerCriterion.Key);
  for NullableStringCriterion in NullableStringCriterions do
    AddCriterion(NullableStringCriterion.Key, True);

  // AssignParam after you generated the complete SQL!
  for NullableDateTimeCriterion in NullableDateTimeCriterions do
    ReadQuery.AssignParam(NullableDateTimeCriterion.Value, Prefixed(NullableDateTimeCriterion.Key));
  for NullableIntegerCriterion in NullableIntegerCriterions do
    ReadQuery.AssignParam(NullableIntegerCriterion.Value, Prefixed(NullableIntegerCriterion.Key));
  for NullableStringCriterion in NullableStringCriterions do
    ReadQuery.AssignParam(NullableStringCriterion.Value, Prefixed(NullableStringCriterion.Key)); //##jpl: misschien hier het WildCard gedrag heen verplaatsen
end;

procedure TCriterions.Clear;
begin
  NullableIntegerCriterions.Clear();
  NullableStringCriterions.Clear();
end;

function TCriterions.GetNullableDateTimeCriterions: TStringDictionaryOfNullableDateTime;
begin
  if not Assigned(FNullableDateTimeCriterions) then
    FNullableDateTimeCriterions := TStringDictionaryOfNullableDateTime.Create();
  Result := FNullableDateTimeCriterions;
end;

function TCriterions.GetNullableIntegerCriterions: TStringDictionaryOfNullableInteger;
begin
  if not Assigned(FNullableIntegerCriterions) then
    FNullableIntegerCriterions := TStringDictionaryOfNullableInteger.Create();
  Result := FNullableIntegerCriterions;
end;

function TCriterions.GetNullableStringCriterions: TStringDictionaryOfNullableString;
begin
  if not Assigned(FNullableStringCriterions) then
    FNullableStringCriterions := TStringDictionaryOfNullableString.Create();
  Result := FNullableStringCriterions;
end;

class function TCriterionKey.Create(const FieldName: string; const JoinEntityClass: TEntityClass = nil; const JoinEntityKeyFieldName: string = ''; const
    EntityClass: TEntityClass = nil; const EntityLookupFieldName: string = ''): TCriterionKey;
begin
  Result.FieldName := FieldName;
  Result.JoinEntityClass := JoinEntityClass;
  Result.JoinEntityKeyFieldName := JoinEntityKeyFieldName;
  Result.EntityClass := EntityClass;
  Result.EntityLookupFieldName := EntityLookupFieldName;
end;

function TCriterionKey.IsJoin: Boolean;
begin
  Result := Assigned(JoinEntityClass) and Assigned(EntityClass) and (JoinEntityKeyFieldName <> NullAsStringValue) and (EntityLookupFieldName <> NullAsStringValue);
end;

destructor TWhereOrderBySupport.Destroy;
begin
  FreeAndNil(FFilterCriterions);
  FreeAndNil(FSearchCriterions);
  FreeAndNil(FOrderByItems);

  inherited Destroy;
end;

procedure TWhereOrderBySupport.AddFilterCriterion(const FieldName: string; const Value: TNullableInteger);
begin
  //##jpl: hier moet nog een FieldName check in: bestaat de FieldName wel
  //  Assert(FieldName.DataSet = Self, 'You can only add a criterion for the current entity list');
  FilterCriterions.NullableIntegerCriterions.Add(TCriterionKey.Create(FieldName), Value);
end;

procedure TWhereOrderBySupport.AddFilterCriterion(const FieldName: string; const Value: TNullableString);
begin
  //##jpl: hier moet nog een FieldName check in: bestaat de FieldName wel
  //  Assert(FieldName.DataSet = Self, 'You can only add a criterion for the current entity list');
  FilterCriterions.NullableStringCriterions.Add(TCriterionKey.Create(FieldName), Value);
end;

procedure TWhereOrderBySupport.AddOrderByItem(const ColumnName: string; const OrderByDirection: TOrderByDirection = obdDefault);
begin
  //##jpl: hier moet nog een ColumnName check in: bestaat de ColumnName wel
  //  Assert(ColumnName.DataSet = Self, 'You can only add a criterion for the current entity list');
  OrderByItems.Add(TStringOrderByDirectionPair.Create(ColumnName, OrderByDirection));
end;

procedure TWhereOrderBySupport.AddSearchCriterion(const Value: TNullableDateTime; const FieldName: string);
begin
  //##jpl: hier moet nog een FieldName check in: bestaat de FieldName wel
  //  Assert(FieldName.DataSet = Self, 'You can only add a criterion for the current entity list');
  SearchCriterions.NullableDateTimeCriterions.Add(TCriterionKey.Create(FieldName), Value);
end;

procedure TWhereOrderBySupport.AddSearchCriterion(const Value: TNullableInteger; const FieldName: string);
begin
  //##jpl: hier moet nog een FieldName check in: bestaat de FieldName wel
  //  Assert(FieldName.DataSet = Self, 'You can only add a criterion for the current entity list');
  SearchCriterions.NullableIntegerCriterions.Add(TCriterionKey.Create(FieldName), Value);
end;

procedure TWhereOrderBySupport.AddSearchCriterion(const Value: TNullableString; const FieldName: string; const JoinEntityClass: TEntityClass = nil;
    const JoinEntityKeyFieldName: string = ''; const EntityClass: TEntityClass = nil; const EntityLookupFieldName: string = '');
begin
  //##jpl: hier moet nog een FieldName check in: bestaat de FieldName wel
  //  Assert(FieldName.DataSet = Self, 'You can only add a criterion for the current entity list');
  SearchCriterions.NullableStringCriterions.Add(
    TCriterionKey.Create(FieldName, JoinEntityClass, JoinEntityKeyFieldName, EntityClass, EntityLookupFieldName),
    Value);
end;

procedure TWhereOrderBySupport.ClearFilterCriterions;
begin
  FilterCriterions.Clear();
end;

procedure TWhereOrderBySupport.ClearSearchCriterions;
begin
  SearchCriterions.Clear();
end;

function TWhereOrderBySupport.GetFilterCriterions: TCriterions;
begin
  if not Assigned(FFilterCriterions) then
    FFilterCriterions := TCriterions.Create('Filter');
  Result := FFilterCriterions;
end;

function TWhereOrderBySupport.GetOrderByItems: TListOfStringOrderByDirectionPair;
begin
  if not Assigned(FOrderByItems) then
    FOrderByItems := TListOfStringOrderByDirectionPair.Create();
  Result := FOrderByItems;
end;

function TWhereOrderBySupport.GetSearchCriterions: TCriterions;
begin
  if not Assigned(FSearchCriterions) then
    FSearchCriterions := TCriterions.Create('Search', True);
  Result := FSearchCriterions;
end;

destructor TLookupEntityListManager.Destroy;
begin
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

constructor TReadOnlyEntityList.Create(AOwner: TComponent);
begin
  Assert(AOwner is TLookupEntityListManager, Format('While creating %s, Owner should be of type %s but is of type %s',
    [Self.ClassName, TLookupEntityListManager.ClassName, AOwner.ClassName]));

  inherited Create(AOwner);

  ReadOnly := True;

  FEntityDictionary := TIntegerDictionaryOfEntity.Create();
  FEntityList := TEntityObjectList.Create(False); //jpl: 20100219 - EntityList does not own objects (since they have Owner=Self, so we remove them)

  FNeedsFill := True;
end;

destructor TReadOnlyEntityList.Destroy;
begin
  FreeAndNil(FEntityDictionary);
  FreeAndNil(FEntityList);

  inherited Destroy;
end;

procedure TReadOnlyEntityList.AddFilterCriterions;
begin
  //jpl: 20100128 voor descendants om te overriden
end;

procedure TReadOnlyEntityList.AddOrderByItems;
begin
  //jpl: 20100128 voor descendants om te overriden
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

procedure TReadOnlyEntityList.CalculateCalculatedFields;
begin
  //jpl: 20100122 - voor descendants om te overriden
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
end;

procedure TReadOnlyEntityList.DoOnCalcFields;
begin
  CalculateCalculatedFields();
  inherited DoOnCalcFields;
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

var
  QueryCount: Integer = 0; //jpl: voor het debuggen: als deze heel snel in waarde stijgt, is er meestal iets recursief mis.

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

    EntityList.Add(NewEntity);
    EntityDictionary.Add(NewEntity.DictionaryID, NewEntity);
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
        raise EEntityListException.CreateFmt('%s for %s with ID %d', [E.Message, ClassName, IDValue]);
    end;
  end
  else
    Result := nil;
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

function TReadOnlyEntityList.GetEntityClass: TEntityClass;
begin
  Result := TEntity;
end;

function TReadOnlyEntityList.GetEnumerator: TDataSetEnumerator;
begin
  Result := TDataSetEnumerator.Create(Self);
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
    FSelectQuery := CreateQuery();
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

procedure TReadOnlyEntityList.InternalFill;
begin
  ClearList;

  SelectQuery.SQL.Clear();
  SetReadQueryText(SelectQuery);
  FilterCriterions.ApplyWhereClause(SelectQuery);
  SearchCriterions.ApplyWhereClause(SelectQuery);
  ApplyOrderByClause(SelectQuery);

  Inc(QueryCount);
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

function TReadOnlyEntityList.Locate(const Entity: TEntity): Boolean;
begin
  Result := Locate(Entity.DictionaryID);
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

procedure TReadOnlyEntityList.SetNeedsFill(const Value: Boolean);
begin
  FNeedsFill := Value;
end;

procedure TReadOnlyEntityList.SetReadQueryText(const ReadQuery: TDBQuery);
begin
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

(*
  //function AddParamSQLForDetail(Params: TParams; SQL: WideString; Native: Boolean; QuoteChar: WideString = ''): WideString;
  const
  SWhere = ' where ';     { do not localize }
  SAnd = ' and ';         { do not localize }

  function GenerateParamSQL: WideString;
  var
  I: Integer;
  ParamName: WideString;
  begin
  for I := 0 to Params.Count -1 do
  begin
  if QuoteChar = '"' then
  ParamName := '"' + WideStringReplace(Params[I].Name, '"', '""', [rfReplaceAll] ) + '"'
  else
  ParamName := QuoteChar + Params[I].Name +QuoteChar;
  if I > 0 then Result := Result + SAnd;
  if Native then
  Result := Result + WideFormat('%s = ?', [ParamName])
  else
  Result := Result + WideFormat('%s = :%s', [ParamName, ParamName]);
  end;
  if pos(WideString(SWhere), WideLowerCase(Result)) > 0 then
  Result := SAnd + Result
  else
  Result := SWhere + Result;
  end;

  function AddWhereClause: WideString;
  var
  Start: PWideChar;
  Rest, FName: Widestring;
  SQLToken, CurSection: TSQLToken;
  begin
  Start := PWideChar(SQL);
  CurSection := stUnknown;
  repeat
  SQLToken := NextSQLToken(Start, FName, CurSection);
  until SQLToken in [stFrom, stEnd];
  if SQLToken = stFrom then
  NextSQLToken(Start, FName, CurSection);
  Rest := Widestring(Start);
  if Rest = '' then
  Result := SQL + ' ' + GenerateParamSQL
  else
  Result := Copy(SQL, 1, pos(Rest, SQL)) + ' ' + GenerateParamSQL + Rest;
  end;

  begin
  Result := SQL;
  if (Params.Count > 0) then
  Result := AddWhereClause;
  end;
*)

{ TLookupEntityListDictionaryKeyEqualityComparer<T> }

end.
