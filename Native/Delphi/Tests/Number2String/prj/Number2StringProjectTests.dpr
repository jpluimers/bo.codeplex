program Number2StringProjectTests;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  Forms,
  TestFramework,
  GUITestRunner,
  TextTestRunner,
  TestRomanNumber2StringUnit in '..\src\TestRomanNumber2StringUnit.pas',
  TestNumber2StringUnit in '..\src\TestNumber2StringUnit.pas',
  Number2StringUnit in '..\..\..\bo.Text\Number2StringUnit.pas',
  ConcreteCollectionsUnit in '..\..\..\bo.Generics\ConcreteCollectionsUnit.pas',
  MathUnit in '..\..\..\bo.System\MathUnit.pas',
  DivModUnit in '..\..\..\bo.System\DivModUnit.pas';

{$R *.RES}

begin
  Application.Initialize;
  if IsConsole then
    with TextTestRunner.RunRegisteredTests do
      Free
  else
    GUITestRunner.RunRegisteredTests;
end.

