unit BytesUtilsUnit;

interface

uses
  Classes,
  SysUtils;

function LoadFromFile(const FileName: string): TBytes; overload;

function LoadFromStream(Stream: TStream): TBytes; overload;

procedure SaveToFile(const Value: TBytes; const FileName: string); overload;

procedure SaveToStream(const Value: TBytes; const Stream: TStream); overload;

implementation

function LoadFromFile(const FileName: string): TBytes;
var
  Stream: TStream;
begin
  Stream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    Result := LoadFromStream(Stream);
  finally
    Stream.Free;
  end;
end;

function LoadFromStream(Stream: TStream): TBytes; overload;
var
  Size: Integer;
begin
  Size := Stream.Size - Stream.Position;
  SetLength(Result, Size);
  Stream.Read(Result[0], Size);
end;

procedure SaveToFile(const Value: TBytes; const FileName: string);
var
  Stream: TStream;
begin
  Stream := TFileStream.Create(FileName, fmCreate);
  try
    SaveToStream(Value, Stream);
  finally
    Stream.Free;
  end;
end;

procedure SaveToStream(const Value: TBytes; const Stream: TStream);
begin
  Stream.WriteBuffer(Value[0], Length(Value));
end;

end.
