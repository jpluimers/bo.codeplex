unit XmlHelperUnit;

interface

uses
  Generics.Collections,
  Generics.Defaults,
  xmldom,
  msxml;

type
  IDOMNodeArray = TArray<IDOMNode>;
  TStringIDOMNodeDictionary = TDictionary<string,IDOMNode>;
  TDomNodeProc = reference to procedure(const DomNode: IDOMNode);
  IDomNodeHelper = class(TObject)
  strict protected
    class function GetDOMNodeSelect(const DomDocument: IDOMDocument): IDOMNodeSelect; virtual;
    class procedure GetNamespaceDeclsFromAttributes(const CurrentDomNode: IDOMNode; const StringIDomNodeDictionary: TStringIDOMNodeDictionary); virtual;
    class procedure GetNamespaceDeclsFromAttributesAndParents(const CurrentDomNode: IDOMNode; const StringIDomNodeDictionary: TStringIDOMNodeDictionary); virtual;
    class procedure ProcessNodeAndChildren(const ParentDomNode: IDOMNode; const DomNodeProc: TDomNodeProc); virtual;
    class procedure ProcessNodeAndSibblings(const FirstChildDomNode: IDOMNode; const DomNodeProc: TDomNodeProc); virtual;
    class procedure SetSelectionNamespaces(const DomDocument: IDOMDocument); overload; virtual;
  public
    const SelectionLanguage = 'SelectionLanguage'; // http://msdn.microsoft.com/en-us/library/ms754679(VS.85).aspx
    const SelectionNamespaces = 'SelectionNamespaces'; // http://msdn.microsoft.com/en-us/library/ms756048(VS.85).aspx
    class procedure CreateDocumentAndDOMNodeSelect(const Xml: string; var Document: IDOMDocument; var DOMNodeSelect: IDOMNodeSelect); virtual;
    class function FindNamespaceDecls(const DomNode: IDOMNode): IDOMNodeArray; virtual;
    class function FindSpaceDelimitedNamespaceDecls(const DomNode: IDOMNode): string; virtual;
    class function GetXmlDomDocument2(const DomDocument: IDOMDocument; out XmlDomDocument2: IXMLDOMDocument2): Boolean; overload; dynamic;
    class procedure Recurse(const DomNode: IDOMNode; const DomNodeProc: TDomNodeProc); virtual;
    class function RunXPathQuery(const XMLDocument: IDOMDocument; const XPath: string): IDOMNodeList; virtual;
  end;

implementation

uses
  SysUtils,
  msxmldom,
  xmlutil;

class procedure IDomNodeHelper.CreateDocumentAndDOMNodeSelect(const Xml: string; var Document: IDOMDocument; var DOMNodeSelect: IDOMNodeSelect);
begin
  Document := LoadDocFromString(Xml);
  DOMNodeSelect := GetDOMNodeSelect(Document);
end;

class function IDomNodeHelper.FindNamespaceDecls(const DomNode: IDOMNode): IDOMNodeArray;
var
  StringIDomNodeDictionary: TStringIDOMNodeDictionary;
begin
  StringIDomNodeDictionary := TStringIDOMNodeDictionary.Create();
  GetNamespaceDeclsFromAttributesAndParents(DomNode, StringIDomNodeDictionary);
  try
    Recurse(DomNode,
      procedure (const CurrentDomNode: IDOMNode)
      begin
        GetNamespaceDeclsFromAttributes(CurrentDomNode, StringIDomNodeDictionary);
      end
    );
    Result :=  StringIDomNodeDictionary.Values.ToArray;
  finally
    StringIDomNodeDictionary.Free;
  end;
end;

class function IDomNodeHelper.FindSpaceDelimitedNamespaceDecls(const DomNode: IDOMNode): string;
var
  NamespaceIDomNodeArray: IDOMNodeArray;
  NamespaceIDomNode: IDOMNode;
  First: Boolean;
  StringBuilder: TStringBuilder;
  PrefixWithDoubleQuotedNamespaceURI: string;
begin
  NamespaceIDomNodeArray := FindNamespaceDecls(DomNode);
  First := True;
  StringBuilder := TStringBuilder.Create();
  try
    for NamespaceIDomNode in NamespaceIDomNodeArray do
    begin
      if First then
        First := False
      else
        StringBuilder.Append(' ');
      PrefixWithDoubleQuotedNamespaceURI := Format('%s="%s"',
        [NamespaceIDomNode.NodeName, string(NamespaceIDomNode.NodeValue)]);
      StringBuilder.Append(PrefixWithDoubleQuotedNamespaceURI);
    end;
    Result := StringBuilder.ToString();
  finally
    StringBuilder.Free;
  end;
end;

class procedure IDomNodeHelper.ProcessNodeAndChildren(const ParentDomNode: IDOMNode; const DomNodeProc: TDomNodeProc);
var
  ChildDomNode : IDOMNode;
begin
  if ParentDomNode = nil then
    Exit;
  DomNodeProc(ParentDomNode);
  ChildDomNode := ParentDomNode.firstChild;
  ProcessNodeAndSibblings(ChildDomNode, DomNodeProc);
end;

class procedure IDomNodeHelper.ProcessNodeAndSibblings(const FirstChildDomNode: IDOMNode; const DomNodeProc: TDomNodeProc);
var
  ChildDomNode: IDOMNode;
begin
  ChildDomNode := FirstChildDomNode;
  while ChildDomNode <> nil do
  begin
    ProcessNodeAndChildren(ChildDomNode, DomNodeProc);
    ChildDomNode := ChildDomNode.NextSibling;
  end;
