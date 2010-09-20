unit FieldHelperUnit;

interface

uses
  DB, NullablesUnit;

type
  TFloatFieldHelper = class helper for TFloatField
  strict private
    function GetAsNullableDouble: TNullableDouble;
    procedure SetAsNullableDouble(const Value: TNullableDouble);
  public
    property AsNullableDouble: TNullableDouble read GetAsNullableDouble write SetAsNullableDouble;
  end;

type
  TIntegerFieldHelper = class helper for TIntegerField
  strict private
    function GetAsNullableInteger: TNullableInteger;
    procedure SetAsNullableInteger(const Value: TNullableInteger);
  public
    property AsNullableInteger: TNullableInteger read GetAsNullableInteger write SetAsNullableInteger;
  end;

type
  TStringFieldHelper = class helper for TStringField
  strict private
    function GetAsNullableString: TNullableString;
    procedure SetAsNullableString(const Value: TNullableString);
  public
    property AsNullableString: TNullableString read GetAsNullableString write SetAsNullableString;
  end;

type
  TDateTimeFieldHelper = class helper for TDateTimeField
  strict private
    function GetAsNullableDateTime: TNullableDateTime;
    procedure SetAsNullableDateTime(const Value: TNullableDateTime);
  public
    property AsNullableDateTime: TNullableDateTime read GetAsNullableDateTime write SetAsNullableDateTime;
  end;

type
  TBooleanFieldHelper = class helper for TBooleanField
  strict private
    function GetAsNullableBoolean: TNullableBoolean;
    procedure SetAsNullableBoolean(const Value: TNullableBoolean);
  public
    property AsNullableBoolean: TNullableBoolean read GetAsNullableBoolean write SetAsNullableBoolean;
  end;

type
  TMemoFieldHelper = class helper for TBlobField //jpl: 20100318 - Access is TWideMemoField, SQL Server ene TMemoField
  strict private
    function GetAsNullableString: TNullableString;
    procedure SetAsNullableString(const Value: TNullableString);
  public
    property AsNullableString: TNullableString read GetAsNullableString write SetAsNullableString;
  end;

implementation

{ TFloatFieldHelper }

function TFloatFieldHelper.GetAsNullableDouble: TNullableDouble;
begin
  if Self.IsNull then
    Result.Clear()
  else
    Result.Value := Self.Value;
end;

procedure TFloatFieldHelper.SetAsNullableDouble(const Value: TNullableDouble);
begin
  if Value.IsNull then
    Clear()
  else
    Self.Value := Value.Value;
end;

{ TIntegerFieldHelper }

function TIntegerFieldHelper.GetAsNullableInteger: TNullableInteger;
begin
  if Self.IsNull then
    Result.Clear()
  else
    Result.Value := Self.Value;
end;

procedure TIntegerFieldHelper.SetAsNullableInteger(const Value: TNullableInteger);
begin
  if Value.IsNull then
    Clear()
  else
    Self.Value := Value.Value;
end;

{ TStringFieldHelper }

function TStringFieldHelper.GetAsNullableString: TNullableString;
begin
  if Self.IsNull then
    Result.Clear()
  else
    Result.Value := Self.AsString;
end;

procedure TStringFieldHelper.SetAsNullableString(const Value: TNullableString);
begin
  if Value.IsNull then
    Clear()
  else
    Self.AsString := Value.Value;
end;

{ TDateTimeFieldHelper }

function TDateTimeFieldHelper.GetAsNullableDateTime: TNullableDateTime;
begin
  if Self.IsNull then
    Result.Clear()
  else
    Result.Value := Self.Value;
end;

procedure TDateTimeFieldHelper.SetAsNullableDateTime(const Value: TNullableDateTime);
begin
  if Value.IsNull then
    Clear()
  else
    Self.Value := Value.Value;
end;

{ TBooleanFieldHelper }

function TBooleanFieldHelper.GetAsNullableBoolean: TNullableBoolean;
begin
  if Self.IsNull then
    Result.Clear()
  else
    Result.Value := Self.Value;
end;

procedure TBooleanFieldHelper.SetAsNullableBoolean(const Value: TNullableBoolean);
begin
  if Value.IsNull then
    Clear()
  else
    Self.Value := Value.Value;
end;

{ TMemoFieldHelper }

function TMemoFieldHelper.GetAsNullableString: TNullableString;
begin
  if Self.IsNull then
    Result.Clear()
  else
    Result.Value := Self.AsString;
end;

procedure TMemoFieldHelper.SetAsNullableString(const Value: TNullableString);
begin
  if Value.IsNull then
    Clear()
  else
    Self.AsString := Value.Value;
end;

end.
