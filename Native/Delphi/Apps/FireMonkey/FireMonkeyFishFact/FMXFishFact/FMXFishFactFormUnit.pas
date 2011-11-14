unit FMXFishFactFormUnit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, FMX.Grid,
  FMX.Layouts, FMX.Memo, FMX.Effects, FMX.Objects, Data.DB, IBDatabase,
  IBCustomDataSet, IBTable, Fmx.Bind.Editors, Data.Bind.DBLinks,
  Fmx.Bind.DBLinks, Fmx.Bind.Navigator;

type
  TFMXFishFactForm = class(TForm)
    IBDatabase1: TIBDatabase;
    IBTable1: TIBTable;
    IBTable1CATEGORY: TIBStringField;
    IBTable1SPECIES_NAME: TIBStringField;
    IBTable1LENGTH__CM_: TFloatField;
    IBTable1LENGTH_IN: TFloatField;
    IBTable1COMMON_NAME: TIBStringField;
    IBTable1NOTES: TMemoField;
    IBTable1GRAPHIC: TBlobField;
    IBTransaction1: TIBTransaction;
    DataSource1: TDataSource;
    Panel1: TPanel;
    GlowEffect1: TGlowEffect;
    Memo1: TMemo;
    StringGrid1: TStringGrid;
    BindingsList1: TBindingsList;
    BindScopeDB1: TBindScopeDB;
    DBLinkMemo1NOTES1: TBindDBMemoLink;
    Label1: TLabel;
    Label2: TLabel;
    DBLinkLabel1COMMON_NAME1: TBindDBTextLink;
    DBLinkLabel2COMMON_NAME1: TBindDBTextLink;
    ImageControl1: TImageControl;
    DBLinkImageControl1GRAPHIC1: TBindDBImageLink;
    DBLinkStringGrid11: TBindDBGridLink;
    BindNavigator1: TBindNavigator;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMXFishFactForm: TFMXFishFactForm;

implementation

uses
  FMX.Platform;

{$R *.fmx}

procedure TFMXFishFactForm.FormCreate(Sender: TObject);
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

end.
