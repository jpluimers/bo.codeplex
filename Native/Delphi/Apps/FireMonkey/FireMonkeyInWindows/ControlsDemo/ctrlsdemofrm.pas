unit ctrlsdemofrm;

interface

uses
  System.SysUtils, System.Classes, System.Types,
  FMX.Forms, FMX.Dialogs, FMX.Objects, FMX.Types, FMX.Layouts, FMX.Controls,
  FMX.Edit, FMX.ListBox, FMX.TabControl, FMX.ExtCtrls, FMX.TreeView, FMX.Effects,
  FMX.Memo, FMX.Colors, FMX.Menus, FMX.Layers3D, FMX.Types3D, UITypes;

type

  { TfrmCtrlsDemo }

  TfrmCtrlsDemo = class(TForm)
    ScaleTrack: TTrackBar;
    Text1: TLabel;
    ControlRoot: TLayout;
    ScaleRoot: TLayout;
    Button1: TButton;
    Text2: TLabel;
    Text3: TLabel;
    ScrollBar1: TScrollBar;
    ScrollBar2: TScrollBar;
    Track1: TTrack;
    Text4: TLabel;
    ScrollBox1: TScrollBox;
    TextScale: TLabel;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    CheckBox1: TCheckBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    StringComboBox1: TComboBox;
    TabItem3: TTabItem;
    Label2: TLabel;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    ListBoxItem6: TListBoxItem;
    Label3: TLabel;
    Label4: TLabel;
    Image1: TImage;
    Label5: TLabel;
    Path1: TPath;
    Label6: TLabel;
    Button2: TButton;
    Rectangle1: TRectangle;
    Text6: TLabel;
    Ellipse1: TEllipse;
    Label7: TLabel;
    TreeView1: TTreeView;
    TreeViewItem1: TTreeViewItem;
    TreeViewItem2: TTreeViewItem;
    TreeViewItem3: TTreeViewItem;
    TreeViewItem4: TTreeViewItem;
    TreeViewItem5: TTreeViewItem;
    TreeViewItem6: TTreeViewItem;
    TreeViewItem7: TTreeViewItem;
    TreeViewItem8: TTreeViewItem;
    TreeViewItem9: TTreeViewItem;
    TreeViewItem10: TTreeViewItem;
    TreeViewItem11: TTreeViewItem;
    TreeViewItem12: TTreeViewItem;
    TreeViewItem13: TTreeViewItem;
    TreeViewItem14: TTreeViewItem;
    TreeViewItem15: TTreeViewItem;
    TreeViewItem16: TTreeViewItem;
    TreeViewItem17: TTreeViewItem;
    TreeViewItem18: TTreeViewItem;
    TreeViewItem19: TTreeViewItem;
    TreeViewItem20: TTreeViewItem;
    TreeViewItem21: TTreeViewItem;
    TreeViewItem22: TTreeViewItem;
    TreeViewItem23: TTreeViewItem;
    TreeViewItem24: TTreeViewItem;
    TreeViewItem25: TTreeViewItem;
    TreeViewItem26: TTreeViewItem;
    TreeViewItem27: TTreeViewItem;
    TreeViewItem28: TTreeViewItem;
    TreeViewItem29: TTreeViewItem;
    TreeViewItem30: TTreeViewItem;
    TreeViewItem31: TTreeViewItem;
    TreeViewItem32: TTreeViewItem;
    TreeViewItem33: TTreeViewItem;
    TreeViewItem34: TTreeViewItem;
    TreeViewItem35: TTreeViewItem;
    TreeViewItem36: TTreeViewItem;
    TreeViewItem37: TTreeViewItem;
    TabItem4: TTabItem;
    Expander1: TExpander;
    Label8: TLabel;
    Button3: TButton;
    GroupBox1: TGroupBox;
    AniIndicator1: TAniIndicator;
    Button4: TButton;
    Button5: TButton;
    Label9: TLabel;
    Image3: TImage;
    Label10: TLabel;
    NumberBox1: TNumberBox;
    TrackBar1: TTrackBar;
    Label12: TLabel;
    Button6: TButton;
    ListBox1: TListBox;
    GlowEffect2: TGlowEffect;
    Label13: TLabel;
    Label14: TLabel;
    Memo1: TMemo;
    Label15: TLabel;
    AngleButton1: TArcDial;
    Label16: TLabel;
    AngleButton2: TArcDial;
    AngleButton3: TArcDial;
    Label17: TLabel;
    PopupBox1: TPopupBox;
    TextBox3: TEdit;
    Rectangle2: TPanel;
    Splitter1: TSplitter;
    Panel1: TPanel;
    Label19: TLabel;
    SpeedButton2: TButton;
    SpeedButton3: TButton;
    StatusBar1: TStatusBar;
    Label20: TLabel;
    Panel2: TPanel;
    TabItem5: TTabItem;
    DropTarget1: TDropTarget;
    TabItem6: TTabItem;
    StringListBox1: TListBox;
    ListTransform: TListBox;
    TrackBar2: TTrackBar;
    Label21: TLabel;
    Label22: TLabel;
    TrackBar3: TTrackBar;
    Ellipse2: TEllipse;
    TextBox1: TEdit;
    TextBox4: TEdit;
    TabItem7: TTabItem;
    CornerButton1: TCornerButton;
    TrackBar4: TTrackBar;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CornerButton2: TCornerButton;
    CornerButton3: TCornerButton;
    CornerButton4: TCornerButton;
    CornerButton5: TCornerButton;
    CornerButton6: TCornerButton;
    Path2: TPath;
    Path3: TPath;
    Label23: TLabel;
    VertScrollBox1: TVertScrollBox;
    Button7: TButton;
    TrackBar5: TTrackBar;
    TextBox5: TEdit;
    Expander2: TExpander;
    Expander3: TExpander;
    Expander4: TExpander;
    ListBox2: TListBox;
    ListBoxItem5: TListBoxItem;
    ListBoxItem7: TListBoxItem;
    ListBoxItem8: TListBoxItem;
    ListBoxItem9: TListBoxItem;
    ListBoxItem10: TListBoxItem;
    ListBoxItem11: TListBoxItem;
    ListBoxItem12: TListBoxItem;
    TreeView2: TTreeView;
    TreeViewItem38: TTreeViewItem;
    CircleButton1: TButton;
    TabItem8: TTabItem;
    Memo2: TMemo;
    SpinBox1: TSpinBox;
    Label26: TLabel;
    SmallScrollBar1: TSmallScrollBar;
    CheckBox7: TCheckBox;
    CheckBox2: TCheckBox;
    Label27: TLabel;
    ComboTrackBar1: TComboTrackBar;
    AlphaTrackBar1: TAlphaTrackBar;
    BWTrackBar1: TBWTrackBar;
    HueTrackBar1: THueTrackBar;
    Label28: TLabel;
    ComboColorBox1: TComboColorBox;
    TextBoxClearBtn1: TClearingEdit;
    CalloutPanel1: TCalloutPanel;
    Label29: TLabel;
    calloutTop: TRadioButton;
    calloutLeft: TRadioButton;
    calloutBottom: TRadioButton;
    calloutRight: TRadioButton;
    Calendar1: TCalendar;
    CalendarBox1: TCalendarBox;
    CalendarTextBox1: TCalendarEdit;
    ListBoxItem13: TListBoxItem;
    ListBoxItem14: TListBoxItem;
    ListBoxItem15: TListBoxItem;
    ListBoxItem16: TListBoxItem;
    ListBoxItem17: TListBoxItem;
    ListBoxItem18: TListBoxItem;
    ListBoxItem19: TListBoxItem;
    ListBoxItem20: TListBoxItem;
    MenuBar1: TMenuBar;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    OpenDialog1: TOpenDialog;
    MenuItem7: TMenuItem;
    ClearingEdit1: TClearingEdit;
    StyleBook1: TStyleBook;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    PopupMenu1: TPopupMenu;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    procedure ScaleTrackChange(Sender: TObject);
    procedure AngleButton1Change(Sender: TObject);
    procedure AngleButton3Change(Sender: TObject);
    procedure AngleButton2Change(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure TrackBar3Change(Sender: TObject);
    procedure TrackBar4Change(Sender: TObject);
    procedure CheckBox3Change(Sender: TObject);
    procedure CheckBox4Change(Sender: TObject);
    procedure CheckBox5Change(Sender: TObject);
    procedure CheckBox6Change(Sender: TObject);
    procedure cornerListChange(Sender: TObject);
    procedure CheckBox7Change(Sender: TObject);
    procedure CheckBox2Change(Sender: TObject);
    procedure calloutBottomChange(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DropTarget1DragOver(Sender: TObject; const Data: TDragObject;
      const Point: TPointF; var Accept: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure TextBox1MouseDown(Sender: TObject; Button: TMouseButton; Shift:
        TShiftState; X, Y: Single);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCtrlsDemo: TfrmCtrlsDemo;

implementation

uses aboutboxfrm;

{$R *.fmx}

procedure TfrmCtrlsDemo.FormCreate(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to 50 do
    with TRectangle.Create(Self) do
    begin
      parent := ScrollBox1;
      width := (30 + random(150));
      height := (30 + random(150));
      hittest := false;
      Position.x := random(1600);
      Position.y := random(1600);
      XRadius := random(20);
      YRadius := XRadius;
      fill.Color := ((50 + random(205)) shl 24) or random($FFFFFF);
    end;
end;

procedure TfrmCtrlsDemo.MenuItem3Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmCtrlsDemo.MenuItem6Click(Sender: TObject);
begin
  frmAbout := TfrmAbout.Create(Application);
  frmAbout.ShowModal;
  frmAbout.Free;
end;

procedure TfrmCtrlsDemo.MenuItem7Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    Application.StyleFileName := OpenDialog1.FileName;
  end;
end;

procedure TfrmCtrlsDemo.ScaleTrackChange(Sender: TObject);
begin
  { change scale }
  ControlRoot.Scale.X := ScaleTrack.Value;
  ControlRoot.Scale.Y := ScaleTrack.Value;
  TextScale.Text := IntToStr(Round(ScaleTrack.Value * 100)) + '%';
end;

procedure TfrmCtrlsDemo.AngleButton1Change(Sender: TObject);
begin
  Label17.Text := IntToStr(Trunc(AngleButton1.Value));
end;

procedure TfrmCtrlsDemo.AngleButton3Change(Sender: TObject);
begin
  Label17.Text := IntToStr(Trunc(AngleButton3.Value));
end;

procedure TfrmCtrlsDemo.Button1Click(Sender: TObject);
var
  V: TViewport3D;
  L: TLayer3D;
begin
  { Create 3D viewport and layer }
  V := TViewport3D.Create(Self);
  V.Parent := Self;
  V.Align := TAlignLayout.alClient;
  V.Color := claNull;
  L := TLayer3D.Create(Self);
  L.Parent := V;
  L.Projection := TProjection.pjScreen;
  L.Align := TAlignLayout.alClient;
  { Move object to 3D scene}
  ScaleRoot.Parent := L;
  { Animate }
  L.AnimateFloat('Position.Z', 500, 1);
  L.AnimateFloatDelay('Position.Z', 0, 1, 1);
  L.AnimateFloatWait('RotationAngle.X', 360, 2, TAnimationType.atInOut, TInterpolationType.itBack);
  { Back to 2D }
  ScaleRoot.Parent := Self;
  { Free 3D }
  L.Free;
  V.Free;
end;

procedure TfrmCtrlsDemo.Button4Click(Sender: TObject);
begin
  MenuItem6Click(self);
end;

procedure TfrmCtrlsDemo.AngleButton2Change(Sender: TObject);
begin
  Label17.Text := IntToStr(Trunc(AngleButton2.Value));
end;

procedure TfrmCtrlsDemo.TrackBar2Change(Sender: TObject);
begin
  ListTransform.RotationAngle := TrackBar2.Value;
  TextBox4.RotationAngle := TrackBar2.Value;
end;

procedure TfrmCtrlsDemo.TrackBar3Change(Sender: TObject);
begin
  ListTransform.Opacity := TrackBar3.Value;
  TextBox4.Opacity := TrackBar3.Value;
end;

procedure TfrmCtrlsDemo.TrackBar4Change(Sender: TObject);
begin
  CornerButton1.XRadius := TrackBar4.Value;
  CornerButton1.YRadius := TrackBar4.Value;

  CornerButton2.XRadius := TrackBar4.Value;;
  CornerButton2.YRadius := TrackBar4.Value;;
  CornerButton3.XRadius := TrackBar4.Value;;
  CornerButton3.YRadius := TrackBar4.Value;;
  CornerButton4.XRadius := TrackBar4.Value;;
  CornerButton4.YRadius := TrackBar4.Value;;

  CornerButton5.XRadius := TrackBar4.Value;;
  CornerButton5.YRadius := TrackBar4.Value;;
  CornerButton6.XRadius := TrackBar4.Value;;
  CornerButton6.YRadius := TrackBar4.Value;;
end;

procedure TfrmCtrlsDemo.CheckBox3Change(Sender: TObject);
begin
  if CheckBox3.IsChecked then
    CornerButton1.Corners := CornerButton1.Corners + [TCorner.crBottomRight]
  else
    CornerButton1.Corners := CornerButton1.Corners - [TCorner.crBottomRight]
end;

procedure TfrmCtrlsDemo.CheckBox4Change(Sender: TObject);
begin
  if CheckBox4.IsChecked then
    CornerButton1.Corners := CornerButton1.Corners + [TCorner.crTopRight]
  else
    CornerButton1.Corners := CornerButton1.Corners - [TCorner.crTopRight]
end;

procedure TfrmCtrlsDemo.CheckBox5Change(Sender: TObject);
begin
  if CheckBox5.IsChecked then
    CornerButton1.Corners := CornerButton1.Corners + [TCorner.crBottomLeft]
  else
    CornerButton1.Corners := CornerButton1.Corners - [TCorner.crBottomLeft]
end;

procedure TfrmCtrlsDemo.CheckBox6Change(Sender: TObject);
begin
  if CheckBox6.IsChecked then
    CornerButton1.Corners := CornerButton1.Corners + [TCorner.crTopLeft]
  else
    CornerButton1.Corners := CornerButton1.Corners - [TCorner.crTopLeft]
end;

procedure TfrmCtrlsDemo.cornerListChange(Sender: TObject);
begin
{  CornerButton1.CornerType := TCornerType(cornerList.ItemIndex);
  CornerButton2.CornerType := TCornerType(cornerList.ItemIndex);
  CornerButton3.CornerType := TCornerType(cornerList.ItemIndex);
  CornerButton4.CornerType := TCornerType(cornerList.ItemIndex);
  CornerButton5.CornerType := TCornerType(cornerList.ItemIndex);
  CornerButton6.CornerType := TCornerType(cornerList.ItemIndex);}
end;

procedure TfrmCtrlsDemo.DropTarget1DragOver(Sender: TObject;
  const Data: TDragObject; const Point: TPointF; var Accept: Boolean);
begin
  Accept := true;
end;

procedure TfrmCtrlsDemo.CheckBox7Change(Sender: TObject);
begin
  ListBox1.UseSmallScrollBars := CheckBox7.IsChecked;
  TreeView1.UseSmallScrollBars := CheckBox7.IsChecked;
end;

procedure TfrmCtrlsDemo.CheckBox2Change(Sender: TObject);
begin
  StringListBox1.MultiSelect := CheckBox2.IsChecked;
end;

procedure TfrmCtrlsDemo.calloutBottomChange(Sender: TObject);
begin
  if calloutLeft.IsChecked then
    CalloutPanel1.CalloutPosition := TCalloutPosition.cpLeft;
  if calloutRight.IsChecked then
    CalloutPanel1.CalloutPosition := TCalloutPosition.cpRight;
  if calloutTop.IsChecked then
    CalloutPanel1.CalloutPosition := TCalloutPosition.cpTop;
  if calloutBottom.IsChecked then
    CalloutPanel1.CalloutPosition := TCalloutPosition.cpBottom;
end;

procedure TfrmCtrlsDemo.FormActivate(Sender: TObject);
begin
  sleep(10);
end;

procedure TfrmCtrlsDemo.TextBox1MouseDown(Sender: TObject; Button:
    TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  Popupmenu1.Popup(X,Y);
end;

end.
