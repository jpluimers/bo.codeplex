program XmlDataBindingProject;

uses
  Forms,
  XmlDataBindingFormUnit in '..\src\XmlDataBindingFormUnit.pas' {XokumDataBindingForm},
  xokumDataBindingUnit in '..\src\xokumDataBindingUnit.pas',
  LoggerUnit in '..\..\..\..\bo.Logging\LoggerUnit.pas',
  ReporterUnit in '..\..\..\..\bo.Logging\ReporterUnit.pas',
  ReportProxyUnit in '..\..\..\..\bo.Logging\ReportProxyUnit.pas',
  ReportProxyInterfaceUnit in '..\..\..\..\bo.Logging\ReportProxyInterfaceUnit.pas',
  LoggerInterfaceUnit in '..\..\..\..\bo.Logging\LoggerInterfaceUnit.pas',
  RecordTypeInfoUnit in '..\..\..\..\bo.TypeInfo\RecordTypeInfoUnit.pas',
  SetTypeInfoUnit in '..\..\..\..\bo.TypeInfo\SetTypeInfoUnit.pas',
  EnumTypeInfoUnit in '..\..\..\..\bo.TypeInfo\EnumTypeInfoUnit.pas',
  ReportingLoggerUnit in '..\..\..\..\bo.Logging\ReportingLoggerUnit.pas',
  ReportersUnit in '..\..\..\..\bo.Logging\ReportersUnit.pas',
  DbWinUnit in '..\..\..\..\bo.DebugView\DbWinUnit.pas',
  StringListWrapperUnit in '..\..\..\..\bo.Text\StringListWrapperUnit.pas',
  DebuggingUnit in '..\..\..\..\bo.Debugging\DebuggingUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TXokumDataBindingForm, XokumDataBindingForm);
  Application.Run;
end.
