program TicTacToeVclProject;

uses
  Vcl.Forms,
  TicTacToe_VclFormUnit in '..\src\TicTacToe_VclFormUnit.pas' {VclForm},
  EnumTypeInfoUnit in '..\..\..\..\bo.TypeInfo\EnumTypeInfoUnit.pas',
  TicTacToe_VCLUIControllerUnit in '..\src\TicTacToe_VCLUIControllerUnit.pas',
  TicTacToe_GenericAbstractUIControllerUnit in '..\..\TicTacToeLogic\src\TicTacToe_GenericAbstractUIControllerUnit.pas',
  TicTacToe_GameUnit in '..\..\TicTacToeLogic\src\TicTacToe_GameUnit.pas',
  TicTacToe_PlayerUnit in '..\..\TicTacToeLogic\src\Enumerations\TicTacToe_PlayerUnit.pas',
  TicTacToe_SquareContentUnit in '..\..\TicTacToeLogic\src\Enumerations\TicTacToe_SquareContentUnit.pas',
  TicTacToe_SquareUnit in '..\..\TicTacToeLogic\src\Enumerations\TicTacToe_SquareUnit.pas',
  TicTacToe_WinnerUnit in '..\..\TicTacToeLogic\src\Enumerations\TicTacToe_WinnerUnit.pas',
  TicTacToe_LineUnit in '..\..\TicTacToeLogic\src\Enumerations\TicTacToe_LineUnit.pas',
  TicTacToe_BoardUnit in '..\..\TicTacToeLogic\src\TicTacToe_BoardUnit.pas',
  TicTacToe_SquareArraysUnit in '..\..\TicTacToeLogic\src\Arrays\TicTacToe_SquareArraysUnit.pas',
  TicTacToe_LineArraysUnit in '..\..\TicTacToeLogic\src\Arrays\TicTacToe_LineArraysUnit.pas',
  TicTacToe_UIControlerExceptionUnit in '..\..\TicTacToeLogic\src\Exceptions\TicTacToe_UIControlerExceptionUnit.pas',
  TicTacToe_GameExceptionUnit in '..\..\TicTacToeLogic\src\Exceptions\TicTacToe_GameExceptionUnit.pas',
  TicTacToe_SimplePlayerUnit in '..\..\TicTacToeLogic\src\Players\TicTacToe_SimplePlayerUnit.pas',
  TicTacToe_RandomPlayerUnit in '..\..\TicTacToeLogic\src\Players\TicTacToe_RandomPlayerUnit.pas',
  TicTacToe_BasePlayerUnit in '..\..\TicTacToeLogic\src\Players\TicTacToe_BasePlayerUnit.pas',
  TicTacToe_WinnerMapperUnit in '..\..\TicTacToeLogic\src\Mappers\TicTacToe_WinnerMapperUnit.pas',
  TicTacToe_SquareContentMapperUnit in '..\..\TicTacToeLogic\src\Mappers\TicTacToe_SquareContentMapperUnit.pas',
  TicTacToe_PlayerMapperUnit in '..\..\TicTacToeLogic\src\Mappers\TicTacToe_PlayerMapperUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TVclForm, VclForm);
  Application.Run;
end.
