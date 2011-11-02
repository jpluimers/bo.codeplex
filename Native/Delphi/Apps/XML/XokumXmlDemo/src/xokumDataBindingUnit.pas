
{***********************************************************************************************}
{                                                                                               }
{                                       XML Data Binding                                        }
{                                                                                               }
{         Generated on: 10/6/2008 4:21:00 PM                                                    }
{       Generated from: C:\develop\conferences\SDC.2009\XML-Data-Import-Export\data\xokum.xsd   }
{   Settings stored in: C:\develop\conferences\SDC.2009\XML-Data-Import-Export\data\xokum.xdb   }
{                                                                                               }
{***********************************************************************************************}

unit xokumDataBindingUnit;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLXokum = interface;
  IXMLRecord_ = interface;

{ IXMLXokum }

  IXMLXokum = interface(IXMLNodeCollection)
    ['{06F895FE-92C5-4714-ABC4-EA355675B74E}']
    { Property Accessors }
    function Get_Record_(Index: Integer): IXMLRecord_;
    { Methods & Properties }
    function Add: IXMLRecord_;
    function Insert(const Index: Integer): IXMLRecord_;
    property Record_[Index: Integer]: IXMLRecord_ read Get_Record_; default;
  end;

{ IXMLRecord_ }

  IXMLRecord_ = interface(IXMLNode)
    ['{B839EC54-F88B-4496-83D1-D5F9052733E0}']
    { Property Accessors }
    function Get_Achternaam: WideString;
    function Get_Voorletters: WideString;
    function Get_Straat: WideString;
    function Get_Nummer: Integer;
    function Get_Abonneenummer: Integer;
    function Get_Plaats: WideString;
    function Get_Netnummer: Integer;
    procedure Set_Achternaam(Value: WideString);
    procedure Set_Voorletters(Value: WideString);
    procedure Set_Straat(Value: WideString);
    procedure Set_Nummer(Value: Integer);
    procedure Set_Abonneenummer(Value: Integer);
    procedure Set_Plaats(Value: WideString);
    procedure Set_Netnummer(Value: Integer);
    { Methods & Properties }
    property Achternaam: WideString read Get_Achternaam write Set_Achternaam;
    property Voorletters: WideString read Get_Voorletters write Set_Voorletters;
    property Straat: WideString read Get_Straat write Set_Straat;
    property Nummer: Integer read Get_Nummer write Set_Nummer;
    property Abonneenummer: Integer read Get_Abonneenummer write Set_Abonneenummer;
    property Plaats: WideString read Get_Plaats write Set_Plaats;
    property Netnummer: Integer read Get_Netnummer write Set_Netnummer;
  end;

{ Forward Decls }

  TXMLXokum = class;
  TXMLRecord_ = class;

{ TXMLXokum }

  TXMLXokum = class(TXMLNodeCollection, IXMLXokum)
  protected
    { IXMLXokum }
    function Get_Record_(Index: Integer): IXMLRecord_;
    function Add: IXMLRecord_;
    function Insert(const Index: Integer): IXMLRecord_;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLRecord_ }

  TXMLRecord_ = class(TXMLNode, IXMLRecord_)
  protected
    { IXMLRecord_ }
    function Get_Achternaam: WideString;
    function Get_Voorletters: WideString;
    function Get_Straat: WideString;
    function Get_Nummer: Integer;
    function Get_Abonneenummer: Integer;
    function Get_Plaats: WideString;
    function Get_Netnummer: Integer;
    procedure Set_Achternaam(Value: WideString);
    procedure Set_Voorletters(Value: WideString);
    procedure Set_Straat(Value: WideString);
    procedure Set_Nummer(Value: Integer);
    procedure Set_Abonneenummer(Value: Integer);
    procedure Set_Plaats(Value: WideString);
    procedure Set_Netnummer(Value: Integer);
  end;

{ Global Functions }

function Getxokum(Doc: IXMLDocument): IXMLXokum;
function Loadxokum(const FileName: WideString): IXMLXokum;
function Newxokum: IXMLXokum;

const
  TargetNamespace = '';

implementation

{ Global Functions }

function Getxokum(Doc: IXMLDocument): IXMLXokum;
begin
  Result := Doc.GetDocBinding('xokum', TXMLXokum, TargetNamespace) as IXMLXokum;
end;

function Loadxokum(const FileName: WideString): IXMLXokum;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('xokum', TXMLXokum, TargetNamespace) as IXMLXokum;
end;

function Newxokum: IXMLXokum;
begin
  Result := NewXMLDocument.GetDocBinding('xokum', TXMLXokum, TargetNamespace) as IXMLXokum;
end;

{ TXMLXokum }

procedure TXMLXokum.AfterConstruction;
begin
  RegisterChildNode('record', TXMLRecord_);
  ItemTag := 'record';
  ItemInterface := IXMLRecord_;
  inherited;
end;

function TXMLXokum.Get_Record_(Index: Integer): IXMLRecord_;
begin
  Result := List[Index] as IXMLRecord_;
end;

function TXMLXokum.Add: IXMLRecord_;
begin
  Result := AddItem(-1) as IXMLRecord_;
end;

function TXMLXokum.Insert(const Index: Integer): IXMLRecord_;
begin
  Result := AddItem(Index) as IXMLRecord_;
end;

{ TXMLRecord_ }

function TXMLRecord_.Get_Achternaam: WideString;
begin
  Result := ChildNodes['achternaam'].Text;
end;

procedure TXMLRecord_.Set_Achternaam(Value: WideString);
begin
  ChildNodes['achternaam'].NodeValue := Value;
end;

function TXMLRecord_.Get_Voorletters: WideString;
begin
  Result := ChildNodes['voorletters'].Text;
end;

procedure TXMLRecord_.Set_Voorletters(Value: WideString);
begin
  ChildNodes['voorletters'].NodeValue := Value;
end;

function TXMLRecord_.Get_Straat: WideString;
begin
  Result := ChildNodes['straat'].Text;
end;

procedure TXMLRecord_.Set_Straat(Value: WideString);
begin
  ChildNodes['straat'].NodeValue := Value;
end;

function TXMLRecord_.Get_Nummer: Integer;
begin
  Result := ChildNodes['nummer'].NodeValue;
end;

procedure TXMLRecord_.Set_Nummer(Value: Integer);
begin
  ChildNodes['nummer'].NodeValue := Value;
end;

function TXMLRecord_.Get_Abonneenummer: Integer;
begin
  Result := ChildNodes['abonneenummer'].NodeValue;
end;

procedure TXMLRecord_.Set_Abonneenummer(Value: Integer);
begin
  ChildNodes['abonneenummer'].NodeValue := Value;
end;

function TXMLRecord_.Get_Plaats: WideString;
begin
  Result := ChildNodes['plaats'].Text;
end;

procedure TXMLRecord_.Set_Plaats(Value: WideString);
begin
  ChildNodes['plaats'].NodeValue := Value;
end;

function TXMLRecord_.Get_Netnummer: Integer;
begin
  Result := ChildNodes['netnummer'].NodeValue;
end;

procedure TXMLRecord_.Set_Netnummer(Value: Integer);
begin
  ChildNodes['netnummer'].NodeValue := Value;
end;

end.