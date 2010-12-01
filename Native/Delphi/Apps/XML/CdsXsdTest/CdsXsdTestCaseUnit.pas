unit CdsXsdTestCaseUnit;

interface

uses
  Classes, SysUtils, TestFrameWork, XmlValidatorUnit;

type
  CdsXsdTestCase = class(TTestCase)
  strict private
    FXmlValidator: TXmlValidator;
  strict protected
    property XmlValidator: TXmlValidator read FXmlValidator;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    {$IFDEF CLR}[Test]{$ENDIF}
    procedure Test;
  end;

implementation

uses
  IOUtils, Types, XMLConst;

procedure CdsXsdTestCase.SetUp;
begin
  FXmlValidator := TXmlValidator.Create();
end;

procedure CdsXsdTestCase.TearDown;
begin
  FXmlValidator.Free();
  FXmlValidator := nil;
end;

procedure CdsXsdTestCase.Test;
const
  CdsXsdRelativePath = '..\..\cds-xsd\';
var
  CdsXsdFileName: string;
  CdsXsdIncludeFileName: string;
  XmlFileName: string;
  XmlFileNames: TStringDynArray;
  procedure EnsureFileNameExists(const FileName: string);
  begin
    Self.CheckTrue(TFile.Exists(FileName), FileName + 'does not exist');
  end;
begin
  CdsXsdFileName := CdsXsdRelativePath + 'CDS.xsd';
  CdsXsdIncludeFileName := CdsXsdRelativePath + 'CDS_METADATA_FIELDS_include.xsd';
  EnsureFileNameExists(CdsXsdFileName);
  EnsureFileNameExists(CdsXsdIncludeFileName);
  XmlFileNames := TDirectory.GetFiles('..\..\cds-xml', '*.xml');
  for XmlFileName in XmlFileNames do
  begin
    if not XmlValidator.ValidateXml(XmlFileName, [CdsXsdIncludeFileName, CdsXsdFileName]) then
      Self.CheckTrue(False, Format('%s failes: %s%s', [XmlFileName, CRLF, XmlValidator.ValidationResult]));
  end;
end;

initialization
  RegisterTest('', CdsXsdTestCase.Suite);
end.
