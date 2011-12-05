program TicTacToeFireMonkeyProject;

uses
  FMX.Forms,
  TicTacToe.FireMonkeyFormUnit in '..\src\TicTacToe.FireMonkeyFormUnit.pas' {FireMonkeyForm},
  TicTacToe.FireMonkeyUIControllerUnit in '..\src\TicTacToe.FireMonkeyUIControllerUnit.pas',
  TicTacToe.GenericAbstractUIControllerUnit in '..\..\TicTacToeLogic\src\TicTacToe.GenericAbstractUIControllerUnit.pas',
  TicTacToe.GameUnit in '..\..\TicTacToeLogic\src\TicTacToe.GameUnit.pas',
  TicTacToe.PlayerUnit in '..\..\TicTacToeLogic\src\Enumerations\TicTacToe.PlayerUnit.pas',
  TicTacToe.BoardUnit in '..\..\TicTacToeLogic\src\TicTacToe.BoardUnit.pas',
  TicTacToe.SquareUnit in '..\..\TicTacToeLogic\src\Enumerations\TicTacToe.SquareUnit.pas',
  TicTacToe.SquareContentUnit in '..\..\TicTacToeLogic\src\Enumerations\TicTacToe.SquareContentUnit.pas',
  TicTacToe.LineUnit in '..\..\TicTacToeLogic\src\Enumerations\TicTacToe.LineUnit.pas',
  TicTacToe.LineArraysUnit in '..\..\TicTacToeLogic\src\Arrays\TicTacToe.LineArraysUnit.pas',
  TicTacToe.SquareArraysUnit in '..\..\TicTacToeLogic\src\Arrays\TicTacToe.SquareArraysUnit.pas',
  TicTacToe.WinnerUnit in '..\..\TicTacToeLogic\src\Enumerations\TicTacToe.WinnerUnit.pas',
  TicTacToe.GameExceptionUnit in '..\..\TicTacToeLogic\src\Exceptions\TicTacToe.GameExceptionUnit.pas',
  TicTacToeLogic.BasePlayerUnit in '..\..\TicTacToeLogic\src\Players\TicTacToeLogic.BasePlayerUnit.pas',
  TicTacToe.UIControlerExceptionUnit in '..\..\TicTacToeLogic\src\Exceptions\TicTacToe.UIControlerExceptionUnit.pas',
  EnumTypeInfoUnit in '..\..\..\..\bo.TypeInfo\EnumTypeInfoUnit.pas',
  TicTacToe.SquareContentMapperUnit in '..\..\TicTacToeLogic\src\Mappers\TicTacToe.SquareContentMapperUnit.pas',
  TicTacToe.PlayerMapperUnit in '..\..\TicTacToeLogic\src\Mappers\TicTacToe.PlayerMapperUnit.pas',
  TicTacToeLogic.SimplePlayerUnit in '..\..\TicTacToeLogic\src\Players\TicTacToeLogic.SimplePlayerUnit.pas',
  TicTacToe.WinnerMapperUnit in '..\..\TicTacToeLogic\src\Mappers\TicTacToe.WinnerMapperUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFireMonkeyForm, FireMonkeyForm);
  Application.Run;
end.
