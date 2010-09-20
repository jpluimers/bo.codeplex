unit MSSystemTableUnit;

interface

uses
  ADODB,
  MSSystemItemUnit,
  MSSystemColumnUnit;

type
  TMSSystemTablesEnumerator = class;
  TMSSystemTable = class;

  TMSSystemTables = class(TMSSystemItems)
  strict protected
    function GetData: Integer; override;
    function GetSysTable(Index: Integer): TMSSystemTable; overload; virtual;
    function GetSysTable(Name: string): TMSSystemTable; overload; virtual;
    procedure SetSysTable(Index: Integer; const Value: TMSSystemTable); overload; virtual;
    procedure SetSysTable(Name: string; const Value: TMSSystemTable); overload; virtual;
  public
    procedure Fill; override;
    procedure FillForSQLServer;
    function GetEnumerator: TMSSystemTablesEnumerator;
    property Items[Index: Integer]: TMSSystemTable read GetSysTable write SetSysTable; default;
    property Items[Name: string]: TMSSystemTable read GetSysTable write SetSysTable; default;
  end;

  TMSSystemTable = class(TMSSystemItem)
  strict private
    FMSSystemColumns: TMSSystemColumns;
    FTabID: Integer;
    FTabName: string;
  strict protected
    function GetIDColumnName: string; virtual;
    function GetMSSystemColumns: TMSSystemColumns; virtual;
  public
    destructor Destroy; override;
    procedure GetData(Query: TADOQuery); override;
    function ToString: string; override;
    property IDColumnName: string read GetIDColumnName;
    property MSSystemColumns: TMSSystemColumns read GetMSSystemColumns;
    property TabName: string read FTabName;
  end;

  TMSSystemTablesEnumerator = class(TCollectionEnumerator)
  public
    function GetCurrent: TMSSystemTable;
    property Current: TMSSystemTable read GetCurrent;
  end;


implementation

uses
  SysUtils,
  DB,
  FieldNameHelperUnit;

destructor TMSSystemTable.Destroy;
begin
  FreeAndNil(FMSSystemColumns);

  inherited Destroy();
end;

procedure TMSSystemTable.GetData(Query: TADOQuery);
begin
  FTabName := Trim(Query.FieldByName('tabname').AsString);
  FTabID := Query.FieldByName('tabid').AsInteger;

  //Collections
  FreeAndNil(FMSSystemColumns);
  FMSSystemColumns := TMSSystemColumns.Create;
end;

function TMSSystemTable.GetIDColumnName: string;
begin
  Result := IDFieldName(Self.ToString());
end;

function TMSSystemTable.GetMSSystemColumns: TMSSystemColumns;
begin
  if not Assigned(FMSSystemColumns) then
    FMSSystemColumns := TMSSystemColumns.Create;
//  FMSSystemColumns.FillForSysTable(FintTabID);
  FMSSystemColumns.FillForSysTableForSQLServer(FTabID);
  Result := FMSSystemColumns;
end;

function TMSSystemTable.ToString: string;
begin
  Result := TabName;
end;

{ TSysTables }

procedure TMSSystemTables.Fill;
begin
  if not NeedsFill then
    Exit;

  ClearList;

  if not Assigned(ADOQuery) then
    Exit;

  ADOQuery.SQL.Clear;
  ADOQuery.SQL.Add('SELECT ' +
                   'tabname, ' +
                   'tabid, ' +
                 'FROM ' +
                   'SysTables ' +
                 'WHERE ' +
                   'TabID > 99 ' +    //ALLEEN ZELFGEMAAKTE TABELLEN
                 'ORDER BY tabname');

  ADOQuery.Open;
  try
    GetData;
  finally
    ADOQuery.Close;
  end;
end;

procedure TMSSystemTables.FillForSQLServer;
begin
  if not NeedsFill then
    Exit;

  ClearList;

  if not Assigned(ADOQuery) then
    Exit;

  ADOQuery.SQL.Clear;
  ADOQuery.SQL.Add('SELECT ' +
                   'name as tabname, ' +
                   'id as tabid ' +
                 'FROM ' +
                   'sysobjects ' +
                 'WHERE ' +
//                   'category = 0  ' +    //ALLEEN ZELFGEMAAKTE TABELLEN
                   'xtype = ''U''  ' +    //ALLEEN ZELFGEMAAKTE TABELLEN --- JR: 10-12-2009 --> die category geeft ook PK's terug
                 'ORDER BY 1');

  ADOQuery.Open;
  try
    GetData;
  finally
    ADOQuery.Close;
  end;
end;

function TMSSystemTables.GetData: Integer;
var
  MSSystemTable: TMSSystemTable;
begin
  Result := inherited GetData;

  //To prevent all descendant classes to Enter this section
  //they must use their own GetData
  if not (Self.ClassType = TMSSystemTables) then
    Exit;

  while not ADOQuery.EOF do //##jpl: for..in
  begin
    MSSystemTable := TMSSystemTable.Create;
    MSSystemTable.GetData(ADOQuery);
    MSSystemTable.NeedsFill := False;

    ObjectList.Add(MSSystemTable);
    ADOQuery.Next;
    inc(result);
  end;
end;

function TMSSystemTables.GetEnumerator: TMSSystemTablesEnumerator;
begin
  Result := TMSSystemTablesEnumerator.Create(Self);
end;

function TMSSystemTables.GetSysTable(Index: Integer): TMSSystemTable;
begin
  Result := TMSSystemTable(inherited Items[Index]);
end;

function TMSSystemTables.GetSysTable(Name: string): TMSSystemTable;
begin
  Result := TMSSystemTable(inherited Items[Name]);
end;

procedure TMSSystemTables.SetSysTable(Index: Integer; const Value: TMSSystemTable);
begin
  inherited Items[Index] := Value;
end;

procedure TMSSystemTables.SetSysTable(Name: string; const Value: TMSSystemTable);
begin
  inherited Items[Name] := Value;
end;

function TMSSystemTablesEnumerator.GetCurrent: TMSSystemTable;
begin
  Result := Collection[Index] as TMSSystemTable;
end;

end.
