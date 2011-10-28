program iOSFireMonkeyFishFactProject;

uses
  FMX_Forms,
  iOSFireMonkeyFishFactFormUnit in 'iOSFireMonkeyFishFactFormUnit.pas' {iOSFireMonkeyFishFactForm},
  superobject in 'superobject.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TiOSFireMonkeyFishFactForm, iOSFireMonkeyFishFactForm);
  Application.Run;
end.
