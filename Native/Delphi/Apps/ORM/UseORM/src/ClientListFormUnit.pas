unit ClientListFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, ExtCtrls, DataLinkReflectorUnit,
  DataAwareControlControllerUnit, ORMEntityUnit, ORMListBaseFormUnit;

type
  TClientListForm = class(TORMListBaseForm)
    Panel1: TPanel;
    ClientListDBGrid: TDBGrid;
    ClientListDataSource: TDataSource;
    NewClientButton: TButton;
    FilteredCheckBox: TCheckBox;
    DataAwareControlController1: TDataAwareControlController;
    EditClientButton: TButton;
    procedure EditClientButtonClick(Sender: TObject);
    procedure FilteredCheckBoxClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure NewClientButtonClick(Sender: TObject);
  private
    procedure EditOrInsertClient(const PostAction: TPostAction);
  end;

var
  ClientListForm: TClientListForm;

implementation

uses ORMEntityListFactoryDataModuleIUnit, ClientDetailFormUnit;

{$R *.dfm}

procedure TClientListForm.EditClientButtonClick(Sender: TObject);
begin
  EditOrInsertClient(paEdit);
end;

procedure TClientListForm.FilteredCheckBoxClick(Sender: TObject);
begin
  if FilteredCheckBox.Checked then
    ClientListDataSource.DataSet := ORMEntityListFactoryDataModule.FilteredClientList
  else
    ClientListDataSource.DataSet := ORMEntityListFactoryDataModule.ClientList;
end;

procedure TClientListForm.FormCreate(Sender: TObject);
begin
  ClientListDataSource.DataSet := ORMEntityListFactoryDataModule.ClientList;
end;

procedure TClientListForm.NewClientButtonClick(Sender: TObject);
begin
  EditOrInsertClient(paInsert);
end;

procedure TClientListForm.EditOrInsertClient(const PostAction: TPostAction);
//var
//  ClientDetailForm: TClientDetailForm;
//begin
//  ClientDetailForm := TClientDetailForm.Create(Application);
//  try
//    case PostAction of
//      paEdit:
//        ORMEntityListFactoryDataModule.ClientList.Edit;
//      paInsert:
//        ORMEntityListFactoryDataModule.ClientList.Insert;
//    end;
//    ClientDetailForm.Client := ORMEntityListFactoryDataModule.ClientList.Current;
//    if ClientDetailForm.ShowModal = mrOk then
//      ORMEntityListFactoryDataModule.ClientList.Post
//    else
//      ORMEntityListFactoryDataModule.ClientList.Cancel;
//  finally
//    ClientDetailForm.Free;
//  end;
begin
  EditOrInsert<TClientDetailForm>(PostAction, ORMEntityListFactoryDataModule.ClientList,
    procedure (ClientDetailForm: TClientDetailForm)
    begin
      ClientDetailForm.Client := ORMEntityListFactoryDataModule.ClientList.Current;
    end
  );  
end;

end.
