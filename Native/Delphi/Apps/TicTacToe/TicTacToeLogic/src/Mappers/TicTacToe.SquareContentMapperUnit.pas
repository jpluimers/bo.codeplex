unit TicTacToe.SquareContentMapperUnit;

interface

uses
  TicTacToe.SquareContentUnit;

type
  TSquareContentMapper = class(TObject)
  public
    const None = '-';
    class function ToContent(const text: string): TSquareContent;
    class function ToText(const content: TSquareContent): string;
  end;

implementation

uses
  TicTacToe.PlayerMapperUnit;

class function TSquareContentMapper.ToContent(const text: string): TSquareContent;
begin
  if text = TPlayerMapper.Nought then
    Result := TSquareContent.Nought
  else if text = TPlayerMapper.Cross then
    Result := TSquareContent.Cross
  else
    Result := TSquareContent.None;
end;

class function TSquareContentMapper.ToText(const content: TSquareContent): string;
begin
  case content of
    TSquareContent.Nought:
      Result := TPlayerMapper.Nought;
    TSquareContent.Cross:
      Result := TPlayerMapper.Cross;
    else
      Result := None;
  end;
end;

end.
