unit NLFMJSON2ASXUnit;

interface

uses
  DBXJSON, ASXUnit, SysUtils, XMLIntf;

type
  TNLFMJSON2ASX = class(TObject)
  private
    function GetJSON(JSONText: string): string;
    procedure ParseInnerJSONObject(JSONObject: TJSONObject; Builder: TStringBuilder; Entries: IXMLEntryTypeList);
    procedure ParseItems(Pair: TJSONPair; Builder: TStringBuilder; Entries: IXMLEntryTypeList);
    procedure SaveASX(ASX: IXMLAsxType; Builder: TStringBuilder);
    function SetOwnerDocumentOptions(const ASX: IXMLAsxType): IXMLDocument;
  public
    function ParseJSON(JSONText: string): TJSONValue;
    function ParseJSONValue(const JSONValue: TJSONValue): string;
  end;

implementation

uses
  Variants, Classes;

function TNLFMJSON2ASX.GetJSON(JSONText: string): string;
const
  ValidStartCharacters = '{'; // '"0123456789{[tfn';
var
  ResultLength: Integer;
  StartPos: Integer;
begin
  Result := JSONText;
  StartPos := 0;
  while True do
  begin
    Inc(StartPos);
    ResultLength := Length(Result);
    if StartPos > ResultLength then
      Exit(NullAsStringValue);
    if Pos(Result[StartPos], ValidStartCharacters) > 0 then
      Exit(Copy(Result, StartPos, ResultLength));
  end;
end;

procedure TNLFMJSON2ASX.ParseInnerJSONObject(JSONObject: TJSONObject; Builder: TStringBuilder; Entries: IXMLEntryTypeList);
var
  Author: string;
  Entry: IXMLEntryType;
  Href: string;
  AlternativeHref: string;
  PairIndex: Integer;
  Pair: TJSONPair;
  PairJsonString: TJSONString;
  PairJSONValue: TJSONValue;
  Title: string;
begin
  for PairIndex := 0 to JSONObject.Size - 1 do
  begin
    Pair := JSONObject.Get(PairIndex);
    PairJSONValue := Pair.JsonValue;
    PairJsonString := Pair.JsonString;

    if PairJSONValue is TJSONString then
    begin
      if PairJsonString.Value = 'o' then
        Title := PairJSONValue.Value
      else if PairJsonString.Value = 'm' then
        Href := PairJSONValue.Value
      else if PairJsonString.Value = 'z' then
        Author := PairJSONValue.Value
      else if PairJsonString.Value = 's' then
        AlternativeHref := PairJSONValue.Value;
