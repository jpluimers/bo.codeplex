program XmlDataBindingProject;

uses
  Forms,
  XmlDataBindingFormUnit in '..\src\XmlDataBindingFormUnit.pas' {XokumDataBindingForm},
  xokumDataBindingUnit in '..\src\xokumDataBindingUnit.pas',
  ReporterUnit in '..\src\ReporterUnit.pas',
  LoggersUnit in '..\src\LoggersUnit.pas',
  LoggerUnit in '..\src\LoggerUnit.pas',
  ReportersUnit in '..\src\ReportersUnit.pas',
  SetTypeInfoUnit in '..\src\SetTypeInfoUnit.pas',
  RecordTypeInfoUnit in '..\src\RecordTypeInfoUnit.pas',
  EnumTypeInfoUnit in '..\src\EnumTypeInfoUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TXokumDataBindingForm, XokumDataBindingForm);
  Application.Run;
end.
