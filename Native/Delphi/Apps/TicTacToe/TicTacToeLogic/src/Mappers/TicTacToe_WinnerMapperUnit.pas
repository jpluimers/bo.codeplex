unit TicTacToe_WinnerMapperUnit;

interface

uses
  TicTacToe_WinnerUnit;

type
  TWinnerMapper = class(TObject)
  public
    class function ToText(const winner: TWinner): string;
    class function WinnerText(const winner: TWinner): string;
  end;

implementation

uses
  TicTacToe_PlayerMapperUnit,
  Variants,
  SysUtils,
  EnumTypeInfoUnit;

class function TWinnerMapper.ToText(const winner: TWinner): string;
begin
  case winner of
    TWinner.Nought:
      Result := TPlayerMapper.Nought;
    TWinner.Cross:
      Result := TPlayerMapper.Cross;
    else
      Result := NullAsStringValue;
  end;
end;

class function TWinnerMapper.WinnerText(const winner: TWinner): string;
var
  WinnerEnumerationString: string;
begin
  WinnerEnumerationString := EnumerationAsString(Ord(winner), '', TypeInfo(TWinner)); //TODO ##jpl: convert through TValue
  case winner of
    TWinner.Nought,
    TWinner.Cross:
      Result := Format('%s wins, congrats %s!', [WinnerEnumerationString, ToText(winner)]);
    TWinner.Draw:
      Result := Format('%s - nobody wins', [WinnerEnumerationString]);
    else
      Result := NullAsStringValue;
  end;
end;

end.
