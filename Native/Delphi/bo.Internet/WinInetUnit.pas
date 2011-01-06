unit WinInetUnit;

interface

uses
  Classes,
  WinInet;

const
  SHttp = 'http://';

type
  // based on http://stackoverflow.com/questions/4586288/can-i-load-a-memo-or-rich-edit-from-a-text-fie-on-server/4586333#4586333
  // and http://www.cryer.co.uk/brian/delphi/wininet.htm
  TWinInet = class
  strict protected
    class function ReadAnsiStringResponse(const UrlHandle: HINTERNET): AnsiString; static;
    class procedure ReadBinaryFileResponse(const UrlHandle: HINTERNET; const LocalFileName: string); static;
    class procedure ReadResponse(const UrlHandle: HINTERNET; const ContentStream: TStream);
    class procedure ReadResponseAndFreeStream(const UrlHandle: Pointer; ContentStream: TFileStream);
    //1 based on http://msdn.microsoft.com/en-us/library/aa385373(v=vs.85).aspx
    class function ReadResponseHeaders(const UrlHandle: HINTERNET): string; static;
    class function ReadUtf8StringResponse(const UrlHandle: HINTERNET): string; static;
  public
    class function DownloadAnsiString(const UserAgent, Url: string): AnsiString; overload; static;
    class function DownloadAnsiStringWithResponseHeaders(const UserAgent, Url: string; var ResponseHeaders: string): AnsiString; overload; static;
    class procedure DownloadBinaryFile(const UserAgent, Url, LocalFileName: string); overload; static;
    class function DownloadUtf8String(const UserAgent, Url: string): string; overload; static;
    class function DownloadUtf8StringWithResponseHeaders(const UserAgent, Url: string; var ResponseHeaders: string): string; overload; static;
    class function HttpDownloadAnsiString(const UserAgent: string; const Server: string; const Resource: string): AnsiString; overload; static;
    class function HttpDownloadAnsiStringWithResponseHeaders(const UserAgent, Server, Resource: string; var ResponseHeaders: string): AnsiString; overload; static;
    class procedure HttpDownloadBinaryFileWithResponseHeaders(const UserAgent, Url, LocalFileName: string; var ResponseHeaders: string); overload; static;
    class function HttpDownloadUtf8String(const UserAgent: string; const Server: string; const Resource: string): string; overload; static;
    class function HttpDownloadUtf8StringWithResponseHeaders(const UserAgent, Server, Resource: string; var ResponseHeaders: string): string; overload; static;
    class function MakeHttpUrl(const Server, Resource: string): string; static;
  end;


implementation

uses
  SysUtils,
  Variants,
  Windows,
  IOUtils;

class function TWinInet.ReadAnsiStringResponse(const UrlHandle: HINTERNET): AnsiString;
var
  ContentMemoryStream: TMemoryStream;
begin
  ContentMemoryStream := TMemoryStream.Create();
  try
    ReadResponse(UrlHandle, ContentMemoryStream);
    Result := PAnsiChar(ContentMemoryStream.Memory);
  finally
    ContentMemoryStream.Free;
  end;
end;

class procedure TWinInet.ReadBinaryFileResponse(const UrlHandle: HINTERNET; const LocalFileName: string);
var
  ContentStream: TFileStream;
begin
  ContentStream := TFile.Create(LocalFileName);
  try
    ReadResponse(UrlHandle, ContentStream);
  finally
    ContentStream.Free;
  end;
end;

class procedure TWinInet.ReadResponse(const UrlHandle: HINTERNET; const ContentStream: TStream);
var
  Buffer: array[0..1023] of Byte;
  BytesRead: Cardinal;
begin
  repeat
    InternetReadFile(UrlHandle, @Buffer, SizeOf(Buffer), BytesRead);
    ContentStream.Write(Buffer, BytesRead);
  until BytesRead = 0;
end;

class procedure TWinInet.ReadResponseAndFreeStream(const UrlHandle: Pointer; ContentStream: TFileStream);
begin
  try
    ReadResponse(UrlHandle, ContentStream);
  finally
    ContentStream.Free;
  end;
end;

class function TWinInet.ReadResponseHeaders(const UrlHandle: HINTERNET): string;
var
  BufferStringStream: TStringStream;
  BufferSize: Cardinal;
  LastError: Integer;
  Reserved: Cardinal;
begin
  Result := NullAsStringValue;
  BufferStringStream := TStringStream.Create(NullAsStringValue, TEncoding.Unicode);
  try
    BufferSize := 0;
    Reserved := 0;
    if not HttpQueryInfo(UrlHandle,
      HTTP_QUERY_RAW_HEADERS_CRLF,
      BufferStringStream.Memory, BufferSize, Reserved)
    then
    begin
      LastError := GetLastError();
      if ERROR_HTTP_HEADER_NOT_FOUND = LastError then
        Exit;
      if ERROR_INSUFFICIENT_BUFFER = LastError then
      begin
        BufferStringStream.Size := BufferSize;
        if HttpQueryInfo(UrlHandle,
          HTTP_QUERY_RAW_HEADERS_CRLF,
          BufferStringStream.Memory, BufferSize, Reserved)
        then
          Result := BufferStringStream.DataString
        else
          RaiseLastOSError();
      end;
    end;
  finally
    BufferStringStream.Free;
  end;
end;

class function TWinInet.ReadUtf8StringResponse(const UrlHandle: HINTERNET): string;
var
  ContentStringStream: TStringStream;
