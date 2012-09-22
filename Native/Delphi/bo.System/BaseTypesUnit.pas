{ Copyright (c) 2007-2012 Jeroen Wiert Pluimers for BeSharp.net and better office benelux.
Full BSD License is available at http://besharp.codeplex.com/license and http://bo.codeplex.com/license }

unit BaseTypesUnit;

interface

uses
  SysUtils;

type
  EBaseException = class(Exception)
    function FormatErrorMessage(const e: Exception; const s: WideString): string;
  strict protected
    function GetEntityDescription: string; virtual;
    property EntityDescription: string read GetEntityDescription;
  public
    constructor Create(const InnerException: Exception; const ActionDescription: string); overload;
  end;

implementation

constructor EBaseException.Create(const InnerException: Exception; const ActionDescription: string);
var
  NewMessage: string;
begin
  NewMessage := FormatErrorMessage(InnerException, ActionDescription);
  inherited Create(NewMessage);
end;

function EBaseException.FormatErrorMessage(const e: Exception; const s: WideString): string;
begin
  Result := s;
  if e = nil then
    Result := s
  else
    Result := Format('%s%s [%s] at %P: %s',
      [s, #13#10, e.ClassName, ExceptAddr, e.Message]);
end;

function EBaseException.GetEntityDescription: string;
begin
  Result := 'item';
end;

end.
