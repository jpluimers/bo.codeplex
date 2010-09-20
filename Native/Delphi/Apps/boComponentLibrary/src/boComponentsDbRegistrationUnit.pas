unit boComponentsDbRegistrationUnit;

interface

procedure Register;

implementation

uses
  Classes, DataAwareControlControllerUnit;

procedure Register;
begin
  RegisterComponents('bo.Components.Db', [TDataAwareControlController]);
end;

end.
