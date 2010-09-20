unit MSConnectionLayerUnit;

interface

uses
  ADODB, NullablesUnit;

type
  TDBQuery = class(TADOQuery)
  public
    procedure AssignParam(const Value: TNullableBoolean; const ParamName: string); overload;
    procedure AssignParam(const Value: TNullableDateTime; const ParamName: string); overload;
    procedure AssignParam(const Value: TNullableDouble; const ParamName: string); overload;
    procedure AssignParam(const Value: TNullableInteger; const ParamName: string); overload;
    procedure AssignParam(const Value: TNullableString; const ParamName: string); overload;
  end;
  TDBConnection = TADOConnection;

implementation

uses
  Variants, SysUtils;

procedure TDBQuery.AssignParam(const Value: TNullableBoolean; const ParamName: string);
var
  Parameter: TParameter;
begin
  Parameter := Parameters.ParamByName(ParamName);
  if Value.IsNull then
    Parameter.Value := Unassigned
  else
    Parameter.Value := Value.Value;
end;

procedure TDBQuery.AssignParam(const Value: TNullableDateTime; const ParamName: string);
var
  Parameter: TParameter;
begin
  Parameter := Parameters.ParamByName(ParamName);
  if Value.IsNull then
    Parameter.Value := Unassigned
  else
  begin
    if Frac(Value.Value) = 0 then
      Parameter.Value := DateToStr(Value.Value)
    else
      Parameter.Value := DateTimeToStr(Value.Value);
  end;
end;

procedure TDBQuery.AssignParam(const Value: TNullableDouble; const ParamName: string);
var
  Parameter: TParameter;
begin
  Parameter := Parameters.ParamByName(ParamName);
  if Value.IsNull then
    Parameter.Value := Unassigned
  else
    Parameter.Value := Value.Value;
end;

procedure TDBQuery.AssignParam(const Value: TNullableInteger; const ParamName: string);
var
  Parameter: TParameter;
begin
  Parameter := Parameters.ParamByName(ParamName);
  if Value.IsNull then
    Parameter.Value := Unassigned
  else
    Parameter.Value := Value.Value;
end;

procedure TDBQuery.AssignParam(const Value: TNullableString; const ParamName: string);
var
  Parameter: TParameter;
begin
  Parameter := Parameters.ParamByName(ParamName);
  if Value.IsNull then
    Parameter.Value := Unassigned
  else
    Parameter.Value := Value.Value;
end;

end.
