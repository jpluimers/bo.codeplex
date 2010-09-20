unit ComponentHelperUnit;

interface

uses
  Classes;

type
  TComponentEnumerator = class(TObject)
  strict private
    FMinValue: Integer;
    FMaxValue: Integer;
    FValue: Integer;
    FComponent: TComponent;
  public
    constructor Create(const Component: TComponent);
    destructor Destroy; override;
    function GetCurrent: TComponent; virtual;
    function MoveNext: Boolean; virtual;
    property Current: TComponent read GetCurrent;
  end;

  TComponentOfTypeEnumerator = class(TComponentEnumerator)
  strict private
    FComponentClass: TComponentClass;
  public
    constructor Create(const Component: TComponent; const ComponentClass: TComponentClass);
    function MoveNext: Boolean; override;
  end;

  TComponentOfTypeEnumeratorFactory = record
  strict private
    FComponent: TComponent;
    FComponentClass: TComponentClass;
  public
    constructor Create(const Component: TComponent; const ComponentClass: TComponentClass);
    function GetEnumerator: TComponentOfTypeEnumerator;
  end;

  TComponentHelper = class helper for TComponent
  public
    function ComponentsOfType(const ComponentClass: TComponentClass): TComponentOfTypeEnumeratorFactory;
//    function GetEnumerator: TComponentEnumerator; // not needed as it is already in TComponent.GetEnumerator
  end;

implementation

procedure AssertAssignedComponent(const Component: TComponent);
begin
  Assert(Assigned(Component), 'cannot enumerate nil FComponent');
end;

{ TComponentHelper }

function TComponentHelper.ComponentsOfType(const ComponentClass: TComponentClass): TComponentOfTypeEnumeratorFactory;
begin
  Result := TComponentOfTypeEnumeratorFactory.Create(Self, ComponentClass);
end;

// not needed as it is already in TComponent.GetEnumerator:
//function TComponentHelper.GetEnumerator: TComponentEnumerator;
//begin
//  Result := TComponentEnumerator.Create(Self);
//end;

{ TComponentEnumerator }

constructor TComponentEnumerator.Create(const Component: TComponent);
begin
  Assert(Assigned(Component), 'cannot enumerate nil FComponent');

  inherited Create();

  Self.FComponent := Component;
  FMinValue := 0;
  FMaxValue := Component.ComponentCount - 1;
  FValue := FMinValue - 1;
end;

destructor TComponentEnumerator.Destroy;
begin

  inherited Destroy();
end;

function TComponentEnumerator.GetCurrent: TComponent;
begin
  Result := FComponent.Components[FValue];
end;

function TComponentEnumerator.MoveNext: Boolean;
begin
  Assert(FMaxValue = FComponent.ComponentCount - 1, 'ComponentCount changed during enumeration');
  Result := FValue < FMaxValue;
  if Result then
    Inc(FValue);
end;

{ TComponentOfTypeEnumerator }

constructor TComponentOfTypeEnumerator.Create(const Component: TComponent; const ComponentClass: TComponentClass);
begin
  AssertAssignedComponent(Component);

  inherited Create(Component);

  FComponentClass := ComponentClass;
end;

function TComponentOfTypeEnumerator.MoveNext: Boolean;
begin
  if not Assigned(FComponentClass) then
    Result := True
  else
  begin
    while inherited MoveNext do
    begin
      if Current is FComponentClass then
      begin
        Result := True;
        Exit;
      end;
    end;
    Result := False;
  end;
end;

{ TComponentOfTypeEnumeratorFactory }

constructor TComponentOfTypeEnumeratorFactory.Create(const Component: TComponent; const ComponentClass: TComponentClass);
begin
  AssertAssignedComponent(Component);

  FComponent := Component;
  FComponentClass := ComponentClass;
end;

function TComponentOfTypeEnumeratorFactory.GetEnumerator: TComponentOfTypeEnumerator;
begin
  Result := TComponentOfTypeEnumerator.Create(FComponent, FComponentClass);
end;

end.

