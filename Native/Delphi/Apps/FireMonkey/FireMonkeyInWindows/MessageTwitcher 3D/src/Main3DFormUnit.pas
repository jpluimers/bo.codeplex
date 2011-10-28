unit Main3DFormUnit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Types3D, FMX.Layers3D,
  TwitcherMessageFormUnit, TwitcherMessageListFormUnit, FMX.Ani;

type
  TForm1 = class(TForm3D)
    ParentLayer3D: TLayer3D;
    ButtonLayer3D: TLayer3D;
    Button1: TButton;
    FloatAnimation1: TFloatAnimation;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  strict protected
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
var
  TwitcherMessageForm: TTwitcherMessageForm;
begin
  TwitcherMessageForm := TTwitcherMessageForm.Create(nil);
  TwitcherMessageForm.MessageRectangle.Parent := ParentLayer3D;

  ParentLayer3D.AnimateFloat('RotationAngle.Y', 45, 2, TAnimationType.atIn, TInterpolationType.itBounce);
  ButtonLayer3D.AnimateFloatDelay('RotationAngle.Y', 360, 2, 1, TAnimationType.atIn, TInterpolationType.itCircular);
end;

end.
