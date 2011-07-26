unit Iso8859_12Utf8ProcessorUnit;

interface

uses
  DefaultToUtf8ProcessorUnit, SysUtils;

type
  TIso8859_12Utf8Processor = class(TDefaultToUtf8Processor)
  private
    FInputEncoding: TEncoding;
  public
    destructor Destroy; override;
    function GetInputEncoding: TEncoding; override;
  end;

implementation

destructor TIso8859_12Utf8Processor.Destroy;
begin
  inherited;
  if Assigned(FInputEncoding) then
    if not TEncoding.IsStandardEncoding(FInputEncoding) then
    begin
      FInputEncoding.Free();
      FInputEncoding := nil;
    end;
end;

{ TIso8859_12Utf8Processor }

function TIso8859_12Utf8Processor.GetInputEncoding: TEncoding;
const
  // CodePage list: http://msdn.microsoft.com/en-us/library/dd317756(VS.85).aspx
  Iso8859_1CodePage = 28591; // ISO 8859-1 Latin 1; Western European (ISO)
begin
  // on demand construction of the Encoding
  FInputEncoding := TEncoding.GetEncoding(Iso8859_1CodePage);
  Result := FInputEncoding;
end;

end.
