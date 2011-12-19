program OrderTakeOutEffects;

uses
  FMX.Forms,
  OrderTakeOutEffectsFormUnit in 'OrderTakeOutEffectsFormUnit.pas' {OrderTakeOut101Form};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TOrderTakeOut101Form, OrderTakeOut101Form);
  Application.Run;
end.
