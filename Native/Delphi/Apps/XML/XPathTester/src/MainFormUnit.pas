unit MainFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, OleCtrls, SHDocVw,
  LoggerUnit, StringListWrapperUnit, LoggerInterfaceUnit, xmldom;

// example XML from
// 1. http://support.microsoft.com/kb/280457
// 2. http://msdn.microsoft.com/en-us/library/ms756048(VS.85).aspx
type
  TMainForm = class(TForm)
    ActionPanel: TPanel;
    DomVendorComboBox: TComboBox;
    HistoryGroupBox: TGroupBox;
    HistoryListBox: TListBox;
    HistoryMemo: TMemo;
    HistoryTabSheet: TTabSheet;
    Label1: TLabel;
    LoadXmlButton: TButton;
    LoadXmlExample1Button: TButton;
    LoadXmlExample2Button: TButton;
    ResultsGroupBox: TGroupBox;
    ResultsMemo: TMemo;
    RunButton: TButton;
    ShowMsxml6Version: TButton;
    ShowNameSpacesButton: TButton;
    ShowTextInResultCheckBox: TCheckBox;
    ShowXmlInResultCheckBox: TCheckBox;
    Splitter1: TSplitter;
    XmlGroupBox: TGroupBox;
    XmlMemo: TMemo;
    XmlMemoTabSheet: TTabSheet;
    XmlOpenDialog: TOpenDialog;
    XmlPageControl: TPageControl;
    XmlViewTabSheet: TTabSheet;
    XmlWebBrowser: TWebBrowser;
    XPathLabeledEdit: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure HistoryListBoxClick(Sender: TObject);
    procedure LoadXmlButtonClick(Sender: TObject);
    procedure LoadXmlExample1ButtonClick(Sender: TObject);
    procedure LoadXmlExample2ButtonClick(Sender: TObject);
    procedure RunButtonClick(Sender: TObject);
    procedure ShowMsxml6VersionClick(Sender: TObject);
    procedure ShowNameSpacesButtonClick(Sender: TObject);
    procedure XmlPageControlChange(Sender: TObject);
  strict private
    FLogger: ILogger;
  private
    procedure AddSupportedVersion(Version: string; SupportedVersions: IStringListWrapper);
    procedure FillDomVendorComboBox;
    procedure LogDomVendorFeatures(const CurrentDomVendor: TDOMVendor; const Versions, Features: array of string);
  strict protected
    procedure AddXPathQueryToHistory; overload; virtual;
    procedure AddXPathQueryToHistory(const XPathQuery: string); overload; virtual;
    procedure ClearMemoAndShowXmlNamespaces; virtual;
    function GetLogger: ILogger; virtual;
    function GetXml: string; virtual;
    function GetXPathQuery: string; virtual;
    procedure LoadXmlAndShowNamespaces; virtual;
    procedure LoadXmlExample(const XPathQueries, XmlLines: array of string); virtual;
    procedure LogDomVendor(const CurrentDomVendor: TDOMVendor); virtual;
    procedure RunXPath; virtual;
    procedure SetXml(const Value: string); virtual;
    procedure SetXPathQuery(const Value: string); virtual;
    procedure UpdateXPathLabeledEditTextFromHistoryListBox; virtual;
    property Logger: ILogger read GetLogger;
    property Xml: string read GetXml write SetXml;
    property XPathQuery: string read GetXPathQuery write SetXPathQuery;
  end;

var
  MainForm: TMainForm;

implementation

uses
  adomxmldom,
  msxml,
  XmlHelperUnit,
  XMLDoc,
  XMLIntf,
  StringUtilsUnit,
  LoggersUnit,
  msxmlFactoryUnit,
  WebBrowserHelperUnit;

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  FillDomVendorComboBox();
end;

procedure TMainForm.HistoryListBoxClick(Sender: TObject);
begin
  UpdateXPathLabeledEditTextFromHistoryListBox();
end;

procedure TMainForm.LoadXmlButtonClick(Sender: TObject);
begin
  LoadXmlAndShowNamespaces();
end;

procedure TMainForm.LoadXmlExample1ButtonClick(Sender: TObject);
begin
  LoadXmlExample([
    '//bk:Book[position()<=2]'
  ],
  [
    '<?xml version="1.0"?>',
    '<bk:Books xmlns:bk="http://myserver/myschemas/Books">',
    '  <bk:Book>',
    '      <bk:Title>Just XML</bk:Title>',
    '  </bk:Book>',
    '  <bk:Book>',
    '      <bk:Title>Professional XML</bk:Title>',
    '  </bk:Book>',
    '  <bk:Book>',
    '      <bk:Title>XML Step by Step</bk:Title>',
    '  </bk:Book>',
    '  <bk:Book>',
    '      <bk:Title>XML By Example</bk:Title>',
    '  </bk:Book>',
    '</bk:Books>'
  ]);
