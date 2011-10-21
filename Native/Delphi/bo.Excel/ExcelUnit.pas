unit ExcelUnit;

interface

uses
  ExcelXmlUnit,
  XMLIntf;

const
  CSpace = ' ';
  SDateTime = 'DateTime';
  Excel2003_Workbook_DocumentProperties_Version = '11.9999';

type
  TIso8601 = class(TObject)
  public
    class function DateTimeFromIso8601(const Value: string): TDateTime; static;
    class function UtcDateTimeToIso8601(const Value: TDateTime): string; static;
    class function DateTimeToIso8601(const Value: TDateTime): string; static;
    class function UtcNow: TDateTime; static;
    class function ToUtc(const Value: TDateTime): TDateTime; static;
    class function FromUtc(const Value: TDateTime): TDateTime; static;
  end;

  TWorkbookProducer = class(TObject)
  private
    FProduct: IXMLWorkbookType;
    procedure BoldifyIfNeeded(const Style: IXMLStyleType; const Bold: Boolean);
  strict protected
    constructor Create;
    class procedure AddAttribute(const XmlNode: IXMLNode; const namespacePrefix, namespaceUri: string); virtual;
    procedure AddStyles(const Bold: Boolean); virtual;
    property Product: IXMLWorkbookType read FProduct;
  public
    class function CreateWorkbook: IXMLWorkbookType; static;
    class function CreateWorksheet(const Workbook: IXMLWorkbookType): IXMLWorksheetType; static;
    class procedure SaveXml(const xmlFileName: string; const Workbook: IXMLWorkbookType; const PrettyPrintXml: Boolean = True); static;
    class function Boldify(const Cell: IXMLCellType): IXMLCellType; static;
    class function SetCellData(const Cell: IXMLCellType; const Value: string): IXMLCellType; static;
    class procedure SetCellDataDateTime(const Cell: IXMLCellType; const Value: TDateTime); static;
  end;

const
  SBold_Style_ID_Suffix = 'Bold';
  SDefault_Style_ID = 'Default';
  SDate_Style_ID = 'Date';
  SDateTime_Style_ID = 'DateTime';
  SEnglishWeekday_Style_ID = 'EnglishWeekday';
  SF400DefaultTime_Style_ID = 'F400';
  SF800DefaultLongDate_Style_ID = 'F800';

implementation

uses
  XSBuiltIns, IdGlobal, SysUtils, IdGlobalProtocols, Classes, XMLDoc, Variants,
  System.IOUtils;

const
  SF400_Style_NumberFormat_Format = '[$-F400]';
  SF800_Style_NumberFormat_Format = '[$-F800]';
  S409Ddd_Style_NumberFormat_Format = '[$-409]ddd';
  SYyyyMmDdHMmSs_Style_NumberFormat_Format = 'yyyy/mm/dd\ h:mm:ss';
  SYyyyMmDd_Style_NumberFormat_Format = 'yyyy/mm/dd';
  SBottom_Style_Alignment = 'Bottom';
  SNormal_Style_Name = 'Normal';
  STRUE = 'TRUE';
  SFALSE = 'FALSE';
  SString = 'String';

class function TIso8601.DateTimeFromIso8601(const Value: string): TDateTime;
begin
  with TXSDateTime.Create() do
  try
    XSToNative(value); // convert from WideString
    Result := AsDateTime; // convert to TDateTime  finally
  finally
    Free();
  end;
end;

class function TIso8601.UtcDateTimeToIso8601(const Value: TDateTime): string;
begin
  with TXSDateTime.Create() do
  try
    AsUTCDateTime := Value;
    Result := NativeToXS; // convert to WideString
  finally
    Free();
  end;
end;

class function TIso8601.DateTimeToIso8601(const Value: TDateTime): string;
begin
  with TXSDateTime.Create() do
  try
    AsDateTime := Value; // convert from TDateTime
    Result := NativeToXS; // convert to WideString
  finally
    Free();
  end;
end;

class function TIso8601.UtcNow: TDateTime;
begin
  Result := ToUtc(Now);
end;

class function TIso8601.ToUtc(const Value: TDateTime): TDateTime;
var
  Bias: TDateTime;
