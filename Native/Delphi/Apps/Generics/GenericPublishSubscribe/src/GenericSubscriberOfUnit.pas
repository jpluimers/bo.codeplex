unit GenericSubscriberOfUnit;

interface

uses
  ClassicMessageSubscriberUnit;

type
  ISupporterOf<T: IMessage> = interface(ISubscriber)
    ['{0905B3EB-B17E-4AD2-98E2-16F05D19484C}']
    function Supports(const Message: T): Boolean;
  end;

  ISubscriberOf<T: IMessage> = interface(ISupporterOf<T>)
    ['{6FD82B1D-61C6-4572-BA7D-D70DA9A73285}']
    procedure Consume(const Message: T);
  end;

type
  TSupporterOf<T: IMessage> = class(TInterfacedObject, ISubscriber, ISupporterOf<T>)
    function Supports(const Message: T): Boolean;
  end;

implementation

uses
  SysUtils,
  RttiUnit;

function TSupporterOf<T>.Supports(const Message: T): Boolean;
var
  IID: TGUID;
begin
  if TRtti.GetInterfaceIID<T>(IID) then
    Result := SysUtils.Supports(Message, IID)
  else
    Result := False;
end;

end.
