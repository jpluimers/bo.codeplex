unit MSSystemColumnUnit;

interface

uses
  ADODB,
  MSSystemItemUnit;

type
  TMSSystemColumnsEnumerator = class;
  TMSSystemColumn = class;

  TMSSystemColumns = class(TMSSystemItems)
  strict protected
    function GetData: Integer; override;
    function GetItem(Index: Integer): TMSSystemColumn; overload;
    function GetItem(Name: string): TMSSystemColumn; overload;
    procedure SetItem(Index: Integer; Value: TMSSystemColumn); overload;
    procedure SetItem(Name: string; Value: TMSSystemColumn); overload;
  public
    function FillForSysTable(ASysTableID: Integer): Integer;
    function FillForSysTableForSQLServer(ASysTableID: Integer): Integer;
    function GetEnumerator: TMSSystemColumnsEnumerator;
    property Items[Index: Integer]: TMSSystemColumn read GetItem write SetItem; default;
    property Items[Name: string]: TMSSystemColumn read GetItem write SetItem; default;
  end;

  TMSSystemColumn = class(TMSSystemItem)
  strict private
    FColName: string;
    FColType: SmallInt;
    FIsNullable: Boolean;
  public
    procedure GetData(Query: TADOQuery); override;
    function ToString: string; override;
    property ColName: string read FColName;
    property ColType: SmallInt read FColType;
    property IsNullable: Boolean read FIsNullable;
  end;

  TMSSystemColumnsEnumerator = class(TCollectionEnumerator)
  public
    function GetCurrent: TMSSystemColumn;
    property Current: TMSSystemColumn read GetCurrent;
  end;

implementation

uses
  DB, SysUtils;

function TMSSystemColumns.FillForSysTable(ASysTableID: Integer): Integer;
begin
  Result := 0;

  if not NeedsFill then
  begin
    Result := ObjectList.Count;
    Exit;
  end;

  ClearList;

  if not Assigned(ADOQuery) then
    Exit;

  ADOQuery.SQL.Clear;
  ADOQuery.SQL.Add(
    'SELECT ' +
    'colname,' +
    'tabid, ' +
    'coltype, ' +
    'FROM ' +
    'syscolumns ' +
    'WHERE ' + 'tabid = :TabID');

  ADOQuery.Parameters.ParamByName('TabID').Value := ASysTableID;

  ADOQuery.Open;
  try
    Result := GetData;
  finally
    ADOQuery.Close;
  end;
end;

function TMSSystemColumns.FillForSysTableForSQLServer(ASysTableID: Integer): Integer;
begin
  Result := 0;

  if not NeedsFill then
  begin
    Result := ObjectList.Count;
    Exit;
  end;

  ClearList;

  if not Assigned(ADOQuery) then
    Exit;

  ADOQuery.SQL.Clear;
  ADOQuery.SQL.Add(
    'SELECT ' +
    'cast(name as char(50)) as colname,' +
    'id as tabid, ' +
    'xtype as coltype, ' +
    'isnullable ' +
    'FROM ' +
    'syscolumns ' +
    'WHERE ' +
    'id = :TabID');

  ADOQuery.Parameters.ParamByName('TabID').Value := ASysTableID;

  ADOQuery.Open;
  try
    Result := GetData;
  finally
    ADOQuery.Close;
  end;
end;

function TMSSystemColumns.GetData: Integer;
var
  MSSystemColumn: TMSSystemColumn;
begin
  Result := inherited GetData;

  //To prevent all descendant classes to Enter this section
  //they must use their own GetData
  if not(Self.ClassType = TMSSystemColumns) then
    Exit;

  while not ADOQuery.EOF do //##jpl: for ... in
  begin
    MSSystemColumn := TMSSystemColumn.Create;
    MSSystemColumn.GetData(ADOQuery);
    MSSystemColumn.NeedsFill := False;

    ObjectList.Add(MSSystemColumn);
    ADOQuery.Next;
    inc(Result);
  end;
end;

function TMSSystemColumns.GetEnumerator: TMSSystemColumnsEnumerator;
begin
  Result := TMSSystemColumnsEnumerator.Create(Self);
end;

function TMSSystemColumns.GetItem(Index: Integer): TMSSystemColumn;
begin
  Result := (inherited Items[Index]) as TMSSystemColumn;
end;

function TMSSystemColumns.GetItem(Name: string): TMSSystemColumn;
begin
  Result := (inherited Items[Name]) as TMSSystemColumn;
end;

procedure TMSSystemColumns.SetItem(Index: Integer; Value: TMSSystemColumn);
begin
  inherited Items[Index] := Value;
end;

procedure TMSSystemColumns.SetItem(Name: string; Value: TMSSystemColumn);
begin
  inherited Items[Name] := Value;
end;

procedure TMSSystemColumn.GetData(Query: TADOQuery);
begin
  FColName := Trim(Query.FieldByName('colname').AsString);
  FColType := Query.FieldByName('coltype').AsInteger;
  FIsNullable := Query.FieldByName('isnullable').AsInteger = 1;
end;

function TMSSystemColumn.ToString: string;
begin
  Result := ColName;
end;

function TMSSystemColumnsEnumerator.GetCurrent: TMSSystemColumn;
begin
  Result := Collection[Index] as TMSSystemColumn;
end;

end.
