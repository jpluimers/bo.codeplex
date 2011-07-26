unit DefaultToDefaultProcessorUnit;

interface

uses
  Classes,
  SysUtils;

type
  TDefaultToDefaultProcessor = class
  public
    procedure Process(const inputStream: TStream; const outputStream: TStream); overload; virtual;
    //1 TStreamReader and TStreamWriter were introduced in Delphi 2009
    procedure Process(const inputStreamReader: TStreamReader; const outputStreamWriter: TStreamWriter); overload; virtual;
    function ProcessLine(const inputLine: string): string; virtual;
    function CreateStreamReader(const inputStream: TStream): TStreamReader; virtual;
    function CreateStreamWriter(const outputStream: TStream): TStreamWriter; virtual;
    function GetInputEncoding(): TEncoding; virtual;
    function GetOutputEncoding(): TEncoding; virtual;
  end;

implementation

{ TDefaultToDefaultProcessor }

procedure TDefaultToDefaultProcessor.Process(const inputStream: TStream;
  const outputStream: TStream);
var
  inputStreamReader: TStreamReader;
  outputStreamWriter: TStreamWriter;
begin
  inputStreamReader := CreateStreamReader(inputStream);
  outputStreamWriter := CreateStreamWriter(outputStream);
  Process(inputStreamReader, outputStreamWriter);
  outputStreamWriter.Flush();
end;

procedure TDefaultToDefaultProcessor.Process(
  const inputStreamReader: TStreamReader;
  const outputStreamWriter: TStreamWriter);
var
  inputLine: string;
  outputLine: string;
begin
  while not inputStreamReader.EndOfStream do
  begin
    inputLine := inputStreamReader.ReadLine();
    outputLine := ProcessLine(inputLine);
    outputStreamWriter.WriteLine(outputLine);
  end;
end;

function TDefaultToDefaultProcessor.ProcessLine(
  const inputLine: string): string;
begin
  Result := inputLine;
end;

function TDefaultToDefaultProcessor.CreateStreamReader(
  const inputStream: TStream): TStreamReader;
begin
  Result := TStreamReader.Create(inputStream, GetInputEncoding(), True);
end;

function TDefaultToDefaultProcessor.CreateStreamWriter(
  const outputStream: TStream): TStreamWriter;
begin
  Result := TStreamWriter.Create(outputStream, GetOutputEncoding());
end;

function TDefaultToDefaultProcessor.GetInputEncoding: TEncoding;
begin
  Result := TEncoding.Default;
end;

function TDefaultToDefaultProcessor.GetOutputEncoding: TEncoding;
begin
  Result := TEncoding.Default;
end;

end.
