program OrderTakeOutAnimatons;

uses
  FMX.Forms,
  OrderTakeOutAnimationsFormUnit in 'OrderTakeOutAnimationsFormUnit.pas' {OrderTakeOutAnimationForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TOrderTakeOutAnimationForm, OrderTakeOutAnimationForm);
  Application.Run;
end.
