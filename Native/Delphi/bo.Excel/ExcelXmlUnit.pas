
{************************************************************************************************************************}
{                                                                                                                        }
{                                                    XML Data Binding                                                    }
{                                                                                                                        }
{         Generated on: 9/14/2011 1:12:03 AM                                                                             }
{       Generated from: C:\Users\developer\Documents\SVN\bo.codeplex.com\Native\Delphi\bo.Excel\Excel-xsd\ExcelXml.xsd   }
{   Settings stored in: C:\Users\developer\Documents\SVN\bo.codeplex.com\Native\Delphi\bo.Excel\Excel-xsd\ExcelXml.xdb   }
{                                                                                                                        }
{************************************************************************************************************************}

unit ExcelXmlUnit;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLWorkbookType = interface;
  IXMLDocumentPropertiesType = interface;
  IXMLExcelWorkbookType = interface;
  IXMLStylesType = interface;
  IXMLStylesTypeList = interface;
  IXMLStyleType = interface;
  IXMLStyleTypeList = interface;
  IXMLAlignmentType = interface;
  IXMLNumberFormatType = interface;
  IXMLWorksheetType = interface;
  IXMLWorksheetTypeList = interface;
  IXMLTableType = interface;
  IXMLColumnType = interface;
  IXMLRowType = interface;
  IXMLCellType = interface;
  IXMLDataType = interface;
  IXMLWorksheetOptionsType = interface;
  IXMLPageSetupType = interface;
  IXMLHeaderType = interface;
  IXMLFooterType = interface;
  IXMLPageMarginsType = interface;
  IXMLPrintType = interface;
  IXMLPanesType = interface;
  IXMLPaneType = interface;

{ IXMLWorkbookType }

  IXMLWorkbookType = interface(IXMLNode)
    ['{38C7A95D-4BA6-44F4-A28C-76E887DE0702}']
    { Property Accessors }
    function Get_DocumentProperties: IXMLDocumentPropertiesType;
    function Get_ExcelWorkbook: IXMLExcelWorkbookType;
    function Get_Styles: IXMLStylesTypeList;
    function Get_Worksheet: IXMLWorksheetTypeList;
    { Methods & Properties }
    property DocumentProperties: IXMLDocumentPropertiesType read Get_DocumentProperties;
    property ExcelWorkbook: IXMLExcelWorkbookType read Get_ExcelWorkbook;
    property Styles: IXMLStylesTypeList read Get_Styles;
    property Worksheet: IXMLWorksheetTypeList read Get_Worksheet;
  end;

{ IXMLDocumentPropertiesType }

  IXMLDocumentPropertiesType = interface(IXMLNode)
    ['{07C9255D-1F64-4918-9EA5-A5AAA74896FD}']
    { Property Accessors }
    function Get_LastAuthor: UnicodeString;
    function Get_Created: UnicodeString;
    function Get_LastSaved: UnicodeString;
    function Get_Version: UnicodeString;
    procedure Set_LastAuthor(Value: UnicodeString);
    procedure Set_Created(Value: UnicodeString);
    procedure Set_LastSaved(Value: UnicodeString);
    procedure Set_Version(Value: UnicodeString);
    { Methods & Properties }
    property LastAuthor: UnicodeString read Get_LastAuthor write Set_LastAuthor;
    property Created: UnicodeString read Get_Created write Set_Created;
    property LastSaved: UnicodeString read Get_LastSaved write Set_LastSaved;
    property Version: UnicodeString read Get_Version write Set_Version;
  end;

{ IXMLExcelWorkbookType }

  IXMLExcelWorkbookType = interface(IXMLNode)
    ['{04163AB6-45BC-462C-AD67-2D2C49DF37C5}']
    { Property Accessors }
    function Get_WindowHeight: Integer;
    function Get_WindowWidth: Integer;
    function Get_WindowTopX: Integer;
    function Get_WindowTopY: Integer;
    function Get_AcceptLabelsInFormulas: UnicodeString;
    function Get_ProtectStructure: Boolean;
    function Get_ProtectWindows: Boolean;
    procedure Set_WindowHeight(Value: Integer);
    procedure Set_WindowWidth(Value: Integer);
    procedure Set_WindowTopX(Value: Integer);
    procedure Set_WindowTopY(Value: Integer);
    procedure Set_AcceptLabelsInFormulas(Value: UnicodeString);
    procedure Set_ProtectStructure(Value: Boolean);
    procedure Set_ProtectWindows(Value: Boolean);
    { Methods & Properties }
    property WindowHeight: Integer read Get_WindowHeight write Set_WindowHeight;
    property WindowWidth: Integer read Get_WindowWidth write Set_WindowWidth;
    property WindowTopX: Integer read Get_WindowTopX write Set_WindowTopX;
    property WindowTopY: Integer read Get_WindowTopY write Set_WindowTopY;
    property AcceptLabelsInFormulas: UnicodeString read Get_AcceptLabelsInFormulas write Set_AcceptLabelsInFormulas;
    property ProtectStructure: Boolean read Get_ProtectStructure write Set_ProtectStructure;
    property ProtectWindows: Boolean read Get_ProtectWindows write Set_ProtectWindows;
  end;

{ IXMLStylesType }

  IXMLStylesType = interface(IXMLNodeCollection)
    ['{A193A13C-4D65-459A-9375-0BFFB4857922}']
    { Property Accessors }
    function Get_Style(Index: Integer): IXMLStyleType;
    { Methods & Properties }
    function Add: IXMLStyleType;
    function Insert(const Index: Integer): IXMLStyleType;
    property Style[Index: Integer]: IXMLStyleType read Get_Style; default;
  end;

{ IXMLStylesTypeList }

  IXMLStylesTypeList = interface(IXMLNodeCollection)
    ['{07A33DA5-C9E4-4C40-B6A4-AA6A296296B6}']
    { Methods & Properties }
    function Add: IXMLStylesType;
    function Insert(const Index: Integer): IXMLStylesType;

    function Get_Item(Index: Integer): IXMLStylesType;
    property Items[Index: Integer]: IXMLStylesType read Get_Item; default;
  end;

