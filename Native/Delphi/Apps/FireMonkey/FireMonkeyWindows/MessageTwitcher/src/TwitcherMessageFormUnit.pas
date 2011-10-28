unit TwitcherMessageFormUnit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Objects, FMX.Effects;

type
  TTwitcherMessageForm = class(TForm)
    MessageRectangle: TRectangle;
    Rectangle2: TRectangle;
    Text1: TText;
    Text2: TText;
    Text3: TText;
    ShadowEffect1: TShadowEffect;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
