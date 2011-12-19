unit OrderTakeOutAnimationsFormUnit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Layouts, FMX.ListBox,
  FMX.Edit, FMX.Effects, FMX.Filter.Effects, FMX.Ani;

type
  TOrderTakeOutAnimationForm = class(TForm)
    FoodEdit: TEdit;
    AddButton: TButton;
    OrderListBox: TListBox;
    Label1: TLabel;
    FloatAnimation1: TFloatAnimation;
    procedure AddButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OrderTakeOutAnimationForm: TOrderTakeOutAnimationForm;

implementation

{$R *.fmx}

procedure TOrderTakeOutAnimationForm.AddButtonClick(Sender: TObject);
begin
  OrderListBox.Items.Add(FoodEdit.Text);

  FoodEdit.AnimateFloat('Position.Y', 228, 1.5, TAnimationType.atIn, TInterpolationType.itBounce);
  FoodEdit.AnimateFloatDelay('Position.Y', 28, 1, 1.75);
end;

end.
