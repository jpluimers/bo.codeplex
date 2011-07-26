unit Utf8ToAsciiMainUnit;

interface

uses
  ConsoleFilesProcessorUnit;

type
  TUtf82AsciiMain = class(TConsoleFilesProcessor)
    procedure Run; override;
  end;

implementation

uses
  Windows,
  Classes,
  SysUtils,
  Utf8ToAsciiProcessorUnit;

{ TUtf82AsciiMain }

procedure TUtf82AsciiMain.Run;
var
  Utf8ToAsciiProcessor: TUtf8ToAsciiProcessor;
begin
  Utf8ToAsciiProcessor := TUtf8ToAsciiProcessor.Create();
  try
    Utf8ToAsciiProcessor.Process(InputStream, OutputStream);
  finally
    Utf8ToAsciiProcessor.Free;
  end;
end;

end.