{ IXMLStyleType }

  IXMLStyleType = interface(IXMLNode)
    ['{3DDAF66F-0D0E-4DBB-A192-73DFCACF97E3}']
    { Property Accessors }
    function Get_ID: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Alignment: IXMLAlignmentType;
    function Get_Borders: UnicodeString;
    function Get_Font: UnicodeString;
    function Get_Interior: UnicodeString;
    function Get_NumberFormat: IXMLNumberFormatType;
    function Get_Protection: UnicodeString;
    procedure Set_ID(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Borders(Value: UnicodeString);
    procedure Set_Font(Value: UnicodeString);
    procedure Set_Interior(Value: UnicodeString);
    procedure Set_Protection(Value: UnicodeString);
    { Methods & Properties }
    property ID: UnicodeString read Get_ID write Set_ID;
    property Name: UnicodeString read Get_Name write Set_Name;
    property Alignment: IXMLAlignmentType read Get_Alignment;
    property Borders: UnicodeString read Get_Borders write Set_Borders;
    property Font: UnicodeString read Get_Font write Set_Font;
    property Interior: UnicodeString read Get_Interior write Set_Interior;
    property NumberFormat: IXMLNumberFormatType read Get_NumberFormat;
    property Protection: UnicodeString read Get_Protection write Set_Protection;
  end;

{ IXMLStyleTypeList }

  IXMLStyleTypeList = interface(IXMLNodeCollection)
    ['{2F33003A-601A-4C31-9469-6C4891BDAE9F}']
    { Methods & Properties }
    function Add: IXMLStyleType;
    function Insert(const Index: Integer): IXMLStyleType;

    function Get_Item(Index: Integer): IXMLStyleType;
    property Items[Index: Integer]: IXMLStyleType read Get_Item; default;
  end;

{ IXMLAlignmentType }

  IXMLAlignmentType = interface(IXMLNode)
    ['{33AAB3E9-67AE-4E98-89FB-07CFC879A35B}']
    { Property Accessors }
    function Get_Vertical: UnicodeString;
    procedure Set_Vertical(Value: UnicodeString);
    { Methods & Properties }
    property Vertical: UnicodeString read Get_Vertical write Set_Vertical;
  end;

{ IXMLNumberFormatType }

  IXMLNumberFormatType = interface(IXMLNode)
    ['{E2F894CE-A844-4080-8FFB-38F3ED75D239}']
    { Property Accessors }
    function Get_Format: UnicodeString;
    procedure Set_Format(Value: UnicodeString);
    { Methods & Properties }
    property Format: UnicodeString read Get_Format write Set_Format;
  end;

{ IXMLWorksheetType }

  IXMLWorksheetType = interface(IXMLNode)
    ['{610D02BE-A988-4D5A-A66C-28781A2FB5BB}']
    { Property Accessors }
    function Get_Name: UnicodeString;
    function Get_Table: IXMLTableType;
    function Get_WorksheetOptions: IXMLWorksheetOptionsType;
    procedure Set_Name(Value: UnicodeString);
    { Methods & Properties }
    property Name: UnicodeString read Get_Name write Set_Name;
    property Table: IXMLTableType read Get_Table;
    property WorksheetOptions: IXMLWorksheetOptionsType read Get_WorksheetOptions;
  end;

{ IXMLWorksheetTypeList }

  IXMLWorksheetTypeList = interface(IXMLNodeCollection)
    ['{259D1743-44B6-47B2-BD7E-B152E1FD95C1}']
    { Methods & Properties }
    function Add: IXMLWorksheetType;
    function Insert(const Index: Integer): IXMLWorksheetType;

    function Get_Item(Index: Integer): IXMLWorksheetType;
    property Items[Index: Integer]: IXMLWorksheetType read Get_Item; default;
  end;

{ IXMLTableType }

  IXMLTableType = interface(IXMLNode)
    ['{BF776F3B-30DD-4102-ADAF-B272DD129422}']
    { Property Accessors }
    function Get_ExpandedColumnCount: Integer;
    function Get_ExpandedRowCount: Integer;
    function Get_FullColumns: Integer;
    function Get_FullRows: Integer;
    function Get_Column: IXMLColumnType;
    function Get_Row: IXMLRowType;
    procedure Set_ExpandedColumnCount(Value: Integer);
    procedure Set_ExpandedRowCount(Value: Integer);
    procedure Set_FullColumns(Value: Integer);
    procedure Set_FullRows(Value: Integer);
    { Methods & Properties }
    property ExpandedColumnCount: Integer read Get_ExpandedColumnCount write Set_ExpandedColumnCount;
    property ExpandedRowCount: Integer read Get_ExpandedRowCount write Set_ExpandedRowCount;
    property FullColumns: Integer read Get_FullColumns write Set_FullColumns;
    property FullRows: Integer read Get_FullRows write Set_FullRows;
    property Column: IXMLColumnType read Get_Column;
    property Row: IXMLRowType read Get_Row;
  end;

{ IXMLColumnType }

  IXMLColumnType = interface(IXMLNode)
    ['{9BDB8BE4-EEE1-444C-A220-50B8549FD3C5}']
    { Property Accessors }
    function Get_Index: Integer;
    function Get_StyleID: UnicodeString;
    function Get_AutoFitWidth: Integer;
    function Get_Width: UnicodeString;
    procedure Set_Index(Value: Integer);
    procedure Set_StyleID(Value: UnicodeString);
    procedure Set_AutoFitWidth(Value: Integer);
    procedure Set_Width(Value: UnicodeString);
    { Methods & Properties }
    property Index: Integer read Get_Index write Set_Index;
    property StyleID: UnicodeString read Get_StyleID write Set_StyleID;
    property AutoFitWidth: Integer read Get_AutoFitWidth write Set_AutoFitWidth;
    property Width: UnicodeString read Get_Width write Set_Width;
  end;

{ IXMLRowType }

  IXMLRowType = interface(IXMLNode)
    ['{A36996A3-AB25-415C-8D2B-BDCD1A910F93}']
    { Property Accessors }
    function Get_Cell: IXMLCellType;
    { Methods & Properties }
    property Cell: IXMLCellType read Get_Cell;
  end;

{ IXMLCellType }

  IXMLCellType = interface(IXMLNode)
    ['{BF5A06B5-8D68-4B7D-833A-DA0564CE2E2A}']
    { Property Accessors }
    function Get_Formula: UnicodeString;
    function Get_Data: IXMLDataType;
    procedure Set_Formula(Value: UnicodeString);
    { Methods & Properties }
    property Formula: UnicodeString read Get_Formula write Set_Formula;
    property Data: IXMLDataType read Get_Data;
  end;

{ IXMLDataType }

  IXMLDataType = interface(IXMLNode)
    ['{8615B3C7-DA8A-4F4A-BC72-68834C2D511E}']
    { Property Accessors }
    function Get_Type_: UnicodeString;
    function Get_Ticked: Integer;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_Ticked(Value: Integer);
    { Methods & Properties }
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
    property Ticked: Integer read Get_Ticked write Set_Ticked;
  end;

{ IXMLWorksheetOptionsType }

  IXMLWorksheetOptionsType = interface(IXMLNode)
    ['{B54B9355-3EA6-4EEC-9BF1-6D759B343BD7}']
    { Property Accessors }
    function Get_PageSetup: IXMLPageSetupType;
    function Get_Print: IXMLPrintType;
    function Get_Selected: UnicodeString;
    function Get_Panes: IXMLPanesType;
    function Get_ProtectObjects: Boolean;
    function Get_ProtectScenarios: Boolean;
    procedure Set_Selected(Value: UnicodeString);
    procedure Set_ProtectObjects(Value: Boolean);
    procedure Set_ProtectScenarios(Value: Boolean);
    { Methods & Properties }
    property PageSetup: IXMLPageSetupType read Get_PageSetup;
    property Print: IXMLPrintType read Get_Print;
    property Selected: UnicodeString read Get_Selected write Set_Selected;
    property Panes: IXMLPanesType read Get_Panes;
    property ProtectObjects: Boolean read Get_ProtectObjects write Set_ProtectObjects;
    property ProtectScenarios: Boolean read Get_ProtectScenarios write Set_ProtectScenarios;
  end;

{ IXMLPageSetupType }

  IXMLPageSetupType = interface(IXMLNode)
    ['{6E18C040-2939-44F5-A315-E9FFB2EA8940}']
    { Property Accessors }
    function Get_Header: IXMLHeaderType;
    function Get_Footer: IXMLFooterType;
    function Get_PageMargins: IXMLPageMarginsType;
    { Methods & Properties }
    property Header: IXMLHeaderType read Get_Header;
    property Footer: IXMLFooterType read Get_Footer;
    property PageMargins: IXMLPageMarginsType read Get_PageMargins;
  end;

{ IXMLHeaderType }

  IXMLHeaderType = interface(IXMLNode)
    ['{6350B696-C2B6-4364-8828-AE2D052C5C83}']
    { Property Accessors }
    function Get_Margin: UnicodeString;
    function Get_Data: UnicodeString;
    procedure Set_Margin(Value: UnicodeString);
    procedure Set_Data(Value: UnicodeString);
    { Methods & Properties }
    property Margin: UnicodeString read Get_Margin write Set_Margin;
    property Data: UnicodeString read Get_Data write Set_Data;
  end;

{ IXMLFooterType }

  IXMLFooterType = interface(IXMLNode)
    ['{7801D0B8-E6C5-4262-B783-7000A23DF0F7}']
    { Property Accessors }
    function Get_Margin: UnicodeString;
    function Get_Data: UnicodeString;
    procedure Set_Margin(Value: UnicodeString);
    procedure Set_Data(Value: UnicodeString);
    { Methods & Properties }
    property Margin: UnicodeString read Get_Margin write Set_Margin;
    property Data: UnicodeString read Get_Data write Set_Data;
  end;

{ IXMLPageMarginsType }

  IXMLPageMarginsType = interface(IXMLNode)
    ['{94553906-3091-4176-893D-7C503A895C22}']
    { Property Accessors }
    function Get_Bottom: UnicodeString;
    function Get_Left: UnicodeString;
    function Get_Right: UnicodeString;
    function Get_Top: UnicodeString;
    procedure Set_Bottom(Value: UnicodeString);
    procedure Set_Left(Value: UnicodeString);
    procedure Set_Right(Value: UnicodeString);
    procedure Set_Top(Value: UnicodeString);
    { Methods & Properties }
    property Bottom: UnicodeString read Get_Bottom write Set_Bottom;
    property Left: UnicodeString read Get_Left write Set_Left;
    property Right: UnicodeString read Get_Right write Set_Right;
    property Top: UnicodeString read Get_Top write Set_Top;
  end;

{ IXMLPrintType }

  IXMLPrintType = interface(IXMLNode)
    ['{E88625F4-3BF8-4734-AD2D-891AAE3166D9}']
    { Property Accessors }
    function Get_ValidPrinterInfo: UnicodeString;
    function Get_HorizontalResolution: Integer;
    function Get_VerticalResolution: Integer;
    procedure Set_ValidPrinterInfo(Value: UnicodeString);
    procedure Set_HorizontalResolution(Value: Integer);
    procedure Set_VerticalResolution(Value: Integer);
    { Methods & Properties }
    property ValidPrinterInfo: UnicodeString read Get_ValidPrinterInfo write Set_ValidPrinterInfo;
    property HorizontalResolution: Integer read Get_HorizontalResolution write Set_HorizontalResolution;
    property VerticalResolution: Integer read Get_VerticalResolution write Set_VerticalResolution;
  end;

{ IXMLPanesType }

  IXMLPanesType = interface(IXMLNode)
    ['{9305FFC9-BBA9-422C-8C64-10C173C5788E}']
    { Property Accessors }
    function Get_Pane: IXMLPaneType;
    { Methods & Properties }
    property Pane: IXMLPaneType read Get_Pane;
  end;

{ IXMLPaneType }

  IXMLPaneType = interface(IXMLNode)
    ['{1A4924B1-E328-466A-89AC-3A15643DEA65}']
    { Property Accessors }
    function Get_Number: Integer;
    function Get_ActiveCol: Integer;
    function Get_RangeSelection: UnicodeString;
    procedure Set_Number(Value: Integer);
    procedure Set_ActiveCol(Value: Integer);
    procedure Set_RangeSelection(Value: UnicodeString);
    { Methods & Properties }
    property Number: Integer read Get_Number write Set_Number;
    property ActiveCol: Integer read Get_ActiveCol write Set_ActiveCol;
    property RangeSelection: UnicodeString read Get_RangeSelection write Set_RangeSelection;
  end;

{ Forward Decls }

  TXMLWorkbookType = class;
  TXMLDocumentPropertiesType = class;
  TXMLExcelWorkbookType = class;
  TXMLStylesType = class;
  TXMLStylesTypeList = class;
  TXMLStyleType = class;
  TXMLStyleTypeList = class;
  TXMLAlignmentType = class;
  TXMLNumberFormatType = class;
  TXMLWorksheetType = class;
  TXMLWorksheetTypeList = class;
  TXMLTableType = class;
  TXMLColumnType = class;
  TXMLRowType = class;
  TXMLCellType = class;
  TXMLDataType = class;
  TXMLWorksheetOptionsType = class;
  TXMLPageSetupType = class;
  TXMLHeaderType = class;
  TXMLFooterType = class;
  TXMLPageMarginsType = class;
  TXMLPrintType = class;
  TXMLPanesType = class;
  TXMLPaneType = class;

{ TXMLWorkbookType }

  TXMLWorkbookType = class(TXMLNode, IXMLWorkbookType)
  private
    FStyles: IXMLStylesTypeList;
    FWorksheet: IXMLWorksheetTypeList;
  protected
    { IXMLWorkbookType }
    function Get_DocumentProperties: IXMLDocumentPropertiesType;
    function Get_ExcelWorkbook: IXMLExcelWorkbookType;
    function Get_Styles: IXMLStylesTypeList;
    function Get_Worksheet: IXMLWorksheetTypeList;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDocumentPropertiesType }

  TXMLDocumentPropertiesType = class(TXMLNode, IXMLDocumentPropertiesType)
  protected
    { IXMLDocumentPropertiesType }
    function Get_LastAuthor: UnicodeString;
    function Get_Created: UnicodeString;
    function Get_LastSaved: UnicodeString;
    function Get_Version: UnicodeString;
    procedure Set_LastAuthor(Value: UnicodeString);
    procedure Set_Created(Value: UnicodeString);
    procedure Set_LastSaved(Value: UnicodeString);
    procedure Set_Version(Value: UnicodeString);
  end;

