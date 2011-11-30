program HiddenExecute;

// no CONSOLE app so you don't get a console window

{$R *.res}

// Debug parameter: ..\..\..\src\TestHiddenExecute-by-making-directories-in-TEMP.bat

uses
  ReporterUnit in '..\..\..\bo.Logging\ReporterUnit.pas',
  ReportProxyUnit in '..\..\..\bo.Logging\ReportProxyUnit.pas',
  RecordTypeInfoUnit in '..\..\..\bo.TypeInfo\RecordTypeInfoUnit.pas',
  SetTypeInfoUnit in '..\..\..\bo.TypeInfo\SetTypeInfoUnit.pas',
  EnumTypeInfoUnit in '..\..\..\bo.TypeInfo\EnumTypeInfoUnit.pas',
  LoggerInterfaceUnit in '..\..\..\bo.Logging\LoggerInterfaceUnit.pas',
  ReportProxyInterfaceUnit in '..\..\..\bo.Logging\ReportProxyInterfaceUnit.pas',
  StringListWrapperUnit in '..\..\..\bo.Text\StringListWrapperUnit.pas',
  LoggerUnit in '..\..\..\bo.Logging\LoggerUnit.pas',
  ActivatableUnit in '..\..\..\bo.System\ActivatableUnit.pas',
  OSProcessUnit in '..\..\..\bo.System\OSProcessUnit.pas',
  CommandLineUnit in '..\..\..\bo.System\CommandLineUnit.pas',
  HiddenExecuteUnit in '..\src\HiddenExecuteUnit.pas',
  ClassTypeInfoUnit in '..\..\..\bo.TypeInfo\ClassTypeInfoUnit.pas',
  FormatUnit in '..\..\..\bo.System\FormatUnit.pas',
  PropertyTypeInfoUnit in '..\..\..\bo.TypeInfo\PropertyTypeInfoUnit.pas',
  DbWinUnit in '..\..\..\bo.DebugView\DbWinUnit.pas',
  DbWinLoggerUnit in '..\..\..\bo.DebugView\DbWinLoggerUnit.pas',
  ReportingLoggerUnit in '..\..\..\bo.Logging\ReportingLoggerUnit.pas',
  DbWinReporterUnit in '..\..\..\bo.DebugView\DbWinReporterUnit.pas',
  EnvironmentUnit in '..\..\..\bo.Windows\EnvironmentUnit.pas',
  HiddenExecuteArgumentsUnit in '..\src\HiddenExecuteArgumentsUnit.pas',
  HiddenExecuteSettingsUnit in '..\src\HiddenExecuteSettingsUnit.pas',
  CommandParser in '..\..\..\..\..\..\radstudiodemos.sourceforge.net\branches\RadStudio_XE2\Delphi\Database\dbExpress\Utils\CommandParser.pas',
  PropertyHelpers in '..\..\..\..\..\..\radstudiodemos.sourceforge.net\branches\RadStudio_XE2\Delphi\Database\dbExpress\DbxDataPump\PropertyHelpers.pas',
  ParseIds in '..\..\..\..\..\..\radstudiodemos.sourceforge.net\branches\RadStudio_XE2\Delphi\Database\dbExpress\DbxDataPump\ParseIds.pas',
  HiddenExecuteSettingsLoaderUnit in '..\src\HiddenExecuteSettingsLoaderUnit.pas',
  DebuggingUnit in '..\..\..\bo.Debugging\DebuggingUnit.pas';

begin
  THiddenExecute.Main();
end.
