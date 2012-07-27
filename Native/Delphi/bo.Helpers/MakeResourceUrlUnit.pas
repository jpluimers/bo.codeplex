// adapted from http://www.delphidabbler.com/articles?article=10

unit MakeResourceUrlUnit;

interface

const
  SLocalResourceUrlPrefix = 'res://';

function MakeResourceURL(const ModuleName: string; const ResName: PChar; const ResType: PChar = nil): string; overload;

function MakeResourceURL(const Module: HMODULE; const ResName: PChar; const ResType: PChar = nil): string; overload;

implementation

uses
  Windows,
  SysUtils;

function FormatResNameOrType(ResID: PChar): string;
begin
  if HiWord(LongWord(ResID)) = 0 then
    // high word = 0 => numeric resource id
    // numeric value is stored in low word
    Result := Format('#%d', [LoWord(LongWord(ResID))])
  else
    // high word <> 0 => string value
    // PChar is implicitly converted to string
    Result := ResID;
end;

{$if not Declared(CharInSet)}
type
  TCharSet = set of Char;
function CharInSet(const Ch: Char; const Chars: TCharSet): Boolean;
begin
  Result := Ch in Chars;
end;
{$ifend}

function URLEncode(const S: string): string;
var
  Idx: Integer; // loops thru characters in string
begin
  Result := '';
  for Idx := 1 to Length(S) do
  begin
    if CharInSet(S[Idx], ['A'..'Z', 'a'..'z', '0'..'9', '-', '_', '.']) then
        Result := Result + S[Idx]
    else
      Result := Result + '%' + IntToHex(Ord(S[Idx]), 2);
  end;
end;

function MakeResourceURL(const ModuleName: string; const ResName: PChar; const ResType: PChar = nil): string; overload;
begin
  Assert(ModuleName <> '');
  Assert(Assigned(ResName));
  Result := SLocalResourceUrlPrefix + URLEncode(ModuleName);
  if Assigned(ResType) then
    Result := Result + '/' + URLEncode(FormatResNameOrType(ResType));
  Result := Result + '/' + URLEncode(FormatResNameOrType(ResName));
end;

function MakeResourceURL(const Module: HMODULE; const ResName: PChar; const ResType: PChar = nil): string;
begin
  Result := MakeResourceURL(GetModuleName(Module), ResName, ResType);
end;

end.
