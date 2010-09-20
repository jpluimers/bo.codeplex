{$define d12up} //##jpl: make dynamic

unit StringListWrapperUnit;

interface

uses
  Classes;

type
  IStringListWrapper = interface(IInterface)
    function Add(const S: string): Integer;
    function AddObject(const S: string; const AObject: TObject): Integer;
    procedure AddStrings(const Strings: TStrings); overload;
    procedure AddStringListWrapper(const StringListWrapper: IStringListWrapper); overload;
    procedure Append(const S: string);
    procedure BeginUpdate;
    procedure Clear;
    procedure Delete(Index: Integer);
    procedure EndUpdate;
    function Equals(const Strings: TStrings): Boolean;
    procedure Exchange(const Index1, Index2: Integer);
    function Get(Index: Integer): string;
    function GetCapacity: Integer;
    function GetCommaText: string;
    function GetCount: Integer;
    function GetDelimitedText: string;
    function GetDelimiter: Char;
    function GetEnumerator: TStringsEnumerator;
    function GetLineBreak: string;
    function GetName(Index: Integer): string;
    function GetNameValueSeparator: Char;
    function GetObject(Index: Integer): TObject;
    function GetQuoteChar: Char;
    function GetStrictDelimiter: Boolean;
    function GetTextStr: string;
    function GetValue(const Name: string): string;
    function GetValueFromIndex(Index: Integer): string;
    function IndexOf(const S: string): Integer;
    function IndexOfName(const Name: string): Integer;
    function IndexOfObject(const AObject: TObject): Integer;
    procedure Insert(const Index: Integer; const S: string);
    procedure InsertObject(const Index: Integer; const S: string; const AObject: TObject);
    procedure LoadFromFile(const FileName: string);
    procedure LoadFromStream(const Stream: TStream);
    procedure Move(const CurIndex, NewIndex: Integer);
    procedure Put(Index: Integer; const S: string);
    procedure PutObject(Index: Integer; const AObject: TObject);
    procedure SaveToFile(const FileName: string);
    procedure SaveToStream(const Stream: TStream);
    procedure SetCapacity(const NewCapacity: Integer);
    procedure SetCommaText(const Value: string);
    procedure SetDelimitedText(const Value: string);
    procedure SetDelimiter(const Value: Char);
    procedure SetLineBreak(const Value: string);
    procedure SetNameValueSeparator(const Value: Char);
    procedure SetQuoteChar(const Value: Char);
    procedure SetStrictDelimiter(const Value: Boolean);
    procedure SetText(Text: PChar);
    procedure SetTextStr(const Value: string);
    procedure SetValue(const Name, Value: string);
    procedure SetValueFromIndex(Index: Integer; const Value: string);
    property Capacity: Integer read GetCapacity write SetCapacity;
    property CommaText: string read GetCommaText write SetCommaText;
    property Count: Integer read GetCount;
    property Delimiter: Char read GetDelimiter write SetDelimiter;
    property DelimitedText: string read GetDelimitedText write SetDelimitedText;
    property LineBreak: string read GetLineBreak write SetLineBreak;
    property Names[Index: Integer]: string read GetName;
    property Objects[Index: Integer]: TObject read GetObject write PutObject;
    property QuoteChar: Char read GetQuoteChar write SetQuoteChar;
    property Values[const Name: string]: string read GetValue write SetValue;
    property ValueFromIndex[Index: Integer]: string read GetValueFromIndex write SetValueFromIndex;
    property NameValueSeparator: Char read GetNameValueSeparator write SetNameValueSeparator;
    property StrictDelimiter: Boolean read GetStrictDelimiter write SetStrictDelimiter;
    property Strings[Index: Integer]: string read Get write Put; default;
    property Text: string read GetTextStr write SetTextStr;
  end;

