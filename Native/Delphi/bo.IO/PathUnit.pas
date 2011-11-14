unit PathUnit;

interface

uses
  System.Classes;

{ from .NET 4.0 System.IO.Path;
todo: extend with http://stackoverflow.com/questions/62771/how-check-if-given-string-is-legal-allowed-file-name-under-windows }

type
  TPath = record
  private
    class var FInvalidPathChars: string;
    class var FRealInvalidPathChars: string;
    class var FInvalidFileNameChars: string;
    class procedure Initialize; static;
  public
    const MaxPath = 260;
    class function IsInvalidFileNameChar(const Ch: Char): Boolean; static;
    class function IsInvalidPathChar(const Ch: Char): Boolean; static;
    class property InvalidFileNameChars: string read FInvalidFileNameChars;
    class property InvalidPathChars: string read FRealInvalidPathChars;
    class procedure GetFilenames(const Dest: TStrings; const Path: string; const Mask: string = '*.*'); static;
    class function StripInvalidFileNameChars(const FileName: string): string; static;
    class function StripInvalidPathChars(const Path: string): string; static;
  end;

implementation

uses
  SysUtils;

class procedure TPath.Initialize;
var
  Ch: Char;
begin
  FInvalidPathChars := '';
  for Ch := #0 to #31 do
    FInvalidPathChars := FInvalidPathChars + Ch;
  FInvalidPathChars := FInvalidPathChars + '"<>|';
  FRealInvalidPathChars := FInvalidPathChars;
  FInvalidFileNameChars := FInvalidPathChars + ':*?\/';
(*
static Path()
{
    DirectorySeparatorChar = '\\';
    AltDirectorySeparatorChar = '/';
    VolumeSeparatorChar = ':';
    InvalidPathChars = new char[] {
        '"', '<', '>', '|', '\0', '\x0001', '\x0002', '\x0003', '\x0004', '\x0005', '\x0006', '\a', '\b', '\t', '\n', '\v',
        '\f', '\r', '\x000e', '\x000f', '\x0010', '\x0011', '\x0012', '\x0013', '\x0014', '\x0015', '\x0016', '\x0017', '\x0018', '\x0019', '\x001a', '\x001b',
        '\x001c', '\x001d', '\x001e', '\x001f'
     };
    RealInvalidPathChars = new char[] {
        '"', '<', '>', '|', '\0', '\x0001', '\x0002', '\x0003', '\x0004', '\x0005', '\x0006', '\a', '\b', '\t', '\n', '\v',
        '\f', '\r', '\x000e', '\x000f', '\x0010', '\x0011', '\x0012', '\x0013', '\x0014', '\x0015', '\x0016', '\x0017', '\x0018', '\x0019', '\x001a', '\x001b',
        '\x001c', '\x001d', '\x001e', '\x001f'
     };
    InvalidFileNameChars = new char[] {
        '"', '<', '>', '|', '\0', '\x0001', '\x0002', '\x0003', '\x0004', '\x0005', '\x0006', '\a', '\b', '\t', '\n', '\v',
        '\f', '\r', '\x000e', '\x000f', '\x0010', '\x0011', '\x0012', '\x0013', '\x0014', '\x0015', '\x0016', '\x0017', '\x0018', '\x0019', '\x001a', '\x001b',
        '\x001c', '\x001d', '\x001e', '\x001f', ':', '*', '?', '\\', '/'
     };
    PathSeparator = ';';
    MaxPath = 260;
}
*)
end;

class function TPath.IsInvalidFileNameChar(const Ch: Char): Boolean;
begin
   Result := Pos(Ch, InvalidFileNameChars) <> 0;
end;

class function TPath.IsInvalidPathChar(const Ch: Char): Boolean;
begin
   Result := Pos(Ch, InvalidPathChars) <> 0;
end;

class function TPath.StripInvalidFileNameChars(const FileName: string): string;
var
  Index: Integer;
begin
   Result := FileName;
   for Index := Length(Result) downto 1 do
     if IsInvalidFileNameChar(Result[Index]) then
       Delete(Result, Index, 1);
end;

class function TPath.StripInvalidPathChars(const Path: string): string;
var
  Index: Integer;
begin
   Result := Path;
   for Index := Length(Result) downto 1 do
     if IsInvalidPathChar(Result[Index]) then
       Delete(Result, Index, 1);
end;

class procedure TPath.GetFilenames(const Dest: TStrings; const Path: string; const Mask: string = '*.*');
var
  FindFirstResult: Integer;
  SearchRec: TSearchRec;
begin
  FindFirstResult := FindFirst(Path + Mask, faAnyFile, SearchRec);
  try
    if FindFirstResult = 0 then
    repeat
      Dest.Add(SearchRec.Name);
    until FindNext(SearchRec) <> 0;
  finally
    FindClose(SearchRec);
  end;
end;

initialization
  TPath.Initialize();
end.
