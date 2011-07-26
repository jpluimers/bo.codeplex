program Iso8859_12Utf8;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Iso8859_12Utf8MainUnit in '..\src\Iso8859_12Utf8MainUnit.pas',
  Utf8ToDefaultProcessorUnit in '..\..\..\..\bo.Text\Utf8ToDefaultProcessorUnit.pas',
  DefaultToDefaultProcessorUnit in '..\..\..\..\bo.Text\DefaultToDefaultProcessorUnit.pas',
  Utf8ToAsciiProcessorUnit in '..\..\..\..\bo.Text\Utf8ToAsciiProcessorUnit.pas',
  Iso8859_12Utf8ProcessorUnit in '..\..\..\..\bo.Text\Iso8859_12Utf8ProcessorUnit.pas',
  DefaultToUtf8ProcessorUnit in '..\..\..\..\bo.Text\DefaultToUtf8ProcessorUnit.pas',
  ConsoleFilesProcessorUnit in '..\..\..\..\bo.IO\ConsoleFilesProcessorUnit.pas';

begin
  try
    TIso8859_12Utf8Main.Main;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
