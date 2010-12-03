unit msxmlFactoryUnit;

interface

uses
  msxml;

type
  TmsxmlFactory = class(TObject)
  public
    class function CreateXMLDOMSchemaCollection2: IXMLDOMSchemaCollection2; static;
    class function CreateXMLDOMDocument3WithValidateOnParse: IXMLDOMDocument3; static;
    class function CreateXMLDOMDocument3: IXMLDOMDocument3; static;
    class function CreateXMLDOMDocument3WithValidateOnParseFromFile(const XmlFileName: string): IXMLDOMDocument3; static;
  end;

implementation

uses
  SysUtils, XMLDOMParseErrorToStringUnit;

class function TmsxmlFactory.CreateXMLDOMSchemaCollection2: IXMLDOMSchemaCollection2;
begin
  Result := CoXMLSchemaCache60.Create();
  if not Assigned(Result) then
    raise ENotSupportedException.Create('CoXMLSchemaCache60.Create()');
end;

class function TmsxmlFactory.CreateXMLDOMDocument3WithValidateOnParse: IXMLDOMDocument3;
begin
  Result := CreateXMLDOMDocument3();
  Result.validateOnParse := True;
end;

class function TmsxmlFactory.CreateXMLDOMDocument3: IXMLDOMDocument3;
begin
  Result := CoFreeThreadedDOMDocument60.Create();
  if not Assigned(Result) then
    raise ENotSupportedException.Create('CoFreeThreadedDOMDocument60.Create()');
end;

class function TmsxmlFactory.CreateXMLDOMDocument3WithValidateOnParseFromFile(const XmlFileName: string): IXMLDOMDocument3;
begin
  Result := CreateXMLDOMDocument3WithValidateOnParse();
  if not Result.load(XmlFileName) then
    raise EXMLDOMParseError.Create(Result.parseError);
end;

end.
