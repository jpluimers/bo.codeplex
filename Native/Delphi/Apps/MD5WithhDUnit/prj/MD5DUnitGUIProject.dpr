program MD5DUnitGUIProject;

uses
  Forms,
  TestFramework,
  GUITestRunner,
  MD5TestCaseUnit in '..\src\MD5TestCaseUnit.pas',
  MessageDigest_5 in 'C:\Program Files\Embarcadero\RAD Studio\7.0\source\Win32\soap\wsdlimporter\MessageDigest_5.pas',
  MD5 in '..\src\MD5.pas',
  MD5BaseCalculatorUnit in '..\src\MD5BaseCalculatorUnit.pas';

{$R *.res}

begin
  TGUITestRunner.runRegisteredTests;
end.
