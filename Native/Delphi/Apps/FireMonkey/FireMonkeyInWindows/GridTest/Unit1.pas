unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Grid, FMX.Layouts,
  FMX.Edit, FMX.Objects;

type
  TForm1 = class(TForm)
    FillButton: TButton;
    Grid1: TGrid;
    Column1: TColumn;
    Column2: TColumn;
    NoOfRowsEdit: TEdit;
    Rectangle1: TRectangle;
    Column3: TColumn;
    Column4: TColumn;
    Column5: TColumn;
    procedure FillButtonClick(Sender: TObject);
    procedure Grid1GetValue(Sender: TObject; const Col, Row: Integer; var Value:
        Variant);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.FillButtonClick(Sender: TObject);
begin
  Grid1.RowCount := StrtoInt(NoOfRowsEdit.Text);
end;

procedure TForm1.Grid1GetValue(Sender: TObject; const Col, Row: Integer; var
    Value: Variant);
begin
  Value := format('Row %d, Col %d', [Row + 1, Col + 1]);
end;

end.
