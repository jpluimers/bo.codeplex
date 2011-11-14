program FMXFishFactProject;

uses
  FMX.Forms,
  FMXFishFactFormUnit in 'FMXFishFactFormUnit.pas' {FMXFishFactForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFMXFishFactForm, FMXFishFactForm);
  Application.Run;
end.
