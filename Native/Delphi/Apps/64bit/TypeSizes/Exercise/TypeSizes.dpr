program TypeSizes;

uses
  Vcl.Forms,
  TypeSizesFormUnit in 'TypeSizesFormUnit.pas' {TypeSizeDemoForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TTypeSizeDemoForm, TypeSizeDemoForm);
  Application.Run;
end.
