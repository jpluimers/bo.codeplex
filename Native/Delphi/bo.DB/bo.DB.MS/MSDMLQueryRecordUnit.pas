unit MSDMLQueryRecordUnit;

interface

uses
  JoinedColumnPairUnit, MSConnectionLayerUnit, Generics.Collections;

type
  TSetQueryTextMethod = procedure(var QueryText: string) of object;
  TSetParamsMethod = procedure(const DBQuery: TDBQuery) of object;

  TMSDMLQueryRecord = record
    JoinedColumnPair: TJoinedColumnPair;
    SetQueryTextMethod: TSetQueryTextMethod;
    SetParamsMethod: TSetParamsMethod;
    procedure SetupQuery(const DBQuery: TDBQuery);
    procedure SetupQueryText(const DBQuery: TDBQuery);
  end;

  TMSDMLQueryRecordList = TList<TMSDMLQueryRecord>;

implementation

procedure TMSDMLQueryRecord.SetupQuery(const DBQuery: TDBQuery);
begin
  SetupQueryText(DBQuery);
  if Assigned(SetParamsMethod) then
    SetParamsMethod(DBQuery);
end;

procedure TMSDMLQueryRecord.SetupQueryText(const DBQuery: TDBQuery);
var
  QueryText: string;
begin
  SetQueryTextMethod(QueryText);
  DBQuery.SQL.Text := QueryText;
end;

end.
