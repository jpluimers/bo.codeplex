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
  ReportersUnit in '..\src\ReportersUnit.pas',
  ReportingLoggerUnit in '..\..\..\..\bo.Logging\ReportingLoggerUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TXokumDataBindingForm, XokumDataBindingForm);
  Application.Run;
end.
