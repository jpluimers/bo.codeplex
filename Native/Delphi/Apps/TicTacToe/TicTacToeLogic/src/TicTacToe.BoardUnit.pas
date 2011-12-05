unit TicTacToe.BoardUnit;

interface

uses
  TicTacToe.SquareUnit,
  TicTacToe.SquareContentUnit,
  TicTacToe.LineUnit,
  TicTacToe.LineArraysUnit,
  TicTacToe.SquareArraysUnit;

type
  TBoard = class(TObject)
  strict private
    Fcontent: TSquareContentArray;
    class var FsquareLines: TSquareLineArray;
  strict protected
    class function GetsquareLines: TSquareLineArray; static;
    function Getthis(square: TSquare): TSquareContent; virtual;
    procedure Setthis(square: TSquare; const Value: TSquareContent); virtual;
  public
    constructor Create; overload;
    // copy constructor
    constructor Create(const board: TBoard); overload;

    // indexed property, which is called an 'indexer' in C# speak
    // and requires the both 'this' and the array as part of the syntax
    property this[square: TSquare]: TSquareContent read Getthis write Setthis;

    function LineSum(const line: TLine; const content: TSquareContent): Integer; virtual;

    // nodig voor de Player die iets slimmer is
    class function LinesForSquare(const square: TSquare): TLineArray; virtual;

    function EmptySquares: TSquareArray; virtual;

    (* Square numers for board
     *
     *	0	1	2
     *	3	4	5
     *	6	7	8
     *
     * Line codes for board
     *				0					0
     *	.	.	.	1		0.	1.	2.	1
     *	.	.	.	2		3.	4.	5.	2
     *	.	.	.	3		6.	7.	8.	3
     *	4	5	6	7		4	5	6	7
     *
     * Powers of 2
     * 0	1		diagonal
     * 1	2		horizontal
     * 2	4		horizontal
     * 3	8		horizontal
     * 4	16		vertical
     * 5	32		vertical
     * 6	64		vertical
     * 7	128		diagonal
     *
     * This way, you can have an array of masks indicating which Line
     * (or Lines)a square of the board is a member of.
     * The centre square 4 is member of 4 different lines.
     * The corner squares 0, 2, 6 and 8 each are member of 3 different lines.
     * The side squares 1, 3, 5 and 7 each are member of 2 different lines.
     *
     * Square	Lines
     * 0			1	4	7
     * 1			1	5
     * 2		0	1	6
     * 3			2	4
     * 4		0	2	5	7
     * 5			2	6
     * 6		0	3	4
     * 7			3	5
     * 8			3	6	7
     *
            private int[,] rowMask =
            {
                {	2 | 128	| 16,	2 | 32			,	1 | 2 | 64	},
                {	4 | 16		,	1 | 4 | 32 | 128,	4 | 64		},
                {	1 | 8 | 16	,	8 | 32			,	8 | 64 | 128}
            };
     *)

  strict protected
    (* Content of the board. We store it in a one-dimensional array
     * because a two-dimensional array makes the foreach constructions
     * much more difficult to program.
     * For clarity though, we formulate the constant so it looks like
     * a two-dimensional grid.
     *)
    property content: TSquareContentArray read Fcontent;

    (* Magic Square
     *
     * This square has a sum of 15 for all its diagonals and orthogonals.
     * It aids in calculating who has a 3-in-a-row since for each such
     * row, the total will be 15.
     *
     * It has the same structure as the Content array, so it is easier
     * to use in the LineSum method.
     *)
    const magicSquare3by3: TMagicSquare3by3 =
    (
      4, 9, 2,
      3, 5, 7,
      8, 1, 6
    );
    (* For the determining a winner by getting the first 3-in-a-row,
     * you will need an array of Lines indicating which
     * squares are part of which Line.
     *
     * We use a 'jagged' (or 'ragged') array here,
     * because it is easier to use in the LineSum method
     *)
    const lineSquares: TLineSquareArray3  =
    (
    // Square1        Square2        Square3            Line
      (TSquare.Two  , TSquare.Four , TSquare.Six  ), // Zero
      (TSquare.Zero , TSquare.One  , TSquare.Two  ), // One
      (TSquare.Three, TSquare.Four , TSquare.Five ), // Two
      (TSquare.Six  , TSquare.Seven, TSquare.Eight), // Three
      (TSquare.Zero , TSquare.Three, TSquare.Six  ), // Four
      (TSquare.One  , TSquare.Four , TSquare.Seven), // Five
      (TSquare.Two  , TSquare.Five , TSquare.Eight), // Six
      (TSquare.Zero , TSquare.Four , TSquare.Eight)  // Seven
    );

    (* For determining the possible wins for a square,
     * we have a table that links the square to all the lines
     * that it is part of
     *
     * Square	Lines
     * 0			1	4	7
     * 1			1	5
     * 2		0	1	6
     * 3			2	4
     * 4		0	2	5	7
     * 5			2	6
     * 6		0	3	4
     * 7			3	5
     * 8			3	6	7
     *
     *)
    class property squareLines: TSquareLineArray read GetsquareLines;
  end;

