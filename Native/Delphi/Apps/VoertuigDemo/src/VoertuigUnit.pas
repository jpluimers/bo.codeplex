unit VoertuigUnit;

interface

type
  TVoertuig = class(TObject)
  strict private
    FWielen: Integer;
  public
    function Rij: string; virtual;
    property Wielen: Integer read FWielen;
  end;

  TFiets = class(TVoertuig)
  end;

  TBromFiets = class(TFiets)
  end;

  TAuto = class(TVoertuig)
  public
    function Rij: string; override;
  end;

  TPersonenauto = class(TAuto)
  end;

  TVrachtauto = class(TAuto)
  end;

implementation

uses
  SysUtils;

function TVoertuig.Rij: string;
begin
  Result := Format('Een %s rijdt op %d wielen', [ClassName, Wielen]);
end;

function TAuto.Rij: string;
begin
  Result := inherited Rij + ' met een motor';
end;

end.
