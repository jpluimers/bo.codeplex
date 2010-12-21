program ValidateXmlWithXsd;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  XmlValidatorUnit in '..\..\..\..\bo.XML\XmlValidatorUnit.pas',
  XmlDumperUnit in '..\..\..\..\bo.XML\XmlDumperUnit.pas',
  XMLDOMParseErrorToStringUnit in '..\..\..\..\bo.XML\XMLDOMParseErrorToStringUnit.pas',
  msxmlFactoryUnit in '..\..\..\..\bo.XML\msxmlFactoryUnit.pas',
  FileVersionUnit in '..\..\..\..\bo.System\FileVersionUnit.pas';

begin
  try
    if ParamCount <> 2 then
    begin
      Writeln('use two parameters: XmlFile and XsdFile');
    end
    else
    begin
      with TXmlValidator.Create do
        try
          if ValidateXml(ParamStr(1), ParamStr(2)) then
            Writeln('OK')
          else
          begin
            Writeln(ValidationResult);
          end;
        finally
          Free;
        end;
      with TXmlDumper.Create() do
        try
          Dump(ParamStr(1));
          Writeln(DumpResult);
        finally
          Free;
        end;
    end;
  except
    on E: Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.

