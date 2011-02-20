program DownloadFromUrlProject;

uses
  Forms,
  DownloadFromUrlMainFormUnit in '..\src\DownloadFromUrlMainFormUnit.pas' {DownloadFromUrlMainForm},
  WinInetUnit in '..\..\..\..\bo.Net\WinInetUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDownloadFromUrlMainForm, DownloadFromUrlMainForm);
  Application.Run;
end.
