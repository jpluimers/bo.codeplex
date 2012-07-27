unit DictionaryUnit;

interface

uses
  IniFiles;

//TODO -ojpl:  Check THashedStringList usage and object ownership

type
  //1 Dictionary that can be owner of the Objects inside
  /// - Names property contains in fact a (Key, Value) pairs of (string, string)
  /// - Strings and Objects property contain (Key, Value) pairs of (string, object)
  TDictionary = class(THashedStringList)
  private
    FIsOwner: Boolean;
  protected
    procedure FreeItem(Index: Integer); virtual;
    procedure PutObject(Index: Integer; AObject: TObject); override;
  public
    procedure Clear; override;
    procedure Delete(Index: Integer); override;
    constructor Create(aIsOwner: Boolean = true);
    property IsOwner: Boolean read FIsOwner;
  end;

implementation

procedure TDictionary.Clear;
var
  Index: Integer;
begin
  if IsOwner then // jpl: looks like extra work, but is in fact faster
    for Index := 0 to Count - 1 do
      FreeItem(Index);
  inherited Clear();
end;

constructor TDictionary.Create(aIsOwner: Boolean);
begin
  inherited Create();
  FIsOwner := aIsOwner;
end;

procedure TDictionary.Delete(Index: Integer);
begin
  FreeItem(Index);
  inherited Delete(Index);
end;

procedure TDictionary.FreeItem(Index: Integer);
var
  ObjectToFree: TObject;
begin
  if IsOwner then
  begin
    ObjectToFree := Objects[Index];
    if Assigned(ObjectToFree) then
    begin
      ObjectToFree.Free;
      Objects[Index] := nil;
    end;
  end;
end;

procedure TDictionary.PutObject(Index: Integer; AObject: TObject);
begin
  FreeItem(Index);
  inherited;
end;

end.

