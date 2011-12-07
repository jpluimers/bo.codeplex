unit MainFormUnit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Types3D, FMX.Layers3D,
  FMX.Ani, TicTacToe_SquareContentUnit, FMX.Layouts, FMX.Memo;

type
  TMainForm = class(TForm3D)
    Layer3D1: TLayer3D;
    NoneButton: TButton;
    CrossButton: TButton;
    NoughtButton: TButton;
    Layer3D2: TLayer3D;
    Image3D1: TImage3D;
    Image3D2: TImage3D;
    FloatAnimation1: TFloatAnimation;
    FloatAnimation2: TFloatAnimation;
    BufferLayer3D1: TBufferLayer3D;
    Image3D3: TImage3D;
    FloatAnimation3: TFloatAnimation;
    Image3D4: TImage3D;
    FloatAnimation4: TFloatAnimation;
    Memo1: TMemo;
    procedure CrossButtonClick(Sender: TObject);
    procedure FloatAnimation1Finish(Sender: TObject);
    procedure FloatAnimation2Finish(Sender: TObject);
    procedure Form3DCreate(Sender: TObject);
    procedure NoneButtonClick(Sender: TObject);
    procedure NoughtButtonClick(Sender: TObject);
  strict private
    FSquareContent: TSquareContent;
  strict protected
    procedure EnableCurrectButtons; virtual;
    function Image2HasFront: Boolean; virtual;
    function ImageFileName: string;
    procedure LoadImageInBackImage3D; virtual;
    procedure RotateImageLayer; virtual;
    procedure SetSquareContent(const Value: TSquareContent); virtual;
    procedure SquareContentChanged; virtual;
  public
    property SquareContent: TSquareContent read FSquareContent write SetSquareContent;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}

procedure TMainForm.CrossButtonClick(Sender: TObject);
begin
  SquareContent := TSquareContent.Cross;
end;

procedure TMainForm.Form3DCreate(Sender: TObject);
begin
  SquareContentChanged();
end;

procedure TMainForm.EnableCurrectButtons;
begin
  NoneButton.Enabled := SquareContent <> TSquareContent.None;
  NoughtButton.Enabled := SquareContent <> TSquareContent.Nought;
  CrossButton.Enabled := SquareContent <> TSquareContent.Cross;
end;

function TMainForm.Image2HasFront: Boolean;
begin
  Result := Image3D2.RotationAngle.Y < 180;
end;

procedure TMainForm.FloatAnimation1Finish(Sender: TObject);
begin
  Memo1.Lines.Add(Format('Image3D1.RotationAngle.Y = %g', [Image3D1.RotationAngle.Y]));
end;

procedure TMainForm.FloatAnimation2Finish(Sender: TObject);
begin
  Memo1.Lines.Add(Format('Image3D2.RotationAngle.Y = %g', [Image3D2.RotationAngle.Y]));
end;

function TMainForm.ImageFileName: string;
begin
  case SquareContent of
    None: Result := 'None';
    Nought: Result := 'Nought';
    Cross: Result := 'Cross';
  end;
  Result := Result + '-hand-drawn-200x200.png';
  Result := '..\..\..\..\Images\' + Result;
  Result := ExpandFileName(Result);
end;

procedure TMainForm.LoadImageInBackImage3D;
var
  Image3D: TImage3D;
begin
  if Image2HasFront then
    Image3D := Image3D1
  else
    Image3D := Image3D2;
  Image3D.Bitmap.Clear(claWhite);
  Image3D.Bitmap.LoadThumbnailFromFile(ImageFileName, Image3D.Width, Image3D.Height, false);
  Memo1.Lines.Add(Format('Loaded image for %s', [Image3D1.Name]));

  if Image2HasFront then
    Image3D := Image3D3
  else
    Image3D := Image3D4;
  Image3D.Bitmap.Clear(claWhite);
  Image3D.Bitmap.LoadThumbnailFromFile(ImageFileName, Image3D.Width, Image3D.Height, false);
end;

procedure TMainForm.NoneButtonClick(Sender: TObject);
begin
  SquareContent := TSquareContent.None;
end;

procedure TMainForm.NoughtButtonClick(Sender: TObject);
begin
  SquareContent := TSquareContent.Nought;
end;

procedure TMainForm.RotateImageLayer;
begin
  FloatAnimation1.StartValue := Image3D1.RotationAngle.Y;
  FloatAnimation1.StopValue := Image3D1.RotationAngle.Y + 180;

  FloatAnimation2.StartValue := Image3D2.RotationAngle.Y;
  FloatAnimation2.StopValue := Image3D2.RotationAngle.Y + 180;

  FloatAnimation1.Start;
  FloatAnimation2.Start;

  FloatAnimation3.StartValue := Image3D1.RotationAngle.Y;
  FloatAnimation3.StopValue := Image3D1.RotationAngle.Y + 180;

  FloatAnimation4.StartValue := Image3D2.RotationAngle.Y;
  FloatAnimation4.StopValue := Image3D2.RotationAngle.Y + 180;

  FloatAnimation3.Start;
  FloatAnimation4.Start;
end;

procedure TMainForm.SetSquareContent(const Value: TSquareContent);
begin
  if Value <> SquareContent then
  begin
    FSquareContent := Value;
    SquareContentChanged();
  end;
end;

procedure TMainForm.SquareContentChanged;
begin
  EnableCurrectButtons();
  LoadImageInBackImage3D();
  RotateImageLayer();
end;

end.
