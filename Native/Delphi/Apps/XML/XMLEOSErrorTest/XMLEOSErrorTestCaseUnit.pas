unit XMLEOSErrorTestCaseUnit;

interface

uses
  Classes,
  SysUtils,
  TestFrameWork,
  msxml;

type
  TXMLEOSErrorTestCase = class(TTestCase)
  strict private
    FXmlDocument: IXMLDOMDocument3;
  private
    procedure LoadXmlDocument(relativePathToXmlFile: string);
  strict protected
    function GetXmlDocument: IXMLDOMDocument3; virtual;
    property XmlDocument: IXMLDOMDocument3 read GetXmlDocument;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    {$IFDEF CLR}[TestAbnormal]{$ENDIF}
    procedure TestAbnormal;
    {$IFDEF CLR}[TestNormal]{$ENDIF}
    procedure TestNormal;
  end;

implementation

uses
  IOUtils,
  Types,
  XMLConst,
  ComObj,
  XMLDOMParseErrorToStringUnit,
  msxmlFactoryUnit;

function TXMLEOSErrorTestCase.GetXmlDocument: IXMLDOMDocument3;
begin
  if not Assigned(FXmlDocument) then
    FXmlDocument := TmsxmlFactory.CreateXMLDOMDocument3WithValidateOnParse();
  Result := FXmlDocument;
end;

procedure TXMLEOSErrorTestCase.SetUp;
begin
  inherited SetUp();
end;

procedure TXMLEOSErrorTestCase.TearDown;
begin
  FXmlDocument := nil;
  inherited TearDown();
end;

procedure TXMLEOSErrorTestCase.TestAbnormal;
begin
//  StartExpectingException(EXMLDOMParseError); // to make the test GREEN: we expect an error to happen
  LoadXmlDocument('..\..\1-Abnormal.xml'); // has Windows-1252 character, but XML defaults to UTF-8
end;

procedure TXMLEOSErrorTestCase.TestNormal;
begin
  LoadXmlDocument('..\..\1-Normal.xml'); // specify the encoding will solve the problem
end;

procedure TXMLEOSErrorTestCase.LoadXmlDocument(relativePathToXmlFile: string);
var
  XmlFileName: string;
begin
  XmlFileName := TPath.Combine(TPath.GetDirectoryName(ParamStr(0)), relativePathToXmlFile);
  if not XmlDocument.load(XmlFileName) then
    raise EXMLDOMParseError.Create(XmlDocument.parseError);
end;

initialization
  RegisterTest('', TXMLEOSErrorTestCase.Suite);
end.
