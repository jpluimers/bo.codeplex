unit boControlsDbRegistrationUnit;

interface

procedure Register;

implementation

uses
  Classes, DbDisplayLabelUnit;

procedure Register;
begin
  RegisterComponents('bo.Controls.Db', [TDbDisplayLabel]);
end;

end.
