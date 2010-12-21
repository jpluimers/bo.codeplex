unit MessagesUnit;

interface

uses
  MessageServiceUnit;

type
  IMyMessage = interface(IMessage)
    ['{84B42EC8-CAC0-44B4-97A8-05AE5B636236}']
  end;
  TMyMessage = class(TInterfacedObject, IMessage, IMyMessage)
  public
    destructor Destroy; override;
  end;

  IMyOtherMessage = interface(IMessage)
    ['{AB323765-FF7B-4852-91AA-B7ECC1845B41}']
  end;
  TMyOtherMessage = class(TInterfacedObject, IMessage, IMyOtherMessage)
  public
    destructor Destroy; override;
  end;

implementation

destructor TMyOtherMessage.Destroy;
begin
  inherited;
end;

destructor TMyMessage.Destroy;
begin
  inherited;
end;

end.
