unit TypeSizeDemoFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TTypeSizeDemoForm = class(TForm)
    Label1: TLabel;
    PointerLabel: TLabel;
    TypeSizeButton: TButton;
    Label2: TLabel;
    IntegerLabel: TLabel;
    procedure TypeSizeButtonClick(Sender: TObject);
  end;

var
  TypeSizeDemoForm: TTypeSizeDemoForm;

implementation

{$R *.dfm}

procedure TTypeSizeDemoForm.TypeSizeButtonClick(Sender: TObject);
begin
  PointerLabel.Caption := IntToStr(SizeOf(Pointer));  // 4 vs 8
  IntegerLabel.Caption := IntToStr(SizeOf(Integer));   // is always 4
end;

end.
