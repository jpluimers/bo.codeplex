program XPathTester;

uses
  Forms,
  MainFormUnit in '..\src\MainFormUnit.pas' {MainForm},
  LoggerUnit in '..\..\..\..\bo.Logging\LoggerUnit.pas',
  StringListWrapperUnit in '..\..\..\..\bo.Text\StringListWrapperUnit.pas',
  ReporterUnit in '..\..\..\..\bo.Logging\ReporterUnit.pas',
  ReportProxyUnit in '..\..\..\..\bo.Logging\ReportProxyUnit.pas',
  RecordTypeInfoUnit in '..\..\..\..\bo.TypeInfo\RecordTypeInfoUnit.pas',
  SetTypeInfoUnit in '..\..\..\..\bo.TypeInfo\SetTypeInfoUnit.pas',
  EnumTypeInfoUnit in '..\..\..\..\bo.TypeInfo\EnumTypeInfoUnit.pas',
  WebBrowserHelperUnit in '..\..\..\..\bo.Helpers\WebBrowserHelperUnit.pas',
  LoggersUnit in '..\..\..\..\bo.Logging\LoggersUnit.pas',
  StringUtilsUnit in '..\..\..\..\bo.Text\StringUtilsUnit.pas',
  XmlHelperUnit in '..\..\..\..\bo.XML\XmlHelperUnit.pas',
  ComponentHelperUnit in '..\..\..\..\bo.Helpers\ComponentHelperUnit.pas',
  ReportingLoggerUnit in '..\..\..\..\bo.Logging\ReportingLoggerUnit.pas',
  MakeResourceUrlUnit in '..\..\..\..\bo.Helpers\MakeResourceUrlUnit.pas',
  ReportersUnit in '..\..\..\..\bo.Logging\ReportersUnit.pas',
  msxmlFactoryUnit in '..\..\..\..\bo.XML\msxmlFactoryUnit.pas',
  ReportProxyInterfaceUnit in '..\..\..\..\bo.Logging\ReportProxyInterfaceUnit.pas',
  LoggerInterfaceUnit in '..\..\..\..\bo.Logging\LoggerInterfaceUnit.pas',
  FileVersionUnit in '..\..\..\..\bo.System\FileVersionUnit.pas',
  XMLDOMParseErrorToStringUnit in '..\..\..\..\bo.XML\XMLDOMParseErrorToStringUnit.pas',
  DbWinUnit in '..\..\..\..\bo.DebugView\DbWinUnit.pas',
  DebuggingUnit in '..\..\..\..\bo.Debugging\DebuggingUnit.pas',
  MSXML2_TLB in '..\..\..\..\bo.XML\MSXML2_TLB.pas',
  DictionaryUnit in '..\..\..\..\bo.Containers\DictionaryUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
