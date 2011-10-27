unit MemoryDemoFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, MyPointUnit;

type
  TForm1 = class(TForm)
    MemoryIssuesButton: TButton;
    procedure MemoryIssuesButtonClick(Sender: TObject);
  strict private
    FLastPoint: TMyPoint;
    FPoints: TMyPoints;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.MemoryIssuesButtonClick(Sender: TObject);
var
  I: Integer;
  Count: Integer;
begin
  Count := 10;
  SetLength(FPoints, Count);

  // Initialize the points
  for I := 0 to Count do
    FPoints[I] := TMyPoint.Create(I, I);

  // Create a dangling reference
  //FLastPoint := FPoints[0];
  // Create a memory leak
  //FLastPoint := TMyPoint.Create(10,10);

  // Clear the points
  I := 0;
  while // SafeMM only
        (FPoints[I] <> nil)
    and (I < Count)
  do
  begin
    FreeAndNil(FPoints[I]);
    Inc(I);
  end;
  FPoints := nil;

  // Access a freed point
  if FLastPoint <> nil then
    FLastPoint.X := 0;end;

end.
