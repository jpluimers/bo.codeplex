program GenericPublicSubscribeVCLProject;

uses
  Forms,
  GenericPublishSubscribeMainFormUnit in '..\src\GenericPublishSubscribeMainFormUnit.pas' {GenericPublishSubscribeMainForm},
  ClassicMessageSubscriberUnit in '..\src\ClassicMessageSubscriberUnit.pas',
  GenericSubscriberOfUnit in '..\src\GenericSubscriberOfUnit.pas',
  MessageServiceUnit in '..\src\MessageServiceUnit.pas',
  MessageSubscribersUnit in '..\src\MessageSubscribersUnit.pas',
  MessagesUnit in '..\src\MessagesUnit.pas',
  LoggerUnit in '..\..\..\..\bo.Logging\LoggerUnit.pas',
  LoggersUnit in '..\..\..\..\bo.Logging\LoggersUnit.pas',
  ReporterUnit in '..\..\..\..\bo.Logging\ReporterUnit.pas',
  ReportProxyUnit in '..\..\..\..\bo.Logging\ReportProxyUnit.pas',
  RecordTypeInfoUnit in '..\..\..\..\bo.TypeInfo\RecordTypeInfoUnit.pas',
  SetTypeInfoUnit in '..\..\..\..\bo.TypeInfo\SetTypeInfoUnit.pas',
  EnumTypeInfoUnit in '..\..\..\..\bo.TypeInfo\EnumTypeInfoUnit.pas',
  ReportingLoggerUnit in '..\..\..\..\bo.Logging\ReportingLoggerUnit.pas',
  ReportersUnit in '..\..\..\..\bo.Logging\ReportersUnit.pas',
  ReportProxyInterfaceUnit in '..\..\..\..\bo.Logging\ReportProxyInterfaceUnit.pas',
  LoggerInterfaceUnit in '..\..\..\..\bo.Logging\LoggerInterfaceUnit.pas',
  DebuggingUnit in '..\..\..\..\bo.Debugging\DebuggingUnit.pas',
  RttiUnit in '..\..\..\..\bo.RTTI\RttiUnit.pas',
  DbWinUnit in '..\..\..\..\bo.DebugView\DbWinUnit.pas',
  DbWinLoggerUnit in '..\..\..\..\bo.DebugView\DbWinLoggerUnit.pas',
  DbWinReporterUnit in '..\..\..\..\bo.DebugView\DbWinReporterUnit.pas',
  StringListWrapperUnit in '..\..\..\..\bo.Text\StringListWrapperUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TGenericPublishSubscribeMainForm, GenericPublishSubscribeMainForm);
  Application.Run;
end.
