unit MyPointUnit;

interface

type
  TMyPoint = class
    FX: Integer;
    FY: Integer;
  private
    procedure SetX(const Value: Integer); virtual;
    procedure SetY(const Value: Integer); virtual;
    function GetX: Integer; virtual;
    function GetY: Integer; virtual;
  public
    constructor Create(AX, AY: Integer);
    property X: Integer read GetX write SetX;
    property Y: Integer read GetY write SetY;
  end;

  TMyPoints = array of TMyPoint;

implementation

{ TMyPoint }

constructor TMyPoint.Create(AX, AY: Integer);
begin
  FX := AX;
  FY := AY;
end;

function TMyPoint.GetX: Integer;
begin
  Result := FX;
end;

function TMyPoint.GetY: Integer;
begin
  Result := FY;
end;

procedure TMyPoint.SetX(const Value: Integer);
begin
  FX := Value;
end;

procedure TMyPoint.SetY(const Value: Integer);
begin
  FY := Value;
end;

end.
