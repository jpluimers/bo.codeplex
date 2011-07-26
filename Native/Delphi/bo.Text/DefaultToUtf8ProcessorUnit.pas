unit DefaultToUtf8ProcessorUnit;

interface

uses
  DefaultToDefaultProcessorUnit, SysUtils;

type
  TDefaultToUtf8Processor = class(TDefaultToDefaultProcessor)
  public
    function GetOutputEncoding: TEncoding; override;
  end;

implementation

{ TDefaultToUtf8Processor }

function TDefaultToUtf8Processor.GetOutputEncoding: TEncoding;
begin
  Result := TEncoding.UTF8;
end;

end.
