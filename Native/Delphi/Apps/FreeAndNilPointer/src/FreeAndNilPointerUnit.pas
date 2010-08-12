unit FreeAndNilPointerUnit;

interface

    procedure FreeMemAndNil(var ptr; size: Integer = -1);

implementation

    procedure FreeMemAndNil(var ptr; size: Integer = -1);
    var
      p: Pointer;
    begin
      p := Pointer(ptr);
      if p <> nil then
      begin
        if size > -1 then
          FreeMem(p, size)
        else
          FreeMem(p);
        Pointer(ptr) := nil;
      end;
    end;

end.