type
  TStringListWrapper = class(TInterfacedObject, IStringListWrapper)
  strict private
    FStringListToWrap: TStrings;
  public
    constructor Create;
    destructor Destroy; override;
    function Add(const S: string): Integer; virtual;
    function AddObject(const S: string; const AObject: TObject): Integer; virtual;
    procedure Append(const S: string); virtual;
    procedure AddStrings(const Strings: TStrings); virtual;
    procedure BeginUpdate; virtual;
    procedure Clear; virtual;
    procedure Delete(Index: Integer); virtual;
    procedure EndUpdate; virtual;
    function Equals(const Strings: TStrings): Boolean; {$ifdef d12up} reintroduce; {$endif} virtual;
    procedure AddStringListWrapper(const StringListWrapper: IStringListWrapper); overload; virtual;
    procedure Exchange(const Index1, Index2: Integer); virtual;
    function Get(Index: Integer): string; virtual;
    function GetCapacity: Integer; virtual;
    function GetCommaText: string; virtual;
    function GetCount: Integer; virtual;
    function GetDelimitedText: string; virtual;
    function GetDelimiter: Char; virtual;
    function GetEnumerator: TStringsEnumerator; virtual;
    function GetLineBreak: string; virtual;
    function GetName(Index: Integer): string; virtual;
    function GetNameValueSeparator: Char; virtual;
    function GetObject(Index: Integer): TObject; virtual;
    function GetQuoteChar: Char; virtual;
    function GetStrictDelimiter: Boolean; virtual;
    function GetTextStr: string; virtual;
    function GetValue(const Name: string): string; virtual;
    function GetValueFromIndex(Index: Integer): string; virtual;
    function IndexOf(const S: string): Integer; virtual;
    function IndexOfName(const Name: string): Integer; virtual;
    function IndexOfObject(const AObject: TObject): Integer; virtual;
    procedure Insert(const Index: Integer; const S: string); virtual;
    procedure InsertObject(const Index: Integer; const S: string; const AObject: TObject); virtual;
    procedure LoadFromFile(const FileName: string); virtual;
    procedure LoadFromStream(const Stream: TStream); virtual;
    procedure Move(const CurIndex, NewIndex: Integer); virtual;
    procedure Put(Index: Integer; const S: string); virtual;
    procedure PutObject(Index: Integer; const AObject: TObject); virtual;
    procedure SaveToFile(const FileName: string); virtual;
    procedure SaveToStream(const Stream: TStream); virtual;
    procedure SetCapacity(const NewCapacity: Integer); virtual;
    procedure SetCommaText(const Value: string); virtual;
    procedure SetDelimitedText(const Value: string); virtual;
    procedure SetDelimiter(const Value: Char); virtual;
    procedure SetLineBreak(const Value: string); virtual;
    procedure SetNameValueSeparator(const Value: Char); virtual;
    procedure SetQuoteChar(const Value: Char); virtual;
    procedure SetStrictDelimiter(const Value: Boolean); virtual;
    procedure SetText(Text: PChar); virtual;
    procedure SetTextStr(const Value: string); virtual;
    procedure SetValue(const Name, Value: string); virtual;
    procedure SetValueFromIndex(Index: Integer; const Value: string); virtual;
    property Capacity: Integer read GetCapacity write SetCapacity;
    property CommaText: string read GetCommaText write SetCommaText;
    property Count: Integer read GetCount;
    property Delimiter: Char read GetDelimiter write SetDelimiter;
    property DelimitedText: string read GetDelimitedText write SetDelimitedText;
    property LineBreak: string read GetLineBreak write SetLineBreak;
    property Names[Index: Integer]: string read GetName;
    property Objects[Index: Integer]: TObject read GetObject write PutObject;
    property QuoteChar: Char read GetQuoteChar write SetQuoteChar;
    property Values[const Name: string]: string read GetValue write SetValue;
    property ValueFromIndex[Index: Integer]: string read GetValueFromIndex write SetValueFromIndex;
    property NameValueSeparator: Char read GetNameValueSeparator write SetNameValueSeparator;
    property StrictDelimiter: Boolean read GetStrictDelimiter write SetStrictDelimiter;
    property Strings[Index: Integer]: string read Get write Put; default;
    property Text: string read GetTextStr write SetTextStr;
  end;

