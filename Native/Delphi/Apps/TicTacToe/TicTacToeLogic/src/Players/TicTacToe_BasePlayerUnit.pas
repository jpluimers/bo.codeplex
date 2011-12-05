unit TicTacToe_BasePlayerUnit;

interface

uses
  TicTacToe_GameUnit;

type
  TBasePlayer = class abstract(TObject)
  public
    function PlayBestMove(const game: TGame): Boolean; virtual; abstract;
  end;

implementation

end.
