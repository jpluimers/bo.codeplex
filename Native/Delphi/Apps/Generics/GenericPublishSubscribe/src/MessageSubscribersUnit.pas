unit MessageSubscribersUnit;

interface

uses
  MessagesUnit,
  MessageServiceUnit,
  GenericSubscriberOfUnit,
  ClassicMessageSubscriberUnit;

type
  TMySubscriber = class(TSupporterOf<IMyMessage>, ISubscriber, ISubscriberOf<IMyMessage>)
    procedure Consume(const Message: IMyMessage);
  end;

  TMyOtherSubscriber = class(TSupporterOf<IMyOtherMessage>, ISubscriber, ISubscriberOf<IMyOtherMessage>)
    procedure Consume(const Message: IMyOtherMessage);
  end;

implementation

uses
  SysUtils;

procedure TMySubscriber.Consume(const Message: IMyMessage);
begin
  //
end;

procedure TMyOtherSubscriber.Consume(const Message: IMyOtherMessage);
begin
  //
end;

end.
