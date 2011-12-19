program VclStylesTestDemo01;

uses
  Vcl.Forms,
  MainFormUnit in 'MainFormUnit.pas' {MainForm},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Aqua Graphite');
  Application.Title := 'VCL Styles Test';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
