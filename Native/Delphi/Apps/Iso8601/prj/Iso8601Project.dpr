program Iso8601Project;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  XSBuiltIns,
  DateUtils;

procedure Main;
var
  Date: TDateTime;
  DateString: string;
  DateTime: TDateTime;
  DateTimeString: string;
begin
  DateTime := Now;
  Date := Today;

    with TXSDateTime.Create() do
      try
        AsDateTime := DateTime; // convert from TDateTime
        DateTimeString := NativeToXS; // convert to WideString
      finally
        Free;
      end;

    with TXSDateTime.Create() do
      try
        XSToNative(DateTimeString); // convert from WideString
        DateTime := AsDateTime; // convert to TDateTime
      finally
        Free;
      end;

    with TXSDate.Create() do
      try
        AsDate := Date; // convert from TDateTime
        DateString := NativeToXS; // convert to WideString
      finally
        Free;
      end;

    with TXSDate.Create() do
      try
        XSToNative(DateString); // convert from WideString
        Date := AsDate; // convert to TDateTime
      finally
        Free;
      end;

  Writeln(DateTimeString);
  Writeln(DateString);

  Writeln(DateTimeToStr(DateTime));
  Writeln(DateToStr(Date));
end;

begin
  try
    try
      Main();
    finally
      Write('Press <Enter>');
      Readln;
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
