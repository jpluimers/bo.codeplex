
{*****************************************************************************************************}
{                                                                                                     }
{                                          XML Data Binding                                           }
{                                                                                                     }
{         Generated on: 10/12/2010 9:41:06 PM                                                         }
{       Generated from: C:\develop\codeplex\TFS05\bo\Native\Delphi\Apps\NederlandFM2WMP\doc\ASX.xsd   }
{   Settings stored in: C:\develop\codeplex\TFS05\bo\Native\Delphi\Apps\NederlandFM2WMP\doc\ASX.xdb   }
{                                                                                                     }
{*****************************************************************************************************}

unit ASXSchemaUnit;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLSchemaType = interface;
  IXMLElementType = interface;
  IXMLComplexType = interface;
  IXMLComplexTypeList = interface;
  IXMLSequenceType = interface;
  IXMLAttributeType = interface;

{ IXMLSchemaType }

  IXMLSchemaType = interface(IXMLNode)
    ['{F8A90A02-2236-4A50-A278-CFBB8625B36C}']
    { Property Accessors }
    function Get_AttributeFormDefault: UnicodeString;
    function Get_ElementFormDefault: UnicodeString;
    function Get_Version: UnicodeString;
    function Get_Element: IXMLElementType;
    function Get_ComplexType: IXMLComplexTypeList;
    procedure Set_AttributeFormDefault(Value: UnicodeString);
    procedure Set_ElementFormDefault(Value: UnicodeString);
    procedure Set_Version(Value: UnicodeString);
    { Methods & Properties }
    property AttributeFormDefault: UnicodeString read Get_AttributeFormDefault write Set_AttributeFormDefault;
    property ElementFormDefault: UnicodeString read Get_ElementFormDefault write Set_ElementFormDefault;
    property Version: UnicodeString read Get_Version write Set_Version;
    property Element: IXMLElementType read Get_Element;
    property ComplexType: IXMLComplexTypeList read Get_ComplexType;
  end;

{ IXMLElementType }

  IXMLElementType = interface(IXMLNode)
    ['{9AAD80FD-06BC-4F82-9321-538F05522F83}']
    { Property Accessors }
    function Get_Name: UnicodeString;
    function Get_Type_: UnicodeString;
    function Get_MaxOccurs: UnicodeString;
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_MaxOccurs(Value: UnicodeString);
    { Methods & Properties }
    property Name: UnicodeString read Get_Name write Set_Name;
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
    property MaxOccurs: UnicodeString read Get_MaxOccurs write Set_MaxOccurs;
  end;

{ IXMLComplexType }

  IXMLComplexType = interface(IXMLNode)
    ['{9C0618C5-D81F-4BB5-8DED-0BF9AF757ABD}']
    { Property Accessors }
    function Get_Name: UnicodeString;
    function Get_Sequence: IXMLSequenceType;
    function Get_Attribute: IXMLAttributeType;
    procedure Set_Name(Value: UnicodeString);
    { Methods & Properties }
    property Name: UnicodeString read Get_Name write Set_Name;
    property Sequence: IXMLSequenceType read Get_Sequence;
    property Attribute: IXMLAttributeType read Get_Attribute;
  end;

{ IXMLComplexTypeList }

  IXMLComplexTypeList = interface(IXMLNodeCollection)
    ['{26C4DF98-1DCA-44C8-9D58-9BEB9348FA5B}']
    { Methods & Properties }
    function Add: IXMLComplexType;
    function Insert(const Index: Integer): IXMLComplexType;

    function Get_Item(Index: Integer): IXMLComplexType;
    property Items[Index: Integer]: IXMLComplexType read Get_Item; default;
  end;

{ IXMLSequenceType }

  IXMLSequenceType = interface(IXMLNodeCollection)
    ['{9289143E-C0E2-462E-AD77-239966EEAEEC}']
    { Property Accessors }
    function Get_Element(Index: Integer): IXMLElementType;
    { Methods & Properties }
    function Add: IXMLElementType;
    function Insert(const Index: Integer): IXMLElementType;
    property Element[Index: Integer]: IXMLElementType read Get_Element; default;
  end;

