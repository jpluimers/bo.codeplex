unit TicTacToe.GameUnit;

interface

uses
  TicTacToe.PlayerUnit,
  TicTacToe.BoardUnit,
  TicTacToe.SquareUnit,
  TicTacToe.SquareContentUnit,
  TicTacToe.SquareArraysUnit,
  TicTacToe.WinnerUnit;

type
  TGame = class(TObject)
  strict private
    FcurrentPlayer: TPlayer;
    board: TBoard;
    procedure clear; virtual;
  strict protected
    function Getthis(square: TSquare): TSquareContent; virtual;
  public
    procedure Start(const newPlayer: TPlayer); virtual;
    // needed for smarter Player algorithms that want to expiriment with boards
    function BoardCopy: TBoard; virtual;
    // readonly indexer - write is done through the interface methods
    property this[square: TSquare]: TSquareContent read Getthis;
    function EmptySquares: TSquareArray; virtual;
    procedure Play(const square: TSquare); virtual;
    function CurrentOpponent: TPlayer; virtual;
    function CurrentPlayer: TPlayer; virtual;
    const WinningLineSum = 15;
    constructor Create;
    function Winner: TWinner; virtual;
    function Finished: Boolean; virtual;
    function PlayerToContent(const player: TPlayer): TSquareContent; virtual;
  end;

implementation

uses
  TicTacToe.GameExceptionUnit, TicTacToe.LineUnit;

constructor TGame.Create;
begin
  inherited Create();
  board := TBoard.Create();
end;

function TGame.BoardCopy: TBoard;
begin
  Result := TBoard.Create(board);
end;

procedure TGame.clear;
var
  square: TSquare;
begin
  for square := Low(TSquare) to High(TSquare) do
    board.this[square] := TSquareContent.None;
end;

function TGame.CurrentOpponent: TPlayer;
begin
  if currentPlayer = TPlayer.Cross then
    Result := TPlayer.Nought
  else
    Result := TPlayer.Cross;
end;

function TGame.CurrentPlayer: TPlayer;
begin
  Result := FcurrentPlayer;
end;

function TGame.EmptySquares: TSquareArray;
begin
  Result := board.EmptySquares();
end;

function TGame.Finished: Boolean;
begin
  Result := Winner() <> TWinner.None;
end;

function TGame.Getthis(square: TSquare): TSquareContent;
begin
  Result := board.this[square];
end;

procedure TGame.Play(const square: TSquare);
begin
  if (Finished()) then
    raise EGameException.Create('You can only play if a game is not finished!')
  else
  begin
    if (board.this[square] = TSquareContent.None) then
    begin
      board.this[square] := PlayerToContent(currentPlayer);
      FcurrentPlayer := CurrentOpponent;
    end
    else
      raise EGameException.Create('you can only play on empty squares!');
  end;
end;

function TGame.PlayerToContent(const player: TPlayer): TSquareContent;
begin
  if (player = TPlayer.Cross) then
    Result := TSquareContent.Cross
  else
    Result := TSquareContent.Nought;
end;

procedure TGame.Start(const newPlayer: TPlayer);
begin
  clear();
  FcurrentPlayer := newPlayer;
end;

function TGame.Winner: TWinner;
var
  line: TLine;
  player: TPlayer;
  square: TSquare;
begin
  // step1: check if there is a real winner
  for player := Low(TPlayer) to High(TPlayer) do
  begin
    for line := Low(TLine) to High(TLine) do
    begin
      if (board.LineSum(line, PlayerToContent(player)) = TGame.WinningLineSum) then
      begin
        if (player = TPlayer.Cross) then
          Exit(TWinner.Cross)
        else
          Exit(TWinner.Nought);
      end;
    end;
  end;
  // step2: check if there are squares to play
  for square := Low(TSquare) to High(TSquare) do
  begin
    if (this[square] = TSquareContent.None) then
      Exit(TWinner.None);
  end;
  // step3: no real winner, and no squares to play: draw
  Result := TWinner.Draw;
end;

end.
