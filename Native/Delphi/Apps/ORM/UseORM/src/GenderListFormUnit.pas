unit GenderListFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DataLinkReflectorUnit, DataAwareControlControllerUnit, DB, Grids,
  DBGrids, StdCtrls, ExtCtrls, ORMListBaseFormUnit, GenderDetailFormUnit;

type
  TGenderListForm = class(TORMListBaseForm)
    Panel1: TPanel;
    NewGenderButton: TButton;
    ClientListDBGrid: TDBGrid;
    GenderListDataSource: TDataSource;
    DataAwareControlController1: TDataAwareControlController;
    EditGenderButton: TButton;
    procedure EditGenderButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure NewGenderButtonClick(Sender: TObject);
  strict private
    procedure AssignGender(GenderDetailForm: TGenderDetailForm);
  end;

var
  GenderListForm: TGenderListForm;

implementation

uses
  ORMEntityListFactoryDataModuleIUnit,
  ORMEntityUnit;

{$R *.dfm}

procedure TGenderListForm.AssignGender(GenderDetailForm: TGenderDetailForm);
begin
  GenderDetailForm.Gender := ORMEntityListFactoryDataModule.GenderList.Current;
end;

procedure TGenderListForm.EditGenderButtonClick(Sender: TObject);
begin
  EditOrInsert<TGenderDetailForm>(paEdit, ORMEntityListFactoryDataModule.GenderList, AssignGender);
end;

procedure TGenderListForm.FormCreate(Sender: TObject);
begin
  GenderListDataSource.DataSet := ORMEntityListFactoryDataModule.GenderList;
end;

procedure TGenderListForm.NewGenderButtonClick(Sender: TObject);
begin
  EditOrInsert<TGenderDetailForm>(paInsert, ORMEntityListFactoryDataModule.GenderList, AssignGender);
end;

end.
