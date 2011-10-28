unit iOSFireMonkeyFishFactFormUnit;

interface

uses
  SysUtils, Types, UITypes, Classes, Variants, FMX_Types, FMX_Controls, FMX_Forms,
  FMX_Dialogs, FMX_Layouts, FMX_Memo;

const
  SFishFactJSONDataSuperObjectTxt = 'FishFact-JSON-data-SuperObject.txt';

type
  TiOSFireMonkeyFishFactForm = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  strict protected
  end;

var
  iOSFireMonkeyFishFactForm: TiOSFireMonkeyFishFactForm;

implementation

uses
  superobject,
  IOUtils;

procedure TiOSFireMonkeyFishFactForm.Button1Click(Sender: TObject);
//var
//  Context: TSuperRttiContext;
//  SuperObject: TSuperObject;
var
  JsonFileName: string;
begin
  JsonFileName := TPath.Combine(TPath.GetDirectoryName(ParamStr(0)), SFishFactJSONDataSuperObjectTxt);
  Memo1.Text := JsonFileName;
//  Context := TSuperRttiContext.Create();
//  try
////    Context.AsType
//    SuperObject := TSuperObject.Create();
//    try
//  //    ioutils.TFile.re
////      SuperObject.ParseString()
//    finally
//      SuperObject.Free;
//    end;
//  finally
//    Context.Free;
//  end;
end;

{$R *.lfm}

//uses
//  Data.DBXJSON,
//  System.IOUtils,
//  FMX.Platform;
//  DataSetInformationUnit,
//  DataSetToJsonUnit,
//  Datasnap.DBClient;
//  ClientDataSetUnit,
//  FishFactEntryUnit,
//  DataSetEnumeratorUnit,
//  DataSetHelperUnit;

end.