{ TXMLExcelWorkbookType }

  TXMLExcelWorkbookType = class(TXMLNode, IXMLExcelWorkbookType)
  protected
    { IXMLExcelWorkbookType }
    function Get_WindowHeight: Integer;
    function Get_WindowWidth: Integer;
    function Get_WindowTopX: Integer;
    function Get_WindowTopY: Integer;
    function Get_AcceptLabelsInFormulas: UnicodeString;
    function Get_ProtectStructure: Boolean;
    function Get_ProtectWindows: Boolean;
    procedure Set_WindowHeight(Value: Integer);
    procedure Set_WindowWidth(Value: Integer);
    procedure Set_WindowTopX(Value: Integer);
    procedure Set_WindowTopY(Value: Integer);
    procedure Set_AcceptLabelsInFormulas(Value: UnicodeString);
    procedure Set_ProtectStructure(Value: Boolean);
    procedure Set_ProtectWindows(Value: Boolean);
  end;

{ TXMLStylesType }

  TXMLStylesType = class(TXMLNodeCollection, IXMLStylesType)
  protected
    { IXMLStylesType }
    function Get_Style(Index: Integer): IXMLStyleType;
    function Add: IXMLStyleType;
    function Insert(const Index: Integer): IXMLStyleType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLStylesTypeList }

  TXMLStylesTypeList = class(TXMLNodeCollection, IXMLStylesTypeList)
  protected
    { IXMLStylesTypeList }
    function Add: IXMLStylesType;
    function Insert(const Index: Integer): IXMLStylesType;

    function Get_Item(Index: Integer): IXMLStylesType;
  end;

