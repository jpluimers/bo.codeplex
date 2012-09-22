{ Copyright (c) 2007-2012 Jeroen Wiert Pluimers for BeSharp.net and better office benelux.
Full BSD License is available at http://besharp.codeplex.com/license and http://bo.codeplex.com/license }

program OperatorOverloadingConsoleProject;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  ConsoleLoggingLogicUnit in '..\..\..\bo.Logging\ConsoleLoggingLogicUnit.pas',
  LoggerInterfaceUnit in '..\..\..\bo.Logging\LoggerInterfaceUnit.pas',
  LoggerUnit in '..\..\..\bo.Logging\LoggerUnit.pas',
  ReporterUnit in '..\..\..\bo.Logging\ReporterUnit.pas',
  LoggersUnit in '..\..\..\bo.Logging\LoggersUnit.pas',
  ReportProxyUnit in '..\..\..\bo.Logging\ReportProxyUnit.pas',
  ReportProxyInterfaceUnit in '..\..\..\bo.Logging\ReportProxyInterfaceUnit.pas',
  StringListWrapperUnit in '..\..\..\bo.Text\StringListWrapperUnit.pas',
  RecordTypeInfoUnit in '..\..\..\bo.TypeInfo\RecordTypeInfoUnit.pas',
  SetTypeInfoUnit in '..\..\..\bo.TypeInfo\SetTypeInfoUnit.pas',
  EnumTypeInfoUnit in '..\..\..\bo.TypeInfo\EnumTypeInfoUnit.pas',
  ReportingLoggerUnit in '..\..\..\bo.Logging\ReportingLoggerUnit.pas',
  ReportersUnit in '..\..\..\bo.Logging\ReportersUnit.pas',
  DbWinUnit in '..\..\..\bo.DebugView\DbWinUnit.pas',
  DebuggingUnit in '..\..\..\bo.Debugging\DebuggingUnit.pas';

type
  TMyClass = class
  end;

  TMyRecord = record
    class operator LessThan(A: TMyRecord; B: TMyClass): TMyClass;
    class operator Equal(A: TMyRecord; B: TMyClass): TMyClass;
    class operator Multiply(A: TMyRecord; B: TMyClass): TMyClass;
    class operator Round(A: TMyRecord): TMyClass;
  end;

  TLogic = class(TConsoleLoggingLogic)
  public
    procedure Go; override;
  end;

procedure TLogic.Go;
var
  Left: TMyClass;
  Right: TMyRecord;
  Result: TMyClass;
begin
  Logger.Log('Start');
  Left := TMyClass.Create;
  Result := Round(Right);
  Result := Right < Left;
//  if (Right < Left) then
//    Logger.Log('True');
  Logger.Log('Finish');
end;

class operator TMyRecord.LessThan(A: TMyRecord; B: TMyClass): TMyClass;
begin
//  Result := ;
end;

class operator TMyRecord.Equal(A: TMyRecord; B: TMyClass): TMyClass;
begin
//  Result := ;
end;

class operator TMyRecord.Multiply(A: TMyRecord; B: TMyClass): TMyClass;
begin
//  Result := ;
end;

class operator TMyRecord.Round(A: TMyRecord): TMyClass;
begin
//  Result := ;
end;

begin
  try
    TLogic.Run(TLogic);
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
