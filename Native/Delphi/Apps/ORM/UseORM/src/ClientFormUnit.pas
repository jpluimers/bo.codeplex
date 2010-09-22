unit ClientFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ExtCtrls, StdCtrls;

type
  TClientForm = class(TForm)
    Panel1: TPanel;
    ClientListDBGrid: TDBGrid;
    ClientListDataSource: TDataSource;
    NewClientButton: TButton;
    FilteredCheckBox: TCheckBox;
    procedure FilteredCheckBoxClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure NewClientButtonClick(Sender: TObject);
  end;

var
  ClientForm: TClientForm;

implementation

uses
  ORMEntityListFactoryDataModuleIUnit, ClientDetailFormUnit;

{$R *.dfm}

procedure TClientForm.FilteredCheckBoxClick(Sender: TObject);
begin
  if FilteredCheckBox.Checked then
    ClientListDataSource.DataSet := ORMEntityListFactoryDataModule.FilteredClientList
  else
    ClientListDataSource.DataSet := ORMEntityListFactoryDataModule.ClientList;
end;

procedure TClientForm.FormCreate(Sender: TObject);
begin
  ClientListDataSource.DataSet := ORMEntityListFactoryDataModule.ClientList;
end;

procedure TClientForm.NewClientButtonClick(Sender: TObject);
var
  ClientDetailForm: TClientDetailForm;
begin
  ClientDetailForm := TClientDetailForm.Create(Application);
  try
    ORMEntityListFactoryDataModule.ClientList.Insert();
    ClientDetailForm.Client := ORMEntityListFactoryDataModule.ClientList.Current;
    if ClientDetailForm.ShowModal = mrOk then
      ORMEntityListFactoryDataModule.ClientList.Post
    else
      ORMEntityListFactoryDataModule.ClientList.Cancel;
  finally
    ClientDetailForm.Free();
  end;
end;

end.
