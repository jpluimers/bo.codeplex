unit ClientDataSetSupportingCalculatedAndLookupFieldsUnit;

interface

uses
  DBClient, DB;

type
  TCreateCalculatedFieldOption = (coHideFields, coAddSizeOfStringFields);
  TCreateCalculatedFieldOptions = set of TCreateCalculatedFieldOption;

const
  AllCreateCalculatedFieldOptions = [Low(TCreateCalculatedFieldOption)..High(TCreateCalculatedFieldOption)];

type
  TClientDataSetSupportingCalculatedAndLookupFields = class(TClientDataSet)
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
  end;

implementation

uses
  SysUtils, Variants, FieldNameHelperUnit, DbCrackerUnit, StringUtilsUnit;

function TClientDataSetSupportingCalculatedAndLookupFields.CreateCalculatedField(const FieldName: string; const SourceFieldNames: array of string; const FieldNameToPositionAfter: string =
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

  if FieldNameToPositionAfter <> '' then
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
    CalculatedField.Size := 500; //##jpl

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

procedure TClientDataSetSupportingCalculatedAndLookupFields.CreateCalculatedFields;
begin
  //jpl: 20100124 - voor descendants om te overriden
end;

procedure TClientDataSetSupportingCalculatedAndLookupFields.CreateFields;
begin
  inherited CreateFields;
  CreateLookupFields();
  CreateCalculatedFields();
  HookFieldsOnGetTextEvents();
end;

function TClientDataSetSupportingCalculatedAndLookupFields.CreateLookupField(const LookupDataSet: TDataSet; const LookupKeyFieldName, LookupResultFieldName: string;
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

procedure TClientDataSetSupportingCalculatedAndLookupFields.CreateLookupFields;
begin
  //jpl: 20100122 - voor descendants om te overriden
end;

procedure TClientDataSetSupportingCalculatedAndLookupFields.HookFieldsOnGetTextEvents;
var
  Field: TField;
begin
  for Field in Fields do
    Field.OnGetText := Self.MemoFieldsOnGetText; //##jpl: only do this for memo fields
end;

procedure TClientDataSetSupportingCalculatedAndLookupFields.MemoFieldsOnGetText(Sender: TField; var Text: string; DisplayText: Boolean);
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

end.