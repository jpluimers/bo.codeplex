unit MD5BaseCalculatorUnit;

interface

//##jpl: note that for Unicode you should perform some kind of Normalization (http://unicode.org/reports/tr15/)
// java SE6 includes a few of those (http://java.sun.com/developer/technicalArticles/javase/i18n_enhance/#normalization)
// MessageDigest_5 chooses to encode through UTF8, I'm not sure that is always a good thing to do.

type
  TMD5BaseCalculator = class(TObject)
  public
    procedure CalculateFile(const Filename:string; var MD5Hash: string); overload; virtual;
    procedure CalculateString(const Buffer:string; var MD5Hash: string); overload; virtual;
  end;

  TMD5Calculator = class(TMD5BaseCalculator)
  public
    procedure CalculateFile(const Filename:string; var MD5Hash: string); overload; override;
    procedure CalculateString(const Buffer:string; var MD5Hash: string); overload; override;
  end;

  TMessageDigest_5Calculator = class(TMD5BaseCalculator)
  public
    procedure CalculateFile(const Filename:string; var MD5Hash: string); overload; override;
    procedure CalculateString(const Buffer:string; var MD5Hash: string); overload; override;
  end;

  TMD5AndWriterCalculator = class(TMD5Calculator)
    procedure CalculateString(const Buffer:string; var MD5Hash: string); overload; override;
  end;

const
  ChunkSize = 8192; // for streaming of files

implementation

uses
  SysUtils, MD5, MessageDigest_5, Classes, Variants, Types;

procedure TMD5BaseCalculator.CalculateFile(const Filename:string; var MD5Hash: string);
begin
  MD5Hash := NullAsStringValue;
end;

procedure TMD5BaseCalculator.CalculateString(const Buffer:string; var MD5Hash: string);
begin
  MD5Hash := NullAsStringValue;
end;

procedure TMD5Calculator.CalculateFile(const Filename:string; var MD5Hash: string);
begin
  MD5Hash := LowerCase(FileMD5Digest(Filename));
end;

procedure TMD5Calculator.CalculateString(const Buffer:string; var MD5Hash: string);
begin
  MD5Hash := LowerCase(StringMD5Digest(Buffer));
end;

procedure TMessageDigest_5Calculator.CalculateFile(const Filename:string; var MD5Hash: string);
var
  hash: MessageDigest_5.IMD5;
  fingerprint: string;
  FileStream: TFileStream;
  Bytes: TByteDynArray; // ##jpl: equivalent but not equal to TBytes;
  NumberOfBytesRead: Cardinal;
begin
  hash := MessageDigest_5.GetMD5();
  try
    FileStream := TFileStream.Create(Filename, fmOpenRead or fmShareDenyWrite);
    try
      SetLength(Bytes, ChunkSize);
      repeat
        NumberOfBytesRead := FileStream.Read(Pointer(Bytes)^, ChunkSize);
        if NumberOfBytesRead > 0 then
          hash.Update(Bytes, NumberOfBytesRead);
      until NumberOfBytesRead < ChunkSize;
      if FileStream.Position = 0 then
        if FileStream.Size <> 0 then
          if NumberOfBytesRead = 0 then
            RaiseLastOSError();
    finally
      FileStream.Free;
    end;
    fingerprint := hash.AsString();
    MD5Hash := LowerCase(fingerprint);
  except
    on E: EFOpenError do
    begin
      // jpl: 20100803 - EFOpenError is not fatal
      MD5Hash := '';
    end;
  end;
end;

procedure TMessageDigest_5Calculator.CalculateString(const Buffer:string; var MD5Hash: string);
var
  hash: MessageDigest_5.IMD5;
  fingerprint: string;
begin
  hash := MessageDigest_5.GetMD5();
  hash.Update(Buffer);
  fingerprint := hash.AsString();
  MD5Hash := LowerCase(fingerprint);
end;

procedure TMD5AndWriterCalculator.CalculateString(const Buffer:string; var MD5Hash: string);
var
  Strings: TStrings;
  procedure SaveStrings(const Encoding: TEncoding; const EncodingName: string);
  begin
    Strings.SaveToFile(Format('%s.%s.%s.text', [Buffer, MD5Hash, EncodingName]), Encoding);
  end;
begin
  inherited CalculateString(Buffer, MD5Hash);
  Strings := TStringList.Create();
  try
    Strings.Text := Buffer;
    SaveStrings(TEncoding.ASCII, 'ASCII');
    SaveStrings(TEncoding.BigEndianUnicode, 'BigEndianUnicode');
    SaveStrings(TEncoding.Default, 'Default');
    SaveStrings(TEncoding.Unicode, 'Unicode');
    SaveStrings(TEncoding.UTF7, 'UTF7');
    SaveStrings(TEncoding.UTF8, 'UTF8');
  finally
    Strings.Free;
  end;
end;

end.