implementation

{ TStringListWrapper }

constructor TStringListWrapper.Create;
begin
  inherited Create();
  Self.FStringListToWrap := TStringList.Create();
end;

destructor TStringListWrapper.Destroy;
begin
  Self.FStringListToWrap.Free;
  Self.FStringListToWrap := nil;

  inherited Destroy;
end;

function TStringListWrapper.Add(const S: string): Integer;
begin
  Result := Self.FStringListToWrap.Add(S);
end;

function TStringListWrapper.AddObject(const S: string; const AObject: TObject): Integer;
begin
  Result := Self.FStringListToWrap.Add(S);
end;

procedure TStringListWrapper.Append(const S: string);
begin
  Self.FStringListToWrap.Append(S);
end;

procedure TStringListWrapper.AddStrings(const Strings: TStrings);
begin
  Self.FStringListToWrap.AddStrings(Strings);
end;

procedure TStringListWrapper.BeginUpdate;
begin
  Self.FStringListToWrap.BeginUpdate;
end;

procedure TStringListWrapper.Clear;
begin
  Self.FStringListToWrap.Clear();
end;

procedure TStringListWrapper.Delete(Index: Integer);
begin
  Self.FStringListToWrap.Delete(Index);
end;

procedure TStringListWrapper.AddStringListWrapper(const StringListWrapper: IStringListWrapper);
var
  I: Integer;
begin
  Self.BeginUpdate;
  try
    for I := 0 to StringListWrapper.Count - 1 do
      Self.AddObject(StringListWrapper[I], StringListWrapper.Objects[I]);
  finally
    Self.EndUpdate;
  end;
end;

procedure TStringListWrapper.EndUpdate;
begin
  Self.FStringListToWrap.EndUpdate;
end;

function TStringListWrapper.Equals(const Strings: TStrings): Boolean;
begin
  Result := Self.FStringListToWrap.Equals(Strings);
end;

procedure TStringListWrapper.Exchange(const Index1, Index2: Integer);
begin
  Self.FStringListToWrap.Exchange(Index1, Index2);
end;

function TStringListWrapper.Get(Index: Integer): string;
begin
  Result := Self.FStringListToWrap.Strings[Index];
end;

function TStringListWrapper.GetCapacity: Integer;
begin // descendents may optionally override/replace this default implementation
  Result := Count;
end;

function TStringListWrapper.GetCommaText: string;
begin
  Result := Self.FStringListToWrap.CommaText;
end;

function TStringListWrapper.GetCount: Integer;
begin
  Result := Self.FStringListToWrap.Count;
end;

function TStringListWrapper.GetDelimitedText: string;
begin
  Result := Self.FStringListToWrap.DelimitedText;
end;

function TStringListWrapper.GetEnumerator: TStringsEnumerator;
begin
  Result := Self.FStringListToWrap.GetEnumerator;
end;

function TStringListWrapper.GetName(Index: Integer): string;
begin
  Result := Self.FStringListToWrap.Names[Index];
end;

function TStringListWrapper.GetObject(Index: Integer): TObject;
begin
  Result := Self.FStringListToWrap.Objects[Index];
end;

function TStringListWrapper.GetTextStr: string;
begin
  Result := Self.FStringListToWrap.Text;
end;

function TStringListWrapper.GetValue(const Name: string): string;
begin
  Result := Self.FStringListToWrap.Values[Name];
end;

function TStringListWrapper.IndexOf(const S: string): Integer;
begin
  Result := Self.FStringListToWrap.IndexOf(S);
end;

function TStringListWrapper.IndexOfName(const Name: string): Integer;
begin
  Result := Self.FStringListToWrap.IndexOfName(Name);
end;

function TStringListWrapper.IndexOfObject(const AObject: TObject): Integer;
begin
  Result := Self.FStringListToWrap.IndexOfObject(AObject);
end;

