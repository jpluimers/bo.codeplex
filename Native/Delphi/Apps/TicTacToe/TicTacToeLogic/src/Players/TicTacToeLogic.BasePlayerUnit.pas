unit TicTacToeLogic.BasePlayerUnit;

interface

uses
  TicTacToe.GameUnit;

type
  TBasePlayer = class abstract(TObject)
  public
    function PlayBestMove(const game: TGame): Boolean; virtual; abstract;
  end;

implementation

end.
