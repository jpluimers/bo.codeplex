unit ClientDataSetUnit;

interface

uses
  Data.DB,
  Datasnap.DBClient;

function CreateClientDataSetFrom(const DataSet: TDataSet): TClientDataSet;

implementation

uses
  Datasnap.Provider;

function CreateClientDataSetFrom(const DataSet: TDataSet): TClientDataSet;
var
  DataSetProvider: TDataSetProvider;
begin
  Result := TClientDataSet.Create(nil);
  try
    DataSetProvider := TDataSetProvider.Create(nil);
    try
      DataSetProvider.DataSet := DataSet;
      Result.SetProvider(DataSetProvider);
      Result.Open();
    finally
      DataSetProvider.Free;
    end;
  except
    Result.Free;
    Result := nil;
    raise;
  end;
end;

end.
