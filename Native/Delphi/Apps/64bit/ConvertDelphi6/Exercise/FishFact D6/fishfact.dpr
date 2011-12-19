program Fishfact;

{%File '\\vmware-host\Shared Folders\C on Host\ProjCorr\Conferences\2011 DXE2 Workshop\FishFact D6\IntToStr('}

uses
  Forms,
  Ffactwin in 'Ffactwin.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
