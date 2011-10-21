program ValidateXmlWithXsd;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  XmlValidatorUnit in '..\..\..\..\bo.XML\XmlValidatorUnit.pas',
  XmlDumperUnit in '..\..\..\..\bo.XML\XmlDumperUnit.pas',
  XMLDOMParseErrorToStringUnit in '..\..\..\..\bo.XML\XMLDOMParseErrorToStringUnit.pas',
  msxmlFactoryUnit in '..\..\..\..\bo.XML\msxmlFactoryUnit.pas',
  FileVersionUnit in '..\..\..\..\bo.System\FileVersionUnit.pas';

procedure Run();
begin
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

