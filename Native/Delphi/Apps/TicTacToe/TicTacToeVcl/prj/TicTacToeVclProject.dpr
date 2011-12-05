program TicTacToeVclProject;

uses
  Vcl.Forms,
  TicTacToe.VclFormUnit in '..\src\TicTacToe.VclFormUnit.pas' {VclForm},
  TicTacToe.PlayerMapperUnit in '..\..\TicTacToeLogic\src\Mappers\TicTacToe.PlayerMapperUnit.pas',
  TicTacToe.SquareContentMapperUnit in '..\..\TicTacToeLogic\src\Mappers\TicTacToe.SquareContentMapperUnit.pas',
  TicTacToe.WinnerMapperUnit in '..\..\TicTacToeLogic\src\Mappers\TicTacToe.WinnerMapperUnit.pas',
  TicTacToe.GameExceptionUnit in '..\..\TicTacToeLogic\src\Exceptions\TicTacToe.GameExceptionUnit.pas',
  TicTacToe.UIControlerExceptionUnit in '..\..\TicTacToeLogic\src\Exceptions\TicTacToe.UIControlerExceptionUnit.pas',
  TicTacToe.GenericAbstractUIControllerUnit in '..\..\TicTacToeLogic\src\TicTacToe.GenericAbstractUIControllerUnit.pas',
  TicTacToe.BoardUnit in '..\..\TicTacToeLogic\src\TicTacToe.BoardUnit.pas',
  TicTacToe.GameUnit in '..\..\TicTacToeLogic\src\TicTacToe.GameUnit.pas',
  TicTacToe.PlayerUnit in '..\..\TicTacToeLogic\src\Enumerations\TicTacToe.PlayerUnit.pas',
  TicTacToe.SquareContentUnit in '..\..\TicTacToeLogic\src\Enumerations\TicTacToe.SquareContentUnit.pas',
  TicTacToe.WinnerUnit in '..\..\TicTacToeLogic\src\Enumerations\TicTacToe.WinnerUnit.pas',
  TicTacToe.LineUnit in '..\..\TicTacToeLogic\src\Enumerations\TicTacToe.LineUnit.pas',
  TicTacToe.SquareUnit in '..\..\TicTacToeLogic\src\Enumerations\TicTacToe.SquareUnit.pas',
  EnumTypeInfoUnit in '..\..\..\..\bo.TypeInfo\EnumTypeInfoUnit.pas',
  TicTacToe.SquareArraysUnit in '..\..\TicTacToeLogic\src\Arrays\TicTacToe.SquareArraysUnit.pas',
  TicTacToe.LineArraysUnit in '..\..\TicTacToeLogic\src\Arrays\TicTacToe.LineArraysUnit.pas',
  TicTacToeLogic.BasePlayerUnit in '..\..\TicTacToeLogic\src\Players\TicTacToeLogic.BasePlayerUnit.pas',
  TicTacToeLogic.RandomPlayerUnit in '..\..\TicTacToeLogic\src\Players\TicTacToeLogic.RandomPlayerUnit.pas',
  TicTacToeLogic.SimplePlayerUnit in '..\..\TicTacToeLogic\src\Players\TicTacToeLogic.SimplePlayerUnit.pas',
  TicTacToe.VCLUIControllerUnit in '..\src\TicTacToe.VCLUIControllerUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TVclForm, VclForm);
  Application.Run;
end.
