// adapted from TWebBrowserWrapper in http://www.delphidabbler.com/articles?article=14

unit WebBrowserHelperUnit;

interface

uses
  SHDocVw, Classes, MSHTML, ActiveX, ComponentHelperUnit;

const
  SLocalAboutUrlPrefix = 'about:';
  SLocalFileUrlPrefix = 'file://';
  SLocalJavascriptUrlPrefix = 'javascript:';
  SLocalMailtoUrlPrefix = 'mailto:';

const
  SLocalAboutBlankUrl = SLocalAboutUrlPrefix + 'blank';

type
  // Save "style" used in TWebBrowserHelper.Save*** methods
  TWebBrowserSaveStyle = (wbsAll, wbsBodyHTML, wbsBodyText);

type
  TWebBrowserHelper = class helper(TComponentHelper) for TWebBrowser
  strict private
    function GetBodyElement: IHTMLElement;
    function GetPersistStreamInit: IPersistStreamInit;
    procedure InternalLoadDocumentFromStream(const Stream: TStream);
    procedure InternalSaveBodyHTMLToStream(const Stream: TStream);
    procedure InternalSaveBodyTextToStream(const Stream: TStream);
    procedure InternalSaveDocumentToStream(const Stream: TStream);
    function WebBrowserDocumentQueryInterface(const IID: TGUID; out Obj)
      : HResult; stdcall;
    property BodyElement: IHTMLElement read GetBodyElement;
    property PersistStreamInit: IPersistStreamInit read GetPersistStreamInit;
  public
    // 1 force WebBrowser.Document to become non-nil, but still show an empty page:
    procedure LoadAboutBlank;
    procedure LoadFromFile(const FileName: string);
    procedure LoadFromStream(const Stream: TStream);
    procedure LoadFromStreamAndFreeStream(const Stream: TStream);
    procedure LoadFromString(const HTML: string);
    procedure LoadFromXmlStreamAndFreeStream(FileStream: TFileStream);
    procedure LoadFromXmlString(const XML: string);
    function NavigateToLocalFile(const FileName: string): Boolean;
    procedure NavigateToResource(const ModuleName: string;
      const ResName: PChar; const ResType: PChar = nil); overload;
    procedure NavigateToResource(const Module: HMODULE; const ResName: PChar;
      const ResType: PChar = nil); overload;
    procedure NavigateToURL(const URL: string);
    procedure SaveToFile(const FileName: string;
      const Style: TWebBrowserSaveStyle = wbsAll);
    procedure SaveToStream(const Stream: TStream;
      const Style: TWebBrowserSaveStyle = wbsAll);
    function SaveToString(const Style: TWebBrowserSaveStyle = wbsAll): string;
  end;

implementation

uses
  StrUtils, SysUtils, Forms, StringUtilsUnit, MakeResourceUrlUnit, msxml;

const
  SResMsxmlDllDefaultssXsl = 'res://msxml.dll/defaultss.xsl';

  { TWebBrowserHelper }

function TWebBrowserHelper.GetBodyElement: IHTMLElement;
var
  HTMLDocument2: IHTMLDocument2;
begin
  Result := nil;
  if WebBrowserDocumentQueryInterface(IHTMLDocument2, HTMLDocument2) = S_OK then
    if Assigned(HTMLDocument2) then
      Result := HTMLDocument2.body;
end;

function TWebBrowserHelper.GetPersistStreamInit: IPersistStreamInit;
begin
  if not WebBrowserDocumentQueryInterface(IPersistStreamInit, Result)
    = S_OK then
    Result := nil;
end;

procedure TWebBrowserHelper.InternalLoadDocumentFromStream
  (const Stream: TStream);
var
  StreamAdapter: IStream;
begin
  // Get IPersistStreamInit interface on document object
  if Assigned(PersistStreamInit) then
  begin
    // Clear document
    if PersistStreamInit.InitNew = S_OK then
    begin
      // Get IStream interface on stream
      StreamAdapter := TStreamAdapter.Create(Stream);
      // Load data from Stream into WebBrowser
      PersistStreamInit.Load(StreamAdapter);
    end;
  end;
end;

procedure TWebBrowserHelper.InternalSaveBodyHTMLToStream(const Stream: TStream);
var
  HTMLStr: string;
begin
  if Assigned(BodyElement) then
  begin
    HTMLStr := BodyElement.innerHTML;
    Stream.WriteBuffer(HTMLStr[1], Length(HTMLStr));
  end;
end;

procedure TWebBrowserHelper.InternalSaveBodyTextToStream(const Stream: TStream);
var
  TextStr: string;
begin
  if Assigned(BodyElement) then
  begin
    TextStr := BodyElement.innerText;
    Stream.WriteBuffer(TextStr[1], Length(TextStr));
  end;
end;

procedure TWebBrowserHelper.InternalSaveDocumentToStream(const Stream: TStream);
var
  StreamAdapter: IStream;
begin
  if Assigned(PersistStreamInit) then
  begin
    StreamAdapter := TStreamAdapter.Create(Stream);
    PersistStreamInit.Save(StreamAdapter, True);
  end;
end;

procedure TWebBrowserHelper.LoadAboutBlank;
begin
  NavigateToURL(SLocalAboutBlankUrl);
end;

procedure TWebBrowserHelper.LoadFromFile(const FileName: string);
var
  FileStream: TFileStream;
