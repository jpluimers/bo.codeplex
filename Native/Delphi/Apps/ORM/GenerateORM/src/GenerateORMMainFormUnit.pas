unit GenerateORMMainFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, CheckLst, ExtCtrls,
  ReportersUnit, LoggersUnit, MSSystemTableUnit;

type
  TGenerateORMMainForm = class(TForm)
    AutoSelectAllTablesCheckBox: TCheckBox;
    Bevel1: TBevel;
    ColumnsMemo: TMemo;
    ConnectToDatabaseButton: TButton;
    DatabasePanel: TPanel;
    DeselectAllMenuItem: TMenuItem;
    GenerateORMUnitsButton: TButton;
    GeneratorPanel: TPanel;
    GeneratorStatusLabel: TLabel;
    OnlyBaseObjectsCheckBox: TCheckBox;
    OutputDirectoryLabeledEdit: TLabeledEdit;
    SelectAllMenuItem: TMenuItem;
    SQLDatabaseLabeledEdit: TLabeledEdit;
    SQLPasswordLabeledEdit: TLabeledEdit;
    SQLServerNameLabeledEdit: TLabeledEdit;
    SQLServerUseIntegratedSecurityCheckBox: TCheckBox;
    SQLUserNameLabeledEdit: TLabeledEdit;
    StatusMemo: TMemo;
    TablesCheckListBox: TCheckListBox;
    TablesPanel: TPanel;
    TablesPopupMenu: TPopupMenu;
    WarnForOverwriteCheckBox: TCheckBox;
    procedure ConnectToDatabaseButtonClick(Sender: TObject);
    procedure DeselectAllMenuItemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure GenerateORMUnitsButtonClick(Sender: TObject);
    procedure SelectAllMenuItemClick(Sender: TObject);
    procedure SQLServerUseIntegratedSecurityCheckBoxClick(Sender: TObject);
    procedure TablesCheckListBoxClick(Sender: TObject);
  strict private
    FLogger: TStringsLogger;
    FMSSystemTables: TMSSystemTables;
    FSQLIntegratedSecurity: Boolean;
    procedure ClearDetailControls;
    function ConnectToDatabase: Boolean;
    procedure FetchTables;
    procedure GenerateORM(MSSystemTable: TMSSystemTable);
    procedure SelecteerAlleTabellen;
    procedure ShowColumnsForTable;
    procedure ZetDatabaseGegevens;
  private
    function ShouldWeGenerateORMFile(ORMFileName: string; TableName: string): Boolean;
  strict protected
    function GetSQLDatabase: string; virtual;
    procedure SetSQLDatabase(const Value: string); virtual;
    procedure SetSQLIntegratedSecurity(const Value: Boolean); virtual;
    property MSSystemTables: TMSSystemTables read FMSSystemTables;
    property SQLIntegratedSecurity: Boolean read FSQLIntegratedSecurity write SetSQLIntegratedSecurity;
  public
    property SQLDatabase: string read GetSQLDatabase write SetSQLDatabase;
  end;

var
  GenerateORMMainForm: TGenerateORMMainForm;

implementation

uses
  FileUnit,
  MSConnectionDataModuleUnit, ORMCodeGeneratorUnit, MSSystemColumnUnit, TypInfo, StringUtilsUnit;

{$R *.dfm}

procedure TGenerateORMMainForm.ClearDetailControls;
begin
  StatusMemo.Clear;

  TablesCheckListBox.Clear;
  ColumnsMemo.Clear;

  StatusMemo.Clear;
end;

function TGenerateORMMainForm.ConnectToDatabase: Boolean;
begin
  Result := False;
  try
    MSConnectionDataModuleFactory.DataModule;

    FLogger.Log('Connected.')
  except
    on E: Exception do
    begin
      FLogger.Log('Error during connection:');
      FLogger.Log(E.Message);
      Exit;
    end;
  end;

  Result := True;
end;

