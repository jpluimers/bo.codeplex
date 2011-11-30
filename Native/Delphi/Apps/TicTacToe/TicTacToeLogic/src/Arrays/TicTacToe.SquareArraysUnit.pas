unit TicTacToe.SquareArraysUnit;

interface

uses
  TicTacToe.SquareUnit,
  TicTacToe.LineUnit;

type
  TSquareArray = array of TSquare;
  TSquareArray3 = array[TSquareIndex] of TSquare;
  TLineSquareArray3 = array[TLine] of TSquareArray3;
  TMagicSquare3by3 = array[TSquare] of Integer; // index it by TSquare as that is easier in our code; array[TSquareIndex] of array[TSquareIndex] of Integer;

implementation

end.
