unit TicTacToeLogic.SimplePlayerUnit;

interface

uses
  TicTacToeLogic.BasePlayerUnit, TicTacToe.GameUnit,
  TicTacToe.SquareContentUnit;


type
  TSimplePlayer = class(TBasePlayer)
  strict private
    function TryPlayThreeInARowFor(const content: TSquareContent; const game: TGame): Boolean; virtual;
  public
    function PlayBestMove(const game: TGame): Boolean; override;
  end;

implementation

uses
  TicTacToe.SquareArraysUnit,
  TicTacToe.BoardUnit,
  TicTacToe.LineArraysUnit,
  TicTacToe.SquareUnit,
  TicTacToe.LineUnit;

function TSimplePlayer.TryPlayThreeInARowFor(const content: TSquareContent; const game: TGame): Boolean;
var
  emptySquares: TSquareArray;
  emptySquaresLength: Integer;
  line: TLine;
  linesForSquare: TLineArray;
  square: TSquare;
  tryBoard: TBoard;
begin
  emptySquares := game.EmptySquares();

  emptySquaresLength := Length(emptySquares);

  if (emptySquaresLength = 0) then // no empty squares left; should not occur, but test anyway
    Exit(False);

  for square in emptySquares do
  begin
    tryBoard := game.BoardCopy; // gets a copy of the game board
    try
      tryBoard.this[square] := content;
      linesForSquare := TBoard.LinesForSquare(square); // get a copy
      for line in linesForSquare do
      begin
        if (tryBoard.LineSum(line, content) = Game.WinningLineSum) then
        begin
          game.Play(square);
          Exit(True);
        end;
      end;
    finally
      tryBoard.Free;
    end;
  end;
  Exit(False);
end;

function TSimplePlayer.PlayBestMove(const game: TGame): Boolean;
var
  emptySquares: TSquareArray;
  emptySquaresLength: Integer;
  linesForPrioritySquareLength: Integer;
  linesForSquareLength: Integer;
  prioritySquare: TSquare;
  square: TSquare;
begin
  // strategy 0: no possible moves
  if (game.Finished()) then
    Exit(False);

  // strategy 1: play a winning move
  // find a line that is winning for the player

  // optimization:
  // only needed when you have played 2 times (and the opponent 1 or 2 times)
  // so only if there are 6 or less empty Squares, you need to check for this.
  if (TryPlayThreeInARowFor(TGame.PlayerToContent(game.CurrentPlayer), game)) then
    Exit(True);

  // strategy 2: play a blocking move
  // find a line that is winning for the opponent
  if (TryPlayThreeInARowFor(TGame.PlayerToContent(game.CurrentOpponent), game)) then
    Exit(True);

  // strategy 3: try to move on a priority square
  // we base the priority on the number of lines that each square contains
  emptySquares := game.EmptySquares();
  emptySquaresLength := Length(emptySquares);

  if (emptySquaresLength = 0) then // no empty squares left; should not occur, but test anyway
    Exit(False);

  prioritySquare := emptySquares[0];
  linesForPrioritySquareLength := Length(TBoard.LinesForSquare(prioritySquare));
  for square in emptySquares do
  begin
    linesForSquareLength := Length(TBoard.LinesForSquare(square));
    if (linesForSquareLength > linesForPrioritySquareLength) then
    begin
      prioritySquare := square;
      linesForPrioritySquareLength := linesForSquareLength;
    end;
  end;
  game.Play(prioritySquare);
  Exit(True);

  // strategy 4: random move
  // not needed any more because we can always find a priority square
  //TicTacToePlayer randomPlayer := new RandomTicTacToePlayer();
  //randomPlayer.PlayBestMove(game);
end;

end.
