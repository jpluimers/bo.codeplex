unit XmlDataBindingFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, LoggerUnit, ReportersUnit, xokumDataBindingUnit,
  ReporterUnit, LoggerInterfaceUnit;

type
  TXokumDataBindingForm = class(TForm)
    AbonneenummerLabeledEdit: TLabeledEdit;
    AchternaamLabeledEdit: TLabeledEdit;
    AddSubscriberButton: TButton;
    LoadXokumXmlButton: TButton;
    LogMemo: TMemo;
    NummerLabeledEdit: TLabeledEdit;
    Panel1: TPanel;
    StraatLabeledEdit: TLabeledEdit;
    VoorlettersLabeledEdit: TLabeledEdit;
    procedure AddSubscriberButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure LoadXokumXmlButtonClick(Sender: TObject);
  strict private
    FLogger: ILogger;
    FStringsReporter: IReporter;
  strict protected
    function LoadXokumXml: IXMLXokum; virtual;
    procedure LogXokum(xokum: IXMLXokum); virtual;
  public
    function BuildDataFileName(const BaseFileName: string): string;
    property Logger: ILogger read FLogger;
  end;

var
  XokumDataBindingForm: TXokumDataBindingForm;

implementation

uses
  XMLDoc, XMLIntf, ReportingLoggerUnit;

{$R *.dfm}

procedure TXokumDataBindingForm.AddSubscriberButtonClick(Sender: TObject);
var
  Netnummer: Integer;
  xokum: IXMLXokum;
  newXokumRecord: IXMLRecord_;
  Plaats: string;
  xokumDocument: IXMLDocument;
begin
  xokum := LoadXokumXml();
  Plaats := xokum[0].Plaats;
  Netnummer := xokum[0].Netnummer;

  xokum := xokumDataBindingUnit.Newxokum;
  newXokumRecord := xokum.Add;
  newXokumRecord.Achternaam := AchternaamLabeledEdit.Text;
  newXokumRecord.Voorletters := VoorlettersLabeledEdit.Text;
  newXokumRecord.Straat := StraatLabeledEdit.Text;
  newXokumRecord.Nummer := StrToInt(NummerLabeledEdit.Text);
  newXokumRecord.Abonneenummer := StrToInt(AbonneenummerLabeledEdit.Text);
  newXokumRecord.Plaats := Plaats;
  newXokumRecord.Netnummer := Netnummer;

  xokumDocument := xokum.OwnerDocument;
  xokumDocument.SaveToFile(BuildDataFileName('xokum.addedrecord.xml'));
  LogXokum(xokum);
end;

function TXokumDataBindingForm.BuildDataFileName(const BaseFileName: string): string;
begin
  Result := '..\..\..\data\' + BaseFileName;
end;

procedure TXokumDataBindingForm.FormCreate(Sender: TObject);
var
  Strings: TStrings;
begin
  Strings := LogMemo.Lines;
  Strings.Clear();
  FStringsReporter := TStringsReporter.Create(Strings);
  FLogger := TReportingLogger.Create(FStringsReporter);
end;

procedure TXokumDataBindingForm.FormDestroy(Sender: TObject);
begin
  FLogger := nil;
  FStringsReporter := nil;
end;

function TXokumDataBindingForm.LoadXokumXml: IXMLXokum;
begin
  Result := xokumDataBindingUnit.Loadxokum(BuildDataFileName('xokum.xml'));
end;

procedure TXokumDataBindingForm.LoadXokumXmlButtonClick(Sender: TObject);
var
  xokum: IXMLXokum;
begin
  xokum := LoadXokumXml();
  LogXokum(xokum);
end;

procedure TXokumDataBindingForm.LogXokum(xokum: IXMLXokum);
var
  xokumRecord: IXMLRecord_;
  xokumCount: Integer;
  xokumIndex: Integer;
begin
  xokumCount := xokum.Count;
  Logger.Log('xokum.Count', xokumCount);
  for xokumIndex := 0 to XokumCount - 1 do
  begin
    xokumRecord := xokum[xokumIndex];
    Logger.Log('');
    Logger.Log('Achternaam', xokumIndex, xokumRecord.Achternaam);
    Logger.Log('Voorletters', xokumIndex, xokumRecord.Voorletters);
    Logger.Log('Straat', xokumIndex, xokumRecord.Straat);
    if not VarIsNull(xokumRecord.ChildNodes['nummer'].NodeValue) then
      Logger.Log('Nummer', xokumIndex, xokumRecord.Nummer);
    Logger.Log('Abonneenummer', xokumIndex, xokumRecord.Abonneenummer);
    Logger.Log('Plaats', xokumIndex, xokumRecord.Plaats);
    if not VarIsNull(xokumRecord.ChildNodes['Netnummer'].NodeValue) then
      Logger.Log('Netnummer', xokumIndex, xokumRecord.Netnummer);
  end;
  Logger.Log('');
end;

end.
