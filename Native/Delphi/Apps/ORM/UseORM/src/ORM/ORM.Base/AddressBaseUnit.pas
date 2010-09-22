unit AddressBaseUnit;

interface

uses
  MSConnectionLayerUnit,
  SysUtils,
  ORMEntityUnit,
  DataSetEnumeratorUnit,
  NullablesUnit,
  db,
  ADODB,
  BaseEntityUnit,
  JoinedColumnPairUnit,
  MSDMLQueryRecordUnit;

type
  TAddressBase = class;
  TAddressListBase = class;

  TAddressBase = class(TBaseEntity)
  strict protected
    function GetAddressListBase(): TAddressListBase; virtual;
    function GetEntityListClass(): TEntityListClass; override;
    function GetID_Address(): TNullableInteger; virtual;
    procedure SetID_Address(const Value: TNullableInteger); virtual;
    function GetEID_BaseEntity(): TNullableInteger; virtual;
    procedure SetEID_BaseEntity(const Value: TNullableInteger); virtual;
    function GetRouting(): TNullableString; virtual;
    procedure SetRouting(const Value: TNullableString); virtual;
    function GetStreetName(): TNullableString; virtual;
    procedure SetStreetName(const Value: TNullableString); virtual;
    function GetHouseNumber(): TNullableString; virtual;
    procedure SetHouseNumber(const Value: TNullableString); virtual;
    function GetPostalCode(): TNullableString; virtual;
    procedure SetPostalCode(const Value: TNullableString); virtual;
    function GetCity(): TNullableString; virtual;
    procedure SetCity(const Value: TNullableString); virtual;
    function GetCountryCode(): TNullableString; virtual;
    procedure SetCountryCode(const Value: TNullableString); virtual;
    function GetCountry(): TNullableString; virtual;
    procedure SetCountry(const Value: TNullableString); virtual;
    property AddressList: TAddressListBase read GetAddressListBase;
  public
    property ID_Address: TNullableInteger read GetID_Address write SetID_Address;
    property EID_BaseEntity: TNullableInteger read GetEID_BaseEntity write SetEID_BaseEntity;
    property Routing: TNullableString read GetRouting write SetRouting;
    property StreetName: TNullableString read GetStreetName write SetStreetName;
    property HouseNumber: TNullableString read GetHouseNumber write SetHouseNumber;
    property PostalCode: TNullableString read GetPostalCode write SetPostalCode;
    property City: TNullableString read GetCity write SetCity;
    property CountryCode: TNullableString read GetCountryCode write SetCountryCode;
    property Country: TNullableString read GetCountry write SetCountry;
  end;

  TAddressListBaseClientDataSet = class(TBaseEntityList)
  strict protected
    function GetData(): Integer; overload; override;
    function GetEntityClass(): TEntityClass; overload; override;
    function GetID_AddressField(): TIntegerField; virtual;
    function GetEID_BaseEntityField(): TIntegerField; virtual;
    function GetRoutingField(): TStringField; virtual;
    function GetStreetNameField(): TStringField; virtual;
    function GetHouseNumberField(): TStringField; virtual;
    function GetPostalCodeField(): TStringField; virtual;
    function GetCityField(): TStringField; virtual;
    function GetCountryCodeField(): TStringField; virtual;
    function GetCountryField(): TStringField; virtual;
  public
    const
      ID_AddressFieldName = 'ID_Address';
      ID_Address_ChangedParameterName = 'ID_Address_Changed';
      EID_BaseEntityFieldName = 'EID_BaseEntity';
      EID_BaseEntity_ChangedParameterName = 'EID_BaseEntity_Changed';
      RoutingFieldName = 'Routing';
      Routing_ChangedParameterName = 'Routing_Changed';
      StreetNameFieldName = 'StreetName';
      StreetName_ChangedParameterName = 'StreetName_Changed';
      HouseNumberFieldName = 'HouseNumber';
      HouseNumber_ChangedParameterName = 'HouseNumber_Changed';
      PostalCodeFieldName = 'PostalCode';
      PostalCode_ChangedParameterName = 'PostalCode_Changed';
      CityFieldName = 'City';
      City_ChangedParameterName = 'City_Changed';
      CountryCodeFieldName = 'CountryCode';
      CountryCode_ChangedParameterName = 'CountryCode_Changed';
      CountryFieldName = 'Country';
      Country_ChangedParameterName = 'Country_Changed';
    property ID_AddressField: TIntegerField read GetID_AddressField;
    property EID_BaseEntityField: TIntegerField read GetEID_BaseEntityField;
    property RoutingField: TStringField read GetRoutingField;
    property StreetNameField: TStringField read GetStreetNameField;
    property HouseNumberField: TStringField read GetHouseNumberField;
    property PostalCodeField: TStringField read GetPostalCodeField;
    property CityField: TStringField read GetCityField;
    property CountryCodeField: TStringField read GetCountryCodeField;
    property CountryField: TStringField read GetCountryField;
  end;

  TAddressBaseEnumerator = class(TEntityListEnumerator)
  strict private
    function GetCurrent(): TAddressBase;
  public
    property Current: TAddressBase read GetCurrent;
  end;

  TAddressListBase = class(TAddressListBaseClientDataSet)
  strict private
    procedure SetDeleteQueryText(var DeleteQueryText: string);
    procedure SetInsertQueryText(var InsertQueryText: string);
    procedure SetUpdateQueryText(var UpdateQueryText: string);
    procedure SetParams(const DBQuery: TDBQuery);
    function FillJoinedColumnPair(): TJoinedColumnPair;
  strict protected
    procedure SetReadQueryText(const ReadQuery: TDBQuery); override;
    procedure FillDeleteQueryRecordList(const DeleteQueryRecordList: TMSDMLQueryRecordList); override;
    procedure FillInsertQueryRecordList(const InsertQueryRecordList: TMSDMLQueryRecordList); override;
    procedure FillUpdateQueryRecordList(const UpdateQueryRecordList: TMSDMLQueryRecordList); override;
    function GetID_Address(): TNullableInteger; virtual;
    procedure SetID_Address(const Value: TNullableInteger); virtual;
    function GetEID_BaseEntity(): TNullableInteger; virtual;
    procedure SetEID_BaseEntity(const Value: TNullableInteger); virtual;
    function GetRouting(): TNullableString; virtual;
    procedure SetRouting(const Value: TNullableString); virtual;
    function GetStreetName(): TNullableString; virtual;
    procedure SetStreetName(const Value: TNullableString); virtual;
    function GetHouseNumber(): TNullableString; virtual;
    procedure SetHouseNumber(const Value: TNullableString); virtual;
    function GetPostalCode(): TNullableString; virtual;
    procedure SetPostalCode(const Value: TNullableString); virtual;
    function GetCity(): TNullableString; virtual;
    procedure SetCity(const Value: TNullableString); virtual;
    function GetCountryCode(): TNullableString; virtual;
    procedure SetCountryCode(const Value: TNullableString); virtual;
    function GetCountry(): TNullableString; virtual;
    procedure SetCountry(const Value: TNullableString); virtual;
  public
    const
      Address_TableName = 'Address';
    function GetEnumerator(): TAddressBaseEnumerator;
    property ID_Address: TNullableInteger read GetID_Address write SetID_Address;
    property EID_BaseEntity: TNullableInteger read GetEID_BaseEntity write SetEID_BaseEntity;
    property Routing: TNullableString read GetRouting write SetRouting;
    property StreetName: TNullableString read GetStreetName write SetStreetName;
    property HouseNumber: TNullableString read GetHouseNumber write SetHouseNumber;
    property PostalCode: TNullableString read GetPostalCode write SetPostalCode;
    property City: TNullableString read GetCity write SetCity;
    property CountryCode: TNullableString read GetCountryCode write SetCountryCode;
    property Country: TNullableString read GetCountry write SetCountry;
  end;

