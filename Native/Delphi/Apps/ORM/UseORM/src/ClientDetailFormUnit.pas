unit ClientDetailFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, DBCtrls, DbDisplayLabelUnit, ClientFormUnit, DB,
  ClientUnit, DataLinkReflectorUnit, DataAwareControlControllerUnit, Buttons, ORMDetailBaseFormUnit;

type
  TClientDetailForm = class(TORMDetailBaseForm)
    Panel1: TPanel;
    Panel3: TPanel;
    ScrollBox1: TScrollBox;
    DataSource: TDataSource;
    DataAwareControlController: TDataAwareControlController;
    BitBtn1: TBitBtn;
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
    ID_GenderDbDisplayLabel: TDbDisplayLabel;
    ID_GenderDbEdit: TDBEdit;
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
    GenderDBLookupComboBox: TDBLookupComboBox;
  strict private
    FClient: TClient;
  strict protected
    procedure SetClient(const Value: TClient); virtual;
  public
    property Client: TClient read FClient write SetClient;
  end;

var
  ClientDetailForm: TClientDetailForm;

implementation

{$R *.dfm}

procedure TClientDetailForm.SetClient(const Value: TClient);
var
  ClientList: TClientList;
begin
  if Assigned(Value) then
  begin
    ClientList:= Value.ClientList;
    AssignDataField(DataSource, Self.ID_ClientDbDisplayLabel, Self.ID_ClientDbEdit, ClientList.ID_ClientField);
    AssignDataField(DataSource, Self.EID_NaturalPersonDbDisplayLabel, Self.EID_NaturalPersonDbEdit, ClientList.EID_NaturalPersonField);
    AssignDataField(DataSource, Self.ID_Company_LegalPersonDbDisplayLabel, Self.ID_Company_LegalPersonDbEdit, ClientList.ID_Company_LegalPersonField);
    AssignDataField(DataSource, Self.ID_NaturalPersonDbDisplayLabel, Self.ID_NaturalPersonDbEdit, ClientList.ID_NaturalPersonField);
    AssignDataField(DataSource, Self.EID_BaseEntityDbDisplayLabel, Self.EID_BaseEntityDbEdit, ClientList.EID_BaseEntityField);
    AssignDataField(DataSource, Self.FirstNameDbDisplayLabel, Self.FirstNameDbEdit, ClientList.FirstNameField);
    AssignDataField(DataSource, Self.InitialsDbDisplayLabel, Self.InitialsDbEdit, ClientList.InitialsField);
    AssignDataField(DataSource, Self.LastNameDbDisplayLabel, Self.LastNameDbEdit, ClientList.LastNameField);
    AssignDataField(DataSource, Self.BirthDateDbDisplayLabel, Self.BirthDateDbEdit, ClientList.BirthDateField);
    AssignDataField(DataSource, Self.PlaceOfBirthDbDisplayLabel, Self.PlaceOfBirthDbEdit, ClientList.PlaceOfBirthField);
    AssignDataField(DataSource, Self.SSNDbDisplayLabel, Self.SSNDbEdit, ClientList.SSNField);

    AssignDataField(DataSource, Self.ID_GenderDbDisplayLabel, Self.ID_GenderDbEdit, ClientList.ID_GenderField);
    AssignDataField(DataSource, Self.ID_GenderDbDisplayLabel, Self.GenderDBLookupComboBox, ClientList.GenderField);

    AssignDataField(DataSource, Self.ID_BaseEntityDbDisplayLabel, Self.ID_BaseEntityDbEdit, ClientList.ID_BaseEntityField);
    AssignDataField(DataSource, Self.ExternalIDDbDisplayLabel, Self.ExternalIDDbEdit, ClientList.ExternalIDField);
    AssignDataField(DataSource, Self.ID_UserPersonInsertDbDisplayLabel, Self.ID_UserPersonInsertDbEdit, ClientList.ID_UserPersonInsertField);
    AssignDataField(DataSource, Self.TimeStampInsertDbDisplayLabel, Self.TimeStampInsertDbEdit, ClientList.TimeStampInsertField);
    AssignDataField(DataSource, Self.ID_UserPersonUpdateDbDisplayLabel, Self.ID_UserPersonUpdateDbEdit, ClientList.ID_UserPersonUpdateField);
    AssignDataField(DataSource, Self.TimeStampLastUpdateDbDisplayLabel, Self.TimeStampLastUpdateDbEdit, ClientList.TimeStampLastUpdateField);
    AssignDataField(DataSource, Self.StartDateTimeDbDisplayLabel, Self.StartDateTimeDbEdit, ClientList.StartDateTimeField);
    AssignDataField(DataSource, Self.FinishDateTimeDbDisplayLabel, Self.FinishDateTimeDbEdit, ClientList.FinishDateTimeField);
    AssignDataField(DataSource, Self.RemarkDbDisplayLabel, Self.RemarkDbEdit, ClientList.RemarkField);


    FClient := Value;
    DataSource.DataSet := ClientList;
  end
  else
    DataSource.DataSet := nil;
end;

end.
