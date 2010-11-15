unit ISO8601Unit;

// http://www.iso.org/iso/date_and_time_format
// http://en.wikipedia.org/wiki/ISO_8601

// Date YYYY-MM-DD or YYYYMMDD
// DateTime: YYYY-MM-DDThh:mm:ss
// Time hh:mm:ss or hhmmss


interface

function Iso8601DateString(const DateTime: TDateTime): string;
function Iso8601DateTimeString(const DateTime: TDateTime; const ApplyLocalBias: Boolean): string;

function UtcIso8601DateString: string;
function UtcIso8601DateTimeString: string;

function UtcNow: TDateTime;


implementation

uses
  Windows,
  SysUtils,
  XSBuiltIns;

// because XML date/time handling works according to the ISO 8601 rules, we reuse that

function Iso8601DateString(const DateTime: TDateTime): string;
var
  XSDate: TXSDate;
begin
  XSDate := TXSDate.Create();
  try
    XSDate.AsDate := DateTime;
    Result := XSDate.NativeToXS;
  finally
    XSDate.Free;
  end;
end;

//1 LocalBias = False gives UTC DateTime string with Z timezone indicator
function Iso8601DateTimeString(const DateTime: TDateTime; const ApplyLocalBias: Boolean): string;
begin
  Result := DateTimeToXMLTime(DateTime, ApplyLocalBias);
end;

function UtcIso8601DateString: string;
begin
  Result := Iso8601DateString(UtcNow);
end;

function UtcIso8601DateTimeString: string;
begin
  Result := Iso8601DateTimeString(UtcNow, False);
end;

//1 http://stackoverflow.com/questions/690739/convert-tdatetime-to-another-time-zone-regardless-of-local-time-zone
/// http://msdn.microsoft.com/en-us/library/ms724390(VS.85).aspx
function UtcNow: TDateTime;
var
  SystemTime: TSystemTime;
begin
  GetSystemTime(SystemTime);
  Result :=
    EncodeDate(SystemTime.wYear, SystemTime.wMonth, SystemTime.wDay) +
    EncodeTime(SystemTime.wHour, SystemTime.wMinute, SystemTime.wSecond, SystemTime.wMilliseconds);
end;

end.
