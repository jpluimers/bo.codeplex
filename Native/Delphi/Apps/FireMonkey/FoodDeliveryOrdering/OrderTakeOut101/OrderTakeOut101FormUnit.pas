unit OrderTakeOut101FormUnit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Layouts, FMX.ListBox,
  FMX.Edit, FMX.Effects, FMX.Filter.Effects;

type
  TOrderTakeOut101Form = class(TForm)
    FoodEdit: TEdit;
    AddButton: TButton;
    OrderListBox: TListBox;
    Label1: TLabel;
    procedure AddButtonClick(Sender: TObject);
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

end.
