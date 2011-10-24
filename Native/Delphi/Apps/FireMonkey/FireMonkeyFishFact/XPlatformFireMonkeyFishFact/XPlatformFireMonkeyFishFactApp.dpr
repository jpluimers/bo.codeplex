program XPlatformFireMonkeyFishFactApp;

uses
  FMX.Forms,
  XPlatformFireMonkeyFishFactFormUnit in 'XPlatformFireMonkeyFishFactFormUnit.pas' {XPlatformFireMonkeyFishFactForm},
  DataSetToJsonUnit in '..\..\..\..\bo.DB\DataSetToJsonUnit.pas',
  DataSetInformationUnit in '..\..\..\..\bo.DB\DataSetInformationUnit.pas',
  ClientDataSetUnit in '..\..\..\..\bo.DB\ClientDataSetUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TXPlatformFireMonkeyFishFactForm, XPlatformFireMonkeyFishFactForm);
  Application.Run;
end.
