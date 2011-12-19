program OrderTakeOut101;

uses
  FMX.Forms,
  OrderTakeOut101FormUnit in 'OrderTakeOut101FormUnit.pas' {OrderTakeOut101Form};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TOrderTakeOut101Form, OrderTakeOut101Form);
  Application.Run;
end.
