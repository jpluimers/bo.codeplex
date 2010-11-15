unit XmlHelperUnit;

interface

uses
  XMLIntf, Generics.Collections, Generics.Defaults, xmldom;

type
  TIXMLNodeArray = TArray<IXMLNode>;
  TStringIXMLNodeDictionary = TDictionary<string,IXMLNode>;
  TXMLNodeProc = reference to procedure(const XMLNode: IXMLNode);
  IXMLNodeHelper= class(TObject)
  strict protected
    class function GetDOMNodeSelect(const Document: IXMLDocument): IDOMNodeSelect; virtual;
    class procedure GetNamespaceDeclsFromAttributes(const CurrentXMLNode: IXMLNode; const StringIXMLNodeDictionary: TStringIXMLNodeDictionary); virtual;
    class procedure GetNamespaceDeclsFromAttributesAndParents(const CurrentXMLNode: IXMLNode; const StringIXMLNodeDictionary: TStringIXMLNodeDictionary); virtual;
    class procedure ProcessNodeAndChildren(const ParentXMLNode: IXMLNode; const XMLNodeProc: TXMLNodeProc); virtual;
    class procedure ProcessNodeAndSibblings(const FirstChildXMLNode: IXMLNode; const XMLNodeProc: TXMLNodeProc); virtual;
  public
    class procedure CreateDocumentAndDOMNodeSelect(const Xml: string; var Document: IXMLDocument; var DOMNodeSelect: IDOMNodeSelect); virtual;
    class function FindNamespaceDecls(const XMLNode: IXMLNode): TIXMLNodeArray; virtual;
    class function FindSpaceDelimitedNamespaceDecls(const XMLNode: IXMLNode): string; virtual;
    class procedure Recurse(const XMLNode: IXMLNode; const XMLNodeProc: TXMLNodeProc); virtual;
    class function RunXPathQuery(const XMLDocument: IXMLDocument; const XPath: string): IDOMNodeList; virtual;
    class procedure SetSelectionNamespaces(const XMLDocument: IXMLDocument); virtual;
  end;

implementation

uses
  XMLDoc, SysUtils, msxml, msxmldom;

class procedure IXMLNodeHelper.CreateDocumentAndDOMNodeSelect(const Xml: string; var Document: IXMLDocument; var DOMNodeSelect: IDOMNodeSelect);
begin
  Document := TXMLDocument.Create(nil);
  Document.LoadFromXML(Xml);
  DOMNodeSelect := GetDOMNodeSelect(Document);
end;

class function IXMLNodeHelper.FindNamespaceDecls(const XMLNode: IXMLNode): TIXMLNodeArray;
var
  StringIXMLNodeDictionary: TStringIXMLNodeDictionary;
begin
  StringIXMLNodeDictionary := TStringIXMLNodeDictionary.Create();
  GetNamespaceDeclsFromAttributesAndParents(XMLNode, StringIXMLNodeDictionary);
  try
    Recurse(XMLNode,
      procedure (const CurrentXMLNode: IXMLNode)
      begin
        GetNamespaceDeclsFromAttributes(CurrentXMLNode, StringIXMLNodeDictionary);
      end
    );
    Result :=  StringIXMLNodeDictionary.Values.ToArray;
  finally
    StringIXMLNodeDictionary.Free;
  end;
end;

class function IXMLNodeHelper.FindSpaceDelimitedNamespaceDecls(const XMLNode: IXMLNode): string;
var
  NamespaceIXMLNodeArray: TIXMLNodeArray;
  NamespaceIXMLNode: IXMLNode;
  First: Boolean;
  StringBuilder: TStringBuilder;
  PrefixWithDoubleQuotedNamespaceURI: string;
begin
  NamespaceIXMLNodeArray := FindNamespaceDecls(XMLNode);
  First := True;
  StringBuilder := TStringBuilder.Create();
  try
    for NamespaceIXMLNode in NamespaceIXMLNodeArray do
    begin
      if First then
        First := False
      else
        StringBuilder.Append(' ');
      PrefixWithDoubleQuotedNamespaceURI := Format('%s="%s"',
        [NamespaceIXMLNode.NodeName, string(NamespaceIXMLNode.NodeValue)]);
      StringBuilder.Append(PrefixWithDoubleQuotedNamespaceURI);
    end;
    Result := StringBuilder.ToString();
  finally
    StringBuilder.Free;
  end;
end;

class procedure IXMLNodeHelper.ProcessNodeAndChildren(const ParentXMLNode: IXMLNode; const XMLNodeProc: TXMLNodeProc);
var
  ChildXMLNode : IXMLNode;
begin
  if ParentXMLNode = nil then
    Exit;
  XMLNodeProc(ParentXMLNode);
  ChildXMLNode := ParentXMLNode.ChildNodes.First;
  ProcessNodeAndSibblings(ChildXMLNode, XMLNodeProc);
end;

class procedure IXMLNodeHelper.ProcessNodeAndSibblings(const FirstChildXMLNode: IXMLNode; const XMLNodeProc: TXMLNodeProc);
var
  ChildXMLNode: IXMLNode;
begin
  ChildXMLNode := FirstChildXMLNode;
  while ChildXMLNode <> nil do
  begin
    ProcessNodeAndChildren(ChildXMLNode, XMLNodeProc);
    ChildXMLNode := ChildXMLNode.NextSibling;
  end;
