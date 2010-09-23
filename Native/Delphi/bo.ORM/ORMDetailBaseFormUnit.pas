unit ORMDetailBaseFormUnit;

interface

uses
  Forms, DbDisplayLabelUnit, DBCtrls, DB;

type
  TORMDetailBaseForm = class(TForm)
  strict protected
    procedure AssignDataField(const DataSource: TDataSource; const DbCheckBox: TDBCheckBox; const Field: TField); overload;
        virtual;
    procedure AssignDataField(const DataSource: TDataSource; const DbDisplayLabel: TDbDisplayLabel; const DbEdit: TDbEdit;
        const Field: TField); overload; virtual;
    procedure AssignDataField(const DataSource: TDataSource; const DbDisplayLabel: TDbDisplayLabel; const DbLookupControl:
        TDBLookupControl; const Field: TField); overload; virtual;
    procedure AssignDataField(const DataSource: TDataSource; const DbDisplayLabel: TDbDisplayLabel; const DbMemo: TDbMemo;
        const Field: TField); overload; virtual;
  end;

implementation

uses
  DataAwareControlHelperUnit;

procedure TORMDetailBaseForm.AssignDataField(const DataSource: TDataSource; const DbCheckBox: TDBCheckBox; const Field:
    TField);
begin
  DataAwareControlHelperUnit.AssignDataField(DataSource, DbCheckBox, Field);
end;

procedure TORMDetailBaseForm.AssignDataField(const DataSource: TDataSource; const DbDisplayLabel: TDbDisplayLabel;
    const DbEdit: TDbEdit; const Field: TField);
begin
  DataAwareControlHelperUnit.AssignDataField(DataSource, DbDisplayLabel, DbEdit, Field);
end;

procedure TORMDetailBaseForm.AssignDataField(const DataSource: TDataSource; const DbDisplayLabel: TDbDisplayLabel;
    const DbLookupControl: TDBLookupControl; const Field: TField);
begin
  DataAwareControlHelperUnit.AssignDataField(DataSource, DbDisplayLabel, DbLookupControl, Field);
end;

procedure TORMDetailBaseForm.AssignDataField(const DataSource: TDataSource; const DbDisplayLabel: TDbDisplayLabel;
    const DbMemo: TDbMemo; const Field: TField);
begin
  DataAwareControlHelperUnit.AssignDataField(DataSource, DbDisplayLabel, DbMemo, Field);
end;

end.
