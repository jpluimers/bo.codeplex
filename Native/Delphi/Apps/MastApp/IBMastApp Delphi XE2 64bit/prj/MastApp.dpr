program MastApp;

uses
  Vcl.Forms,
  About in '..\src\About.pas' {AboutBox},
  BrCstOrd in '..\src\BrCstOrd.pas' {BrCustOrdForm},
  Brparts in '..\src\Brparts.pas' {BrPartsForm},
  DataMod in '..\src\DataMod.pas' {MastData: TDataModule},
  Edcust in '..\src\Edcust.pas' {EdCustForm},
  EDOrders in '..\src\EDOrders.pas' {EdOrderForm},
  Edparts in '..\src\Edparts.pas' {EdPartsForm},
  Main in '..\src\Main.pas' {MainForm},
  Pickdate in '..\src\Pickdate.pas' {BrDateForm},
  PickInvc in '..\src\PickInvc.pas' {PickOrderNoDlg},
  Pickrep in '..\src\Pickrep.pas' {PickRpt},
  QryCust in '..\src\QryCust.pas' {QueryCustDlg},
  Splash in '..\src\Splash.pas' {SplashForm},
  SrchDlg in '..\src\SrchDlg.pas' {SearchDlg};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TBrCustOrdForm, BrCustOrdForm);
  Application.CreateForm(TBrPartsForm, BrPartsForm);
  Application.CreateForm(TMastData, MastData);
  Application.CreateForm(TEdCustForm, EdCustForm);
  Application.CreateForm(TEdOrderForm, EdOrderForm);
  Application.CreateForm(TEdPartsForm, EdPartsForm);
  Application.CreateForm(TBrDateForm, BrDateForm);
  Application.CreateForm(TPickOrderNoDlg, PickOrderNoDlg);
  Application.CreateForm(TPickRpt, PickRpt);
  Application.CreateForm(TQueryCustDlg, QueryCustDlg);
  Application.CreateForm(TSplashForm, SplashForm);
  Application.CreateForm(TSearchDlg, SearchDlg);
  Application.Run;
end.