{ TXMLStyleType }

  TXMLStyleType = class(TXMLNode, IXMLStyleType)
  protected
    { IXMLStyleType }
    function Get_ID: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Alignment: IXMLAlignmentType;
    function Get_Borders: UnicodeString;
    function Get_Font: UnicodeString;
    function Get_Interior: UnicodeString;
    function Get_NumberFormat: IXMLNumberFormatType;
    function Get_Protection: UnicodeString;
    procedure Set_ID(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Borders(Value: UnicodeString);
    procedure Set_Font(Value: UnicodeString);
    procedure Set_Interior(Value: UnicodeString);
    procedure Set_Protection(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLStyleTypeList }

  TXMLStyleTypeList = class(TXMLNodeCollection, IXMLStyleTypeList)
  protected
    { IXMLStyleTypeList }
    function Add: IXMLStyleType;
    function Insert(const Index: Integer): IXMLStyleType;

    function Get_Item(Index: Integer): IXMLStyleType;
  end;

{ TXMLAlignmentType }

  TXMLAlignmentType = class(TXMLNode, IXMLAlignmentType)
  protected
    { IXMLAlignmentType }
    function Get_Vertical: UnicodeString;
    procedure Set_Vertical(Value: UnicodeString);
  end;

{ TXMLNumberFormatType }

  TXMLNumberFormatType = class(TXMLNode, IXMLNumberFormatType)
  protected
    { IXMLNumberFormatType }
    function Get_Format: UnicodeString;
    procedure Set_Format(Value: UnicodeString);
  end;

{ TXMLWorksheetType }

  TXMLWorksheetType = class(TXMLNode, IXMLWorksheetType)
  protected
    { IXMLWorksheetType }
    function Get_Name: UnicodeString;
    function Get_Table: IXMLTableType;
    function Get_WorksheetOptions: IXMLWorksheetOptionsType;
    procedure Set_Name(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLWorksheetTypeList }

  TXMLWorksheetTypeList = class(TXMLNodeCollection, IXMLWorksheetTypeList)
  protected
    { IXMLWorksheetTypeList }
    function Add: IXMLWorksheetType;
    function Insert(const Index: Integer): IXMLWorksheetType;

    function Get_Item(Index: Integer): IXMLWorksheetType;
  end;

{ TXMLTableType }

  TXMLTableType = class(TXMLNode, IXMLTableType)
  protected
    { IXMLTableType }
    function Get_ExpandedColumnCount: Integer;
    function Get_ExpandedRowCount: Integer;
    function Get_FullColumns: Integer;
    function Get_FullRows: Integer;
    function Get_Column: IXMLColumnType;
    function Get_Row: IXMLRowType;
    procedure Set_ExpandedColumnCount(Value: Integer);
    procedure Set_ExpandedRowCount(Value: Integer);
    procedure Set_FullColumns(Value: Integer);
    procedure Set_FullRows(Value: Integer);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLColumnType }

  TXMLColumnType = class(TXMLNode, IXMLColumnType)
  protected
    { IXMLColumnType }
    function Get_Index: Integer;
    function Get_StyleID: UnicodeString;
    function Get_AutoFitWidth: Integer;
    function Get_Width: UnicodeString;
    procedure Set_Index(Value: Integer);
    procedure Set_StyleID(Value: UnicodeString);
    procedure Set_AutoFitWidth(Value: Integer);
    procedure Set_Width(Value: UnicodeString);
  end;

{ TXMLRowType }

  TXMLRowType = class(TXMLNode, IXMLRowType)
  protected
    { IXMLRowType }
    function Get_Cell: IXMLCellType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLCellType }

  TXMLCellType = class(TXMLNode, IXMLCellType)
  protected
    { IXMLCellType }
    function Get_Formula: UnicodeString;
    function Get_Data: IXMLDataType;
    procedure Set_Formula(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDataType }

  TXMLDataType = class(TXMLNode, IXMLDataType)
  protected
    { IXMLDataType }
    function Get_Type_: UnicodeString;
    function Get_Ticked: Integer;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_Ticked(Value: Integer);
  end;

