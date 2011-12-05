unit TicTacToe_LineArraysUnit;

interface

uses
  TicTacToe_LineUnit,
  TicTacToe_SquareUnit;

type
  TLineArray = array of TLine;
  TLineArray3 = array[0..2] of TLine;
  TSquareLineArray = array[TSquare] of TLineArray;

implementation

end.
