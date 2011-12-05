unit TicTacToeLogic.RandomPlayerUnit;

interface

uses
  TicTacToeLogic.BasePlayerUnit,
  TicTacToe.GameUnit;

type
  TRandomPlayer = class(TBasePlayer)
  public
    class constructor Create;
    function PlayBestMove(const game: TGame): Boolean; override;
  end;

implementation

uses
  TicTacToe.SquareArraysUnit,
  TicTacToe.SquareUnit;

class constructor TRandomPlayer.Create;
begin
  Randomize;
end;

function TRandomPlayer.PlayBestMove(const game: TGame): Boolean;
var
  emptySquares: TSquareArray;
  emptySquaresLength: Integer;
  square: TSquare;
  value: Integer;
begin
  if (game.Finished()) then
    Exit(False);

  emptySquares := game.EmptySquares();
  emptySquaresLength := Length(emptySquares);
  if (emptySquaresLength = 0) then // no empty squares left; should not occur, but test anyway
    Exit(False);

  while (true) do
  begin
    value := Random(emptySquaresLength);
    square := emptySquares[value];
    game.Play(square);
    Exit(True);
  end;

  Exit(False);
end;

end.
