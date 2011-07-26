unit Utf8ToAsciiMainUnit;

interface

uses
  ConsoleFilesProcessorUnit;

type
  TUtf162Utf8Main = class(TConsoleFilesProcessor)
    procedure Run; override;
  end;

implementation

uses
  Windows,
  Classes,
  SysUtils,
  Utf8ToAsciiProcessorUnit;

{ TUtf162Utf8Main }

procedure TUtf162Utf8Main.Run;
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
