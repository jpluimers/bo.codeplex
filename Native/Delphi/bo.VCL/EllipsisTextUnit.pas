unit EllipsisTextUnit;

interface

uses
  Vcl.StdCtrls;

function EllipsisText(const Value: string; const MaxLength: Integer; const FWordWrap: Boolean = True; const FEllipsisPosition: TEllipsisPosition =
    epWordEllipsis): string;

implementation

uses
  System.Variants,
  System.SysUtils,
  StringUtilsUnit;

function EllipsisText(const Value: string; const MaxLength: Integer; const FWordWrap: Boolean = True; const FEllipsisPosition: TEllipsisPosition =
    epWordEllipsis): string;
// code partially borrowed from TCustomLabel.DoDrawText
const
  EllipsisStr = '...';
  EllipsisCharacterWidthDivisor = 2; // count a '.' as half a character for display
var
  NettoMaxLength: Integer;
  Text: string;
  DelimitedText: string;
  DelimiterPosition: Integer;
begin
  Result := NullAsStringValue;
  Text := Value;
  if (FEllipsisPosition <> epNone) then
  begin
    if FWordWrap and (FEllipsisPosition in [epEndEllipsis, epWordEllipsis]) then
    begin
      NettoMaxLength := MaxLength - Length(EllipsisStr) div EllipsisCharacterWidthDivisor;
      repeat
        if (Length(Text) > NettoMaxLength) then
        begin
          DelimiterPosition := LastDelimiter(' '+sTab+sLineBreak, Text);
          if DelimiterPosition = 0 then
            DelimiterPosition := Length(Text);
          Dec(DelimiterPosition);
{$IF NOT DEFINED(CLR)}
          if ByteType(Text, DelimiterPosition) = mbLeadByte then
            Dec(DelimiterPosition);
{$IFEND}
          Text := Copy(Text, 1, DelimiterPosition);
          DelimitedText := Text + EllipsisStr;
          if Text = NullAsStringValue then
            Break;
        end
        else
          Break;
      until False;
    end;
    if Text <> NullAsStringValue then
      Result := DelimitedText;
  end;
end;

end.
