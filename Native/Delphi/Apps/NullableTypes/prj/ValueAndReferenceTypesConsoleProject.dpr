{ Copyright (c) 2007-2012 Jeroen Wiert Pluimers for BeSharp.net and better office benelux.
Full BSD License is available at http://besharp.codeplex.com/license and http://bo.codeplex.com/license }

program ValueAndReferenceTypesConsoleProject;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  LogicUnit in '..\src\LogicUnit.pas',
  LoggerUnit in '..\..\..\bo.Logging\LoggerUnit.pas',
  ReporterUnit in '..\..\..\bo.Logging\ReporterUnit.pas',
  ReportProxyUnit in '..\..\..\bo.Logging\ReportProxyUnit.pas',
  ReportProxyInterfaceUnit in '..\..\..\bo.Logging\ReportProxyInterfaceUnit.pas',
  LoggerInterfaceUnit in '..\..\..\bo.Logging\LoggerInterfaceUnit.pas',
  StringListWrapperUnit in '..\..\..\bo.Text\StringListWrapperUnit.pas',
  RecordTypeInfoUnit in '..\..\..\bo.TypeInfo\RecordTypeInfoUnit.pas',
  SetTypeInfoUnit in '..\..\..\bo.TypeInfo\SetTypeInfoUnit.pas',
  EnumTypeInfoUnit in '..\..\..\bo.TypeInfo\EnumTypeInfoUnit.pas',
  ReportingLoggerUnit in '..\..\..\bo.Logging\ReportingLoggerUnit.pas',
  ReportersUnit in '..\..\..\bo.Logging\ReportersUnit.pas',
  ConsoleLoggingLogicUnit in '..\..\..\bo.Logging\ConsoleLoggingLogicUnit.pas',
  LoggersUnit in '..\..\..\bo.Logging\LoggersUnit.pas',
  DbWinUnit in '..\..\..\bo.DebugView\DbWinUnit.pas',
  DebuggingUnit in '..\..\..\bo.Debugging\DebuggingUnit.pas';

begin
  try
    TLogic.Run(TLogic);
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
