unit CompilerAVUnit;

{
Reproduction for:
[DCC Error] CompilerAVUnit.pas(26): F2084 Internal Error: AV21BCE0AC-R00000000-0
}

interface

type
  TMethod = procedure of object;
  TmsxmlFactory = class(TObject)
    class procedure Outer; static; // remove "static;" and the AV goes away
    class procedure ClassMethod;
    class procedure CallClassMethod(const Method: TMethod);
  end;

implementation

class procedure TmsxmlFactory.Outer;
var
  Value: TMethod;
begin
  Value := ClassMethod;
  CallClassMethod(Value);
end;

class procedure TmsxmlFactory.ClassMethod;
begin
end;

class procedure TmsxmlFactory.CallClassMethod(const Method: TMethod);
begin
end;

end.