begin
  Bias := TimeZoneBias;
  Result := Value + TimeZoneBias;
end;

class function TIso8601.FromUtc(const Value: TDateTime): TDateTime;
var
  Bias: TDateTime;
begin
  Bias := TimeZoneBias;
  Result := Value - TimeZoneBias;
end;

constructor TWorkbookProducer.Create;
var
  msoProcessingInstructionXmlNode: IXMLNode;
  namespacePrefix: string;
  namespaceUri: string;
  Style: IXMLStyleType;
  XmlDocument: IXMLDocument;
begin
  inherited Create();
  // add this processing instruction:
  //<?mso-application progid="Excel.Sheet"?>
  FProduct := NewWorkbook;
  XmlDocument := Product.OwnerDocument;
//  XmlDocument.Options := XmlDocument.Options + [doNodeAutoIndent];

  msoProcessingInstructionXmlNode := XmlDocument.CreateNode('mso-application', ntProcessingInstr, 'progid="Excel.Sheet"');
  XmlDocument.ChildNodes.Insert(1, msoProcessingInstructionXmlNode);
{  add the namespaces we need as xmlns attributes
 xmlns="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:o="urn:schemas-microsoft-com:office:office"
 xmlns:x="urn:schemas-microsoft-com:office:excel"
 xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:html="http://www.w3.org/TR/REC-html40"
}
  AddAttribute(Product, 'xmlns', 'urn:schemas-microsoft-com:office:spreadsheet');
  AddAttribute(Product, 'xmlns:o', 'urn:schemas-microsoft-com:office:office');
  AddAttribute(Product, 'xmlns:x', 'urn:schemas-microsoft-com:office:excel');
  AddAttribute(Product, 'xmlns:ss', 'urn:schemas-microsoft-com:office:spreadsheet');
  AddAttribute(Product, 'xmlns:html', 'http://www.w3.org/TR/REC-html40');

  AddAttribute(Product.DocumentProperties, 'xmlns', 'urn:schemas-microsoft-com:office:office');

//  <ExcelWorkbook xmlns="urn:schemas-microsoft-com:office:excel">
//  <WindowHeight>9300</WindowHeight>
//  <WindowWidth>15135</WindowWidth>
//  <WindowTopX>120</WindowTopX>
//  <WindowTopY>120</WindowTopY>
//  <AcceptLabelsInFormulas/>
//  <ProtectStructure>False</ProtectStructure>
//  <ProtectWindows>False</ProtectWindows>
// </ExcelWorkbook>

(*TODO: extracted code
  Style := Product.Styles.Add();
  Style.ID := SDefault_Style_ID;
  Style.Name := SNormal_Style_Name;
  Style.Alignment.Vertical := SBottom_Style_Alignment;

  Style := Product.Styles.Add();
  Style.ID := SDate_Style_ID;
  Style.NumberFormat.Format := SYyyyMmDd_Style_NumberFormat_Format;

  Style := Product.Styles.Add();
  Style.ID := SDateTime_Style_ID;
  Style.NumberFormat.Format := SYyyyMmDdHMmSs_Style_NumberFormat_Format;

  Style := Product.Styles.Add();
  Style.ID := SEnglishWeekday_Style_ID;
  Style.NumberFormat.Format := S409Ddd_Style_NumberFormat_Format;

  Style := Product.Styles.Add();
  Style.ID := SF800DefaultLongDate_Style_ID;
  Style.NumberFormat.Format := SF800_Style_NumberFormat_Format;

  Style := Product.Styles.Add();
  Style.ID := SF400DefaultTime_Style_ID;
  Style.NumberFormat.Format := SF400_Style_NumberFormat_Format;

//   <NumberFormat ss:Format="[ENG][$-409]ddd"/>
// <Styles>
//  <Style ss:ID="Default" ss:Name="Normal">
//   <Alignment ss:Vertical="Bottom"/>
//   <Borders/>
//   <Font/>
//   <Interior/>
//   <NumberFormat/>
//   <Protection/>
//  </Style>
//  <Style ss:ID="s22">
//   <NumberFormat ss:Format="yyyy/mm/dd"/>
//  </Style>
//  <Style ss:ID="s23">
//   <NumberFormat ss:Format="yyyy/mm/dd\ h:mm:ss"/>
//  </Style>
//  <Style ss:ID="s31">
//   <NumberFormat ss:Format="[ENG][$-409]ddd"/>
//  </Style>
// </Styles>
*)
  AddStyles(False);
  AddStyles(True);
