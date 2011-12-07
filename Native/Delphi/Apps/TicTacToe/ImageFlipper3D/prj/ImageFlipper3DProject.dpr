program ImageFlipper3DProject;

uses
  FMX.Forms,
  MainFormUnit in '..\src\MainFormUnit.pas' {MainForm: TForm3D},
  TicTacToe_SquareContentUnit in '..\..\TicTacToeLogic\src\Enumerations\TicTacToe_SquareContentUnit.pas',
  TicTacToe_SquareUnit in '..\..\TicTacToeLogic\src\Enumerations\TicTacToe_SquareUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
