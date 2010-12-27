unit MainFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, OleCtrls, SHDocVw, xmldom, XMLIntf, LoggerUnit, StringListWrapperUnit, LoggerInterfaceUnit;

// example XML from
// 1. http://support.microsoft.com/kb/280457
// 2. http://msdn.microsoft.com/en-us/library/ms756048(VS.85).aspx
type
  TMainForm = class(TForm)
    HistoryMemo: TMemo;
    LoadXmlButton: TButton;
    ActionPanel: TPanel;
    ResultsGroupBox: TGroupBox;
    ResultsMemo: TMemo;
    RunButton: TButton;
    ShowNameSpacesButton: TButton;
    ShowTextInResultCheckBox: TCheckBox;
    ShowXmlInResultCheckBox: TCheckBox;
    Splitter1: TSplitter;
    HistoryTabSheet: TTabSheet;
    XmlGroupBox: TGroupBox;
    XmlMemo: TMemo;
    XmlMemoTabSheet: TTabSheet;
    XmlOpenDialog: TOpenDialog;
    XmlPageControl: TPageControl;
    XmlViewTabSheet: TTabSheet;
    XmlWebBrowser: TWebBrowser;
    XPathLabeledEdit: TLabeledEdit;
    LoadXmlExample1Button: TButton;
    LoadXmlExample2Button: TButton;
    HistoryListBox: TListBox;
    HistoryGroupBox: TGroupBox;
    ShowMsxml6Version: TButton;
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
  strict protected
    procedure AddXPathQueryToHistory; overload; virtual;
    procedure AddXPathQueryToHistory(const XPathQuery: string); overload; virtual;
    procedure ClearMemoAndShowXmlNamespaces; virtual;
    function GetLogger: ILogger; virtual;
    function GetXml: string; virtual;
    function GetXPathQuery: string; virtual;
    procedure LoadXmlAndShowNamespaces; virtual;
    procedure LoadXmlExample(const XPathQueries, XmlLines: array of string); virtual;
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
  WebBrowserHelperUnit, XMLDoc, LoggersUnit, StringUtilsUnit, XmlHelperUnit, msxmldom, msxml, msxmlFactoryUnit;

{$R *.dfm}

procedure TMainForm.LoadXmlButtonClick(Sender: TObject);
begin
  LoadXmlAndShowNamespaces();
end;

procedure TMainForm.RunButtonClick(Sender: TObject);
begin
  RunXPath();
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

procedure TMainForm.ClearMemoAndShowXmlNamespaces;
var
  NamespaceIXMLNode: IXMLNode;
  NamespaceIXMLNodeArray: TIXMLNodeArray;
  PrefixWithDoubleQuotedNamespaceURI: string;
  DOMNodeSelect: IDOMNodeSelect;
  Document: IXMLDocument;
begin
  try
    IXMLNodeHelper.CreateDocumentAndDOMNodeSelect(Xml, Document, DOMNodeSelect);
    ResultsMemo.Clear;
    NamespaceIXMLNodeArray := IXMLNodeHelper.FindNamespaceDecls(Document.DocumentElement);
    for NamespaceIXMLNode in NamespaceIXMLNodeArray do
    begin
      //      Logger.Log('Prefix', NamespaceIXMLNode.Prefix); // always xmlns
      //      Logger.Log('LocalName', NamespaceIXMLNode.LocalName); // the prefix
      //      Logger.Log('NodeValue', string(NamespaceIXMLNode.NodeValue)); // the URI
      PrefixWithDoubleQuotedNamespaceURI := Format('%s="%s"', [NamespaceIXMLNode.NodeName, string(NamespaceIXMLNode.NodeValue)]);
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

procedure TMainForm.RunXPath;
var
  Length: Integer;
  Index: Integer;
  DOMNodeList: IDOMNodeList;
  DOMNodeSelect: IDOMNodeSelect;
  DOMNode: IDOMNode;
  XMLDocument: IXMLDocument;
  DOMNodeEx: IDOMNodeEx;
begin
  ClearMemoAndShowXmlNamespaces();
  Logger.Log('');
  try
    // Step 1: Load the XML and get references to the right interfaces
    IXMLNodeHelper.CreateDocumentAndDOMNodeSelect(Xml, XMLDocument, DOMNodeSelect);
    // Step 2: Run the query with the helper (it will load perform the correct SelectionNamespaces first)
    DOMNodeList := IXMLNodeHelper.RunXPathQuery(XMLDocument, XPathQuery);

    Length := DOMNodeList.length;
    if Length = 0 then
      Logger.Log('No nodes returned from the XPathQuery query')
    else
      for Index := 0 to Length - 1 do
      begin
        DOMNode := DOMNodeList.item[Index];
        Logger.Log('nodeName', Index, DOMNode.nodeName);
        Logger.Log('nodeValue', Index, string(DOMNode.nodeValue));
        DOMNodeEx := DOMNode as IDOMNodeEx;
        if ShowXmlInResultCheckBox.Checked then
        begin
          Logger.Log('xml', Index, '');
          Logger.Log(DOMNodeEx.xml);
        end;
        if ShowTextInResultCheckBox.Checked then
          Logger.Log('text', Index, DOMNodeEx.text);
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

procedure TMainForm.AddXPathQueryToHistory(const XPathQuery: string);
begin
  if HistoryListBox.Items.IndexOf(XPathQuery) = -1 then
    HistoryListBox.Items.Add(XPathQuery);
  HistoryMemo.Lines.Add(XPathQuery);
end;

procedure TMainForm.AddXPathQueryToHistory;
begin
  AddXPathQueryToHistory(XPathQuery);
end;

procedure TMainForm.HistoryListBoxClick(Sender: TObject);
begin
  UpdateXPathLabeledEditTextFromHistoryListBox();
end;

procedure TMainForm.ShowMsxml6VersionClick(Sender: TObject);
begin
  Logger.Log(TmsxmlFactory.msxml6FileVersion.ToString());
  try
    TmsxmlFactory.AssertCompatibleMsxml6Version();
  except
    on E: Exception do
      Logger.Log(E);
  end;
end;

end.
