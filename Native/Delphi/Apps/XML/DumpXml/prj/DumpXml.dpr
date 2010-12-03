program DumpXml;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  XmlDumperUnit in '..\..\..\..\bo.XML\XmlDumperUnit.pas',
  msxmlFactoryUnit in '..\..\..\..\bo.XML\msxmlFactoryUnit.pas',
  XMLDOMParseErrorToStringUnit in '..\..\..\..\bo.XML\XMLDOMParseErrorToStringUnit.pas';

var
  Index: Integer;

begin
  try
    if ParamCount < 1 then
      Writeln('use parameters: [XmlFile]...')
    else
      for Index := 1 to ParamCount do
      with TXmlDumper.Create() do
        try
          Dump(ParamStr(Index));
          Writeln(DumpResult);
        finally
          Free;
        end;
  except
    on E: Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.