procedure TStringListWrapper.InsertObject(const Index: Integer; const S: string; const AObject: TObject);
begin
  Self.FStringListToWrap.InsertObject(Index, S, AObject);
end;

procedure TStringListWrapper.LoadFromFile(const FileName: string);
begin
  Self.FStringListToWrap.LoadFromFile(FileName);
end;

procedure TStringListWrapper.LoadFromStream(const Stream: TStream);
begin
  Self.FStringListToWrap.LoadFromStream(Stream);
end;

procedure TStringListWrapper.Move(const CurIndex, NewIndex: Integer);
begin
  Self.FStringListToWrap.Move(CurIndex, NewIndex);
end;

procedure TStringListWrapper.Put(Index: Integer; const S: string);
begin
  Self.FStringListToWrap.Strings[Index] := S;
end;

procedure TStringListWrapper.PutObject(Index: Integer; const AObject: TObject);
begin
  Self.FStringListToWrap.Objects[Index] := AObject;
end;

procedure TStringListWrapper.SaveToFile(const FileName: string);
begin
  Self.FStringListToWrap.SaveToFile(FileName);
end;

procedure TStringListWrapper.SaveToStream(const Stream: TStream);
begin
  Self.FStringListToWrap.SaveToStream(Stream);
end;

procedure TStringListWrapper.SetCapacity(const NewCapacity: Integer);
begin
  Self.FStringListToWrap.Capacity := NewCapacity;
end;

procedure TStringListWrapper.SetCommaText(const Value: string);
begin
  Self.FStringListToWrap.CommaText := Value;
end;

procedure TStringListWrapper.SetText(Text: PChar);
begin
  Self.FStringListToWrap.SetText(Text);
end;

procedure TStringListWrapper.SetTextStr(const Value: string);
begin
  Self.FStringListToWrap.Text := Value;
end;

procedure TStringListWrapper.SetValue(const Name, Value: string);
begin
  Self.FStringListToWrap.Values[Name] := Value;
end;

procedure TStringListWrapper.SetDelimitedText(const Value: string);
begin
  Self.FStringListToWrap.DelimitedText := Value;
end;

function TStringListWrapper.GetDelimiter: Char;
begin
  Result := Self.FStringListToWrap.Delimiter;
end;

function TStringListWrapper.GetLineBreak: string;
begin
  Result := Self.FStringListToWrap.LineBreak;
end;

function TStringListWrapper.GetQuoteChar: Char;
begin
  Result := Self.FStringListToWrap.QuoteChar;
end;

function TStringListWrapper.GetStrictDelimiter: Boolean;
begin
  Result := Self.FStringListToWrap.StrictDelimiter;
end;

procedure TStringListWrapper.SetDelimiter(const Value: Char);
begin
  Self.FStringListToWrap.Delimiter := Value;
end;

procedure TStringListWrapper.SetLineBreak(const Value: string);
begin
  Self.FStringListToWrap.LineBreak := Value;
end;

procedure TStringListWrapper.SetQuoteChar(const Value: Char);
begin
  Self.FStringListToWrap.QuoteChar := Value;
end;

procedure TStringListWrapper.SetStrictDelimiter(const Value: Boolean);
begin
  Self.FStringListToWrap.StrictDelimiter := Value;
end;

function TStringListWrapper.GetNameValueSeparator: Char;
begin
  Result := Self.FStringListToWrap.NameValueSeparator;
end;

procedure TStringListWrapper.SetNameValueSeparator(const Value: Char);
begin
  Self.FStringListToWrap.NameValueSeparator := Value;
end;

function TStringListWrapper.GetValueFromIndex(Index: Integer): string;
begin
  Result := Self.FStringListToWrap.ValueFromIndex[Index];
end;

procedure TStringListWrapper.Insert(const Index: Integer; const S: string);
begin
  Self.FStringListToWrap.Insert(Index, S);
end;

procedure TStringListWrapper.SetValueFromIndex(Index: Integer; const Value: string);
begin
  Self.FStringListToWrap.ValueFromIndex[Index] := Value;
end;

end.

