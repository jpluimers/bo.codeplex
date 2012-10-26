//{$define Debug_UpdateFieldControl}
unit DataAwareControlControllerUnit;

// copyright (c) Jeroen W. Pluimers 2001-2003

//##jpl: Implement csoThisContainer
//##jpl: Stick to 80 columns of text
{
jpl: this use case will not fire the controller for the controls mentioned, as the DataSource.DataSet is assigned upfront, and adding DataLinks to the DataSource will not fire an event to the controller:
    GlobaalList := Value.GlobaalList;
    DataSource.DataSet := GlobaalList;
    AssignDataField(Self.SoortDbDisplayLabel, Self.SoortDbEdit, GlobaalList.SoortField);
    AssignDataField(Self.WaardeDbDisplayLabel, Self.WaardeDBEdit, GlobaalList.WaardeField);

A workaround with a TDataSetAction does not function, as the UpdateTarget mechanism of an action only is called when a control is hooked to that action.

Possible solution: through application.idle or hook into TApplication.DoActionIdle
}

{ You can walk the hierarchy from two directions.
  Either you start from the leaves (TControl) back updwards to the TDataSet
  or you start from the TDataSet and walk downwards.
  For a 'full' upward walk, you have to check EVERY active form in the
  application, which potentially is far more work.
  That is why we do a downward walk.

  For an upward walk, you 'just' get the DataSource and FieldName from
  every control and check from there.

  For a downward walk, you have to 'crack' many of the intermediate classes
  because they have hidden the information fairly well (with good reason of course).

  This allows us do dig into some 'cracking' and intermediate objects
  to build a good picture of how Borland has developed this part of the VCL.
}

interface

//{$R "DataAwareControlControllerUnit.dcr"} //##jpl: check out why this doesn't link

uses
  Classes,
  Controls,
  DataLinkReflectorUnit,
  DB,
  DBGrids,
  Graphics, DBActns;

type
  TControllerAction = (
    caToggleReadOnly,       // ReadOnly
    caToggleEnabled,        // Enabled
    caToggleTabStop,        // TabStop
    caToggleParentColor,    // ParentColor
//    caSetColorWhenError,     // Color -- future enhancements
    caSetColorWhenDisabled, // Color
    caSetColorWhenEnabled,  // Color
//    caSetColorWhenEditing,  // Color -- future enhancements - check DataSet.State
//    caSetColorWhenModified, // Color -- future enhancements - checks 'DataSet.Modified' and/or Field.Modified
    caSetColorWhenRequired,  // Color
    caSkipEnabledForReadOnlyControls // like TDBText; you cannot change it, so do not disable it when readonly
  );

  TControllerActionSet = set of TControllerAction;

  TControlScopeTree = (
    cstThisDataSource,      // handle controls bound to the same DataSource as the controller
    cstThisDataSet          // handle controls bound to the same DataSet as the controller
  );

  TControlScopeOwnership = (
    csoAnyOwner,            // handle controls owned by any owner
    csoThisContainer        // handle controls owned by the owner of the controller
  );

  TEditableState = (esEditable, esRequired);
  TEditableStates = set of TEditableState;

const
  DefaultControllerActions = [caToggleReadOnly, caToggleParentColor, caSetColorWhenEnabled, caSkipEnabledForReadOnlyControls];
  DefaultScopeTree = cstThisDataSet;
  DefaultScopeOwnership = csoAnyOwner;
  DefaultDisabledColor = clBtnFace;
  DefaultEnabledColor = clWindow;
  DefaultRequiredColor = clRed or clLtGray;
  DefaultRequiredFontColor = clRed;

