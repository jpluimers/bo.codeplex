unit SqlWhereCriterionsUnit;

interface

uses
  MSConnectionLayerUnit,
  Generics.Collections,
  NullablesUnit;

type
  TEntityClass = TClass;

  TSqlWhereCriterionKey = record
    FieldName: string;
    JoinEntityClass: TEntityClass;
    JoinEntityKeyFieldName: string;
    EntityClass: TEntityClass;
    EntityLookupFieldName: string;
    class function Create(const FieldName: string; const JoinEntityClass: TEntityClass = nil; const JoinEntityKeyFieldName: string = ''; const EntityClass:
        TEntityClass = nil; const EntityLookupFieldName: string = ''): TSqlWhereCriterionKey; static;
    function IsJoin: Boolean;
  end;

  TKeyDictionaryOfNullableDateTime = TDictionary<TSqlWhereCriterionKey, TNullableDateTime>;
  TKeyDictionaryOfNullableInteger = TDictionary<TSqlWhereCriterionKey, TNullableInteger>;
  TKeyDictionaryOfNullableString = TDictionary<TSqlWhereCriterionKey, TNullableString>;
  TKeyNullableDateTimePair = TPair<TSqlWhereCriterionKey, TNullableDateTime>;
  TKeyNullableIntegerPair = TPair<TSqlWhereCriterionKey, TNullableInteger>;
  TKeyNullableStringPair = TPair<TSqlWhereCriterionKey, TNullableString>;

  TSqlWhereCriterions = class(TObject)
  public
    type TPrefix = (spFilter, spSearch);
  strict private
    FNullableDateTimeCriterions: TKeyDictionaryOfNullableDateTime;
    FNullableIntegerCriterions: TKeyDictionaryOfNullableInteger;
    FNullableStringCriterions: TKeyDictionaryOfNullableString;
    FPrefix: TPrefix;
    FUseLikeForStrings: Boolean;
  strict protected
    function GetNullableDateTimeCriterions: TKeyDictionaryOfNullableDateTime;
    function GetNullableIntegerCriterions: TKeyDictionaryOfNullableInteger;
    function GetNullableStringCriterions: TKeyDictionaryOfNullableString;
    function GetPrefixString: string; virtual;
  public
    constructor Create(const Prefix: TPrefix; const UseLikeForStrings: Boolean =
        False);
    destructor Destroy; override;
    procedure ApplyWhereClause(const ReadQuery: TDBQuery); virtual;
    procedure Clear; virtual;
    property NullableDateTimeCriterions: TKeyDictionaryOfNullableDateTime read GetNullableDateTimeCriterions;
    property NullableIntegerCriterions: TKeyDictionaryOfNullableInteger read GetNullableIntegerCriterions;
    property NullableStringCriterions: TKeyDictionaryOfNullableString read GetNullableStringCriterions;
    property Prefix: TPrefix read FPrefix;
    property PrefixString: string read GetPrefixString;
    property UseLikeForStrings: Boolean read FUseLikeForStrings;
  end;

implementation

uses
  SysUtils, SqlConstsUnit, StringUtilsUnit, Variants, StrUtils,
  Rtti;

constructor TSqlWhereCriterions.Create(const Prefix: TPrefix; const
    UseLikeForStrings: Boolean = False);
begin
  inherited Create;
  FPrefix := Prefix;
  FUseLikeForStrings := UseLikeForStrings;
end;

destructor TSqlWhereCriterions.Destroy;
begin
  FreeAndNil(FNullableDateTimeCriterions);
  FreeAndNil(FNullableIntegerCriterions);
  FreeAndNil(FNullableStringCriterions);
  inherited Destroy;
end;

procedure TSqlWhereCriterions.ApplyWhereClause(const ReadQuery: TDBQuery);
var
  AddingFirstCriterion: Boolean;
  FoundDefaultWhereClause: Boolean;
  function GetParameterName(const Key: TSqlWhereCriterionKey): string; // need to tell Filter/Search parameters apart, so prefix them
  begin
    Result := PrefixString+Key.FieldName; //##jpl: uitbreiden voor joins
  end;
  procedure AddCriterion(const Key: TSqlWhereCriterionKey; const IsStringCriterion: Boolean = False);
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
    Expression := Format(Mask, [Section, Prefix, FieldName, GetParameterName(Key), Suffix]);
    ReadQuery.SQL.Add(Expression);
    AddingFirstCriterion := False;
  end;
var
  NullableDateTimeCriterion: TKeyNullableDateTimePair;
  NullableIntegerCriterion: TKeyNullableIntegerPair;
  NullableStringCriterion: TKeyNullableStringPair;
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
    ReadQuery.AssignParam(NullableDateTimeCriterion.Value, GetParameterName(NullableDateTimeCriterion.Key));
  for NullableIntegerCriterion in NullableIntegerCriterions do
    ReadQuery.AssignParam(NullableIntegerCriterion.Value, GetParameterName(NullableIntegerCriterion.Key));
  for NullableStringCriterion in NullableStringCriterions do
    ReadQuery.AssignParam(NullableStringCriterion.Value, GetParameterName(NullableStringCriterion.Key)); //##jpl: misschien hier het WildCard gedrag heen verplaatsen
end;

procedure TSqlWhereCriterions.Clear;
begin
  NullableIntegerCriterions.Clear();
  NullableStringCriterions.Clear();
end;

function TSqlWhereCriterions.GetNullableDateTimeCriterions: TKeyDictionaryOfNullableDateTime;
begin
  if not Assigned(FNullableDateTimeCriterions) then
    FNullableDateTimeCriterions := TKeyDictionaryOfNullableDateTime.Create();
  Result := FNullableDateTimeCriterions;
end;

function TSqlWhereCriterions.GetNullableIntegerCriterions: TKeyDictionaryOfNullableInteger;
begin
  if not Assigned(FNullableIntegerCriterions) then
    FNullableIntegerCriterions := TKeyDictionaryOfNullableInteger.Create();
  Result := FNullableIntegerCriterions;
end;

function TSqlWhereCriterions.GetNullableStringCriterions: TKeyDictionaryOfNullableString;
begin
  if not Assigned(FNullableStringCriterions) then
    FNullableStringCriterions := TKeyDictionaryOfNullableString.Create();
  Result := FNullableStringCriterions;
end;

function TSqlWhereCriterions.GetPrefixString: string;
var
  PrefixValue: TValue;
begin
  PrefixValue := TValue.From<TPrefix>(Prefix);
  Result := PrefixValue.ToString();
end;

class function TSqlWhereCriterionKey.Create(const FieldName: string; const JoinEntityClass: TEntityClass = nil; const JoinEntityKeyFieldName: string = ''; const
    EntityClass: TEntityClass = nil; const EntityLookupFieldName: string = ''): TSqlWhereCriterionKey;
begin
  Result.FieldName := FieldName;
  Result.JoinEntityClass := JoinEntityClass;
  Result.JoinEntityKeyFieldName := JoinEntityKeyFieldName;
  Result.EntityClass := EntityClass;
  Result.EntityLookupFieldName := EntityLookupFieldName;
end;

function TSqlWhereCriterionKey.IsJoin: Boolean;
begin
  Result := Assigned(JoinEntityClass) and Assigned(EntityClass) and (JoinEntityKeyFieldName <> NullAsStringValue) and (EntityLookupFieldName <> NullAsStringValue);
end;

end.
