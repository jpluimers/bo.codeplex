program VariantRecordsWithCharactersAndStrings;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Math;

const
  Size20 = 20;
  Size8 = 8;
  Size4 = 4;
type
  TChar20 = array[0..Size20-1] of Char;
  TChar8 = array[0..Size8-1] of Char;
  TChar4 = array[0..Size4-1] of Char;
  TMyRecord = record
    class var FillCharValue: Byte;
    function GetEntireString: string;
    function GetStringStart: string;
    function GetStringMiddle: string;
    function GetStringEnd: string;
    procedure SetEntireString(const Value: string);
    procedure SetStringStart(const Value: string);
    procedure SetStringMiddle(const Value: string);
    procedure SetStringEnd(const Value: string);
    property EntireString: string read GetEntireString write SetEntireString;
    property StringStart: string read GetStringStart write SetStringStart;
    property StringMiddle: string read GetStringMiddle write SetStringMiddle;
    property StringEnd: string read GetStringEnd write SetStringEnd;
    procedure SetCharArray(const CharArrayPointer: PChar; const CharArraySize: Integer; const Value: string);
    case Boolean of
      True:
      (
          CharFull: TChar20;
      );
      False:
      (
          CharStart: TChar8;
          CharMiddle: TChar4;
          CharEnd: TChar8;
      );
  end;

function TMyRecord.GetEntireString: string;
begin
  Result := CharFull;
end;

function TMyRecord.GetStringStart: string;
begin
  Result := CharStart;
end;

function TMyRecord.GetStringMiddle: string;
begin
  Result := CharMiddle;
end;

function TMyRecord.GetStringEnd: string;
begin
  Result := CharEnd;
end;

procedure TMyRecord.SetEntireString(const Value: string);
begin
  SetCharArray(CharFull, SizeOf(CharFull), Value);
end;

procedure TMyRecord.SetCharArray(const CharArrayPointer: PChar; const CharArraySize: Integer; const Value: string);
begin
  FillChar(CharArrayPointer^, CharArraySize, FillCharValue);
  Move(Value[1], CharArrayPointer^, Min(CharArraySize, SizeOf(Char)*Length(Value)));
end;

procedure TMyRecord.SetStringStart(const Value: string);
begin
  SetCharArray(CharStart, SizeOf(CharStart), Value);
end;

procedure TMyRecord.SetStringMiddle(const Value: string);
begin
  SetCharArray(CharMiddle, SizeOf(CharMiddle), Value);
end;

procedure TMyRecord.SetStringEnd(const Value: string);
begin
  SetCharArray(CharEnd, SizeOf(CharEnd), Value);
end;

var
  MyRecord: TMyRecord;

procedure Dump();
begin
  Writeln(MyRecord.EntireString);
  Writeln(MyRecord.StringStart);
  Writeln(MyRecord.StringMiddle);
  Writeln(MyRecord.StringEnd);
end;

procedure TestWithFillCharValue(const FillCharValue: Byte);
begin
  Writeln('Testing with FillCharValue ', FillCharValue);
  TMyRecord.FillCharValue := FillCharValue;
  MyRecord.EntireString := '123456789001234567890';
  Dump();
  MyRecord.StringStart := 'AAA';
  MyRecord.StringMiddle := 'BBB';
  MyRecord.StringEnd := 'CCC';
  Dump();
end;

begin
  try
    TestWithFillCharValue(0); // this will truncated all the sub arrays when you pass strings that are too short
    TestWithFillCharValue(20); // when using Unicode, this fails even more horribly
    Write('Press <Enter>');
    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
