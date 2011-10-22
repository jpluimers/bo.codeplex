program XokumToExcelXml;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  XokumToExcelXmlUnit in '..\src\XokumToExcelXmlUnit.pas',
  ExcelUnit in '..\..\..\..\bo.Excel\ExcelUnit.pas',
  ExcelXmlUnit in '..\..\..\..\bo.Excel\ExcelXmlUnit.pas';

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
