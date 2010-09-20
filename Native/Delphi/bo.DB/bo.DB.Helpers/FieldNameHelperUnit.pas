unit FieldNameHelperUnit;

interface

function IsEIDFieldName(const FieldName: string): Boolean;

function IsIDFieldName(const FieldName: string): Boolean;

function IDFieldName(const TableName: string): string;

function StripEIDFromFieldName(const FieldName: string): string;

function StripIDFromFieldName(const FieldName: string): string;

const
  SEIDPRefix = 'EID_';
  SIDPrefix = 'ID_';

implementation

uses
  StrUtils, SysUtils;

function IsEIDFieldName(const FieldName: string): Boolean;
begin
  Result := StartsStr(SEIDPRefix, FieldName);
end;

function IsIDFieldName(const FieldName: string): Boolean;
begin
  Result := StartsStr(SIDPrefix, FieldName);
  Result := Result or IsEIDFieldName(FieldName);
end;

function IDFieldName(const TableName: string): string;
begin
  Result := Format('ID_%s', [TableName]);
end;

function StripEIDFromFieldName(const FieldName: string): string;
begin
  Result := FieldName;
  if IsEIDFieldName(Result) then
    Delete(Result, 1, Length(SEIDPrefix));
end;

function StripIDFromFieldName(const FieldName: string): string;
begin
  Result := StripEIDFromFieldName(FieldName);
  if IsIDFieldName(Result) then
    Delete(Result, 1, Length(SIDPrefix));
end;

end.
