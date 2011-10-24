unit DataSetToJsonUnit;

interface

uses
  Data.DB,
  Data.DBXJSON;

function DataSetToJSON(const DataSet: TDataSet): TJSONObject;

implementation

uses
  Data.DBXDBReaders,
  Data.DBXJSONCommon;

function DataSetToJSON(const DataSet: TDataSet): TJSONObject;
// alternative: http://code.google.com/p/delphijson/
var
  DBXDataSetReader: TDBXDataSetReader;
begin
// http://www.andreanolanusse.com/en/copying-data-from-clientdataset-to-dbxreader/
  DBXDataSetReader := TDBXDataSetReader.Create(DataSet, False);
  try
    Result := TDBXJSONTools.TableToJSON(DBXDataSetReader, DataSet.RecordCount, False); //jpl: True will destroy the DBXDataSetReader prematurely
  finally
    DBXDataSetReader.Free;
  end;
end;

end.
