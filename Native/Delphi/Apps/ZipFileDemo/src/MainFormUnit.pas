unit MainFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    FileOpenDialog1: TFileOpenDialog;
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  System.Zip;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  Index: Integer;
  ZipFile: TZipFile;
begin
  Memo1.Clear();
  if FileOpenDialog1.Execute then
  begin
    ZipFile := TZipFile.Create();
    try
      ZipFile.Open(FileOpenDialog1.FileName, TZipMode.zmRead);
      for Index := 0 to ZipFile.FileCount-1 do
        Memo1.Lines.Add(ZipFile.FileNames[Index]);
      // you can save/retreive files to/from a ZIP file
      // both a files, and as streams
    finally
      ZipFile.Free;
    end;
  end;
end;

end.