implementation

constructor TBoard.Create(const board: TBoard);
begin
  Create();
  Self.Fcontent := board.content; // copy of the Content
end;

constructor TBoard.Create;
const
  emptyContent: TSquareContentArray =
  (
    TSquareContent.None, TSquareContent.None, TSquareContent.None,
    TSquareContent.None, TSquareContent.None, TSquareContent.None,
    TSquareContent.None, TSquareContent.None, TSquareContent.None
  );
begin
  inherited Create();
  Self.FContent := emptyContent;
end;

function TBoard.EmptySquares: TSquareArray;
var
  index: Integer;
  length: Integer;
  square: TSquare;
begin
  length := 0;
  for square := Low(TSquare) to High(TSquare) do
  begin
    if (this[square] = TSquareContent.None) then
      length := length + 1;
  end;
  SetLength(Result, length);
  index := 0;
  for square := Low(TSquare) to High(TSquare) do
  begin
    if (this[square] = TSquareContent.None) then
    begin
      result[index] := square;
      index := index + 1;
    end;
  end;
end;

class function TBoard.GetsquareLines: TSquareLineArray;
begin
  if Length(FsquareLines[TSquare.Zero]) = 0 then // not initialized
  begin
    //                                               Line0       Line1        Line2        Line3           Square
    FsquareLines[TSquare.Zero]  := TLineArray.Create(            TLine.One  , TLine.Four , TLine.Seven); // Zero
    FsquareLines[TSquare.One]   := TLineArray.Create(            TLine.One  , TLine.Five              ); // One
    FsquareLines[TSquare.Two]   := TLineArray.Create(TLine.Zero, TLine.One  , TLine.Six               ); // Two
    FsquareLines[TSquare.Three] := TLineArray.Create(            TLine.Two  , TLine.Four              ); // Three
    FsquareLines[TSquare.Four]  := TLineArray.Create(TLine.Zero, TLine.Two  , TLine.Five , TLine.Seven); // Four
    FsquareLines[TSquare.Five]  := TLineArray.Create(            TLine.Two  , TLine.Six               ); // Five
    FsquareLines[TSquare.Six]   := TLineArray.Create(TLine.Zero, TLine.Three, TLine.Four              ); // Six
    FsquareLines[TSquare.Seven] := TLineArray.Create(            TLine.Three, TLine.Five              ); // Seven
    FsquareLines[TSquare.Eight] := TLineArray.Create(            TLine.Three, TLine.Six  , TLine.Seven); // Eight
  end;
  Result := FsquareLines;
end;

function TBoard.Getthis(square: TSquare): TSquareContent;
begin
  Result := content[square];
end;

class function TBoard.LinesForSquare(const square: TSquare): TLineArray;
begin
  Result := squareLines[square]; // copy
end;

function TBoard.LineSum(const line: TLine; const content: TSquareContent): Integer;
var
  currentLineSquares: TSquareArray3;
  square: TSquare;
  sum: Integer;
begin
  sum := 0;
  currentLineSquares := lineSquares[line];
  for square in currentLineSquares do
  begin
    if (this[square] = content) then
      sum := sum + magicSquare3by3[square];
  end;
  Result := sum;
end;

procedure TBoard.Setthis(square: TSquare; const Value: TSquareContent);
begin
  Fcontent[square] := value;
end;

end.