implementation

uses
  FieldHelperUnit;

{ TAddressBase }

function TAddressBase.GetAddressListBase(): TAddressListBase;
begin
  Result := EntityList as TAddressListBase;
end;

function TAddressBase.GetEntityListClass(): TEntityListClass;
begin
  Result := TAddressListBase;
end;

function TAddressBase.GetID_Address(): TNullableInteger;
var
  Value: TNullableInteger;
begin
  ExecuteAtDictionaryID(
  procedure
  begin
    Value := AddressList.ID_Address;
  end
  );
  Result := Value;
end;

procedure TAddressBase.SetID_Address(const Value: TNullableInteger);
var
  NewValue: TNullableInteger;
begin
  NewValue := Value;
  ExecuteAtBookmarkInEditMode(
    procedure
    begin
      AddressList.ID_Address := NewValue;
    end
  );
end;

function TAddressBase.GetEID_BaseEntity(): TNullableInteger;
var
  Value: TNullableInteger;
begin
  ExecuteAtDictionaryID(
  procedure
  begin
    Value := AddressList.EID_BaseEntity;
  end
  );
  Result := Value;
end;

procedure TAddressBase.SetEID_BaseEntity(const Value: TNullableInteger);
var
  NewValue: TNullableInteger;
begin
  NewValue := Value;
  ExecuteAtBookmarkInEditMode(
    procedure
    begin
      AddressList.EID_BaseEntity := NewValue;
    end
  );
