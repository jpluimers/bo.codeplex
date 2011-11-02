
{*************************************************************************************************************************************}
{                                                                                                                                     }
{                                                          XML Data Binding                                                           }
{                                                                                                                                     }
{         Generated on: 9/14/2011 12:45:12 AM                                                                                         }
{       Generated from: C:\Users\developer\Documents\SVN\bo.codeplex.com\Native\Delphi\Apps\XML\XokumXmlDemo\Excel-xsd\ExcelXml.xsd   }
{   Settings stored in: C:\Users\developer\Documents\SVN\bo.codeplex.com\Native\Delphi\Apps\XML\XokumXmlDemo\Excel-xsd\ExcelXml.xdb   }
{                                                                                                                                     }
{*************************************************************************************************************************************}

unit ExcelXmlUnit;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLWorkbookType = interface;
  IXMLDocumentPropertiesType = interface;
  IXMLExcelWorkbookType = interface;
  IXMLStylesType = interface;
  IXMLStyleType = interface;
  IXMLAlignmentType = interface;
  IXMLNumberFormatType = interface;
  IXMLWorksheetType = interface;
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
    ['{B81682D1-5279-4F5A-A562-9626ECCF46AD}']
    { Property Accessors }
    function Get_DocumentProperties: IXMLDocumentPropertiesType;
    function Get_ExcelWorkbook: IXMLExcelWorkbookType;
    function Get_Styles: IXMLStylesType;
    function Get_Worksheet: IXMLWorksheetType;
    { Methods & Properties }
    property DocumentProperties: IXMLDocumentPropertiesType read Get_DocumentProperties;
    property ExcelWorkbook: IXMLExcelWorkbookType read Get_ExcelWorkbook;
    property Styles: IXMLStylesType read Get_Styles;
    property Worksheet: IXMLWorksheetType read Get_Worksheet;
  end;

{ IXMLDocumentPropertiesType }

  IXMLDocumentPropertiesType = interface(IXMLNode)
    ['{04FDE370-110D-4CA3-8ADB-3723D5CBDBB3}']
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
    ['{27F08908-3586-44F1-99BB-EF7CD09F8D90}']
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

  IXMLStylesType = interface(IXMLNode)
    ['{AFE81EC9-31AD-4157-B47F-47B581FC59DF}']
    { Property Accessors }
    function Get_Style: IXMLStyleType;
    { Methods & Properties }
    property Style: IXMLStyleType read Get_Style;
  end;

{ IXMLStyleType }

  IXMLStyleType = interface(IXMLNode)
    ['{2329654A-E427-4657-89B5-3432959AB24D}']
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

{ IXMLAlignmentType }

  IXMLAlignmentType = interface(IXMLNode)
    ['{C49596AB-3F86-48B5-8FAC-C0B3294C00BE}']
    { Property Accessors }
    function Get_Vertical: UnicodeString;
    procedure Set_Vertical(Value: UnicodeString);
    { Methods & Properties }
    property Vertical: UnicodeString read Get_Vertical write Set_Vertical;
  end;

{ IXMLNumberFormatType }

  IXMLNumberFormatType = interface(IXMLNode)
    ['{1F49708B-4493-4457-8653-25521B41DDA3}']
    { Property Accessors }
    function Get_Format: UnicodeString;
    procedure Set_Format(Value: UnicodeString);
    { Methods & Properties }
    property Format: UnicodeString read Get_Format write Set_Format;
  end;

{ IXMLWorksheetType }

  IXMLWorksheetType = interface(IXMLNode)
    ['{293F1DA5-AA02-455C-B66C-B7F78425C10A}']
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

{ IXMLTableType }

  IXMLTableType = interface(IXMLNode)
    ['{25FE2F0E-4931-48A5-BE03-F3A33C1F2DDB}']
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
    ['{29E350A9-1513-48BC-B5D8-451368078A50}']
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
    ['{BC024530-82DF-4C10-A7A6-0C0A700BDC19}']
    { Property Accessors }
    function Get_Cell: IXMLCellType;
    { Methods & Properties }
    property Cell: IXMLCellType read Get_Cell;
  end;

{ IXMLCellType }

  IXMLCellType = interface(IXMLNode)
    ['{98C4D6D0-F9FC-444B-863D-482E48EA5C51}']
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
    ['{1E1D62FC-F204-4A08-8208-821D2E664F3C}']
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
    ['{B4865345-D9A7-44A6-9B05-70E5688953D5}']
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
    ['{70968473-A431-4B8F-A7FE-A2F322EA2D11}']
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
    ['{A832B2FC-523A-40DE-90D1-496D7C2EC923}']
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
    ['{32DF97B7-8DF8-4D23-8EBD-3BADCA0BFC70}']
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
    ['{44B483DB-2BC4-4A27-865B-8881713D3944}']
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
    ['{B44DD8F1-C45E-40E8-8EF8-274CD53D9E81}']
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
    ['{B9487BEC-1A74-42D7-9421-2B0CB989FA11}']
    { Property Accessors }
    function Get_Pane: IXMLPaneType;
    { Methods & Properties }
    property Pane: IXMLPaneType read Get_Pane;
  end;

{ IXMLPaneType }

  IXMLPaneType = interface(IXMLNode)
    ['{B9082493-225F-4D7D-B518-7D0BDDCA759A}']
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
  TXMLStyleType = class;
  TXMLAlignmentType = class;
  TXMLNumberFormatType = class;
  TXMLWorksheetType = class;
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
  protected
    { IXMLWorkbookType }
    function Get_DocumentProperties: IXMLDocumentPropertiesType;
    function Get_ExcelWorkbook: IXMLExcelWorkbookType;
    function Get_Styles: IXMLStylesType;
    function Get_Worksheet: IXMLWorksheetType;
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

  TXMLStylesType = class(TXMLNode, IXMLStylesType)
  protected
    { IXMLStylesType }
    function Get_Style: IXMLStyleType;
  public
    procedure AfterConstruction; override;
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

function TXMLWorkbookType.Get_Styles: IXMLStylesType;
begin
  Result := ChildNodes['Styles'] as IXMLStylesType;
end;

function TXMLWorkbookType.Get_Worksheet: IXMLWorksheetType;
begin
  Result := ChildNodes['Worksheet'] as IXMLWorksheetType;
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
  inherited;
end;

function TXMLStylesType.Get_Style: IXMLStyleType;
begin
  Result := ChildNodes['Style'] as IXMLStyleType;
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