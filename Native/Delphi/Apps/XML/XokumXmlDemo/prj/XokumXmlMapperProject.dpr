program XmlMapperProject;

uses
  Forms,
  XmlMapperFormUnit in '..\src\XmlMapperFormUnit.pas' {XmlMapperForm},
  XokumDataModuleUnit in '..\src\XokumDataModuleUnit.pas' {XokumDataModule: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TXmlMapperForm, XmlMapperForm);
  Application.CreateForm(TXokumDataModule, XokumDataModule);
  Application.Run;
end.