//"z" - zender
//"s" - media player stream url
//"w" - website
//"o"
//"p"
//"b" - banner image
//"wi"
//"hi"
//"m" - media player url
(* // deze hebben geen "m":
{"z":"kersthits","s":"http://www.radiodigitaal.nl/static/download/nederlandFM/Players/kersthits/","w":"http://www.radiodigitaal.nl","o":"Kersthits","p":"totaal","b":null,"wi":null,"hi":null,"m":null}
{"z":"kinderradio","s":"http://stream.kinderradio.fm/kinderradio","w":"http://www.kinderradio.fm","o":"Kinderradio","p":"wmp","b":null,"wi":null,"hi":null,"m":""}
{"z":"omroepbrabant","s":"http://streams.kpnwebcast.nl/cgi-bin/reflector.cgi?title=Omroep+Brabant:+Live+Radio&stream=omroepbrabant_128k","w":"http://www.omroepbrabant.nl
","o":"Omroep Brabant - Blijft je verrassen","p":"wmp","b":null,"wi":null,"hi":null,"m":null}
{"z":"radio1nieuws","s":"http://cgi.omroep.nl/cgi-bin/streams?/nos/radio1nieuws/NOS_Nieuws.wma","w":"http://www.radio1.nl","o":"Radio 1 Nieuws","p":"wmp","b":null,"wi":null,"hi":null,"m":null}
{"z":"skychristmas","s":"http://stream05.skyradio.nl/","w":"http://www.skyradio.fm","o":"Sky Christmas","p":"totaal","b":null,"wi":null,"hi":null,"m":null}
{"z":"smashfm","s":"http://www.true.nl/streams/slamfmlivestream.asx","w":"http://www.slamfm.nl","o":"SmashFM","p":"wmp","b":null,"wi":null,"hi":null,"m":null}
{"z":"summerhits","s":"http://stream05.skyradio.nl/","w":"http://www.skyradio.nl","o":"Sky Radio Summerhits","p":"totaal","b":null,"wi":null,"hi":null,"m":""}
{"z":"trafficradio","s":"http://www.garnierstreamingmedia.com/asx/streamerswitch.asp?stream=296","w":"http://www.trafficradio.nl","o":"Traffic Radio","p":"wmp","b":null,"wi":null,"hi":null,"m":null}
{"z":"viradio","s":"http://www.radiodigitaal.nl/static/download/nederlandFM/Players/vi-radio/stream.php","w":"http://www.radiodigitaal.nl","o":"VI Radio","p":"totaal","b":null,"wi":null,"hi":null,"m":null}
{"z":"wildfm","s":"mms://wildfm.streamonline.nl/wildfm","w":"http://www.wildfm.nl","o":"Wild FM Hitradio","p":"wmp","b":null,"wi":null,"hi":null,"m":null}
*)
    end;
  end;
  Entry := nil;
  if Href = NullAsStringValue then
    Href := AlternativeHref;
  if Title <> NullAsStringValue then
    if Href <> NullAsStringValue then
      if Author <> NullAsStringValue then
      begin
        Entry := Entries.Add();
        Entry.Title := Title;
        Entry.Ref.Href := Href;
        Entry.Author := Author;
      end;
  if not Assigned(Entry) then
  begin
    Builder.Append(JSONObject);
    Builder.AppendLine;
  end;
end;

procedure TNLFMJSON2ASX.ParseItems(Pair: TJSONPair; Builder: TStringBuilder; Entries: IXMLEntryTypeList);
var
  ArrayIndex: Integer;
  JSONArray: TJSONArray;
  PairJSONValue: TJSONValue;
  ArrayJSONValue: TJSONValue;
  JSONObject: TJSONObject;
begin
  PairJSONValue := Pair.JsonValue;
  if PairJSONValue is TJSONArray then
  begin
    JSONArray := TJSONArray(PairJSONValue);
    for ArrayIndex := 0 to JSONArray.Size-1 do
    begin
      ArrayJSONValue := JSONArray.Get(ArrayIndex);
      if ArrayJSONValue is TJSONObject then
      begin
        JSONObject := TJSONObject(ArrayJSONValue);
        ParseInnerJSONObject(JSONObject, Builder, Entries);
      end;
    end;
    Builder.Append(Pair.JsonValue);
  end;
end;

function TNLFMJSON2ASX.ParseJSON(JSONText: string): TJSONValue;
var
  JSONString: string;
begin
  JSONString := GetJSON(JSONText);
  Result := TJSONObject.ParseJSONValue(JSONString);
end;

function TNLFMJSON2ASX.ParseJSONValue(const JSONValue: TJSONValue): string;
var
  Builder: TStringBuilder;
  JSONObject: TJSONObject;
  Pair: TJSONPair;
  PairIndex: Integer;
  ASX: IXMLAsxType;
begin
  Builder := TStringBuilder.Create();
  try
    if JSONValue is TJSONObject then
    begin
      ASX := NewASX;
      SetOwnerDocumentOptions(ASX);
      ASX.Title := 'From NLFM JSON';
      JSONObject := TJSONObject(JSONValue);
      for PairIndex := 0 to JSONObject.Size-1 do
      begin
        Pair := JSONObject.Get(PairIndex);
        Builder.Append(Pair.JsonString);
        Builder.AppendLine;
        if Pair.JsonString.Value = 'items' then
        begin
          ParseItems(Pair, Builder, ASX.Entry);
        end;
      end;
      SaveASX(ASX, Builder);
      Result := Builder.ToString();
    end
    else
      Result := JSONValue.ToString;
  finally
    Builder.Free;
  end;
end;

procedure TNLFMJSON2ASX.SaveASX(ASX: IXMLAsxType; Builder: TStringBuilder);
var
  OwnerDocument: IXMLDocument;
  XMLLines: TStrings;
begin
  Builder.AppendLine;
  XMLLines := TStringList.Create();
  try
    OwnerDocument := SetOwnerDocumentOptions(ASX);
    XMLLines.Assign(OwnerDocument.XML);
    XMLLines.Delete(0); // delete the XML declaration '<?xml version="1.0"?>'
    Builder.Append(XMLLines.Text);
    XMLLines.SaveToFile('..\..\..\doc\NLFM.ASX');
  finally
    XMLLines.Free;
  end;
end;

function TNLFMJSON2ASX.SetOwnerDocumentOptions(const ASX: IXMLAsxType): IXMLDocument;
begin
  Result := ASX.OwnerDocument;
  Result.Options := Result.Options + [doNodeAutoIndent];
end;

end.
