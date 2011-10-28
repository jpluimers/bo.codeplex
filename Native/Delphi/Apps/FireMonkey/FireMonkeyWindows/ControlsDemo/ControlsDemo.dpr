program ControlsDemo;

uses
  FMX.Forms,
  ctrlsdemofrm in 'ctrlsdemofrm.pas' {Form51},
  aboutboxfrm in 'aboutboxfrm.pas' {frmAbout};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmCtrlsDemo, frmCtrlsDemo);
  Application.Run;
end.
