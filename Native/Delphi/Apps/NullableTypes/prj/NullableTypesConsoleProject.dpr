{ Copyright (c) 2007-2012 Jeroen Wiert Pluimers for BeSharp.net and better office benelux.
Full BSD License is available at http://besharp.codeplex.com/license and http://bo.codeplex.com/license }

program NullableTypesConsoleProject;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  DateUtils,
  UnconstrainedGenericNullableUnit in '..\src\UnconstrainedGenericNullableUnit.pas',
  GenericNullableUnit in '..\src\GenericNullableUnit.pas',
  ConsoleLoggingLogicUnit in '..\..\..\bo.Logging\ConsoleLoggingLogicUnit.pas',
  LoggerInterfaceUnit in '..\..\..\bo.Logging\LoggerInterfaceUnit.pas',
  LoggerUnit in '..\..\..\bo.Logging\LoggerUnit.pas',
  LoggersUnit in '..\..\..\bo.Logging\LoggersUnit.pas',
  ReportProxyUnit in '..\..\..\bo.Logging\ReportProxyUnit.pas',
  ReportProxyInterfaceUnit in '..\..\..\bo.Logging\ReportProxyInterfaceUnit.pas',
  StringListWrapperUnit in '..\..\..\bo.Text\StringListWrapperUnit.pas',
  RecordTypeInfoUnit in '..\..\..\bo.TypeInfo\RecordTypeInfoUnit.pas',
  SetTypeInfoUnit in '..\..\..\bo.TypeInfo\SetTypeInfoUnit.pas',
  EnumTypeInfoUnit in '..\..\..\bo.TypeInfo\EnumTypeInfoUnit.pas',
  ReportingLoggerUnit in '..\..\..\bo.Logging\ReportingLoggerUnit.pas',
  ReporterUnit in '..\..\..\bo.Logging\ReporterUnit.pas',
  ReportersUnit in '..\..\..\bo.Logging\ReportersUnit.pas',
  DbWinUnit in '..\..\..\bo.DebugView\DbWinUnit.pas',
  DebuggingUnit in '..\..\..\bo.Debugging\DebuggingUnit.pas',
  NullablesUnit in '..\..\..\bo.System\NullablesUnit.pas',
  BaseTypesUnit in '..\..\..\bo.System\BaseTypesUnit.pas',
  FormatSettingsHelperUnit in '..\..\..\bo.Helpers\FormatSettingsHelperUnit.pas',
  MathUnit in '..\..\..\bo.System\MathUnit.pas';

var
  MyFormatSettings: TFormatSettings;

type
  TLogic = class(TConsoleLoggingLogic)
  strict private
    procedure LogWeekDays;
    procedure ShowNullableInteger;
    procedure ShowNullableCurrency;
    procedure ShowNullableDouble;
  private
    procedure LogSum(Right: TNullableInteger; Left: TNullableInteger); overload;
    procedure LogSum(const Right, Left: TNullableCurrency); overload;
    procedure LogSum2(Right, Left: TNullableDouble);
  public
    procedure Go; overload; override;
  end;

procedure TLogic.Go;
begin
  ShowNullableInteger();
  ShowNullableCurrency();
  ShowNullableDouble();
  TFormatSettings.LocaleID := $0409; // en-us  English - Unites States
  LogWeekDays;
  TFormatSettings.LocaleID := $0413; // nl-nl  Nederlands - Nederland
  LogWeekDays;
end;

procedure TLogic.LogWeekDays;
var
  NullableDateTime: TNullableDateTime;
begin
  NullableDateTime.Clear();
  Logger.Log('cleard', NullableDateTime.ToString());
  NullableDateTime.Value := EncodeDate(2008, 12, 21);
  Logger.Log('Zondag', NullableDateTime.ToLongDayName());
  NullableDateTime.Value := EncodeDate(2008, 12, 22);
  Logger.Log('Maandag', NullableDateTime.ToLongDayName());
  NullableDateTime.Value := EncodeDate(2008, 12, 23);
  Logger.Log('Dinsdag', NullableDateTime.ToLongDayName());
  NullableDateTime.Value := EncodeDate(2008, 12, 24);
  Logger.Log('Woensdag', NullableDateTime.ToLongDayName());
  NullableDateTime.Value := EncodeDate(2008, 12, 25);
  Logger.Log('Donderdag', NullableDateTime.ToLongDayName());
  NullableDateTime.Value := EncodeDate(2008, 12, 26);
  Logger.Log('Vrijdag', NullableDateTime.ToLongDayName());
  NullableDateTime.Value := EncodeDate(2008, 12, 27);
  Logger.Log('Zaterdag', NullableDateTime.ToLongDayName());
end;

procedure TLogic.ShowNullableInteger;
var
  Left: TNullableInteger;
  Right: TNullableInteger;
  Sum: TNullableInteger;
begin
  Left.Clear();
  Right.Clear();
  LogSum(Left, Right);
  Left := 4;
  LogSum(Left, Right);
  Right := 5;
  LogSum(Left, Right);
end;

procedure TLogic.LogSum(Right: TNullableInteger; Left: TNullableInteger);
var
  Sum: TNullableInteger;
begin
  Sum := Right + Left;
  Logger.Log('Sum:', Format('"%s" + "%s" = "%s"', [Left.ToString, Right.ToString, Sum.ToString]));
end;

procedure TLogic.LogSum(const Right, Left: TNullableCurrency);
var
  Sum: TNullableCurrency;
begin
  Sum := Right + Left;
  Logger.Log('Sum:', Format('"%s" + "%s" = "%s"', [Left.ToString, Right.ToString, Sum.ToString]));
end;

procedure TLogic.LogSum2(Right, Left: TNullableDouble);
var
  Sum: TNullableDouble;
begin
  Sum := Right + Left;
  Logger.Log('Sum:', Format('"%s" + "%s" = "%s"', [Left.ToString, Right.ToString, Sum.ToString]));
end;

procedure TLogic.ShowNullableCurrency;
var
  Left: TNullableCurrency;
  Right: TNullableCurrency;
  Sum: TNullableCurrency;
begin
  Left.Clear();
  Right.Clear();
  LogSum(Left, Right);
  Left := 4;
  LogSum(Left, Right);
  Right := 5;
  LogSum(Left, Right);
end;

procedure TLogic.ShowNullableDouble;
var
  Left: TNullableDouble;
  Right: TNullableDouble;
  Sum: TNullableDouble;
begin
  Left.Clear();
  Right.Clear();
  LogSum2(Left, Right);
  Left := 4;
  LogSum2(Left, Right);
  Right := 5;
  LogSum2(Left, Right);
end;

begin
  try
    TLogic.Run(TLogic);
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
