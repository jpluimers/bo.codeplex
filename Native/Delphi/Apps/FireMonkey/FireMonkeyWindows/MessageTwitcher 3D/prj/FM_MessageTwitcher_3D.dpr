program FM_MessageTwitcher_3D;

uses
  FMX.Forms,
  Main3DFormUnit in '..\src\Main3DFormUnit.pas' {Form1: TForm3D},
  TwitcherMessageFormUnit in '..\..\MessageTwitcher\src\TwitcherMessageFormUnit.pas' {TwitcherMessageForm},
  TwitcherMessageListFormUnit in '..\..\MessageTwitcher\src\TwitcherMessageListFormUnit.pas' {TwitcherMessageListForm},
  uSet3DGridPosition in '..\src\uSet3DGridPosition.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
