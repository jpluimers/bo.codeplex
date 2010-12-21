program VoertuigDemo;

uses
  Forms,
  VoertuigMainFormUnit in '..\src\VoertuigMainFormUnit.pas' {VoertuigMainForm},
  VoertuigUnit in '..\src\VoertuigUnit.pas',
  PathUnit in '..\..\..\bo.IO\PathUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TVoertuigMainForm, VoertuigMainForm);
  Application.Run;
end.