{ TXMLWorksheetOptionsType }

  TXMLWorksheetOptionsType = class(TXMLNode, IXMLWorksheetOptionsType)
  protected
    { IXMLWorksheetOptionsType }
    function Get_PageSetup: IXMLPageSetupType;
    function Get_Print: IXMLPrintType;
    function Get_Selected: UnicodeString;
    function Get_Panes: IXMLPanesType;
    function Get_ProtectObjects: Boolean;
    function Get_ProtectScenarios: Boolean;
    procedure Set_Selected(Value: UnicodeString);
    procedure Set_ProtectObjects(Value: Boolean);
    procedure Set_ProtectScenarios(Value: Boolean);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLPageSetupType }

  TXMLPageSetupType = class(TXMLNode, IXMLPageSetupType)
  protected
    { IXMLPageSetupType }
    function Get_Header: IXMLHeaderType;
    function Get_Footer: IXMLFooterType;
    function Get_PageMargins: IXMLPageMarginsType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLHeaderType }

  TXMLHeaderType = class(TXMLNode, IXMLHeaderType)
  protected
    { IXMLHeaderType }
    function Get_Margin: UnicodeString;
    function Get_Data: UnicodeString;
    procedure Set_Margin(Value: UnicodeString);
    procedure Set_Data(Value: UnicodeString);
  end;

{ TXMLFooterType }

  TXMLFooterType = class(TXMLNode, IXMLFooterType)
  protected
    { IXMLFooterType }
    function Get_Margin: UnicodeString;
    function Get_Data: UnicodeString;
    procedure Set_Margin(Value: UnicodeString);
    procedure Set_Data(Value: UnicodeString);
  end;

{ TXMLPageMarginsType }

  TXMLPageMarginsType = class(TXMLNode, IXMLPageMarginsType)
  protected
    { IXMLPageMarginsType }
    function Get_Bottom: UnicodeString;
    function Get_Left: UnicodeString;
    function Get_Right: UnicodeString;
    function Get_Top: UnicodeString;
    procedure Set_Bottom(Value: UnicodeString);
    procedure Set_Left(Value: UnicodeString);
    procedure Set_Right(Value: UnicodeString);
    procedure Set_Top(Value: UnicodeString);
  end;

{ TXMLPrintType }

  TXMLPrintType = class(TXMLNode, IXMLPrintType)
  protected
    { IXMLPrintType }
    function Get_ValidPrinterInfo: UnicodeString;
    function Get_HorizontalResolution: Integer;
    function Get_VerticalResolution: Integer;
    procedure Set_ValidPrinterInfo(Value: UnicodeString);
    procedure Set_HorizontalResolution(Value: Integer);
    procedure Set_VerticalResolution(Value: Integer);
  end;

{ TXMLPanesType }

  TXMLPanesType = class(TXMLNode, IXMLPanesType)
  protected
    { IXMLPanesType }
    function Get_Pane: IXMLPaneType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLPaneType }

  TXMLPaneType = class(TXMLNode, IXMLPaneType)
  protected
    { IXMLPaneType }
    function Get_Number: Integer;
    function Get_ActiveCol: Integer;
    function Get_RangeSelection: UnicodeString;
    procedure Set_Number(Value: Integer);
    procedure Set_ActiveCol(Value: Integer);
    procedure Set_RangeSelection(Value: UnicodeString);
  end;

{ Global Functions }

function GetWorkbook(Doc: IXMLDocument): IXMLWorkbookType;
function LoadWorkbook(const FileName: string): IXMLWorkbookType;
function NewWorkbook: IXMLWorkbookType;

const
  TargetNamespace = '';

implementation

{ Global Functions }

function GetWorkbook(Doc: IXMLDocument): IXMLWorkbookType;
begin
  Result := Doc.GetDocBinding('Workbook', TXMLWorkbookType, TargetNamespace) as IXMLWorkbookType;
end;

function LoadWorkbook(const FileName: string): IXMLWorkbookType;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('Workbook', TXMLWorkbookType, TargetNamespace) as IXMLWorkbookType;
end;

function NewWorkbook: IXMLWorkbookType;
begin
  Result := NewXMLDocument.GetDocBinding('Workbook', TXMLWorkbookType, TargetNamespace) as IXMLWorkbookType;
end;

{ TXMLWorkbookType }

procedure TXMLWorkbookType.AfterConstruction;
begin
  RegisterChildNode('DocumentProperties', TXMLDocumentPropertiesType);
  RegisterChildNode('ExcelWorkbook', TXMLExcelWorkbookType);
  RegisterChildNode('Styles', TXMLStylesType);
  RegisterChildNode('Worksheet', TXMLWorksheetType);
  FStyles := CreateCollection(TXMLStylesTypeList, IXMLStylesType, 'Styles') as IXMLStylesTypeList;
  FWorksheet := CreateCollection(TXMLWorksheetTypeList, IXMLWorksheetType, 'Worksheet') as IXMLWorksheetTypeList;
  inherited;
end;

function TXMLWorkbookType.Get_DocumentProperties: IXMLDocumentPropertiesType;
begin
  Result := ChildNodes['DocumentProperties'] as IXMLDocumentPropertiesType;
end;

function TXMLWorkbookType.Get_ExcelWorkbook: IXMLExcelWorkbookType;
begin
  Result := ChildNodes['ExcelWorkbook'] as IXMLExcelWorkbookType;
end;

function TXMLWorkbookType.Get_Styles: IXMLStylesTypeList;
begin
  Result := FStyles;
end;

function TXMLWorkbookType.Get_Worksheet: IXMLWorksheetTypeList;
begin
  Result := FWorksheet;
end;

{ TXMLDocumentPropertiesType }

function TXMLDocumentPropertiesType.Get_LastAuthor: UnicodeString;
begin
  Result := ChildNodes['LastAuthor'].Text;
end;

procedure TXMLDocumentPropertiesType.Set_LastAuthor(Value: UnicodeString);
begin
  ChildNodes['LastAuthor'].NodeValue := Value;
end;

function TXMLDocumentPropertiesType.Get_Created: UnicodeString;
begin
  Result := ChildNodes['Created'].Text;
end;

procedure TXMLDocumentPropertiesType.Set_Created(Value: UnicodeString);
begin
  ChildNodes['Created'].NodeValue := Value;
end;

function TXMLDocumentPropertiesType.Get_LastSaved: UnicodeString;
begin
  Result := ChildNodes['LastSaved'].Text;
end;

procedure TXMLDocumentPropertiesType.Set_LastSaved(Value: UnicodeString);
begin
  ChildNodes['LastSaved'].NodeValue := Value;
