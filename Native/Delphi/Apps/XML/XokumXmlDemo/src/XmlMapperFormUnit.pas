unit XmlMapperFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, DBCtrls, ExtCtrls;

type
  TXmlMapperForm = class(TForm)
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    OpenButton: TButton;
    CloseButton: TButton;
    ApplyUpdatesButton: TButton;
    DBGrid1: TDBGrid;
    XokumDataSource: TDataSource;
    SaveToFileButton: TButton;
    procedure CloseButtonClick(Sender: TObject);
    procedure OpenButtonClick(Sender: TObject);
    procedure ApplyUpdatesButtonClick(Sender: TObject);
    procedure SaveToFileButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  XmlMapperForm: TXmlMapperForm;

implementation

uses XokumDataModuleUnit, DBClient;

{$R *.dfm}

procedure TXmlMapperForm.CloseButtonClick(Sender: TObject);
begin
  XokumDataSource.DataSet.Close();
end;

procedure TXmlMapperForm.OpenButtonClick(Sender: TObject);
begin
  XokumDataSource.DataSet.Open();
end;

procedure TXmlMapperForm.ApplyUpdatesButtonClick(Sender: TObject);
var
  XokumClientDataSet: TClientDataSet;
begin
  if XokumDataSource.DataSet is TClientDataSet then
  begin
    XokumClientDataSet := TClientDataSet(XokumDataSource.DataSet);
    XokumClientDataSet.ApplyUpdates(0);
  end;
end;

procedure TXmlMapperForm.SaveToFileButtonClick(Sender: TObject);
var
  XokumClientDataSet: TClientDataSet;
begin
  if XokumDataSource.DataSet is TClientDataSet then
  begin
    XokumClientDataSet := TClientDataSet(XokumDataSource.DataSet);
    XokumClientDataSet.SaveToFile('..\data\xokum.utf8.xml', dfXMLUTF8);
  end;
end;

end.
