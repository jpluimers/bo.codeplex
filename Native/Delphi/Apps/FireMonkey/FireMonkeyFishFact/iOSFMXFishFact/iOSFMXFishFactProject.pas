program iOSFMXFishFactProject;

uses
  cwstring, cthreads, FMX_Forms,
  iOSFMXFishFactFormUnit in 'iOSFMXFishFactFormUnit.pas' {Form2};

{.$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