type
  TCustomDataAwareControlController = class(TCustomDataLinkReflector)
  strict private
    FControllerActions: TControllerActionSet;
    FOnControllerActionsChanged: TNotifyEvent;
    FScopeOwnership: TControlScopeOwnership;
    FScopeTree: TControlScopeTree;
    FOnScopeOwnershipChanged: TNotifyEvent;
    FOnScopeTreeChanged: TNotifyEvent;
    FOnUpdateControls: TNotifyEvent;
    FDisabledColor: TColor;
    FEnabledColor: TColor;
    FRequiredColor: TColor;
    FRequiredFontColor: TColor;
    FOnDisabledColorChanged: TNotifyEvent;
    FOnEnabledColorChanged: TNotifyEvent;
    FOnRequiredColorChanged: TNotifyEvent;
    FOnRequiredFontColorChanged: TNotifyEvent;
    procedure UpdateDataLinkComponent(ADataLink: TDataLink; Component: TComponent);
  protected // reflector methods
    procedure ActiveChanged(Sender: TObject); override;
    procedure CheckBrowseMode(Sender: TObject); override;
    procedure DataSetChanged(Sender: TObject); override;
    procedure DataSetScrolled(Sender: TObject; Distance: Integer); override;
    procedure EditingChanged(Sender: TObject); override;
    procedure FocusControl(Sender: TObject; Field: TFieldRef); override;
    procedure LayoutChanged(Sender: TObject); override;
    procedure RecordChanged(Sender: TObject; Field: TField); override;
    procedure UpdateData(Sender: TObject); override;
  protected // methods
    procedure ControllerActionChanged; virtual;
    procedure ScopeOwnershipChanged; virtual;
    procedure ScopeTreeChanged; virtual;
    procedure SetControllerActions(const Value: TControllerActionSet); virtual;
    procedure SetDisabledColor(const Value: TColor);
    procedure SetEnabledColor(const Value: TColor);
    procedure SetRequiredColor(const Value: TColor);
    procedure SetScopeOwnership(const Value: TControlScopeOwnership); virtual;
    procedure SetScopeTree(const Value: TControlScopeTree); virtual;
    procedure DisabledColorChanged; virtual;
    procedure EnabledColorChanged; virtual;
    procedure RequiredColorChanged; virtual;
    procedure RequiredFontColorChanged; virtual;
  protected // TreeWalk, cracker and controller logic
    procedure Loaded; override;
    procedure SetRequiredFontColor(const Value: TColor);
    procedure UpdateColumnFromEditableStates(AColumn: TColumn; TheEditableStates: TEditableStates); virtual;
    procedure UpdateControlFromEditableStates(AControl: TControl; TheEditableStates: TEditableStates); virtual;
    procedure UpdateControlEnabledProperty(AControl: TControl; const NewEnabledValue: Boolean); virtual;
    procedure UpdateCustomDbGridFromEditableStates(ACustomDbGrid: TCustomDbGrid; TheEditableStates: TEditableStates);
        virtual;
    procedure UpdateDataSetControl(ADataSet: TDataSet; AControl: TControl); virtual;
    procedure UpdateDataSetControls(ADataSet: TDataSet); virtual;
    procedure UpdateDataSourceControls(ADataSource: TDataSource); virtual;
    procedure UpdateDataLinkControls(ADataLink: TDataLink); virtual;
    procedure UpdateFieldControl(AField: TField; AControl: TControl); virtual;
  public // methods
    constructor Create(AOwner: TComponent); override;
    procedure UpdateControls; virtual;
  public // properties
    property ControllerActions: TControllerActionSet read FControllerActions write SetControllerActions
      default DefaultControllerActions;
    property DisabledColor: TColor read FDisabledColor write SetDisabledColor
      default DefaultDisabledColor;
    property EnabledColor: TColor read FEnabledColor write SetEnabledColor
      default DefaultEnabledColor;
    property RequiredColor: TColor read FRequiredColor write SetRequiredColor
      default DefaultRequiredColor;
    property RequiredFontColor: TColor read FRequiredFontColor write SetRequiredFontColor
      default DefaultRequiredFontColor;
    property ScopeTree: TControlScopeTree read FScopeTree write SetScopeTree
      default DefaultScopeTree;
    property ScopeOwnership: TControlScopeOwnership read FScopeOwnership write SetScopeOwnership
      default DefaultScopeOwnership;
    property OnControllerActionsChanged: TNotifyEvent read FOnControllerActionsChanged write FOnControllerActionsChanged;
    property OnDisabledColorChanged: TNotifyEvent read FOnDisabledColorChanged write FOnDisabledColorChanged;
    property OnEnabledColorChanged: TNotifyEvent read FOnEnabledColorChanged write FOnEnabledColorChanged;
    property OnRequiredColorChanged: TNotifyEvent read FOnRequiredColorChanged write FOnRequiredColorChanged;
    property OnRequiredFontColorChanged: TNotifyEvent read FOnRequiredFontColorChanged write FOnRequiredFontColorChanged;
    property OnScopeTreeChanged: TNotifyEvent read FOnScopeTreeChanged write FOnScopeTreeChanged;
    property OnScopeOwnershipChanged: TNotifyEvent read FOnScopeOwnershipChanged write FOnScopeOwnershipChanged;
    property OnUpdateControls: TNotifyEvent read FOnUpdateControls write FOnUpdateControls;
  end;

  TDataAwareControlController = class(TCustomDataAwareControlController)
  published
    property ControllerActions;
    property DisabledColor;
    property DataSource;
    property EnabledColor;
    property RequiredColor;
    property ScopeTree;
    property ScopeOwnership;
    property OnControllerActionsChanged;
    property OnDisabledColorChanged;
    property OnEnabledColorChanged;
    property OnRequiredColorChanged;
    property OnScopeTreeChanged;
    property OnScopeOwnershipChanged;
  end;

  TCustomDataAwareControlControllerDataSetAction = class(TDataSetAction)
  public
    procedure UpdateTarget(Target: TObject); override;
  end;

