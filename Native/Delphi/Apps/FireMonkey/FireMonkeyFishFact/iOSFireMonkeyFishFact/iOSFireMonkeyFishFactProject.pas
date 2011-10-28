program iOSFireMonkeyFishFactProject;

uses
  cwstring, cthreads, FMX_Forms,
  iOSFireMonkeyFishFactFormUnit in 'iOSFireMonkeyFishFactFormUnit.pas' {Form2};

{.$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