procedure TGenerateORMMainForm.ConnectToDatabaseButtonClick(Sender: TObject);
begin
  ClearDetailControls;

  ZetDatabaseGegevens;

  if ConnectToDatabase then
  begin
    FetchTables;
    if AutoSelectAllTablesCheckBox.Checked then
      SelecteerAlleTabellen();
    TablesCheckListBox.SetFocus;
  end;

  GenerateORMUnitsButton.Enabled := True;
end;

procedure TGenerateORMMainForm.DeselectAllMenuItemClick(Sender: TObject);
begin
  TablesCheckListBox.CheckAll(cbUnchecked);
end;

procedure TGenerateORMMainForm.FetchTables;
var
  MSSystemTable: TMSSystemTable;
begin
  MSSystemTables.ForceReFill;
  MSSystemTables.FillForSQLServer;

  FLogger.Log();
  FLogger.Log('%d tables found', [MSSystemTables.Count]);

  for MSSystemTable in MSSystemTables do
    TablesCheckListBox.Items.AddObject(MSSystemTable.TabName, MSSystemTable);
end;

procedure TGenerateORMMainForm.FormCreate(Sender: TObject);
begin
  FLogger := TStringsLogger.Create(StatusMemo.Lines);
  FMSSystemTables := TMSSystemTables.Create;
  SQLIntegratedSecurity := True;
end;

procedure TGenerateORMMainForm.FormDestroy(Sender: TObject);
begin
  FMSSystemTables.Free;
  FLogger.Free;
end;

procedure TGenerateORMMainForm.GenerateORM(MSSystemTable: TMSSystemTable);
var
  BaseDirectory: string;
  Directory: string;
  TableName: string;
  ORMFileName: string;
  ORMCodeGenerator: TORMCodeGenerator;
  GeneratedCode: string;
  UnitType: TUnitType;
  UnitTypeSuffix: string;
begin
  if not Assigned(MSSystemTable) then
    Exit;

  TableName := MSSystemTable.TabName;
  BaseDirectory := IncludeTrailingPathDelimiter(OutputDirectoryLabeledEdit.Text);
  BaseDirectory := IncludeTrailingPathDelimiter(Format('%s%s', [BaseDirectory, SQLDatabase]));

  for UnitType := Low(TUnitType) to High(TUnitType) do
  begin
    if OnlyBaseObjectsCheckBox.Checked then
      if UnitType <> utBase then
        Continue;

    UnitTypeSuffix := StripLowercasePrefix(
      GetEnumName(TypeInfo(TUnitType), Ord(UnitType)));
    Directory :=
      IncludeTrailingPathDelimiter(
        Format('%sORM.%s', [BaseDirectory, UnitTypeSuffix]));
    if not ForceDirectories(Directory) then
      raise EInOutError.CreateFmt('Cannot create directory %s', [Directory]);

    ORMCodeGenerator := TORMCodeGenerator.Create(
      Self, MSSystemTables, MSSystemTable.TabName, UnitType, FLogger);
    try
      GeneratedCode := ORMCodeGenerator.ToString;

      ORMFileName := Format('%s%s', [Directory, ORMCodeGenerator.FileName]);

      if not ShouldWeGenerateORMFile(ORMFileName, TableName) then
        Exit;

      try
        TFile.WriteAllText(ORMFileName, ORMCodeGenerator.ToString);
      except
        on E: Exception do
          FLogger.Log('Writing to %s failed.%s%s: %s', [ORMFileName, sLineBreak, E.ClassName, E.Message]);
      end;
    finally
      ORMCodeGenerator.Free;
    end;
  end;
end;

procedure TGenerateORMMainForm.GenerateORMUnitsButtonClick(Sender: TObject);
var
  i: Integer;
  MSSystemTable: TMSSystemTable;
begin
  StatusMemo.Clear;

  for i := 0 to TablesCheckListBox.Count - 1 do
  begin
    if TablesCheckListBox.Checked[i] then
    begin
      MSSystemTable := TablesCheckListBox.Items.Objects[i] as TMSSystemTable;

      FLogger.Log('Generate ORM for', MSSystemTable.TabName);

      GenerateORM(MSSystemTable);
    end;
  end;

  FLogger.Log('Done..');
end;

function TGenerateORMMainForm.GetSQLDatabase: string;
begin
  Result := SQLDatabaseLabeledEdit.Text;
