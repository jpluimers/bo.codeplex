program FreeAndNilPointerUnitTestProject;

uses
  Forms,
  TestFramework,
  GUITestRunner,
  FreeAndNilPointerTestCaseUnit in '..\src\FreeAndNilPointerTestCaseUnit.pas',
  FreeAndNilPointerUnit in '..\src\FreeAndNilPointerUnit.pas';

{$R *.res}

begin
  TGUITestRunner.runRegisteredTests;
end.
