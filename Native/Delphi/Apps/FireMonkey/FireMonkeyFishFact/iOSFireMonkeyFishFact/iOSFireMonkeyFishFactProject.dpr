program iOSFireMonkeyFishFactProject;

uses
  FMX_Forms,
  iOSFireMonkeyFishFactFormUnit in 'iOSFireMonkeyFishFactFormUnit.pas' {iOSFireMonkeyFishFactForm},
  superobject in 'superobject.pas',
  FishFactEntryUnit in 'FishFactEntryUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TiOSFireMonkeyFishFactForm, iOSFireMonkeyFishFactForm);
  Application.Run;
end.
