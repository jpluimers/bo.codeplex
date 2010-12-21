unit msxmlFactoryUnit;

interface

uses
  msxml,
  Classes,
  FileVersionUnit;

type
  TAddXsdToSchemaCollectionMethod = procedure (SchemaCollection: IXMLDOMSchemaCollection2; XsdFileName: string) of object;
  TmsxmlFactory = class(TObject)
  strict private
    class var Fmsxml6FileVersion: TFileVersion;
    class var FRetreivedFmsxml6FileVersion: Boolean;
  strict protected
    class procedure AddValidatedXsdToSchemaCollection(SchemaCollection: IXMLDOMSchemaCollection2; XsdFileName: string); virtual;
    class procedure AddXsdToSchemaCollection(SchemaCollection: IXMLDOMSchemaCollection2; XsdFileName: string); virtual;
    class procedure AssertExistingFile(const XmlFileName: string); virtual;
    class function Getmsxml6FileVersion: TFileVersion; static;
    class function InnerCreateXMLDOMDocument3: IXMLDOMDocument3; virtual;
  public
    class procedure AssertCompatibleMsxml6Version; virtual;
    class function CreateValidatedXMLDOMSchemaCollection2(const XsdFileName: string): IXMLDOMSchemaCollection2; overload; static;
    class function CreateValidatedXMLDOMSchemaCollection2(const XsdFileNames: array of string): IXMLDOMSchemaCollection2; overload; static;
    class function CreateValidatedXMLDOMSchemaCollection2(const XsdFileNames: TStrings): IXMLDOMSchemaCollection2; overload; static;
    class function CreateXMLDOMDocument3: IXMLDOMDocument3; static;
    class function CreateXMLDOMDocument3FromFile(const XmlFileName: string): IXMLDOMDocument3; static;
    class function CreateXMLDOMDocument3WithValidateOnParse: IXMLDOMDocument3; static;
    class function CreateXMLDOMDocument3WithValidateOnParseFromFile(const XmlFileName: string): IXMLDOMDocument3; static;
    class function CreateXMLDOMSchemaCollection1(const XsdFileNames: array of string; const AddXsdToSchemaCollectionMethod: TAddXsdToSchemaCollectionMethod):
        IXMLDOMSchemaCollection2; overload; static;
    class function CreateXMLDOMSchemaCollection1(const XsdFileNames: TStrings; const AddXsdToSchemaCollectionMethod: TAddXsdToSchemaCollectionMethod):
        IXMLDOMSchemaCollection2; overload; static;
    class function CreateXMLDOMSchemaCollection2: IXMLDOMSchemaCollection2; overload; static;
    class function CreateXMLDOMSchemaCollection2(const XsdFileName: string): IXMLDOMSchemaCollection2; overload; static;
    class function CreateXMLDOMSchemaCollection2(const XsdFileNames: array of string): IXMLDOMSchemaCollection2; overload; static;
    class function CreateXMLDOMSchemaCollection2(const XsdFileNames: TStrings): IXMLDOMSchemaCollection2; overload; static;
    class property msxml6FileVersion: TFileVersion read Getmsxml6FileVersion;
  end;

implementation

uses
  SysUtils,
  XMLDOMParseErrorToStringUnit,
  Variants,
  SysConst,
  ShellAPI;

class procedure TmsxmlFactory.AddValidatedXsdToSchemaCollection(SchemaCollection: IXMLDOMSchemaCollection2; XsdFileName: string);
var
  XsdDocument: IXMLDOMDocument3;
  targetNamespaceNode: IXMLDOMNode;
  namespaceURI: string;
begin
  XsdDocument := TmsxmlFactory.CreateXMLDOMDocument3WithValidateOnParseFromFile(XsdFileName);
  targetNamespaceNode := XsdDocument.documentElement.attributes.getNamedItem('targetNamespace');
  if Assigned(targetNamespaceNode) then
    namespaceURI := targetNamespaceNode.nodeValue
  else
    namespaceURI := NullAsStringValue;
  SchemaCollection.Add(namespaceURI, XsdDocument);
