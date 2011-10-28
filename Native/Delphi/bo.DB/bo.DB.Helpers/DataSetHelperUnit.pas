unit DataSetHelperUnit;

interface

uses
  DB,
  ComponentHelperUnit,
  DataSetEnumeratorUnit;

type
  //1 helaas een kopie van TFieldsEnumerator, want die heeft geen virtual MoveNext
  TVisibleFieldsEnumerator = class//(TFieldsEnumerator)
  private
    FFields: TFields;
    FIndex: Integer;
  strict protected
    function TFieldEnumerator_MoveNext: Boolean; virtual;
  public
    constructor Create(const Fields: TFields);
    function GetCurrent: TField; virtual;
    function MoveNext: Boolean; virtual;
    property Current: TField read GetCurrent;
  end;

  TVisibleFieldsEnumeratorFactory = record
  strict private
    FFields: TFields;
  public
    constructor Create(const Fields: TFields);
    function GetEnumerator: TVisibleFieldsEnumerator;
  end;

  TDataSetHelper = class helper(TComponentHelper) for TDataSet
  public
    procedure ClearEmptyStringFields;
    //1 Returns first field that matches, if no matching field then exception
    function FieldByAnyName(const FieldNames: array of string): TField;
    //1 Support for ... in loop providing TDataSetEnumerationRecord
    function GetEnumerator: TDataSetEnumerator;
    procedure UpdateFieldDisplayLabels; virtual;
    function VisibleFields: TVisibleFieldsEnumeratorFactory;
  end;

implementation

uses
  DBConsts,
  StringUtilsUnit,
  Variants,
  FieldNameHelperUnit,
  SysUtils;

procedure TDataSetHelper.ClearEmptyStringFields;
var
  Field: TField;
begin
  for Field in Fields do
  begin
    if (Field is TStringField) or (Field is TBlobField) then
    begin
      if Field.AsString = NullAsStringValue then
        if not Field.IsNull then
          Field.Clear();
    end;
  end;
end;

function TDataSetHelper.FieldByAnyName(const FieldNames: array of string): TField;
var
  FieldName: string;
begin
  Result := nil;
  for FieldName in FieldNames do
  begin
    Result := FindField(FieldName);
    if Assigned(Result) then
      Exit;
  end;
//  Result := nil; // prevent [DCC Warning] SqlQueryHelperUnit.pas(32): W1035 Return value of function 'TSQLQueryHelper.ParameterByAnyName' might be undefined
  if not Assigned(Result) then
    DatabaseErrorFmt(SFieldNotFound, [CommaSeparated([FieldName])], Self);
end;

function TDataSetHelper.GetEnumerator: TDataSetEnumerator;
begin
  Result := TDataSetEnumerator.Create(Self);
end;

procedure TDataSetHelper.UpdateFieldDisplayLabels;
var
  Field: TField;
  FieldDisplayLabel: string;
  UnderscorePosition: Integer;
begin
  for Field in Fields do
  begin
    FieldDisplayLabel := StripIDFromFieldName(Field.DisplayLabel);
    // jpl: 20100122 - altijd underscores strippen, want lookupfields beginnen niet met ID_!
    UnderscorePosition := LastDelimiter('_', FieldDisplayLabel);
    if (UnderscorePosition > 0) then
      System.Delete(FieldDisplayLabel, UnderscorePosition, 1 + Length(FieldDisplayLabel) - UnderscorePosition);
    FieldDisplayLabel := CaptionFromCamelCase(FieldDisplayLabel);
    Field.DisplayLabel := FieldDisplayLabel;
  end;
end;

function TDataSetHelper.VisibleFields: TVisibleFieldsEnumeratorFactory;
begin
  Result := TVisibleFieldsEnumeratorFactory.Create(Fields);
end;

{ TComponentOfTypeEnumeratorFactory }

constructor TVisibleFieldsEnumeratorFactory.Create(const Fields: TFields);
begin
  Assert(Assigned(Fields), 'cannot enumerate nil Fields');

  FFields := Fields;
end;

function TVisibleFieldsEnumeratorFactory.GetEnumerator: TVisibleFieldsEnumerator;
begin
  Result := TVisibleFieldsEnumerator.Create(FFields);
end;

{ TVisibleFieldsEnumerator }

constructor TVisibleFieldsEnumerator.Create(const Fields: TFields);
begin
  inherited Create();
  FIndex := -1;
  FFields := Fields;
end;

function TVisibleFieldsEnumerator.GetCurrent: TField;
begin
  Result := FFields[FIndex];
end;

function TVisibleFieldsEnumerator.MoveNext: Boolean;
begin
  while TFieldEnumerator_MoveNext do
  begin
    if Current.Visible then
    begin
      Result := True;
      Exit;
    end;
  end;
  Result := False;
end;

function TVisibleFieldsEnumerator.TFieldEnumerator_MoveNext: Boolean;
begin
  Result := FIndex < FFields.Count - 1;
  if Result then
    Inc(FIndex);
end;

end.
