unit ClientDetailFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, DBCtrls, DbDisplayLabelUnit, ClientFormUnit, DB,
  ClientUnit, DataLinkReflectorUnit, DataAwareControlControllerUnit, Buttons;

type
  TClientDetailForm = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    ScrollBox1: TScrollBox;
    ID_ClientDbDisplayLabel: TDbDisplayLabel;
    ID_ClientDbEdit: TDBEdit;
    EID_NaturalPersonDbDisplayLabel: TDbDisplayLabel;
    EID_NaturalPersonDbEdit: TDBEdit;
    ID_Company_LegalPersonDbDisplayLabel: TDbDisplayLabel;
    ID_Company_LegalPersonDbEdit: TDBEdit;
    ID_NaturalPersonDbDisplayLabel: TDbDisplayLabel;
    ID_NaturalPersonDbEdit: TDBEdit;
    EID_BaseEntityDbDisplayLabel: TDbDisplayLabel;
    EID_BaseEntityDbEdit: TDBEdit;
    FirstNameDbDisplayLabel: TDbDisplayLabel;
    FirstNameDbEdit: TDBEdit;
    InitialsDbDisplayLabel: TDbDisplayLabel;
    InitialsDbEdit: TDBEdit;
    LastNameDbDisplayLabel: TDbDisplayLabel;
    LastNameDbEdit: TDBEdit;
    BirthDateDbDisplayLabel: TDbDisplayLabel;
    BirthDateDbEdit: TDBEdit;
    PlaceOfBirthDbDisplayLabel: TDbDisplayLabel;
    PlaceOfBirthDbEdit: TDBEdit;
    SSNDbDisplayLabel: TDbDisplayLabel;
    SSNDbEdit: TDBEdit;
    ID_BaseEntityDbDisplayLabel: TDbDisplayLabel;
    ID_BaseEntityDbEdit: TDBEdit;
    ExternalIDDbDisplayLabel: TDbDisplayLabel;
    ExternalIDDbEdit: TDBEdit;
    ID_UserPersonInsertDbDisplayLabel: TDbDisplayLabel;
    ID_UserPersonInsertDbEdit: TDBEdit;
    TimeStampInsertDbDisplayLabel: TDbDisplayLabel;
    TimeStampInsertDbEdit: TDBEdit;
    ID_UserPersonUpdateDbDisplayLabel: TDbDisplayLabel;
    ID_UserPersonUpdateDbEdit: TDBEdit;
    TimeStampLastUpdateDbDisplayLabel: TDbDisplayLabel;
    TimeStampLastUpdateDbEdit: TDBEdit;
    StartDateTimeDbDisplayLabel: TDbDisplayLabel;
    StartDateTimeDbEdit: TDBEdit;
    FinishDateTimeDbDisplayLabel: TDbDisplayLabel;
    FinishDateTimeDbEdit: TDBEdit;
    RemarkDbDisplayLabel: TDbDisplayLabel;
    RemarkDbEdit: TDBEdit;
    DataSource: TDataSource;
    DataAwareControlController: TDataAwareControlController;
    BitBtn1: TBitBtn;
  strict private
    FClient: TClient;
  strict protected
    procedure AssignDataField(const DbCheckBox: TDBCheckBox; const Field: TField); overload; virtual;
    procedure AssignDataField(const DbDisplayLabel: TDbDisplayLabel; const DbEdit: TDbEdit; const Field: TField);
        overload; virtual;
    procedure AssignDataField(const DbDisplayLabel: TDbDisplayLabel; const DbLookupControl: TDBLookupControl; const
        Field: TField); overload; virtual;
    procedure AssignDataField(const DbDisplayLabel: TDbDisplayLabel; const DbMemo: TDbMemo; const Field: TField);
        overload; virtual;
    procedure SetClient(const Value: TClient); virtual;
  public
    property Client: TClient read FClient write SetClient;
  end;

var
  ClientDetailForm: TClientDetailForm;

implementation

uses
  DataAwareControlHelperUnit;

{$R *.dfm}

procedure TClientDetailForm.AssignDataField(const DbCheckBox: TDBCheckBox; const Field: TField);
begin
  DataAwareControlHelperUnit.AssignDataField(DataSource, DbCheckBox, Field);
end;