end;

class procedure TmsxmlFactory.AddXsdToSchemaCollection(SchemaCollection: IXMLDOMSchemaCollection2; XsdFileName: string);
var
  XsdDocument: IXMLDOMDocument3;
  targetNamespaceNode: IXMLDOMNode;
  namespaceURI: string;
begin
  XsdDocument := TmsxmlFactory.CreateXMLDOMDocument3FromFile(XsdFileName);
  targetNamespaceNode := XsdDocument.documentElement.attributes.getNamedItem('targetNamespace');
  if Assigned(targetNamespaceNode) then
    namespaceURI := targetNamespaceNode.nodeValue
  else
    namespaceURI := NullAsStringValue;
  SchemaCollection.Add(namespaceURI, XsdDocument);
end;

class procedure TmsxmlFactory.AssertExistingFile(const XmlFileName: string);
var
  InOutError: EInOutError;
begin
  if not FileExists(XmlFileName) then
  begin
    InOutError := EInOutError.CreateFmt('%s: "%s"', [SFileNotFound, XmlFileName]);
    InOutError.ErrorCode := SE_ERR_FNF; //##jpl:todo find a better way to generate a "file not found" exception
    raise InOutError;
  end;
end;

class function TmsxmlFactory.Getmsxml6FileVersion: TFileVersion;
var
  XmlDocument: IXMLDOMDocument3;
begin
  if not FRetreivedFmsxml6FileVersion then
  begin
    XmlDocument := InnerCreateXMLDOMDocument3();
    // now msxml6.dll is loaded for sure
    // XmlDocument.loadXML('<root>text</root>');
    Fmsxml6FileVersion := TFileVersion.Create('msxml6.dll');
    FRetreivedFmsxml6FileVersion := True;
  end;
  Result := Fmsxml6FileVersion;
end;

class function TmsxmlFactory.InnerCreateXMLDOMDocument3: IXMLDOMDocument3;
begin
  Result := CoFreeThreadedDOMDocument60.Create;
  if not Assigned(Result) then
    raise ENotSupportedException.Create('CoFreeThreadedDOMDocument60.Create()');
end;

class procedure TmsxmlFactory.AssertCompatibleMsxml6Version;
const
  LastBadMinimimFileMajorPart = 6;
  LastBadMinimumFileMinorPart = 20;
  LastBadMinimumFileBuildPart = 1099;
var
  msxml6FileVersionTooLow: Boolean;
begin
  msxml6FileVersionTooLow := msxml6FileVersion.FileMajorPart < LastBadMinimimFileMajorPart;
  msxml6FileVersionTooLow := msxml6FileVersionTooLow or
    ((msxml6FileVersion.FileMajorPart = LastBadMinimimFileMajorPart) and (msxml6FileVersion.FileMinorPart < LastBadMinimumFileMinorPart));
  msxml6FileVersionTooLow := msxml6FileVersionTooLow or
    ((msxml6FileVersion.FileMajorPart = LastBadMinimimFileMajorPart) and (msxml6FileVersion.FileMinorPart = LastBadMinimumFileMinorPart) and (msxml6FileVersion.FileBuildPart <= LastBadMinimumFileBuildPart));
  if msxml6FileVersionTooLow then
    raise ENotSupportedException.CreateFmt(
      'msxml6.dll must be newer than version %d.%d.%d.* (you need 6.30.*, 6.20.1103.*, 6.20.2003.0 or higher), but you have version %s',
      [LastBadMinimimFileMajorPart, LastBadMinimumFileMinorPart, LastBadMinimumFileBuildPart, msxml6FileVersion.ToString()]);
end;

class function TmsxmlFactory.CreateValidatedXMLDOMSchemaCollection2(const XsdFileName: string): IXMLDOMSchemaCollection2;
begin
  Result := CreateValidatedXMLDOMSchemaCollection2([XsdFileName]);
end;

class function TmsxmlFactory.CreateValidatedXMLDOMSchemaCollection2(const XsdFileNames: array of string): IXMLDOMSchemaCollection2;
begin
  Result := CreateXMLDOMSchemaCollection1(XsdFileNames, AddValidatedXsdToSchemaCollection);
