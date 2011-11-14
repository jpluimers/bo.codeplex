unit ActivatableUnit;

interface

uses
  LoggerInterfaceUnit,
  Classes;

type
  { Business logic:
    - will perform Close at Destroy time
    - will send ActiveNotification when Active property is changed
    - can pass on Log info to global log object
  }
  TActivatable = class(TComponent)
  { "Activation" logic }
  strict private
    FActive: Boolean;
    FLogger: ILeveledLogger;
    FOnActiveChanged: TNotifyEvent;
    FOnActiveChanging: TNotifyEvent;
  strict protected
    function GetLogger: ILeveledLogger; virtual;
    procedure SetLogger(const Value: ILeveledLogger); virtual;
  public
    property Logger: ILeveledLogger read GetLogger write SetLogger;
  protected
    procedure ActiveChanged; virtual;
    procedure ActiveChanging; virtual;
    function GetActive: Boolean; virtual;
    procedure SetActive(Value: Boolean); virtual;
    procedure InternalAfterOpen; virtual;
    procedure InternalAfterClose; virtual;
    procedure InternalBeforeOpen; virtual;
    procedure InternalBeforeClose; virtual;
  public
    procedure Open;
    procedure Close;
    property Active: Boolean read FActive write SetActive;
    property OnActiveChanged: TNotifyEvent read FOnActiveChanged write FOnActiveChanged;
    property OnActiveChanging: TNotifyEvent read FOnActiveChanging write FOnActiveChanging;
  { "AciveNotification" logic }
  private
    FActiveNotifies: TList;
  protected
    procedure ActiveNotification(AComponent: TActivatable; NewActive: Boolean); virtual;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ActiveNotify(AComponent: TActivatable);
  end;


implementation

uses
  LoggerUnit,
  ClassTypeInfoUnit,
  SysUtils;

{== TActivatable ==}

{ "Activation" logic }

procedure TActivatable.ActiveChanged;
begin
  if Assigned(OnActiveChanged) then
    OnActiveChanged(Self);
end;

procedure TActivatable.ActiveChanging;
begin
  if Assigned(OnActiveChanging) then
    OnActiveChanging(Self);
end;

function TActivatable.GetActive: Boolean;
begin
  Result := FActive;
end;

procedure TActivatable.SetActive(Value: Boolean);
var
  I: Integer;
  RaisedExceptionObject: TObject;
begin
  if FActive <> Value then
  begin
    Logger.Enter(Self, 'SetActive(%d)', [Ord(Value)]);
    try
      ActiveChanging();
      // Notify others that we will will change Active property
      if Assigned(FActiveNotifies) then
      begin
          Logger.Log('ActiveNotifies');
        for I := 0 to FActiveNotifies.Count - 1 do
        begin
          Logger.Log('ActiveNotification(%d, %s)', [I, InstanceInfo(FActiveNotifies[I])]);
          TActivatable(FActiveNotifies[I]).ActiveNotification(Self, Value);
        end;
      end;
      Logger.Log('Reflection before');
      // Reflect the change
      if Value then
        InternalBeforeOpen()
      else
        InternalBeforeClose();
      Logger.Log('Permanent');
      // Make the change persistent
      FActive := Value;
      Logger.Log('Reflection after');
      try
        // Reflect the change
        if Value then
          InternalAfterOpen()
        else
          InternalAfterClose();
      except
        FActive := not Value;
        Logger.Log('After failed');
        RaisedExceptionObject := ExceptObject;
        if Assigned(RaisedExceptionObject) then
        begin
          Logger.Log('ExceptObject=');
          if RaisedExceptionObject is Exception then
            Logger.Log(Exception(RaisedExceptionObject))
          else
            Logger.Log(RaisedExceptionObject.ToString());
        end;
        raise;
      end;
      Logger.Log('Permanent');
      ActiveChanged();
    finally
      Logger.Leave(Self, 'SetActive(%d)', [Ord(Value)]);
    end;
  end;
end;

procedure TActivatable.InternalAfterOpen;
begin
end;

procedure TActivatable.InternalAfterClose;
begin
end;