end;

function TXMLDocumentPropertiesType.Get_Version: UnicodeString;
begin
  Result := ChildNodes['Version'].Text;
end;

procedure TXMLDocumentPropertiesType.Set_Version(Value: UnicodeString);
begin
  ChildNodes['Version'].NodeValue := Value;
end;

{ TXMLExcelWorkbookType }

function TXMLExcelWorkbookType.Get_WindowHeight: Integer;
begin
  Result := ChildNodes['WindowHeight'].NodeValue;
end;

procedure TXMLExcelWorkbookType.Set_WindowHeight(Value: Integer);
begin
  ChildNodes['WindowHeight'].NodeValue := Value;
end;

function TXMLExcelWorkbookType.Get_WindowWidth: Integer;
begin
  Result := ChildNodes['WindowWidth'].NodeValue;
end;

procedure TXMLExcelWorkbookType.Set_WindowWidth(Value: Integer);
begin
  ChildNodes['WindowWidth'].NodeValue := Value;
end;

function TXMLExcelWorkbookType.Get_WindowTopX: Integer;
begin
  Result := ChildNodes['WindowTopX'].NodeValue;
end;

procedure TXMLExcelWorkbookType.Set_WindowTopX(Value: Integer);
begin
  ChildNodes['WindowTopX'].NodeValue := Value;
end;

function TXMLExcelWorkbookType.Get_WindowTopY: Integer;
begin
  Result := ChildNodes['WindowTopY'].NodeValue;
end;

procedure TXMLExcelWorkbookType.Set_WindowTopY(Value: Integer);
begin
  ChildNodes['WindowTopY'].NodeValue := Value;
end;

function TXMLExcelWorkbookType.Get_AcceptLabelsInFormulas: UnicodeString;
begin
  Result := ChildNodes['AcceptLabelsInFormulas'].Text;
end;

procedure TXMLExcelWorkbookType.Set_AcceptLabelsInFormulas(Value: UnicodeString);
begin
  ChildNodes['AcceptLabelsInFormulas'].NodeValue := Value;
end;

function TXMLExcelWorkbookType.Get_ProtectStructure: Boolean;
begin
  Result := ChildNodes['ProtectStructure'].NodeValue;
end;

procedure TXMLExcelWorkbookType.Set_ProtectStructure(Value: Boolean);
begin
  ChildNodes['ProtectStructure'].NodeValue := Value;
end;

function TXMLExcelWorkbookType.Get_ProtectWindows: Boolean;
begin
  Result := ChildNodes['ProtectWindows'].NodeValue;
end;

procedure TXMLExcelWorkbookType.Set_ProtectWindows(Value: Boolean);
begin
  ChildNodes['ProtectWindows'].NodeValue := Value;
end;

{ TXMLStylesType }

procedure TXMLStylesType.AfterConstruction;
begin
  RegisterChildNode('Style', TXMLStyleType);
  ItemTag := 'Style';
  ItemInterface := IXMLStyleType;
  inherited;
end;

function TXMLStylesType.Get_Style(Index: Integer): IXMLStyleType;
begin
  Result := List[Index] as IXMLStyleType;
end;

function TXMLStylesType.Add: IXMLStyleType;
begin
  Result := AddItem(-1) as IXMLStyleType;
end;

function TXMLStylesType.Insert(const Index: Integer): IXMLStyleType;
begin
  Result := AddItem(Index) as IXMLStyleType;
end;

{ TXMLStylesTypeList }

function TXMLStylesTypeList.Add: IXMLStylesType;
begin
  Result := AddItem(-1) as IXMLStylesType;
end;

function TXMLStylesTypeList.Insert(const Index: Integer): IXMLStylesType;
begin
  Result := AddItem(Index) as IXMLStylesType;
end;

function TXMLStylesTypeList.Get_Item(Index: Integer): IXMLStylesType;
begin
  Result := List[Index] as IXMLStylesType;
end;

{ TXMLStyleType }

procedure TXMLStyleType.AfterConstruction;
begin
  RegisterChildNode('Alignment', TXMLAlignmentType);
  RegisterChildNode('NumberFormat', TXMLNumberFormatType);
  inherited;
end;

function TXMLStyleType.Get_ID: UnicodeString;
begin
  Result := AttributeNodes['ss:ID'].Text;
end;

procedure TXMLStyleType.Set_ID(Value: UnicodeString);
begin
  SetAttribute('ss:ID', Value);
end;

function TXMLStyleType.Get_Name: UnicodeString;
begin
  Result := AttributeNodes['ss:Name'].Text;
end;

procedure TXMLStyleType.Set_Name(Value: UnicodeString);
begin
  SetAttribute('ss:Name', Value);
end;

function TXMLStyleType.Get_Alignment: IXMLAlignmentType;
begin
  Result := ChildNodes['Alignment'] as IXMLAlignmentType;
end;

function TXMLStyleType.Get_Borders: UnicodeString;
begin
  Result := ChildNodes['Borders'].Text;
end;

procedure TXMLStyleType.Set_Borders(Value: UnicodeString);
begin
  ChildNodes['Borders'].NodeValue := Value;
end;

function TXMLStyleType.Get_Font: UnicodeString;
begin
  Result := ChildNodes['Font'].Text;
end;

procedure TXMLStyleType.Set_Font(Value: UnicodeString);
begin
  ChildNodes['Font'].NodeValue := Value;
end;

function TXMLStyleType.Get_Interior: UnicodeString;
begin
  Result := ChildNodes['Interior'].Text;
end;

procedure TXMLStyleType.Set_Interior(Value: UnicodeString);
begin
  ChildNodes['Interior'].NodeValue := Value;
end;

function TXMLStyleType.Get_NumberFormat: IXMLNumberFormatType;
begin
  Result := ChildNodes['NumberFormat'] as IXMLNumberFormatType;
end;

function TXMLStyleType.Get_Protection: UnicodeString;
begin
  Result := ChildNodes['Protection'].Text;
end;

procedure TXMLStyleType.Set_Protection(Value: UnicodeString);
begin
  ChildNodes['Protection'].NodeValue := Value;
end;

{ TXMLStyleTypeList }

function TXMLStyleTypeList.Add: IXMLStyleType;
begin
  Result := AddItem(-1) as IXMLStyleType;
end;

function TXMLStyleTypeList.Insert(const Index: Integer): IXMLStyleType;
begin
  Result := AddItem(Index) as IXMLStyleType;
end;

function TXMLStyleTypeList.Get_Item(Index: Integer): IXMLStyleType;
begin
  Result := List[Index] as IXMLStyleType;
