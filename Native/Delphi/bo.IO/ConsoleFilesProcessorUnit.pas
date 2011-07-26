unit ConsoleFilesProcessorUnit;

interface

uses
  Classes;

type
  TConsoleFilesProcessor = class
    class procedure Main;
    procedure Run; virtual; abstract;
  strict private
    FInputStream: TStream;
    FOutputStream: TStream;
  strict protected
    procedure CreateInputStream; virtual;
    procedure CreateOutputStream; virtual;
    function GetInputStream: TStream; virtual;
    function GetOutputStream: TStream; virtual;
  public
    destructor Destroy; override;
    property InputStream: TStream read GetInputStream;
    property OutputStream: TStream read GetOutputStream;
  end;

implementation

uses
  SysUtils, Windows;

destructor TConsoleFilesProcessor.Destroy;
begin
  inherited;
  FInputStream.Free();
  FInputStream  := nil;
  FOutputStream.Free();
  FOutputStream := nil;
end;

procedure TConsoleFilesProcessor.CreateInputStream;
begin
  if ParamCount > 0 then
    FInputStream := TFileStream.Create(ParamStr(1), fmOpenRead)
  else
    FInputStream := THandleStream.Create(STD_INPUT_HANDLE);
end;

procedure TConsoleFilesProcessor.CreateOutputStream;
var
  OutputFileName: string;
begin
  if ParamCount > 1 then
  begin
    OutputFileName := ParamStr(2);
    if FileExists(OutputFileName) then
      FOutputStream := TFileStream.Create(OutputFileName, fmOpenWrite)
    else
      FOutputStream := TFileStream.Create(OutputFileName, fmOpenWrite or fmCreate);
  end
  else
    FOutputStream := THandleStream.Create(STD_OUTPUT_HANDLE);
end;

function TConsoleFilesProcessor.GetInputStream: TStream;
begin
  if not Assigned(FInputStream) then
    CreateInputStream();
  Result := FInputStream;
end;

function TConsoleFilesProcessor.GetOutputStream: TStream;
begin
  if not Assigned(FOutputStream) then
    CreateOutputStream();
  Result := FOutputStream;
end;

{ TUtf82AsciiMain }

class procedure TConsoleFilesProcessor.Main;
var
  ConsoleFilesProcessor: TConsoleFilesProcessor;
begin
  ConsoleFilesProcessor := Self.Create();
  ConsoleFilesProcessor.Run();
end;

end.
