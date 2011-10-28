unit ExceptionRaiserUnit;

interface

uses
  System.SysUtils;

type
  EExceptionRaiseerException = class(Exception)
  end;

  EUnwantedException = class(Exception)
  end;

  TParameterlessExceptionRaiseer = class(TObject)
  strict protected
    procedure InternalRaiseException; virtual;
  public
    procedure RaiseUnwantedException; virtual;
    procedure RaiseException; virtual;
    procedure DoNotRaiseException; virtual;
    procedure RandomRaiseException; virtual;
  end;

type
  TExceptionRaiseer = class(TParameterlessExceptionRaiseer)
  public
    procedure RaiseUnwantedException_WithParameters(const Parameters: array of const); overload; virtual;
    procedure RaiseException_WithParameters(const Parameters: array of const); overload; virtual;
    procedure DoNotRaiseException_WithParameters(const Parameters: array of const); overload; virtual;
    procedure RandomRaiseException_WithParameters(const Parameters: array of const); overload; virtual;
  end;

implementation

// TParameterlessExceptionRaiseer ----------------------------------------------

procedure TParameterlessExceptionRaiseer.DoNotRaiseException;
begin
// pretend some difficult business logic
end;

procedure TParameterlessExceptionRaiseer.RaiseException;
begin
// pretend some difficult business logic
  InternalRaiseException();
end;

procedure TParameterlessExceptionRaiseer.RandomRaiseException;
begin
// pretend some difficult business logic
  if Random(2) = 1 then
    InternalRaiseException();
end;

procedure TParameterlessExceptionRaiseer.InternalRaiseException;
begin
  raise EExceptionRaiseerException.Create(EExceptionRaiseerException.ClassName + ' raised');
end;

procedure TParameterlessExceptionRaiseer.RaiseUnwantedException;
begin
  raise EUnwantedException.Create(EUnwantedException.ClassName + ' Error Message');
end;

// TExceptionRaiseer -----------------------------------------------------------

procedure TExceptionRaiseer.DoNotRaiseException_WithParameters(const Parameters: array of const);
begin
// pretend some difficult business logic
end;

procedure TExceptionRaiseer.RaiseException_WithParameters(const Parameters: array of const);
begin
// pretend some difficult business logic
  InternalRaiseException();
end;

procedure TExceptionRaiseer.RandomRaiseException_WithParameters(const Parameters: array of const);
begin
// pretend some difficult business logic
  if Random(2) = 1 then
    InternalRaiseException();
end;

procedure TExceptionRaiseer.RaiseUnwantedException_WithParameters(const Parameters: array of const);
begin
  raise EUnwantedException.Create(EUnwantedException.ClassName + ' Error Message');
end;



end.
