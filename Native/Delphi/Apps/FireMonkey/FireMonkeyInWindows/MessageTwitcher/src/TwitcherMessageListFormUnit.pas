unit TwitcherMessageListFormUnit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.ListBox, TwitcherMessageFormUnit;

type
  TTwitcherMessageListForm = class(TForm)
    ParentRectangle: TRectangle;
    Button1: TButton;
    ListBox1: TListBox;
    AddButton: TButton;
    ClearButton: TButton;
    procedure AddButtonClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  strict protected
    procedure AddItemToList(ListBox: TListBox);
    procedure ClearListBox(ListBox: TListBox);
    procedure PopulateItemText(ListBoxItem: TListBoxItem; const Title, Body:
        string; const CurrentDateTime: TDateTime);
  public
    { Public declarations }
    TwitcherMessageForm: TTwitcherMessageForm;
  end;

var
  TwitcherMessageListForm: TTwitcherMessageListForm;

implementation

{$R *.fmx}

procedure TTwitcherMessageListForm.AddButtonClick(Sender: TObject);
begin
  AddItemToList(ListBox1);
end;

procedure TTwitcherMessageListForm.AddItemToList(ListBox: TListBox);
var
  AForm: TTwitcherMessageForm;
  ListBoxItem: TListBoxItem;
begin
  ListBoxItem := TListBoxItem.Create(Self);
  AForm := TTwitcherMessageForm.Create(ListBoxItem);

  ListBoxItem.Height := 150;

  AForm.MessageRectangle.Parent := ListBoxItem;

  PopulateItemText(ListBoxItem, IntToStr(ListBox.Count + 1), 'Some Text', now());

  ListBox.AddObject(ListBoxItem);
end;

procedure TTwitcherMessageListForm.Button1Click(Sender: TObject);
begin
  TwitcherMessageForm.MessageRectangle.Parent := ParentRectangle;
end;

procedure TTwitcherMessageListForm.ClearButtonClick(Sender: TObject);
begin
  ClearListBox(ListBox1);
end;

procedure TTwitcherMessageListForm.ClearListBox(ListBox: TListBox);
begin
  while (ListBox.Items.Count > 0) do
  begin
    ListBox.ItemByIndex(0).Free();
  end;
end;

procedure TTwitcherMessageListForm.FormDestroy(Sender: TObject);
begin
  TwitcherMessageForm.Free();
end;

procedure TTwitcherMessageListForm.FormCreate(Sender: TObject);
begin
  TwitcherMessageForm := TTwitcherMessageForm.Create(nil);
end;

procedure TTwitcherMessageListForm.PopulateItemText(ListBoxItem: TListBoxItem; const Title,
    Body: string; const CurrentDateTime: TDateTime);
begin
  TText(ListBoxItem.FindBinding('Title')).Text := Title;
  TText(ListBoxItem.FindBinding('Body')).Text := Body;
  TText(ListBoxItem.FindBinding('Time')).Text := DateTimeToStr(CurrentDateTime);
end;

end.