{ IXMLAttributeType }

  IXMLAttributeType = interface(IXMLNode)
    ['{409542A8-7FB2-4C90-BE41-C081A0518773}']
    { Property Accessors }
    function Get_Name: UnicodeString;
    function Get_Type_: UnicodeString;
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Type_(Value: UnicodeString);
    { Methods & Properties }
    property Name: UnicodeString read Get_Name write Set_Name;
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
  end;

{ Forward Decls }

  TXMLSchemaType = class;
  TXMLElementType = class;
  TXMLComplexType = class;
  TXMLComplexTypeList = class;
  TXMLSequenceType = class;
  TXMLAttributeType = class;

{ TXMLSchemaType }

  TXMLSchemaType = class(TXMLNode, IXMLSchemaType)
  private
    FComplexType: IXMLComplexTypeList;
  protected
    { IXMLSchemaType }
    function Get_AttributeFormDefault: UnicodeString;
    function Get_ElementFormDefault: UnicodeString;
    function Get_Version: UnicodeString;
    function Get_Element: IXMLElementType;
    function Get_ComplexType: IXMLComplexTypeList;
    procedure Set_AttributeFormDefault(Value: UnicodeString);
    procedure Set_ElementFormDefault(Value: UnicodeString);
    procedure Set_Version(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLElementType }

  TXMLElementType = class(TXMLNode, IXMLElementType)
  protected
    { IXMLElementType }
    function Get_Name: UnicodeString;
    function Get_Type_: UnicodeString;
    function Get_MaxOccurs: UnicodeString;
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_MaxOccurs(Value: UnicodeString);
  end;

{ TXMLComplexType }

  TXMLComplexType = class(TXMLNode, IXMLComplexType)
  protected
    { IXMLComplexType }
    function Get_Name: UnicodeString;
    function Get_Sequence: IXMLSequenceType;
    function Get_Attribute: IXMLAttributeType;
    procedure Set_Name(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLComplexTypeList }

  TXMLComplexTypeList = class(TXMLNodeCollection, IXMLComplexTypeList)
  protected
    { IXMLComplexTypeList }
    function Add: IXMLComplexType;
    function Insert(const Index: Integer): IXMLComplexType;

    function Get_Item(Index: Integer): IXMLComplexType;
  end;

{ TXMLSequenceType }

  TXMLSequenceType = class(TXMLNodeCollection, IXMLSequenceType)
  protected
    { IXMLSequenceType }
    function Get_Element(Index: Integer): IXMLElementType;
    function Add: IXMLElementType;
    function Insert(const Index: Integer): IXMLElementType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLAttributeType }

  TXMLAttributeType = class(TXMLNode, IXMLAttributeType)
  protected
    { IXMLAttributeType }
    function Get_Name: UnicodeString;
    function Get_Type_: UnicodeString;
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Type_(Value: UnicodeString);
  end;

{ Global Functions }

function Getschema(Doc: IXMLDocument): IXMLSchemaType;
function Loadschema(const FileName: string): IXMLSchemaType;
function Newschema: IXMLSchemaType;

const
  TargetNamespace = 'http://www.w3.org/2001/XMLSchema';

implementation

{ Global Functions }

function Getschema(Doc: IXMLDocument): IXMLSchemaType;
begin
  Result := Doc.GetDocBinding('schema', TXMLSchemaType, TargetNamespace) as IXMLSchemaType;
end;

function Loadschema(const FileName: string): IXMLSchemaType;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('schema', TXMLSchemaType, TargetNamespace) as IXMLSchemaType;
end;

function Newschema: IXMLSchemaType;
begin
  Result := NewXMLDocument.GetDocBinding('schema', TXMLSchemaType, TargetNamespace) as IXMLSchemaType;
end;

{ TXMLSchemaType }

procedure TXMLSchemaType.AfterConstruction;
begin
  RegisterChildNode('element', TXMLElementType);
  RegisterChildNode('complexType', TXMLComplexType);
  FComplexType := CreateCollection(TXMLComplexTypeList, IXMLComplexType, 'complexType') as IXMLComplexTypeList;
  inherited;
end;

