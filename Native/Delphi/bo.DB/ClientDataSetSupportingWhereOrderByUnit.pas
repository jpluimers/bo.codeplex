unit ClientDataSetSupportingWhereOrderByUnit;

interface

uses
  ClientDataSetSupportingCalculatedAndLookupFieldsUnit, SqlWhereCriterionsUnit,
  Generics.Collections, NullablesUnit, StringListWrapperUnit;

type
  TOrderByDirection = (obdDefault, obdAscending, obdDescending);
  TStringOrderByDirectionPair = TPair<string, TOrderByDirection>;
  TListOfStringOrderByDirectionPair = TList<TStringOrderByDirectionPair>;

type
  TClientDataSetSupportingWhereOrderBy = class(TClientDataSetSupportingCalculatedAndLookupFields)
  strict private
    FFilterCriterions: TSqlWhereCriterions;
    FOrderByItems: TListOfStringOrderByDirectionPair;
    FSearchCriterions: TSqlWhereCriterions;
    FValidCriterionFieldNames: IStringListWrapper;
  strict protected
    procedure AssertExistingFieldName(const FieldName: string); virtual;
    procedure FillValidCriterionFieldNames; virtual;
    function GetFilterCriterions: TSqlWhereCriterions;
    function GetOrderByItems: TListOfStringOrderByDirectionPair;
    function GetSearchCriterions: TSqlWhereCriterions;
    function GetValidCriterionFieldNames: IStringListWrapper; virtual;
    property FilterCriterions: TSqlWhereCriterions read GetFilterCriterions;
    property OrderByItems: TListOfStringOrderByDirectionPair read GetOrderByItems;
    property SearchCriterions: TSqlWhereCriterions read GetSearchCriterions;
    property ValidCriterionFieldNames: IStringListWrapper read GetValidCriterionFieldNames;
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

implementation

uses
  SysUtils;

destructor TClientDataSetSupportingWhereOrderBy.Destroy;
begin
  FreeAndNil(FFilterCriterions);
  FreeAndNil(FSearchCriterions);
  FreeAndNil(FOrderByItems);

  inherited Destroy;
end;

procedure TClientDataSetSupportingWhereOrderBy.AddFilterCriterion(const FieldName: string; const Value: TNullableInteger);
begin
  AssertExistingFieldName(FieldName);
  FilterCriterions.NullableIntegerCriterions.Add(TSqlWhereCriterionKey.Create(FieldName), Value);
end;

procedure TClientDataSetSupportingWhereOrderBy.AddFilterCriterion(const FieldName: string; const Value: TNullableString);
begin
  AssertExistingFieldName(FieldName);
  FilterCriterions.NullableStringCriterions.Add(TSqlWhereCriterionKey.Create(FieldName), Value);
end;

procedure TClientDataSetSupportingWhereOrderBy.AddOrderByItem(const ColumnName: string; const OrderByDirection: TOrderByDirection = obdDefault);
begin
  AssertExistingFieldName(ColumnName);
  OrderByItems.Add(TStringOrderByDirectionPair.Create(ColumnName, OrderByDirection));
end;

procedure TClientDataSetSupportingWhereOrderBy.AddSearchCriterion(const Value: TNullableDateTime; const FieldName: string);
begin
  AssertExistingFieldName(FieldName);
  SearchCriterions.NullableDateTimeCriterions.Add(TSqlWhereCriterionKey.Create(FieldName), Value);
end;

procedure TClientDataSetSupportingWhereOrderBy.AddSearchCriterion(const Value: TNullableInteger; const FieldName: string);
begin
  AssertExistingFieldName(FieldName);
  SearchCriterions.NullableIntegerCriterions.Add(TSqlWhereCriterionKey.Create(FieldName), Value);
end;

procedure TClientDataSetSupportingWhereOrderBy.AddSearchCriterion(const Value: TNullableString; const FieldName: string; const JoinEntityClass: TEntityClass = nil;
    const JoinEntityKeyFieldName: string = ''; const EntityClass: TEntityClass = nil; const EntityLookupFieldName: string = '');
begin
  AssertExistingFieldName(FieldName);
  SearchCriterions.NullableStringCriterions.Add(
    TSqlWhereCriterionKey.Create(FieldName, JoinEntityClass, JoinEntityKeyFieldName, EntityClass, EntityLookupFieldName),
    Value);
end;

procedure TClientDataSetSupportingWhereOrderBy.ClearFilterCriterions;
begin
  FilterCriterions.Clear();
end;

procedure TClientDataSetSupportingWhereOrderBy.ClearSearchCriterions;
begin
  SearchCriterions.Clear();
end;

procedure TClientDataSetSupportingWhereOrderBy.AssertExistingFieldName(const
    FieldName: string);
begin
  Assert(ValidCriterionFieldNames.IndexOf(FieldName) <> -1, 'You can only add a criterion using a fieldname that is in the current entity list');
end;

procedure TClientDataSetSupportingWhereOrderBy.FillValidCriterionFieldNames;
begin
end;

function TClientDataSetSupportingWhereOrderBy.GetFilterCriterions: TSqlWhereCriterions;
begin
  if not Assigned(FFilterCriterions) then
    FFilterCriterions := TSqlWhereCriterions.Create(spFilter);
  Result := FFilterCriterions;
end;

function TClientDataSetSupportingWhereOrderBy.GetOrderByItems: TListOfStringOrderByDirectionPair;
begin
  if not Assigned(FOrderByItems) then
    FOrderByItems := TListOfStringOrderByDirectionPair.Create();
  Result := FOrderByItems;
end;

function TClientDataSetSupportingWhereOrderBy.GetSearchCriterions: TSqlWhereCriterions;
begin
  if not Assigned(FSearchCriterions) then
    FSearchCriterions := TSqlWhereCriterions.Create(spSearch, True);
  Result := FSearchCriterions;
end;

function TClientDataSetSupportingWhereOrderBy.GetValidCriterionFieldNames:
    IStringListWrapper;
begin
  if not Assigned(FValidCriterionFieldNames) then
  begin
    FValidCriterionFieldNames := TStringListWrapper.Create();
    FillValidCriterionFieldNames();
  end;
  Result := FValidCriterionFieldNames;
end;

end.
