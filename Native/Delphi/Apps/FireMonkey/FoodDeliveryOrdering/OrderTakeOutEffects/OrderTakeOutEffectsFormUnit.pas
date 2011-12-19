unit OrderTakeOutEffectsFormUnit;

interface

uses
  System.SysUtils, System.Types, System.Classes, System.Variants, FMX.Types, FMX.Controls, FMX.Forms,
  FMX.Dialogs, FMX.Edit, FMX.Layouts, FMX.ListBox, FMX.Filter.Effects,
  FMX.Effects;

type
  TOrderTakeOut101Form = class(TForm)
    FoodEdit: TEdit;
    AddButton: TButton;
    ShadowEffect1: TShadowEffect;
    ReflectionEffect1: TReflectionEffect;
    CrumpleButton: TButton;
    ShadowEffect2: TShadowEffect;
    ScaledLayout1: TScaledLayout;
    OrderListBox: TListBox;
    ImageControl1: TImageControl;
    CrumpleTransitionEffect1: TCrumpleTransitionEffect;
    ResetButton: TButton;
    ShadowEffect3: TShadowEffect;
    Label1: TLabel;
    ListBoxItem1: TListBoxItem;
    procedure AddButtonClick(Sender: TObject);
    procedure ImageControl1Click(Sender: TObject);
    procedure CrumpleButtonClick(Sender: TObject);
    procedure ResetButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OrderTakeOut101Form: TOrderTakeOut101Form;

implementation

{$R *.fmx}

procedure TOrderTakeOut101Form.AddButtonClick(Sender: TObject);
begin
  OrderListBox.Items.Add(FoodEdit.Text);
end;

procedure TOrderTakeOut101Form.ImageControl1Click(Sender: TObject);
begin
  OrderListBox.Items.Delete(0);
end;

procedure TOrderTakeOut101Form.CrumpleButtonClick(Sender: TObject);
begin
  if CrumpleTransitionEffect1.Enabled then
  begin
    CrumpleTransitionEffect1.Progress := CrumpleTransitionEffect1.Progress + 1;
  end
  else
  begin
    CrumpleTransitionEffect1.Progress := 1;
    CrumpleTransitionEffect1.Enabled := True;
  end;
end;

procedure TOrderTakeOut101Form.ResetButtonClick(Sender: TObject);
begin
  CrumpleTransitionEffect1.Enabled := False;
end;

end.