// Register a class that can act like a DbLookupControl - i.e. it understands the semantics of TFields that are lookup fields
//procedure RegisterDbLookupControlClass(Value: TControlClass);

// Register a class that should be skipped
//procedure RegisterDbSkipControlClass(Value: TControlClass);

implementation

uses
  DbCtrls,
  DbCrackerUnit,
  DbUtilityUnit,
  StdCtrls, SysUtils, SetTypeInfoUnit, Windows;

{ TCustomDataAwareControlController }

procedure TCustomDataAwareControlController.ActiveChanged(Sender: TObject);
begin
  inherited;
  UpdateControls;
end;

procedure TCustomDataAwareControlController.CheckBrowseMode(Sender: TObject);
begin
  inherited;
  UpdateControls;
end;

procedure TCustomDataAwareControlController.ControllerActionChanged;
begin
  PerformNotifyEvent(Self, OnControllerActionsChanged);
end;

constructor TCustomDataAwareControlController.Create(AOwner: TComponent);
begin
  inherited;
  ControllerActions := DefaultControllerActions;
  ScopeTree := DefaultScopeTree;
  ScopeOwnership := DefaultScopeOwnership;
  DisabledColor := DefaultDisabledColor;
  EnabledColor := DefaultEnabledColor;
  RequiredColor := DefaultRequiredColor;
  RequiredFontColor := DefaultRequiredFontColor;
end;

procedure TCustomDataAwareControlController.DataSetChanged(Sender: TObject);
begin
  inherited;
  UpdateControls;
end;

procedure TCustomDataAwareControlController.DataSetScrolled(Sender: TObject;
  Distance: Integer);
begin
  inherited;
  UpdateControls;
end;

procedure TCustomDataAwareControlController.DisabledColorChanged;
begin
  PerformNotifyEvent(Self, OnDisabledColorChanged);
end;

procedure TCustomDataAwareControlController.EditingChanged(Sender: TObject);
begin
  inherited;
  UpdateControls;
end;

procedure TCustomDataAwareControlController.EnabledColorChanged;
begin
  PerformNotifyEvent(Self, OnEnabledColorChanged);
end;

procedure TCustomDataAwareControlController.FocusControl(Sender: TObject; Field: TFieldRef);
begin
  inherited;
  UpdateControls;
end;

procedure TCustomDataAwareControlController.LayoutChanged(Sender: TObject);
begin
  inherited;
  UpdateControls;
