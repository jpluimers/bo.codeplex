unit MessageServiceUnit;

interface

uses
  Generics.Collections;

type
  IImplementedWithClass = interface(IInterface)
    function ToString: string;
  end;

  IMessage = interface(IImplementedWithClass)
    ['{B1794F44-F6EE-4E7B-849A-995F05897E1C}']
  end;

  ISubscriber = interface(IImplementedWithClass)
    ['{D655967E-90C6-4613-92C5-1E5B53619EE0}']
  end;

  ISubscriberOf<T: IMessage> = interface(ISubscriber)
    ['{6FD82B1D-61C6-4572-BA7D-D70DA9A73285}']
    procedure Consume(const Message: T);
    function Supports(const Message: T): Boolean;
  end;
  ISubscriberOfIMessage = ISubscriberOf<IMessage>;
  TListISubscriber = TList<ISubscriber>;

  TMessageService = class
  private
    FSubscribers: TListISubscriber;
  strict protected
    procedure Consume(const SubscriberOf: ISubscriberOfIMessage; const Message: IMessage); virtual;
  public
    constructor Create;
    destructor Destroy; override;
    procedure SendMessage(const Message: IMessage);
    procedure Subscribe(const Subscriber: ISubscriber);
    procedure Unsubscribe(const Subscriber: ISubscriber);
  end;

implementation

uses
  SysUtils;

constructor TMessageService.Create;
begin
  inherited Create();
  FSubscribers := TListISubscriber.Create();
end;

destructor TMessageService.Destroy;
begin
  FreeAndNil(FSubscribers);
  inherited Destroy();
end;

procedure TMessageService.SendMessage(const Message: IMessage);
var
  LocalMessage: IMessage;
  lSubscriber: ISubscriber;
  lSubscriberOf: ISubscriberOf<IMessage>;
begin
  for lSubscriber in FSubscribers do
  begin
    LocalMessage := Message; // to prevent premature freeing of Message
    if Supports(lSubscriber, ISubscriberOf<IMessage>, lSubscriberOf) then
      if lSubscriberOf.Supports(LocalMessage) then
        Consume(lSubscriberOf, LocalMessage);
  end;
end;

procedure TMessageService.Subscribe(const Subscriber: ISubscriber);
begin
  FSubscribers.Add(Subscriber);
end;

procedure TMessageService.Unsubscribe(const Subscriber: ISubscriber);
begin
  FSubscribers.Remove(Subscriber);
end;

procedure TMessageService.Consume(const SubscriberOf: ISubscriberOfIMessage; const Message: IMessage);
begin
  SubscriberOf.Consume(Message);
end;

end.
