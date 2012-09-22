program TypeInfoConsoleProject;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  TypInfo,
  ConsoleLoggingLogicUnit in '..\..\..\bo.Logging\ConsoleLoggingLogicUnit.pas',
  LoggerInterfaceUnit in '..\..\..\bo.Logging\LoggerInterfaceUnit.pas',
  LoggerUnit in '..\..\..\bo.Logging\LoggerUnit.pas',
  LoggersUnit in '..\..\..\bo.Logging\LoggersUnit.pas',
  ReporterUnit in '..\..\..\bo.Logging\ReporterUnit.pas',
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
{$typeinfo on}
  TNoTypeInfoRecord  = record
  strict private
    FX: Integer;
    FY: Double;
  public
    property X: Integer read FX write FX;
    property Y: Double read FY write FY;
  end;

  TTypeInfoRecord  = record
  strict private
    FS: string;
    FX: Integer;
    FY: Double;
  public
    property S: string read FS write FS;
    property X: Integer read FX write FX;
    property Y: Double read FY write FY;
  end;

  TTypeInfoClass  = class
  strict private
    FX: Integer;
    FY: Double;
  published
    property X: Integer read FX write FX;
    property Y: Double read FY write FY;
  end;

  TLogic = class(TConsoleLoggingLogic)
  public
    procedure Go; overload; override;
  end;

procedure TLogic.Go;
var
  NoTypeInfoRecord: TNoTypeInfoRecord;
  NoTypeInfoRecordTypeInfo: PTypeInfo;
  TypeInfoRecord: TTypeInfoRecord;
  TypeInfoRecordTypeInfo: PTypeInfo;
  TypeInfoClass: TTypeInfoClass;
  TypeInfoClassTypeInfo: PTypeInfo;
begin
//  NoTypeInfoRecordTypeInfo := TypeInfo(TNoTypeInfoRecord);
//  Logger.Log('NoTypeInfoRecordTypeInfo', NoTypeInfoRecordTypeInfo);

  TypeInfoRecordTypeInfo := TypeInfo(TTypeInfoRecord);
  Logger.Log('TypeInfoRecordTypeInfo', TypeInfoRecordTypeInfo);

  TypeInfoClassTypeInfo := TypeInfo(TTypeInfoClass);
  Logger.Log('TypeInfoClassTypeInfo', TypeInfoClassTypeInfo);
end;

begin
  try
    TLogic.Run(TLogic);
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
