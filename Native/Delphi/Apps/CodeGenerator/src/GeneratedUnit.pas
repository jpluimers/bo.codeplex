unit GeneratedUnit;

interface

uses
  Classes,
  SysUtils;

type
  TActualPerson = class;

// TDateTimeFormat
  TDateTimeFormat = (dtfDateOnly,dtfTimeOnly,dtfDateTime);

  TBasePerson = class(TComponent)
  strict private
    FFirstName: string;
    FInitials: string;
    FLastName: string;
    FAge: Integer;
  strict protected
    function GetFirstName(): string; overload; virtual;
    function GetInitials(): string; overload; virtual;
    function GetLastName(): string; overload; virtual;
    function GetAge(): Integer; overload; virtual;
    procedure SetFirstName(Value: string); overload; virtual;
    procedure SetInitials(Value: string); overload; virtual;
    procedure SetLastName(Value: string); overload; virtual;
    procedure SetAge(Value: Integer); overload; virtual;
  public
    const
      MyPi: Double = 3.14;
      MyE = 2.72;
    procedure DoChanged(); virtual;
    property FirstName: string read GetFirstName write SetFirstName;
    property Initials: string read GetInitials write SetInitials;
    property LastName: string read GetLastName write SetLastName;
    property Age: Integer read GetAge write SetAge;
  end;

  TActualPerson = class(TBasePerson)
  public
    procedure DoChanged(); override;
  published
    property FirstName;
    property Initials;
    property LastName;
    property Age;
  end;

// TNullableDateTime
  TNullableDateTime = record
  end;

implementation

{ TBasePerson }

procedure TBasePerson.DoChanged();
begin
end;

function TBasePerson.GetFirstName(): string;
begin
  Result := FFirstName;
end;

function TBasePerson.GetInitials(): string;
begin
  Result := FInitials;
end;

function TBasePerson.GetLastName(): string;
begin
  Result := FLastName;
end;

function TBasePerson.GetAge(): Integer;
begin
  Result := FAge;
end;

procedure TBasePerson.SetFirstName(Value: string);
begin
  FFirstName := Value;
  DoChanged();
end;

procedure TBasePerson.SetInitials(Value: string);
begin
  FInitials := Value;
  DoChanged();
end;

procedure TBasePerson.SetLastName(Value: string);
begin
  FLastName := Value;
  DoChanged();
end;

procedure TBasePerson.SetAge(Value: Integer);
begin
  FAge := Value;
  DoChanged();
end;

{ TActualPerson }

procedure TActualPerson.DoChanged();
var
  Foo: string;
begin
  Beep();
end;

end.

