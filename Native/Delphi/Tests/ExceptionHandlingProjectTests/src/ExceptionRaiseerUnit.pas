unit ExceptionRaiseerUnit;

interface

uses
  System.SysUtils;

type
  EExceptionRaiseerException = class(Exception)
  end;

  TExceptionRaiseer = class(TObject)
  public
    procedure RaiseException;
  end;

implementation

procedure TExceptionRaiseer.RaiseException;
begin
  raise EExceptionRaiseerException.Create(EExceptionRaiseerException.ClassName + ' raised');
end;



end.
