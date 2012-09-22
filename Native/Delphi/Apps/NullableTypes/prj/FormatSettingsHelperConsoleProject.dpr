{ Copyright (c) 2007-2011 Jeroen Wiert Pluimers for BeSharp.net and better office benelux.
Full BSD License is available at http://besharp.codeplex.com/license and http://bo.codeplex.com/license }

program FormatSettingsHelperConsoleProject;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  DateUtils,
  ConsoleLoggingLogicUnit in '..\..\..\bo.Logging\ConsoleLoggingLogicUnit.pas',
  LoggerInterfaceUnit in '..\..\..\bo.Logging\LoggerInterfaceUnit.pas',
  LoggerUnit in '..\..\..\bo.Logging\LoggerUnit.pas',
  ReportersUnit in '..\..\..\bo.Logging\ReportersUnit.pas',
  DbWinUnit in '..\..\..\bo.DebugView\DbWinUnit.pas',
  ReporterUnit in '..\..\..\bo.Logging\ReporterUnit.pas',
  ReportProxyUnit in '..\..\..\bo.Logging\ReportProxyUnit.pas',
  ReportProxyInterfaceUnit in '..\..\..\bo.Logging\ReportProxyInterfaceUnit.pas',
  StringListWrapperUnit in '..\..\..\bo.Text\StringListWrapperUnit.pas',
  RecordTypeInfoUnit in '..\..\..\bo.TypeInfo\RecordTypeInfoUnit.pas',
  SetTypeInfoUnit in '..\..\..\bo.TypeInfo\SetTypeInfoUnit.pas',
  EnumTypeInfoUnit in '..\..\..\bo.TypeInfo\EnumTypeInfoUnit.pas',
  LoggersUnit in '..\..\..\bo.Logging\LoggersUnit.pas',
  ReportingLoggerUnit in '..\..\..\bo.Logging\ReportingLoggerUnit.pas',
  DebuggingUnit in '..\..\..\bo.Debugging\DebuggingUnit.pas',
  FormatSettingsHelperUnit in '..\..\..\bo.Helpers\FormatSettingsHelperUnit.pas';

type
  TFormatSettingsHelperLogic = class(TConsoleLoggingLogic)
  strict private
    procedure LogDefaultFormatSettings;
  public
    procedure Go; override;
  end;

procedure TFormatSettingsHelperLogic.LogDefaultFormatSettings;
var
  MyFormatSettings: TFormatSettings;
  SundayShortDayName: string;
begin
  MyFormatSettings := TFormatSettings.GetDefaultFormatSettings(); // inside the TFormatSettingsHelper
  SundayShortDayName := MyFormatSettings.ShortDayNames[TFormatSettings.GetDayNameIndex(DayMonday)];
  Logger.LogMulti('ShortMonthNames', MyFormatSettings.ShortMonthNames);
  Logger.LogMulti('LongMonthNames', MyFormatSettings.LongMonthNames);
  Logger.LogMulti('ShortDayNames', MyFormatSettings.ShortDayNames);
  Logger.LogMulti('LongDayNames', MyFormatSettings.LongDayNames);
  Logger.Log('CurrencyFormat', MyFormatSettings.CurrencyFormat);
  Logger.Log('NegCurrFormat', MyFormatSettings.NegCurrFormat);
  Logger.Log('ThousandSeparator', MyFormatSettings.ThousandSeparator);
  Logger.Log('DecimalSeparator', MyFormatSettings.DecimalSeparator);
  Logger.Log('CurrencyDecimals', MyFormatSettings.CurrencyDecimals);
  Logger.Log('DateSeparator', MyFormatSettings.DateSeparator);
  Logger.Log('TimeSeparator', MyFormatSettings.TimeSeparator);
  Logger.Log('ListSeparator', MyFormatSettings.ListSeparator);
  Logger.Log('CurrencyString', MyFormatSettings.CurrencyString);
  Logger.Log('ShortDateFormat', MyFormatSettings.ShortDateFormat);
  Logger.Log('LongDateFormat', MyFormatSettings.LongDateFormat);
  Logger.Log('TimeAMString', MyFormatSettings.TimeAMString);
  Logger.Log('TimePMString', MyFormatSettings.TimePMString);
  Logger.Log('ShortTimeFormat', MyFormatSettings.ShortTimeFormat);
  Logger.Log('LongTimeFormat', MyFormatSettings.LongTimeFormat);
  Logger.Log('TwoDigitYearCenturyWindow', MyFormatSettings.TwoDigitYearCenturyWindow);
end;

procedure TFormatSettingsHelperLogic.Go;
begin
  TFormatSettings.LocaleID := $0013; // nl     Nederlands
  LogDefaultFormatSettings;
  TFormatSettings.LocaleID := $0413; // nl-nl  Nederlands - Nederland
  LogDefaultFormatSettings;
  TFormatSettings.LocaleID := $0813; // nl-be  Nederlands - België
  LogDefaultFormatSettings;
  TFormatSettings.LocaleID := $0409; // en-us  English - United States
  LogDefaultFormatSettings;
  TFormatSettings.LocaleID := $0462; // fr-nl  Frysk - Nederlân
  LogDefaultFormatSettings;
end;

begin
  try
    TFormatSettingsHelperLogic.Run(TFormatSettingsHelperLogic);
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