end;

class procedure TWorkbookProducer.AddAttribute(const XmlNode: IXMLNode; const namespacePrefix, namespaceUri: string);
var
  XmlDocument: IXMLDocument;
  namespaceXmlNode: IXMLNode;
begin
  XmlDocument := XmlNode.OwnerDocument;
  namespaceXmlNode := XmlDocument.CreateNode(namespacePrefix, ntAttribute);
  namespaceXmlNode.Text := namespaceUri;
  XmlNode.AttributeNodes.Add(namespaceXmlNode);
end;

procedure TWorkbookProducer.AddStyles(const Bold: Boolean);
var
  Style: IXMLStyleType;
begin
  Style := Product.Styles.Add();
  Style.ID := SDefault_Style_ID;
  if not Bold then
  begin
    // only one style can have the "Normal" Name, or Excel will give your errors like these:
    //XML ERROR in Style
    //REASON:	Too many tags
    //FILE:	C:\Users\developer\Documents\SVN\bo.codeplex.com\Native\Delphi\Apps\XML\XokumXmlDemo\data\xokum.Excel.xml
    //GROUP:	Styles
    //TAG:	Style
    //ATTRIB:	Name
    //VALUE:	Normal
    Style.Name := SNormal_Style_Name;
  end;
  BoldifyIfNeeded(Style, Bold);
  Style.Alignment.Vertical := SBottom_Style_Alignment;

  Style := Product.Styles.Add();
  Style.ID := SDate_Style_ID;
  BoldifyIfNeeded(Style, Bold);
  Style.NumberFormat.Format := SYyyyMmDd_Style_NumberFormat_Format;

  Style := Product.Styles.Add();
  Style.ID := SDateTime_Style_ID;
  BoldifyIfNeeded(Style, Bold);
  Style.NumberFormat.Format := SYyyyMmDdHMmSs_Style_NumberFormat_Format;

  Style := Product.Styles.Add();
  Style.ID := SEnglishWeekday_Style_ID;
  BoldifyIfNeeded(Style, Bold);
  Style.NumberFormat.Format := S409Ddd_Style_NumberFormat_Format;

  Style := Product.Styles.Add();
  Style.ID := SF800DefaultLongDate_Style_ID;
  BoldifyIfNeeded(Style, Bold);
  Style.NumberFormat.Format := SF800_Style_NumberFormat_Format;

  Style := Product.Styles.Add();
  Style.ID := SF400DefaultTime_Style_ID;
  BoldifyIfNeeded(Style, Bold);
  Style.NumberFormat.Format := SF400_Style_NumberFormat_Format;

  //   <NumberFormat ss:Format="[ENG][$-409]ddd"/>
  // <Styles>
  //  <Style ss:ID="Default" ss:Name="Normal">
  //   <Alignment ss:Vertical="Bottom"/>
  //   <Borders/>
  //   <Font/>
  //   <Interior/>
  //   <NumberFormat/>
  //   <Protection/>
  //  </Style>
  //  <Style ss:ID="s22">
  //   <NumberFormat ss:Format="yyyy/mm/dd"/>
  //  </Style>
  //  <Style ss:ID="s23">
  //   <NumberFormat ss:Format="yyyy/mm/dd\ h:mm:ss"/>
  //  </Style>
  //  <Style ss:ID="s31">
  //   <NumberFormat ss:Format="[ENG][$-409]ddd"/>
  //  </Style>
  // </Styles>;
end;

procedure TWorkbookProducer.BoldifyIfNeeded(const Style: IXMLStyleType; const
    Bold: Boolean);
begin
  if Bold then
  begin
    Style.ID := Style.ID + SBold_Style_ID_Suffix;
    Style.Font.Bold := '1';
  end;
