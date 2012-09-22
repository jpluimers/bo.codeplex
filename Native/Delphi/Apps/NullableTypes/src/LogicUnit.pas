{ Copyright (c) 2007-2012 Jeroen Wiert Pluimers for BeSharp.net and better office benelux.
Full BSD License is available at http://besharp.codeplex.com/license and http://bo.codeplex.com/license }

unit LogicUnit;

interface

uses
  ConsoleLoggingLogicUnit;

type
  TLogic = class(TConsoleLoggingLogic)
  strict private
    procedure LogIntegerValues;
    procedure LogIntegerPointers;
  public
    procedure Go; overload; override;
  end;

implementation

type
  TIntegerPointer = ^Integer;

procedure TLogic.Go;
begin
  LogIntegerValues();
  LogIntegerPointers();
end;

procedure TLogic.LogIntegerValues;
var
  A: Integer;
  B: Integer;
begin
  Logger.Log('Integers');
  A := -1;
  B := -1;
  Logger.Log('A=%d, B=%d', [A, B]);
  A := 4;
  Logger.Log('A=%d, B=%d', [A, B]);
  B := 5;
  Logger.Log('A=%d, B=%d', [A, B]);
  A := B;
  Logger.Log('A=%d, B=%d', [A, B]);
  A := 6;
  Logger.Log('A=%d, B=%d', [A, B]);
end;

procedure TLogic.LogIntegerPointers;
var
  A: TIntegerPointer;
  B: TIntegerPointer;
begin
  Logger.Log('IntegerPointers');
  New(A);
  New(B);
  Logger.Log('A=%d, B=%d', [A^, B^]);
  A^ := 4;
  Logger.Log('A=%d, B=%d', [A^, B^]);
  B^ := 5;
  Logger.Log('A=%d, B=%d', [A^, B^]);
  A := B;
  Logger.Log('A=%d, B=%d', [A^, B^]);
  A^ := 6;
  Logger.Log('A=%d, B=%d', [A^, B^]);
end;

end.