end;

function TAddressBase.GetRouting(): TNullableString;
var
  Value: TNullableString;
begin
  ExecuteAtDictionaryID(
  procedure
  begin
    Value := AddressList.Routing;
  end
  );
  Result := Value;
end;

procedure TAddressBase.SetRouting(const Value: TNullableString);
var
  NewValue: TNullableString;
begin
  NewValue := Value;
  ExecuteAtBookmarkInEditMode(
    procedure
    begin
      AddressList.Routing := NewValue;
    end
  );
end;

function TAddressBase.GetStreetName(): TNullableString;
var
  Value: TNullableString;
begin
  ExecuteAtDictionaryID(
  procedure
  begin
    Value := AddressList.StreetName;
  end
  );
  Result := Value;
end;

procedure TAddressBase.SetStreetName(const Value: TNullableString);
var
  NewValue: TNullableString;
begin
  NewValue := Value;
  ExecuteAtBookmarkInEditMode(
    procedure
    begin
      AddressList.StreetName := NewValue;
    end
  );
end;

function TAddressBase.GetHouseNumber(): TNullableString;
var
  Value: TNullableString;
begin
  ExecuteAtDictionaryID(
  procedure
  begin
    Value := AddressList.HouseNumber;
  end
  );
  Result := Value;
end;

procedure TAddressBase.SetHouseNumber(const Value: TNullableString);
var
  NewValue: TNullableString;
begin
  NewValue := Value;
  ExecuteAtBookmarkInEditMode(
    procedure
    begin
      AddressList.HouseNumber := NewValue;
    end
  );
end;

function TAddressBase.GetPostalCode(): TNullableString;
var
  Value: TNullableString;
begin
  ExecuteAtDictionaryID(
  procedure
  begin
    Value := AddressList.PostalCode;
  end
  );
  Result := Value;
end;

procedure TAddressBase.SetPostalCode(const Value: TNullableString);
var
  NewValue: TNullableString;
begin
  NewValue := Value;
  ExecuteAtBookmarkInEditMode(
    procedure
    begin
      AddressList.PostalCode := NewValue;
    end
  );
end;

function TAddressBase.GetCity(): TNullableString;
var
  Value: TNullableString;
begin
  ExecuteAtDictionaryID(
  procedure
  begin
    Value := AddressList.City;
  end
  );
  Result := Value;
end;

procedure TAddressBase.SetCity(const Value: TNullableString);
var
  NewValue: TNullableString;