end;

class function TmsxmlFactory.CreateValidatedXMLDOMSchemaCollection2(const XsdFileNames: TStrings): IXMLDOMSchemaCollection2;
begin
  Result := CreateXMLDOMSchemaCollection1(XsdFileNames, AddValidatedXsdToSchemaCollection);
end;

class function TmsxmlFactory.CreateXMLDOMDocument3: IXMLDOMDocument3;
begin
  Result := InnerCreateXMLDOMDocument3();
end;

class function TmsxmlFactory.CreateXMLDOMDocument3FromFile(const XmlFileName: string): IXMLDOMDocument3;
begin
  AssertExistingFile(XmlFileName);
  AssertCompatibleMsxml6Version();
  Result := CreateXMLDOMDocument3();
  if not Result.load(XmlFileName) then
    raise EXMLDOMParseError.Create(Result.parseError);
end;

class function TmsxmlFactory.CreateXMLDOMDocument3WithValidateOnParse: IXMLDOMDocument3;
begin
  Result := CreateXMLDOMDocument3();
  Result.validateOnParse := True;
end;

class function TmsxmlFactory.CreateXMLDOMDocument3WithValidateOnParseFromFile(const XmlFileName: string): IXMLDOMDocument3;
begin
  AssertExistingFile(XmlFileName);
  AssertCompatibleMsxml6Version();
  Result := CreateXMLDOMDocument3WithValidateOnParse();
  if not Result.load(XmlFileName) then
    raise EXMLDOMParseError.Create(Result.parseError);
end;

class function TmsxmlFactory.CreateXMLDOMSchemaCollection1(const XsdFileNames: array of string; const AddXsdToSchemaCollectionMethod:
    TAddXsdToSchemaCollectionMethod): IXMLDOMSchemaCollection2;
var
  SchemaCollection: IXMLDOMSchemaCollection2;
  XsdFileName: string;
begin
  SchemaCollection := TmsxmlFactory.CreateXMLDOMSchemaCollection2();

  for XsdFileName in XsdFileNames do
    AddXsdToSchemaCollectionMethod(SchemaCollection, XsdFileName);

  Result := SchemaCollection;
end;

class function TmsxmlFactory.CreateXMLDOMSchemaCollection1(const XsdFileNames: TStrings; const AddXsdToSchemaCollectionMethod:
    TAddXsdToSchemaCollectionMethod): IXMLDOMSchemaCollection2;
var
  SchemaCollection: IXMLDOMSchemaCollection2;
  XsdFileName: string;
begin
  SchemaCollection := TmsxmlFactory.CreateXMLDOMSchemaCollection2();

  for XsdFileName in XsdFileNames do
    AddXsdToSchemaCollectionMethod(SchemaCollection, XsdFileName);

  Result := SchemaCollection;
end;

class function TmsxmlFactory.CreateXMLDOMSchemaCollection2: IXMLDOMSchemaCollection2;
begin
  Result := CoXMLSchemaCache60.Create();
  if not Assigned(Result) then
    raise ENotSupportedException.Create('CoXMLSchemaCache60.Create()');
end;

class function TmsxmlFactory.CreateXMLDOMSchemaCollection2(const XsdFileName: string): IXMLDOMSchemaCollection2;
begin
  Result := CreateXMLDOMSchemaCollection2([XsdFileName]);
end;

class function TmsxmlFactory.CreateXMLDOMSchemaCollection2(const XsdFileNames: array of string): IXMLDOMSchemaCollection2;
begin
  Result := CreateXMLDOMSchemaCollection1(XsdFileNames, AddXsdToSchemaCollection);
end;

class function TmsxmlFactory.CreateXMLDOMSchemaCollection2(const XsdFileNames: TStrings): IXMLDOMSchemaCollection2;
begin
  Result := CreateXMLDOMSchemaCollection1(XsdFileNames, AddXsdToSchemaCollection);
end;

end.
