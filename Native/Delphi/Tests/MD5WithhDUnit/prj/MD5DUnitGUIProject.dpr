program MD5DUnitGUIProject;

uses
  Forms,
  TestFramework,
  GUITestRunner,
  MD5TestCaseUnit in '..\src\MD5TestCaseUnit.pas',
  MD5 in '..\src\MD5.pas',
  MD5BaseCalculatorUnit in '..\src\MD5BaseCalculatorUnit.pas';

{$R *.res}

begin
  TGUITestRunner.runRegisteredTests;
end.