end;

{ TXMLAlignmentType }

function TXMLAlignmentType.Get_Vertical: UnicodeString;
begin
  Result := AttributeNodes['ss:Vertical'].Text;
end;

procedure TXMLAlignmentType.Set_Vertical(Value: UnicodeString);
begin
  SetAttribute('ss:Vertical', Value);
end;

{ TXMLNumberFormatType }

function TXMLNumberFormatType.Get_Format: UnicodeString;
begin
  Result := AttributeNodes['ss:Format'].Text;
end;

procedure TXMLNumberFormatType.Set_Format(Value: UnicodeString);
begin
  SetAttribute('ss:Format', Value);
end;

{ TXMLWorksheetType }

procedure TXMLWorksheetType.AfterConstruction;
begin
  RegisterChildNode('Table', TXMLTableType);
  RegisterChildNode('WorksheetOptions', TXMLWorksheetOptionsType);
  inherited;
end;

function TXMLWorksheetType.Get_Name: UnicodeString;
begin
  Result := AttributeNodes['ss:Name'].Text;
end;

procedure TXMLWorksheetType.Set_Name(Value: UnicodeString);
begin
  SetAttribute('ss:Name', Value);
end;

function TXMLWorksheetType.Get_Table: IXMLTableType;
begin
  Result := ChildNodes['Table'] as IXMLTableType;
end;

function TXMLWorksheetType.Get_WorksheetOptions: IXMLWorksheetOptionsType;
begin
  Result := ChildNodes['WorksheetOptions'] as IXMLWorksheetOptionsType;
end;

{ TXMLWorksheetTypeList }

function TXMLWorksheetTypeList.Add: IXMLWorksheetType;
begin
  Result := AddItem(-1) as IXMLWorksheetType;
end;

function TXMLWorksheetTypeList.Insert(const Index: Integer): IXMLWorksheetType;
begin
  Result := AddItem(Index) as IXMLWorksheetType;
end;

function TXMLWorksheetTypeList.Get_Item(Index: Integer): IXMLWorksheetType;
begin
  Result := List[Index] as IXMLWorksheetType;
end;

{ TXMLTableType }

procedure TXMLTableType.AfterConstruction;
begin
  RegisterChildNode('Column', TXMLColumnType);
  RegisterChildNode('Row', TXMLRowType);
  inherited;
end;

function TXMLTableType.Get_ExpandedColumnCount: Integer;
begin
  Result := AttributeNodes['ss:ExpandedColumnCount'].NodeValue;
end;

procedure TXMLTableType.Set_ExpandedColumnCount(Value: Integer);
begin
  SetAttribute('ss:ExpandedColumnCount', Value);
end;

function TXMLTableType.Get_ExpandedRowCount: Integer;
begin
  Result := AttributeNodes['ss:ExpandedRowCount'].NodeValue;
end;

procedure TXMLTableType.Set_ExpandedRowCount(Value: Integer);
begin
  SetAttribute('ss:ExpandedRowCount', Value);
end;

function TXMLTableType.Get_FullColumns: Integer;
begin
  Result := AttributeNodes['x:FullColumns'].NodeValue;
end;

procedure TXMLTableType.Set_FullColumns(Value: Integer);
begin
  SetAttribute('x:FullColumns', Value);
end;

function TXMLTableType.Get_FullRows: Integer;
begin
  Result := AttributeNodes['x:FullRows'].NodeValue;
end;

procedure TXMLTableType.Set_FullRows(Value: Integer);
begin
  SetAttribute('x:FullRows', Value);
end;

function TXMLTableType.Get_Column: IXMLColumnType;
begin
  Result := ChildNodes['Column'] as IXMLColumnType;
end;

function TXMLTableType.Get_Row: IXMLRowType;
begin
  Result := ChildNodes['Row'] as IXMLRowType;
end;

{ TXMLColumnType }

function TXMLColumnType.Get_Index: Integer;
begin
  Result := AttributeNodes['ss:Index'].NodeValue;
end;

procedure TXMLColumnType.Set_Index(Value: Integer);
begin
  SetAttribute('ss:Index', Value);
end;

function TXMLColumnType.Get_StyleID: UnicodeString;
begin
  Result := AttributeNodes['ss:StyleID'].Text;
end;

procedure TXMLColumnType.Set_StyleID(Value: UnicodeString);
begin
  SetAttribute('ss:StyleID', Value);
end;

function TXMLColumnType.Get_AutoFitWidth: Integer;
begin
  Result := AttributeNodes['ss:AutoFitWidth'].NodeValue;
end;

procedure TXMLColumnType.Set_AutoFitWidth(Value: Integer);
begin
  SetAttribute('ss:AutoFitWidth', Value);
end;

function TXMLColumnType.Get_Width: UnicodeString;
begin
  Result := AttributeNodes['ss:Width'].Text;
end;

procedure TXMLColumnType.Set_Width(Value: UnicodeString);
begin
  SetAttribute('ss:Width', Value);
end;

{ TXMLRowType }

procedure TXMLRowType.AfterConstruction;
begin
  RegisterChildNode('Cell', TXMLCellType);
  inherited;
end;

function TXMLRowType.Get_Cell: IXMLCellType;
begin
  Result := ChildNodes['Cell'] as IXMLCellType;
end;

{ TXMLCellType }

procedure TXMLCellType.AfterConstruction;
begin
  RegisterChildNode('Data', TXMLDataType);
  inherited;
end;

function TXMLCellType.Get_Formula: UnicodeString;
begin
  Result := AttributeNodes['ss:Formula'].Text;
end;

procedure TXMLCellType.Set_Formula(Value: UnicodeString);
begin
  SetAttribute('ss:Formula', Value);
end;

function TXMLCellType.Get_Data: IXMLDataType;
begin
  Result := ChildNodes['Data'] as IXMLDataType;
end;

{ TXMLDataType }

function TXMLDataType.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['ss:Type'].Text;
end;

procedure TXMLDataType.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('ss:Type', Value);
end;

function TXMLDataType.Get_Ticked: Integer;
begin
  Result := AttributeNodes['x:Ticked'].NodeValue;
end;

procedure TXMLDataType.Set_Ticked(Value: Integer);
begin
  SetAttribute('x:Ticked', Value);
end;

{ TXMLWorksheetOptionsType }

procedure TXMLWorksheetOptionsType.AfterConstruction;
begin
  RegisterChildNode('PageSetup', TXMLPageSetupType);
  RegisterChildNode('Print', TXMLPrintType);
  RegisterChildNode('Panes', TXMLPanesType);
  inherited;
end;