begin
  NewValue := Value;
  ExecuteAtBookmarkInEditMode(
    procedure
    begin
      AddressList.City := NewValue;
    end
  );
end;

function TAddressBase.GetCountryCode(): TNullableString;
var
  Value: TNullableString;
begin
  ExecuteAtDictionaryID(
  procedure
  begin
    Value := AddressList.CountryCode;
  end
  );
  Result := Value;
end;

procedure TAddressBase.SetCountryCode(const Value: TNullableString);
var
  NewValue: TNullableString;
begin
  NewValue := Value;
  ExecuteAtBookmarkInEditMode(
    procedure
    begin
      AddressList.CountryCode := NewValue;
    end
  );
end;

function TAddressBase.GetCountry(): TNullableString;
var
  Value: TNullableString;
begin
  ExecuteAtDictionaryID(
  procedure
  begin
    Value := AddressList.Country;
  end
  );
  Result := Value;
end;

procedure TAddressBase.SetCountry(const Value: TNullableString);
var
  NewValue: TNullableString;
begin
  NewValue := Value;
  ExecuteAtBookmarkInEditMode(
    procedure
    begin
      AddressList.Country := NewValue;
    end
  );
end;

{ TAddressListBaseClientDataSet }

function TAddressListBaseClientDataSet.GetData(): Integer;
begin
  Result := inherited GetData();
end;

function TAddressListBaseClientDataSet.GetEntityClass(): TEntityClass;
begin
  Result := TAddressBase;
end;

function TAddressListBaseClientDataSet.GetID_AddressField(): TIntegerField;
begin
  Result := Fields.FieldByName(ID_AddressFieldName) as TIntegerField;
end;

function TAddressListBaseClientDataSet.GetEID_BaseEntityField(): TIntegerField;
begin
  Result := Fields.FieldByName(EID_BaseEntityFieldName) as TIntegerField;
end;

function TAddressListBaseClientDataSet.GetRoutingField(): TStringField;
begin
  Result := Fields.FieldByName(RoutingFieldName) as TStringField;
end;

function TAddressListBaseClientDataSet.GetStreetNameField(): TStringField;
begin
  Result := Fields.FieldByName(StreetNameFieldName) as TStringField;
end;

function TAddressListBaseClientDataSet.GetHouseNumberField(): TStringField;
begin
  Result := Fields.FieldByName(HouseNumberFieldName) as TStringField;
end;

function TAddressListBaseClientDataSet.GetPostalCodeField(): TStringField;
begin
  Result := Fields.FieldByName(PostalCodeFieldName) as TStringField;
end;

function TAddressListBaseClientDataSet.GetCityField(): TStringField;
begin
  Result := Fields.FieldByName(CityFieldName) as TStringField;
end;

function TAddressListBaseClientDataSet.GetCountryCodeField(): TStringField;
begin
  Result := Fields.FieldByName(CountryCodeFieldName) as TStringField;
end;

function TAddressListBaseClientDataSet.GetCountryField(): TStringField;
begin
  Result := Fields.FieldByName(CountryFieldName) as TStringField;
end;

{ TAddressBaseEnumerator }

function TAddressBaseEnumerator.GetCurrent(): TAddressBase;
var
  Entity: TEntity;
begin
  Entity := inherited Current;
  Result := Entity as TAddressBase;
end;

{ TAddressListBase }

procedure TAddressListBase.SetDeleteQueryText(var DeleteQueryText: string);
begin
  DeleteQueryText := 'DELETE FROM Address WHERE ID_Address = :ID_Address';
end;

procedure TAddressListBase.SetInsertQueryText(var InsertQueryText: string);
begin
  InsertQueryText :=
  'INSERT INTO Address (' +
  '  EID_BaseEntity, ' +
  '  Routing, ' +
  '  StreetName, ' +
  '  HouseNumber, ' +
  '  PostalCode, ' +
  '  City, ' +
  '  CountryCode, ' +
  '  Country  ) VALUES (' +
  '  :EID_BaseEntity_Changed, ' +
  '  :Routing_Changed, ' +
  '  :StreetName_Changed, ' +
  '  :HouseNumber_Changed, ' +
  '  :PostalCode_Changed, ' +
  '  :City_Changed, ' +
  '  :CountryCode_Changed, ' +
  '  :Country_Changed  )';
