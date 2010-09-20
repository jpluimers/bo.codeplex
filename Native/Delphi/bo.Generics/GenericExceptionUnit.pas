unit GenericExceptionUnit;

interface

uses
  SysUtils;

type
  EGenericException<T: class> = class(Exception)
  end;

implementation

end.
