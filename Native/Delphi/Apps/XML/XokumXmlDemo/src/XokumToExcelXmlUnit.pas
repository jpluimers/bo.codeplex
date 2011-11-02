unit XokumToExcelXmlUnit;

interface

uses
  Classes,
  ExcelXmlUnit;

type
  TXokumToExcelXml = class(TObject)
  private
    function CreateCascallFileStrings(const cascallFileName: string): TStrings;
  strict private
    FCorporateKey: string;
    FDate: string;
    FFullName: string;
    FMonthNames: TStrings;
    FWorkstationName: string;
  strict protected
    function CreateWorkbookWorksheetTable(var Workbook: IXMLWorkbookType): IXMLTableType; virtual;
    function GetMonthNames: TStrings; virtual;
    function MonthIndex(const MonthName: string): Integer; virtual;
    procedure Parse(const cascallFileName: string; const Table: IXMLTableType); virtual;
    procedure ParseCommandLineStrings; virtual;
    function ParseLine(const Table: IXMLTableType; const cascallLine: string): Integer; virtual;
    procedure ParseMetaInformation(const cascallFileName: string); virtual;
    property MonthNames: TStrings read GetMonthNames;
  public
    destructor Destroy; override;
    class procedure Main; static;
  end;

implementation

uses
//  CommandlineUnit,
  SysUtils,
  ComObj, { calls CoInitialize }
  ActiveX, XSBuiltIns,
  ExcelUnit,
  XMLIntf,
  XMLDoc,
  StrUtils,
  DateUtils,
  Variants,
  IOUnit,
  Nsapi;

procedure CoUninit(Success: HResult; const Text: string);
begin
  case Success of
    S_OK, S_FALSE: CoUninitialize;
  end;
end;

function TXokumToExcelXml.GetMonthNames: TStrings;
begin
  if not Assigned(FMonthNames) then
  begin
    FMonthNames := TStringList.Create();
    FMonthNames.CommaText := 'jan,feb,mar,apr,may,jun,jul,aug,sep,oct,nov,dec';
  end;
  Result := FMonthNames;
end;

function TXokumToExcelXml.MonthIndex(const MonthName: string): Integer;
begin
  Result := 1 + MonthNames.IndexOf(AnsiLowerCase(MonthName)); // MonthNames is 0-based; MonthIndex is 1-based
end;

procedure TXokumToExcelXml.Parse(const cascallFileName: string; const Table: IXMLTableType);
const
  ThreeSpaces = '   ';
var
  cascallFile: TStrings;
  First: Boolean;
  cascallLine: string;
  Column: IXMLColumnType;
  spacedCascallLine: string;
  ColumnCount: Integer;
  MaxColumnCount: Integer;
begin
  ParseMetaInformation(cascallFileName);

  if Table.Column.Count = 0 then
  begin
    Table.Column.Add().StyleID := SDate_Style_ID; // A
    Table.Column.Add().Width := '78'; // B
    Table.Column.Add().Width := '40.5'; // C
    Column := Table.Column.Add(); // D
  //  Column.AutoFitWidth := 1; // werkt niet op tekst kolommen
    Column.Width := '121.5';
    Column := Table.Column.Add(); // E
  //  Column.AutoFitWidth := 1; // werkt niet op formula kolommen, en je kan Data.Type_ niet zetten zonder de value te berekenen
    Column.Width := '22.5';
    Column.StyleID := SEnglishWeekday_Style_ID;
    Table.Column.Add().StyleID := SDateTime_Style_ID; // F
    Table.Column.Add().StyleID := SDate_Style_ID; // SF800DefaultLongDate_Style_ID; // G
    Table.Column.Add().StyleID := SF400DefaultTime_Style_ID; // H
    Table.Column.Add().Width := '58.5'; // I
    Table.Column.Add().Width := '55.5'; // J
    Table.Column.Add().Width := '18.75'; // K
    Table.Column.Add().Width := '37.5'; // L
    Table.Column.Add().StyleID := SF400DefaultTime_Style_ID; // M
  end;

  MaxColumnCount := 0;

  cascallFile := CreateCascallFileStrings(cascallFileName);
  try
    First := True;
    for cascallLine in cascallFile do
    begin
      spacedCascallLine := cascallLine;
      if First then
      begin
        if not StartsStr(ThreeSpaces, cascallLine) then
          spacedCascallLine := ThreeSpaces + cascallLine;
        First := False;
      end;
      if Trim(spacedCascallLine) <> NullAsStringValue  then
      begin
        ColumnCount := ParseLine(Table, spacedCascallLine);
        if ColumnCount > MaxColumnCount then
          MaxColumnCount := ColumnCount;
      end;
    end;

