unit Main;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Buttons, StdCtrls, Menus, ExtCtrls, DB;

type
  TDateOrder = (doMDY, doDMY, doYMD);

  TMainForm = class(TForm)
    MainPanel: TPanel;
    PrinterSetup: TPrinterSetupDialog;
    OrderBtn: TSpeedButton;
    BrowseBtn: TSpeedButton;
    PartsBtn: TSpeedButton;
    CloseBtn: TSpeedButton;
    ReportBtn: TSpeedButton;
    HelpBtn: TSpeedButton;
    MainMenu: TMainMenu;
    FileMenu: TMenuItem;
    FilePrinterSetup: TMenuItem;
    FileExit: TMenuItem;
    FileNewOrder: TMenuItem;
    FilePrintReport: TMenuItem;
    PrintCustList: TMenuItem;
    PrintOrders: TMenuItem;
    PrintInvoice: TMenuItem;
    ViewMenu: TMenuItem;
    ViewOrders: TMenuItem;
    ViewPartsInventory: TMenuItem;
    ViewStayOnTop: TMenuItem;
    HelpMenu: TMenuItem;
    HelpAbout: TMenuItem;
    HelpContents: TMenuItem;
    procedure BrowseCustOrd(Sender: TObject);
    procedure CloseApp(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BrowseParts(Sender: TObject);
    procedure ToggleStayonTop(Sender: TObject);
    procedure NewOrder(Sender: TObject);
    procedure HelpBtnClick(Sender: TObject);
    procedure PrinterSetupClick(Sender: TObject);
    procedure AboutClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ReportBtnClick(Sender: TObject);
    procedure OrderReport(Sender: TObject);
    procedure CustomerReport(Sender: TObject);
    procedure InvoiceReport(Sender: TObject);
  private
    procedure PrintOrderReport(Preview: Boolean);
    procedure PrintInvoiceReport(Preview: Boolean);
    procedure PrintCustomerReport(Preview: Boolean);
  end;

var
  MainForm: TMainForm;

implementation

uses
   DataMod,  { Data Module }
   BrCstOrd, { The Browse Orders by Customer form }
   BrParts,  { The Browse Parts form }
   EdOrders, { The Edit Orders form }
   QryCust,  { The Specify Date Range form }
   PickRep,  { The Report Selection form }
   About,    { The About dialog box }
   IniFiles, { Delphi Unit for INI file support }
   PickInvc; { The invoice number selection dialog }

{$R *.dfm}

function GetDateOrder(const DateFormat: string): TDateOrder;
var
  I: Integer;
begin
  Result := doMDY;
  I := 1;
  while I <= Length(DateFormat) do
  begin
    case Chr(Ord(DateFormat[I]) and $DF) of
      'Y': Result := doYMD;
      'M': Result := doMDY;
      'D': Result := doDMY;
    else
      Inc(I);
      Continue;
    end;
    Exit;
  end;
  Result := doMDY;
end;

procedure TMainForm.BrowseCustOrd(Sender: TObject);
begin
  case GetDateOrder(FormatSettings.ShortDateFormat) of
    doYMD: FormatSettings.ShortDateFormat := 'yy/mm/dd';
    doMDY: FormatSettings.ShortDateFormat := 'mm/dd/yy';
    doDMY: FormatSettings.ShortDateFormat := 'dd/mm/yy';
  end;
  BrCustOrdForm.Show;
end;

procedure TMainForm.CloseApp(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  ClientWidth := CloseBtn.Left + CloseBtn.Width + 1;
  ClientHeight := CloseBtn.Top + CloseBtn.Height;
  MainPanel.Align := alClient;
  { position the form at the top of display }
  Left := 0;
  Top := 0;
end;

procedure TMainForm.BrowseParts(Sender: TObject);
begin
  BrPartsForm.Show;
end;


procedure TMainForm.ToggleStayonTop(Sender: TObject);
begin
  with Sender as TMenuItem do
  begin
    Checked := not Checked;
    if Checked then MainForm.FormStyle := fsStayOnTop
    else MainForm.FormStyle := fsNormal;
  end;
end;

procedure TMainForm.NewOrder(Sender: TObject);
begin
  EdOrderForm.Enter;
end;

procedure TMainForm.HelpBtnClick(Sender: TObject);
begin
  Application.HelpCommand(HELP_CONTENTS, 0);
end;

procedure TMainForm.PrinterSetupClick(Sender: TObject);
begin
  PrinterSetup.Execute;
end;

procedure TMainForm.AboutClick(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  Application.HelpCommand(HELP_QUIT,0);
end;

procedure TMainForm.ReportBtnClick(Sender: TObject);
begin
  with PickRpt do
  if ShowModal = mrOK then
    Case ReportType.ItemIndex of
      0: PrintCustomerReport( Preview );
      1: PrintOrderReport( Preview );
      2: PrintInvoiceReport( Preview );
    end;
end;

procedure TMainForm.PrintCustomerReport(Preview: Boolean);
begin

  with MastData.CustByLastInvQuery do
  begin
    Open;
    if Preview then
//       CustomerByInvoiceReport.Preview
    else
//       CustomerByInvoiceReport.Print;
    Close;
  end;
end;

procedure TMainForm.PrintOrderReport(Preview: Boolean);
const
  FromToHeading = 'From ''%s'' To ''%s''';
begin
  // Request the 'From' and 'To' dates from the user.
  with QueryCustDlg do
  begin
    MsgLab.Caption := 'Print all orders ranging:';
    if FromDate = 0 then FromDate := EncodeDate(95, 01, 01);
    if ToDate = 0 then ToDate := Now;

    if ShowModal = mrOk then
    with MastData.OrdersByDateQuery do
    begin
      Close;
      PArams.ParamByName('FromDate').AsDateTime := FromDate;
      PArams.ParamByName('ToDate').AsDateTime := ToDate;
      Open;

      // Format the From To header with the user's dates entered
//      OrdersByDateReport.FromToHeading.Caption := Format(FromToHeading, [DateToStr(FromDate), DateToStr(ToDate)]);

      if Preview then
//         OrdersByDateReport.Preview
      else
//         OrdersByDateReport.Print;
      Close;
     end;
   end;
end;

procedure TMainForm.PrintInvoiceReport(Preview: Boolean);
begin
  if PickOrderNoDlg.ShowModal = mrOk then
     if Preview then
//        InvoiceByOrderNoReport.Preview
     else
//        InvoiceByOrderNoReport.Print;
end;

procedure TMainForm.OrderReport(Sender: TObject);
begin
  PrintOrderReport(False); // print-no preview
end;

procedure TMainForm.CustomerReport(Sender: TObject);
begin
  PrintCustomerReport(False); // print-no preview
end;

procedure TMainForm.InvoiceReport(Sender: TObject);
begin
  PrintInvoiceReport(False); // print-no preview
end;

end.
