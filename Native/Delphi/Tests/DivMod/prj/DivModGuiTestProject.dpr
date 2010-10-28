program DivModGuiTestProject;

uses
  Forms,
  TestFramework,
  GUITestRunner,
  DivModTestUnit in '..\src\DivModTestUnit.pas',
  DivModUnit in '..\..\..\bo.System\DivModUnit.pas';

{$R *.res}

begin
  TGUITestRunner.runRegisteredTests;
end.
