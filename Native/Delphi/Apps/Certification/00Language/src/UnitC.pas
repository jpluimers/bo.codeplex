unit UnitC;

interface

type
  TClassC = class
  end;

function Foo: string;

procedure DoIt(Argument: PInteger); overload;
procedure DoIt(var Argument: Integer); overload;
//procedure DoIt(const Argument: Integer); overload;
//procedure DoIt(Argument: Integer); overload;

implementation

function Foo: string;
begin
  Exit('SnaFu');
  Result := 'Foo';
  Foo := 'Bar';
end;

procedure DoIt(Argument: PInteger); overload;
begin
  Argument^ := 29;
end;

procedure DoIt(var Argument: Integer); overload;
begin
  Argument := 29;
end;

end.
