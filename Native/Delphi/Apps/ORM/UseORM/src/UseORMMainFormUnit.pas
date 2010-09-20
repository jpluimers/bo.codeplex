unit UseORMMainFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, DB, ClientFormUnit,
  LazyFormFactoryUnit;

type
  TUseORMMainForm = class(TForm)
    Panel1: TPanel;
    ShowClientListButton: TButton;
    procedure ShowClientListButtonClick(Sender: TObject);
  strict private
//    FClientForm: TClientForm;
    FClientFormLazyFormFactory: TLazyFormFactory<TClientForm>;
  strict protected
    function GetClientForm: TClientForm; virtual;
//    property ClientForm: TClientForm read GetClientForm;
    property ClientFormLazyFormFactory: TLazyFormFactory<TClientForm> read FClientFormLazyFormFactory;
  end;

var
  UseORMMainForm: TUseORMMainForm;

implementation

uses
  ORMEntityListFactoryDataModuleIUnit;

{$R *.dfm}

function TUseORMMainForm.GetClientForm: TClientForm;
begin
//  if not Assigned(FClientForm) then
//    FClientForm := TClientForm.Create(Application);
//  Result := FClientForm;
  Result := ClientFormLazyFormFactory.Instance;
end;

procedure TUseORMMainForm.ShowClientListButtonClick(Sender: TObject);
begin
  ClientForm.Show();
end;

end.
