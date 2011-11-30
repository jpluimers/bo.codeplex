unit TicTacToe.LineArraysUnit;

interface

uses
  TicTacToe.LineUnit,
  TicTacToe.SquareUnit;

type
  TLineArray = array of TLine;
  TLineArray3 = array[0..2] of TLine;
  TSquareLineArray = array[TSquare] of TLineArray;

implementation

end.
