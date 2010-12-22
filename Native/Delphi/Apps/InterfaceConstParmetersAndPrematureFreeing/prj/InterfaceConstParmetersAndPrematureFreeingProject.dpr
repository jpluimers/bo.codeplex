{$define all}

program InterfaceConstParmetersAndPrematureFreeingProject;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Windows,
  MyInterfacedObjectUnit in '..\src\MyInterfacedObjectUnit.pas';

procedure Dump(Reference: IInterface);
begin
  Writeln('    4.Dump begin');
  Writeln('    4.Dump Reference=', Integer(PChar(Reference)));
  Writeln('    4.Dump end');
end;

{$ifdef all}

procedure NoLeak(Reference: IInterface);
begin
  Writeln('   3.NoLeak begin');
  Dump(Reference); // now we do not leak because the non-const parameter has an implicit reference count
  Writeln('   3.NoLeak Reference is still alive, so it is safe to access it');
  Writeln('   3.NoLeak end');
end;

procedure Leak(const Reference: IInterface);
begin
  Writeln('   3.Leak begin');
  Dump(Reference); // now we leak because the caller does not keep a reference to us
  Writeln('   3.Leak Reference got destroyed if it had a RefCount of 1 upon entry, so now it can be unsafe to access it');
  Writeln('   3.Leak end');
end;

{$endif all}

procedure LeakCrash(const Reference: IInterface);
begin
  Writeln('   3.LeakCrash begin');
  try
    Dump(Reference); // now we leak because the caller does not keep a reference to us
    Writeln('   3.LeakCrash Reference got destroyed if it had a RefCount of 1 upon entry, so now it can be unsafe to access it');
    Dump(Reference); // we might crash here
  except
    begin
      Writeln('   3.LeakCrash end with exception');
      raise;
    end;
  end;
  Writeln('   3.LeakCrash end');
end;

{$ifdef all}

function CreateIInterfaceInstance: IInterface;
begin
  Writeln('   3.CreateIInterfaceInstance begin');
  Result := TMyInterfacedObject.Create;
  Writeln('   3.CreateIInterfaceInstance begin');
end;

procedure RunNoLeak;
begin
  Writeln(' 2.RunNoLeak begin');
  NoLeak(TMyInterfacedObject.Create);
  Writeln(' 2.RunNoLeak end');
end;

procedure RunNoLeak_CreateIInterfaceInstance;
begin
  Writeln(' 2.RunNoLeak_CreateIInterfaceInstance begin');
  NoLeak(CreateIInterfaceInstance);
  Writeln(' 2.RunNoLeak_CreateIInterfaceInstance end');
end;

procedure RunLeak;
begin
  Writeln(' 2.RunLeak begin');
  Leak(TMyInterfacedObject.Create);
  Writeln(' 2.RunLeak end');
end;

procedure RunLeak_CreateIInterfaceInstance;
begin
  Writeln(' 2.RunLeak_CreateIInterfaceInstance begin');
  Leak(CreateIInterfaceInstance);
  Writeln(' 2.RunLeak_CreateIInterfaceInstance end');
end;

procedure RunLeakWithLocalVar();
var
  Reference: IInterface;
begin
  Writeln(' 2.RunLeakWithLocalVar begin');
  Reference := TMyInterfacedObject.Create;
  Leak(Reference);
  Writeln(' 2.RunLeakWithLocalVar end');
end;

{$endif all}

procedure RunLeakCrash;
begin
  Writeln(' 2.RunLeakCrash begin');
  LeakCrash(TMyInterfacedObject.Create);
  Writeln(' 2.RunLeakCrash end');
end;

procedure Run();
begin
  try
    Writeln('1.Run begin');

{$ifdef all}

    Writeln('');
    Writeln('1.RunNoLeak');
    RunNoLeak();

    Writeln('');
    Writeln('1.RunNoLeak_CreateIInterfaceInstance');
    RunNoLeak_CreateIInterfaceInstance();

    Writeln('');
    Writeln('1.RunLeak');
    RunLeak();

    Writeln('');
    Writeln('1.RunLeak_CreateIInterfaceInstance');
    RunLeak_CreateIInterfaceInstance();

    Writeln('');
    Writeln('1.RunLeakWithLocalVar');
    RunLeakWithLocalVar();

{$endif all}

    Writeln('');
    Writeln('1.RunLeakCrash');
    RunLeakCrash();

  finally
    Writeln('');
    Writeln('1.Run end');
  end;
end;

begin
  try
    Run();
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  Readln;
end.
