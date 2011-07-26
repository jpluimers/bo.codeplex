unit Utf16ToUtf8ProcessorUnit;

interface

uses
  DefaultToUtf8ProcessorUnit, SysUtils;

type
  TUtf16ToUtf8Processor = class(TDefaultToUtf8Processor)
  private
    FInputEncoding: TEncoding;
  public
    function GetInputEncoding: TEncoding; override;
  end;

implementation

{ TUtf16ToUtf8Processor }

function TUtf16ToUtf8Processor.GetInputEncoding: TEncoding;
begin
  Result := TEncoding.Unicode;
end;

end.
