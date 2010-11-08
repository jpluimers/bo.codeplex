program PhoneRegExProject;

uses
  Forms,
  PhoneRegExFormUnit in '..\src\PhoneRegExFormUnit.pas' {PhoneRegExForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPhoneRegExForm, PhoneRegExForm);
  Application.Run;
end.
