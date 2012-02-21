program TheVarParameterRisk;

{$APPTYPE CONSOLE}

uses
  SysUtils;

procedure AssignParameters(var A: Integer; var B: Integer);
begin
  Writeln('Before: A=', A);
  Writeln('Before: B=', B);
  A := 1;
  B := 2;
  Writeln('After: A=', A);
  Writeln('After: B=', B);
  Assert(A = 1);
end;

var
  VarParameter: Integer;

begin
  try
    VarParameter := -1;
    try
      Writeln('Before: VarParameter=', VarParameter);
      AssignParameters(VarParameter, VarParameter);
    finally
      Writeln('After: VarParameter=', VarParameter);
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  Readln;
end.