procedure TClientDetailForm.AssignDataField(const DbDisplayLabel: TDbDisplayLabel; const DbEdit: TDbEdit; const
    Field: TField);
begin
  DataAwareControlHelperUnit.AssignDataField(DataSource, DbDisplayLabel, DbEdit, Field);
end;

procedure TClientDetailForm.AssignDataField(const DbDisplayLabel: TDbDisplayLabel; const DbLookupControl:
    TDBLookupControl; const Field: TField);
begin
  DataAwareControlHelperUnit.AssignDataField(DataSource, DbDisplayLabel, DbLookupControl, Field);
end;

procedure TClientDetailForm.AssignDataField(const DbDisplayLabel: TDbDisplayLabel; const DbMemo: TDbMemo; const
    Field: TField);
begin
  DataAwareControlHelperUnit.AssignDataField(DataSource, DbDisplayLabel, DbMemo, Field);
end;

procedure TClientDetailForm.SetClient(const Value: TClient);
var
  ClientList: TClientList;
begin
  if Assigned(Value) then
  begin
    ClientList:= Value.ClientList;
    AssignDataField(Self.ID_ClientDbDisplayLabel, Self.ID_ClientDbEdit, ClientList.ID_ClientField);
    AssignDataField(Self.EID_NaturalPersonDbDisplayLabel, Self.EID_NaturalPersonDbEdit, ClientList.EID_NaturalPersonField);
    AssignDataField(Self.ID_Company_LegalPersonDbDisplayLabel, Self.ID_Company_LegalPersonDbEdit, ClientList.ID_Company_LegalPersonField);
    AssignDataField(Self.ID_NaturalPersonDbDisplayLabel, Self.ID_NaturalPersonDbEdit, ClientList.ID_NaturalPersonField);
    AssignDataField(Self.EID_BaseEntityDbDisplayLabel, Self.EID_BaseEntityDbEdit, ClientList.EID_BaseEntityField);
    AssignDataField(Self.FirstNameDbDisplayLabel, Self.FirstNameDbEdit, ClientList.FirstNameField);
    AssignDataField(Self.InitialsDbDisplayLabel, Self.InitialsDbEdit, ClientList.InitialsField);
    AssignDataField(Self.LastNameDbDisplayLabel, Self.LastNameDbEdit, ClientList.LastNameField);
    AssignDataField(Self.BirthDateDbDisplayLabel, Self.BirthDateDbEdit, ClientList.BirthDateField);
    AssignDataField(Self.PlaceOfBirthDbDisplayLabel, Self.PlaceOfBirthDbEdit, ClientList.PlaceOfBirthField);
    AssignDataField(Self.SSNDbDisplayLabel, Self.SSNDbEdit, ClientList.SSNField);
    AssignDataField(Self.ID_BaseEntityDbDisplayLabel, Self.ID_BaseEntityDbEdit, ClientList.ID_BaseEntityField);
    AssignDataField(Self.ExternalIDDbDisplayLabel, Self.ExternalIDDbEdit, ClientList.ExternalIDField);
    AssignDataField(Self.ID_UserPersonInsertDbDisplayLabel, Self.ID_UserPersonInsertDbEdit, ClientList.ID_UserPersonInsertField);
    AssignDataField(Self.TimeStampInsertDbDisplayLabel, Self.TimeStampInsertDbEdit, ClientList.TimeStampInsertField);
    AssignDataField(Self.ID_UserPersonUpdateDbDisplayLabel, Self.ID_UserPersonUpdateDbEdit, ClientList.ID_UserPersonUpdateField);
    AssignDataField(Self.TimeStampLastUpdateDbDisplayLabel, Self.TimeStampLastUpdateDbEdit, ClientList.TimeStampLastUpdateField);
    AssignDataField(Self.StartDateTimeDbDisplayLabel, Self.StartDateTimeDbEdit, ClientList.StartDateTimeField);
    AssignDataField(Self.FinishDateTimeDbDisplayLabel, Self.FinishDateTimeDbEdit, ClientList.FinishDateTimeField);
    AssignDataField(Self.RemarkDbDisplayLabel, Self.RemarkDbEdit, ClientList.RemarkField);
    FClient := Value;
    DataSource.DataSet := ClientList;
  end
  else
    DataSource.DataSet := nil;
end;

end.
