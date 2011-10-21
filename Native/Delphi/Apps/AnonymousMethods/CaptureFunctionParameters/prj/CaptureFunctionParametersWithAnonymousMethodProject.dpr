program CaptureFunctionParametersWithAnonymousMethodProject;
{$APPTYPE CONSOLE}
{$R *.res}
uses
  SysUtils;

type
  TIntegerIntegerMethodReference = reference to function(const Value: Integer): Integer;

function GetMultiplyFunction(const Left: Integer): TIntegerIntegerMethodReference;
begin
  Result := function(const Value: Integer): Integer // note: no semicolon!
  begin
    Result := Left * Value;
  end;
end;

procedure Run();
var
  MultiplyFunction: TIntegerIntegerMethodReference;
  Intermediate: Integer;
begin
  MultiplyFunction := GetMultiplyFunction(2);
  Intermediate := MultiplyFunction(3);
  Writeln(MultiplyFunction(4) * Intermediate);
end;

begin
  try
    Run();
    ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
