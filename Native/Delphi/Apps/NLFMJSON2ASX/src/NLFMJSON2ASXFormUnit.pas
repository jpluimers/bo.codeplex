unit NLFMJSON2ASXFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBXJSON, ASXUnit, XMLIntf;

type
  TNLFMJSON2ASXForm = class(TForm)
    Panel1: TPanel;
    JSONGroupBox: TGroupBox;
    AsxGroupBox: TGroupBox;
    JSONMemo: TEdit;
    AsxMemo: TMemo;
    JSON2AsxButton: TButton;
    procedure JSON2AsxButtonClick(Sender: TObject);
  private
  end;

var
  NLFMJSON2ASXForm: TNLFMJSON2ASXForm;

implementation

uses
  NLFMJSON2ASXUnit;

{$R *.dfm}

procedure TNLFMJSON2ASXForm.JSON2AsxButtonClick(Sender: TObject);
var
  JSONValue: TJSONValue;
  Asx: string;
  NLFMJSON2ASX: TNLFMJSON2ASX;
begin
  NLFMJSON2ASX := TNLFMJSON2ASX.Create();
  try
    JSONValue := NLFMJSON2ASX.ParseJSON(JSONMemo.Text);
    AsxMemo.Clear();
    if Assigned(JSONValue) then
      Asx := NLFMJSON2ASX.ParseJSONValue(JSONValue)
    else
      Asx := 'could not parse JSON';
    AsxMemo.Lines.Add(Asx);
  finally
    NLFMJSON2ASX.Free;
  end;
end;

end.
