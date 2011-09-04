// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : C:\develop\codeplex.svn\bo\Native\Delphi\Apps\WSDLSampleImport\wsdl\sampleWsdl.wsdl
//  >Import : C:\develop\codeplex.svn\bo\Native\Delphi\Apps\WSDLSampleImport\wsdl\sampleWsdl.wsdl>0
//  >Import : C:\develop\codeplex.svn\bo\Native\Delphi\Apps\WSDLSampleImport\wsdl\sampleWsdl.wsdl>1
//  >Import : C:\develop\codeplex.svn\bo\Native\Delphi\Apps\WSDLSampleImport\wsdl\sampleWsdl.wsdl>2
// Encoding : utf-8
// Version  : 1.0
// (4/5/2011 1:23:46 PM - - $Rev: 34800 $)
// ************************************************************************ //

unit sampleWsdl;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

const
  IS_OPTN = $0001;
  IS_NLBL = $0004;
  IS_REF  = $0080;


type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:boolean         - "http://www.w3.org/2001/XMLSchema"[Gbl]

  CompositeType2       = class;                 { "http://schemas.datacontract.org/2004/07/WCFService"[GblCplx] }
  CompositeType        = class;                 { "http://schemas.datacontract.org/2004/07/WCFService"[GblElm] }



  // ************************************************************************ //
  // XML       : CompositeType, global, <complexType>
  // Namespace : http://schemas.datacontract.org/2004/07/WCFService
  // ************************************************************************ //
  CompositeType2 = class(TRemotable)
  private
    FBoolValue: Boolean;
    FBoolValue_Specified: boolean;
    FStringValue: string;
    FStringValue_Specified: boolean;
    procedure SetBoolValue(Index: Integer; const ABoolean: Boolean);
    function  BoolValue_Specified(Index: Integer): boolean;
    procedure SetStringValue(Index: Integer; const Astring: string);
    function  StringValue_Specified(Index: Integer): boolean;
  published
    property BoolValue:   Boolean  Index (IS_OPTN) read FBoolValue write SetBoolValue stored BoolValue_Specified;
    property StringValue: string   Index (IS_OPTN or IS_NLBL) read FStringValue write SetStringValue stored StringValue_Specified;
  end;



  // ************************************************************************ //
  // XML       : CompositeType, global, <element>
  // Namespace : http://schemas.datacontract.org/2004/07/WCFService
  // ************************************************************************ //
  CompositeType = class(CompositeType2)
  private
  published
  end;


  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // soapAction: http://tempuri.org/IService1/%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // use       : literal
  // binding   : BasicHttpBinding_IService1
  // service   : Service1
  // port      : BasicHttpBinding_IService1
  // URL       : http://localhost:8732/Design_Time_Addresses/WCFService/Service1/
  // ************************************************************************ //
  IService1 = interface(IInvokable)
  ['{33335FCB-4DFB-92EA-D063-AF625AFEE0FC}']
    function  GetData(const value: string): string; stdcall;
    function  GetDataUsingDataContract(const composite: CompositeType2): CompositeType2; stdcall;
  end;

function GetIService1(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): IService1;


implementation
  uses SysUtils;

function GetIService1(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): IService1;
const
  defWSDL = 'C:\develop\codeplex.svn\bo\Native\Delphi\Apps\WSDLSampleImport\wsdl\sampleWsdl.wsdl';
  defURL  = 'http://localhost:8732/Design_Time_Addresses/WCFService/Service1/';
  defSvc  = 'Service1';
  defPrt  = 'BasicHttpBinding_IService1';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as IService1);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


procedure CompositeType2.SetBoolValue(Index: Integer; const ABoolean: Boolean);
begin
  FBoolValue := ABoolean;
  FBoolValue_Specified := True;
end;

function CompositeType2.BoolValue_Specified(Index: Integer): boolean;
begin
  Result := FBoolValue_Specified;
end;

procedure CompositeType2.SetStringValue(Index: Integer; const Astring: string);
begin
  FStringValue := Astring;
  FStringValue_Specified := True;
end;

function CompositeType2.StringValue_Specified(Index: Integer): boolean;
begin
  Result := FStringValue_Specified;
end;

initialization
  { IService1 }
  InvRegistry.RegisterInterface(TypeInfo(IService1), 'http://tempuri.org/', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(IService1), 'http://tempuri.org/IService1/%operationName%');
  InvRegistry.RegisterInvokeOptions(TypeInfo(IService1), ioDocument);
  { IService1.GetData }
  InvRegistry.RegisterMethodInfo(TypeInfo(IService1), 'GetData', '',
                                 '[ReturnName="GetDataResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IService1), 'GetData', 'value', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IService1), 'GetData', 'GetDataResult', '',
                                '', IS_NLBL);
  { IService1.GetDataUsingDataContract }
  InvRegistry.RegisterMethodInfo(TypeInfo(IService1), 'GetDataUsingDataContract', '',
                                 '[ReturnName="GetDataUsingDataContractResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IService1), 'GetDataUsingDataContract', 'composite', '',
                                '[Namespace="http://schemas.datacontract.org/2004/07/WCFService"]', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IService1), 'GetDataUsingDataContract', 'GetDataUsingDataContractResult', '',
                                '[Namespace="http://schemas.datacontract.org/2004/07/WCFService"]', IS_NLBL);
  RemClassRegistry.RegisterXSClass(CompositeType2, 'http://schemas.datacontract.org/2004/07/WCFService', 'CompositeType2', 'CompositeType');
  RemClassRegistry.RegisterXSClass(CompositeType, 'http://schemas.datacontract.org/2004/07/WCFService', 'CompositeType');

end.