end;

class function TWorkbookProducer.CreateWorkbook: IXMLWorkbookType;
begin
  with TWorkbookProducer.Create() do
  try
    Result := Product;
  finally
    Free();
  end;
end;

class function TWorkbookProducer.CreateWorksheet(const Workbook: IXMLWorkbookType): IXMLWorksheetType;
begin
  Result := Workbook.Worksheet.Add();
  // redefine default xmlns namespace
  AddAttribute(Result.WorksheetOptions, 'xmlns', 'urn:schemas-microsoft-com:office:excel');
end;

class procedure TWorkbookProducer.SaveXml(const xmlFileName: string; const Workbook: IXMLWorkbookType; const PrettyPrintXml: Boolean = True);
var
  PlainXml: string;
  IndentedXml: string;
  ExcelFileName: string;
  Stream: TStream;
begin
  PlainXml := {Workbook.XML; // does not get the processing instructions } Workbook.OwnerDocument.XML.Text;
  try
//    IndentedXml := PlainXml;
    IndentedXml := FormatXMLData(PlainXml); // pretty print the XML
    // Excel 2003 hates the 'Namespace Undeclaration': http://en.wikipedia.org/wiki/XML_namespace#Namespace_undeclaration
    IndentedXml := StringReplace(IndentedXml, ' xmlns="">', '>', [rfReplaceAll]);
    IndentedXml := StringReplace(IndentedXml, ' xmlns="" ', ' ', [rfReplaceAll]);
    except
      on E: Exception do
      begin
        Writeln(E.ClassName, ' ', E.Message);
        Writeln(PlainXml);
        IndentedXml := PlainXml;
      end;
  end;
  ExcelFileName := TPath.ChangeExtension(xmlFileName, '.Excel.xml');
  TFile.WriteAllText(ExcelFileName, IndentedXml);
end;

class function TWorkbookProducer.Boldify(const Cell: IXMLCellType): IXMLCellType;
begin
  Result := Cell;
  Cell.StyleID := SDefault_Style_ID + SBold_Style_ID_Suffix;
end;

class function TWorkbookProducer.SetCellData(const Cell: IXMLCellType; const Value: string): IXMLCellType;
var
  CurrencyValue: Currency;
  DateTimeValue: TDateTime;
  DateValue: TDateTime;
  ExtendedValue: Extended;
  Int64Value: Int64;
  NeedsTick: Boolean;
  StringValue: string;
  TimeValue: TDateTime;
  Character: Char;
begin
  Result := Cell;

  Cell.Data.Type_ := SString;
  for Character in Value do // empirical: Excel doesn't like binary characters, so get rid of them
  begin
    if (Character < CSpace) and (Character <> CR) and (Character <> LF) then
      StringValue := StringValue + '.'
    else
      StringValue := StringValue + Character;
  end;
  Cell.Data.Text := StringValue;
  if Value <> NullAsStringValue then
  begin
    // http://msdn.microsoft.com/en-us/library/aa140066(v=office.10).aspx#odc_xmlss_ss:data
    // Tick (') is needed for all non-text values:
    NeedsTick := AnsiSameText(SFALSE, Value);
    NeedsTick := NeedsTick or AnsiSameText(STRUE, Value);
    NeedsTick := NeedsTick or TryStrToInt64(Value, Int64Value);
    NeedsTick := NeedsTick or TryStrToFloat(Value, ExtendedValue);
    NeedsTick := NeedsTick or TryStrToDate(Value, DateValue);
    NeedsTick := NeedsTick or TryStrToTime(Value, TimeValue);
    NeedsTick := NeedsTick or TryStrToDateTime(Value, DateTimeValue);
    NeedsTick := NeedsTick or TryStrToCurr(Value, CurrencyValue);
    if NeedsTick then
      Cell.Data.Ticked := 1;
  end;
end;

class procedure TWorkbookProducer.SetCellDataDateTime(const Cell: IXMLCellType; const Value: TDateTime);
begin
  Cell.Data.Type_ := SDateTime;
  Cell.Data.Text := TIso8601.UtcDateTimeToIso8601(Value);
end;

end.