end;

procedure TMainForm.LoadXmlExample2ButtonClick(Sender: TObject);
begin
  LoadXmlExample([
    '//root',
    '//a:root',
    '//branch',
    '//a:branch',
    '//b:branch'
  ],
  [
    '<?xml version="1.0"?>',
    '<root>',
    '<branch>branch</branch>',
    '<a:root xmlns:a="http://myserver.com">',
    '<a:branch>a-branch</a:branch>',
    '<b:branch xmlns:b="http://yourserver.com">',
    'b-branch',
    '</b:branch>',
    '</a:root>',
    '</root>'
  ]);
end;

procedure TMainForm.RunButtonClick(Sender: TObject);
begin
  RunXPath();
end;

procedure TMainForm.ShowMsxml6VersionClick(Sender: TObject);
begin
{
Windows 2003 with MSXML 3:
--------------------------
msxml3.dll: 8.100.1050.0
Error
Exception "ENotSupportedException", at 0051351A: "msxml6.dll must be newer than version 6.20.1099.* (you need 6.30.*, 6.20.1103.*, 6.20.2003.0 or higher), but you have version msxml3.dll: 8.100.1050.0"

windows XP with MSXML 4:
------------------------
msxml4.dll: 4.20.9818.0
Error
Exception "ENotSupportedException", at 00513536: "msxml6.dll must be newer than version 6.20.1099.* (you need 6.30.*, 6.20.1103.*, 6.20.2003.0 or higher), but you have version msxml4.dll: 4.20.9818.0"

Windows XP with MSXML 6 SP1:
------------------------
msxml6.dll: 6.10.1129.0
Error
Exception "ENotSupportedException", at 00513536: "msxml6.dll must be newer than version 6.20.1099.* (you need 6.30.*, 6.20.1103.*, 6.20.2003.0 or higher), but you have version msxml6.dll: 6.10.1129.0"

windows XP with MSXML 6 SP2 (latest):
------------------------
msxml6.dll: 6.20.1103.0

Windows 7 with MSXML 6 SP3:
--------------------------
msxml6.dll: 6.30.7600.16385
}
  try
    Logger.Log(TmsxmlFactory.msxmlBestFileVersion.ToString());
    TmsxmlFactory.AssertCompatibleMsxml6Version();
  except
    on E: Exception do
    begin
      Logger.Log('Error');
      Logger.Log(E);
    end;
  end;
end;

procedure TMainForm.ShowNameSpacesButtonClick(Sender: TObject);
begin
  ClearMemoAndShowXmlNamespaces();
end;

procedure TMainForm.XmlPageControlChange(Sender: TObject);
begin
  if XmlPageControl.ActivePage = XmlViewTabSheet then
    XmlWebBrowser.LoadFromXmlString(Xml);
end;

procedure TMainForm.AddSupportedVersion(Version: string; SupportedVersions: IStringListWrapper);
begin
  if Version = NullAsStringValue then
    SupportedVersions.Add('Any')
  else
    SupportedVersions.Add(Version);
end;

procedure TMainForm.FillDomVendorComboBox;
var
  DomVendorComboBoxItemsCount: Integer;
  Index: Integer;
  CurrentDomVendor: TDOMVendor;
  DefaultDomVendorIndex: Integer;
  CurrentDomVendorDescription: string;
const
  NoSelection = -1;
begin
  DomVendorComboBox.Clear;
  DefaultDomVendorIndex := NoSelection;
  for Index := 0 to DOMVendors.Count - 1 do
  begin
    CurrentDomVendor := DOMVendors.Vendors[Index];
    LogDomVendor(CurrentDomVendor);
    CurrentDomVendorDescription := CurrentDomVendor.Description;
    DomVendorComboBox.Items.Add(CurrentDomVendorDescription);
    if DefaultDOMVendor = CurrentDomVendorDescription then
      DefaultDomVendorIndex := DomVendorComboBox.Items.Count - 1;
  end;
  DomVendorComboBoxItemsCount := DomVendorComboBox.Items.Count;
  if (DefaultDomVendorIndex = NoSelection) then
  begin
    if DefaultDOMVendor = NullAsStringValue then
    begin
      if DomVendorComboBoxItemsCount > 0 then
        DefaultDomVendorIndex := 0;
    end
    else
      DefaultDomVendorIndex := DomVendorComboBoxItemsCount - 1;
  end;
  DomVendorComboBox.ItemIndex := DefaultDomVendorIndex;
end;

procedure TMainForm.LogDomVendorFeatures(const CurrentDomVendor: TDOMVendor; const Versions, Features: array of string);
var
  AllVersions: string;
  Feature: string;
  Line: string;
  Supported: Boolean;
  SupportedAll: Boolean;
  SupportedNone: Boolean;
  SupportedVersions: IStringListWrapper;
  Version: string;
