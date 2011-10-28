unit aboutboxfrm;

interface

uses
  System.SysUtils, System.Classes,
  FMX.Forms, FMX.Dialogs, FMX.Types, FMX.Objects, FMX.Effects,
  FMX.Controls, FMX.Ani, FMX.Layouts, FMX.Objects3D, FMX.Types3D;

type

  TfrmAbout = class(TForm)
    Rectangle1: TRectangle;
    ShadowEffect1: TShadowEffect;
    Button1: TButton;
    Text1: TText;
    Viewport3D1: TViewport3D;
    Light1: TLight;
    Cube1: TCube;
    FloatAnimation1: TFloatAnimation;
    ColorAnimation1: TColorAnimation;
    Text3D1: TText3D;
    GlowEffect1: TGlowEffect;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbout: TfrmAbout;

implementation

{$R *.fmx}

procedure TfrmAbout.Button1Click(Sender: TObject);
begin
  Close;
end;

end.
