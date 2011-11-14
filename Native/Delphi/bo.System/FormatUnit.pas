unit FormatUnit;

interface

function SafeFormat(const Format: string; const Args: array of const): string;

implementation

uses
  SysUtils;

function SafeFormat(const Format: string; const Args: array of const): string;
begin
  try
    Result := SysUtils.Format(Format, Args);
  except
    on E: Exception do
      Result := E.Message;
  end;
end;

end.