end;

procedure TAddressListBase.SetReadQueryText(const ReadQuery: TDBQuery);
begin
  ReadQuery.SQL.Add('   SELECT ' +
  '  Address.ID_Address, ' +
  '  Address.EID_BaseEntity, ' +
  '  Address.Routing, ' +
  '  Address.StreetName, ' +
  '  Address.HouseNumber, ' +
  '  Address.PostalCode, ' +
  '  Address.City, ' +
  '  Address.CountryCode, ' +
  '  Address.Country, ' +
  '  BaseEntity.ID_BaseEntity, ' +
  '  BaseEntity.ExternalID, ' +
  '  BaseEntity.ID_UserPersonInsert, ' +
  '  BaseEntity.TimeStampInsert, ' +
  '  BaseEntity.ID_UserPersonUpdate, ' +
  '  BaseEntity.TimeStampLastUpdate, ' +
  '  BaseEntity.StartDateTime, ' +
  '  BaseEntity.FinishDateTime, ' +
  '  BaseEntity.Remark ' +
  '   FROM ( Address ' +
  '   LEFT JOIN BaseEntity ON BaseEntity.ID_BaseEntity = Address.EID_BaseEntity) ' +
  'WHERE (1=1) '
  );
end;

procedure TAddressListBase.SetUpdateQueryText(var UpdateQueryText: string);
begin
  UpdateQueryText :=
  'UPDATE Address ' + 'SET ' +
  '  EID_BaseEntity = :EID_BaseEntity_Changed, ' +
  '  Routing = :Routing_Changed, ' +
  '  StreetName = :StreetName_Changed, ' +
  '  HouseNumber = :HouseNumber_Changed, ' +
  '  PostalCode = :PostalCode_Changed, ' +
  '  City = :City_Changed, ' +
  '  CountryCode = :CountryCode_Changed, ' +
  '  Country = :Country_Changed ' +
  'WHERE ID_Address = :ID_Address ';
end;

procedure TAddressListBase.SetParams(const DBQuery: TDBQuery);
begin
  DBQuery.AssignParam(EID_BaseEntity, EID_BaseEntity_ChangedParameterName);
  DBQuery.AssignParam(Routing, Routing_ChangedParameterName);
  DBQuery.AssignParam(StreetName, StreetName_ChangedParameterName);
  DBQuery.AssignParam(HouseNumber, HouseNumber_ChangedParameterName);
  DBQuery.AssignParam(PostalCode, PostalCode_ChangedParameterName);
  DBQuery.AssignParam(City, City_ChangedParameterName);
  DBQuery.AssignParam(CountryCode, CountryCode_ChangedParameterName);
  DBQuery.AssignParam(Country, Country_ChangedParameterName);
end;

function TAddressListBase.FillJoinedColumnPair(): TJoinedColumnPair;
begin
  Result := TJoinedColumnPair.Create(Address_TableName, EID_BaseEntityFieldName, BaseEntity_TableName, ID_BaseEntityFieldName);
end;

procedure TAddressListBase.FillDeleteQueryRecordList(const DeleteQueryRecordList: TMSDMLQueryRecordList);
var
  DeleteQueryRecord: TMSDMLQueryRecord;
begin
  inherited FillDeleteQueryRecordList(DeleteQueryRecordList);
  DeleteQueryRecord.SetQueryTextMethod := Self.SetDeleteQueryText;
  DeleteQueryRecord.SetParamsMethod := nil;
  DeleteQueryRecord.JoinedColumnPair := FillJoinedColumnPair();
  DeleteQueryRecordList.Add(DeleteQueryRecord);
