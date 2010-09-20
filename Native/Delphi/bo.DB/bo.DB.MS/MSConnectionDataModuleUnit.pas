unit MSConnectionDataModuleUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ADODB, SyncObjs, MSConnectionLayerUnit, ADOConnectionStringBuilderUnit,
  MSConfigUnit;

type
  TMSConnectionDataModule = class(TDataModule)
    MainADOConnection: TADOConnection;
  strict private
    FConnected: Boolean;
    FConnectionCount: Integer;
  strict protected
    procedure Connect; virtual;
    procedure Disconnect; virtual;
    function GetConnection: TDBConnection;
    procedure SetConnected(const Value: Boolean); virtual;
  public
    procedure ConnectToDatabase; virtual;
    function CreateQuery: TDBQuery; virtual;
    procedure EditConnectionString;
    property Connected: Boolean read FConnected write SetConnected;
    property Connection: TDBConnection read GetConnection;
  end;

  TMSConnectionDataModuleFactory = class(TObject) //##jpl: needs simplification
  strict private
    FCriticalSection: TCriticalSection;
    FProviderType: TProviderType;
    FReferenceCount: Integer;
    function GetDataModule: TMSConnectionDataModule;
  private
    FMSConfig: TMSConfig;
    procedure SetMSConfig(const Value: TMSConfig);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Release;
    property DataModule: TMSConnectionDataModule read GetDataModule;
    property MSConfig: TMSConfig read FMSConfig write SetMSConfig;
    property ProviderType: TProviderType read FProviderType;
  end;

var
  MSConnectionDataModuleFactory: TMSConnectionDataModuleFactory;

implementation

uses
  ComObj, AdoConEd;

var
  MSConnectionDataModule: TMSConnectionDataModule;

{$R *.DFM}

{ TMSConnectionDataModule }

procedure TMSConnectionDataModule.Connect;
var
  ErrorMessage: TStrings;
  OleException: EOleException;
begin
  Inc(FConnectionCount);
  if FConnectionCount >= 1 then
  try
    MainADOConnection.Connected := True;
  except
    on E: Exception do
    begin
      Dec(FConnectionCount);
      ErrorMessage := TStringList.Create();
      try
        ErrorMessage.Add('Error connecting to the database!');
        ErrorMessage.Add(Format('Database name: "%s"', [MainADOConnection.ConnectionString]));
        ErrorMessage.Add(Format('Class: %s', [E.ClassName]));
        ErrorMessage.Add(Format('Message: %s', [E.Message]));
        if E is EOleException then
        begin
          OleException := E as EOleException;
          ErrorMessage.Add(Format('Source: %s', [OleException.Source]));
          ErrorMessage.Add(Format('HelpFile: %s', [OleException.HelpFile]));
        end;
        MessageDlg(ErrorMessage.Text, mtError, [mbOK], 0);
      finally
        ErrorMessage.Free;
      end;
      Application.Terminate;
    end;
  end;
end;

procedure TMSConnectionDataModule.Disconnect;
begin
  Dec(FConnectionCount);
  try
    if FConnectionCount = 0 then
      MainADOConnection.Connected := False;
  except
    Inc(FConnectionCount);
    raise;
  end;
end;

procedure TMSConnectionDataModule.ConnectToDatabase;
begin
  MainADOConnection.Connected := True;
end;

function TMSConnectionDataModule.CreateQuery: TDBQuery;
begin
  Result := TDBQuery.Create(nil);
  Result.Connection := Self.MainADOConnection;
end;

procedure TMSConnectionDataModule.EditConnectionString;
begin
  //jpl: see http://delphigeek.blogspot.com/2006/09/last-night-i-was-looking-for-way-of_13.html
  AdoConEd.EditConnectionString(MainADOConnection);
end;

function TMSConnectionDataModule.GetConnection: TDBConnection;
begin
  Result := MainADOConnection;
end;

procedure TMSConnectionDataModule.SetConnected(const Value: Boolean);
begin
  if Value then
    Connect
  else
    Disconnect;

  FConnected := MainADOConnection.Connected;
end;

{ TDispatcher }

constructor TMSConnectionDataModuleFactory.Create;
begin
  MSConnectionDataModule := nil;
  FMSConfig := TMSConfig.Create();
  MSConfig.ReadFromIniFile();
  FCriticalSection := TCriticalSection.Create;
end;

destructor TMSConnectionDataModuleFactory.Destroy;
begin
  while FReferenceCount > 0 do
    Release;

  FreeAndNil(FCriticalSection);
  FreeAndNil(FMSConfig);

  inherited Destroy();
end;

function TMSConnectionDataModuleFactory.GetDataModule: TMSConnectionDataModule;
begin
  FCriticalSection.Enter;
  try
    inc(FReferenceCount);

    if FReferenceCount = 1 then
      MSConnectionDataModule := TMSConnectionDataModule.Create(nil);

    Result := MSConnectionDataModule;
    if not Result.Connected then
    begin
      Result.MainADOConnection.ConnectionString := MSConfig.BuildConnectionString;
      FProviderType := MSConfig.ProviderType;
      Result.Connected := True;
    end;
  finally
    FCriticalSection.Leave;
  end;
end;

procedure TMSConnectionDataModuleFactory.Release;
begin
  FCriticalSection.Enter;
  try

    MSConnectionDataModule.Connected := False;
    Dec(FReferenceCount);

    if FReferenceCount = 0 then
      FreeAndNil(MSConnectionDataModule);

  finally
    FCriticalSection.Leave;
  end;
end;

procedure TMSConnectionDataModuleFactory.SetMSConfig(const Value: TMSConfig);
begin
  FMSConfig.Assign(Value);
end;

initialization
  MSConnectionDataModuleFactory := TMSConnectionDataModuleFactory.Create;

finalization
  FreeAndNil(MSConnectionDataModuleFactory);

end.
