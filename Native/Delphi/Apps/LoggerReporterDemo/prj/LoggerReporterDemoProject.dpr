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
  OutputDebugViewLoggerUnit in '..\..\..\bo.DebugView\OutputDebugViewLoggerUnit.pas',
  OutputDebugViewReporterUnit in '..\..\..\bo.DebugView\OutputDebugViewReporterUnit.pas',
  OutputDebugViewUnit in '..\..\..\bo.DebugView\OutputDebugViewUnit.pas',
  LoggersUnit in '..\..\..\bo.Logging\LoggersUnit.pas',
  ReportingLoggerUnit in '..\..\..\bo.Logging\ReportingLoggerUnit.pas',
  ReportersUnit in '..\..\..\bo.Logging\ReportersUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