procedure TActivatable.InternalBeforeOpen;
begin
end;

procedure TActivatable.InternalBeforeClose;
begin
end;

procedure TActivatable.Open;
begin
  Active := True;
end;

procedure TActivatable.Close;
begin
  Active := False;
end;

constructor TActivatable.Create(AOwner: TComponent);
begin
  Logger.Enter(Self, 'Create');
  try
    inherited Create(AOwner);
    FActiveNotifies := nil;
    FActive := False;
    FOnActiveChanged := nil;
    FOnActiveChanging := nil;
  finally
    Logger.Leave(Self, 'Create');
  end;
end;

destructor TActivatable.Destroy;
var
  I: Integer;
begin
  Logger.Enter(Self, 'Destroy');
  try
    // We are being destroyed, so these potentially are gone too:
    FOnActiveChanged := nil;
    FOnActiveChanging := nil;
    Close();
    { Notify the ActiveNotifies that we are about to be freed.
      This is because FreeNotification does not work reliably for non-TControl
      descendants }
    if Assigned(FActiveNotifies) then
    begin
      Logger.Log('FreeNotifies');
      for I := 0 to FActiveNotifies.Count - 1 do
      begin
        Logger.Log('FreeNotification(%d, %s)', [I, InstanceInfo(FActiveNotifies[I])]);
        TActivatable(FActiveNotifies[I]).Notification(Self, opRemove);
      end;
    end;
    inherited Destroy();
  finally
    Logger.Leave(Self, 'Destroy');
  end;
end;

procedure TActivatable.ActiveNotify(AComponent: TActivatable);
begin
  Logger.Enter(Self, 'ActiveNotify(%s)', [InstanceInfo(AComponent)]);
  try
    if not Assigned(FActiveNotifies) then
      FActiveNotifies := TList.Create;
    if FActiveNotifies.IndexOf(AComponent) < 0 then // not yet in the list
    begin
      FActiveNotifies.Add(AComponent);
      AComponent.FreeNotification(Self); // Make sure AComponent gets a Notification when we get destroyed
      FreeNotification(AComponent); // Make sure we get a Notification when AComponent is destroyed
  (*  FreeNotification soems not to work reliably for non-TControl descendants,
            so get a back-link ourselves *)
      if AComponent is TActivatable then
        TActivatable(AComponent).ActiveNotify(Self);
    end;
  finally
    Logger.Leave(Self, 'ActiveNotify(%s)', [InstanceInfo(AComponent)]);
  end;
end;

procedure TActivatable.ActiveNotification(AComponent: TActivatable; NewActive: Boolean);
var
  I: Integer;
begin
  Logger.Enter(Self, 'ActiveNotification(%s, %d)', [InstanceInfo(AComponent), Ord(NewActive)]);
  try
    // Pass it on to our children
    for I := 0 to ComponentCount - 1 do
      if Components[I] is TActivatable then
        TActivatable(Components[I]).ActiveNotification(AComponent, NewActive);
  finally
    Logger.Leave(Self, 'ActiveNotification(%s, %d)', [InstanceInfo(AComponent), Ord(NewActive)]);
  end;
end;

function TActivatable.GetLogger: ILeveledLogger;
begin
  Result := TLeveledLogger.CreateIfNeeded(FLogger);
end;

procedure TActivatable.SetLogger(const Value: ILeveledLogger);
begin
  FLogger := Value;
end;

procedure TActivatable.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  Logger.Enter(Self, 'Notification(%s)', [InstanceInfo(AComponent)]);
  try
    inherited Notification(AComponent, Operation);
    if (FActiveNotifies <> nil) and (Operation = opRemove) then
    begin
      // If we have a reference to AComponent, get rid of it
      FActiveNotifies.Remove(AComponent);
      if FActiveNotifies.Count = 0 then
      begin
        FActiveNotifies.Free();
        FActiveNotifies := nil;
      end;
    end;
  finally
    Logger.Leave(Self, 'Notification(%s)', [InstanceInfo(AComponent)]);
  end;
end;

end.
