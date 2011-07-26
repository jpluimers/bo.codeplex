unit Utf8ToAsciiProcessorUnit;

interface

uses
  Utf8ToDefaultProcessorUnit, SysUtils;

type
  TUtf8ToAsciiProcessor = class(TUtf8ToDefaultProcessor)
  public
    function GetOutputEncoding: TEncoding; override;
  end;

implementation

{ TUtf8ToAsciiProcessor }

function TUtf8ToAsciiProcessor.GetOutputEncoding: TEncoding;
begin
  Result := TEncoding.ASCII; // built-in construction of the Encoding
end;

end.
