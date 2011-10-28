program FM_MessageTwitcher;

uses
  FMX.Forms,
  TwitcherMessageListFormUnit in '..\src\TwitcherMessageListFormUnit.pas' {TwitcherMessageListForm},
  TwitcherMessageFormUnit in '..\src\TwitcherMessageFormUnit.pas' {TwitcherMessageForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TTwitcherMessageListForm, TwitcherMessageListForm);
  Application.Run;
end.
