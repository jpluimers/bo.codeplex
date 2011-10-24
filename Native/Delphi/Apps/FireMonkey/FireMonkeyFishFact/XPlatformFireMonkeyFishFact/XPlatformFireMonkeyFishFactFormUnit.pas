unit XPlatformFireMonkeyFishFactFormUnit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Fmx.Bind.Editors, Fmx.Bind.DBLinks, FMX.Layouts, FMX.Memo,
  Data.Bind.Components, Data.Bind.DBScope, Data.Bind.DBLinks, Data.DB,
  IBCustomDataSet, IBTable, IBDatabase, Fmx.Bind.Navigator, FMX.Grid, FMX.Edit,
  System.Rtti, System.Bindings.Outputs, FMX.Filter.Effects, FMX.Effects;

type
  TXPlatformFireMonkeyFishFactForm = class(TForm)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBTable1: TIBTable;
    IBTable1CATEGORY: TIBStringField;
    IBTable1SPECIES_NAME: TIBStringField;
    IBTable1LENGTH__CM_: TFloatField;
    IBTable1LENGTH_IN: TFloatField;
    IBTable1COMMON_NAME: TIBStringField;
    IBTable1NOTES: TMemoField;
    IBTable1GRAPHIC: TBlobField;
    DataSource1: TDataSource;
    ImageControl1: TImageControl;
    Panel1: TPanel;
    BindingsList1: TBindingsList;
    BindScopeDB1: TBindScopeDB;
    DBLinkImageControl1GRAPHIC1: TBindDBImageLink;
    Memo1: TMemo;
    DBLinkMemo1NOTES1: TBindDBMemoLink;
    BindingExpressionLabel: TLabel;
    IBTable1SPECIES_NO: TFloatField;
    BindNavigator1: TBindNavigator;
    DBLinkStringGrid11: TBindDBGridLink;
    BindExpression1: TBindExpression;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    StringGrid1: TStringGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    DBLinkEdit1SPECIES_NAME1: TBindDBEditLink;
    DBLinkEdit2COMMON_NAME1: TBindDBEditLink;
    DBLinkEdit3LENGTH__CM_1: TBindDBEditLink;
    DBLinkEdit4LENGTH_IN1: TBindDBEditLink;
    StyleBook1: TStyleBook;
    BindLink1: TBindLink;
    BindLinkLabel: TLabel;
    CmPerInchLabel: TLabel;
    BindLinkCmPerInchLabel1: TBindLink;
    DatabaseLocationLabel: TLabel;
    SaveJSONButton: TButton;
    BindExpressionDatabaseLocationLabel1: TBindExpression;
    GlowEffect1: TGlowEffect;
    InvertEffect1: TInvertEffect;
    SaveDialog1: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure SaveJSONButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  XPlatformFireMonkeyFishFactForm: TXPlatformFireMonkeyFishFactForm;



implementation

uses
  Data.DBXJSON,
  System.IOUtils,
  FMX.Platform,
  DataSetInformationUnit,
  DataSetToJsonUnit, Datasnap.DBClient, ClientDataSetUnit;

procedure TXPlatformFireMonkeyFishFactForm.FormCreate(Sender: TObject);
var
  PointerSize: Integer;
begin
{$ifdef MACOS}
  IBDatabase1.DatabaseName := '/Developer/SVN/radstudiodemos.sourceforge.net/branches/RadStudio_XE2/Data/dbdemos.gdb';
{$endif MACOS}
  IBTable1.Open();
  PointerSize := SizeOf(Pointer);
  Caption := Format('%s: %s (Pointer = %d bits / %d bytes)', [Caption, FMX.Platform.Platform.ClassName, PointerSize * 8, PointerSize]);
end;

procedure TXPlatformFireMonkeyFishFactForm.SaveJSONButtonClick(Sender: TObject);
var
  ClientDataSet: TClientDataSet;
  GraphicField: TField;
//  DataSetInformation: string;
  JSONObject: TJSONObject;
  JSONString: string;
begin
//  DataSetInformation := DataSetInfo(IBTable1) +
//    FieldDefsInfo(IBTable1) +
//    FieldsInfo(IBTable1);
//  Platform.SetClipboard(DataSetInformation);
//  ShowMessage(DataSetInformation);

  if SaveDialog1.Execute then
  try
    ClientDataSet := CreateClientDataSetFrom(IBTable1);
    GraphicField := ClientDataSet.FieldByName('GRAPHIC');
//    while ClientDataSet.RecordCount > 2 do
//      ClientDataSet.Delete();
//    ClientDataSet.MergeChangeLog();
    ClientDataSet.First();
    while not ClientDataSet.Eof do
    begin
      ClientDataSet.Edit();
      GraphicField.Clear();
      ClientDataSet.Post();
      ClientDataSet.Next();
    end;
    ClientDataSet.MergeChangeLog();
    try
      JSONObject := DataSetToJSON(ClientDataSet);
      JSONString := JSONObject.ToString();
      TFile.WriteAllText(SaveDialog1.FileName, JSONString);
    finally
      ClientDataSet.Free;
    end;
  finally
    IBTable1.Active := True;
  end;
end;

{$R *.fmx}

end.