end;

class procedure IXMLNodeHelper.Recurse(const XMLNode: IXMLNode; const XMLNodeProc: TXMLNodeProc);
begin
  ProcessNodeAndSibblings(XMLNode, XMLNodeProc);
end;

class procedure IXMLNodeHelper.GetNamespaceDeclsFromAttributesAndParents(const CurrentXMLNode: IXMLNode; const StringIXMLNodeDictionary:
    TStringIXMLNodeDictionary);
var
  ParentNode: IXMLNode;
begin
  // logic borrowed from TXMLNode.FindNamespaceDecl
  GetNamespaceDeclsFromAttributes(CurrentXMLNode, StringIXMLNodeDictionary);
  ParentNode := CurrentXMLNode.ParentNode;
  if Assigned(ParentNode) then
    GetNamespaceDeclsFromAttributesAndParents(ParentNode, StringIXMLNodeDictionary);
end;

class procedure IXMLNodeHelper.GetNamespaceDeclsFromAttributes(const CurrentXMLNode: IXMLNode; const StringIXMLNodeDictionary: TStringIXMLNodeDictionary);
var
  I: Integer;
  AttributeNodes: XMLIntf.IXMLNodeList;
  Attr: IXMLNode;
  NamespaceURI: string;
begin
  // logic borrowed from TXMLNode.FindNamespaceDecl
  AttributeNodes := CurrentXMLNode.AttributeNodes;
  for I := 0 to AttributeNodes.Count - 1 do
  begin
    Attr := AttributeNodes[I];
    if ((Attr.Prefix = SXMLNS) or (Attr.NodeName = SXMLNS)) then
    begin
      NamespaceURI := string(Attr.NodeValue);
      // NamespaceURI must be unique
      // (even though they can be used with different prefixed in the XML Document
      // they cannot be added multiple times to a NamespaceDecl list)
      if not StringIXMLNodeDictionary.ContainsKey(NamespaceURI) then
        StringIXMLNodeDictionary.Add(NamespaceURI, Attr);
    end;
  end;
end;

class function IXMLNodeHelper.RunXPathQuery(const XMLDocument: IXMLDocument; const XPath: string): IDOMNodeList;
var
  DOMNodeSelect: IDOMNodeSelect;
begin
  // First, set the SelectionNameSpaces: without them, some of the MS XML DOM won't search namespaces
  IXMLNodeHelper.SetSelectionNamespaces(XMLDocument);
  DOMNodeSelect := GetDOMNodeSelect(XMLDocument);
  // Last, search using an XPath expression that can contain namespaces prefixes
  Result := DOMNodeSelect.selectNodes(XPath);
end;

class procedure IXMLNodeHelper.SetSelectionNamespaces(const XMLDocument: IXMLDocument);
var
  DocumentXMLDOMNode: IXMLDOMNode;
  DocumentXMLDOMNodeRef: IXMLDOMNodeRef;
  DOMDocument: IDOMDocument;
  SpaceDelimitedNamespaceDecls: string;
  XMLDOMDocument2: IXMLDOMDocument2;
begin
  // Since we know that the DOM implementation is MS, we can make the transition
  // from the generic IDOMDocument into the MS specific IXMLDOMDocument2
  // The transition is done throught the MS specific IXMLDOMNodeRef
  // which is implemented by TMSDOMNode (the MS implementation of IDOMNode).
  // IXMLDOMNodeRef has one method (GetXMLDOMNode) which gets you an IXMLDOMNode.
  // Depending on which IDOMNode descendant you come from, you now can cast
  // the IXMLDOMNode to a similar IXMLDOMNode descendant
  // Step 1: get an IDOMNode descendant:
  DOMDocument := XMLDocument.DOMDocument;
  // Step 2: get the XMLDOMNode equivalent
  DocumentXMLDOMNodeRef := DOMDocument as IXMLDOMNodeRef;
  DocumentXMLDOMNode := DocumentXMLDOMNodeRef.GetXMLDOMNode;
  // Step 3: cast to the corresponding IXMLDOMNode descendant:
  XMLDOMDocument2 := DocumentXMLDOMNode as IXMLDOMDocument2;
  // Step 4: Get all the namespaces used in the XMLDocument
  SpaceDelimitedNamespaceDecls := IXMLNodeHelper.FindSpaceDelimitedNamespaceDecls(XMLDocument.DocumentElement);
  // Step 5: Now set the SelectionNameSpaces: without them, some of the MS XML DOM won't search namespaces
  // (and you get error messages like this: "Reference to undeclared namespace prefix: ")
  // SelectionNamespaces can contain one or more: http://msdn.microsoft.com/en-us/library/ms756048(VS.85).aspx
  // XMLDOMDocument2.setProperty('SelectionNamespaces', 'xmlns:bk="http://myserver/myschemas/Books"');
  XMLDOMDocument2.setProperty('SelectionNamespaces', SpaceDelimitedNamespaceDecls); // do not translate
end;

class function IXMLNodeHelper.GetDOMNodeSelect(const Document: IXMLDocument): IDOMNodeSelect;
var
  DOMDocument: IDOMDocument;
begin
  DOMDocument := Document.DOMDocument;
  Result := DOMDocument as IDOMNodeSelect;
end;

end.
