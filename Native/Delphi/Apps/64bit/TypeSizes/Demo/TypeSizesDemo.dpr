program TypeSizesDemo;

uses
  Vcl.Forms,
  TypeSizeDemoFormUnit in 'TypeSizeDemoFormUnit.pas' {TypeSizeDemoForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TTypeSizeDemoForm, TypeSizeDemoForm);
  Application.Run;
end.
