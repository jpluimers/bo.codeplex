program XMLEOSErrorTest;
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
  XMLEOSErrorTestCaseUnit in 'XMLEOSErrorTestCaseUnit.pas',
  XMLDOMParseErrorToStringUnit in '..\..\..\bo.XML\XMLDOMParseErrorToStringUnit.pas',
  XMLDOMParseErrorUnit in '..\..\..\bo.XML\XMLDOMParseErrorUnit.pas',
  msxmlFactoryUnit in '..\..\..\bo.XML\msxmlFactoryUnit.pas';

{$R *.RES}

begin
  Application.Initialize;
  if IsConsole then
    with TextTestRunner.RunRegisteredTests do
      Free
  else
    GUITestRunner.RunRegisteredTests;
end.

