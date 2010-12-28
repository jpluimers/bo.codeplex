unit ClassicMessageSubscriberUnit;

interface

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

implementation

end.
