program VclStylesTestDemoRuntime;

uses
  Vcl.Forms,
  MainFormUnit in 'MainFormUnit.pas' {MainForm},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'VCL Styles Test';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