end;

procedure TAddressListBase.FillInsertQueryRecordList(const InsertQueryRecordList: TMSDMLQueryRecordList);
var
  InsertQueryRecord: TMSDMLQueryRecord;
begin
  inherited FillInsertQueryRecordList(InsertQueryRecordList);
  InsertQueryRecord.SetQueryTextMethod := Self.SetInsertQueryText;
  InsertQueryRecord.SetParamsMethod := Self.SetParams;
  InsertQueryRecord.JoinedColumnPair := FillJoinedColumnPair();
  InsertQueryRecordList.Add(InsertQueryRecord);
end;

procedure TAddressListBase.FillUpdateQueryRecordList(const UpdateQueryRecordList: TMSDMLQueryRecordList);
var
  UpdateQueryRecord: TMSDMLQueryRecord;
begin
  inherited FillUpdateQueryRecordList(UpdateQueryRecordList);
  UpdateQueryRecord.SetQueryTextMethod := Self.SetUpdateQueryText;
  UpdateQueryRecord.SetParamsMethod := Self.SetParams;
  UpdateQueryRecord.JoinedColumnPair := FillJoinedColumnPair();
  UpdateQueryRecordList.Add(UpdateQueryRecord);
end;

function TAddressListBase.GetID_Address(): TNullableInteger;
begin
  Result := ID_AddressField.AsNullableInteger;
end;

procedure TAddressListBase.SetID_Address(const Value: TNullableInteger);
begin
  ID_AddressField.AsNullableInteger := Value;
end;

function TAddressListBase.GetEID_BaseEntity(): TNullableInteger;
begin
  Result := EID_BaseEntityField.AsNullableInteger;
end;

procedure TAddressListBase.SetEID_BaseEntity(const Value: TNullableInteger);
begin
  EID_BaseEntityField.AsNullableInteger := Value;
end;

function TAddressListBase.GetRouting(): TNullableString;
begin
  Result := RoutingField.AsNullableString;
end;

procedure TAddressListBase.SetRouting(const Value: TNullableString);
begin
  RoutingField.AsNullableString := Value;
end;

function TAddressListBase.GetStreetName(): TNullableString;
begin
  Result := StreetNameField.AsNullableString;
end;

procedure TAddressListBase.SetStreetName(const Value: TNullableString);
begin
  StreetNameField.AsNullableString := Value;
end;

function TAddressListBase.GetHouseNumber(): TNullableString;
begin
  Result := HouseNumberField.AsNullableString;
end;

procedure TAddressListBase.SetHouseNumber(const Value: TNullableString);
begin
  HouseNumberField.AsNullableString := Value;
end;

function TAddressListBase.GetPostalCode(): TNullableString;
begin
  Result := PostalCodeField.AsNullableString;
end;

procedure TAddressListBase.SetPostalCode(const Value: TNullableString);
begin
  PostalCodeField.AsNullableString := Value;
end;

function TAddressListBase.GetCity(): TNullableString;
begin
  Result := CityField.AsNullableString;
end;

procedure TAddressListBase.SetCity(const Value: TNullableString);
begin
  CityField.AsNullableString := Value;
end;

function TAddressListBase.GetCountryCode(): TNullableString;
begin
  Result := CountryCodeField.AsNullableString;
end;

procedure TAddressListBase.SetCountryCode(const Value: TNullableString);
begin
  CountryCodeField.AsNullableString := Value;
end;

function TAddressListBase.GetCountry(): TNullableString;
begin
  Result := CountryField.AsNullableString;
end;

procedure TAddressListBase.SetCountry(const Value: TNullableString);
begin
  CountryField.AsNullableString := Value;
end;

function TAddressListBase.GetEnumerator(): TAddressBaseEnumerator;
begin
  Result := TAddressBaseEnumerator.Create(Self);
end;

