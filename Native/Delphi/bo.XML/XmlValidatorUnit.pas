unit XmlValidatorUnit;

interface

uses
  Classes,
  msxml;

type
  /// loosely based on http://msdn.microsoft.com/en-us/library/ms765386(VS.85).aspx
  /// and http://www.nonhostile.com/howto-validate-xml-xsd-in-vb6.asp
  TXmlValidator = class(TObject)
  strict private
    FValidationResult: string;
  public
    function ValidateXml(const XmlFileName, XsdFileName: string): Boolean; overload;
    function ValidateXml(const XmlFileName: string; const XsdFileNames: array of string): Boolean; overload;
    property ValidationResult: string read FValidationResult;
  end;

implementation

uses
  Variants,
  SysUtils, ActiveX, ComObj,
  XMLDOMParseErrorToStringUnit,
  msxmlFactoryUnit;

function TXmlValidator.ValidateXml(const XmlFileName, XsdFileName: string): Boolean;
begin
  Result := ValidateXml(XmlFileName, [XsdFileName]);
end;

function TXmlValidator.ValidateXml(const XmlFileName: string; const XsdFileNames: array of string): Boolean;
var
  XmlDocument: IXMLDOMDocument3;
  XsdDocument: IXMLDOMDocument3;
  SchemaCollection: IXMLDOMSchemaCollection2;
  targetNamespaceNode: IXMLDOMNode;
  namespaceURI: string;
  XsdFileName: string;
  parseError: IXMLDOMParseError;
begin
  XmlDocument := TmsxmlFactory.CreateXMLDOMDocument3WithValidateOnParseFromFile(XmlFileName);

  SchemaCollection := TmsxmlFactory.CreateXMLDOMSchemaCollection2();

  for XsdFileName in XsdFileNames do
  begin
    XsdDocument := TmsxmlFactory.CreateXMLDOMDocument3WithValidateOnParseFromFile(XsdFileName);

    targetNamespaceNode := XsdDocument.documentElement.attributes.getNamedItem('targetNamespace');
    if Assigned(targetNamespaceNode) then
      namespaceURI := targetNamespaceNode.nodeValue
    else
      namespaceURI := NullAsStringValue;

    SchemaCollection.Add(namespaceURI, XsdDocument);
  end;

  XmlDocument.schemas := SchemaCollection;

  parseError := XmlDocument.validate();
  FValidationResult := TXMLDOMParseErrorToString.ToString(parseError);

  Result := ValidationResult = NullAsStringValue;;
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

