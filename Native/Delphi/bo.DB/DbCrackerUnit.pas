unit DbCrackerUnit;

interface

uses
  Classes,
  DB,
  DBGrids,
  DBCtrls,
  StdCtrls,
  Controls;

function ControlHasReadOnlyProperty(Control: TControl): Boolean;
procedure SetControlReadOnlyProperty(Control: TControl; ReadOnly: Boolean);

function ControlHasDataSourceProperty(Control: TControl): Boolean;
function GetControlDataSourceProperty(Control: TControl): TDataSource;
procedure SetControlDataSourceProperty(Control: TControl; DataSource: TDataSource);

function GetColumnIsStored(Column: TColumn): Boolean;
function GetColumnsFromCustomDbGrid(CustomDbGrid: TCustomDbGrid): TDBGridColumns;
function GetCustomDbGridFromGridDataLink(
  GridDataLink: TGridDataLink): TCustomDbGrid;
function GetCustomDbGridDataLink(CustomDbGrid: TCustomDbGrid): TGridDataLink;
function GetCustomDbGridReadOnly(CustomDbGrid: TCustomDbGrid): Boolean;
function GetDataLinksFromDataSource(DataSource: TDataSource): TList;
function GetDataLinkVisualControl(DataLink: TDataLink): Boolean;
function GetDataSourcesFromDataSet(DataSet: TDataSet): TList;
function GetDataLinkDBLookupControl(const DataLink: TDataLink): TDBLookupControl;
function GetLabelFocusControl(const CustomLabel: TCustomLabel): TWinControl;

function FieldGetText(const Field: TField; var Text: string; const DisplayText: Boolean): string;

function FieldGetClassDesc(const Field: TField): string;

procedure AssignDataField(const DataSource: TDataSource; const DbLookupControl: TDBLookupControl; const Field: TField); overload;

implementation

uses
  TypInfo, //##jpl: for cracking of RTTI
  EnumTypeInfoUnit, SysUtils;

const
  ReadOnlyPropertyName = 'ReadOnly';
  DataSourcePropertyName = 'DataSource';

function ControlHasReadOnlyProperty(Control: TControl): Boolean;
begin
  Result := IsPublishedProp(Control, ReadOnlyPropertyName);
end;

procedure SetControlReadOnlyProperty(Control: TControl; ReadOnly: Boolean);
begin
  if ControlHasReadOnlyProperty(Control) then
    SetOrdProp(Control, ReadOnlyPropertyName, Ord(ReadOnly));
end;

function ControlHasDataSourceProperty(Control: TControl): Boolean;
begin
  Result := IsPublishedProp(Control, DataSourcePropertyName);
end;

function GetControlDataSourceProperty(Control: TControl): TDataSource;
begin
  if ControlHasDataSourceProperty(Control) then
    Result := GetObjectProp(Control, DataSourcePropertyName, TDataSource) as TDataSource
  else
    Result := nil;
end;

procedure SetControlDataSourceProperty(Control: TControl; DataSource: TDataSource);
begin
  if ControlHasDataSourceProperty(Control) then
    SetObjectProp(Control, DataSourcePropertyName, DataSource);
end;

{ Various cracker classes.
  The simple case is to crack various parts of the protected section into a
  public section (actually because the 'implicit friendship' you could live
  without promoting them to public explicitly).
  The complex case is then things have been hidden in the private section.
  This means you have to derive from the superclass, and construct a
  new public section that has exactly the same memory mapping as the old
  private section.
}

type
  TColumnCracker = class(TColumn)
  public
    property IsStored;
  end;

  TCustomDBGridCracker = class(TCustomDBGrid)
  public
    property Columns;
    property ReadOnly;
  end;

  TDataLinkCracker = class(TDataLink)
  public
    property VisualControl;
  end;

  TDataSetCracker = class(TComponent) //##jpl: TDataSet also has IProviderSupport)
  { In TDataSet, this section private, but this causes a compiler
    hint for the private fields that we don't use.
    The change to public does not alter the memory-mapping. }
  public // private
    FFields: TFields;
    FAggFields: TFields;
    FFieldDefs: TFieldDefs;
    FFieldDefList: TFieldDefList;
    FFieldList: TFieldList;
    FDataSources: TList;
  end;

  TDataSourceCracker = class(TDataSource)
  public
    property DataLinks;
  end;

  TGridDataLinkCracker = class(TDataLink)
  { In TGridDataLink, this section private, but this causes a compiler
    hint for the private fields that we don't use.
    The change to public does not alter the memory-mapping. }
  protected // private
    FGrid: TCustomDBGrid;
    FFieldCount: Integer;
    FFieldMap: array of Integer;
    FModified: Boolean;
    FInUpdateData: Boolean;
    FSparseMap: Boolean;
  end;

  TDataSourceLinkCracker = class(TDataLink)
  protected // private
    FDBLookupControl: TDBLookupControl;
  end;

  TListSourceLinkCracker = class(TDataLink)
  protected // private
    FDBLookupControl: TDBLookupControl;
  end;

  function GetColumnIsStored(Column: TColumn): Boolean;
