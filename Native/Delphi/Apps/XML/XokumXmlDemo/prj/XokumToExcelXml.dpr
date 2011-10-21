program XokumToExcelXml;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  XokumToExcelXmlUnit in '..\src\XokumToExcelXmlUnit.pas',
  ExcelUnit in '..\..\..\..\bo.Excel\ExcelUnit.pas',
  ExcelXmlUnit in '..\..\..\..\bo.Excel\ExcelXmlUnit.pas',
  xokumDataBindingUnit in '..\src\xokumDataBindingUnit.pas',
  excelssUnit in '..\..\..\..\bo.Excel\excelssUnit.pas';

begin
  try
    TXokumToExcelXml.Main();
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
