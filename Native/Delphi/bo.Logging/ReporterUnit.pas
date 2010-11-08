unit ReporterUnit;

interface

type
  IReporter = interface(IInterface)
    procedure Report(const Line: string);
  end;

  TReporter = class abstract(TInterfacedObject, IReporter)
  public
    procedure Report(const Line: string); virtual; abstract;
  end;

implementation

end.
