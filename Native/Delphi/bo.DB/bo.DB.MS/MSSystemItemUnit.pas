unit MSSystemItemUnit;

interface

uses
  Classes, Contnrs, ADOdb,
  db, Forms, Controls, extctrls, Variants,
  MSConnectionDataModuleUnit;

type
  TMSSystemItem = class;

  TMSSystemItems = class(TPersistent)
  strict private
    FADOQuery: TADOQuery;
    FMSConnectionDataModule: TMSConnectionDataModule;
    FNeedsFill: Boolean;
    FObjectList: TObjectList;
  strict protected
    procedure ClearList; virtual;
    function FindtemIndexOfName(Name: string): Integer; virtual;
    function GetADOQuery: TADOQuery; virtual;
    function GetCount: Integer; virtual;
    function GetData: Integer; virtual;
    function GetItemIndexOfName(Name: string): Integer; virtual;
    function GetItems(Index: Integer): TMSSystemItem; virtual;
    function GetItemsByName(Name: string): TMSSystemItem; virtual;
    procedure SetItems(Index: Integer; const Value: TMSSystemItem); virtual;
    procedure SetItemsByName(Name: string; const Value: TMSSystemItem); virtual;
    property ADOQuery: TADOQuery read GetADOQuery;
    property NeedsFill: Boolean read FNeedsFill;
    property ObjectList: TObjectList read FObjectList;
  public
    constructor Create; overload; virtual;
    destructor Destroy; override;
    procedure Fill; virtual; abstract;
    procedure ForceReFill; virtual;
    property Count: Integer read GetCount;
    property Items[Index: Integer]: TMSSystemItem read GetItems write SetItems; default;
    property Items[Name: string]: TMSSystemItem read GetItemsByName write SetItemsByName; default;
  end;

  TMSSystemItem = class(TPersistent)
  strict private
    FMSConnectionDataModule: TMSConnectionDataModule;
    FFQuery: TADOQuery;
    FNeedsFill: Boolean;
    FNewIDAvailable: Boolean;
  strict protected
    function GetQuery: TADOQuery; virtual;
    procedure SetNeedsFill(const Value: Boolean); virtual;
    procedure SetQuery(const Value: TADOQuery); virtual;
    property FQuery: TADOQuery read GetQuery write SetQuery;
  public
    constructor Create; overload; virtual;
    destructor Destroy; override;
    procedure GetData(Query: TADOQuery); virtual; abstract;
    property NeedsFill: Boolean read FNeedsFill write SetNeedsFill;
  end;

type
  TCollectionEnumerator = class
  strict private
    FCollection: TMSSystemItems;
    FIndex: Integer;
  strict protected
    property Collection: TMSSystemItems read FCollection;
    property Index: Integer read FIndex;
  public
    constructor Create(ACollection: TMSSystemItems);
    function MoveNext: Boolean;
  end;

implementation

uses
  SysUtils, RTLConsts;

constructor TMSSystemItem.Create;
begin
  FNeedsFill := True;
end;

destructor TMSSystemItem.Destroy;
begin
  if Assigned(FFQuery) then
  begin
    MSConnectionDataModuleFactory.Release;
    FMSConnectionDataModule := nil;
    FreeAndNil(FFQuery);
  end;

  inherited Destroy();
end;

function TMSSystemItem.GetQuery: TADOQuery;
begin
  if not Assigned(FFQuery) then
  begin
    FMSConnectionDataModule := MSConnectionDataModuleFactory.DataModule;
    FQuery := TADOQuery.Create(nil);
    FQuery.Connection := FMSConnectionDataModule.MainADOConnection;
  end;
  Result := FFQuery;
end;

procedure TMSSystemItem.SetNeedsFill(const Value: Boolean);
begin
  FNeedsFill := Value;
end;

procedure TMSSystemItem.SetQuery(const Value: TADOQuery);
begin
  FFQuery := Value;
end;

constructor TMSSystemItems.Create;
begin
  FObjectList := TObjectList.Create;
  FObjectList.OwnsObjects := True;

  FNeedsFill := True;
end;

destructor TMSSystemItems.Destroy;
begin
  if Assigned(FADOQuery) then
  begin
    MSConnectionDataModuleFactory.Release;
    FMSConnectionDataModule := nil;
    FreeAndNil(FADOQuery);
  end;

  if Assigned(FObjectList) then
  begin
    ClearList;
    FreeAndNil(FObjectList);
  end;

  inherited Destroy();
end;

procedure TMSSystemItems.ClearList;
begin
  if not Assigned(FObjectList) then
    exit;

  FObjectList.Clear;
end;

function TMSSystemItems.FindtemIndexOfName(Name: string): Integer;
var
  Index: Integer;
begin
  for Index := 0 to FObjectList.Count - 1 do
  begin
    if Items[Index].ToString = Name then
    begin
      Result := Index;
      exit;
    end;
  end;
  Result := -1;
end;

procedure TMSSystemItems.ForceReFill;
begin
  FNeedsFill := True;
end;

function TMSSystemItems.GetADOQuery: TADOQuery;
begin
  //Only create the query when REALLY needed
  if not Assigned(FADOQuery) then
  begin
    FMSConnectionDataModule := MSConnectionDataModuleFactory.DataModule;
    FADOQuery := TADOQuery.Create(nil);
    ADOQuery.Connection := FMSConnectionDataModule.MainADOConnection;
  end;
  Result := FADOQuery;
end;

function TMSSystemItems.GetCount: Integer;
begin
  Result := FObjectList.Count;
end;

function TMSSystemItems.GetData: Integer;
begin
  Result := 0;
  FNeedsFill := False;
end;

function TMSSystemItems.GetItemIndexOfName(Name: string): Integer;
begin
  Result := FindtemIndexOfName(Name);
  if Result = -1 then
    raise Exception.CreateFmt('Name "%s" not found', [Name]);
end;

function TMSSystemItems.GetItems(Index: Integer): TMSSystemItem;
begin
  if Index >= FObjectList.Count then
    TList.Error(SListIndexError, Index);

  Result := TMSSystemItem(FObjectList.Items[Index]);
end;

function TMSSystemItems.GetItemsByName(Name: string): TMSSystemItem;
var
  Index: Integer;
begin
  Index := GetItemIndexOfName(Name);
  Result := Items[Index];
end;

procedure TMSSystemItems.SetItems(Index: Integer; const Value: TMSSystemItem);
begin
  if Index >= FObjectList.Count then
    TList.Error(SListIndexError, Index);

  FObjectList.Items[Index] := Value;
end;

procedure TMSSystemItems.SetItemsByName(Name: string; const Value: TMSSystemItem);
var
  Index: Integer;
begin
  Index := GetItemIndexOfName(Name);
  Items[Index] := Value;
end;

{ TCollectionEnumerator }

constructor TCollectionEnumerator.Create(ACollection: TMSSystemItems);
begin
  inherited Create;
  FIndex := -1;
  FCollection := ACollection;
end;

function TCollectionEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FCollection.Count - 1;
  if Result then
    inc(FIndex);
end;

end.