begin
  ContentStringStream := TStringStream.Create(NullAsStringValue, TEncoding.UTF8);
  try
    ReadResponse(UrlHandle, ContentStringStream);
    Result := ContentStringStream.DataString;
  finally
    ContentStringStream.Free;
  end;
end;

class function TWinInet.DownloadAnsiString(const UserAgent, Url: string): AnsiString;
var
  InternetHandle: HINTERNET;
  UrlHandle: HINTERNET;
begin
  Result := '';
  InternetHandle := InternetOpen(PChar(UserAgent), INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
  try
    UrlHandle := InternetOpenUrl(InternetHandle, PChar(Url), nil, 0, 0, 0);
    try
      Result := ReadAnsiStringResponse(UrlHandle);
    finally
      InternetCloseHandle(UrlHandle);
    end;
  finally
    InternetCloseHandle(InternetHandle);
  end;
end;

class function TWinInet.DownloadAnsiStringWithResponseHeaders(const UserAgent, Url: string; var ResponseHeaders: string): AnsiString;
var
  InternetHandle: HINTERNET;
  UrlHandle: HINTERNET;
begin
  Result := '';
  InternetHandle := InternetOpen(PChar(UserAgent), INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
  try
    UrlHandle := InternetOpenUrl(InternetHandle, PChar(Url), nil, 0, 0, 0);
    try
      Result := ReadAnsiStringResponse(UrlHandle);
      ResponseHeaders := ReadResponseHeaders(UrlHandle);
    finally
      InternetCloseHandle(UrlHandle);
    end;
  finally
    InternetCloseHandle(InternetHandle);
  end;
end;

class procedure TWinInet.DownloadBinaryFile(const UserAgent, Url, LocalFileName: string);
var
  InternetHandle: HINTERNET;
  UrlHandle: HINTERNET;
begin
  InternetHandle := InternetOpen(PChar(UserAgent), INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
  try
    UrlHandle := InternetOpenUrl(InternetHandle, PChar(Url), nil, 0, 0, 0);
    try
      ReadBinaryFileResponse(UrlHandle, LocalFileName);
    finally
      InternetCloseHandle(UrlHandle);
    end;
  finally
    InternetCloseHandle(InternetHandle);
  end;
end;

class function TWinInet.DownloadUtf8String(const UserAgent, Url: string): string;
var
  InternetHandle: HINTERNET;
  UrlHandle: HINTERNET;
begin
  InternetHandle := InternetOpen(PChar(UserAgent), INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
  try
    UrlHandle := InternetOpenUrl(InternetHandle, PChar(Url), nil, 0, 0, 0);
    try
      Result := ReadUtf8StringResponse(UrlHandle);
    finally
      InternetCloseHandle(UrlHandle);
    end;
  finally
    InternetCloseHandle(InternetHandle);
  end;
end;

class function TWinInet.DownloadUtf8StringWithResponseHeaders(const UserAgent, Url: string; var ResponseHeaders: string): string;
var
  InternetHandle: HINTERNET;
  UrlHandle: HINTERNET;
begin
  InternetHandle := InternetOpen(PChar(UserAgent), INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
  try
    UrlHandle := InternetOpenUrl(InternetHandle, PChar(Url), nil, 0, 0, 0);
    try
      Result := ReadUtf8StringResponse(UrlHandle);
      ResponseHeaders := ReadResponseHeaders(UrlHandle);
    finally
      InternetCloseHandle(UrlHandle);
    end;
  finally
    InternetCloseHandle(InternetHandle);
  end;
end;

class function TWinInet.HttpDownloadAnsiString(const UserAgent: string; const Server: string; const Resource: string): AnsiString;
begin
  Result := DownloadAnsiString(UserAgent, MakeHttpUrl(Server, Resource));
end;

class function TWinInet.HttpDownloadAnsiStringWithResponseHeaders(const UserAgent, Server, Resource: string; var ResponseHeaders: string): AnsiString;
begin
  Result := DownloadAnsiStringWithResponseHeaders(UserAgent, MakeHttpUrl(Server, Resource), ResponseHeaders);
end;

class procedure TWinInet.HttpDownloadBinaryFileWithResponseHeaders(const UserAgent, Url, LocalFileName: string; var ResponseHeaders: string);
var
  InternetHandle: HINTERNET;
  UrlHandle: HINTERNET;
begin
  InternetHandle := InternetOpen(PChar(UserAgent), INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
  try
    UrlHandle := InternetOpenUrl(InternetHandle, PChar(Url), nil, 0, 0, 0);
    try
      ReadBinaryFileResponse(UrlHandle, LocalFileName);
      ResponseHeaders := ReadResponseHeaders(UrlHandle);
    finally
      InternetCloseHandle(UrlHandle);
    end;
  finally
    InternetCloseHandle(InternetHandle);
  end;
end;

class function TWinInet.HttpDownloadUtf8String(const UserAgent: string; const Server: string; const Resource: string): string;
begin
  Result := DownloadUtf8String(UserAgent, MakeHttpUrl(Server, Resource));
end;

class function TWinInet.HttpDownloadUtf8StringWithResponseHeaders(const UserAgent, Server, Resource: string; var ResponseHeaders: string): string;
begin
  Result := DownloadUtf8StringWithResponseHeaders(UserAgent, MakeHttpUrl(Server, Resource), ResponseHeaders);
end;

class function TWinInet.MakeHttpUrl(const Server, Resource: string): string;
begin
  Result := SHttp + Server + Resource;
end;

end.
