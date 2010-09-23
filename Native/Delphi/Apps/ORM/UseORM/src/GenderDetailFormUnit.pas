unit GenderDetailFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, DataLinkReflectorUnit,
  DataAwareControlControllerUnit, Mask, DBCtrls, DbDisplayLabelUnit, ORMDetailBaseFormUnit, GenderUnit;

type
  TGenderDetailForm = class(TORMDetailBaseForm)
    Panel1: TPanel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    ScrollBox1: TScrollBox;
    DataAwareControlController: TDataAwareControlController;
    DataSource: TDataSource;
    ID_GenderDbDisplayLabel: TDbDisplayLabel;
    ID_GenderDbEdit: TDBEdit;
    EID_BaseEntityDbDisplayLabel: TDbDisplayLabel;
    EID_BaseEntityDbEdit: TDBEdit;
    NameDbDisplayLabel: TDbDisplayLabel;
    NameDbEdit: TDBEdit;
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
  strict private
    FGender: TGender;
  strict protected
    procedure SetGender(const Value: TGender); virtual;
  public
    property Gender: TGender read FGender write SetGender;
  end;

var
  GenderDetailForm: TGenderDetailForm;

implementation

{$R *.dfm}

procedure TGenderDetailForm.SetGender(const Value: TGender);
var
  GenderList: TGenderList;
begin
  if Assigned(Value) then
  begin
    GenderList:= Value.GenderList;
    AssignDataField(DataSource, Self.ID_GenderDbDisplayLabel, Self.ID_GenderDbEdit, GenderList.ID_GenderField);
    AssignDataField(DataSource, Self.EID_BaseEntityDbDisplayLabel, Self.EID_BaseEntityDbEdit, GenderList.EID_BaseEntityField);
    AssignDataField(DataSource, Self.NameDbDisplayLabel, Self.NameDbEdit, GenderList.NameField);
    AssignDataField(DataSource, Self.ID_BaseEntityDbDisplayLabel, Self.ID_BaseEntityDbEdit, GenderList.ID_BaseEntityField);
    AssignDataField(DataSource, Self.ExternalIDDbDisplayLabel, Self.ExternalIDDbEdit, GenderList.ExternalIDField);
    AssignDataField(DataSource, Self.ID_UserPersonInsertDbDisplayLabel, Self.ID_UserPersonInsertDbEdit, GenderList.ID_UserPersonInsertField);
    AssignDataField(DataSource, Self.TimeStampInsertDbDisplayLabel, Self.TimeStampInsertDbEdit, GenderList.TimeStampInsertField);
    AssignDataField(DataSource, Self.ID_UserPersonUpdateDbDisplayLabel, Self.ID_UserPersonUpdateDbEdit, GenderList.ID_UserPersonUpdateField);
    AssignDataField(DataSource, Self.TimeStampLastUpdateDbDisplayLabel, Self.TimeStampLastUpdateDbEdit, GenderList.TimeStampLastUpdateField);
    AssignDataField(DataSource, Self.StartDateTimeDbDisplayLabel, Self.StartDateTimeDbEdit, GenderList.StartDateTimeField);
    AssignDataField(DataSource, Self.FinishDateTimeDbDisplayLabel, Self.FinishDateTimeDbEdit, GenderList.FinishDateTimeField);
    AssignDataField(DataSource, Self.RemarkDbDisplayLabel, Self.RemarkDbEdit, GenderList.RemarkField);
    FGender := Value;
    DataSource.DataSet := GenderList;
  end
  else
    DataSource.DataSet := nil;
end;

end.
