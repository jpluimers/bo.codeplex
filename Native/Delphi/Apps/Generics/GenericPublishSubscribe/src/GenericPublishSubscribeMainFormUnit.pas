unit GenericPublishSubscribeMainFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, LoggerInterfaceUnit, MessageServiceUnit,
  MessageSubscribersUnit, ClassicMessageSubscriberUnit;

type
  TGenericPublishSubscribeMainForm = class(TForm)
    TestPublisherButton: TButton;
    LogMemo: TMemo;
    procedure TestPublisherButtonClick(Sender: TObject);
  strict private
    FLogger: ILogger;
  strict protected
    function GetLogger: ILogger;
    property Logger: ILogger read GetLogger;
  public
    destructor Destroy; override;
  end;

type
  TLoggingMessageService = class(TMessageService)
  strict private
    FLogger: ILogger;
  strict protected
    procedure Consume(const SubscriberOf: ISubscriberOfIMessage; const Message: IMessage); override;
  public
    constructor Create(const Logger: ILogger);
    property Logger: ILogger read FLogger;
  end;

var
  GenericPublishSubscribeMainForm: TGenericPublishSubscribeMainForm;

implementation

uses
  LoggerUnit,
  OutputDebugViewLoggerUnit,
  LoggersUnit,
  MessagesUnit;

{$R *.dfm}

destructor TGenericPublishSubscribeMainForm.Destroy;
begin
  inherited Destroy;
  FLogger := nil;
end;

function TGenericPublishSubscribeMainForm.GetLogger: ILogger;
begin
  if not Assigned(FLogger) then
    FLogger :=  TTeeLogger.Create([
      TOutputDebugViewLogger.Create(),
      TStringsLogger.Create(LogMemo.Lines)
    ]);
  Result := FLogger;
end;

procedure TGenericPublishSubscribeMainForm.TestPublisherButtonClick(Sender: TObject);
var
  LoggingMessageService: TLoggingMessageService;
begin
  LoggingMessageService := TLoggingMessageService.Create(Logger);
  try
    LoggingMessageService.Subscribe(TMySubscriber.Create() as ISubscriber);
    LoggingMessageService.Subscribe(TMyOtherSubscriber.Create() as ISubscriber);
    LoggingMessageService.SendMessage(TMyMessage.Create());
    LoggingMessageService.SendMessage(TMyOtherMessage.Create());
  finally
    LoggingMessageService.Free;
  end;
end;

constructor TLoggingMessageService.Create(const Logger: ILogger);
begin
  inherited Create();
  FLogger := Logger;
end;

procedure TLoggingMessageService.Consume(const SubscriberOf: ISubscriberOfIMessage; const Message: IMessage);
var
  MessageImplementedWithClass: IImplementedWithClass;
  MessageString: string;
  SubscribeImplementedWithClass: IImplementedWithClass;
  SubscriberOfString: string;
begin
  SubscribeImplementedWithClass := SubscriberOf;
  MessageImplementedWithClass := Message;
  SubscriberOfString := SubscribeImplementedWithClass.ToString;
  MessageString := MessageImplementedWithClass.ToString; // wrong VMT here, Delphi XE SP2
  Logger.Log('Consume(SubscriberOf: %s, Message:%s);',
    [SubscriberOfString, MessageString]);
//    [SubscriberOf.ClassType.ClassName, Message.ClassType.ClassName]);
  inherited Consume(SubscriberOf, Message);
end;

end.
