program DumpXml;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  XmlDumperUnit in '..\..\..\..\bo.XML\XmlDumperUnit.pas',
  msxmlFactoryUnit in '..\..\..\..\bo.XML\msxmlFactoryUnit.pas',
  XMLDOMParseErrorToStringUnit in '..\..\..\..\bo.XML\XMLDOMParseErrorToStringUnit.pas',
  FileVersionUnit in '..\..\..\..\bo.System\FileVersionUnit.pas',
  System.IOUtils;

procedure Run();
var
  Filename: string;
  Index: Integer;
  XmlDumper: TXmlDumper;
  // sample parameters:
  // ..\..\..\..\XokumXmlDemo\data\xokum.xml
  // ..\..\..\..\XokumXmlDemo\data\xokum.xsd
  // ..\..\..\..\CdsXsdTest\cds-xsd\CDS.xsd
begin
  if ParamCount < 1 then
    Writeln('use parameters: [XmlFile]...')
  else
    for Index := 1 to ParamCount do
    XmlDumper := TXmlDumper.Create();
    try
      Filename := ParamStr(Index);
      if TFile.Exists(Filename) then
        XmlDumper.Dump(Filename) // otherwise you get an "OS Error" exception from the DOM
      else
        Writeln('non existing file: ', Filename);
      Writeln(XmlDumper.DumpResult);
    finally
      XmlDumper.Free;
    end;
end;

begin
  try
    try
      Run();
    except
      on E: Exception do
        Writeln(E.Classname, ': ', E.Message);
    end;
  finally
{$ifdef DEBUG}
    Write('Press <Enter>');
    Readln;
{$endif DEBUG}
  end;
end.

