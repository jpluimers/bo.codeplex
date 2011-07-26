unit Utf8ToDefaultProcessorUnit;

interface

uses
  DefaultToDefaultProcessorUnit, SysUtils;

type
  TUtf8ToDefaultProcessor = class(TDefaultToDefaultProcessor)
  public
    function GetInputEncoding: TEncoding; override;
  end;

implementation

{ TUtf8ToDefaultProcessor }

function TUtf8ToDefaultProcessor.GetInputEncoding: TEncoding;
begin
  Result := TEncoding.UTF8;
end;

end.
