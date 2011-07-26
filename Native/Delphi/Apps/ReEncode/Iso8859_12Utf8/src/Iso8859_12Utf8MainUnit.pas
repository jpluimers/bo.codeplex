unit Iso8859_12Utf8MainUnit;

interface

uses
  ConsoleFilesProcessorUnit;

type
  TIso8859_12Utf8Main = class(TConsoleFilesProcessor)
    procedure Run; override;
  end;

implementation

uses
  Iso8859_12Utf8ProcessorUnit;

{ TUtf82AsciiMain }

procedure TIso8859_12Utf8Main.Run;
var
  Iso8859_12Utf8Processor: TIso8859_12Utf8Processor;
begin
  Iso8859_12Utf8Processor := TIso8859_12Utf8Processor.Create();
  try
    Iso8859_12Utf8Processor.Process(InputStream, OutputStream);
  finally
    Iso8859_12Utf8Processor.Free;
  end;
end;

end.