end;

class procedure IDomNodeHelper.Recurse(const DomNode: IDOMNode; const DomNodeProc: TDomNodeProc);
begin
  ProcessNodeAndSibblings(DomNode, DomNodeProc);
end;

class procedure IDomNodeHelper.GetNamespaceDeclsFromAttributesAndParents(const CurrentDomNode: IDOMNode; const StringIDomNodeDictionary:
    TStringIDOMNodeDictionary);
var
  ParentNode: IDOMNode;
begin
  // logic borrowed from TDomNode.FindNamespaceDecl
  GetNamespaceDeclsFromAttributes(CurrentDomNode, StringIDomNodeDictionary);
  ParentNode := CurrentDomNode.ParentNode;
  if Assigned(ParentNode) then
    GetNamespaceDeclsFromAttributesAndParents(ParentNode, StringIDomNodeDictionary);
end;

class procedure IDomNodeHelper.GetNamespaceDeclsFromAttributes(const CurrentDomNode: IDOMNode; const StringIDomNodeDictionary: TStringIDOMNodeDictionary);
var
  I: Integer;
  Attributes: IDOMNamedNodeMap;
  Attr: IDOMNode;
  NamespaceURI: string;
begin
  // logic borrowed from TDomNode.FindNamespaceDecl
  Attributes := CurrentDomNode.attributes;
  if Assigned(Attributes) then
  begin
    for I := 0 to Attributes.length - 1 do
    begin
      Attr := Attributes[I];
      if ((Attr.Prefix = SXMLNS) or (Attr.NodeName = SXMLNS)) then
      begin
        NamespaceURI := string(Attr.NodeValue);
        // NamespaceURI must be unique
        // (even though they can be used with different prefixed in the XML Document
        // they cannot be added multiple times to a NamespaceDecl list)
        if not StringIDomNodeDictionary.ContainsKey(NamespaceURI) then
          StringIDomNodeDictionary.Add(NamespaceURI, Attr);
      end;
    end;
  end;
end;

class function IDomNodeHelper.RunXPathQuery(const XMLDocument: IDOMDocument; const XPath: string): IDOMNodeList;
var
  DOMNodeSelect: IDOMNodeSelect;
begin
  // First, set the SelectionNameSpaces: without them, some of the MS XML DOM won't search namespaces
  IDomNodeHelper.SetSelectionNamespaces(XMLDocument);
  DOMNodeSelect := GetDOMNodeSelect(XMLDocument);
  // Last, search using an XPath expression that can contain namespaces prefixes
  Result := DOMNodeSelect.selectNodes(XPath);
end;

class procedure IDomNodeHelper.SetSelectionNamespaces(const DomDocument: IDOMDocument);
var
  SpaceDelimitedNamespaceDecls: string;
  XmlDomDocument2: IXMLDOMDocument2; // unit msxml
begin
  if GetXmlDomDocument2(DomDocument, XmlDomDocument2) then
  begin
    // Step 2: Get all the namespaces used in the XMLDocument
    SpaceDelimitedNamespaceDecls := IDomNodeHelper.FindSpaceDelimitedNamespaceDecls(DomDocument.DocumentElement);
    // Step 3: Now set the SelectionNameSpaces: without them, some of the MS XML DOM won't search namespaces
    // (and you get error messages like this: "Reference to undeclared namespace prefix: ")
    // SelectionNamespaces can contain one or more: http://msdn.microsoft.com/en-us/library/ms756048(VS.85).aspx
    // XMLDOMDocument2.setProperty('SelectionNamespaces', 'xmlns:bk="http://myserver/myschemas/Books"');
    XmlDomDocument2.setProperty(SelectionNamespaces, SpaceDelimitedNamespaceDecls);
  end;
end;

class function IDomNodeHelper.GetDOMNodeSelect(const DomDocument: IDOMDocument): IDOMNodeSelect;
begin
  Result := DomDocument as IDOMNodeSelect;
end;

class function IDomNodeHelper.GetXmlDomDocument2(const DomDocument: IDOMDocument; out XmlDomDocument2: IXMLDOMDocument2): Boolean;
var
  DomDocumentXmlDomNode: IXMLDOMNode;
  DomDocumentXmlDomNodeRef: IXMLDOMNodeRef; // unit msxmldom
begin
  // If we know that the DOM implementation is MS, we can make the transition
  // from the generic IDOMDocument into the MS specific IXMLDOMDocument2
  // The transition is done throught the MS specific IXMLDOMNodeRef
  // which is implemented by TMSDOMNode (the MS implementation of IDOMNode).
  // IXMLDOMNodeRef has one method (GetXMLDOMNode) which gets you an IXMLDOMNode.
  // Depending on which IDOMNode descendant you come from, you now can cast
  // the IXMLDOMNode to a similar IXMLDOMNode descendant

  // Step 2: make sure it is the MSXML implementation, if so: get the IXMLDOMNodeRef reference
  Result := Supports(DomDocument, IXMLDOMNodeRef, DomDocumentXmlDomNodeRef);
  if Result then
  begin
    // Step 3: get the XMLDOMNode equivalent
    DomDocumentXmlDomNodeRef := DomDocument as IXMLDOMNodeRef;
    DomDocumentXmlDomNode := DomDocumentXmlDomNodeRef.GetXMLDOMNode;
    // Step 4: cast to the corresponding IXMLDOMNode descendant:
    XmlDomDocument2 := DomDocumentXmlDomNode as IXMLDOMDocument2;
  end
  else
    XmlDomDocument2 := nil;
end;

end.
