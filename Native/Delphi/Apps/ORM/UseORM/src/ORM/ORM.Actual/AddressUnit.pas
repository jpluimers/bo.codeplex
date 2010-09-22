unit AddressUnit;

interface

uses
  ORMEntityUnit,
  AddressBaseUnit,
  NullablesUnit,
  Classes;

type
  TAddress = class;
  TAddressList = class;

  TAddress = class(TAddressBase)
  strict protected
    function GetAddressList(): TAddressList; virtual;
    function GetEntityListClass(): TEntityListClass; override;
  public
    destructor Destroy(); override;
    property AddressList: TAddressList read GetAddressList;
  end;

  TAddressEnumerator = class(TAddressBaseEnumerator)
  public
    function GetCurrent(): TAddress;
    property Current: TAddress read GetCurrent;
  end;

  TAddressList = class(TAddressListBase)
  strict private
    function GetCurrent(): TAddress;
  strict protected
    function GetData(): Integer; override;
    function GetEntityClass(): TEntityClass; override;
    function GetById(ID: TNullableInteger): TAddress;
  public
    function GetEnumerator(): TAddressEnumerator;
    property ById[ID: TNullableInteger]: TAddress read GetById;
    property Current: TAddress read GetCurrent;
  end;

implementation

uses
  SysUtils;

{ TAddress }

function TAddress.GetAddressList(): TAddressList;
begin
  Result := EntityList as TAddressList;
end;

function TAddress.GetEntityListClass(): TEntityListClass;
begin
  Result := TAddressList;
end;

destructor TAddress.Destroy();
begin
  inherited Destroy;
end;

{ TAddressEnumerator }

function TAddressEnumerator.GetCurrent(): TAddress;
var
  Value: TAddressBase;
begin
  Value := inherited Current;
  Result := Value as TAddress;
end;

{ TAddressList }

function TAddressList.GetData(): Integer;
begin
  Result := inherited GetData();
  HideIDColumns();
end;

function TAddressList.GetEntityClass(): TEntityClass;
begin
  Result := TAddress;
end;

function TAddressList.GetEnumerator(): TAddressEnumerator;
begin
  Result := TAddressEnumerator.Create(Self);
end;

function TAddressList.GetById(ID: TNullableInteger): TAddress;
begin
  Result := GetEntityById(ID) as TAddress;
end;

function TAddressList.GetCurrent(): TAddress;
begin
  Result := CurrentEntity as TAddress;
end;

end.
