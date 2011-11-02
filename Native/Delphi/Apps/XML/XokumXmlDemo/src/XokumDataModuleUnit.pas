unit XokumDataModuleUnit;

interface

uses
  SysUtils, Classes, DB, DBClient, xmldom, Provider, Xmlxform;

type
  TXokumDataModule = class(TDataModule)
    XokumClientDataSet: TClientDataSet;
    XokumClientDataSetachternaam: TStringField;
    XokumClientDataSetvoorletters: TStringField;
    XokumClientDataSetstraat: TStringField;
    XokumClientDataSetnummer: TIntegerField;
    XokumClientDataSetabonneenummer: TIntegerField;
    XokumClientDataSetplaats: TStringField;
    XokumClientDataSetnetnummer: TIntegerField;
    XokumXMLTransformProvider: TXMLTransformProvider;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  XokumDataModule: TXokumDataModule;

implementation

{$R *.dfm}

end.