end;

procedure TGenerateORMMainForm.SelectAllMenuItemClick(Sender: TObject);
begin
  SelecteerAlleTabellen();
end;

procedure TGenerateORMMainForm.SelecteerAlleTabellen;
begin
  TablesCheckListBox.CheckAll(cbChecked);
end;

procedure TGenerateORMMainForm.SetSQLDatabase(const Value: string);
begin
  SQLDatabaseLabeledEdit.Text := Value;
end;

procedure TGenerateORMMainForm.SetSQLIntegratedSecurity(const Value: Boolean);
var
  EditColor: TColor;
begin
  FSQLIntegratedSecurity := Value;

  if Value then
    EditColor := clBtnFace
  else
    EditColor := clWindow;
  SQLPasswordLabeledEdit.Enabled := Value;
  SQLUserNameLabeledEdit.Enabled := Value;
  SQLPasswordLabeledEdit.Color := EditColor;
  SQLUserNameLabeledEdit.Color := EditColor;
end;

function TGenerateORMMainForm.ShouldWeGenerateORMFile(ORMFileName: string; TableName: string): Boolean;
var
  Question: string;
begin
  Result := True;
  if FileExists(ORMFileName) then
  begin
    if WarnForOverwriteCheckBox.Checked then
    begin
      Question := Format('The file %s already exists, do you want to overwrite it?', [ORMFileName]);
      if not (MessageDlg(Question, mtConfirmation, mbYesNoCancel, 0) = mrYes) then
      begin
        FLogger.Log('No ORM generated in %s as it was not allowed to overwrite.', [TableName]);
        Result := False;
      end;
    end;
  end;
end;

procedure TGenerateORMMainForm.ShowColumnsForTable;
var
  MSSystemTable: TMSSystemTable;
  MSSystemColumn: TMSSystemColumn;
  SelectedTableObject: TObject;
begin
  ColumnsMemo.Clear;

  SelectedTableObject := TablesCheckListBox.Items.Objects[TablesCheckListBox.ItemIndex];
  if Assigned(SelectedTableObject) then
  begin
    MSSystemTable := SelectedTableObject as TMSSystemTable;

    for MSSystemColumn in MSSystemTable.MSSystemColumns do
    begin
      ColumnsMemo.Lines.Add(Format('%s (type: %d)', [MSSystemColumn.ColName, MSSystemColumn.ColType]));
    end;
  end;
end;

procedure TGenerateORMMainForm.SQLServerUseIntegratedSecurityCheckBoxClick(Sender: TObject);
begin
  SQLIntegratedSecurity := (Sender as TCheckBox).Checked;
end;

procedure TGenerateORMMainForm.TablesCheckListBoxClick(Sender: TObject);
begin
  ShowColumnsForTable();
end;

procedure TGenerateORMMainForm.ZetDatabaseGegevens;
begin
  MSConnectionDataModuleFactory.MSConfig.IsUsingSqlServer := True;
  MSConnectionDataModuleFactory.MSConfig.SQLServerName := SQLServerNameLabeledEdit.Text;
  MSConnectionDataModuleFactory.MSConfig.SQLServerDatabaseName := SQLDatabase;
  MSConnectionDataModuleFactory.MSConfig.SQLIntegratedSecurity := SQLIntegratedSecurity;
  MSConnectionDataModuleFactory.MSConfig.SQLServerUserName := SQLUserNameLabeledEdit.Text;
  MSConnectionDataModuleFactory.MSConfig.SQLServerPassword := SQLPasswordLabeledEdit.Text;

  FLogger.Log('Connecting to database:');
  FLogger.Log();
  FLogger.Log('SQL Server: ', SQLServerNameLabeledEdit.Text);
  FLogger.Log('Database: ', SQLDatabase);
  FLogger.Log('Username: ', SQLUserNameLabeledEdit.Text);
  FLogger.Log('Password:', '########');
  FLogger.Log();
  FLogger.Log('ConnectionString:', MSConnectionDataModuleFactory.MSConfig.BuildConnectionString);
  FLogger.Log();
end;

end.
