program OrderTakeOutStyles;

uses
  FMX.Forms,
  OrderTakeOutWithStyleFormUnit in 'OrderTakeOutWithStyleFormUnit.pas' {OrderTakeOutWithStyleForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TOrderTakeOutWithStyleForm, OrderTakeOutWithStyleForm);
  Application.Run;
end.