function TXMLWorksheetOptionsType.Get_PageSetup: IXMLPageSetupType;
begin
  Result := ChildNodes['PageSetup'] as IXMLPageSetupType;
end;

function TXMLWorksheetOptionsType.Get_Print: IXMLPrintType;
begin
  Result := ChildNodes['Print'] as IXMLPrintType;
end;

function TXMLWorksheetOptionsType.Get_Selected: UnicodeString;
begin
  Result := ChildNodes['Selected'].Text;
end;

procedure TXMLWorksheetOptionsType.Set_Selected(Value: UnicodeString);
begin
  ChildNodes['Selected'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType.Get_Panes: IXMLPanesType;
begin
  Result := ChildNodes['Panes'] as IXMLPanesType;
end;

function TXMLWorksheetOptionsType.Get_ProtectObjects: Boolean;
begin
  Result := ChildNodes['ProtectObjects'].NodeValue;
end;

procedure TXMLWorksheetOptionsType.Set_ProtectObjects(Value: Boolean);
begin
  ChildNodes['ProtectObjects'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType.Get_ProtectScenarios: Boolean;
begin
  Result := ChildNodes['ProtectScenarios'].NodeValue;
end;

procedure TXMLWorksheetOptionsType.Set_ProtectScenarios(Value: Boolean);
begin
  ChildNodes['ProtectScenarios'].NodeValue := Value;
end;

{ TXMLPageSetupType }

procedure TXMLPageSetupType.AfterConstruction;
begin
  RegisterChildNode('Header', TXMLHeaderType);
  RegisterChildNode('Footer', TXMLFooterType);
  RegisterChildNode('PageMargins', TXMLPageMarginsType);
  inherited;
end;

function TXMLPageSetupType.Get_Header: IXMLHeaderType;
begin
  Result := ChildNodes['Header'] as IXMLHeaderType;
end;

function TXMLPageSetupType.Get_Footer: IXMLFooterType;
begin
  Result := ChildNodes['Footer'] as IXMLFooterType;
end;

function TXMLPageSetupType.Get_PageMargins: IXMLPageMarginsType;
begin
  Result := ChildNodes['PageMargins'] as IXMLPageMarginsType;
end;

{ TXMLHeaderType }

function TXMLHeaderType.Get_Margin: UnicodeString;
begin
  Result := AttributeNodes['x:Margin'].Text;
end;

procedure TXMLHeaderType.Set_Margin(Value: UnicodeString);
begin
  SetAttribute('x:Margin', Value);
end;

function TXMLHeaderType.Get_Data: UnicodeString;
begin
  Result := AttributeNodes['x:Data'].Text;
end;

procedure TXMLHeaderType.Set_Data(Value: UnicodeString);
begin
  SetAttribute('x:Data', Value);
end;

{ TXMLFooterType }

function TXMLFooterType.Get_Margin: UnicodeString;
begin
  Result := AttributeNodes['x:Margin'].Text;
end;

procedure TXMLFooterType.Set_Margin(Value: UnicodeString);
begin
  SetAttribute('x:Margin', Value);
end;

function TXMLFooterType.Get_Data: UnicodeString;
begin
  Result := AttributeNodes['x:Data'].Text;
end;

procedure TXMLFooterType.Set_Data(Value: UnicodeString);
begin
  SetAttribute('x:Data', Value);
end;

{ TXMLPageMarginsType }

function TXMLPageMarginsType.Get_Bottom: UnicodeString;
begin
  Result := AttributeNodes['x:Bottom'].Text;
end;

procedure TXMLPageMarginsType.Set_Bottom(Value: UnicodeString);
begin
  SetAttribute('x:Bottom', Value);
end;

function TXMLPageMarginsType.Get_Left: UnicodeString;
begin
  Result := AttributeNodes['x:Left'].Text;
end;

procedure TXMLPageMarginsType.Set_Left(Value: UnicodeString);
begin
  SetAttribute('x:Left', Value);
end;

function TXMLPageMarginsType.Get_Right: UnicodeString;
begin
  Result := AttributeNodes['x:Right'].Text;
end;

procedure TXMLPageMarginsType.Set_Right(Value: UnicodeString);
begin
  SetAttribute('x:Right', Value);
end;

function TXMLPageMarginsType.Get_Top: UnicodeString;
begin
  Result := AttributeNodes['x:Top'].Text;
end;

procedure TXMLPageMarginsType.Set_Top(Value: UnicodeString);
begin
  SetAttribute('x:Top', Value);
end;

{ TXMLPrintType }

function TXMLPrintType.Get_ValidPrinterInfo: UnicodeString;
begin
  Result := ChildNodes['ValidPrinterInfo'].Text;
end;

procedure TXMLPrintType.Set_ValidPrinterInfo(Value: UnicodeString);
begin
  ChildNodes['ValidPrinterInfo'].NodeValue := Value;
end;

function TXMLPrintType.Get_HorizontalResolution: Integer;
begin
  Result := ChildNodes['HorizontalResolution'].NodeValue;
end;

procedure TXMLPrintType.Set_HorizontalResolution(Value: Integer);
begin
  ChildNodes['HorizontalResolution'].NodeValue := Value;
end;

function TXMLPrintType.Get_VerticalResolution: Integer;
begin
  Result := ChildNodes['VerticalResolution'].NodeValue;
end;

procedure TXMLPrintType.Set_VerticalResolution(Value: Integer);
begin
  ChildNodes['VerticalResolution'].NodeValue := Value;
end;

{ TXMLPanesType }

procedure TXMLPanesType.AfterConstruction;
begin
  RegisterChildNode('Pane', TXMLPaneType);
  inherited;
end;

function TXMLPanesType.Get_Pane: IXMLPaneType;
begin
  Result := ChildNodes['Pane'] as IXMLPaneType;
end;

{ TXMLPaneType }

function TXMLPaneType.Get_Number: Integer;
begin
  Result := ChildNodes['Number'].NodeValue;
end;

procedure TXMLPaneType.Set_Number(Value: Integer);
begin
  ChildNodes['Number'].NodeValue := Value;
end;

function TXMLPaneType.Get_ActiveCol: Integer;
begin
  Result := ChildNodes['ActiveCol'].NodeValue;
end;

procedure TXMLPaneType.Set_ActiveCol(Value: Integer);
begin
  ChildNodes['ActiveCol'].NodeValue := Value;
end;

function TXMLPaneType.Get_RangeSelection: UnicodeString;
begin
  Result := ChildNodes['RangeSelection'].Text;
end;

procedure TXMLPaneType.Set_RangeSelection(Value: UnicodeString);
begin
  ChildNodes['RangeSelection'].NodeValue := Value;
end;

end.