begin
  SupportedVersions := TStringListWrapper.Create();
  for Version in Versions do
    AddSupportedVersion(Version, SupportedVersions);
  AllVersions := Format('All: %s', [SupportedVersions.CommaText]);
  for Feature in Features do
  begin
    SupportedAll := True;
    SupportedNone := True;
    SupportedVersions.Clear();
    for Version in Versions do
    begin
      Supported := CurrentDomVendor.DOMImplementation.hasFeature(Feature, Version);
      if Supported then
        AddSupportedVersion(Version, SupportedVersions);
      SupportedAll := SupportedAll and Supported;
      SupportedNone := SupportedNone and not Supported;
    end;
    if SupportedNone then
      Line := Format('None', [])
    else
    if SupportedAll then
      Line := Format('%s', [AllVersions])
    else
      Line := Format('%s', [SupportedVersions.CommaText]);
    Logger.Log('  ' + Feature, Line);
  end;
end;

procedure TMainForm.AddXPathQueryToHistory;
begin
  AddXPathQueryToHistory(XPathQuery);
end;

procedure TMainForm.AddXPathQueryToHistory(const XPathQuery: string);
begin
  if HistoryListBox.Items.IndexOf(XPathQuery) = -1 then
    HistoryListBox.Items.Add(XPathQuery);
  HistoryMemo.Lines.Add(XPathQuery);
end;

procedure TMainForm.ClearMemoAndShowXmlNamespaces;
var
  DomDocument: IDOMDocument;
  DomNodeSelect: IDOMNodeSelect;
  NamespaceIDomNode: IDOMNode;
  NamespaceIDomNodeArray: IDOMNodeArray;
  PrefixWithDoubleQuotedNamespaceURI: string;
begin
  try
    IDomNodeHelper.CreateDocumentAndDOMNodeSelect(Xml, DomDocument, DomNodeSelect);
    ResultsMemo.Clear;
    NamespaceIDomNodeArray := IDomNodeHelper.FindNamespaceDecls(DomDocument.documentElement);
    for NamespaceIDomNode in NamespaceIDomNodeArray do
    begin
      //      Logger.Log('Prefix', NamespaceIDomNode.Prefix); // always xmlns
      //      Logger.Log('LocalName', NamespaceIDomNode.LocalName); // the prefix
      //      Logger.Log('NodeValue', string(NamespaceIDomNode.NodeValue)); // the URI
      PrefixWithDoubleQuotedNamespaceURI := Format('%s="%s"', [NamespaceIDomNode.NodeName, string(NamespaceIDomNode.NodeValue)]);
      Logger.Log(PrefixWithDoubleQuotedNamespaceURI);
    end;
  except
    on E: Exception do
      Logger.Log(E);
  end;
end;

function TMainForm.GetLogger: ILogger;
begin
  if not Assigned(FLogger) then begin
    FLogger := TTeeLogger.Create([TStringsLogger.Create(ResultsMemo.Lines)]);
  end;
  Result := FLogger;
end;

function TMainForm.GetXml: string;
begin
  Result := XmlMemo.Text;
end;

function TMainForm.GetXPathQuery: string;
begin
  Result := XPathLabeledEdit.Text;
end;

procedure TMainForm.LoadXmlAndShowNamespaces;
begin
  if XmlOpenDialog.Execute then
  begin
    Xml := LoadFromFile(XmlOpenDialog.FileName);
    ClearMemoAndShowXmlNamespaces();
  end;
end;

procedure TMainForm.LoadXmlExample(const XPathQueries, XmlLines: array of string);
var
  XmlLine: string;
  XPathQuery: string;
begin
  XPathQuery := NullAsStringValue;
  HistoryListBox.Clear();
  for XPathQuery in XPathQueries do
    AddXPathQueryToHistory(XPathQuery);
  XmlMemo.Clear();
  for XmlLine in XmlLines do
    XmlMemo.Lines.Add(XmlLine);
  ClearMemoAndShowXmlNamespaces();
  if HistoryListBox.Items.Count > 0 then
  begin
    HistoryListBox.ItemIndex := 0;
    UpdateXPathLabeledEditTextFromHistoryListBox();
    // add a "splitter" line for better visual appearance
    if HistoryMemo.Lines.Count <> 0 then
      HistoryMemo.Lines.Add(NullAsStringValue);
  end;
end;

