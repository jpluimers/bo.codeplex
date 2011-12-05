program TicTacToeIOSProject;

uses
  cwstring, cthreads, FMX_Forms,
  EnumTypeInfoUnit in 'EnumTypeInfoUnit.pas',
  TicTacToe_BasePlayerUnit in 'TicTacToe_BasePlayerUnit.pas',
  TicTacToe_BoardUnit in 'TicTacToe_BoardUnit.pas',
  TicTacToe_GameExceptionUnit in 'TicTacToe_GameExceptionUnit.pas',
  TicTacToe_GameUnit in 'TicTacToe_GameUnit.pas',
  TicTacToe_IOSFormUnit in 'TicTacToe_IOSFormUnit.pas' {IOSForm},
  TicTacToe_IOSUIControllerUnit in 'TicTacToe_IOSUIControllerUnit.pas',
  TicTacToe_LineArraysUnit in 'TicTacToe_LineArraysUnit.pas',
  TicTacToe_LineUnit in 'TicTacToe_LineUnit.pas',
  TicTacToe_PlayerMapperUnit in 'TicTacToe_PlayerMapperUnit.pas',
  TicTacToe_PlayerUnit in 'TicTacToe_PlayerUnit.pas',
  TicTacToe_RandomPlayerUnit in 'TicTacToe_RandomPlayerUnit.pas',
  TicTacToe_SimplePlayerUnit in 'TicTacToe_SimplePlayerUnit.pas',
  TicTacToe_SquareArraysUnit in 'TicTacToe_SquareArraysUnit.pas',
  TicTacToe_SquareContentMapperUnit in 'TicTacToe_SquareContentMapperUnit.pas',
  TicTacToe_SquareContentUnit in 'TicTacToe_SquareContentUnit.pas',
  TicTacToe_SquareUnit in 'TicTacToe_SquareUnit.pas',
  TicTacToe_UIControlerExceptionUnit in 'TicTacToe_UIControlerExceptionUnit.pas',
  TicTacToe_WinnerMapperUnit in 'TicTacToe_WinnerMapperUnit.pas',
  TicTacToe_WinnerUnit in 'TicTacToe_WinnerUnit.pas';

{.$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TIOSForm, IOSForm);
  Application.Run;
end.
