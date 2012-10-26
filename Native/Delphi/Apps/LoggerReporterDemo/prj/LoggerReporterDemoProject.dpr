program LoggerReporterDemoProject;

uses
  Forms,
  MainFormUnit in '..\src\MainFormUnit.pas' {MainForm},
  LoggerUnit in '..\..\..\bo.Logging\LoggerUnit.pas',
  ReporterUnit in '..\..\..\bo.Logging\ReporterUnit.pas',
  RecordTypeInfoUnit in '..\..\..\bo.TypeInfo\RecordTypeInfoUnit.pas',
  SetTypeInfoUnit in '..\..\..\bo.TypeInfo\SetTypeInfoUnit.pas',
  EnumTypeInfoUnit in '..\..\..\bo.TypeInfo\EnumTypeInfoUnit.pas',
  ReportProxyUnit in '..\..\..\bo.Logging\ReportProxyUnit.pas',
  LoggersUnit in '..\..\..\bo.Logging\LoggersUnit.pas',
  ReportingLoggerUnit in '..\..\..\bo.Logging\ReportingLoggerUnit.pas',
  ReportersUnit in '..\..\..\bo.Logging\ReportersUnit.pas',
  DebuggingUnit in '..\..\..\bo.Debugging\DebuggingUnit.pas',
  LoggerInterfaceUnit in '..\..\..\bo.Logging\LoggerInterfaceUnit.pas',
  ReportProxyInterfaceUnit in '..\..\..\bo.Logging\ReportProxyInterfaceUnit.pas',
  DbWinUnit in '..\..\..\bo.DebugView\DbWinUnit.pas',
  DbWinReporterUnit in '..\..\..\bo.DebugView\DbWinReporterUnit.pas',
  DbWinLoggerUnit in '..\..\..\bo.DebugView\DbWinLoggerUnit.pas',
  StringListWrapperUnit in '..\..\..\bo.Text\StringListWrapperUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