begin
  FileStream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyNone);
  if ExtractFileExt(FileName) = '.xml' then
    LoadFromXmlStreamAndFreeStream(FileStream)
  else
    LoadFromStreamAndFreeStream(FileStream);
end;

procedure TWebBrowserHelper.LoadFromStream(const Stream: TStream);
begin
  LoadAboutBlank();
  // now load the document into the blank page:
  InternalLoadDocumentFromStream(Stream);
end;

procedure TWebBrowserHelper.LoadFromStreamAndFreeStream(const Stream: TStream);
begin
  try
    LoadFromStream(Stream);
  finally
    Stream.Free;
  end;
end;

procedure TWebBrowserHelper.LoadFromString(const HTML: string);
var
  StringStream: TStringStream;
begin
  StringStream := TStringStream.Create(HTML);
  LoadFromStreamAndFreeStream(StringStream);
end;

procedure TWebBrowserHelper.LoadFromXmlStreamAndFreeStream
  (FileStream: TFileStream);
var
  StreamReader: TStreamReader;
begin
  try
    StreamReader := TStreamReader.Create(FileStream);
    try
      LoadFromXmlString(StreamReader.ReadToEnd);
    finally
      StreamReader.Free;
    end;
  finally
    FileStream.Free;
  end;
end;

procedure TWebBrowserHelper.LoadFromXmlString(const XML: string);
// based on http://support.codegear.com/article/35883
var
  XMLDoc: IXMLDOMDocument;
  XSLDoc: IXMLDOMDocument;
  HTML: string;
begin
  XSLDoc := CoDOMDocument.Create();
  if XSLDoc.Load(SResMsxmlDllDefaultssXsl) then
  begin
    XMLDoc := CoDOMDocument.Create();
    if XMLDoc.loadXML(XML) then
    begin
      HTML := XMLDoc.transformNode(XSLDoc);
      LoadFromString(HTML);
    end
    else
      LoadAboutBlank();
  end;
end;

function TWebBrowserHelper.NavigateToLocalFile(const FileName: string): Boolean;
begin
  Result := FileExists(FileName);
  if Result then
    NavigateToURL(SLocalFileUrlPrefix + FileName)
end;

procedure TWebBrowserHelper.NavigateToResource(const ModuleName: string;
  const ResName: PChar; const ResType: PChar = nil);
var
  URL: string;
begin
  URL := MakeResourceURL(ModuleName, ResName, ResType);
  NavigateToURL(URL);
end;

procedure TWebBrowserHelper.NavigateToResource(const Module: HMODULE;
  const ResName: PChar; const ResType: PChar = nil);
var
  URL: string;
begin
  URL := MakeResourceURL(Module, ResName, ResType);
  NavigateToURL(URL);
end;

procedure TWebBrowserHelper.NavigateToURL(const URL: string);
var
  Flags: OleVariant; // flags that determine action
  StatesToWaitFor: set of Byte;
begin
  // Don't record in history
  Flags := navNoHistory;
  if AnsiStartsAnyText([SLocalResourceUrlPrefix, SLocalFileUrlPrefix,
    SLocalAboutUrlPrefix, SLocalJavascriptUrlPrefix, SLocalMailtoUrlPrefix],
    URL) then
    // don't use cache for local files
    Flags := Flags or navNoReadFromCache or navNoWriteToCache;
  // Do the navigation and wait for it to complete
  Self.Navigate(WideString(URL), Flags);
  StatesToWaitFor := [READYSTATE_COMPLETE];
  if URL = SLocalAboutBlankUrl then // this usually results in a READYSTATE_INTERACTIVE instead of READYSTATE_COMPLETE
    Include(StatesToWaitFor, READYSTATE_INTERACTIVE);
  while not(Self.ReadyState in StatesToWaitFor) do
  begin
    Forms.Application.ProcessMessages();
    Sleep(0);
  end;
end;

procedure TWebBrowserHelper.SaveToFile(const FileName: string;
  const Style: TWebBrowserSaveStyle = wbsAll);
var
  FileStream: TFileStream;
begin
  FileStream := TFileStream.Create(FileName, fmCreate);
  try
    SaveToStream(FileStream, Style);
  finally
    FileStream.Free;
  end;
end;

procedure TWebBrowserHelper.SaveToStream(const Stream: TStream;
  const Style: TWebBrowserSaveStyle = wbsAll);
begin
  if Assigned(Self.Document) then
  begin
    case Style of
      wbsAll:
        InternalSaveDocumentToStream(Stream);
      wbsBodyHTML:
        InternalSaveBodyHTMLToStream(Stream);
      wbsBodyText:
        InternalSaveBodyTextToStream(Stream);
    end;
  end;
end;

function TWebBrowserHelper.SaveToString
  (const Style: TWebBrowserSaveStyle = wbsAll): string;
var
  StringStream: TStringStream;
begin
  // For BodyHTML and BodyText this has unnecessary
  // string->stream->string conversion that we live with
  // for the sake of clarity of coding
  StringStream := TStringStream.Create('');
  try
    SaveToStream(StringStream, Style);
    Result := StringStream.DataString;
  finally
    StringStream.Free;
  end;
end;

function TWebBrowserHelper.WebBrowserDocumentQueryInterface
  (const IID: TGUID; out Obj): HResult;
var
  WebBrowserDocument: IDispatch;
begin
  WebBrowserDocument := Self.Document;
  Assert(Assigned(WebBrowserDocument),
    'nil Document; did you load about:blank ?');
  Result := WebBrowserDocument.QueryInterface(IID, Obj);
end;

end.
