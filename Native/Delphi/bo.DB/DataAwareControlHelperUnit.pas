unit DataAwareControlHelperUnit;

interface

uses
  DbDisplayLabelUnit,
  DBCtrls,
  DB;

procedure AssignDataField(const DataSource: TDataSource; const DbDisplayLabel: TDbDisplayLabel; const DbEdit: TDbEdit; const Field: TField);
    overload;

procedure AssignDataField(const DataSource: TDataSource; const DbDisplayLabel: TDbDisplayLabel; const DbLookupControl: TDBLookupControl;
    const Field: TField); overload;

procedure AssignDataField(const DataSource: TDataSource; const DbDisplayLabel: TDbDisplayLabel; const DbMemo: TDbMemo; const Field: TField);
    overload;

procedure AssignDataField(const DataSource: TDataSource; const DbCheckBox: TDBCheckBox; const Field: TField); overload;

implementation

uses
  EnumTypeInfoUnit, SysUtils, DbCrackerUnit;

{ TModalDataForm }

procedure AssignCombobox(const DataSource: TDataSource; const DbDisplayLabel: TDbDisplayLabel; const DbCombobox: TDBLookupComboBox; const
    Field: TField; const ListDataSource: TDataSource; const KeyField: string; const ListField: string);
begin
  if Assigned(DbDisplayLabel) then
  begin
    DbDisplayLabel.DataSource := DataSource;
    DbDisplayLabel.DataField := Field.FieldName;
  end;

  DbCombobox.DataSource := DataSource;
  DbCombobox.DataField := Field.FieldName;
  DbCombobox.ListSource := ListDataSource;
  DbCombobox.KeyField := KeyField;
  DbCombobox.ListField := ListField;
end;

procedure AssignDataField(const DataSource: TDataSource; const DbDisplayLabel: TDbDisplayLabel; const DbEdit: TDbEdit; const Field: TField);
begin
  if Assigned(DbDisplayLabel) then
  begin
    DbDisplayLabel.FocusControl := DbEdit;
    DbDisplayLabel.DataSource := DataSource;
    DbDisplayLabel.DataField := Field.FieldName;
  end;

  DbEdit.DataSource := DataSource;
  DbEdit.DataField := Field.FieldName;
end;

procedure AssignDataField(const DataSource: TDataSource; const DbDisplayLabel: TDbDisplayLabel; const DbLookupControl: TDBLookupControl; const Field: TField);
begin
  if Assigned(DbDisplayLabel) then
  begin
    DbDisplayLabel.FocusControl := DbLookupControl;
    DbDisplayLabel.DataSource := DataSource;
    DbDisplayLabel.DataField := Field.FieldName;
  end;

  AssignDataField(DataSource, DbLookupControl, Field);
end;

procedure AssignDataField(const DataSource: TDataSource; const DbDisplayLabel: TDbDisplayLabel; const DbMemo: TDbMemo; const Field: TField);
begin
  if Assigned(DbDisplayLabel) then
  begin
    DbDisplayLabel.FocusControl := DbMemo;
    DbDisplayLabel.DataSource := DataSource;
    DbDisplayLabel.DataField := Field.FieldName;
  end;

  DbMemo.DataSource := DataSource;
  DbMemo.DataField := Field.FieldName;
end;

procedure AssignDataField(const DataSource: TDataSource; const DbCheckBox: TDBCheckBox; const Field: TField); overload;
begin
  DbCheckBox.DataSource := DataSource;
  DbCheckBox.DataField := Field.FieldName;
  DbCheckBox.Caption := Field.DisplayLabel;
end;

end.
