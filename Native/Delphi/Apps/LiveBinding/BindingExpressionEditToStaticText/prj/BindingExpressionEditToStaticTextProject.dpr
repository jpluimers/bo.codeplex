program BindingExpressionEditToStaticTextProject;

uses
  Vcl.Forms,
  MainFormUnit in '..\src\MainFormUnit.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