end;

procedure TCustomDataAwareControlController.Loaded;
//var
//  SaveDataSource: TDataSource;
begin
  inherited;
//  SaveDataSource := DataSource;
//  try
//    DataSource := nil;
//  finally // this trick will put us at the *end* of the DataLink notification chain.
//    DataSource := SaveDataSource;
//  end;
  UpdateControls;
end;

procedure TCustomDataAwareControlController.RecordChanged(Sender: TObject; Field: TField);
begin
  inherited;
  UpdateControls;
end;

procedure TCustomDataAwareControlController.RequiredColorChanged;
begin
  PerformNotifyEvent(Self, OnRequiredColorChanged);
end;

procedure TCustomDataAwareControlController.ScopeOwnershipChanged;
begin
  PerformNotifyEvent(Self, OnScopeOwnershipChanged);
  UpdateControls;
end;

procedure TCustomDataAwareControlController.ScopeTreeChanged;
begin
  PerformNotifyEvent(Self, OnScopeTreeChanged);
  UpdateControls;
end;

procedure TCustomDataAwareControlController.SetControllerActions(const Value: TControllerActionSet);
begin
  if Value <> FControllerActions then
  begin
    FControllerActions := Value;
    ControllerActionChanged;
    UpdateControls();
  end;
end;

procedure TCustomDataAwareControlController.SetDisabledColor(const Value: TColor);
begin
  if FDisabledColor <> Value then
  begin
    FDisabledColor := Value;
    DisabledColorChanged;
  end;
end;

procedure TCustomDataAwareControlController.SetEnabledColor(const Value: TColor);
begin
  if FEnabledColor <> Value then
  begin
    FEnabledColor := Value;
    EnabledColorChanged;
  end;
end;

procedure TCustomDataAwareControlController.SetRequiredColor(
  const Value: TColor);
begin
  if FRequiredColor <> Value then
  begin
    FRequiredColor := Value;
    RequiredColorChanged;
  end;
end;

procedure TCustomDataAwareControlController.SetScopeOwnership(
  const Value: TControlScopeOwnership);
begin
  if Value <> FScopeOwnership then
  begin
    FScopeOwnership := Value;
    ScopeOwnershipChanged;
  end;
end;

procedure TCustomDataAwareControlController.SetScopeTree(
  const Value: TControlScopeTree);
begin
  if Value <> FScopeTree then
  begin
    FScopeTree := Value;
    ScopeTreeChanged;
  end;
end;

type // needed for UpdateControlFromEditableStates
  TControlCracker = class(TControl); // hack into the protected section of TControl

procedure TCustomDataAwareControlController.UpdateColumnFromEditableStates(
  AColumn: TColumn; TheEditableStates: TEditableStates);
var
  Parent: TControl;
  IsReadonly: Boolean;
begin
  // TColumn cannot handle any of these:
  //  caToggleEnabled, caToggleTabStop
  // It fakes the handling of caToggleParentColor

  IsReadOnly := TheEditableStates = [];

  // AColumn.ReadOnly will change Field.ReadOnly if the column has IsStored=False
  // but we don't want to change the Field properties, because that is our origin of information
  if caToggleReadOnly in ControllerActions then
    if GetColumnIsStored(AColumn) then
       AColumn.ReadOnly := IsReadOnly;

  // Handle the colors in front of the ParentColor
  if (caSetColorWhenDisabled in ControllerActions) and IsReadOnly then
    AColumn.Color := DisabledColor;
  if (caSetColorWhenEnabled in ControllerActions) and (esEditable in TheEditableStates) then
    AColumn.Color := EnabledColor;
  if (caSetColorWhenRequired in ControllerActions) and (esRequired in TheEditableStates) then
    AColumn.Color := RequiredColor;

  if caToggleParentColor in ControllerActions then
    if IsReadOnly then
    begin
      Parent := AColumn.Grid.Parent;
      if Assigned(Parent) then
        AColumn.Color := TControlCracker(Parent).Color;
    end;
