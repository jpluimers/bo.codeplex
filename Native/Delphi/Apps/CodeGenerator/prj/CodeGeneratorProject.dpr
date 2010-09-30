program CodeGeneratorProject;

uses
  Forms,
  CodeGeneratorMainFormUnit in '..\src\CodeGeneratorMainFormUnit.pas' {CodeGeneratorMainForm},
  StringListWrapperUnit in '..\..\..\bo.Text\StringListWrapperUnit.pas',
  CodeGeneratorUnit in '..\..\..\bo.CodeGenerator\CodeGeneratorUnit.pas',
  ConcreteCollectionsUnit in '..\..\..\bo.Generics\ConcreteCollectionsUnit.pas',
  ConcreteMethodReferencesUnit in '..\..\..\bo.Generics\ConcreteMethodReferencesUnit.pas',
  GeneratedUnit in '..\src\GeneratedUnit.pas',
  NullablesUnit in '..\..\..\bo.System\NullablesUnit.pas',
  BaseTypesUnit in '..\..\..\bo.System\BaseTypesUnit.pas',
  FormatSettingsHelperUnit in '..\..\..\bo.Helpers\FormatSettingsHelperUnit.pas',
  MathUnit in '..\..\..\bo.System\MathUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TCodeGeneratorMainForm, CodeGeneratorMainForm);
  Application.Run;
end.
