unit DataSetEnumeratorUnit;

interface

uses
  DB;

type
  TDataSetEnumerationRecord = record
    //1 If nil, then empty DataSet in for ... in loop
    DataSet: TDataSet;
  end;

  TDataSetEnumerator = class
  strict private
    FBookmark: TBookmark;
    FWeOpenedDataSet: Boolean;
    FDataSet: TDataSet;
    FFirstItem: Boolean;
    FEmpty: Boolean;
  public
    constructor Create(const DataSet: TDataSet);
    destructor Destroy; override;
    function GetCurrent: TDataSetEnumerationRecord;
    function MoveNext: Boolean;
    //1 Mark the for ... in enumeration result as TDataSetEnumerationRecord
    property Current: TDataSetEnumerationRecord read GetCurrent;
  end;

implementation

{ TDataSetEnumerator }

constructor TDataSetEnumerator.Create(const DataSet: TDataSet);
begin
  inherited Create;
  Self.FDataSet := DataSet;
  DataSet.DisableControls();
  FBookmark := DataSet.GetBookmark();
  if DataSet.Active then
    DataSet.First() // if it already was Open, make sure we are at Bof
  else
  begin
    DataSet.Open();
    FWeOpenedDataSet := True;
  end;
  Self.FFirstItem := True;
  Self.FEmpty := DataSet.Bof and DataSet.Eof;
end;

destructor TDataSetEnumerator.Destroy;
begin
  inherited Destroy;
  if FWeOpenedDataSet then
    FDataSet.Close()
  else
    FDataSet.GotoBookmark(FBookmark);
  FDataSet.FreeBookmark(FBookmark);
  FDataSet.EnableControls();
end;

function TDataSetEnumerator.GetCurrent: TDataSetEnumerationRecord;
begin
  if Self.FEmpty then
    Result.DataSet := nil
  else
    Result.DataSet := FDataSet;
end;

function TDataSetEnumerator.MoveNext: Boolean;
begin
  // After opening a TDataSet, it always is at the first record,
  // but a TEnumerator expects to be *before* the first record
  // so we need to accommodate for that by the FFirstItem trick
  if Self.FEmpty then
    Result := False
  else
  begin
    if FFirstItem then
      FFirstItem := False
    else
      FDataSet.Next;
    Result := not FDataSet.Eof;
  end; // else if Self.FEmpty
end;

end.