end;

function CanChangeControlColor(AControl: TControl): Boolean;
begin
{
  For some Control classes, it is inappropriate to change the Color property
  Examples are TDBText, TDBCheckBox and TDBRadioGroup.
  Here the Color is always clBtnFace, because the GUI guidelines enforce that.

  We check at the most segregating superclasses, which are these:
    TCustomCheckBox
    TCustomGroupBox

##jpl: In the future, a kind of class registration mechanism would be appropriate
}

  Result := not (
     (AControl is TCustomCheckBox) or
     (AControl is TCustomGroupBox) or
     (AControl is TCustomLabel)
  );
end;

procedure TCustomDataAwareControlController.RequiredFontColorChanged;
begin
  PerformNotifyEvent(Self, OnRequiredFontColorChanged);
end;

procedure TCustomDataAwareControlController.SetRequiredFontColor(const Value: TColor);
begin
  if FRequiredFontColor <> Value then
  begin
    FRequiredFontColor := Value;
    RequiredFontColorChanged;
  end;
end;

procedure TCustomDataAwareControlController.UpdateControlFromEditableStates(
  AControl: TControl; TheEditableStates: TEditableStates);
{ ##jpl:

  Also, if we extend this schema in the future, we need to take care of "Error"
  circumstances as well. We might not want to change back an "Error" color
  to disabled/enabled at all times.
}
begin
  // The ScopeOwnerShip is at this deep level, so we only have to check
  // it one time

  // NB: There is no need to check csoThisContainer because
  //     that is the oposite of csoAnyOwner

  if (ScopeOwnership = csoAnyOwner) or (AControl.Owner = Owner) then
  begin
    // If we have the TDbGrid case, then update it and modify the Columns too
    if AControl is TCustomDBGrid then
      UpdateCustomDbGridFromEditableStates(AControl as TCustomDbGrid, TheEditableStates);

    if (caToggleTabStop in ControllerActions) and (AControl is TWinControl)
    then
      TWinControl(AControl).TabStop := esEditable in TheEditableStates;

    if caToggleReadOnly in ControllerActions then
    begin
{ Not every TControl has a ReadOnly property, so the line below would be too easy
      AControl.ReadOnly := not TheEditableStates
  That is why we use RTTI to ask if the ReadOnly property exists
  If it exists, we set it using the ReadOnly proprety, otherwise we revert to
  the Enabled property }
      if ControlHasReadOnlyProperty(AControl) then
        SetControlReadOnlyProperty(AControl, TheEditableStates = [])
      else // for instance for TDbText
        UpdateControlEnabledProperty(AControl, TheEditableStates = []);
    end;

    if caToggleEnabled in ControllerActions then
      UpdateControlEnabledProperty(AControl, esEditable in TheEditableStates);

{ For some controls, it is not good to change the Color property.
  If it is bad to do so, we revert to the Enabled property }
    if CanChangeControlColor(AControl) then
    begin
      // Handle the colors in front of the ParentColor
      if (caSetColorWhenDisabled in ControllerActions) and (TheEditableStates = []) then
        TControlCracker(AControl).Color := DisabledColor;
      if (caSetColorWhenEnabled in ControllerActions) and (esEditable in TheEditableStates) then
        TControlCracker(AControl).Color := EnabledColor;
      if (caSetColorWhenRequired in ControllerActions) and (esRequired in TheEditableStates) then
        TControlCracker(AControl).Color := RequiredColor;

      if caToggleParentColor in ControllerActions then
        TControlCracker(AControl).ParentColor := TheEditableStates = [];
    end
    else
    begin
      // since we cannot change the Color property, we revert to the Enabled property
      UpdateControlEnabledProperty(AControl, esEditable in TheEditableStates);

      if AControl.Enabled then
      begin
        if (caSetColorWhenRequired in ControllerActions) and (esRequired in TheEditableStates) then
          TControlCracker(AControl).Font.Color := RequiredFontColor;
        if caToggleParentColor in ControllerActions then //##jpl: add caToggleParentFontForNonColorControls
          TControlCracker(AControl).ParentFont := (esEditable in TheEditableStates);
      end;
    end;

  end;
