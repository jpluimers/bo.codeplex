program CodeGeneratorProject;

uses
  Forms,
  CodeGeneratorMainFormUnit in '..\src\CodeGeneratorMainFormUnit.pas' {CodeGeneratorMainForm},
  StringListWrapperUnit in '..\..\..\bo.Text\StringListWrapperUnit.pas',
  CodeGeneratorUnit in '..\..\..\bo.CodeGenerator\CodeGeneratorUnit.pas',
  ConcreteCollectionsUnit in '..\..\..\bo.Generics\ConcreteCollectionsUnit.pas',
  ConcreteMethodReferencesUnit in '..\..\..\bo.Generics\ConcreteMethodReferencesUnit.pas',
  GeneratedUnit in '..\src\GeneratedUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TCodeGeneratorMainForm, CodeGeneratorMainForm);
  Application.Run;
end.
