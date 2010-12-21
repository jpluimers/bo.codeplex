unit MessageSubscribersUnit;

interface

uses
  MessagesUnit,
  MessageServiceUnit;

type
  TMySubscriber = class(TInterfacedObject, ISubscriber, ISubscriberOf<IMyMessage>)
    procedure Consume(const Message: IMyMessage);
    function Supports(const Message: IMyMessage): Boolean;
  end;

  TMyOtherSubscriber = class(TInterfacedObject, ISubscriber, ISubscriberOf<IMyOtherMessage>)
    procedure Consume(const Message: IMyOtherMessage);
    function Supports(const Message: IMyOtherMessage): Boolean;
  end;

implementation

uses
  SysUtils;

procedure TMySubscriber.Consume(const Message: IMyMessage);
begin
  //
end;

function TMySubscriber.Supports(const Message: IMyMessage): Boolean;
begin
  Result := SysUtils.Supports(Message,  IMyMessage);
end;

procedure TMyOtherSubscriber.Consume(const Message: IMyOtherMessage);
begin
  //
end;

function TMyOtherSubscriber.Supports(const Message: IMyOtherMessage): Boolean;
begin
  Result := SysUtils.Supports(Message,  IMyOtherMessage);
end;

end.