end;

procedure TCustomDataAwareControlController.UpdateControlEnabledProperty(AControl: TControl; const NewEnabledValue: Boolean);
var
  ControlIsReadOnly: Boolean;
begin
  ControlIsReadOnly := AControl is TDBText;
  if ControlIsReadOnly and not (caSkipEnabledForReadOnlyControls in ControllerActions) then
    AControl.Enabled := NewEnabledValue;
end;

procedure TCustomDataAwareControlController.UpdateControls;
begin
  // don't perform this at design-time because then the changes would be stored into to the DFM file
  if not (csDesigning in ComponentState) then
    if not (csLoading in ComponentState) then // Don't run if we are loading - see Loaded method
    begin
      PerformNotifyEvent(Self, OnUpdateControls);
      RequireDataLink;
      if (ScopeTree = cstThisDataSet) and
         Assigned(DataSource) and
         Assigned(DataSource.DataSet)
      then
        UpdateDataSetControls(DataSource.DataSet);
      if (ScopeTree = cstThisDataSource) and
         Assigned(DataSource)
      then
        UpdateDataSourceControls(DataSource);
    end;
end;

procedure TCustomDataAwareControlController.UpdateDataLinkComponent(ADataLink: TDataLink; Component: TComponent);
var
  Field: TField;
  Control: TControl;
  DBLookupControl: TDBLookupControl;
begin
  if Assigned(Component) and (Component is TControl) then
  begin
    Control := Component as TControl;
    Field := nil; //##jpl: uitzoeken voor TDataSourceLink en TListSourceLink hoe we bij het field kunnen komen.
    if ADataLink is TFieldDataLink then
      Field := GetFieldDataLinkField(ADataLink as TFieldDataLink)
    else
    begin
      if Component is TDBLookupControl then
      begin
        DBLookupControl := Component as TDBLookupControl;
        Field := DBLookupControl.Field;
      end;
    end;
    if Assigned(Field) then
      UpdateFieldControl(Field, Control)
    else
      UpdateDataSetControl(DataSet, Control);
  end;
end;

procedure TCustomDataAwareControlController.UpdateCustomDbGridFromEditableStates(ACustomDbGrid: TCustomDbGrid;
    TheEditableStates: TEditableStates);
var
  Columns: TDBGridColumns;
  Index: Integer;
  Column: TColumn;
  FieldEditableStates: TEditableStates;
begin
  if
       (GetCustomDbGridReadOnly(ACustomDBGrid))
    or (not GetCustomDbGridDataLink(ACustomDbGrid).Active)
    or (GetCustomDbGridDataLink(ACustomDbGrid).ReadOnly)
  then
    TheEditableStates := TheEditableStates - [esEditable];

  Columns := GetColumnsFromCustomDbGrid(ACustomDbGrid);
  if Assigned(Columns) then
  begin
    for Index := 0 to Columns.Count-1 do
    begin
      Column := Columns[Index];

      if Assigned(Column.Field) then
      begin
        if ColumnIsEditable (Column) then
          FieldEditableStates := TheEditableStates + [esEditable]
        else
          FieldEditableStates := TheEditableStates - [esEditable];
        if ColumnIsRequired (Column) then
          FieldEditableStates := FieldEditableStates + [esRequired]
        else
          FieldEditableStates := FieldEditableStates - [esRequired];
      end
      else
        FieldEditableStates := TheEditableStates;
      UpdateColumnFromEditableStates(Column, FieldEditableStates);
    end;
  end;
end;

procedure TCustomDataAwareControlController.UpdateData(Sender: TObject);
begin
  inherited;
  UpdateControls;
end;

procedure TCustomDataAwareControlController.UpdateDataLinkControls(ADataLink: TDataLink);
var
  Component: TComponent;
  CustomDbGrid: TCustomDbGrid;
