unit TicTacToe_PlayerMapperUnit;

interface

uses
  TicTacToe_PlayerUnit;

type
  TPlayerMapper = class(TObject)
  public
    const Cross = 'X';
    const Nought = 'O';
    class function ToPlayer(const text: string): TPlayer;
    class function ToText(const player: TPlayer): string;
  end;

implementation

uses
  TicTacToe_GameExceptionUnit;

class function TPlayerMapper.ToPlayer(const text: string): TPlayer;
begin
  if text = Nought then
    Result := TPlayer.Nought
  else if text = Cross then
    Result := TPlayer.Cross
  else
    raise EGameException.CreateFmt('Invalid player text value "%s", can only be "%s" or "%s"', [text, Cross, Nought]);
end;

class function TPlayerMapper.ToText(const player: TPlayer): string;
begin
  if player = TPlayer.Cross then
    Result := Cross
  else
    Result := Nought;
end;

end.
