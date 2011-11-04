{ Copyright (c) 2007-2011 Jeroen Wiert Pluimers for BeSharp.net and better office benelux.
Full BSD License is available at http://besharp.codeplex.com/license and http://bo.codeplex.com/license }

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
