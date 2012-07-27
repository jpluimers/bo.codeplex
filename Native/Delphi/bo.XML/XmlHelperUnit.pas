unit XmlHelperUnit;

interface

uses
{$if CompilerVersion >= 20} // D2009 and up http://stackoverflow.com/a/1572163/29290
  Generics.Collections,
  Generics.Defaults,
{$else}
  DictionaryUnit,
{$ifend}
{ up until Delphi 2009, msxml contains the import of C:\WINDOWS\SYSTEM\MSXML.DLL,
  as of Delphi 2010 it imports C:\WINDOWS\SYSTEM\MSXML6.DLL }
{$if CompilerVersion >= 21.0}
  msxml, // Delphi 2010 and up: IXMLDOMSchemaCollection2 et al
{$else}
  MSXML2_TLB, // Delphi < 2010: IXMLDOMSchemaCollection2 et al
{$ifend}
  xmldom;

type
{$if CompilerVersion >= 20} // D2009 and up http://stackoverflow.com/a/1572163/29290
  IDOMNodeArray = TArray<IDOMNode>;
  TStringIDOMNodeDictionary = TDictionary<string,IDOMNode>;
  TDomNodeProc = reference to procedure(const DomNode: IDOMNode);
{$else}
  IDOMNodeArray = array of IDOMNode;
  TStringIDOMNodeDictionary = class(TDictionary)
    procedure Add(const S: string; const Attr: IDOMNode); reintroduce; virtual;
    function ContainsKey(const S: string): Boolean;
    function Values_ToArray: IDOMNodeArray; virtual;
  public
    constructor Create;
    destructor Destroy; override;
  end;
  TDomNodeProc = procedure (const DomNode: IDOMNode; const StringIDomNodeDictionary: TStringIDOMNodeDictionary) of object;
{$ifend}
  IDomNodeHelper = class(TObject)
  strict protected
    class function GetDOMNodeSelect(const DomDocument: IDOMDocument): IDOMNodeSelect; virtual;
    class procedure GetNamespaceDeclsFromAttributes(const CurrentDomNode: IDOMNode; const StringIDomNodeDictionary: TStringIDOMNodeDictionary); virtual;
    class procedure GetNamespaceDeclsFromAttributesAndParents(const CurrentDomNode: IDOMNode; const StringIDomNodeDictionary: TStringIDOMNodeDictionary); virtual;
{$if CompilerVersion >= 20} // D2009 and up http://stackoverflow.com/a/1572163/29290
    class procedure ProcessNodeAndChildren(const ParentDomNode: IDOMNode; const DomNodeProc: TDomNodeProc); virtual;
    class procedure ProcessNodeAndSibblings(const FirstChildDomNode: IDOMNode; const DomNodeProc: TDomNodeProc); virtual;
{$else}
    class procedure ProcessNodeAndChildren(const ParentDomNode: IDOMNode; const DomNodeProc: TDomNodeProc; const StringIDomNodeDictionary:
        TStringIDOMNodeDictionary); virtual;
    class procedure ProcessNodeAndSibblings(const FirstChildDomNode: IDOMNode; const DomNodeProc: TDomNodeProc; const StringIDomNodeDictionary:
        TStringIDOMNodeDictionary); virtual;
{$ifend}
    class procedure SetSelectionNamespaces(const DomDocument: IDOMDocument); overload; virtual;
  public
    const SelectionLanguage = 'SelectionLanguage'; // http://msdn.microsoft.com/en-us/library/ms754679(VS.85).aspx
    const SelectionNamespaces = 'SelectionNamespaces'; // http://msdn.microsoft.com/en-us/library/ms756048(VS.85).aspx
    class procedure CreateDocumentAndDOMNodeSelect(const Xml: string; var Document: IDOMDocument; var DOMNodeSelect: IDOMNodeSelect); virtual;
    class function FindNamespaceDecls(const DomNode: IDOMNode): IDOMNodeArray; virtual;
    class function FindSpaceDelimitedNamespaceDecls(const DomNode: IDOMNode): string; virtual;
    class function GetXmlDomDocument2(const DomDocument: IDOMDocument; out XmlDomDocument2: IXMLDOMDocument2): Boolean; overload; dynamic;
{$if CompilerVersion >= 20} // D2009 and up http://stackoverflow.com/a/1572163/29290
    class procedure Recurse(const DomNode: IDOMNode; const DomNodeProc: TDomNodeProc); virtual;
{$else}
    class procedure Recurse(const DomNode: IDOMNode; const DomNodeProc: TDomNodeProc; const StringIDomNodeDictionary:
        TStringIDOMNodeDictionary); virtual;
{$ifend}
    class function RunXPathQuery(const XMLDocument: IDOMDocument; const XPath: string): IDOMNodeList; virtual;
  end;

implementation

uses
  SysUtils,
  msxmldom,
  xmlutil,
  Classes,
  Variants;

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
{$if CompilerVersion >= 20} // D2009 and up http://stackoverflow.com/a/1572163/29290
      procedure (const CurrentDomNode: IDOMNode)
      begin
        GetNamespaceDeclsFromAttributes(CurrentDomNode, StringIDomNodeDictionary);
      end
{$else}
      GetNamespaceDeclsFromAttributes,
      StringIDomNodeDictionary
{$ifend}
    );
{$if CompilerVersion >= 20} // D2009 and up http://stackoverflow.com/a/1572163/29290
    Result :=  StringIDomNodeDictionary.Values.ToArray;
{$else}
    Result :=  StringIDomNodeDictionary.Values_ToArray;
{$ifend}
  finally
    StringIDomNodeDictionary.Free;
  end;
end;

