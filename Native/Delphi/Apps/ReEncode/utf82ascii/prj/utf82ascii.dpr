program utf82ascii;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Utf8ToAsciiMainUnit in '..\src\Utf8ToAsciiMainUnit.pas',
  Utf8ToDefaultProcessorUnit in '..\..\..\..\bo.Text\Utf8ToDefaultProcessorUnit.pas',
  DefaultToDefaultProcessorUnit in '..\..\..\..\bo.Text\DefaultToDefaultProcessorUnit.pas',
  Utf8ToAsciiProcessorUnit in '..\..\..\..\bo.Text\Utf8ToAsciiProcessorUnit.pas',
  Iso8859_12Utf8ProcessorUnit in '..\..\..\..\bo.Text\Iso8859_12Utf8ProcessorUnit.pas',
  DefaultToUtf8ProcessorUnit in '..\..\..\..\bo.Text\DefaultToUtf8ProcessorUnit.pas',
  ConsoleFilesProcessorUnit in '..\..\..\..\bo.IO\ConsoleFilesProcessorUnit.pas';

begin
  try
    TUtf82AsciiMain.Main;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
