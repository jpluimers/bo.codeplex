unit ClientFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ExtCtrls, StdCtrls;

type
  TClientForm = class(TForm)
    Panel1: TPanel;
    ClientListButton: TButton;
    GenderListButton: TButton;
    procedure ClientListButtonClick(Sender: TObject);
    procedure GenderListButtonClick(Sender: TObject);
  end;

var
  ClientForm: TClientForm;

implementation

uses
  ClientListFormUnit,
  GenderListFormUnit;

{$R *.dfm}

procedure TClientForm.ClientListButtonClick(Sender: TObject);
begin
  ClientListForm.ShowModal();
end;

procedure TClientForm.GenderListButtonClick(Sender: TObject);
begin
  GenderListForm.ShowModal();
end;

end.
