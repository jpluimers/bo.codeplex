unit MainFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.Bind.EngExt, Vcl.Bind.DBEngExt,
  System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Components,
  Vcl.StdCtrls, Vcl.ComCtrls;

type
  TMainForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    StaticText1: TStaticText;
    Edit1: TEdit;
    BindingsList1: TBindingsList;
    BindExpression1: TBindExpression;
    TrackBar1: TTrackBar;
    BindExpression2: TBindExpression;
    ScrollBar1: TScrollBar;
    BindExpression3: TBindExpression;
    procedure Edit1Change(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.Edit1Change(Sender: TObject);
begin
  BindingsList1.Notify(Sender, 'Text');
end;

procedure TMainForm.ScrollBar1Change(Sender: TObject);
begin
  BindingsList1.Notify(Sender, '');
end;

procedure TMainForm.TrackBar1Change(Sender: TObject);
begin
  BindingsList1.Notify(Sender, '');
end;

end.