//    Table.ExpandedColumnCount := MaxColumnCount;
//    Table.ExpandedRowCount := Table.Row.Count;
    Table.FullColumns := 1;
    Table.FullRows := 1;
  finally
    cascallFile.Free;
  end;
end;

procedure TXokumToExcelXml.ParseCommandLineStrings;
var
  CommandLineStrings: TStrings;
  DirectoryFiles: TStrings;
  Index: Integer;
  CommandLineString: string;
  Directory: string;
  Workbook: IXMLWorkbookType;
  Table: IXMLTableType;
  DirectoryFile: string;
begin
  CommandLineStrings := CreateCommandLineStrings;
  try
    if (CommandLineStrings.Count = 2) and (DirectoryExists(CommandLineStrings[1])) then
    begin
      Table := CreateWorkbookWorksheetTable(Workbook);
      DirectoryFiles := TStringList.Create();
      try
        Directory := IncludeTrailingPathDelimiter(CommandLineStrings[1]);
        Writeln('Directory:', ''#9'', Directory);
        GetFilenames(DirectoryFiles, Directory, 'cascall*.log');
        for DirectoryFile in DirectoryFiles do
        begin
          Writeln('DirectoryFile:', ''#9'', DirectoryFile);
          Parse(Directory + DirectoryFile, Table);
        end;
        TWorkbookProducer.SaveXml(Directory + 'cascall.xml', Workbook);
      finally
        DirectoryFiles.Free;
      end;
    end
    else
    for Index := 1 to CommandLineStrings.Count - 1 do
    begin
      CommandLineString := CommandLineStrings[Index];
      Writeln('CommandLineString:', ''#9'', Index, ''#9'', CommandLineString);
      Table := CreateWorkbookWorksheetTable(Workbook);
      Parse(CommandLineString, Table);
      TWorkbookProducer.SaveXml(CommandLineString, Workbook);
    end;
  finally
    CommandLineStrings.Free;
  end;
end;

function TXokumToExcelXml.ParseLine(const Table: IXMLTableType; const cascallLine: string): Integer;
var
  Adoptie: string;
  Cell: IXMLCellType;
  Data: string;
  Date: TDateTime;
  DateTime: TDateTime;
  WeekDay: string;
  Day: string;
  Functie: string;
  Hour: string;
  InterchangeFormat: string;
  Minute: string;
  Month: string;
  Row: IXMLRowType;
  Second: string;
begin
//   Mon Jun 20 08:33:24 AC99UC000 C06NPL00  OF             OF  C
//1234567890123456789012345678901234567890123456789012345678901234567890
//         1         2         3         4         5         6         7
  WeekDay := MidStr(cascallLine, 3, 3);
  Month := MidStr(cascallLine, 8, 3);
  Day := MidStr(cascallLine, 12, 2);
  Hour := MidStr(cascallLine, 15, 2);
  Minute := MidStr(cascallLine, 18, 2);
  Second := MidStr(cascallLine, 21, 2);
  Adoptie := MidStr(cascallLine, 24, 9);
  InterchangeFormat := MidStr(cascallLine, 34, 8);
  Functie := MidStr(cascallLine, 44, 2);
  Data := MidStr(cascallLine, 59, 5);

  Row := Table.Row.Add();
  Cell := Row.Add();
  Date := EncodeDate(StrToInt(MidStr(FDate, 1, 4)), StrToInt(MidStr(FDate, 5, 2)), StrToInt(MidStr(FDate, 7, 2)));
  TWorkbookProducer.SetCellDataDateTime(Cell, Date);
  TWorkbookProducer.SetCellData(Row.Add(), FWorkstationName);
  TWorkbookProducer.SetCellData(Row.Add(), FCorporateKey);
  TWorkbookProducer.SetCellData(Row.Add(), FFullName);

  //  TWorkbookProducer.SetCellData(Row.Add(), WeekDay); // see how to calculate the weekday using a formula below:
  Cell := Row.Add();
  Cell.Formula := '=RC[1]'; // one cell to the right; no need to set the Cell's Data
//    <Cell ss:Formula="=RC[1]"><Data ss:Type="DateTime">2011-05-20T08:33:00.000</Data></Cell>

  DateTime := EncodeDateTime(CurrentYear, MonthIndex(Month), StrToInt(Day), StrToInt(Hour), StrToInt(Minute), StrToInt(Second), 0);
  TWorkbookProducer.SetCellDataDateTime(Row.Add(), DateTime);

  Cell := Row.Add(); // now only the date portion for sorting individual days
  Cell.Formula := '=DATE(YEAR(RC[-1]),MONTH(RC[-1]),DAY(RC[-1]))'; // one cell to the left
  Cell := Row.Add(); // now only the time portion for sorting over the course of the day
  Cell.Formula := '=TIME(HOUR(RC[-2]),MINUTE(RC[-2]),SECOND(RC[-2]))'; // two cells to the left

//  TWorkbookProducer.SetCellData(Row.Add(), Month);
//  TWorkbookProducer.SetCellData(Row.Add(), Day);
//  TWorkbookProducer.SetCellData(Row.Add(), Hour);
//  TWorkbookProducer.SetCellData(Row.Add(), Minute);
//  TWorkbookProducer.SetCellData(Row.Add(), Second);

  TWorkbookProducer.SetCellData(Row.Add(), Adoptie);
  TWorkbookProducer.SetCellData(Row.Add(), InterchangeFormat);
  TWorkbookProducer.SetCellData(Row.Add(), Functie);
  TWorkbookProducer.SetCellData(Row.Add(), Data);

  Cell := Row.Add();
  Cell.Formula := '=RC[-7]-R[-1]C[-7]'; // difference between the DateTime column C[-7] of us, and the previous row R[-1]

  Result := Row.Count;
end;

procedure TXokumToExcelXml.ParseMetaInformation(const cascallFileName: string);
const
  SCascallPrefix = 'cascall.';
  SLogSuffix = '.log';
  SExampleDatePortion = '20110620';
  SExampleDateTimePortion = '20110706112338';
  SPeriod = '.';
  function IsValidPortion(const DatePortion: String; const ExamplePortion: string): Boolean;
  begin
    Result := (Length(DatePortion) = (1 + Length(ExamplePortion))) and (DatePortion[1] = SPeriod);
  end;
var
  Date: Int64;
  DatePortion: string;
  FirstPeriod: Integer;
  MetaInformation: string;
begin
  // 'cascall.JU03HV.Bobbe, P.J.L. (Paul).20110620.log';

  MetaInformation := ExtractFileName(cascallFileName);
  if StartsStr(SCascallPrefix, MetaInformation) and EndsStr(SLogSuffix, MetaInformation) then
  begin
    Delete(MetaInformation, 1, Length(SCascallPrefix));
    Delete(MetaInformation, 1 + Length(MetaInformation) - Length(SLogSuffix), Length(SLogSuffix));
    // first: try to get the datetime or date portion
    DatePortion := ExtractFileExt(MetaInformation);
    if IsValidPortion(DatePortion, SExampleDatePortion) or
       IsValidPortion(DatePortion, SExampleDateTimePortion) then
    begin
      Delete(MetaInformation, 1 + Length(MetaInformation) - Length(DatePortion), Length(DatePortion));
      Delete(DatePortion, 1, Length(SPeriod));
      if TryStrToInt64(DatePortion, Date) then
        FDate := DatePortion;
    end;
    FirstPeriod := Pos(SPeriod, MetaInformation);
    if FirstPeriod > 0 then
    begin
      FWorkstationName := AnsiUpperCase(MidStr(MetaInformation, 1, FirstPeriod-1));
      if StartsText('WPNL', FWorkstationName) then
      begin
        Delete(MetaInformation, 1, 1 + Length(FWorkstationName));
      end
      else
        FWorkstationName := NullAsStringValue;

      FirstPeriod := Pos(SPeriod, MetaInformation);
      FCorporateKey := MidStr(MetaInformation, 1, FirstPeriod-1);
      FFullName := MidStr(MetaInformation, 1 + FirstPeriod, Length(MetaInformation) - FirstPeriod);
    end;
  end;
end;

destructor TXokumToExcelXml.Destroy;
begin
  FreeAndNil(FMonthNames);
  inherited Destroy();
end;

class procedure TXokumToExcelXml.Main;
var
  Success: HResult;
begin
  // see http://chrisbensen.blogspot.com/2007/06/delphi-tips-and-tricks_26.html
  Success := CoInitializeEx(nil, COINIT_APARTMENTTHREADED);
  try
    with TXokumToExcelXml.Create() do
    try
      ParseCommandLineStrings();
    finally
      Free;
    end;
  finally
    CoUninit(Success, 'main');
  end;
end;

function TXokumToExcelXml.CreateCascallFileStrings(const cascallFileName: string): TStrings;
var
  BinaryCascallLogStream: TMemoryStream;
  TextCascallLogStream: TMemoryStream;
  Value: Byte;
begin
  BinaryCascallLogStream := TMemoryStream.Create;
  try
    BinaryCascallLogStream.LoadFromFile(cascallFileName);
    // now strip out the binary values (especially zero's, but XML doesn't like anything below space)
    // and replace them with spaces
    BinaryCascallLogStream.Seek(0, soFromBeginning);
    TextCascallLogStream := TMemoryStream.Create();
    try
      while BinaryCascallLogStream.Read(Value, SizeOf(Value)) = SizeOf(Value) do
      begin
        if Value < Ord(CSpace) then
        if (Value = CR) or (Value = LF)  then
        else
          Value := Ord(CSpace);
        TextCascallLogStream.Write(Value, SizeOf(Value));
      end;

      TextCascallLogStream.Seek(0, soFromBeginning);
      Result := TStringList.Create();
      Result.LoadFromStream(TextCascallLogStream);
    finally
      TextCascallLogStream.Free;
    end;
  finally
    BinaryCascallLogStream.Free;
  end;
end;

function TXokumToExcelXml.CreateWorkbookWorksheetTable(var Workbook: IXMLWorkbookType): IXMLTableType;
var
  Worksheet: IXMLWorksheetType;
begin
  Workbook := TWorkbookProducer.CreateWorkbook;
  Workbook.DocumentProperties.LastAuthor := ChangeFileExt(ExtractFileName(ParamStr(0)), '');
  Workbook.DocumentProperties.Created := TIso8601.UtcDateTimeToIso8601(TIso8601.UTCNow);
  Workbook.DocumentProperties.LastSaved := Workbook.DocumentProperties.LastSaved;
  Workbook.DocumentProperties.Version := Excel2003_Workbook_DocumentProperties_Version;
  Worksheet := TWorkbookProducer.CreateWorksheet(Workbook);
  Worksheet.Name := 'CasCallLog';
  Result := Worksheet.Table.Add();
end;

end.
