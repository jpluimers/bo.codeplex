unit iOSFireMonkeyFishFactFormUnit;

interface

uses
  SysUtils, Types, UITypes, Classes, Variants, FMX_Types, FMX_Controls, FMX_Forms,
  FMX_Dialogs, FMX_Layouts, FMX_Memo, FishFactEntryUnit, FMX_Grid;

const
  SFishFactJSONDataSuperObjectTxt = 'FishFact-JSON-data-SuperObject.txt';

type
  TiOSFireMonkeyFishFactForm = class(TForm)
    LoadJSONButton: TButton;
    JsonFileNameMemo: TMemo;
    JsonTextMemo: TMemo;
    StringGrid1: TStringGrid;
    StringColumn1: TStringColumn;
    StringColumn2: TStringColumn;
    procedure LoadJSONButtonClick(Sender: TObject);
  strict protected
    procedure LoadJSONFile(const JSONFileName: string); virtual;
    procedure ShowFishFactEntries(const FishFactEntries: TFishFactEntries); virtual;
  end;

var
  iOSFireMonkeyFishFactForm: TiOSFireMonkeyFishFactForm;

implementation

uses
{$ifndef FPC}
  IOUtils,
{$endif FPC}
  superobject;

procedure TiOSFireMonkeyFishFactForm.LoadJSONButtonClick(Sender: TObject);
var
  JSONFileName: string;
begin
{$ifdef FPC}
  JsonFileName := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + SFishFactJSONDataSuperObjectTxt;
{$else}
  JSONFileName := // ..\..\xcode relative to directory of EXE file
    TPath.Combine(
      TPath.Combine(
        TPath.GetDirectoryName(
          TPath.GetDirectoryName(
            TPath.GetDirectoryName(
              ParamStr(0)
            )
          )
        ),
        'xcode'
      ),
      SFishFactJSONDataSuperObjectTxt
    );
{$endif FPC}
  JsonFileNameMemo.Text := JSONFileName;
  JsonFileNameMemo.WordWrap := True;

  if FileExists(JSONFileName) then
    LoadJSONFile(JSONFileName)
  else
    JsonTextMemo.Text := 'JSON File not found';
end;

procedure TiOSFireMonkeyFishFactForm.LoadJSONFile(const JSONFileName: string);
var
  JSONStrings: TStrings;
  JSONText: string;
  SuperObject: ISuperObject;
{$ifdef FPC}
  SuperArray: TSuperArray;
  SuperArrayLength: Integer;
  CurrentSuperObjectElement: ISuperObject;
  FishFactEntry: TFishFactEntry;
{$else}
  Context: TSuperRttiContext;
{$endif FPC}
  FishFactEntries: TFishFactEntries;
  Index: Integer;
begin
  JSONStrings := TStringList.Create();
  try
    JSONStrings.LoadFromFile(JSONFileName);
    JSONText := JSONStrings.Text;

    JsonTextMemo.Text := JSONText;
    JsonTextMemo.WordWrap := True;
    SuperObject := SO(JSONText);
{$ifdef FPC}
    // no RTTI, so we have to disect this ourselves the hard way:
    SuperArray := SuperObject.AsArray; // no need to free: SuperObject stays the owner!
    SuperArrayLength := SuperArray.Length;
    SetLength(FishFactEntries, SuperArrayLength);

    // TSuperArray has no for..in support
    for Index := 0 to SuperArrayLength-1 do
    begin
      FishFactEntry := TFishFactEntry.Create();
      CurrentSuperObjectElement := SuperArray.O[Index];
      FishFactEntry.Category := CurrentSuperObjectElement.S[SFCategory];
      FishFactEntry.CommonName := CurrentSuperObjectElement.S[SFCommonName];
      FishFactEntry.SpeciesName := CurrentSuperObjectElement.S[SFSpeciesName];
      FishFactEntry.Notes := CurrentSuperObjectElement.S[SFNotes];
      FishFactEntry.SpeciesNo := CurrentSuperObjectElement.D[SFSpeciesNo];
      FishFactEntry.LengthCm := CurrentSuperObjectElement.D[SFLengthCm];
      FishFactEntry.LengthInch := CurrentSuperObjectElement.D[SFLengthInch];
      FishFactEntries[Index] := FishFactEntry;
    end;
{$else}
    Context := TSuperRttiContext.Create();
    try
      FishFactEntries := Context.AsType<TFishFactEntries>(SuperObject);
    finally
      Context.Free;
    end;
{$endif FPC}
    ShowFishFactEntries(FishFactEntries);
    for Index := Low(FishFactEntries) to High(FishFactEntries) do
      FreeAndNil(FishFactEntries[Index]);
    SetLength(FishFactEntries, 0);
  finally
    JSONStrings.Free;
  end;
end;

procedure TiOSFireMonkeyFishFactForm.ShowFishFactEntries(const FishFactEntries:
    TFishFactEntries);
  function StripFirst(const FieldName: string): string;
  begin
    Result := Copy(FieldName, 2, Length(FieldName)-1);
  end;
var
  FishFactEntry: TFishFactEntry;
  Index: Integer;
begin
  StringGrid1.Columns[0].Width := 40;
  StringGrid1.Cells[0, 0] := StripFirst(SFSpeciesNo);
  StringGrid1.Cells[1, 0] := StripFirst(SFCommonName);
  Index := 1;
  for FishFactEntry in FishFactEntries do
  begin
    StringGrid1.Cells[0, Index] := FloatToStr(FishFactEntry.SpeciesNo);
    StringGrid1.Cells[1, Index] := FishFactEntry.CommonName;
    Index := Index + 1;
  end;
  StringGrid1.RowCount := Index;
end;

{$R *.lfm}

end.
