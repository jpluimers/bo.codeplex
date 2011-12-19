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
    Label1: TLabel;
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
    StylesComboBox: TComboBox;
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
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StylesComboBoxChange(Sender: TObject);
  strict protected
    procedure InitControls;
    procedure InitStyleList;
  end;

var
  MainForm: TMainForm;

implementation

uses Vcl.Themes, Vcl.Styles;

{$R *.dfm}

procedure TMainForm.Button1Click(Sender: TObject);
begin
  Edit1.Color := clMaroon;
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
  sleep(10);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  InitControls();

  InitStyleList();
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  sleep(10);
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

procedure TMainForm.InitStyleList;
var
  Index: Integer;
begin
  for Index := Low(TStyleManager.StyleNames) to High(TStyleManager.StyleNames) do
  begin
    StylesComboBox.Items.Add(TStyleManager.StyleNames[Index]);
  end;

  StylesComboBox.ItemIndex := StylesComboBox.Items.IndexOf(TStyleManager.ActiveStyle.Name);
end;

procedure TMainForm.StylesComboBoxChange(Sender: TObject);
begin
  TStyleManager.SetStyle(StylesComboBox.Text);
end;

end.
