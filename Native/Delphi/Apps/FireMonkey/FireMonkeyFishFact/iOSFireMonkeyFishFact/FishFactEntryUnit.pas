unit FishFactEntryUnit;

interface

const
  SFLengthInch = 'FLengthInch';
  SFLengthCm = 'FLengthCm';
  SFSpeciesNo = 'FSpeciesNo';
  SFNotes = 'FNotes';
  SFSpeciesName = 'FSpeciesName';
  SFCommonName = 'FCommonName';
  SFCategory = 'FCategory';
  FishFactEntryFieldCount = 7;

type
  TFishFactEntry = class(TObject)
  strict private
    FCategory: string;
    FCommonName: string;
    FSpeciesName: string;
    FNotes: string;
    FSpeciesNo: Double;
    FLengthCm: Double;
    FLengthInch: Double;
  public
    property Category: string read FCategory write FCategory;
    property CommonName: string read FCommonName write FCommonName;
    property SpeciesName: string read FSpeciesName write FSpeciesName;
    property Notes: string read FNotes write FNotes;
    property SpeciesNo: Double read FSpeciesNo write FSpeciesNo;
    property LengthCm: Double read FLengthCm write FLengthCm;
    property LengthInch: Double read FLengthInch write FLengthInch;
    function ToString: string; override;
//Graphic
  end;

  TFishFactEntries = array of TFishFactEntry;

implementation

uses
  SysUtils;

{ TFishFactEntry }

function TFishFactEntry.ToString: string;
begin
  Result := Format('Species %g: %s', [SpeciesNo, Category]);
end;

end.
