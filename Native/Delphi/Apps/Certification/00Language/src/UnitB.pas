unit UnitB;

interface

uses
  UnitC;

function NewClassC: TClassC;

implementation

uses
  UnitA;

type
  TClassB = class(TClassC)
    fieldA: TClassA;
  end;

var
  Global: Integer = 0; // !!jpl: only use in NewClassC

function NewClassC: TClassC;
begin
  Result := TClassB.Create();
  Inc(Global);
end;

end.
