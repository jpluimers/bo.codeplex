unit TypeSizesFormUnit;

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
    Label3: TLabel;
    NativeIntLabel: TLabel;
    Label5: TLabel;
    TagLabel: TLabel;
    Label4: TLabel;
    NativeIntRangeLabel: TLabel;
    Label6: TLabel;
    Int8Label: TLabel;
    Label8: TLabel;
    Int16Label: TLabel;
    Label10: TLabel;
    Int32Label: TLabel;
    Label12: TLabel;
    Int64Label: TLabel;
    procedure TypeSizeButtonClick(Sender: TObject);
  end;

var
  TypeSizeDemoForm: TTypeSizeDemoForm;

implementation

{$R *.dfm}

procedure TTypeSizeDemoForm.TypeSizeButtonClick(Sender: TObject);
//var
//  Count: NativeUInt;
//  Index: NativeUInt;
begin
  PointerLabel.Caption := IntToStr(SizeOf(Pointer));  // 4 vs 8
  IntegerLabel.Caption := IntToStr(SizeOf(Integer));   // is always 4
  NativeIntLabel.Caption := IntToStr(SizeOf(NativeInt)); // 4 vs 8
  TagLabel.Caption := IntToStr(SizeOf(TagLabel.Tag));  // 4 vs 8
  Int8Label.Caption := IntToStr(SizeOf(Int8)); // 1 vs 1
  Int16Label.Caption := IntToStr(SizeOf(Int16)); // 2 vs 2
  Int32Label.Caption := IntToStr(SizeOf(Int32)); // 4 vs 4
  Int64Label.Caption := IntToStr(SizeOf(Int64)); // 8 vs 8

  NativeIntRangeLabel.Caption := IntToStr(Low(NativeInt)) +
    ' .. ' + IntToStr(High(NativeInt));
{
  Count := 0;
  for Index := Low(NativeUint) to High(NativeUInt) do
  begin
    Inc(Count);
  end;

  ShowMessage('Count: ' + IntToStr(Count));
}
end;

end.