class function IDomNodeHelper.FindSpaceDelimitedNamespaceDecls(const DomNode: IDOMNode): string;
var
  NamespaceIDomNodeArray: IDOMNodeArray;
  NamespaceIDomNode: IDOMNode;
  First: Boolean;
  StringStream: TStringStream;
  PrefixWithDoubleQuotedNamespaceURI: string;
begin
  NamespaceIDomNodeArray := FindNamespaceDecls(DomNode);
  First := True;
  StringStream := TStringStream.Create(NullAsStringValue);
  try
    for NamespaceIDomNode in NamespaceIDomNodeArray do
    begin
      if First then
        First := False
      else
        StringStream.WriteString(' ');
      PrefixWithDoubleQuotedNamespaceURI := Format('%s="%s"',
        [NamespaceIDomNode.NodeName, string(NamespaceIDomNode.NodeValue)]);
      StringStream.WriteString(PrefixWithDoubleQuotedNamespaceURI);
    end;
    Result := StringStream.DataString;
  finally
    StringStream.Free;
  end;
end;

{$if CompilerVersion >= 20} // D2009 and up http://stackoverflow.com/a/1572163/29290
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
{$else}
class procedure IDomNodeHelper.ProcessNodeAndChildren(const ParentDomNode: IDOMNode; const DomNodeProc: TDomNodeProc; const
    StringIDomNodeDictionary: TStringIDOMNodeDictionary);
var
  ChildDomNode : IDOMNode;
begin
  if ParentDomNode = nil then
    Exit;
  DomNodeProc(ParentDomNode, StringIDomNodeDictionary);
  ChildDomNode := ParentDomNode.firstChild;
  ProcessNodeAndSibblings(ChildDomNode, DomNodeProc, StringIDomNodeDictionary);
end;
{$ifend}

{$if CompilerVersion >= 20} // D2009 and up http://stackoverflow.com/a/1572163/29290
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
{$else}
class procedure IDomNodeHelper.ProcessNodeAndSibblings(const FirstChildDomNode: IDOMNode; const DomNodeProc: TDomNodeProc; const
    StringIDomNodeDictionary: TStringIDOMNodeDictionary);
var
  ChildDomNode: IDOMNode;
begin
  ChildDomNode := FirstChildDomNode;
  while ChildDomNode <> nil do
  begin
    ProcessNodeAndChildren(ChildDomNode, DomNodeProc, StringIDomNodeDictionary);
    ChildDomNode := ChildDomNode.NextSibling;
  end;
end;
{$ifend}

{$if CompilerVersion >= 20} // D2009 and up http://stackoverflow.com/a/1572163/29290
class procedure IDomNodeHelper.Recurse(const DomNode: IDOMNode; const DomNodeProc: TDomNodeProc);
begin
  ProcessNodeAndSibblings(DomNode, DomNodeProc);
end;
{$else}
class procedure IDomNodeHelper.Recurse(const DomNode: IDOMNode; const DomNodeProc: TDomNodeProc; const StringIDomNodeDictionary:
    TStringIDOMNodeDictionary);
begin

end;
{$ifend}

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
    if NullAsStringValue <> SpaceDelimitedNamespaceDecls then
      XmlDomDocument2.setProperty(SelectionNamespaces, SpaceDelimitedNamespaceDecls);
  end;
end;

class function IDomNodeHelper.GetDOMNodeSelect(const DomDocument: IDOMDocument): IDOMNodeSelect;
begin
  Result := DomDocument as IDOMNodeSelect;
end;

class function IDomNodeHelper.GetXmlDomDocument2(const DomDocument: IDOMDocument; out XmlDomDocument2: IXMLDOMDocument2): Boolean;
var
  Dispatch: IDispatch; // because DomDocumentXmlDomNodeRef.GetXMLDOMNode is in the msxmldom unit, which might use IXMLDOMNode from msxml, and we might use it from MSXML2_TLB
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
    Dispatch := DomDocumentXmlDomNodeRef.GetXMLDOMNode;
    DomDocumentXmlDomNode := Dispatch as IXMLDOMNode;
    // Step 4: cast to the corresponding IXMLDOMNode descendant:
    XmlDomDocument2 := DomDocumentXmlDomNode as IXMLDOMDocument2;
  end
  else
    XmlDomDocument2 := nil;
end;

{$if CompilerVersion >= 20} // D2009 and up http://stackoverflow.com/a/1572163/29290
{$else}
constructor TStringIDOMNodeDictionary.Create;
begin
  inherited Create(False); // don't own Objects as we store Interfaces
end;

destructor TStringIDOMNodeDictionary.Destroy;
var
  Current: Pointer;
  DomNode: IDOMNode;
  Index: Integer;
begin
  for Index := 0 to Self.Count - 1 do
  begin
    Current := Self.Objects[Index];
    Self.Objects[Index] := nil;
    DomNode := IDOMNode(Current);
    DomNode._Release;
  end;
  inherited Destroy;
end;

procedure TStringIDOMNodeDictionary.Add(const S: string; const Attr: IDOMNode);
var
  Current: Pointer;
begin
  Attr._AddRef;
  Current := Pointer(Attr);
  Self.AddObject(S, TObject(Current));
end;

function TStringIDOMNodeDictionary.ContainsKey(const S: string): Boolean;
begin
  Result := Self.IndexOf(S) <> -1;
end;

function TStringIDOMNodeDictionary.Values_ToArray: IDOMNodeArray;
var
  Current: Pointer;
  DomNode: IDOMNode;
  Index: Integer;
begin
  SetLength(Result, Self.Count);
  for Index := 0 to Self.Count - 1 do
  begin
    Current := Self.Objects[Index];
    DomNode := IDOMNode(Current);
    Result[Index] := DomNode;
  end;
end;
{$ifend}

end.
