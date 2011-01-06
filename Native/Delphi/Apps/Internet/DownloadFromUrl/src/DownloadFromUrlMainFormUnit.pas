unit DownloadFromUrlMainFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, WinInetUnit;

type
  TDownloadFromUrlMainForm = class(TForm)
    Panel1: TPanel;
    UrlComboBox: TComboBox;
    UserAgentLabel: TLabel;
    UserAgentComboBox: TComboBox;
    LoadAnsiStringButton: TButton;
    ResponsePageControl: TPageControl;
    ResponseContentTabSheet: TTabSheet;
    ResponseHeadersTabSheet: TTabSheet;
    ResponseContentMemo: TMemo;
    LoadUtf8StringButton: TButton;
    ResponseHeadersMemo: TMemo;
    DownloadBinaryFileButton: TButton;
    SaveDialog: TSaveDialog;
    procedure DownloadBinaryFileButtonClick(Sender: TObject);
    procedure LoadAnsiStringButtonClick(Sender: TObject);
    procedure LoadUtf8StringButtonClick(Sender: TObject);
  end;

var
  DownloadFromUrlMainForm: TDownloadFromUrlMainForm;

implementation

{$R *.dfm}

procedure TDownloadFromUrlMainForm.DownloadBinaryFileButtonClick(Sender: TObject);
var
  ResponseHeaders: string;
begin
  if SaveDialog.Execute() then
  begin
    TWinInet.HttpDownloadBinaryFileWithResponseHeaders(UserAgentComboBox.Text, UrlComboBox.Text, SaveDialog.FileName, ResponseHeaders);
    ResponseHeadersMemo.Text := ResponseHeaders;
    ResponsePageControl.ActivePage := ResponseHeadersTabSheet;
  end;
end;

procedure TDownloadFromUrlMainForm.LoadAnsiStringButtonClick(Sender: TObject);
var
  ResponseHeaders: string;
begin
  ResponseContentMemo.Text := TWinInet.DownloadAnsiStringWithResponseHeaders(UserAgentComboBox.Text, UrlComboBox.Text, ResponseHeaders);
  ResponseHeadersMemo.Text := ResponseHeaders;
end;

procedure TDownloadFromUrlMainForm.LoadUtf8StringButtonClick(Sender: TObject);
var
  ResponseHeaders: string;
begin
  ResponseContentMemo.Text := TWinInet.DownloadUtf8StringWithResponseHeaders(UserAgentComboBox.Text, UrlComboBox.Text, ResponseHeaders);
  ResponseHeadersMemo.Text := ResponseHeaders;
end;

{
GET http://nu.nl/ HTTP/1.1
Host: nu.nl
Connection: keep-alive
Accept: application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/534.10 (KHTML, like Gecko) Chrome/8.0.552.224 Safari/534.10
Accept-Encoding: gzip,deflate,sdch
Accept-Language: en-US,en;q=0.8,nl;q=0.6
Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.3
Cookie: __utmz=214774792.1294099132.423.3.utmcsr=google.com|utmccn=(referral)|utmcmd=referral|utmcct=/reader/view/; __utma=214774792.649593432.1274100216.1294079501.1294099132.423; __utmc=214774792

GET http://nu.nl/ HTTP/1.1
Accept: application/x-ms-application, image/jpeg, application/xaml+xml, image/gif, image/pjpeg, application/x-ms-xbap, application/vnd.ms-excel, application/vnd.ms-powerpoint, application/msword, */*
Accept-Language: en-US
User-Agent: Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; InfoPath.2; .NET4.0C; .NET4.0E; MS-RTC LM 8)
Accept-Encoding: gzip, deflate
Connection: Keep-Alive
Host: nu.nl

http://www.cl.cam.ac.uk/~mgk25/ucs/examples/UTF-8-demo.txt
http://www.robotstxt.org/robots.txt
}
end.
