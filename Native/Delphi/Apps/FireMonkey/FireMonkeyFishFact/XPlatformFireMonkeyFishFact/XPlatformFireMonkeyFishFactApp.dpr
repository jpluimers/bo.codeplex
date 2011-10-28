program XPlatformFireMonkeyFishFactApp;

uses
  FMX.Forms,
  XPlatformFireMonkeyFishFactFormUnit in 'XPlatformFireMonkeyFishFactFormUnit.pas' {XPlatformFireMonkeyFishFactForm},
  DataSetToJsonUnit in '..\..\..\..\bo.DB\DataSetToJsonUnit.pas',
  DataSetInformationUnit in '..\..\..\..\bo.DB\DataSetInformationUnit.pas',
  ClientDataSetUnit in '..\..\..\..\bo.DB\ClientDataSetUnit.pas',
  BaseObject in '..\..\..\..\..\..\..\radstudiodemos.sourceforge.net\branches\RadStudio_XE2\DataSnapXE\DelphiDSServer\Classes\BaseObject.pas',
  FishFactEntryUnit in 'FishFactEntryUnit.pas',
  DataSetHelperUnit in '..\..\..\..\bo.DB\bo.DB.Helpers\DataSetHelperUnit.pas',
  ComponentHelperUnit in '..\..\..\..\bo.Helpers\ComponentHelperUnit.pas',
  DataSetEnumeratorUnit in '..\..\..\..\bo.DB\DataSetEnumeratorUnit.pas',
  StringUtilsUnit in '..\..\..\..\bo.Text\StringUtilsUnit.pas',
  FieldNameHelperUnit in '..\..\..\..\bo.DB\bo.DB.Helpers\FieldNameHelperUnit.pas',
  superobject in '..\iOSFireMonkeyFishFact\superobject.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TXPlatformFireMonkeyFishFactForm, XPlatformFireMonkeyFishFactForm);
  Application.Run;
end.
