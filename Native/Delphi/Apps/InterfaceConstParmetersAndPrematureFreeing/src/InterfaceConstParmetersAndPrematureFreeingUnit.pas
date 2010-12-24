//{$define all}

unit InterfaceConstParmetersAndPrematureFreeingUnit;

interface

procedure Run;

implementation

uses
  MyInterfacedObjectUnit,
  DumpUnit, WritelnInterfacedObjectUnit;

{$ifdef all}

procedure NoPrematureFree(Reference: IInterface);
begin
  Writeln('   3.NoPrematureFree begin');
  Dump(Reference); // now we do not premature free because the non-const parameter has an implicit reference count
  Writeln('   3.NoPrematureFree Reference is still alive, so it is safe to access it');
  Writeln('   3.NoPrematureFree end');
end;

procedure PrematureFree(const Reference: IInterface);
begin
  Writeln('   3.PrematureFree begin');
  Dump(Reference); // now we premature free because the caller does not keep a reference to us
  Writeln('   3.PrematureFree Reference got destroyed if it had a RefCount of 1 upon entry, so now it can be unsafe to access it');
  Writeln('   3.PrematureFree end');
end;

{$endif all}

procedure PrematureFreeCrash(const Reference: IInterface);
begin
  Writeln('   3.PrematureFreeCrash begin');
  try
    Dump(Reference); // now we premature free because the caller does not keep a reference to us
    Writeln('   3.PrematureFreeCrash Reference got destroyed if it had a RefCount of 1 upon entry, so now it can be unsafe to access it');
    Dump(Reference); // we might crash here
  except
    begin
      Writeln('   3.PrematureFreeCrash end with exception');
      raise;
    end;
  end;
  Writeln('   3.PrematureFreeCrash end');
end;

{$ifdef all}

function CreateIInterfaceInstance: IInterface;
begin
  Writeln('   3.CreateIInterfaceInstance begin');
  Result := TMyInterfacedObject.Create;
  Writeln('   3.CreateIInterfaceInstance begin');
end;

procedure RunNoPrematureFree;
begin
  Writeln(' 2.RunNoPrematureFree begin');
  NoPrematureFree(TMyInterfacedObject.Create);
  Writeln(' 2.RunNoPrematureFree end');
end;

procedure RunNoPrematureFree_CreateIInterfaceInstance;
begin
  Writeln(' 2.RunNoPrematureFree_CreateIInterfaceInstance begin');
  NoPrematureFree(CreateIInterfaceInstance);
  Writeln(' 2.RunNoPrematureFree_CreateIInterfaceInstance end');
end;

procedure RunPrematureFree;
begin
  Writeln(' 2.RunPrematureFree begin');
  PrematureFree(TMyInterfacedObject.Create);
  Writeln(' 2.RunPrematureFree end');
end;

procedure RunPrematureFree_CreateIInterfaceInstance;
begin
  Writeln(' 2.RunPrematureFree_CreateIInterfaceInstance begin');
  PrematureFree(CreateIInterfaceInstance);
  Writeln(' 2.RunPrematureFree_CreateIInterfaceInstance end');
end;

procedure RunPrematureFreeWithLocalVar();
var
  Reference: IInterface;
begin
  Writeln(' 2.RunPrematureFreeWithLocalVar begin');
  Reference := TMyInterfacedObject.Create;
  PrematureFree(Reference);
  Writeln(' 2.RunPrematureFreeWithLocalVar end');
end;

{$endif all}

procedure RunPrematureFreeCrash;
begin
  Writeln(' 2.RunPrematureFreeCrash begin');
  PrematureFreeCrash(TWritelnInterfacedObject.Create);
  Writeln(' 2.RunPrematureFreeCrash end');
end;

procedure Run;
begin
  try
    Writeln('1.Run begin');

{$ifdef all}

    Writeln('');
    Writeln('1.RunNoPrematureFree');
    RunNoPrematureFree();

    Writeln('');
    Writeln('1.RunNoPrematureFree_CreateIInterfaceInstance');
    RunNoPrematureFree_CreateIInterfaceInstance();

    Writeln('');
    Writeln('1.RunPrematureFree');
    RunPrematureFree();

    Writeln('');
    Writeln('1.RunPrematureFree_CreateIInterfaceInstance');
    RunPrematureFree_CreateIInterfaceInstance();

    Writeln('');
    Writeln('1.RunPrematureFreeWithLocalVar');
    RunPrematureFreeWithLocalVar();

{$endif all}

    Writeln('');
    Writeln('1.RunPrematureFreeCrash');
    RunPrematureFreeCrash();

  finally
    Writeln('');
    Writeln('1.Run end');
  end;
end;

end.
