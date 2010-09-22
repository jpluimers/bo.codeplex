unit DatabaseMetaDataUnit;

interface

uses
  ORMEntityUnit,
  DatabaseMetaDataBaseUnit,
  NullablesUnit,
  Classes;

type
  TDatabaseMetaData = class;
  TDatabaseMetaDataList = class;

  TDatabaseMetaData = class(TDatabaseMetaDataBase)
  strict protected
    function GetDatabaseMetaDataList(): TDatabaseMetaDataList; virtual;
    function GetEntityListClass(): TEntityListClass; override;
  public
    destructor Destroy(); override;
    property DatabaseMetaDataList: TDatabaseMetaDataList read GetDatabaseMetaDataList;
  end;

  TDatabaseMetaDataEnumerator = class(TDatabaseMetaDataBaseEnumerator)
  public
    function GetCurrent(): TDatabaseMetaData;
    property Current: TDatabaseMetaData read GetCurrent;
  end;

  TDatabaseMetaDataList = class(TDatabaseMetaDataListBase)
  strict private
    function GetCurrent(): TDatabaseMetaData;
  strict protected
    function GetData(): Integer; override;
    function GetEntityClass(): TEntityClass; override;
    function GetById(ID: TNullableInteger): TDatabaseMetaData;
  public
    function GetEnumerator(): TDatabaseMetaDataEnumerator;
    property ById[ID: TNullableInteger]: TDatabaseMetaData read GetById;
    property Current: TDatabaseMetaData read GetCurrent;
  end;

implementation

uses
  SysUtils;

{ TDatabaseMetaData }

function TDatabaseMetaData.GetDatabaseMetaDataList(): TDatabaseMetaDataList;
begin
  Result := EntityList as TDatabaseMetaDataList;
end;

function TDatabaseMetaData.GetEntityListClass(): TEntityListClass;
begin
  Result := TDatabaseMetaDataList;
end;

destructor TDatabaseMetaData.Destroy();
begin
  inherited Destroy;
end;

{ TDatabaseMetaDataEnumerator }

function TDatabaseMetaDataEnumerator.GetCurrent(): TDatabaseMetaData;
var
  Value: TDatabaseMetaDataBase;
begin
  Value := inherited Current;
  Result := Value as TDatabaseMetaData;
end;

{ TDatabaseMetaDataList }

function TDatabaseMetaDataList.GetData(): Integer;
begin
  Result := inherited GetData();
  HideIDColumns();
end;

function TDatabaseMetaDataList.GetEntityClass(): TEntityClass;
begin
  Result := TDatabaseMetaData;
end;

function TDatabaseMetaDataList.GetEnumerator(): TDatabaseMetaDataEnumerator;
begin
  Result := TDatabaseMetaDataEnumerator.Create(Self);
end;

function TDatabaseMetaDataList.GetById(ID: TNullableInteger): TDatabaseMetaData;
begin
  Result := GetEntityById(ID) as TDatabaseMetaData;
end;

function TDatabaseMetaDataList.GetCurrent(): TDatabaseMetaData;
begin
  Result := CurrentEntity as TDatabaseMetaData;
end;

end.