procedure TMainForm.LogDomVendor(const CurrentDomVendor: TDOMVendor);
var
  CurrentDomVendorDescription: string;
  DocumentElement: IDOMElement;
  DomDocument: IDOMDocument; // xmldom.IDOMDocument is the plain XML DOM
  XmlDocument: IXMLDocument; // XMLIntf.IXMLDocument is the enrichted XML interface to the TComponent wrapper, which has a DOMDocument: IDOMDocument poperty, and allows obtaining XML from different sources (text, file, stream, etc)
  XmlDocumentInstance: TXMLDocument; // unit XMLDoc

  DOMNodeEx: IDOMNodeEx;
  XMLDOMDocument2: IXMLDOMDocument2;
begin
  CurrentDomVendorDescription := CurrentDomVendor.Description;
  Logger.Log('DOMVendor', CurrentDomVendorDescription);

  XmlDocumentInstance := TXMLDocument.Create(nil);
  XmlDocumentInstance.DOMVendor := CurrentDomVendor;
  XmlDocument := XmlDocumentInstance;

  DomDocument := CurrentDomVendor.DOMImplementation.createDocument(NullAsStringValue, NullAsStringValue, nil);

  XmlDocument.DOMDocument := DomDocument;
  XmlDocument.LoadFromXML('<document/>');
  DomDocument := XmlDocument.DOMDocument; // we get another reference here, since we loaded some XML now

  DocumentElement := DomDocument.DocumentElement;
  if Assigned(DocumentElement) then
  begin
    DOMNodeEx := DocumentElement as IDOMNodeEx;
    Logger.Log(DOMNodeEx.xml);
  end;

  if IDomNodeHelper.GetXmlDomDocument2(DomDocument, XMLDOMDocument2) then
  begin
    // XSLPattern versus XPath
    // see http://stackoverflow.com/questions/784745/accessing-comments-in-xml-using-xpath
    // XSLPattern is 0 based, but XPath is 1 based.
    Logger.Log(IDomNodeHelper.SelectionLanguage, string(XMLDOMDocument2.getProperty(IDomNodeHelper.SelectionLanguage)));
    Logger.Log(IDomNodeHelper.SelectionNamespaces, string(XMLDOMDocument2.getProperty(IDomNodeHelper.SelectionNamespaces)));
  end;


  LogDomVendorFeatures(CurrentDomVendor,
    ['','1.0','2.0', '3.0'],
//http://www.w3.org/TR/DOM-Level-3-Core/introduction.html#ID-Conformance
//http://reference.sitepoint.com/javascript/DOMImplementation/hasFeature
['Core'
,'XML'
,'Events'
,'UIEvents'
,'MouseEvents'
,'TextEvents'
,'KeyboardEvents'
,'MutationEvents'
,'MutationNameEvents'
,'HTMLEvents'
,'LS'
,'LS-Async'
,'Validation'
,'XPath'
]);
end;

procedure TMainForm.RunXPath;
var
  DomDocument: IDOMDocument;
  DomNode: IDOMNode;
  DomNodeEx: IDOMNodeEx;
  DomNodeList: IDOMNodeList;
  DomNodeSelect: IDOMNodeSelect;
  Index: Integer;
  Length: Integer;
begin
  ClearMemoAndShowXmlNamespaces();
  Logger.Log('');
  try
    // Step 1: Load the XML and get references to the right interfaces
    IDomNodeHelper.CreateDocumentAndDOMNodeSelect(Xml, DomDocument, DomNodeSelect);
    // Step 2: Run the query with the helper (it will load perform the correct SelectionNamespaces first)
    DomNodeList := IDomNodeHelper.RunXPathQuery(DomDocument, XPathQuery);

    Length := DomNodeList.length;
    if Length = 0 then
      Logger.Log('No nodes returned from the XPathQuery query')
    else
      for Index := 0 to Length - 1 do
      begin
        DomNode := DomNodeList.item[Index];
        Logger.Log('nodeName', Index, DomNode.nodeName);
        Logger.Log('nodeValue', Index, string(DomNode.nodeValue));
        DomNodeEx := DomNode as IDOMNodeEx;
        if ShowXmlInResultCheckBox.Checked then
        begin
          Logger.Log('xml', Index, '');
          Logger.Log(DomNodeEx.xml);
        end;
        if ShowTextInResultCheckBox.Checked then
          Logger.Log('text', Index, DomNodeEx.text);
      end;
    AddXPathQueryToHistory();
  except
    on E: Exception do
      Logger.Log(E);
  end;
end;

procedure TMainForm.SetXml(const Value: string);
begin
  XmlMemo.Text := Value;
end;

procedure TMainForm.SetXPathQuery(const Value: string);
begin
  XPathLabeledEdit.Text := Value;
end;

procedure TMainForm.UpdateXPathLabeledEditTextFromHistoryListBox;
var
  ItemIndex: Integer;
begin
  ItemIndex := HistoryListBox.ItemIndex;
  if ItemIndex <> -1 then
    XPathLabeledEdit.Text := HistoryListBox.Items[ItemIndex];
end;

end.
