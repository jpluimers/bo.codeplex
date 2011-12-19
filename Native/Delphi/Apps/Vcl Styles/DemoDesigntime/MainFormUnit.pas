unit MainFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Menus, Vcl.ImgList, Vcl.StdActns, Vcl.ActnList, Vcl.ToolWin;

type
  TMainForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CopyItem: TMenuItem;
    CutItem: TMenuItem;
    Edit1: TEdit;
    File1: TMenuItem;
    FileCloseItem: TMenuItem;
    FileExitItem: TMenuItem;
    FileNewItem: TMenuItem;
    FileOpenItem: TMenuItem;
    FileSaveAsItem: TMenuItem;
    FileSaveItem: TMenuItem;
    GroupBox1: TGroupBox;
    Help1: TMenuItem;
    HelpAboutItem: TMenuItem;
    ImageList1: TImageList;
    ListBox1: TListBox;
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    MenuItem1: TMenuItem;
    N1: TMenuItem;
    OpenDialog: TOpenDialog;
    PasteItem: TMenuItem;
    ProgressBar1: TProgressBar;
    RadioGroup1: TRadioGroup;
    StatusBar1: TStatusBar;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton9: TToolButton;
    TrackBar1: TTrackBar;
    Window1: TMenuItem;
    WindowArrangeItem: TMenuItem;
    WindowCascadeItem: TMenuItem;
    WindowMinimizeItem: TMenuItem;
    WindowTileItem: TMenuItem;
    WindowTileItem2: TMenuItem;
    procedure FormCreate(Sender: TObject);
  strict protected
    procedure InitControls;
  end;

var
  MainForm: TMainForm;

implementation

uses Vcl.Themes, Vcl.Styles;

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  InitControls();
end;

procedure TMainForm.InitControls;
var
  FontName: string;
  Index: Integer;
begin
  for Index := 0 to Screen.Fonts.Count - 1 do
  begin
    FontName := Screen.Fonts[Index];
    if (FontName[1] = 'C') then
      ListBox1.Items.Add(FontName);
  end;

  Memo1.Lines.LoadFromFile('c:\Program Files (x86)\Embarcadero\RAD Studio\9.0\source\vcl\Vcl.Styles.pas');

  StatusBar1.Panels[0].Text := DateTimeToStr(Now());
  StatusBar1.Panels[1].Text := Format('%d Fonts', [ListBox1.Items.Count]);
end;

end.
