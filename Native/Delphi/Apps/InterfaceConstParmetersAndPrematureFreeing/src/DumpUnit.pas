unit DumpUnit;

interface

procedure Dump(Reference: IInterface);

implementation

procedure Dump(Reference: IInterface);
begin
  Writeln('    4.Dump begin');
  Writeln('    4.Dump Reference=', Integer(PChar(Reference)));
  Writeln('    4.Dump end');
end;

end.
