unit XmlDumperUnit;

interface

uses
  Classes,
  ActiveX,
  msxml;

type
  TXmlDumper = class(TObject)
  strict private
    FDumpStrings: TStrings;
  strict protected
    function GetHaveDump: Boolean; virtual;
    function GetDumpResult: string; virtual;
    function GetDumpStrings: TStrings; virtual;
    procedure DumpNode(const Node: IXMLDOMNode); virtual;
    property HaveDump: Boolean read GetHaveDump;
    property DumpStrings: TStrings read GetDumpStrings;
  public
    destructor Destroy; override;
    function Dump(const XmlFileName: string): Boolean; overload; virtual;
    function Dump(const XmlFileNames: array of string): Boolean; overload; virtual;
    property DumpResult: string read GetDumpResult;
  end;

implementation

uses
  SysUtils,
  Variants,
  ComObj;

destructor TXmlDumper.Destroy;
begin
  inherited;

  FreeAndNil(FDumpStrings);
end;

function TXmlDumper.GetDumpResult: string;
begin
  if HaveDump then
    Result := DumpStrings.Text
  else
    Result := NullAsStringValue;
end;

function TXmlDumper.Dump(const XmlFileName: string): Boolean;
var
  XmlDocument: IXMLDOMDocument3;
  node: IXMLDOMNode;
begin
  XmlDocument := CoFreeThreadedDOMDocument60.Create();
  if not Assigned(XmlDocument) then
    RaiseLastOSError();

  if not XmlDocument.load(XmlFileName) then
    RaiseLastOSError();

  node := XmlDocument.documentElement;

  DumpNode(node);

  Result := not HaveDump;
end;

function CharCount(const S: string; const CharToCount: Char): Integer;
var
  Ch: Char;
begin
  Result := 0;
  for Ch in S do
  begin
    if Ch = CharToCount then
      Inc(Result);
  end;
end;

function TXmlDumper.Dump(const XmlFileNames: array of string): Boolean;
var
  XmlFileName: string;
begin
  for XmlFileName in XmlFileNames do
    Dump(XmlFileName);

  Result := not HaveDump;
end;

procedure TXmlDumper.DumpNode(const Node: IXMLDOMNode);
var
  attribute: IXMLDOMNode;
  attributes: IXMLDOMNamedNodeMap;
  childNode: IXMLDOMNode;
  childNodes: IXMLDOMNodeList;
  HaveNodeValue: Boolean;
  NodeType: DOMNodeType;
  NodeValue: OleVariant;
  NodeValueLength: Integer;
  NodeValueString: string;
  LfCount: Integer;
  CrCount: Integer;
begin
  if not Assigned(Node) then
    Exit;

  NodeType := Node.NodeType;
  NodeValue := Node.nodeValue;

  HaveNodeValue := not VarIsNull(NodeValue);

  DumpStrings.Add(Format('NodeType=%d, NodeName=%s', [NodeType, Node.nodeName]));

  if HaveNodeValue then
  begin
    NodeValueString := NodeValue;
    NodeValueLength := Length(NodeValueString);
    LfCount := CharCount(NodeValueString, #10);
    CrCount := CharCount(NodeValueString, #13);
    DumpStrings.Add(Format('NodeValue-Length=%d, LF-Count=%d, CR-Count=%d', [NodeValueLength, LfCount, CrCount]));
    DumpStrings.Add(NodeValueString);
  end;

  attributes := Node.attributes;
  if Assigned(attributes) then
  begin
    attribute := attributes.nextNode;
    if Assigned(attribute) then
      repeat
        DumpNode(attribute);
        attribute := attributes.nextNode;
      until not Assigned(attribute);

  end;
  childNodes := Node.childNodes;
  if Assigned(childNodes) then
  begin
    childNode := childNodes.nextNode;
    if Assigned(childNode) then
      repeat
        DumpNode(childNode);
        childNode := childNodes.nextNode;
      until not Assigned(childNode);
  end;
end;

function TXmlDumper.GetHaveDump: Boolean;
begin
  Result := Assigned(FDumpStrings)
end;

function TXmlDumper.GetDumpStrings: TStrings;
begin
  if not HaveDump then
    FDumpStrings := TStringList.Create();
  Result := FDumpStrings;
end;

initialization
  // http://chrisbensen.blogspot.com/2007/06/delphi-tips-and-tricks_26.html
  if Assigned(ComObj.CoInitializeEx) then
    ComObj.CoInitializeEx(nil, COINIT_MULTITHREADED)
  else
    CoInitialize(nil);
finalization
  CoUninitialize;
end.

