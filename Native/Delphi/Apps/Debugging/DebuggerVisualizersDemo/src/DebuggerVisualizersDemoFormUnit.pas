unit DebuggerVisualizersDemoFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TDebuggerVisualizersDemoForm = class(TForm)
    HighFrequencyWordsButton: TButton;
    DateTime_Time_Date_Button: TButton;
    Button3: TButton;
    Memo1: TMemo;
    procedure HighFrequencyWordsButtonClick(Sender: TObject);
    procedure DateTime_Time_Date_ButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Log(const Line: string);
    { Public declarations }
  end;

var
  DebuggerVisualizersDemoForm: TDebuggerVisualizersDemoForm;

implementation

uses
  System.Types, StringUtilsUnit, System.DateUtils;

{$R *.dfm}

procedure TDebuggerVisualizersDemoForm.HighFrequencyWordsButtonClick(Sender: TObject);
const
  Delimiters = #9' ';
var
  Words: TStrings;
begin
// http://www.love2read.co.uk/expert-guides-on-helping-children-learn-to-read/high-frequency-words.html

  Words := TStringList.Create();
  try
    AddSplitted(Words, Delimiters, 'I	go	come	went	up	you	day	was');
    AddSplitted(Words, Delimiters, 'look	are	the	of	we	this	dog	me');
    AddSplitted(Words, Delimiters, 'like	going	big	she	and	they	my	see');
    AddSplitted(Words, Delimiters, 'on	away	mum	it	at	play	no	yes');
    AddSplitted(Words, Delimiters, 'for	a	dad	can	he	am	all');
    AddSplitted(Words, Delimiters, 'is	cat	get	said	to	in');
    Memo1.Lines := Words;
  finally
    Words.Free;
  end;

  // Visalizer interface in the ToolsAPI unit
  // Visualizer source code in DateTimeVisualizer, StrStringVisualizer and StringListVisualizer units
end;

procedure TDebuggerVisualizersDemoForm.DateTime_Time_Date_ButtonClick(Sender: TObject);
const
  SLongTimeFormatAMPM = 'h:mm:ss AMPM';
  SLongTimeFormat24hr = 'H:mm:ss';
var
  Date: TDate;
  DateTime: TDateTime;
  Time: TTime;
begin
  // http://www.onlineconversion.com/date_time.htm
  Date := EncodeDateWeek(1952, 11, DayTuesday);
  Log(FormatDateTime(FormatSettings.LongDateFormat, Date));
  Date := EncodeDateWeek(2001, 19, DayFriday);
  Log(FormatDateTime(FormatSettings.ShortDateFormat, Date));

  Time := EncodeTime(12, 34, 56, 789);
  Log(TimeToStr(Time));

  DateTime := Now;
  Log(DateTimeToStr(DateTime));

  Log('http://en.wikipedia.org/wiki/12-hour_clock#Confusion_at_noon_and_midnight');

  Log('noon:');
  Time := EncodeTime(12, 00, 00, 0);
  Log(FormatDateTime(SLongTimeFormat24hr, Time));
  Log(FormatDateTime(SLongTimeFormatAMPM, Time)); // is noon AM or PM?
  Time := IncMilliSecond(Time, -1);
  Log(FormatDateTime(SLongTimeFormatAMPM, Time)); // is noon AM or PM?
  Time := IncMilliSecond(Time, 2);
  Log(FormatDateTime(SLongTimeFormatAMPM, Time)); // is noon AM or PM?

  Log('midnight:');
  Time := EncodeTime(00, 00, 00, 0);
  Log(FormatDateTime(SLongTimeFormat24hr, Time));
  Log(FormatDateTime(SLongTimeFormatAMPM, Time)); // is midnight AM or PM?
  Time := IncMilliSecond(Time, -1);
  Log(FormatDateTime(SLongTimeFormatAMPM, Time)); // is midnight AM or PM?
  Time := IncMilliSecond(Time, 2);
  Log(FormatDateTime(SLongTimeFormatAMPM, Time)); // is midnight AM or PM?
end;

procedure TDebuggerVisualizersDemoForm.Log(const Line: string);
begin
  Memo1.Lines.Add(Line);
end;

end.
