program LanguageFeaturesProject;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  UnitA in '..\src\UnitA.pas',
  UnitB in '..\src\UnitB.pas',
  UnitC in '..\src\UnitC.pas',
  System.Classes;

var
  message: Integer; // reserved words cannot be reused, but language directives can

  Strings: TStrings;
  Line: string;
  Storage: TObject;

begin
  try
    if message = 1 then
    begin
      message := 2;
      message := 3;
    end;

    Strings := TStringList.Create();
    try
      Strings.Add('foo');
      Strings.Add('bar');
      Strings.Add('snafu');

      for Line in Strings do
      begin
        Writeln(Line);
      end;
    finally
      Strings.Free;
    end;
    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
