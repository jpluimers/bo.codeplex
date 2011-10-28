program Mastapp;

uses
  Forms,
  MAIN in '..\src\MAIN.PAS' {MainForm},
  BRPARTS in '..\src\BRPARTS.PAS' {BrPartsForm},
  QryCust in '..\src\QryCust.pas' {QueryCustDlg},
  EDPARTS in '..\src\EDPARTS.PAS' {EdPartsForm},
  BrCstOrd in '..\src\BrCstOrd.pas' {BrCustOrdForm},
  EDCUST in '..\src\EDCUST.PAS' {EdCustForm},
  EDORDERS in '..\src\EDORDERS.PAS' {EdOrderForm},
  SrchDlg in '..\src\SrchDlg.pas' {SearchDlg},
  SPLASH in '..\src\SPLASH.PAS' {SplashForm},
  PICKDATE in '..\src\PICKDATE.PAS' {BrDateForm},
  ABOUT in '..\src\ABOUT.PAS' {AboutBox},
  PICKREP in '..\src\PICKREP.PAS' {PickRpt},
  PickInvc in '..\src\PickInvc.pas' {PickOrderNoDlg},
  DataMod in '..\src\DataMod.pas' {MastData: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  SplashForm := TSplashForm.Create(Application);
  SplashForm.Show;
  SplashForm.Update;
  Application.Title := 'Marine Adventures Order Entry';
  Application.HelpFile := 'MASTAPP.HLP';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TBrPartsForm, BrPartsForm);
  Application.CreateForm(TQueryCustDlg, QueryCustDlg);
  Application.CreateForm(TEdPartsForm, EdPartsForm);
  Application.CreateForm(TBrCustOrdForm, BrCustOrdForm);
  Application.CreateForm(TEdCustForm, EdCustForm);
  Application.CreateForm(TEdOrderForm, EdOrderForm);
  Application.CreateForm(TSearchDlg, SearchDlg);
  Application.CreateForm(TBrDateForm, BrDateForm);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TPickRpt, PickRpt);
  Application.CreateForm(TPickOrderNoDlg, PickOrderNoDlg);
  Application.CreateForm(TMastData, MastData);
  SplashForm.Hide;
  SplashForm.Free;
  Application.Run;
end.