{
object ID_AddressDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 8
  Width = 165
  Height = 17
  FocusControl = ID_AddressDbEdit
end
object ID_AddressDbEdit: TDBEdit
  Left = 10
  Top = 22
  Width = 221
  Height = 21
  TabOrder = 0
end
object EID_BaseEntityDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 50
  Width = 165
  Height = 17
  FocusControl = EID_BaseEntityDbEdit
end
object EID_BaseEntityDbEdit: TDBEdit
  Left = 10
  Top = 64
  Width = 221
  Height = 21
  TabOrder = 1
end
object RoutingDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 92
  Width = 165
  Height = 17
  FocusControl = RoutingDbEdit
end
object RoutingDbEdit: TDBEdit
  Left = 10
  Top = 106
  Width = 221
  Height = 21
  TabOrder = 2
end
object StreetNameDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 134
  Width = 165
  Height = 17
  FocusControl = StreetNameDbEdit
end
object StreetNameDbEdit: TDBEdit
  Left = 10
  Top = 148
  Width = 221
  Height = 21
  TabOrder = 3
end
object HouseNumberDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 176
  Width = 165
  Height = 17
  FocusControl = HouseNumberDbEdit
end
object HouseNumberDbEdit: TDBEdit
  Left = 10
  Top = 190
  Width = 221
  Height = 21
  TabOrder = 4
end
object PostalCodeDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 218
  Width = 165
  Height = 17
  FocusControl = PostalCodeDbEdit
end
object PostalCodeDbEdit: TDBEdit
  Left = 10
  Top = 232
  Width = 221
  Height = 21
  TabOrder = 5
end
object CityDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 260
  Width = 165
  Height = 17
  FocusControl = CityDbEdit
end
object CityDbEdit: TDBEdit
  Left = 10
  Top = 274
  Width = 221
  Height = 21
  TabOrder = 6
end
object CountryCodeDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 302
  Width = 165
  Height = 17
  FocusControl = CountryCodeDbEdit
end
object CountryCodeDbEdit: TDBEdit
  Left = 10
  Top = 316
  Width = 221
  Height = 21
  TabOrder = 7
end
object CountryDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 344
  Width = 165
  Height = 17
  FocusControl = CountryDbEdit
end
object CountryDbEdit: TDBEdit
  Left = 10
  Top = 358
  Width = 221
  Height = 21
  TabOrder = 8
end
object ID_BaseEntityDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 386
  Width = 165
  Height = 17
  FocusControl = ID_BaseEntityDbEdit
end
object ID_BaseEntityDbEdit: TDBEdit
  Left = 10
  Top = 400
  Width = 221
  Height = 21
  TabOrder = 9
end
object ExternalIDDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 428
  Width = 165
  Height = 17
  FocusControl = ExternalIDDbEdit
end
object ExternalIDDbEdit: TDBEdit
  Left = 10
  Top = 442
  Width = 221
  Height = 21
  TabOrder = 10
end
object ID_UserPersonInsertDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 470
  Width = 165
  Height = 17
  FocusControl = ID_UserPersonInsertDbEdit
end
object ID_UserPersonInsertDbEdit: TDBEdit
  Left = 10
  Top = 484
  Width = 221
  Height = 21
  TabOrder = 11
end
object TimeStampInsertDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 512
  Width = 165
  Height = 17
  FocusControl = TimeStampInsertDbEdit
end
object TimeStampInsertDbEdit: TDBEdit
  Left = 10
  Top = 526
  Width = 221
  Height = 21
  TabOrder = 12
end
object ID_UserPersonUpdateDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 554
  Width = 165
  Height = 17
  FocusControl = ID_UserPersonUpdateDbEdit
end
object ID_UserPersonUpdateDbEdit: TDBEdit
  Left = 10
  Top = 568
  Width = 221
  Height = 21
  TabOrder = 13
end
object TimeStampLastUpdateDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 596
  Width = 165
  Height = 17
  FocusControl = TimeStampLastUpdateDbEdit
end
object TimeStampLastUpdateDbEdit: TDBEdit
  Left = 10
  Top = 610
  Width = 221
  Height = 21
  TabOrder = 14
end
object StartDateTimeDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 638
  Width = 165
  Height = 17
  FocusControl = StartDateTimeDbEdit
end
object StartDateTimeDbEdit: TDBEdit
  Left = 10
  Top = 652
  Width = 221
  Height = 21
  TabOrder = 15
end
object FinishDateTimeDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 680
  Width = 165
  Height = 17
  FocusControl = FinishDateTimeDbEdit
end
object FinishDateTimeDbEdit: TDBEdit
  Left = 10
  Top = 694
  Width = 221
  Height = 21
  TabOrder = 16
end
object RemarkDbDisplayLabel: TDbDisplayLabel
  Left = 13
  Top = 722
  Width = 165
  Height = 17
  FocusControl = RemarkDbEdit
end
object RemarkDbEdit: TDBEdit
  Left = 10
  Top = 736
  Width = 221
  Height = 21
  TabOrder = 17
end

procedure TAddressWijzigenForm.SetAddress(const Value: TAddress);
var
  AddressList: TAddressList;
begin
  if Assigned(Value) then
  begin
    AddressList:= Value.AddressList;
    AssignDataField(Self.ID_AddressDbDisplayLabel, Self.ID_AddressDbEdit, AddressList.ID_AddressField);
    AssignDataField(Self.EID_BaseEntityDbDisplayLabel, Self.EID_BaseEntityDbEdit, AddressList.EID_BaseEntityField);
    AssignDataField(Self.RoutingDbDisplayLabel, Self.RoutingDbEdit, AddressList.RoutingField);
    AssignDataField(Self.StreetNameDbDisplayLabel, Self.StreetNameDbEdit, AddressList.StreetNameField);
    AssignDataField(Self.HouseNumberDbDisplayLabel, Self.HouseNumberDbEdit, AddressList.HouseNumberField);
    AssignDataField(Self.PostalCodeDbDisplayLabel, Self.PostalCodeDbEdit, AddressList.PostalCodeField);
    AssignDataField(Self.CityDbDisplayLabel, Self.CityDbEdit, AddressList.CityField);
    AssignDataField(Self.CountryCodeDbDisplayLabel, Self.CountryCodeDbEdit, AddressList.CountryCodeField);
    AssignDataField(Self.CountryDbDisplayLabel, Self.CountryDbEdit, AddressList.CountryField);
    AssignDataField(Self.ID_BaseEntityDbDisplayLabel, Self.ID_BaseEntityDbEdit, AddressList.ID_BaseEntityField);
    AssignDataField(Self.ExternalIDDbDisplayLabel, Self.ExternalIDDbEdit, AddressList.ExternalIDField);
    AssignDataField(Self.ID_UserPersonInsertDbDisplayLabel, Self.ID_UserPersonInsertDbEdit, AddressList.ID_UserPersonInsertField);
    AssignDataField(Self.TimeStampInsertDbDisplayLabel, Self.TimeStampInsertDbEdit, AddressList.TimeStampInsertField);
    AssignDataField(Self.ID_UserPersonUpdateDbDisplayLabel, Self.ID_UserPersonUpdateDbEdit, AddressList.ID_UserPersonUpdateField);
    AssignDataField(Self.TimeStampLastUpdateDbDisplayLabel, Self.TimeStampLastUpdateDbEdit, AddressList.TimeStampLastUpdateField);
    AssignDataField(Self.StartDateTimeDbDisplayLabel, Self.StartDateTimeDbEdit, AddressList.StartDateTimeField);
    AssignDataField(Self.FinishDateTimeDbDisplayLabel, Self.FinishDateTimeDbEdit, AddressList.FinishDateTimeField);
    AssignDataField(Self.RemarkDbDisplayLabel, Self.RemarkDbEdit, AddressList.RemarkField);
    FAddress := Value;
    DataSource.DataSet := AddressList;
  end
  else
    DataSource.DataSet := nil;
end;
}
end.