begin
  if GetDataLinkVisualControl(ADataLink) then
  begin
{ Possible TDataLink descendants (*) are not yet supported:
(*) TDetailDataLink

(*) TDataSourceLink
(*) TFieldDataLink
(*) TListSourceLink
TNavDataLink

TDBCtrlGridLink
TReconcileActionLink

(*) TGridDataLink

TDataSetAdapterDataLink

TMultiDimDataLink
}

    if ADataLink is TFieldDataLink then
    begin
      Component := (ADataLink as TFieldDataLink).Control;
      UpdateDataLinkComponent(ADataLink, Component);
    end;

    if ADataLink is TDataSourceLink then
    begin
      Component := GetDataLinkDBLookupControl(ADataLink);
      UpdateDataLinkComponent(ADataLink, Component);
    end;

    if ADataLink is TListSourceLink then
    begin
      Component := GetDataLinkDBLookupControl(ADataLink);
      UpdateDataLinkComponent(ADataLink, Component);
    end;

    if ADataLink is TGridDataLink then
    begin
      CustomDbGrid := GetCustomDbGridFromGridDataLink(ADataLink as TGridDataLink);
      if Assigned(CustomDbGrid) then
      begin
        UpdateDataSetControl(ADataLink.DataSet, CustomDbGrid);
      end;
    end;

  end
end;

procedure TCustomDataAwareControlController.UpdateDataSetControl(ADataSet: TDataSet; AControl: TControl);
var
  EditableStates: TEditableStates;
begin
  //##jpl: what about required?
  if DataSetIsEditable(ADataSet) then
    EditableStates := [esEditable]
  else
    EditableStates := [];
  UpdateControlFromEditableStates(AControl, EditableStates);
end;

procedure TCustomDataAwareControlController.UpdateDataSetControls(ADataSet: TDataSet);
var
  DataSources: TList;
  DataSourceIndex: Integer;
  NewDataSource: TDataSource;
begin
  DataSources := GetDataSourcesFromDataSet(ADataSet);
  for DataSourceIndex := DataSources.Count - 1 downto 0 do
    if TObject(DataSources[DataSourceIndex]) is TDataSource then
    begin
      NewDataSource := TObject(DataSources[DataSourceIndex]) as TDataSource;
      DataSource := NewDataSource;
      UpdateDataSourceControls(DataSource);
    end;
end;

procedure TCustomDataAwareControlController.UpdateDataSourceControls(ADataSource: TDataSource);
var
  DataLinks: TDataLinks;
  DataLinkIndex: Integer;
  DataLink: TDataLink;
begin
  DataLinks := GetDataLinksFromDataSource(ADataSource);

  for DataLinkIndex := 0 to DataLinks.Count-1 do
  begin
    DataLink := TObject(DataLinks[DataLinkIndex]) as TDataLink;
    UpdateDataLinkControls(DataLink);
  end;
end;

procedure TCustomDataAwareControlController.UpdateFieldControl(
  AField: TField; AControl: TControl);
var
  EditableStates: TEditableStates;
{$ifdef Debug_UpdateFieldControl}
  Line: string;
{$endif Debug_UpdateFieldControl}
begin
  if DbControlIsEditable(AControl, AField) then
    EditableStates := [esEditable]
  else
    EditableStates := [];
  if DbControlIsRequired(AControl, AField) and AField.IsNull then
    EditableStates := EditableStates + [esRequired]
  else
    EditableStates := EditableStates - [esRequired];
{$ifdef Debug_UpdateFieldControl}
  Line := Format('AControl=%s(%s), EditableStates=%s',
    [AControl.Name, AControl.ClassName, SetToString(TypeInfo(TEditableStates), EditableStates, True)]);
  OutputDebugString(PChar(Line));
{$endif Debug_UpdateFieldControl}
  UpdateControlFromEditableStates(AControl, EditableStates);
end;

procedure TCustomDataAwareControlControllerDataSetAction.UpdateTarget(Target: TObject);
begin
  if Owner is TCustomDataAwareControlController then
    TCustomDataAwareControlController(Owner).UpdateControls;
end;

end.

