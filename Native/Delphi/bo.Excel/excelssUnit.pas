
{****************************************************************************************************************************************************}
{                                                                                                                                                    }
{                                                                  XML Data Binding                                                                  }
{                                                                                                                                                    }
{         Generated on: 10/19/2011 9:53:11 AM                                                                                                        }
{       Generated from: C:\Microsoft Office 2003 Developer Resources\Microsoft Office 2003 XML Reference Schemas\SpreadsheetML Schemas\excelss.xsd   }
{                                                                                                                                                    }
{****************************************************************************************************************************************************}

unit excelssUnit;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLWorkbook = interface;
  IXMLSmartTagTypeElt_o = interface;
  IXMLSmartTagTypeElt_oList = interface;
  IXMLDocumentPropertiesElt_o = interface;
  IXMLCustomDocumentPropertiesElt_o = interface;
  IXMLOfficeDocumentSettingsElt_o = interface;
  IXMLLocationOfComponentsElt_o = interface;
  IXMLExcelWorkbook_x = interface;
  IXMLPublishObjectsType_x = interface;
  IXMLPublishObject_x = interface;
  IXMLPublishObject_xList = interface;
  IXMLLocation_x = interface;
  IXMLAutoRepublish_x = interface;
  IXMLSupBookType_x = interface;
  IXMLSupBookType_xList = interface;
  IXMLExternNameType_x = interface;
  IXMLExternNameType_xList = interface;
  IXMLXctType_x = interface;
  IXMLXctType_xList = interface;
  IXMLCrnType_x = interface;
  IXMLCrnType_xList = interface;
  IXMLRowType_x = interface;
  IXMLMoperType_x = interface;
  IXMLMoperType_xList = interface;
  IXMLWorkbook_Styles = interface;
  IXMLStyleType = interface;
  IXMLAlignmentType = interface;
  IXMLBordersType = interface;
  IXMLBorderType = interface;
  IXMLFontType = interface;
  IXMLInteriorType = interface;
  IXMLNumberFormatType = interface;
  IXMLProtectionType = interface;
  IXMLNamesType = interface;
  IXMLNamesType_NamedRange = interface;
  IXMLWorksheetType = interface;
  IXMLWorksheetTypeList = interface;
  IXMLTableType = interface;
  IXMLTableType_Column = interface;
  IXMLTableType_ColumnList = interface;
  IXMLTableType_Row = interface;
  IXMLTableType_RowList = interface;
  IXMLCell = interface;
  IXMLSmartTagsElt_o = interface;
  IXMLSmartTagsElt_oList = interface;
  IXMLData = interface;
  IXMLCommentType = interface;
  IXMLCommentType_Data = interface;
  IXMLPhonetictext_x = interface;
  IXMLNamedCell = interface;
  IXMLNamedCellList = interface;
  IXMLWorksheetOptionsType_x = interface;
  IXMLPageSetupType_x = interface;
  IXMLLayout_x = interface;
  IXMLHeader_x = interface;
  IXMLFooter_x = interface;
  IXMLPageMargins_x = interface;
  IXMLPrintType_x = interface;
  IXMLPanesType_x = interface;
  IXMLPaneType_x = interface;
  IXMLSelectionType_x = interface;
  IXMLPTRuleType_x = interface;
  IXMLPTRuleType_xList = interface;
  IXMLWatches_x = interface;
  IXMLWatch_x = interface;
  IXMLDataTable_x = interface;
  IXMLPageBreaksType_x = interface;
  IXMLColBreaks_x = interface;
  IXMLColBreak_x = interface;
  IXMLRowBreaks_x = interface;
  IXMLRowBreak_x = interface;
  IXMLPivotTableType_x = interface;
  IXMLPivotTableType_xList = interface;
  IXMLQTSourceType_x = interface;
  IXMLCacheFile_x = interface;
  IXMLQTQuerySourceType_x = interface;
  IXMLEditWebPage_x = interface;
  IXMLURLString_x = interface;
  IXMLRefreshInfoType_x = interface;
  IXMLColumnInfoType_x = interface;
  IXMLColumnInfoType_xList = interface;
  IXMLName_x = interface;
  IXMLTextWizardSettingsType_x = interface;
  IXMLFormatSettingsType_x = interface;
  IXMLDelimiters_x = interface;
  IXMLHTMLTablesType_x = interface;
  IXMLParameterTypeE_x = interface;
  IXMLParameterTypeE_xList = interface;
  IXMLPivotViewType_x = interface;
  IXMLTotalFormat_x = interface;
  IXMLMemberFormat_x = interface;
  IXMLFieldLabelFormat_x = interface;
  IXMLLabel__x = interface;
  IXMLLabel__xList = interface;
  IXMLPLPivotFieldType_x = interface;
  IXMLPLPivotFieldType_xList = interface;
  IXMLDetailFormat_x = interface;
  IXMLSubtotalFormat_x = interface;
  IXMLPivotItemType_x = interface;
  IXMLPivotItemType_xList = interface;
  IXMLPLTotalType_x = interface;
  IXMLPLTotalType_xList = interface;
  IXMLAlignmentType_x = interface;
  IXMLPivotAxisType_x = interface;
  IXMLPivotAxisType_xList = interface;
  IXMLPivotFieldType_x = interface;
  IXMLPivotFieldType_xList = interface;
  IXMLMapChildItemsType_x = interface;
  IXMLMemberPropertyType_x = interface;
  IXMLMemberPropertyType_xList = interface;
  IXMLFilterMember_x = interface;
  IXMLFilterMember_xList = interface;
  IXMLDetailFormatType_x = interface;
  IXMLSubtotalFormatType_x = interface;
  IXMLCubeFieldType_x = interface;
  IXMLCubeFieldType_xList = interface;
  IXMLGroupLevel_x = interface;
  IXMLGroupLevel_xList = interface;
  IXMLGroupDefinitionType_x = interface;
  IXMLGroupDefinitionType_xList = interface;
  IXMLGroupMemberType_x = interface;
  IXMLGroupMemberType_xList = interface;
  IXMLCalculatedMember_x = interface;
  IXMLPTLineItemsType_x = interface;
  IXMLPTLineItemsType_xList = interface;
  IXMLPTLineItemType_x = interface;
  IXMLPTLineItemType_xList = interface;
  IXMLPTSourceType_x = interface;
  IXMLConsolidationReferenceType_x = interface;
  IXMLPTQuerySourceType_x = interface;
  IXMLSourceConsolidationType_x = interface;
  IXMLReference_x = interface;
  IXMLReference_xList = interface;
  IXMLPTFormulaType_x = interface;
  IXMLPTFormulaType_xList = interface;
  IXMLPTFormatType_x = interface;
  IXMLPTFormatType_xList = interface;
  IXMLDataValidationType_x = interface;
  IXMLDataValidationType_xList = interface;
  IXMLAutoFilter_x = interface;
  IXMLAutoFilterColumnType_x = interface;
  IXMLAutoFilterConditionType_x = interface;
  IXMLAutoFilterOr_x = interface;
  IXMLAutoFilterAnd_x = interface;
  IXMLConditionalFormattingType_x = interface;
  IXMLConditionalFormattingType_xList = interface;
  IXMLCondition_x = interface;
  IXMLCondition_xList = interface;
  IXMLFormat_x = interface;
  IXMLSortingType_x = interface;
  IXMLWorksheetoptions_c = interface;
  IXMLQueryTableType_x = interface;
  IXMLQueryTableType_xList = interface;
  IXMLPivotCache_x = interface;
  IXMLPivotCache_xList = interface;
  IXMLSchema_ = interface;
  IXMLElementType_ = interface;
  IXMLAttribute_ = interface;
  IXMLAttribute_List = interface;
  IXMLExtends_ = interface;
  IXMLExtends_List = interface;
  IXMLAttributeType_ = interface;
  IXMLAttributeType_List = interface;
  IXMLDatatype_ = interface;
  IXMLData_ = interface;
  IXMLRow_ = interface;
  IXMLMapInfoType_x2 = interface;
  IXMLMapInfoType_x2List = interface;
  IXMLSchemaType_x2 = interface;
  IXMLSchemaType_x2List = interface;
  IXMLMapType_x2 = interface;
  IXMLMapType_x2List = interface;
  IXMLEntryType_x2 = interface;
  IXMLEntryType_x2List = interface;
  IXMLFieldType_x2 = interface;
  IXMLFieldType_x2List = interface;
  IXMLCell_ = interface;
  IXMLCommentType_ = interface;
  IXMLNamedCell_ = interface;
  IXMLNamedCell_List = interface;
  IXMLActiveRowsType_x2 = interface;
  IXMLMapdata_x2 = interface;
  IXMLBindingType_x2 = interface;
  IXMLBindingType_x2List = interface;
  IXMLDataSource_ = interface;
  IXMLType__ = interface;
  IXMLSubType_ = interface;
  IXMLConnectionInfoType_ = interface;
  IXMLLocation_ = interface;
  IXMLAuthentication_ = interface;
  IXMLBasic_ = interface;
  IXMLUseExplicit_ = interface;
  IXMLUserId_ = interface;
  IXMLPassword_ = interface;
  IXMLHeader_ = interface;
  IXMLBody_ = interface;
  IXMLClientParameterBindings_ = interface;
  IXMLClientParameterBinding_ = interface;
  IXMLCredentialBinding_ = interface;
  IXMLCredential_ = interface;
  IXMLClientParameterValue_ = interface;
  IXMLIf__ = interface;
  IXMLCredentialValue_ = interface;
  IXMLComponentOptionsType_c = interface;
  IXMLToolbar_c = interface;
  IXMLLabel__c = interface;
  IXMLIntegerList = interface;
  IXMLSubtotalTypeList = interface;
  IXMLDoubleList = interface;
  IXMLString_List = interface;

{ IXMLWorkbook }

  IXMLWorkbook = interface(IXMLNode)
    ['{6ECFCDA0-2015-4892-8562-1B362E13C335}']
    { Property Accessors }
    function Get_SmartTagType: IXMLSmartTagTypeElt_oList;
    function Get_DocumentProperties: IXMLDocumentPropertiesElt_o;
    function Get_CustomDocumentProperties: IXMLCustomDocumentPropertiesElt_o;
    function Get_OfficeDocumentSettings: IXMLOfficeDocumentSettingsElt_o;
    function Get_ExcelWorkbook: IXMLExcelWorkbook_x;
    function Get_Styles: IXMLWorkbook_Styles;
    function Get_Names: IXMLNamesType;
    function Get_Worksheet: IXMLWorksheetTypeList;
    function Get_PivotCache: IXMLPivotCache_xList;
    function Get_Name: UnicodeString;
    function Get_MapInfo: IXMLMapInfoType_x2List;
    function Get_Binding: IXMLBindingType_x2List;
    function Get_ComponentOptions: IXMLComponentOptionsType_c;
    procedure Set_Name(Value: UnicodeString);
    { Methods & Properties }
    property SmartTagType: IXMLSmartTagTypeElt_oList read Get_SmartTagType;
    property DocumentProperties: IXMLDocumentPropertiesElt_o read Get_DocumentProperties;
    property CustomDocumentProperties: IXMLCustomDocumentPropertiesElt_o read Get_CustomDocumentProperties;
    property OfficeDocumentSettings: IXMLOfficeDocumentSettingsElt_o read Get_OfficeDocumentSettings;
    property ExcelWorkbook: IXMLExcelWorkbook_x read Get_ExcelWorkbook;
    property Styles: IXMLWorkbook_Styles read Get_Styles;
    property Names: IXMLNamesType read Get_Names;
    property Worksheet: IXMLWorksheetTypeList read Get_Worksheet;
    property PivotCache: IXMLPivotCache_xList read Get_PivotCache;
    property Name: UnicodeString read Get_Name write Set_Name;
    property MapInfo: IXMLMapInfoType_x2List read Get_MapInfo;
    property Binding: IXMLBindingType_x2List read Get_Binding;
    property ComponentOptions: IXMLComponentOptionsType_c read Get_ComponentOptions;
  end;

{ IXMLSmartTagTypeElt_o }

  IXMLSmartTagTypeElt_o = interface(IXMLNode)
    ['{55CA197C-D132-470E-8088-C67373B40748}']
    { Property Accessors }
    function Get_Namespaceuri: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Url: UnicodeString;
    function Get_Namespaceuri: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Url: UnicodeString;
    procedure Set_Namespaceuri(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Url(Value: UnicodeString);
    procedure Set_Namespaceuri(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Url(Value: UnicodeString);
    { Methods & Properties }
    property Namespaceuri: UnicodeString read Get_Namespaceuri write Set_Namespaceuri;
    property Name: UnicodeString read Get_Name write Set_Name;
    property Url: UnicodeString read Get_Url write Set_Url;
    property Namespaceuri: UnicodeString read Get_Namespaceuri write Set_Namespaceuri;
    property Name: UnicodeString read Get_Name write Set_Name;
    property Url: UnicodeString read Get_Url write Set_Url;
  end;

{ IXMLSmartTagTypeElt_oList }

  IXMLSmartTagTypeElt_oList = interface(IXMLNodeCollection)
    ['{FBCC22CB-A77D-430C-9773-24AC0CAF20D4}']
    { Methods & Properties }
    function Add: IXMLSmartTagTypeElt_o;
    function Insert(const Index: Integer): IXMLSmartTagTypeElt_o;

    function Get_Item(Index: Integer): IXMLSmartTagTypeElt_o;
    property Items[Index: Integer]: IXMLSmartTagTypeElt_o read Get_Item; default;
  end;

{ IXMLDocumentPropertiesElt_o }

  IXMLDocumentPropertiesElt_o = interface(IXMLNode)
    ['{7B606CF3-C745-423B-B4EE-6FFC571E0568}']
    { Property Accessors }
    function Get_Title: UnicodeString;
    function Get_Subject: UnicodeString;
    function Get_Author: UnicodeString;
    function Get_Keywords: UnicodeString;
    function Get_Description: UnicodeString;
    function Get_LastAuthor: UnicodeString;
    function Get_Revision: LongWord;
    function Get_AppName: UnicodeString;
    function Get_TotalTime: LongWord;
    function Get_LastPrinted: UnicodeString;
    function Get_Created: UnicodeString;
    function Get_LastSaved: UnicodeString;
    function Get_Pages: LongWord;
    function Get_Words: LongWord;
    function Get_Characters: LongWord;
    function Get_Category: UnicodeString;
    function Get_PresentationFormat: UnicodeString;
    function Get_Manager: UnicodeString;
    function Get_Company: UnicodeString;
    function Get_Guid: UnicodeString;
    function Get_HyperlinkBase: UnicodeString;
    function Get_Bytes: LongWord;
    function Get_Lines: LongWord;
    function Get_Paragraphs: LongWord;
    function Get_CharactersWithSpaces: LongWord;
    function Get_Version: UnicodeString;
    procedure Set_Title(Value: UnicodeString);
    procedure Set_Subject(Value: UnicodeString);
    procedure Set_Author(Value: UnicodeString);
    procedure Set_Keywords(Value: UnicodeString);
    procedure Set_Description(Value: UnicodeString);
    procedure Set_LastAuthor(Value: UnicodeString);
    procedure Set_Revision(Value: LongWord);
    procedure Set_AppName(Value: UnicodeString);
    procedure Set_TotalTime(Value: LongWord);
    procedure Set_LastPrinted(Value: UnicodeString);
    procedure Set_Created(Value: UnicodeString);
    procedure Set_LastSaved(Value: UnicodeString);
    procedure Set_Pages(Value: LongWord);
    procedure Set_Words(Value: LongWord);
    procedure Set_Characters(Value: LongWord);
    procedure Set_Category(Value: UnicodeString);
    procedure Set_PresentationFormat(Value: UnicodeString);
    procedure Set_Manager(Value: UnicodeString);
    procedure Set_Company(Value: UnicodeString);
    procedure Set_Guid(Value: UnicodeString);
    procedure Set_HyperlinkBase(Value: UnicodeString);
    procedure Set_Bytes(Value: LongWord);
    procedure Set_Lines(Value: LongWord);
    procedure Set_Paragraphs(Value: LongWord);
    procedure Set_CharactersWithSpaces(Value: LongWord);
    procedure Set_Version(Value: UnicodeString);
    { Methods & Properties }
    property Title: UnicodeString read Get_Title write Set_Title;
    property Subject: UnicodeString read Get_Subject write Set_Subject;
    property Author: UnicodeString read Get_Author write Set_Author;
    property Keywords: UnicodeString read Get_Keywords write Set_Keywords;
    property Description: UnicodeString read Get_Description write Set_Description;
    property LastAuthor: UnicodeString read Get_LastAuthor write Set_LastAuthor;
    property Revision: LongWord read Get_Revision write Set_Revision;
    property AppName: UnicodeString read Get_AppName write Set_AppName;
    property TotalTime: LongWord read Get_TotalTime write Set_TotalTime;
    property LastPrinted: UnicodeString read Get_LastPrinted write Set_LastPrinted;
    property Created: UnicodeString read Get_Created write Set_Created;
    property LastSaved: UnicodeString read Get_LastSaved write Set_LastSaved;
    property Pages: LongWord read Get_Pages write Set_Pages;
    property Words: LongWord read Get_Words write Set_Words;
    property Characters: LongWord read Get_Characters write Set_Characters;
    property Category: UnicodeString read Get_Category write Set_Category;
    property PresentationFormat: UnicodeString read Get_PresentationFormat write Set_PresentationFormat;
    property Manager: UnicodeString read Get_Manager write Set_Manager;
    property Company: UnicodeString read Get_Company write Set_Company;
    property Guid: UnicodeString read Get_Guid write Set_Guid;
    property HyperlinkBase: UnicodeString read Get_HyperlinkBase write Set_HyperlinkBase;
    property Bytes: LongWord read Get_Bytes write Set_Bytes;
    property Lines: LongWord read Get_Lines write Set_Lines;
    property Paragraphs: LongWord read Get_Paragraphs write Set_Paragraphs;
    property CharactersWithSpaces: LongWord read Get_CharactersWithSpaces write Set_CharactersWithSpaces;
    property Version: UnicodeString read Get_Version write Set_Version;
  end;

{ IXMLCustomDocumentPropertiesElt_o }

  IXMLCustomDocumentPropertiesElt_o = interface(IXMLNode)
    ['{7B8EB657-E976-46A4-B332-6246B3662E5D}']
  end;

{ IXMLOfficeDocumentSettingsElt_o }

  IXMLOfficeDocumentSettingsElt_o = interface(IXMLNode)
    ['{5D865D2A-81D5-48A1-814D-A60D5A1EF1BE}']
    { Property Accessors }
    function Get_DownloadComponents: UnicodeString;
    function Get_LocationOfComponents: IXMLLocationOfComponentsElt_o;
    procedure Set_DownloadComponents(Value: UnicodeString);
    { Methods & Properties }
    property DownloadComponents: UnicodeString read Get_DownloadComponents write Set_DownloadComponents;
    property LocationOfComponents: IXMLLocationOfComponentsElt_o read Get_LocationOfComponents;
  end;

{ IXMLLocationOfComponentsElt_o }

  IXMLLocationOfComponentsElt_o = interface(IXMLNode)
    ['{2A58DC40-C01E-4617-A562-E70911EBB65A}']
    { Property Accessors }
    function Get_HRef: UnicodeString;
    procedure Set_HRef(Value: UnicodeString);
    { Methods & Properties }
    property HRef: UnicodeString read Get_HRef write Set_HRef;
  end;

{ IXMLExcelWorkbook_x }

  IXMLExcelWorkbook_x = interface(IXMLNode)
    ['{F1990AD6-EAE6-4CA3-BC25-77C74A8734D3}']
    { Property Accessors }
    function Get_PublishObjects: IXMLPublishObjectsType_x;
    function Get_SupBook: IXMLSupBookType_xList;
    function Get_SelectedSheets: Integer;
    function Get_WindowHidden: UnicodeString;
    function Get_HideHorizontalScrollBar: UnicodeString;
    function Get_HideVerticalScrollBar: UnicodeString;
    function Get_HideWorkbookTabs: UnicodeString;
    function Get_WindowHeight: Int64;
    function Get_WindowWidth: Int64;
    function Get_WindowTopX: Int64;
    function Get_WindowTopY: Int64;
    function Get_ActiveSheet: Integer;
    function Get_ActiveChart: UnicodeString;
    function Get_FirstVisibleSheet: Integer;
    function Get_HidePivotTableFieldList: UnicodeString;
    function Get_ProtectStructure: UnicodeString;
    function Get_ProtectWindows: UnicodeString;
    function Get_DisplayInkNotes: UnicodeString;
    function Get_EmbedSaveSmartTags: UnicodeString;
    function Get_FutureVer: UnicodeString;
    function Get_TabRatio: Integer;
    function Get_WindowIconic: UnicodeString;
    function Get_DisplayDrawingObjects: UnicodeString;
    function Get_CreateBackup: UnicodeString;
    function Get_Calculation: UnicodeString;
    function Get_DoNotCalculateBeforeSave: UnicodeString;
    function Get_Date1904: UnicodeString;
    function Get_RefModeR1C1: UnicodeString;
    function Get_Iteration: UnicodeString;
    function Get_MaxIterations: UnicodeString;
    function Get_MaxChange: Double;
    function Get_PrecisionAsDisplayed: UnicodeString;
    function Get_DoNotSaveLinkValues: UnicodeString;
    function Get_NoAutoRecover: UnicodeString;
    function Get_AcceptLabelsInFormulas: UnicodeString;
    function Get_Uncalced: UnicodeString;
    procedure Set_SelectedSheets(Value: Integer);
    procedure Set_WindowHidden(Value: UnicodeString);
    procedure Set_HideHorizontalScrollBar(Value: UnicodeString);
    procedure Set_HideVerticalScrollBar(Value: UnicodeString);
    procedure Set_HideWorkbookTabs(Value: UnicodeString);
    procedure Set_WindowHeight(Value: Int64);
    procedure Set_WindowWidth(Value: Int64);
    procedure Set_WindowTopX(Value: Int64);
    procedure Set_WindowTopY(Value: Int64);
    procedure Set_ActiveSheet(Value: Integer);
    procedure Set_ActiveChart(Value: UnicodeString);
    procedure Set_FirstVisibleSheet(Value: Integer);
    procedure Set_HidePivotTableFieldList(Value: UnicodeString);
    procedure Set_ProtectStructure(Value: UnicodeString);
    procedure Set_ProtectWindows(Value: UnicodeString);
    procedure Set_DisplayInkNotes(Value: UnicodeString);
    procedure Set_EmbedSaveSmartTags(Value: UnicodeString);
    procedure Set_FutureVer(Value: UnicodeString);
    procedure Set_TabRatio(Value: Integer);
    procedure Set_WindowIconic(Value: UnicodeString);
    procedure Set_DisplayDrawingObjects(Value: UnicodeString);
    procedure Set_CreateBackup(Value: UnicodeString);
    procedure Set_Calculation(Value: UnicodeString);
    procedure Set_DoNotCalculateBeforeSave(Value: UnicodeString);
    procedure Set_Date1904(Value: UnicodeString);
    procedure Set_RefModeR1C1(Value: UnicodeString);
    procedure Set_Iteration(Value: UnicodeString);
    procedure Set_MaxIterations(Value: UnicodeString);
    procedure Set_MaxChange(Value: Double);
    procedure Set_PrecisionAsDisplayed(Value: UnicodeString);
    procedure Set_DoNotSaveLinkValues(Value: UnicodeString);
    procedure Set_NoAutoRecover(Value: UnicodeString);
    procedure Set_AcceptLabelsInFormulas(Value: UnicodeString);
    procedure Set_Uncalced(Value: UnicodeString);
    { Methods & Properties }
    property PublishObjects: IXMLPublishObjectsType_x read Get_PublishObjects;
    property SupBook: IXMLSupBookType_xList read Get_SupBook;
    property SelectedSheets: Integer read Get_SelectedSheets write Set_SelectedSheets;
    property WindowHidden: UnicodeString read Get_WindowHidden write Set_WindowHidden;
    property HideHorizontalScrollBar: UnicodeString read Get_HideHorizontalScrollBar write Set_HideHorizontalScrollBar;
    property HideVerticalScrollBar: UnicodeString read Get_HideVerticalScrollBar write Set_HideVerticalScrollBar;
    property HideWorkbookTabs: UnicodeString read Get_HideWorkbookTabs write Set_HideWorkbookTabs;
    property WindowHeight: Int64 read Get_WindowHeight write Set_WindowHeight;
    property WindowWidth: Int64 read Get_WindowWidth write Set_WindowWidth;
    property WindowTopX: Int64 read Get_WindowTopX write Set_WindowTopX;
    property WindowTopY: Int64 read Get_WindowTopY write Set_WindowTopY;
    property ActiveSheet: Integer read Get_ActiveSheet write Set_ActiveSheet;
    property ActiveChart: UnicodeString read Get_ActiveChart write Set_ActiveChart;
    property FirstVisibleSheet: Integer read Get_FirstVisibleSheet write Set_FirstVisibleSheet;
    property HidePivotTableFieldList: UnicodeString read Get_HidePivotTableFieldList write Set_HidePivotTableFieldList;
    property ProtectStructure: UnicodeString read Get_ProtectStructure write Set_ProtectStructure;
    property ProtectWindows: UnicodeString read Get_ProtectWindows write Set_ProtectWindows;
    property DisplayInkNotes: UnicodeString read Get_DisplayInkNotes write Set_DisplayInkNotes;
    property EmbedSaveSmartTags: UnicodeString read Get_EmbedSaveSmartTags write Set_EmbedSaveSmartTags;
    property FutureVer: UnicodeString read Get_FutureVer write Set_FutureVer;
    property TabRatio: Integer read Get_TabRatio write Set_TabRatio;
    property WindowIconic: UnicodeString read Get_WindowIconic write Set_WindowIconic;
    property DisplayDrawingObjects: UnicodeString read Get_DisplayDrawingObjects write Set_DisplayDrawingObjects;
    property CreateBackup: UnicodeString read Get_CreateBackup write Set_CreateBackup;
    property Calculation: UnicodeString read Get_Calculation write Set_Calculation;
    property DoNotCalculateBeforeSave: UnicodeString read Get_DoNotCalculateBeforeSave write Set_DoNotCalculateBeforeSave;
    property Date1904: UnicodeString read Get_Date1904 write Set_Date1904;
    property RefModeR1C1: UnicodeString read Get_RefModeR1C1 write Set_RefModeR1C1;
    property Iteration: UnicodeString read Get_Iteration write Set_Iteration;
    property MaxIterations: UnicodeString read Get_MaxIterations write Set_MaxIterations;
    property MaxChange: Double read Get_MaxChange write Set_MaxChange;
    property PrecisionAsDisplayed: UnicodeString read Get_PrecisionAsDisplayed write Set_PrecisionAsDisplayed;
    property DoNotSaveLinkValues: UnicodeString read Get_DoNotSaveLinkValues write Set_DoNotSaveLinkValues;
    property NoAutoRecover: UnicodeString read Get_NoAutoRecover write Set_NoAutoRecover;
    property AcceptLabelsInFormulas: UnicodeString read Get_AcceptLabelsInFormulas write Set_AcceptLabelsInFormulas;
    property Uncalced: UnicodeString read Get_Uncalced write Set_Uncalced;
  end;

{ IXMLPublishObjectsType_x }

  IXMLPublishObjectsType_x = interface(IXMLNode)
    ['{8F861445-E533-499A-829E-D750AA9C610A}']
    { Property Accessors }
    function Get_PublishObject: IXMLPublishObject_xList;
    function Get_AutoRepublish: IXMLAutoRepublish_x;
    { Methods & Properties }
    property PublishObject: IXMLPublishObject_xList read Get_PublishObject;
    property AutoRepublish: IXMLAutoRepublish_x read Get_AutoRepublish;
  end;

{ IXMLPublishObject_x }

  IXMLPublishObject_x = interface(IXMLNode)
    ['{6FC1B308-90B8-40BC-8D61-7B502034E62B}']
    { Property Accessors }
    function Get_Id: Int64;
    function Get_DivID: UnicodeString;
    function Get_SourceType: UnicodeString;
    function Get_Source: UnicodeString;
    function Get_HtmlType: UnicodeString;
    function Get_Location: IXMLLocation_x;
    procedure Set_Id(Value: Int64);
    procedure Set_DivID(Value: UnicodeString);
    procedure Set_SourceType(Value: UnicodeString);
    procedure Set_Source(Value: UnicodeString);
    procedure Set_HtmlType(Value: UnicodeString);
    { Methods & Properties }
    property Id: Int64 read Get_Id write Set_Id;
    property DivID: UnicodeString read Get_DivID write Set_DivID;
    property SourceType: UnicodeString read Get_SourceType write Set_SourceType;
    property Source: UnicodeString read Get_Source write Set_Source;
    property HtmlType: UnicodeString read Get_HtmlType write Set_HtmlType;
    property Location: IXMLLocation_x read Get_Location;
  end;

{ IXMLPublishObject_xList }

  IXMLPublishObject_xList = interface(IXMLNodeCollection)
    ['{D327CB7B-D575-4CDE-8F10-D393B7E95D19}']
    { Methods & Properties }
    function Add: IXMLPublishObject_x;
    function Insert(const Index: Integer): IXMLPublishObject_x;

    function Get_Item(Index: Integer): IXMLPublishObject_x;
    property Items[Index: Integer]: IXMLPublishObject_x read Get_Item; default;
  end;

{ IXMLLocation_x }

  IXMLLocation_x = interface(IXMLNode)
    ['{5CC5E059-007C-41FE-936F-1AF1DC68029B}']
    { Property Accessors }
    function Get_HRef: UnicodeString;
    procedure Set_HRef(Value: UnicodeString);
    { Methods & Properties }
    property HRef: UnicodeString read Get_HRef write Set_HRef;
  end;

{ IXMLAutoRepublish_x }

  IXMLAutoRepublish_x = interface(IXMLNodeCollection)
    ['{29E07C9D-1D67-4135-BD3E-6E795F904199}']
    { Property Accessors }
    function Get_DivID(Index: Integer): UnicodeString;
    { Methods & Properties }
    function Add(const DivID: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const DivID: UnicodeString): IXMLNode;
    property DivID[Index: Integer]: UnicodeString read Get_DivID; default;
  end;

{ IXMLSupBookType_x }

  IXMLSupBookType_x = interface(IXMLNode)
    ['{E649DDD2-A109-41ED-B4A6-81C9C5D61EB3}']
    { Property Accessors }
    function Get_Path: UnicodeString;
    function Get_SheetName: IXMLString_List;
    function Get_ExternName: IXMLExternNameType_xList;
    function Get_Xct: IXMLXctType_xList;
    procedure Set_Path(Value: UnicodeString);
    { Methods & Properties }
    property Path: UnicodeString read Get_Path write Set_Path;
    property SheetName: IXMLString_List read Get_SheetName;
    property ExternName: IXMLExternNameType_xList read Get_ExternName;
    property Xct: IXMLXctType_xList read Get_Xct;
  end;

{ IXMLSupBookType_xList }

  IXMLSupBookType_xList = interface(IXMLNodeCollection)
    ['{434889CF-3C79-4A9B-B6FD-9236A48F2E32}']
    { Methods & Properties }
    function Add: IXMLSupBookType_x;
    function Insert(const Index: Integer): IXMLSupBookType_x;

    function Get_Item(Index: Integer): IXMLSupBookType_x;
    property Items[Index: Integer]: IXMLSupBookType_x read Get_Item; default;
  end;

{ IXMLExternNameType_x }

  IXMLExternNameType_x = interface(IXMLNode)
    ['{A20632F2-8B5F-4EB6-BA27-56FDD5A29344}']
    { Property Accessors }
    function Get_Name: UnicodeString;
    function Get_Formula: UnicodeString;
    function Get_OleLink: UnicodeString;
    function Get_WantAdvise: UnicodeString;
    function Get_WantPict: UnicodeString;
    function Get_Cf: Integer;
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Formula(Value: UnicodeString);
    procedure Set_OleLink(Value: UnicodeString);
    procedure Set_WantAdvise(Value: UnicodeString);
    procedure Set_WantPict(Value: UnicodeString);
    procedure Set_Cf(Value: Integer);
    { Methods & Properties }
    property Name: UnicodeString read Get_Name write Set_Name;
    property Formula: UnicodeString read Get_Formula write Set_Formula;
    property OleLink: UnicodeString read Get_OleLink write Set_OleLink;
    property WantAdvise: UnicodeString read Get_WantAdvise write Set_WantAdvise;
    property WantPict: UnicodeString read Get_WantPict write Set_WantPict;
    property Cf: Integer read Get_Cf write Set_Cf;
  end;

{ IXMLExternNameType_xList }

  IXMLExternNameType_xList = interface(IXMLNodeCollection)
    ['{9384F06A-688E-45F9-B07A-4B2AF16F2B34}']
    { Methods & Properties }
    function Add: IXMLExternNameType_x;
    function Insert(const Index: Integer): IXMLExternNameType_x;

    function Get_Item(Index: Integer): IXMLExternNameType_x;
    property Items[Index: Integer]: IXMLExternNameType_x read Get_Item; default;
  end;

{ IXMLXctType_x }

  IXMLXctType_x = interface(IXMLNode)
    ['{BE90437E-09BC-435D-B6CA-BDEBE28F0317}']
    { Property Accessors }
    function Get_Count: Integer;
    function Get_SheetIndex: Integer;
    function Get_Crn: IXMLCrnType_xList;
    function Get_Moper: IXMLMoperType_xList;
    procedure Set_Count(Value: Integer);
    procedure Set_SheetIndex(Value: Integer);
    { Methods & Properties }
    property Count: Integer read Get_Count write Set_Count;
    property SheetIndex: Integer read Get_SheetIndex write Set_SheetIndex;
    property Crn: IXMLCrnType_xList read Get_Crn;
    property Moper: IXMLMoperType_xList read Get_Moper;
  end;

{ IXMLXctType_xList }

  IXMLXctType_xList = interface(IXMLNodeCollection)
    ['{69189021-7E70-4206-82A1-118977B6205E}']
    { Methods & Properties }
    function Add: IXMLXctType_x;
    function Insert(const Index: Integer): IXMLXctType_x;

    function Get_Item(Index: Integer): IXMLXctType_x;
    property Items[Index: Integer]: IXMLXctType_x read Get_Item; default;
  end;

{ IXMLCrnType_x }

  IXMLCrnType_x = interface(IXMLNode)
    ['{AD13BB74-E36B-448B-8D86-CF61B28DEDBC}']
    { Property Accessors }
    function Get_Row: IXMLRowType_x;
    function Get_ColFirst: Integer;
    function Get_ColLast: Integer;
    function Get_Number: IXMLDoubleList;
    function Get_Text: UnicodeString;
    function Get_Boolean: UnicodeString;
    function Get_Error: UnicodeString;
    procedure Set_ColFirst(Value: Integer);
    procedure Set_ColLast(Value: Integer);
    procedure Set_Text(Value: UnicodeString);
    procedure Set_Boolean(Value: UnicodeString);
    procedure Set_Error(Value: UnicodeString);
    { Methods & Properties }
    property Row: IXMLRowType_x read Get_Row;
    property ColFirst: Integer read Get_ColFirst write Set_ColFirst;
    property ColLast: Integer read Get_ColLast write Set_ColLast;
    property Number: IXMLDoubleList read Get_Number;
    property Text: UnicodeString read Get_Text write Set_Text;
    property Boolean: UnicodeString read Get_Boolean write Set_Boolean;
    property Error: UnicodeString read Get_Error write Set_Error;
  end;

{ IXMLCrnType_xList }

  IXMLCrnType_xList = interface(IXMLNodeCollection)
    ['{E067FD6E-907D-4D50-82D1-DFD41EE1D73D}']
    { Methods & Properties }
    function Add: IXMLCrnType_x;
    function Insert(const Index: Integer): IXMLCrnType_x;

    function Get_Item(Index: Integer): IXMLCrnType_x;
    property Items[Index: Integer]: IXMLCrnType_x read Get_Item; default;
  end;

{ IXMLRowType_x }

  IXMLRowType_x = interface(IXMLNode)
    ['{177DEA58-944E-47F2-B34D-3A4EACC927AE}']
    { Property Accessors }
    function Get_ColumnName: UnicodeString;
    procedure Set_ColumnName(Value: UnicodeString);
    { Methods & Properties }
    property ColumnName: UnicodeString read Get_ColumnName write Set_ColumnName;
  end;

{ IXMLMoperType_x }

  IXMLMoperType_x = interface(IXMLNode)
    ['{8727F1EB-BDD0-4DA7-8657-468BF1E44E23}']
    { Property Accessors }
    function Get_RowLast: Integer;
    function Get_ColLast: Integer;
    function Get_Number: Integer;
    function Get_Text: UnicodeString;
    function Get_Boolean: UnicodeString;
    function Get_Error: UnicodeString;
    procedure Set_RowLast(Value: Integer);
    procedure Set_ColLast(Value: Integer);
    procedure Set_Number(Value: Integer);
    procedure Set_Text(Value: UnicodeString);
    procedure Set_Boolean(Value: UnicodeString);
    procedure Set_Error(Value: UnicodeString);
    { Methods & Properties }
    property RowLast: Integer read Get_RowLast write Set_RowLast;
    property ColLast: Integer read Get_ColLast write Set_ColLast;
    property Number: Integer read Get_Number write Set_Number;
    property Text: UnicodeString read Get_Text write Set_Text;
    property Boolean: UnicodeString read Get_Boolean write Set_Boolean;
    property Error: UnicodeString read Get_Error write Set_Error;
  end;

{ IXMLMoperType_xList }

  IXMLMoperType_xList = interface(IXMLNodeCollection)
    ['{6AAF6FA0-41BC-432C-9F49-45CBB1FBFC1E}']
    { Methods & Properties }
    function Add: IXMLMoperType_x;
    function Insert(const Index: Integer): IXMLMoperType_x;

    function Get_Item(Index: Integer): IXMLMoperType_x;
    property Items[Index: Integer]: IXMLMoperType_x read Get_Item; default;
  end;

{ IXMLWorkbook_Styles }

  IXMLWorkbook_Styles = interface(IXMLNodeCollection)
    ['{23E1E41A-47B9-4969-B041-AEC4A3374720}']
    { Property Accessors }
    function Get_Style(Index: Integer): IXMLStyleType;
    { Methods & Properties }
    function Add: IXMLStyleType;
    function Insert(const Index: Integer): IXMLStyleType;
    property Style[Index: Integer]: IXMLStyleType read Get_Style; default;
  end;

{ IXMLStyleType }

  IXMLStyleType = interface(IXMLNode)
    ['{3B935887-EC39-4BE0-9E01-12A71C6B9FFA}']
    { Property Accessors }
    function Get_ID: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Parent: UnicodeString;
    function Get_Alignment: IXMLAlignmentType;
    function Get_Borders: IXMLBordersType;
    function Get_Font: IXMLFontType;
    function Get_Interior: IXMLInteriorType;
    function Get_NumberFormat: IXMLNumberFormatType;
    function Get_Protection: IXMLProtectionType;
    procedure Set_ID(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Parent(Value: UnicodeString);
    { Methods & Properties }
    property ID: UnicodeString read Get_ID write Set_ID;
    property Name: UnicodeString read Get_Name write Set_Name;
    property Parent: UnicodeString read Get_Parent write Set_Parent;
    property Alignment: IXMLAlignmentType read Get_Alignment;
    property Borders: IXMLBordersType read Get_Borders;
    property Font: IXMLFontType read Get_Font;
    property Interior: IXMLInteriorType read Get_Interior;
    property NumberFormat: IXMLNumberFormatType read Get_NumberFormat;
    property Protection: IXMLProtectionType read Get_Protection;
  end;

{ IXMLAlignmentType }

  IXMLAlignmentType = interface(IXMLNode)
    ['{034EECAC-0670-4A16-B293-7F94C3F32DFE}']
    { Property Accessors }
    function Get_Horizontal: UnicodeString;
    function Get_ReadingOrder: UnicodeString;
    function Get_Indent: Int64;
    function Get_Rotate: Double;
    function Get_ShrinkToFit: UnicodeString;
    function Get_Vertical: UnicodeString;
    function Get_VerticalText: UnicodeString;
    function Get_WrapText: UnicodeString;
    procedure Set_Horizontal(Value: UnicodeString);
    procedure Set_ReadingOrder(Value: UnicodeString);
    procedure Set_Indent(Value: Int64);
    procedure Set_Rotate(Value: Double);
    procedure Set_ShrinkToFit(Value: UnicodeString);
    procedure Set_Vertical(Value: UnicodeString);
    procedure Set_VerticalText(Value: UnicodeString);
    procedure Set_WrapText(Value: UnicodeString);
    { Methods & Properties }
    property Horizontal: UnicodeString read Get_Horizontal write Set_Horizontal;
    property ReadingOrder: UnicodeString read Get_ReadingOrder write Set_ReadingOrder;
    property Indent: Int64 read Get_Indent write Set_Indent;
    property Rotate: Double read Get_Rotate write Set_Rotate;
    property ShrinkToFit: UnicodeString read Get_ShrinkToFit write Set_ShrinkToFit;
    property Vertical: UnicodeString read Get_Vertical write Set_Vertical;
    property VerticalText: UnicodeString read Get_VerticalText write Set_VerticalText;
    property WrapText: UnicodeString read Get_WrapText write Set_WrapText;
  end;

{ IXMLBordersType }

  IXMLBordersType = interface(IXMLNodeCollection)
    ['{FD72639F-38E7-45A4-ACC3-4C201395E1E4}']
    { Property Accessors }
    function Get_Border(Index: Integer): IXMLBorderType;
    { Methods & Properties }
    function Add: IXMLBorderType;
    function Insert(const Index: Integer): IXMLBorderType;
    property Border[Index: Integer]: IXMLBorderType read Get_Border; default;
  end;

{ IXMLBorderType }

  IXMLBorderType = interface(IXMLNode)
    ['{1EE20FD8-75F9-40B8-8050-5A56F3FC6DF5}']
    { Property Accessors }
    function Get_Position: UnicodeString;
    function Get_Color: UnicodeString;
    function Get_LineStyle: UnicodeString;
    function Get_Weight: Double;
    procedure Set_Position(Value: UnicodeString);
    procedure Set_Color(Value: UnicodeString);
    procedure Set_LineStyle(Value: UnicodeString);
    procedure Set_Weight(Value: Double);
    { Methods & Properties }
    property Position: UnicodeString read Get_Position write Set_Position;
    property Color: UnicodeString read Get_Color write Set_Color;
    property LineStyle: UnicodeString read Get_LineStyle write Set_LineStyle;
    property Weight: Double read Get_Weight write Set_Weight;
  end;

{ IXMLFontType }

  IXMLFontType = interface(IXMLNode)
    ['{8681EE90-5909-46C3-A2C5-4EE188225CC7}']
    { Property Accessors }
    function Get_Bold: UnicodeString;
    function Get_Color: UnicodeString;
    function Get_FontName: UnicodeString;
    function Get_Italic: UnicodeString;
    function Get_Outline: UnicodeString;
    function Get_Shadow: UnicodeString;
    function Get_Size: Double;
    function Get_StrikeThrough: UnicodeString;
    function Get_Underline: UnicodeString;
    function Get_VerticalAlign: UnicodeString;
    function Get_CharSet: Integer;
    function Get_Family: UnicodeString;
    procedure Set_Bold(Value: UnicodeString);
    procedure Set_Color(Value: UnicodeString);
    procedure Set_FontName(Value: UnicodeString);
    procedure Set_Italic(Value: UnicodeString);
    procedure Set_Outline(Value: UnicodeString);
    procedure Set_Shadow(Value: UnicodeString);
    procedure Set_Size(Value: Double);
    procedure Set_StrikeThrough(Value: UnicodeString);
    procedure Set_Underline(Value: UnicodeString);
    procedure Set_VerticalAlign(Value: UnicodeString);
    procedure Set_CharSet(Value: Integer);
    procedure Set_Family(Value: UnicodeString);
    { Methods & Properties }
    property Bold: UnicodeString read Get_Bold write Set_Bold;
    property Color: UnicodeString read Get_Color write Set_Color;
    property FontName: UnicodeString read Get_FontName write Set_FontName;
    property Italic: UnicodeString read Get_Italic write Set_Italic;
    property Outline: UnicodeString read Get_Outline write Set_Outline;
    property Shadow: UnicodeString read Get_Shadow write Set_Shadow;
    property Size: Double read Get_Size write Set_Size;
    property StrikeThrough: UnicodeString read Get_StrikeThrough write Set_StrikeThrough;
    property Underline: UnicodeString read Get_Underline write Set_Underline;
    property VerticalAlign: UnicodeString read Get_VerticalAlign write Set_VerticalAlign;
    property CharSet: Integer read Get_CharSet write Set_CharSet;
    property Family: UnicodeString read Get_Family write Set_Family;
  end;

{ IXMLInteriorType }

  IXMLInteriorType = interface(IXMLNode)
    ['{667DF039-5C24-4941-B439-F1A79D6D9EDD}']
    { Property Accessors }
    function Get_Color: UnicodeString;
    function Get_Pattern: UnicodeString;
    function Get_PatternColor: UnicodeString;
    procedure Set_Color(Value: UnicodeString);
    procedure Set_Pattern(Value: UnicodeString);
    procedure Set_PatternColor(Value: UnicodeString);
    { Methods & Properties }
    property Color: UnicodeString read Get_Color write Set_Color;
    property Pattern: UnicodeString read Get_Pattern write Set_Pattern;
    property PatternColor: UnicodeString read Get_PatternColor write Set_PatternColor;
  end;

{ IXMLNumberFormatType }

  IXMLNumberFormatType = interface(IXMLNode)
    ['{5FC6F099-F103-4145-BC9E-DCCBDDF5F694}']
    { Property Accessors }
    function Get_Format: UnicodeString;
    procedure Set_Format(Value: UnicodeString);
    { Methods & Properties }
    property Format: UnicodeString read Get_Format write Set_Format;
  end;

{ IXMLProtectionType }

  IXMLProtectionType = interface(IXMLNode)
    ['{4DC0A2BF-411A-429C-AA11-5A0DFB3DB841}']
    { Property Accessors }
    function Get_Protected_: UnicodeString;
    function Get_HideFormula: UnicodeString;
    procedure Set_Protected_(Value: UnicodeString);
    procedure Set_HideFormula(Value: UnicodeString);
    { Methods & Properties }
    property Protected_: UnicodeString read Get_Protected_ write Set_Protected_;
    property HideFormula: UnicodeString read Get_HideFormula write Set_HideFormula;
  end;

{ IXMLNamesType }

  IXMLNamesType = interface(IXMLNodeCollection)
    ['{525509C4-2D39-42FA-9BF9-7F4F52E353D2}']
    { Property Accessors }
    function Get_NamedRange(Index: Integer): IXMLNamesType_NamedRange;
    { Methods & Properties }
    function Add: IXMLNamesType_NamedRange;
    function Insert(const Index: Integer): IXMLNamesType_NamedRange;
    property NamedRange[Index: Integer]: IXMLNamesType_NamedRange read Get_NamedRange; default;
  end;

{ IXMLNamesType_NamedRange }

  IXMLNamesType_NamedRange = interface(IXMLNode)
    ['{5DFA0434-E6FC-4B91-98DD-9F47FF764DC1}']
    { Property Accessors }
    function Get_Name: UnicodeString;
    function Get_RefersTo: UnicodeString;
    function Get_Hidden: UnicodeString;
    function Get_PasteRefersTo: UnicodeString;
    procedure Set_Name(Value: UnicodeString);
    procedure Set_RefersTo(Value: UnicodeString);
    procedure Set_Hidden(Value: UnicodeString);
    procedure Set_PasteRefersTo(Value: UnicodeString);
    { Methods & Properties }
    property Name: UnicodeString read Get_Name write Set_Name;
    property RefersTo: UnicodeString read Get_RefersTo write Set_RefersTo;
    property Hidden: UnicodeString read Get_Hidden write Set_Hidden;
    property PasteRefersTo: UnicodeString read Get_PasteRefersTo write Set_PasteRefersTo;
  end;

{ IXMLWorksheetType }

  IXMLWorksheetType = interface(IXMLNode)
    ['{662EAF1C-D2CD-4661-BBFF-BB2D09FF1892}']
    { Property Accessors }
    function Get_Name: UnicodeString;
    function Get_Protected_: UnicodeString;
    function Get_RightToLeft: UnicodeString;
    function Get_Names: IXMLNamesType;
    function Get_Table: IXMLTableType;
    function Get_WorksheetOptions: IXMLWorksheetOptionsType_x;
    function Get_Watches: IXMLWatches_x;
    function Get_DataTable: IXMLDataTable_x;
    function Get_PageBreaks: IXMLPageBreaksType_x;
    function Get_PivotTable: IXMLPivotTableType_xList;
    function Get_DataValidation: IXMLDataValidationType_xList;
    function Get_AutoFilter: IXMLAutoFilter_x;
    function Get_ConditionalFormatting: IXMLConditionalFormattingType_xList;
    function Get_Sorting: IXMLSortingType_x;
    function Get_Worksheetoptions: IXMLWorksheetoptions_c;
    function Get_QueryTable: IXMLQueryTableType_xList;
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Protected_(Value: UnicodeString);
    procedure Set_RightToLeft(Value: UnicodeString);
    { Methods & Properties }
    property Name: UnicodeString read Get_Name write Set_Name;
    property Protected_: UnicodeString read Get_Protected_ write Set_Protected_;
    property RightToLeft: UnicodeString read Get_RightToLeft write Set_RightToLeft;
    property Names: IXMLNamesType read Get_Names;
    property Table: IXMLTableType read Get_Table;
    property WorksheetOptions: IXMLWorksheetOptionsType_x read Get_WorksheetOptions;
    property Watches: IXMLWatches_x read Get_Watches;
    property DataTable: IXMLDataTable_x read Get_DataTable;
    property PageBreaks: IXMLPageBreaksType_x read Get_PageBreaks;
    property PivotTable: IXMLPivotTableType_xList read Get_PivotTable;
    property DataValidation: IXMLDataValidationType_xList read Get_DataValidation;
    property AutoFilter: IXMLAutoFilter_x read Get_AutoFilter;
    property ConditionalFormatting: IXMLConditionalFormattingType_xList read Get_ConditionalFormatting;
    property Sorting: IXMLSortingType_x read Get_Sorting;
    property Worksheetoptions: IXMLWorksheetoptions_c read Get_Worksheetoptions;
    property QueryTable: IXMLQueryTableType_xList read Get_QueryTable;
  end;

{ IXMLWorksheetTypeList }

  IXMLWorksheetTypeList = interface(IXMLNodeCollection)
    ['{E8D154D5-9245-4A92-A514-A772BD0C9FFA}']
    { Methods & Properties }
    function Add: IXMLWorksheetType;
    function Insert(const Index: Integer): IXMLWorksheetType;

    function Get_Item(Index: Integer): IXMLWorksheetType;
    property Items[Index: Integer]: IXMLWorksheetType read Get_Item; default;
  end;

{ IXMLTableType }

  IXMLTableType = interface(IXMLNode)
    ['{390FBC75-6765-441D-945F-E1EFE825D8CA}']
    { Property Accessors }
    function Get_DefaultColumnWidth: Double;
    function Get_DefaultRowHeight: Double;
    function Get_ExpandedColumnCount: LongWord;
    function Get_ExpandedRowCount: LongWord;
    function Get_StyleID: UnicodeString;
    function Get_LeftCell: LongWord;
    function Get_TopCell: Integer;
    function Get_FullColumns: UnicodeString;
    function Get_FullRows: UnicodeString;
    function Get_FullColumns: UnicodeString;
    function Get_FullRows: UnicodeString;
    function Get_DefaultRowHeight: UnicodeString;
    function Get_DefaultColumnWidth: UnicodeString;
    function Get_Column: IXMLTableType_ColumnList;
    function Get_Row: IXMLTableType_RowList;
    procedure Set_DefaultColumnWidth(Value: Double);
    procedure Set_DefaultRowHeight(Value: Double);
    procedure Set_ExpandedColumnCount(Value: LongWord);
    procedure Set_ExpandedRowCount(Value: LongWord);
    procedure Set_StyleID(Value: UnicodeString);
    procedure Set_LeftCell(Value: LongWord);
    procedure Set_TopCell(Value: Integer);
    procedure Set_FullColumns(Value: UnicodeString);
    procedure Set_FullRows(Value: UnicodeString);
    procedure Set_FullColumns(Value: UnicodeString);
    procedure Set_FullRows(Value: UnicodeString);
    procedure Set_DefaultRowHeight(Value: UnicodeString);
    procedure Set_DefaultColumnWidth(Value: UnicodeString);
    { Methods & Properties }
    property DefaultColumnWidth: Double read Get_DefaultColumnWidth write Set_DefaultColumnWidth;
    property DefaultRowHeight: Double read Get_DefaultRowHeight write Set_DefaultRowHeight;
    property ExpandedColumnCount: LongWord read Get_ExpandedColumnCount write Set_ExpandedColumnCount;
    property ExpandedRowCount: LongWord read Get_ExpandedRowCount write Set_ExpandedRowCount;
    property StyleID: UnicodeString read Get_StyleID write Set_StyleID;
    property LeftCell: LongWord read Get_LeftCell write Set_LeftCell;
    property TopCell: Integer read Get_TopCell write Set_TopCell;
    property FullColumns: UnicodeString read Get_FullColumns write Set_FullColumns;
    property FullRows: UnicodeString read Get_FullRows write Set_FullRows;
    property FullColumns: UnicodeString read Get_FullColumns write Set_FullColumns;
    property FullRows: UnicodeString read Get_FullRows write Set_FullRows;
    property DefaultRowHeight: UnicodeString read Get_DefaultRowHeight write Set_DefaultRowHeight;
    property DefaultColumnWidth: UnicodeString read Get_DefaultColumnWidth write Set_DefaultColumnWidth;
    property Column: IXMLTableType_ColumnList read Get_Column;
    property Row: IXMLTableType_RowList read Get_Row;
  end;

{ IXMLTableType_Column }

  IXMLTableType_Column = interface(IXMLNode)
    ['{4509F8F5-0E83-44F1-BBB2-9D8637CDF2D9}']
    { Property Accessors }
    function Get_AutoFitWidth: UnicodeString;
    function Get_Hidden: UnicodeString;
    function Get_Index: LongWord;
    function Get_Span: LongWord;
    function Get_StyleID: UnicodeString;
    function Get_Width: Double;
    function Get_Caption: UnicodeString;
    procedure Set_AutoFitWidth(Value: UnicodeString);
    procedure Set_Hidden(Value: UnicodeString);
    procedure Set_Index(Value: LongWord);
    procedure Set_Span(Value: LongWord);
    procedure Set_StyleID(Value: UnicodeString);
    procedure Set_Width(Value: Double);
    procedure Set_Caption(Value: UnicodeString);
    { Methods & Properties }
    property AutoFitWidth: UnicodeString read Get_AutoFitWidth write Set_AutoFitWidth;
    property Hidden: UnicodeString read Get_Hidden write Set_Hidden;
    property Index: LongWord read Get_Index write Set_Index;
    property Span: LongWord read Get_Span write Set_Span;
    property StyleID: UnicodeString read Get_StyleID write Set_StyleID;
    property Width: Double read Get_Width write Set_Width;
    property Caption: UnicodeString read Get_Caption write Set_Caption;
  end;

{ IXMLTableType_ColumnList }

  IXMLTableType_ColumnList = interface(IXMLNodeCollection)
    ['{CEF62543-3A3C-432A-9F58-37B2966C8A37}']
    { Methods & Properties }
    function Add: IXMLTableType_Column;
    function Insert(const Index: Integer): IXMLTableType_Column;

    function Get_Item(Index: Integer): IXMLTableType_Column;
    property Items[Index: Integer]: IXMLTableType_Column read Get_Item; default;
  end;

{ IXMLTableType_Row }

  IXMLTableType_Row = interface(IXMLNodeCollection)
    ['{AD8985C9-8CCF-4EE2-99BE-59D0E213BA59}']
    { Property Accessors }
    function Get_AutoFitHeight: UnicodeString;
    function Get_Height: Double;
    function Get_Hidden: UnicodeString;
    function Get_Index: LongWord;
    function Get_Span: LongWord;
    function Get_StyleID: UnicodeString;
    function Get_Caption: UnicodeString;
    function Get_Cell(Index: Integer): IXMLCell;
    procedure Set_AutoFitHeight(Value: UnicodeString);
    procedure Set_Height(Value: Double);
    procedure Set_Hidden(Value: UnicodeString);
    procedure Set_Index(Value: LongWord);
    procedure Set_Span(Value: LongWord);
    procedure Set_StyleID(Value: UnicodeString);
    procedure Set_Caption(Value: UnicodeString);
    { Methods & Properties }
    function Add: IXMLCell;
    function Insert(const Index: Integer): IXMLCell;
    property AutoFitHeight: UnicodeString read Get_AutoFitHeight write Set_AutoFitHeight;
    property Height: Double read Get_Height write Set_Height;
    property Hidden: UnicodeString read Get_Hidden write Set_Hidden;
    property Index: LongWord read Get_Index write Set_Index;
    property Span: LongWord read Get_Span write Set_Span;
    property StyleID: UnicodeString read Get_StyleID write Set_StyleID;
    property Caption: UnicodeString read Get_Caption write Set_Caption;
    property Cell[Index: Integer]: IXMLCell read Get_Cell; default;
  end;

{ IXMLTableType_RowList }

  IXMLTableType_RowList = interface(IXMLNodeCollection)
    ['{13DB54A7-C156-4860-8550-48747D34DB46}']
    { Methods & Properties }
    function Add: IXMLTableType_Row;
    function Insert(const Index: Integer): IXMLTableType_Row;

    function Get_Item(Index: Integer): IXMLTableType_Row;
    property Items[Index: Integer]: IXMLTableType_Row read Get_Item; default;
  end;

{ IXMLCell }

  IXMLCell = interface(IXMLNode)
    ['{D9E0D403-9611-4B25-9B44-72D69563429B}']
    { Property Accessors }
    function Get_ArrayRange: UnicodeString;
    function Get_Formula: UnicodeString;
    function Get_HRef: UnicodeString;
    function Get_Index: LongWord;
    function Get_MergeAcross: Int64;
    function Get_MergeDown: Int64;
    function Get_StyleID: UnicodeString;
    function Get_HRefScreenTip: UnicodeString;
    function Get_PasteFormula: UnicodeString;
    function Get_SmartTags: IXMLSmartTagsElt_oList;
    function Get_Data: IXMLData;
    function Get_Comment: IXMLCommentType;
    function Get_Phonetictext: IXMLPhonetictext_x;
    function Get_NamedCell: IXMLNamedCellList;
    procedure Set_ArrayRange(Value: UnicodeString);
    procedure Set_Formula(Value: UnicodeString);
    procedure Set_HRef(Value: UnicodeString);
    procedure Set_Index(Value: LongWord);
    procedure Set_MergeAcross(Value: Int64);
    procedure Set_MergeDown(Value: Int64);
    procedure Set_StyleID(Value: UnicodeString);
    procedure Set_HRefScreenTip(Value: UnicodeString);
    procedure Set_PasteFormula(Value: UnicodeString);
    { Methods & Properties }
    property ArrayRange: UnicodeString read Get_ArrayRange write Set_ArrayRange;
    property Formula: UnicodeString read Get_Formula write Set_Formula;
    property HRef: UnicodeString read Get_HRef write Set_HRef;
    property Index: LongWord read Get_Index write Set_Index;
    property MergeAcross: Int64 read Get_MergeAcross write Set_MergeAcross;
    property MergeDown: Int64 read Get_MergeDown write Set_MergeDown;
    property StyleID: UnicodeString read Get_StyleID write Set_StyleID;
    property HRefScreenTip: UnicodeString read Get_HRefScreenTip write Set_HRefScreenTip;
    property PasteFormula: UnicodeString read Get_PasteFormula write Set_PasteFormula;
    property SmartTags: IXMLSmartTagsElt_oList read Get_SmartTags;
    property Data: IXMLData read Get_Data;
    property Comment: IXMLCommentType read Get_Comment;
    property Phonetictext: IXMLPhonetictext_x read Get_Phonetictext;
    property NamedCell: IXMLNamedCellList read Get_NamedCell;
  end;

{ IXMLSmartTagsElt_o }

  IXMLSmartTagsElt_o = interface(IXMLNode)
    ['{5D5652F3-C2EA-4C37-88D3-7742F7E92386}']
  end;

{ IXMLSmartTagsElt_oList }

  IXMLSmartTagsElt_oList = interface(IXMLNodeCollection)
    ['{19DCE186-ABFB-421E-AA15-813D07D12905}']
    { Methods & Properties }
    function Add: IXMLSmartTagsElt_o;
    function Insert(const Index: Integer): IXMLSmartTagsElt_o;

    function Get_Item(Index: Integer): IXMLSmartTagsElt_o;
    property Items[Index: Integer]: IXMLSmartTagsElt_o read Get_Item; default;
  end;

{ IXMLData }

  IXMLData = interface(IXMLNode)
    ['{51339F61-C760-431C-A7BD-B0FE48C5D6B9}']
    { Property Accessors }
    function Get_Type_: UnicodeString;
    function Get_Ticked: UnicodeString;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_Ticked(Value: UnicodeString);
    { Methods & Properties }
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
    property Ticked: UnicodeString read Get_Ticked write Set_Ticked;
  end;

{ IXMLCommentType }

  IXMLCommentType = interface(IXMLNode)
    ['{6EC35EFE-CE44-45C8-A3F9-CECD0195C442}']
    { Property Accessors }
    function Get_Author: UnicodeString;
    function Get_ShowAlways: UnicodeString;
    function Get_Data: IXMLCommentType_Data;
    procedure Set_Author(Value: UnicodeString);
    procedure Set_ShowAlways(Value: UnicodeString);
    { Methods & Properties }
    property Author: UnicodeString read Get_Author write Set_Author;
    property ShowAlways: UnicodeString read Get_ShowAlways write Set_ShowAlways;
    property Data: IXMLCommentType_Data read Get_Data;
  end;

{ IXMLCommentType_Data }

  IXMLCommentType_Data = interface(IXMLNode)
    ['{8268F74A-0AB0-40EF-83B0-DC6B558ECE87}']
  end;

{ IXMLPhonetictext_x }

  IXMLPhonetictext_x = interface(IXMLNode)
    ['{2F636C84-52AB-4D93-B6B4-8DF8DB915C9A}']
    { Property Accessors }
    function Get_Visible: UnicodeString;
    procedure Set_Visible(Value: UnicodeString);
    { Methods & Properties }
    property Visible: UnicodeString read Get_Visible write Set_Visible;
  end;

{ IXMLNamedCell }

  IXMLNamedCell = interface(IXMLNode)
    ['{E2B53B49-9DF6-4B8E-84B2-240B994E1D37}']
    { Property Accessors }
    function Get_Name: UnicodeString;
    procedure Set_Name(Value: UnicodeString);
    { Methods & Properties }
    property Name: UnicodeString read Get_Name write Set_Name;
  end;

{ IXMLNamedCellList }

  IXMLNamedCellList = interface(IXMLNodeCollection)
    ['{1E31C1CB-664B-4C9B-8FDB-D1B61739A7CB}']
    { Methods & Properties }
    function Add: IXMLNamedCell;
    function Insert(const Index: Integer): IXMLNamedCell;

    function Get_Item(Index: Integer): IXMLNamedCell;
    property Items[Index: Integer]: IXMLNamedCell read Get_Item; default;
  end;

{ IXMLWorksheetOptionsType_x }

  IXMLWorksheetOptionsType_x = interface(IXMLNode)
    ['{E0DC0976-EC37-4800-9498-461E2BF9D9F3}']
    { Property Accessors }
    function Get_FitToPage: UnicodeString;
    function Get_DoNotDisplayColHeaders: UnicodeString;
    function Get_DoNotDisplayRowHeaders: UnicodeString;
    function Get_ViewableRange: UnicodeString;
    function Get_Selection: UnicodeString;
    function Get_GridlineColor: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_ExcelWorksheetType: UnicodeString;
    function Get_IntlMacro: UnicodeString;
    function Get_Unsynced: UnicodeString;
    function Get_Selected: UnicodeString;
    function Get_CodeName: UnicodeString;
    function Get_PageSetup: IXMLPageSetupType_x;
    function Get_DisplayPageBreak: UnicodeString;
    function Get_TransitionExpressionEvaluation: UnicodeString;
    function Get_TransitionFormulaEntry: UnicodeString;
    function Get_Print: IXMLPrintType_x;
    function Get_Zoom: Integer;
    function Get_PageBreakZoom: Integer;
    function Get_ShowPageBreakZoom: UnicodeString;
    function Get_DefaultRowHeight: Integer;
    function Get_DefaultColumnWidth: Integer;
    function Get_StandardWidth: Integer;
    function Get_Visible: UnicodeString;
    function Get_LeftColumnVisible: Integer;
    function Get_DisplayRightToLeft: UnicodeString;
    function Get_GridlineColorIndex: Integer;
    function Get_DisplayFormulas: UnicodeString;
    function Get_DoNotDisplayGridlines: UnicodeString;
    function Get_DoNotDisplayHeadings: UnicodeString;
    function Get_DoNotDisplayOutline: UnicodeString;
    function Get_ApplyAutomaticOutlineStyles: UnicodeString;
    function Get_NoSummaryRowsBelowDetail: UnicodeString;
    function Get_NoSummaryColumnsRightDetail: UnicodeString;
    function Get_DoNotDisplayZeros: UnicodeString;
    function Get_ActiveRow: Integer;
    function Get_ActiveColumn: Integer;
    function Get_FilterOn: UnicodeString;
    function Get_RangeSelection: UnicodeString;
    function Get_TopRowVisible: Integer;
    function Get_TopRowBottomPane: Integer;
    function Get_LeftColumnRightPane: Integer;
    function Get_ActivePane: Integer;
    function Get_SplitHorizontal: Integer;
    function Get_SplitVertical: Integer;
    function Get_FreezePanes: UnicodeString;
    function Get_FrozenNoSplit: UnicodeString;
    function Get_TabColorIndex: Integer;
    function Get_Panes: IXMLPanesType_x;
    function Get_ProtectContents: UnicodeString;
    function Get_ProtectObjects: UnicodeString;
    function Get_ProtectScenarios: UnicodeString;
    function Get_EnableSelection: UnicodeString;
    function Get_AllowFormatCells: UnicodeString;
    function Get_AllowSizeCols: UnicodeString;
    function Get_AllowSizeRows: UnicodeString;
    function Get_AllowInsertCols: UnicodeString;
    function Get_AllowInsertRows: UnicodeString;
    function Get_AllowInsertHyperlinks: UnicodeString;
    function Get_AllowDeleteCols: UnicodeString;
    function Get_AllowDeleteRows: UnicodeString;
    function Get_AllowSort: UnicodeString;
    function Get_AllowFilter: UnicodeString;
    function Get_AllowUsePivotTables: UnicodeString;
    function Get_SpaceAbove: UnicodeString;
    function Get_SpaceBelow: UnicodeString;
    function Get_ZeroHeight: UnicodeString;
    procedure Set_FitToPage(Value: UnicodeString);
    procedure Set_DoNotDisplayColHeaders(Value: UnicodeString);
    procedure Set_DoNotDisplayRowHeaders(Value: UnicodeString);
    procedure Set_ViewableRange(Value: UnicodeString);
    procedure Set_Selection(Value: UnicodeString);
    procedure Set_GridlineColor(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
    procedure Set_ExcelWorksheetType(Value: UnicodeString);
    procedure Set_IntlMacro(Value: UnicodeString);
    procedure Set_Unsynced(Value: UnicodeString);
    procedure Set_Selected(Value: UnicodeString);
    procedure Set_CodeName(Value: UnicodeString);
    procedure Set_DisplayPageBreak(Value: UnicodeString);
    procedure Set_TransitionExpressionEvaluation(Value: UnicodeString);
    procedure Set_TransitionFormulaEntry(Value: UnicodeString);
    procedure Set_Zoom(Value: Integer);
    procedure Set_PageBreakZoom(Value: Integer);
    procedure Set_ShowPageBreakZoom(Value: UnicodeString);
    procedure Set_DefaultRowHeight(Value: Integer);
    procedure Set_DefaultColumnWidth(Value: Integer);
    procedure Set_StandardWidth(Value: Integer);
    procedure Set_Visible(Value: UnicodeString);
    procedure Set_LeftColumnVisible(Value: Integer);
    procedure Set_DisplayRightToLeft(Value: UnicodeString);
    procedure Set_GridlineColorIndex(Value: Integer);
    procedure Set_DisplayFormulas(Value: UnicodeString);
    procedure Set_DoNotDisplayGridlines(Value: UnicodeString);
    procedure Set_DoNotDisplayHeadings(Value: UnicodeString);
    procedure Set_DoNotDisplayOutline(Value: UnicodeString);
    procedure Set_ApplyAutomaticOutlineStyles(Value: UnicodeString);
    procedure Set_NoSummaryRowsBelowDetail(Value: UnicodeString);
    procedure Set_NoSummaryColumnsRightDetail(Value: UnicodeString);
    procedure Set_DoNotDisplayZeros(Value: UnicodeString);
    procedure Set_ActiveRow(Value: Integer);
    procedure Set_ActiveColumn(Value: Integer);
    procedure Set_FilterOn(Value: UnicodeString);
    procedure Set_RangeSelection(Value: UnicodeString);
    procedure Set_TopRowVisible(Value: Integer);
    procedure Set_TopRowBottomPane(Value: Integer);
    procedure Set_LeftColumnRightPane(Value: Integer);
    procedure Set_ActivePane(Value: Integer);
    procedure Set_SplitHorizontal(Value: Integer);
    procedure Set_SplitVertical(Value: Integer);
    procedure Set_FreezePanes(Value: UnicodeString);
    procedure Set_FrozenNoSplit(Value: UnicodeString);
    procedure Set_TabColorIndex(Value: Integer);
    procedure Set_ProtectContents(Value: UnicodeString);
    procedure Set_ProtectObjects(Value: UnicodeString);
    procedure Set_ProtectScenarios(Value: UnicodeString);
    procedure Set_EnableSelection(Value: UnicodeString);
    procedure Set_AllowFormatCells(Value: UnicodeString);
    procedure Set_AllowSizeCols(Value: UnicodeString);
    procedure Set_AllowSizeRows(Value: UnicodeString);
    procedure Set_AllowInsertCols(Value: UnicodeString);
    procedure Set_AllowInsertRows(Value: UnicodeString);
    procedure Set_AllowInsertHyperlinks(Value: UnicodeString);
    procedure Set_AllowDeleteCols(Value: UnicodeString);
    procedure Set_AllowDeleteRows(Value: UnicodeString);
    procedure Set_AllowSort(Value: UnicodeString);
    procedure Set_AllowFilter(Value: UnicodeString);
    procedure Set_AllowUsePivotTables(Value: UnicodeString);
    procedure Set_SpaceAbove(Value: UnicodeString);
    procedure Set_SpaceBelow(Value: UnicodeString);
    procedure Set_ZeroHeight(Value: UnicodeString);
    { Methods & Properties }
    property FitToPage: UnicodeString read Get_FitToPage write Set_FitToPage;
    property DoNotDisplayColHeaders: UnicodeString read Get_DoNotDisplayColHeaders write Set_DoNotDisplayColHeaders;
    property DoNotDisplayRowHeaders: UnicodeString read Get_DoNotDisplayRowHeaders write Set_DoNotDisplayRowHeaders;
    property ViewableRange: UnicodeString read Get_ViewableRange write Set_ViewableRange;
    property Selection: UnicodeString read Get_Selection write Set_Selection;
    property GridlineColor: UnicodeString read Get_GridlineColor write Set_GridlineColor;
    property Name: UnicodeString read Get_Name write Set_Name;
    property ExcelWorksheetType: UnicodeString read Get_ExcelWorksheetType write Set_ExcelWorksheetType;
    property IntlMacro: UnicodeString read Get_IntlMacro write Set_IntlMacro;
    property Unsynced: UnicodeString read Get_Unsynced write Set_Unsynced;
    property Selected: UnicodeString read Get_Selected write Set_Selected;
    property CodeName: UnicodeString read Get_CodeName write Set_CodeName;
    property PageSetup: IXMLPageSetupType_x read Get_PageSetup;
    property DisplayPageBreak: UnicodeString read Get_DisplayPageBreak write Set_DisplayPageBreak;
    property TransitionExpressionEvaluation: UnicodeString read Get_TransitionExpressionEvaluation write Set_TransitionExpressionEvaluation;
    property TransitionFormulaEntry: UnicodeString read Get_TransitionFormulaEntry write Set_TransitionFormulaEntry;
    property Print: IXMLPrintType_x read Get_Print;
    property Zoom: Integer read Get_Zoom write Set_Zoom;
    property PageBreakZoom: Integer read Get_PageBreakZoom write Set_PageBreakZoom;
    property ShowPageBreakZoom: UnicodeString read Get_ShowPageBreakZoom write Set_ShowPageBreakZoom;
    property DefaultRowHeight: Integer read Get_DefaultRowHeight write Set_DefaultRowHeight;
    property DefaultColumnWidth: Integer read Get_DefaultColumnWidth write Set_DefaultColumnWidth;
    property StandardWidth: Integer read Get_StandardWidth write Set_StandardWidth;
    property Visible: UnicodeString read Get_Visible write Set_Visible;
    property LeftColumnVisible: Integer read Get_LeftColumnVisible write Set_LeftColumnVisible;
    property DisplayRightToLeft: UnicodeString read Get_DisplayRightToLeft write Set_DisplayRightToLeft;
    property GridlineColorIndex: Integer read Get_GridlineColorIndex write Set_GridlineColorIndex;
    property DisplayFormulas: UnicodeString read Get_DisplayFormulas write Set_DisplayFormulas;
    property DoNotDisplayGridlines: UnicodeString read Get_DoNotDisplayGridlines write Set_DoNotDisplayGridlines;
    property DoNotDisplayHeadings: UnicodeString read Get_DoNotDisplayHeadings write Set_DoNotDisplayHeadings;
    property DoNotDisplayOutline: UnicodeString read Get_DoNotDisplayOutline write Set_DoNotDisplayOutline;
    property ApplyAutomaticOutlineStyles: UnicodeString read Get_ApplyAutomaticOutlineStyles write Set_ApplyAutomaticOutlineStyles;
    property NoSummaryRowsBelowDetail: UnicodeString read Get_NoSummaryRowsBelowDetail write Set_NoSummaryRowsBelowDetail;
    property NoSummaryColumnsRightDetail: UnicodeString read Get_NoSummaryColumnsRightDetail write Set_NoSummaryColumnsRightDetail;
    property DoNotDisplayZeros: UnicodeString read Get_DoNotDisplayZeros write Set_DoNotDisplayZeros;
    property ActiveRow: Integer read Get_ActiveRow write Set_ActiveRow;
    property ActiveColumn: Integer read Get_ActiveColumn write Set_ActiveColumn;
    property FilterOn: UnicodeString read Get_FilterOn write Set_FilterOn;
    property RangeSelection: UnicodeString read Get_RangeSelection write Set_RangeSelection;
    property TopRowVisible: Integer read Get_TopRowVisible write Set_TopRowVisible;
    property TopRowBottomPane: Integer read Get_TopRowBottomPane write Set_TopRowBottomPane;
    property LeftColumnRightPane: Integer read Get_LeftColumnRightPane write Set_LeftColumnRightPane;
    property ActivePane: Integer read Get_ActivePane write Set_ActivePane;
    property SplitHorizontal: Integer read Get_SplitHorizontal write Set_SplitHorizontal;
    property SplitVertical: Integer read Get_SplitVertical write Set_SplitVertical;
    property FreezePanes: UnicodeString read Get_FreezePanes write Set_FreezePanes;
    property FrozenNoSplit: UnicodeString read Get_FrozenNoSplit write Set_FrozenNoSplit;
    property TabColorIndex: Integer read Get_TabColorIndex write Set_TabColorIndex;
    property Panes: IXMLPanesType_x read Get_Panes;
    property ProtectContents: UnicodeString read Get_ProtectContents write Set_ProtectContents;
    property ProtectObjects: UnicodeString read Get_ProtectObjects write Set_ProtectObjects;
    property ProtectScenarios: UnicodeString read Get_ProtectScenarios write Set_ProtectScenarios;
    property EnableSelection: UnicodeString read Get_EnableSelection write Set_EnableSelection;
    property AllowFormatCells: UnicodeString read Get_AllowFormatCells write Set_AllowFormatCells;
    property AllowSizeCols: UnicodeString read Get_AllowSizeCols write Set_AllowSizeCols;
    property AllowSizeRows: UnicodeString read Get_AllowSizeRows write Set_AllowSizeRows;
    property AllowInsertCols: UnicodeString read Get_AllowInsertCols write Set_AllowInsertCols;
    property AllowInsertRows: UnicodeString read Get_AllowInsertRows write Set_AllowInsertRows;
    property AllowInsertHyperlinks: UnicodeString read Get_AllowInsertHyperlinks write Set_AllowInsertHyperlinks;
    property AllowDeleteCols: UnicodeString read Get_AllowDeleteCols write Set_AllowDeleteCols;
    property AllowDeleteRows: UnicodeString read Get_AllowDeleteRows write Set_AllowDeleteRows;
    property AllowSort: UnicodeString read Get_AllowSort write Set_AllowSort;
    property AllowFilter: UnicodeString read Get_AllowFilter write Set_AllowFilter;
    property AllowUsePivotTables: UnicodeString read Get_AllowUsePivotTables write Set_AllowUsePivotTables;
    property SpaceAbove: UnicodeString read Get_SpaceAbove write Set_SpaceAbove;
    property SpaceBelow: UnicodeString read Get_SpaceBelow write Set_SpaceBelow;
    property ZeroHeight: UnicodeString read Get_ZeroHeight write Set_ZeroHeight;
  end;

{ IXMLPageSetupType_x }

  IXMLPageSetupType_x = interface(IXMLNode)
    ['{D6F97E99-D4F2-4C1E-BDC5-DF28418DFD75}']
    { Property Accessors }
    function Get_Layout: IXMLLayout_x;
    function Get_Header: IXMLHeader_x;
    function Get_Footer: IXMLFooter_x;
    function Get_PageMargins: IXMLPageMargins_x;
    { Methods & Properties }
    property Layout: IXMLLayout_x read Get_Layout;
    property Header: IXMLHeader_x read Get_Header;
    property Footer: IXMLFooter_x read Get_Footer;
    property PageMargins: IXMLPageMargins_x read Get_PageMargins;
  end;

{ IXMLLayout_x }

  IXMLLayout_x = interface(IXMLNode)
    ['{5FC8745E-A2FC-4AC7-9674-2512BF48B6CB}']
    { Property Accessors }
    function Get_Orientation: UnicodeString;
    function Get_CenterHorizontal: UnicodeString;
    function Get_CenterVertical: UnicodeString;
    function Get_StartPageNumber: UnicodeString;
    procedure Set_Orientation(Value: UnicodeString);
    procedure Set_CenterHorizontal(Value: UnicodeString);
    procedure Set_CenterVertical(Value: UnicodeString);
    procedure Set_StartPageNumber(Value: UnicodeString);
    { Methods & Properties }
    property Orientation: UnicodeString read Get_Orientation write Set_Orientation;
    property CenterHorizontal: UnicodeString read Get_CenterHorizontal write Set_CenterHorizontal;
    property CenterVertical: UnicodeString read Get_CenterVertical write Set_CenterVertical;
    property StartPageNumber: UnicodeString read Get_StartPageNumber write Set_StartPageNumber;
  end;

{ IXMLHeader_x }

  IXMLHeader_x = interface(IXMLNode)
    ['{73113024-863C-42B5-BF0B-586B346D6CC1}']
    { Property Accessors }
    function Get_Margin: Double;
    function Get_Data: UnicodeString;
    procedure Set_Margin(Value: Double);
    procedure Set_Data(Value: UnicodeString);
    { Methods & Properties }
    property Margin: Double read Get_Margin write Set_Margin;
    property Data: UnicodeString read Get_Data write Set_Data;
  end;

{ IXMLFooter_x }

  IXMLFooter_x = interface(IXMLNode)
    ['{230A1848-A750-49ED-A80E-DAAE8A799470}']
    { Property Accessors }
    function Get_Margin: Double;
    function Get_Data: UnicodeString;
    procedure Set_Margin(Value: Double);
    procedure Set_Data(Value: UnicodeString);
    { Methods & Properties }
    property Margin: Double read Get_Margin write Set_Margin;
    property Data: UnicodeString read Get_Data write Set_Data;
  end;

{ IXMLPageMargins_x }

  IXMLPageMargins_x = interface(IXMLNode)
    ['{DF6D236D-D640-4C9F-8298-F659B02EC7FB}']
    { Property Accessors }
    function Get_Left: Double;
    function Get_Right: Double;
    function Get_Top: Double;
    function Get_Bottom: Double;
    procedure Set_Left(Value: Double);
    procedure Set_Right(Value: Double);
    procedure Set_Top(Value: Double);
    procedure Set_Bottom(Value: Double);
    { Methods & Properties }
    property Left: Double read Get_Left write Set_Left;
    property Right: Double read Get_Right write Set_Right;
    property Top: Double read Get_Top write Set_Top;
    property Bottom: Double read Get_Bottom write Set_Bottom;
  end;

{ IXMLPrintType_x }

  IXMLPrintType_x = interface(IXMLNode)
    ['{A4ECD55A-3D23-4D18-9726-9055E2FEAF14}']
    { Property Accessors }
    function Get_FitWidth: Integer;
    function Get_FitHeight: Integer;
    function Get_LeftToRight: UnicodeString;
    function Get_BlackAndWhite: UnicodeString;
    function Get_NoPrinterInfo: UnicodeString;
    function Get_DraftQuality: UnicodeString;
    function Get_CommentsLayout: UnicodeString;
    function Get_Scale: Integer;
    function Get_PrintErrors: UnicodeString;
    function Get_ValidPrinterInfo: UnicodeString;
    function Get_PaperSizeIndex: Integer;
    function Get_HorizontalResolution: Integer;
    function Get_VerticalResolution: Integer;
    function Get_Gridlines: UnicodeString;
    function Get_NumberOfCopies: Integer;
    function Get_RowColHeadings: UnicodeString;
    procedure Set_FitWidth(Value: Integer);
    procedure Set_FitHeight(Value: Integer);
    procedure Set_LeftToRight(Value: UnicodeString);
    procedure Set_BlackAndWhite(Value: UnicodeString);
    procedure Set_NoPrinterInfo(Value: UnicodeString);
    procedure Set_DraftQuality(Value: UnicodeString);
    procedure Set_CommentsLayout(Value: UnicodeString);
    procedure Set_Scale(Value: Integer);
    procedure Set_PrintErrors(Value: UnicodeString);
    procedure Set_ValidPrinterInfo(Value: UnicodeString);
    procedure Set_PaperSizeIndex(Value: Integer);
    procedure Set_HorizontalResolution(Value: Integer);
    procedure Set_VerticalResolution(Value: Integer);
    procedure Set_Gridlines(Value: UnicodeString);
    procedure Set_NumberOfCopies(Value: Integer);
    procedure Set_RowColHeadings(Value: UnicodeString);
    { Methods & Properties }
    property FitWidth: Integer read Get_FitWidth write Set_FitWidth;
    property FitHeight: Integer read Get_FitHeight write Set_FitHeight;
    property LeftToRight: UnicodeString read Get_LeftToRight write Set_LeftToRight;
    property BlackAndWhite: UnicodeString read Get_BlackAndWhite write Set_BlackAndWhite;
    property NoPrinterInfo: UnicodeString read Get_NoPrinterInfo write Set_NoPrinterInfo;
    property DraftQuality: UnicodeString read Get_DraftQuality write Set_DraftQuality;
    property CommentsLayout: UnicodeString read Get_CommentsLayout write Set_CommentsLayout;
    property Scale: Integer read Get_Scale write Set_Scale;
    property PrintErrors: UnicodeString read Get_PrintErrors write Set_PrintErrors;
    property ValidPrinterInfo: UnicodeString read Get_ValidPrinterInfo write Set_ValidPrinterInfo;
    property PaperSizeIndex: Integer read Get_PaperSizeIndex write Set_PaperSizeIndex;
    property HorizontalResolution: Integer read Get_HorizontalResolution write Set_HorizontalResolution;
    property VerticalResolution: Integer read Get_VerticalResolution write Set_VerticalResolution;
    property Gridlines: UnicodeString read Get_Gridlines write Set_Gridlines;
    property NumberOfCopies: Integer read Get_NumberOfCopies write Set_NumberOfCopies;
    property RowColHeadings: UnicodeString read Get_RowColHeadings write Set_RowColHeadings;
  end;

{ IXMLPanesType_x }

  IXMLPanesType_x = interface(IXMLNodeCollection)
    ['{C2633519-DED1-448D-9A3E-AFA7A3F0A6E4}']
    { Property Accessors }
    function Get_Pane(Index: Integer): IXMLPaneType_x;
    { Methods & Properties }
    function Add: IXMLPaneType_x;
    function Insert(const Index: Integer): IXMLPaneType_x;
    property Pane[Index: Integer]: IXMLPaneType_x read Get_Pane; default;
  end;

{ IXMLPaneType_x }

  IXMLPaneType_x = interface(IXMLNode)
    ['{10CD0929-7D82-4B3D-8FA4-4028C5217F89}']
    { Property Accessors }
    function Get_Number: Integer;
    function Get_ActiveRow: Integer;
    function Get_ActiveCol: Integer;
    function Get_RangeSelection: UnicodeString;
    function Get_Selection: IXMLSelectionType_x;
    procedure Set_Number(Value: Integer);
    procedure Set_ActiveRow(Value: Integer);
    procedure Set_ActiveCol(Value: Integer);
    procedure Set_RangeSelection(Value: UnicodeString);
    { Methods & Properties }
    property Number: Integer read Get_Number write Set_Number;
    property ActiveRow: Integer read Get_ActiveRow write Set_ActiveRow;
    property ActiveCol: Integer read Get_ActiveCol write Set_ActiveCol;
    property RangeSelection: UnicodeString read Get_RangeSelection write Set_RangeSelection;
    property Selection: IXMLSelectionType_x read Get_Selection;
  end;

{ IXMLSelectionType_x }

  IXMLSelectionType_x = interface(IXMLNode)
    ['{77CDC2C4-6136-4531-8B9B-A3CD3D78CBFF}']
    { Property Accessors }
    function Get_PTRule: IXMLPTRuleType_x;
    function Get_Pane: IXMLPaneType_x;
    function Get_NoToggleDataHeader: UnicodeString;
    procedure Set_NoToggleDataHeader(Value: UnicodeString);
    { Methods & Properties }
    property PTRule: IXMLPTRuleType_x read Get_PTRule;
    property Pane: IXMLPaneType_x read Get_Pane;
    property NoToggleDataHeader: UnicodeString read Get_NoToggleDataHeader write Set_NoToggleDataHeader;
  end;

{ IXMLPTRuleType_x }

  IXMLPTRuleType_x = interface(IXMLNode)
    ['{9CA50BCD-38FF-49E5-AEE6-3AE52665E68F}']
    { Property Accessors }
    function Get_RuleType: UnicodeString;
    function Get_Rule: UnicodeString;
    function Get_RuleV10: UnicodeString;
    function Get_ParseRuleAsV10: UnicodeString;
    function Get_Area: UnicodeString;
    function Get_Outline: UnicodeString;
    procedure Set_RuleType(Value: UnicodeString);
    procedure Set_Rule(Value: UnicodeString);
    procedure Set_RuleV10(Value: UnicodeString);
    procedure Set_ParseRuleAsV10(Value: UnicodeString);
    procedure Set_Area(Value: UnicodeString);
    procedure Set_Outline(Value: UnicodeString);
    { Methods & Properties }
    property RuleType: UnicodeString read Get_RuleType write Set_RuleType;
    property Rule: UnicodeString read Get_Rule write Set_Rule;
    property RuleV10: UnicodeString read Get_RuleV10 write Set_RuleV10;
    property ParseRuleAsV10: UnicodeString read Get_ParseRuleAsV10 write Set_ParseRuleAsV10;
    property Area: UnicodeString read Get_Area write Set_Area;
    property Outline: UnicodeString read Get_Outline write Set_Outline;
  end;

{ IXMLPTRuleType_xList }

  IXMLPTRuleType_xList = interface(IXMLNodeCollection)
    ['{310EA533-206B-4FB8-B283-7A89D00A7E62}']
    { Methods & Properties }
    function Add: IXMLPTRuleType_x;
    function Insert(const Index: Integer): IXMLPTRuleType_x;

    function Get_Item(Index: Integer): IXMLPTRuleType_x;
    property Items[Index: Integer]: IXMLPTRuleType_x read Get_Item; default;
  end;

{ IXMLWatches_x }

  IXMLWatches_x = interface(IXMLNodeCollection)
    ['{B25C0B77-B685-47A9-A7E2-70A7AE1BB7FB}']
    { Property Accessors }
    function Get_Watch(Index: Integer): IXMLWatch_x;
    { Methods & Properties }
    function Add: IXMLWatch_x;
    function Insert(const Index: Integer): IXMLWatch_x;
    property Watch[Index: Integer]: IXMLWatch_x read Get_Watch; default;
  end;

{ IXMLWatch_x }

  IXMLWatch_x = interface(IXMLNode)
    ['{5D2AE702-DAD1-4718-9B76-C82299740F27}']
    { Property Accessors }
    function Get_Source: UnicodeString;
    procedure Set_Source(Value: UnicodeString);
    { Methods & Properties }
    property Source: UnicodeString read Get_Source write Set_Source;
  end;

{ IXMLDataTable_x }

  IXMLDataTable_x = interface(IXMLNode)
    ['{EF2580BC-866F-45CE-8F50-779C80BAD993}']
    { Property Accessors }
    function Get_Range: UnicodeString;
    function Get_RowInputCell: UnicodeString;
    function Get_ColumnInputCell: UnicodeString;
    procedure Set_Range(Value: UnicodeString);
    procedure Set_RowInputCell(Value: UnicodeString);
    procedure Set_ColumnInputCell(Value: UnicodeString);
    { Methods & Properties }
    property Range: UnicodeString read Get_Range write Set_Range;
    property RowInputCell: UnicodeString read Get_RowInputCell write Set_RowInputCell;
    property ColumnInputCell: UnicodeString read Get_ColumnInputCell write Set_ColumnInputCell;
  end;

{ IXMLPageBreaksType_x }

  IXMLPageBreaksType_x = interface(IXMLNode)
    ['{4D39DB7C-AADE-4A5E-B10E-0EDA91AEB814}']
    { Property Accessors }
    function Get_ColBreaks: IXMLColBreaks_x;
    function Get_RowBreaks: IXMLRowBreaks_x;
    { Methods & Properties }
    property ColBreaks: IXMLColBreaks_x read Get_ColBreaks;
    property RowBreaks: IXMLRowBreaks_x read Get_RowBreaks;
  end;

{ IXMLColBreaks_x }

  IXMLColBreaks_x = interface(IXMLNodeCollection)
    ['{63132278-3E18-477D-B82F-2FB5315359B0}']
    { Property Accessors }
    function Get_ColBreak(Index: Integer): IXMLColBreak_x;
    { Methods & Properties }
    function Add: IXMLColBreak_x;
    function Insert(const Index: Integer): IXMLColBreak_x;
    property ColBreak[Index: Integer]: IXMLColBreak_x read Get_ColBreak; default;
  end;

{ IXMLColBreak_x }

  IXMLColBreak_x = interface(IXMLNode)
    ['{4CB2A8C1-C762-4209-A0E4-72FA5D2789D8}']
    { Property Accessors }
    function Get_Column: Integer;
    procedure Set_Column(Value: Integer);
    { Methods & Properties }
    property Column: Integer read Get_Column write Set_Column;
  end;

{ IXMLRowBreaks_x }

  IXMLRowBreaks_x = interface(IXMLNodeCollection)
    ['{00B188DE-A74E-4B15-9EAC-E90D8C179A80}']
    { Property Accessors }
    function Get_RowBreak(Index: Integer): IXMLRowBreak_x;
    { Methods & Properties }
    function Add: IXMLRowBreak_x;
    function Insert(const Index: Integer): IXMLRowBreak_x;
    property RowBreak[Index: Integer]: IXMLRowBreak_x read Get_RowBreak; default;
  end;

{ IXMLRowBreak_x }

  IXMLRowBreak_x = interface(IXMLNode)
    ['{FD11768A-1C31-46C2-958E-94333FD77DBB}']
    { Property Accessors }
    function Get_Row: IXMLRowType_x;
    { Methods & Properties }
    property Row: IXMLRowType_x read Get_Row;
  end;

{ IXMLPivotTableType_x }

  IXMLPivotTableType_x = interface(IXMLNode)
    ['{867E8EDC-9C07-4AE7-88FF-2264A8A6B496}']
    { Property Accessors }
    function Get_Name: UnicodeString;
    function Get_DataValueEditing: UnicodeString;
    function Get_QTSource: IXMLQTSourceType_x;
    function Get_ErrorString: UnicodeString;
    function Get_NullString: UnicodeString;
    function Get_PageFieldOrder: UnicodeString;
    function Get_PageFieldWrapCount: Integer;
    function Get_DisableDrillDown: UnicodeString;
    function Get_DisableFieldDialog: UnicodeString;
    function Get_DisableWizard: UnicodeString;
    function Get_DisplayErrorString: UnicodeString;
    function Get_NoPreserveFormatting: UnicodeString;
    function Get_HasNoAutoFormat: UnicodeString;
    function Get_SubtotalHiddenPageItems: UnicodeString;
    function Get_NoAutoFormatWidth: UnicodeString;
    function Get_NoRowGrand: UnicodeString;
    function Get_NoColumnGrand: UnicodeString;
    function Get_NoDisplayNullString: UnicodeString;
    function Get_NoPrintRepeatItems: UnicodeString;
    function Get_PivotView: IXMLPivotViewType_x;
    function Get_Selection: IXMLSelectionType_x;
    function Get_AutoFormatAlignment: UnicodeString;
    function Get_AutoFormatBorder: UnicodeString;
    function Get_AutoFormatFont: UnicodeString;
    function Get_AutoFormatName: UnicodeString;
    function Get_AutoFormatNumber: UnicodeString;
    function Get_AutoFormatPattern: UnicodeString;
    function Get_GrandTotalString: UnicodeString;
    function Get_PrintSetTitles: UnicodeString;
    function Get_MergeLabels: UnicodeString;
    function Get_PageFieldStyle: UnicodeString;
    function Get_PLExport: UnicodeString;
    function Get_ImmediateItemsOnDrop: UnicodeString;
    function Get_ShowPageMultipleItemLabel: UnicodeString;
    function Get_SmallGrid: UnicodeString;
    function Get_TableStyle: UnicodeString;
    function Get_Tag: UnicodeString;
    function Get_VacatedStyle: UnicodeString;
    function Get_HideTotalsAnnotation: UnicodeString;
    function Get_ShowCellBackgroundFromOLAP: UnicodeString;
    function Get_HideDropDowns: UnicodeString;
    function Get_NoViewCalculatedMembers: UnicodeString;
    function Get_VisualTotals: UnicodeString;
    function Get_Location: UnicodeString;
    function Get_PLPivotField: IXMLPLPivotFieldType_xList;
    function Get_PLTotal: IXMLPLTotalType_xList;
    function Get_DataMember: UnicodeString;
    function Get_DataAxisEmpty: UnicodeString;
    function Get_DisplayFieldList: UnicodeString;
    function Get_NoAutoFit: UnicodeString;
    function Get_Height: Double;
    function Get_Width: Double;
    function Get_MaxHeight: Double;
    function Get_MaxWidth: Double;
    function Get_MemberExpand: UnicodeString;
    function Get_ConnectionString: UnicodeString;
    function Get_CacheDetails: UnicodeString;
    function Get_FieldListTop: Integer;
    function Get_FieldListBottom: Integer;
    function Get_FieldListRight: Integer;
    function Get_FieldListLeft: Integer;
    function Get_PivotAxis: IXMLPivotAxisType_xList;
    function Get_VersionUpdateableMin: UnicodeString;
    function Get_VersionLastUpdate: UnicodeString;
    function Get_VersionRefreshableMin: UnicodeString;
    function Get_DefaultVersion: UnicodeString;
    function Get_PivotField: IXMLPivotFieldType_xList;
    function Get_CubeField: IXMLCubeFieldType_xList;
    function Get_CalculatedMember: IXMLCalculatedMember_x;
    function Get_PTLineItems: IXMLPTLineItemsType_xList;
    function Get_PTSource: IXMLPTSourceType_x;
    function Get_PTFormula: IXMLPTFormulaType_xList;
    function Get_PTFormat: IXMLPTFormatType_xList;
    procedure Set_Name(Value: UnicodeString);
    procedure Set_DataValueEditing(Value: UnicodeString);
    procedure Set_ErrorString(Value: UnicodeString);
    procedure Set_NullString(Value: UnicodeString);
    procedure Set_PageFieldOrder(Value: UnicodeString);
    procedure Set_PageFieldWrapCount(Value: Integer);
    procedure Set_DisableDrillDown(Value: UnicodeString);
    procedure Set_DisableFieldDialog(Value: UnicodeString);
    procedure Set_DisableWizard(Value: UnicodeString);
    procedure Set_DisplayErrorString(Value: UnicodeString);
    procedure Set_NoPreserveFormatting(Value: UnicodeString);
    procedure Set_HasNoAutoFormat(Value: UnicodeString);
    procedure Set_SubtotalHiddenPageItems(Value: UnicodeString);
    procedure Set_NoAutoFormatWidth(Value: UnicodeString);
    procedure Set_NoRowGrand(Value: UnicodeString);
    procedure Set_NoColumnGrand(Value: UnicodeString);
    procedure Set_NoDisplayNullString(Value: UnicodeString);
    procedure Set_NoPrintRepeatItems(Value: UnicodeString);
    procedure Set_AutoFormatAlignment(Value: UnicodeString);
    procedure Set_AutoFormatBorder(Value: UnicodeString);
    procedure Set_AutoFormatFont(Value: UnicodeString);
    procedure Set_AutoFormatName(Value: UnicodeString);
    procedure Set_AutoFormatNumber(Value: UnicodeString);
    procedure Set_AutoFormatPattern(Value: UnicodeString);
    procedure Set_GrandTotalString(Value: UnicodeString);
    procedure Set_PrintSetTitles(Value: UnicodeString);
    procedure Set_MergeLabels(Value: UnicodeString);
    procedure Set_PageFieldStyle(Value: UnicodeString);
    procedure Set_PLExport(Value: UnicodeString);
    procedure Set_ImmediateItemsOnDrop(Value: UnicodeString);
    procedure Set_ShowPageMultipleItemLabel(Value: UnicodeString);
    procedure Set_SmallGrid(Value: UnicodeString);
    procedure Set_TableStyle(Value: UnicodeString);
    procedure Set_Tag(Value: UnicodeString);
    procedure Set_VacatedStyle(Value: UnicodeString);
    procedure Set_HideTotalsAnnotation(Value: UnicodeString);
    procedure Set_ShowCellBackgroundFromOLAP(Value: UnicodeString);
    procedure Set_HideDropDowns(Value: UnicodeString);
    procedure Set_NoViewCalculatedMembers(Value: UnicodeString);
    procedure Set_VisualTotals(Value: UnicodeString);
    procedure Set_Location(Value: UnicodeString);
    procedure Set_DataMember(Value: UnicodeString);
    procedure Set_DataAxisEmpty(Value: UnicodeString);
    procedure Set_DisplayFieldList(Value: UnicodeString);
    procedure Set_NoAutoFit(Value: UnicodeString);
    procedure Set_Height(Value: Double);
    procedure Set_Width(Value: Double);
    procedure Set_MaxHeight(Value: Double);
    procedure Set_MaxWidth(Value: Double);
    procedure Set_MemberExpand(Value: UnicodeString);
    procedure Set_ConnectionString(Value: UnicodeString);
    procedure Set_CacheDetails(Value: UnicodeString);
    procedure Set_FieldListTop(Value: Integer);
    procedure Set_FieldListBottom(Value: Integer);
    procedure Set_FieldListRight(Value: Integer);
    procedure Set_FieldListLeft(Value: Integer);
    procedure Set_VersionUpdateableMin(Value: UnicodeString);
    procedure Set_VersionLastUpdate(Value: UnicodeString);
    procedure Set_VersionRefreshableMin(Value: UnicodeString);
    procedure Set_DefaultVersion(Value: UnicodeString);
    { Methods & Properties }
    property Name: UnicodeString read Get_Name write Set_Name;
    property DataValueEditing: UnicodeString read Get_DataValueEditing write Set_DataValueEditing;
    property QTSource: IXMLQTSourceType_x read Get_QTSource;
    property ErrorString: UnicodeString read Get_ErrorString write Set_ErrorString;
    property NullString: UnicodeString read Get_NullString write Set_NullString;
    property PageFieldOrder: UnicodeString read Get_PageFieldOrder write Set_PageFieldOrder;
    property PageFieldWrapCount: Integer read Get_PageFieldWrapCount write Set_PageFieldWrapCount;
    property DisableDrillDown: UnicodeString read Get_DisableDrillDown write Set_DisableDrillDown;
    property DisableFieldDialog: UnicodeString read Get_DisableFieldDialog write Set_DisableFieldDialog;
    property DisableWizard: UnicodeString read Get_DisableWizard write Set_DisableWizard;
    property DisplayErrorString: UnicodeString read Get_DisplayErrorString write Set_DisplayErrorString;
    property NoPreserveFormatting: UnicodeString read Get_NoPreserveFormatting write Set_NoPreserveFormatting;
    property HasNoAutoFormat: UnicodeString read Get_HasNoAutoFormat write Set_HasNoAutoFormat;
    property SubtotalHiddenPageItems: UnicodeString read Get_SubtotalHiddenPageItems write Set_SubtotalHiddenPageItems;
    property NoAutoFormatWidth: UnicodeString read Get_NoAutoFormatWidth write Set_NoAutoFormatWidth;
    property NoRowGrand: UnicodeString read Get_NoRowGrand write Set_NoRowGrand;
    property NoColumnGrand: UnicodeString read Get_NoColumnGrand write Set_NoColumnGrand;
    property NoDisplayNullString: UnicodeString read Get_NoDisplayNullString write Set_NoDisplayNullString;
    property NoPrintRepeatItems: UnicodeString read Get_NoPrintRepeatItems write Set_NoPrintRepeatItems;
    property PivotView: IXMLPivotViewType_x read Get_PivotView;
    property Selection: IXMLSelectionType_x read Get_Selection;
    property AutoFormatAlignment: UnicodeString read Get_AutoFormatAlignment write Set_AutoFormatAlignment;
    property AutoFormatBorder: UnicodeString read Get_AutoFormatBorder write Set_AutoFormatBorder;
    property AutoFormatFont: UnicodeString read Get_AutoFormatFont write Set_AutoFormatFont;
    property AutoFormatName: UnicodeString read Get_AutoFormatName write Set_AutoFormatName;
    property AutoFormatNumber: UnicodeString read Get_AutoFormatNumber write Set_AutoFormatNumber;
    property AutoFormatPattern: UnicodeString read Get_AutoFormatPattern write Set_AutoFormatPattern;
    property GrandTotalString: UnicodeString read Get_GrandTotalString write Set_GrandTotalString;
    property PrintSetTitles: UnicodeString read Get_PrintSetTitles write Set_PrintSetTitles;
    property MergeLabels: UnicodeString read Get_MergeLabels write Set_MergeLabels;
    property PageFieldStyle: UnicodeString read Get_PageFieldStyle write Set_PageFieldStyle;
    property PLExport: UnicodeString read Get_PLExport write Set_PLExport;
    property ImmediateItemsOnDrop: UnicodeString read Get_ImmediateItemsOnDrop write Set_ImmediateItemsOnDrop;
    property ShowPageMultipleItemLabel: UnicodeString read Get_ShowPageMultipleItemLabel write Set_ShowPageMultipleItemLabel;
    property SmallGrid: UnicodeString read Get_SmallGrid write Set_SmallGrid;
    property TableStyle: UnicodeString read Get_TableStyle write Set_TableStyle;
    property Tag: UnicodeString read Get_Tag write Set_Tag;
    property VacatedStyle: UnicodeString read Get_VacatedStyle write Set_VacatedStyle;
    property HideTotalsAnnotation: UnicodeString read Get_HideTotalsAnnotation write Set_HideTotalsAnnotation;
    property ShowCellBackgroundFromOLAP: UnicodeString read Get_ShowCellBackgroundFromOLAP write Set_ShowCellBackgroundFromOLAP;
    property HideDropDowns: UnicodeString read Get_HideDropDowns write Set_HideDropDowns;
    property NoViewCalculatedMembers: UnicodeString read Get_NoViewCalculatedMembers write Set_NoViewCalculatedMembers;
    property VisualTotals: UnicodeString read Get_VisualTotals write Set_VisualTotals;
    property Location: UnicodeString read Get_Location write Set_Location;
    property PLPivotField: IXMLPLPivotFieldType_xList read Get_PLPivotField;
    property PLTotal: IXMLPLTotalType_xList read Get_PLTotal;
    property DataMember: UnicodeString read Get_DataMember write Set_DataMember;
    property DataAxisEmpty: UnicodeString read Get_DataAxisEmpty write Set_DataAxisEmpty;
    property DisplayFieldList: UnicodeString read Get_DisplayFieldList write Set_DisplayFieldList;
    property NoAutoFit: UnicodeString read Get_NoAutoFit write Set_NoAutoFit;
    property Height: Double read Get_Height write Set_Height;
    property Width: Double read Get_Width write Set_Width;
    property MaxHeight: Double read Get_MaxHeight write Set_MaxHeight;
    property MaxWidth: Double read Get_MaxWidth write Set_MaxWidth;
    property MemberExpand: UnicodeString read Get_MemberExpand write Set_MemberExpand;
    property ConnectionString: UnicodeString read Get_ConnectionString write Set_ConnectionString;
    property CacheDetails: UnicodeString read Get_CacheDetails write Set_CacheDetails;
    property FieldListTop: Integer read Get_FieldListTop write Set_FieldListTop;
    property FieldListBottom: Integer read Get_FieldListBottom write Set_FieldListBottom;
    property FieldListRight: Integer read Get_FieldListRight write Set_FieldListRight;
    property FieldListLeft: Integer read Get_FieldListLeft write Set_FieldListLeft;
    property PivotAxis: IXMLPivotAxisType_xList read Get_PivotAxis;
    property VersionUpdateableMin: UnicodeString read Get_VersionUpdateableMin write Set_VersionUpdateableMin;
    property VersionLastUpdate: UnicodeString read Get_VersionLastUpdate write Set_VersionLastUpdate;
    property VersionRefreshableMin: UnicodeString read Get_VersionRefreshableMin write Set_VersionRefreshableMin;
    property DefaultVersion: UnicodeString read Get_DefaultVersion write Set_DefaultVersion;
    property PivotField: IXMLPivotFieldType_xList read Get_PivotField;
    property CubeField: IXMLCubeFieldType_xList read Get_CubeField;
    property CalculatedMember: IXMLCalculatedMember_x read Get_CalculatedMember;
    property PTLineItems: IXMLPTLineItemsType_xList read Get_PTLineItems;
    property PTSource: IXMLPTSourceType_x read Get_PTSource;
    property PTFormula: IXMLPTFormulaType_xList read Get_PTFormula;
    property PTFormat: IXMLPTFormatType_xList read Get_PTFormat;
  end;

{ IXMLPivotTableType_xList }

  IXMLPivotTableType_xList = interface(IXMLNodeCollection)
    ['{E8B38D00-8606-4593-A00D-E9A74CCF80EE}']
    { Methods & Properties }
    function Add: IXMLPivotTableType_x;
    function Insert(const Index: Integer): IXMLPivotTableType_x;

    function Get_Item(Index: Integer): IXMLPivotTableType_x;
    property Items[Index: Integer]: IXMLPivotTableType_x read Get_Item; default;
  end;

{ IXMLQTSourceType_x }

  IXMLQTSourceType_x = interface(IXMLNode)
    ['{5DE2EBD1-1919-4149-AA6E-6CF6ECAAC767}']
    { Property Accessors }
    function Get_DataMember: UnicodeString;
    function Get_CacheFile: IXMLCacheFile_x;
    function Get_QuerySource: IXMLQTQuerySourceType_x;
    function Get_CacheIndex: Integer;
    procedure Set_DataMember(Value: UnicodeString);
    procedure Set_CacheIndex(Value: Integer);
    { Methods & Properties }
    property DataMember: UnicodeString read Get_DataMember write Set_DataMember;
    property CacheFile: IXMLCacheFile_x read Get_CacheFile;
    property QuerySource: IXMLQTQuerySourceType_x read Get_QuerySource;
    property CacheIndex: Integer read Get_CacheIndex write Set_CacheIndex;
  end;

{ IXMLCacheFile_x }

  IXMLCacheFile_x = interface(IXMLNode)
    ['{916290F7-C912-4F23-A968-716A31518A74}']
    { Property Accessors }
    function Get_Href: UnicodeString;
    procedure Set_Href(Value: UnicodeString);
    { Methods & Properties }
    property Href: UnicodeString read Get_Href write Set_Href;
  end;

{ IXMLQTQuerySourceType_x }

  IXMLQTQuerySourceType_x = interface(IXMLNode)
    ['{384BE911-DBF9-4461-966F-9ED0E29E1F17}']
    { Property Accessors }
    function Get_QueryType: UnicodeString;
    function Get_CommandText: IXMLString_List;
    function Get_CommandType: UnicodeString;
    function Get_Maintain: UnicodeString;
    function Get_Connection: IXMLString_List;
    function Get_DoNotJoinDelimiters: UnicodeString;
    function Get_NoTextToColumns: UnicodeString;
    function Get_DisableDateRecognition: UnicodeString;
    function Get_EnableRedirections: UnicodeString;
    function Get_EditWebPage: IXMLEditWebPage_x;
    function Get_RefreshedInXl9: UnicodeString;
    function Get_EntirePage: UnicodeString;
    function Get_HTMLFormat: UnicodeString;
    function Get_URLString: IXMLURLString_x;
    function Get_WebPostString: UnicodeString;
    function Get_RefreshInfo: IXMLRefreshInfoType_x;
    function Get_TextWizardSettings: IXMLTextWizardSettingsType_x;
    function Get_HTMLTables: IXMLHTMLTablesType_x;
    function Get_UseSameSettings: UnicodeString;
    function Get_Query97: UnicodeString;
    function Get_DoNotPromptForFile: UnicodeString;
    function Get_LocalConnection: UnicodeString;
    function Get_SourceConnectionFile: UnicodeString;
    function Get_SourceDataFile: IXMLString_List;
    function Get_RobustConnect: UnicodeString;
    function Get_RefreshTimeSpan: Integer;
    function Get_VersionLastEdit: Integer;
    function Get_VersionLastRefresh: Integer;
    function Get_VersionRefreshableMin: Integer;
    function Get_Parameter: IXMLParameterTypeE_xList;
    procedure Set_QueryType(Value: UnicodeString);
    procedure Set_CommandType(Value: UnicodeString);
    procedure Set_Maintain(Value: UnicodeString);
    procedure Set_DoNotJoinDelimiters(Value: UnicodeString);
    procedure Set_NoTextToColumns(Value: UnicodeString);
    procedure Set_DisableDateRecognition(Value: UnicodeString);
    procedure Set_EnableRedirections(Value: UnicodeString);
    procedure Set_RefreshedInXl9(Value: UnicodeString);
    procedure Set_EntirePage(Value: UnicodeString);
    procedure Set_HTMLFormat(Value: UnicodeString);
    procedure Set_WebPostString(Value: UnicodeString);
    procedure Set_UseSameSettings(Value: UnicodeString);
    procedure Set_Query97(Value: UnicodeString);
    procedure Set_DoNotPromptForFile(Value: UnicodeString);
    procedure Set_LocalConnection(Value: UnicodeString);
    procedure Set_SourceConnectionFile(Value: UnicodeString);
    procedure Set_RobustConnect(Value: UnicodeString);
    procedure Set_RefreshTimeSpan(Value: Integer);
    procedure Set_VersionLastEdit(Value: Integer);
    procedure Set_VersionLastRefresh(Value: Integer);
    procedure Set_VersionRefreshableMin(Value: Integer);
    { Methods & Properties }
    property QueryType: UnicodeString read Get_QueryType write Set_QueryType;
    property CommandText: IXMLString_List read Get_CommandText;
    property CommandType: UnicodeString read Get_CommandType write Set_CommandType;
    property Maintain: UnicodeString read Get_Maintain write Set_Maintain;
    property Connection: IXMLString_List read Get_Connection;
    property DoNotJoinDelimiters: UnicodeString read Get_DoNotJoinDelimiters write Set_DoNotJoinDelimiters;
    property NoTextToColumns: UnicodeString read Get_NoTextToColumns write Set_NoTextToColumns;
    property DisableDateRecognition: UnicodeString read Get_DisableDateRecognition write Set_DisableDateRecognition;
    property EnableRedirections: UnicodeString read Get_EnableRedirections write Set_EnableRedirections;
    property EditWebPage: IXMLEditWebPage_x read Get_EditWebPage;
    property RefreshedInXl9: UnicodeString read Get_RefreshedInXl9 write Set_RefreshedInXl9;
    property EntirePage: UnicodeString read Get_EntirePage write Set_EntirePage;
    property HTMLFormat: UnicodeString read Get_HTMLFormat write Set_HTMLFormat;
    property URLString: IXMLURLString_x read Get_URLString;
    property WebPostString: UnicodeString read Get_WebPostString write Set_WebPostString;
    property RefreshInfo: IXMLRefreshInfoType_x read Get_RefreshInfo;
    property TextWizardSettings: IXMLTextWizardSettingsType_x read Get_TextWizardSettings;
    property HTMLTables: IXMLHTMLTablesType_x read Get_HTMLTables;
    property UseSameSettings: UnicodeString read Get_UseSameSettings write Set_UseSameSettings;
    property Query97: UnicodeString read Get_Query97 write Set_Query97;
    property DoNotPromptForFile: UnicodeString read Get_DoNotPromptForFile write Set_DoNotPromptForFile;
    property LocalConnection: UnicodeString read Get_LocalConnection write Set_LocalConnection;
    property SourceConnectionFile: UnicodeString read Get_SourceConnectionFile write Set_SourceConnectionFile;
    property SourceDataFile: IXMLString_List read Get_SourceDataFile;
    property RobustConnect: UnicodeString read Get_RobustConnect write Set_RobustConnect;
    property RefreshTimeSpan: Integer read Get_RefreshTimeSpan write Set_RefreshTimeSpan;
    property VersionLastEdit: Integer read Get_VersionLastEdit write Set_VersionLastEdit;
    property VersionLastRefresh: Integer read Get_VersionLastRefresh write Set_VersionLastRefresh;
    property VersionRefreshableMin: Integer read Get_VersionRefreshableMin write Set_VersionRefreshableMin;
    property Parameter: IXMLParameterTypeE_xList read Get_Parameter;
  end;

{ IXMLEditWebPage_x }

  IXMLEditWebPage_x = interface(IXMLNode)
    ['{75626AB6-5EA4-4447-A46F-9D937640A9AE}']
    { Property Accessors }
    function Get_HRef: UnicodeString;
    procedure Set_HRef(Value: UnicodeString);
    { Methods & Properties }
    property HRef: UnicodeString read Get_HRef write Set_HRef;
  end;

{ IXMLURLString_x }

  IXMLURLString_x = interface(IXMLNode)
    ['{9466A0B9-7FF2-486B-A214-C8AF70EF3167}']
    { Property Accessors }
    function Get_HRef: UnicodeString;
    procedure Set_HRef(Value: UnicodeString);
    { Methods & Properties }
    property HRef: UnicodeString read Get_HRef write Set_HRef;
  end;

{ IXMLRefreshInfoType_x }

  IXMLRefreshInfoType_x = interface(IXMLNode)
    ['{609C3898-1D75-4DCE-A538-DAE6C9DC8795}']
    { Property Accessors }
    function Get_NextId: Integer;
    function Get_ColumnInfo: IXMLColumnInfoType_xList;
    function Get_DoNotPersist: UnicodeString;
    function Get_DoNotPersistSort: UnicodeString;
    function Get_DoNotPersstAF: UnicodeString;
    function Get_Sort: UnicodeString;
    function Get_CaseSensitive: UnicodeString;
    function Get_FuturePersist: UnicodeString;
    function Get_HeaderRow: UnicodeString;
    function Get_IdWrapped: UnicodeString;
    function Get_NoTitles: UnicodeString;
    function Get_AlertVersion: Integer;
    function Get_SortOrder: Integer;
    function Get_ExtraLeftColumns: Integer;
    function Get_ExtraRightColumns: Integer;
    function Get_DeletedTitle: IXMLString_List;
    procedure Set_NextId(Value: Integer);
    procedure Set_DoNotPersist(Value: UnicodeString);
    procedure Set_DoNotPersistSort(Value: UnicodeString);
    procedure Set_DoNotPersstAF(Value: UnicodeString);
    procedure Set_Sort(Value: UnicodeString);
    procedure Set_CaseSensitive(Value: UnicodeString);
    procedure Set_FuturePersist(Value: UnicodeString);
    procedure Set_HeaderRow(Value: UnicodeString);
    procedure Set_IdWrapped(Value: UnicodeString);
    procedure Set_NoTitles(Value: UnicodeString);
    procedure Set_AlertVersion(Value: Integer);
    procedure Set_SortOrder(Value: Integer);
    procedure Set_ExtraLeftColumns(Value: Integer);
    procedure Set_ExtraRightColumns(Value: Integer);
    { Methods & Properties }
    property NextId: Integer read Get_NextId write Set_NextId;
    property ColumnInfo: IXMLColumnInfoType_xList read Get_ColumnInfo;
    property DoNotPersist: UnicodeString read Get_DoNotPersist write Set_DoNotPersist;
    property DoNotPersistSort: UnicodeString read Get_DoNotPersistSort write Set_DoNotPersistSort;
    property DoNotPersstAF: UnicodeString read Get_DoNotPersstAF write Set_DoNotPersstAF;
    property Sort: UnicodeString read Get_Sort write Set_Sort;
    property CaseSensitive: UnicodeString read Get_CaseSensitive write Set_CaseSensitive;
    property FuturePersist: UnicodeString read Get_FuturePersist write Set_FuturePersist;
    property HeaderRow: UnicodeString read Get_HeaderRow write Set_HeaderRow;
    property IdWrapped: UnicodeString read Get_IdWrapped write Set_IdWrapped;
    property NoTitles: UnicodeString read Get_NoTitles write Set_NoTitles;
    property AlertVersion: Integer read Get_AlertVersion write Set_AlertVersion;
    property SortOrder: Integer read Get_SortOrder write Set_SortOrder;
    property ExtraLeftColumns: Integer read Get_ExtraLeftColumns write Set_ExtraLeftColumns;
    property ExtraRightColumns: Integer read Get_ExtraRightColumns write Set_ExtraRightColumns;
    property DeletedTitle: IXMLString_List read Get_DeletedTitle;
  end;

{ IXMLColumnInfoType_x }

  IXMLColumnInfoType_x = interface(IXMLNode)
    ['{183274B9-718C-41D1-8869-ABD4D12F2427}']
    { Property Accessors }
    function Get_Id: Int64;
    function Get_Clipped: UnicodeString;
    function Get_Descending: UnicodeString;
    function Get_FillDown: UnicodeString;
    function Get_Name: IXMLName_x;
    function Get_RowNumbers: UnicodeString;
    function Get_SortKey: Integer;
    function Get_User: UnicodeString;
    procedure Set_Id(Value: Int64);
    procedure Set_Clipped(Value: UnicodeString);
    procedure Set_Descending(Value: UnicodeString);
    procedure Set_FillDown(Value: UnicodeString);
    procedure Set_RowNumbers(Value: UnicodeString);
    procedure Set_SortKey(Value: Integer);
    procedure Set_User(Value: UnicodeString);
    { Methods & Properties }
    property Id: Int64 read Get_Id write Set_Id;
    property Clipped: UnicodeString read Get_Clipped write Set_Clipped;
    property Descending: UnicodeString read Get_Descending write Set_Descending;
    property FillDown: UnicodeString read Get_FillDown write Set_FillDown;
    property Name: IXMLName_x read Get_Name;
    property RowNumbers: UnicodeString read Get_RowNumbers write Set_RowNumbers;
    property SortKey: Integer read Get_SortKey write Set_SortKey;
    property User: UnicodeString read Get_User write Set_User;
  end;

{ IXMLColumnInfoType_xList }

  IXMLColumnInfoType_xList = interface(IXMLNodeCollection)
    ['{78EFDDED-0CE2-4A05-B038-CA9EA90971E1}']
    { Methods & Properties }
    function Add: IXMLColumnInfoType_x;
    function Insert(const Index: Integer): IXMLColumnInfoType_x;

    function Get_Item(Index: Integer): IXMLColumnInfoType_x;
    property Items[Index: Integer]: IXMLColumnInfoType_x read Get_Item; default;
  end;

{ IXMLName_x }

  IXMLName_x = interface(IXMLNode)
    ['{A9878FA1-775A-48D9-9373-B0EE0099D47F}']
    { Property Accessors }
    function Get_Href: UnicodeString;
    procedure Set_Href(Value: UnicodeString);
    { Methods & Properties }
    property Href: UnicodeString read Get_Href write Set_Href;
  end;

{ IXMLTextWizardSettingsType_x }

  IXMLTextWizardSettingsType_x = interface(IXMLNode)
    ['{2E849F2F-CBDF-4E0C-B18F-798537433811}']
    { Property Accessors }
    function Get_FormatSettings: IXMLFormatSettingsType_x;
    function Get_Delimiters: IXMLDelimiters_x;
    function Get_Name: UnicodeString;
    function Get_Source: UnicodeString;
    function Get_StartRow: Integer;
    function Get_Decimal: UnicodeString;
    function Get_ThousandSeparator: UnicodeString;
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Source(Value: UnicodeString);
    procedure Set_StartRow(Value: Integer);
    procedure Set_Decimal(Value: UnicodeString);
    procedure Set_ThousandSeparator(Value: UnicodeString);
    { Methods & Properties }
    property FormatSettings: IXMLFormatSettingsType_x read Get_FormatSettings;
    property Delimiters: IXMLDelimiters_x read Get_Delimiters;
    property Name: UnicodeString read Get_Name write Set_Name;
    property Source: UnicodeString read Get_Source write Set_Source;
    property StartRow: Integer read Get_StartRow write Set_StartRow;
    property Decimal: UnicodeString read Get_Decimal write Set_Decimal;
    property ThousandSeparator: UnicodeString read Get_ThousandSeparator write Set_ThousandSeparator;
  end;

{ IXMLFormatSettingsType_x }

  IXMLFormatSettingsType_x = interface(IXMLNode)
    ['{A2EA0FD7-531F-48AB-8F06-185E77CB5D83}']
    { Property Accessors }
    function Get_FieldType: UnicodeString;
    function Get_FieldStart: Integer;
    procedure Set_FieldType(Value: UnicodeString);
    procedure Set_FieldStart(Value: Integer);
    { Methods & Properties }
    property FieldType: UnicodeString read Get_FieldType write Set_FieldType;
    property FieldStart: Integer read Get_FieldStart write Set_FieldStart;
  end;

{ IXMLDelimiters_x }

  IXMLDelimiters_x = interface(IXMLNode)
    ['{D1E7F2A2-A367-44BE-843D-D0B8388E124C}']
    { Property Accessors }
    function Get_Comma: UnicodeString;
    function Get_Consecutive: UnicodeString;
    function Get_Custom: UnicodeString;
    function Get_SemiColon: UnicodeString;
    function Get_Space: UnicodeString;
    function Get_Tab: UnicodeString;
    function Get_TextQualifier: UnicodeString;
    procedure Set_Comma(Value: UnicodeString);
    procedure Set_Consecutive(Value: UnicodeString);
    procedure Set_Custom(Value: UnicodeString);
    procedure Set_SemiColon(Value: UnicodeString);
    procedure Set_Space(Value: UnicodeString);
    procedure Set_Tab(Value: UnicodeString);
    procedure Set_TextQualifier(Value: UnicodeString);
    { Methods & Properties }
    property Comma: UnicodeString read Get_Comma write Set_Comma;
    property Consecutive: UnicodeString read Get_Consecutive write Set_Consecutive;
    property Custom: UnicodeString read Get_Custom write Set_Custom;
    property SemiColon: UnicodeString read Get_SemiColon write Set_SemiColon;
    property Space: UnicodeString read Get_Space write Set_Space;
    property Tab: UnicodeString read Get_Tab write Set_Tab;
    property TextQualifier: UnicodeString read Get_TextQualifier write Set_TextQualifier;
  end;

{ IXMLHTMLTablesType_x }

  IXMLHTMLTablesType_x = interface(IXMLNode)
    ['{43E00BD4-B197-47D6-BB85-CA7D739E425C}']
    { Property Accessors }
    function Get_Number: IXMLIntegerList;
    function Get_Text: IXMLString_List;
    function Get_Missing: IXMLString_List;
    { Methods & Properties }
    property Number: IXMLIntegerList read Get_Number;
    property Text: IXMLString_List read Get_Text;
    property Missing: IXMLString_List read Get_Missing;
  end;

{ IXMLParameterTypeE_x }

  IXMLParameterTypeE_x = interface(IXMLNode)
    ['{691BEEAC-1017-4370-865B-47317A3AB97C}']
    { Property Accessors }
    function Get_ExcelType: UnicodeString;
    function Get_Formula: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_ParameterType: UnicodeString;
    function Get_ParameterValue: UnicodeString;
    function Get_PromptString: UnicodeString;
    function Get_NonDefaultName: UnicodeString;
    function Get_SQLType: UnicodeString;
    function Get_RefreshOnChange: UnicodeString;
    procedure Set_ExcelType(Value: UnicodeString);
    procedure Set_Formula(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
    procedure Set_ParameterType(Value: UnicodeString);
    procedure Set_ParameterValue(Value: UnicodeString);
    procedure Set_PromptString(Value: UnicodeString);
    procedure Set_NonDefaultName(Value: UnicodeString);
    procedure Set_SQLType(Value: UnicodeString);
    procedure Set_RefreshOnChange(Value: UnicodeString);
    { Methods & Properties }
    property ExcelType: UnicodeString read Get_ExcelType write Set_ExcelType;
    property Formula: UnicodeString read Get_Formula write Set_Formula;
    property Name: UnicodeString read Get_Name write Set_Name;
    property ParameterType: UnicodeString read Get_ParameterType write Set_ParameterType;
    property ParameterValue: UnicodeString read Get_ParameterValue write Set_ParameterValue;
    property PromptString: UnicodeString read Get_PromptString write Set_PromptString;
    property NonDefaultName: UnicodeString read Get_NonDefaultName write Set_NonDefaultName;
    property SQLType: UnicodeString read Get_SQLType write Set_SQLType;
    property RefreshOnChange: UnicodeString read Get_RefreshOnChange write Set_RefreshOnChange;
  end;

{ IXMLParameterTypeE_xList }

  IXMLParameterTypeE_xList = interface(IXMLNodeCollection)
    ['{367DBFBB-CF7C-4D27-98DF-465103FD4420}']
    { Methods & Properties }
    function Add: IXMLParameterTypeE_x;
    function Insert(const Index: Integer): IXMLParameterTypeE_x;

    function Get_Item(Index: Integer): IXMLParameterTypeE_x;
    property Items[Index: Integer]: IXMLParameterTypeE_x read Get_Item; default;
  end;

{ IXMLPivotViewType_x }

  IXMLPivotViewType_x = interface(IXMLNode)
    ['{00B351B1-2C69-4E70-9274-240616C437ED}']
    { Property Accessors }
    function Get_IsNotFiltered: UnicodeString;
    function Get_TotalAllMembers: UnicodeString;
    function Get_DetailMaxHeight: Integer;
    function Get_DetailMaxWidth: Integer;
    function Get_NoDetailAutoFit: UnicodeString;
    function Get_DetailRowHeight: Integer;
    function Get_DetailWidth: Integer;
    function Get_TotalFormat: IXMLTotalFormat_x;
    function Get_MemberFormat: IXMLMemberFormat_x;
    function Get_FieldLabelFormat: IXMLFieldLabelFormat_x;
    function Get_DetailSortOrder: IXMLString_List;
    function Get_CellsExpanded: UnicodeString;
    function Get_CellsNotExpanded: UnicodeString;
    function Get_CellsExpandedSeqNum: Integer;
    function Get_Label_: IXMLLabel__xList;
    procedure Set_IsNotFiltered(Value: UnicodeString);
    procedure Set_TotalAllMembers(Value: UnicodeString);
    procedure Set_DetailMaxHeight(Value: Integer);
    procedure Set_DetailMaxWidth(Value: Integer);
    procedure Set_NoDetailAutoFit(Value: UnicodeString);
    procedure Set_DetailRowHeight(Value: Integer);
    procedure Set_DetailWidth(Value: Integer);
    procedure Set_CellsExpanded(Value: UnicodeString);
    procedure Set_CellsNotExpanded(Value: UnicodeString);
    procedure Set_CellsExpandedSeqNum(Value: Integer);
    { Methods & Properties }
    property IsNotFiltered: UnicodeString read Get_IsNotFiltered write Set_IsNotFiltered;
    property TotalAllMembers: UnicodeString read Get_TotalAllMembers write Set_TotalAllMembers;
    property DetailMaxHeight: Integer read Get_DetailMaxHeight write Set_DetailMaxHeight;
    property DetailMaxWidth: Integer read Get_DetailMaxWidth write Set_DetailMaxWidth;
    property NoDetailAutoFit: UnicodeString read Get_NoDetailAutoFit write Set_NoDetailAutoFit;
    property DetailRowHeight: Integer read Get_DetailRowHeight write Set_DetailRowHeight;
    property DetailWidth: Integer read Get_DetailWidth write Set_DetailWidth;
    property TotalFormat: IXMLTotalFormat_x read Get_TotalFormat;
    property MemberFormat: IXMLMemberFormat_x read Get_MemberFormat;
    property FieldLabelFormat: IXMLFieldLabelFormat_x read Get_FieldLabelFormat;
    property DetailSortOrder: IXMLString_List read Get_DetailSortOrder;
    property CellsExpanded: UnicodeString read Get_CellsExpanded write Set_CellsExpanded;
    property CellsNotExpanded: UnicodeString read Get_CellsNotExpanded write Set_CellsNotExpanded;
    property CellsExpandedSeqNum: Integer read Get_CellsExpandedSeqNum write Set_CellsExpandedSeqNum;
    property Label_: IXMLLabel__xList read Get_Label_;
  end;

{ IXMLTotalFormat_x }

  IXMLTotalFormat_x = interface(IXMLNode)
    ['{937DD6EF-6D39-4A2F-A25F-B6762B3D63FF}']
    { Property Accessors }
    function Get_Style: UnicodeString;
    procedure Set_Style(Value: UnicodeString);
    { Methods & Properties }
    property Style: UnicodeString read Get_Style write Set_Style;
  end;

{ IXMLMemberFormat_x }

  IXMLMemberFormat_x = interface(IXMLNode)
    ['{DB7E0911-DE20-4924-B137-AA531C95C397}']
    { Property Accessors }
    function Get_Style: UnicodeString;
    procedure Set_Style(Value: UnicodeString);
    { Methods & Properties }
    property Style: UnicodeString read Get_Style write Set_Style;
  end;

{ IXMLFieldLabelFormat_x }

  IXMLFieldLabelFormat_x = interface(IXMLNode)
    ['{939B9161-88AD-42E8-A521-C1B45AB94D58}']
    { Property Accessors }
    function Get_Style: UnicodeString;
    procedure Set_Style(Value: UnicodeString);
    { Methods & Properties }
    property Style: UnicodeString read Get_Style write Set_Style;
  end;

{ IXMLLabel__x }

  IXMLLabel__x = interface(IXMLNode)
    ['{DCFD8D5B-584F-4B44-A865-CD1D3372FF4D}']
    { Property Accessors }
    function Get_Style: UnicodeString;
    procedure Set_Style(Value: UnicodeString);
    { Methods & Properties }
    property Style: UnicodeString read Get_Style write Set_Style;
  end;

{ IXMLLabel__xList }

  IXMLLabel__xList = interface(IXMLNodeCollection)
    ['{112667B3-94F4-4234-93C7-C171B293755A}']
    { Methods & Properties }
    function Add: IXMLLabel__x;
    function Insert(const Index: Integer): IXMLLabel__x;

    function Get_Item(Index: Integer): IXMLLabel__x;
    property Items[Index: Integer]: IXMLLabel__x read Get_Item; default;
  end;

{ IXMLPLPivotFieldType_x }

  IXMLPLPivotFieldType_x = interface(IXMLNode)
    ['{B8F5475A-3BEE-4CD0-A51C-7C5AE437712F}']
    { Property Accessors }
    function Get_Name: UnicodeString;
    function Get_SourceName: UnicodeString;
    function Get_BoundField: UnicodeString;
    function Get_DataType: UnicodeString;
    function Get_FilterCaption: UnicodeString;
    function Get_PLDataOrientation: Integer;
    function Get_PLPosition: UnicodeString;
    function Get_Orientation: UnicodeString;
    function Get_Position: UnicodeString;
    function Get_ShowAllItems: UnicodeString;
    function Get_NumberFormat: UnicodeString;
    function Get_CurrentPage: UnicodeString;
    function Get_Caption: UnicodeString;
    function Get_NewItemsHidden: UnicodeString;
    function Get_Subtotal: UnicodeString;
    function Get_PLSubtotal: Double;
    function Get_DetailFormat: IXMLDetailFormat_x;
    function Get_SubtotalFormat: IXMLSubtotalFormat_x;
    function Get_DetailWidth: Integer;
    function Get_GroupedWidth: Integer;
    function Get_Expanded: UnicodeString;
    function Get_TotalWidth: Integer;
    function Get_PivotItem: IXMLPivotItemType_xList;
    procedure Set_Name(Value: UnicodeString);
    procedure Set_SourceName(Value: UnicodeString);
    procedure Set_BoundField(Value: UnicodeString);
    procedure Set_DataType(Value: UnicodeString);
    procedure Set_FilterCaption(Value: UnicodeString);
    procedure Set_PLDataOrientation(Value: Integer);
    procedure Set_PLPosition(Value: UnicodeString);
    procedure Set_Orientation(Value: UnicodeString);
    procedure Set_Position(Value: UnicodeString);
    procedure Set_ShowAllItems(Value: UnicodeString);
    procedure Set_NumberFormat(Value: UnicodeString);
    procedure Set_CurrentPage(Value: UnicodeString);
    procedure Set_Caption(Value: UnicodeString);
    procedure Set_NewItemsHidden(Value: UnicodeString);
    procedure Set_Subtotal(Value: UnicodeString);
    procedure Set_PLSubtotal(Value: Double);
    procedure Set_DetailWidth(Value: Integer);
    procedure Set_GroupedWidth(Value: Integer);
    procedure Set_Expanded(Value: UnicodeString);
    procedure Set_TotalWidth(Value: Integer);
    { Methods & Properties }
    property Name: UnicodeString read Get_Name write Set_Name;
    property SourceName: UnicodeString read Get_SourceName write Set_SourceName;
    property BoundField: UnicodeString read Get_BoundField write Set_BoundField;
    property DataType: UnicodeString read Get_DataType write Set_DataType;
    property FilterCaption: UnicodeString read Get_FilterCaption write Set_FilterCaption;
    property PLDataOrientation: Integer read Get_PLDataOrientation write Set_PLDataOrientation;
    property PLPosition: UnicodeString read Get_PLPosition write Set_PLPosition;
    property Orientation: UnicodeString read Get_Orientation write Set_Orientation;
    property Position: UnicodeString read Get_Position write Set_Position;
    property ShowAllItems: UnicodeString read Get_ShowAllItems write Set_ShowAllItems;
    property NumberFormat: UnicodeString read Get_NumberFormat write Set_NumberFormat;
    property CurrentPage: UnicodeString read Get_CurrentPage write Set_CurrentPage;
    property Caption: UnicodeString read Get_Caption write Set_Caption;
    property NewItemsHidden: UnicodeString read Get_NewItemsHidden write Set_NewItemsHidden;
    property Subtotal: UnicodeString read Get_Subtotal write Set_Subtotal;
    property PLSubtotal: Double read Get_PLSubtotal write Set_PLSubtotal;
    property DetailFormat: IXMLDetailFormat_x read Get_DetailFormat;
    property SubtotalFormat: IXMLSubtotalFormat_x read Get_SubtotalFormat;
    property DetailWidth: Integer read Get_DetailWidth write Set_DetailWidth;
    property GroupedWidth: Integer read Get_GroupedWidth write Set_GroupedWidth;
    property Expanded: UnicodeString read Get_Expanded write Set_Expanded;
    property TotalWidth: Integer read Get_TotalWidth write Set_TotalWidth;
    property PivotItem: IXMLPivotItemType_xList read Get_PivotItem;
  end;

{ IXMLPLPivotFieldType_xList }

  IXMLPLPivotFieldType_xList = interface(IXMLNodeCollection)
    ['{A28F900E-CE1F-4EF2-8699-8B6586C91912}']
    { Methods & Properties }
    function Add: IXMLPLPivotFieldType_x;
    function Insert(const Index: Integer): IXMLPLPivotFieldType_x;

    function Get_Item(Index: Integer): IXMLPLPivotFieldType_x;
    property Items[Index: Integer]: IXMLPLPivotFieldType_x read Get_Item; default;
  end;

{ IXMLDetailFormat_x }

  IXMLDetailFormat_x = interface(IXMLNode)
    ['{A0C08888-7A48-4E49-8A8B-F0E360D4989E}']
    { Property Accessors }
    function Get_Style: UnicodeString;
    procedure Set_Style(Value: UnicodeString);
    { Methods & Properties }
    property Style: UnicodeString read Get_Style write Set_Style;
  end;

{ IXMLSubtotalFormat_x }

  IXMLSubtotalFormat_x = interface(IXMLNode)
    ['{30DE4FC7-2DF7-47D9-92F5-F7BD1007BDC6}']
    { Property Accessors }
    function Get_Style: UnicodeString;
    procedure Set_Style(Value: UnicodeString);
    { Methods & Properties }
    property Style: UnicodeString read Get_Style write Set_Style;
  end;

{ IXMLPivotItemType_x }

  IXMLPivotItemType_x = interface(IXMLNode)
    ['{AD84824E-1852-4692-B075-D3E2AC80EBD3}']
    { Property Accessors }
    function Get_Name: UnicodeString;
    function Get_Formula: UnicodeString;
    function Get_FormulaV10: UnicodeString;
    function Get_ParseFormulaAsV10: UnicodeString;
    function Get_FormulaIndex: Integer;
    function Get_Hidden: UnicodeString;
    function Get_HideDetail: UnicodeString;
    function Get_Missing: UnicodeString;
    function Get_CachePosition: Integer;
    function Get_Member: UnicodeString;
    function Get_SourceName: UnicodeString;
    function Get_DrilledMember: UnicodeString;
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Formula(Value: UnicodeString);
    procedure Set_FormulaV10(Value: UnicodeString);
    procedure Set_ParseFormulaAsV10(Value: UnicodeString);
    procedure Set_FormulaIndex(Value: Integer);
    procedure Set_Hidden(Value: UnicodeString);
    procedure Set_HideDetail(Value: UnicodeString);
    procedure Set_Missing(Value: UnicodeString);
    procedure Set_CachePosition(Value: Integer);
    procedure Set_Member(Value: UnicodeString);
    procedure Set_SourceName(Value: UnicodeString);
    procedure Set_DrilledMember(Value: UnicodeString);
    { Methods & Properties }
    property Name: UnicodeString read Get_Name write Set_Name;
    property Formula: UnicodeString read Get_Formula write Set_Formula;
    property FormulaV10: UnicodeString read Get_FormulaV10 write Set_FormulaV10;
    property ParseFormulaAsV10: UnicodeString read Get_ParseFormulaAsV10 write Set_ParseFormulaAsV10;
    property FormulaIndex: Integer read Get_FormulaIndex write Set_FormulaIndex;
    property Hidden: UnicodeString read Get_Hidden write Set_Hidden;
    property HideDetail: UnicodeString read Get_HideDetail write Set_HideDetail;
    property Missing: UnicodeString read Get_Missing write Set_Missing;
    property CachePosition: Integer read Get_CachePosition write Set_CachePosition;
    property Member: UnicodeString read Get_Member write Set_Member;
    property SourceName: UnicodeString read Get_SourceName write Set_SourceName;
    property DrilledMember: UnicodeString read Get_DrilledMember write Set_DrilledMember;
  end;

{ IXMLPivotItemType_xList }

  IXMLPivotItemType_xList = interface(IXMLNodeCollection)
    ['{6A430C19-70A7-486F-9A87-108FD499CCCD}']
    { Methods & Properties }
    function Add: IXMLPivotItemType_x;
    function Insert(const Index: Integer): IXMLPivotItemType_x;

    function Get_Item(Index: Integer): IXMLPivotItemType_x;
    property Items[Index: Integer]: IXMLPivotItemType_x read Get_Item; default;
  end;

{ IXMLPLTotalType_x }

  IXMLPLTotalType_x = interface(IXMLNode)
    ['{56589B2C-C6B9-4002-91D3-D40759FAB409}']
    { Property Accessors }
    function Get_Name: UnicodeString;
    function Get_Caption: UnicodeString;
    function Get_ParentField: UnicodeString;
    function Get_NumberFormat: UnicodeString;
    function Get_Operator_: UnicodeString;
    function Get_Alignment: IXMLAlignmentType_x;
    function Get_CaptionAlignment: UnicodeString;
    function Get_Width: Integer;
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Caption(Value: UnicodeString);
    procedure Set_ParentField(Value: UnicodeString);
    procedure Set_NumberFormat(Value: UnicodeString);
    procedure Set_Operator_(Value: UnicodeString);
    procedure Set_CaptionAlignment(Value: UnicodeString);
    procedure Set_Width(Value: Integer);
    { Methods & Properties }
    property Name: UnicodeString read Get_Name write Set_Name;
    property Caption: UnicodeString read Get_Caption write Set_Caption;
    property ParentField: UnicodeString read Get_ParentField write Set_ParentField;
    property NumberFormat: UnicodeString read Get_NumberFormat write Set_NumberFormat;
    property Operator_: UnicodeString read Get_Operator_ write Set_Operator_;
    property Alignment: IXMLAlignmentType_x read Get_Alignment;
    property CaptionAlignment: UnicodeString read Get_CaptionAlignment write Set_CaptionAlignment;
    property Width: Integer read Get_Width write Set_Width;
  end;

{ IXMLPLTotalType_xList }

  IXMLPLTotalType_xList = interface(IXMLNodeCollection)
    ['{F4F73DF0-CF94-4747-B916-E3C72AF1620C}']
    { Methods & Properties }
    function Add: IXMLPLTotalType_x;
    function Insert(const Index: Integer): IXMLPLTotalType_x;

    function Get_Item(Index: Integer): IXMLPLTotalType_x;
    property Items[Index: Integer]: IXMLPLTotalType_x read Get_Item; default;
  end;

{ IXMLAlignmentType_x }

  IXMLAlignmentType_x = interface(IXMLNode)
    ['{D8D0A2B7-B2DE-432C-A491-FC86972AAABE}']
    { Property Accessors }
    function Get_Horizontal: UnicodeString;
    function Get_Rotation: Integer;
    function Get_Vertical: UnicodeString;
    function Get_ReadingOrder: UnicodeString;
    procedure Set_Horizontal(Value: UnicodeString);
    procedure Set_Rotation(Value: Integer);
    procedure Set_Vertical(Value: UnicodeString);
    procedure Set_ReadingOrder(Value: UnicodeString);
    { Methods & Properties }
    property Horizontal: UnicodeString read Get_Horizontal write Set_Horizontal;
    property Rotation: Integer read Get_Rotation write Set_Rotation;
    property Vertical: UnicodeString read Get_Vertical write Set_Vertical;
    property ReadingOrder: UnicodeString read Get_ReadingOrder write Set_ReadingOrder;
  end;

{ IXMLPivotAxisType_x }

  IXMLPivotAxisType_x = interface(IXMLNode)
    ['{BE3643C5-3774-4E76-80D8-2AF16831A01D}']
    { Property Accessors }
    function Get_DisplayEmptyMembers: UnicodeString;
    function Get_Label_: IXMLLabel__x;
    function Get_Orientation: UnicodeString;
    procedure Set_DisplayEmptyMembers(Value: UnicodeString);
    procedure Set_Orientation(Value: UnicodeString);
    { Methods & Properties }
    property DisplayEmptyMembers: UnicodeString read Get_DisplayEmptyMembers write Set_DisplayEmptyMembers;
    property Label_: IXMLLabel__x read Get_Label_;
    property Orientation: UnicodeString read Get_Orientation write Set_Orientation;
  end;

{ IXMLPivotAxisType_xList }

  IXMLPivotAxisType_xList = interface(IXMLNodeCollection)
    ['{E5FA8712-8E8E-412A-8D4A-694E5D7ED07A}']
    { Methods & Properties }
    function Add: IXMLPivotAxisType_x;
    function Insert(const Index: Integer): IXMLPivotAxisType_x;

    function Get_Item(Index: Integer): IXMLPivotAxisType_x;
    property Items[Index: Integer]: IXMLPivotAxisType_x read Get_Item; default;
  end;

{ IXMLPivotFieldType_x }

  IXMLPivotFieldType_x = interface(IXMLNode)
    ['{88B2FE51-C0FB-4CB2-933A-749DBD2BC42F}']
    { Property Accessors }
    function Get_DataField: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_MapChildItems: IXMLMapChildItemsType_x;
    function Get_AutoShowCount: Integer;
    function Get_AutoShowField: UnicodeString;
    function Get_AutoShowRange: UnicodeString;
    function Get_AutoShowType: UnicodeString;
    function Get_AutoSortOrder: UnicodeString;
    function Get_AutoSortField: UnicodeString;
    function Get_BaseField: UnicodeString;
    function Get_BaseItem: UnicodeString;
    function Get_BlankLineAfterItems: UnicodeString;
    function Get_Calculation: UnicodeString;
    function Get_CantGetUniqueItems: UnicodeString;
    function Get_GroupBy: Integer;
    function Get_GroupStart: UnicodeString;
    function Get_GroupEnd: UnicodeString;
    function Get_GroupStartAuto: UnicodeString;
    function Get_GroupEndAuto: UnicodeString;
    function Get_GroupType: UnicodeString;
    function Get_LayoutPageBreak: UnicodeString;
    function Get_NumberFormat: UnicodeString;
    function Get_ParentField: UnicodeString;
    function Get_SourceName: UnicodeString;
    function Get_Orientation: UnicodeString;
    function Get_Function_: UnicodeString;
    function Get_Subtotal: IXMLSubtotalTypeList;
    function Get_LayoutForm: UnicodeString;
    function Get_LayoutSubtotalLocation: UnicodeString;
    function Get_NoDragToRow: UnicodeString;
    function Get_NoDragToColumn: UnicodeString;
    function Get_NoDragToData: UnicodeString;
    function Get_NoDragToHide: UnicodeString;
    function Get_NoDragToPage: UnicodeString;
    function Get_MemberProperty: IXMLMemberPropertyType_xList;
    function Get_MemberPropertiesOrder: UnicodeString;
    function Get_HideDropDowns: UnicodeString;
    function Get_DrilledLevel: UnicodeString;
    function Get_ServerSortOrder: UnicodeString;
    function Get_IsMemberProperty: UnicodeString;
    function Get_CurrentPage: UnicodeString;
    function Get_Caption: UnicodeString;
    function Get_FilterMember: IXMLFilterMember_xList;
    function Get_Position: Integer;
    function Get_DataType: UnicodeString;
    function Get_ServerBased: UnicodeString;
    function Get_ShowAllItems: UnicodeString;
    function Get_SQLType: UnicodeString;
    function Get_SubtotalName: UnicodeString;
    function Get_PLTPivotItem: IXMLPivotItemType_xList;
    function Get_DetailFormat: IXMLDetailFormatType_x;
    function Get_DetailWidth: Integer;
    function Get_Expanded: UnicodeString;
    function Get_FilterCaption: UnicodeString;
    function Get_Formula: UnicodeString;
    function Get_FormulaV10: UnicodeString;
    function Get_ParseFormulaAsV10: UnicodeString;
    function Get_GroupedWidth: Integer;
    function Get_NewItemsHidden: UnicodeString;
    function Get_PLCaption: UnicodeString;
    function Get_PLDataOrientation: UnicodeString;
    function Get_PLGroupType: UnicodeString;
    function Get_PLName: UnicodeString;
    function Get_PLPosition: Integer;
    function Get_PLSubtotal: Double;
    function Get_SourceHierarchy: UnicodeString;
    function Get_MemberPropertyParent: Integer;
    function Get_SourceHierarchyLevel: UnicodeString;
    function Get_PivotItem: IXMLPivotItemType_xList;
    function Get_SubtotalFormat: IXMLSubtotalFormatType_x;
    function Get_TotalAlignment: UnicodeString;
    function Get_TotalCaptionAlignment: UnicodeString;
    function Get_TotalWidth: Integer;
    procedure Set_DataField(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
    procedure Set_AutoShowCount(Value: Integer);
    procedure Set_AutoShowField(Value: UnicodeString);
    procedure Set_AutoShowRange(Value: UnicodeString);
    procedure Set_AutoShowType(Value: UnicodeString);
    procedure Set_AutoSortOrder(Value: UnicodeString);
    procedure Set_AutoSortField(Value: UnicodeString);
    procedure Set_BaseField(Value: UnicodeString);
    procedure Set_BaseItem(Value: UnicodeString);
    procedure Set_BlankLineAfterItems(Value: UnicodeString);
    procedure Set_Calculation(Value: UnicodeString);
    procedure Set_CantGetUniqueItems(Value: UnicodeString);
    procedure Set_GroupBy(Value: Integer);
    procedure Set_GroupStart(Value: UnicodeString);
    procedure Set_GroupEnd(Value: UnicodeString);
    procedure Set_GroupStartAuto(Value: UnicodeString);
    procedure Set_GroupEndAuto(Value: UnicodeString);
    procedure Set_GroupType(Value: UnicodeString);
    procedure Set_LayoutPageBreak(Value: UnicodeString);
    procedure Set_NumberFormat(Value: UnicodeString);
    procedure Set_ParentField(Value: UnicodeString);
    procedure Set_SourceName(Value: UnicodeString);
    procedure Set_Orientation(Value: UnicodeString);
    procedure Set_Function_(Value: UnicodeString);
    procedure Set_LayoutForm(Value: UnicodeString);
    procedure Set_LayoutSubtotalLocation(Value: UnicodeString);
    procedure Set_NoDragToRow(Value: UnicodeString);
    procedure Set_NoDragToColumn(Value: UnicodeString);
    procedure Set_NoDragToData(Value: UnicodeString);
    procedure Set_NoDragToHide(Value: UnicodeString);
    procedure Set_NoDragToPage(Value: UnicodeString);
    procedure Set_MemberPropertiesOrder(Value: UnicodeString);
    procedure Set_HideDropDowns(Value: UnicodeString);
    procedure Set_DrilledLevel(Value: UnicodeString);
    procedure Set_ServerSortOrder(Value: UnicodeString);
    procedure Set_IsMemberProperty(Value: UnicodeString);
    procedure Set_CurrentPage(Value: UnicodeString);
    procedure Set_Caption(Value: UnicodeString);
    procedure Set_Position(Value: Integer);
    procedure Set_DataType(Value: UnicodeString);
    procedure Set_ServerBased(Value: UnicodeString);
    procedure Set_ShowAllItems(Value: UnicodeString);
    procedure Set_SQLType(Value: UnicodeString);
    procedure Set_SubtotalName(Value: UnicodeString);
    procedure Set_DetailWidth(Value: Integer);
    procedure Set_Expanded(Value: UnicodeString);
    procedure Set_FilterCaption(Value: UnicodeString);
    procedure Set_Formula(Value: UnicodeString);
    procedure Set_FormulaV10(Value: UnicodeString);
    procedure Set_ParseFormulaAsV10(Value: UnicodeString);
    procedure Set_GroupedWidth(Value: Integer);
    procedure Set_NewItemsHidden(Value: UnicodeString);
    procedure Set_PLCaption(Value: UnicodeString);
    procedure Set_PLDataOrientation(Value: UnicodeString);
    procedure Set_PLGroupType(Value: UnicodeString);
    procedure Set_PLName(Value: UnicodeString);
    procedure Set_PLPosition(Value: Integer);
    procedure Set_PLSubtotal(Value: Double);
    procedure Set_SourceHierarchy(Value: UnicodeString);
    procedure Set_MemberPropertyParent(Value: Integer);
    procedure Set_SourceHierarchyLevel(Value: UnicodeString);
    procedure Set_TotalAlignment(Value: UnicodeString);
    procedure Set_TotalCaptionAlignment(Value: UnicodeString);
    procedure Set_TotalWidth(Value: Integer);
    { Methods & Properties }
    property DataField: UnicodeString read Get_DataField write Set_DataField;
    property Name: UnicodeString read Get_Name write Set_Name;
    property MapChildItems: IXMLMapChildItemsType_x read Get_MapChildItems;
    property AutoShowCount: Integer read Get_AutoShowCount write Set_AutoShowCount;
    property AutoShowField: UnicodeString read Get_AutoShowField write Set_AutoShowField;
    property AutoShowRange: UnicodeString read Get_AutoShowRange write Set_AutoShowRange;
    property AutoShowType: UnicodeString read Get_AutoShowType write Set_AutoShowType;
    property AutoSortOrder: UnicodeString read Get_AutoSortOrder write Set_AutoSortOrder;
    property AutoSortField: UnicodeString read Get_AutoSortField write Set_AutoSortField;
    property BaseField: UnicodeString read Get_BaseField write Set_BaseField;
    property BaseItem: UnicodeString read Get_BaseItem write Set_BaseItem;
    property BlankLineAfterItems: UnicodeString read Get_BlankLineAfterItems write Set_BlankLineAfterItems;
    property Calculation: UnicodeString read Get_Calculation write Set_Calculation;
    property CantGetUniqueItems: UnicodeString read Get_CantGetUniqueItems write Set_CantGetUniqueItems;
    property GroupBy: Integer read Get_GroupBy write Set_GroupBy;
    property GroupStart: UnicodeString read Get_GroupStart write Set_GroupStart;
    property GroupEnd: UnicodeString read Get_GroupEnd write Set_GroupEnd;
    property GroupStartAuto: UnicodeString read Get_GroupStartAuto write Set_GroupStartAuto;
    property GroupEndAuto: UnicodeString read Get_GroupEndAuto write Set_GroupEndAuto;
    property GroupType: UnicodeString read Get_GroupType write Set_GroupType;
    property LayoutPageBreak: UnicodeString read Get_LayoutPageBreak write Set_LayoutPageBreak;
    property NumberFormat: UnicodeString read Get_NumberFormat write Set_NumberFormat;
    property ParentField: UnicodeString read Get_ParentField write Set_ParentField;
    property SourceName: UnicodeString read Get_SourceName write Set_SourceName;
    property Orientation: UnicodeString read Get_Orientation write Set_Orientation;
    property Function_: UnicodeString read Get_Function_ write Set_Function_;
    property Subtotal: IXMLSubtotalTypeList read Get_Subtotal;
    property LayoutForm: UnicodeString read Get_LayoutForm write Set_LayoutForm;
    property LayoutSubtotalLocation: UnicodeString read Get_LayoutSubtotalLocation write Set_LayoutSubtotalLocation;
    property NoDragToRow: UnicodeString read Get_NoDragToRow write Set_NoDragToRow;
    property NoDragToColumn: UnicodeString read Get_NoDragToColumn write Set_NoDragToColumn;
    property NoDragToData: UnicodeString read Get_NoDragToData write Set_NoDragToData;
    property NoDragToHide: UnicodeString read Get_NoDragToHide write Set_NoDragToHide;
    property NoDragToPage: UnicodeString read Get_NoDragToPage write Set_NoDragToPage;
    property MemberProperty: IXMLMemberPropertyType_xList read Get_MemberProperty;
    property MemberPropertiesOrder: UnicodeString read Get_MemberPropertiesOrder write Set_MemberPropertiesOrder;
    property HideDropDowns: UnicodeString read Get_HideDropDowns write Set_HideDropDowns;
    property DrilledLevel: UnicodeString read Get_DrilledLevel write Set_DrilledLevel;
    property ServerSortOrder: UnicodeString read Get_ServerSortOrder write Set_ServerSortOrder;
    property IsMemberProperty: UnicodeString read Get_IsMemberProperty write Set_IsMemberProperty;
    property CurrentPage: UnicodeString read Get_CurrentPage write Set_CurrentPage;
    property Caption: UnicodeString read Get_Caption write Set_Caption;
    property FilterMember: IXMLFilterMember_xList read Get_FilterMember;
    property Position: Integer read Get_Position write Set_Position;
    property DataType: UnicodeString read Get_DataType write Set_DataType;
    property ServerBased: UnicodeString read Get_ServerBased write Set_ServerBased;
    property ShowAllItems: UnicodeString read Get_ShowAllItems write Set_ShowAllItems;
    property SQLType: UnicodeString read Get_SQLType write Set_SQLType;
    property SubtotalName: UnicodeString read Get_SubtotalName write Set_SubtotalName;
    property PLTPivotItem: IXMLPivotItemType_xList read Get_PLTPivotItem;
    property DetailFormat: IXMLDetailFormatType_x read Get_DetailFormat;
    property DetailWidth: Integer read Get_DetailWidth write Set_DetailWidth;
    property Expanded: UnicodeString read Get_Expanded write Set_Expanded;
    property FilterCaption: UnicodeString read Get_FilterCaption write Set_FilterCaption;
    property Formula: UnicodeString read Get_Formula write Set_Formula;
    property FormulaV10: UnicodeString read Get_FormulaV10 write Set_FormulaV10;
    property ParseFormulaAsV10: UnicodeString read Get_ParseFormulaAsV10 write Set_ParseFormulaAsV10;
    property GroupedWidth: Integer read Get_GroupedWidth write Set_GroupedWidth;
    property NewItemsHidden: UnicodeString read Get_NewItemsHidden write Set_NewItemsHidden;
    property PLCaption: UnicodeString read Get_PLCaption write Set_PLCaption;
    property PLDataOrientation: UnicodeString read Get_PLDataOrientation write Set_PLDataOrientation;
    property PLGroupType: UnicodeString read Get_PLGroupType write Set_PLGroupType;
    property PLName: UnicodeString read Get_PLName write Set_PLName;
    property PLPosition: Integer read Get_PLPosition write Set_PLPosition;
    property PLSubtotal: Double read Get_PLSubtotal write Set_PLSubtotal;
    property SourceHierarchy: UnicodeString read Get_SourceHierarchy write Set_SourceHierarchy;
    property MemberPropertyParent: Integer read Get_MemberPropertyParent write Set_MemberPropertyParent;
    property SourceHierarchyLevel: UnicodeString read Get_SourceHierarchyLevel write Set_SourceHierarchyLevel;
    property PivotItem: IXMLPivotItemType_xList read Get_PivotItem;
    property SubtotalFormat: IXMLSubtotalFormatType_x read Get_SubtotalFormat;
    property TotalAlignment: UnicodeString read Get_TotalAlignment write Set_TotalAlignment;
    property TotalCaptionAlignment: UnicodeString read Get_TotalCaptionAlignment write Set_TotalCaptionAlignment;
    property TotalWidth: Integer read Get_TotalWidth write Set_TotalWidth;
  end;

{ IXMLPivotFieldType_xList }

  IXMLPivotFieldType_xList = interface(IXMLNodeCollection)
    ['{4CC39823-15DA-42B2-B11E-B2DF98A6C3B3}']
    { Methods & Properties }
    function Add: IXMLPivotFieldType_x;
    function Insert(const Index: Integer): IXMLPivotFieldType_x;

    function Get_Item(Index: Integer): IXMLPivotFieldType_x;
    property Items[Index: Integer]: IXMLPivotFieldType_x read Get_Item; default;
  end;

{ IXMLMapChildItemsType_x }

  IXMLMapChildItemsType_x = interface(IXMLNode)
    ['{960D6C8F-55A8-4362-AC6D-161331728C13}']
    { Property Accessors }
    function Get_Item: UnicodeString;
    procedure Set_Item(Value: UnicodeString);
    { Methods & Properties }
    property Item: UnicodeString read Get_Item write Set_Item;
  end;

{ IXMLMemberPropertyType_x }

  IXMLMemberPropertyType_x = interface(IXMLNode)
    ['{C6292E57-7A3C-491C-8BED-518FECC94567}']
    { Property Accessors }
    function Get_Name: UnicodeString;
    function Get_UniqueName: UnicodeString;
    function Get_SourceHierarchyLevel: Integer;
    function Get_LengthLevelUniqueName: Integer;
    function Get_DisplayIn: UnicodeString;
    function Get_Caption: UnicodeString;
    procedure Set_Name(Value: UnicodeString);
    procedure Set_UniqueName(Value: UnicodeString);
    procedure Set_SourceHierarchyLevel(Value: Integer);
    procedure Set_LengthLevelUniqueName(Value: Integer);
    procedure Set_DisplayIn(Value: UnicodeString);
    procedure Set_Caption(Value: UnicodeString);
    { Methods & Properties }
    property Name: UnicodeString read Get_Name write Set_Name;
    property UniqueName: UnicodeString read Get_UniqueName write Set_UniqueName;
    property SourceHierarchyLevel: Integer read Get_SourceHierarchyLevel write Set_SourceHierarchyLevel;
    property LengthLevelUniqueName: Integer read Get_LengthLevelUniqueName write Set_LengthLevelUniqueName;
    property DisplayIn: UnicodeString read Get_DisplayIn write Set_DisplayIn;
    property Caption: UnicodeString read Get_Caption write Set_Caption;
  end;

{ IXMLMemberPropertyType_xList }

  IXMLMemberPropertyType_xList = interface(IXMLNodeCollection)
    ['{B98E64F7-875E-44F3-B464-2B71606BB8DF}']
    { Methods & Properties }
    function Add: IXMLMemberPropertyType_x;
    function Insert(const Index: Integer): IXMLMemberPropertyType_x;

    function Get_Item(Index: Integer): IXMLMemberPropertyType_x;
    property Items[Index: Integer]: IXMLMemberPropertyType_x read Get_Item; default;
  end;

{ IXMLFilterMember_x }

  IXMLFilterMember_x = interface(IXMLNode)
    ['{F81F52BC-97E7-46B2-9485-BD2E88287E72}']
    { Property Accessors }
    function Get_UniqueName: UnicodeString;
    function Get_Level: Integer;
    function Get_Caption: UnicodeString;
    procedure Set_UniqueName(Value: UnicodeString);
    procedure Set_Level(Value: Integer);
    procedure Set_Caption(Value: UnicodeString);
    { Methods & Properties }
    property UniqueName: UnicodeString read Get_UniqueName write Set_UniqueName;
    property Level: Integer read Get_Level write Set_Level;
    property Caption: UnicodeString read Get_Caption write Set_Caption;
  end;

{ IXMLFilterMember_xList }

  IXMLFilterMember_xList = interface(IXMLNodeCollection)
    ['{61F2648B-715B-431B-8F10-33B8FA5A8EAB}']
    { Methods & Properties }
    function Add: IXMLFilterMember_x;
    function Insert(const Index: Integer): IXMLFilterMember_x;

    function Get_Item(Index: Integer): IXMLFilterMember_x;
    property Items[Index: Integer]: IXMLFilterMember_x read Get_Item; default;
  end;

{ IXMLDetailFormatType_x }

  IXMLDetailFormatType_x = interface(IXMLNode)
    ['{62A59C8B-7887-4D7E-9877-943ECCABA54F}']
    { Property Accessors }
    function Get_Style: UnicodeString;
    procedure Set_Style(Value: UnicodeString);
    { Methods & Properties }
    property Style: UnicodeString read Get_Style write Set_Style;
  end;

{ IXMLSubtotalFormatType_x }

  IXMLSubtotalFormatType_x = interface(IXMLNode)
    ['{A57778B7-25B2-4BA2-B257-F0737382A09F}']
    { Property Accessors }
    function Get_Style: UnicodeString;
    procedure Set_Style(Value: UnicodeString);
    { Methods & Properties }
    property Style: UnicodeString read Get_Style write Set_Style;
  end;

{ IXMLCubeFieldType_x }

  IXMLCubeFieldType_x = interface(IXMLNode)
    ['{E4CFA9DC-0560-4CED-97DC-DF89BF535FF8}']
    { Property Accessors }
    function Get_UniqueName: UnicodeString;
    function Get_Caption: UnicodeString;
    function Get_DefaultItem: UnicodeString;
    function Get_AllItemName: UnicodeString;
    function Get_Dimension: UnicodeString;
    function Get_DontShowInFieldList: UnicodeString;
    function Get_Measure: UnicodeString;
    function Get_Set_: UnicodeString;
    function Get_NoDragToData: UnicodeString;
    function Get_NoDragToHide: UnicodeString;
    function Get_NoDragToRow: UnicodeString;
    function Get_NoDragToColumn: UnicodeString;
    function Get_NoDragToPage: UnicodeString;
    function Get_EnableMultiplePageItems: UnicodeString;
    function Get_LayoutForm: UnicodeString;
    function Get_LayoutSubtotalLocation: UnicodeString;
    function Get_Orientation: UnicodeString;
    function Get_MemberProperty: IXMLMemberPropertyType_xList;
    function Get_MemberPropertiesOrder: UnicodeString;
    function Get_HideDropDowns: UnicodeString;
    function Get_GroupLevel: IXMLGroupLevel_xList;
    procedure Set_UniqueName(Value: UnicodeString);
    procedure Set_Caption(Value: UnicodeString);
    procedure Set_DefaultItem(Value: UnicodeString);
    procedure Set_AllItemName(Value: UnicodeString);
    procedure Set_Dimension(Value: UnicodeString);
    procedure Set_DontShowInFieldList(Value: UnicodeString);
    procedure Set_Measure(Value: UnicodeString);
    procedure Set_Set_(Value: UnicodeString);
    procedure Set_NoDragToData(Value: UnicodeString);
    procedure Set_NoDragToHide(Value: UnicodeString);
    procedure Set_NoDragToRow(Value: UnicodeString);
    procedure Set_NoDragToColumn(Value: UnicodeString);
    procedure Set_NoDragToPage(Value: UnicodeString);
    procedure Set_EnableMultiplePageItems(Value: UnicodeString);
    procedure Set_LayoutForm(Value: UnicodeString);
    procedure Set_LayoutSubtotalLocation(Value: UnicodeString);
    procedure Set_Orientation(Value: UnicodeString);
    procedure Set_MemberPropertiesOrder(Value: UnicodeString);
    procedure Set_HideDropDowns(Value: UnicodeString);
    { Methods & Properties }
    property UniqueName: UnicodeString read Get_UniqueName write Set_UniqueName;
    property Caption: UnicodeString read Get_Caption write Set_Caption;
    property DefaultItem: UnicodeString read Get_DefaultItem write Set_DefaultItem;
    property AllItemName: UnicodeString read Get_AllItemName write Set_AllItemName;
    property Dimension: UnicodeString read Get_Dimension write Set_Dimension;
    property DontShowInFieldList: UnicodeString read Get_DontShowInFieldList write Set_DontShowInFieldList;
    property Measure: UnicodeString read Get_Measure write Set_Measure;
    property Set_: UnicodeString read Get_Set_ write Set_Set_;
    property NoDragToData: UnicodeString read Get_NoDragToData write Set_NoDragToData;
    property NoDragToHide: UnicodeString read Get_NoDragToHide write Set_NoDragToHide;
    property NoDragToRow: UnicodeString read Get_NoDragToRow write Set_NoDragToRow;
    property NoDragToColumn: UnicodeString read Get_NoDragToColumn write Set_NoDragToColumn;
    property NoDragToPage: UnicodeString read Get_NoDragToPage write Set_NoDragToPage;
    property EnableMultiplePageItems: UnicodeString read Get_EnableMultiplePageItems write Set_EnableMultiplePageItems;
    property LayoutForm: UnicodeString read Get_LayoutForm write Set_LayoutForm;
    property LayoutSubtotalLocation: UnicodeString read Get_LayoutSubtotalLocation write Set_LayoutSubtotalLocation;
    property Orientation: UnicodeString read Get_Orientation write Set_Orientation;
    property MemberProperty: IXMLMemberPropertyType_xList read Get_MemberProperty;
    property MemberPropertiesOrder: UnicodeString read Get_MemberPropertiesOrder write Set_MemberPropertiesOrder;
    property HideDropDowns: UnicodeString read Get_HideDropDowns write Set_HideDropDowns;
    property GroupLevel: IXMLGroupLevel_xList read Get_GroupLevel;
  end;

{ IXMLCubeFieldType_xList }

  IXMLCubeFieldType_xList = interface(IXMLNodeCollection)
    ['{DFFD0BC3-23BE-46E8-876F-62D9165702D2}']
    { Methods & Properties }
    function Add: IXMLCubeFieldType_x;
    function Insert(const Index: Integer): IXMLCubeFieldType_x;

    function Get_Item(Index: Integer): IXMLCubeFieldType_x;
    property Items[Index: Integer]: IXMLCubeFieldType_x read Get_Item; default;
  end;

{ IXMLGroupLevel_x }

  IXMLGroupLevel_x = interface(IXMLNode)
    ['{0CF9310E-D443-4D84-BAA9-792ECDD1E3C9}']
    { Property Accessors }
    function Get_IsGroupLevel: UnicodeString;
    function Get_UniqueName: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_GroupDefinition: IXMLGroupDefinitionType_xList;
    procedure Set_IsGroupLevel(Value: UnicodeString);
    procedure Set_UniqueName(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
    { Methods & Properties }
    property IsGroupLevel: UnicodeString read Get_IsGroupLevel write Set_IsGroupLevel;
    property UniqueName: UnicodeString read Get_UniqueName write Set_UniqueName;
    property Name: UnicodeString read Get_Name write Set_Name;
    property GroupDefinition: IXMLGroupDefinitionType_xList read Get_GroupDefinition;
  end;

{ IXMLGroupLevel_xList }

  IXMLGroupLevel_xList = interface(IXMLNodeCollection)
    ['{10C8059F-D8BC-43EA-89B9-5B8FE5E76A8D}']
    { Methods & Properties }
    function Add: IXMLGroupLevel_x;
    function Insert(const Index: Integer): IXMLGroupLevel_x;

    function Get_Item(Index: Integer): IXMLGroupLevel_x;
    property Items[Index: Integer]: IXMLGroupLevel_x read Get_Item; default;
  end;

{ IXMLGroupDefinitionType_x }

  IXMLGroupDefinitionType_x = interface(IXMLNode)
    ['{FD27FE8E-A7E5-47A6-BFE5-7C5EFD5F9500}']
    { Property Accessors }
    function Get_Name: UnicodeString;
    function Get_UniqueName: UnicodeString;
    function Get_Caption: UnicodeString;
    function Get_GroupNumber: Integer;
    function Get_ParentName: UnicodeString;
    function Get_ParentUniqueName: UnicodeString;
    function Get_ParentIsOther: UnicodeString;
    function Get_GroupMember: IXMLGroupMemberType_xList;
    procedure Set_Name(Value: UnicodeString);
    procedure Set_UniqueName(Value: UnicodeString);
    procedure Set_Caption(Value: UnicodeString);
    procedure Set_GroupNumber(Value: Integer);
    procedure Set_ParentName(Value: UnicodeString);
    procedure Set_ParentUniqueName(Value: UnicodeString);
    procedure Set_ParentIsOther(Value: UnicodeString);
    { Methods & Properties }
    property Name: UnicodeString read Get_Name write Set_Name;
    property UniqueName: UnicodeString read Get_UniqueName write Set_UniqueName;
    property Caption: UnicodeString read Get_Caption write Set_Caption;
    property GroupNumber: Integer read Get_GroupNumber write Set_GroupNumber;
    property ParentName: UnicodeString read Get_ParentName write Set_ParentName;
    property ParentUniqueName: UnicodeString read Get_ParentUniqueName write Set_ParentUniqueName;
    property ParentIsOther: UnicodeString read Get_ParentIsOther write Set_ParentIsOther;
    property GroupMember: IXMLGroupMemberType_xList read Get_GroupMember;
  end;

{ IXMLGroupDefinitionType_xList }

  IXMLGroupDefinitionType_xList = interface(IXMLNodeCollection)
    ['{DFAB2703-DAE2-42FE-B648-5451CC89BD0C}']
    { Methods & Properties }
    function Add: IXMLGroupDefinitionType_x;
    function Insert(const Index: Integer): IXMLGroupDefinitionType_x;

    function Get_Item(Index: Integer): IXMLGroupDefinitionType_x;
    property Items[Index: Integer]: IXMLGroupDefinitionType_x read Get_Item; default;
  end;

{ IXMLGroupMemberType_x }

  IXMLGroupMemberType_x = interface(IXMLNode)
    ['{5C4ABA4C-5495-4B2C-8CCA-D3922D9D836A}']
    { Property Accessors }
    function Get_Name: UnicodeString;
    function Get_UniqueName: UnicodeString;
    procedure Set_Name(Value: UnicodeString);
    procedure Set_UniqueName(Value: UnicodeString);
    { Methods & Properties }
    property Name: UnicodeString read Get_Name write Set_Name;
    property UniqueName: UnicodeString read Get_UniqueName write Set_UniqueName;
  end;

{ IXMLGroupMemberType_xList }

  IXMLGroupMemberType_xList = interface(IXMLNodeCollection)
    ['{1D81324C-2281-4EC6-94AD-DBF4F4BC9AEA}']
    { Methods & Properties }
    function Add: IXMLGroupMemberType_x;
    function Insert(const Index: Integer): IXMLGroupMemberType_x;

    function Get_Item(Index: Integer): IXMLGroupMemberType_x;
    property Items[Index: Integer]: IXMLGroupMemberType_x read Get_Item; default;
  end;

{ IXMLCalculatedMember_x }

  IXMLCalculatedMember_x = interface(IXMLNode)
    ['{76992305-3A76-4168-A593-14BB0037F58F}']
    { Property Accessors }
    function Get_Name: UnicodeString;
    function Get_MemberName: UnicodeString;
    function Get_ParentUniqueName: UnicodeString;
    function Get_SourceHierarchy: UnicodeString;
    function Get_SourceHierarchyLevel: Integer;
    function Get_Formula: UnicodeString;
    function Get_SolveOrder: Integer;
    function Get_Invalid: UnicodeString;
    function Get_Set_: UnicodeString;
    procedure Set_Name(Value: UnicodeString);
    procedure Set_MemberName(Value: UnicodeString);
    procedure Set_ParentUniqueName(Value: UnicodeString);
    procedure Set_SourceHierarchy(Value: UnicodeString);
    procedure Set_SourceHierarchyLevel(Value: Integer);
    procedure Set_Formula(Value: UnicodeString);
    procedure Set_SolveOrder(Value: Integer);
    procedure Set_Invalid(Value: UnicodeString);
    procedure Set_Set_(Value: UnicodeString);
    { Methods & Properties }
    property Name: UnicodeString read Get_Name write Set_Name;
    property MemberName: UnicodeString read Get_MemberName write Set_MemberName;
    property ParentUniqueName: UnicodeString read Get_ParentUniqueName write Set_ParentUniqueName;
    property SourceHierarchy: UnicodeString read Get_SourceHierarchy write Set_SourceHierarchy;
    property SourceHierarchyLevel: Integer read Get_SourceHierarchyLevel write Set_SourceHierarchyLevel;
    property Formula: UnicodeString read Get_Formula write Set_Formula;
    property SolveOrder: Integer read Get_SolveOrder write Set_SolveOrder;
    property Invalid: UnicodeString read Get_Invalid write Set_Invalid;
    property Set_: UnicodeString read Get_Set_ write Set_Set_;
  end;

{ IXMLPTLineItemsType_x }

  IXMLPTLineItemsType_x = interface(IXMLNode)
    ['{B93FE50D-4052-4C5A-BA9A-4E055C6C0487}']
    { Property Accessors }
    function Get_Orientation: UnicodeString;
    function Get_PTLineItem: IXMLPTLineItemType_xList;
    procedure Set_Orientation(Value: UnicodeString);
    { Methods & Properties }
    property Orientation: UnicodeString read Get_Orientation write Set_Orientation;
    property PTLineItem: IXMLPTLineItemType_xList read Get_PTLineItem;
  end;

{ IXMLPTLineItemsType_xList }

  IXMLPTLineItemsType_xList = interface(IXMLNodeCollection)
    ['{BB4C660E-758B-4D0E-8499-A04C600B51FA}']
    { Methods & Properties }
    function Add: IXMLPTLineItemsType_x;
    function Insert(const Index: Integer): IXMLPTLineItemsType_x;

    function Get_Item(Index: Integer): IXMLPTLineItemsType_x;
    property Items[Index: Integer]: IXMLPTLineItemsType_x read Get_Item; default;
  end;

{ IXMLPTLineItemType_x }

  IXMLPTLineItemType_x = interface(IXMLNode)
    ['{67253F84-527E-4EC5-ABBD-7E02963997C3}']
    { Property Accessors }
    function Get_ItemType: UnicodeString;
    function Get_DataField: Integer;
    function Get_BlockTotal: UnicodeString;
    function Get_CountOfSameItems: Integer;
    function Get_Item: IXMLString_List;
    procedure Set_ItemType(Value: UnicodeString);
    procedure Set_DataField(Value: Integer);
    procedure Set_BlockTotal(Value: UnicodeString);
    procedure Set_CountOfSameItems(Value: Integer);
    { Methods & Properties }
    property ItemType: UnicodeString read Get_ItemType write Set_ItemType;
    property DataField: Integer read Get_DataField write Set_DataField;
    property BlockTotal: UnicodeString read Get_BlockTotal write Set_BlockTotal;
    property CountOfSameItems: Integer read Get_CountOfSameItems write Set_CountOfSameItems;
    property Item: IXMLString_List read Get_Item;
  end;

{ IXMLPTLineItemType_xList }

  IXMLPTLineItemType_xList = interface(IXMLNodeCollection)
    ['{C285AA30-44DB-432E-A191-9117C242BAA5}']
    { Methods & Properties }
    function Add: IXMLPTLineItemType_x;
    function Insert(const Index: Integer): IXMLPTLineItemType_x;

    function Get_Item(Index: Integer): IXMLPTLineItemType_x;
    property Items[Index: Integer]: IXMLPTLineItemType_x read Get_Item; default;
  end;

{ IXMLPTSourceType_x }

  IXMLPTSourceType_x = interface(IXMLNode)
    ['{4453EA54-760F-4D2D-9A10-598604577C24}']
    { Property Accessors }
    function Get_CacheFile: UnicodeString;
    function Get_CacheIndex: Integer;
    function Get_DataMember: UnicodeString;
    function Get_MissingItemsLimit: Integer;
    function Get_VersionRefreshableMin: Integer;
    function Get_VersionLastRefresh: UnicodeString;
    function Get_RefreshName: UnicodeString;
    function Get_RefreshDate: UnicodeString;
    function Get_RefreshDateCopy: UnicodeString;
    function Get_ConsolidationReference: IXMLConsolidationReferenceType_x;
    function Get_NoSaveData: UnicodeString;
    function Get_QuerySource: IXMLPTQuerySourceType_x;
    function Get_SourceConsolidation: IXMLSourceConsolidationType_x;
    function Get_BackgroundQuery: UnicodeString;
    function Get_CubeSource: UnicodeString;
    function Get_DisableRefresh: UnicodeString;
    function Get_HasNoRecords: UnicodeString;
    function Get_OptimizeCache: UnicodeString;
    function Get_RefreshOnFileOpen: UnicodeString;
    procedure Set_CacheFile(Value: UnicodeString);
    procedure Set_CacheIndex(Value: Integer);
    procedure Set_DataMember(Value: UnicodeString);
    procedure Set_MissingItemsLimit(Value: Integer);
    procedure Set_VersionRefreshableMin(Value: Integer);
    procedure Set_VersionLastRefresh(Value: UnicodeString);
    procedure Set_RefreshName(Value: UnicodeString);
    procedure Set_RefreshDate(Value: UnicodeString);
    procedure Set_RefreshDateCopy(Value: UnicodeString);
    procedure Set_NoSaveData(Value: UnicodeString);
    procedure Set_BackgroundQuery(Value: UnicodeString);
    procedure Set_CubeSource(Value: UnicodeString);
    procedure Set_DisableRefresh(Value: UnicodeString);
    procedure Set_HasNoRecords(Value: UnicodeString);
    procedure Set_OptimizeCache(Value: UnicodeString);
    procedure Set_RefreshOnFileOpen(Value: UnicodeString);
    { Methods & Properties }
    property CacheFile: UnicodeString read Get_CacheFile write Set_CacheFile;
    property CacheIndex: Integer read Get_CacheIndex write Set_CacheIndex;
    property DataMember: UnicodeString read Get_DataMember write Set_DataMember;
    property MissingItemsLimit: Integer read Get_MissingItemsLimit write Set_MissingItemsLimit;
    property VersionRefreshableMin: Integer read Get_VersionRefreshableMin write Set_VersionRefreshableMin;
    property VersionLastRefresh: UnicodeString read Get_VersionLastRefresh write Set_VersionLastRefresh;
    property RefreshName: UnicodeString read Get_RefreshName write Set_RefreshName;
    property RefreshDate: UnicodeString read Get_RefreshDate write Set_RefreshDate;
    property RefreshDateCopy: UnicodeString read Get_RefreshDateCopy write Set_RefreshDateCopy;
    property ConsolidationReference: IXMLConsolidationReferenceType_x read Get_ConsolidationReference;
    property NoSaveData: UnicodeString read Get_NoSaveData write Set_NoSaveData;
    property QuerySource: IXMLPTQuerySourceType_x read Get_QuerySource;
    property SourceConsolidation: IXMLSourceConsolidationType_x read Get_SourceConsolidation;
    property BackgroundQuery: UnicodeString read Get_BackgroundQuery write Set_BackgroundQuery;
    property CubeSource: UnicodeString read Get_CubeSource write Set_CubeSource;
    property DisableRefresh: UnicodeString read Get_DisableRefresh write Set_DisableRefresh;
    property HasNoRecords: UnicodeString read Get_HasNoRecords write Set_HasNoRecords;
    property OptimizeCache: UnicodeString read Get_OptimizeCache write Set_OptimizeCache;
    property RefreshOnFileOpen: UnicodeString read Get_RefreshOnFileOpen write Set_RefreshOnFileOpen;
  end;

{ IXMLConsolidationReferenceType_x }

  IXMLConsolidationReferenceType_x = interface(IXMLNode)
    ['{F44484AC-1770-485B-88C4-519309D1A74A}']
    { Property Accessors }
    function Get_FileName: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Reference: UnicodeString;
    procedure Set_FileName(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Reference(Value: UnicodeString);
    { Methods & Properties }
    property FileName: UnicodeString read Get_FileName write Set_FileName;
    property Name: UnicodeString read Get_Name write Set_Name;
    property Reference: UnicodeString read Get_Reference write Set_Reference;
  end;

{ IXMLPTQuerySourceType_x }

  IXMLPTQuerySourceType_x = interface(IXMLNode)
    ['{14F9C42E-BCB0-4B31-98F7-5EA890D1B434}']
    { Property Accessors }
    function Get_QueryType: UnicodeString;
    function Get_CommandText: IXMLString_List;
    function Get_CommandType: UnicodeString;
    function Get_Maintain: UnicodeString;
    function Get_Connection: UnicodeString;
    function Get_Parameter: IXMLParameterTypeE_xList;
    function Get_CommandTextOrignal: IXMLString_List;
    function Get_SourceConnectionFile: IXMLString_List;
    function Get_SourceDataFile: IXMLString_List;
    function Get_RobustConnect: UnicodeString;
    function Get_RefreshTimeSpan: Integer;
    function Get_LocalConnection: IXMLString_List;
    function Get_NoRefreshCache: UnicodeString;
    function Get_UseLocalConnection: UnicodeString;
    function Get_VersionLastEdit: UnicodeString;
    function Get_VersionLastRefresh: UnicodeString;
    function Get_VersionRefreshableMin: UnicodeString;
    procedure Set_QueryType(Value: UnicodeString);
    procedure Set_CommandType(Value: UnicodeString);
    procedure Set_Maintain(Value: UnicodeString);
    procedure Set_Connection(Value: UnicodeString);
    procedure Set_RobustConnect(Value: UnicodeString);
    procedure Set_RefreshTimeSpan(Value: Integer);
    procedure Set_NoRefreshCache(Value: UnicodeString);
    procedure Set_UseLocalConnection(Value: UnicodeString);
    procedure Set_VersionLastEdit(Value: UnicodeString);
    procedure Set_VersionLastRefresh(Value: UnicodeString);
    procedure Set_VersionRefreshableMin(Value: UnicodeString);
    { Methods & Properties }
    property QueryType: UnicodeString read Get_QueryType write Set_QueryType;
    property CommandText: IXMLString_List read Get_CommandText;
    property CommandType: UnicodeString read Get_CommandType write Set_CommandType;
    property Maintain: UnicodeString read Get_Maintain write Set_Maintain;
    property Connection: UnicodeString read Get_Connection write Set_Connection;
    property Parameter: IXMLParameterTypeE_xList read Get_Parameter;
    property CommandTextOrignal: IXMLString_List read Get_CommandTextOrignal;
    property SourceConnectionFile: IXMLString_List read Get_SourceConnectionFile;
    property SourceDataFile: IXMLString_List read Get_SourceDataFile;
    property RobustConnect: UnicodeString read Get_RobustConnect write Set_RobustConnect;
    property RefreshTimeSpan: Integer read Get_RefreshTimeSpan write Set_RefreshTimeSpan;
    property LocalConnection: IXMLString_List read Get_LocalConnection;
    property NoRefreshCache: UnicodeString read Get_NoRefreshCache write Set_NoRefreshCache;
    property UseLocalConnection: UnicodeString read Get_UseLocalConnection write Set_UseLocalConnection;
    property VersionLastEdit: UnicodeString read Get_VersionLastEdit write Set_VersionLastEdit;
    property VersionLastRefresh: UnicodeString read Get_VersionLastRefresh write Set_VersionLastRefresh;
    property VersionRefreshableMin: UnicodeString read Get_VersionRefreshableMin write Set_VersionRefreshableMin;
  end;

{ IXMLSourceConsolidationType_x }

  IXMLSourceConsolidationType_x = interface(IXMLNode)
    ['{218F84B1-0730-4271-9D2E-2BA678299ACC}']
    { Property Accessors }
    function Get_Reference: IXMLReference_xList;
    function Get_NoAutoPage: UnicodeString;
    procedure Set_NoAutoPage(Value: UnicodeString);
    { Methods & Properties }
    property Reference: IXMLReference_xList read Get_Reference;
    property NoAutoPage: UnicodeString read Get_NoAutoPage write Set_NoAutoPage;
  end;

{ IXMLReference_x }

  IXMLReference_x = interface(IXMLNode)
    ['{B456B4DC-BB7B-4B1D-9EA9-6E31756F7048}']
    { Property Accessors }
    function Get_ConsolidationReference: IXMLConsolidationReferenceType_x;
    function Get_Item: IXMLString_List;
    { Methods & Properties }
    property ConsolidationReference: IXMLConsolidationReferenceType_x read Get_ConsolidationReference;
    property Item: IXMLString_List read Get_Item;
  end;

{ IXMLReference_xList }

  IXMLReference_xList = interface(IXMLNodeCollection)
    ['{2FD7F10C-24AD-43EA-B6AD-EF7C7FDB48E2}']
    { Methods & Properties }
    function Add: IXMLReference_x;
    function Insert(const Index: Integer): IXMLReference_x;

    function Get_Item(Index: Integer): IXMLReference_x;
    property Items[Index: Integer]: IXMLReference_x read Get_Item; default;
  end;

{ IXMLPTFormulaType_x }

  IXMLPTFormulaType_x = interface(IXMLNode)
    ['{047C63E1-BF1C-4B5C-A234-BFAB458215FE}']
    { Property Accessors }
    function Get_Formula: UnicodeString;
    function Get_FormulaV10: UnicodeString;
    function Get_ParseFormulaAsV10: UnicodeString;
    function Get_FormulaIndex: Integer;
    function Get_PTRule: IXMLPTRuleType_x;
    procedure Set_Formula(Value: UnicodeString);
    procedure Set_FormulaV10(Value: UnicodeString);
    procedure Set_ParseFormulaAsV10(Value: UnicodeString);
    procedure Set_FormulaIndex(Value: Integer);
    { Methods & Properties }
    property Formula: UnicodeString read Get_Formula write Set_Formula;
    property FormulaV10: UnicodeString read Get_FormulaV10 write Set_FormulaV10;
    property ParseFormulaAsV10: UnicodeString read Get_ParseFormulaAsV10 write Set_ParseFormulaAsV10;
    property FormulaIndex: Integer read Get_FormulaIndex write Set_FormulaIndex;
    property PTRule: IXMLPTRuleType_x read Get_PTRule;
  end;

{ IXMLPTFormulaType_xList }

  IXMLPTFormulaType_xList = interface(IXMLNodeCollection)
    ['{77A3401E-42DD-477E-8928-8BA26320EE55}']
    { Methods & Properties }
    function Add: IXMLPTFormulaType_x;
    function Insert(const Index: Integer): IXMLPTFormulaType_x;

    function Get_Item(Index: Integer): IXMLPTFormulaType_x;
    property Items[Index: Integer]: IXMLPTFormulaType_x read Get_Item; default;
  end;

{ IXMLPTFormatType_x }

  IXMLPTFormatType_x = interface(IXMLNode)
    ['{5F802312-9EF8-4AAA-B852-B55E1784C521}']
    { Property Accessors }
    function Get_Style: UnicodeString;
    function Get_PTRule: IXMLPTRuleType_xList;
    function Get_FormatType: UnicodeString;
    function Get_IndividualCellBorders: UnicodeString;
    procedure Set_Style(Value: UnicodeString);
    procedure Set_FormatType(Value: UnicodeString);
    procedure Set_IndividualCellBorders(Value: UnicodeString);
    { Methods & Properties }
    property Style: UnicodeString read Get_Style write Set_Style;
    property PTRule: IXMLPTRuleType_xList read Get_PTRule;
    property FormatType: UnicodeString read Get_FormatType write Set_FormatType;
    property IndividualCellBorders: UnicodeString read Get_IndividualCellBorders write Set_IndividualCellBorders;
  end;

{ IXMLPTFormatType_xList }

  IXMLPTFormatType_xList = interface(IXMLNodeCollection)
    ['{0332FBDC-0E77-4E73-8F5A-588EE9FD2610}']
    { Methods & Properties }
    function Add: IXMLPTFormatType_x;
    function Insert(const Index: Integer): IXMLPTFormatType_x;

    function Get_Item(Index: Integer): IXMLPTFormatType_x;
    property Items[Index: Integer]: IXMLPTFormatType_x read Get_Item; default;
  end;

{ IXMLDataValidationType_x }

  IXMLDataValidationType_x = interface(IXMLNode)
    ['{2108E632-B6B6-4D17-BB57-5116A57B1B5E}']
    { Property Accessors }
    function Get_Range: UnicodeString;
    function Get_Type_: UnicodeString;
    function Get_CellRangeList: UnicodeString;
    function Get_Qualifier: UnicodeString;
    function Get_UseBlank: UnicodeString;
    function Get_Min: UnicodeString;
    function Get_Max: UnicodeString;
    function Get_Value: UnicodeString;
    function Get_ComboHide: UnicodeString;
    function Get_IMEMode: UnicodeString;
    function Get_InputHide: UnicodeString;
    function Get_InputTitle: UnicodeString;
    function Get_InputMessage: UnicodeString;
    function Get_ErrorHide: UnicodeString;
    function Get_ErrorStyle: UnicodeString;
    function Get_ErrorMessage: UnicodeString;
    function Get_ErrorTitle: UnicodeString;
    procedure Set_Range(Value: UnicodeString);
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_CellRangeList(Value: UnicodeString);
    procedure Set_Qualifier(Value: UnicodeString);
    procedure Set_UseBlank(Value: UnicodeString);
    procedure Set_Min(Value: UnicodeString);
    procedure Set_Max(Value: UnicodeString);
    procedure Set_Value(Value: UnicodeString);
    procedure Set_ComboHide(Value: UnicodeString);
    procedure Set_IMEMode(Value: UnicodeString);
    procedure Set_InputHide(Value: UnicodeString);
    procedure Set_InputTitle(Value: UnicodeString);
    procedure Set_InputMessage(Value: UnicodeString);
    procedure Set_ErrorHide(Value: UnicodeString);
    procedure Set_ErrorStyle(Value: UnicodeString);
    procedure Set_ErrorMessage(Value: UnicodeString);
    procedure Set_ErrorTitle(Value: UnicodeString);
    { Methods & Properties }
    property Range: UnicodeString read Get_Range write Set_Range;
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
    property CellRangeList: UnicodeString read Get_CellRangeList write Set_CellRangeList;
    property Qualifier: UnicodeString read Get_Qualifier write Set_Qualifier;
    property UseBlank: UnicodeString read Get_UseBlank write Set_UseBlank;
    property Min: UnicodeString read Get_Min write Set_Min;
    property Max: UnicodeString read Get_Max write Set_Max;
    property Value: UnicodeString read Get_Value write Set_Value;
    property ComboHide: UnicodeString read Get_ComboHide write Set_ComboHide;
    property IMEMode: UnicodeString read Get_IMEMode write Set_IMEMode;
    property InputHide: UnicodeString read Get_InputHide write Set_InputHide;
    property InputTitle: UnicodeString read Get_InputTitle write Set_InputTitle;
    property InputMessage: UnicodeString read Get_InputMessage write Set_InputMessage;
    property ErrorHide: UnicodeString read Get_ErrorHide write Set_ErrorHide;
    property ErrorStyle: UnicodeString read Get_ErrorStyle write Set_ErrorStyle;
    property ErrorMessage: UnicodeString read Get_ErrorMessage write Set_ErrorMessage;
    property ErrorTitle: UnicodeString read Get_ErrorTitle write Set_ErrorTitle;
  end;

{ IXMLDataValidationType_xList }

  IXMLDataValidationType_xList = interface(IXMLNodeCollection)
    ['{9A94CB14-5DEE-4999-9F81-C9D71C6C1715}']
    { Methods & Properties }
    function Add: IXMLDataValidationType_x;
    function Insert(const Index: Integer): IXMLDataValidationType_x;

    function Get_Item(Index: Integer): IXMLDataValidationType_x;
    property Items[Index: Integer]: IXMLDataValidationType_x read Get_Item; default;
  end;

{ IXMLAutoFilter_x }

  IXMLAutoFilter_x = interface(IXMLNodeCollection)
    ['{06509924-10A2-430D-9593-B9C50162D772}']
    { Property Accessors }
    function Get_Range: UnicodeString;
    function Get_AutoFilterColumn(Index: Integer): IXMLAutoFilterColumnType_x;
    procedure Set_Range(Value: UnicodeString);
    { Methods & Properties }
    function Add: IXMLAutoFilterColumnType_x;
    function Insert(const Index: Integer): IXMLAutoFilterColumnType_x;
    property Range: UnicodeString read Get_Range write Set_Range;
    property AutoFilterColumn[Index: Integer]: IXMLAutoFilterColumnType_x read Get_AutoFilterColumn; default;
  end;

{ IXMLAutoFilterColumnType_x }

  IXMLAutoFilterColumnType_x = interface(IXMLNode)
    ['{FA977FAB-DB56-43B5-A340-3ED6D9ACEEEE}']
    { Property Accessors }
    function Get_Index: Integer;
    function Get_Type_: UnicodeString;
    function Get_Value: Integer;
    function Get_AutoFilterCondition: IXMLAutoFilterConditionType_x;
    function Get_AutoFilterOr: IXMLAutoFilterOr_x;
    function Get_AutoFilterAnd: IXMLAutoFilterAnd_x;
    procedure Set_Index(Value: Integer);
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_Value(Value: Integer);
    { Methods & Properties }
    property Index: Integer read Get_Index write Set_Index;
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
    property Value: Integer read Get_Value write Set_Value;
    property AutoFilterCondition: IXMLAutoFilterConditionType_x read Get_AutoFilterCondition;
    property AutoFilterOr: IXMLAutoFilterOr_x read Get_AutoFilterOr;
    property AutoFilterAnd: IXMLAutoFilterAnd_x read Get_AutoFilterAnd;
  end;

{ IXMLAutoFilterConditionType_x }

  IXMLAutoFilterConditionType_x = interface(IXMLNode)
    ['{9DAED4C8-5191-47DC-989F-355A229AE989}']
    { Property Accessors }
    function Get_Operator_: UnicodeString;
    function Get_Value: UnicodeString;
    procedure Set_Operator_(Value: UnicodeString);
    procedure Set_Value(Value: UnicodeString);
    { Methods & Properties }
    property Operator_: UnicodeString read Get_Operator_ write Set_Operator_;
    property Value: UnicodeString read Get_Value write Set_Value;
  end;

{ IXMLAutoFilterOr_x }

  IXMLAutoFilterOr_x = interface(IXMLNodeCollection)
    ['{975AA73C-D88D-4120-A1B0-4D681DAF7F01}']
    { Property Accessors }
    function Get_AutoFilterCondition(Index: Integer): IXMLAutoFilterConditionType_x;
    { Methods & Properties }
    function Add: IXMLAutoFilterConditionType_x;
    function Insert(const Index: Integer): IXMLAutoFilterConditionType_x;
    property AutoFilterCondition[Index: Integer]: IXMLAutoFilterConditionType_x read Get_AutoFilterCondition; default;
  end;

{ IXMLAutoFilterAnd_x }

  IXMLAutoFilterAnd_x = interface(IXMLNodeCollection)
    ['{3FCE5822-AE13-4670-B5DF-1ACFA885EF73}']
    { Property Accessors }
    function Get_AutoFilterCondition(Index: Integer): IXMLAutoFilterConditionType_x;
    { Methods & Properties }
    function Add: IXMLAutoFilterConditionType_x;
    function Insert(const Index: Integer): IXMLAutoFilterConditionType_x;
    property AutoFilterCondition[Index: Integer]: IXMLAutoFilterConditionType_x read Get_AutoFilterCondition; default;
  end;

{ IXMLConditionalFormattingType_x }

  IXMLConditionalFormattingType_x = interface(IXMLNode)
    ['{A6508E9E-F3E4-47F4-B2D5-E83B1B24CD40}']
    { Property Accessors }
    function Get_Range: UnicodeString;
    function Get_Condition: IXMLCondition_xList;
    procedure Set_Range(Value: UnicodeString);
    { Methods & Properties }
    property Range: UnicodeString read Get_Range write Set_Range;
    property Condition: IXMLCondition_xList read Get_Condition;
  end;

{ IXMLConditionalFormattingType_xList }

  IXMLConditionalFormattingType_xList = interface(IXMLNodeCollection)
    ['{E9C0728C-CD68-403E-B7D8-8E5DA73EB64C}']
    { Methods & Properties }
    function Add: IXMLConditionalFormattingType_x;
    function Insert(const Index: Integer): IXMLConditionalFormattingType_x;

    function Get_Item(Index: Integer): IXMLConditionalFormattingType_x;
    property Items[Index: Integer]: IXMLConditionalFormattingType_x read Get_Item; default;
  end;

{ IXMLCondition_x }

  IXMLCondition_x = interface(IXMLNode)
    ['{6773DB70-5136-4845-9545-78DD8CB2234F}']
    { Property Accessors }
    function Get_Style: UnicodeString;
    function Get_Qualifier: UnicodeString;
    function Get_Value1: UnicodeString;
    function Get_Value2: UnicodeString;
    function Get_Format: IXMLFormat_x;
    procedure Set_Style(Value: UnicodeString);
    procedure Set_Qualifier(Value: UnicodeString);
    procedure Set_Value1(Value: UnicodeString);
    procedure Set_Value2(Value: UnicodeString);
    { Methods & Properties }
    property Style: UnicodeString read Get_Style write Set_Style;
    property Qualifier: UnicodeString read Get_Qualifier write Set_Qualifier;
    property Value1: UnicodeString read Get_Value1 write Set_Value1;
    property Value2: UnicodeString read Get_Value2 write Set_Value2;
    property Format: IXMLFormat_x read Get_Format;
  end;

{ IXMLCondition_xList }

  IXMLCondition_xList = interface(IXMLNodeCollection)
    ['{B702C52D-61F8-48B9-A070-F991B4618994}']
    { Methods & Properties }
    function Add: IXMLCondition_x;
    function Insert(const Index: Integer): IXMLCondition_x;

    function Get_Item(Index: Integer): IXMLCondition_x;
    property Items[Index: Integer]: IXMLCondition_x read Get_Item; default;
  end;

{ IXMLFormat_x }

  IXMLFormat_x = interface(IXMLNode)
    ['{5B2C57A3-774C-4837-8E4E-27F7C8C8EE63}']
    { Property Accessors }
    function Get_Style: UnicodeString;
    procedure Set_Style(Value: UnicodeString);
    { Methods & Properties }
    property Style: UnicodeString read Get_Style write Set_Style;
  end;

{ IXMLSortingType_x }

  IXMLSortingType_x = interface(IXMLNode)
    ['{422C66C5-8B34-4FB2-A1F9-EF4A56594FC5}']
    { Property Accessors }
    function Get_Sort: IXMLString_List;
    function Get_Descending: IXMLString_List;
    function Get_LeftToRight: UnicodeString;
    function Get_CaseSensitive: UnicodeString;
    function Get_AlternateMethod: UnicodeString;
    procedure Set_LeftToRight(Value: UnicodeString);
    procedure Set_CaseSensitive(Value: UnicodeString);
    procedure Set_AlternateMethod(Value: UnicodeString);
    { Methods & Properties }
    property Sort: IXMLString_List read Get_Sort;
    property Descending: IXMLString_List read Get_Descending;
    property LeftToRight: UnicodeString read Get_LeftToRight write Set_LeftToRight;
    property CaseSensitive: UnicodeString read Get_CaseSensitive write Set_CaseSensitive;
    property AlternateMethod: UnicodeString read Get_AlternateMethod write Set_AlternateMethod;
  end;

{ IXMLWorksheetoptions_c }

  IXMLWorksheetoptions_c = interface(IXMLNode)
    ['{B9A58629-1B52-48B8-910C-E87F19E1447E}']
    { Property Accessors }
    function Get_Displaycustomheaders: UnicodeString;
    procedure Set_Displaycustomheaders(Value: UnicodeString);
    { Methods & Properties }
    property Displaycustomheaders: UnicodeString read Get_Displaycustomheaders write Set_Displaycustomheaders;
  end;

{ IXMLQueryTableType_x }

  IXMLQueryTableType_x = interface(IXMLNode)
    ['{89748A23-83A4-4D77-86EA-47D2F43DEEEE}']
    { Property Accessors }
    function Get_Name: UnicodeString;
    function Get_AutoFormatFont: UnicodeString;
    function Get_AutoFormatName: UnicodeString;
    function Get_AutoFormatNumber: UnicodeString;
    function Get_AutoFormatBorder: UnicodeString;
    function Get_AutoFormatPattern: UnicodeString;
    function Get_AutoFormatAlignment: UnicodeString;
    function Get_AutoFormatWidth: UnicodeString;
    function Get_QuerySource: IXMLQTQuerySourceType_x;
    function Get_DisableEdit: UnicodeString;
    function Get_DisableRefresh: UnicodeString;
    function Get_Filled: UnicodeString;
    function Get_InsertEntireRows: UnicodeString;
    function Get_NewAsync: UnicodeString;
    function Get_NoAutofit: UnicodeString;
    function Get_NoPreserveFormatting: UnicodeString;
    function Get_NoSaveData: UnicodeString;
    function Get_NoTitles: UnicodeString;
    function Get_OverwriteCells: UnicodeString;
    function Get_RefreshInfo: IXMLRefreshInfoType_x;
    function Get_RefreshOnFileOpen: UnicodeString;
    function Get_RowNumbers: UnicodeString;
    function Get_Synchronous: UnicodeString;
    procedure Set_Name(Value: UnicodeString);
    procedure Set_AutoFormatFont(Value: UnicodeString);
    procedure Set_AutoFormatName(Value: UnicodeString);
    procedure Set_AutoFormatNumber(Value: UnicodeString);
    procedure Set_AutoFormatBorder(Value: UnicodeString);
    procedure Set_AutoFormatPattern(Value: UnicodeString);
    procedure Set_AutoFormatAlignment(Value: UnicodeString);
    procedure Set_AutoFormatWidth(Value: UnicodeString);
    procedure Set_DisableEdit(Value: UnicodeString);
    procedure Set_DisableRefresh(Value: UnicodeString);
    procedure Set_Filled(Value: UnicodeString);
    procedure Set_InsertEntireRows(Value: UnicodeString);
    procedure Set_NewAsync(Value: UnicodeString);
    procedure Set_NoAutofit(Value: UnicodeString);
    procedure Set_NoPreserveFormatting(Value: UnicodeString);
    procedure Set_NoSaveData(Value: UnicodeString);
    procedure Set_NoTitles(Value: UnicodeString);
    procedure Set_OverwriteCells(Value: UnicodeString);
    procedure Set_RefreshOnFileOpen(Value: UnicodeString);
    procedure Set_RowNumbers(Value: UnicodeString);
    procedure Set_Synchronous(Value: UnicodeString);
    { Methods & Properties }
    property Name: UnicodeString read Get_Name write Set_Name;
    property AutoFormatFont: UnicodeString read Get_AutoFormatFont write Set_AutoFormatFont;
    property AutoFormatName: UnicodeString read Get_AutoFormatName write Set_AutoFormatName;
    property AutoFormatNumber: UnicodeString read Get_AutoFormatNumber write Set_AutoFormatNumber;
    property AutoFormatBorder: UnicodeString read Get_AutoFormatBorder write Set_AutoFormatBorder;
    property AutoFormatPattern: UnicodeString read Get_AutoFormatPattern write Set_AutoFormatPattern;
    property AutoFormatAlignment: UnicodeString read Get_AutoFormatAlignment write Set_AutoFormatAlignment;
    property AutoFormatWidth: UnicodeString read Get_AutoFormatWidth write Set_AutoFormatWidth;
    property QuerySource: IXMLQTQuerySourceType_x read Get_QuerySource;
    property DisableEdit: UnicodeString read Get_DisableEdit write Set_DisableEdit;
    property DisableRefresh: UnicodeString read Get_DisableRefresh write Set_DisableRefresh;
    property Filled: UnicodeString read Get_Filled write Set_Filled;
    property InsertEntireRows: UnicodeString read Get_InsertEntireRows write Set_InsertEntireRows;
    property NewAsync: UnicodeString read Get_NewAsync write Set_NewAsync;
    property NoAutofit: UnicodeString read Get_NoAutofit write Set_NoAutofit;
    property NoPreserveFormatting: UnicodeString read Get_NoPreserveFormatting write Set_NoPreserveFormatting;
    property NoSaveData: UnicodeString read Get_NoSaveData write Set_NoSaveData;
    property NoTitles: UnicodeString read Get_NoTitles write Set_NoTitles;
    property OverwriteCells: UnicodeString read Get_OverwriteCells write Set_OverwriteCells;
    property RefreshInfo: IXMLRefreshInfoType_x read Get_RefreshInfo;
    property RefreshOnFileOpen: UnicodeString read Get_RefreshOnFileOpen write Set_RefreshOnFileOpen;
    property RowNumbers: UnicodeString read Get_RowNumbers write Set_RowNumbers;
    property Synchronous: UnicodeString read Get_Synchronous write Set_Synchronous;
  end;

{ IXMLQueryTableType_xList }

  IXMLQueryTableType_xList = interface(IXMLNodeCollection)
    ['{93271528-4287-4D7B-9C7A-15717CDD8C98}']
    { Methods & Properties }
    function Add: IXMLQueryTableType_x;
    function Insert(const Index: Integer): IXMLQueryTableType_x;

    function Get_Item(Index: Integer): IXMLQueryTableType_x;
    property Items[Index: Integer]: IXMLQueryTableType_x read Get_Item; default;
  end;

{ IXMLPivotCache_x }

  IXMLPivotCache_x = interface(IXMLNode)
    ['{45E2B670-99FB-4CBA-9BB4-E2F0B5749238}']
    { Property Accessors }
    function Get_CacheIndex: Integer;
    function Get_Schema: IXMLSchema_;
    function Get_Data: IXMLData_;
    procedure Set_CacheIndex(Value: Integer);
    { Methods & Properties }
    property CacheIndex: Integer read Get_CacheIndex write Set_CacheIndex;
    property Schema: IXMLSchema_ read Get_Schema;
    property Data: IXMLData_ read Get_Data;
  end;

{ IXMLPivotCache_xList }

  IXMLPivotCache_xList = interface(IXMLNodeCollection)
    ['{6CBC256A-FD56-4A77-B6A9-46552768798A}']
    { Methods & Properties }
    function Add: IXMLPivotCache_x;
    function Insert(const Index: Integer): IXMLPivotCache_x;

    function Get_Item(Index: Integer): IXMLPivotCache_x;
    property Items[Index: Integer]: IXMLPivotCache_x read Get_Item; default;
  end;

{ IXMLSchema_ }

  IXMLSchema_ = interface(IXMLNode)
    ['{3D593228-0706-49AB-94FF-72C077EEDF68}']
    { Property Accessors }
    function Get_Id: UnicodeString;
    function Get_ElementType: IXMLElementType_;
    function Get_AttributeType: IXMLAttributeType_List;
    procedure Set_Id(Value: UnicodeString);
    { Methods & Properties }
    property Id: UnicodeString read Get_Id write Set_Id;
    property ElementType: IXMLElementType_ read Get_ElementType;
    property AttributeType: IXMLAttributeType_List read Get_AttributeType;
  end;

{ IXMLElementType_ }

  IXMLElementType_ = interface(IXMLNode)
    ['{03268635-2556-4BA5-A57F-113C046DEF55}']
    { Property Accessors }
    function Get_Name: UnicodeString;
    function Get_Content: UnicodeString;
    function Get_Attribute: IXMLAttribute_List;
    function Get_Extends: IXMLExtends_List;
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Content(Value: UnicodeString);
    { Methods & Properties }
    property Name: UnicodeString read Get_Name write Set_Name;
    property Content: UnicodeString read Get_Content write Set_Content;
    property Attribute: IXMLAttribute_List read Get_Attribute;
    property Extends: IXMLExtends_List read Get_Extends;
  end;

{ IXMLAttribute_ }

  IXMLAttribute_ = interface(IXMLNode)
    ['{37B4B9BD-DF79-42AB-ABC3-CDA618B1CDB5}']
    { Property Accessors }
    function Get_Type_: UnicodeString;
    procedure Set_Type_(Value: UnicodeString);
    { Methods & Properties }
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
  end;

{ IXMLAttribute_List }

  IXMLAttribute_List = interface(IXMLNodeCollection)
    ['{91F48F9C-DAAA-4E38-868F-35A421EB7D7A}']
    { Methods & Properties }
    function Add: IXMLAttribute_;
    function Insert(const Index: Integer): IXMLAttribute_;

    function Get_Item(Index: Integer): IXMLAttribute_;
    property Items[Index: Integer]: IXMLAttribute_ read Get_Item; default;
  end;

{ IXMLExtends_ }

  IXMLExtends_ = interface(IXMLNode)
    ['{87B528B6-A1EC-439B-A9C5-ADD4F4BF0E47}']
    { Property Accessors }
    function Get_Type_: UnicodeString;
    procedure Set_Type_(Value: UnicodeString);
    { Methods & Properties }
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
  end;

{ IXMLExtends_List }

  IXMLExtends_List = interface(IXMLNodeCollection)
    ['{D95EEF78-461D-4E8B-8A42-9E82D5CA05C8}']
    { Methods & Properties }
    function Add: IXMLExtends_;
    function Insert(const Index: Integer): IXMLExtends_;

    function Get_Item(Index: Integer): IXMLExtends_;
    property Items[Index: Integer]: IXMLExtends_ read Get_Item; default;
  end;

{ IXMLAttributeType_ }

  IXMLAttributeType_ = interface(IXMLNode)
    ['{7D58203C-88BA-4515-9631-3857C2A3087B}']
    { Property Accessors }
    function Get_Name: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Datatype: IXMLDatatype_;
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
    { Methods & Properties }
    property Name: UnicodeString read Get_Name write Set_Name;
    property Name: UnicodeString read Get_Name write Set_Name;
    property Datatype: IXMLDatatype_ read Get_Datatype;
  end;

{ IXMLAttributeType_List }

  IXMLAttributeType_List = interface(IXMLNodeCollection)
    ['{D6B84439-7CCA-4647-A468-310E9383DD1E}']
    { Methods & Properties }
    function Add: IXMLAttributeType_;
    function Insert(const Index: Integer): IXMLAttributeType_;

    function Get_Item(Index: Integer): IXMLAttributeType_;
    property Items[Index: Integer]: IXMLAttributeType_ read Get_Item; default;
  end;

{ IXMLDatatype_ }

  IXMLDatatype_ = interface(IXMLNode)
    ['{814250F4-04E0-41B0-8261-7352C2B333EA}']
    { Property Accessors }
    function Get_Type_: UnicodeString;
    function Get_MaxLength: Integer;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_MaxLength(Value: Integer);
    { Methods & Properties }
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
    property MaxLength: Integer read Get_MaxLength write Set_MaxLength;
  end;

{ IXMLData_ }

  IXMLData_ = interface(IXMLNodeCollection)
    ['{4CA4BF89-73A6-4D9F-8994-A470B143EB4D}']
    { Property Accessors }
    function Get_Row(Index: Integer): IXMLRow_;
    { Methods & Properties }
    function Add: IXMLRow_;
    function Insert(const Index: Integer): IXMLRow_;
    property Row[Index: Integer]: IXMLRow_ read Get_Row; default;
  end;

{ IXMLRow_ }

  IXMLRow_ = interface(IXMLNode)
    ['{A428BC7C-EC2B-447A-9150-9EC98418A37D}']
    { Property Accessors }
    function Get_Col1: UnicodeString;
    function Get_Col2: UnicodeString;
    function Get_Col3: UnicodeString;
    function Get_Col4: UnicodeString;
    function Get_Col5: UnicodeString;
    function Get_Col6: UnicodeString;
    function Get_Col7: UnicodeString;
    function Get_Col8: UnicodeString;
    function Get_Col9: UnicodeString;
    function Get_Col10: UnicodeString;
    function Get_Col11: UnicodeString;
    function Get_Col12: UnicodeString;
    function Get_Col13: UnicodeString;
    function Get_Col14: UnicodeString;
    function Get_Col15: UnicodeString;
    function Get_Col16: UnicodeString;
    function Get_Col17: UnicodeString;
    function Get_Col18: UnicodeString;
    function Get_Col19: UnicodeString;
    function Get_Col20: UnicodeString;
    procedure Set_Col1(Value: UnicodeString);
    procedure Set_Col2(Value: UnicodeString);
    procedure Set_Col3(Value: UnicodeString);
    procedure Set_Col4(Value: UnicodeString);
    procedure Set_Col5(Value: UnicodeString);
    procedure Set_Col6(Value: UnicodeString);
    procedure Set_Col7(Value: UnicodeString);
    procedure Set_Col8(Value: UnicodeString);
    procedure Set_Col9(Value: UnicodeString);
    procedure Set_Col10(Value: UnicodeString);
    procedure Set_Col11(Value: UnicodeString);
    procedure Set_Col12(Value: UnicodeString);
    procedure Set_Col13(Value: UnicodeString);
    procedure Set_Col14(Value: UnicodeString);
    procedure Set_Col15(Value: UnicodeString);
    procedure Set_Col16(Value: UnicodeString);
    procedure Set_Col17(Value: UnicodeString);
    procedure Set_Col18(Value: UnicodeString);
    procedure Set_Col19(Value: UnicodeString);
    procedure Set_Col20(Value: UnicodeString);
    { Methods & Properties }
    property Col1: UnicodeString read Get_Col1 write Set_Col1;
    property Col2: UnicodeString read Get_Col2 write Set_Col2;
    property Col3: UnicodeString read Get_Col3 write Set_Col3;
    property Col4: UnicodeString read Get_Col4 write Set_Col4;
    property Col5: UnicodeString read Get_Col5 write Set_Col5;
    property Col6: UnicodeString read Get_Col6 write Set_Col6;
    property Col7: UnicodeString read Get_Col7 write Set_Col7;
    property Col8: UnicodeString read Get_Col8 write Set_Col8;
    property Col9: UnicodeString read Get_Col9 write Set_Col9;
    property Col10: UnicodeString read Get_Col10 write Set_Col10;
    property Col11: UnicodeString read Get_Col11 write Set_Col11;
    property Col12: UnicodeString read Get_Col12 write Set_Col12;
    property Col13: UnicodeString read Get_Col13 write Set_Col13;
    property Col14: UnicodeString read Get_Col14 write Set_Col14;
    property Col15: UnicodeString read Get_Col15 write Set_Col15;
    property Col16: UnicodeString read Get_Col16 write Set_Col16;
    property Col17: UnicodeString read Get_Col17 write Set_Col17;
    property Col18: UnicodeString read Get_Col18 write Set_Col18;
    property Col19: UnicodeString read Get_Col19 write Set_Col19;
    property Col20: UnicodeString read Get_Col20 write Set_Col20;
  end;

{ IXMLMapInfoType_x2 }

  IXMLMapInfoType_x2 = interface(IXMLNode)
    ['{FC570D08-6B71-4A74-BCED-302910F0880A}']
    { Property Accessors }
    function Get_HideInactiveListBorder: UnicodeString;
    function Get_SelectionNamespaces: UnicodeString;
    function Get_Schema: IXMLSchemaType_x2List;
    function Get_Map: IXMLMapType_x2List;
    procedure Set_HideInactiveListBorder(Value: UnicodeString);
    procedure Set_SelectionNamespaces(Value: UnicodeString);
    { Methods & Properties }
    property HideInactiveListBorder: UnicodeString read Get_HideInactiveListBorder write Set_HideInactiveListBorder;
    property SelectionNamespaces: UnicodeString read Get_SelectionNamespaces write Set_SelectionNamespaces;
    property Schema: IXMLSchemaType_x2List read Get_Schema;
    property Map: IXMLMapType_x2List read Get_Map;
  end;

{ IXMLMapInfoType_x2List }

  IXMLMapInfoType_x2List = interface(IXMLNodeCollection)
    ['{056E3386-FDE6-4D6B-8B30-0B24C0F90993}']
    { Methods & Properties }
    function Add: IXMLMapInfoType_x2;
    function Insert(const Index: Integer): IXMLMapInfoType_x2;

    function Get_Item(Index: Integer): IXMLMapInfoType_x2;
    property Items[Index: Integer]: IXMLMapInfoType_x2 read Get_Item; default;
  end;

{ IXMLSchemaType_x2 }

  IXMLSchemaType_x2 = interface(IXMLNode)
    ['{09DAB063-F23C-44BA-B733-AE2E63727556}']
    { Property Accessors }
    function Get_ID: UnicodeString;
    function Get_Namespace: UnicodeString;
    function Get_SchemaRef: UnicodeString;
    procedure Set_ID(Value: UnicodeString);
    procedure Set_Namespace(Value: UnicodeString);
    procedure Set_SchemaRef(Value: UnicodeString);
    { Methods & Properties }
    property ID: UnicodeString read Get_ID write Set_ID;
    property Namespace: UnicodeString read Get_Namespace write Set_Namespace;
    property SchemaRef: UnicodeString read Get_SchemaRef write Set_SchemaRef;
  end;

{ IXMLSchemaType_x2List }

  IXMLSchemaType_x2List = interface(IXMLNodeCollection)
    ['{0EA441F6-E007-4978-BEDF-56069F1CF9B3}']
    { Methods & Properties }
    function Add: IXMLSchemaType_x2;
    function Insert(const Index: Integer): IXMLSchemaType_x2;

    function Get_Item(Index: Integer): IXMLSchemaType_x2;
    property Items[Index: Integer]: IXMLSchemaType_x2 read Get_Item; default;
  end;

{ IXMLMapType_x2 }

  IXMLMapType_x2 = interface(IXMLNode)
    ['{0FD5A0EA-BE0A-44E3-A3BF-3171B109AB5D}']
    { Property Accessors }
    function Get_ID: UnicodeString;
    function Get_SchemaID: UnicodeString;
    function Get_RootElement: UnicodeString;
    function Get_ShowImportExportValidationErrors: UnicodeString;
    function Get_Append: UnicodeString;
    function Get_DoNotPersist: UnicodeString;
    function Get_NoAutoFit: UnicodeString;
    function Get_NoPreserveFormatting: UnicodeString;
    function Get_Entry: IXMLEntryType_x2List;
    function Get_Mapdata: IXMLMapdata_x2;
    procedure Set_ID(Value: UnicodeString);
    procedure Set_SchemaID(Value: UnicodeString);
    procedure Set_RootElement(Value: UnicodeString);
    procedure Set_ShowImportExportValidationErrors(Value: UnicodeString);
    procedure Set_Append(Value: UnicodeString);
    procedure Set_DoNotPersist(Value: UnicodeString);
    procedure Set_NoAutoFit(Value: UnicodeString);
    procedure Set_NoPreserveFormatting(Value: UnicodeString);
    { Methods & Properties }
    property ID: UnicodeString read Get_ID write Set_ID;
    property SchemaID: UnicodeString read Get_SchemaID write Set_SchemaID;
    property RootElement: UnicodeString read Get_RootElement write Set_RootElement;
    property ShowImportExportValidationErrors: UnicodeString read Get_ShowImportExportValidationErrors write Set_ShowImportExportValidationErrors;
    property Append: UnicodeString read Get_Append write Set_Append;
    property DoNotPersist: UnicodeString read Get_DoNotPersist write Set_DoNotPersist;
    property NoAutoFit: UnicodeString read Get_NoAutoFit write Set_NoAutoFit;
    property NoPreserveFormatting: UnicodeString read Get_NoPreserveFormatting write Set_NoPreserveFormatting;
    property Entry: IXMLEntryType_x2List read Get_Entry;
    property Mapdata: IXMLMapdata_x2 read Get_Mapdata;
  end;

{ IXMLMapType_x2List }

  IXMLMapType_x2List = interface(IXMLNodeCollection)
    ['{85C34BCE-8C0A-46AB-A84F-FCCBCAAF7A4B}']
    { Methods & Properties }
    function Add: IXMLMapType_x2;
    function Insert(const Index: Integer): IXMLMapType_x2;

    function Get_Item(Index: Integer): IXMLMapType_x2;
    property Items[Index: Integer]: IXMLMapType_x2 read Get_Item; default;
  end;

{ IXMLEntryType_x2 }

  IXMLEntryType_x2 = interface(IXMLNode)
    ['{738643A1-BB7B-44FC-BB5F-C7CBF91EC1E9}']
    { Property Accessors }
    function Get_ID: UnicodeString;
    function Get_ShowTotals: UnicodeString;
    function Get_Type_: UnicodeString;
    function Get_Range: UnicodeString;
    function Get_HeaderRange: UnicodeString;
    function Get_FilterOn: UnicodeString;
    function Get_XPath: UnicodeString;
    function Get_Field: IXMLFieldType_x2List;
    function Get_ActiveRows: IXMLActiveRowsType_x2;
    function Get_NoInserts: UnicodeString;
    function Get_ReadOnly: UnicodeString;
    function Get_InstanceShape: UnicodeString;
    procedure Set_ID(Value: UnicodeString);
    procedure Set_ShowTotals(Value: UnicodeString);
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_Range(Value: UnicodeString);
    procedure Set_HeaderRange(Value: UnicodeString);
    procedure Set_FilterOn(Value: UnicodeString);
    procedure Set_XPath(Value: UnicodeString);
    procedure Set_NoInserts(Value: UnicodeString);
    procedure Set_ReadOnly(Value: UnicodeString);
    procedure Set_InstanceShape(Value: UnicodeString);
    { Methods & Properties }
    property ID: UnicodeString read Get_ID write Set_ID;
    property ShowTotals: UnicodeString read Get_ShowTotals write Set_ShowTotals;
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
    property Range: UnicodeString read Get_Range write Set_Range;
    property HeaderRange: UnicodeString read Get_HeaderRange write Set_HeaderRange;
    property FilterOn: UnicodeString read Get_FilterOn write Set_FilterOn;
    property XPath: UnicodeString read Get_XPath write Set_XPath;
    property Field: IXMLFieldType_x2List read Get_Field;
    property ActiveRows: IXMLActiveRowsType_x2 read Get_ActiveRows;
    property NoInserts: UnicodeString read Get_NoInserts write Set_NoInserts;
    property ReadOnly: UnicodeString read Get_ReadOnly write Set_ReadOnly;
    property InstanceShape: UnicodeString read Get_InstanceShape write Set_InstanceShape;
  end;

{ IXMLEntryType_x2List }

  IXMLEntryType_x2List = interface(IXMLNodeCollection)
    ['{D215ED66-96DC-4775-87AB-4C02C76E455C}']
    { Methods & Properties }
    function Add: IXMLEntryType_x2;
    function Insert(const Index: Integer): IXMLEntryType_x2;

    function Get_Item(Index: Integer): IXMLEntryType_x2;
    property Items[Index: Integer]: IXMLEntryType_x2 read Get_Item; default;
  end;

{ IXMLFieldType_x2 }

  IXMLFieldType_x2 = interface(IXMLNode)
    ['{90280ACE-4F0F-4CBF-BA0D-2EF31FF31F85}']
    { Property Accessors }
    function Get_ID: UnicodeString;
    function Get_Range: UnicodeString;
    function Get_XPath: UnicodeString;
    function Get_XSDType: UnicodeString;
    function Get_Cell: IXMLCell_;
    function Get_DataValidation: IXMLDataValidationType_x;
    function Get_Aggregate: UnicodeString;
    function Get_AutoFilterColumn: IXMLAutoFilterColumnType_x;
    procedure Set_ID(Value: UnicodeString);
    procedure Set_Range(Value: UnicodeString);
    procedure Set_XPath(Value: UnicodeString);
    procedure Set_XSDType(Value: UnicodeString);
    procedure Set_Aggregate(Value: UnicodeString);
    { Methods & Properties }
    property ID: UnicodeString read Get_ID write Set_ID;
    property Range: UnicodeString read Get_Range write Set_Range;
    property XPath: UnicodeString read Get_XPath write Set_XPath;
    property XSDType: UnicodeString read Get_XSDType write Set_XSDType;
    property Cell: IXMLCell_ read Get_Cell;
    property DataValidation: IXMLDataValidationType_x read Get_DataValidation;
    property Aggregate: UnicodeString read Get_Aggregate write Set_Aggregate;
    property AutoFilterColumn: IXMLAutoFilterColumnType_x read Get_AutoFilterColumn;
  end;

{ IXMLFieldType_x2List }

  IXMLFieldType_x2List = interface(IXMLNodeCollection)
    ['{26317BC1-EA06-45F7-AB97-32F0179DF603}']
    { Methods & Properties }
    function Add: IXMLFieldType_x2;
    function Insert(const Index: Integer): IXMLFieldType_x2;

    function Get_Item(Index: Integer): IXMLFieldType_x2;
    property Items[Index: Integer]: IXMLFieldType_x2 read Get_Item; default;
  end;

{ IXMLCell_ }

  IXMLCell_ = interface(IXMLNode)
    ['{4A2FC02E-DF3E-4CC7-A426-8667DF97B0D3}']
    { Property Accessors }
    function Get_ArrayRange: UnicodeString;
    function Get_Formula: UnicodeString;
    function Get_HRef: UnicodeString;
    function Get_Index: LongWord;
    function Get_MergeAcross: Int64;
    function Get_MergeDown: Int64;
    function Get_StyleID: UnicodeString;
    function Get_HRefScreenTip: UnicodeString;
    function Get_PasteFormula: UnicodeString;
    function Get_SmartTags: IXMLSmartTagsElt_oList;
    function Get_Data: IXMLData_;
    function Get_Comment: IXMLCommentType_;
    function Get_Phonetictext: IXMLPhonetictext_x;
    function Get_NamedCell: IXMLNamedCell_List;
    procedure Set_ArrayRange(Value: UnicodeString);
    procedure Set_Formula(Value: UnicodeString);
    procedure Set_HRef(Value: UnicodeString);
    procedure Set_Index(Value: LongWord);
    procedure Set_MergeAcross(Value: Int64);
    procedure Set_MergeDown(Value: Int64);
    procedure Set_StyleID(Value: UnicodeString);
    procedure Set_HRefScreenTip(Value: UnicodeString);
    procedure Set_PasteFormula(Value: UnicodeString);
    { Methods & Properties }
    property ArrayRange: UnicodeString read Get_ArrayRange write Set_ArrayRange;
    property Formula: UnicodeString read Get_Formula write Set_Formula;
    property HRef: UnicodeString read Get_HRef write Set_HRef;
    property Index: LongWord read Get_Index write Set_Index;
    property MergeAcross: Int64 read Get_MergeAcross write Set_MergeAcross;
    property MergeDown: Int64 read Get_MergeDown write Set_MergeDown;
    property StyleID: UnicodeString read Get_StyleID write Set_StyleID;
    property HRefScreenTip: UnicodeString read Get_HRefScreenTip write Set_HRefScreenTip;
    property PasteFormula: UnicodeString read Get_PasteFormula write Set_PasteFormula;
    property SmartTags: IXMLSmartTagsElt_oList read Get_SmartTags;
    property Data: IXMLData_ read Get_Data;
    property Comment: IXMLCommentType_ read Get_Comment;
    property Phonetictext: IXMLPhonetictext_x read Get_Phonetictext;
    property NamedCell: IXMLNamedCell_List read Get_NamedCell;
  end;

{ IXMLCommentType_ }

  IXMLCommentType_ = interface(IXMLNode)
    ['{982AB777-3CE2-450F-A8B2-1FE2278240AC}']
    { Property Accessors }
    function Get_Author: UnicodeString;
    function Get_ShowAlways: UnicodeString;
    function Get_Data: IXMLData_;
    procedure Set_Author(Value: UnicodeString);
    procedure Set_ShowAlways(Value: UnicodeString);
    { Methods & Properties }
    property Author: UnicodeString read Get_Author write Set_Author;
    property ShowAlways: UnicodeString read Get_ShowAlways write Set_ShowAlways;
    property Data: IXMLData_ read Get_Data;
  end;

{ IXMLNamedCell_ }

  IXMLNamedCell_ = interface(IXMLNode)
    ['{9EDBA08C-03EA-4D23-A4DA-89617785D3E1}']
    { Property Accessors }
    function Get_Name: UnicodeString;
    procedure Set_Name(Value: UnicodeString);
    { Methods & Properties }
    property Name: UnicodeString read Get_Name write Set_Name;
  end;

{ IXMLNamedCell_List }

  IXMLNamedCell_List = interface(IXMLNodeCollection)
    ['{2911750D-10F5-4ED8-A8D1-0D4A46126178}']
    { Methods & Properties }
    function Add: IXMLNamedCell_;
    function Insert(const Index: Integer): IXMLNamedCell_;

    function Get_Item(Index: Integer): IXMLNamedCell_;
    property Items[Index: Integer]: IXMLNamedCell_ read Get_Item; default;
  end;

{ IXMLActiveRowsType_x2 }

  IXMLActiveRowsType_x2 = interface(IXMLNodeCollection)
    ['{9EDD237C-72C7-428B-AF17-AA87EB8D3016}']
    { Property Accessors }
    function Get_ActiveRow(Index: Integer): UnicodeString;
    { Methods & Properties }
    function Add(const ActiveRow: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const ActiveRow: UnicodeString): IXMLNode;
    property ActiveRow[Index: Integer]: UnicodeString read Get_ActiveRow; default;
  end;

{ IXMLMapdata_x2 }

  IXMLMapdata_x2 = interface(IXMLNode)
    ['{7727B050-111D-4F02-8939-B7BEB2E6E501}']
  end;

{ IXMLBindingType_x2 }

  IXMLBindingType_x2 = interface(IXMLNode)
    ['{17473B4D-7F1D-4F01-A1FE-2D0C89A9522B}']
    { Property Accessors }
    function Get_ID: UnicodeString;
    function Get_LoadMode: UnicodeString;
    function Get_Async: UnicodeString;
    function Get_MapID: UnicodeString;
    function Get_DataSource: IXMLDataSource_;
    procedure Set_ID(Value: UnicodeString);
    procedure Set_LoadMode(Value: UnicodeString);
    procedure Set_Async(Value: UnicodeString);
    procedure Set_MapID(Value: UnicodeString);
    { Methods & Properties }
    property ID: UnicodeString read Get_ID write Set_ID;
    property LoadMode: UnicodeString read Get_LoadMode write Set_LoadMode;
    property Async: UnicodeString read Get_Async write Set_Async;
    property MapID: UnicodeString read Get_MapID write Set_MapID;
    property DataSource: IXMLDataSource_ read Get_DataSource;
  end;

{ IXMLBindingType_x2List }

  IXMLBindingType_x2List = interface(IXMLNodeCollection)
    ['{331D49CD-660D-481E-9EAD-98A79678F991}']
    { Methods & Properties }
    function Add: IXMLBindingType_x2;
    function Insert(const Index: Integer): IXMLBindingType_x2;

    function Get_Item(Index: Integer): IXMLBindingType_x2;
    property Items[Index: Integer]: IXMLBindingType_x2 read Get_Item; default;
  end;

{ IXMLDataSource_ }

  IXMLDataSource_ = interface(IXMLNode)
    ['{23D51C2C-8D47-418D-A89E-FA419F397386}']
    { Property Accessors }
    function Get_MinorVersion: UnicodeString;
    function Get_MajorVersion: UnicodeString;
    function Get_Type_: IXMLType__;
    function Get_Name: UnicodeString;
    function Get_ConnectionInfo: IXMLConnectionInfoType_;
    function Get_Description: UnicodeString;
    function Get_Keywords: UnicodeString;
    function Get_TooltipInfo: UnicodeString;
    procedure Set_MinorVersion(Value: UnicodeString);
    procedure Set_MajorVersion(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Description(Value: UnicodeString);
    procedure Set_Keywords(Value: UnicodeString);
    procedure Set_TooltipInfo(Value: UnicodeString);
    { Methods & Properties }
    property MinorVersion: UnicodeString read Get_MinorVersion write Set_MinorVersion;
    property MajorVersion: UnicodeString read Get_MajorVersion write Set_MajorVersion;
    property Type_: IXMLType__ read Get_Type_;
    property Name: UnicodeString read Get_Name write Set_Name;
    property ConnectionInfo: IXMLConnectionInfoType_ read Get_ConnectionInfo;
    property Description: UnicodeString read Get_Description write Set_Description;
    property Keywords: UnicodeString read Get_Keywords write Set_Keywords;
    property TooltipInfo: UnicodeString read Get_TooltipInfo write Set_TooltipInfo;
  end;

{ IXMLType__ }

  IXMLType__ = interface(IXMLNode)
    ['{6D20C28F-0CB7-4DA6-9558-BF0FE0828C4E}']
    { Property Accessors }
    function Get_Type_: UnicodeString;
    function Get_MajorVersion: UnicodeString;
    function Get_MinorVersion: UnicodeString;
    function Get_SubType: IXMLSubType_;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_MajorVersion(Value: UnicodeString);
    procedure Set_MinorVersion(Value: UnicodeString);
    { Methods & Properties }
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
    property MajorVersion: UnicodeString read Get_MajorVersion write Set_MajorVersion;
    property MinorVersion: UnicodeString read Get_MinorVersion write Set_MinorVersion;
    property SubType: IXMLSubType_ read Get_SubType;
  end;

{ IXMLSubType_ }

  IXMLSubType_ = interface(IXMLNode)
    ['{1B90A0DB-91B0-42DB-A4C8-CE0D70D95DD2}']
    { Property Accessors }
    function Get_Type_: UnicodeString;
    function Get_MinorVersion: UnicodeString;
    function Get_MajorVersion: UnicodeString;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_MinorVersion(Value: UnicodeString);
    procedure Set_MajorVersion(Value: UnicodeString);
    { Methods & Properties }
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
    property MinorVersion: UnicodeString read Get_MinorVersion write Set_MinorVersion;
    property MajorVersion: UnicodeString read Get_MajorVersion write Set_MajorVersion;
  end;

{ IXMLConnectionInfoType_ }

  IXMLConnectionInfoType_ = interface(IXMLNode)
    ['{E89BA7D7-3849-4044-96CF-EFE1B7B99291}']
    { Property Accessors }
    function Get_Purpose: UnicodeString;
    function Get_Location: IXMLLocation_;
    function Get_Authentication: IXMLAuthentication_;
    function Get_SOAPAction: UnicodeString;
    function Get_Header: IXMLHeader_;
    function Get_Body: IXMLBody_;
    function Get_File_: UnicodeString;
    function Get_ClientParameterBindings: IXMLClientParameterBindings_;
    function Get_ClientParameterValue: IXMLClientParameterValue_;
    function Get_Attribute: IXMLAttribute_;
    function Get_If_: IXMLIf__;
    function Get_CredentialValue: IXMLCredentialValue_;
    procedure Set_Purpose(Value: UnicodeString);
    procedure Set_SOAPAction(Value: UnicodeString);
    procedure Set_File_(Value: UnicodeString);
    { Methods & Properties }
    property Purpose: UnicodeString read Get_Purpose write Set_Purpose;
    property Location: IXMLLocation_ read Get_Location;
    property Authentication: IXMLAuthentication_ read Get_Authentication;
    property SOAPAction: UnicodeString read Get_SOAPAction write Set_SOAPAction;
    property Header: IXMLHeader_ read Get_Header;
    property Body: IXMLBody_ read Get_Body;
    property File_: UnicodeString read Get_File_ write Set_File_;
    property ClientParameterBindings: IXMLClientParameterBindings_ read Get_ClientParameterBindings;
    property ClientParameterValue: IXMLClientParameterValue_ read Get_ClientParameterValue;
    property Attribute: IXMLAttribute_ read Get_Attribute;
    property If_: IXMLIf__ read Get_If_;
    property CredentialValue: IXMLCredentialValue_ read Get_CredentialValue;
  end;

{ IXMLLocation_ }

  IXMLLocation_ = interface(IXMLNode)
    ['{4D673D9C-ED65-415B-9EE3-3153CC886A5D}']
    { Property Accessors }
    function Get_Href: UnicodeString;
    procedure Set_Href(Value: UnicodeString);
    { Methods & Properties }
    property Href: UnicodeString read Get_Href write Set_Href;
  end;

{ IXMLAuthentication_ }

  IXMLAuthentication_ = interface(IXMLNode)
    ['{ADBC1806-142E-4D96-AE4C-955502DB7A9B}']
    { Property Accessors }
    function Get_Windows: UnicodeString;
    function Get_Basic: IXMLBasic_;
    procedure Set_Windows(Value: UnicodeString);
    { Methods & Properties }
    property Windows: UnicodeString read Get_Windows write Set_Windows;
    property Basic: IXMLBasic_ read Get_Basic;
  end;

{ IXMLBasic_ }

  IXMLBasic_ = interface(IXMLNode)
    ['{5B6A4141-D127-47E7-88B5-0CEFFE63EE6F}']
    { Property Accessors }
    function Get_UseExplicit: IXMLUseExplicit_;
    { Methods & Properties }
    property UseExplicit: IXMLUseExplicit_ read Get_UseExplicit;
  end;

{ IXMLUseExplicit_ }

  IXMLUseExplicit_ = interface(IXMLNode)
    ['{BB95758F-481F-486C-835F-918C2F076C75}']
    { Property Accessors }
    function Get_UserId: IXMLUserId_;
    function Get_Password: IXMLPassword_;
    { Methods & Properties }
    property UserId: IXMLUserId_ read Get_UserId;
    property Password: IXMLPassword_ read Get_Password;
  end;

{ IXMLUserId_ }

  IXMLUserId_ = interface(IXMLNode)
    ['{9F680497-9B11-4B98-9884-94EA7ECBBE50}']
    { Property Accessors }
    function Get_Resource: UnicodeString;
    function Get_Type_: UnicodeString;
    procedure Set_Resource(Value: UnicodeString);
    procedure Set_Type_(Value: UnicodeString);
    { Methods & Properties }
    property Resource: UnicodeString read Get_Resource write Set_Resource;
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
  end;

{ IXMLPassword_ }

  IXMLPassword_ = interface(IXMLNode)
    ['{9F2F6E6C-5891-4FAA-92C4-0D461D448604}']
    { Property Accessors }
    function Get_Type_: UnicodeString;
    function Get_CredentialValue: UnicodeString;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_CredentialValue(Value: UnicodeString);
    { Methods & Properties }
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
    property CredentialValue: UnicodeString read Get_CredentialValue write Set_CredentialValue;
  end;

{ IXMLHeader_ }

  IXMLHeader_ = interface(IXMLNode)
    ['{38223406-3BEA-457D-BE57-12294955CFD9}']
  end;

{ IXMLBody_ }

  IXMLBody_ = interface(IXMLNode)
    ['{1D15DFD2-D7C9-4735-BEB5-20BC871B05B2}']
  end;

{ IXMLClientParameterBindings_ }

  IXMLClientParameterBindings_ = interface(IXMLNode)
    ['{2124C3B3-1DDE-4567-8CD5-8C87F9729A3D}']
    { Property Accessors }
    function Get_ClientParameterBinding: IXMLClientParameterBinding_;
    function Get_CredentialBinding: IXMLCredentialBinding_;
    { Methods & Properties }
    property ClientParameterBinding: IXMLClientParameterBinding_ read Get_ClientParameterBinding;
    property CredentialBinding: IXMLCredentialBinding_ read Get_CredentialBinding;
  end;

{ IXMLClientParameterBinding_ }

  IXMLClientParameterBinding_ = interface(IXMLNode)
    ['{4415B740-942C-4FC1-801D-F98E76A3D9BB}']
    { Property Accessors }
    function Get_Name: UnicodeString;
    function Get_Location: UnicodeString;
    function Get_Item: UnicodeString;
    function Get_DefaultValue: UnicodeString;
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Location(Value: UnicodeString);
    procedure Set_Item(Value: UnicodeString);
    procedure Set_DefaultValue(Value: UnicodeString);
    { Methods & Properties }
    property Name: UnicodeString read Get_Name write Set_Name;
    property Location: UnicodeString read Get_Location write Set_Location;
    property Item: UnicodeString read Get_Item write Set_Item;
    property DefaultValue: UnicodeString read Get_DefaultValue write Set_DefaultValue;
  end;

{ IXMLCredentialBinding_ }

  IXMLCredentialBinding_ = interface(IXMLNodeCollection)
    ['{09A0DA3A-E752-4B55-AD6E-45B50BF04C49}']
    { Property Accessors }
    function Get_Resource: UnicodeString;
    function Get_Credential(Index: Integer): IXMLCredential_;
    procedure Set_Resource(Value: UnicodeString);
    { Methods & Properties }
    function Add: IXMLCredential_;
    function Insert(const Index: Integer): IXMLCredential_;
    property Resource: UnicodeString read Get_Resource write Set_Resource;
    property Credential[Index: Integer]: IXMLCredential_ read Get_Credential; default;
  end;

{ IXMLCredential_ }

  IXMLCredential_ = interface(IXMLNode)
    ['{936FB742-F2AA-447F-8C62-20D7920A800F}']
    { Property Accessors }
    function Get_Type_: UnicodeString;
    function Get_DefaultValue: UnicodeString;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_DefaultValue(Value: UnicodeString);
    { Methods & Properties }
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
    property DefaultValue: UnicodeString read Get_DefaultValue write Set_DefaultValue;
  end;

{ IXMLClientParameterValue_ }

  IXMLClientParameterValue_ = interface(IXMLNode)
    ['{DB45BDE1-11C3-439D-B3E5-67F8638AFE00}']
    { Property Accessors }
    function Get_Name: UnicodeString;
    procedure Set_Name(Value: UnicodeString);
    { Methods & Properties }
    property Name: UnicodeString read Get_Name write Set_Name;
  end;

{ IXMLIf__ }

  IXMLIf__ = interface(IXMLNode)
    ['{6BC58A8C-B040-4224-8F21-9052FF6A25DB}']
    { Property Accessors }
    function Get_ClientParameter: UnicodeString;
    function Get_ClientParameterValue: IXMLClientParameterValue_;
    procedure Set_ClientParameter(Value: UnicodeString);
    { Methods & Properties }
    property ClientParameter: UnicodeString read Get_ClientParameter write Set_ClientParameter;
    property ClientParameterValue: IXMLClientParameterValue_ read Get_ClientParameterValue;
  end;

{ IXMLCredentialValue_ }

  IXMLCredentialValue_ = interface(IXMLNode)
    ['{DD7CB8BE-4513-4405-8B7B-CF7D5A27B1D9}']
    { Property Accessors }
    function Get_Resource: UnicodeString;
    function Get_Type_: UnicodeString;
    procedure Set_Resource(Value: UnicodeString);
    procedure Set_Type_(Value: UnicodeString);
    { Methods & Properties }
    property Resource: UnicodeString read Get_Resource write Set_Resource;
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
  end;

{ IXMLComponentOptionsType_c }

  IXMLComponentOptionsType_c = interface(IXMLNode)
    ['{90EAC837-8AC3-4885-B58D-872B14224C7B}']
    { Property Accessors }
    function Get_Toolbar: IXMLToolbar_c;
    function Get_SpreadsheetAutoFit: UnicodeString;
    function Get_Label_: IXMLLabel__c;
    function Get_MaxHeight: UnicodeString;
    function Get_MaxWidth: UnicodeString;
    function Get_NextSheetNumber: Integer;
    procedure Set_SpreadsheetAutoFit(Value: UnicodeString);
    procedure Set_MaxHeight(Value: UnicodeString);
    procedure Set_MaxWidth(Value: UnicodeString);
    procedure Set_NextSheetNumber(Value: Integer);
    { Methods & Properties }
    property Toolbar: IXMLToolbar_c read Get_Toolbar;
    property SpreadsheetAutoFit: UnicodeString read Get_SpreadsheetAutoFit write Set_SpreadsheetAutoFit;
    property Label_: IXMLLabel__c read Get_Label_;
    property MaxHeight: UnicodeString read Get_MaxHeight write Set_MaxHeight;
    property MaxWidth: UnicodeString read Get_MaxWidth write Set_MaxWidth;
    property NextSheetNumber: Integer read Get_NextSheetNumber write Set_NextSheetNumber;
  end;

{ IXMLToolbar_c }

  IXMLToolbar_c = interface(IXMLNode)
    ['{C48147B0-C052-4C28-9240-E6E64EE18444}']
    { Property Accessors }
    function Get_Hidden: UnicodeString;
    function Get_HideOfficeLogo: UnicodeString;
    procedure Set_Hidden(Value: UnicodeString);
    procedure Set_HideOfficeLogo(Value: UnicodeString);
    { Methods & Properties }
    property Hidden: UnicodeString read Get_Hidden write Set_Hidden;
    property HideOfficeLogo: UnicodeString read Get_HideOfficeLogo write Set_HideOfficeLogo;
  end;

{ IXMLLabel__c }

  IXMLLabel__c = interface(IXMLNode)
    ['{688FEBFA-520F-4719-B282-AB4111B01E7C}']
    { Property Accessors }
    function Get_Caption: UnicodeString;
    procedure Set_Caption(Value: UnicodeString);
    { Methods & Properties }
    property Caption: UnicodeString read Get_Caption write Set_Caption;
  end;

{ IXMLIntegerList }

  IXMLIntegerList = interface(IXMLNodeCollection)
    ['{BDF233D7-19E7-4B71-9DF2-687900ECC88D}']
    { Methods & Properties }
    function Add(const Value: Integer): IXMLNode;
    function Insert(const Index: Integer; const Value: Integer): IXMLNode;

    function Get_Item(Index: Integer): Integer;
    property Items[Index: Integer]: Integer read Get_Item; default;
  end;

{ IXMLSubtotalTypeList }

  IXMLSubtotalTypeList = interface(IXMLNodeCollection)
    ['{DCF99175-56DE-4E87-A4E7-BB4A06275E97}']
    { Methods & Properties }
    function Add(const Value: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;

    function Get_Item(Index: Integer): UnicodeString;
    property Items[Index: Integer]: UnicodeString read Get_Item; default;
  end;

{ IXMLDoubleList }

  IXMLDoubleList = interface(IXMLNodeCollection)
    ['{F4A35FC3-4171-40CA-8E56-3262E30F5BF3}']
    { Methods & Properties }
    function Add(const Value: Double): IXMLNode;
    function Insert(const Index: Integer; const Value: Double): IXMLNode;

    function Get_Item(Index: Integer): Double;
    property Items[Index: Integer]: Double read Get_Item; default;
  end;

{ IXMLString_List }

  IXMLString_List = interface(IXMLNodeCollection)
    ['{383268E2-5BFF-4A99-899D-35730AE181DE}']
    { Methods & Properties }
    function Add(const Value: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;

    function Get_Item(Index: Integer): UnicodeString;
    property Items[Index: Integer]: UnicodeString read Get_Item; default;
  end;

{ Forward Decls }

  TXMLWorkbook = class;
  TXMLSmartTagTypeElt_o = class;
  TXMLSmartTagTypeElt_oList = class;
  TXMLDocumentPropertiesElt_o = class;
  TXMLCustomDocumentPropertiesElt_o = class;
  TXMLOfficeDocumentSettingsElt_o = class;
  TXMLLocationOfComponentsElt_o = class;
  TXMLExcelWorkbook_x = class;
  TXMLPublishObjectsType_x = class;
  TXMLPublishObject_x = class;
  TXMLPublishObject_xList = class;
  TXMLLocation_x = class;
  TXMLAutoRepublish_x = class;
  TXMLSupBookType_x = class;
  TXMLSupBookType_xList = class;
  TXMLExternNameType_x = class;
  TXMLExternNameType_xList = class;
  TXMLXctType_x = class;
  TXMLXctType_xList = class;
  TXMLCrnType_x = class;
  TXMLCrnType_xList = class;
  TXMLRowType_x = class;
  TXMLMoperType_x = class;
  TXMLMoperType_xList = class;
  TXMLWorkbook_Styles = class;
  TXMLStyleType = class;
  TXMLAlignmentType = class;
  TXMLBordersType = class;
  TXMLBorderType = class;
  TXMLFontType = class;
  TXMLInteriorType = class;
  TXMLNumberFormatType = class;
  TXMLProtectionType = class;
  TXMLNamesType = class;
  TXMLNamesType_NamedRange = class;
  TXMLWorksheetType = class;
  TXMLWorksheetTypeList = class;
  TXMLTableType = class;
  TXMLTableType_Column = class;
  TXMLTableType_ColumnList = class;
  TXMLTableType_Row = class;
  TXMLTableType_RowList = class;
  TXMLCell = class;
  TXMLSmartTagsElt_o = class;
  TXMLSmartTagsElt_oList = class;
  TXMLData = class;
  TXMLCommentType = class;
  TXMLCommentType_Data = class;
  TXMLPhonetictext_x = class;
  TXMLNamedCell = class;
  TXMLNamedCellList = class;
  TXMLWorksheetOptionsType_x = class;
  TXMLPageSetupType_x = class;
  TXMLLayout_x = class;
  TXMLHeader_x = class;
  TXMLFooter_x = class;
  TXMLPageMargins_x = class;
  TXMLPrintType_x = class;
  TXMLPanesType_x = class;
  TXMLPaneType_x = class;
  TXMLSelectionType_x = class;
  TXMLPTRuleType_x = class;
  TXMLPTRuleType_xList = class;
  TXMLWatches_x = class;
  TXMLWatch_x = class;
  TXMLDataTable_x = class;
  TXMLPageBreaksType_x = class;
  TXMLColBreaks_x = class;
  TXMLColBreak_x = class;
  TXMLRowBreaks_x = class;
  TXMLRowBreak_x = class;
  TXMLPivotTableType_x = class;
  TXMLPivotTableType_xList = class;
  TXMLQTSourceType_x = class;
  TXMLCacheFile_x = class;
  TXMLQTQuerySourceType_x = class;
  TXMLEditWebPage_x = class;
  TXMLURLString_x = class;
  TXMLRefreshInfoType_x = class;
  TXMLColumnInfoType_x = class;
  TXMLColumnInfoType_xList = class;
  TXMLName_x = class;
  TXMLTextWizardSettingsType_x = class;
  TXMLFormatSettingsType_x = class;
  TXMLDelimiters_x = class;
  TXMLHTMLTablesType_x = class;
  TXMLParameterTypeE_x = class;
  TXMLParameterTypeE_xList = class;
  TXMLPivotViewType_x = class;
  TXMLTotalFormat_x = class;
  TXMLMemberFormat_x = class;
  TXMLFieldLabelFormat_x = class;
  TXMLLabel__x = class;
  TXMLLabel__xList = class;
  TXMLPLPivotFieldType_x = class;
  TXMLPLPivotFieldType_xList = class;
  TXMLDetailFormat_x = class;
  TXMLSubtotalFormat_x = class;
  TXMLPivotItemType_x = class;
  TXMLPivotItemType_xList = class;
  TXMLPLTotalType_x = class;
  TXMLPLTotalType_xList = class;
  TXMLAlignmentType_x = class;
  TXMLPivotAxisType_x = class;
  TXMLPivotAxisType_xList = class;
  TXMLPivotFieldType_x = class;
  TXMLPivotFieldType_xList = class;
  TXMLMapChildItemsType_x = class;
  TXMLMemberPropertyType_x = class;
  TXMLMemberPropertyType_xList = class;
  TXMLFilterMember_x = class;
  TXMLFilterMember_xList = class;
  TXMLDetailFormatType_x = class;
  TXMLSubtotalFormatType_x = class;
  TXMLCubeFieldType_x = class;
  TXMLCubeFieldType_xList = class;
  TXMLGroupLevel_x = class;
  TXMLGroupLevel_xList = class;
  TXMLGroupDefinitionType_x = class;
  TXMLGroupDefinitionType_xList = class;
  TXMLGroupMemberType_x = class;
  TXMLGroupMemberType_xList = class;
  TXMLCalculatedMember_x = class;
  TXMLPTLineItemsType_x = class;
  TXMLPTLineItemsType_xList = class;
  TXMLPTLineItemType_x = class;
  TXMLPTLineItemType_xList = class;
  TXMLPTSourceType_x = class;
  TXMLConsolidationReferenceType_x = class;
  TXMLPTQuerySourceType_x = class;
  TXMLSourceConsolidationType_x = class;
  TXMLReference_x = class;
  TXMLReference_xList = class;
  TXMLPTFormulaType_x = class;
  TXMLPTFormulaType_xList = class;
  TXMLPTFormatType_x = class;
  TXMLPTFormatType_xList = class;
  TXMLDataValidationType_x = class;
  TXMLDataValidationType_xList = class;
  TXMLAutoFilter_x = class;
  TXMLAutoFilterColumnType_x = class;
  TXMLAutoFilterConditionType_x = class;
  TXMLAutoFilterOr_x = class;
  TXMLAutoFilterAnd_x = class;
  TXMLConditionalFormattingType_x = class;
  TXMLConditionalFormattingType_xList = class;
  TXMLCondition_x = class;
  TXMLCondition_xList = class;
  TXMLFormat_x = class;
  TXMLSortingType_x = class;
  TXMLWorksheetoptions_c = class;
  TXMLQueryTableType_x = class;
  TXMLQueryTableType_xList = class;
  TXMLPivotCache_x = class;
  TXMLPivotCache_xList = class;
  TXMLSchema_ = class;
  TXMLElementType_ = class;
  TXMLAttribute_ = class;
  TXMLAttribute_List = class;
  TXMLExtends_ = class;
  TXMLExtends_List = class;
  TXMLAttributeType_ = class;
  TXMLAttributeType_List = class;
  TXMLDatatype_ = class;
  TXMLData_ = class;
  TXMLRow_ = class;
  TXMLMapInfoType_x2 = class;
  TXMLMapInfoType_x2List = class;
  TXMLSchemaType_x2 = class;
  TXMLSchemaType_x2List = class;
  TXMLMapType_x2 = class;
  TXMLMapType_x2List = class;
  TXMLEntryType_x2 = class;
  TXMLEntryType_x2List = class;
  TXMLFieldType_x2 = class;
  TXMLFieldType_x2List = class;
  TXMLCell_ = class;
  TXMLCommentType_ = class;
  TXMLNamedCell_ = class;
  TXMLNamedCell_List = class;
  TXMLActiveRowsType_x2 = class;
  TXMLMapdata_x2 = class;
  TXMLBindingType_x2 = class;
  TXMLBindingType_x2List = class;
  TXMLDataSource_ = class;
  TXMLType__ = class;
  TXMLSubType_ = class;
  TXMLConnectionInfoType_ = class;
  TXMLLocation_ = class;
  TXMLAuthentication_ = class;
  TXMLBasic_ = class;
  TXMLUseExplicit_ = class;
  TXMLUserId_ = class;
  TXMLPassword_ = class;
  TXMLHeader_ = class;
  TXMLBody_ = class;
  TXMLClientParameterBindings_ = class;
  TXMLClientParameterBinding_ = class;
  TXMLCredentialBinding_ = class;
  TXMLCredential_ = class;
  TXMLClientParameterValue_ = class;
  TXMLIf__ = class;
  TXMLCredentialValue_ = class;
  TXMLComponentOptionsType_c = class;
  TXMLToolbar_c = class;
  TXMLLabel__c = class;
  TXMLIntegerList = class;
  TXMLSubtotalTypeList = class;
  TXMLDoubleList = class;
  TXMLString_List = class;

{ TXMLWorkbook }

  TXMLWorkbook = class(TXMLNode, IXMLWorkbook)
  private
    FSmartTagType: IXMLSmartTagTypeElt_oList;
    FWorksheet: IXMLWorksheetTypeList;
    FPivotCache: IXMLPivotCache_xList;
    FMapInfo: IXMLMapInfoType_x2List;
    FBinding: IXMLBindingType_x2List;
  protected
    { IXMLWorkbook }
    function Get_SmartTagType: IXMLSmartTagTypeElt_oList;
    function Get_DocumentProperties: IXMLDocumentPropertiesElt_o;
    function Get_CustomDocumentProperties: IXMLCustomDocumentPropertiesElt_o;
    function Get_OfficeDocumentSettings: IXMLOfficeDocumentSettingsElt_o;
    function Get_ExcelWorkbook: IXMLExcelWorkbook_x;
    function Get_Styles: IXMLWorkbook_Styles;
    function Get_Names: IXMLNamesType;
    function Get_Worksheet: IXMLWorksheetTypeList;
    function Get_PivotCache: IXMLPivotCache_xList;
    function Get_Name: UnicodeString;
    function Get_MapInfo: IXMLMapInfoType_x2List;
    function Get_Binding: IXMLBindingType_x2List;
    function Get_ComponentOptions: IXMLComponentOptionsType_c;
    procedure Set_Name(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLSmartTagTypeElt_o }

  TXMLSmartTagTypeElt_o = class(TXMLNode, IXMLSmartTagTypeElt_o)
  protected
    { IXMLSmartTagTypeElt_o }
    function Get_Namespaceuri: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Url: UnicodeString;
    function Get_Namespaceuri: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Url: UnicodeString;
    procedure Set_Namespaceuri(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Url(Value: UnicodeString);
    procedure Set_Namespaceuri(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Url(Value: UnicodeString);
  end;

{ TXMLSmartTagTypeElt_oList }

  TXMLSmartTagTypeElt_oList = class(TXMLNodeCollection, IXMLSmartTagTypeElt_oList)
  protected
    { IXMLSmartTagTypeElt_oList }
    function Add: IXMLSmartTagTypeElt_o;
    function Insert(const Index: Integer): IXMLSmartTagTypeElt_o;

    function Get_Item(Index: Integer): IXMLSmartTagTypeElt_o;
  end;

{ TXMLDocumentPropertiesElt_o }

  TXMLDocumentPropertiesElt_o = class(TXMLNode, IXMLDocumentPropertiesElt_o)
  protected
    { IXMLDocumentPropertiesElt_o }
    function Get_Title: UnicodeString;
    function Get_Subject: UnicodeString;
    function Get_Author: UnicodeString;
    function Get_Keywords: UnicodeString;
    function Get_Description: UnicodeString;
    function Get_LastAuthor: UnicodeString;
    function Get_Revision: LongWord;
    function Get_AppName: UnicodeString;
    function Get_TotalTime: LongWord;
    function Get_LastPrinted: UnicodeString;
    function Get_Created: UnicodeString;
    function Get_LastSaved: UnicodeString;
    function Get_Pages: LongWord;
    function Get_Words: LongWord;
    function Get_Characters: LongWord;
    function Get_Category: UnicodeString;
    function Get_PresentationFormat: UnicodeString;
    function Get_Manager: UnicodeString;
    function Get_Company: UnicodeString;
    function Get_Guid: UnicodeString;
    function Get_HyperlinkBase: UnicodeString;
    function Get_Bytes: LongWord;
    function Get_Lines: LongWord;
    function Get_Paragraphs: LongWord;
    function Get_CharactersWithSpaces: LongWord;
    function Get_Version: UnicodeString;
    procedure Set_Title(Value: UnicodeString);
    procedure Set_Subject(Value: UnicodeString);
    procedure Set_Author(Value: UnicodeString);
    procedure Set_Keywords(Value: UnicodeString);
    procedure Set_Description(Value: UnicodeString);
    procedure Set_LastAuthor(Value: UnicodeString);
    procedure Set_Revision(Value: LongWord);
    procedure Set_AppName(Value: UnicodeString);
    procedure Set_TotalTime(Value: LongWord);
    procedure Set_LastPrinted(Value: UnicodeString);
    procedure Set_Created(Value: UnicodeString);
    procedure Set_LastSaved(Value: UnicodeString);
    procedure Set_Pages(Value: LongWord);
    procedure Set_Words(Value: LongWord);
    procedure Set_Characters(Value: LongWord);
    procedure Set_Category(Value: UnicodeString);
    procedure Set_PresentationFormat(Value: UnicodeString);
    procedure Set_Manager(Value: UnicodeString);
    procedure Set_Company(Value: UnicodeString);
    procedure Set_Guid(Value: UnicodeString);
    procedure Set_HyperlinkBase(Value: UnicodeString);
    procedure Set_Bytes(Value: LongWord);
    procedure Set_Lines(Value: LongWord);
    procedure Set_Paragraphs(Value: LongWord);
    procedure Set_CharactersWithSpaces(Value: LongWord);
    procedure Set_Version(Value: UnicodeString);
  end;

{ TXMLCustomDocumentPropertiesElt_o }

  TXMLCustomDocumentPropertiesElt_o = class(TXMLNode, IXMLCustomDocumentPropertiesElt_o)
  protected
    { IXMLCustomDocumentPropertiesElt_o }
  end;

{ TXMLOfficeDocumentSettingsElt_o }

  TXMLOfficeDocumentSettingsElt_o = class(TXMLNode, IXMLOfficeDocumentSettingsElt_o)
  protected
    { IXMLOfficeDocumentSettingsElt_o }
    function Get_DownloadComponents: UnicodeString;
    function Get_LocationOfComponents: IXMLLocationOfComponentsElt_o;
    procedure Set_DownloadComponents(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLLocationOfComponentsElt_o }

  TXMLLocationOfComponentsElt_o = class(TXMLNode, IXMLLocationOfComponentsElt_o)
  protected
    { IXMLLocationOfComponentsElt_o }
    function Get_HRef: UnicodeString;
    procedure Set_HRef(Value: UnicodeString);
  end;

{ TXMLExcelWorkbook_x }

  TXMLExcelWorkbook_x = class(TXMLNode, IXMLExcelWorkbook_x)
  private
    FSupBook: IXMLSupBookType_xList;
  protected
    { IXMLExcelWorkbook_x }
    function Get_PublishObjects: IXMLPublishObjectsType_x;
    function Get_SupBook: IXMLSupBookType_xList;
    function Get_SelectedSheets: Integer;
    function Get_WindowHidden: UnicodeString;
    function Get_HideHorizontalScrollBar: UnicodeString;
    function Get_HideVerticalScrollBar: UnicodeString;
    function Get_HideWorkbookTabs: UnicodeString;
    function Get_WindowHeight: Int64;
    function Get_WindowWidth: Int64;
    function Get_WindowTopX: Int64;
    function Get_WindowTopY: Int64;
    function Get_ActiveSheet: Integer;
    function Get_ActiveChart: UnicodeString;
    function Get_FirstVisibleSheet: Integer;
    function Get_HidePivotTableFieldList: UnicodeString;
    function Get_ProtectStructure: UnicodeString;
    function Get_ProtectWindows: UnicodeString;
    function Get_DisplayInkNotes: UnicodeString;
    function Get_EmbedSaveSmartTags: UnicodeString;
    function Get_FutureVer: UnicodeString;
    function Get_TabRatio: Integer;
    function Get_WindowIconic: UnicodeString;
    function Get_DisplayDrawingObjects: UnicodeString;
    function Get_CreateBackup: UnicodeString;
    function Get_Calculation: UnicodeString;
    function Get_DoNotCalculateBeforeSave: UnicodeString;
    function Get_Date1904: UnicodeString;
    function Get_RefModeR1C1: UnicodeString;
    function Get_Iteration: UnicodeString;
    function Get_MaxIterations: UnicodeString;
    function Get_MaxChange: Double;
    function Get_PrecisionAsDisplayed: UnicodeString;
    function Get_DoNotSaveLinkValues: UnicodeString;
    function Get_NoAutoRecover: UnicodeString;
    function Get_AcceptLabelsInFormulas: UnicodeString;
    function Get_Uncalced: UnicodeString;
    procedure Set_SelectedSheets(Value: Integer);
    procedure Set_WindowHidden(Value: UnicodeString);
    procedure Set_HideHorizontalScrollBar(Value: UnicodeString);
    procedure Set_HideVerticalScrollBar(Value: UnicodeString);
    procedure Set_HideWorkbookTabs(Value: UnicodeString);
    procedure Set_WindowHeight(Value: Int64);
    procedure Set_WindowWidth(Value: Int64);
    procedure Set_WindowTopX(Value: Int64);
    procedure Set_WindowTopY(Value: Int64);
    procedure Set_ActiveSheet(Value: Integer);
    procedure Set_ActiveChart(Value: UnicodeString);
    procedure Set_FirstVisibleSheet(Value: Integer);
    procedure Set_HidePivotTableFieldList(Value: UnicodeString);
    procedure Set_ProtectStructure(Value: UnicodeString);
    procedure Set_ProtectWindows(Value: UnicodeString);
    procedure Set_DisplayInkNotes(Value: UnicodeString);
    procedure Set_EmbedSaveSmartTags(Value: UnicodeString);
    procedure Set_FutureVer(Value: UnicodeString);
    procedure Set_TabRatio(Value: Integer);
    procedure Set_WindowIconic(Value: UnicodeString);
    procedure Set_DisplayDrawingObjects(Value: UnicodeString);
    procedure Set_CreateBackup(Value: UnicodeString);
    procedure Set_Calculation(Value: UnicodeString);
    procedure Set_DoNotCalculateBeforeSave(Value: UnicodeString);
    procedure Set_Date1904(Value: UnicodeString);
    procedure Set_RefModeR1C1(Value: UnicodeString);
    procedure Set_Iteration(Value: UnicodeString);
    procedure Set_MaxIterations(Value: UnicodeString);
    procedure Set_MaxChange(Value: Double);
    procedure Set_PrecisionAsDisplayed(Value: UnicodeString);
    procedure Set_DoNotSaveLinkValues(Value: UnicodeString);
    procedure Set_NoAutoRecover(Value: UnicodeString);
    procedure Set_AcceptLabelsInFormulas(Value: UnicodeString);
    procedure Set_Uncalced(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLPublishObjectsType_x }

  TXMLPublishObjectsType_x = class(TXMLNode, IXMLPublishObjectsType_x)
  private
    FPublishObject: IXMLPublishObject_xList;
  protected
    { IXMLPublishObjectsType_x }
    function Get_PublishObject: IXMLPublishObject_xList;
    function Get_AutoRepublish: IXMLAutoRepublish_x;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLPublishObject_x }

  TXMLPublishObject_x = class(TXMLNode, IXMLPublishObject_x)
  protected
    { IXMLPublishObject_x }
    function Get_Id: Int64;
    function Get_DivID: UnicodeString;
    function Get_SourceType: UnicodeString;
    function Get_Source: UnicodeString;
    function Get_HtmlType: UnicodeString;
    function Get_Location: IXMLLocation_x;
    procedure Set_Id(Value: Int64);
    procedure Set_DivID(Value: UnicodeString);
    procedure Set_SourceType(Value: UnicodeString);
    procedure Set_Source(Value: UnicodeString);
    procedure Set_HtmlType(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLPublishObject_xList }

  TXMLPublishObject_xList = class(TXMLNodeCollection, IXMLPublishObject_xList)
  protected
    { IXMLPublishObject_xList }
    function Add: IXMLPublishObject_x;
    function Insert(const Index: Integer): IXMLPublishObject_x;

    function Get_Item(Index: Integer): IXMLPublishObject_x;
  end;

{ TXMLLocation_x }

  TXMLLocation_x = class(TXMLNode, IXMLLocation_x)
  protected
    { IXMLLocation_x }
    function Get_HRef: UnicodeString;
    procedure Set_HRef(Value: UnicodeString);
  end;

{ TXMLAutoRepublish_x }

  TXMLAutoRepublish_x = class(TXMLNodeCollection, IXMLAutoRepublish_x)
  protected
    { IXMLAutoRepublish_x }
    function Get_DivID(Index: Integer): UnicodeString;
    function Add(const DivID: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const DivID: UnicodeString): IXMLNode;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLSupBookType_x }

  TXMLSupBookType_x = class(TXMLNode, IXMLSupBookType_x)
  private
    FSheetName: IXMLString_List;
    FExternName: IXMLExternNameType_xList;
    FXct: IXMLXctType_xList;
  protected
    { IXMLSupBookType_x }
    function Get_Path: UnicodeString;
    function Get_SheetName: IXMLString_List;
    function Get_ExternName: IXMLExternNameType_xList;
    function Get_Xct: IXMLXctType_xList;
    procedure Set_Path(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLSupBookType_xList }

  TXMLSupBookType_xList = class(TXMLNodeCollection, IXMLSupBookType_xList)
  protected
    { IXMLSupBookType_xList }
    function Add: IXMLSupBookType_x;
    function Insert(const Index: Integer): IXMLSupBookType_x;

    function Get_Item(Index: Integer): IXMLSupBookType_x;
  end;

{ TXMLExternNameType_x }

  TXMLExternNameType_x = class(TXMLNode, IXMLExternNameType_x)
  protected
    { IXMLExternNameType_x }
    function Get_Name: UnicodeString;
    function Get_Formula: UnicodeString;
    function Get_OleLink: UnicodeString;
    function Get_WantAdvise: UnicodeString;
    function Get_WantPict: UnicodeString;
    function Get_Cf: Integer;
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Formula(Value: UnicodeString);
    procedure Set_OleLink(Value: UnicodeString);
    procedure Set_WantAdvise(Value: UnicodeString);
    procedure Set_WantPict(Value: UnicodeString);
    procedure Set_Cf(Value: Integer);
  end;

{ TXMLExternNameType_xList }

  TXMLExternNameType_xList = class(TXMLNodeCollection, IXMLExternNameType_xList)
  protected
    { IXMLExternNameType_xList }
    function Add: IXMLExternNameType_x;
    function Insert(const Index: Integer): IXMLExternNameType_x;

    function Get_Item(Index: Integer): IXMLExternNameType_x;
  end;

{ TXMLXctType_x }

  TXMLXctType_x = class(TXMLNode, IXMLXctType_x)
  private
    FCrn: IXMLCrnType_xList;
    FMoper: IXMLMoperType_xList;
  protected
    { IXMLXctType_x }
    function Get_Count: Integer;
    function Get_SheetIndex: Integer;
    function Get_Crn: IXMLCrnType_xList;
    function Get_Moper: IXMLMoperType_xList;
    procedure Set_Count(Value: Integer);
    procedure Set_SheetIndex(Value: Integer);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLXctType_xList }

  TXMLXctType_xList = class(TXMLNodeCollection, IXMLXctType_xList)
  protected
    { IXMLXctType_xList }
    function Add: IXMLXctType_x;
    function Insert(const Index: Integer): IXMLXctType_x;

    function Get_Item(Index: Integer): IXMLXctType_x;
  end;

{ TXMLCrnType_x }

  TXMLCrnType_x = class(TXMLNode, IXMLCrnType_x)
  private
    FNumber: IXMLDoubleList;
  protected
    { IXMLCrnType_x }
    function Get_Row: IXMLRowType_x;
    function Get_ColFirst: Integer;
    function Get_ColLast: Integer;
    function Get_Number: IXMLDoubleList;
    function Get_Text: UnicodeString;
    function Get_Boolean: UnicodeString;
    function Get_Error: UnicodeString;
    procedure Set_ColFirst(Value: Integer);
    procedure Set_ColLast(Value: Integer);
    procedure Set_Text(Value: UnicodeString);
    procedure Set_Boolean(Value: UnicodeString);
    procedure Set_Error(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLCrnType_xList }

  TXMLCrnType_xList = class(TXMLNodeCollection, IXMLCrnType_xList)
  protected
    { IXMLCrnType_xList }
    function Add: IXMLCrnType_x;
    function Insert(const Index: Integer): IXMLCrnType_x;

    function Get_Item(Index: Integer): IXMLCrnType_x;
  end;

{ TXMLRowType_x }

  TXMLRowType_x = class(TXMLNode, IXMLRowType_x)
  protected
    { IXMLRowType_x }
    function Get_ColumnName: UnicodeString;
    procedure Set_ColumnName(Value: UnicodeString);
  end;

{ TXMLMoperType_x }

  TXMLMoperType_x = class(TXMLNode, IXMLMoperType_x)
  protected
    { IXMLMoperType_x }
    function Get_RowLast: Integer;
    function Get_ColLast: Integer;
    function Get_Number: Integer;
    function Get_Text: UnicodeString;
    function Get_Boolean: UnicodeString;
    function Get_Error: UnicodeString;
    procedure Set_RowLast(Value: Integer);
    procedure Set_ColLast(Value: Integer);
    procedure Set_Number(Value: Integer);
    procedure Set_Text(Value: UnicodeString);
    procedure Set_Boolean(Value: UnicodeString);
    procedure Set_Error(Value: UnicodeString);
  end;

{ TXMLMoperType_xList }

  TXMLMoperType_xList = class(TXMLNodeCollection, IXMLMoperType_xList)
  protected
    { IXMLMoperType_xList }
    function Add: IXMLMoperType_x;
    function Insert(const Index: Integer): IXMLMoperType_x;

    function Get_Item(Index: Integer): IXMLMoperType_x;
  end;

{ TXMLWorkbook_Styles }

  TXMLWorkbook_Styles = class(TXMLNodeCollection, IXMLWorkbook_Styles)
  protected
    { IXMLWorkbook_Styles }
    function Get_Style(Index: Integer): IXMLStyleType;
    function Add: IXMLStyleType;
    function Insert(const Index: Integer): IXMLStyleType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLStyleType }

  TXMLStyleType = class(TXMLNode, IXMLStyleType)
  protected
    { IXMLStyleType }
    function Get_ID: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Parent: UnicodeString;
    function Get_Alignment: IXMLAlignmentType;
    function Get_Borders: IXMLBordersType;
    function Get_Font: IXMLFontType;
    function Get_Interior: IXMLInteriorType;
    function Get_NumberFormat: IXMLNumberFormatType;
    function Get_Protection: IXMLProtectionType;
    procedure Set_ID(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Parent(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLAlignmentType }

  TXMLAlignmentType = class(TXMLNode, IXMLAlignmentType)
  protected
    { IXMLAlignmentType }
    function Get_Horizontal: UnicodeString;
    function Get_ReadingOrder: UnicodeString;
    function Get_Indent: Int64;
    function Get_Rotate: Double;
    function Get_ShrinkToFit: UnicodeString;
    function Get_Vertical: UnicodeString;
    function Get_VerticalText: UnicodeString;
    function Get_WrapText: UnicodeString;
    procedure Set_Horizontal(Value: UnicodeString);
    procedure Set_ReadingOrder(Value: UnicodeString);
    procedure Set_Indent(Value: Int64);
    procedure Set_Rotate(Value: Double);
    procedure Set_ShrinkToFit(Value: UnicodeString);
    procedure Set_Vertical(Value: UnicodeString);
    procedure Set_VerticalText(Value: UnicodeString);
    procedure Set_WrapText(Value: UnicodeString);
  end;

{ TXMLBordersType }

  TXMLBordersType = class(TXMLNodeCollection, IXMLBordersType)
  protected
    { IXMLBordersType }
    function Get_Border(Index: Integer): IXMLBorderType;
    function Add: IXMLBorderType;
    function Insert(const Index: Integer): IXMLBorderType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLBorderType }

  TXMLBorderType = class(TXMLNode, IXMLBorderType)
  protected
    { IXMLBorderType }
    function Get_Position: UnicodeString;
    function Get_Color: UnicodeString;
    function Get_LineStyle: UnicodeString;
    function Get_Weight: Double;
    procedure Set_Position(Value: UnicodeString);
    procedure Set_Color(Value: UnicodeString);
    procedure Set_LineStyle(Value: UnicodeString);
    procedure Set_Weight(Value: Double);
  end;

{ TXMLFontType }

  TXMLFontType = class(TXMLNode, IXMLFontType)
  protected
    { IXMLFontType }
    function Get_Bold: UnicodeString;
    function Get_Color: UnicodeString;
    function Get_FontName: UnicodeString;
    function Get_Italic: UnicodeString;
    function Get_Outline: UnicodeString;
    function Get_Shadow: UnicodeString;
    function Get_Size: Double;
    function Get_StrikeThrough: UnicodeString;
    function Get_Underline: UnicodeString;
    function Get_VerticalAlign: UnicodeString;
    function Get_CharSet: Integer;
    function Get_Family: UnicodeString;
    procedure Set_Bold(Value: UnicodeString);
    procedure Set_Color(Value: UnicodeString);
    procedure Set_FontName(Value: UnicodeString);
    procedure Set_Italic(Value: UnicodeString);
    procedure Set_Outline(Value: UnicodeString);
    procedure Set_Shadow(Value: UnicodeString);
    procedure Set_Size(Value: Double);
    procedure Set_StrikeThrough(Value: UnicodeString);
    procedure Set_Underline(Value: UnicodeString);
    procedure Set_VerticalAlign(Value: UnicodeString);
    procedure Set_CharSet(Value: Integer);
    procedure Set_Family(Value: UnicodeString);
  end;

{ TXMLInteriorType }

  TXMLInteriorType = class(TXMLNode, IXMLInteriorType)
  protected
    { IXMLInteriorType }
    function Get_Color: UnicodeString;
    function Get_Pattern: UnicodeString;
    function Get_PatternColor: UnicodeString;
    procedure Set_Color(Value: UnicodeString);
    procedure Set_Pattern(Value: UnicodeString);
    procedure Set_PatternColor(Value: UnicodeString);
  end;

{ TXMLNumberFormatType }

  TXMLNumberFormatType = class(TXMLNode, IXMLNumberFormatType)
  protected
    { IXMLNumberFormatType }
    function Get_Format: UnicodeString;
    procedure Set_Format(Value: UnicodeString);
  end;

{ TXMLProtectionType }

  TXMLProtectionType = class(TXMLNode, IXMLProtectionType)
  protected
    { IXMLProtectionType }
    function Get_Protected_: UnicodeString;
    function Get_HideFormula: UnicodeString;
    procedure Set_Protected_(Value: UnicodeString);
    procedure Set_HideFormula(Value: UnicodeString);
  end;

{ TXMLNamesType }

  TXMLNamesType = class(TXMLNodeCollection, IXMLNamesType)
  protected
    { IXMLNamesType }
    function Get_NamedRange(Index: Integer): IXMLNamesType_NamedRange;
    function Add: IXMLNamesType_NamedRange;
    function Insert(const Index: Integer): IXMLNamesType_NamedRange;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLNamesType_NamedRange }

  TXMLNamesType_NamedRange = class(TXMLNode, IXMLNamesType_NamedRange)
  protected
    { IXMLNamesType_NamedRange }
    function Get_Name: UnicodeString;
    function Get_RefersTo: UnicodeString;
    function Get_Hidden: UnicodeString;
    function Get_PasteRefersTo: UnicodeString;
    procedure Set_Name(Value: UnicodeString);
    procedure Set_RefersTo(Value: UnicodeString);
    procedure Set_Hidden(Value: UnicodeString);
    procedure Set_PasteRefersTo(Value: UnicodeString);
  end;

{ TXMLWorksheetType }

  TXMLWorksheetType = class(TXMLNode, IXMLWorksheetType)
  private
    FPivotTable: IXMLPivotTableType_xList;
    FDataValidation: IXMLDataValidationType_xList;
    FConditionalFormatting: IXMLConditionalFormattingType_xList;
    FQueryTable: IXMLQueryTableType_xList;
  protected
    { IXMLWorksheetType }
    function Get_Name: UnicodeString;
    function Get_Protected_: UnicodeString;
    function Get_RightToLeft: UnicodeString;
    function Get_Names: IXMLNamesType;
    function Get_Table: IXMLTableType;
    function Get_WorksheetOptions: IXMLWorksheetOptionsType_x;
    function Get_Watches: IXMLWatches_x;
    function Get_DataTable: IXMLDataTable_x;
    function Get_PageBreaks: IXMLPageBreaksType_x;
    function Get_PivotTable: IXMLPivotTableType_xList;
    function Get_DataValidation: IXMLDataValidationType_xList;
    function Get_AutoFilter: IXMLAutoFilter_x;
    function Get_ConditionalFormatting: IXMLConditionalFormattingType_xList;
    function Get_Sorting: IXMLSortingType_x;
    function Get_Worksheetoptions: IXMLWorksheetoptions_c;
    function Get_QueryTable: IXMLQueryTableType_xList;
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Protected_(Value: UnicodeString);
    procedure Set_RightToLeft(Value: UnicodeString);
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
  private
    FColumn: IXMLTableType_ColumnList;
    FRow: IXMLTableType_RowList;
  protected
    { IXMLTableType }
    function Get_DefaultColumnWidth: Double;
    function Get_DefaultRowHeight: Double;
    function Get_ExpandedColumnCount: LongWord;
    function Get_ExpandedRowCount: LongWord;
    function Get_StyleID: UnicodeString;
    function Get_LeftCell: LongWord;
    function Get_TopCell: Integer;
    function Get_FullColumns: UnicodeString;
    function Get_FullRows: UnicodeString;
    function Get_FullColumns: UnicodeString;
    function Get_FullRows: UnicodeString;
    function Get_DefaultRowHeight: UnicodeString;
    function Get_DefaultColumnWidth: UnicodeString;
    function Get_Column: IXMLTableType_ColumnList;
    function Get_Row: IXMLTableType_RowList;
    procedure Set_DefaultColumnWidth(Value: Double);
    procedure Set_DefaultRowHeight(Value: Double);
    procedure Set_ExpandedColumnCount(Value: LongWord);
    procedure Set_ExpandedRowCount(Value: LongWord);
    procedure Set_StyleID(Value: UnicodeString);
    procedure Set_LeftCell(Value: LongWord);
    procedure Set_TopCell(Value: Integer);
    procedure Set_FullColumns(Value: UnicodeString);
    procedure Set_FullRows(Value: UnicodeString);
    procedure Set_FullColumns(Value: UnicodeString);
    procedure Set_FullRows(Value: UnicodeString);
    procedure Set_DefaultRowHeight(Value: UnicodeString);
    procedure Set_DefaultColumnWidth(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTableType_Column }

  TXMLTableType_Column = class(TXMLNode, IXMLTableType_Column)
  protected
    { IXMLTableType_Column }
    function Get_AutoFitWidth: UnicodeString;
    function Get_Hidden: UnicodeString;
    function Get_Index: LongWord;
    function Get_Span: LongWord;
    function Get_StyleID: UnicodeString;
    function Get_Width: Double;
    function Get_Caption: UnicodeString;
    procedure Set_AutoFitWidth(Value: UnicodeString);
    procedure Set_Hidden(Value: UnicodeString);
    procedure Set_Index(Value: LongWord);
    procedure Set_Span(Value: LongWord);
    procedure Set_StyleID(Value: UnicodeString);
    procedure Set_Width(Value: Double);
    procedure Set_Caption(Value: UnicodeString);
  end;

{ TXMLTableType_ColumnList }

  TXMLTableType_ColumnList = class(TXMLNodeCollection, IXMLTableType_ColumnList)
  protected
    { IXMLTableType_ColumnList }
    function Add: IXMLTableType_Column;
    function Insert(const Index: Integer): IXMLTableType_Column;

    function Get_Item(Index: Integer): IXMLTableType_Column;
  end;

{ TXMLTableType_Row }

  TXMLTableType_Row = class(TXMLNodeCollection, IXMLTableType_Row)
  protected
    { IXMLTableType_Row }
    function Get_AutoFitHeight: UnicodeString;
    function Get_Height: Double;
    function Get_Hidden: UnicodeString;
    function Get_Index: LongWord;
    function Get_Span: LongWord;
    function Get_StyleID: UnicodeString;
    function Get_Caption: UnicodeString;
    function Get_Cell(Index: Integer): IXMLCell;
    procedure Set_AutoFitHeight(Value: UnicodeString);
    procedure Set_Height(Value: Double);
    procedure Set_Hidden(Value: UnicodeString);
    procedure Set_Index(Value: LongWord);
    procedure Set_Span(Value: LongWord);
    procedure Set_StyleID(Value: UnicodeString);
    procedure Set_Caption(Value: UnicodeString);
    function Add: IXMLCell;
    function Insert(const Index: Integer): IXMLCell;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTableType_RowList }

  TXMLTableType_RowList = class(TXMLNodeCollection, IXMLTableType_RowList)
  protected
    { IXMLTableType_RowList }
    function Add: IXMLTableType_Row;
    function Insert(const Index: Integer): IXMLTableType_Row;

    function Get_Item(Index: Integer): IXMLTableType_Row;
  end;

{ TXMLCell }

  TXMLCell = class(TXMLNode, IXMLCell)
  private
    FSmartTags: IXMLSmartTagsElt_oList;
    FNamedCell: IXMLNamedCellList;
  protected
    { IXMLCell }
    function Get_ArrayRange: UnicodeString;
    function Get_Formula: UnicodeString;
    function Get_HRef: UnicodeString;
    function Get_Index: LongWord;
    function Get_MergeAcross: Int64;
    function Get_MergeDown: Int64;
    function Get_StyleID: UnicodeString;
    function Get_HRefScreenTip: UnicodeString;
    function Get_PasteFormula: UnicodeString;
    function Get_SmartTags: IXMLSmartTagsElt_oList;
    function Get_Data: IXMLData;
    function Get_Comment: IXMLCommentType;
    function Get_Phonetictext: IXMLPhonetictext_x;
    function Get_NamedCell: IXMLNamedCellList;
    procedure Set_ArrayRange(Value: UnicodeString);
    procedure Set_Formula(Value: UnicodeString);
    procedure Set_HRef(Value: UnicodeString);
    procedure Set_Index(Value: LongWord);
    procedure Set_MergeAcross(Value: Int64);
    procedure Set_MergeDown(Value: Int64);
    procedure Set_StyleID(Value: UnicodeString);
    procedure Set_HRefScreenTip(Value: UnicodeString);
    procedure Set_PasteFormula(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLSmartTagsElt_o }

  TXMLSmartTagsElt_o = class(TXMLNode, IXMLSmartTagsElt_o)
  protected
    { IXMLSmartTagsElt_o }
  end;

{ TXMLSmartTagsElt_oList }

  TXMLSmartTagsElt_oList = class(TXMLNodeCollection, IXMLSmartTagsElt_oList)
  protected
    { IXMLSmartTagsElt_oList }
    function Add: IXMLSmartTagsElt_o;
    function Insert(const Index: Integer): IXMLSmartTagsElt_o;

    function Get_Item(Index: Integer): IXMLSmartTagsElt_o;
  end;

{ TXMLData }

  TXMLData = class(TXMLNode, IXMLData)
  protected
    { IXMLData }
    function Get_Type_: UnicodeString;
    function Get_Ticked: UnicodeString;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_Ticked(Value: UnicodeString);
  end;

{ TXMLCommentType }

  TXMLCommentType = class(TXMLNode, IXMLCommentType)
  protected
    { IXMLCommentType }
    function Get_Author: UnicodeString;
    function Get_ShowAlways: UnicodeString;
    function Get_Data: IXMLCommentType_Data;
    procedure Set_Author(Value: UnicodeString);
    procedure Set_ShowAlways(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLCommentType_Data }

  TXMLCommentType_Data = class(TXMLNode, IXMLCommentType_Data)
  protected
    { IXMLCommentType_Data }
  end;

{ TXMLPhonetictext_x }

  TXMLPhonetictext_x = class(TXMLNode, IXMLPhonetictext_x)
  protected
    { IXMLPhonetictext_x }
    function Get_Visible: UnicodeString;
    procedure Set_Visible(Value: UnicodeString);
  end;

{ TXMLNamedCell }

  TXMLNamedCell = class(TXMLNode, IXMLNamedCell)
  protected
    { IXMLNamedCell }
    function Get_Name: UnicodeString;
    procedure Set_Name(Value: UnicodeString);
  end;

{ TXMLNamedCellList }

  TXMLNamedCellList = class(TXMLNodeCollection, IXMLNamedCellList)
  protected
    { IXMLNamedCellList }
    function Add: IXMLNamedCell;
    function Insert(const Index: Integer): IXMLNamedCell;

    function Get_Item(Index: Integer): IXMLNamedCell;
  end;

{ TXMLWorksheetOptionsType_x }

  TXMLWorksheetOptionsType_x = class(TXMLNode, IXMLWorksheetOptionsType_x)
  protected
    { IXMLWorksheetOptionsType_x }
    function Get_FitToPage: UnicodeString;
    function Get_DoNotDisplayColHeaders: UnicodeString;
    function Get_DoNotDisplayRowHeaders: UnicodeString;
    function Get_ViewableRange: UnicodeString;
    function Get_Selection: UnicodeString;
    function Get_GridlineColor: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_ExcelWorksheetType: UnicodeString;
    function Get_IntlMacro: UnicodeString;
    function Get_Unsynced: UnicodeString;
    function Get_Selected: UnicodeString;
    function Get_CodeName: UnicodeString;
    function Get_PageSetup: IXMLPageSetupType_x;
    function Get_DisplayPageBreak: UnicodeString;
    function Get_TransitionExpressionEvaluation: UnicodeString;
    function Get_TransitionFormulaEntry: UnicodeString;
    function Get_Print: IXMLPrintType_x;
    function Get_Zoom: Integer;
    function Get_PageBreakZoom: Integer;
    function Get_ShowPageBreakZoom: UnicodeString;
    function Get_DefaultRowHeight: Integer;
    function Get_DefaultColumnWidth: Integer;
    function Get_StandardWidth: Integer;
    function Get_Visible: UnicodeString;
    function Get_LeftColumnVisible: Integer;
    function Get_DisplayRightToLeft: UnicodeString;
    function Get_GridlineColorIndex: Integer;
    function Get_DisplayFormulas: UnicodeString;
    function Get_DoNotDisplayGridlines: UnicodeString;
    function Get_DoNotDisplayHeadings: UnicodeString;
    function Get_DoNotDisplayOutline: UnicodeString;
    function Get_ApplyAutomaticOutlineStyles: UnicodeString;
    function Get_NoSummaryRowsBelowDetail: UnicodeString;
    function Get_NoSummaryColumnsRightDetail: UnicodeString;
    function Get_DoNotDisplayZeros: UnicodeString;
    function Get_ActiveRow: Integer;
    function Get_ActiveColumn: Integer;
    function Get_FilterOn: UnicodeString;
    function Get_RangeSelection: UnicodeString;
    function Get_TopRowVisible: Integer;
    function Get_TopRowBottomPane: Integer;
    function Get_LeftColumnRightPane: Integer;
    function Get_ActivePane: Integer;
    function Get_SplitHorizontal: Integer;
    function Get_SplitVertical: Integer;
    function Get_FreezePanes: UnicodeString;
    function Get_FrozenNoSplit: UnicodeString;
    function Get_TabColorIndex: Integer;
    function Get_Panes: IXMLPanesType_x;
    function Get_ProtectContents: UnicodeString;
    function Get_ProtectObjects: UnicodeString;
    function Get_ProtectScenarios: UnicodeString;
    function Get_EnableSelection: UnicodeString;
    function Get_AllowFormatCells: UnicodeString;
    function Get_AllowSizeCols: UnicodeString;
    function Get_AllowSizeRows: UnicodeString;
    function Get_AllowInsertCols: UnicodeString;
    function Get_AllowInsertRows: UnicodeString;
    function Get_AllowInsertHyperlinks: UnicodeString;
    function Get_AllowDeleteCols: UnicodeString;
    function Get_AllowDeleteRows: UnicodeString;
    function Get_AllowSort: UnicodeString;
    function Get_AllowFilter: UnicodeString;
    function Get_AllowUsePivotTables: UnicodeString;
    function Get_SpaceAbove: UnicodeString;
    function Get_SpaceBelow: UnicodeString;
    function Get_ZeroHeight: UnicodeString;
    procedure Set_FitToPage(Value: UnicodeString);
    procedure Set_DoNotDisplayColHeaders(Value: UnicodeString);
    procedure Set_DoNotDisplayRowHeaders(Value: UnicodeString);
    procedure Set_ViewableRange(Value: UnicodeString);
    procedure Set_Selection(Value: UnicodeString);
    procedure Set_GridlineColor(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
    procedure Set_ExcelWorksheetType(Value: UnicodeString);
    procedure Set_IntlMacro(Value: UnicodeString);
    procedure Set_Unsynced(Value: UnicodeString);
    procedure Set_Selected(Value: UnicodeString);
    procedure Set_CodeName(Value: UnicodeString);
    procedure Set_DisplayPageBreak(Value: UnicodeString);
    procedure Set_TransitionExpressionEvaluation(Value: UnicodeString);
    procedure Set_TransitionFormulaEntry(Value: UnicodeString);
    procedure Set_Zoom(Value: Integer);
    procedure Set_PageBreakZoom(Value: Integer);
    procedure Set_ShowPageBreakZoom(Value: UnicodeString);
    procedure Set_DefaultRowHeight(Value: Integer);
    procedure Set_DefaultColumnWidth(Value: Integer);
    procedure Set_StandardWidth(Value: Integer);
    procedure Set_Visible(Value: UnicodeString);
    procedure Set_LeftColumnVisible(Value: Integer);
    procedure Set_DisplayRightToLeft(Value: UnicodeString);
    procedure Set_GridlineColorIndex(Value: Integer);
    procedure Set_DisplayFormulas(Value: UnicodeString);
    procedure Set_DoNotDisplayGridlines(Value: UnicodeString);
    procedure Set_DoNotDisplayHeadings(Value: UnicodeString);
    procedure Set_DoNotDisplayOutline(Value: UnicodeString);
    procedure Set_ApplyAutomaticOutlineStyles(Value: UnicodeString);
    procedure Set_NoSummaryRowsBelowDetail(Value: UnicodeString);
    procedure Set_NoSummaryColumnsRightDetail(Value: UnicodeString);
    procedure Set_DoNotDisplayZeros(Value: UnicodeString);
    procedure Set_ActiveRow(Value: Integer);
    procedure Set_ActiveColumn(Value: Integer);
    procedure Set_FilterOn(Value: UnicodeString);
    procedure Set_RangeSelection(Value: UnicodeString);
    procedure Set_TopRowVisible(Value: Integer);
    procedure Set_TopRowBottomPane(Value: Integer);
    procedure Set_LeftColumnRightPane(Value: Integer);
    procedure Set_ActivePane(Value: Integer);
    procedure Set_SplitHorizontal(Value: Integer);
    procedure Set_SplitVertical(Value: Integer);
    procedure Set_FreezePanes(Value: UnicodeString);
    procedure Set_FrozenNoSplit(Value: UnicodeString);
    procedure Set_TabColorIndex(Value: Integer);
    procedure Set_ProtectContents(Value: UnicodeString);
    procedure Set_ProtectObjects(Value: UnicodeString);
    procedure Set_ProtectScenarios(Value: UnicodeString);
    procedure Set_EnableSelection(Value: UnicodeString);
    procedure Set_AllowFormatCells(Value: UnicodeString);
    procedure Set_AllowSizeCols(Value: UnicodeString);
    procedure Set_AllowSizeRows(Value: UnicodeString);
    procedure Set_AllowInsertCols(Value: UnicodeString);
    procedure Set_AllowInsertRows(Value: UnicodeString);
    procedure Set_AllowInsertHyperlinks(Value: UnicodeString);
    procedure Set_AllowDeleteCols(Value: UnicodeString);
    procedure Set_AllowDeleteRows(Value: UnicodeString);
    procedure Set_AllowSort(Value: UnicodeString);
    procedure Set_AllowFilter(Value: UnicodeString);
    procedure Set_AllowUsePivotTables(Value: UnicodeString);
    procedure Set_SpaceAbove(Value: UnicodeString);
    procedure Set_SpaceBelow(Value: UnicodeString);
    procedure Set_ZeroHeight(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLPageSetupType_x }

  TXMLPageSetupType_x = class(TXMLNode, IXMLPageSetupType_x)
  protected
    { IXMLPageSetupType_x }
    function Get_Layout: IXMLLayout_x;
    function Get_Header: IXMLHeader_x;
    function Get_Footer: IXMLFooter_x;
    function Get_PageMargins: IXMLPageMargins_x;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLLayout_x }

  TXMLLayout_x = class(TXMLNode, IXMLLayout_x)
  protected
    { IXMLLayout_x }
    function Get_Orientation: UnicodeString;
    function Get_CenterHorizontal: UnicodeString;
    function Get_CenterVertical: UnicodeString;
    function Get_StartPageNumber: UnicodeString;
    procedure Set_Orientation(Value: UnicodeString);
    procedure Set_CenterHorizontal(Value: UnicodeString);
    procedure Set_CenterVertical(Value: UnicodeString);
    procedure Set_StartPageNumber(Value: UnicodeString);
  end;

{ TXMLHeader_x }

  TXMLHeader_x = class(TXMLNode, IXMLHeader_x)
  protected
    { IXMLHeader_x }
    function Get_Margin: Double;
    function Get_Data: UnicodeString;
    procedure Set_Margin(Value: Double);
    procedure Set_Data(Value: UnicodeString);
  end;

{ TXMLFooter_x }

  TXMLFooter_x = class(TXMLNode, IXMLFooter_x)
  protected
    { IXMLFooter_x }
    function Get_Margin: Double;
    function Get_Data: UnicodeString;
    procedure Set_Margin(Value: Double);
    procedure Set_Data(Value: UnicodeString);
  end;

{ TXMLPageMargins_x }

  TXMLPageMargins_x = class(TXMLNode, IXMLPageMargins_x)
  protected
    { IXMLPageMargins_x }
    function Get_Left: Double;
    function Get_Right: Double;
    function Get_Top: Double;
    function Get_Bottom: Double;
    procedure Set_Left(Value: Double);
    procedure Set_Right(Value: Double);
    procedure Set_Top(Value: Double);
    procedure Set_Bottom(Value: Double);
  end;

{ TXMLPrintType_x }

  TXMLPrintType_x = class(TXMLNode, IXMLPrintType_x)
  protected
    { IXMLPrintType_x }
    function Get_FitWidth: Integer;
    function Get_FitHeight: Integer;
    function Get_LeftToRight: UnicodeString;
    function Get_BlackAndWhite: UnicodeString;
    function Get_NoPrinterInfo: UnicodeString;
    function Get_DraftQuality: UnicodeString;
    function Get_CommentsLayout: UnicodeString;
    function Get_Scale: Integer;
    function Get_PrintErrors: UnicodeString;
    function Get_ValidPrinterInfo: UnicodeString;
    function Get_PaperSizeIndex: Integer;
    function Get_HorizontalResolution: Integer;
    function Get_VerticalResolution: Integer;
    function Get_Gridlines: UnicodeString;
    function Get_NumberOfCopies: Integer;
    function Get_RowColHeadings: UnicodeString;
    procedure Set_FitWidth(Value: Integer);
    procedure Set_FitHeight(Value: Integer);
    procedure Set_LeftToRight(Value: UnicodeString);
    procedure Set_BlackAndWhite(Value: UnicodeString);
    procedure Set_NoPrinterInfo(Value: UnicodeString);
    procedure Set_DraftQuality(Value: UnicodeString);
    procedure Set_CommentsLayout(Value: UnicodeString);
    procedure Set_Scale(Value: Integer);
    procedure Set_PrintErrors(Value: UnicodeString);
    procedure Set_ValidPrinterInfo(Value: UnicodeString);
    procedure Set_PaperSizeIndex(Value: Integer);
    procedure Set_HorizontalResolution(Value: Integer);
    procedure Set_VerticalResolution(Value: Integer);
    procedure Set_Gridlines(Value: UnicodeString);
    procedure Set_NumberOfCopies(Value: Integer);
    procedure Set_RowColHeadings(Value: UnicodeString);
  end;

{ TXMLPanesType_x }

  TXMLPanesType_x = class(TXMLNodeCollection, IXMLPanesType_x)
  protected
    { IXMLPanesType_x }
    function Get_Pane(Index: Integer): IXMLPaneType_x;
    function Add: IXMLPaneType_x;
    function Insert(const Index: Integer): IXMLPaneType_x;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLPaneType_x }

  TXMLPaneType_x = class(TXMLNode, IXMLPaneType_x)
  protected
    { IXMLPaneType_x }
    function Get_Number: Integer;
    function Get_ActiveRow: Integer;
    function Get_ActiveCol: Integer;
    function Get_RangeSelection: UnicodeString;
    function Get_Selection: IXMLSelectionType_x;
    procedure Set_Number(Value: Integer);
    procedure Set_ActiveRow(Value: Integer);
    procedure Set_ActiveCol(Value: Integer);
    procedure Set_RangeSelection(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLSelectionType_x }

  TXMLSelectionType_x = class(TXMLNode, IXMLSelectionType_x)
  protected
    { IXMLSelectionType_x }
    function Get_PTRule: IXMLPTRuleType_x;
    function Get_Pane: IXMLPaneType_x;
    function Get_NoToggleDataHeader: UnicodeString;
    procedure Set_NoToggleDataHeader(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLPTRuleType_x }

  TXMLPTRuleType_x = class(TXMLNode, IXMLPTRuleType_x)
  protected
    { IXMLPTRuleType_x }
    function Get_RuleType: UnicodeString;
    function Get_Rule: UnicodeString;
    function Get_RuleV10: UnicodeString;
    function Get_ParseRuleAsV10: UnicodeString;
    function Get_Area: UnicodeString;
    function Get_Outline: UnicodeString;
    procedure Set_RuleType(Value: UnicodeString);
    procedure Set_Rule(Value: UnicodeString);
    procedure Set_RuleV10(Value: UnicodeString);
    procedure Set_ParseRuleAsV10(Value: UnicodeString);
    procedure Set_Area(Value: UnicodeString);
    procedure Set_Outline(Value: UnicodeString);
  end;

{ TXMLPTRuleType_xList }

  TXMLPTRuleType_xList = class(TXMLNodeCollection, IXMLPTRuleType_xList)
  protected
    { IXMLPTRuleType_xList }
    function Add: IXMLPTRuleType_x;
    function Insert(const Index: Integer): IXMLPTRuleType_x;

    function Get_Item(Index: Integer): IXMLPTRuleType_x;
  end;

{ TXMLWatches_x }

  TXMLWatches_x = class(TXMLNodeCollection, IXMLWatches_x)
  protected
    { IXMLWatches_x }
    function Get_Watch(Index: Integer): IXMLWatch_x;
    function Add: IXMLWatch_x;
    function Insert(const Index: Integer): IXMLWatch_x;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLWatch_x }

  TXMLWatch_x = class(TXMLNode, IXMLWatch_x)
  protected
    { IXMLWatch_x }
    function Get_Source: UnicodeString;
    procedure Set_Source(Value: UnicodeString);
  end;

{ TXMLDataTable_x }

  TXMLDataTable_x = class(TXMLNode, IXMLDataTable_x)
  protected
    { IXMLDataTable_x }
    function Get_Range: UnicodeString;
    function Get_RowInputCell: UnicodeString;
    function Get_ColumnInputCell: UnicodeString;
    procedure Set_Range(Value: UnicodeString);
    procedure Set_RowInputCell(Value: UnicodeString);
    procedure Set_ColumnInputCell(Value: UnicodeString);
  end;

{ TXMLPageBreaksType_x }

  TXMLPageBreaksType_x = class(TXMLNode, IXMLPageBreaksType_x)
  protected
    { IXMLPageBreaksType_x }
    function Get_ColBreaks: IXMLColBreaks_x;
    function Get_RowBreaks: IXMLRowBreaks_x;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLColBreaks_x }

  TXMLColBreaks_x = class(TXMLNodeCollection, IXMLColBreaks_x)
  protected
    { IXMLColBreaks_x }
    function Get_ColBreak(Index: Integer): IXMLColBreak_x;
    function Add: IXMLColBreak_x;
    function Insert(const Index: Integer): IXMLColBreak_x;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLColBreak_x }

  TXMLColBreak_x = class(TXMLNode, IXMLColBreak_x)
  protected
    { IXMLColBreak_x }
    function Get_Column: Integer;
    procedure Set_Column(Value: Integer);
  end;

{ TXMLRowBreaks_x }

  TXMLRowBreaks_x = class(TXMLNodeCollection, IXMLRowBreaks_x)
  protected
    { IXMLRowBreaks_x }
    function Get_RowBreak(Index: Integer): IXMLRowBreak_x;
    function Add: IXMLRowBreak_x;
    function Insert(const Index: Integer): IXMLRowBreak_x;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLRowBreak_x }

  TXMLRowBreak_x = class(TXMLNode, IXMLRowBreak_x)
  protected
    { IXMLRowBreak_x }
    function Get_Row: IXMLRowType_x;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLPivotTableType_x }

  TXMLPivotTableType_x = class(TXMLNode, IXMLPivotTableType_x)
  private
    FPLPivotField: IXMLPLPivotFieldType_xList;
    FPLTotal: IXMLPLTotalType_xList;
    FPivotAxis: IXMLPivotAxisType_xList;
    FPivotField: IXMLPivotFieldType_xList;
    FCubeField: IXMLCubeFieldType_xList;
    FPTLineItems: IXMLPTLineItemsType_xList;
    FPTFormula: IXMLPTFormulaType_xList;
    FPTFormat: IXMLPTFormatType_xList;
  protected
    { IXMLPivotTableType_x }
    function Get_Name: UnicodeString;
    function Get_DataValueEditing: UnicodeString;
    function Get_QTSource: IXMLQTSourceType_x;
    function Get_ErrorString: UnicodeString;
    function Get_NullString: UnicodeString;
    function Get_PageFieldOrder: UnicodeString;
    function Get_PageFieldWrapCount: Integer;
    function Get_DisableDrillDown: UnicodeString;
    function Get_DisableFieldDialog: UnicodeString;
    function Get_DisableWizard: UnicodeString;
    function Get_DisplayErrorString: UnicodeString;
    function Get_NoPreserveFormatting: UnicodeString;
    function Get_HasNoAutoFormat: UnicodeString;
    function Get_SubtotalHiddenPageItems: UnicodeString;
    function Get_NoAutoFormatWidth: UnicodeString;
    function Get_NoRowGrand: UnicodeString;
    function Get_NoColumnGrand: UnicodeString;
    function Get_NoDisplayNullString: UnicodeString;
    function Get_NoPrintRepeatItems: UnicodeString;
    function Get_PivotView: IXMLPivotViewType_x;
    function Get_Selection: IXMLSelectionType_x;
    function Get_AutoFormatAlignment: UnicodeString;
    function Get_AutoFormatBorder: UnicodeString;
    function Get_AutoFormatFont: UnicodeString;
    function Get_AutoFormatName: UnicodeString;
    function Get_AutoFormatNumber: UnicodeString;
    function Get_AutoFormatPattern: UnicodeString;
    function Get_GrandTotalString: UnicodeString;
    function Get_PrintSetTitles: UnicodeString;
    function Get_MergeLabels: UnicodeString;
    function Get_PageFieldStyle: UnicodeString;
    function Get_PLExport: UnicodeString;
    function Get_ImmediateItemsOnDrop: UnicodeString;
    function Get_ShowPageMultipleItemLabel: UnicodeString;
    function Get_SmallGrid: UnicodeString;
    function Get_TableStyle: UnicodeString;
    function Get_Tag: UnicodeString;
    function Get_VacatedStyle: UnicodeString;
    function Get_HideTotalsAnnotation: UnicodeString;
    function Get_ShowCellBackgroundFromOLAP: UnicodeString;
    function Get_HideDropDowns: UnicodeString;
    function Get_NoViewCalculatedMembers: UnicodeString;
    function Get_VisualTotals: UnicodeString;
    function Get_Location: UnicodeString;
    function Get_PLPivotField: IXMLPLPivotFieldType_xList;
    function Get_PLTotal: IXMLPLTotalType_xList;
    function Get_DataMember: UnicodeString;
    function Get_DataAxisEmpty: UnicodeString;
    function Get_DisplayFieldList: UnicodeString;
    function Get_NoAutoFit: UnicodeString;
    function Get_Height: Double;
    function Get_Width: Double;
    function Get_MaxHeight: Double;
    function Get_MaxWidth: Double;
    function Get_MemberExpand: UnicodeString;
    function Get_ConnectionString: UnicodeString;
    function Get_CacheDetails: UnicodeString;
    function Get_FieldListTop: Integer;
    function Get_FieldListBottom: Integer;
    function Get_FieldListRight: Integer;
    function Get_FieldListLeft: Integer;
    function Get_PivotAxis: IXMLPivotAxisType_xList;
    function Get_VersionUpdateableMin: UnicodeString;
    function Get_VersionLastUpdate: UnicodeString;
    function Get_VersionRefreshableMin: UnicodeString;
    function Get_DefaultVersion: UnicodeString;
    function Get_PivotField: IXMLPivotFieldType_xList;
    function Get_CubeField: IXMLCubeFieldType_xList;
    function Get_CalculatedMember: IXMLCalculatedMember_x;
    function Get_PTLineItems: IXMLPTLineItemsType_xList;
    function Get_PTSource: IXMLPTSourceType_x;
    function Get_PTFormula: IXMLPTFormulaType_xList;
    function Get_PTFormat: IXMLPTFormatType_xList;
    procedure Set_Name(Value: UnicodeString);
    procedure Set_DataValueEditing(Value: UnicodeString);
    procedure Set_ErrorString(Value: UnicodeString);
    procedure Set_NullString(Value: UnicodeString);
    procedure Set_PageFieldOrder(Value: UnicodeString);
    procedure Set_PageFieldWrapCount(Value: Integer);
    procedure Set_DisableDrillDown(Value: UnicodeString);
    procedure Set_DisableFieldDialog(Value: UnicodeString);
    procedure Set_DisableWizard(Value: UnicodeString);
    procedure Set_DisplayErrorString(Value: UnicodeString);
    procedure Set_NoPreserveFormatting(Value: UnicodeString);
    procedure Set_HasNoAutoFormat(Value: UnicodeString);
    procedure Set_SubtotalHiddenPageItems(Value: UnicodeString);
    procedure Set_NoAutoFormatWidth(Value: UnicodeString);
    procedure Set_NoRowGrand(Value: UnicodeString);
    procedure Set_NoColumnGrand(Value: UnicodeString);
    procedure Set_NoDisplayNullString(Value: UnicodeString);
    procedure Set_NoPrintRepeatItems(Value: UnicodeString);
    procedure Set_AutoFormatAlignment(Value: UnicodeString);
    procedure Set_AutoFormatBorder(Value: UnicodeString);
    procedure Set_AutoFormatFont(Value: UnicodeString);
    procedure Set_AutoFormatName(Value: UnicodeString);
    procedure Set_AutoFormatNumber(Value: UnicodeString);
    procedure Set_AutoFormatPattern(Value: UnicodeString);
    procedure Set_GrandTotalString(Value: UnicodeString);
    procedure Set_PrintSetTitles(Value: UnicodeString);
    procedure Set_MergeLabels(Value: UnicodeString);
    procedure Set_PageFieldStyle(Value: UnicodeString);
    procedure Set_PLExport(Value: UnicodeString);
    procedure Set_ImmediateItemsOnDrop(Value: UnicodeString);
    procedure Set_ShowPageMultipleItemLabel(Value: UnicodeString);
    procedure Set_SmallGrid(Value: UnicodeString);
    procedure Set_TableStyle(Value: UnicodeString);
    procedure Set_Tag(Value: UnicodeString);
    procedure Set_VacatedStyle(Value: UnicodeString);
    procedure Set_HideTotalsAnnotation(Value: UnicodeString);
    procedure Set_ShowCellBackgroundFromOLAP(Value: UnicodeString);
    procedure Set_HideDropDowns(Value: UnicodeString);
    procedure Set_NoViewCalculatedMembers(Value: UnicodeString);
    procedure Set_VisualTotals(Value: UnicodeString);
    procedure Set_Location(Value: UnicodeString);
    procedure Set_DataMember(Value: UnicodeString);
    procedure Set_DataAxisEmpty(Value: UnicodeString);
    procedure Set_DisplayFieldList(Value: UnicodeString);
    procedure Set_NoAutoFit(Value: UnicodeString);
    procedure Set_Height(Value: Double);
    procedure Set_Width(Value: Double);
    procedure Set_MaxHeight(Value: Double);
    procedure Set_MaxWidth(Value: Double);
    procedure Set_MemberExpand(Value: UnicodeString);
    procedure Set_ConnectionString(Value: UnicodeString);
    procedure Set_CacheDetails(Value: UnicodeString);
    procedure Set_FieldListTop(Value: Integer);
    procedure Set_FieldListBottom(Value: Integer);
    procedure Set_FieldListRight(Value: Integer);
    procedure Set_FieldListLeft(Value: Integer);
    procedure Set_VersionUpdateableMin(Value: UnicodeString);
    procedure Set_VersionLastUpdate(Value: UnicodeString);
    procedure Set_VersionRefreshableMin(Value: UnicodeString);
    procedure Set_DefaultVersion(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLPivotTableType_xList }

  TXMLPivotTableType_xList = class(TXMLNodeCollection, IXMLPivotTableType_xList)
  protected
    { IXMLPivotTableType_xList }
    function Add: IXMLPivotTableType_x;
    function Insert(const Index: Integer): IXMLPivotTableType_x;

    function Get_Item(Index: Integer): IXMLPivotTableType_x;
  end;

{ TXMLQTSourceType_x }

  TXMLQTSourceType_x = class(TXMLNode, IXMLQTSourceType_x)
  protected
    { IXMLQTSourceType_x }
    function Get_DataMember: UnicodeString;
    function Get_CacheFile: IXMLCacheFile_x;
    function Get_QuerySource: IXMLQTQuerySourceType_x;
    function Get_CacheIndex: Integer;
    procedure Set_DataMember(Value: UnicodeString);
    procedure Set_CacheIndex(Value: Integer);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLCacheFile_x }

  TXMLCacheFile_x = class(TXMLNode, IXMLCacheFile_x)
  protected
    { IXMLCacheFile_x }
    function Get_Href: UnicodeString;
    procedure Set_Href(Value: UnicodeString);
  end;

{ TXMLQTQuerySourceType_x }

  TXMLQTQuerySourceType_x = class(TXMLNode, IXMLQTQuerySourceType_x)
  private
    FCommandText: IXMLString_List;
    FConnection: IXMLString_List;
    FSourceDataFile: IXMLString_List;
    FParameter: IXMLParameterTypeE_xList;
  protected
    { IXMLQTQuerySourceType_x }
    function Get_QueryType: UnicodeString;
    function Get_CommandText: IXMLString_List;
    function Get_CommandType: UnicodeString;
    function Get_Maintain: UnicodeString;
    function Get_Connection: IXMLString_List;
    function Get_DoNotJoinDelimiters: UnicodeString;
    function Get_NoTextToColumns: UnicodeString;
    function Get_DisableDateRecognition: UnicodeString;
    function Get_EnableRedirections: UnicodeString;
    function Get_EditWebPage: IXMLEditWebPage_x;
    function Get_RefreshedInXl9: UnicodeString;
    function Get_EntirePage: UnicodeString;
    function Get_HTMLFormat: UnicodeString;
    function Get_URLString: IXMLURLString_x;
    function Get_WebPostString: UnicodeString;
    function Get_RefreshInfo: IXMLRefreshInfoType_x;
    function Get_TextWizardSettings: IXMLTextWizardSettingsType_x;
    function Get_HTMLTables: IXMLHTMLTablesType_x;
    function Get_UseSameSettings: UnicodeString;
    function Get_Query97: UnicodeString;
    function Get_DoNotPromptForFile: UnicodeString;
    function Get_LocalConnection: UnicodeString;
    function Get_SourceConnectionFile: UnicodeString;
    function Get_SourceDataFile: IXMLString_List;
    function Get_RobustConnect: UnicodeString;
    function Get_RefreshTimeSpan: Integer;
    function Get_VersionLastEdit: Integer;
    function Get_VersionLastRefresh: Integer;
    function Get_VersionRefreshableMin: Integer;
    function Get_Parameter: IXMLParameterTypeE_xList;
    procedure Set_QueryType(Value: UnicodeString);
    procedure Set_CommandType(Value: UnicodeString);
    procedure Set_Maintain(Value: UnicodeString);
    procedure Set_DoNotJoinDelimiters(Value: UnicodeString);
    procedure Set_NoTextToColumns(Value: UnicodeString);
    procedure Set_DisableDateRecognition(Value: UnicodeString);
    procedure Set_EnableRedirections(Value: UnicodeString);
    procedure Set_RefreshedInXl9(Value: UnicodeString);
    procedure Set_EntirePage(Value: UnicodeString);
    procedure Set_HTMLFormat(Value: UnicodeString);
    procedure Set_WebPostString(Value: UnicodeString);
    procedure Set_UseSameSettings(Value: UnicodeString);
    procedure Set_Query97(Value: UnicodeString);
    procedure Set_DoNotPromptForFile(Value: UnicodeString);
    procedure Set_LocalConnection(Value: UnicodeString);
    procedure Set_SourceConnectionFile(Value: UnicodeString);
    procedure Set_RobustConnect(Value: UnicodeString);
    procedure Set_RefreshTimeSpan(Value: Integer);
    procedure Set_VersionLastEdit(Value: Integer);
    procedure Set_VersionLastRefresh(Value: Integer);
    procedure Set_VersionRefreshableMin(Value: Integer);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLEditWebPage_x }

  TXMLEditWebPage_x = class(TXMLNode, IXMLEditWebPage_x)
  protected
    { IXMLEditWebPage_x }
    function Get_HRef: UnicodeString;
    procedure Set_HRef(Value: UnicodeString);
  end;

{ TXMLURLString_x }

  TXMLURLString_x = class(TXMLNode, IXMLURLString_x)
  protected
    { IXMLURLString_x }
    function Get_HRef: UnicodeString;
    procedure Set_HRef(Value: UnicodeString);
  end;

{ TXMLRefreshInfoType_x }

  TXMLRefreshInfoType_x = class(TXMLNode, IXMLRefreshInfoType_x)
  private
    FColumnInfo: IXMLColumnInfoType_xList;
    FDeletedTitle: IXMLString_List;
  protected
    { IXMLRefreshInfoType_x }
    function Get_NextId: Integer;
    function Get_ColumnInfo: IXMLColumnInfoType_xList;
    function Get_DoNotPersist: UnicodeString;
    function Get_DoNotPersistSort: UnicodeString;
    function Get_DoNotPersstAF: UnicodeString;
    function Get_Sort: UnicodeString;
    function Get_CaseSensitive: UnicodeString;
    function Get_FuturePersist: UnicodeString;
    function Get_HeaderRow: UnicodeString;
    function Get_IdWrapped: UnicodeString;
    function Get_NoTitles: UnicodeString;
    function Get_AlertVersion: Integer;
    function Get_SortOrder: Integer;
    function Get_ExtraLeftColumns: Integer;
    function Get_ExtraRightColumns: Integer;
    function Get_DeletedTitle: IXMLString_List;
    procedure Set_NextId(Value: Integer);
    procedure Set_DoNotPersist(Value: UnicodeString);
    procedure Set_DoNotPersistSort(Value: UnicodeString);
    procedure Set_DoNotPersstAF(Value: UnicodeString);
    procedure Set_Sort(Value: UnicodeString);
    procedure Set_CaseSensitive(Value: UnicodeString);
    procedure Set_FuturePersist(Value: UnicodeString);
    procedure Set_HeaderRow(Value: UnicodeString);
    procedure Set_IdWrapped(Value: UnicodeString);
    procedure Set_NoTitles(Value: UnicodeString);
    procedure Set_AlertVersion(Value: Integer);
    procedure Set_SortOrder(Value: Integer);
    procedure Set_ExtraLeftColumns(Value: Integer);
    procedure Set_ExtraRightColumns(Value: Integer);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLColumnInfoType_x }

  TXMLColumnInfoType_x = class(TXMLNode, IXMLColumnInfoType_x)
  protected
    { IXMLColumnInfoType_x }
    function Get_Id: Int64;
    function Get_Clipped: UnicodeString;
    function Get_Descending: UnicodeString;
    function Get_FillDown: UnicodeString;
    function Get_Name: IXMLName_x;
    function Get_RowNumbers: UnicodeString;
    function Get_SortKey: Integer;
    function Get_User: UnicodeString;
    procedure Set_Id(Value: Int64);
    procedure Set_Clipped(Value: UnicodeString);
    procedure Set_Descending(Value: UnicodeString);
    procedure Set_FillDown(Value: UnicodeString);
    procedure Set_RowNumbers(Value: UnicodeString);
    procedure Set_SortKey(Value: Integer);
    procedure Set_User(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLColumnInfoType_xList }

  TXMLColumnInfoType_xList = class(TXMLNodeCollection, IXMLColumnInfoType_xList)
  protected
    { IXMLColumnInfoType_xList }
    function Add: IXMLColumnInfoType_x;
    function Insert(const Index: Integer): IXMLColumnInfoType_x;

    function Get_Item(Index: Integer): IXMLColumnInfoType_x;
  end;

{ TXMLName_x }

  TXMLName_x = class(TXMLNode, IXMLName_x)
  protected
    { IXMLName_x }
    function Get_Href: UnicodeString;
    procedure Set_Href(Value: UnicodeString);
  end;

{ TXMLTextWizardSettingsType_x }

  TXMLTextWizardSettingsType_x = class(TXMLNode, IXMLTextWizardSettingsType_x)
  protected
    { IXMLTextWizardSettingsType_x }
    function Get_FormatSettings: IXMLFormatSettingsType_x;
    function Get_Delimiters: IXMLDelimiters_x;
    function Get_Name: UnicodeString;
    function Get_Source: UnicodeString;
    function Get_StartRow: Integer;
    function Get_Decimal: UnicodeString;
    function Get_ThousandSeparator: UnicodeString;
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Source(Value: UnicodeString);
    procedure Set_StartRow(Value: Integer);
    procedure Set_Decimal(Value: UnicodeString);
    procedure Set_ThousandSeparator(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLFormatSettingsType_x }

  TXMLFormatSettingsType_x = class(TXMLNode, IXMLFormatSettingsType_x)
  protected
    { IXMLFormatSettingsType_x }
    function Get_FieldType: UnicodeString;
    function Get_FieldStart: Integer;
    procedure Set_FieldType(Value: UnicodeString);
    procedure Set_FieldStart(Value: Integer);
  end;

{ TXMLDelimiters_x }

  TXMLDelimiters_x = class(TXMLNode, IXMLDelimiters_x)
  protected
    { IXMLDelimiters_x }
    function Get_Comma: UnicodeString;
    function Get_Consecutive: UnicodeString;
    function Get_Custom: UnicodeString;
    function Get_SemiColon: UnicodeString;
    function Get_Space: UnicodeString;
    function Get_Tab: UnicodeString;
    function Get_TextQualifier: UnicodeString;
    procedure Set_Comma(Value: UnicodeString);
    procedure Set_Consecutive(Value: UnicodeString);
    procedure Set_Custom(Value: UnicodeString);
    procedure Set_SemiColon(Value: UnicodeString);
    procedure Set_Space(Value: UnicodeString);
    procedure Set_Tab(Value: UnicodeString);
    procedure Set_TextQualifier(Value: UnicodeString);
  end;

{ TXMLHTMLTablesType_x }

  TXMLHTMLTablesType_x = class(TXMLNode, IXMLHTMLTablesType_x)
  private
    FNumber: IXMLIntegerList;
    FText: IXMLString_List;
    FMissing: IXMLString_List;
  protected
    { IXMLHTMLTablesType_x }
    function Get_Number: IXMLIntegerList;
    function Get_Text: IXMLString_List;
    function Get_Missing: IXMLString_List;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLParameterTypeE_x }

  TXMLParameterTypeE_x = class(TXMLNode, IXMLParameterTypeE_x)
  protected
    { IXMLParameterTypeE_x }
    function Get_ExcelType: UnicodeString;
    function Get_Formula: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_ParameterType: UnicodeString;
    function Get_ParameterValue: UnicodeString;
    function Get_PromptString: UnicodeString;
    function Get_NonDefaultName: UnicodeString;
    function Get_SQLType: UnicodeString;
    function Get_RefreshOnChange: UnicodeString;
    procedure Set_ExcelType(Value: UnicodeString);
    procedure Set_Formula(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
    procedure Set_ParameterType(Value: UnicodeString);
    procedure Set_ParameterValue(Value: UnicodeString);
    procedure Set_PromptString(Value: UnicodeString);
    procedure Set_NonDefaultName(Value: UnicodeString);
    procedure Set_SQLType(Value: UnicodeString);
    procedure Set_RefreshOnChange(Value: UnicodeString);
  end;

{ TXMLParameterTypeE_xList }

  TXMLParameterTypeE_xList = class(TXMLNodeCollection, IXMLParameterTypeE_xList)
  protected
    { IXMLParameterTypeE_xList }
    function Add: IXMLParameterTypeE_x;
    function Insert(const Index: Integer): IXMLParameterTypeE_x;

    function Get_Item(Index: Integer): IXMLParameterTypeE_x;
  end;

{ TXMLPivotViewType_x }

  TXMLPivotViewType_x = class(TXMLNode, IXMLPivotViewType_x)
  private
    FDetailSortOrder: IXMLString_List;
    FLabel_: IXMLLabel__xList;
  protected
    { IXMLPivotViewType_x }
    function Get_IsNotFiltered: UnicodeString;
    function Get_TotalAllMembers: UnicodeString;
    function Get_DetailMaxHeight: Integer;
    function Get_DetailMaxWidth: Integer;
    function Get_NoDetailAutoFit: UnicodeString;
    function Get_DetailRowHeight: Integer;
    function Get_DetailWidth: Integer;
    function Get_TotalFormat: IXMLTotalFormat_x;
    function Get_MemberFormat: IXMLMemberFormat_x;
    function Get_FieldLabelFormat: IXMLFieldLabelFormat_x;
    function Get_DetailSortOrder: IXMLString_List;
    function Get_CellsExpanded: UnicodeString;
    function Get_CellsNotExpanded: UnicodeString;
    function Get_CellsExpandedSeqNum: Integer;
    function Get_Label_: IXMLLabel__xList;
    procedure Set_IsNotFiltered(Value: UnicodeString);
    procedure Set_TotalAllMembers(Value: UnicodeString);
    procedure Set_DetailMaxHeight(Value: Integer);
    procedure Set_DetailMaxWidth(Value: Integer);
    procedure Set_NoDetailAutoFit(Value: UnicodeString);
    procedure Set_DetailRowHeight(Value: Integer);
    procedure Set_DetailWidth(Value: Integer);
    procedure Set_CellsExpanded(Value: UnicodeString);
    procedure Set_CellsNotExpanded(Value: UnicodeString);
    procedure Set_CellsExpandedSeqNum(Value: Integer);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTotalFormat_x }

  TXMLTotalFormat_x = class(TXMLNode, IXMLTotalFormat_x)
  protected
    { IXMLTotalFormat_x }
    function Get_Style: UnicodeString;
    procedure Set_Style(Value: UnicodeString);
  end;

{ TXMLMemberFormat_x }

  TXMLMemberFormat_x = class(TXMLNode, IXMLMemberFormat_x)
  protected
    { IXMLMemberFormat_x }
    function Get_Style: UnicodeString;
    procedure Set_Style(Value: UnicodeString);
  end;

{ TXMLFieldLabelFormat_x }

  TXMLFieldLabelFormat_x = class(TXMLNode, IXMLFieldLabelFormat_x)
  protected
    { IXMLFieldLabelFormat_x }
    function Get_Style: UnicodeString;
    procedure Set_Style(Value: UnicodeString);
  end;

{ TXMLLabel__x }

  TXMLLabel__x = class(TXMLNode, IXMLLabel__x)
  protected
    { IXMLLabel__x }
    function Get_Style: UnicodeString;
    procedure Set_Style(Value: UnicodeString);
  end;

{ TXMLLabel__xList }

  TXMLLabel__xList = class(TXMLNodeCollection, IXMLLabel__xList)
  protected
    { IXMLLabel__xList }
    function Add: IXMLLabel__x;
    function Insert(const Index: Integer): IXMLLabel__x;

    function Get_Item(Index: Integer): IXMLLabel__x;
  end;

{ TXMLPLPivotFieldType_x }

  TXMLPLPivotFieldType_x = class(TXMLNode, IXMLPLPivotFieldType_x)
  private
    FPivotItem: IXMLPivotItemType_xList;
  protected
    { IXMLPLPivotFieldType_x }
    function Get_Name: UnicodeString;
    function Get_SourceName: UnicodeString;
    function Get_BoundField: UnicodeString;
    function Get_DataType: UnicodeString;
    function Get_FilterCaption: UnicodeString;
    function Get_PLDataOrientation: Integer;
    function Get_PLPosition: UnicodeString;
    function Get_Orientation: UnicodeString;
    function Get_Position: UnicodeString;
    function Get_ShowAllItems: UnicodeString;
    function Get_NumberFormat: UnicodeString;
    function Get_CurrentPage: UnicodeString;
    function Get_Caption: UnicodeString;
    function Get_NewItemsHidden: UnicodeString;
    function Get_Subtotal: UnicodeString;
    function Get_PLSubtotal: Double;
    function Get_DetailFormat: IXMLDetailFormat_x;
    function Get_SubtotalFormat: IXMLSubtotalFormat_x;
    function Get_DetailWidth: Integer;
    function Get_GroupedWidth: Integer;
    function Get_Expanded: UnicodeString;
    function Get_TotalWidth: Integer;
    function Get_PivotItem: IXMLPivotItemType_xList;
    procedure Set_Name(Value: UnicodeString);
    procedure Set_SourceName(Value: UnicodeString);
    procedure Set_BoundField(Value: UnicodeString);
    procedure Set_DataType(Value: UnicodeString);
    procedure Set_FilterCaption(Value: UnicodeString);
    procedure Set_PLDataOrientation(Value: Integer);
    procedure Set_PLPosition(Value: UnicodeString);
    procedure Set_Orientation(Value: UnicodeString);
    procedure Set_Position(Value: UnicodeString);
    procedure Set_ShowAllItems(Value: UnicodeString);
    procedure Set_NumberFormat(Value: UnicodeString);
    procedure Set_CurrentPage(Value: UnicodeString);
    procedure Set_Caption(Value: UnicodeString);
    procedure Set_NewItemsHidden(Value: UnicodeString);
    procedure Set_Subtotal(Value: UnicodeString);
    procedure Set_PLSubtotal(Value: Double);
    procedure Set_DetailWidth(Value: Integer);
    procedure Set_GroupedWidth(Value: Integer);
    procedure Set_Expanded(Value: UnicodeString);
    procedure Set_TotalWidth(Value: Integer);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLPLPivotFieldType_xList }

  TXMLPLPivotFieldType_xList = class(TXMLNodeCollection, IXMLPLPivotFieldType_xList)
  protected
    { IXMLPLPivotFieldType_xList }
    function Add: IXMLPLPivotFieldType_x;
    function Insert(const Index: Integer): IXMLPLPivotFieldType_x;

    function Get_Item(Index: Integer): IXMLPLPivotFieldType_x;
  end;

{ TXMLDetailFormat_x }

  TXMLDetailFormat_x = class(TXMLNode, IXMLDetailFormat_x)
  protected
    { IXMLDetailFormat_x }
    function Get_Style: UnicodeString;
    procedure Set_Style(Value: UnicodeString);
  end;

{ TXMLSubtotalFormat_x }

  TXMLSubtotalFormat_x = class(TXMLNode, IXMLSubtotalFormat_x)
  protected
    { IXMLSubtotalFormat_x }
    function Get_Style: UnicodeString;
    procedure Set_Style(Value: UnicodeString);
  end;

{ TXMLPivotItemType_x }

  TXMLPivotItemType_x = class(TXMLNode, IXMLPivotItemType_x)
  protected
    { IXMLPivotItemType_x }
    function Get_Name: UnicodeString;
    function Get_Formula: UnicodeString;
    function Get_FormulaV10: UnicodeString;
    function Get_ParseFormulaAsV10: UnicodeString;
    function Get_FormulaIndex: Integer;
    function Get_Hidden: UnicodeString;
    function Get_HideDetail: UnicodeString;
    function Get_Missing: UnicodeString;
    function Get_CachePosition: Integer;
    function Get_Member: UnicodeString;
    function Get_SourceName: UnicodeString;
    function Get_DrilledMember: UnicodeString;
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Formula(Value: UnicodeString);
    procedure Set_FormulaV10(Value: UnicodeString);
    procedure Set_ParseFormulaAsV10(Value: UnicodeString);
    procedure Set_FormulaIndex(Value: Integer);
    procedure Set_Hidden(Value: UnicodeString);
    procedure Set_HideDetail(Value: UnicodeString);
    procedure Set_Missing(Value: UnicodeString);
    procedure Set_CachePosition(Value: Integer);
    procedure Set_Member(Value: UnicodeString);
    procedure Set_SourceName(Value: UnicodeString);
    procedure Set_DrilledMember(Value: UnicodeString);
  end;

{ TXMLPivotItemType_xList }

  TXMLPivotItemType_xList = class(TXMLNodeCollection, IXMLPivotItemType_xList)
  protected
    { IXMLPivotItemType_xList }
    function Add: IXMLPivotItemType_x;
    function Insert(const Index: Integer): IXMLPivotItemType_x;

    function Get_Item(Index: Integer): IXMLPivotItemType_x;
  end;

{ TXMLPLTotalType_x }

  TXMLPLTotalType_x = class(TXMLNode, IXMLPLTotalType_x)
  protected
    { IXMLPLTotalType_x }
    function Get_Name: UnicodeString;
    function Get_Caption: UnicodeString;
    function Get_ParentField: UnicodeString;
    function Get_NumberFormat: UnicodeString;
    function Get_Operator_: UnicodeString;
    function Get_Alignment: IXMLAlignmentType_x;
    function Get_CaptionAlignment: UnicodeString;
    function Get_Width: Integer;
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Caption(Value: UnicodeString);
    procedure Set_ParentField(Value: UnicodeString);
    procedure Set_NumberFormat(Value: UnicodeString);
    procedure Set_Operator_(Value: UnicodeString);
    procedure Set_CaptionAlignment(Value: UnicodeString);
    procedure Set_Width(Value: Integer);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLPLTotalType_xList }

  TXMLPLTotalType_xList = class(TXMLNodeCollection, IXMLPLTotalType_xList)
  protected
    { IXMLPLTotalType_xList }
    function Add: IXMLPLTotalType_x;
    function Insert(const Index: Integer): IXMLPLTotalType_x;

    function Get_Item(Index: Integer): IXMLPLTotalType_x;
  end;

{ TXMLAlignmentType_x }

  TXMLAlignmentType_x = class(TXMLNode, IXMLAlignmentType_x)
  protected
    { IXMLAlignmentType_x }
    function Get_Horizontal: UnicodeString;
    function Get_Rotation: Integer;
    function Get_Vertical: UnicodeString;
    function Get_ReadingOrder: UnicodeString;
    procedure Set_Horizontal(Value: UnicodeString);
    procedure Set_Rotation(Value: Integer);
    procedure Set_Vertical(Value: UnicodeString);
    procedure Set_ReadingOrder(Value: UnicodeString);
  end;

{ TXMLPivotAxisType_x }

  TXMLPivotAxisType_x = class(TXMLNode, IXMLPivotAxisType_x)
  protected
    { IXMLPivotAxisType_x }
    function Get_DisplayEmptyMembers: UnicodeString;
    function Get_Label_: IXMLLabel__x;
    function Get_Orientation: UnicodeString;
    procedure Set_DisplayEmptyMembers(Value: UnicodeString);
    procedure Set_Orientation(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLPivotAxisType_xList }

  TXMLPivotAxisType_xList = class(TXMLNodeCollection, IXMLPivotAxisType_xList)
  protected
    { IXMLPivotAxisType_xList }
    function Add: IXMLPivotAxisType_x;
    function Insert(const Index: Integer): IXMLPivotAxisType_x;

    function Get_Item(Index: Integer): IXMLPivotAxisType_x;
  end;

{ TXMLPivotFieldType_x }

  TXMLPivotFieldType_x = class(TXMLNode, IXMLPivotFieldType_x)
  private
    FSubtotal: IXMLSubtotalTypeList;
    FMemberProperty: IXMLMemberPropertyType_xList;
    FFilterMember: IXMLFilterMember_xList;
    FPLTPivotItem: IXMLPivotItemType_xList;
    FPivotItem: IXMLPivotItemType_xList;
  protected
    { IXMLPivotFieldType_x }
    function Get_DataField: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_MapChildItems: IXMLMapChildItemsType_x;
    function Get_AutoShowCount: Integer;
    function Get_AutoShowField: UnicodeString;
    function Get_AutoShowRange: UnicodeString;
    function Get_AutoShowType: UnicodeString;
    function Get_AutoSortOrder: UnicodeString;
    function Get_AutoSortField: UnicodeString;
    function Get_BaseField: UnicodeString;
    function Get_BaseItem: UnicodeString;
    function Get_BlankLineAfterItems: UnicodeString;
    function Get_Calculation: UnicodeString;
    function Get_CantGetUniqueItems: UnicodeString;
    function Get_GroupBy: Integer;
    function Get_GroupStart: UnicodeString;
    function Get_GroupEnd: UnicodeString;
    function Get_GroupStartAuto: UnicodeString;
    function Get_GroupEndAuto: UnicodeString;
    function Get_GroupType: UnicodeString;
    function Get_LayoutPageBreak: UnicodeString;
    function Get_NumberFormat: UnicodeString;
    function Get_ParentField: UnicodeString;
    function Get_SourceName: UnicodeString;
    function Get_Orientation: UnicodeString;
    function Get_Function_: UnicodeString;
    function Get_Subtotal: IXMLSubtotalTypeList;
    function Get_LayoutForm: UnicodeString;
    function Get_LayoutSubtotalLocation: UnicodeString;
    function Get_NoDragToRow: UnicodeString;
    function Get_NoDragToColumn: UnicodeString;
    function Get_NoDragToData: UnicodeString;
    function Get_NoDragToHide: UnicodeString;
    function Get_NoDragToPage: UnicodeString;
    function Get_MemberProperty: IXMLMemberPropertyType_xList;
    function Get_MemberPropertiesOrder: UnicodeString;
    function Get_HideDropDowns: UnicodeString;
    function Get_DrilledLevel: UnicodeString;
    function Get_ServerSortOrder: UnicodeString;
    function Get_IsMemberProperty: UnicodeString;
    function Get_CurrentPage: UnicodeString;
    function Get_Caption: UnicodeString;
    function Get_FilterMember: IXMLFilterMember_xList;
    function Get_Position: Integer;
    function Get_DataType: UnicodeString;
    function Get_ServerBased: UnicodeString;
    function Get_ShowAllItems: UnicodeString;
    function Get_SQLType: UnicodeString;
    function Get_SubtotalName: UnicodeString;
    function Get_PLTPivotItem: IXMLPivotItemType_xList;
    function Get_DetailFormat: IXMLDetailFormatType_x;
    function Get_DetailWidth: Integer;
    function Get_Expanded: UnicodeString;
    function Get_FilterCaption: UnicodeString;
    function Get_Formula: UnicodeString;
    function Get_FormulaV10: UnicodeString;
    function Get_ParseFormulaAsV10: UnicodeString;
    function Get_GroupedWidth: Integer;
    function Get_NewItemsHidden: UnicodeString;
    function Get_PLCaption: UnicodeString;
    function Get_PLDataOrientation: UnicodeString;
    function Get_PLGroupType: UnicodeString;
    function Get_PLName: UnicodeString;
    function Get_PLPosition: Integer;
    function Get_PLSubtotal: Double;
    function Get_SourceHierarchy: UnicodeString;
    function Get_MemberPropertyParent: Integer;
    function Get_SourceHierarchyLevel: UnicodeString;
    function Get_PivotItem: IXMLPivotItemType_xList;
    function Get_SubtotalFormat: IXMLSubtotalFormatType_x;
    function Get_TotalAlignment: UnicodeString;
    function Get_TotalCaptionAlignment: UnicodeString;
    function Get_TotalWidth: Integer;
    procedure Set_DataField(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
    procedure Set_AutoShowCount(Value: Integer);
    procedure Set_AutoShowField(Value: UnicodeString);
    procedure Set_AutoShowRange(Value: UnicodeString);
    procedure Set_AutoShowType(Value: UnicodeString);
    procedure Set_AutoSortOrder(Value: UnicodeString);
    procedure Set_AutoSortField(Value: UnicodeString);
    procedure Set_BaseField(Value: UnicodeString);
    procedure Set_BaseItem(Value: UnicodeString);
    procedure Set_BlankLineAfterItems(Value: UnicodeString);
    procedure Set_Calculation(Value: UnicodeString);
    procedure Set_CantGetUniqueItems(Value: UnicodeString);
    procedure Set_GroupBy(Value: Integer);
    procedure Set_GroupStart(Value: UnicodeString);
    procedure Set_GroupEnd(Value: UnicodeString);
    procedure Set_GroupStartAuto(Value: UnicodeString);
    procedure Set_GroupEndAuto(Value: UnicodeString);
    procedure Set_GroupType(Value: UnicodeString);
    procedure Set_LayoutPageBreak(Value: UnicodeString);
    procedure Set_NumberFormat(Value: UnicodeString);
    procedure Set_ParentField(Value: UnicodeString);
    procedure Set_SourceName(Value: UnicodeString);
    procedure Set_Orientation(Value: UnicodeString);
    procedure Set_Function_(Value: UnicodeString);
    procedure Set_LayoutForm(Value: UnicodeString);
    procedure Set_LayoutSubtotalLocation(Value: UnicodeString);
    procedure Set_NoDragToRow(Value: UnicodeString);
    procedure Set_NoDragToColumn(Value: UnicodeString);
    procedure Set_NoDragToData(Value: UnicodeString);
    procedure Set_NoDragToHide(Value: UnicodeString);
    procedure Set_NoDragToPage(Value: UnicodeString);
    procedure Set_MemberPropertiesOrder(Value: UnicodeString);
    procedure Set_HideDropDowns(Value: UnicodeString);
    procedure Set_DrilledLevel(Value: UnicodeString);
    procedure Set_ServerSortOrder(Value: UnicodeString);
    procedure Set_IsMemberProperty(Value: UnicodeString);
    procedure Set_CurrentPage(Value: UnicodeString);
    procedure Set_Caption(Value: UnicodeString);
    procedure Set_Position(Value: Integer);
    procedure Set_DataType(Value: UnicodeString);
    procedure Set_ServerBased(Value: UnicodeString);
    procedure Set_ShowAllItems(Value: UnicodeString);
    procedure Set_SQLType(Value: UnicodeString);
    procedure Set_SubtotalName(Value: UnicodeString);
    procedure Set_DetailWidth(Value: Integer);
    procedure Set_Expanded(Value: UnicodeString);
    procedure Set_FilterCaption(Value: UnicodeString);
    procedure Set_Formula(Value: UnicodeString);
    procedure Set_FormulaV10(Value: UnicodeString);
    procedure Set_ParseFormulaAsV10(Value: UnicodeString);
    procedure Set_GroupedWidth(Value: Integer);
    procedure Set_NewItemsHidden(Value: UnicodeString);
    procedure Set_PLCaption(Value: UnicodeString);
    procedure Set_PLDataOrientation(Value: UnicodeString);
    procedure Set_PLGroupType(Value: UnicodeString);
    procedure Set_PLName(Value: UnicodeString);
    procedure Set_PLPosition(Value: Integer);
    procedure Set_PLSubtotal(Value: Double);
    procedure Set_SourceHierarchy(Value: UnicodeString);
    procedure Set_MemberPropertyParent(Value: Integer);
    procedure Set_SourceHierarchyLevel(Value: UnicodeString);
    procedure Set_TotalAlignment(Value: UnicodeString);
    procedure Set_TotalCaptionAlignment(Value: UnicodeString);
    procedure Set_TotalWidth(Value: Integer);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLPivotFieldType_xList }

  TXMLPivotFieldType_xList = class(TXMLNodeCollection, IXMLPivotFieldType_xList)
  protected
    { IXMLPivotFieldType_xList }
    function Add: IXMLPivotFieldType_x;
    function Insert(const Index: Integer): IXMLPivotFieldType_x;

    function Get_Item(Index: Integer): IXMLPivotFieldType_x;
  end;

{ TXMLMapChildItemsType_x }

  TXMLMapChildItemsType_x = class(TXMLNode, IXMLMapChildItemsType_x)
  protected
    { IXMLMapChildItemsType_x }
    function Get_Item: UnicodeString;
    procedure Set_Item(Value: UnicodeString);
  end;

{ TXMLMemberPropertyType_x }

  TXMLMemberPropertyType_x = class(TXMLNode, IXMLMemberPropertyType_x)
  protected
    { IXMLMemberPropertyType_x }
    function Get_Name: UnicodeString;
    function Get_UniqueName: UnicodeString;
    function Get_SourceHierarchyLevel: Integer;
    function Get_LengthLevelUniqueName: Integer;
    function Get_DisplayIn: UnicodeString;
    function Get_Caption: UnicodeString;
    procedure Set_Name(Value: UnicodeString);
    procedure Set_UniqueName(Value: UnicodeString);
    procedure Set_SourceHierarchyLevel(Value: Integer);
    procedure Set_LengthLevelUniqueName(Value: Integer);
    procedure Set_DisplayIn(Value: UnicodeString);
    procedure Set_Caption(Value: UnicodeString);
  end;

{ TXMLMemberPropertyType_xList }

  TXMLMemberPropertyType_xList = class(TXMLNodeCollection, IXMLMemberPropertyType_xList)
  protected
    { IXMLMemberPropertyType_xList }
    function Add: IXMLMemberPropertyType_x;
    function Insert(const Index: Integer): IXMLMemberPropertyType_x;

    function Get_Item(Index: Integer): IXMLMemberPropertyType_x;
  end;

{ TXMLFilterMember_x }

  TXMLFilterMember_x = class(TXMLNode, IXMLFilterMember_x)
  protected
    { IXMLFilterMember_x }
    function Get_UniqueName: UnicodeString;
    function Get_Level: Integer;
    function Get_Caption: UnicodeString;
    procedure Set_UniqueName(Value: UnicodeString);
    procedure Set_Level(Value: Integer);
    procedure Set_Caption(Value: UnicodeString);
  end;

{ TXMLFilterMember_xList }

  TXMLFilterMember_xList = class(TXMLNodeCollection, IXMLFilterMember_xList)
  protected
    { IXMLFilterMember_xList }
    function Add: IXMLFilterMember_x;
    function Insert(const Index: Integer): IXMLFilterMember_x;

    function Get_Item(Index: Integer): IXMLFilterMember_x;
  end;

{ TXMLDetailFormatType_x }

  TXMLDetailFormatType_x = class(TXMLNode, IXMLDetailFormatType_x)
  protected
    { IXMLDetailFormatType_x }
    function Get_Style: UnicodeString;
    procedure Set_Style(Value: UnicodeString);
  end;

{ TXMLSubtotalFormatType_x }

  TXMLSubtotalFormatType_x = class(TXMLNode, IXMLSubtotalFormatType_x)
  protected
    { IXMLSubtotalFormatType_x }
    function Get_Style: UnicodeString;
    procedure Set_Style(Value: UnicodeString);
  end;

{ TXMLCubeFieldType_x }

  TXMLCubeFieldType_x = class(TXMLNode, IXMLCubeFieldType_x)
  private
    FMemberProperty: IXMLMemberPropertyType_xList;
    FGroupLevel: IXMLGroupLevel_xList;
  protected
    { IXMLCubeFieldType_x }
    function Get_UniqueName: UnicodeString;
    function Get_Caption: UnicodeString;
    function Get_DefaultItem: UnicodeString;
    function Get_AllItemName: UnicodeString;
    function Get_Dimension: UnicodeString;
    function Get_DontShowInFieldList: UnicodeString;
    function Get_Measure: UnicodeString;
    function Get_Set_: UnicodeString;
    function Get_NoDragToData: UnicodeString;
    function Get_NoDragToHide: UnicodeString;
    function Get_NoDragToRow: UnicodeString;
    function Get_NoDragToColumn: UnicodeString;
    function Get_NoDragToPage: UnicodeString;
    function Get_EnableMultiplePageItems: UnicodeString;
    function Get_LayoutForm: UnicodeString;
    function Get_LayoutSubtotalLocation: UnicodeString;
    function Get_Orientation: UnicodeString;
    function Get_MemberProperty: IXMLMemberPropertyType_xList;
    function Get_MemberPropertiesOrder: UnicodeString;
    function Get_HideDropDowns: UnicodeString;
    function Get_GroupLevel: IXMLGroupLevel_xList;
    procedure Set_UniqueName(Value: UnicodeString);
    procedure Set_Caption(Value: UnicodeString);
    procedure Set_DefaultItem(Value: UnicodeString);
    procedure Set_AllItemName(Value: UnicodeString);
    procedure Set_Dimension(Value: UnicodeString);
    procedure Set_DontShowInFieldList(Value: UnicodeString);
    procedure Set_Measure(Value: UnicodeString);
    procedure Set_Set_(Value: UnicodeString);
    procedure Set_NoDragToData(Value: UnicodeString);
    procedure Set_NoDragToHide(Value: UnicodeString);
    procedure Set_NoDragToRow(Value: UnicodeString);
    procedure Set_NoDragToColumn(Value: UnicodeString);
    procedure Set_NoDragToPage(Value: UnicodeString);
    procedure Set_EnableMultiplePageItems(Value: UnicodeString);
    procedure Set_LayoutForm(Value: UnicodeString);
    procedure Set_LayoutSubtotalLocation(Value: UnicodeString);
    procedure Set_Orientation(Value: UnicodeString);
    procedure Set_MemberPropertiesOrder(Value: UnicodeString);
    procedure Set_HideDropDowns(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLCubeFieldType_xList }

  TXMLCubeFieldType_xList = class(TXMLNodeCollection, IXMLCubeFieldType_xList)
  protected
    { IXMLCubeFieldType_xList }
    function Add: IXMLCubeFieldType_x;
    function Insert(const Index: Integer): IXMLCubeFieldType_x;

    function Get_Item(Index: Integer): IXMLCubeFieldType_x;
  end;

{ TXMLGroupLevel_x }

  TXMLGroupLevel_x = class(TXMLNode, IXMLGroupLevel_x)
  private
    FGroupDefinition: IXMLGroupDefinitionType_xList;
  protected
    { IXMLGroupLevel_x }
    function Get_IsGroupLevel: UnicodeString;
    function Get_UniqueName: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_GroupDefinition: IXMLGroupDefinitionType_xList;
    procedure Set_IsGroupLevel(Value: UnicodeString);
    procedure Set_UniqueName(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLGroupLevel_xList }

  TXMLGroupLevel_xList = class(TXMLNodeCollection, IXMLGroupLevel_xList)
  protected
    { IXMLGroupLevel_xList }
    function Add: IXMLGroupLevel_x;
    function Insert(const Index: Integer): IXMLGroupLevel_x;

    function Get_Item(Index: Integer): IXMLGroupLevel_x;
  end;

{ TXMLGroupDefinitionType_x }

  TXMLGroupDefinitionType_x = class(TXMLNode, IXMLGroupDefinitionType_x)
  private
    FGroupMember: IXMLGroupMemberType_xList;
  protected
    { IXMLGroupDefinitionType_x }
    function Get_Name: UnicodeString;
    function Get_UniqueName: UnicodeString;
    function Get_Caption: UnicodeString;
    function Get_GroupNumber: Integer;
    function Get_ParentName: UnicodeString;
    function Get_ParentUniqueName: UnicodeString;
    function Get_ParentIsOther: UnicodeString;
    function Get_GroupMember: IXMLGroupMemberType_xList;
    procedure Set_Name(Value: UnicodeString);
    procedure Set_UniqueName(Value: UnicodeString);
    procedure Set_Caption(Value: UnicodeString);
    procedure Set_GroupNumber(Value: Integer);
    procedure Set_ParentName(Value: UnicodeString);
    procedure Set_ParentUniqueName(Value: UnicodeString);
    procedure Set_ParentIsOther(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLGroupDefinitionType_xList }

  TXMLGroupDefinitionType_xList = class(TXMLNodeCollection, IXMLGroupDefinitionType_xList)
  protected
    { IXMLGroupDefinitionType_xList }
    function Add: IXMLGroupDefinitionType_x;
    function Insert(const Index: Integer): IXMLGroupDefinitionType_x;

    function Get_Item(Index: Integer): IXMLGroupDefinitionType_x;
  end;

{ TXMLGroupMemberType_x }

  TXMLGroupMemberType_x = class(TXMLNode, IXMLGroupMemberType_x)
  protected
    { IXMLGroupMemberType_x }
    function Get_Name: UnicodeString;
    function Get_UniqueName: UnicodeString;
    procedure Set_Name(Value: UnicodeString);
    procedure Set_UniqueName(Value: UnicodeString);
  end;

{ TXMLGroupMemberType_xList }

  TXMLGroupMemberType_xList = class(TXMLNodeCollection, IXMLGroupMemberType_xList)
  protected
    { IXMLGroupMemberType_xList }
    function Add: IXMLGroupMemberType_x;
    function Insert(const Index: Integer): IXMLGroupMemberType_x;

    function Get_Item(Index: Integer): IXMLGroupMemberType_x;
  end;

{ TXMLCalculatedMember_x }

  TXMLCalculatedMember_x = class(TXMLNode, IXMLCalculatedMember_x)
  protected
    { IXMLCalculatedMember_x }
    function Get_Name: UnicodeString;
    function Get_MemberName: UnicodeString;
    function Get_ParentUniqueName: UnicodeString;
    function Get_SourceHierarchy: UnicodeString;
    function Get_SourceHierarchyLevel: Integer;
    function Get_Formula: UnicodeString;
    function Get_SolveOrder: Integer;
    function Get_Invalid: UnicodeString;
    function Get_Set_: UnicodeString;
    procedure Set_Name(Value: UnicodeString);
    procedure Set_MemberName(Value: UnicodeString);
    procedure Set_ParentUniqueName(Value: UnicodeString);
    procedure Set_SourceHierarchy(Value: UnicodeString);
    procedure Set_SourceHierarchyLevel(Value: Integer);
    procedure Set_Formula(Value: UnicodeString);
    procedure Set_SolveOrder(Value: Integer);
    procedure Set_Invalid(Value: UnicodeString);
    procedure Set_Set_(Value: UnicodeString);
  end;

{ TXMLPTLineItemsType_x }

  TXMLPTLineItemsType_x = class(TXMLNode, IXMLPTLineItemsType_x)
  private
    FPTLineItem: IXMLPTLineItemType_xList;
  protected
    { IXMLPTLineItemsType_x }
    function Get_Orientation: UnicodeString;
    function Get_PTLineItem: IXMLPTLineItemType_xList;
    procedure Set_Orientation(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLPTLineItemsType_xList }

  TXMLPTLineItemsType_xList = class(TXMLNodeCollection, IXMLPTLineItemsType_xList)
  protected
    { IXMLPTLineItemsType_xList }
    function Add: IXMLPTLineItemsType_x;
    function Insert(const Index: Integer): IXMLPTLineItemsType_x;

    function Get_Item(Index: Integer): IXMLPTLineItemsType_x;
  end;

{ TXMLPTLineItemType_x }

  TXMLPTLineItemType_x = class(TXMLNode, IXMLPTLineItemType_x)
  private
    FItem: IXMLString_List;
  protected
    { IXMLPTLineItemType_x }
    function Get_ItemType: UnicodeString;
    function Get_DataField: Integer;
    function Get_BlockTotal: UnicodeString;
    function Get_CountOfSameItems: Integer;
    function Get_Item: IXMLString_List;
    procedure Set_ItemType(Value: UnicodeString);
    procedure Set_DataField(Value: Integer);
    procedure Set_BlockTotal(Value: UnicodeString);
    procedure Set_CountOfSameItems(Value: Integer);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLPTLineItemType_xList }

  TXMLPTLineItemType_xList = class(TXMLNodeCollection, IXMLPTLineItemType_xList)
  protected
    { IXMLPTLineItemType_xList }
    function Add: IXMLPTLineItemType_x;
    function Insert(const Index: Integer): IXMLPTLineItemType_x;

    function Get_Item(Index: Integer): IXMLPTLineItemType_x;
  end;

{ TXMLPTSourceType_x }

  TXMLPTSourceType_x = class(TXMLNode, IXMLPTSourceType_x)
  protected
    { IXMLPTSourceType_x }
    function Get_CacheFile: UnicodeString;
    function Get_CacheIndex: Integer;
    function Get_DataMember: UnicodeString;
    function Get_MissingItemsLimit: Integer;
    function Get_VersionRefreshableMin: Integer;
    function Get_VersionLastRefresh: UnicodeString;
    function Get_RefreshName: UnicodeString;
    function Get_RefreshDate: UnicodeString;
    function Get_RefreshDateCopy: UnicodeString;
    function Get_ConsolidationReference: IXMLConsolidationReferenceType_x;
    function Get_NoSaveData: UnicodeString;
    function Get_QuerySource: IXMLPTQuerySourceType_x;
    function Get_SourceConsolidation: IXMLSourceConsolidationType_x;
    function Get_BackgroundQuery: UnicodeString;
    function Get_CubeSource: UnicodeString;
    function Get_DisableRefresh: UnicodeString;
    function Get_HasNoRecords: UnicodeString;
    function Get_OptimizeCache: UnicodeString;
    function Get_RefreshOnFileOpen: UnicodeString;
    procedure Set_CacheFile(Value: UnicodeString);
    procedure Set_CacheIndex(Value: Integer);
    procedure Set_DataMember(Value: UnicodeString);
    procedure Set_MissingItemsLimit(Value: Integer);
    procedure Set_VersionRefreshableMin(Value: Integer);
    procedure Set_VersionLastRefresh(Value: UnicodeString);
    procedure Set_RefreshName(Value: UnicodeString);
    procedure Set_RefreshDate(Value: UnicodeString);
    procedure Set_RefreshDateCopy(Value: UnicodeString);
    procedure Set_NoSaveData(Value: UnicodeString);
    procedure Set_BackgroundQuery(Value: UnicodeString);
    procedure Set_CubeSource(Value: UnicodeString);
    procedure Set_DisableRefresh(Value: UnicodeString);
    procedure Set_HasNoRecords(Value: UnicodeString);
    procedure Set_OptimizeCache(Value: UnicodeString);
    procedure Set_RefreshOnFileOpen(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLConsolidationReferenceType_x }

  TXMLConsolidationReferenceType_x = class(TXMLNode, IXMLConsolidationReferenceType_x)
  protected
    { IXMLConsolidationReferenceType_x }
    function Get_FileName: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Reference: UnicodeString;
    procedure Set_FileName(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Reference(Value: UnicodeString);
  end;

{ TXMLPTQuerySourceType_x }

  TXMLPTQuerySourceType_x = class(TXMLNode, IXMLPTQuerySourceType_x)
  private
    FCommandText: IXMLString_List;
    FParameter: IXMLParameterTypeE_xList;
    FCommandTextOrignal: IXMLString_List;
    FSourceConnectionFile: IXMLString_List;
    FSourceDataFile: IXMLString_List;
    FLocalConnection: IXMLString_List;
  protected
    { IXMLPTQuerySourceType_x }
    function Get_QueryType: UnicodeString;
    function Get_CommandText: IXMLString_List;
    function Get_CommandType: UnicodeString;
    function Get_Maintain: UnicodeString;
    function Get_Connection: UnicodeString;
    function Get_Parameter: IXMLParameterTypeE_xList;
    function Get_CommandTextOrignal: IXMLString_List;
    function Get_SourceConnectionFile: IXMLString_List;
    function Get_SourceDataFile: IXMLString_List;
    function Get_RobustConnect: UnicodeString;
    function Get_RefreshTimeSpan: Integer;
    function Get_LocalConnection: IXMLString_List;
    function Get_NoRefreshCache: UnicodeString;
    function Get_UseLocalConnection: UnicodeString;
    function Get_VersionLastEdit: UnicodeString;
    function Get_VersionLastRefresh: UnicodeString;
    function Get_VersionRefreshableMin: UnicodeString;
    procedure Set_QueryType(Value: UnicodeString);
    procedure Set_CommandType(Value: UnicodeString);
    procedure Set_Maintain(Value: UnicodeString);
    procedure Set_Connection(Value: UnicodeString);
    procedure Set_RobustConnect(Value: UnicodeString);
    procedure Set_RefreshTimeSpan(Value: Integer);
    procedure Set_NoRefreshCache(Value: UnicodeString);
    procedure Set_UseLocalConnection(Value: UnicodeString);
    procedure Set_VersionLastEdit(Value: UnicodeString);
    procedure Set_VersionLastRefresh(Value: UnicodeString);
    procedure Set_VersionRefreshableMin(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLSourceConsolidationType_x }

  TXMLSourceConsolidationType_x = class(TXMLNode, IXMLSourceConsolidationType_x)
  private
    FReference: IXMLReference_xList;
  protected
    { IXMLSourceConsolidationType_x }
    function Get_Reference: IXMLReference_xList;
    function Get_NoAutoPage: UnicodeString;
    procedure Set_NoAutoPage(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLReference_x }

  TXMLReference_x = class(TXMLNode, IXMLReference_x)
  private
    FItem: IXMLString_List;
  protected
    { IXMLReference_x }
    function Get_ConsolidationReference: IXMLConsolidationReferenceType_x;
    function Get_Item: IXMLString_List;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLReference_xList }

  TXMLReference_xList = class(TXMLNodeCollection, IXMLReference_xList)
  protected
    { IXMLReference_xList }
    function Add: IXMLReference_x;
    function Insert(const Index: Integer): IXMLReference_x;

    function Get_Item(Index: Integer): IXMLReference_x;
  end;

{ TXMLPTFormulaType_x }

  TXMLPTFormulaType_x = class(TXMLNode, IXMLPTFormulaType_x)
  protected
    { IXMLPTFormulaType_x }
    function Get_Formula: UnicodeString;
    function Get_FormulaV10: UnicodeString;
    function Get_ParseFormulaAsV10: UnicodeString;
    function Get_FormulaIndex: Integer;
    function Get_PTRule: IXMLPTRuleType_x;
    procedure Set_Formula(Value: UnicodeString);
    procedure Set_FormulaV10(Value: UnicodeString);
    procedure Set_ParseFormulaAsV10(Value: UnicodeString);
    procedure Set_FormulaIndex(Value: Integer);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLPTFormulaType_xList }

  TXMLPTFormulaType_xList = class(TXMLNodeCollection, IXMLPTFormulaType_xList)
  protected
    { IXMLPTFormulaType_xList }
    function Add: IXMLPTFormulaType_x;
    function Insert(const Index: Integer): IXMLPTFormulaType_x;

    function Get_Item(Index: Integer): IXMLPTFormulaType_x;
  end;

{ TXMLPTFormatType_x }

  TXMLPTFormatType_x = class(TXMLNode, IXMLPTFormatType_x)
  private
    FPTRule: IXMLPTRuleType_xList;
  protected
    { IXMLPTFormatType_x }
    function Get_Style: UnicodeString;
    function Get_PTRule: IXMLPTRuleType_xList;
    function Get_FormatType: UnicodeString;
    function Get_IndividualCellBorders: UnicodeString;
    procedure Set_Style(Value: UnicodeString);
    procedure Set_FormatType(Value: UnicodeString);
    procedure Set_IndividualCellBorders(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLPTFormatType_xList }

  TXMLPTFormatType_xList = class(TXMLNodeCollection, IXMLPTFormatType_xList)
  protected
    { IXMLPTFormatType_xList }
    function Add: IXMLPTFormatType_x;
    function Insert(const Index: Integer): IXMLPTFormatType_x;

    function Get_Item(Index: Integer): IXMLPTFormatType_x;
  end;

{ TXMLDataValidationType_x }

  TXMLDataValidationType_x = class(TXMLNode, IXMLDataValidationType_x)
  protected
    { IXMLDataValidationType_x }
    function Get_Range: UnicodeString;
    function Get_Type_: UnicodeString;
    function Get_CellRangeList: UnicodeString;
    function Get_Qualifier: UnicodeString;
    function Get_UseBlank: UnicodeString;
    function Get_Min: UnicodeString;
    function Get_Max: UnicodeString;
    function Get_Value: UnicodeString;
    function Get_ComboHide: UnicodeString;
    function Get_IMEMode: UnicodeString;
    function Get_InputHide: UnicodeString;
    function Get_InputTitle: UnicodeString;
    function Get_InputMessage: UnicodeString;
    function Get_ErrorHide: UnicodeString;
    function Get_ErrorStyle: UnicodeString;
    function Get_ErrorMessage: UnicodeString;
    function Get_ErrorTitle: UnicodeString;
    procedure Set_Range(Value: UnicodeString);
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_CellRangeList(Value: UnicodeString);
    procedure Set_Qualifier(Value: UnicodeString);
    procedure Set_UseBlank(Value: UnicodeString);
    procedure Set_Min(Value: UnicodeString);
    procedure Set_Max(Value: UnicodeString);
    procedure Set_Value(Value: UnicodeString);
    procedure Set_ComboHide(Value: UnicodeString);
    procedure Set_IMEMode(Value: UnicodeString);
    procedure Set_InputHide(Value: UnicodeString);
    procedure Set_InputTitle(Value: UnicodeString);
    procedure Set_InputMessage(Value: UnicodeString);
    procedure Set_ErrorHide(Value: UnicodeString);
    procedure Set_ErrorStyle(Value: UnicodeString);
    procedure Set_ErrorMessage(Value: UnicodeString);
    procedure Set_ErrorTitle(Value: UnicodeString);
  end;

{ TXMLDataValidationType_xList }

  TXMLDataValidationType_xList = class(TXMLNodeCollection, IXMLDataValidationType_xList)
  protected
    { IXMLDataValidationType_xList }
    function Add: IXMLDataValidationType_x;
    function Insert(const Index: Integer): IXMLDataValidationType_x;

    function Get_Item(Index: Integer): IXMLDataValidationType_x;
  end;

{ TXMLAutoFilter_x }

  TXMLAutoFilter_x = class(TXMLNodeCollection, IXMLAutoFilter_x)
  protected
    { IXMLAutoFilter_x }
    function Get_Range: UnicodeString;
    function Get_AutoFilterColumn(Index: Integer): IXMLAutoFilterColumnType_x;
    procedure Set_Range(Value: UnicodeString);
    function Add: IXMLAutoFilterColumnType_x;
    function Insert(const Index: Integer): IXMLAutoFilterColumnType_x;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLAutoFilterColumnType_x }

  TXMLAutoFilterColumnType_x = class(TXMLNode, IXMLAutoFilterColumnType_x)
  protected
    { IXMLAutoFilterColumnType_x }
    function Get_Index: Integer;
    function Get_Type_: UnicodeString;
    function Get_Value: Integer;
    function Get_AutoFilterCondition: IXMLAutoFilterConditionType_x;
    function Get_AutoFilterOr: IXMLAutoFilterOr_x;
    function Get_AutoFilterAnd: IXMLAutoFilterAnd_x;
    procedure Set_Index(Value: Integer);
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_Value(Value: Integer);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLAutoFilterConditionType_x }

  TXMLAutoFilterConditionType_x = class(TXMLNode, IXMLAutoFilterConditionType_x)
  protected
    { IXMLAutoFilterConditionType_x }
    function Get_Operator_: UnicodeString;
    function Get_Value: UnicodeString;
    procedure Set_Operator_(Value: UnicodeString);
    procedure Set_Value(Value: UnicodeString);
  end;

{ TXMLAutoFilterOr_x }

  TXMLAutoFilterOr_x = class(TXMLNodeCollection, IXMLAutoFilterOr_x)
  protected
    { IXMLAutoFilterOr_x }
    function Get_AutoFilterCondition(Index: Integer): IXMLAutoFilterConditionType_x;
    function Add: IXMLAutoFilterConditionType_x;
    function Insert(const Index: Integer): IXMLAutoFilterConditionType_x;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLAutoFilterAnd_x }

  TXMLAutoFilterAnd_x = class(TXMLNodeCollection, IXMLAutoFilterAnd_x)
  protected
    { IXMLAutoFilterAnd_x }
    function Get_AutoFilterCondition(Index: Integer): IXMLAutoFilterConditionType_x;
    function Add: IXMLAutoFilterConditionType_x;
    function Insert(const Index: Integer): IXMLAutoFilterConditionType_x;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLConditionalFormattingType_x }

  TXMLConditionalFormattingType_x = class(TXMLNode, IXMLConditionalFormattingType_x)
  private
    FCondition: IXMLCondition_xList;
  protected
    { IXMLConditionalFormattingType_x }
    function Get_Range: UnicodeString;
    function Get_Condition: IXMLCondition_xList;
    procedure Set_Range(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLConditionalFormattingType_xList }

  TXMLConditionalFormattingType_xList = class(TXMLNodeCollection, IXMLConditionalFormattingType_xList)
  protected
    { IXMLConditionalFormattingType_xList }
    function Add: IXMLConditionalFormattingType_x;
    function Insert(const Index: Integer): IXMLConditionalFormattingType_x;

    function Get_Item(Index: Integer): IXMLConditionalFormattingType_x;
  end;

{ TXMLCondition_x }

  TXMLCondition_x = class(TXMLNode, IXMLCondition_x)
  protected
    { IXMLCondition_x }
    function Get_Style: UnicodeString;
    function Get_Qualifier: UnicodeString;
    function Get_Value1: UnicodeString;
    function Get_Value2: UnicodeString;
    function Get_Format: IXMLFormat_x;
    procedure Set_Style(Value: UnicodeString);
    procedure Set_Qualifier(Value: UnicodeString);
    procedure Set_Value1(Value: UnicodeString);
    procedure Set_Value2(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLCondition_xList }

  TXMLCondition_xList = class(TXMLNodeCollection, IXMLCondition_xList)
  protected
    { IXMLCondition_xList }
    function Add: IXMLCondition_x;
    function Insert(const Index: Integer): IXMLCondition_x;

    function Get_Item(Index: Integer): IXMLCondition_x;
  end;

{ TXMLFormat_x }

  TXMLFormat_x = class(TXMLNode, IXMLFormat_x)
  protected
    { IXMLFormat_x }
    function Get_Style: UnicodeString;
    procedure Set_Style(Value: UnicodeString);
  end;

{ TXMLSortingType_x }

  TXMLSortingType_x = class(TXMLNode, IXMLSortingType_x)
  private
    FSort: IXMLString_List;
    FDescending: IXMLString_List;
  protected
    { IXMLSortingType_x }
    function Get_Sort: IXMLString_List;
    function Get_Descending: IXMLString_List;
    function Get_LeftToRight: UnicodeString;
    function Get_CaseSensitive: UnicodeString;
    function Get_AlternateMethod: UnicodeString;
    procedure Set_LeftToRight(Value: UnicodeString);
    procedure Set_CaseSensitive(Value: UnicodeString);
    procedure Set_AlternateMethod(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLWorksheetoptions_c }

  TXMLWorksheetoptions_c = class(TXMLNode, IXMLWorksheetoptions_c)
  protected
    { IXMLWorksheetoptions_c }
    function Get_Displaycustomheaders: UnicodeString;
    procedure Set_Displaycustomheaders(Value: UnicodeString);
  end;

{ TXMLQueryTableType_x }

  TXMLQueryTableType_x = class(TXMLNode, IXMLQueryTableType_x)
  protected
    { IXMLQueryTableType_x }
    function Get_Name: UnicodeString;
    function Get_AutoFormatFont: UnicodeString;
    function Get_AutoFormatName: UnicodeString;
    function Get_AutoFormatNumber: UnicodeString;
    function Get_AutoFormatBorder: UnicodeString;
    function Get_AutoFormatPattern: UnicodeString;
    function Get_AutoFormatAlignment: UnicodeString;
    function Get_AutoFormatWidth: UnicodeString;
    function Get_QuerySource: IXMLQTQuerySourceType_x;
    function Get_DisableEdit: UnicodeString;
    function Get_DisableRefresh: UnicodeString;
    function Get_Filled: UnicodeString;
    function Get_InsertEntireRows: UnicodeString;
    function Get_NewAsync: UnicodeString;
    function Get_NoAutofit: UnicodeString;
    function Get_NoPreserveFormatting: UnicodeString;
    function Get_NoSaveData: UnicodeString;
    function Get_NoTitles: UnicodeString;
    function Get_OverwriteCells: UnicodeString;
    function Get_RefreshInfo: IXMLRefreshInfoType_x;
    function Get_RefreshOnFileOpen: UnicodeString;
    function Get_RowNumbers: UnicodeString;
    function Get_Synchronous: UnicodeString;
    procedure Set_Name(Value: UnicodeString);
    procedure Set_AutoFormatFont(Value: UnicodeString);
    procedure Set_AutoFormatName(Value: UnicodeString);
    procedure Set_AutoFormatNumber(Value: UnicodeString);
    procedure Set_AutoFormatBorder(Value: UnicodeString);
    procedure Set_AutoFormatPattern(Value: UnicodeString);
    procedure Set_AutoFormatAlignment(Value: UnicodeString);
    procedure Set_AutoFormatWidth(Value: UnicodeString);
    procedure Set_DisableEdit(Value: UnicodeString);
    procedure Set_DisableRefresh(Value: UnicodeString);
    procedure Set_Filled(Value: UnicodeString);
    procedure Set_InsertEntireRows(Value: UnicodeString);
    procedure Set_NewAsync(Value: UnicodeString);
    procedure Set_NoAutofit(Value: UnicodeString);
    procedure Set_NoPreserveFormatting(Value: UnicodeString);
    procedure Set_NoSaveData(Value: UnicodeString);
    procedure Set_NoTitles(Value: UnicodeString);
    procedure Set_OverwriteCells(Value: UnicodeString);
    procedure Set_RefreshOnFileOpen(Value: UnicodeString);
    procedure Set_RowNumbers(Value: UnicodeString);
    procedure Set_Synchronous(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLQueryTableType_xList }

  TXMLQueryTableType_xList = class(TXMLNodeCollection, IXMLQueryTableType_xList)
  protected
    { IXMLQueryTableType_xList }
    function Add: IXMLQueryTableType_x;
    function Insert(const Index: Integer): IXMLQueryTableType_x;

    function Get_Item(Index: Integer): IXMLQueryTableType_x;
  end;

{ TXMLPivotCache_x }

  TXMLPivotCache_x = class(TXMLNode, IXMLPivotCache_x)
  protected
    { IXMLPivotCache_x }
    function Get_CacheIndex: Integer;
    function Get_Schema: IXMLSchema_;
    function Get_Data: IXMLData_;
    procedure Set_CacheIndex(Value: Integer);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLPivotCache_xList }

  TXMLPivotCache_xList = class(TXMLNodeCollection, IXMLPivotCache_xList)
  protected
    { IXMLPivotCache_xList }
    function Add: IXMLPivotCache_x;
    function Insert(const Index: Integer): IXMLPivotCache_x;

    function Get_Item(Index: Integer): IXMLPivotCache_x;
  end;

{ TXMLSchema_ }

  TXMLSchema_ = class(TXMLNode, IXMLSchema_)
  private
    FAttributeType: IXMLAttributeType_List;
  protected
    { IXMLSchema_ }
    function Get_Id: UnicodeString;
    function Get_ElementType: IXMLElementType_;
    function Get_AttributeType: IXMLAttributeType_List;
    procedure Set_Id(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLElementType_ }

  TXMLElementType_ = class(TXMLNode, IXMLElementType_)
  private
    FAttribute: IXMLAttribute_List;
    FExtends: IXMLExtends_List;
  protected
    { IXMLElementType_ }
    function Get_Name: UnicodeString;
    function Get_Content: UnicodeString;
    function Get_Attribute: IXMLAttribute_List;
    function Get_Extends: IXMLExtends_List;
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Content(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLAttribute_ }

  TXMLAttribute_ = class(TXMLNode, IXMLAttribute_)
  protected
    { IXMLAttribute_ }
    function Get_Type_: UnicodeString;
    procedure Set_Type_(Value: UnicodeString);
  end;

{ TXMLAttribute_List }

  TXMLAttribute_List = class(TXMLNodeCollection, IXMLAttribute_List)
  protected
    { IXMLAttribute_List }
    function Add: IXMLAttribute_;
    function Insert(const Index: Integer): IXMLAttribute_;

    function Get_Item(Index: Integer): IXMLAttribute_;
  end;

{ TXMLExtends_ }

  TXMLExtends_ = class(TXMLNode, IXMLExtends_)
  protected
    { IXMLExtends_ }
    function Get_Type_: UnicodeString;
    procedure Set_Type_(Value: UnicodeString);
  end;

{ TXMLExtends_List }

  TXMLExtends_List = class(TXMLNodeCollection, IXMLExtends_List)
  protected
    { IXMLExtends_List }
    function Add: IXMLExtends_;
    function Insert(const Index: Integer): IXMLExtends_;

    function Get_Item(Index: Integer): IXMLExtends_;
  end;

{ TXMLAttributeType_ }

  TXMLAttributeType_ = class(TXMLNode, IXMLAttributeType_)
  protected
    { IXMLAttributeType_ }
    function Get_Name: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Datatype: IXMLDatatype_;
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLAttributeType_List }

  TXMLAttributeType_List = class(TXMLNodeCollection, IXMLAttributeType_List)
  protected
    { IXMLAttributeType_List }
    function Add: IXMLAttributeType_;
    function Insert(const Index: Integer): IXMLAttributeType_;

    function Get_Item(Index: Integer): IXMLAttributeType_;
  end;

{ TXMLDatatype_ }

  TXMLDatatype_ = class(TXMLNode, IXMLDatatype_)
  protected
    { IXMLDatatype_ }
    function Get_Type_: UnicodeString;
    function Get_MaxLength: Integer;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_MaxLength(Value: Integer);
  end;

{ TXMLData_ }

  TXMLData_ = class(TXMLNodeCollection, IXMLData_)
  protected
    { IXMLData_ }
    function Get_Row(Index: Integer): IXMLRow_;
    function Add: IXMLRow_;
    function Insert(const Index: Integer): IXMLRow_;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLRow_ }

  TXMLRow_ = class(TXMLNode, IXMLRow_)
  protected
    { IXMLRow_ }
    function Get_Col1: UnicodeString;
    function Get_Col2: UnicodeString;
    function Get_Col3: UnicodeString;
    function Get_Col4: UnicodeString;
    function Get_Col5: UnicodeString;
    function Get_Col6: UnicodeString;
    function Get_Col7: UnicodeString;
    function Get_Col8: UnicodeString;
    function Get_Col9: UnicodeString;
    function Get_Col10: UnicodeString;
    function Get_Col11: UnicodeString;
    function Get_Col12: UnicodeString;
    function Get_Col13: UnicodeString;
    function Get_Col14: UnicodeString;
    function Get_Col15: UnicodeString;
    function Get_Col16: UnicodeString;
    function Get_Col17: UnicodeString;
    function Get_Col18: UnicodeString;
    function Get_Col19: UnicodeString;
    function Get_Col20: UnicodeString;
    procedure Set_Col1(Value: UnicodeString);
    procedure Set_Col2(Value: UnicodeString);
    procedure Set_Col3(Value: UnicodeString);
    procedure Set_Col4(Value: UnicodeString);
    procedure Set_Col5(Value: UnicodeString);
    procedure Set_Col6(Value: UnicodeString);
    procedure Set_Col7(Value: UnicodeString);
    procedure Set_Col8(Value: UnicodeString);
    procedure Set_Col9(Value: UnicodeString);
    procedure Set_Col10(Value: UnicodeString);
    procedure Set_Col11(Value: UnicodeString);
    procedure Set_Col12(Value: UnicodeString);
    procedure Set_Col13(Value: UnicodeString);
    procedure Set_Col14(Value: UnicodeString);
    procedure Set_Col15(Value: UnicodeString);
    procedure Set_Col16(Value: UnicodeString);
    procedure Set_Col17(Value: UnicodeString);
    procedure Set_Col18(Value: UnicodeString);
    procedure Set_Col19(Value: UnicodeString);
    procedure Set_Col20(Value: UnicodeString);
  end;

{ TXMLMapInfoType_x2 }

  TXMLMapInfoType_x2 = class(TXMLNode, IXMLMapInfoType_x2)
  private
    FSchema: IXMLSchemaType_x2List;
    FMap: IXMLMapType_x2List;
  protected
    { IXMLMapInfoType_x2 }
    function Get_HideInactiveListBorder: UnicodeString;
    function Get_SelectionNamespaces: UnicodeString;
    function Get_Schema: IXMLSchemaType_x2List;
    function Get_Map: IXMLMapType_x2List;
    procedure Set_HideInactiveListBorder(Value: UnicodeString);
    procedure Set_SelectionNamespaces(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLMapInfoType_x2List }

  TXMLMapInfoType_x2List = class(TXMLNodeCollection, IXMLMapInfoType_x2List)
  protected
    { IXMLMapInfoType_x2List }
    function Add: IXMLMapInfoType_x2;
    function Insert(const Index: Integer): IXMLMapInfoType_x2;

    function Get_Item(Index: Integer): IXMLMapInfoType_x2;
  end;

{ TXMLSchemaType_x2 }

  TXMLSchemaType_x2 = class(TXMLNode, IXMLSchemaType_x2)
  protected
    { IXMLSchemaType_x2 }
    function Get_ID: UnicodeString;
    function Get_Namespace: UnicodeString;
    function Get_SchemaRef: UnicodeString;
    procedure Set_ID(Value: UnicodeString);
    procedure Set_Namespace(Value: UnicodeString);
    procedure Set_SchemaRef(Value: UnicodeString);
  end;

{ TXMLSchemaType_x2List }

  TXMLSchemaType_x2List = class(TXMLNodeCollection, IXMLSchemaType_x2List)
  protected
    { IXMLSchemaType_x2List }
    function Add: IXMLSchemaType_x2;
    function Insert(const Index: Integer): IXMLSchemaType_x2;

    function Get_Item(Index: Integer): IXMLSchemaType_x2;
  end;

{ TXMLMapType_x2 }

  TXMLMapType_x2 = class(TXMLNode, IXMLMapType_x2)
  private
    FEntry: IXMLEntryType_x2List;
  protected
    { IXMLMapType_x2 }
    function Get_ID: UnicodeString;
    function Get_SchemaID: UnicodeString;
    function Get_RootElement: UnicodeString;
    function Get_ShowImportExportValidationErrors: UnicodeString;
    function Get_Append: UnicodeString;
    function Get_DoNotPersist: UnicodeString;
    function Get_NoAutoFit: UnicodeString;
    function Get_NoPreserveFormatting: UnicodeString;
    function Get_Entry: IXMLEntryType_x2List;
    function Get_Mapdata: IXMLMapdata_x2;
    procedure Set_ID(Value: UnicodeString);
    procedure Set_SchemaID(Value: UnicodeString);
    procedure Set_RootElement(Value: UnicodeString);
    procedure Set_ShowImportExportValidationErrors(Value: UnicodeString);
    procedure Set_Append(Value: UnicodeString);
    procedure Set_DoNotPersist(Value: UnicodeString);
    procedure Set_NoAutoFit(Value: UnicodeString);
    procedure Set_NoPreserveFormatting(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLMapType_x2List }

  TXMLMapType_x2List = class(TXMLNodeCollection, IXMLMapType_x2List)
  protected
    { IXMLMapType_x2List }
    function Add: IXMLMapType_x2;
    function Insert(const Index: Integer): IXMLMapType_x2;

    function Get_Item(Index: Integer): IXMLMapType_x2;
  end;

{ TXMLEntryType_x2 }

  TXMLEntryType_x2 = class(TXMLNode, IXMLEntryType_x2)
  private
    FField: IXMLFieldType_x2List;
  protected
    { IXMLEntryType_x2 }
    function Get_ID: UnicodeString;
    function Get_ShowTotals: UnicodeString;
    function Get_Type_: UnicodeString;
    function Get_Range: UnicodeString;
    function Get_HeaderRange: UnicodeString;
    function Get_FilterOn: UnicodeString;
    function Get_XPath: UnicodeString;
    function Get_Field: IXMLFieldType_x2List;
    function Get_ActiveRows: IXMLActiveRowsType_x2;
    function Get_NoInserts: UnicodeString;
    function Get_ReadOnly: UnicodeString;
    function Get_InstanceShape: UnicodeString;
    procedure Set_ID(Value: UnicodeString);
    procedure Set_ShowTotals(Value: UnicodeString);
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_Range(Value: UnicodeString);
    procedure Set_HeaderRange(Value: UnicodeString);
    procedure Set_FilterOn(Value: UnicodeString);
    procedure Set_XPath(Value: UnicodeString);
    procedure Set_NoInserts(Value: UnicodeString);
    procedure Set_ReadOnly(Value: UnicodeString);
    procedure Set_InstanceShape(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLEntryType_x2List }

  TXMLEntryType_x2List = class(TXMLNodeCollection, IXMLEntryType_x2List)
  protected
    { IXMLEntryType_x2List }
    function Add: IXMLEntryType_x2;
    function Insert(const Index: Integer): IXMLEntryType_x2;

    function Get_Item(Index: Integer): IXMLEntryType_x2;
  end;

{ TXMLFieldType_x2 }

  TXMLFieldType_x2 = class(TXMLNode, IXMLFieldType_x2)
  protected
    { IXMLFieldType_x2 }
    function Get_ID: UnicodeString;
    function Get_Range: UnicodeString;
    function Get_XPath: UnicodeString;
    function Get_XSDType: UnicodeString;
    function Get_Cell: IXMLCell_;
    function Get_DataValidation: IXMLDataValidationType_x;
    function Get_Aggregate: UnicodeString;
    function Get_AutoFilterColumn: IXMLAutoFilterColumnType_x;
    procedure Set_ID(Value: UnicodeString);
    procedure Set_Range(Value: UnicodeString);
    procedure Set_XPath(Value: UnicodeString);
    procedure Set_XSDType(Value: UnicodeString);
    procedure Set_Aggregate(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLFieldType_x2List }

  TXMLFieldType_x2List = class(TXMLNodeCollection, IXMLFieldType_x2List)
  protected
    { IXMLFieldType_x2List }
    function Add: IXMLFieldType_x2;
    function Insert(const Index: Integer): IXMLFieldType_x2;

    function Get_Item(Index: Integer): IXMLFieldType_x2;
  end;

{ TXMLCell_ }

  TXMLCell_ = class(TXMLNode, IXMLCell_)
  private
    FSmartTags: IXMLSmartTagsElt_oList;
    FNamedCell: IXMLNamedCell_List;
  protected
    { IXMLCell_ }
    function Get_ArrayRange: UnicodeString;
    function Get_Formula: UnicodeString;
    function Get_HRef: UnicodeString;
    function Get_Index: LongWord;
    function Get_MergeAcross: Int64;
    function Get_MergeDown: Int64;
    function Get_StyleID: UnicodeString;
    function Get_HRefScreenTip: UnicodeString;
    function Get_PasteFormula: UnicodeString;
    function Get_SmartTags: IXMLSmartTagsElt_oList;
    function Get_Data: IXMLData_;
    function Get_Comment: IXMLCommentType_;
    function Get_Phonetictext: IXMLPhonetictext_x;
    function Get_NamedCell: IXMLNamedCell_List;
    procedure Set_ArrayRange(Value: UnicodeString);
    procedure Set_Formula(Value: UnicodeString);
    procedure Set_HRef(Value: UnicodeString);
    procedure Set_Index(Value: LongWord);
    procedure Set_MergeAcross(Value: Int64);
    procedure Set_MergeDown(Value: Int64);
    procedure Set_StyleID(Value: UnicodeString);
    procedure Set_HRefScreenTip(Value: UnicodeString);
    procedure Set_PasteFormula(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLCommentType_ }

  TXMLCommentType_ = class(TXMLNode, IXMLCommentType_)
  protected
    { IXMLCommentType_ }
    function Get_Author: UnicodeString;
    function Get_ShowAlways: UnicodeString;
    function Get_Data: IXMLData_;
    procedure Set_Author(Value: UnicodeString);
    procedure Set_ShowAlways(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLNamedCell_ }

  TXMLNamedCell_ = class(TXMLNode, IXMLNamedCell_)
  protected
    { IXMLNamedCell_ }
    function Get_Name: UnicodeString;
    procedure Set_Name(Value: UnicodeString);
  end;

{ TXMLNamedCell_List }

  TXMLNamedCell_List = class(TXMLNodeCollection, IXMLNamedCell_List)
  protected
    { IXMLNamedCell_List }
    function Add: IXMLNamedCell_;
    function Insert(const Index: Integer): IXMLNamedCell_;

    function Get_Item(Index: Integer): IXMLNamedCell_;
  end;

{ TXMLActiveRowsType_x2 }

  TXMLActiveRowsType_x2 = class(TXMLNodeCollection, IXMLActiveRowsType_x2)
  protected
    { IXMLActiveRowsType_x2 }
    function Get_ActiveRow(Index: Integer): UnicodeString;
    function Add(const ActiveRow: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const ActiveRow: UnicodeString): IXMLNode;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLMapdata_x2 }

  TXMLMapdata_x2 = class(TXMLNode, IXMLMapdata_x2)
  protected
    { IXMLMapdata_x2 }
  end;

{ TXMLBindingType_x2 }

  TXMLBindingType_x2 = class(TXMLNode, IXMLBindingType_x2)
  protected
    { IXMLBindingType_x2 }
    function Get_ID: UnicodeString;
    function Get_LoadMode: UnicodeString;
    function Get_Async: UnicodeString;
    function Get_MapID: UnicodeString;
    function Get_DataSource: IXMLDataSource_;
    procedure Set_ID(Value: UnicodeString);
    procedure Set_LoadMode(Value: UnicodeString);
    procedure Set_Async(Value: UnicodeString);
    procedure Set_MapID(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLBindingType_x2List }

  TXMLBindingType_x2List = class(TXMLNodeCollection, IXMLBindingType_x2List)
  protected
    { IXMLBindingType_x2List }
    function Add: IXMLBindingType_x2;
    function Insert(const Index: Integer): IXMLBindingType_x2;

    function Get_Item(Index: Integer): IXMLBindingType_x2;
  end;

{ TXMLDataSource_ }

  TXMLDataSource_ = class(TXMLNode, IXMLDataSource_)
  protected
    { IXMLDataSource_ }
    function Get_MinorVersion: UnicodeString;
    function Get_MajorVersion: UnicodeString;
    function Get_Type_: IXMLType__;
    function Get_Name: UnicodeString;
    function Get_ConnectionInfo: IXMLConnectionInfoType_;
    function Get_Description: UnicodeString;
    function Get_Keywords: UnicodeString;
    function Get_TooltipInfo: UnicodeString;
    procedure Set_MinorVersion(Value: UnicodeString);
    procedure Set_MajorVersion(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Description(Value: UnicodeString);
    procedure Set_Keywords(Value: UnicodeString);
    procedure Set_TooltipInfo(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLType__ }

  TXMLType__ = class(TXMLNode, IXMLType__)
  protected
    { IXMLType__ }
    function Get_Type_: UnicodeString;
    function Get_MajorVersion: UnicodeString;
    function Get_MinorVersion: UnicodeString;
    function Get_SubType: IXMLSubType_;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_MajorVersion(Value: UnicodeString);
    procedure Set_MinorVersion(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLSubType_ }

  TXMLSubType_ = class(TXMLNode, IXMLSubType_)
  protected
    { IXMLSubType_ }
    function Get_Type_: UnicodeString;
    function Get_MinorVersion: UnicodeString;
    function Get_MajorVersion: UnicodeString;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_MinorVersion(Value: UnicodeString);
    procedure Set_MajorVersion(Value: UnicodeString);
  end;

{ TXMLConnectionInfoType_ }

  TXMLConnectionInfoType_ = class(TXMLNode, IXMLConnectionInfoType_)
  protected
    { IXMLConnectionInfoType_ }
    function Get_Purpose: UnicodeString;
    function Get_Location: IXMLLocation_;
    function Get_Authentication: IXMLAuthentication_;
    function Get_SOAPAction: UnicodeString;
    function Get_Header: IXMLHeader_;
    function Get_Body: IXMLBody_;
    function Get_File_: UnicodeString;
    function Get_ClientParameterBindings: IXMLClientParameterBindings_;
    function Get_ClientParameterValue: IXMLClientParameterValue_;
    function Get_Attribute: IXMLAttribute_;
    function Get_If_: IXMLIf__;
    function Get_CredentialValue: IXMLCredentialValue_;
    procedure Set_Purpose(Value: UnicodeString);
    procedure Set_SOAPAction(Value: UnicodeString);
    procedure Set_File_(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLLocation_ }

  TXMLLocation_ = class(TXMLNode, IXMLLocation_)
  protected
    { IXMLLocation_ }
    function Get_Href: UnicodeString;
    procedure Set_Href(Value: UnicodeString);
  end;

{ TXMLAuthentication_ }

  TXMLAuthentication_ = class(TXMLNode, IXMLAuthentication_)
  protected
    { IXMLAuthentication_ }
    function Get_Windows: UnicodeString;
    function Get_Basic: IXMLBasic_;
    procedure Set_Windows(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLBasic_ }

  TXMLBasic_ = class(TXMLNode, IXMLBasic_)
  protected
    { IXMLBasic_ }
    function Get_UseExplicit: IXMLUseExplicit_;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLUseExplicit_ }

  TXMLUseExplicit_ = class(TXMLNode, IXMLUseExplicit_)
  protected
    { IXMLUseExplicit_ }
    function Get_UserId: IXMLUserId_;
    function Get_Password: IXMLPassword_;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLUserId_ }

  TXMLUserId_ = class(TXMLNode, IXMLUserId_)
  protected
    { IXMLUserId_ }
    function Get_Resource: UnicodeString;
    function Get_Type_: UnicodeString;
    procedure Set_Resource(Value: UnicodeString);
    procedure Set_Type_(Value: UnicodeString);
  end;

{ TXMLPassword_ }

  TXMLPassword_ = class(TXMLNode, IXMLPassword_)
  protected
    { IXMLPassword_ }
    function Get_Type_: UnicodeString;
    function Get_CredentialValue: UnicodeString;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_CredentialValue(Value: UnicodeString);
  end;

{ TXMLHeader_ }

  TXMLHeader_ = class(TXMLNode, IXMLHeader_)
  protected
    { IXMLHeader_ }
  end;

{ TXMLBody_ }

  TXMLBody_ = class(TXMLNode, IXMLBody_)
  protected
    { IXMLBody_ }
  end;

{ TXMLClientParameterBindings_ }

  TXMLClientParameterBindings_ = class(TXMLNode, IXMLClientParameterBindings_)
  protected
    { IXMLClientParameterBindings_ }
    function Get_ClientParameterBinding: IXMLClientParameterBinding_;
    function Get_CredentialBinding: IXMLCredentialBinding_;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLClientParameterBinding_ }

  TXMLClientParameterBinding_ = class(TXMLNode, IXMLClientParameterBinding_)
  protected
    { IXMLClientParameterBinding_ }
    function Get_Name: UnicodeString;
    function Get_Location: UnicodeString;
    function Get_Item: UnicodeString;
    function Get_DefaultValue: UnicodeString;
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Location(Value: UnicodeString);
    procedure Set_Item(Value: UnicodeString);
    procedure Set_DefaultValue(Value: UnicodeString);
  end;

{ TXMLCredentialBinding_ }

  TXMLCredentialBinding_ = class(TXMLNodeCollection, IXMLCredentialBinding_)
  protected
    { IXMLCredentialBinding_ }
    function Get_Resource: UnicodeString;
    function Get_Credential(Index: Integer): IXMLCredential_;
    procedure Set_Resource(Value: UnicodeString);
    function Add: IXMLCredential_;
    function Insert(const Index: Integer): IXMLCredential_;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLCredential_ }

  TXMLCredential_ = class(TXMLNode, IXMLCredential_)
  protected
    { IXMLCredential_ }
    function Get_Type_: UnicodeString;
    function Get_DefaultValue: UnicodeString;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_DefaultValue(Value: UnicodeString);
  end;

{ TXMLClientParameterValue_ }

  TXMLClientParameterValue_ = class(TXMLNode, IXMLClientParameterValue_)
  protected
    { IXMLClientParameterValue_ }
    function Get_Name: UnicodeString;
    procedure Set_Name(Value: UnicodeString);
  end;

{ TXMLIf__ }

  TXMLIf__ = class(TXMLNode, IXMLIf__)
  protected
    { IXMLIf__ }
    function Get_ClientParameter: UnicodeString;
    function Get_ClientParameterValue: IXMLClientParameterValue_;
    procedure Set_ClientParameter(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLCredentialValue_ }

  TXMLCredentialValue_ = class(TXMLNode, IXMLCredentialValue_)
  protected
    { IXMLCredentialValue_ }
    function Get_Resource: UnicodeString;
    function Get_Type_: UnicodeString;
    procedure Set_Resource(Value: UnicodeString);
    procedure Set_Type_(Value: UnicodeString);
  end;

{ TXMLComponentOptionsType_c }

  TXMLComponentOptionsType_c = class(TXMLNode, IXMLComponentOptionsType_c)
  protected
    { IXMLComponentOptionsType_c }
    function Get_Toolbar: IXMLToolbar_c;
    function Get_SpreadsheetAutoFit: UnicodeString;
    function Get_Label_: IXMLLabel__c;
    function Get_MaxHeight: UnicodeString;
    function Get_MaxWidth: UnicodeString;
    function Get_NextSheetNumber: Integer;
    procedure Set_SpreadsheetAutoFit(Value: UnicodeString);
    procedure Set_MaxHeight(Value: UnicodeString);
    procedure Set_MaxWidth(Value: UnicodeString);
    procedure Set_NextSheetNumber(Value: Integer);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLToolbar_c }

  TXMLToolbar_c = class(TXMLNode, IXMLToolbar_c)
  protected
    { IXMLToolbar_c }
    function Get_Hidden: UnicodeString;
    function Get_HideOfficeLogo: UnicodeString;
    procedure Set_Hidden(Value: UnicodeString);
    procedure Set_HideOfficeLogo(Value: UnicodeString);
  end;

{ TXMLLabel__c }

  TXMLLabel__c = class(TXMLNode, IXMLLabel__c)
  protected
    { IXMLLabel__c }
    function Get_Caption: UnicodeString;
    procedure Set_Caption(Value: UnicodeString);
  end;

{ TXMLIntegerList }

  TXMLIntegerList = class(TXMLNodeCollection, IXMLIntegerList)
  protected
    { IXMLIntegerList }
    function Add(const Value: Integer): IXMLNode;
    function Insert(const Index: Integer; const Value: Integer): IXMLNode;

    function Get_Item(Index: Integer): Integer;
  end;

{ TXMLSubtotalTypeList }

  TXMLSubtotalTypeList = class(TXMLNodeCollection, IXMLSubtotalTypeList)
  protected
    { IXMLSubtotalTypeList }
    function Add(const Value: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;

    function Get_Item(Index: Integer): UnicodeString;
  end;

{ TXMLDoubleList }

  TXMLDoubleList = class(TXMLNodeCollection, IXMLDoubleList)
  protected
    { IXMLDoubleList }
    function Add(const Value: Double): IXMLNode;
    function Insert(const Index: Integer; const Value: Double): IXMLNode;

    function Get_Item(Index: Integer): Double;
  end;

{ TXMLString_List }

  TXMLString_List = class(TXMLNodeCollection, IXMLString_List)
  protected
    { IXMLString_List }
    function Add(const Value: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;

    function Get_Item(Index: Integer): UnicodeString;
  end;

{ Global Functions }

function GetWorkbook(Doc: IXMLDocument): IXMLWorkbook;
function LoadWorkbook(const FileName: string): IXMLWorkbook;
function NewWorkbook: IXMLWorkbook;

const
  TargetNamespace = '';

implementation

{ Global Functions }

function GetWorkbook(Doc: IXMLDocument): IXMLWorkbook;
begin
  Result := Doc.GetDocBinding('Workbook', TXMLWorkbook, TargetNamespace) as IXMLWorkbook;
end;

function LoadWorkbook(const FileName: string): IXMLWorkbook;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('Workbook', TXMLWorkbook, TargetNamespace) as IXMLWorkbook;
end;

function NewWorkbook: IXMLWorkbook;
begin
  Result := NewXMLDocument.GetDocBinding('Workbook', TXMLWorkbook, TargetNamespace) as IXMLWorkbook;
end;

{ TXMLWorkbook }

procedure TXMLWorkbook.AfterConstruction;
begin
  RegisterChildNode('SmartTagType', TXMLSmartTagTypeElt_o);
  RegisterChildNode('DocumentProperties', TXMLDocumentPropertiesElt_o);
  RegisterChildNode('CustomDocumentProperties', TXMLCustomDocumentPropertiesElt_o);
  RegisterChildNode('OfficeDocumentSettings', TXMLOfficeDocumentSettingsElt_o);
  RegisterChildNode('ExcelWorkbook', TXMLExcelWorkbook_x);
  RegisterChildNode('Styles', TXMLWorkbook_Styles);
  RegisterChildNode('Names', TXMLNamesType);
  RegisterChildNode('Worksheet', TXMLWorksheetType);
  RegisterChildNode('PivotCache', TXMLPivotCache_x);
  RegisterChildNode('MapInfo', TXMLMapInfoType_x2);
  RegisterChildNode('Binding', TXMLBindingType_x2);
  RegisterChildNode('ComponentOptions', TXMLComponentOptionsType_c);
  FSmartTagType := CreateCollection(TXMLSmartTagTypeElt_oList, IXMLSmartTagTypeElt_o, 'SmartTagType') as IXMLSmartTagTypeElt_oList;
  FWorksheet := CreateCollection(TXMLWorksheetTypeList, IXMLWorksheetType, 'Worksheet') as IXMLWorksheetTypeList;
  FPivotCache := CreateCollection(TXMLPivotCache_xList, IXMLPivotCache_x, 'PivotCache') as IXMLPivotCache_xList;
  FMapInfo := CreateCollection(TXMLMapInfoType_x2List, IXMLMapInfoType_x2, 'MapInfo') as IXMLMapInfoType_x2List;
  FBinding := CreateCollection(TXMLBindingType_x2List, IXMLBindingType_x2, 'Binding') as IXMLBindingType_x2List;
  inherited;
end;

function TXMLWorkbook.Get_SmartTagType: IXMLSmartTagTypeElt_oList;
begin
  Result := FSmartTagType;
end;

function TXMLWorkbook.Get_DocumentProperties: IXMLDocumentPropertiesElt_o;
begin
  Result := ChildNodes['DocumentProperties'] as IXMLDocumentPropertiesElt_o;
end;

function TXMLWorkbook.Get_CustomDocumentProperties: IXMLCustomDocumentPropertiesElt_o;
begin
  Result := ChildNodes['CustomDocumentProperties'] as IXMLCustomDocumentPropertiesElt_o;
end;

function TXMLWorkbook.Get_OfficeDocumentSettings: IXMLOfficeDocumentSettingsElt_o;
begin
  Result := ChildNodes['OfficeDocumentSettings'] as IXMLOfficeDocumentSettingsElt_o;
end;

function TXMLWorkbook.Get_ExcelWorkbook: IXMLExcelWorkbook_x;
begin
  Result := ChildNodes['ExcelWorkbook'] as IXMLExcelWorkbook_x;
end;

function TXMLWorkbook.Get_Styles: IXMLWorkbook_Styles;
begin
  Result := ChildNodes['Styles'] as IXMLWorkbook_Styles;
end;

function TXMLWorkbook.Get_Names: IXMLNamesType;
begin
  Result := ChildNodes['Names'] as IXMLNamesType;
end;

function TXMLWorkbook.Get_Worksheet: IXMLWorksheetTypeList;
begin
  Result := FWorksheet;
end;

function TXMLWorkbook.Get_PivotCache: IXMLPivotCache_xList;
begin
  Result := FPivotCache;
end;

function TXMLWorkbook.Get_Name: UnicodeString;
begin
  Result := ChildNodes['Name'].Text;
end;

procedure TXMLWorkbook.Set_Name(Value: UnicodeString);
begin
  ChildNodes['Name'].NodeValue := Value;
end;

function TXMLWorkbook.Get_MapInfo: IXMLMapInfoType_x2List;
begin
  Result := FMapInfo;
end;

function TXMLWorkbook.Get_Binding: IXMLBindingType_x2List;
begin
  Result := FBinding;
end;

function TXMLWorkbook.Get_ComponentOptions: IXMLComponentOptionsType_c;
begin
  Result := ChildNodes['ComponentOptions'] as IXMLComponentOptionsType_c;
end;

{ TXMLSmartTagTypeElt_o }

function TXMLSmartTagTypeElt_o.Get_Namespaceuri: UnicodeString;
begin
  Result := AttributeNodes['namespaceuri'].Text;
end;

procedure TXMLSmartTagTypeElt_o.Set_Namespaceuri(Value: UnicodeString);
begin
  SetAttribute('namespaceuri', Value);
end;

function TXMLSmartTagTypeElt_o.Get_Name: UnicodeString;
begin
  Result := AttributeNodes['name'].Text;
end;

procedure TXMLSmartTagTypeElt_o.Set_Name(Value: UnicodeString);
begin
  SetAttribute('name', Value);
end;

function TXMLSmartTagTypeElt_o.Get_Url: UnicodeString;
begin
  Result := AttributeNodes['url'].Text;
end;

procedure TXMLSmartTagTypeElt_o.Set_Url(Value: UnicodeString);
begin
  SetAttribute('url', Value);
end;

function TXMLSmartTagTypeElt_o.Get_Namespaceuri: UnicodeString;
begin
  Result := AttributeNodes['namespaceuri'].Text;
end;

procedure TXMLSmartTagTypeElt_o.Set_Namespaceuri(Value: UnicodeString);
begin
  SetAttribute('namespaceuri', Value);
end;

function TXMLSmartTagTypeElt_o.Get_Name: UnicodeString;
begin
  Result := AttributeNodes['name'].Text;
end;

procedure TXMLSmartTagTypeElt_o.Set_Name(Value: UnicodeString);
begin
  SetAttribute('name', Value);
end;

function TXMLSmartTagTypeElt_o.Get_Url: UnicodeString;
begin
  Result := AttributeNodes['url'].Text;
end;

procedure TXMLSmartTagTypeElt_o.Set_Url(Value: UnicodeString);
begin
  SetAttribute('url', Value);
end;

{ TXMLSmartTagTypeElt_oList }

function TXMLSmartTagTypeElt_oList.Add: IXMLSmartTagTypeElt_o;
begin
  Result := AddItem(-1) as IXMLSmartTagTypeElt_o;
end;

function TXMLSmartTagTypeElt_oList.Insert(const Index: Integer): IXMLSmartTagTypeElt_o;
begin
  Result := AddItem(Index) as IXMLSmartTagTypeElt_o;
end;

function TXMLSmartTagTypeElt_oList.Get_Item(Index: Integer): IXMLSmartTagTypeElt_o;
begin
  Result := List[Index] as IXMLSmartTagTypeElt_o;
end;

{ TXMLDocumentPropertiesElt_o }

function TXMLDocumentPropertiesElt_o.Get_Title: UnicodeString;
begin
  Result := ChildNodes['Title'].Text;
end;

procedure TXMLDocumentPropertiesElt_o.Set_Title(Value: UnicodeString);
begin
  ChildNodes['Title'].NodeValue := Value;
end;

function TXMLDocumentPropertiesElt_o.Get_Subject: UnicodeString;
begin
  Result := ChildNodes['Subject'].Text;
end;

procedure TXMLDocumentPropertiesElt_o.Set_Subject(Value: UnicodeString);
begin
  ChildNodes['Subject'].NodeValue := Value;
end;

function TXMLDocumentPropertiesElt_o.Get_Author: UnicodeString;
begin
  Result := ChildNodes['Author'].Text;
end;

procedure TXMLDocumentPropertiesElt_o.Set_Author(Value: UnicodeString);
begin
  ChildNodes['Author'].NodeValue := Value;
end;

function TXMLDocumentPropertiesElt_o.Get_Keywords: UnicodeString;
begin
  Result := ChildNodes['Keywords'].Text;
end;

procedure TXMLDocumentPropertiesElt_o.Set_Keywords(Value: UnicodeString);
begin
  ChildNodes['Keywords'].NodeValue := Value;
end;

function TXMLDocumentPropertiesElt_o.Get_Description: UnicodeString;
begin
  Result := ChildNodes['Description'].Text;
end;

procedure TXMLDocumentPropertiesElt_o.Set_Description(Value: UnicodeString);
begin
  ChildNodes['Description'].NodeValue := Value;
end;

function TXMLDocumentPropertiesElt_o.Get_LastAuthor: UnicodeString;
begin
  Result := ChildNodes['LastAuthor'].Text;
end;

procedure TXMLDocumentPropertiesElt_o.Set_LastAuthor(Value: UnicodeString);
begin
  ChildNodes['LastAuthor'].NodeValue := Value;
end;

function TXMLDocumentPropertiesElt_o.Get_Revision: LongWord;
begin
  Result := ChildNodes['Revision'].NodeValue;
end;

procedure TXMLDocumentPropertiesElt_o.Set_Revision(Value: LongWord);
begin
  ChildNodes['Revision'].NodeValue := Value;
end;

function TXMLDocumentPropertiesElt_o.Get_AppName: UnicodeString;
begin
  Result := ChildNodes['AppName'].Text;
end;

procedure TXMLDocumentPropertiesElt_o.Set_AppName(Value: UnicodeString);
begin
  ChildNodes['AppName'].NodeValue := Value;
end;

function TXMLDocumentPropertiesElt_o.Get_TotalTime: LongWord;
begin
  Result := ChildNodes['TotalTime'].NodeValue;
end;

procedure TXMLDocumentPropertiesElt_o.Set_TotalTime(Value: LongWord);
begin
  ChildNodes['TotalTime'].NodeValue := Value;
end;

function TXMLDocumentPropertiesElt_o.Get_LastPrinted: UnicodeString;
begin
  Result := ChildNodes['LastPrinted'].Text;
end;

procedure TXMLDocumentPropertiesElt_o.Set_LastPrinted(Value: UnicodeString);
begin
  ChildNodes['LastPrinted'].NodeValue := Value;
end;

function TXMLDocumentPropertiesElt_o.Get_Created: UnicodeString;
begin
  Result := ChildNodes['Created'].Text;
end;

procedure TXMLDocumentPropertiesElt_o.Set_Created(Value: UnicodeString);
begin
  ChildNodes['Created'].NodeValue := Value;
end;

function TXMLDocumentPropertiesElt_o.Get_LastSaved: UnicodeString;
begin
  Result := ChildNodes['LastSaved'].Text;
end;

procedure TXMLDocumentPropertiesElt_o.Set_LastSaved(Value: UnicodeString);
begin
  ChildNodes['LastSaved'].NodeValue := Value;
end;

function TXMLDocumentPropertiesElt_o.Get_Pages: LongWord;
begin
  Result := ChildNodes['Pages'].NodeValue;
end;

procedure TXMLDocumentPropertiesElt_o.Set_Pages(Value: LongWord);
begin
  ChildNodes['Pages'].NodeValue := Value;
end;

function TXMLDocumentPropertiesElt_o.Get_Words: LongWord;
begin
  Result := ChildNodes['Words'].NodeValue;
end;

procedure TXMLDocumentPropertiesElt_o.Set_Words(Value: LongWord);
begin
  ChildNodes['Words'].NodeValue := Value;
end;

function TXMLDocumentPropertiesElt_o.Get_Characters: LongWord;
begin
  Result := ChildNodes['Characters'].NodeValue;
end;

procedure TXMLDocumentPropertiesElt_o.Set_Characters(Value: LongWord);
begin
  ChildNodes['Characters'].NodeValue := Value;
end;

function TXMLDocumentPropertiesElt_o.Get_Category: UnicodeString;
begin
  Result := ChildNodes['Category'].Text;
end;

procedure TXMLDocumentPropertiesElt_o.Set_Category(Value: UnicodeString);
begin
  ChildNodes['Category'].NodeValue := Value;
end;

function TXMLDocumentPropertiesElt_o.Get_PresentationFormat: UnicodeString;
begin
  Result := ChildNodes['PresentationFormat'].Text;
end;

procedure TXMLDocumentPropertiesElt_o.Set_PresentationFormat(Value: UnicodeString);
begin
  ChildNodes['PresentationFormat'].NodeValue := Value;
end;

function TXMLDocumentPropertiesElt_o.Get_Manager: UnicodeString;
begin
  Result := ChildNodes['Manager'].Text;
end;

procedure TXMLDocumentPropertiesElt_o.Set_Manager(Value: UnicodeString);
begin
  ChildNodes['Manager'].NodeValue := Value;
end;

function TXMLDocumentPropertiesElt_o.Get_Company: UnicodeString;
begin
  Result := ChildNodes['Company'].Text;
end;

procedure TXMLDocumentPropertiesElt_o.Set_Company(Value: UnicodeString);
begin
  ChildNodes['Company'].NodeValue := Value;
end;

function TXMLDocumentPropertiesElt_o.Get_Guid: UnicodeString;
begin
  Result := ChildNodes['Guid'].Text;
end;

procedure TXMLDocumentPropertiesElt_o.Set_Guid(Value: UnicodeString);
begin
  ChildNodes['Guid'].NodeValue := Value;
end;

function TXMLDocumentPropertiesElt_o.Get_HyperlinkBase: UnicodeString;
begin
  Result := ChildNodes['HyperlinkBase'].Text;
end;

procedure TXMLDocumentPropertiesElt_o.Set_HyperlinkBase(Value: UnicodeString);
begin
  ChildNodes['HyperlinkBase'].NodeValue := Value;
end;

function TXMLDocumentPropertiesElt_o.Get_Bytes: LongWord;
begin
  Result := ChildNodes['Bytes'].NodeValue;
end;

procedure TXMLDocumentPropertiesElt_o.Set_Bytes(Value: LongWord);
begin
  ChildNodes['Bytes'].NodeValue := Value;
end;

function TXMLDocumentPropertiesElt_o.Get_Lines: LongWord;
begin
  Result := ChildNodes['Lines'].NodeValue;
end;

procedure TXMLDocumentPropertiesElt_o.Set_Lines(Value: LongWord);
begin
  ChildNodes['Lines'].NodeValue := Value;
end;

function TXMLDocumentPropertiesElt_o.Get_Paragraphs: LongWord;
begin
  Result := ChildNodes['Paragraphs'].NodeValue;
end;

procedure TXMLDocumentPropertiesElt_o.Set_Paragraphs(Value: LongWord);
begin
  ChildNodes['Paragraphs'].NodeValue := Value;
end;

function TXMLDocumentPropertiesElt_o.Get_CharactersWithSpaces: LongWord;
begin
  Result := ChildNodes['CharactersWithSpaces'].NodeValue;
end;

procedure TXMLDocumentPropertiesElt_o.Set_CharactersWithSpaces(Value: LongWord);
begin
  ChildNodes['CharactersWithSpaces'].NodeValue := Value;
end;

function TXMLDocumentPropertiesElt_o.Get_Version: UnicodeString;
begin
  Result := ChildNodes['Version'].Text;
end;

procedure TXMLDocumentPropertiesElt_o.Set_Version(Value: UnicodeString);
begin
  ChildNodes['Version'].NodeValue := Value;
end;

{ TXMLCustomDocumentPropertiesElt_o }

{ TXMLOfficeDocumentSettingsElt_o }

procedure TXMLOfficeDocumentSettingsElt_o.AfterConstruction;
begin
  RegisterChildNode('LocationOfComponents', TXMLLocationOfComponentsElt_o);
  inherited;
end;

function TXMLOfficeDocumentSettingsElt_o.Get_DownloadComponents: UnicodeString;
begin
  Result := ChildNodes['DownloadComponents'].Text;
end;

procedure TXMLOfficeDocumentSettingsElt_o.Set_DownloadComponents(Value: UnicodeString);
begin
  ChildNodes['DownloadComponents'].NodeValue := Value;
end;

function TXMLOfficeDocumentSettingsElt_o.Get_LocationOfComponents: IXMLLocationOfComponentsElt_o;
begin
  Result := ChildNodes['LocationOfComponents'] as IXMLLocationOfComponentsElt_o;
end;

{ TXMLLocationOfComponentsElt_o }

function TXMLLocationOfComponentsElt_o.Get_HRef: UnicodeString;
begin
  Result := AttributeNodes['HRef'].Text;
end;

procedure TXMLLocationOfComponentsElt_o.Set_HRef(Value: UnicodeString);
begin
  SetAttribute('HRef', Value);
end;

{ TXMLExcelWorkbook_x }

procedure TXMLExcelWorkbook_x.AfterConstruction;
begin
  RegisterChildNode('PublishObjects', TXMLPublishObjectsType_x);
  RegisterChildNode('SupBook', TXMLSupBookType_x);
  FSupBook := CreateCollection(TXMLSupBookType_xList, IXMLSupBookType_x, 'SupBook') as IXMLSupBookType_xList;
  inherited;
end;

function TXMLExcelWorkbook_x.Get_PublishObjects: IXMLPublishObjectsType_x;
begin
  Result := ChildNodes['PublishObjects'] as IXMLPublishObjectsType_x;
end;

function TXMLExcelWorkbook_x.Get_SupBook: IXMLSupBookType_xList;
begin
  Result := FSupBook;
end;

function TXMLExcelWorkbook_x.Get_SelectedSheets: Integer;
begin
  Result := ChildNodes['SelectedSheets'].NodeValue;
end;

procedure TXMLExcelWorkbook_x.Set_SelectedSheets(Value: Integer);
begin
  ChildNodes['SelectedSheets'].NodeValue := Value;
end;

function TXMLExcelWorkbook_x.Get_WindowHidden: UnicodeString;
begin
  Result := ChildNodes['WindowHidden'].Text;
end;

procedure TXMLExcelWorkbook_x.Set_WindowHidden(Value: UnicodeString);
begin
  ChildNodes['WindowHidden'].NodeValue := Value;
end;

function TXMLExcelWorkbook_x.Get_HideHorizontalScrollBar: UnicodeString;
begin
  Result := ChildNodes['HideHorizontalScrollBar'].Text;
end;

procedure TXMLExcelWorkbook_x.Set_HideHorizontalScrollBar(Value: UnicodeString);
begin
  ChildNodes['HideHorizontalScrollBar'].NodeValue := Value;
end;

function TXMLExcelWorkbook_x.Get_HideVerticalScrollBar: UnicodeString;
begin
  Result := ChildNodes['HideVerticalScrollBar'].Text;
end;

procedure TXMLExcelWorkbook_x.Set_HideVerticalScrollBar(Value: UnicodeString);
begin
  ChildNodes['HideVerticalScrollBar'].NodeValue := Value;
end;

function TXMLExcelWorkbook_x.Get_HideWorkbookTabs: UnicodeString;
begin
  Result := ChildNodes['HideWorkbookTabs'].Text;
end;

procedure TXMLExcelWorkbook_x.Set_HideWorkbookTabs(Value: UnicodeString);
begin
  ChildNodes['HideWorkbookTabs'].NodeValue := Value;
end;

function TXMLExcelWorkbook_x.Get_WindowHeight: Int64;
begin
  Result := ChildNodes['WindowHeight'].NodeValue;
end;

procedure TXMLExcelWorkbook_x.Set_WindowHeight(Value: Int64);
begin
  ChildNodes['WindowHeight'].NodeValue := Value;
end;

function TXMLExcelWorkbook_x.Get_WindowWidth: Int64;
begin
  Result := ChildNodes['WindowWidth'].NodeValue;
end;

procedure TXMLExcelWorkbook_x.Set_WindowWidth(Value: Int64);
begin
  ChildNodes['WindowWidth'].NodeValue := Value;
end;

function TXMLExcelWorkbook_x.Get_WindowTopX: Int64;
begin
  Result := ChildNodes['WindowTopX'].NodeValue;
end;

procedure TXMLExcelWorkbook_x.Set_WindowTopX(Value: Int64);
begin
  ChildNodes['WindowTopX'].NodeValue := Value;
end;

function TXMLExcelWorkbook_x.Get_WindowTopY: Int64;
begin
  Result := ChildNodes['WindowTopY'].NodeValue;
end;

procedure TXMLExcelWorkbook_x.Set_WindowTopY(Value: Int64);
begin
  ChildNodes['WindowTopY'].NodeValue := Value;
end;

function TXMLExcelWorkbook_x.Get_ActiveSheet: Integer;
begin
  Result := ChildNodes['ActiveSheet'].NodeValue;
end;

procedure TXMLExcelWorkbook_x.Set_ActiveSheet(Value: Integer);
begin
  ChildNodes['ActiveSheet'].NodeValue := Value;
end;

function TXMLExcelWorkbook_x.Get_ActiveChart: UnicodeString;
begin
  Result := ChildNodes['ActiveChart'].Text;
end;

procedure TXMLExcelWorkbook_x.Set_ActiveChart(Value: UnicodeString);
begin
  ChildNodes['ActiveChart'].NodeValue := Value;
end;

function TXMLExcelWorkbook_x.Get_FirstVisibleSheet: Integer;
begin
  Result := ChildNodes['FirstVisibleSheet'].NodeValue;
end;

procedure TXMLExcelWorkbook_x.Set_FirstVisibleSheet(Value: Integer);
begin
  ChildNodes['FirstVisibleSheet'].NodeValue := Value;
end;

function TXMLExcelWorkbook_x.Get_HidePivotTableFieldList: UnicodeString;
begin
  Result := ChildNodes['HidePivotTableFieldList'].Text;
end;

procedure TXMLExcelWorkbook_x.Set_HidePivotTableFieldList(Value: UnicodeString);
begin
  ChildNodes['HidePivotTableFieldList'].NodeValue := Value;
end;

function TXMLExcelWorkbook_x.Get_ProtectStructure: UnicodeString;
begin
  Result := ChildNodes['ProtectStructure'].Text;
end;

procedure TXMLExcelWorkbook_x.Set_ProtectStructure(Value: UnicodeString);
begin
  ChildNodes['ProtectStructure'].NodeValue := Value;
end;

function TXMLExcelWorkbook_x.Get_ProtectWindows: UnicodeString;
begin
  Result := ChildNodes['ProtectWindows'].Text;
end;

procedure TXMLExcelWorkbook_x.Set_ProtectWindows(Value: UnicodeString);
begin
  ChildNodes['ProtectWindows'].NodeValue := Value;
end;

function TXMLExcelWorkbook_x.Get_DisplayInkNotes: UnicodeString;
begin
  Result := ChildNodes['DisplayInkNotes'].Text;
end;

procedure TXMLExcelWorkbook_x.Set_DisplayInkNotes(Value: UnicodeString);
begin
  ChildNodes['DisplayInkNotes'].NodeValue := Value;
end;

function TXMLExcelWorkbook_x.Get_EmbedSaveSmartTags: UnicodeString;
begin
  Result := ChildNodes['EmbedSaveSmartTags'].Text;
end;

procedure TXMLExcelWorkbook_x.Set_EmbedSaveSmartTags(Value: UnicodeString);
begin
  ChildNodes['EmbedSaveSmartTags'].NodeValue := Value;
end;

function TXMLExcelWorkbook_x.Get_FutureVer: UnicodeString;
begin
  Result := ChildNodes['FutureVer'].Text;
end;

procedure TXMLExcelWorkbook_x.Set_FutureVer(Value: UnicodeString);
begin
  ChildNodes['FutureVer'].NodeValue := Value;
end;

function TXMLExcelWorkbook_x.Get_TabRatio: Integer;
begin
  Result := ChildNodes['TabRatio'].NodeValue;
end;

procedure TXMLExcelWorkbook_x.Set_TabRatio(Value: Integer);
begin
  ChildNodes['TabRatio'].NodeValue := Value;
end;

function TXMLExcelWorkbook_x.Get_WindowIconic: UnicodeString;
begin
  Result := ChildNodes['WindowIconic'].Text;
end;

procedure TXMLExcelWorkbook_x.Set_WindowIconic(Value: UnicodeString);
begin
  ChildNodes['WindowIconic'].NodeValue := Value;
end;

function TXMLExcelWorkbook_x.Get_DisplayDrawingObjects: UnicodeString;
begin
  Result := ChildNodes['DisplayDrawingObjects'].Text;
end;

procedure TXMLExcelWorkbook_x.Set_DisplayDrawingObjects(Value: UnicodeString);
begin
  ChildNodes['DisplayDrawingObjects'].NodeValue := Value;
end;

function TXMLExcelWorkbook_x.Get_CreateBackup: UnicodeString;
begin
  Result := ChildNodes['CreateBackup'].Text;
end;

procedure TXMLExcelWorkbook_x.Set_CreateBackup(Value: UnicodeString);
begin
  ChildNodes['CreateBackup'].NodeValue := Value;
end;

function TXMLExcelWorkbook_x.Get_Calculation: UnicodeString;
begin
  Result := ChildNodes['Calculation'].Text;
end;

procedure TXMLExcelWorkbook_x.Set_Calculation(Value: UnicodeString);
begin
  ChildNodes['Calculation'].NodeValue := Value;
end;

function TXMLExcelWorkbook_x.Get_DoNotCalculateBeforeSave: UnicodeString;
begin
  Result := ChildNodes['DoNotCalculateBeforeSave'].Text;
end;

procedure TXMLExcelWorkbook_x.Set_DoNotCalculateBeforeSave(Value: UnicodeString);
begin
  ChildNodes['DoNotCalculateBeforeSave'].NodeValue := Value;
end;

function TXMLExcelWorkbook_x.Get_Date1904: UnicodeString;
begin
  Result := ChildNodes['Date1904'].Text;
end;

procedure TXMLExcelWorkbook_x.Set_Date1904(Value: UnicodeString);
begin
  ChildNodes['Date1904'].NodeValue := Value;
end;

function TXMLExcelWorkbook_x.Get_RefModeR1C1: UnicodeString;
begin
  Result := ChildNodes['RefModeR1C1'].Text;
end;

procedure TXMLExcelWorkbook_x.Set_RefModeR1C1(Value: UnicodeString);
begin
  ChildNodes['RefModeR1C1'].NodeValue := Value;
end;

function TXMLExcelWorkbook_x.Get_Iteration: UnicodeString;
begin
  Result := ChildNodes['Iteration'].Text;
end;

procedure TXMLExcelWorkbook_x.Set_Iteration(Value: UnicodeString);
begin
  ChildNodes['Iteration'].NodeValue := Value;
end;

function TXMLExcelWorkbook_x.Get_MaxIterations: UnicodeString;
begin
  Result := ChildNodes['MaxIterations'].Text;
end;

procedure TXMLExcelWorkbook_x.Set_MaxIterations(Value: UnicodeString);
begin
  ChildNodes['MaxIterations'].NodeValue := Value;
end;

function TXMLExcelWorkbook_x.Get_MaxChange: Double;
begin
  Result := ChildNodes['MaxChange'].NodeValue;
end;

procedure TXMLExcelWorkbook_x.Set_MaxChange(Value: Double);
begin
  ChildNodes['MaxChange'].NodeValue := Value;
end;

function TXMLExcelWorkbook_x.Get_PrecisionAsDisplayed: UnicodeString;
begin
  Result := ChildNodes['PrecisionAsDisplayed'].Text;
end;

procedure TXMLExcelWorkbook_x.Set_PrecisionAsDisplayed(Value: UnicodeString);
begin
  ChildNodes['PrecisionAsDisplayed'].NodeValue := Value;
end;

function TXMLExcelWorkbook_x.Get_DoNotSaveLinkValues: UnicodeString;
begin
  Result := ChildNodes['DoNotSaveLinkValues'].Text;
end;

procedure TXMLExcelWorkbook_x.Set_DoNotSaveLinkValues(Value: UnicodeString);
begin
  ChildNodes['DoNotSaveLinkValues'].NodeValue := Value;
end;

function TXMLExcelWorkbook_x.Get_NoAutoRecover: UnicodeString;
begin
  Result := ChildNodes['NoAutoRecover'].Text;
end;

procedure TXMLExcelWorkbook_x.Set_NoAutoRecover(Value: UnicodeString);
begin
  ChildNodes['NoAutoRecover'].NodeValue := Value;
end;

function TXMLExcelWorkbook_x.Get_AcceptLabelsInFormulas: UnicodeString;
begin
  Result := ChildNodes['AcceptLabelsInFormulas'].Text;
end;

procedure TXMLExcelWorkbook_x.Set_AcceptLabelsInFormulas(Value: UnicodeString);
begin
  ChildNodes['AcceptLabelsInFormulas'].NodeValue := Value;
end;

function TXMLExcelWorkbook_x.Get_Uncalced: UnicodeString;
begin
  Result := ChildNodes['Uncalced'].Text;
end;

procedure TXMLExcelWorkbook_x.Set_Uncalced(Value: UnicodeString);
begin
  ChildNodes['Uncalced'].NodeValue := Value;
end;

{ TXMLPublishObjectsType_x }

procedure TXMLPublishObjectsType_x.AfterConstruction;
begin
  RegisterChildNode('PublishObject', TXMLPublishObject_x);
  RegisterChildNode('AutoRepublish', TXMLAutoRepublish_x);
  FPublishObject := CreateCollection(TXMLPublishObject_xList, IXMLPublishObject_x, 'PublishObject') as IXMLPublishObject_xList;
  inherited;
end;

function TXMLPublishObjectsType_x.Get_PublishObject: IXMLPublishObject_xList;
begin
  Result := FPublishObject;
end;

function TXMLPublishObjectsType_x.Get_AutoRepublish: IXMLAutoRepublish_x;
begin
  Result := ChildNodes['AutoRepublish'] as IXMLAutoRepublish_x;
end;

{ TXMLPublishObject_x }

procedure TXMLPublishObject_x.AfterConstruction;
begin
  RegisterChildNode('Location', TXMLLocation_x);
  inherited;
end;

function TXMLPublishObject_x.Get_Id: Int64;
begin
  Result := ChildNodes['Id'].NodeValue;
end;

procedure TXMLPublishObject_x.Set_Id(Value: Int64);
begin
  ChildNodes['Id'].NodeValue := Value;
end;

function TXMLPublishObject_x.Get_DivID: UnicodeString;
begin
  Result := ChildNodes['DivID'].Text;
end;

procedure TXMLPublishObject_x.Set_DivID(Value: UnicodeString);
begin
  ChildNodes['DivID'].NodeValue := Value;
end;

function TXMLPublishObject_x.Get_SourceType: UnicodeString;
begin
  Result := ChildNodes['SourceType'].Text;
end;

procedure TXMLPublishObject_x.Set_SourceType(Value: UnicodeString);
begin
  ChildNodes['SourceType'].NodeValue := Value;
end;

function TXMLPublishObject_x.Get_Source: UnicodeString;
begin
  Result := ChildNodes['Source'].Text;
end;

procedure TXMLPublishObject_x.Set_Source(Value: UnicodeString);
begin
  ChildNodes['Source'].NodeValue := Value;
end;

function TXMLPublishObject_x.Get_HtmlType: UnicodeString;
begin
  Result := ChildNodes['HtmlType'].Text;
end;

procedure TXMLPublishObject_x.Set_HtmlType(Value: UnicodeString);
begin
  ChildNodes['HtmlType'].NodeValue := Value;
end;

function TXMLPublishObject_x.Get_Location: IXMLLocation_x;
begin
  Result := ChildNodes['Location'] as IXMLLocation_x;
end;

{ TXMLPublishObject_xList }

function TXMLPublishObject_xList.Add: IXMLPublishObject_x;
begin
  Result := AddItem(-1) as IXMLPublishObject_x;
end;

function TXMLPublishObject_xList.Insert(const Index: Integer): IXMLPublishObject_x;
begin
  Result := AddItem(Index) as IXMLPublishObject_x;
end;

function TXMLPublishObject_xList.Get_Item(Index: Integer): IXMLPublishObject_x;
begin
  Result := List[Index] as IXMLPublishObject_x;
end;

{ TXMLLocation_x }

function TXMLLocation_x.Get_HRef: UnicodeString;
begin
  Result := AttributeNodes['HRef'].Text;
end;

procedure TXMLLocation_x.Set_HRef(Value: UnicodeString);
begin
  SetAttribute('HRef', Value);
end;

{ TXMLAutoRepublish_x }

procedure TXMLAutoRepublish_x.AfterConstruction;
begin
  ItemTag := 'DivID';
  ItemInterface := IXMLNode;
  inherited;
end;

function TXMLAutoRepublish_x.Get_DivID(Index: Integer): UnicodeString;
begin
  Result := List[Index].Text;
end;

function TXMLAutoRepublish_x.Add(const DivID: UnicodeString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := DivID;
end;

function TXMLAutoRepublish_x.Insert(const Index: Integer; const DivID: UnicodeString): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := DivID;
end;

{ TXMLSupBookType_x }

procedure TXMLSupBookType_x.AfterConstruction;
begin
  RegisterChildNode('ExternName', TXMLExternNameType_x);
  RegisterChildNode('Xct', TXMLXctType_x);
  FSheetName := CreateCollection(TXMLString_List, IXMLNode, 'SheetName') as IXMLString_List;
  FExternName := CreateCollection(TXMLExternNameType_xList, IXMLExternNameType_x, 'ExternName') as IXMLExternNameType_xList;
  FXct := CreateCollection(TXMLXctType_xList, IXMLXctType_x, 'Xct') as IXMLXctType_xList;
  inherited;
end;

function TXMLSupBookType_x.Get_Path: UnicodeString;
begin
  Result := ChildNodes['Path'].Text;
end;

procedure TXMLSupBookType_x.Set_Path(Value: UnicodeString);
begin
  ChildNodes['Path'].NodeValue := Value;
end;

function TXMLSupBookType_x.Get_SheetName: IXMLString_List;
begin
  Result := FSheetName;
end;

function TXMLSupBookType_x.Get_ExternName: IXMLExternNameType_xList;
begin
  Result := FExternName;
end;

function TXMLSupBookType_x.Get_Xct: IXMLXctType_xList;
begin
  Result := FXct;
end;

{ TXMLSupBookType_xList }

function TXMLSupBookType_xList.Add: IXMLSupBookType_x;
begin
  Result := AddItem(-1) as IXMLSupBookType_x;
end;

function TXMLSupBookType_xList.Insert(const Index: Integer): IXMLSupBookType_x;
begin
  Result := AddItem(Index) as IXMLSupBookType_x;
end;

function TXMLSupBookType_xList.Get_Item(Index: Integer): IXMLSupBookType_x;
begin
  Result := List[Index] as IXMLSupBookType_x;
end;

{ TXMLExternNameType_x }

function TXMLExternNameType_x.Get_Name: UnicodeString;
begin
  Result := ChildNodes['Name'].Text;
end;

procedure TXMLExternNameType_x.Set_Name(Value: UnicodeString);
begin
  ChildNodes['Name'].NodeValue := Value;
end;

function TXMLExternNameType_x.Get_Formula: UnicodeString;
begin
  Result := ChildNodes['Formula'].Text;
end;

procedure TXMLExternNameType_x.Set_Formula(Value: UnicodeString);
begin
  ChildNodes['Formula'].NodeValue := Value;
end;

function TXMLExternNameType_x.Get_OleLink: UnicodeString;
begin
  Result := ChildNodes['OleLink'].Text;
end;

procedure TXMLExternNameType_x.Set_OleLink(Value: UnicodeString);
begin
  ChildNodes['OleLink'].NodeValue := Value;
end;

function TXMLExternNameType_x.Get_WantAdvise: UnicodeString;
begin
  Result := ChildNodes['WantAdvise'].Text;
end;

procedure TXMLExternNameType_x.Set_WantAdvise(Value: UnicodeString);
begin
  ChildNodes['WantAdvise'].NodeValue := Value;
end;

function TXMLExternNameType_x.Get_WantPict: UnicodeString;
begin
  Result := ChildNodes['WantPict'].Text;
end;

procedure TXMLExternNameType_x.Set_WantPict(Value: UnicodeString);
begin
  ChildNodes['WantPict'].NodeValue := Value;
end;

function TXMLExternNameType_x.Get_Cf: Integer;
begin
  Result := ChildNodes['Cf'].NodeValue;
end;

procedure TXMLExternNameType_x.Set_Cf(Value: Integer);
begin
  ChildNodes['Cf'].NodeValue := Value;
end;

{ TXMLExternNameType_xList }

function TXMLExternNameType_xList.Add: IXMLExternNameType_x;
begin
  Result := AddItem(-1) as IXMLExternNameType_x;
end;

function TXMLExternNameType_xList.Insert(const Index: Integer): IXMLExternNameType_x;
begin
  Result := AddItem(Index) as IXMLExternNameType_x;
end;

function TXMLExternNameType_xList.Get_Item(Index: Integer): IXMLExternNameType_x;
begin
  Result := List[Index] as IXMLExternNameType_x;
end;

{ TXMLXctType_x }

procedure TXMLXctType_x.AfterConstruction;
begin
  RegisterChildNode('Crn', TXMLCrnType_x);
  RegisterChildNode('Moper', TXMLMoperType_x);
  FCrn := CreateCollection(TXMLCrnType_xList, IXMLCrnType_x, 'Crn') as IXMLCrnType_xList;
  FMoper := CreateCollection(TXMLMoperType_xList, IXMLMoperType_x, 'Moper') as IXMLMoperType_xList;
  inherited;
end;

function TXMLXctType_x.Get_Count: Integer;
begin
  Result := ChildNodes['Count'].NodeValue;
end;

procedure TXMLXctType_x.Set_Count(Value: Integer);
begin
  ChildNodes['Count'].NodeValue := Value;
end;

function TXMLXctType_x.Get_SheetIndex: Integer;
begin
  Result := ChildNodes['SheetIndex'].NodeValue;
end;

procedure TXMLXctType_x.Set_SheetIndex(Value: Integer);
begin
  ChildNodes['SheetIndex'].NodeValue := Value;
end;

function TXMLXctType_x.Get_Crn: IXMLCrnType_xList;
begin
  Result := FCrn;
end;

function TXMLXctType_x.Get_Moper: IXMLMoperType_xList;
begin
  Result := FMoper;
end;

{ TXMLXctType_xList }

function TXMLXctType_xList.Add: IXMLXctType_x;
begin
  Result := AddItem(-1) as IXMLXctType_x;
end;

function TXMLXctType_xList.Insert(const Index: Integer): IXMLXctType_x;
begin
  Result := AddItem(Index) as IXMLXctType_x;
end;

function TXMLXctType_xList.Get_Item(Index: Integer): IXMLXctType_x;
begin
  Result := List[Index] as IXMLXctType_x;
end;

{ TXMLCrnType_x }

procedure TXMLCrnType_x.AfterConstruction;
begin
  RegisterChildNode('Row', TXMLRowType_x);
  FNumber := CreateCollection(TXMLDoubleList, IXMLNode, 'Number') as IXMLDoubleList;
  inherited;
end;

function TXMLCrnType_x.Get_Row: IXMLRowType_x;
begin
  Result := ChildNodes['Row'] as IXMLRowType_x;
end;

function TXMLCrnType_x.Get_ColFirst: Integer;
begin
  Result := ChildNodes['ColFirst'].NodeValue;
end;

procedure TXMLCrnType_x.Set_ColFirst(Value: Integer);
begin
  ChildNodes['ColFirst'].NodeValue := Value;
end;

function TXMLCrnType_x.Get_ColLast: Integer;
begin
  Result := ChildNodes['ColLast'].NodeValue;
end;

procedure TXMLCrnType_x.Set_ColLast(Value: Integer);
begin
  ChildNodes['ColLast'].NodeValue := Value;
end;

function TXMLCrnType_x.Get_Number: IXMLDoubleList;
begin
  Result := FNumber;
end;

function TXMLCrnType_x.Get_Text: UnicodeString;
begin
  Result := ChildNodes['Text'].Text;
end;

procedure TXMLCrnType_x.Set_Text(Value: UnicodeString);
begin
  ChildNodes['Text'].NodeValue := Value;
end;

function TXMLCrnType_x.Get_Boolean: UnicodeString;
begin
  Result := ChildNodes['Boolean'].Text;
end;

procedure TXMLCrnType_x.Set_Boolean(Value: UnicodeString);
begin
  ChildNodes['Boolean'].NodeValue := Value;
end;

function TXMLCrnType_x.Get_Error: UnicodeString;
begin
  Result := ChildNodes['Error'].Text;
end;

procedure TXMLCrnType_x.Set_Error(Value: UnicodeString);
begin
  ChildNodes['Error'].NodeValue := Value;
end;

{ TXMLCrnType_xList }

function TXMLCrnType_xList.Add: IXMLCrnType_x;
begin
  Result := AddItem(-1) as IXMLCrnType_x;
end;

function TXMLCrnType_xList.Insert(const Index: Integer): IXMLCrnType_x;
begin
  Result := AddItem(Index) as IXMLCrnType_x;
end;

function TXMLCrnType_xList.Get_Item(Index: Integer): IXMLCrnType_x;
begin
  Result := List[Index] as IXMLCrnType_x;
end;

{ TXMLRowType_x }

function TXMLRowType_x.Get_ColumnName: UnicodeString;
begin
  Result := AttributeNodes['ColumnName'].Text;
end;

procedure TXMLRowType_x.Set_ColumnName(Value: UnicodeString);
begin
  SetAttribute('ColumnName', Value);
end;

{ TXMLMoperType_x }

function TXMLMoperType_x.Get_RowLast: Integer;
begin
  Result := ChildNodes['RowLast'].NodeValue;
end;

procedure TXMLMoperType_x.Set_RowLast(Value: Integer);
begin
  ChildNodes['RowLast'].NodeValue := Value;
end;

function TXMLMoperType_x.Get_ColLast: Integer;
begin
  Result := ChildNodes['ColLast'].NodeValue;
end;

procedure TXMLMoperType_x.Set_ColLast(Value: Integer);
begin
  ChildNodes['ColLast'].NodeValue := Value;
end;

function TXMLMoperType_x.Get_Number: Integer;
begin
  Result := ChildNodes['Number'].NodeValue;
end;

procedure TXMLMoperType_x.Set_Number(Value: Integer);
begin
  ChildNodes['Number'].NodeValue := Value;
end;

function TXMLMoperType_x.Get_Text: UnicodeString;
begin
  Result := ChildNodes['Text'].Text;
end;

procedure TXMLMoperType_x.Set_Text(Value: UnicodeString);
begin
  ChildNodes['Text'].NodeValue := Value;
end;

function TXMLMoperType_x.Get_Boolean: UnicodeString;
begin
  Result := ChildNodes['Boolean'].Text;
end;

procedure TXMLMoperType_x.Set_Boolean(Value: UnicodeString);
begin
  ChildNodes['Boolean'].NodeValue := Value;
end;

function TXMLMoperType_x.Get_Error: UnicodeString;
begin
  Result := ChildNodes['Error'].Text;
end;

procedure TXMLMoperType_x.Set_Error(Value: UnicodeString);
begin
  ChildNodes['Error'].NodeValue := Value;
end;

{ TXMLMoperType_xList }

function TXMLMoperType_xList.Add: IXMLMoperType_x;
begin
  Result := AddItem(-1) as IXMLMoperType_x;
end;

function TXMLMoperType_xList.Insert(const Index: Integer): IXMLMoperType_x;
begin
  Result := AddItem(Index) as IXMLMoperType_x;
end;

function TXMLMoperType_xList.Get_Item(Index: Integer): IXMLMoperType_x;
begin
  Result := List[Index] as IXMLMoperType_x;
end;

{ TXMLWorkbook_Styles }

procedure TXMLWorkbook_Styles.AfterConstruction;
begin
  RegisterChildNode('Style', TXMLStyleType);
  ItemTag := 'Style';
  ItemInterface := IXMLStyleType;
  inherited;
end;

function TXMLWorkbook_Styles.Get_Style(Index: Integer): IXMLStyleType;
begin
  Result := List[Index] as IXMLStyleType;
end;

function TXMLWorkbook_Styles.Add: IXMLStyleType;
begin
  Result := AddItem(-1) as IXMLStyleType;
end;

function TXMLWorkbook_Styles.Insert(const Index: Integer): IXMLStyleType;
begin
  Result := AddItem(Index) as IXMLStyleType;
end;

{ TXMLStyleType }

procedure TXMLStyleType.AfterConstruction;
begin
  RegisterChildNode('Alignment', TXMLAlignmentType);
  RegisterChildNode('Borders', TXMLBordersType);
  RegisterChildNode('Font', TXMLFontType);
  RegisterChildNode('Interior', TXMLInteriorType);
  RegisterChildNode('NumberFormat', TXMLNumberFormatType);
  RegisterChildNode('Protection', TXMLProtectionType);
  inherited;
end;

function TXMLStyleType.Get_ID: UnicodeString;
begin
  Result := AttributeNodes['ID'].Text;
end;

procedure TXMLStyleType.Set_ID(Value: UnicodeString);
begin
  SetAttribute('ID', Value);
end;

function TXMLStyleType.Get_Name: UnicodeString;
begin
  Result := AttributeNodes['Name'].Text;
end;

procedure TXMLStyleType.Set_Name(Value: UnicodeString);
begin
  SetAttribute('Name', Value);
end;

function TXMLStyleType.Get_Parent: UnicodeString;
begin
  Result := AttributeNodes['Parent'].Text;
end;

procedure TXMLStyleType.Set_Parent(Value: UnicodeString);
begin
  SetAttribute('Parent', Value);
end;

function TXMLStyleType.Get_Alignment: IXMLAlignmentType;
begin
  Result := ChildNodes['Alignment'] as IXMLAlignmentType;
end;

function TXMLStyleType.Get_Borders: IXMLBordersType;
begin
  Result := ChildNodes['Borders'] as IXMLBordersType;
end;

function TXMLStyleType.Get_Font: IXMLFontType;
begin
  Result := ChildNodes['Font'] as IXMLFontType;
end;

function TXMLStyleType.Get_Interior: IXMLInteriorType;
begin
  Result := ChildNodes['Interior'] as IXMLInteriorType;
end;

function TXMLStyleType.Get_NumberFormat: IXMLNumberFormatType;
begin
  Result := ChildNodes['NumberFormat'] as IXMLNumberFormatType;
end;

function TXMLStyleType.Get_Protection: IXMLProtectionType;
begin
  Result := ChildNodes['Protection'] as IXMLProtectionType;
end;

{ TXMLAlignmentType }

function TXMLAlignmentType.Get_Horizontal: UnicodeString;
begin
  Result := AttributeNodes['Horizontal'].Text;
end;

procedure TXMLAlignmentType.Set_Horizontal(Value: UnicodeString);
begin
  SetAttribute('Horizontal', Value);
end;

function TXMLAlignmentType.Get_ReadingOrder: UnicodeString;
begin
  Result := AttributeNodes['ReadingOrder'].Text;
end;

procedure TXMLAlignmentType.Set_ReadingOrder(Value: UnicodeString);
begin
  SetAttribute('ReadingOrder', Value);
end;

function TXMLAlignmentType.Get_Indent: Int64;
begin
  Result := AttributeNodes['Indent'].NodeValue;
end;

procedure TXMLAlignmentType.Set_Indent(Value: Int64);
begin
  SetAttribute('Indent', Value);
end;

function TXMLAlignmentType.Get_Rotate: Double;
begin
  Result := AttributeNodes['Rotate'].NodeValue;
end;

procedure TXMLAlignmentType.Set_Rotate(Value: Double);
begin
  SetAttribute('Rotate', Value);
end;

function TXMLAlignmentType.Get_ShrinkToFit: UnicodeString;
begin
  Result := AttributeNodes['ShrinkToFit'].Text;
end;

procedure TXMLAlignmentType.Set_ShrinkToFit(Value: UnicodeString);
begin
  SetAttribute('ShrinkToFit', Value);
end;

function TXMLAlignmentType.Get_Vertical: UnicodeString;
begin
  Result := AttributeNodes['Vertical'].Text;
end;

procedure TXMLAlignmentType.Set_Vertical(Value: UnicodeString);
begin
  SetAttribute('Vertical', Value);
end;

function TXMLAlignmentType.Get_VerticalText: UnicodeString;
begin
  Result := AttributeNodes['VerticalText'].Text;
end;

procedure TXMLAlignmentType.Set_VerticalText(Value: UnicodeString);
begin
  SetAttribute('VerticalText', Value);
end;

function TXMLAlignmentType.Get_WrapText: UnicodeString;
begin
  Result := AttributeNodes['WrapText'].Text;
end;

procedure TXMLAlignmentType.Set_WrapText(Value: UnicodeString);
begin
  SetAttribute('WrapText', Value);
end;

{ TXMLBordersType }

procedure TXMLBordersType.AfterConstruction;
begin
  RegisterChildNode('Border', TXMLBorderType);
  ItemTag := 'Border';
  ItemInterface := IXMLBorderType;
  inherited;
end;

function TXMLBordersType.Get_Border(Index: Integer): IXMLBorderType;
begin
  Result := List[Index] as IXMLBorderType;
end;

function TXMLBordersType.Add: IXMLBorderType;
begin
  Result := AddItem(-1) as IXMLBorderType;
end;

function TXMLBordersType.Insert(const Index: Integer): IXMLBorderType;
begin
  Result := AddItem(Index) as IXMLBorderType;
end;

{ TXMLBorderType }

function TXMLBorderType.Get_Position: UnicodeString;
begin
  Result := AttributeNodes['Position'].Text;
end;

procedure TXMLBorderType.Set_Position(Value: UnicodeString);
begin
  SetAttribute('Position', Value);
end;

function TXMLBorderType.Get_Color: UnicodeString;
begin
  Result := AttributeNodes['Color'].Text;
end;

procedure TXMLBorderType.Set_Color(Value: UnicodeString);
begin
  SetAttribute('Color', Value);
end;

function TXMLBorderType.Get_LineStyle: UnicodeString;
begin
  Result := AttributeNodes['LineStyle'].Text;
end;

procedure TXMLBorderType.Set_LineStyle(Value: UnicodeString);
begin
  SetAttribute('LineStyle', Value);
end;

function TXMLBorderType.Get_Weight: Double;
begin
  Result := AttributeNodes['Weight'].NodeValue;
end;

procedure TXMLBorderType.Set_Weight(Value: Double);
begin
  SetAttribute('Weight', Value);
end;

{ TXMLFontType }

function TXMLFontType.Get_Bold: UnicodeString;
begin
  Result := AttributeNodes['Bold'].Text;
end;

procedure TXMLFontType.Set_Bold(Value: UnicodeString);
begin
  SetAttribute('Bold', Value);
end;

function TXMLFontType.Get_Color: UnicodeString;
begin
  Result := AttributeNodes['Color'].Text;
end;

procedure TXMLFontType.Set_Color(Value: UnicodeString);
begin
  SetAttribute('Color', Value);
end;

function TXMLFontType.Get_FontName: UnicodeString;
begin
  Result := AttributeNodes['FontName'].Text;
end;

procedure TXMLFontType.Set_FontName(Value: UnicodeString);
begin
  SetAttribute('FontName', Value);
end;

function TXMLFontType.Get_Italic: UnicodeString;
begin
  Result := AttributeNodes['Italic'].Text;
end;

procedure TXMLFontType.Set_Italic(Value: UnicodeString);
begin
  SetAttribute('Italic', Value);
end;

function TXMLFontType.Get_Outline: UnicodeString;
begin
  Result := AttributeNodes['Outline'].Text;
end;

procedure TXMLFontType.Set_Outline(Value: UnicodeString);
begin
  SetAttribute('Outline', Value);
end;

function TXMLFontType.Get_Shadow: UnicodeString;
begin
  Result := AttributeNodes['Shadow'].Text;
end;

procedure TXMLFontType.Set_Shadow(Value: UnicodeString);
begin
  SetAttribute('Shadow', Value);
end;

function TXMLFontType.Get_Size: Double;
begin
  Result := AttributeNodes['Size'].NodeValue;
end;

procedure TXMLFontType.Set_Size(Value: Double);
begin
  SetAttribute('Size', Value);
end;

function TXMLFontType.Get_StrikeThrough: UnicodeString;
begin
  Result := AttributeNodes['StrikeThrough'].Text;
end;

procedure TXMLFontType.Set_StrikeThrough(Value: UnicodeString);
begin
  SetAttribute('StrikeThrough', Value);
end;

function TXMLFontType.Get_Underline: UnicodeString;
begin
  Result := AttributeNodes['Underline'].Text;
end;

procedure TXMLFontType.Set_Underline(Value: UnicodeString);
begin
  SetAttribute('Underline', Value);
end;

function TXMLFontType.Get_VerticalAlign: UnicodeString;
begin
  Result := AttributeNodes['VerticalAlign'].Text;
end;

procedure TXMLFontType.Set_VerticalAlign(Value: UnicodeString);
begin
  SetAttribute('VerticalAlign', Value);
end;

function TXMLFontType.Get_CharSet: Integer;
begin
  Result := AttributeNodes['CharSet'].NodeValue;
end;

procedure TXMLFontType.Set_CharSet(Value: Integer);
begin
  SetAttribute('CharSet', Value);
end;

function TXMLFontType.Get_Family: UnicodeString;
begin
  Result := AttributeNodes['Family'].Text;
end;

procedure TXMLFontType.Set_Family(Value: UnicodeString);
begin
  SetAttribute('Family', Value);
end;

{ TXMLInteriorType }

function TXMLInteriorType.Get_Color: UnicodeString;
begin
  Result := AttributeNodes['Color'].Text;
end;

procedure TXMLInteriorType.Set_Color(Value: UnicodeString);
begin
  SetAttribute('Color', Value);
end;

function TXMLInteriorType.Get_Pattern: UnicodeString;
begin
  Result := AttributeNodes['Pattern'].Text;
end;

procedure TXMLInteriorType.Set_Pattern(Value: UnicodeString);
begin
  SetAttribute('Pattern', Value);
end;

function TXMLInteriorType.Get_PatternColor: UnicodeString;
begin
  Result := AttributeNodes['PatternColor'].Text;
end;

procedure TXMLInteriorType.Set_PatternColor(Value: UnicodeString);
begin
  SetAttribute('PatternColor', Value);
end;

{ TXMLNumberFormatType }

function TXMLNumberFormatType.Get_Format: UnicodeString;
begin
  Result := AttributeNodes['Format'].Text;
end;

procedure TXMLNumberFormatType.Set_Format(Value: UnicodeString);
begin
  SetAttribute('Format', Value);
end;

{ TXMLProtectionType }

function TXMLProtectionType.Get_Protected_: UnicodeString;
begin
  Result := AttributeNodes['Protected'].Text;
end;

procedure TXMLProtectionType.Set_Protected_(Value: UnicodeString);
begin
  SetAttribute('Protected', Value);
end;

function TXMLProtectionType.Get_HideFormula: UnicodeString;
begin
  Result := AttributeNodes['HideFormula'].Text;
end;

procedure TXMLProtectionType.Set_HideFormula(Value: UnicodeString);
begin
  SetAttribute('HideFormula', Value);
end;

{ TXMLNamesType }

procedure TXMLNamesType.AfterConstruction;
begin
  RegisterChildNode('NamedRange', TXMLNamesType_NamedRange);
  ItemTag := 'NamedRange';
  ItemInterface := IXMLNamesType_NamedRange;
  inherited;
end;

function TXMLNamesType.Get_NamedRange(Index: Integer): IXMLNamesType_NamedRange;
begin
  Result := List[Index] as IXMLNamesType_NamedRange;
end;

function TXMLNamesType.Add: IXMLNamesType_NamedRange;
begin
  Result := AddItem(-1) as IXMLNamesType_NamedRange;
end;

function TXMLNamesType.Insert(const Index: Integer): IXMLNamesType_NamedRange;
begin
  Result := AddItem(Index) as IXMLNamesType_NamedRange;
end;

{ TXMLNamesType_NamedRange }

function TXMLNamesType_NamedRange.Get_Name: UnicodeString;
begin
  Result := AttributeNodes['Name'].Text;
end;

procedure TXMLNamesType_NamedRange.Set_Name(Value: UnicodeString);
begin
  SetAttribute('Name', Value);
end;

function TXMLNamesType_NamedRange.Get_RefersTo: UnicodeString;
begin
  Result := AttributeNodes['RefersTo'].Text;
end;

procedure TXMLNamesType_NamedRange.Set_RefersTo(Value: UnicodeString);
begin
  SetAttribute('RefersTo', Value);
end;

function TXMLNamesType_NamedRange.Get_Hidden: UnicodeString;
begin
  Result := AttributeNodes['Hidden'].Text;
end;

procedure TXMLNamesType_NamedRange.Set_Hidden(Value: UnicodeString);
begin
  SetAttribute('Hidden', Value);
end;

function TXMLNamesType_NamedRange.Get_PasteRefersTo: UnicodeString;
begin
  Result := AttributeNodes['PasteRefersTo'].Text;
end;

procedure TXMLNamesType_NamedRange.Set_PasteRefersTo(Value: UnicodeString);
begin
  SetAttribute('PasteRefersTo', Value);
end;

{ TXMLWorksheetType }

procedure TXMLWorksheetType.AfterConstruction;
begin
  RegisterChildNode('Names', TXMLNamesType);
  RegisterChildNode('Table', TXMLTableType);
  RegisterChildNode('WorksheetOptions', TXMLWorksheetOptionsType_x);
  RegisterChildNode('Watches', TXMLWatches_x);
  RegisterChildNode('DataTable', TXMLDataTable_x);
  RegisterChildNode('PageBreaks', TXMLPageBreaksType_x);
  RegisterChildNode('PivotTable', TXMLPivotTableType_x);
  RegisterChildNode('DataValidation', TXMLDataValidationType_x);
  RegisterChildNode('AutoFilter', TXMLAutoFilter_x);
  RegisterChildNode('ConditionalFormatting', TXMLConditionalFormattingType_x);
  RegisterChildNode('Sorting', TXMLSortingType_x);
  RegisterChildNode('worksheetoptions', TXMLWorksheetoptions_c);
  RegisterChildNode('QueryTable', TXMLQueryTableType_x);
  FPivotTable := CreateCollection(TXMLPivotTableType_xList, IXMLPivotTableType_x, 'PivotTable') as IXMLPivotTableType_xList;
  FDataValidation := CreateCollection(TXMLDataValidationType_xList, IXMLDataValidationType_x, 'DataValidation') as IXMLDataValidationType_xList;
  FConditionalFormatting := CreateCollection(TXMLConditionalFormattingType_xList, IXMLConditionalFormattingType_x, 'ConditionalFormatting') as IXMLConditionalFormattingType_xList;
  FQueryTable := CreateCollection(TXMLQueryTableType_xList, IXMLQueryTableType_x, 'QueryTable') as IXMLQueryTableType_xList;
  inherited;
end;

function TXMLWorksheetType.Get_Name: UnicodeString;
begin
  Result := AttributeNodes['Name'].Text;
end;

procedure TXMLWorksheetType.Set_Name(Value: UnicodeString);
begin
  SetAttribute('Name', Value);
end;

function TXMLWorksheetType.Get_Protected_: UnicodeString;
begin
  Result := AttributeNodes['Protected'].Text;
end;

procedure TXMLWorksheetType.Set_Protected_(Value: UnicodeString);
begin
  SetAttribute('Protected', Value);
end;

function TXMLWorksheetType.Get_RightToLeft: UnicodeString;
begin
  Result := AttributeNodes['RightToLeft'].Text;
end;

procedure TXMLWorksheetType.Set_RightToLeft(Value: UnicodeString);
begin
  SetAttribute('RightToLeft', Value);
end;

function TXMLWorksheetType.Get_Names: IXMLNamesType;
begin
  Result := ChildNodes['Names'] as IXMLNamesType;
end;

function TXMLWorksheetType.Get_Table: IXMLTableType;
begin
  Result := ChildNodes['Table'] as IXMLTableType;
end;

function TXMLWorksheetType.Get_WorksheetOptions: IXMLWorksheetOptionsType_x;
begin
  Result := ChildNodes['WorksheetOptions'] as IXMLWorksheetOptionsType_x;
end;

function TXMLWorksheetType.Get_Watches: IXMLWatches_x;
begin
  Result := ChildNodes['Watches'] as IXMLWatches_x;
end;

function TXMLWorksheetType.Get_DataTable: IXMLDataTable_x;
begin
  Result := ChildNodes['DataTable'] as IXMLDataTable_x;
end;

function TXMLWorksheetType.Get_PageBreaks: IXMLPageBreaksType_x;
begin
  Result := ChildNodes['PageBreaks'] as IXMLPageBreaksType_x;
end;

function TXMLWorksheetType.Get_PivotTable: IXMLPivotTableType_xList;
begin
  Result := FPivotTable;
end;

function TXMLWorksheetType.Get_DataValidation: IXMLDataValidationType_xList;
begin
  Result := FDataValidation;
end;

function TXMLWorksheetType.Get_AutoFilter: IXMLAutoFilter_x;
begin
  Result := ChildNodes['AutoFilter'] as IXMLAutoFilter_x;
end;

function TXMLWorksheetType.Get_ConditionalFormatting: IXMLConditionalFormattingType_xList;
begin
  Result := FConditionalFormatting;
end;

function TXMLWorksheetType.Get_Sorting: IXMLSortingType_x;
begin
  Result := ChildNodes['Sorting'] as IXMLSortingType_x;
end;

function TXMLWorksheetType.Get_Worksheetoptions: IXMLWorksheetoptions_c;
begin
  Result := ChildNodes['worksheetoptions'] as IXMLWorksheetoptions_c;
end;

function TXMLWorksheetType.Get_QueryTable: IXMLQueryTableType_xList;
begin
  Result := FQueryTable;
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
  RegisterChildNode('Column', TXMLTableType_Column);
  RegisterChildNode('Row', TXMLTableType_Row);
  FColumn := CreateCollection(TXMLTableType_ColumnList, IXMLTableType_Column, 'Column') as IXMLTableType_ColumnList;
  FRow := CreateCollection(TXMLTableType_RowList, IXMLTableType_Row, 'Row') as IXMLTableType_RowList;
  inherited;
end;

function TXMLTableType.Get_DefaultColumnWidth: Double;
begin
  Result := AttributeNodes['DefaultColumnWidth'].NodeValue;
end;

procedure TXMLTableType.Set_DefaultColumnWidth(Value: Double);
begin
  SetAttribute('DefaultColumnWidth', Value);
end;

function TXMLTableType.Get_DefaultRowHeight: Double;
begin
  Result := AttributeNodes['DefaultRowHeight'].NodeValue;
end;

procedure TXMLTableType.Set_DefaultRowHeight(Value: Double);
begin
  SetAttribute('DefaultRowHeight', Value);
end;

function TXMLTableType.Get_ExpandedColumnCount: LongWord;
begin
  Result := AttributeNodes['ExpandedColumnCount'].NodeValue;
end;

procedure TXMLTableType.Set_ExpandedColumnCount(Value: LongWord);
begin
  SetAttribute('ExpandedColumnCount', Value);
end;

function TXMLTableType.Get_ExpandedRowCount: LongWord;
begin
  Result := AttributeNodes['ExpandedRowCount'].NodeValue;
end;

procedure TXMLTableType.Set_ExpandedRowCount(Value: LongWord);
begin
  SetAttribute('ExpandedRowCount', Value);
end;

function TXMLTableType.Get_StyleID: UnicodeString;
begin
  Result := AttributeNodes['StyleID'].Text;
end;

procedure TXMLTableType.Set_StyleID(Value: UnicodeString);
begin
  SetAttribute('StyleID', Value);
end;

function TXMLTableType.Get_LeftCell: LongWord;
begin
  Result := AttributeNodes['LeftCell'].NodeValue;
end;

procedure TXMLTableType.Set_LeftCell(Value: LongWord);
begin
  SetAttribute('LeftCell', Value);
end;

function TXMLTableType.Get_TopCell: Integer;
begin
  Result := AttributeNodes['TopCell'].NodeValue;
end;

procedure TXMLTableType.Set_TopCell(Value: Integer);
begin
  SetAttribute('TopCell', Value);
end;

function TXMLTableType.Get_FullColumns: UnicodeString;
begin
  Result := AttributeNodes['FullColumns'].Text;
end;

procedure TXMLTableType.Set_FullColumns(Value: UnicodeString);
begin
  SetAttribute('FullColumns', Value);
end;

function TXMLTableType.Get_FullRows: UnicodeString;
begin
  Result := AttributeNodes['FullRows'].Text;
end;

procedure TXMLTableType.Set_FullRows(Value: UnicodeString);
begin
  SetAttribute('FullRows', Value);
end;

function TXMLTableType.Get_FullColumns: UnicodeString;
begin
  Result := AttributeNodes['FullColumns'].Text;
end;

procedure TXMLTableType.Set_FullColumns(Value: UnicodeString);
begin
  SetAttribute('FullColumns', Value);
end;

function TXMLTableType.Get_FullRows: UnicodeString;
begin
  Result := AttributeNodes['FullRows'].Text;
end;

procedure TXMLTableType.Set_FullRows(Value: UnicodeString);
begin
  SetAttribute('FullRows', Value);
end;

function TXMLTableType.Get_DefaultRowHeight: UnicodeString;
begin
  Result := AttributeNodes['DefaultRowHeight'].Text;
end;

procedure TXMLTableType.Set_DefaultRowHeight(Value: UnicodeString);
begin
  SetAttribute('DefaultRowHeight', Value);
end;

function TXMLTableType.Get_DefaultColumnWidth: UnicodeString;
begin
  Result := AttributeNodes['DefaultColumnWidth'].Text;
end;

procedure TXMLTableType.Set_DefaultColumnWidth(Value: UnicodeString);
begin
  SetAttribute('DefaultColumnWidth', Value);
end;

function TXMLTableType.Get_Column: IXMLTableType_ColumnList;
begin
  Result := FColumn;
end;

function TXMLTableType.Get_Row: IXMLTableType_RowList;
begin
  Result := FRow;
end;

{ TXMLTableType_Column }

function TXMLTableType_Column.Get_AutoFitWidth: UnicodeString;
begin
  Result := AttributeNodes['AutoFitWidth'].Text;
end;

procedure TXMLTableType_Column.Set_AutoFitWidth(Value: UnicodeString);
begin
  SetAttribute('AutoFitWidth', Value);
end;

function TXMLTableType_Column.Get_Hidden: UnicodeString;
begin
  Result := AttributeNodes['Hidden'].Text;
end;

procedure TXMLTableType_Column.Set_Hidden(Value: UnicodeString);
begin
  SetAttribute('Hidden', Value);
end;

function TXMLTableType_Column.Get_Index: LongWord;
begin
  Result := AttributeNodes['Index'].NodeValue;
end;

procedure TXMLTableType_Column.Set_Index(Value: LongWord);
begin
  SetAttribute('Index', Value);
end;

function TXMLTableType_Column.Get_Span: LongWord;
begin
  Result := AttributeNodes['Span'].NodeValue;
end;

procedure TXMLTableType_Column.Set_Span(Value: LongWord);
begin
  SetAttribute('Span', Value);
end;

function TXMLTableType_Column.Get_StyleID: UnicodeString;
begin
  Result := AttributeNodes['StyleID'].Text;
end;

procedure TXMLTableType_Column.Set_StyleID(Value: UnicodeString);
begin
  SetAttribute('StyleID', Value);
end;

function TXMLTableType_Column.Get_Width: Double;
begin
  Result := AttributeNodes['Width'].NodeValue;
end;

procedure TXMLTableType_Column.Set_Width(Value: Double);
begin
  SetAttribute('Width', Value);
end;

function TXMLTableType_Column.Get_Caption: UnicodeString;
begin
  Result := AttributeNodes['Caption'].Text;
end;

procedure TXMLTableType_Column.Set_Caption(Value: UnicodeString);
begin
  SetAttribute('Caption', Value);
end;

{ TXMLTableType_ColumnList }

function TXMLTableType_ColumnList.Add: IXMLTableType_Column;
begin
  Result := AddItem(-1) as IXMLTableType_Column;
end;

function TXMLTableType_ColumnList.Insert(const Index: Integer): IXMLTableType_Column;
begin
  Result := AddItem(Index) as IXMLTableType_Column;
end;

function TXMLTableType_ColumnList.Get_Item(Index: Integer): IXMLTableType_Column;
begin
  Result := List[Index] as IXMLTableType_Column;
end;

{ TXMLTableType_Row }

procedure TXMLTableType_Row.AfterConstruction;
begin
  RegisterChildNode('Cell', TXMLCell);
  ItemTag := 'Cell';
  ItemInterface := IXMLCell;
  inherited;
end;

function TXMLTableType_Row.Get_AutoFitHeight: UnicodeString;
begin
  Result := AttributeNodes['AutoFitHeight'].Text;
end;

procedure TXMLTableType_Row.Set_AutoFitHeight(Value: UnicodeString);
begin
  SetAttribute('AutoFitHeight', Value);
end;

function TXMLTableType_Row.Get_Height: Double;
begin
  Result := AttributeNodes['Height'].NodeValue;
end;

procedure TXMLTableType_Row.Set_Height(Value: Double);
begin
  SetAttribute('Height', Value);
end;

function TXMLTableType_Row.Get_Hidden: UnicodeString;
begin
  Result := AttributeNodes['Hidden'].Text;
end;

procedure TXMLTableType_Row.Set_Hidden(Value: UnicodeString);
begin
  SetAttribute('Hidden', Value);
end;

function TXMLTableType_Row.Get_Index: LongWord;
begin
  Result := AttributeNodes['Index'].NodeValue;
end;

procedure TXMLTableType_Row.Set_Index(Value: LongWord);
begin
  SetAttribute('Index', Value);
end;

function TXMLTableType_Row.Get_Span: LongWord;
begin
  Result := AttributeNodes['Span'].NodeValue;
end;

procedure TXMLTableType_Row.Set_Span(Value: LongWord);
begin
  SetAttribute('Span', Value);
end;

function TXMLTableType_Row.Get_StyleID: UnicodeString;
begin
  Result := AttributeNodes['StyleID'].Text;
end;

procedure TXMLTableType_Row.Set_StyleID(Value: UnicodeString);
begin
  SetAttribute('StyleID', Value);
end;

function TXMLTableType_Row.Get_Caption: UnicodeString;
begin
  Result := AttributeNodes['caption'].Text;
end;

procedure TXMLTableType_Row.Set_Caption(Value: UnicodeString);
begin
  SetAttribute('caption', Value);
end;

function TXMLTableType_Row.Get_Cell(Index: Integer): IXMLCell;
begin
  Result := List[Index] as IXMLCell;
end;

function TXMLTableType_Row.Add: IXMLCell;
begin
  Result := AddItem(-1) as IXMLCell;
end;

function TXMLTableType_Row.Insert(const Index: Integer): IXMLCell;
begin
  Result := AddItem(Index) as IXMLCell;
end;

{ TXMLTableType_RowList }

function TXMLTableType_RowList.Add: IXMLTableType_Row;
begin
  Result := AddItem(-1) as IXMLTableType_Row;
end;

function TXMLTableType_RowList.Insert(const Index: Integer): IXMLTableType_Row;
begin
  Result := AddItem(Index) as IXMLTableType_Row;
end;

function TXMLTableType_RowList.Get_Item(Index: Integer): IXMLTableType_Row;
begin
  Result := List[Index] as IXMLTableType_Row;
end;

{ TXMLCell }

procedure TXMLCell.AfterConstruction;
begin
  RegisterChildNode('SmartTags', TXMLSmartTagsElt_o);
  RegisterChildNode('Data', TXMLData);
  RegisterChildNode('Comment', TXMLCommentType);
  RegisterChildNode('phonetictext', TXMLPhonetictext_x);
  RegisterChildNode('NamedCell', TXMLNamedCell);
  FSmartTags := CreateCollection(TXMLSmartTagsElt_oList, IXMLSmartTagsElt_o, 'SmartTags') as IXMLSmartTagsElt_oList;
  FNamedCell := CreateCollection(TXMLNamedCellList, IXMLNamedCell, 'NamedCell') as IXMLNamedCellList;
  inherited;
end;

function TXMLCell.Get_ArrayRange: UnicodeString;
begin
  Result := AttributeNodes['ArrayRange'].Text;
end;

procedure TXMLCell.Set_ArrayRange(Value: UnicodeString);
begin
  SetAttribute('ArrayRange', Value);
end;

function TXMLCell.Get_Formula: UnicodeString;
begin
  Result := AttributeNodes['Formula'].Text;
end;

procedure TXMLCell.Set_Formula(Value: UnicodeString);
begin
  SetAttribute('Formula', Value);
end;

function TXMLCell.Get_HRef: UnicodeString;
begin
  Result := AttributeNodes['HRef'].Text;
end;

procedure TXMLCell.Set_HRef(Value: UnicodeString);
begin
  SetAttribute('HRef', Value);
end;

function TXMLCell.Get_Index: LongWord;
begin
  Result := AttributeNodes['Index'].NodeValue;
end;

procedure TXMLCell.Set_Index(Value: LongWord);
begin
  SetAttribute('Index', Value);
end;

function TXMLCell.Get_MergeAcross: Int64;
begin
  Result := AttributeNodes['MergeAcross'].NodeValue;
end;

procedure TXMLCell.Set_MergeAcross(Value: Int64);
begin
  SetAttribute('MergeAcross', Value);
end;

function TXMLCell.Get_MergeDown: Int64;
begin
  Result := AttributeNodes['MergeDown'].NodeValue;
end;

procedure TXMLCell.Set_MergeDown(Value: Int64);
begin
  SetAttribute('MergeDown', Value);
end;

function TXMLCell.Get_StyleID: UnicodeString;
begin
  Result := AttributeNodes['StyleID'].Text;
end;

procedure TXMLCell.Set_StyleID(Value: UnicodeString);
begin
  SetAttribute('StyleID', Value);
end;

function TXMLCell.Get_HRefScreenTip: UnicodeString;
begin
  Result := AttributeNodes['HRefScreenTip'].Text;
end;

procedure TXMLCell.Set_HRefScreenTip(Value: UnicodeString);
begin
  SetAttribute('HRefScreenTip', Value);
end;

function TXMLCell.Get_PasteFormula: UnicodeString;
begin
  Result := AttributeNodes['PasteFormula'].Text;
end;

procedure TXMLCell.Set_PasteFormula(Value: UnicodeString);
begin
  SetAttribute('PasteFormula', Value);
end;

function TXMLCell.Get_SmartTags: IXMLSmartTagsElt_oList;
begin
  Result := FSmartTags;
end;

function TXMLCell.Get_Data: IXMLData;
begin
  Result := ChildNodes['Data'] as IXMLData;
end;

function TXMLCell.Get_Comment: IXMLCommentType;
begin
  Result := ChildNodes['Comment'] as IXMLCommentType;
end;

function TXMLCell.Get_Phonetictext: IXMLPhonetictext_x;
begin
  Result := ChildNodes['phonetictext'] as IXMLPhonetictext_x;
end;

function TXMLCell.Get_NamedCell: IXMLNamedCellList;
begin
  Result := FNamedCell;
end;

{ TXMLSmartTagsElt_o }

{ TXMLSmartTagsElt_oList }

function TXMLSmartTagsElt_oList.Add: IXMLSmartTagsElt_o;
begin
  Result := AddItem(-1) as IXMLSmartTagsElt_o;
end;

function TXMLSmartTagsElt_oList.Insert(const Index: Integer): IXMLSmartTagsElt_o;
begin
  Result := AddItem(Index) as IXMLSmartTagsElt_o;
end;

function TXMLSmartTagsElt_oList.Get_Item(Index: Integer): IXMLSmartTagsElt_o;
begin
  Result := List[Index] as IXMLSmartTagsElt_o;
end;

{ TXMLData }

function TXMLData.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['Type'].Text;
end;

procedure TXMLData.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('Type', Value);
end;

function TXMLData.Get_Ticked: UnicodeString;
begin
  Result := AttributeNodes['Ticked'].Text;
end;

procedure TXMLData.Set_Ticked(Value: UnicodeString);
begin
  SetAttribute('Ticked', Value);
end;

{ TXMLCommentType }

procedure TXMLCommentType.AfterConstruction;
begin
  RegisterChildNode('Data', TXMLCommentType_Data);
  inherited;
end;

function TXMLCommentType.Get_Author: UnicodeString;
begin
  Result := AttributeNodes['Author'].Text;
end;

procedure TXMLCommentType.Set_Author(Value: UnicodeString);
begin
  SetAttribute('Author', Value);
end;

function TXMLCommentType.Get_ShowAlways: UnicodeString;
begin
  Result := AttributeNodes['ShowAlways'].Text;
end;

procedure TXMLCommentType.Set_ShowAlways(Value: UnicodeString);
begin
  SetAttribute('ShowAlways', Value);
end;

function TXMLCommentType.Get_Data: IXMLCommentType_Data;
begin
  Result := ChildNodes['Data'] as IXMLCommentType_Data;
end;

{ TXMLCommentType_Data }

{ TXMLPhonetictext_x }

function TXMLPhonetictext_x.Get_Visible: UnicodeString;
begin
  Result := AttributeNodes['visible'].Text;
end;

procedure TXMLPhonetictext_x.Set_Visible(Value: UnicodeString);
begin
  SetAttribute('visible', Value);
end;

{ TXMLNamedCell }

function TXMLNamedCell.Get_Name: UnicodeString;
begin
  Result := AttributeNodes['Name'].Text;
end;

procedure TXMLNamedCell.Set_Name(Value: UnicodeString);
begin
  SetAttribute('Name', Value);
end;

{ TXMLNamedCellList }

function TXMLNamedCellList.Add: IXMLNamedCell;
begin
  Result := AddItem(-1) as IXMLNamedCell;
end;

function TXMLNamedCellList.Insert(const Index: Integer): IXMLNamedCell;
begin
  Result := AddItem(Index) as IXMLNamedCell;
end;

function TXMLNamedCellList.Get_Item(Index: Integer): IXMLNamedCell;
begin
  Result := List[Index] as IXMLNamedCell;
end;

{ TXMLWorksheetOptionsType_x }

procedure TXMLWorksheetOptionsType_x.AfterConstruction;
begin
  RegisterChildNode('PageSetup', TXMLPageSetupType_x);
  RegisterChildNode('Print', TXMLPrintType_x);
  RegisterChildNode('Panes', TXMLPanesType_x);
  inherited;
end;

function TXMLWorksheetOptionsType_x.Get_FitToPage: UnicodeString;
begin
  Result := ChildNodes['FitToPage'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_FitToPage(Value: UnicodeString);
begin
  ChildNodes['FitToPage'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_DoNotDisplayColHeaders: UnicodeString;
begin
  Result := ChildNodes['DoNotDisplayColHeaders'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_DoNotDisplayColHeaders(Value: UnicodeString);
begin
  ChildNodes['DoNotDisplayColHeaders'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_DoNotDisplayRowHeaders: UnicodeString;
begin
  Result := ChildNodes['DoNotDisplayRowHeaders'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_DoNotDisplayRowHeaders(Value: UnicodeString);
begin
  ChildNodes['DoNotDisplayRowHeaders'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_ViewableRange: UnicodeString;
begin
  Result := ChildNodes['ViewableRange'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_ViewableRange(Value: UnicodeString);
begin
  ChildNodes['ViewableRange'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_Selection: UnicodeString;
begin
  Result := ChildNodes['Selection'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_Selection(Value: UnicodeString);
begin
  ChildNodes['Selection'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_GridlineColor: UnicodeString;
begin
  Result := ChildNodes['GridlineColor'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_GridlineColor(Value: UnicodeString);
begin
  ChildNodes['GridlineColor'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_Name: UnicodeString;
begin
  Result := ChildNodes['Name'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_Name(Value: UnicodeString);
begin
  ChildNodes['Name'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_ExcelWorksheetType: UnicodeString;
begin
  Result := ChildNodes['ExcelWorksheetType'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_ExcelWorksheetType(Value: UnicodeString);
begin
  ChildNodes['ExcelWorksheetType'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_IntlMacro: UnicodeString;
begin
  Result := ChildNodes['IntlMacro'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_IntlMacro(Value: UnicodeString);
begin
  ChildNodes['IntlMacro'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_Unsynced: UnicodeString;
begin
  Result := ChildNodes['Unsynced'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_Unsynced(Value: UnicodeString);
begin
  ChildNodes['Unsynced'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_Selected: UnicodeString;
begin
  Result := ChildNodes['Selected'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_Selected(Value: UnicodeString);
begin
  ChildNodes['Selected'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_CodeName: UnicodeString;
begin
  Result := ChildNodes['CodeName'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_CodeName(Value: UnicodeString);
begin
  ChildNodes['CodeName'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_PageSetup: IXMLPageSetupType_x;
begin
  Result := ChildNodes['PageSetup'] as IXMLPageSetupType_x;
end;

function TXMLWorksheetOptionsType_x.Get_DisplayPageBreak: UnicodeString;
begin
  Result := ChildNodes['DisplayPageBreak'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_DisplayPageBreak(Value: UnicodeString);
begin
  ChildNodes['DisplayPageBreak'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_TransitionExpressionEvaluation: UnicodeString;
begin
  Result := ChildNodes['TransitionExpressionEvaluation'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_TransitionExpressionEvaluation(Value: UnicodeString);
begin
  ChildNodes['TransitionExpressionEvaluation'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_TransitionFormulaEntry: UnicodeString;
begin
  Result := ChildNodes['TransitionFormulaEntry'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_TransitionFormulaEntry(Value: UnicodeString);
begin
  ChildNodes['TransitionFormulaEntry'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_Print: IXMLPrintType_x;
begin
  Result := ChildNodes['Print'] as IXMLPrintType_x;
end;

function TXMLWorksheetOptionsType_x.Get_Zoom: Integer;
begin
  Result := ChildNodes['Zoom'].NodeValue;
end;

procedure TXMLWorksheetOptionsType_x.Set_Zoom(Value: Integer);
begin
  ChildNodes['Zoom'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_PageBreakZoom: Integer;
begin
  Result := ChildNodes['PageBreakZoom'].NodeValue;
end;

procedure TXMLWorksheetOptionsType_x.Set_PageBreakZoom(Value: Integer);
begin
  ChildNodes['PageBreakZoom'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_ShowPageBreakZoom: UnicodeString;
begin
  Result := ChildNodes['ShowPageBreakZoom'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_ShowPageBreakZoom(Value: UnicodeString);
begin
  ChildNodes['ShowPageBreakZoom'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_DefaultRowHeight: Integer;
begin
  Result := ChildNodes['DefaultRowHeight'].NodeValue;
end;

procedure TXMLWorksheetOptionsType_x.Set_DefaultRowHeight(Value: Integer);
begin
  ChildNodes['DefaultRowHeight'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_DefaultColumnWidth: Integer;
begin
  Result := ChildNodes['DefaultColumnWidth'].NodeValue;
end;

procedure TXMLWorksheetOptionsType_x.Set_DefaultColumnWidth(Value: Integer);
begin
  ChildNodes['DefaultColumnWidth'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_StandardWidth: Integer;
begin
  Result := ChildNodes['StandardWidth'].NodeValue;
end;

procedure TXMLWorksheetOptionsType_x.Set_StandardWidth(Value: Integer);
begin
  ChildNodes['StandardWidth'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_Visible: UnicodeString;
begin
  Result := ChildNodes['Visible'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_Visible(Value: UnicodeString);
begin
  ChildNodes['Visible'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_LeftColumnVisible: Integer;
begin
  Result := ChildNodes['LeftColumnVisible'].NodeValue;
end;

procedure TXMLWorksheetOptionsType_x.Set_LeftColumnVisible(Value: Integer);
begin
  ChildNodes['LeftColumnVisible'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_DisplayRightToLeft: UnicodeString;
begin
  Result := ChildNodes['DisplayRightToLeft'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_DisplayRightToLeft(Value: UnicodeString);
begin
  ChildNodes['DisplayRightToLeft'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_GridlineColorIndex: Integer;
begin
  Result := ChildNodes['GridlineColorIndex'].NodeValue;
end;

procedure TXMLWorksheetOptionsType_x.Set_GridlineColorIndex(Value: Integer);
begin
  ChildNodes['GridlineColorIndex'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_DisplayFormulas: UnicodeString;
begin
  Result := ChildNodes['DisplayFormulas'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_DisplayFormulas(Value: UnicodeString);
begin
  ChildNodes['DisplayFormulas'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_DoNotDisplayGridlines: UnicodeString;
begin
  Result := ChildNodes['DoNotDisplayGridlines'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_DoNotDisplayGridlines(Value: UnicodeString);
begin
  ChildNodes['DoNotDisplayGridlines'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_DoNotDisplayHeadings: UnicodeString;
begin
  Result := ChildNodes['DoNotDisplayHeadings'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_DoNotDisplayHeadings(Value: UnicodeString);
begin
  ChildNodes['DoNotDisplayHeadings'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_DoNotDisplayOutline: UnicodeString;
begin
  Result := ChildNodes['DoNotDisplayOutline'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_DoNotDisplayOutline(Value: UnicodeString);
begin
  ChildNodes['DoNotDisplayOutline'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_ApplyAutomaticOutlineStyles: UnicodeString;
begin
  Result := ChildNodes['ApplyAutomaticOutlineStyles'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_ApplyAutomaticOutlineStyles(Value: UnicodeString);
begin
  ChildNodes['ApplyAutomaticOutlineStyles'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_NoSummaryRowsBelowDetail: UnicodeString;
begin
  Result := ChildNodes['NoSummaryRowsBelowDetail'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_NoSummaryRowsBelowDetail(Value: UnicodeString);
begin
  ChildNodes['NoSummaryRowsBelowDetail'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_NoSummaryColumnsRightDetail: UnicodeString;
begin
  Result := ChildNodes['NoSummaryColumnsRightDetail'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_NoSummaryColumnsRightDetail(Value: UnicodeString);
begin
  ChildNodes['NoSummaryColumnsRightDetail'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_DoNotDisplayZeros: UnicodeString;
begin
  Result := ChildNodes['DoNotDisplayZeros'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_DoNotDisplayZeros(Value: UnicodeString);
begin
  ChildNodes['DoNotDisplayZeros'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_ActiveRow: Integer;
begin
  Result := ChildNodes['ActiveRow'].NodeValue;
end;

procedure TXMLWorksheetOptionsType_x.Set_ActiveRow(Value: Integer);
begin
  ChildNodes['ActiveRow'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_ActiveColumn: Integer;
begin
  Result := ChildNodes['ActiveColumn'].NodeValue;
end;

procedure TXMLWorksheetOptionsType_x.Set_ActiveColumn(Value: Integer);
begin
  ChildNodes['ActiveColumn'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_FilterOn: UnicodeString;
begin
  Result := ChildNodes['FilterOn'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_FilterOn(Value: UnicodeString);
begin
  ChildNodes['FilterOn'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_RangeSelection: UnicodeString;
begin
  Result := ChildNodes['RangeSelection'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_RangeSelection(Value: UnicodeString);
begin
  ChildNodes['RangeSelection'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_TopRowVisible: Integer;
begin
  Result := ChildNodes['TopRowVisible'].NodeValue;
end;

procedure TXMLWorksheetOptionsType_x.Set_TopRowVisible(Value: Integer);
begin
  ChildNodes['TopRowVisible'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_TopRowBottomPane: Integer;
begin
  Result := ChildNodes['TopRowBottomPane'].NodeValue;
end;

procedure TXMLWorksheetOptionsType_x.Set_TopRowBottomPane(Value: Integer);
begin
  ChildNodes['TopRowBottomPane'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_LeftColumnRightPane: Integer;
begin
  Result := ChildNodes['LeftColumnRightPane'].NodeValue;
end;

procedure TXMLWorksheetOptionsType_x.Set_LeftColumnRightPane(Value: Integer);
begin
  ChildNodes['LeftColumnRightPane'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_ActivePane: Integer;
begin
  Result := ChildNodes['ActivePane'].NodeValue;
end;

procedure TXMLWorksheetOptionsType_x.Set_ActivePane(Value: Integer);
begin
  ChildNodes['ActivePane'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_SplitHorizontal: Integer;
begin
  Result := ChildNodes['SplitHorizontal'].NodeValue;
end;

procedure TXMLWorksheetOptionsType_x.Set_SplitHorizontal(Value: Integer);
begin
  ChildNodes['SplitHorizontal'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_SplitVertical: Integer;
begin
  Result := ChildNodes['SplitVertical'].NodeValue;
end;

procedure TXMLWorksheetOptionsType_x.Set_SplitVertical(Value: Integer);
begin
  ChildNodes['SplitVertical'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_FreezePanes: UnicodeString;
begin
  Result := ChildNodes['FreezePanes'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_FreezePanes(Value: UnicodeString);
begin
  ChildNodes['FreezePanes'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_FrozenNoSplit: UnicodeString;
begin
  Result := ChildNodes['FrozenNoSplit'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_FrozenNoSplit(Value: UnicodeString);
begin
  ChildNodes['FrozenNoSplit'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_TabColorIndex: Integer;
begin
  Result := ChildNodes['TabColorIndex'].NodeValue;
end;

procedure TXMLWorksheetOptionsType_x.Set_TabColorIndex(Value: Integer);
begin
  ChildNodes['TabColorIndex'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_Panes: IXMLPanesType_x;
begin
  Result := ChildNodes['Panes'] as IXMLPanesType_x;
end;

function TXMLWorksheetOptionsType_x.Get_ProtectContents: UnicodeString;
begin
  Result := ChildNodes['ProtectContents'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_ProtectContents(Value: UnicodeString);
begin
  ChildNodes['ProtectContents'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_ProtectObjects: UnicodeString;
begin
  Result := ChildNodes['ProtectObjects'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_ProtectObjects(Value: UnicodeString);
begin
  ChildNodes['ProtectObjects'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_ProtectScenarios: UnicodeString;
begin
  Result := ChildNodes['ProtectScenarios'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_ProtectScenarios(Value: UnicodeString);
begin
  ChildNodes['ProtectScenarios'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_EnableSelection: UnicodeString;
begin
  Result := ChildNodes['EnableSelection'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_EnableSelection(Value: UnicodeString);
begin
  ChildNodes['EnableSelection'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_AllowFormatCells: UnicodeString;
begin
  Result := ChildNodes['AllowFormatCells'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_AllowFormatCells(Value: UnicodeString);
begin
  ChildNodes['AllowFormatCells'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_AllowSizeCols: UnicodeString;
begin
  Result := ChildNodes['AllowSizeCols'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_AllowSizeCols(Value: UnicodeString);
begin
  ChildNodes['AllowSizeCols'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_AllowSizeRows: UnicodeString;
begin
  Result := ChildNodes['AllowSizeRows'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_AllowSizeRows(Value: UnicodeString);
begin
  ChildNodes['AllowSizeRows'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_AllowInsertCols: UnicodeString;
begin
  Result := ChildNodes['AllowInsertCols'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_AllowInsertCols(Value: UnicodeString);
begin
  ChildNodes['AllowInsertCols'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_AllowInsertRows: UnicodeString;
begin
  Result := ChildNodes['AllowInsertRows'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_AllowInsertRows(Value: UnicodeString);
begin
  ChildNodes['AllowInsertRows'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_AllowInsertHyperlinks: UnicodeString;
begin
  Result := ChildNodes['AllowInsertHyperlinks'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_AllowInsertHyperlinks(Value: UnicodeString);
begin
  ChildNodes['AllowInsertHyperlinks'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_AllowDeleteCols: UnicodeString;
begin
  Result := ChildNodes['AllowDeleteCols'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_AllowDeleteCols(Value: UnicodeString);
begin
  ChildNodes['AllowDeleteCols'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_AllowDeleteRows: UnicodeString;
begin
  Result := ChildNodes['AllowDeleteRows'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_AllowDeleteRows(Value: UnicodeString);
begin
  ChildNodes['AllowDeleteRows'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_AllowSort: UnicodeString;
begin
  Result := ChildNodes['AllowSort'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_AllowSort(Value: UnicodeString);
begin
  ChildNodes['AllowSort'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_AllowFilter: UnicodeString;
begin
  Result := ChildNodes['AllowFilter'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_AllowFilter(Value: UnicodeString);
begin
  ChildNodes['AllowFilter'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_AllowUsePivotTables: UnicodeString;
begin
  Result := ChildNodes['AllowUsePivotTables'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_AllowUsePivotTables(Value: UnicodeString);
begin
  ChildNodes['AllowUsePivotTables'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_SpaceAbove: UnicodeString;
begin
  Result := ChildNodes['SpaceAbove'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_SpaceAbove(Value: UnicodeString);
begin
  ChildNodes['SpaceAbove'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_SpaceBelow: UnicodeString;
begin
  Result := ChildNodes['SpaceBelow'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_SpaceBelow(Value: UnicodeString);
begin
  ChildNodes['SpaceBelow'].NodeValue := Value;
end;

function TXMLWorksheetOptionsType_x.Get_ZeroHeight: UnicodeString;
begin
  Result := ChildNodes['ZeroHeight'].Text;
end;

procedure TXMLWorksheetOptionsType_x.Set_ZeroHeight(Value: UnicodeString);
begin
  ChildNodes['ZeroHeight'].NodeValue := Value;
end;

{ TXMLPageSetupType_x }

procedure TXMLPageSetupType_x.AfterConstruction;
begin
  RegisterChildNode('Layout', TXMLLayout_x);
  RegisterChildNode('Header', TXMLHeader_x);
  RegisterChildNode('Footer', TXMLFooter_x);
  RegisterChildNode('PageMargins', TXMLPageMargins_x);
  inherited;
end;

function TXMLPageSetupType_x.Get_Layout: IXMLLayout_x;
begin
  Result := ChildNodes['Layout'] as IXMLLayout_x;
end;

function TXMLPageSetupType_x.Get_Header: IXMLHeader_x;
begin
  Result := ChildNodes['Header'] as IXMLHeader_x;
end;

function TXMLPageSetupType_x.Get_Footer: IXMLFooter_x;
begin
  Result := ChildNodes['Footer'] as IXMLFooter_x;
end;

function TXMLPageSetupType_x.Get_PageMargins: IXMLPageMargins_x;
begin
  Result := ChildNodes['PageMargins'] as IXMLPageMargins_x;
end;

{ TXMLLayout_x }

function TXMLLayout_x.Get_Orientation: UnicodeString;
begin
  Result := AttributeNodes['Orientation'].Text;
end;

procedure TXMLLayout_x.Set_Orientation(Value: UnicodeString);
begin
  SetAttribute('Orientation', Value);
end;

function TXMLLayout_x.Get_CenterHorizontal: UnicodeString;
begin
  Result := AttributeNodes['CenterHorizontal'].Text;
end;

procedure TXMLLayout_x.Set_CenterHorizontal(Value: UnicodeString);
begin
  SetAttribute('CenterHorizontal', Value);
end;

function TXMLLayout_x.Get_CenterVertical: UnicodeString;
begin
  Result := AttributeNodes['CenterVertical'].Text;
end;

procedure TXMLLayout_x.Set_CenterVertical(Value: UnicodeString);
begin
  SetAttribute('CenterVertical', Value);
end;

function TXMLLayout_x.Get_StartPageNumber: UnicodeString;
begin
  Result := AttributeNodes['StartPageNumber'].Text;
end;

procedure TXMLLayout_x.Set_StartPageNumber(Value: UnicodeString);
begin
  SetAttribute('StartPageNumber', Value);
end;

{ TXMLHeader_x }

function TXMLHeader_x.Get_Margin: Double;
begin
  Result := AttributeNodes['Margin'].NodeValue;
end;

procedure TXMLHeader_x.Set_Margin(Value: Double);
begin
  SetAttribute('Margin', Value);
end;

function TXMLHeader_x.Get_Data: UnicodeString;
begin
  Result := AttributeNodes['Data'].Text;
end;

procedure TXMLHeader_x.Set_Data(Value: UnicodeString);
begin
  SetAttribute('Data', Value);
end;

{ TXMLFooter_x }

function TXMLFooter_x.Get_Margin: Double;
begin
  Result := AttributeNodes['Margin'].NodeValue;
end;

procedure TXMLFooter_x.Set_Margin(Value: Double);
begin
  SetAttribute('Margin', Value);
end;

function TXMLFooter_x.Get_Data: UnicodeString;
begin
  Result := AttributeNodes['Data'].Text;
end;

procedure TXMLFooter_x.Set_Data(Value: UnicodeString);
begin
  SetAttribute('Data', Value);
end;

{ TXMLPageMargins_x }

function TXMLPageMargins_x.Get_Left: Double;
begin
  Result := AttributeNodes['Left'].NodeValue;
end;

procedure TXMLPageMargins_x.Set_Left(Value: Double);
begin
  SetAttribute('Left', Value);
end;

function TXMLPageMargins_x.Get_Right: Double;
begin
  Result := AttributeNodes['Right'].NodeValue;
end;

procedure TXMLPageMargins_x.Set_Right(Value: Double);
begin
  SetAttribute('Right', Value);
end;

function TXMLPageMargins_x.Get_Top: Double;
begin
  Result := AttributeNodes['Top'].NodeValue;
end;

procedure TXMLPageMargins_x.Set_Top(Value: Double);
begin
  SetAttribute('Top', Value);
end;

function TXMLPageMargins_x.Get_Bottom: Double;
begin
  Result := AttributeNodes['Bottom'].NodeValue;
end;

procedure TXMLPageMargins_x.Set_Bottom(Value: Double);
begin
  SetAttribute('Bottom', Value);
end;

{ TXMLPrintType_x }

function TXMLPrintType_x.Get_FitWidth: Integer;
begin
  Result := ChildNodes['FitWidth'].NodeValue;
end;

procedure TXMLPrintType_x.Set_FitWidth(Value: Integer);
begin
  ChildNodes['FitWidth'].NodeValue := Value;
end;

function TXMLPrintType_x.Get_FitHeight: Integer;
begin
  Result := ChildNodes['FitHeight'].NodeValue;
end;

procedure TXMLPrintType_x.Set_FitHeight(Value: Integer);
begin
  ChildNodes['FitHeight'].NodeValue := Value;
end;

function TXMLPrintType_x.Get_LeftToRight: UnicodeString;
begin
  Result := ChildNodes['LeftToRight'].Text;
end;

procedure TXMLPrintType_x.Set_LeftToRight(Value: UnicodeString);
begin
  ChildNodes['LeftToRight'].NodeValue := Value;
end;

function TXMLPrintType_x.Get_BlackAndWhite: UnicodeString;
begin
  Result := ChildNodes['BlackAndWhite'].Text;
end;

procedure TXMLPrintType_x.Set_BlackAndWhite(Value: UnicodeString);
begin
  ChildNodes['BlackAndWhite'].NodeValue := Value;
end;

function TXMLPrintType_x.Get_NoPrinterInfo: UnicodeString;
begin
  Result := ChildNodes['NoPrinterInfo'].Text;
end;

procedure TXMLPrintType_x.Set_NoPrinterInfo(Value: UnicodeString);
begin
  ChildNodes['NoPrinterInfo'].NodeValue := Value;
end;

function TXMLPrintType_x.Get_DraftQuality: UnicodeString;
begin
  Result := ChildNodes['DraftQuality'].Text;
end;

procedure TXMLPrintType_x.Set_DraftQuality(Value: UnicodeString);
begin
  ChildNodes['DraftQuality'].NodeValue := Value;
end;

function TXMLPrintType_x.Get_CommentsLayout: UnicodeString;
begin
  Result := ChildNodes['CommentsLayout'].Text;
end;

procedure TXMLPrintType_x.Set_CommentsLayout(Value: UnicodeString);
begin
  ChildNodes['CommentsLayout'].NodeValue := Value;
end;

function TXMLPrintType_x.Get_Scale: Integer;
begin
  Result := ChildNodes['Scale'].NodeValue;
end;

procedure TXMLPrintType_x.Set_Scale(Value: Integer);
begin
  ChildNodes['Scale'].NodeValue := Value;
end;

function TXMLPrintType_x.Get_PrintErrors: UnicodeString;
begin
  Result := ChildNodes['PrintErrors'].Text;
end;

procedure TXMLPrintType_x.Set_PrintErrors(Value: UnicodeString);
begin
  ChildNodes['PrintErrors'].NodeValue := Value;
end;

function TXMLPrintType_x.Get_ValidPrinterInfo: UnicodeString;
begin
  Result := ChildNodes['ValidPrinterInfo'].Text;
end;

procedure TXMLPrintType_x.Set_ValidPrinterInfo(Value: UnicodeString);
begin
  ChildNodes['ValidPrinterInfo'].NodeValue := Value;
end;

function TXMLPrintType_x.Get_PaperSizeIndex: Integer;
begin
  Result := ChildNodes['PaperSizeIndex'].NodeValue;
end;

procedure TXMLPrintType_x.Set_PaperSizeIndex(Value: Integer);
begin
  ChildNodes['PaperSizeIndex'].NodeValue := Value;
end;

function TXMLPrintType_x.Get_HorizontalResolution: Integer;
begin
  Result := ChildNodes['HorizontalResolution'].NodeValue;
end;

procedure TXMLPrintType_x.Set_HorizontalResolution(Value: Integer);
begin
  ChildNodes['HorizontalResolution'].NodeValue := Value;
end;

function TXMLPrintType_x.Get_VerticalResolution: Integer;
begin
  Result := ChildNodes['VerticalResolution'].NodeValue;
end;

procedure TXMLPrintType_x.Set_VerticalResolution(Value: Integer);
begin
  ChildNodes['VerticalResolution'].NodeValue := Value;
end;

function TXMLPrintType_x.Get_Gridlines: UnicodeString;
begin
  Result := ChildNodes['Gridlines'].Text;
end;

procedure TXMLPrintType_x.Set_Gridlines(Value: UnicodeString);
begin
  ChildNodes['Gridlines'].NodeValue := Value;
end;

function TXMLPrintType_x.Get_NumberOfCopies: Integer;
begin
  Result := ChildNodes['NumberOfCopies'].NodeValue;
end;

procedure TXMLPrintType_x.Set_NumberOfCopies(Value: Integer);
begin
  ChildNodes['NumberOfCopies'].NodeValue := Value;
end;

function TXMLPrintType_x.Get_RowColHeadings: UnicodeString;
begin
  Result := ChildNodes['RowColHeadings'].Text;
end;

procedure TXMLPrintType_x.Set_RowColHeadings(Value: UnicodeString);
begin
  ChildNodes['RowColHeadings'].NodeValue := Value;
end;

{ TXMLPanesType_x }

procedure TXMLPanesType_x.AfterConstruction;
begin
  RegisterChildNode('Pane', TXMLPaneType_x);
  ItemTag := 'Pane';
  ItemInterface := IXMLPaneType_x;
  inherited;
end;

function TXMLPanesType_x.Get_Pane(Index: Integer): IXMLPaneType_x;
begin
  Result := List[Index] as IXMLPaneType_x;
end;

function TXMLPanesType_x.Add: IXMLPaneType_x;
begin
  Result := AddItem(-1) as IXMLPaneType_x;
end;

function TXMLPanesType_x.Insert(const Index: Integer): IXMLPaneType_x;
begin
  Result := AddItem(Index) as IXMLPaneType_x;
end;

{ TXMLPaneType_x }

procedure TXMLPaneType_x.AfterConstruction;
begin
  RegisterChildNode('Selection', TXMLSelectionType_x);
  inherited;
end;

function TXMLPaneType_x.Get_Number: Integer;
begin
  Result := ChildNodes['Number'].NodeValue;
end;

procedure TXMLPaneType_x.Set_Number(Value: Integer);
begin
  ChildNodes['Number'].NodeValue := Value;
end;

function TXMLPaneType_x.Get_ActiveRow: Integer;
begin
  Result := ChildNodes['ActiveRow'].NodeValue;
end;

procedure TXMLPaneType_x.Set_ActiveRow(Value: Integer);
begin
  ChildNodes['ActiveRow'].NodeValue := Value;
end;

function TXMLPaneType_x.Get_ActiveCol: Integer;
begin
  Result := ChildNodes['ActiveCol'].NodeValue;
end;

procedure TXMLPaneType_x.Set_ActiveCol(Value: Integer);
begin
  ChildNodes['ActiveCol'].NodeValue := Value;
end;

function TXMLPaneType_x.Get_RangeSelection: UnicodeString;
begin
  Result := ChildNodes['RangeSelection'].Text;
end;

procedure TXMLPaneType_x.Set_RangeSelection(Value: UnicodeString);
begin
  ChildNodes['RangeSelection'].NodeValue := Value;
end;

function TXMLPaneType_x.Get_Selection: IXMLSelectionType_x;
begin
  Result := ChildNodes['Selection'] as IXMLSelectionType_x;
end;

{ TXMLSelectionType_x }

procedure TXMLSelectionType_x.AfterConstruction;
begin
  RegisterChildNode('PTRule', TXMLPTRuleType_x);
  RegisterChildNode('Pane', TXMLPaneType_x);
  inherited;
end;

function TXMLSelectionType_x.Get_PTRule: IXMLPTRuleType_x;
begin
  Result := ChildNodes['PTRule'] as IXMLPTRuleType_x;
end;

function TXMLSelectionType_x.Get_Pane: IXMLPaneType_x;
begin
  Result := ChildNodes['Pane'] as IXMLPaneType_x;
end;

function TXMLSelectionType_x.Get_NoToggleDataHeader: UnicodeString;
begin
  Result := ChildNodes['NoToggleDataHeader'].Text;
end;

procedure TXMLSelectionType_x.Set_NoToggleDataHeader(Value: UnicodeString);
begin
  ChildNodes['NoToggleDataHeader'].NodeValue := Value;
end;

{ TXMLPTRuleType_x }

function TXMLPTRuleType_x.Get_RuleType: UnicodeString;
begin
  Result := ChildNodes['RuleType'].Text;
end;

procedure TXMLPTRuleType_x.Set_RuleType(Value: UnicodeString);
begin
  ChildNodes['RuleType'].NodeValue := Value;
end;

function TXMLPTRuleType_x.Get_Rule: UnicodeString;
begin
  Result := ChildNodes['Rule'].Text;
end;

procedure TXMLPTRuleType_x.Set_Rule(Value: UnicodeString);
begin
  ChildNodes['Rule'].NodeValue := Value;
end;

function TXMLPTRuleType_x.Get_RuleV10: UnicodeString;
begin
  Result := ChildNodes['RuleV10'].Text;
end;

procedure TXMLPTRuleType_x.Set_RuleV10(Value: UnicodeString);
begin
  ChildNodes['RuleV10'].NodeValue := Value;
end;

function TXMLPTRuleType_x.Get_ParseRuleAsV10: UnicodeString;
begin
  Result := ChildNodes['ParseRuleAsV10'].Text;
end;

procedure TXMLPTRuleType_x.Set_ParseRuleAsV10(Value: UnicodeString);
begin
  ChildNodes['ParseRuleAsV10'].NodeValue := Value;
end;

function TXMLPTRuleType_x.Get_Area: UnicodeString;
begin
  Result := ChildNodes['Area'].Text;
end;

procedure TXMLPTRuleType_x.Set_Area(Value: UnicodeString);
begin
  ChildNodes['Area'].NodeValue := Value;
end;

function TXMLPTRuleType_x.Get_Outline: UnicodeString;
begin
  Result := ChildNodes['Outline'].Text;
end;

procedure TXMLPTRuleType_x.Set_Outline(Value: UnicodeString);
begin
  ChildNodes['Outline'].NodeValue := Value;
end;

{ TXMLPTRuleType_xList }

function TXMLPTRuleType_xList.Add: IXMLPTRuleType_x;
begin
  Result := AddItem(-1) as IXMLPTRuleType_x;
end;

function TXMLPTRuleType_xList.Insert(const Index: Integer): IXMLPTRuleType_x;
begin
  Result := AddItem(Index) as IXMLPTRuleType_x;
end;

function TXMLPTRuleType_xList.Get_Item(Index: Integer): IXMLPTRuleType_x;
begin
  Result := List[Index] as IXMLPTRuleType_x;
end;

{ TXMLWatches_x }

procedure TXMLWatches_x.AfterConstruction;
begin
  RegisterChildNode('Watch', TXMLWatch_x);
  ItemTag := 'Watch';
  ItemInterface := IXMLWatch_x;
  inherited;
end;

function TXMLWatches_x.Get_Watch(Index: Integer): IXMLWatch_x;
begin
  Result := List[Index] as IXMLWatch_x;
end;

function TXMLWatches_x.Add: IXMLWatch_x;
begin
  Result := AddItem(-1) as IXMLWatch_x;
end;

function TXMLWatches_x.Insert(const Index: Integer): IXMLWatch_x;
begin
  Result := AddItem(Index) as IXMLWatch_x;
end;

{ TXMLWatch_x }

function TXMLWatch_x.Get_Source: UnicodeString;
begin
  Result := ChildNodes['Source'].Text;
end;

procedure TXMLWatch_x.Set_Source(Value: UnicodeString);
begin
  ChildNodes['Source'].NodeValue := Value;
end;

{ TXMLDataTable_x }

function TXMLDataTable_x.Get_Range: UnicodeString;
begin
  Result := ChildNodes['Range'].Text;
end;

procedure TXMLDataTable_x.Set_Range(Value: UnicodeString);
begin
  ChildNodes['Range'].NodeValue := Value;
end;

function TXMLDataTable_x.Get_RowInputCell: UnicodeString;
begin
  Result := ChildNodes['RowInputCell'].Text;
end;

procedure TXMLDataTable_x.Set_RowInputCell(Value: UnicodeString);
begin
  ChildNodes['RowInputCell'].NodeValue := Value;
end;

function TXMLDataTable_x.Get_ColumnInputCell: UnicodeString;
begin
  Result := ChildNodes['ColumnInputCell'].Text;
end;

procedure TXMLDataTable_x.Set_ColumnInputCell(Value: UnicodeString);
begin
  ChildNodes['ColumnInputCell'].NodeValue := Value;
end;

{ TXMLPageBreaksType_x }

procedure TXMLPageBreaksType_x.AfterConstruction;
begin
  RegisterChildNode('ColBreaks', TXMLColBreaks_x);
  RegisterChildNode('RowBreaks', TXMLRowBreaks_x);
  inherited;
end;

function TXMLPageBreaksType_x.Get_ColBreaks: IXMLColBreaks_x;
begin
  Result := ChildNodes['ColBreaks'] as IXMLColBreaks_x;
end;

function TXMLPageBreaksType_x.Get_RowBreaks: IXMLRowBreaks_x;
begin
  Result := ChildNodes['RowBreaks'] as IXMLRowBreaks_x;
end;

{ TXMLColBreaks_x }

procedure TXMLColBreaks_x.AfterConstruction;
begin
  RegisterChildNode('ColBreak', TXMLColBreak_x);
  ItemTag := 'ColBreak';
  ItemInterface := IXMLColBreak_x;
  inherited;
end;

function TXMLColBreaks_x.Get_ColBreak(Index: Integer): IXMLColBreak_x;
begin
  Result := List[Index] as IXMLColBreak_x;
end;

function TXMLColBreaks_x.Add: IXMLColBreak_x;
begin
  Result := AddItem(-1) as IXMLColBreak_x;
end;

function TXMLColBreaks_x.Insert(const Index: Integer): IXMLColBreak_x;
begin
  Result := AddItem(Index) as IXMLColBreak_x;
end;

{ TXMLColBreak_x }

function TXMLColBreak_x.Get_Column: Integer;
begin
  Result := ChildNodes['Column'].NodeValue;
end;

procedure TXMLColBreak_x.Set_Column(Value: Integer);
begin
  ChildNodes['Column'].NodeValue := Value;
end;

{ TXMLRowBreaks_x }

procedure TXMLRowBreaks_x.AfterConstruction;
begin
  RegisterChildNode('RowBreak', TXMLRowBreak_x);
  ItemTag := 'RowBreak';
  ItemInterface := IXMLRowBreak_x;
  inherited;
end;

function TXMLRowBreaks_x.Get_RowBreak(Index: Integer): IXMLRowBreak_x;
begin
  Result := List[Index] as IXMLRowBreak_x;
end;

function TXMLRowBreaks_x.Add: IXMLRowBreak_x;
begin
  Result := AddItem(-1) as IXMLRowBreak_x;
end;

function TXMLRowBreaks_x.Insert(const Index: Integer): IXMLRowBreak_x;
begin
  Result := AddItem(Index) as IXMLRowBreak_x;
end;

{ TXMLRowBreak_x }

procedure TXMLRowBreak_x.AfterConstruction;
begin
  RegisterChildNode('Row', TXMLRowType_x);
  inherited;
end;

function TXMLRowBreak_x.Get_Row: IXMLRowType_x;
begin
  Result := ChildNodes['Row'] as IXMLRowType_x;
end;

{ TXMLPivotTableType_x }

procedure TXMLPivotTableType_x.AfterConstruction;
begin
  RegisterChildNode('QTSource', TXMLQTSourceType_x);
  RegisterChildNode('PivotView', TXMLPivotViewType_x);
  RegisterChildNode('Selection', TXMLSelectionType_x);
  RegisterChildNode('PLPivotField', TXMLPLPivotFieldType_x);
  RegisterChildNode('PLTotal', TXMLPLTotalType_x);
  RegisterChildNode('PivotAxis', TXMLPivotAxisType_x);
  RegisterChildNode('PivotField', TXMLPivotFieldType_x);
  RegisterChildNode('CubeField', TXMLCubeFieldType_x);
  RegisterChildNode('CalculatedMember', TXMLCalculatedMember_x);
  RegisterChildNode('PTLineItems', TXMLPTLineItemsType_x);
  RegisterChildNode('PTSource', TXMLPTSourceType_x);
  RegisterChildNode('PTFormula', TXMLPTFormulaType_x);
  RegisterChildNode('PTFormat', TXMLPTFormatType_x);
  FPLPivotField := CreateCollection(TXMLPLPivotFieldType_xList, IXMLPLPivotFieldType_x, 'PLPivotField') as IXMLPLPivotFieldType_xList;
  FPLTotal := CreateCollection(TXMLPLTotalType_xList, IXMLPLTotalType_x, 'PLTotal') as IXMLPLTotalType_xList;
  FPivotAxis := CreateCollection(TXMLPivotAxisType_xList, IXMLPivotAxisType_x, 'PivotAxis') as IXMLPivotAxisType_xList;
  FPivotField := CreateCollection(TXMLPivotFieldType_xList, IXMLPivotFieldType_x, 'PivotField') as IXMLPivotFieldType_xList;
  FCubeField := CreateCollection(TXMLCubeFieldType_xList, IXMLCubeFieldType_x, 'CubeField') as IXMLCubeFieldType_xList;
  FPTLineItems := CreateCollection(TXMLPTLineItemsType_xList, IXMLPTLineItemsType_x, 'PTLineItems') as IXMLPTLineItemsType_xList;
  FPTFormula := CreateCollection(TXMLPTFormulaType_xList, IXMLPTFormulaType_x, 'PTFormula') as IXMLPTFormulaType_xList;
  FPTFormat := CreateCollection(TXMLPTFormatType_xList, IXMLPTFormatType_x, 'PTFormat') as IXMLPTFormatType_xList;
  inherited;
end;

function TXMLPivotTableType_x.Get_Name: UnicodeString;
begin
  Result := ChildNodes['Name'].Text;
end;

procedure TXMLPivotTableType_x.Set_Name(Value: UnicodeString);
begin
  ChildNodes['Name'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_DataValueEditing: UnicodeString;
begin
  Result := ChildNodes['DataValueEditing'].Text;
end;

procedure TXMLPivotTableType_x.Set_DataValueEditing(Value: UnicodeString);
begin
  ChildNodes['DataValueEditing'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_QTSource: IXMLQTSourceType_x;
begin
  Result := ChildNodes['QTSource'] as IXMLQTSourceType_x;
end;

function TXMLPivotTableType_x.Get_ErrorString: UnicodeString;
begin
  Result := ChildNodes['ErrorString'].Text;
end;

procedure TXMLPivotTableType_x.Set_ErrorString(Value: UnicodeString);
begin
  ChildNodes['ErrorString'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_NullString: UnicodeString;
begin
  Result := ChildNodes['NullString'].Text;
end;

procedure TXMLPivotTableType_x.Set_NullString(Value: UnicodeString);
begin
  ChildNodes['NullString'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_PageFieldOrder: UnicodeString;
begin
  Result := ChildNodes['PageFieldOrder'].Text;
end;

procedure TXMLPivotTableType_x.Set_PageFieldOrder(Value: UnicodeString);
begin
  ChildNodes['PageFieldOrder'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_PageFieldWrapCount: Integer;
begin
  Result := ChildNodes['PageFieldWrapCount'].NodeValue;
end;

procedure TXMLPivotTableType_x.Set_PageFieldWrapCount(Value: Integer);
begin
  ChildNodes['PageFieldWrapCount'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_DisableDrillDown: UnicodeString;
begin
  Result := ChildNodes['DisableDrillDown'].Text;
end;

procedure TXMLPivotTableType_x.Set_DisableDrillDown(Value: UnicodeString);
begin
  ChildNodes['DisableDrillDown'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_DisableFieldDialog: UnicodeString;
begin
  Result := ChildNodes['DisableFieldDialog'].Text;
end;

procedure TXMLPivotTableType_x.Set_DisableFieldDialog(Value: UnicodeString);
begin
  ChildNodes['DisableFieldDialog'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_DisableWizard: UnicodeString;
begin
  Result := ChildNodes['DisableWizard'].Text;
end;

procedure TXMLPivotTableType_x.Set_DisableWizard(Value: UnicodeString);
begin
  ChildNodes['DisableWizard'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_DisplayErrorString: UnicodeString;
begin
  Result := ChildNodes['DisplayErrorString'].Text;
end;

procedure TXMLPivotTableType_x.Set_DisplayErrorString(Value: UnicodeString);
begin
  ChildNodes['DisplayErrorString'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_NoPreserveFormatting: UnicodeString;
begin
  Result := ChildNodes['NoPreserveFormatting'].Text;
end;

procedure TXMLPivotTableType_x.Set_NoPreserveFormatting(Value: UnicodeString);
begin
  ChildNodes['NoPreserveFormatting'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_HasNoAutoFormat: UnicodeString;
begin
  Result := ChildNodes['HasNoAutoFormat'].Text;
end;

procedure TXMLPivotTableType_x.Set_HasNoAutoFormat(Value: UnicodeString);
begin
  ChildNodes['HasNoAutoFormat'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_SubtotalHiddenPageItems: UnicodeString;
begin
  Result := ChildNodes['SubtotalHiddenPageItems'].Text;
end;

procedure TXMLPivotTableType_x.Set_SubtotalHiddenPageItems(Value: UnicodeString);
begin
  ChildNodes['SubtotalHiddenPageItems'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_NoAutoFormatWidth: UnicodeString;
begin
  Result := ChildNodes['NoAutoFormatWidth'].Text;
end;

procedure TXMLPivotTableType_x.Set_NoAutoFormatWidth(Value: UnicodeString);
begin
  ChildNodes['NoAutoFormatWidth'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_NoRowGrand: UnicodeString;
begin
  Result := ChildNodes['NoRowGrand'].Text;
end;

procedure TXMLPivotTableType_x.Set_NoRowGrand(Value: UnicodeString);
begin
  ChildNodes['NoRowGrand'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_NoColumnGrand: UnicodeString;
begin
  Result := ChildNodes['NoColumnGrand'].Text;
end;

procedure TXMLPivotTableType_x.Set_NoColumnGrand(Value: UnicodeString);
begin
  ChildNodes['NoColumnGrand'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_NoDisplayNullString: UnicodeString;
begin
  Result := ChildNodes['NoDisplayNullString'].Text;
end;

procedure TXMLPivotTableType_x.Set_NoDisplayNullString(Value: UnicodeString);
begin
  ChildNodes['NoDisplayNullString'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_NoPrintRepeatItems: UnicodeString;
begin
  Result := ChildNodes['NoPrintRepeatItems'].Text;
end;

procedure TXMLPivotTableType_x.Set_NoPrintRepeatItems(Value: UnicodeString);
begin
  ChildNodes['NoPrintRepeatItems'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_PivotView: IXMLPivotViewType_x;
begin
  Result := ChildNodes['PivotView'] as IXMLPivotViewType_x;
end;

function TXMLPivotTableType_x.Get_Selection: IXMLSelectionType_x;
begin
  Result := ChildNodes['Selection'] as IXMLSelectionType_x;
end;

function TXMLPivotTableType_x.Get_AutoFormatAlignment: UnicodeString;
begin
  Result := ChildNodes['AutoFormatAlignment'].Text;
end;

procedure TXMLPivotTableType_x.Set_AutoFormatAlignment(Value: UnicodeString);
begin
  ChildNodes['AutoFormatAlignment'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_AutoFormatBorder: UnicodeString;
begin
  Result := ChildNodes['AutoFormatBorder'].Text;
end;

procedure TXMLPivotTableType_x.Set_AutoFormatBorder(Value: UnicodeString);
begin
  ChildNodes['AutoFormatBorder'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_AutoFormatFont: UnicodeString;
begin
  Result := ChildNodes['AutoFormatFont'].Text;
end;

procedure TXMLPivotTableType_x.Set_AutoFormatFont(Value: UnicodeString);
begin
  ChildNodes['AutoFormatFont'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_AutoFormatName: UnicodeString;
begin
  Result := ChildNodes['AutoFormatName'].Text;
end;

procedure TXMLPivotTableType_x.Set_AutoFormatName(Value: UnicodeString);
begin
  ChildNodes['AutoFormatName'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_AutoFormatNumber: UnicodeString;
begin
  Result := ChildNodes['AutoFormatNumber'].Text;
end;

procedure TXMLPivotTableType_x.Set_AutoFormatNumber(Value: UnicodeString);
begin
  ChildNodes['AutoFormatNumber'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_AutoFormatPattern: UnicodeString;
begin
  Result := ChildNodes['AutoFormatPattern'].Text;
end;

procedure TXMLPivotTableType_x.Set_AutoFormatPattern(Value: UnicodeString);
begin
  ChildNodes['AutoFormatPattern'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_GrandTotalString: UnicodeString;
begin
  Result := ChildNodes['GrandTotalString'].Text;
end;

procedure TXMLPivotTableType_x.Set_GrandTotalString(Value: UnicodeString);
begin
  ChildNodes['GrandTotalString'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_PrintSetTitles: UnicodeString;
begin
  Result := ChildNodes['PrintSetTitles'].Text;
end;

procedure TXMLPivotTableType_x.Set_PrintSetTitles(Value: UnicodeString);
begin
  ChildNodes['PrintSetTitles'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_MergeLabels: UnicodeString;
begin
  Result := ChildNodes['MergeLabels'].Text;
end;

procedure TXMLPivotTableType_x.Set_MergeLabels(Value: UnicodeString);
begin
  ChildNodes['MergeLabels'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_PageFieldStyle: UnicodeString;
begin
  Result := ChildNodes['PageFieldStyle'].Text;
end;

procedure TXMLPivotTableType_x.Set_PageFieldStyle(Value: UnicodeString);
begin
  ChildNodes['PageFieldStyle'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_PLExport: UnicodeString;
begin
  Result := ChildNodes['PLExport'].Text;
end;

procedure TXMLPivotTableType_x.Set_PLExport(Value: UnicodeString);
begin
  ChildNodes['PLExport'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_ImmediateItemsOnDrop: UnicodeString;
begin
  Result := ChildNodes['ImmediateItemsOnDrop'].Text;
end;

procedure TXMLPivotTableType_x.Set_ImmediateItemsOnDrop(Value: UnicodeString);
begin
  ChildNodes['ImmediateItemsOnDrop'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_ShowPageMultipleItemLabel: UnicodeString;
begin
  Result := ChildNodes['ShowPageMultipleItemLabel'].Text;
end;

procedure TXMLPivotTableType_x.Set_ShowPageMultipleItemLabel(Value: UnicodeString);
begin
  ChildNodes['ShowPageMultipleItemLabel'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_SmallGrid: UnicodeString;
begin
  Result := ChildNodes['SmallGrid'].Text;
end;

procedure TXMLPivotTableType_x.Set_SmallGrid(Value: UnicodeString);
begin
  ChildNodes['SmallGrid'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_TableStyle: UnicodeString;
begin
  Result := ChildNodes['TableStyle'].Text;
end;

procedure TXMLPivotTableType_x.Set_TableStyle(Value: UnicodeString);
begin
  ChildNodes['TableStyle'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_Tag: UnicodeString;
begin
  Result := ChildNodes['Tag'].Text;
end;

procedure TXMLPivotTableType_x.Set_Tag(Value: UnicodeString);
begin
  ChildNodes['Tag'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_VacatedStyle: UnicodeString;
begin
  Result := ChildNodes['VacatedStyle'].Text;
end;

procedure TXMLPivotTableType_x.Set_VacatedStyle(Value: UnicodeString);
begin
  ChildNodes['VacatedStyle'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_HideTotalsAnnotation: UnicodeString;
begin
  Result := ChildNodes['HideTotalsAnnotation'].Text;
end;

procedure TXMLPivotTableType_x.Set_HideTotalsAnnotation(Value: UnicodeString);
begin
  ChildNodes['HideTotalsAnnotation'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_ShowCellBackgroundFromOLAP: UnicodeString;
begin
  Result := ChildNodes['ShowCellBackgroundFromOLAP'].Text;
end;

procedure TXMLPivotTableType_x.Set_ShowCellBackgroundFromOLAP(Value: UnicodeString);
begin
  ChildNodes['ShowCellBackgroundFromOLAP'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_HideDropDowns: UnicodeString;
begin
  Result := ChildNodes['HideDropDowns'].Text;
end;

procedure TXMLPivotTableType_x.Set_HideDropDowns(Value: UnicodeString);
begin
  ChildNodes['HideDropDowns'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_NoViewCalculatedMembers: UnicodeString;
begin
  Result := ChildNodes['NoViewCalculatedMembers'].Text;
end;

procedure TXMLPivotTableType_x.Set_NoViewCalculatedMembers(Value: UnicodeString);
begin
  ChildNodes['NoViewCalculatedMembers'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_VisualTotals: UnicodeString;
begin
  Result := ChildNodes['VisualTotals'].Text;
end;

procedure TXMLPivotTableType_x.Set_VisualTotals(Value: UnicodeString);
begin
  ChildNodes['VisualTotals'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_Location: UnicodeString;
begin
  Result := ChildNodes['Location'].Text;
end;

procedure TXMLPivotTableType_x.Set_Location(Value: UnicodeString);
begin
  ChildNodes['Location'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_PLPivotField: IXMLPLPivotFieldType_xList;
begin
  Result := FPLPivotField;
end;

function TXMLPivotTableType_x.Get_PLTotal: IXMLPLTotalType_xList;
begin
  Result := FPLTotal;
end;

function TXMLPivotTableType_x.Get_DataMember: UnicodeString;
begin
  Result := ChildNodes['DataMember'].Text;
end;

procedure TXMLPivotTableType_x.Set_DataMember(Value: UnicodeString);
begin
  ChildNodes['DataMember'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_DataAxisEmpty: UnicodeString;
begin
  Result := ChildNodes['DataAxisEmpty'].Text;
end;

procedure TXMLPivotTableType_x.Set_DataAxisEmpty(Value: UnicodeString);
begin
  ChildNodes['DataAxisEmpty'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_DisplayFieldList: UnicodeString;
begin
  Result := ChildNodes['DisplayFieldList'].Text;
end;

procedure TXMLPivotTableType_x.Set_DisplayFieldList(Value: UnicodeString);
begin
  ChildNodes['DisplayFieldList'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_NoAutoFit: UnicodeString;
begin
  Result := ChildNodes['NoAutoFit'].Text;
end;

procedure TXMLPivotTableType_x.Set_NoAutoFit(Value: UnicodeString);
begin
  ChildNodes['NoAutoFit'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_Height: Double;
begin
  Result := ChildNodes['Height'].NodeValue;
end;

procedure TXMLPivotTableType_x.Set_Height(Value: Double);
begin
  ChildNodes['Height'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_Width: Double;
begin
  Result := ChildNodes['Width'].NodeValue;
end;

procedure TXMLPivotTableType_x.Set_Width(Value: Double);
begin
  ChildNodes['Width'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_MaxHeight: Double;
begin
  Result := ChildNodes['MaxHeight'].NodeValue;
end;

procedure TXMLPivotTableType_x.Set_MaxHeight(Value: Double);
begin
  ChildNodes['MaxHeight'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_MaxWidth: Double;
begin
  Result := ChildNodes['MaxWidth'].NodeValue;
end;

procedure TXMLPivotTableType_x.Set_MaxWidth(Value: Double);
begin
  ChildNodes['MaxWidth'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_MemberExpand: UnicodeString;
begin
  Result := ChildNodes['MemberExpand'].Text;
end;

procedure TXMLPivotTableType_x.Set_MemberExpand(Value: UnicodeString);
begin
  ChildNodes['MemberExpand'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_ConnectionString: UnicodeString;
begin
  Result := ChildNodes['ConnectionString'].Text;
end;

procedure TXMLPivotTableType_x.Set_ConnectionString(Value: UnicodeString);
begin
  ChildNodes['ConnectionString'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_CacheDetails: UnicodeString;
begin
  Result := ChildNodes['CacheDetails'].Text;
end;

procedure TXMLPivotTableType_x.Set_CacheDetails(Value: UnicodeString);
begin
  ChildNodes['CacheDetails'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_FieldListTop: Integer;
begin
  Result := ChildNodes['FieldListTop'].NodeValue;
end;

procedure TXMLPivotTableType_x.Set_FieldListTop(Value: Integer);
begin
  ChildNodes['FieldListTop'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_FieldListBottom: Integer;
begin
  Result := ChildNodes['FieldListBottom'].NodeValue;
end;

procedure TXMLPivotTableType_x.Set_FieldListBottom(Value: Integer);
begin
  ChildNodes['FieldListBottom'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_FieldListRight: Integer;
begin
  Result := ChildNodes['FieldListRight'].NodeValue;
end;

procedure TXMLPivotTableType_x.Set_FieldListRight(Value: Integer);
begin
  ChildNodes['FieldListRight'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_FieldListLeft: Integer;
begin
  Result := ChildNodes['FieldListLeft'].NodeValue;
end;

procedure TXMLPivotTableType_x.Set_FieldListLeft(Value: Integer);
begin
  ChildNodes['FieldListLeft'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_PivotAxis: IXMLPivotAxisType_xList;
begin
  Result := FPivotAxis;
end;

function TXMLPivotTableType_x.Get_VersionUpdateableMin: UnicodeString;
begin
  Result := ChildNodes['VersionUpdateableMin'].Text;
end;

procedure TXMLPivotTableType_x.Set_VersionUpdateableMin(Value: UnicodeString);
begin
  ChildNodes['VersionUpdateableMin'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_VersionLastUpdate: UnicodeString;
begin
  Result := ChildNodes['VersionLastUpdate'].Text;
end;

procedure TXMLPivotTableType_x.Set_VersionLastUpdate(Value: UnicodeString);
begin
  ChildNodes['VersionLastUpdate'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_VersionRefreshableMin: UnicodeString;
begin
  Result := ChildNodes['VersionRefreshableMin'].Text;
end;

procedure TXMLPivotTableType_x.Set_VersionRefreshableMin(Value: UnicodeString);
begin
  ChildNodes['VersionRefreshableMin'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_DefaultVersion: UnicodeString;
begin
  Result := ChildNodes['DefaultVersion'].Text;
end;

procedure TXMLPivotTableType_x.Set_DefaultVersion(Value: UnicodeString);
begin
  ChildNodes['DefaultVersion'].NodeValue := Value;
end;

function TXMLPivotTableType_x.Get_PivotField: IXMLPivotFieldType_xList;
begin
  Result := FPivotField;
end;

function TXMLPivotTableType_x.Get_CubeField: IXMLCubeFieldType_xList;
begin
  Result := FCubeField;
end;

function TXMLPivotTableType_x.Get_CalculatedMember: IXMLCalculatedMember_x;
begin
  Result := ChildNodes['CalculatedMember'] as IXMLCalculatedMember_x;
end;

function TXMLPivotTableType_x.Get_PTLineItems: IXMLPTLineItemsType_xList;
begin
  Result := FPTLineItems;
end;

function TXMLPivotTableType_x.Get_PTSource: IXMLPTSourceType_x;
begin
  Result := ChildNodes['PTSource'] as IXMLPTSourceType_x;
end;

function TXMLPivotTableType_x.Get_PTFormula: IXMLPTFormulaType_xList;
begin
  Result := FPTFormula;
end;

function TXMLPivotTableType_x.Get_PTFormat: IXMLPTFormatType_xList;
begin
  Result := FPTFormat;
end;

{ TXMLPivotTableType_xList }

function TXMLPivotTableType_xList.Add: IXMLPivotTableType_x;
begin
  Result := AddItem(-1) as IXMLPivotTableType_x;
end;

function TXMLPivotTableType_xList.Insert(const Index: Integer): IXMLPivotTableType_x;
begin
  Result := AddItem(Index) as IXMLPivotTableType_x;
end;

function TXMLPivotTableType_xList.Get_Item(Index: Integer): IXMLPivotTableType_x;
begin
  Result := List[Index] as IXMLPivotTableType_x;
end;

{ TXMLQTSourceType_x }

procedure TXMLQTSourceType_x.AfterConstruction;
begin
  RegisterChildNode('CacheFile', TXMLCacheFile_x);
  RegisterChildNode('QuerySource', TXMLQTQuerySourceType_x);
  inherited;
end;

function TXMLQTSourceType_x.Get_DataMember: UnicodeString;
begin
  Result := ChildNodes['DataMember'].Text;
end;

procedure TXMLQTSourceType_x.Set_DataMember(Value: UnicodeString);
begin
  ChildNodes['DataMember'].NodeValue := Value;
end;

function TXMLQTSourceType_x.Get_CacheFile: IXMLCacheFile_x;
begin
  Result := ChildNodes['CacheFile'] as IXMLCacheFile_x;
end;

function TXMLQTSourceType_x.Get_QuerySource: IXMLQTQuerySourceType_x;
begin
  Result := ChildNodes['QuerySource'] as IXMLQTQuerySourceType_x;
end;

function TXMLQTSourceType_x.Get_CacheIndex: Integer;
begin
  Result := ChildNodes['CacheIndex'].NodeValue;
end;

procedure TXMLQTSourceType_x.Set_CacheIndex(Value: Integer);
begin
  ChildNodes['CacheIndex'].NodeValue := Value;
end;

{ TXMLCacheFile_x }

function TXMLCacheFile_x.Get_Href: UnicodeString;
begin
  Result := AttributeNodes['Href'].Text;
end;

procedure TXMLCacheFile_x.Set_Href(Value: UnicodeString);
begin
  SetAttribute('Href', Value);
end;

{ TXMLQTQuerySourceType_x }

procedure TXMLQTQuerySourceType_x.AfterConstruction;
begin
  RegisterChildNode('EditWebPage', TXMLEditWebPage_x);
  RegisterChildNode('URLString', TXMLURLString_x);
  RegisterChildNode('RefreshInfo', TXMLRefreshInfoType_x);
  RegisterChildNode('TextWizardSettings', TXMLTextWizardSettingsType_x);
  RegisterChildNode('HTMLTables', TXMLHTMLTablesType_x);
  RegisterChildNode('Parameter', TXMLParameterTypeE_x);
  FCommandText := CreateCollection(TXMLString_List, IXMLNode, 'CommandText') as IXMLString_List;
  FConnection := CreateCollection(TXMLString_List, IXMLNode, 'Connection') as IXMLString_List;
  FSourceDataFile := CreateCollection(TXMLString_List, IXMLNode, 'SourceDataFile') as IXMLString_List;
  FParameter := CreateCollection(TXMLParameterTypeE_xList, IXMLParameterTypeE_x, 'Parameter') as IXMLParameterTypeE_xList;
  inherited;
end;

function TXMLQTQuerySourceType_x.Get_QueryType: UnicodeString;
begin
  Result := ChildNodes['QueryType'].Text;
end;

procedure TXMLQTQuerySourceType_x.Set_QueryType(Value: UnicodeString);
begin
  ChildNodes['QueryType'].NodeValue := Value;
end;

function TXMLQTQuerySourceType_x.Get_CommandText: IXMLString_List;
begin
  Result := FCommandText;
end;

function TXMLQTQuerySourceType_x.Get_CommandType: UnicodeString;
begin
  Result := ChildNodes['CommandType'].Text;
end;

procedure TXMLQTQuerySourceType_x.Set_CommandType(Value: UnicodeString);
begin
  ChildNodes['CommandType'].NodeValue := Value;
end;

function TXMLQTQuerySourceType_x.Get_Maintain: UnicodeString;
begin
  Result := ChildNodes['Maintain'].Text;
end;

procedure TXMLQTQuerySourceType_x.Set_Maintain(Value: UnicodeString);
begin
  ChildNodes['Maintain'].NodeValue := Value;
end;

function TXMLQTQuerySourceType_x.Get_Connection: IXMLString_List;
begin
  Result := FConnection;
end;

function TXMLQTQuerySourceType_x.Get_DoNotJoinDelimiters: UnicodeString;
begin
  Result := ChildNodes['DoNotJoinDelimiters'].Text;
end;

procedure TXMLQTQuerySourceType_x.Set_DoNotJoinDelimiters(Value: UnicodeString);
begin
  ChildNodes['DoNotJoinDelimiters'].NodeValue := Value;
end;

function TXMLQTQuerySourceType_x.Get_NoTextToColumns: UnicodeString;
begin
  Result := ChildNodes['NoTextToColumns'].Text;
end;

procedure TXMLQTQuerySourceType_x.Set_NoTextToColumns(Value: UnicodeString);
begin
  ChildNodes['NoTextToColumns'].NodeValue := Value;
end;

function TXMLQTQuerySourceType_x.Get_DisableDateRecognition: UnicodeString;
begin
  Result := ChildNodes['DisableDateRecognition'].Text;
end;

procedure TXMLQTQuerySourceType_x.Set_DisableDateRecognition(Value: UnicodeString);
begin
  ChildNodes['DisableDateRecognition'].NodeValue := Value;
end;

function TXMLQTQuerySourceType_x.Get_EnableRedirections: UnicodeString;
begin
  Result := ChildNodes['EnableRedirections'].Text;
end;

procedure TXMLQTQuerySourceType_x.Set_EnableRedirections(Value: UnicodeString);
begin
  ChildNodes['EnableRedirections'].NodeValue := Value;
end;

function TXMLQTQuerySourceType_x.Get_EditWebPage: IXMLEditWebPage_x;
begin
  Result := ChildNodes['EditWebPage'] as IXMLEditWebPage_x;
end;

function TXMLQTQuerySourceType_x.Get_RefreshedInXl9: UnicodeString;
begin
  Result := ChildNodes['RefreshedInXl9'].Text;
end;

procedure TXMLQTQuerySourceType_x.Set_RefreshedInXl9(Value: UnicodeString);
begin
  ChildNodes['RefreshedInXl9'].NodeValue := Value;
end;

function TXMLQTQuerySourceType_x.Get_EntirePage: UnicodeString;
begin
  Result := ChildNodes['EntirePage'].Text;
end;

procedure TXMLQTQuerySourceType_x.Set_EntirePage(Value: UnicodeString);
begin
  ChildNodes['EntirePage'].NodeValue := Value;
end;

function TXMLQTQuerySourceType_x.Get_HTMLFormat: UnicodeString;
begin
  Result := ChildNodes['HTMLFormat'].Text;
end;

procedure TXMLQTQuerySourceType_x.Set_HTMLFormat(Value: UnicodeString);
begin
  ChildNodes['HTMLFormat'].NodeValue := Value;
end;

function TXMLQTQuerySourceType_x.Get_URLString: IXMLURLString_x;
begin
  Result := ChildNodes['URLString'] as IXMLURLString_x;
end;

function TXMLQTQuerySourceType_x.Get_WebPostString: UnicodeString;
begin
  Result := ChildNodes['WebPostString'].Text;
end;

procedure TXMLQTQuerySourceType_x.Set_WebPostString(Value: UnicodeString);
begin
  ChildNodes['WebPostString'].NodeValue := Value;
end;

function TXMLQTQuerySourceType_x.Get_RefreshInfo: IXMLRefreshInfoType_x;
begin
  Result := ChildNodes['RefreshInfo'] as IXMLRefreshInfoType_x;
end;

function TXMLQTQuerySourceType_x.Get_TextWizardSettings: IXMLTextWizardSettingsType_x;
begin
  Result := ChildNodes['TextWizardSettings'] as IXMLTextWizardSettingsType_x;
end;

function TXMLQTQuerySourceType_x.Get_HTMLTables: IXMLHTMLTablesType_x;
begin
  Result := ChildNodes['HTMLTables'] as IXMLHTMLTablesType_x;
end;

function TXMLQTQuerySourceType_x.Get_UseSameSettings: UnicodeString;
begin
  Result := ChildNodes['UseSameSettings'].Text;
end;

procedure TXMLQTQuerySourceType_x.Set_UseSameSettings(Value: UnicodeString);
begin
  ChildNodes['UseSameSettings'].NodeValue := Value;
end;

function TXMLQTQuerySourceType_x.Get_Query97: UnicodeString;
begin
  Result := ChildNodes['Query97'].Text;
end;

procedure TXMLQTQuerySourceType_x.Set_Query97(Value: UnicodeString);
begin
  ChildNodes['Query97'].NodeValue := Value;
end;

function TXMLQTQuerySourceType_x.Get_DoNotPromptForFile: UnicodeString;
begin
  Result := ChildNodes['DoNotPromptForFile'].Text;
end;

procedure TXMLQTQuerySourceType_x.Set_DoNotPromptForFile(Value: UnicodeString);
begin
  ChildNodes['DoNotPromptForFile'].NodeValue := Value;
end;

function TXMLQTQuerySourceType_x.Get_LocalConnection: UnicodeString;
begin
  Result := ChildNodes['LocalConnection'].Text;
end;

procedure TXMLQTQuerySourceType_x.Set_LocalConnection(Value: UnicodeString);
begin
  ChildNodes['LocalConnection'].NodeValue := Value;
end;

function TXMLQTQuerySourceType_x.Get_SourceConnectionFile: UnicodeString;
begin
  Result := ChildNodes['SourceConnectionFile'].Text;
end;

procedure TXMLQTQuerySourceType_x.Set_SourceConnectionFile(Value: UnicodeString);
begin
  ChildNodes['SourceConnectionFile'].NodeValue := Value;
end;

function TXMLQTQuerySourceType_x.Get_SourceDataFile: IXMLString_List;
begin
  Result := FSourceDataFile;
end;

function TXMLQTQuerySourceType_x.Get_RobustConnect: UnicodeString;
begin
  Result := ChildNodes['RobustConnect'].Text;
end;

procedure TXMLQTQuerySourceType_x.Set_RobustConnect(Value: UnicodeString);
begin
  ChildNodes['RobustConnect'].NodeValue := Value;
end;

function TXMLQTQuerySourceType_x.Get_RefreshTimeSpan: Integer;
begin
  Result := ChildNodes['RefreshTimeSpan'].NodeValue;
end;

procedure TXMLQTQuerySourceType_x.Set_RefreshTimeSpan(Value: Integer);
begin
  ChildNodes['RefreshTimeSpan'].NodeValue := Value;
end;

function TXMLQTQuerySourceType_x.Get_VersionLastEdit: Integer;
begin
  Result := ChildNodes['VersionLastEdit'].NodeValue;
end;

procedure TXMLQTQuerySourceType_x.Set_VersionLastEdit(Value: Integer);
begin
  ChildNodes['VersionLastEdit'].NodeValue := Value;
end;

function TXMLQTQuerySourceType_x.Get_VersionLastRefresh: Integer;
begin
  Result := ChildNodes['VersionLastRefresh'].NodeValue;
end;

procedure TXMLQTQuerySourceType_x.Set_VersionLastRefresh(Value: Integer);
begin
  ChildNodes['VersionLastRefresh'].NodeValue := Value;
end;

function TXMLQTQuerySourceType_x.Get_VersionRefreshableMin: Integer;
begin
  Result := ChildNodes['VersionRefreshableMin'].NodeValue;
end;

procedure TXMLQTQuerySourceType_x.Set_VersionRefreshableMin(Value: Integer);
begin
  ChildNodes['VersionRefreshableMin'].NodeValue := Value;
end;

function TXMLQTQuerySourceType_x.Get_Parameter: IXMLParameterTypeE_xList;
begin
  Result := FParameter;
end;

{ TXMLEditWebPage_x }

function TXMLEditWebPage_x.Get_HRef: UnicodeString;
begin
  Result := AttributeNodes['HRef'].Text;
end;

procedure TXMLEditWebPage_x.Set_HRef(Value: UnicodeString);
begin
  SetAttribute('HRef', Value);
end;

{ TXMLURLString_x }

function TXMLURLString_x.Get_HRef: UnicodeString;
begin
  Result := AttributeNodes['HRef'].Text;
end;

procedure TXMLURLString_x.Set_HRef(Value: UnicodeString);
begin
  SetAttribute('HRef', Value);
end;

{ TXMLRefreshInfoType_x }

procedure TXMLRefreshInfoType_x.AfterConstruction;
begin
  RegisterChildNode('ColumnInfo', TXMLColumnInfoType_x);
  FColumnInfo := CreateCollection(TXMLColumnInfoType_xList, IXMLColumnInfoType_x, 'ColumnInfo') as IXMLColumnInfoType_xList;
  FDeletedTitle := CreateCollection(TXMLString_List, IXMLNode, 'DeletedTitle') as IXMLString_List;
  inherited;
end;

function TXMLRefreshInfoType_x.Get_NextId: Integer;
begin
  Result := ChildNodes['NextId'].NodeValue;
end;

procedure TXMLRefreshInfoType_x.Set_NextId(Value: Integer);
begin
  ChildNodes['NextId'].NodeValue := Value;
end;

function TXMLRefreshInfoType_x.Get_ColumnInfo: IXMLColumnInfoType_xList;
begin
  Result := FColumnInfo;
end;

function TXMLRefreshInfoType_x.Get_DoNotPersist: UnicodeString;
begin
  Result := ChildNodes['DoNotPersist'].Text;
end;

procedure TXMLRefreshInfoType_x.Set_DoNotPersist(Value: UnicodeString);
begin
  ChildNodes['DoNotPersist'].NodeValue := Value;
end;

function TXMLRefreshInfoType_x.Get_DoNotPersistSort: UnicodeString;
begin
  Result := ChildNodes['DoNotPersistSort'].Text;
end;

procedure TXMLRefreshInfoType_x.Set_DoNotPersistSort(Value: UnicodeString);
begin
  ChildNodes['DoNotPersistSort'].NodeValue := Value;
end;

function TXMLRefreshInfoType_x.Get_DoNotPersstAF: UnicodeString;
begin
  Result := ChildNodes['DoNotPersstAF'].Text;
end;

procedure TXMLRefreshInfoType_x.Set_DoNotPersstAF(Value: UnicodeString);
begin
  ChildNodes['DoNotPersstAF'].NodeValue := Value;
end;

function TXMLRefreshInfoType_x.Get_Sort: UnicodeString;
begin
  Result := ChildNodes['Sort'].Text;
end;

procedure TXMLRefreshInfoType_x.Set_Sort(Value: UnicodeString);
begin
  ChildNodes['Sort'].NodeValue := Value;
end;

function TXMLRefreshInfoType_x.Get_CaseSensitive: UnicodeString;
begin
  Result := ChildNodes['CaseSensitive'].Text;
end;

procedure TXMLRefreshInfoType_x.Set_CaseSensitive(Value: UnicodeString);
begin
  ChildNodes['CaseSensitive'].NodeValue := Value;
end;

function TXMLRefreshInfoType_x.Get_FuturePersist: UnicodeString;
begin
  Result := ChildNodes['FuturePersist'].Text;
end;

procedure TXMLRefreshInfoType_x.Set_FuturePersist(Value: UnicodeString);
begin
  ChildNodes['FuturePersist'].NodeValue := Value;
end;

function TXMLRefreshInfoType_x.Get_HeaderRow: UnicodeString;
begin
  Result := ChildNodes['HeaderRow'].Text;
end;

procedure TXMLRefreshInfoType_x.Set_HeaderRow(Value: UnicodeString);
begin
  ChildNodes['HeaderRow'].NodeValue := Value;
end;

function TXMLRefreshInfoType_x.Get_IdWrapped: UnicodeString;
begin
  Result := ChildNodes['IdWrapped'].Text;
end;

procedure TXMLRefreshInfoType_x.Set_IdWrapped(Value: UnicodeString);
begin
  ChildNodes['IdWrapped'].NodeValue := Value;
end;

function TXMLRefreshInfoType_x.Get_NoTitles: UnicodeString;
begin
  Result := ChildNodes['NoTitles'].Text;
end;

procedure TXMLRefreshInfoType_x.Set_NoTitles(Value: UnicodeString);
begin
  ChildNodes['NoTitles'].NodeValue := Value;
end;

function TXMLRefreshInfoType_x.Get_AlertVersion: Integer;
begin
  Result := ChildNodes['AlertVersion'].NodeValue;
end;

procedure TXMLRefreshInfoType_x.Set_AlertVersion(Value: Integer);
begin
  ChildNodes['AlertVersion'].NodeValue := Value;
end;

function TXMLRefreshInfoType_x.Get_SortOrder: Integer;
begin
  Result := ChildNodes['SortOrder'].NodeValue;
end;

procedure TXMLRefreshInfoType_x.Set_SortOrder(Value: Integer);
begin
  ChildNodes['SortOrder'].NodeValue := Value;
end;

function TXMLRefreshInfoType_x.Get_ExtraLeftColumns: Integer;
begin
  Result := ChildNodes['ExtraLeftColumns'].NodeValue;
end;

procedure TXMLRefreshInfoType_x.Set_ExtraLeftColumns(Value: Integer);
begin
  ChildNodes['ExtraLeftColumns'].NodeValue := Value;
end;

function TXMLRefreshInfoType_x.Get_ExtraRightColumns: Integer;
begin
  Result := ChildNodes['ExtraRightColumns'].NodeValue;
end;

procedure TXMLRefreshInfoType_x.Set_ExtraRightColumns(Value: Integer);
begin
  ChildNodes['ExtraRightColumns'].NodeValue := Value;
end;

function TXMLRefreshInfoType_x.Get_DeletedTitle: IXMLString_List;
begin
  Result := FDeletedTitle;
end;

{ TXMLColumnInfoType_x }

procedure TXMLColumnInfoType_x.AfterConstruction;
begin
  RegisterChildNode('Name', TXMLName_x);
  inherited;
end;

function TXMLColumnInfoType_x.Get_Id: Int64;
begin
  Result := ChildNodes['Id'].NodeValue;
end;

procedure TXMLColumnInfoType_x.Set_Id(Value: Int64);
begin
  ChildNodes['Id'].NodeValue := Value;
end;

function TXMLColumnInfoType_x.Get_Clipped: UnicodeString;
begin
  Result := ChildNodes['Clipped'].Text;
end;

procedure TXMLColumnInfoType_x.Set_Clipped(Value: UnicodeString);
begin
  ChildNodes['Clipped'].NodeValue := Value;
end;

function TXMLColumnInfoType_x.Get_Descending: UnicodeString;
begin
  Result := ChildNodes['Descending'].Text;
end;

procedure TXMLColumnInfoType_x.Set_Descending(Value: UnicodeString);
begin
  ChildNodes['Descending'].NodeValue := Value;
end;

function TXMLColumnInfoType_x.Get_FillDown: UnicodeString;
begin
  Result := ChildNodes['FillDown'].Text;
end;

procedure TXMLColumnInfoType_x.Set_FillDown(Value: UnicodeString);
begin
  ChildNodes['FillDown'].NodeValue := Value;
end;

function TXMLColumnInfoType_x.Get_Name: IXMLName_x;
begin
  Result := ChildNodes['Name'] as IXMLName_x;
end;

function TXMLColumnInfoType_x.Get_RowNumbers: UnicodeString;
begin
  Result := ChildNodes['RowNumbers'].Text;
end;

procedure TXMLColumnInfoType_x.Set_RowNumbers(Value: UnicodeString);
begin
  ChildNodes['RowNumbers'].NodeValue := Value;
end;

function TXMLColumnInfoType_x.Get_SortKey: Integer;
begin
  Result := ChildNodes['SortKey'].NodeValue;
end;

procedure TXMLColumnInfoType_x.Set_SortKey(Value: Integer);
begin
  ChildNodes['SortKey'].NodeValue := Value;
end;

function TXMLColumnInfoType_x.Get_User: UnicodeString;
begin
  Result := ChildNodes['User'].Text;
end;

procedure TXMLColumnInfoType_x.Set_User(Value: UnicodeString);
begin
  ChildNodes['User'].NodeValue := Value;
end;

{ TXMLColumnInfoType_xList }

function TXMLColumnInfoType_xList.Add: IXMLColumnInfoType_x;
begin
  Result := AddItem(-1) as IXMLColumnInfoType_x;
end;

function TXMLColumnInfoType_xList.Insert(const Index: Integer): IXMLColumnInfoType_x;
begin
  Result := AddItem(Index) as IXMLColumnInfoType_x;
end;

function TXMLColumnInfoType_xList.Get_Item(Index: Integer): IXMLColumnInfoType_x;
begin
  Result := List[Index] as IXMLColumnInfoType_x;
end;

{ TXMLName_x }

function TXMLName_x.Get_Href: UnicodeString;
begin
  Result := AttributeNodes['Href'].Text;
end;

procedure TXMLName_x.Set_Href(Value: UnicodeString);
begin
  SetAttribute('Href', Value);
end;

{ TXMLTextWizardSettingsType_x }

procedure TXMLTextWizardSettingsType_x.AfterConstruction;
begin
  RegisterChildNode('FormatSettings', TXMLFormatSettingsType_x);
  RegisterChildNode('Delimiters', TXMLDelimiters_x);
  inherited;
end;

function TXMLTextWizardSettingsType_x.Get_FormatSettings: IXMLFormatSettingsType_x;
begin
  Result := ChildNodes['FormatSettings'] as IXMLFormatSettingsType_x;
end;

function TXMLTextWizardSettingsType_x.Get_Delimiters: IXMLDelimiters_x;
begin
  Result := ChildNodes['Delimiters'] as IXMLDelimiters_x;
end;

function TXMLTextWizardSettingsType_x.Get_Name: UnicodeString;
begin
  Result := ChildNodes['Name'].Text;
end;

procedure TXMLTextWizardSettingsType_x.Set_Name(Value: UnicodeString);
begin
  ChildNodes['Name'].NodeValue := Value;
end;

function TXMLTextWizardSettingsType_x.Get_Source: UnicodeString;
begin
  Result := ChildNodes['Source'].Text;
end;

procedure TXMLTextWizardSettingsType_x.Set_Source(Value: UnicodeString);
begin
  ChildNodes['Source'].NodeValue := Value;
end;

function TXMLTextWizardSettingsType_x.Get_StartRow: Integer;
begin
  Result := ChildNodes['StartRow'].NodeValue;
end;

procedure TXMLTextWizardSettingsType_x.Set_StartRow(Value: Integer);
begin
  ChildNodes['StartRow'].NodeValue := Value;
end;

function TXMLTextWizardSettingsType_x.Get_Decimal: UnicodeString;
begin
  Result := ChildNodes['Decimal'].Text;
end;

procedure TXMLTextWizardSettingsType_x.Set_Decimal(Value: UnicodeString);
begin
  ChildNodes['Decimal'].NodeValue := Value;
end;

function TXMLTextWizardSettingsType_x.Get_ThousandSeparator: UnicodeString;
begin
  Result := ChildNodes['ThousandSeparator'].Text;
end;

procedure TXMLTextWizardSettingsType_x.Set_ThousandSeparator(Value: UnicodeString);
begin
  ChildNodes['ThousandSeparator'].NodeValue := Value;
end;

{ TXMLFormatSettingsType_x }

function TXMLFormatSettingsType_x.Get_FieldType: UnicodeString;
begin
  Result := ChildNodes['FieldType'].Text;
end;

procedure TXMLFormatSettingsType_x.Set_FieldType(Value: UnicodeString);
begin
  ChildNodes['FieldType'].NodeValue := Value;
end;

function TXMLFormatSettingsType_x.Get_FieldStart: Integer;
begin
  Result := ChildNodes['FieldStart'].NodeValue;
end;

procedure TXMLFormatSettingsType_x.Set_FieldStart(Value: Integer);
begin
  ChildNodes['FieldStart'].NodeValue := Value;
end;

{ TXMLDelimiters_x }

function TXMLDelimiters_x.Get_Comma: UnicodeString;
begin
  Result := ChildNodes['Comma'].Text;
end;

procedure TXMLDelimiters_x.Set_Comma(Value: UnicodeString);
begin
  ChildNodes['Comma'].NodeValue := Value;
end;

function TXMLDelimiters_x.Get_Consecutive: UnicodeString;
begin
  Result := ChildNodes['Consecutive'].Text;
end;

procedure TXMLDelimiters_x.Set_Consecutive(Value: UnicodeString);
begin
  ChildNodes['Consecutive'].NodeValue := Value;
end;

function TXMLDelimiters_x.Get_Custom: UnicodeString;
begin
  Result := ChildNodes['Custom'].Text;
end;

procedure TXMLDelimiters_x.Set_Custom(Value: UnicodeString);
begin
  ChildNodes['Custom'].NodeValue := Value;
end;

function TXMLDelimiters_x.Get_SemiColon: UnicodeString;
begin
  Result := ChildNodes['SemiColon'].Text;
end;

procedure TXMLDelimiters_x.Set_SemiColon(Value: UnicodeString);
begin
  ChildNodes['SemiColon'].NodeValue := Value;
end;

function TXMLDelimiters_x.Get_Space: UnicodeString;
begin
  Result := ChildNodes['Space'].Text;
end;

procedure TXMLDelimiters_x.Set_Space(Value: UnicodeString);
begin
  ChildNodes['Space'].NodeValue := Value;
end;

function TXMLDelimiters_x.Get_Tab: UnicodeString;
begin
  Result := ChildNodes['Tab'].Text;
end;

procedure TXMLDelimiters_x.Set_Tab(Value: UnicodeString);
begin
  ChildNodes['Tab'].NodeValue := Value;
end;

function TXMLDelimiters_x.Get_TextQualifier: UnicodeString;
begin
  Result := ChildNodes['TextQualifier'].Text;
end;

procedure TXMLDelimiters_x.Set_TextQualifier(Value: UnicodeString);
begin
  ChildNodes['TextQualifier'].NodeValue := Value;
end;

{ TXMLHTMLTablesType_x }

procedure TXMLHTMLTablesType_x.AfterConstruction;
begin
  FNumber := CreateCollection(TXMLIntegerList, IXMLNode, 'Number') as IXMLIntegerList;
  FText := CreateCollection(TXMLString_List, IXMLNode, 'Text') as IXMLString_List;
  FMissing := CreateCollection(TXMLString_List, IXMLNode, 'Missing') as IXMLString_List;
  inherited;
end;

function TXMLHTMLTablesType_x.Get_Number: IXMLIntegerList;
begin
  Result := FNumber;
end;

function TXMLHTMLTablesType_x.Get_Text: IXMLString_List;
begin
  Result := FText;
end;

function TXMLHTMLTablesType_x.Get_Missing: IXMLString_List;
begin
  Result := FMissing;
end;

{ TXMLParameterTypeE_x }

function TXMLParameterTypeE_x.Get_ExcelType: UnicodeString;
begin
  Result := ChildNodes['ExcelType'].Text;
end;

procedure TXMLParameterTypeE_x.Set_ExcelType(Value: UnicodeString);
begin
  ChildNodes['ExcelType'].NodeValue := Value;
end;

function TXMLParameterTypeE_x.Get_Formula: UnicodeString;
begin
  Result := ChildNodes['Formula'].Text;
end;

procedure TXMLParameterTypeE_x.Set_Formula(Value: UnicodeString);
begin
  ChildNodes['Formula'].NodeValue := Value;
end;

function TXMLParameterTypeE_x.Get_Name: UnicodeString;
begin
  Result := ChildNodes['Name'].Text;
end;

procedure TXMLParameterTypeE_x.Set_Name(Value: UnicodeString);
begin
  ChildNodes['Name'].NodeValue := Value;
end;

function TXMLParameterTypeE_x.Get_ParameterType: UnicodeString;
begin
  Result := ChildNodes['ParameterType'].Text;
end;

procedure TXMLParameterTypeE_x.Set_ParameterType(Value: UnicodeString);
begin
  ChildNodes['ParameterType'].NodeValue := Value;
end;

function TXMLParameterTypeE_x.Get_ParameterValue: UnicodeString;
begin
  Result := ChildNodes['ParameterValue'].Text;
end;

procedure TXMLParameterTypeE_x.Set_ParameterValue(Value: UnicodeString);
begin
  ChildNodes['ParameterValue'].NodeValue := Value;
end;

function TXMLParameterTypeE_x.Get_PromptString: UnicodeString;
begin
  Result := ChildNodes['PromptString'].Text;
end;

procedure TXMLParameterTypeE_x.Set_PromptString(Value: UnicodeString);
begin
  ChildNodes['PromptString'].NodeValue := Value;
end;

function TXMLParameterTypeE_x.Get_NonDefaultName: UnicodeString;
begin
  Result := ChildNodes['NonDefaultName'].Text;
end;

procedure TXMLParameterTypeE_x.Set_NonDefaultName(Value: UnicodeString);
begin
  ChildNodes['NonDefaultName'].NodeValue := Value;
end;

function TXMLParameterTypeE_x.Get_SQLType: UnicodeString;
begin
  Result := ChildNodes['SQLType'].Text;
end;

procedure TXMLParameterTypeE_x.Set_SQLType(Value: UnicodeString);
begin
  ChildNodes['SQLType'].NodeValue := Value;
end;

function TXMLParameterTypeE_x.Get_RefreshOnChange: UnicodeString;
begin
  Result := ChildNodes['RefreshOnChange'].Text;
end;

procedure TXMLParameterTypeE_x.Set_RefreshOnChange(Value: UnicodeString);
begin
  ChildNodes['RefreshOnChange'].NodeValue := Value;
end;

{ TXMLParameterTypeE_xList }

function TXMLParameterTypeE_xList.Add: IXMLParameterTypeE_x;
begin
  Result := AddItem(-1) as IXMLParameterTypeE_x;
end;

function TXMLParameterTypeE_xList.Insert(const Index: Integer): IXMLParameterTypeE_x;
begin
  Result := AddItem(Index) as IXMLParameterTypeE_x;
end;

function TXMLParameterTypeE_xList.Get_Item(Index: Integer): IXMLParameterTypeE_x;
begin
  Result := List[Index] as IXMLParameterTypeE_x;
end;

{ TXMLPivotViewType_x }

procedure TXMLPivotViewType_x.AfterConstruction;
begin
  RegisterChildNode('TotalFormat', TXMLTotalFormat_x);
  RegisterChildNode('MemberFormat', TXMLMemberFormat_x);
  RegisterChildNode('FieldLabelFormat', TXMLFieldLabelFormat_x);
  RegisterChildNode('Label', TXMLLabel__x);
  FDetailSortOrder := CreateCollection(TXMLString_List, IXMLNode, 'DetailSortOrder') as IXMLString_List;
  FLabel_ := CreateCollection(TXMLLabel__xList, IXMLLabel__x, 'Label') as IXMLLabel__xList;
  inherited;
end;

function TXMLPivotViewType_x.Get_IsNotFiltered: UnicodeString;
begin
  Result := ChildNodes['IsNotFiltered'].Text;
end;

procedure TXMLPivotViewType_x.Set_IsNotFiltered(Value: UnicodeString);
begin
  ChildNodes['IsNotFiltered'].NodeValue := Value;
end;

function TXMLPivotViewType_x.Get_TotalAllMembers: UnicodeString;
begin
  Result := ChildNodes['TotalAllMembers'].Text;
end;

procedure TXMLPivotViewType_x.Set_TotalAllMembers(Value: UnicodeString);
begin
  ChildNodes['TotalAllMembers'].NodeValue := Value;
end;

function TXMLPivotViewType_x.Get_DetailMaxHeight: Integer;
begin
  Result := ChildNodes['DetailMaxHeight'].NodeValue;
end;

procedure TXMLPivotViewType_x.Set_DetailMaxHeight(Value: Integer);
begin
  ChildNodes['DetailMaxHeight'].NodeValue := Value;
end;

function TXMLPivotViewType_x.Get_DetailMaxWidth: Integer;
begin
  Result := ChildNodes['DetailMaxWidth'].NodeValue;
end;

procedure TXMLPivotViewType_x.Set_DetailMaxWidth(Value: Integer);
begin
  ChildNodes['DetailMaxWidth'].NodeValue := Value;
end;

function TXMLPivotViewType_x.Get_NoDetailAutoFit: UnicodeString;
begin
  Result := ChildNodes['NoDetailAutoFit'].Text;
end;

procedure TXMLPivotViewType_x.Set_NoDetailAutoFit(Value: UnicodeString);
begin
  ChildNodes['NoDetailAutoFit'].NodeValue := Value;
end;

function TXMLPivotViewType_x.Get_DetailRowHeight: Integer;
begin
  Result := ChildNodes['DetailRowHeight'].NodeValue;
end;

procedure TXMLPivotViewType_x.Set_DetailRowHeight(Value: Integer);
begin
  ChildNodes['DetailRowHeight'].NodeValue := Value;
end;

function TXMLPivotViewType_x.Get_DetailWidth: Integer;
begin
  Result := ChildNodes['DetailWidth'].NodeValue;
end;

procedure TXMLPivotViewType_x.Set_DetailWidth(Value: Integer);
begin
  ChildNodes['DetailWidth'].NodeValue := Value;
end;

function TXMLPivotViewType_x.Get_TotalFormat: IXMLTotalFormat_x;
begin
  Result := ChildNodes['TotalFormat'] as IXMLTotalFormat_x;
end;

function TXMLPivotViewType_x.Get_MemberFormat: IXMLMemberFormat_x;
begin
  Result := ChildNodes['MemberFormat'] as IXMLMemberFormat_x;
end;

function TXMLPivotViewType_x.Get_FieldLabelFormat: IXMLFieldLabelFormat_x;
begin
  Result := ChildNodes['FieldLabelFormat'] as IXMLFieldLabelFormat_x;
end;

function TXMLPivotViewType_x.Get_DetailSortOrder: IXMLString_List;
begin
  Result := FDetailSortOrder;
end;

function TXMLPivotViewType_x.Get_CellsExpanded: UnicodeString;
begin
  Result := ChildNodes['CellsExpanded'].Text;
end;

procedure TXMLPivotViewType_x.Set_CellsExpanded(Value: UnicodeString);
begin
  ChildNodes['CellsExpanded'].NodeValue := Value;
end;

function TXMLPivotViewType_x.Get_CellsNotExpanded: UnicodeString;
begin
  Result := ChildNodes['CellsNotExpanded'].Text;
end;

procedure TXMLPivotViewType_x.Set_CellsNotExpanded(Value: UnicodeString);
begin
  ChildNodes['CellsNotExpanded'].NodeValue := Value;
end;

function TXMLPivotViewType_x.Get_CellsExpandedSeqNum: Integer;
begin
  Result := ChildNodes['CellsExpandedSeqNum'].NodeValue;
end;

procedure TXMLPivotViewType_x.Set_CellsExpandedSeqNum(Value: Integer);
begin
  ChildNodes['CellsExpandedSeqNum'].NodeValue := Value;
end;

function TXMLPivotViewType_x.Get_Label_: IXMLLabel__xList;
begin
  Result := FLabel_;
end;

{ TXMLTotalFormat_x }

function TXMLTotalFormat_x.Get_Style: UnicodeString;
begin
  Result := AttributeNodes['Style'].Text;
end;

procedure TXMLTotalFormat_x.Set_Style(Value: UnicodeString);
begin
  SetAttribute('Style', Value);
end;

{ TXMLMemberFormat_x }

function TXMLMemberFormat_x.Get_Style: UnicodeString;
begin
  Result := AttributeNodes['Style'].Text;
end;

procedure TXMLMemberFormat_x.Set_Style(Value: UnicodeString);
begin
  SetAttribute('Style', Value);
end;

{ TXMLFieldLabelFormat_x }

function TXMLFieldLabelFormat_x.Get_Style: UnicodeString;
begin
  Result := AttributeNodes['Style'].Text;
end;

procedure TXMLFieldLabelFormat_x.Set_Style(Value: UnicodeString);
begin
  SetAttribute('Style', Value);
end;

{ TXMLLabel__x }

function TXMLLabel__x.Get_Style: UnicodeString;
begin
  Result := AttributeNodes['Style'].Text;
end;

procedure TXMLLabel__x.Set_Style(Value: UnicodeString);
begin
  SetAttribute('Style', Value);
end;

{ TXMLLabel__xList }

function TXMLLabel__xList.Add: IXMLLabel__x;
begin
  Result := AddItem(-1) as IXMLLabel__x;
end;

function TXMLLabel__xList.Insert(const Index: Integer): IXMLLabel__x;
begin
  Result := AddItem(Index) as IXMLLabel__x;
end;

function TXMLLabel__xList.Get_Item(Index: Integer): IXMLLabel__x;
begin
  Result := List[Index] as IXMLLabel__x;
end;

{ TXMLPLPivotFieldType_x }

procedure TXMLPLPivotFieldType_x.AfterConstruction;
begin
  RegisterChildNode('DetailFormat', TXMLDetailFormat_x);
  RegisterChildNode('SubtotalFormat', TXMLSubtotalFormat_x);
  RegisterChildNode('PivotItem', TXMLPivotItemType_x);
  FPivotItem := CreateCollection(TXMLPivotItemType_xList, IXMLPivotItemType_x, 'PivotItem') as IXMLPivotItemType_xList;
  inherited;
end;

function TXMLPLPivotFieldType_x.Get_Name: UnicodeString;
begin
  Result := ChildNodes['Name'].Text;
end;

procedure TXMLPLPivotFieldType_x.Set_Name(Value: UnicodeString);
begin
  ChildNodes['Name'].NodeValue := Value;
end;

function TXMLPLPivotFieldType_x.Get_SourceName: UnicodeString;
begin
  Result := ChildNodes['SourceName'].Text;
end;

procedure TXMLPLPivotFieldType_x.Set_SourceName(Value: UnicodeString);
begin
  ChildNodes['SourceName'].NodeValue := Value;
end;

function TXMLPLPivotFieldType_x.Get_BoundField: UnicodeString;
begin
  Result := ChildNodes['BoundField'].Text;
end;

procedure TXMLPLPivotFieldType_x.Set_BoundField(Value: UnicodeString);
begin
  ChildNodes['BoundField'].NodeValue := Value;
end;

function TXMLPLPivotFieldType_x.Get_DataType: UnicodeString;
begin
  Result := ChildNodes['DataType'].Text;
end;

procedure TXMLPLPivotFieldType_x.Set_DataType(Value: UnicodeString);
begin
  ChildNodes['DataType'].NodeValue := Value;
end;

function TXMLPLPivotFieldType_x.Get_FilterCaption: UnicodeString;
begin
  Result := ChildNodes['FilterCaption'].Text;
end;

procedure TXMLPLPivotFieldType_x.Set_FilterCaption(Value: UnicodeString);
begin
  ChildNodes['FilterCaption'].NodeValue := Value;
end;

function TXMLPLPivotFieldType_x.Get_PLDataOrientation: Integer;
begin
  Result := ChildNodes['PLDataOrientation'].NodeValue;
end;

procedure TXMLPLPivotFieldType_x.Set_PLDataOrientation(Value: Integer);
begin
  ChildNodes['PLDataOrientation'].NodeValue := Value;
end;

function TXMLPLPivotFieldType_x.Get_PLPosition: UnicodeString;
begin
  Result := ChildNodes['PLPosition'].Text;
end;

procedure TXMLPLPivotFieldType_x.Set_PLPosition(Value: UnicodeString);
begin
  ChildNodes['PLPosition'].NodeValue := Value;
end;

function TXMLPLPivotFieldType_x.Get_Orientation: UnicodeString;
begin
  Result := ChildNodes['Orientation'].Text;
end;

procedure TXMLPLPivotFieldType_x.Set_Orientation(Value: UnicodeString);
begin
  ChildNodes['Orientation'].NodeValue := Value;
end;

function TXMLPLPivotFieldType_x.Get_Position: UnicodeString;
begin
  Result := ChildNodes['Position'].Text;
end;

procedure TXMLPLPivotFieldType_x.Set_Position(Value: UnicodeString);
begin
  ChildNodes['Position'].NodeValue := Value;
end;

function TXMLPLPivotFieldType_x.Get_ShowAllItems: UnicodeString;
begin
  Result := ChildNodes['ShowAllItems'].Text;
end;

procedure TXMLPLPivotFieldType_x.Set_ShowAllItems(Value: UnicodeString);
begin
  ChildNodes['ShowAllItems'].NodeValue := Value;
end;

function TXMLPLPivotFieldType_x.Get_NumberFormat: UnicodeString;
begin
  Result := ChildNodes['NumberFormat'].Text;
end;

procedure TXMLPLPivotFieldType_x.Set_NumberFormat(Value: UnicodeString);
begin
  ChildNodes['NumberFormat'].NodeValue := Value;
end;

function TXMLPLPivotFieldType_x.Get_CurrentPage: UnicodeString;
begin
  Result := ChildNodes['CurrentPage'].Text;
end;

procedure TXMLPLPivotFieldType_x.Set_CurrentPage(Value: UnicodeString);
begin
  ChildNodes['CurrentPage'].NodeValue := Value;
end;

function TXMLPLPivotFieldType_x.Get_Caption: UnicodeString;
begin
  Result := ChildNodes['Caption'].Text;
end;

procedure TXMLPLPivotFieldType_x.Set_Caption(Value: UnicodeString);
begin
  ChildNodes['Caption'].NodeValue := Value;
end;

function TXMLPLPivotFieldType_x.Get_NewItemsHidden: UnicodeString;
begin
  Result := ChildNodes['NewItemsHidden'].Text;
end;

procedure TXMLPLPivotFieldType_x.Set_NewItemsHidden(Value: UnicodeString);
begin
  ChildNodes['NewItemsHidden'].NodeValue := Value;
end;

function TXMLPLPivotFieldType_x.Get_Subtotal: UnicodeString;
begin
  Result := ChildNodes['Subtotal'].Text;
end;

procedure TXMLPLPivotFieldType_x.Set_Subtotal(Value: UnicodeString);
begin
  ChildNodes['Subtotal'].NodeValue := Value;
end;

function TXMLPLPivotFieldType_x.Get_PLSubtotal: Double;
begin
  Result := ChildNodes['PLSubtotal'].NodeValue;
end;

procedure TXMLPLPivotFieldType_x.Set_PLSubtotal(Value: Double);
begin
  ChildNodes['PLSubtotal'].NodeValue := Value;
end;

function TXMLPLPivotFieldType_x.Get_DetailFormat: IXMLDetailFormat_x;
begin
  Result := ChildNodes['DetailFormat'] as IXMLDetailFormat_x;
end;

function TXMLPLPivotFieldType_x.Get_SubtotalFormat: IXMLSubtotalFormat_x;
begin
  Result := ChildNodes['SubtotalFormat'] as IXMLSubtotalFormat_x;
end;

function TXMLPLPivotFieldType_x.Get_DetailWidth: Integer;
begin
  Result := ChildNodes['DetailWidth'].NodeValue;
end;

procedure TXMLPLPivotFieldType_x.Set_DetailWidth(Value: Integer);
begin
  ChildNodes['DetailWidth'].NodeValue := Value;
end;

function TXMLPLPivotFieldType_x.Get_GroupedWidth: Integer;
begin
  Result := ChildNodes['GroupedWidth'].NodeValue;
end;

procedure TXMLPLPivotFieldType_x.Set_GroupedWidth(Value: Integer);
begin
  ChildNodes['GroupedWidth'].NodeValue := Value;
end;

function TXMLPLPivotFieldType_x.Get_Expanded: UnicodeString;
begin
  Result := ChildNodes['Expanded'].Text;
end;

procedure TXMLPLPivotFieldType_x.Set_Expanded(Value: UnicodeString);
begin
  ChildNodes['Expanded'].NodeValue := Value;
end;

function TXMLPLPivotFieldType_x.Get_TotalWidth: Integer;
begin
  Result := ChildNodes['TotalWidth'].NodeValue;
end;

procedure TXMLPLPivotFieldType_x.Set_TotalWidth(Value: Integer);
begin
  ChildNodes['TotalWidth'].NodeValue := Value;
end;

function TXMLPLPivotFieldType_x.Get_PivotItem: IXMLPivotItemType_xList;
begin
  Result := FPivotItem;
end;

{ TXMLPLPivotFieldType_xList }

function TXMLPLPivotFieldType_xList.Add: IXMLPLPivotFieldType_x;
begin
  Result := AddItem(-1) as IXMLPLPivotFieldType_x;
end;

function TXMLPLPivotFieldType_xList.Insert(const Index: Integer): IXMLPLPivotFieldType_x;
begin
  Result := AddItem(Index) as IXMLPLPivotFieldType_x;
end;

function TXMLPLPivotFieldType_xList.Get_Item(Index: Integer): IXMLPLPivotFieldType_x;
begin
  Result := List[Index] as IXMLPLPivotFieldType_x;
end;

{ TXMLDetailFormat_x }

function TXMLDetailFormat_x.Get_Style: UnicodeString;
begin
  Result := AttributeNodes['Style'].Text;
end;

procedure TXMLDetailFormat_x.Set_Style(Value: UnicodeString);
begin
  SetAttribute('Style', Value);
end;

{ TXMLSubtotalFormat_x }

function TXMLSubtotalFormat_x.Get_Style: UnicodeString;
begin
  Result := AttributeNodes['Style'].Text;
end;

procedure TXMLSubtotalFormat_x.Set_Style(Value: UnicodeString);
begin
  SetAttribute('Style', Value);
end;

{ TXMLPivotItemType_x }

function TXMLPivotItemType_x.Get_Name: UnicodeString;
begin
  Result := ChildNodes['Name'].Text;
end;

procedure TXMLPivotItemType_x.Set_Name(Value: UnicodeString);
begin
  ChildNodes['Name'].NodeValue := Value;
end;

function TXMLPivotItemType_x.Get_Formula: UnicodeString;
begin
  Result := ChildNodes['Formula'].Text;
end;

procedure TXMLPivotItemType_x.Set_Formula(Value: UnicodeString);
begin
  ChildNodes['Formula'].NodeValue := Value;
end;

function TXMLPivotItemType_x.Get_FormulaV10: UnicodeString;
begin
  Result := ChildNodes['FormulaV10'].Text;
end;

procedure TXMLPivotItemType_x.Set_FormulaV10(Value: UnicodeString);
begin
  ChildNodes['FormulaV10'].NodeValue := Value;
end;

function TXMLPivotItemType_x.Get_ParseFormulaAsV10: UnicodeString;
begin
  Result := ChildNodes['ParseFormulaAsV10'].Text;
end;

procedure TXMLPivotItemType_x.Set_ParseFormulaAsV10(Value: UnicodeString);
begin
  ChildNodes['ParseFormulaAsV10'].NodeValue := Value;
end;

function TXMLPivotItemType_x.Get_FormulaIndex: Integer;
begin
  Result := ChildNodes['FormulaIndex'].NodeValue;
end;

procedure TXMLPivotItemType_x.Set_FormulaIndex(Value: Integer);
begin
  ChildNodes['FormulaIndex'].NodeValue := Value;
end;

function TXMLPivotItemType_x.Get_Hidden: UnicodeString;
begin
  Result := ChildNodes['Hidden'].Text;
end;

procedure TXMLPivotItemType_x.Set_Hidden(Value: UnicodeString);
begin
  ChildNodes['Hidden'].NodeValue := Value;
end;

function TXMLPivotItemType_x.Get_HideDetail: UnicodeString;
begin
  Result := ChildNodes['HideDetail'].Text;
end;

procedure TXMLPivotItemType_x.Set_HideDetail(Value: UnicodeString);
begin
  ChildNodes['HideDetail'].NodeValue := Value;
end;

function TXMLPivotItemType_x.Get_Missing: UnicodeString;
begin
  Result := ChildNodes['Missing'].Text;
end;

procedure TXMLPivotItemType_x.Set_Missing(Value: UnicodeString);
begin
  ChildNodes['Missing'].NodeValue := Value;
end;

function TXMLPivotItemType_x.Get_CachePosition: Integer;
begin
  Result := ChildNodes['CachePosition'].NodeValue;
end;

procedure TXMLPivotItemType_x.Set_CachePosition(Value: Integer);
begin
  ChildNodes['CachePosition'].NodeValue := Value;
end;

function TXMLPivotItemType_x.Get_Member: UnicodeString;
begin
  Result := ChildNodes['Member'].Text;
end;

procedure TXMLPivotItemType_x.Set_Member(Value: UnicodeString);
begin
  ChildNodes['Member'].NodeValue := Value;
end;

function TXMLPivotItemType_x.Get_SourceName: UnicodeString;
begin
  Result := ChildNodes['SourceName'].Text;
end;

procedure TXMLPivotItemType_x.Set_SourceName(Value: UnicodeString);
begin
  ChildNodes['SourceName'].NodeValue := Value;
end;

function TXMLPivotItemType_x.Get_DrilledMember: UnicodeString;
begin
  Result := ChildNodes['DrilledMember'].Text;
end;

procedure TXMLPivotItemType_x.Set_DrilledMember(Value: UnicodeString);
begin
  ChildNodes['DrilledMember'].NodeValue := Value;
end;

{ TXMLPivotItemType_xList }

function TXMLPivotItemType_xList.Add: IXMLPivotItemType_x;
begin
  Result := AddItem(-1) as IXMLPivotItemType_x;
end;

function TXMLPivotItemType_xList.Insert(const Index: Integer): IXMLPivotItemType_x;
begin
  Result := AddItem(Index) as IXMLPivotItemType_x;
end;

function TXMLPivotItemType_xList.Get_Item(Index: Integer): IXMLPivotItemType_x;
begin
  Result := List[Index] as IXMLPivotItemType_x;
end;

{ TXMLPLTotalType_x }

procedure TXMLPLTotalType_x.AfterConstruction;
begin
  RegisterChildNode('Alignment', TXMLAlignmentType_x);
  inherited;
end;

function TXMLPLTotalType_x.Get_Name: UnicodeString;
begin
  Result := ChildNodes['Name'].Text;
end;

procedure TXMLPLTotalType_x.Set_Name(Value: UnicodeString);
begin
  ChildNodes['Name'].NodeValue := Value;
end;

function TXMLPLTotalType_x.Get_Caption: UnicodeString;
begin
  Result := ChildNodes['Caption'].Text;
end;

procedure TXMLPLTotalType_x.Set_Caption(Value: UnicodeString);
begin
  ChildNodes['Caption'].NodeValue := Value;
end;

function TXMLPLTotalType_x.Get_ParentField: UnicodeString;
begin
  Result := ChildNodes['ParentField'].Text;
end;

procedure TXMLPLTotalType_x.Set_ParentField(Value: UnicodeString);
begin
  ChildNodes['ParentField'].NodeValue := Value;
end;

function TXMLPLTotalType_x.Get_NumberFormat: UnicodeString;
begin
  Result := ChildNodes['NumberFormat'].Text;
end;

procedure TXMLPLTotalType_x.Set_NumberFormat(Value: UnicodeString);
begin
  ChildNodes['NumberFormat'].NodeValue := Value;
end;

function TXMLPLTotalType_x.Get_Operator_: UnicodeString;
begin
  Result := ChildNodes['Operator'].Text;
end;

procedure TXMLPLTotalType_x.Set_Operator_(Value: UnicodeString);
begin
  ChildNodes['Operator'].NodeValue := Value;
end;

function TXMLPLTotalType_x.Get_Alignment: IXMLAlignmentType_x;
begin
  Result := ChildNodes['Alignment'] as IXMLAlignmentType_x;
end;

function TXMLPLTotalType_x.Get_CaptionAlignment: UnicodeString;
begin
  Result := ChildNodes['CaptionAlignment'].Text;
end;

procedure TXMLPLTotalType_x.Set_CaptionAlignment(Value: UnicodeString);
begin
  ChildNodes['CaptionAlignment'].NodeValue := Value;
end;

function TXMLPLTotalType_x.Get_Width: Integer;
begin
  Result := ChildNodes['Width'].NodeValue;
end;

procedure TXMLPLTotalType_x.Set_Width(Value: Integer);
begin
  ChildNodes['Width'].NodeValue := Value;
end;

{ TXMLPLTotalType_xList }

function TXMLPLTotalType_xList.Add: IXMLPLTotalType_x;
begin
  Result := AddItem(-1) as IXMLPLTotalType_x;
end;

function TXMLPLTotalType_xList.Insert(const Index: Integer): IXMLPLTotalType_x;
begin
  Result := AddItem(Index) as IXMLPLTotalType_x;
end;

function TXMLPLTotalType_xList.Get_Item(Index: Integer): IXMLPLTotalType_x;
begin
  Result := List[Index] as IXMLPLTotalType_x;
end;

{ TXMLAlignmentType_x }

function TXMLAlignmentType_x.Get_Horizontal: UnicodeString;
begin
  Result := ChildNodes['Horizontal'].Text;
end;

procedure TXMLAlignmentType_x.Set_Horizontal(Value: UnicodeString);
begin
  ChildNodes['Horizontal'].NodeValue := Value;
end;

function TXMLAlignmentType_x.Get_Rotation: Integer;
begin
  Result := ChildNodes['Rotation'].NodeValue;
end;

procedure TXMLAlignmentType_x.Set_Rotation(Value: Integer);
begin
  ChildNodes['Rotation'].NodeValue := Value;
end;

function TXMLAlignmentType_x.Get_Vertical: UnicodeString;
begin
  Result := ChildNodes['Vertical'].Text;
end;

procedure TXMLAlignmentType_x.Set_Vertical(Value: UnicodeString);
begin
  ChildNodes['Vertical'].NodeValue := Value;
end;

function TXMLAlignmentType_x.Get_ReadingOrder: UnicodeString;
begin
  Result := ChildNodes['ReadingOrder'].Text;
end;

procedure TXMLAlignmentType_x.Set_ReadingOrder(Value: UnicodeString);
begin
  ChildNodes['ReadingOrder'].NodeValue := Value;
end;

{ TXMLPivotAxisType_x }

procedure TXMLPivotAxisType_x.AfterConstruction;
begin
  RegisterChildNode('Label', TXMLLabel__x);
  inherited;
end;

function TXMLPivotAxisType_x.Get_DisplayEmptyMembers: UnicodeString;
begin
  Result := ChildNodes['DisplayEmptyMembers'].Text;
end;

procedure TXMLPivotAxisType_x.Set_DisplayEmptyMembers(Value: UnicodeString);
begin
  ChildNodes['DisplayEmptyMembers'].NodeValue := Value;
end;

function TXMLPivotAxisType_x.Get_Label_: IXMLLabel__x;
begin
  Result := ChildNodes['Label'] as IXMLLabel__x;
end;

function TXMLPivotAxisType_x.Get_Orientation: UnicodeString;
begin
  Result := ChildNodes['Orientation'].Text;
end;

procedure TXMLPivotAxisType_x.Set_Orientation(Value: UnicodeString);
begin
  ChildNodes['Orientation'].NodeValue := Value;
end;

{ TXMLPivotAxisType_xList }

function TXMLPivotAxisType_xList.Add: IXMLPivotAxisType_x;
begin
  Result := AddItem(-1) as IXMLPivotAxisType_x;
end;

function TXMLPivotAxisType_xList.Insert(const Index: Integer): IXMLPivotAxisType_x;
begin
  Result := AddItem(Index) as IXMLPivotAxisType_x;
end;

function TXMLPivotAxisType_xList.Get_Item(Index: Integer): IXMLPivotAxisType_x;
begin
  Result := List[Index] as IXMLPivotAxisType_x;
end;

{ TXMLPivotFieldType_x }

procedure TXMLPivotFieldType_x.AfterConstruction;
begin
  RegisterChildNode('MapChildItems', TXMLMapChildItemsType_x);
  RegisterChildNode('MemberProperty', TXMLMemberPropertyType_x);
  RegisterChildNode('FilterMember', TXMLFilterMember_x);
  RegisterChildNode('PLTPivotItem', TXMLPivotItemType_x);
  RegisterChildNode('DetailFormat', TXMLDetailFormatType_x);
  RegisterChildNode('PivotItem', TXMLPivotItemType_x);
  RegisterChildNode('SubtotalFormat', TXMLSubtotalFormatType_x);
  FSubtotal := CreateCollection(TXMLSubtotalTypeList, IXMLNode, 'Subtotal') as IXMLSubtotalTypeList;
  FMemberProperty := CreateCollection(TXMLMemberPropertyType_xList, IXMLMemberPropertyType_x, 'MemberProperty') as IXMLMemberPropertyType_xList;
  FFilterMember := CreateCollection(TXMLFilterMember_xList, IXMLFilterMember_x, 'FilterMember') as IXMLFilterMember_xList;
  FPLTPivotItem := CreateCollection(TXMLPivotItemType_xList, IXMLPivotItemType_x, 'PLTPivotItem') as IXMLPivotItemType_xList;
  FPivotItem := CreateCollection(TXMLPivotItemType_xList, IXMLPivotItemType_x, 'PivotItem') as IXMLPivotItemType_xList;
  inherited;
end;

function TXMLPivotFieldType_x.Get_DataField: UnicodeString;
begin
  Result := ChildNodes['DataField'].Text;
end;

procedure TXMLPivotFieldType_x.Set_DataField(Value: UnicodeString);
begin
  ChildNodes['DataField'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_Name: UnicodeString;
begin
  Result := ChildNodes['Name'].Text;
end;

procedure TXMLPivotFieldType_x.Set_Name(Value: UnicodeString);
begin
  ChildNodes['Name'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_MapChildItems: IXMLMapChildItemsType_x;
begin
  Result := ChildNodes['MapChildItems'] as IXMLMapChildItemsType_x;
end;

function TXMLPivotFieldType_x.Get_AutoShowCount: Integer;
begin
  Result := ChildNodes['AutoShowCount'].NodeValue;
end;

procedure TXMLPivotFieldType_x.Set_AutoShowCount(Value: Integer);
begin
  ChildNodes['AutoShowCount'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_AutoShowField: UnicodeString;
begin
  Result := ChildNodes['AutoShowField'].Text;
end;

procedure TXMLPivotFieldType_x.Set_AutoShowField(Value: UnicodeString);
begin
  ChildNodes['AutoShowField'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_AutoShowRange: UnicodeString;
begin
  Result := ChildNodes['AutoShowRange'].Text;
end;

procedure TXMLPivotFieldType_x.Set_AutoShowRange(Value: UnicodeString);
begin
  ChildNodes['AutoShowRange'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_AutoShowType: UnicodeString;
begin
  Result := ChildNodes['AutoShowType'].Text;
end;

procedure TXMLPivotFieldType_x.Set_AutoShowType(Value: UnicodeString);
begin
  ChildNodes['AutoShowType'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_AutoSortOrder: UnicodeString;
begin
  Result := ChildNodes['AutoSortOrder'].Text;
end;

procedure TXMLPivotFieldType_x.Set_AutoSortOrder(Value: UnicodeString);
begin
  ChildNodes['AutoSortOrder'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_AutoSortField: UnicodeString;
begin
  Result := ChildNodes['AutoSortField'].Text;
end;

procedure TXMLPivotFieldType_x.Set_AutoSortField(Value: UnicodeString);
begin
  ChildNodes['AutoSortField'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_BaseField: UnicodeString;
begin
  Result := ChildNodes['BaseField'].Text;
end;

procedure TXMLPivotFieldType_x.Set_BaseField(Value: UnicodeString);
begin
  ChildNodes['BaseField'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_BaseItem: UnicodeString;
begin
  Result := ChildNodes['BaseItem'].Text;
end;

procedure TXMLPivotFieldType_x.Set_BaseItem(Value: UnicodeString);
begin
  ChildNodes['BaseItem'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_BlankLineAfterItems: UnicodeString;
begin
  Result := ChildNodes['BlankLineAfterItems'].Text;
end;

procedure TXMLPivotFieldType_x.Set_BlankLineAfterItems(Value: UnicodeString);
begin
  ChildNodes['BlankLineAfterItems'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_Calculation: UnicodeString;
begin
  Result := ChildNodes['Calculation'].Text;
end;

procedure TXMLPivotFieldType_x.Set_Calculation(Value: UnicodeString);
begin
  ChildNodes['Calculation'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_CantGetUniqueItems: UnicodeString;
begin
  Result := ChildNodes['CantGetUniqueItems'].Text;
end;

procedure TXMLPivotFieldType_x.Set_CantGetUniqueItems(Value: UnicodeString);
begin
  ChildNodes['CantGetUniqueItems'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_GroupBy: Integer;
begin
  Result := ChildNodes['GroupBy'].NodeValue;
end;

procedure TXMLPivotFieldType_x.Set_GroupBy(Value: Integer);
begin
  ChildNodes['GroupBy'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_GroupStart: UnicodeString;
begin
  Result := ChildNodes['GroupStart'].Text;
end;

procedure TXMLPivotFieldType_x.Set_GroupStart(Value: UnicodeString);
begin
  ChildNodes['GroupStart'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_GroupEnd: UnicodeString;
begin
  Result := ChildNodes['GroupEnd'].Text;
end;

procedure TXMLPivotFieldType_x.Set_GroupEnd(Value: UnicodeString);
begin
  ChildNodes['GroupEnd'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_GroupStartAuto: UnicodeString;
begin
  Result := ChildNodes['GroupStartAuto'].Text;
end;

procedure TXMLPivotFieldType_x.Set_GroupStartAuto(Value: UnicodeString);
begin
  ChildNodes['GroupStartAuto'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_GroupEndAuto: UnicodeString;
begin
  Result := ChildNodes['GroupEndAuto'].Text;
end;

procedure TXMLPivotFieldType_x.Set_GroupEndAuto(Value: UnicodeString);
begin
  ChildNodes['GroupEndAuto'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_GroupType: UnicodeString;
begin
  Result := ChildNodes['GroupType'].Text;
end;

procedure TXMLPivotFieldType_x.Set_GroupType(Value: UnicodeString);
begin
  ChildNodes['GroupType'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_LayoutPageBreak: UnicodeString;
begin
  Result := ChildNodes['LayoutPageBreak'].Text;
end;

procedure TXMLPivotFieldType_x.Set_LayoutPageBreak(Value: UnicodeString);
begin
  ChildNodes['LayoutPageBreak'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_NumberFormat: UnicodeString;
begin
  Result := ChildNodes['NumberFormat'].Text;
end;

procedure TXMLPivotFieldType_x.Set_NumberFormat(Value: UnicodeString);
begin
  ChildNodes['NumberFormat'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_ParentField: UnicodeString;
begin
  Result := ChildNodes['ParentField'].Text;
end;

procedure TXMLPivotFieldType_x.Set_ParentField(Value: UnicodeString);
begin
  ChildNodes['ParentField'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_SourceName: UnicodeString;
begin
  Result := ChildNodes['SourceName'].Text;
end;

procedure TXMLPivotFieldType_x.Set_SourceName(Value: UnicodeString);
begin
  ChildNodes['SourceName'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_Orientation: UnicodeString;
begin
  Result := ChildNodes['Orientation'].Text;
end;

procedure TXMLPivotFieldType_x.Set_Orientation(Value: UnicodeString);
begin
  ChildNodes['Orientation'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_Function_: UnicodeString;
begin
  Result := ChildNodes['Function'].Text;
end;

procedure TXMLPivotFieldType_x.Set_Function_(Value: UnicodeString);
begin
  ChildNodes['Function'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_Subtotal: IXMLSubtotalTypeList;
begin
  Result := FSubtotal;
end;

function TXMLPivotFieldType_x.Get_LayoutForm: UnicodeString;
begin
  Result := ChildNodes['LayoutForm'].Text;
end;

procedure TXMLPivotFieldType_x.Set_LayoutForm(Value: UnicodeString);
begin
  ChildNodes['LayoutForm'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_LayoutSubtotalLocation: UnicodeString;
begin
  Result := ChildNodes['LayoutSubtotalLocation'].Text;
end;

procedure TXMLPivotFieldType_x.Set_LayoutSubtotalLocation(Value: UnicodeString);
begin
  ChildNodes['LayoutSubtotalLocation'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_NoDragToRow: UnicodeString;
begin
  Result := ChildNodes['NoDragToRow'].Text;
end;

procedure TXMLPivotFieldType_x.Set_NoDragToRow(Value: UnicodeString);
begin
  ChildNodes['NoDragToRow'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_NoDragToColumn: UnicodeString;
begin
  Result := ChildNodes['NoDragToColumn'].Text;
end;

procedure TXMLPivotFieldType_x.Set_NoDragToColumn(Value: UnicodeString);
begin
  ChildNodes['NoDragToColumn'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_NoDragToData: UnicodeString;
begin
  Result := ChildNodes['NoDragToData'].Text;
end;

procedure TXMLPivotFieldType_x.Set_NoDragToData(Value: UnicodeString);
begin
  ChildNodes['NoDragToData'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_NoDragToHide: UnicodeString;
begin
  Result := ChildNodes['NoDragToHide'].Text;
end;

procedure TXMLPivotFieldType_x.Set_NoDragToHide(Value: UnicodeString);
begin
  ChildNodes['NoDragToHide'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_NoDragToPage: UnicodeString;
begin
  Result := ChildNodes['NoDragToPage'].Text;
end;

procedure TXMLPivotFieldType_x.Set_NoDragToPage(Value: UnicodeString);
begin
  ChildNodes['NoDragToPage'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_MemberProperty: IXMLMemberPropertyType_xList;
begin
  Result := FMemberProperty;
end;

function TXMLPivotFieldType_x.Get_MemberPropertiesOrder: UnicodeString;
begin
  Result := ChildNodes['MemberPropertiesOrder'].Text;
end;

procedure TXMLPivotFieldType_x.Set_MemberPropertiesOrder(Value: UnicodeString);
begin
  ChildNodes['MemberPropertiesOrder'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_HideDropDowns: UnicodeString;
begin
  Result := ChildNodes['HideDropDowns'].Text;
end;

procedure TXMLPivotFieldType_x.Set_HideDropDowns(Value: UnicodeString);
begin
  ChildNodes['HideDropDowns'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_DrilledLevel: UnicodeString;
begin
  Result := ChildNodes['DrilledLevel'].Text;
end;

procedure TXMLPivotFieldType_x.Set_DrilledLevel(Value: UnicodeString);
begin
  ChildNodes['DrilledLevel'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_ServerSortOrder: UnicodeString;
begin
  Result := ChildNodes['ServerSortOrder'].Text;
end;

procedure TXMLPivotFieldType_x.Set_ServerSortOrder(Value: UnicodeString);
begin
  ChildNodes['ServerSortOrder'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_IsMemberProperty: UnicodeString;
begin
  Result := ChildNodes['IsMemberProperty'].Text;
end;

procedure TXMLPivotFieldType_x.Set_IsMemberProperty(Value: UnicodeString);
begin
  ChildNodes['IsMemberProperty'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_CurrentPage: UnicodeString;
begin
  Result := ChildNodes['CurrentPage'].Text;
end;

procedure TXMLPivotFieldType_x.Set_CurrentPage(Value: UnicodeString);
begin
  ChildNodes['CurrentPage'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_Caption: UnicodeString;
begin
  Result := ChildNodes['Caption'].Text;
end;

procedure TXMLPivotFieldType_x.Set_Caption(Value: UnicodeString);
begin
  ChildNodes['Caption'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_FilterMember: IXMLFilterMember_xList;
begin
  Result := FFilterMember;
end;

function TXMLPivotFieldType_x.Get_Position: Integer;
begin
  Result := ChildNodes['Position'].NodeValue;
end;

procedure TXMLPivotFieldType_x.Set_Position(Value: Integer);
begin
  ChildNodes['Position'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_DataType: UnicodeString;
begin
  Result := ChildNodes['DataType'].Text;
end;

procedure TXMLPivotFieldType_x.Set_DataType(Value: UnicodeString);
begin
  ChildNodes['DataType'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_ServerBased: UnicodeString;
begin
  Result := ChildNodes['ServerBased'].Text;
end;

procedure TXMLPivotFieldType_x.Set_ServerBased(Value: UnicodeString);
begin
  ChildNodes['ServerBased'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_ShowAllItems: UnicodeString;
begin
  Result := ChildNodes['ShowAllItems'].Text;
end;

procedure TXMLPivotFieldType_x.Set_ShowAllItems(Value: UnicodeString);
begin
  ChildNodes['ShowAllItems'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_SQLType: UnicodeString;
begin
  Result := ChildNodes['SQLType'].Text;
end;

procedure TXMLPivotFieldType_x.Set_SQLType(Value: UnicodeString);
begin
  ChildNodes['SQLType'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_SubtotalName: UnicodeString;
begin
  Result := ChildNodes['SubtotalName'].Text;
end;

procedure TXMLPivotFieldType_x.Set_SubtotalName(Value: UnicodeString);
begin
  ChildNodes['SubtotalName'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_PLTPivotItem: IXMLPivotItemType_xList;
begin
  Result := FPLTPivotItem;
end;

function TXMLPivotFieldType_x.Get_DetailFormat: IXMLDetailFormatType_x;
begin
  Result := ChildNodes['DetailFormat'] as IXMLDetailFormatType_x;
end;

function TXMLPivotFieldType_x.Get_DetailWidth: Integer;
begin
  Result := ChildNodes['DetailWidth'].NodeValue;
end;

procedure TXMLPivotFieldType_x.Set_DetailWidth(Value: Integer);
begin
  ChildNodes['DetailWidth'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_Expanded: UnicodeString;
begin
  Result := ChildNodes['Expanded'].Text;
end;

procedure TXMLPivotFieldType_x.Set_Expanded(Value: UnicodeString);
begin
  ChildNodes['Expanded'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_FilterCaption: UnicodeString;
begin
  Result := ChildNodes['FilterCaption'].Text;
end;

procedure TXMLPivotFieldType_x.Set_FilterCaption(Value: UnicodeString);
begin
  ChildNodes['FilterCaption'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_Formula: UnicodeString;
begin
  Result := ChildNodes['Formula'].Text;
end;

procedure TXMLPivotFieldType_x.Set_Formula(Value: UnicodeString);
begin
  ChildNodes['Formula'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_FormulaV10: UnicodeString;
begin
  Result := ChildNodes['FormulaV10'].Text;
end;

procedure TXMLPivotFieldType_x.Set_FormulaV10(Value: UnicodeString);
begin
  ChildNodes['FormulaV10'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_ParseFormulaAsV10: UnicodeString;
begin
  Result := ChildNodes['ParseFormulaAsV10'].Text;
end;

procedure TXMLPivotFieldType_x.Set_ParseFormulaAsV10(Value: UnicodeString);
begin
  ChildNodes['ParseFormulaAsV10'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_GroupedWidth: Integer;
begin
  Result := ChildNodes['GroupedWidth'].NodeValue;
end;

procedure TXMLPivotFieldType_x.Set_GroupedWidth(Value: Integer);
begin
  ChildNodes['GroupedWidth'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_NewItemsHidden: UnicodeString;
begin
  Result := ChildNodes['NewItemsHidden'].Text;
end;

procedure TXMLPivotFieldType_x.Set_NewItemsHidden(Value: UnicodeString);
begin
  ChildNodes['NewItemsHidden'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_PLCaption: UnicodeString;
begin
  Result := ChildNodes['PLCaption'].Text;
end;

procedure TXMLPivotFieldType_x.Set_PLCaption(Value: UnicodeString);
begin
  ChildNodes['PLCaption'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_PLDataOrientation: UnicodeString;
begin
  Result := ChildNodes['PLDataOrientation'].Text;
end;

procedure TXMLPivotFieldType_x.Set_PLDataOrientation(Value: UnicodeString);
begin
  ChildNodes['PLDataOrientation'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_PLGroupType: UnicodeString;
begin
  Result := ChildNodes['PLGroupType'].Text;
end;

procedure TXMLPivotFieldType_x.Set_PLGroupType(Value: UnicodeString);
begin
  ChildNodes['PLGroupType'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_PLName: UnicodeString;
begin
  Result := ChildNodes['PLName'].Text;
end;

procedure TXMLPivotFieldType_x.Set_PLName(Value: UnicodeString);
begin
  ChildNodes['PLName'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_PLPosition: Integer;
begin
  Result := ChildNodes['PLPosition'].NodeValue;
end;

procedure TXMLPivotFieldType_x.Set_PLPosition(Value: Integer);
begin
  ChildNodes['PLPosition'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_PLSubtotal: Double;
begin
  Result := ChildNodes['PLSubtotal'].NodeValue;
end;

procedure TXMLPivotFieldType_x.Set_PLSubtotal(Value: Double);
begin
  ChildNodes['PLSubtotal'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_SourceHierarchy: UnicodeString;
begin
  Result := ChildNodes['SourceHierarchy'].Text;
end;

procedure TXMLPivotFieldType_x.Set_SourceHierarchy(Value: UnicodeString);
begin
  ChildNodes['SourceHierarchy'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_MemberPropertyParent: Integer;
begin
  Result := ChildNodes['MemberPropertyParent'].NodeValue;
end;

procedure TXMLPivotFieldType_x.Set_MemberPropertyParent(Value: Integer);
begin
  ChildNodes['MemberPropertyParent'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_SourceHierarchyLevel: UnicodeString;
begin
  Result := ChildNodes['SourceHierarchyLevel'].Text;
end;

procedure TXMLPivotFieldType_x.Set_SourceHierarchyLevel(Value: UnicodeString);
begin
  ChildNodes['SourceHierarchyLevel'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_PivotItem: IXMLPivotItemType_xList;
begin
  Result := FPivotItem;
end;

function TXMLPivotFieldType_x.Get_SubtotalFormat: IXMLSubtotalFormatType_x;
begin
  Result := ChildNodes['SubtotalFormat'] as IXMLSubtotalFormatType_x;
end;

function TXMLPivotFieldType_x.Get_TotalAlignment: UnicodeString;
begin
  Result := ChildNodes['TotalAlignment'].Text;
end;

procedure TXMLPivotFieldType_x.Set_TotalAlignment(Value: UnicodeString);
begin
  ChildNodes['TotalAlignment'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_TotalCaptionAlignment: UnicodeString;
begin
  Result := ChildNodes['TotalCaptionAlignment'].Text;
end;

procedure TXMLPivotFieldType_x.Set_TotalCaptionAlignment(Value: UnicodeString);
begin
  ChildNodes['TotalCaptionAlignment'].NodeValue := Value;
end;

function TXMLPivotFieldType_x.Get_TotalWidth: Integer;
begin
  Result := ChildNodes['TotalWidth'].NodeValue;
end;

procedure TXMLPivotFieldType_x.Set_TotalWidth(Value: Integer);
begin
  ChildNodes['TotalWidth'].NodeValue := Value;
end;

{ TXMLPivotFieldType_xList }

function TXMLPivotFieldType_xList.Add: IXMLPivotFieldType_x;
begin
  Result := AddItem(-1) as IXMLPivotFieldType_x;
end;

function TXMLPivotFieldType_xList.Insert(const Index: Integer): IXMLPivotFieldType_x;
begin
  Result := AddItem(Index) as IXMLPivotFieldType_x;
end;

function TXMLPivotFieldType_xList.Get_Item(Index: Integer): IXMLPivotFieldType_x;
begin
  Result := List[Index] as IXMLPivotFieldType_x;
end;

{ TXMLMapChildItemsType_x }

function TXMLMapChildItemsType_x.Get_Item: UnicodeString;
begin
  Result := ChildNodes['Item'].Text;
end;

procedure TXMLMapChildItemsType_x.Set_Item(Value: UnicodeString);
begin
  ChildNodes['Item'].NodeValue := Value;
end;

{ TXMLMemberPropertyType_x }

function TXMLMemberPropertyType_x.Get_Name: UnicodeString;
begin
  Result := ChildNodes['Name'].Text;
end;

procedure TXMLMemberPropertyType_x.Set_Name(Value: UnicodeString);
begin
  ChildNodes['Name'].NodeValue := Value;
end;

function TXMLMemberPropertyType_x.Get_UniqueName: UnicodeString;
begin
  Result := ChildNodes['UniqueName'].Text;
end;

procedure TXMLMemberPropertyType_x.Set_UniqueName(Value: UnicodeString);
begin
  ChildNodes['UniqueName'].NodeValue := Value;
end;

function TXMLMemberPropertyType_x.Get_SourceHierarchyLevel: Integer;
begin
  Result := ChildNodes['SourceHierarchyLevel'].NodeValue;
end;

procedure TXMLMemberPropertyType_x.Set_SourceHierarchyLevel(Value: Integer);
begin
  ChildNodes['SourceHierarchyLevel'].NodeValue := Value;
end;

function TXMLMemberPropertyType_x.Get_LengthLevelUniqueName: Integer;
begin
  Result := ChildNodes['LengthLevelUniqueName'].NodeValue;
end;

procedure TXMLMemberPropertyType_x.Set_LengthLevelUniqueName(Value: Integer);
begin
  ChildNodes['LengthLevelUniqueName'].NodeValue := Value;
end;

function TXMLMemberPropertyType_x.Get_DisplayIn: UnicodeString;
begin
  Result := ChildNodes['DisplayIn'].Text;
end;

procedure TXMLMemberPropertyType_x.Set_DisplayIn(Value: UnicodeString);
begin
  ChildNodes['DisplayIn'].NodeValue := Value;
end;

function TXMLMemberPropertyType_x.Get_Caption: UnicodeString;
begin
  Result := ChildNodes['Caption'].Text;
end;

procedure TXMLMemberPropertyType_x.Set_Caption(Value: UnicodeString);
begin
  ChildNodes['Caption'].NodeValue := Value;
end;

{ TXMLMemberPropertyType_xList }

function TXMLMemberPropertyType_xList.Add: IXMLMemberPropertyType_x;
begin
  Result := AddItem(-1) as IXMLMemberPropertyType_x;
end;

function TXMLMemberPropertyType_xList.Insert(const Index: Integer): IXMLMemberPropertyType_x;
begin
  Result := AddItem(Index) as IXMLMemberPropertyType_x;
end;

function TXMLMemberPropertyType_xList.Get_Item(Index: Integer): IXMLMemberPropertyType_x;
begin
  Result := List[Index] as IXMLMemberPropertyType_x;
end;

{ TXMLFilterMember_x }

function TXMLFilterMember_x.Get_UniqueName: UnicodeString;
begin
  Result := ChildNodes['UniqueName'].Text;
end;

procedure TXMLFilterMember_x.Set_UniqueName(Value: UnicodeString);
begin
  ChildNodes['UniqueName'].NodeValue := Value;
end;

function TXMLFilterMember_x.Get_Level: Integer;
begin
  Result := ChildNodes['Level'].NodeValue;
end;

procedure TXMLFilterMember_x.Set_Level(Value: Integer);
begin
  ChildNodes['Level'].NodeValue := Value;
end;

function TXMLFilterMember_x.Get_Caption: UnicodeString;
begin
  Result := ChildNodes['Caption'].Text;
end;

procedure TXMLFilterMember_x.Set_Caption(Value: UnicodeString);
begin
  ChildNodes['Caption'].NodeValue := Value;
end;

{ TXMLFilterMember_xList }

function TXMLFilterMember_xList.Add: IXMLFilterMember_x;
begin
  Result := AddItem(-1) as IXMLFilterMember_x;
end;

function TXMLFilterMember_xList.Insert(const Index: Integer): IXMLFilterMember_x;
begin
  Result := AddItem(Index) as IXMLFilterMember_x;
end;

function TXMLFilterMember_xList.Get_Item(Index: Integer): IXMLFilterMember_x;
begin
  Result := List[Index] as IXMLFilterMember_x;
end;

{ TXMLDetailFormatType_x }

function TXMLDetailFormatType_x.Get_Style: UnicodeString;
begin
  Result := AttributeNodes['Style'].Text;
end;

procedure TXMLDetailFormatType_x.Set_Style(Value: UnicodeString);
begin
  SetAttribute('Style', Value);
end;

{ TXMLSubtotalFormatType_x }

function TXMLSubtotalFormatType_x.Get_Style: UnicodeString;
begin
  Result := AttributeNodes['Style'].Text;
end;

procedure TXMLSubtotalFormatType_x.Set_Style(Value: UnicodeString);
begin
  SetAttribute('Style', Value);
end;

{ TXMLCubeFieldType_x }

procedure TXMLCubeFieldType_x.AfterConstruction;
begin
  RegisterChildNode('MemberProperty', TXMLMemberPropertyType_x);
  RegisterChildNode('GroupLevel', TXMLGroupLevel_x);
  FMemberProperty := CreateCollection(TXMLMemberPropertyType_xList, IXMLMemberPropertyType_x, 'MemberProperty') as IXMLMemberPropertyType_xList;
  FGroupLevel := CreateCollection(TXMLGroupLevel_xList, IXMLGroupLevel_x, 'GroupLevel') as IXMLGroupLevel_xList;
  inherited;
end;

function TXMLCubeFieldType_x.Get_UniqueName: UnicodeString;
begin
  Result := ChildNodes['UniqueName'].Text;
end;

procedure TXMLCubeFieldType_x.Set_UniqueName(Value: UnicodeString);
begin
  ChildNodes['UniqueName'].NodeValue := Value;
end;

function TXMLCubeFieldType_x.Get_Caption: UnicodeString;
begin
  Result := ChildNodes['Caption'].Text;
end;

procedure TXMLCubeFieldType_x.Set_Caption(Value: UnicodeString);
begin
  ChildNodes['Caption'].NodeValue := Value;
end;

function TXMLCubeFieldType_x.Get_DefaultItem: UnicodeString;
begin
  Result := ChildNodes['DefaultItem'].Text;
end;

procedure TXMLCubeFieldType_x.Set_DefaultItem(Value: UnicodeString);
begin
  ChildNodes['DefaultItem'].NodeValue := Value;
end;

function TXMLCubeFieldType_x.Get_AllItemName: UnicodeString;
begin
  Result := ChildNodes['AllItemName'].Text;
end;

procedure TXMLCubeFieldType_x.Set_AllItemName(Value: UnicodeString);
begin
  ChildNodes['AllItemName'].NodeValue := Value;
end;

function TXMLCubeFieldType_x.Get_Dimension: UnicodeString;
begin
  Result := ChildNodes['Dimension'].Text;
end;

procedure TXMLCubeFieldType_x.Set_Dimension(Value: UnicodeString);
begin
  ChildNodes['Dimension'].NodeValue := Value;
end;

function TXMLCubeFieldType_x.Get_DontShowInFieldList: UnicodeString;
begin
  Result := ChildNodes['DontShowInFieldList'].Text;
end;

procedure TXMLCubeFieldType_x.Set_DontShowInFieldList(Value: UnicodeString);
begin
  ChildNodes['DontShowInFieldList'].NodeValue := Value;
end;

function TXMLCubeFieldType_x.Get_Measure: UnicodeString;
begin
  Result := ChildNodes['Measure'].Text;
end;

procedure TXMLCubeFieldType_x.Set_Measure(Value: UnicodeString);
begin
  ChildNodes['Measure'].NodeValue := Value;
end;

function TXMLCubeFieldType_x.Get_Set_: UnicodeString;
begin
  Result := ChildNodes['Set'].Text;
end;

procedure TXMLCubeFieldType_x.Set_Set_(Value: UnicodeString);
begin
  ChildNodes['Set'].NodeValue := Value;
end;

function TXMLCubeFieldType_x.Get_NoDragToData: UnicodeString;
begin
  Result := ChildNodes['NoDragToData'].Text;
end;

procedure TXMLCubeFieldType_x.Set_NoDragToData(Value: UnicodeString);
begin
  ChildNodes['NoDragToData'].NodeValue := Value;
end;

function TXMLCubeFieldType_x.Get_NoDragToHide: UnicodeString;
begin
  Result := ChildNodes['NoDragToHide'].Text;
end;

procedure TXMLCubeFieldType_x.Set_NoDragToHide(Value: UnicodeString);
begin
  ChildNodes['NoDragToHide'].NodeValue := Value;
end;

function TXMLCubeFieldType_x.Get_NoDragToRow: UnicodeString;
begin
  Result := ChildNodes['NoDragToRow'].Text;
end;

procedure TXMLCubeFieldType_x.Set_NoDragToRow(Value: UnicodeString);
begin
  ChildNodes['NoDragToRow'].NodeValue := Value;
end;

function TXMLCubeFieldType_x.Get_NoDragToColumn: UnicodeString;
begin
  Result := ChildNodes['NoDragToColumn'].Text;
end;

procedure TXMLCubeFieldType_x.Set_NoDragToColumn(Value: UnicodeString);
begin
  ChildNodes['NoDragToColumn'].NodeValue := Value;
end;

function TXMLCubeFieldType_x.Get_NoDragToPage: UnicodeString;
begin
  Result := ChildNodes['NoDragToPage'].Text;
end;

procedure TXMLCubeFieldType_x.Set_NoDragToPage(Value: UnicodeString);
begin
  ChildNodes['NoDragToPage'].NodeValue := Value;
end;

function TXMLCubeFieldType_x.Get_EnableMultiplePageItems: UnicodeString;
begin
  Result := ChildNodes['EnableMultiplePageItems'].Text;
end;

procedure TXMLCubeFieldType_x.Set_EnableMultiplePageItems(Value: UnicodeString);
begin
  ChildNodes['EnableMultiplePageItems'].NodeValue := Value;
end;

function TXMLCubeFieldType_x.Get_LayoutForm: UnicodeString;
begin
  Result := ChildNodes['LayoutForm'].Text;
end;

procedure TXMLCubeFieldType_x.Set_LayoutForm(Value: UnicodeString);
begin
  ChildNodes['LayoutForm'].NodeValue := Value;
end;

function TXMLCubeFieldType_x.Get_LayoutSubtotalLocation: UnicodeString;
begin
  Result := ChildNodes['LayoutSubtotalLocation'].Text;
end;

procedure TXMLCubeFieldType_x.Set_LayoutSubtotalLocation(Value: UnicodeString);
begin
  ChildNodes['LayoutSubtotalLocation'].NodeValue := Value;
end;

function TXMLCubeFieldType_x.Get_Orientation: UnicodeString;
begin
  Result := ChildNodes['Orientation'].Text;
end;

procedure TXMLCubeFieldType_x.Set_Orientation(Value: UnicodeString);
begin
  ChildNodes['Orientation'].NodeValue := Value;
end;

function TXMLCubeFieldType_x.Get_MemberProperty: IXMLMemberPropertyType_xList;
begin
  Result := FMemberProperty;
end;

function TXMLCubeFieldType_x.Get_MemberPropertiesOrder: UnicodeString;
begin
  Result := ChildNodes['MemberPropertiesOrder'].Text;
end;

procedure TXMLCubeFieldType_x.Set_MemberPropertiesOrder(Value: UnicodeString);
begin
  ChildNodes['MemberPropertiesOrder'].NodeValue := Value;
end;

function TXMLCubeFieldType_x.Get_HideDropDowns: UnicodeString;
begin
  Result := ChildNodes['HideDropDowns'].Text;
end;

procedure TXMLCubeFieldType_x.Set_HideDropDowns(Value: UnicodeString);
begin
  ChildNodes['HideDropDowns'].NodeValue := Value;
end;

function TXMLCubeFieldType_x.Get_GroupLevel: IXMLGroupLevel_xList;
begin
  Result := FGroupLevel;
end;

{ TXMLCubeFieldType_xList }

function TXMLCubeFieldType_xList.Add: IXMLCubeFieldType_x;
begin
  Result := AddItem(-1) as IXMLCubeFieldType_x;
end;

function TXMLCubeFieldType_xList.Insert(const Index: Integer): IXMLCubeFieldType_x;
begin
  Result := AddItem(Index) as IXMLCubeFieldType_x;
end;

function TXMLCubeFieldType_xList.Get_Item(Index: Integer): IXMLCubeFieldType_x;
begin
  Result := List[Index] as IXMLCubeFieldType_x;
end;

{ TXMLGroupLevel_x }

procedure TXMLGroupLevel_x.AfterConstruction;
begin
  RegisterChildNode('GroupDefinition', TXMLGroupDefinitionType_x);
  FGroupDefinition := CreateCollection(TXMLGroupDefinitionType_xList, IXMLGroupDefinitionType_x, 'GroupDefinition') as IXMLGroupDefinitionType_xList;
  inherited;
end;

function TXMLGroupLevel_x.Get_IsGroupLevel: UnicodeString;
begin
  Result := ChildNodes['IsGroupLevel'].Text;
end;

procedure TXMLGroupLevel_x.Set_IsGroupLevel(Value: UnicodeString);
begin
  ChildNodes['IsGroupLevel'].NodeValue := Value;
end;

function TXMLGroupLevel_x.Get_UniqueName: UnicodeString;
begin
  Result := ChildNodes['UniqueName'].Text;
end;

procedure TXMLGroupLevel_x.Set_UniqueName(Value: UnicodeString);
begin
  ChildNodes['UniqueName'].NodeValue := Value;
end;

function TXMLGroupLevel_x.Get_Name: UnicodeString;
begin
  Result := ChildNodes['Name'].Text;
end;

procedure TXMLGroupLevel_x.Set_Name(Value: UnicodeString);
begin
  ChildNodes['Name'].NodeValue := Value;
end;

function TXMLGroupLevel_x.Get_GroupDefinition: IXMLGroupDefinitionType_xList;
begin
  Result := FGroupDefinition;
end;

{ TXMLGroupLevel_xList }

function TXMLGroupLevel_xList.Add: IXMLGroupLevel_x;
begin
  Result := AddItem(-1) as IXMLGroupLevel_x;
end;

function TXMLGroupLevel_xList.Insert(const Index: Integer): IXMLGroupLevel_x;
begin
  Result := AddItem(Index) as IXMLGroupLevel_x;
end;

function TXMLGroupLevel_xList.Get_Item(Index: Integer): IXMLGroupLevel_x;
begin
  Result := List[Index] as IXMLGroupLevel_x;
end;

{ TXMLGroupDefinitionType_x }

procedure TXMLGroupDefinitionType_x.AfterConstruction;
begin
  RegisterChildNode('GroupMember', TXMLGroupMemberType_x);
  FGroupMember := CreateCollection(TXMLGroupMemberType_xList, IXMLGroupMemberType_x, 'GroupMember') as IXMLGroupMemberType_xList;
  inherited;
end;

function TXMLGroupDefinitionType_x.Get_Name: UnicodeString;
begin
  Result := ChildNodes['Name'].Text;
end;

procedure TXMLGroupDefinitionType_x.Set_Name(Value: UnicodeString);
begin
  ChildNodes['Name'].NodeValue := Value;
end;

function TXMLGroupDefinitionType_x.Get_UniqueName: UnicodeString;
begin
  Result := ChildNodes['UniqueName'].Text;
end;

procedure TXMLGroupDefinitionType_x.Set_UniqueName(Value: UnicodeString);
begin
  ChildNodes['UniqueName'].NodeValue := Value;
end;

function TXMLGroupDefinitionType_x.Get_Caption: UnicodeString;
begin
  Result := ChildNodes['Caption'].Text;
end;

procedure TXMLGroupDefinitionType_x.Set_Caption(Value: UnicodeString);
begin
  ChildNodes['Caption'].NodeValue := Value;
end;

function TXMLGroupDefinitionType_x.Get_GroupNumber: Integer;
begin
  Result := ChildNodes['GroupNumber'].NodeValue;
end;

procedure TXMLGroupDefinitionType_x.Set_GroupNumber(Value: Integer);
begin
  ChildNodes['GroupNumber'].NodeValue := Value;
end;

function TXMLGroupDefinitionType_x.Get_ParentName: UnicodeString;
begin
  Result := ChildNodes['ParentName'].Text;
end;

procedure TXMLGroupDefinitionType_x.Set_ParentName(Value: UnicodeString);
begin
  ChildNodes['ParentName'].NodeValue := Value;
end;

function TXMLGroupDefinitionType_x.Get_ParentUniqueName: UnicodeString;
begin
  Result := ChildNodes['ParentUniqueName'].Text;
end;

procedure TXMLGroupDefinitionType_x.Set_ParentUniqueName(Value: UnicodeString);
begin
  ChildNodes['ParentUniqueName'].NodeValue := Value;
end;

function TXMLGroupDefinitionType_x.Get_ParentIsOther: UnicodeString;
begin
  Result := ChildNodes['ParentIsOther'].Text;
end;

procedure TXMLGroupDefinitionType_x.Set_ParentIsOther(Value: UnicodeString);
begin
  ChildNodes['ParentIsOther'].NodeValue := Value;
end;

function TXMLGroupDefinitionType_x.Get_GroupMember: IXMLGroupMemberType_xList;
begin
  Result := FGroupMember;
end;

{ TXMLGroupDefinitionType_xList }

function TXMLGroupDefinitionType_xList.Add: IXMLGroupDefinitionType_x;
begin
  Result := AddItem(-1) as IXMLGroupDefinitionType_x;
end;

function TXMLGroupDefinitionType_xList.Insert(const Index: Integer): IXMLGroupDefinitionType_x;
begin
  Result := AddItem(Index) as IXMLGroupDefinitionType_x;
end;

function TXMLGroupDefinitionType_xList.Get_Item(Index: Integer): IXMLGroupDefinitionType_x;
begin
  Result := List[Index] as IXMLGroupDefinitionType_x;
end;

{ TXMLGroupMemberType_x }

function TXMLGroupMemberType_x.Get_Name: UnicodeString;
begin
  Result := ChildNodes['Name'].Text;
end;

procedure TXMLGroupMemberType_x.Set_Name(Value: UnicodeString);
begin
  ChildNodes['Name'].NodeValue := Value;
end;

function TXMLGroupMemberType_x.Get_UniqueName: UnicodeString;
begin
  Result := ChildNodes['UniqueName'].Text;
end;

procedure TXMLGroupMemberType_x.Set_UniqueName(Value: UnicodeString);
begin
  ChildNodes['UniqueName'].NodeValue := Value;
end;

{ TXMLGroupMemberType_xList }

function TXMLGroupMemberType_xList.Add: IXMLGroupMemberType_x;
begin
  Result := AddItem(-1) as IXMLGroupMemberType_x;
end;

function TXMLGroupMemberType_xList.Insert(const Index: Integer): IXMLGroupMemberType_x;
begin
  Result := AddItem(Index) as IXMLGroupMemberType_x;
end;

function TXMLGroupMemberType_xList.Get_Item(Index: Integer): IXMLGroupMemberType_x;
begin
  Result := List[Index] as IXMLGroupMemberType_x;
end;

{ TXMLCalculatedMember_x }

function TXMLCalculatedMember_x.Get_Name: UnicodeString;
begin
  Result := ChildNodes['Name'].Text;
end;

procedure TXMLCalculatedMember_x.Set_Name(Value: UnicodeString);
begin
  ChildNodes['Name'].NodeValue := Value;
end;

function TXMLCalculatedMember_x.Get_MemberName: UnicodeString;
begin
  Result := ChildNodes['MemberName'].Text;
end;

procedure TXMLCalculatedMember_x.Set_MemberName(Value: UnicodeString);
begin
  ChildNodes['MemberName'].NodeValue := Value;
end;

function TXMLCalculatedMember_x.Get_ParentUniqueName: UnicodeString;
begin
  Result := ChildNodes['ParentUniqueName'].Text;
end;

procedure TXMLCalculatedMember_x.Set_ParentUniqueName(Value: UnicodeString);
begin
  ChildNodes['ParentUniqueName'].NodeValue := Value;
end;

function TXMLCalculatedMember_x.Get_SourceHierarchy: UnicodeString;
begin
  Result := ChildNodes['SourceHierarchy'].Text;
end;

procedure TXMLCalculatedMember_x.Set_SourceHierarchy(Value: UnicodeString);
begin
  ChildNodes['SourceHierarchy'].NodeValue := Value;
end;

function TXMLCalculatedMember_x.Get_SourceHierarchyLevel: Integer;
begin
  Result := ChildNodes['SourceHierarchyLevel'].NodeValue;
end;

procedure TXMLCalculatedMember_x.Set_SourceHierarchyLevel(Value: Integer);
begin
  ChildNodes['SourceHierarchyLevel'].NodeValue := Value;
end;

function TXMLCalculatedMember_x.Get_Formula: UnicodeString;
begin
  Result := ChildNodes['Formula'].Text;
end;

procedure TXMLCalculatedMember_x.Set_Formula(Value: UnicodeString);
begin
  ChildNodes['Formula'].NodeValue := Value;
end;

function TXMLCalculatedMember_x.Get_SolveOrder: Integer;
begin
  Result := ChildNodes['SolveOrder'].NodeValue;
end;

procedure TXMLCalculatedMember_x.Set_SolveOrder(Value: Integer);
begin
  ChildNodes['SolveOrder'].NodeValue := Value;
end;

function TXMLCalculatedMember_x.Get_Invalid: UnicodeString;
begin
  Result := ChildNodes['Invalid'].Text;
end;

procedure TXMLCalculatedMember_x.Set_Invalid(Value: UnicodeString);
begin
  ChildNodes['Invalid'].NodeValue := Value;
end;

function TXMLCalculatedMember_x.Get_Set_: UnicodeString;
begin
  Result := ChildNodes['Set'].Text;
end;

procedure TXMLCalculatedMember_x.Set_Set_(Value: UnicodeString);
begin
  ChildNodes['Set'].NodeValue := Value;
end;

{ TXMLPTLineItemsType_x }

procedure TXMLPTLineItemsType_x.AfterConstruction;
begin
  RegisterChildNode('PTLineItem', TXMLPTLineItemType_x);
  FPTLineItem := CreateCollection(TXMLPTLineItemType_xList, IXMLPTLineItemType_x, 'PTLineItem') as IXMLPTLineItemType_xList;
  inherited;
end;

function TXMLPTLineItemsType_x.Get_Orientation: UnicodeString;
begin
  Result := ChildNodes['Orientation'].Text;
end;

procedure TXMLPTLineItemsType_x.Set_Orientation(Value: UnicodeString);
begin
  ChildNodes['Orientation'].NodeValue := Value;
end;

function TXMLPTLineItemsType_x.Get_PTLineItem: IXMLPTLineItemType_xList;
begin
  Result := FPTLineItem;
end;

{ TXMLPTLineItemsType_xList }

function TXMLPTLineItemsType_xList.Add: IXMLPTLineItemsType_x;
begin
  Result := AddItem(-1) as IXMLPTLineItemsType_x;
end;

function TXMLPTLineItemsType_xList.Insert(const Index: Integer): IXMLPTLineItemsType_x;
begin
  Result := AddItem(Index) as IXMLPTLineItemsType_x;
end;

function TXMLPTLineItemsType_xList.Get_Item(Index: Integer): IXMLPTLineItemsType_x;
begin
  Result := List[Index] as IXMLPTLineItemsType_x;
end;

{ TXMLPTLineItemType_x }

procedure TXMLPTLineItemType_x.AfterConstruction;
begin
  FItem := CreateCollection(TXMLString_List, IXMLNode, 'Item') as IXMLString_List;
  inherited;
end;

function TXMLPTLineItemType_x.Get_ItemType: UnicodeString;
begin
  Result := ChildNodes['ItemType'].Text;
end;

procedure TXMLPTLineItemType_x.Set_ItemType(Value: UnicodeString);
begin
  ChildNodes['ItemType'].NodeValue := Value;
end;

function TXMLPTLineItemType_x.Get_DataField: Integer;
begin
  Result := ChildNodes['DataField'].NodeValue;
end;

procedure TXMLPTLineItemType_x.Set_DataField(Value: Integer);
begin
  ChildNodes['DataField'].NodeValue := Value;
end;

function TXMLPTLineItemType_x.Get_BlockTotal: UnicodeString;
begin
  Result := ChildNodes['BlockTotal'].Text;
end;

procedure TXMLPTLineItemType_x.Set_BlockTotal(Value: UnicodeString);
begin
  ChildNodes['BlockTotal'].NodeValue := Value;
end;

function TXMLPTLineItemType_x.Get_CountOfSameItems: Integer;
begin
  Result := ChildNodes['CountOfSameItems'].NodeValue;
end;

procedure TXMLPTLineItemType_x.Set_CountOfSameItems(Value: Integer);
begin
  ChildNodes['CountOfSameItems'].NodeValue := Value;
end;

function TXMLPTLineItemType_x.Get_Item: IXMLString_List;
begin
  Result := FItem;
end;

{ TXMLPTLineItemType_xList }

function TXMLPTLineItemType_xList.Add: IXMLPTLineItemType_x;
begin
  Result := AddItem(-1) as IXMLPTLineItemType_x;
end;

function TXMLPTLineItemType_xList.Insert(const Index: Integer): IXMLPTLineItemType_x;
begin
  Result := AddItem(Index) as IXMLPTLineItemType_x;
end;

function TXMLPTLineItemType_xList.Get_Item(Index: Integer): IXMLPTLineItemType_x;
begin
  Result := List[Index] as IXMLPTLineItemType_x;
end;

{ TXMLPTSourceType_x }

procedure TXMLPTSourceType_x.AfterConstruction;
begin
  RegisterChildNode('ConsolidationReference', TXMLConsolidationReferenceType_x);
  RegisterChildNode('QuerySource', TXMLPTQuerySourceType_x);
  RegisterChildNode('SourceConsolidation', TXMLSourceConsolidationType_x);
  inherited;
end;

function TXMLPTSourceType_x.Get_CacheFile: UnicodeString;
begin
  Result := ChildNodes['CacheFile'].Text;
end;

procedure TXMLPTSourceType_x.Set_CacheFile(Value: UnicodeString);
begin
  ChildNodes['CacheFile'].NodeValue := Value;
end;

function TXMLPTSourceType_x.Get_CacheIndex: Integer;
begin
  Result := ChildNodes['CacheIndex'].NodeValue;
end;

procedure TXMLPTSourceType_x.Set_CacheIndex(Value: Integer);
begin
  ChildNodes['CacheIndex'].NodeValue := Value;
end;

function TXMLPTSourceType_x.Get_DataMember: UnicodeString;
begin
  Result := ChildNodes['DataMember'].Text;
end;

procedure TXMLPTSourceType_x.Set_DataMember(Value: UnicodeString);
begin
  ChildNodes['DataMember'].NodeValue := Value;
end;

function TXMLPTSourceType_x.Get_MissingItemsLimit: Integer;
begin
  Result := ChildNodes['MissingItemsLimit'].NodeValue;
end;

procedure TXMLPTSourceType_x.Set_MissingItemsLimit(Value: Integer);
begin
  ChildNodes['MissingItemsLimit'].NodeValue := Value;
end;

function TXMLPTSourceType_x.Get_VersionRefreshableMin: Integer;
begin
  Result := ChildNodes['VersionRefreshableMin'].NodeValue;
end;

procedure TXMLPTSourceType_x.Set_VersionRefreshableMin(Value: Integer);
begin
  ChildNodes['VersionRefreshableMin'].NodeValue := Value;
end;

function TXMLPTSourceType_x.Get_VersionLastRefresh: UnicodeString;
begin
  Result := ChildNodes['VersionLastRefresh'].Text;
end;

procedure TXMLPTSourceType_x.Set_VersionLastRefresh(Value: UnicodeString);
begin
  ChildNodes['VersionLastRefresh'].NodeValue := Value;
end;

function TXMLPTSourceType_x.Get_RefreshName: UnicodeString;
begin
  Result := ChildNodes['RefreshName'].Text;
end;

procedure TXMLPTSourceType_x.Set_RefreshName(Value: UnicodeString);
begin
  ChildNodes['RefreshName'].NodeValue := Value;
end;

function TXMLPTSourceType_x.Get_RefreshDate: UnicodeString;
begin
  Result := ChildNodes['RefreshDate'].Text;
end;

procedure TXMLPTSourceType_x.Set_RefreshDate(Value: UnicodeString);
begin
  ChildNodes['RefreshDate'].NodeValue := Value;
end;

function TXMLPTSourceType_x.Get_RefreshDateCopy: UnicodeString;
begin
  Result := ChildNodes['RefreshDateCopy'].Text;
end;

procedure TXMLPTSourceType_x.Set_RefreshDateCopy(Value: UnicodeString);
begin
  ChildNodes['RefreshDateCopy'].NodeValue := Value;
end;

function TXMLPTSourceType_x.Get_ConsolidationReference: IXMLConsolidationReferenceType_x;
begin
  Result := ChildNodes['ConsolidationReference'] as IXMLConsolidationReferenceType_x;
end;

function TXMLPTSourceType_x.Get_NoSaveData: UnicodeString;
begin
  Result := ChildNodes['NoSaveData'].Text;
end;

procedure TXMLPTSourceType_x.Set_NoSaveData(Value: UnicodeString);
begin
  ChildNodes['NoSaveData'].NodeValue := Value;
end;

function TXMLPTSourceType_x.Get_QuerySource: IXMLPTQuerySourceType_x;
begin
  Result := ChildNodes['QuerySource'] as IXMLPTQuerySourceType_x;
end;

function TXMLPTSourceType_x.Get_SourceConsolidation: IXMLSourceConsolidationType_x;
begin
  Result := ChildNodes['SourceConsolidation'] as IXMLSourceConsolidationType_x;
end;

function TXMLPTSourceType_x.Get_BackgroundQuery: UnicodeString;
begin
  Result := ChildNodes['BackgroundQuery'].Text;
end;

procedure TXMLPTSourceType_x.Set_BackgroundQuery(Value: UnicodeString);
begin
  ChildNodes['BackgroundQuery'].NodeValue := Value;
end;

function TXMLPTSourceType_x.Get_CubeSource: UnicodeString;
begin
  Result := ChildNodes['CubeSource'].Text;
end;

procedure TXMLPTSourceType_x.Set_CubeSource(Value: UnicodeString);
begin
  ChildNodes['CubeSource'].NodeValue := Value;
end;

function TXMLPTSourceType_x.Get_DisableRefresh: UnicodeString;
begin
  Result := ChildNodes['DisableRefresh'].Text;
end;

procedure TXMLPTSourceType_x.Set_DisableRefresh(Value: UnicodeString);
begin
  ChildNodes['DisableRefresh'].NodeValue := Value;
end;

function TXMLPTSourceType_x.Get_HasNoRecords: UnicodeString;
begin
  Result := ChildNodes['HasNoRecords'].Text;
end;

procedure TXMLPTSourceType_x.Set_HasNoRecords(Value: UnicodeString);
begin
  ChildNodes['HasNoRecords'].NodeValue := Value;
end;

function TXMLPTSourceType_x.Get_OptimizeCache: UnicodeString;
begin
  Result := ChildNodes['OptimizeCache'].Text;
end;

procedure TXMLPTSourceType_x.Set_OptimizeCache(Value: UnicodeString);
begin
  ChildNodes['OptimizeCache'].NodeValue := Value;
end;

function TXMLPTSourceType_x.Get_RefreshOnFileOpen: UnicodeString;
begin
  Result := ChildNodes['RefreshOnFileOpen'].Text;
end;

procedure TXMLPTSourceType_x.Set_RefreshOnFileOpen(Value: UnicodeString);
begin
  ChildNodes['RefreshOnFileOpen'].NodeValue := Value;
end;

{ TXMLConsolidationReferenceType_x }

function TXMLConsolidationReferenceType_x.Get_FileName: UnicodeString;
begin
  Result := ChildNodes['FileName'].Text;
end;

procedure TXMLConsolidationReferenceType_x.Set_FileName(Value: UnicodeString);
begin
  ChildNodes['FileName'].NodeValue := Value;
end;

function TXMLConsolidationReferenceType_x.Get_Name: UnicodeString;
begin
  Result := ChildNodes['Name'].Text;
end;

procedure TXMLConsolidationReferenceType_x.Set_Name(Value: UnicodeString);
begin
  ChildNodes['Name'].NodeValue := Value;
end;

function TXMLConsolidationReferenceType_x.Get_Reference: UnicodeString;
begin
  Result := ChildNodes['Reference'].Text;
end;

procedure TXMLConsolidationReferenceType_x.Set_Reference(Value: UnicodeString);
begin
  ChildNodes['Reference'].NodeValue := Value;
end;

{ TXMLPTQuerySourceType_x }

procedure TXMLPTQuerySourceType_x.AfterConstruction;
begin
  RegisterChildNode('Parameter', TXMLParameterTypeE_x);
  FCommandText := CreateCollection(TXMLString_List, IXMLNode, 'CommandText') as IXMLString_List;
  FParameter := CreateCollection(TXMLParameterTypeE_xList, IXMLParameterTypeE_x, 'Parameter') as IXMLParameterTypeE_xList;
  FCommandTextOrignal := CreateCollection(TXMLString_List, IXMLNode, 'CommandTextOrignal') as IXMLString_List;
  FSourceConnectionFile := CreateCollection(TXMLString_List, IXMLNode, 'SourceConnectionFile') as IXMLString_List;
  FSourceDataFile := CreateCollection(TXMLString_List, IXMLNode, 'SourceDataFile') as IXMLString_List;
  FLocalConnection := CreateCollection(TXMLString_List, IXMLNode, 'LocalConnection') as IXMLString_List;
  inherited;
end;

function TXMLPTQuerySourceType_x.Get_QueryType: UnicodeString;
begin
  Result := ChildNodes['QueryType'].Text;
end;

procedure TXMLPTQuerySourceType_x.Set_QueryType(Value: UnicodeString);
begin
  ChildNodes['QueryType'].NodeValue := Value;
end;

function TXMLPTQuerySourceType_x.Get_CommandText: IXMLString_List;
begin
  Result := FCommandText;
end;

function TXMLPTQuerySourceType_x.Get_CommandType: UnicodeString;
begin
  Result := ChildNodes['CommandType'].Text;
end;

procedure TXMLPTQuerySourceType_x.Set_CommandType(Value: UnicodeString);
begin
  ChildNodes['CommandType'].NodeValue := Value;
end;

function TXMLPTQuerySourceType_x.Get_Maintain: UnicodeString;
begin
  Result := ChildNodes['Maintain'].Text;
end;

procedure TXMLPTQuerySourceType_x.Set_Maintain(Value: UnicodeString);
begin
  ChildNodes['Maintain'].NodeValue := Value;
end;

function TXMLPTQuerySourceType_x.Get_Connection: UnicodeString;
begin
  Result := ChildNodes['Connection'].Text;
end;

procedure TXMLPTQuerySourceType_x.Set_Connection(Value: UnicodeString);
begin
  ChildNodes['Connection'].NodeValue := Value;
end;

function TXMLPTQuerySourceType_x.Get_Parameter: IXMLParameterTypeE_xList;
begin
  Result := FParameter;
end;

function TXMLPTQuerySourceType_x.Get_CommandTextOrignal: IXMLString_List;
begin
  Result := FCommandTextOrignal;
end;

function TXMLPTQuerySourceType_x.Get_SourceConnectionFile: IXMLString_List;
begin
  Result := FSourceConnectionFile;
end;

function TXMLPTQuerySourceType_x.Get_SourceDataFile: IXMLString_List;
begin
  Result := FSourceDataFile;
end;

function TXMLPTQuerySourceType_x.Get_RobustConnect: UnicodeString;
begin
  Result := ChildNodes['RobustConnect'].Text;
end;

procedure TXMLPTQuerySourceType_x.Set_RobustConnect(Value: UnicodeString);
begin
  ChildNodes['RobustConnect'].NodeValue := Value;
end;

function TXMLPTQuerySourceType_x.Get_RefreshTimeSpan: Integer;
begin
  Result := ChildNodes['RefreshTimeSpan'].NodeValue;
end;

procedure TXMLPTQuerySourceType_x.Set_RefreshTimeSpan(Value: Integer);
begin
  ChildNodes['RefreshTimeSpan'].NodeValue := Value;
end;

function TXMLPTQuerySourceType_x.Get_LocalConnection: IXMLString_List;
begin
  Result := FLocalConnection;
end;

function TXMLPTQuerySourceType_x.Get_NoRefreshCache: UnicodeString;
begin
  Result := ChildNodes['NoRefreshCache'].Text;
end;

procedure TXMLPTQuerySourceType_x.Set_NoRefreshCache(Value: UnicodeString);
begin
  ChildNodes['NoRefreshCache'].NodeValue := Value;
end;

function TXMLPTQuerySourceType_x.Get_UseLocalConnection: UnicodeString;
begin
  Result := ChildNodes['UseLocalConnection'].Text;
end;

procedure TXMLPTQuerySourceType_x.Set_UseLocalConnection(Value: UnicodeString);
begin
  ChildNodes['UseLocalConnection'].NodeValue := Value;
end;

function TXMLPTQuerySourceType_x.Get_VersionLastEdit: UnicodeString;
begin
  Result := ChildNodes['VersionLastEdit'].Text;
end;

procedure TXMLPTQuerySourceType_x.Set_VersionLastEdit(Value: UnicodeString);
begin
  ChildNodes['VersionLastEdit'].NodeValue := Value;
end;

function TXMLPTQuerySourceType_x.Get_VersionLastRefresh: UnicodeString;
begin
  Result := ChildNodes['VersionLastRefresh'].Text;
end;

procedure TXMLPTQuerySourceType_x.Set_VersionLastRefresh(Value: UnicodeString);
begin
  ChildNodes['VersionLastRefresh'].NodeValue := Value;
end;

function TXMLPTQuerySourceType_x.Get_VersionRefreshableMin: UnicodeString;
begin
  Result := ChildNodes['VersionRefreshableMin'].Text;
end;

procedure TXMLPTQuerySourceType_x.Set_VersionRefreshableMin(Value: UnicodeString);
begin
  ChildNodes['VersionRefreshableMin'].NodeValue := Value;
end;

{ TXMLSourceConsolidationType_x }

procedure TXMLSourceConsolidationType_x.AfterConstruction;
begin
  RegisterChildNode('Reference', TXMLReference_x);
  FReference := CreateCollection(TXMLReference_xList, IXMLReference_x, 'Reference') as IXMLReference_xList;
  inherited;
end;

function TXMLSourceConsolidationType_x.Get_Reference: IXMLReference_xList;
begin
  Result := FReference;
end;

function TXMLSourceConsolidationType_x.Get_NoAutoPage: UnicodeString;
begin
  Result := ChildNodes['NoAutoPage'].Text;
end;

procedure TXMLSourceConsolidationType_x.Set_NoAutoPage(Value: UnicodeString);
begin
  ChildNodes['NoAutoPage'].NodeValue := Value;
end;

{ TXMLReference_x }

procedure TXMLReference_x.AfterConstruction;
begin
  RegisterChildNode('ConsolidationReference', TXMLConsolidationReferenceType_x);
  FItem := CreateCollection(TXMLString_List, IXMLNode, 'Item') as IXMLString_List;
  inherited;
end;

function TXMLReference_x.Get_ConsolidationReference: IXMLConsolidationReferenceType_x;
begin
  Result := ChildNodes['ConsolidationReference'] as IXMLConsolidationReferenceType_x;
end;

function TXMLReference_x.Get_Item: IXMLString_List;
begin
  Result := FItem;
end;

{ TXMLReference_xList }

function TXMLReference_xList.Add: IXMLReference_x;
begin
  Result := AddItem(-1) as IXMLReference_x;
end;

function TXMLReference_xList.Insert(const Index: Integer): IXMLReference_x;
begin
  Result := AddItem(Index) as IXMLReference_x;
end;

function TXMLReference_xList.Get_Item(Index: Integer): IXMLReference_x;
begin
  Result := List[Index] as IXMLReference_x;
end;

{ TXMLPTFormulaType_x }

procedure TXMLPTFormulaType_x.AfterConstruction;
begin
  RegisterChildNode('PTRule', TXMLPTRuleType_x);
  inherited;
end;

function TXMLPTFormulaType_x.Get_Formula: UnicodeString;
begin
  Result := ChildNodes['Formula'].Text;
end;

procedure TXMLPTFormulaType_x.Set_Formula(Value: UnicodeString);
begin
  ChildNodes['Formula'].NodeValue := Value;
end;

function TXMLPTFormulaType_x.Get_FormulaV10: UnicodeString;
begin
  Result := ChildNodes['FormulaV10'].Text;
end;

procedure TXMLPTFormulaType_x.Set_FormulaV10(Value: UnicodeString);
begin
  ChildNodes['FormulaV10'].NodeValue := Value;
end;

function TXMLPTFormulaType_x.Get_ParseFormulaAsV10: UnicodeString;
begin
  Result := ChildNodes['ParseFormulaAsV10'].Text;
end;

procedure TXMLPTFormulaType_x.Set_ParseFormulaAsV10(Value: UnicodeString);
begin
  ChildNodes['ParseFormulaAsV10'].NodeValue := Value;
end;

function TXMLPTFormulaType_x.Get_FormulaIndex: Integer;
begin
  Result := ChildNodes['FormulaIndex'].NodeValue;
end;

procedure TXMLPTFormulaType_x.Set_FormulaIndex(Value: Integer);
begin
  ChildNodes['FormulaIndex'].NodeValue := Value;
end;

function TXMLPTFormulaType_x.Get_PTRule: IXMLPTRuleType_x;
begin
  Result := ChildNodes['PTRule'] as IXMLPTRuleType_x;
end;

{ TXMLPTFormulaType_xList }

function TXMLPTFormulaType_xList.Add: IXMLPTFormulaType_x;
begin
  Result := AddItem(-1) as IXMLPTFormulaType_x;
end;

function TXMLPTFormulaType_xList.Insert(const Index: Integer): IXMLPTFormulaType_x;
begin
  Result := AddItem(Index) as IXMLPTFormulaType_x;
end;

function TXMLPTFormulaType_xList.Get_Item(Index: Integer): IXMLPTFormulaType_x;
begin
  Result := List[Index] as IXMLPTFormulaType_x;
end;

{ TXMLPTFormatType_x }

procedure TXMLPTFormatType_x.AfterConstruction;
begin
  RegisterChildNode('PTRule', TXMLPTRuleType_x);
  FPTRule := CreateCollection(TXMLPTRuleType_xList, IXMLPTRuleType_x, 'PTRule') as IXMLPTRuleType_xList;
  inherited;
end;

function TXMLPTFormatType_x.Get_Style: UnicodeString;
begin
  Result := AttributeNodes['Style'].Text;
end;

procedure TXMLPTFormatType_x.Set_Style(Value: UnicodeString);
begin
  SetAttribute('Style', Value);
end;

function TXMLPTFormatType_x.Get_PTRule: IXMLPTRuleType_xList;
begin
  Result := FPTRule;
end;

function TXMLPTFormatType_x.Get_FormatType: UnicodeString;
begin
  Result := ChildNodes['FormatType'].Text;
end;

procedure TXMLPTFormatType_x.Set_FormatType(Value: UnicodeString);
begin
  ChildNodes['FormatType'].NodeValue := Value;
end;

function TXMLPTFormatType_x.Get_IndividualCellBorders: UnicodeString;
begin
  Result := ChildNodes['IndividualCellBorders'].Text;
end;

procedure TXMLPTFormatType_x.Set_IndividualCellBorders(Value: UnicodeString);
begin
  ChildNodes['IndividualCellBorders'].NodeValue := Value;
end;

{ TXMLPTFormatType_xList }

function TXMLPTFormatType_xList.Add: IXMLPTFormatType_x;
begin
  Result := AddItem(-1) as IXMLPTFormatType_x;
end;

function TXMLPTFormatType_xList.Insert(const Index: Integer): IXMLPTFormatType_x;
begin
  Result := AddItem(Index) as IXMLPTFormatType_x;
end;

function TXMLPTFormatType_xList.Get_Item(Index: Integer): IXMLPTFormatType_x;
begin
  Result := List[Index] as IXMLPTFormatType_x;
end;

{ TXMLDataValidationType_x }

function TXMLDataValidationType_x.Get_Range: UnicodeString;
begin
  Result := ChildNodes['Range'].Text;
end;

procedure TXMLDataValidationType_x.Set_Range(Value: UnicodeString);
begin
  ChildNodes['Range'].NodeValue := Value;
end;

function TXMLDataValidationType_x.Get_Type_: UnicodeString;
begin
  Result := ChildNodes['Type'].Text;
end;

procedure TXMLDataValidationType_x.Set_Type_(Value: UnicodeString);
begin
  ChildNodes['Type'].NodeValue := Value;
end;

function TXMLDataValidationType_x.Get_CellRangeList: UnicodeString;
begin
  Result := ChildNodes['CellRangeList'].Text;
end;

procedure TXMLDataValidationType_x.Set_CellRangeList(Value: UnicodeString);
begin
  ChildNodes['CellRangeList'].NodeValue := Value;
end;

function TXMLDataValidationType_x.Get_Qualifier: UnicodeString;
begin
  Result := ChildNodes['Qualifier'].Text;
end;

procedure TXMLDataValidationType_x.Set_Qualifier(Value: UnicodeString);
begin
  ChildNodes['Qualifier'].NodeValue := Value;
end;

function TXMLDataValidationType_x.Get_UseBlank: UnicodeString;
begin
  Result := ChildNodes['UseBlank'].Text;
end;

procedure TXMLDataValidationType_x.Set_UseBlank(Value: UnicodeString);
begin
  ChildNodes['UseBlank'].NodeValue := Value;
end;

function TXMLDataValidationType_x.Get_Min: UnicodeString;
begin
  Result := ChildNodes['Min'].Text;
end;

procedure TXMLDataValidationType_x.Set_Min(Value: UnicodeString);
begin
  ChildNodes['Min'].NodeValue := Value;
end;

function TXMLDataValidationType_x.Get_Max: UnicodeString;
begin
  Result := ChildNodes['Max'].Text;
end;

procedure TXMLDataValidationType_x.Set_Max(Value: UnicodeString);
begin
  ChildNodes['Max'].NodeValue := Value;
end;

function TXMLDataValidationType_x.Get_Value: UnicodeString;
begin
  Result := ChildNodes['Value'].Text;
end;

procedure TXMLDataValidationType_x.Set_Value(Value: UnicodeString);
begin
  ChildNodes['Value'].NodeValue := Value;
end;

function TXMLDataValidationType_x.Get_ComboHide: UnicodeString;
begin
  Result := ChildNodes['ComboHide'].Text;
end;

procedure TXMLDataValidationType_x.Set_ComboHide(Value: UnicodeString);
begin
  ChildNodes['ComboHide'].NodeValue := Value;
end;

function TXMLDataValidationType_x.Get_IMEMode: UnicodeString;
begin
  Result := ChildNodes['IMEMode'].Text;
end;

procedure TXMLDataValidationType_x.Set_IMEMode(Value: UnicodeString);
begin
  ChildNodes['IMEMode'].NodeValue := Value;
end;

function TXMLDataValidationType_x.Get_InputHide: UnicodeString;
begin
  Result := ChildNodes['InputHide'].Text;
end;

procedure TXMLDataValidationType_x.Set_InputHide(Value: UnicodeString);
begin
  ChildNodes['InputHide'].NodeValue := Value;
end;

function TXMLDataValidationType_x.Get_InputTitle: UnicodeString;
begin
  Result := ChildNodes['InputTitle'].Text;
end;

procedure TXMLDataValidationType_x.Set_InputTitle(Value: UnicodeString);
begin
  ChildNodes['InputTitle'].NodeValue := Value;
end;

function TXMLDataValidationType_x.Get_InputMessage: UnicodeString;
begin
  Result := ChildNodes['InputMessage'].Text;
end;

procedure TXMLDataValidationType_x.Set_InputMessage(Value: UnicodeString);
begin
  ChildNodes['InputMessage'].NodeValue := Value;
end;

function TXMLDataValidationType_x.Get_ErrorHide: UnicodeString;
begin
  Result := ChildNodes['ErrorHide'].Text;
end;

procedure TXMLDataValidationType_x.Set_ErrorHide(Value: UnicodeString);
begin
  ChildNodes['ErrorHide'].NodeValue := Value;
end;

function TXMLDataValidationType_x.Get_ErrorStyle: UnicodeString;
begin
  Result := ChildNodes['ErrorStyle'].Text;
end;

procedure TXMLDataValidationType_x.Set_ErrorStyle(Value: UnicodeString);
begin
  ChildNodes['ErrorStyle'].NodeValue := Value;
end;

function TXMLDataValidationType_x.Get_ErrorMessage: UnicodeString;
begin
  Result := ChildNodes['ErrorMessage'].Text;
end;

procedure TXMLDataValidationType_x.Set_ErrorMessage(Value: UnicodeString);
begin
  ChildNodes['ErrorMessage'].NodeValue := Value;
end;

function TXMLDataValidationType_x.Get_ErrorTitle: UnicodeString;
begin
  Result := ChildNodes['ErrorTitle'].Text;
end;

procedure TXMLDataValidationType_x.Set_ErrorTitle(Value: UnicodeString);
begin
  ChildNodes['ErrorTitle'].NodeValue := Value;
end;

{ TXMLDataValidationType_xList }

function TXMLDataValidationType_xList.Add: IXMLDataValidationType_x;
begin
  Result := AddItem(-1) as IXMLDataValidationType_x;
end;

function TXMLDataValidationType_xList.Insert(const Index: Integer): IXMLDataValidationType_x;
begin
  Result := AddItem(Index) as IXMLDataValidationType_x;
end;

function TXMLDataValidationType_xList.Get_Item(Index: Integer): IXMLDataValidationType_x;
begin
  Result := List[Index] as IXMLDataValidationType_x;
end;

{ TXMLAutoFilter_x }

procedure TXMLAutoFilter_x.AfterConstruction;
begin
  RegisterChildNode('AutoFilterColumn', TXMLAutoFilterColumnType_x);
  ItemTag := 'AutoFilterColumn';
  ItemInterface := IXMLAutoFilterColumnType_x;
  inherited;
end;

function TXMLAutoFilter_x.Get_Range: UnicodeString;
begin
  Result := AttributeNodes['Range'].Text;
end;

procedure TXMLAutoFilter_x.Set_Range(Value: UnicodeString);
begin
  SetAttribute('Range', Value);
end;

function TXMLAutoFilter_x.Get_AutoFilterColumn(Index: Integer): IXMLAutoFilterColumnType_x;
begin
  Result := List[Index] as IXMLAutoFilterColumnType_x;
end;

function TXMLAutoFilter_x.Add: IXMLAutoFilterColumnType_x;
begin
  Result := AddItem(-1) as IXMLAutoFilterColumnType_x;
end;

function TXMLAutoFilter_x.Insert(const Index: Integer): IXMLAutoFilterColumnType_x;
begin
  Result := AddItem(Index) as IXMLAutoFilterColumnType_x;
end;

{ TXMLAutoFilterColumnType_x }

procedure TXMLAutoFilterColumnType_x.AfterConstruction;
begin
  RegisterChildNode('AutoFilterCondition', TXMLAutoFilterConditionType_x);
  RegisterChildNode('AutoFilterOr', TXMLAutoFilterOr_x);
  RegisterChildNode('AutoFilterAnd', TXMLAutoFilterAnd_x);
  inherited;
end;

function TXMLAutoFilterColumnType_x.Get_Index: Integer;
begin
  Result := AttributeNodes['Index'].NodeValue;
end;

procedure TXMLAutoFilterColumnType_x.Set_Index(Value: Integer);
begin
  SetAttribute('Index', Value);
end;

function TXMLAutoFilterColumnType_x.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['Type'].Text;
end;

procedure TXMLAutoFilterColumnType_x.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('Type', Value);
end;

function TXMLAutoFilterColumnType_x.Get_Value: Integer;
begin
  Result := AttributeNodes['Value'].NodeValue;
end;

procedure TXMLAutoFilterColumnType_x.Set_Value(Value: Integer);
begin
  SetAttribute('Value', Value);
end;

function TXMLAutoFilterColumnType_x.Get_AutoFilterCondition: IXMLAutoFilterConditionType_x;
begin
  Result := ChildNodes['AutoFilterCondition'] as IXMLAutoFilterConditionType_x;
end;

function TXMLAutoFilterColumnType_x.Get_AutoFilterOr: IXMLAutoFilterOr_x;
begin
  Result := ChildNodes['AutoFilterOr'] as IXMLAutoFilterOr_x;
end;

function TXMLAutoFilterColumnType_x.Get_AutoFilterAnd: IXMLAutoFilterAnd_x;
begin
  Result := ChildNodes['AutoFilterAnd'] as IXMLAutoFilterAnd_x;
end;

{ TXMLAutoFilterConditionType_x }

function TXMLAutoFilterConditionType_x.Get_Operator_: UnicodeString;
begin
  Result := AttributeNodes['Operator'].Text;
end;

procedure TXMLAutoFilterConditionType_x.Set_Operator_(Value: UnicodeString);
begin
  SetAttribute('Operator', Value);
end;

function TXMLAutoFilterConditionType_x.Get_Value: UnicodeString;
begin
  Result := AttributeNodes['Value'].Text;
end;

procedure TXMLAutoFilterConditionType_x.Set_Value(Value: UnicodeString);
begin
  SetAttribute('Value', Value);
end;

{ TXMLAutoFilterOr_x }

procedure TXMLAutoFilterOr_x.AfterConstruction;
begin
  RegisterChildNode('AutoFilterCondition', TXMLAutoFilterConditionType_x);
  ItemTag := 'AutoFilterCondition';
  ItemInterface := IXMLAutoFilterConditionType_x;
  inherited;
end;

function TXMLAutoFilterOr_x.Get_AutoFilterCondition(Index: Integer): IXMLAutoFilterConditionType_x;
begin
  Result := List[Index] as IXMLAutoFilterConditionType_x;
end;

function TXMLAutoFilterOr_x.Add: IXMLAutoFilterConditionType_x;
begin
  Result := AddItem(-1) as IXMLAutoFilterConditionType_x;
end;

function TXMLAutoFilterOr_x.Insert(const Index: Integer): IXMLAutoFilterConditionType_x;
begin
  Result := AddItem(Index) as IXMLAutoFilterConditionType_x;
end;

{ TXMLAutoFilterAnd_x }

procedure TXMLAutoFilterAnd_x.AfterConstruction;
begin
  RegisterChildNode('AutoFilterCondition', TXMLAutoFilterConditionType_x);
  ItemTag := 'AutoFilterCondition';
  ItemInterface := IXMLAutoFilterConditionType_x;
  inherited;
end;

function TXMLAutoFilterAnd_x.Get_AutoFilterCondition(Index: Integer): IXMLAutoFilterConditionType_x;
begin
  Result := List[Index] as IXMLAutoFilterConditionType_x;
end;

function TXMLAutoFilterAnd_x.Add: IXMLAutoFilterConditionType_x;
begin
  Result := AddItem(-1) as IXMLAutoFilterConditionType_x;
end;

function TXMLAutoFilterAnd_x.Insert(const Index: Integer): IXMLAutoFilterConditionType_x;
begin
  Result := AddItem(Index) as IXMLAutoFilterConditionType_x;
end;

{ TXMLConditionalFormattingType_x }

procedure TXMLConditionalFormattingType_x.AfterConstruction;
begin
  RegisterChildNode('Condition', TXMLCondition_x);
  FCondition := CreateCollection(TXMLCondition_xList, IXMLCondition_x, 'Condition') as IXMLCondition_xList;
  inherited;
end;

function TXMLConditionalFormattingType_x.Get_Range: UnicodeString;
begin
  Result := ChildNodes['Range'].Text;
end;

procedure TXMLConditionalFormattingType_x.Set_Range(Value: UnicodeString);
begin
  ChildNodes['Range'].NodeValue := Value;
end;

function TXMLConditionalFormattingType_x.Get_Condition: IXMLCondition_xList;
begin
  Result := FCondition;
end;

{ TXMLConditionalFormattingType_xList }

function TXMLConditionalFormattingType_xList.Add: IXMLConditionalFormattingType_x;
begin
  Result := AddItem(-1) as IXMLConditionalFormattingType_x;
end;

function TXMLConditionalFormattingType_xList.Insert(const Index: Integer): IXMLConditionalFormattingType_x;
begin
  Result := AddItem(Index) as IXMLConditionalFormattingType_x;
end;

function TXMLConditionalFormattingType_xList.Get_Item(Index: Integer): IXMLConditionalFormattingType_x;
begin
  Result := List[Index] as IXMLConditionalFormattingType_x;
end;

{ TXMLCondition_x }

procedure TXMLCondition_x.AfterConstruction;
begin
  RegisterChildNode('Format', TXMLFormat_x);
  inherited;
end;

function TXMLCondition_x.Get_Style: UnicodeString;
begin
  Result := AttributeNodes['Style'].Text;
end;

procedure TXMLCondition_x.Set_Style(Value: UnicodeString);
begin
  SetAttribute('Style', Value);
end;

function TXMLCondition_x.Get_Qualifier: UnicodeString;
begin
  Result := ChildNodes['Qualifier'].Text;
end;

procedure TXMLCondition_x.Set_Qualifier(Value: UnicodeString);
begin
  ChildNodes['Qualifier'].NodeValue := Value;
end;

function TXMLCondition_x.Get_Value1: UnicodeString;
begin
  Result := ChildNodes['Value1'].Text;
end;

procedure TXMLCondition_x.Set_Value1(Value: UnicodeString);
begin
  ChildNodes['Value1'].NodeValue := Value;
end;

function TXMLCondition_x.Get_Value2: UnicodeString;
begin
  Result := ChildNodes['Value2'].Text;
end;

procedure TXMLCondition_x.Set_Value2(Value: UnicodeString);
begin
  ChildNodes['Value2'].NodeValue := Value;
end;

function TXMLCondition_x.Get_Format: IXMLFormat_x;
begin
  Result := ChildNodes['Format'] as IXMLFormat_x;
end;

{ TXMLCondition_xList }

function TXMLCondition_xList.Add: IXMLCondition_x;
begin
  Result := AddItem(-1) as IXMLCondition_x;
end;

function TXMLCondition_xList.Insert(const Index: Integer): IXMLCondition_x;
begin
  Result := AddItem(Index) as IXMLCondition_x;
end;

function TXMLCondition_xList.Get_Item(Index: Integer): IXMLCondition_x;
begin
  Result := List[Index] as IXMLCondition_x;
end;

{ TXMLFormat_x }

function TXMLFormat_x.Get_Style: UnicodeString;
begin
  Result := AttributeNodes['Style'].Text;
end;

procedure TXMLFormat_x.Set_Style(Value: UnicodeString);
begin
  SetAttribute('Style', Value);
end;

{ TXMLSortingType_x }

procedure TXMLSortingType_x.AfterConstruction;
begin
  FSort := CreateCollection(TXMLString_List, IXMLNode, 'Sort') as IXMLString_List;
  FDescending := CreateCollection(TXMLString_List, IXMLNode, 'Descending') as IXMLString_List;
  inherited;
end;

function TXMLSortingType_x.Get_Sort: IXMLString_List;
begin
  Result := FSort;
end;

function TXMLSortingType_x.Get_Descending: IXMLString_List;
begin
  Result := FDescending;
end;

function TXMLSortingType_x.Get_LeftToRight: UnicodeString;
begin
  Result := ChildNodes['LeftToRight'].Text;
end;

procedure TXMLSortingType_x.Set_LeftToRight(Value: UnicodeString);
begin
  ChildNodes['LeftToRight'].NodeValue := Value;
end;

function TXMLSortingType_x.Get_CaseSensitive: UnicodeString;
begin
  Result := ChildNodes['CaseSensitive'].Text;
end;

procedure TXMLSortingType_x.Set_CaseSensitive(Value: UnicodeString);
begin
  ChildNodes['CaseSensitive'].NodeValue := Value;
end;

function TXMLSortingType_x.Get_AlternateMethod: UnicodeString;
begin
  Result := ChildNodes['AlternateMethod'].Text;
end;

procedure TXMLSortingType_x.Set_AlternateMethod(Value: UnicodeString);
begin
  ChildNodes['AlternateMethod'].NodeValue := Value;
end;

{ TXMLWorksheetoptions_c }

function TXMLWorksheetoptions_c.Get_Displaycustomheaders: UnicodeString;
begin
  Result := ChildNodes['displaycustomheaders'].Text;
end;

procedure TXMLWorksheetoptions_c.Set_Displaycustomheaders(Value: UnicodeString);
begin
  ChildNodes['displaycustomheaders'].NodeValue := Value;
end;

{ TXMLQueryTableType_x }

procedure TXMLQueryTableType_x.AfterConstruction;
begin
  RegisterChildNode('QuerySource', TXMLQTQuerySourceType_x);
  RegisterChildNode('RefreshInfo', TXMLRefreshInfoType_x);
  inherited;
end;

function TXMLQueryTableType_x.Get_Name: UnicodeString;
begin
  Result := ChildNodes['Name'].Text;
end;

procedure TXMLQueryTableType_x.Set_Name(Value: UnicodeString);
begin
  ChildNodes['Name'].NodeValue := Value;
end;

function TXMLQueryTableType_x.Get_AutoFormatFont: UnicodeString;
begin
  Result := ChildNodes['AutoFormatFont'].Text;
end;

procedure TXMLQueryTableType_x.Set_AutoFormatFont(Value: UnicodeString);
begin
  ChildNodes['AutoFormatFont'].NodeValue := Value;
end;

function TXMLQueryTableType_x.Get_AutoFormatName: UnicodeString;
begin
  Result := ChildNodes['AutoFormatName'].Text;
end;

procedure TXMLQueryTableType_x.Set_AutoFormatName(Value: UnicodeString);
begin
  ChildNodes['AutoFormatName'].NodeValue := Value;
end;

function TXMLQueryTableType_x.Get_AutoFormatNumber: UnicodeString;
begin
  Result := ChildNodes['AutoFormatNumber'].Text;
end;

procedure TXMLQueryTableType_x.Set_AutoFormatNumber(Value: UnicodeString);
begin
  ChildNodes['AutoFormatNumber'].NodeValue := Value;
end;

function TXMLQueryTableType_x.Get_AutoFormatBorder: UnicodeString;
begin
  Result := ChildNodes['AutoFormatBorder'].Text;
end;

procedure TXMLQueryTableType_x.Set_AutoFormatBorder(Value: UnicodeString);
begin
  ChildNodes['AutoFormatBorder'].NodeValue := Value;
end;

function TXMLQueryTableType_x.Get_AutoFormatPattern: UnicodeString;
begin
  Result := ChildNodes['AutoFormatPattern'].Text;
end;

procedure TXMLQueryTableType_x.Set_AutoFormatPattern(Value: UnicodeString);
begin
  ChildNodes['AutoFormatPattern'].NodeValue := Value;
end;

function TXMLQueryTableType_x.Get_AutoFormatAlignment: UnicodeString;
begin
  Result := ChildNodes['AutoFormatAlignment'].Text;
end;

procedure TXMLQueryTableType_x.Set_AutoFormatAlignment(Value: UnicodeString);
begin
  ChildNodes['AutoFormatAlignment'].NodeValue := Value;
end;

function TXMLQueryTableType_x.Get_AutoFormatWidth: UnicodeString;
begin
  Result := ChildNodes['AutoFormatWidth'].Text;
end;

procedure TXMLQueryTableType_x.Set_AutoFormatWidth(Value: UnicodeString);
begin
  ChildNodes['AutoFormatWidth'].NodeValue := Value;
end;

function TXMLQueryTableType_x.Get_QuerySource: IXMLQTQuerySourceType_x;
begin
  Result := ChildNodes['QuerySource'] as IXMLQTQuerySourceType_x;
end;

function TXMLQueryTableType_x.Get_DisableEdit: UnicodeString;
begin
  Result := ChildNodes['DisableEdit'].Text;
end;

procedure TXMLQueryTableType_x.Set_DisableEdit(Value: UnicodeString);
begin
  ChildNodes['DisableEdit'].NodeValue := Value;
end;

function TXMLQueryTableType_x.Get_DisableRefresh: UnicodeString;
begin
  Result := ChildNodes['DisableRefresh'].Text;
end;

procedure TXMLQueryTableType_x.Set_DisableRefresh(Value: UnicodeString);
begin
  ChildNodes['DisableRefresh'].NodeValue := Value;
end;

function TXMLQueryTableType_x.Get_Filled: UnicodeString;
begin
  Result := ChildNodes['Filled'].Text;
end;

procedure TXMLQueryTableType_x.Set_Filled(Value: UnicodeString);
begin
  ChildNodes['Filled'].NodeValue := Value;
end;

function TXMLQueryTableType_x.Get_InsertEntireRows: UnicodeString;
begin
  Result := ChildNodes['InsertEntireRows'].Text;
end;

procedure TXMLQueryTableType_x.Set_InsertEntireRows(Value: UnicodeString);
begin
  ChildNodes['InsertEntireRows'].NodeValue := Value;
end;

function TXMLQueryTableType_x.Get_NewAsync: UnicodeString;
begin
  Result := ChildNodes['NewAsync'].Text;
end;

procedure TXMLQueryTableType_x.Set_NewAsync(Value: UnicodeString);
begin
  ChildNodes['NewAsync'].NodeValue := Value;
end;

function TXMLQueryTableType_x.Get_NoAutofit: UnicodeString;
begin
  Result := ChildNodes['NoAutofit'].Text;
end;

procedure TXMLQueryTableType_x.Set_NoAutofit(Value: UnicodeString);
begin
  ChildNodes['NoAutofit'].NodeValue := Value;
end;

function TXMLQueryTableType_x.Get_NoPreserveFormatting: UnicodeString;
begin
  Result := ChildNodes['NoPreserveFormatting'].Text;
end;

procedure TXMLQueryTableType_x.Set_NoPreserveFormatting(Value: UnicodeString);
begin
  ChildNodes['NoPreserveFormatting'].NodeValue := Value;
end;

function TXMLQueryTableType_x.Get_NoSaveData: UnicodeString;
begin
  Result := ChildNodes['NoSaveData'].Text;
end;

procedure TXMLQueryTableType_x.Set_NoSaveData(Value: UnicodeString);
begin
  ChildNodes['NoSaveData'].NodeValue := Value;
end;

function TXMLQueryTableType_x.Get_NoTitles: UnicodeString;
begin
  Result := ChildNodes['NoTitles'].Text;
end;

procedure TXMLQueryTableType_x.Set_NoTitles(Value: UnicodeString);
begin
  ChildNodes['NoTitles'].NodeValue := Value;
end;

function TXMLQueryTableType_x.Get_OverwriteCells: UnicodeString;
begin
  Result := ChildNodes['OverwriteCells'].Text;
end;

procedure TXMLQueryTableType_x.Set_OverwriteCells(Value: UnicodeString);
begin
  ChildNodes['OverwriteCells'].NodeValue := Value;
end;

function TXMLQueryTableType_x.Get_RefreshInfo: IXMLRefreshInfoType_x;
begin
  Result := ChildNodes['RefreshInfo'] as IXMLRefreshInfoType_x;
end;

function TXMLQueryTableType_x.Get_RefreshOnFileOpen: UnicodeString;
begin
  Result := ChildNodes['RefreshOnFileOpen'].Text;
end;

procedure TXMLQueryTableType_x.Set_RefreshOnFileOpen(Value: UnicodeString);
begin
  ChildNodes['RefreshOnFileOpen'].NodeValue := Value;
end;

function TXMLQueryTableType_x.Get_RowNumbers: UnicodeString;
begin
  Result := ChildNodes['RowNumbers'].Text;
end;

procedure TXMLQueryTableType_x.Set_RowNumbers(Value: UnicodeString);
begin
  ChildNodes['RowNumbers'].NodeValue := Value;
end;

function TXMLQueryTableType_x.Get_Synchronous: UnicodeString;
begin
  Result := ChildNodes['Synchronous'].Text;
end;

procedure TXMLQueryTableType_x.Set_Synchronous(Value: UnicodeString);
begin
  ChildNodes['Synchronous'].NodeValue := Value;
end;

{ TXMLQueryTableType_xList }

function TXMLQueryTableType_xList.Add: IXMLQueryTableType_x;
begin
  Result := AddItem(-1) as IXMLQueryTableType_x;
end;

function TXMLQueryTableType_xList.Insert(const Index: Integer): IXMLQueryTableType_x;
begin
  Result := AddItem(Index) as IXMLQueryTableType_x;
end;

function TXMLQueryTableType_xList.Get_Item(Index: Integer): IXMLQueryTableType_x;
begin
  Result := List[Index] as IXMLQueryTableType_x;
end;

{ TXMLPivotCache_x }

procedure TXMLPivotCache_x.AfterConstruction;
begin
  RegisterChildNode('Schema', TXMLSchema_);
  RegisterChildNode('data', TXMLData_);
  inherited;
end;

function TXMLPivotCache_x.Get_CacheIndex: Integer;
begin
  Result := ChildNodes['CacheIndex'].NodeValue;
end;

procedure TXMLPivotCache_x.Set_CacheIndex(Value: Integer);
begin
  ChildNodes['CacheIndex'].NodeValue := Value;
end;

function TXMLPivotCache_x.Get_Schema: IXMLSchema_;
begin
  Result := ChildNodes['Schema'] as IXMLSchema_;
end;

function TXMLPivotCache_x.Get_Data: IXMLData_;
begin
  Result := ChildNodes['data'] as IXMLData_;
end;

{ TXMLPivotCache_xList }

function TXMLPivotCache_xList.Add: IXMLPivotCache_x;
begin
  Result := AddItem(-1) as IXMLPivotCache_x;
end;

function TXMLPivotCache_xList.Insert(const Index: Integer): IXMLPivotCache_x;
begin
  Result := AddItem(Index) as IXMLPivotCache_x;
end;

function TXMLPivotCache_xList.Get_Item(Index: Integer): IXMLPivotCache_x;
begin
  Result := List[Index] as IXMLPivotCache_x;
end;

{ TXMLSchema_ }

procedure TXMLSchema_.AfterConstruction;
begin
  RegisterChildNode('ElementType', TXMLElementType_);
  RegisterChildNode('AttributeType', TXMLAttributeType_);
  FAttributeType := CreateCollection(TXMLAttributeType_List, IXMLAttributeType_, 'AttributeType') as IXMLAttributeType_List;
  inherited;
end;

function TXMLSchema_.Get_Id: UnicodeString;
begin
  Result := AttributeNodes['id'].Text;
end;

procedure TXMLSchema_.Set_Id(Value: UnicodeString);
begin
  SetAttribute('id', Value);
end;

function TXMLSchema_.Get_ElementType: IXMLElementType_;
begin
  Result := ChildNodes['ElementType'] as IXMLElementType_;
end;

function TXMLSchema_.Get_AttributeType: IXMLAttributeType_List;
begin
  Result := FAttributeType;
end;

{ TXMLElementType_ }

procedure TXMLElementType_.AfterConstruction;
begin
  RegisterChildNode('attribute', TXMLAttribute_);
  RegisterChildNode('extends', TXMLExtends_);
  FAttribute := CreateCollection(TXMLAttribute_List, IXMLAttribute_, 'attribute') as IXMLAttribute_List;
  FExtends := CreateCollection(TXMLExtends_List, IXMLExtends_, 'extends') as IXMLExtends_List;
  inherited;
end;

function TXMLElementType_.Get_Name: UnicodeString;
begin
  Result := AttributeNodes['name'].Text;
end;

procedure TXMLElementType_.Set_Name(Value: UnicodeString);
begin
  SetAttribute('name', Value);
end;

function TXMLElementType_.Get_Content: UnicodeString;
begin
  Result := AttributeNodes['content'].Text;
end;

procedure TXMLElementType_.Set_Content(Value: UnicodeString);
begin
  SetAttribute('content', Value);
end;

function TXMLElementType_.Get_Attribute: IXMLAttribute_List;
begin
  Result := FAttribute;
end;

function TXMLElementType_.Get_Extends: IXMLExtends_List;
begin
  Result := FExtends;
end;

{ TXMLAttribute_ }

function TXMLAttribute_.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['type'].Text;
end;

procedure TXMLAttribute_.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('type', Value);
end;

{ TXMLAttribute_List }

function TXMLAttribute_List.Add: IXMLAttribute_;
begin
  Result := AddItem(-1) as IXMLAttribute_;
end;

function TXMLAttribute_List.Insert(const Index: Integer): IXMLAttribute_;
begin
  Result := AddItem(Index) as IXMLAttribute_;
end;

function TXMLAttribute_List.Get_Item(Index: Integer): IXMLAttribute_;
begin
  Result := List[Index] as IXMLAttribute_;
end;

{ TXMLExtends_ }

function TXMLExtends_.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['type'].Text;
end;

procedure TXMLExtends_.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('type', Value);
end;

{ TXMLExtends_List }

function TXMLExtends_List.Add: IXMLExtends_;
begin
  Result := AddItem(-1) as IXMLExtends_;
end;

function TXMLExtends_List.Insert(const Index: Integer): IXMLExtends_;
begin
  Result := AddItem(Index) as IXMLExtends_;
end;

function TXMLExtends_List.Get_Item(Index: Integer): IXMLExtends_;
begin
  Result := List[Index] as IXMLExtends_;
end;

{ TXMLAttributeType_ }

procedure TXMLAttributeType_.AfterConstruction;
begin
  RegisterChildNode('datatype', TXMLDatatype_);
  inherited;
end;

function TXMLAttributeType_.Get_Name: UnicodeString;
begin
  Result := AttributeNodes['name'].Text;
end;

procedure TXMLAttributeType_.Set_Name(Value: UnicodeString);
begin
  SetAttribute('name', Value);
end;

function TXMLAttributeType_.Get_Name: UnicodeString;
begin
  Result := AttributeNodes['name'].Text;
end;

procedure TXMLAttributeType_.Set_Name(Value: UnicodeString);
begin
  SetAttribute('name', Value);
end;

function TXMLAttributeType_.Get_Datatype: IXMLDatatype_;
begin
  Result := ChildNodes['datatype'] as IXMLDatatype_;
end;

{ TXMLAttributeType_List }

function TXMLAttributeType_List.Add: IXMLAttributeType_;
begin
  Result := AddItem(-1) as IXMLAttributeType_;
end;

function TXMLAttributeType_List.Insert(const Index: Integer): IXMLAttributeType_;
begin
  Result := AddItem(Index) as IXMLAttributeType_;
end;

function TXMLAttributeType_List.Get_Item(Index: Integer): IXMLAttributeType_;
begin
  Result := List[Index] as IXMLAttributeType_;
end;

{ TXMLDatatype_ }

function TXMLDatatype_.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['type'].Text;
end;

procedure TXMLDatatype_.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('type', Value);
end;

function TXMLDatatype_.Get_MaxLength: Integer;
begin
  Result := AttributeNodes['maxLength'].NodeValue;
end;

procedure TXMLDatatype_.Set_MaxLength(Value: Integer);
begin
  SetAttribute('maxLength', Value);
end;

{ TXMLData_ }

procedure TXMLData_.AfterConstruction;
begin
  RegisterChildNode('row', TXMLRow_);
  ItemTag := 'row';
  ItemInterface := IXMLRow_;
  inherited;
end;

function TXMLData_.Get_Row(Index: Integer): IXMLRow_;
begin
  Result := List[Index] as IXMLRow_;
end;

function TXMLData_.Add: IXMLRow_;
begin
  Result := AddItem(-1) as IXMLRow_;
end;

function TXMLData_.Insert(const Index: Integer): IXMLRow_;
begin
  Result := AddItem(Index) as IXMLRow_;
end;

{ TXMLRow_ }

function TXMLRow_.Get_Col1: UnicodeString;
begin
  Result := AttributeNodes['Col1'].Text;
end;

procedure TXMLRow_.Set_Col1(Value: UnicodeString);
begin
  SetAttribute('Col1', Value);
end;

function TXMLRow_.Get_Col2: UnicodeString;
begin
  Result := AttributeNodes['Col2'].Text;
end;

procedure TXMLRow_.Set_Col2(Value: UnicodeString);
begin
  SetAttribute('Col2', Value);
end;

function TXMLRow_.Get_Col3: UnicodeString;
begin
  Result := AttributeNodes['Col3'].Text;
end;

procedure TXMLRow_.Set_Col3(Value: UnicodeString);
begin
  SetAttribute('Col3', Value);
end;

function TXMLRow_.Get_Col4: UnicodeString;
begin
  Result := AttributeNodes['Col4'].Text;
end;

procedure TXMLRow_.Set_Col4(Value: UnicodeString);
begin
  SetAttribute('Col4', Value);
end;

function TXMLRow_.Get_Col5: UnicodeString;
begin
  Result := AttributeNodes['Col5'].Text;
end;

procedure TXMLRow_.Set_Col5(Value: UnicodeString);
begin
  SetAttribute('Col5', Value);
end;

function TXMLRow_.Get_Col6: UnicodeString;
begin
  Result := AttributeNodes['Col6'].Text;
end;

procedure TXMLRow_.Set_Col6(Value: UnicodeString);
begin
  SetAttribute('Col6', Value);
end;

function TXMLRow_.Get_Col7: UnicodeString;
begin
  Result := AttributeNodes['Col7'].Text;
end;

procedure TXMLRow_.Set_Col7(Value: UnicodeString);
begin
  SetAttribute('Col7', Value);
end;

function TXMLRow_.Get_Col8: UnicodeString;
begin
  Result := AttributeNodes['Col8'].Text;
end;

procedure TXMLRow_.Set_Col8(Value: UnicodeString);
begin
  SetAttribute('Col8', Value);
end;

function TXMLRow_.Get_Col9: UnicodeString;
begin
  Result := AttributeNodes['Col9'].Text;
end;

procedure TXMLRow_.Set_Col9(Value: UnicodeString);
begin
  SetAttribute('Col9', Value);
end;

function TXMLRow_.Get_Col10: UnicodeString;
begin
  Result := AttributeNodes['Col10'].Text;
end;

procedure TXMLRow_.Set_Col10(Value: UnicodeString);
begin
  SetAttribute('Col10', Value);
end;

function TXMLRow_.Get_Col11: UnicodeString;
begin
  Result := AttributeNodes['Col11'].Text;
end;

procedure TXMLRow_.Set_Col11(Value: UnicodeString);
begin
  SetAttribute('Col11', Value);
end;

function TXMLRow_.Get_Col12: UnicodeString;
begin
  Result := AttributeNodes['Col12'].Text;
end;

procedure TXMLRow_.Set_Col12(Value: UnicodeString);
begin
  SetAttribute('Col12', Value);
end;

function TXMLRow_.Get_Col13: UnicodeString;
begin
  Result := AttributeNodes['Col13'].Text;
end;

procedure TXMLRow_.Set_Col13(Value: UnicodeString);
begin
  SetAttribute('Col13', Value);
end;

function TXMLRow_.Get_Col14: UnicodeString;
begin
  Result := AttributeNodes['Col14'].Text;
end;

procedure TXMLRow_.Set_Col14(Value: UnicodeString);
begin
  SetAttribute('Col14', Value);
end;

function TXMLRow_.Get_Col15: UnicodeString;
begin
  Result := AttributeNodes['Col15'].Text;
end;

procedure TXMLRow_.Set_Col15(Value: UnicodeString);
begin
  SetAttribute('Col15', Value);
end;

function TXMLRow_.Get_Col16: UnicodeString;
begin
  Result := AttributeNodes['Col16'].Text;
end;

procedure TXMLRow_.Set_Col16(Value: UnicodeString);
begin
  SetAttribute('Col16', Value);
end;

function TXMLRow_.Get_Col17: UnicodeString;
begin
  Result := AttributeNodes['Col17'].Text;
end;

procedure TXMLRow_.Set_Col17(Value: UnicodeString);
begin
  SetAttribute('Col17', Value);
end;

function TXMLRow_.Get_Col18: UnicodeString;
begin
  Result := AttributeNodes['Col18'].Text;
end;

procedure TXMLRow_.Set_Col18(Value: UnicodeString);
begin
  SetAttribute('Col18', Value);
end;

function TXMLRow_.Get_Col19: UnicodeString;
begin
  Result := AttributeNodes['Col19'].Text;
end;

procedure TXMLRow_.Set_Col19(Value: UnicodeString);
begin
  SetAttribute('Col19', Value);
end;

function TXMLRow_.Get_Col20: UnicodeString;
begin
  Result := AttributeNodes['Col20'].Text;
end;

procedure TXMLRow_.Set_Col20(Value: UnicodeString);
begin
  SetAttribute('Col20', Value);
end;

{ TXMLMapInfoType_x2 }

procedure TXMLMapInfoType_x2.AfterConstruction;
begin
  RegisterChildNode('Schema', TXMLSchemaType_x2);
  RegisterChildNode('Map', TXMLMapType_x2);
  FSchema := CreateCollection(TXMLSchemaType_x2List, IXMLSchemaType_x2, 'Schema') as IXMLSchemaType_x2List;
  FMap := CreateCollection(TXMLMapType_x2List, IXMLMapType_x2, 'Map') as IXMLMapType_x2List;
  inherited;
end;

function TXMLMapInfoType_x2.Get_HideInactiveListBorder: UnicodeString;
begin
  Result := AttributeNodes['HideInactiveListBorder'].Text;
end;

procedure TXMLMapInfoType_x2.Set_HideInactiveListBorder(Value: UnicodeString);
begin
  SetAttribute('HideInactiveListBorder', Value);
end;

function TXMLMapInfoType_x2.Get_SelectionNamespaces: UnicodeString;
begin
  Result := AttributeNodes['SelectionNamespaces'].Text;
end;

procedure TXMLMapInfoType_x2.Set_SelectionNamespaces(Value: UnicodeString);
begin
  SetAttribute('SelectionNamespaces', Value);
end;

function TXMLMapInfoType_x2.Get_Schema: IXMLSchemaType_x2List;
begin
  Result := FSchema;
end;

function TXMLMapInfoType_x2.Get_Map: IXMLMapType_x2List;
begin
  Result := FMap;
end;

{ TXMLMapInfoType_x2List }

function TXMLMapInfoType_x2List.Add: IXMLMapInfoType_x2;
begin
  Result := AddItem(-1) as IXMLMapInfoType_x2;
end;

function TXMLMapInfoType_x2List.Insert(const Index: Integer): IXMLMapInfoType_x2;
begin
  Result := AddItem(Index) as IXMLMapInfoType_x2;
end;

function TXMLMapInfoType_x2List.Get_Item(Index: Integer): IXMLMapInfoType_x2;
begin
  Result := List[Index] as IXMLMapInfoType_x2;
end;

{ TXMLSchemaType_x2 }

function TXMLSchemaType_x2.Get_ID: UnicodeString;
begin
  Result := AttributeNodes['ID'].Text;
end;

procedure TXMLSchemaType_x2.Set_ID(Value: UnicodeString);
begin
  SetAttribute('ID', Value);
end;

function TXMLSchemaType_x2.Get_Namespace: UnicodeString;
begin
  Result := AttributeNodes['Namespace'].Text;
end;

procedure TXMLSchemaType_x2.Set_Namespace(Value: UnicodeString);
begin
  SetAttribute('Namespace', Value);
end;

function TXMLSchemaType_x2.Get_SchemaRef: UnicodeString;
begin
  Result := AttributeNodes['SchemaRef'].Text;
end;

procedure TXMLSchemaType_x2.Set_SchemaRef(Value: UnicodeString);
begin
  SetAttribute('SchemaRef', Value);
end;

{ TXMLSchemaType_x2List }

function TXMLSchemaType_x2List.Add: IXMLSchemaType_x2;
begin
  Result := AddItem(-1) as IXMLSchemaType_x2;
end;

function TXMLSchemaType_x2List.Insert(const Index: Integer): IXMLSchemaType_x2;
begin
  Result := AddItem(Index) as IXMLSchemaType_x2;
end;

function TXMLSchemaType_x2List.Get_Item(Index: Integer): IXMLSchemaType_x2;
begin
  Result := List[Index] as IXMLSchemaType_x2;
end;

{ TXMLMapType_x2 }

procedure TXMLMapType_x2.AfterConstruction;
begin
  RegisterChildNode('Entry', TXMLEntryType_x2);
  RegisterChildNode('Mapdata', TXMLMapdata_x2);
  FEntry := CreateCollection(TXMLEntryType_x2List, IXMLEntryType_x2, 'Entry') as IXMLEntryType_x2List;
  inherited;
end;

function TXMLMapType_x2.Get_ID: UnicodeString;
begin
  Result := AttributeNodes['ID'].Text;
end;

procedure TXMLMapType_x2.Set_ID(Value: UnicodeString);
begin
  SetAttribute('ID', Value);
end;

function TXMLMapType_x2.Get_SchemaID: UnicodeString;
begin
  Result := AttributeNodes['SchemaID'].Text;
end;

procedure TXMLMapType_x2.Set_SchemaID(Value: UnicodeString);
begin
  SetAttribute('SchemaID', Value);
end;

function TXMLMapType_x2.Get_RootElement: UnicodeString;
begin
  Result := AttributeNodes['RootElement'].Text;
end;

procedure TXMLMapType_x2.Set_RootElement(Value: UnicodeString);
begin
  SetAttribute('RootElement', Value);
end;

function TXMLMapType_x2.Get_ShowImportExportValidationErrors: UnicodeString;
begin
  Result := ChildNodes['ShowImportExportValidationErrors'].Text;
end;

procedure TXMLMapType_x2.Set_ShowImportExportValidationErrors(Value: UnicodeString);
begin
  ChildNodes['ShowImportExportValidationErrors'].NodeValue := Value;
end;

function TXMLMapType_x2.Get_Append: UnicodeString;
begin
  Result := ChildNodes['Append'].Text;
end;

procedure TXMLMapType_x2.Set_Append(Value: UnicodeString);
begin
  ChildNodes['Append'].NodeValue := Value;
end;

function TXMLMapType_x2.Get_DoNotPersist: UnicodeString;
begin
  Result := ChildNodes['DoNotPersist'].Text;
end;

procedure TXMLMapType_x2.Set_DoNotPersist(Value: UnicodeString);
begin
  ChildNodes['DoNotPersist'].NodeValue := Value;
end;

function TXMLMapType_x2.Get_NoAutoFit: UnicodeString;
begin
  Result := ChildNodes['NoAutoFit'].Text;
end;

procedure TXMLMapType_x2.Set_NoAutoFit(Value: UnicodeString);
begin
  ChildNodes['NoAutoFit'].NodeValue := Value;
end;

function TXMLMapType_x2.Get_NoPreserveFormatting: UnicodeString;
begin
  Result := ChildNodes['NoPreserveFormatting'].Text;
end;

procedure TXMLMapType_x2.Set_NoPreserveFormatting(Value: UnicodeString);
begin
  ChildNodes['NoPreserveFormatting'].NodeValue := Value;
end;

function TXMLMapType_x2.Get_Entry: IXMLEntryType_x2List;
begin
  Result := FEntry;
end;

function TXMLMapType_x2.Get_Mapdata: IXMLMapdata_x2;
begin
  Result := ChildNodes['Mapdata'] as IXMLMapdata_x2;
end;

{ TXMLMapType_x2List }

function TXMLMapType_x2List.Add: IXMLMapType_x2;
begin
  Result := AddItem(-1) as IXMLMapType_x2;
end;

function TXMLMapType_x2List.Insert(const Index: Integer): IXMLMapType_x2;
begin
  Result := AddItem(Index) as IXMLMapType_x2;
end;

function TXMLMapType_x2List.Get_Item(Index: Integer): IXMLMapType_x2;
begin
  Result := List[Index] as IXMLMapType_x2;
end;

{ TXMLEntryType_x2 }

procedure TXMLEntryType_x2.AfterConstruction;
begin
  RegisterChildNode('Field', TXMLFieldType_x2);
  RegisterChildNode('ActiveRows', TXMLActiveRowsType_x2);
  FField := CreateCollection(TXMLFieldType_x2List, IXMLFieldType_x2, 'Field') as IXMLFieldType_x2List;
  inherited;
end;

function TXMLEntryType_x2.Get_ID: UnicodeString;
begin
  Result := AttributeNodes['ID'].Text;
end;

procedure TXMLEntryType_x2.Set_ID(Value: UnicodeString);
begin
  SetAttribute('ID', Value);
end;

function TXMLEntryType_x2.Get_ShowTotals: UnicodeString;
begin
  Result := AttributeNodes['ShowTotals'].Text;
end;

procedure TXMLEntryType_x2.Set_ShowTotals(Value: UnicodeString);
begin
  SetAttribute('ShowTotals', Value);
end;

function TXMLEntryType_x2.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['Type'].Text;
end;

procedure TXMLEntryType_x2.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('Type', Value);
end;

function TXMLEntryType_x2.Get_Range: UnicodeString;
begin
  Result := ChildNodes['Range'].Text;
end;

procedure TXMLEntryType_x2.Set_Range(Value: UnicodeString);
begin
  ChildNodes['Range'].NodeValue := Value;
end;

function TXMLEntryType_x2.Get_HeaderRange: UnicodeString;
begin
  Result := ChildNodes['HeaderRange'].Text;
end;

procedure TXMLEntryType_x2.Set_HeaderRange(Value: UnicodeString);
begin
  ChildNodes['HeaderRange'].NodeValue := Value;
end;

function TXMLEntryType_x2.Get_FilterOn: UnicodeString;
begin
  Result := ChildNodes['FilterOn'].Text;
end;

procedure TXMLEntryType_x2.Set_FilterOn(Value: UnicodeString);
begin
  ChildNodes['FilterOn'].NodeValue := Value;
end;

function TXMLEntryType_x2.Get_XPath: UnicodeString;
begin
  Result := ChildNodes['XPath'].Text;
end;

procedure TXMLEntryType_x2.Set_XPath(Value: UnicodeString);
begin
  ChildNodes['XPath'].NodeValue := Value;
end;

function TXMLEntryType_x2.Get_Field: IXMLFieldType_x2List;
begin
  Result := FField;
end;

function TXMLEntryType_x2.Get_ActiveRows: IXMLActiveRowsType_x2;
begin
  Result := ChildNodes['ActiveRows'] as IXMLActiveRowsType_x2;
end;

function TXMLEntryType_x2.Get_NoInserts: UnicodeString;
begin
  Result := ChildNodes['NoInserts'].Text;
end;

procedure TXMLEntryType_x2.Set_NoInserts(Value: UnicodeString);
begin
  ChildNodes['NoInserts'].NodeValue := Value;
end;

function TXMLEntryType_x2.Get_ReadOnly: UnicodeString;
begin
  Result := ChildNodes['ReadOnly'].Text;
end;

procedure TXMLEntryType_x2.Set_ReadOnly(Value: UnicodeString);
begin
  ChildNodes['ReadOnly'].NodeValue := Value;
end;

function TXMLEntryType_x2.Get_InstanceShape: UnicodeString;
begin
  Result := ChildNodes['InstanceShape'].Text;
end;

procedure TXMLEntryType_x2.Set_InstanceShape(Value: UnicodeString);
begin
  ChildNodes['InstanceShape'].NodeValue := Value;
end;

{ TXMLEntryType_x2List }

function TXMLEntryType_x2List.Add: IXMLEntryType_x2;
begin
  Result := AddItem(-1) as IXMLEntryType_x2;
end;

function TXMLEntryType_x2List.Insert(const Index: Integer): IXMLEntryType_x2;
begin
  Result := AddItem(Index) as IXMLEntryType_x2;
end;

function TXMLEntryType_x2List.Get_Item(Index: Integer): IXMLEntryType_x2;
begin
  Result := List[Index] as IXMLEntryType_x2;
end;

{ TXMLFieldType_x2 }

procedure TXMLFieldType_x2.AfterConstruction;
begin
  RegisterChildNode('Cell', TXMLCell_);
  RegisterChildNode('DataValidation', TXMLDataValidationType_x);
  RegisterChildNode('AutoFilterColumn', TXMLAutoFilterColumnType_x);
  inherited;
end;

function TXMLFieldType_x2.Get_ID: UnicodeString;
begin
  Result := AttributeNodes['ID'].Text;
end;

procedure TXMLFieldType_x2.Set_ID(Value: UnicodeString);
begin
  SetAttribute('ID', Value);
end;

function TXMLFieldType_x2.Get_Range: UnicodeString;
begin
  Result := ChildNodes['Range'].Text;
end;

procedure TXMLFieldType_x2.Set_Range(Value: UnicodeString);
begin
  ChildNodes['Range'].NodeValue := Value;
end;

function TXMLFieldType_x2.Get_XPath: UnicodeString;
begin
  Result := ChildNodes['XPath'].Text;
end;

procedure TXMLFieldType_x2.Set_XPath(Value: UnicodeString);
begin
  ChildNodes['XPath'].NodeValue := Value;
end;

function TXMLFieldType_x2.Get_XSDType: UnicodeString;
begin
  Result := ChildNodes['XSDType'].Text;
end;

procedure TXMLFieldType_x2.Set_XSDType(Value: UnicodeString);
begin
  ChildNodes['XSDType'].NodeValue := Value;
end;

function TXMLFieldType_x2.Get_Cell: IXMLCell_;
begin
  Result := ChildNodes['Cell'] as IXMLCell_;
end;

function TXMLFieldType_x2.Get_DataValidation: IXMLDataValidationType_x;
begin
  Result := ChildNodes['DataValidation'] as IXMLDataValidationType_x;
end;

function TXMLFieldType_x2.Get_Aggregate: UnicodeString;
begin
  Result := ChildNodes['Aggregate'].Text;
end;

procedure TXMLFieldType_x2.Set_Aggregate(Value: UnicodeString);
begin
  ChildNodes['Aggregate'].NodeValue := Value;
end;

function TXMLFieldType_x2.Get_AutoFilterColumn: IXMLAutoFilterColumnType_x;
begin
  Result := ChildNodes['AutoFilterColumn'] as IXMLAutoFilterColumnType_x;
end;

{ TXMLFieldType_x2List }

function TXMLFieldType_x2List.Add: IXMLFieldType_x2;
begin
  Result := AddItem(-1) as IXMLFieldType_x2;
end;

function TXMLFieldType_x2List.Insert(const Index: Integer): IXMLFieldType_x2;
begin
  Result := AddItem(Index) as IXMLFieldType_x2;
end;

function TXMLFieldType_x2List.Get_Item(Index: Integer): IXMLFieldType_x2;
begin
  Result := List[Index] as IXMLFieldType_x2;
end;

{ TXMLCell_ }

procedure TXMLCell_.AfterConstruction;
begin
  RegisterChildNode('SmartTags', TXMLSmartTagsElt_o);
  RegisterChildNode('Data', TXMLData_);
  RegisterChildNode('Comment', TXMLCommentType_);
  RegisterChildNode('phonetictext', TXMLPhonetictext_x);
  RegisterChildNode('NamedCell', TXMLNamedCell_);
  FSmartTags := CreateCollection(TXMLSmartTagsElt_oList, IXMLSmartTagsElt_o, 'SmartTags') as IXMLSmartTagsElt_oList;
  FNamedCell := CreateCollection(TXMLNamedCell_List, IXMLNamedCell_, 'NamedCell') as IXMLNamedCell_List;
  inherited;
end;

function TXMLCell_.Get_ArrayRange: UnicodeString;
begin
  Result := AttributeNodes['ArrayRange'].Text;
end;

procedure TXMLCell_.Set_ArrayRange(Value: UnicodeString);
begin
  SetAttribute('ArrayRange', Value);
end;

function TXMLCell_.Get_Formula: UnicodeString;
begin
  Result := AttributeNodes['Formula'].Text;
end;

procedure TXMLCell_.Set_Formula(Value: UnicodeString);
begin
  SetAttribute('Formula', Value);
end;

function TXMLCell_.Get_HRef: UnicodeString;
begin
  Result := AttributeNodes['HRef'].Text;
end;

procedure TXMLCell_.Set_HRef(Value: UnicodeString);
begin
  SetAttribute('HRef', Value);
end;

function TXMLCell_.Get_Index: LongWord;
begin
  Result := AttributeNodes['Index'].NodeValue;
end;

procedure TXMLCell_.Set_Index(Value: LongWord);
begin
  SetAttribute('Index', Value);
end;

function TXMLCell_.Get_MergeAcross: Int64;
begin
  Result := AttributeNodes['MergeAcross'].NodeValue;
end;

procedure TXMLCell_.Set_MergeAcross(Value: Int64);
begin
  SetAttribute('MergeAcross', Value);
end;

function TXMLCell_.Get_MergeDown: Int64;
begin
  Result := AttributeNodes['MergeDown'].NodeValue;
end;

procedure TXMLCell_.Set_MergeDown(Value: Int64);
begin
  SetAttribute('MergeDown', Value);
end;

function TXMLCell_.Get_StyleID: UnicodeString;
begin
  Result := AttributeNodes['StyleID'].Text;
end;

procedure TXMLCell_.Set_StyleID(Value: UnicodeString);
begin
  SetAttribute('StyleID', Value);
end;

function TXMLCell_.Get_HRefScreenTip: UnicodeString;
begin
  Result := AttributeNodes['HRefScreenTip'].Text;
end;

procedure TXMLCell_.Set_HRefScreenTip(Value: UnicodeString);
begin
  SetAttribute('HRefScreenTip', Value);
end;

function TXMLCell_.Get_PasteFormula: UnicodeString;
begin
  Result := AttributeNodes['PasteFormula'].Text;
end;

procedure TXMLCell_.Set_PasteFormula(Value: UnicodeString);
begin
  SetAttribute('PasteFormula', Value);
end;

function TXMLCell_.Get_SmartTags: IXMLSmartTagsElt_oList;
begin
  Result := FSmartTags;
end;

function TXMLCell_.Get_Data: IXMLData_;
begin
  Result := ChildNodes['Data'] as IXMLData_;
end;

function TXMLCell_.Get_Comment: IXMLCommentType_;
begin
  Result := ChildNodes['Comment'] as IXMLCommentType_;
end;

function TXMLCell_.Get_Phonetictext: IXMLPhonetictext_x;
begin
  Result := ChildNodes['phonetictext'] as IXMLPhonetictext_x;
end;

function TXMLCell_.Get_NamedCell: IXMLNamedCell_List;
begin
  Result := FNamedCell;
end;

{ TXMLCommentType_ }

procedure TXMLCommentType_.AfterConstruction;
begin
  RegisterChildNode('Data', TXMLData_);
  inherited;
end;

function TXMLCommentType_.Get_Author: UnicodeString;
begin
  Result := AttributeNodes['Author'].Text;
end;

procedure TXMLCommentType_.Set_Author(Value: UnicodeString);
begin
  SetAttribute('Author', Value);
end;

function TXMLCommentType_.Get_ShowAlways: UnicodeString;
begin
  Result := AttributeNodes['ShowAlways'].Text;
end;

procedure TXMLCommentType_.Set_ShowAlways(Value: UnicodeString);
begin
  SetAttribute('ShowAlways', Value);
end;

function TXMLCommentType_.Get_Data: IXMLData_;
begin
  Result := ChildNodes['Data'] as IXMLData_;
end;

{ TXMLNamedCell_ }

function TXMLNamedCell_.Get_Name: UnicodeString;
begin
  Result := AttributeNodes['Name'].Text;
end;

procedure TXMLNamedCell_.Set_Name(Value: UnicodeString);
begin
  SetAttribute('Name', Value);
end;

{ TXMLNamedCell_List }

function TXMLNamedCell_List.Add: IXMLNamedCell_;
begin
  Result := AddItem(-1) as IXMLNamedCell_;
end;

function TXMLNamedCell_List.Insert(const Index: Integer): IXMLNamedCell_;
begin
  Result := AddItem(Index) as IXMLNamedCell_;
end;

function TXMLNamedCell_List.Get_Item(Index: Integer): IXMLNamedCell_;
begin
  Result := List[Index] as IXMLNamedCell_;
end;

{ TXMLActiveRowsType_x2 }

procedure TXMLActiveRowsType_x2.AfterConstruction;
begin
  ItemTag := 'ActiveRow';
  ItemInterface := IXMLNode;
  inherited;
end;

function TXMLActiveRowsType_x2.Get_ActiveRow(Index: Integer): UnicodeString;
begin
  Result := List[Index].Text;
end;

function TXMLActiveRowsType_x2.Add(const ActiveRow: UnicodeString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := ActiveRow;
end;

function TXMLActiveRowsType_x2.Insert(const Index: Integer; const ActiveRow: UnicodeString): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := ActiveRow;
end;

{ TXMLMapdata_x2 }

{ TXMLBindingType_x2 }

procedure TXMLBindingType_x2.AfterConstruction;
begin
  RegisterChildNode('DataSource', TXMLDataSource_);
  inherited;
end;

function TXMLBindingType_x2.Get_ID: UnicodeString;
begin
  Result := AttributeNodes['ID'].Text;
end;

procedure TXMLBindingType_x2.Set_ID(Value: UnicodeString);
begin
  SetAttribute('ID', Value);
end;

function TXMLBindingType_x2.Get_LoadMode: UnicodeString;
begin
  Result := AttributeNodes['LoadMode'].Text;
end;

procedure TXMLBindingType_x2.Set_LoadMode(Value: UnicodeString);
begin
  SetAttribute('LoadMode', Value);
end;

function TXMLBindingType_x2.Get_Async: UnicodeString;
begin
  Result := AttributeNodes['Async'].Text;
end;

procedure TXMLBindingType_x2.Set_Async(Value: UnicodeString);
begin
  SetAttribute('Async', Value);
end;

function TXMLBindingType_x2.Get_MapID: UnicodeString;
begin
  Result := ChildNodes['MapID'].Text;
end;

procedure TXMLBindingType_x2.Set_MapID(Value: UnicodeString);
begin
  ChildNodes['MapID'].NodeValue := Value;
end;

function TXMLBindingType_x2.Get_DataSource: IXMLDataSource_;
begin
  Result := ChildNodes['DataSource'] as IXMLDataSource_;
end;

{ TXMLBindingType_x2List }

function TXMLBindingType_x2List.Add: IXMLBindingType_x2;
begin
  Result := AddItem(-1) as IXMLBindingType_x2;
end;

function TXMLBindingType_x2List.Insert(const Index: Integer): IXMLBindingType_x2;
begin
  Result := AddItem(Index) as IXMLBindingType_x2;
end;

function TXMLBindingType_x2List.Get_Item(Index: Integer): IXMLBindingType_x2;
begin
  Result := List[Index] as IXMLBindingType_x2;
end;

{ TXMLDataSource_ }

procedure TXMLDataSource_.AfterConstruction;
begin
  RegisterChildNode('Type', TXMLType__);
  RegisterChildNode('ConnectionInfo', TXMLConnectionInfoType_);
  inherited;
end;

function TXMLDataSource_.Get_MinorVersion: UnicodeString;
begin
  Result := AttributeNodes['MinorVersion'].Text;
end;

procedure TXMLDataSource_.Set_MinorVersion(Value: UnicodeString);
begin
  SetAttribute('MinorVersion', Value);
end;

function TXMLDataSource_.Get_MajorVersion: UnicodeString;
begin
  Result := AttributeNodes['MajorVersion'].Text;
end;

procedure TXMLDataSource_.Set_MajorVersion(Value: UnicodeString);
begin
  SetAttribute('MajorVersion', Value);
end;

function TXMLDataSource_.Get_Type_: IXMLType__;
begin
  Result := ChildNodes['Type'] as IXMLType__;
end;

function TXMLDataSource_.Get_Name: UnicodeString;
begin
  Result := ChildNodes['Name'].Text;
end;

procedure TXMLDataSource_.Set_Name(Value: UnicodeString);
begin
  ChildNodes['Name'].NodeValue := Value;
end;

function TXMLDataSource_.Get_ConnectionInfo: IXMLConnectionInfoType_;
begin
  Result := ChildNodes['ConnectionInfo'] as IXMLConnectionInfoType_;
end;

function TXMLDataSource_.Get_Description: UnicodeString;
begin
  Result := ChildNodes['Description'].Text;
end;

procedure TXMLDataSource_.Set_Description(Value: UnicodeString);
begin
  ChildNodes['Description'].NodeValue := Value;
end;

function TXMLDataSource_.Get_Keywords: UnicodeString;
begin
  Result := ChildNodes['Keywords'].Text;
end;

procedure TXMLDataSource_.Set_Keywords(Value: UnicodeString);
begin
  ChildNodes['Keywords'].NodeValue := Value;
end;

function TXMLDataSource_.Get_TooltipInfo: UnicodeString;
begin
  Result := ChildNodes['TooltipInfo'].Text;
end;

procedure TXMLDataSource_.Set_TooltipInfo(Value: UnicodeString);
begin
  ChildNodes['TooltipInfo'].NodeValue := Value;
end;

{ TXMLType__ }

procedure TXMLType__.AfterConstruction;
begin
  RegisterChildNode('SubType', TXMLSubType_);
  inherited;
end;

function TXMLType__.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['Type'].Text;
end;

procedure TXMLType__.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('Type', Value);
end;

function TXMLType__.Get_MajorVersion: UnicodeString;
begin
  Result := AttributeNodes['MajorVersion'].Text;
end;

procedure TXMLType__.Set_MajorVersion(Value: UnicodeString);
begin
  SetAttribute('MajorVersion', Value);
end;

function TXMLType__.Get_MinorVersion: UnicodeString;
begin
  Result := AttributeNodes['MinorVersion'].Text;
end;

procedure TXMLType__.Set_MinorVersion(Value: UnicodeString);
begin
  SetAttribute('MinorVersion', Value);
end;

function TXMLType__.Get_SubType: IXMLSubType_;
begin
  Result := ChildNodes['SubType'] as IXMLSubType_;
end;

{ TXMLSubType_ }

function TXMLSubType_.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['Type'].Text;
end;

procedure TXMLSubType_.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('Type', Value);
end;

function TXMLSubType_.Get_MinorVersion: UnicodeString;
begin
  Result := AttributeNodes['MinorVersion'].Text;
end;

procedure TXMLSubType_.Set_MinorVersion(Value: UnicodeString);
begin
  SetAttribute('MinorVersion', Value);
end;

function TXMLSubType_.Get_MajorVersion: UnicodeString;
begin
  Result := AttributeNodes['MajorVersion'].Text;
end;

procedure TXMLSubType_.Set_MajorVersion(Value: UnicodeString);
begin
  SetAttribute('MajorVersion', Value);
end;

{ TXMLConnectionInfoType_ }

procedure TXMLConnectionInfoType_.AfterConstruction;
begin
  RegisterChildNode('Location', TXMLLocation_);
  RegisterChildNode('Authentication', TXMLAuthentication_);
  RegisterChildNode('Header', TXMLHeader_);
  RegisterChildNode('Body', TXMLBody_);
  RegisterChildNode('ClientParameterBindings', TXMLClientParameterBindings_);
  RegisterChildNode('ClientParameterValue', TXMLClientParameterValue_);
  RegisterChildNode('Attribute', TXMLAttribute_);
  RegisterChildNode('If', TXMLIf__);
  RegisterChildNode('CredentialValue', TXMLCredentialValue_);
  inherited;
end;

function TXMLConnectionInfoType_.Get_Purpose: UnicodeString;
begin
  Result := AttributeNodes['Purpose'].Text;
end;

procedure TXMLConnectionInfoType_.Set_Purpose(Value: UnicodeString);
begin
  SetAttribute('Purpose', Value);
end;

function TXMLConnectionInfoType_.Get_Location: IXMLLocation_;
begin
  Result := ChildNodes['Location'] as IXMLLocation_;
end;

function TXMLConnectionInfoType_.Get_Authentication: IXMLAuthentication_;
begin
  Result := ChildNodes['Authentication'] as IXMLAuthentication_;
end;

function TXMLConnectionInfoType_.Get_SOAPAction: UnicodeString;
begin
  Result := ChildNodes['SOAPAction'].Text;
end;

procedure TXMLConnectionInfoType_.Set_SOAPAction(Value: UnicodeString);
begin
  ChildNodes['SOAPAction'].NodeValue := Value;
end;

function TXMLConnectionInfoType_.Get_Header: IXMLHeader_;
begin
  Result := ChildNodes['Header'] as IXMLHeader_;
end;

function TXMLConnectionInfoType_.Get_Body: IXMLBody_;
begin
  Result := ChildNodes['Body'] as IXMLBody_;
end;

function TXMLConnectionInfoType_.Get_File_: UnicodeString;
begin
  Result := ChildNodes['File'].Text;
end;

procedure TXMLConnectionInfoType_.Set_File_(Value: UnicodeString);
begin
  ChildNodes['File'].NodeValue := Value;
end;

function TXMLConnectionInfoType_.Get_ClientParameterBindings: IXMLClientParameterBindings_;
begin
  Result := ChildNodes['ClientParameterBindings'] as IXMLClientParameterBindings_;
end;

function TXMLConnectionInfoType_.Get_ClientParameterValue: IXMLClientParameterValue_;
begin
  Result := ChildNodes['ClientParameterValue'] as IXMLClientParameterValue_;
end;

function TXMLConnectionInfoType_.Get_Attribute: IXMLAttribute_;
begin
  Result := ChildNodes['Attribute'] as IXMLAttribute_;
end;

function TXMLConnectionInfoType_.Get_If_: IXMLIf__;
begin
  Result := ChildNodes['If'] as IXMLIf__;
end;

function TXMLConnectionInfoType_.Get_CredentialValue: IXMLCredentialValue_;
begin
  Result := ChildNodes['CredentialValue'] as IXMLCredentialValue_;
end;

{ TXMLLocation_ }

function TXMLLocation_.Get_Href: UnicodeString;
begin
  Result := AttributeNodes['href'].Text;
end;

procedure TXMLLocation_.Set_Href(Value: UnicodeString);
begin
  SetAttribute('href', Value);
end;

{ TXMLAuthentication_ }

procedure TXMLAuthentication_.AfterConstruction;
begin
  RegisterChildNode('Basic', TXMLBasic_);
  inherited;
end;

function TXMLAuthentication_.Get_Windows: UnicodeString;
begin
  Result := ChildNodes['Windows'].Text;
end;

procedure TXMLAuthentication_.Set_Windows(Value: UnicodeString);
begin
  ChildNodes['Windows'].NodeValue := Value;
end;

function TXMLAuthentication_.Get_Basic: IXMLBasic_;
begin
  Result := ChildNodes['Basic'] as IXMLBasic_;
end;

{ TXMLBasic_ }

procedure TXMLBasic_.AfterConstruction;
begin
  RegisterChildNode('useExplicit', TXMLUseExplicit_);
  inherited;
end;

function TXMLBasic_.Get_UseExplicit: IXMLUseExplicit_;
begin
  Result := ChildNodes['useExplicit'] as IXMLUseExplicit_;
end;

{ TXMLUseExplicit_ }

procedure TXMLUseExplicit_.AfterConstruction;
begin
  RegisterChildNode('userId', TXMLUserId_);
  RegisterChildNode('password', TXMLPassword_);
  inherited;
end;

function TXMLUseExplicit_.Get_UserId: IXMLUserId_;
begin
  Result := ChildNodes['userId'] as IXMLUserId_;
end;

function TXMLUseExplicit_.Get_Password: IXMLPassword_;
begin
  Result := ChildNodes['password'] as IXMLPassword_;
end;

{ TXMLUserId_ }

function TXMLUserId_.Get_Resource: UnicodeString;
begin
  Result := AttributeNodes['Resource'].Text;
end;

procedure TXMLUserId_.Set_Resource(Value: UnicodeString);
begin
  SetAttribute('Resource', Value);
end;

function TXMLUserId_.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['Type'].Text;
end;

procedure TXMLUserId_.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('Type', Value);
end;

{ TXMLPassword_ }

function TXMLPassword_.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['Type'].Text;
end;

procedure TXMLPassword_.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('Type', Value);
end;

function TXMLPassword_.Get_CredentialValue: UnicodeString;
begin
  Result := AttributeNodes['CredentialValue'].Text;
end;

procedure TXMLPassword_.Set_CredentialValue(Value: UnicodeString);
begin
  SetAttribute('CredentialValue', Value);
end;

{ TXMLHeader_ }

{ TXMLBody_ }

{ TXMLClientParameterBindings_ }

procedure TXMLClientParameterBindings_.AfterConstruction;
begin
  RegisterChildNode('ClientParameterBinding', TXMLClientParameterBinding_);
  RegisterChildNode('CredentialBinding', TXMLCredentialBinding_);
  inherited;
end;

function TXMLClientParameterBindings_.Get_ClientParameterBinding: IXMLClientParameterBinding_;
begin
  Result := ChildNodes['ClientParameterBinding'] as IXMLClientParameterBinding_;
end;

function TXMLClientParameterBindings_.Get_CredentialBinding: IXMLCredentialBinding_;
begin
  Result := ChildNodes['CredentialBinding'] as IXMLCredentialBinding_;
end;

{ TXMLClientParameterBinding_ }

function TXMLClientParameterBinding_.Get_Name: UnicodeString;
begin
  Result := AttributeNodes['Name'].Text;
end;

procedure TXMLClientParameterBinding_.Set_Name(Value: UnicodeString);
begin
  SetAttribute('Name', Value);
end;

function TXMLClientParameterBinding_.Get_Location: UnicodeString;
begin
  Result := AttributeNodes['Location'].Text;
end;

procedure TXMLClientParameterBinding_.Set_Location(Value: UnicodeString);
begin
  SetAttribute('Location', Value);
end;

function TXMLClientParameterBinding_.Get_Item: UnicodeString;
begin
  Result := AttributeNodes['Item'].Text;
end;

procedure TXMLClientParameterBinding_.Set_Item(Value: UnicodeString);
begin
  SetAttribute('Item', Value);
end;

function TXMLClientParameterBinding_.Get_DefaultValue: UnicodeString;
begin
  Result := AttributeNodes['DefaultValue'].Text;
end;

procedure TXMLClientParameterBinding_.Set_DefaultValue(Value: UnicodeString);
begin
  SetAttribute('DefaultValue', Value);
end;

{ TXMLCredentialBinding_ }

procedure TXMLCredentialBinding_.AfterConstruction;
begin
  RegisterChildNode('Credential', TXMLCredential_);
  ItemTag := 'Credential';
  ItemInterface := IXMLCredential_;
  inherited;
end;

function TXMLCredentialBinding_.Get_Resource: UnicodeString;
begin
  Result := AttributeNodes['Resource'].Text;
end;

procedure TXMLCredentialBinding_.Set_Resource(Value: UnicodeString);
begin
  SetAttribute('Resource', Value);
end;

function TXMLCredentialBinding_.Get_Credential(Index: Integer): IXMLCredential_;
begin
  Result := List[Index] as IXMLCredential_;
end;

function TXMLCredentialBinding_.Add: IXMLCredential_;
begin
  Result := AddItem(-1) as IXMLCredential_;
end;

function TXMLCredentialBinding_.Insert(const Index: Integer): IXMLCredential_;
begin
  Result := AddItem(Index) as IXMLCredential_;
end;

{ TXMLCredential_ }

function TXMLCredential_.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['Type'].Text;
end;

procedure TXMLCredential_.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('Type', Value);
end;

function TXMLCredential_.Get_DefaultValue: UnicodeString;
begin
  Result := AttributeNodes['DefaultValue'].Text;
end;

procedure TXMLCredential_.Set_DefaultValue(Value: UnicodeString);
begin
  SetAttribute('DefaultValue', Value);
end;

{ TXMLClientParameterValue_ }

function TXMLClientParameterValue_.Get_Name: UnicodeString;
begin
  Result := AttributeNodes['Name'].Text;
end;

procedure TXMLClientParameterValue_.Set_Name(Value: UnicodeString);
begin
  SetAttribute('Name', Value);
end;

{ TXMLIf__ }

procedure TXMLIf__.AfterConstruction;
begin
  RegisterChildNode('ClientParameterValue', TXMLClientParameterValue_);
  inherited;
end;

function TXMLIf__.Get_ClientParameter: UnicodeString;
begin
  Result := AttributeNodes['ClientParameter'].Text;
end;

procedure TXMLIf__.Set_ClientParameter(Value: UnicodeString);
begin
  SetAttribute('ClientParameter', Value);
end;

function TXMLIf__.Get_ClientParameterValue: IXMLClientParameterValue_;
begin
  Result := ChildNodes['ClientParameterValue'] as IXMLClientParameterValue_;
end;

{ TXMLCredentialValue_ }

function TXMLCredentialValue_.Get_Resource: UnicodeString;
begin
  Result := AttributeNodes['Resource'].Text;
end;

procedure TXMLCredentialValue_.Set_Resource(Value: UnicodeString);
begin
  SetAttribute('Resource', Value);
end;

function TXMLCredentialValue_.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['Type'].Text;
end;

procedure TXMLCredentialValue_.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('Type', Value);
end;

{ TXMLComponentOptionsType_c }

procedure TXMLComponentOptionsType_c.AfterConstruction;
begin
  RegisterChildNode('Toolbar', TXMLToolbar_c);
  RegisterChildNode('Label', TXMLLabel__c);
  inherited;
end;

function TXMLComponentOptionsType_c.Get_Toolbar: IXMLToolbar_c;
begin
  Result := ChildNodes['Toolbar'] as IXMLToolbar_c;
end;

function TXMLComponentOptionsType_c.Get_SpreadsheetAutoFit: UnicodeString;
begin
  Result := ChildNodes['SpreadsheetAutoFit'].Text;
end;

procedure TXMLComponentOptionsType_c.Set_SpreadsheetAutoFit(Value: UnicodeString);
begin
  ChildNodes['SpreadsheetAutoFit'].NodeValue := Value;
end;

function TXMLComponentOptionsType_c.Get_Label_: IXMLLabel__c;
begin
  Result := ChildNodes['Label'] as IXMLLabel__c;
end;

function TXMLComponentOptionsType_c.Get_MaxHeight: UnicodeString;
begin
  Result := ChildNodes['MaxHeight'].Text;
end;

procedure TXMLComponentOptionsType_c.Set_MaxHeight(Value: UnicodeString);
begin
  ChildNodes['MaxHeight'].NodeValue := Value;
end;

function TXMLComponentOptionsType_c.Get_MaxWidth: UnicodeString;
begin
  Result := ChildNodes['MaxWidth'].Text;
end;

procedure TXMLComponentOptionsType_c.Set_MaxWidth(Value: UnicodeString);
begin
  ChildNodes['MaxWidth'].NodeValue := Value;
end;

function TXMLComponentOptionsType_c.Get_NextSheetNumber: Integer;
begin
  Result := ChildNodes['NextSheetNumber'].NodeValue;
end;

procedure TXMLComponentOptionsType_c.Set_NextSheetNumber(Value: Integer);
begin
  ChildNodes['NextSheetNumber'].NodeValue := Value;
end;

{ TXMLToolbar_c }

function TXMLToolbar_c.Get_Hidden: UnicodeString;
begin
  Result := AttributeNodes['Hidden'].Text;
end;

procedure TXMLToolbar_c.Set_Hidden(Value: UnicodeString);
begin
  SetAttribute('Hidden', Value);
end;

function TXMLToolbar_c.Get_HideOfficeLogo: UnicodeString;
begin
  Result := ChildNodes['HideOfficeLogo'].Text;
end;

procedure TXMLToolbar_c.Set_HideOfficeLogo(Value: UnicodeString);
begin
  ChildNodes['HideOfficeLogo'].NodeValue := Value;
end;

{ TXMLLabel__c }

function TXMLLabel__c.Get_Caption: UnicodeString;
begin
  Result := ChildNodes['Caption'].Text;
end;

procedure TXMLLabel__c.Set_Caption(Value: UnicodeString);
begin
  ChildNodes['Caption'].NodeValue := Value;
end;

{ TXMLIntegerList }

function TXMLIntegerList.Add(const Value: Integer): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := Value;
end;

function TXMLIntegerList.Insert(const Index: Integer; const Value: Integer): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := Value;
end;

function TXMLIntegerList.Get_Item(Index: Integer): Integer;
begin
  Result := List[Index].NodeValue;
end;

{ TXMLSubtotalTypeList }

function TXMLSubtotalTypeList.Add(const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := Value;
end;

function TXMLSubtotalTypeList.Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := Value;
end;

function TXMLSubtotalTypeList.Get_Item(Index: Integer): UnicodeString;
begin
  Result := List[Index].NodeValue;
end;

{ TXMLDoubleList }

function TXMLDoubleList.Add(const Value: Double): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := Value;
end;

function TXMLDoubleList.Insert(const Index: Integer; const Value: Double): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := Value;
end;

function TXMLDoubleList.Get_Item(Index: Integer): Double;
begin
  Result := List[Index].NodeValue;
end;

{ TXMLString_List }

function TXMLString_List.Add(const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := Value;
end;

function TXMLString_List.Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := Value;
end;

function TXMLString_List.Get_Item(Index: Integer): UnicodeString;
begin
  Result := List[Index].NodeValue;
end;

end.