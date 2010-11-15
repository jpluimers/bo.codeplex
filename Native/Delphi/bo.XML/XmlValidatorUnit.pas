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
    FValidationResultStrings: TStrings;
  strict protected
    function GetHaveValidationResult: Boolean; virtual;
    function GetValidationResult: string; virtual;
    function GetValidationResultStrings: TStrings; virtual;
    procedure ProcessParseError(const parseError: IXMLDOMParseError); virtual;
    procedure ProcessParseError2(const parseError2: IXMLDOMParseError2); virtual;
    property HaveValidationResult: Boolean read GetHaveValidationResult;
    property ValidationResultStrings: TStrings read GetValidationResultStrings;
  public
    destructor Destroy; override;
    function ValidateXml(const XmlFileName, XsdFileName: string): Boolean; overload;
    function ValidateXml(const XmlFileName: string; const XsdFileNames: array of string): Boolean; overload;
    property ValidationResult: string read GetValidationResult;
  end;

implementation

uses
  Variants,
  SysUtils, ActiveX, ComObj;

destructor TXmlValidator.Destroy;
begin
  inherited;

  FreeAndNil(FValidationResultStrings);
end;

function TXmlValidator.GetHaveValidationResult: Boolean;
begin
  Result := Assigned(FValidationResultStrings)
end;

function TXmlValidator.GetValidationResult: string;
begin
  if HaveValidationResult then
    Result := ValidationResultStrings.Text
  else
    Result := NullAsStringValue;
end;

function TXmlValidator.GetValidationResultStrings: TStrings;
begin
  if not HaveValidationResult then
    FValidationResultStrings := TStringList.Create();
  Result := FValidationResultStrings;
end;

procedure TXmlValidator.ProcessParseError(const parseError: IXMLDOMParseError);
var
  Reason: WideString;
begin
  Reason := parseError.reason;
  //    parseError.errorCode;
  //    parseError.url;
  if Reason <> NullAsStringValue then
    ValidationResultStrings.Add(Reason);
  //    parseError.srcText;
end;

procedure TXmlValidator.ProcessParseError2(const parseError2: IXMLDOMParseError2);
var
  ParseErrorCollection: IXMLDOMParseErrorCollection;
  item: IXMLDOMParseError2;
begin
  ProcessParseError(parseError2);

  ParseErrorCollection := parseError2.allErrors;
  if Assigned(ParseErrorCollection) then
  begin
    item := ParseErrorCollection.Next;
    if Assigned(item) then
      repeat
        ProcessParseError(item);
        item := ParseErrorCollection.Next;
      until not Assigned(item);
  end;
end;

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
  parseError2: IXMLDOMParseError2;
begin
  XmlDocument := CoFreeThreadedDOMDocument60.Create();
  if not Assigned(XmlDocument) then
    RaiseLastOSError();

  if not XmlDocument.load(XmlFileName) then
    RaiseLastOSError();

  SchemaCollection := CoXMLSchemaCache60.Create();
  if not Assigned(SchemaCollection) then
    RaiseLastOSError();

  for XsdFileName in XsdFileNames do
  begin
    XsdDocument := CoFreeThreadedDOMDocument60.Create();
    if not Assigned(XsdDocument) then
      RaiseLastOSError();

    if not XsdDocument.load(XsdFileName) then
      RaiseLastOSError();

    targetNamespaceNode := XsdDocument.documentElement.attributes.getNamedItem('targetNamespace');
    if Assigned(targetNamespaceNode) then
      namespaceURI := targetNamespaceNode.nodeValue
    else
      namespaceURI := NullAsStringValue;

    SchemaCollection.Add(namespaceURI, XsdDocument);
  end;

  XmlDocument.schemas := SchemaCollection;

  parseError := XmlDocument.validate();

  if Supports(parseError, IXMLDOMParseError2, parseError2) then
    ProcessParseError2(parseError2)
  else
    ProcessParseError(parseError);

  Result := not HaveValidationResult;
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

