unit FileUnit;

interface

uses
  SysUtils;

type
  //1 Loosely based on System.IO.File in the .NET framework
  TFile = class
  public
    class procedure WriteAllText(const path: string; const contents: string); overload;
    class procedure WriteAllText(const path: string; const contents: string; const encoding: TEncoding); overload;
  end;

implementation

uses
  Classes;

class procedure TFile.WriteAllText(const path: string; const contents: string);
begin
  TFile.WriteAllText(path, contents, TEncoding.UTF8); // TStreamWriter.UTF8NoBOM)
end;

class procedure TFile.WriteAllText(const path: string; const contents: string; const encoding: TEncoding);
var
  writer: TStreamWriter;
begin
  writer := TStreamWriter.Create(path, false, encoding);
  try
    writer.Write(contents);
  finally
    writer.Free;
  end;
end;

end.
