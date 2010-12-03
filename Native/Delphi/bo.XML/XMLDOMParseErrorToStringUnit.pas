unit XMLDOMParseErrorToStringUnit;

interface

uses
  msxml, Classes, ComObj;

type
  TXMLDOMParseErrorToString = class(TObject)
  strict private
    FValidationResultStrings: TStrings;
    FXMLDOMParseError: IXMLDOMParseError;
  strict protected
    procedure AddValidationResultString(const Description, Value: string); virtual;
    procedure AddNonEmptyValidationResultString(const Description, Value: string); overload; virtual;
    procedure AddNonEmptyValidationResultString(const Description: string; const Value: Integer); overload; virtual;
    function GetHaveValidationResult: Boolean; virtual;
    function GetValidationResultStrings: TStrings; virtual;
    procedure Process(const parseError: IXMLDOMParseError); overload; virtual;
    procedure Process(const parseError2: IXMLDOMParseError2); overload; virtual;
    property HaveValidationResult: Boolean read GetHaveValidationResult;
    property ValidationResultStrings: TStrings read GetValidationResultStrings;
  public
    constructor Create(const XMLDOMParseError: IXMLDOMParseError);
    destructor Destroy; override;
    function ToString: string; overload; override;
    class function ToString(const XMLDOMParseError: IXMLDOMParseError): string; reintroduce; overload; static;
    property XMLDOMParseError: IXMLDOMParseError read FXMLDOMParseError;
  end;

  EXMLDOMParseError = class(EOleError)
  public
    constructor Create(const parseError: IXMLDOMParseError);
  end;

implementation

uses
  Variants, SysUtils;

constructor TXMLDOMParseErrorToString.Create(const XMLDOMParseError: IXMLDOMParseError);
begin
  inherited Create();
  FXMLDOMParseError := XMLDOMParseError;
end;

destructor TXMLDOMParseErrorToString.Destroy;
begin
  inherited Destroy();
  FValidationResultStrings.Free();
  FValidationResultStrings := nil;
end;

function TXMLDOMParseErrorToString.GetHaveValidationResult: Boolean;
begin
  Result := Assigned(FValidationResultStrings)
end;

function TXMLDOMParseErrorToString.GetValidationResultStrings: TStrings;
begin
  if not HaveValidationResult then
    FValidationResultStrings := TStringList.Create();
  Result := FValidationResultStrings;
end;

procedure TXMLDOMParseErrorToString.Process(const parseError: IXMLDOMParseError);
begin
  if not Assigned(parseError) then
    Exit;

  AddNonEmptyValidationResultString('reason', parseError.reason);
  AddNonEmptyValidationResultString('errorCode', parseError.errorCode);
  AddNonEmptyValidationResultString('url', parseError.url);
  AddNonEmptyValidationResultString('srcText', parseError.srcText);
  AddNonEmptyValidationResultString('line', parseError.line);
  AddNonEmptyValidationResultString('linepos', parseError.linepos);
  AddNonEmptyValidationResultString('filepos', parseError.filepos);
end;

procedure TXMLDOMParseErrorToString.Process(const parseError2: IXMLDOMParseError2);
var
  Index: Integer;
  ParseErrorCollection: IXMLDOMParseErrorCollection;
  parseError: IXMLDOMParseError;
begin
  if not Assigned(parseError2) then
    Exit;

  //  first: process base:
  parseError := parseError2;
  Process(parseError);

  // second: process extensions
  AddNonEmptyValidationResultString('errorXPath', parseError2.errorXPath);

  ParseErrorCollection := parseError2.allErrors;
  Index := 0;
  if Assigned(ParseErrorCollection) then
  repeat
    parseError := ParseErrorCollection.Next;
    if Assigned(parseError) then
    begin
      AddValidationResultString(Format('parseError[%d]', [Index]), NullAsStringValue);
      Process(parseError);
      parseError := ParseErrorCollection.Next;
      Inc(Index);
    end;
  until not Assigned(parseError);
end;

function TXMLDOMParseErrorToString.ToString: string;
var
  parseError2: IXMLDOMParseError2;
begin
  if not HaveValidationResult then
  begin
    ValidationResultStrings; // trick: create ValidationResultStrings if it is not yet there
    if Supports(XMLDOMParseError, IXMLDOMParseError2, parseError2) then
      Process(parseError2)
    else
      Process(XMLDOMParseError);
  end;
  if HaveValidationResult then
    Result := ValidationResultStrings.Text
  else
    Result := NullAsStringValue;
end;

procedure TXMLDOMParseErrorToString.AddValidationResultString(const Description, Value: string);
begin
  ValidationResultStrings.Add(Format('%s: %s', [Description, Value]));
end;

procedure TXMLDOMParseErrorToString.AddNonEmptyValidationResultString(const Description, Value: string);
begin
  if Value <> NullAsStringValue then
    AddValidationResultString(Description, Value);
end;

procedure TXMLDOMParseErrorToString.AddNonEmptyValidationResultString(const Description: string; const Value: Integer);
begin
  if Value <> 0 then
    AddValidationResultString(Description, IntToStr(Value));
end;

class function TXMLDOMParseErrorToString.ToString(const XMLDOMParseError: IXMLDOMParseError): string;
var
  XMLDOMParseErrorToString: TXMLDOMParseErrorToString;
begin
  XMLDOMParseErrorToString := TXMLDOMParseErrorToString.Create(XMLDOMParseError);
  try
    Result := XMLDOMParseErrorToString.ToString();
  finally
    XMLDOMParseErrorToString.Free;
  end;
end;

constructor EXMLDOMParseError.Create(const parseError: IXMLDOMParseError);
var
  XMLDOMParseErrorToString: TXMLDOMParseErrorToString;
begin
  XMLDOMParseErrorToString := TXMLDOMParseErrorToString.Create(parseError);
  try
    inherited Create(XMLDOMParseErrorToString.ToString);
  finally
    XMLDOMParseErrorToString.Free();
  end;
end;

end.
