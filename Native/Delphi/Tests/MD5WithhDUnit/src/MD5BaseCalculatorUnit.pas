unit MD5BaseCalculatorUnit;

interface

uses
  Classes;

//##jpl: note that for Unicode you should perform some kind of Normalization (http://unicode.org/reports/tr15/)
// java SE6 includes a few of those (http://java.sun.com/developer/technicalArticles/javase/i18n_enhance/#normalization)
// MessageDigest_5 chooses to encode through UTF8, I'm not sure that is always a good thing to do.

type
  TMD5BaseCalculator = class(TObject)
  strict protected
    function CreateReadOnlyFileStream(const Filename: string): TFileStream; virtual;
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

  //1 Utility class to write out a bunch of files with various encodings of the Buffer
  /// This allows you to test what values the unix/Linux md5 tool generates on the
  /// binary content.
  ///
  /// Note: md5 runs on binary, not on strings, so the encoding of your string does
  /// matter!
  TMD5AndWriterCalculator = class(TMD5Calculator)
    procedure CalculateString(const Buffer:string; var MD5Hash: string); overload; override;
  end;

  TIdHashMessageDigest5Calculator = class(TMD5BaseCalculator)
  public
    procedure CalculateFile(const Filename:string; var MD5Hash: string); overload; override;
    procedure CalculateString(const Buffer:string; var MD5Hash: string); overload; override;
  end;

const
  ChunkSize = 8192; // for streaming of files

implementation

uses
  SysUtils,
  MD5,
  MessageDigest_5,
  Variants,
  Types,
  IdHashMessageDigest;

procedure TMD5BaseCalculator.CalculateFile(const Filename:string; var MD5Hash: string);
begin
  MD5Hash := NullAsStringValue;
end;

procedure TMD5BaseCalculator.CalculateString(const Buffer:string; var MD5Hash: string);
begin
  MD5Hash := NullAsStringValue;
end;

function TMD5BaseCalculator.CreateReadOnlyFileStream(const Filename: string): TFileStream;
begin
  Result := TFileStream.Create(Filename, fmOpenRead or fmShareDenyWrite);
end;

procedure TMD5Calculator.CalculateFile(const Filename:string; var MD5Hash: string);
begin
  MD5Hash := string(FileMD5Digest(Filename));
end;

procedure TMD5Calculator.CalculateString(const Buffer:string; var MD5Hash: string);
begin
  MD5Hash := string(StringMD5Digest(Buffer));
end;

procedure TMessageDigest_5Calculator.CalculateFile(const Filename:string; var MD5Hash: string);
var
  Hasher: MessageDigest_5.IMD5;
  FileStream: TFileStream;
  Bytes: TByteDynArray; // ##jpl: equivalent but not equal to TBytes;
  NumberOfBytesRead: Cardinal;
begin
  Hasher := MessageDigest_5.GetMD5();
  try
    FileStream := CreateReadOnlyFileStream(Filename);
    try
      SetLength(Bytes, ChunkSize);
      repeat
        // ##jpl: to circumvent this error:
        // System Error. Code: 998.
        // Invalid access to memory location
        // Reason: open array of bytes will not pass the pointer to the first element.
        NumberOfBytesRead := FileStream.Read(Pointer(Bytes)^, ChunkSize);
        if NumberOfBytesRead > 0 then
          Hasher.Update(Bytes, NumberOfBytesRead);
      until NumberOfBytesRead < ChunkSize;
      if FileStream.Position = 0 then
        if FileStream.Size <> 0 then
          if NumberOfBytesRead = 0 then
            RaiseLastOSError();
    finally
      FileStream.Free;
    end;
    MD5Hash := Hasher.AsString();
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
  Hasher: MessageDigest_5.IMD5;
begin
  Hasher := MessageDigest_5.GetMD5();
  Hasher.Update(Buffer);
  MD5Hash := Hasher.AsString();
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

procedure TIdHashMessageDigest5Calculator.CalculateFile(const Filename:string; var MD5Hash: string);
var
  IdHashMessageDigest5 : TIdHashMessageDigest5;
  FileStream : TFileStream;
begin
  IdHashMessageDigest5 := TIdHashMessageDigest5.Create;
  FileStream := CreateReadOnlyFileStream(Filename);
  try
    MD5Hash := IdHashMessageDigest5.HashStreamAsHex(FileStream);
  finally
    FileStream.Free;
    IdHashMessageDigest5.Free;
  end;
end;

procedure TIdHashMessageDigest5Calculator.CalculateString(const Buffer:string; var MD5Hash: string);
var
  IdHashMessageDigest5 : TIdHashMessageDigest5;
begin
  IdHashMessageDigest5 := TIdHashMessageDigest5.Create;
  try
    MD5Hash := IdHashMessageDigest5.HashStringAsHex(Buffer);
  finally
    IdHashMessageDigest5.Free;
  end;
end;

end.