function TXMLSchemaType.Get_AttributeFormDefault: UnicodeString;
begin
  Result := AttributeNodes['attributeFormDefault'].Text;
end;

procedure TXMLSchemaType.Set_AttributeFormDefault(Value: UnicodeString);
begin
  SetAttribute('attributeFormDefault', Value);
end;

function TXMLSchemaType.Get_ElementFormDefault: UnicodeString;
begin
  Result := AttributeNodes['elementFormDefault'].Text;
end;

procedure TXMLSchemaType.Set_ElementFormDefault(Value: UnicodeString);
begin
  SetAttribute('elementFormDefault', Value);
end;

function TXMLSchemaType.Get_Version: UnicodeString;
begin
  Result := AttributeNodes['version'].Text;
end;

procedure TXMLSchemaType.Set_Version(Value: UnicodeString);
begin
  SetAttribute('version', Value);
end;

function TXMLSchemaType.Get_Element: IXMLElementType;
begin
  Result := ChildNodes['element'] as IXMLElementType;
end;

function TXMLSchemaType.Get_ComplexType: IXMLComplexTypeList;
begin
  Result := FComplexType;
end;

{ TXMLElementType }

function TXMLElementType.Get_Name: UnicodeString;
begin
  Result := AttributeNodes['name'].Text;
end;

procedure TXMLElementType.Set_Name(Value: UnicodeString);
begin
  SetAttribute('name', Value);
end;

function TXMLElementType.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['type'].Text;
end;

procedure TXMLElementType.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('type', Value);
end;

function TXMLElementType.Get_MaxOccurs: UnicodeString;
begin
  Result := AttributeNodes['maxOccurs'].Text;
end;

procedure TXMLElementType.Set_MaxOccurs(Value: UnicodeString);
begin
  SetAttribute('maxOccurs', Value);
end;

{ TXMLComplexType }

procedure TXMLComplexType.AfterConstruction;
begin
  RegisterChildNode('sequence', TXMLSequenceType);
  RegisterChildNode('attribute', TXMLAttributeType);
  inherited;
end;

function TXMLComplexType.Get_Name: UnicodeString;
begin
  Result := AttributeNodes['name'].Text;
end;

procedure TXMLComplexType.Set_Name(Value: UnicodeString);
begin
  SetAttribute('name', Value);
end;

function TXMLComplexType.Get_Sequence: IXMLSequenceType;
begin
  Result := ChildNodes['sequence'] as IXMLSequenceType;
end;

function TXMLComplexType.Get_Attribute: IXMLAttributeType;
begin
  Result := ChildNodes['attribute'] as IXMLAttributeType;
end;

{ TXMLComplexTypeList }

function TXMLComplexTypeList.Add: IXMLComplexType;
begin
  Result := AddItem(-1) as IXMLComplexType;
end;

function TXMLComplexTypeList.Insert(const Index: Integer): IXMLComplexType;
begin
  Result := AddItem(Index) as IXMLComplexType;
end;

function TXMLComplexTypeList.Get_Item(Index: Integer): IXMLComplexType;
begin
  Result := List[Index] as IXMLComplexType;
end;

{ TXMLSequenceType }

procedure TXMLSequenceType.AfterConstruction;
begin
  RegisterChildNode('element', TXMLElementType);
  ItemTag := 'element';
  ItemInterface := IXMLElementType;
  inherited;
end;

function TXMLSequenceType.Get_Element(Index: Integer): IXMLElementType;
begin
  Result := List[Index] as IXMLElementType;
end;

function TXMLSequenceType.Add: IXMLElementType;
begin
  Result := AddItem(-1) as IXMLElementType;
end;

function TXMLSequenceType.Insert(const Index: Integer): IXMLElementType;
begin
  Result := AddItem(Index) as IXMLElementType;
end;

{ TXMLAttributeType }

function TXMLAttributeType.Get_Name: UnicodeString;
begin
  Result := AttributeNodes['name'].Text;
end;

procedure TXMLAttributeType.Set_Name(Value: UnicodeString);
begin
  SetAttribute('name', Value);
end;

function TXMLAttributeType.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['type'].Text;
end;

procedure TXMLAttributeType.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('type', Value);
end;

end.