begin
//##jpl: Asserts
  Result := TColumnCracker(Column).IsStored;
end;

function GetColumnsFromCustomDbGrid(CustomDbGrid: TCustomDbGrid): TDBGridColumns;
begin
//##jpl: Asserts
  Result := TCustomDBGridCracker(CustomDbGrid).Columns;
end;

function GetCustomDbGridFromGridDataLink(
  GridDataLink: TGridDataLink): TCustomDbGrid;
begin
//##jpl: Asserts
  Result := TGridDataLinkCracker(GridDataLink).FGrid;
end;

function GetCustomDbGridDataLink(CustomDbGrid: TCustomDbGrid): TGridDataLink;
begin
//##jpl: Asserts
  Result := TCustomDBGridCracker(CustomDbGrid).DataLink;
end;

function GetCustomDbGridReadOnly(CustomDbGrid: TCustomDbGrid): Boolean;
begin
//##jpl: Asserts
  Result := TCustomDBGridCracker(CustomDbGrid).ReadOnly;
end;

resourcestring
  sDataSourceRequired = 'A DataSource is required for this operation';
  sDataSourceWithoutDataLinks = 'This DataSource has undefined DataLinks';

function GetDataLinksFromDataSource(DataSource: TDataSource): TList;
begin
  Assert(Assigned(DataSource), sDataSourceRequired);
  Result := TDataSourceCracker(DataSource).DataLinks as TList; // extra type check for TList
  Assert(Assigned(Result), sDataSourceWithoutDataLinks);
end;

function GetDataLinkVisualControl(DataLink: TDataLink): Boolean;
begin
//##jpl: Asserts
  Result := Assigned(DataLink)
        and TDataLinkCracker(DataLink).VisualControl;
end;

resourcestring
  sDataSetRequired = 'A DataSet is required for this operation';
  sDataSetWithoutDataSources = 'This DataSet has undefined DataSources';

function GetDataSourcesFromDataSet(DataSet: TDataSet): TList;
begin
  Assert(Assigned(DataSet), sDataSetRequired);
  Result := TDataSetCracker(DataSet).FDataSources as TList; // extra type check for TList
  Assert(Assigned(Result), sDataSetWithoutDataSources);
end;

function GetDataLinkDBLookupControl(const DataLink: TDataLink): TDBLookupControl;
begin
  Result := nil;
  if DataLink is TDataSourceLink then
    Result := TDataSourceLinkCracker(DataLink).FDBLookupControl;
  if DataLink is TListSourceLink then
    Result := TListSourceLinkCracker(DataLink).FDBLookupControl;
end;

type
  TCustomLabelCracker = class(TCustomLabel);

type
  TFieldCracker = class(TField);

function GetLabelFocusControl(const CustomLabel: TCustomLabel): TWinControl;
begin
  Result := TCustomLabelCracker(CustomLabel).FocusControl;
end;

function FieldGetText(const Field: TField; var Text: string; const DisplayText: Boolean): string;
var
  FieldCracker: TFieldCracker;
begin
  FieldCracker := TFieldCracker(Field);
  FieldCracker.GetText(Text, DisplayText);
end;

function FieldGetClassDesc(const Field: TField): string;
var
  FieldCracker: TFieldCracker;
begin
  FieldCracker := TFieldCracker(Field);
  Result := FieldCracker.GetClassDesc;
end;

type
  TDBLookupControlHack = class(TDBLookupControl);

procedure AssignDataField(const DataSource: TDataSource; const DbLookupControl: TDBLookupControl; const Field: TField);
var
  FieldKindDescription: string;
begin
  FieldKindDescription := GetEnumNameAndOrdValue(TypeInfo(TFieldKind), Ord(Field.FieldKind));
  Assert(Field.FieldKind = fkLookup, Format('Field %s.%s moet FieldKind = fkLookup hebben, maar heeft ',
    [Field.DataSet.Name, Field.Name, FieldKindDescription]));
  TDBLookupControlHack(DbLookupControl).DataSource := DataSource;
  TDBLookupControlHack(DbLookupControl).DataField := Field.FieldName;
end;

end.
