
{*****************************************************************************************************}
{                                                                                                     }
{                                          XML Data Binding                                           }
{                                                                                                     }
{         Generated on: 10/12/2010 9:47:29 PM                                                         }
{       Generated from: C:\develop\codeplex\TFS05\bo\Native\Delphi\Apps\NederlandFM2WMP\doc\ASX.biz   }
{   Settings stored in: C:\develop\codeplex\TFS05\bo\Native\Delphi\Apps\NederlandFM2WMP\doc\ASX.xdb   }
{                                                                                                     }
{*****************************************************************************************************}

unit ASXUnit;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLAsxType = interface;
  IXMLEntryType = interface;
  IXMLEntryTypeList = interface;
  IXMLRefType = interface;

{ IXMLAsxType }

  IXMLAsxType = interface(IXMLNode)
    ['{491F413D-0118-47A0-A00E-1BB7FCAD96C2}']
    { Property Accessors }
    function Get_Version: UnicodeString;
    function Get_Title: UnicodeString;
    function Get_Entry: IXMLEntryTypeList;
    procedure Set_Version(Value: UnicodeString);
    procedure Set_Title(Value: UnicodeString);
    { Methods & Properties }
    property Version: UnicodeString read Get_Version write Set_Version;
    property Title: UnicodeString read Get_Title write Set_Title;
    property Entry: IXMLEntryTypeList read Get_Entry;
  end;

{ IXMLEntryType }

  IXMLEntryType = interface(IXMLNode)
    ['{E1F7A8DC-0893-4853-BFFD-19D22AF3313C}']
    { Property Accessors }
    function Get_Title: UnicodeString;
    function Get_Ref: IXMLRefType;
    function Get_Author: UnicodeString;
    procedure Set_Title(Value: UnicodeString);
    procedure Set_Author(Value: UnicodeString);
    { Methods & Properties }
    property Title: UnicodeString read Get_Title write Set_Title;
    property Ref: IXMLRefType read Get_Ref;
    property Author: UnicodeString read Get_Author write Set_Author;
  end;

{ IXMLEntryTypeList }

  IXMLEntryTypeList = interface(IXMLNodeCollection)
    ['{4CA3727D-89DA-4498-B617-48D413D63887}']
    { Methods & Properties }
    function Add: IXMLEntryType;
    function Insert(const Index: Integer): IXMLEntryType;

    function Get_Item(Index: Integer): IXMLEntryType;
    property Items[Index: Integer]: IXMLEntryType read Get_Item; default;
  end;

{ IXMLRefType }

  IXMLRefType = interface(IXMLNode)
    ['{0860418C-E35A-4315-8B1C-7C0D19C45740}']
    { Property Accessors }
    function Get_Href: UnicodeString;
    procedure Set_Href(Value: UnicodeString);
    { Methods & Properties }
    property Href: UnicodeString read Get_Href write Set_Href;
  end;

{ Forward Decls }

  TXMLAsxType = class;
  TXMLEntryType = class;
  TXMLEntryTypeList = class;
  TXMLRefType = class;

{ TXMLAsxType }

  TXMLAsxType = class(TXMLNode, IXMLAsxType)
  private
    FEntry: IXMLEntryTypeList;
  protected
    { IXMLAsxType }
    function Get_Version: UnicodeString;
    function Get_Title: UnicodeString;
    function Get_Entry: IXMLEntryTypeList;
    procedure Set_Version(Value: UnicodeString);
    procedure Set_Title(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLEntryType }

  TXMLEntryType = class(TXMLNode, IXMLEntryType)
  protected
    { IXMLEntryType }
    function Get_Title: UnicodeString;
    function Get_Ref: IXMLRefType;
    function Get_Author: UnicodeString;
    procedure Set_Title(Value: UnicodeString);
    procedure Set_Author(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLEntryTypeList }

  TXMLEntryTypeList = class(TXMLNodeCollection, IXMLEntryTypeList)
  protected
    { IXMLEntryTypeList }
    function Add: IXMLEntryType;
    function Insert(const Index: Integer): IXMLEntryType;

    function Get_Item(Index: Integer): IXMLEntryType;
  end;

{ TXMLRefType }

  TXMLRefType = class(TXMLNode, IXMLRefType)
  protected
    { IXMLRefType }
    function Get_Href: UnicodeString;
    procedure Set_Href(Value: UnicodeString);
  end;

{ Global Functions }

function Getasx(Doc: IXMLDocument): IXMLAsxType;
function Loadasx(const FileName: string): IXMLAsxType;
function Newasx: IXMLAsxType;

const
  TargetNamespace = '';

implementation

{ Global Functions }

function Getasx(Doc: IXMLDocument): IXMLAsxType;
begin
  Result := Doc.GetDocBinding('asx', TXMLAsxType, TargetNamespace) as IXMLAsxType;
end;

function Loadasx(const FileName: string): IXMLAsxType;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('asx', TXMLAsxType, TargetNamespace) as IXMLAsxType;
end;

function Newasx: IXMLAsxType;
begin
  Result := NewXMLDocument.GetDocBinding('asx', TXMLAsxType, TargetNamespace) as IXMLAsxType;
end;

{ TXMLAsxType }

procedure TXMLAsxType.AfterConstruction;
begin
  RegisterChildNode('entry', TXMLEntryType);
  FEntry := CreateCollection(TXMLEntryTypeList, IXMLEntryType, 'entry') as IXMLEntryTypeList;
  inherited;
end;

function TXMLAsxType.Get_Version: UnicodeString;
begin
  Result := AttributeNodes['version'].Text;
end;

procedure TXMLAsxType.Set_Version(Value: UnicodeString);
begin
  SetAttribute('version', Value);
end;

function TXMLAsxType.Get_Title: UnicodeString;
begin
  Result := ChildNodes['title'].Text;
end;

procedure TXMLAsxType.Set_Title(Value: UnicodeString);
begin
  ChildNodes['title'].NodeValue := Value;
end;

function TXMLAsxType.Get_Entry: IXMLEntryTypeList;
begin
  Result := FEntry;
end;

{ TXMLEntryType }

procedure TXMLEntryType.AfterConstruction;
begin
  RegisterChildNode('ref', TXMLRefType);
  inherited;
end;

function TXMLEntryType.Get_Title: UnicodeString;
begin
  Result := ChildNodes['title'].Text;
end;

procedure TXMLEntryType.Set_Title(Value: UnicodeString);
begin
  ChildNodes['title'].NodeValue := Value;
end;

function TXMLEntryType.Get_Ref: IXMLRefType;
begin
  Result := ChildNodes['ref'] as IXMLRefType;
end;

function TXMLEntryType.Get_Author: UnicodeString;
begin
  Result := ChildNodes['author'].Text;
end;

procedure TXMLEntryType.Set_Author(Value: UnicodeString);
begin
  ChildNodes['author'].NodeValue := Value;
end;

{ TXMLEntryTypeList }

function TXMLEntryTypeList.Add: IXMLEntryType;
begin
  Result := AddItem(-1) as IXMLEntryType;
end;

function TXMLEntryTypeList.Insert(const Index: Integer): IXMLEntryType;
begin
  Result := AddItem(Index) as IXMLEntryType;
end;

function TXMLEntryTypeList.Get_Item(Index: Integer): IXMLEntryType;
begin
  Result := List[Index] as IXMLEntryType;
end;

{ TXMLRefType }

function TXMLRefType.Get_Href: UnicodeString;
begin
  Result := AttributeNodes['href'].Text;
end;

procedure TXMLRefType.Set_Href(Value: UnicodeString);
begin
  SetAttribute('href', Value);
end;

end.