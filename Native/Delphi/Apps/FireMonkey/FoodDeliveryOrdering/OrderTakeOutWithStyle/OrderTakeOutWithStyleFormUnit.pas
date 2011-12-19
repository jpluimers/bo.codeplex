unit OrderTakeOutWithStyleFormUnit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Layouts, FMX.ListBox,
  FMX.Ani, FMX.Objects;

type
  TOrderTakeOutWithStyleForm = class(TForm)
    OrderListBox: TListBox;
    AddButton: TButton;
    Image1: TImage;
    aniRotateImage: TFloatAnimation;
    aniMoveImage: TFloatAnimation;
    StyleBook1: TStyleBook;
    MenuItemsComboBox: TComboBox;
    procedure AddButtonClick(Sender: TObject);
    procedure aniMoveImageFinish(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    SelectedMenuItem: string;
  end;

const
  ImagePath = '..\..\..\Images\';
  ImageExtension = '.png';

var
  OrderTakeOutWithStyleForm: TOrderTakeOutWithStyleForm;

implementation

uses
  System.IOUtils;

{$R *.fmx}

procedure TOrderTakeOutWithStyleForm.AddButtonClick(Sender: TObject);
begin
  if not Assigned (MenuItemsComboBox.ListBox.Selected) then
  begin
    ShowMessage ('Nothing selected');
    Exit;
  end;

  SelectedMenuItem := MenuItemsComboBox.ListBox.Selected.Text;
  Caption := 'Adding ' + SelectedMenuItem;

  Image1.Bitmap.LoadFromFile(ImagePath + SelectedMenuItem + ImageExtension);

  aniRotateImage.Start;

  aniMoveImage.StopValue := OrderListBox.Position.X + 20;
  aniMoveImage.Start;
end;

procedure TOrderTakeOutWithStyleForm.aniMoveImageFinish(Sender: TObject);
var
  ItemImage: TImage;
  ItemText: TText;
  ListItem: TListBoxItem;
begin
  ListItem := TListBoxItem.Create(nil);
  ListItem.Parent := OrderListBox;

  ListItem.StyleLookup := 'imagelabel';

  ItemText := ListItem.FindStyleResource ('text') as TText;
  if Assigned (ItemText) then
    ItemText.Text := SelectedMenuItem
  else
    ShowMessage('Text binding element not found');

  ItemImage := (ListItem.FindStyleResource('image') as TImage);
  if Assigned (ItemImage) then
  begin
    ItemImage.Bitmap := Image1.Bitmap;
    ListItem.Height := Image1.Bitmap.Height;
  end
  else
    ShowMessage('Image binding element not found');

  Image1.Bitmap.Clear(claWhite);
  Image1.Position.X := 32;
end;

procedure TOrderTakeOutWithStyleForm.FormCreate(Sender: TObject);
var
  FileName: string;
  StringArray: TStringDynArray;
begin
  StringArray := TDirectory.GetFiles(ImagePath, '*' + ImageExtension);
  for FileName in StringArray do
  begin
    MenuItemsComboBox.Items.Add(TPath.GetFileNameWithoutExtension(FileName));
  end;
end;

end.
