unit MSConfigUnit;

interface

uses
  Forms, Dialogs, Classes, ADOConnectionStringBuilderUnit;

type
  TMSConfig = class(TPersistent)
  strict private
    FAccessDatabaseName: string;
    FAccessUserName: string;
    FIsUsingSqlServer: Boolean;
    FSQLIntegratedSecurity: Boolean;
    FSQLServerDatabaseName: string;
    FSQLServerName: string;
    FSQLServerPassword: string;
    FSQLServerUserName: string;
  strict protected
    function GetAccessUserName: string; virtual;
    function GetIsUsingSqlServer: Boolean; virtual;
    function GetProviderType: TProviderType; virtual;
    function GetSQLServerUserName: string; virtual;
    procedure SetProviderType(const Value: TProviderType); virtual;
  public
    constructor Create;
    procedure Assign(Source: TPersistent); override;
    function BuildConnectionString: string; virtual;
    procedure ReadFromIniFile; virtual;
    property AccessDatabaseName: string read FAccessDatabaseName write FAccessDatabaseName;
    property AccessUserName: string read GetAccessUserName write FAccessUserName;
    property IsUsingSqlServer: Boolean read GetIsUsingSqlServer write FIsUsingSqlServer;
    property ProviderType: TProviderType read GetProviderType write SetProviderType;
    property SQLIntegratedSecurity: Boolean read FSQLIntegratedSecurity write FSQLIntegratedSecurity;
    property SQLServerDatabaseName: string read FSQLServerDatabaseName write FSQLServerDatabaseName;
    property SQLServerName: string read FSQLServerName write FSQLServerName;
    property SQLServerPassword: string read FSQLServerPassword write FSQLServerPassword;
    property SQLServerUserName: string read GetSQLServerUserName write FSQLServerUserName;
  end;

implementation

uses
  SysUtils, ApplicationHelperUnit, IniFiles, EncdDecd, Variants,
  GenericExceptionUnit;

const
  DataSectionName = 'Data';
  DataTypeIdentName = 'Type';

const
  SQLServerSectionName = 'SQL';
  SQLServerServerNameIdentName = 'ServerName';
  SQLServerUserNameIdentName = 'UserName';
  SQLServerPasswordIdentName = 'Password';
  SQLServerDatabaseNameIdentName = 'DatabaseName';
  SQLServerIntegratedSecurityIdentName = 'IntegratedSecurity';

const
  AccessSectionName = 'Access';
  AccessDatabaseNameIdentName = SQLServerDatabaseNameIdentName;
  AccessUserNameIdentName = SQLServerUserNameIdentName;

constructor TMSConfig.Create;
begin
  inherited Create;
  // ShowMessage(EncodeString('johan'));
end;

procedure TMSConfig.Assign(Source: TPersistent);
var
  SourceMSConfig: TMSConfig;
begin
  if Source is TMSConfig then
  begin
    SourceMSConfig := Source as TMSConfig;
    FIsUsingSqlServer := SourceMSConfig.IsUsingSqlServer;
    FSQLServerName := SourceMSConfig.SQLServerName;
    FSQLServerUserName := SourceMSConfig.SQLServerUserName;
    FSQLServerPassword := SourceMSConfig.SQLServerPassword;
    FSQLServerDatabaseName := SourceMSConfig.SQLServerDatabaseName;
    FSQLIntegratedSecurity := SourceMSConfig.SQLIntegratedSecurity;
    FAccessDatabaseName := SourceMSConfig.AccessDatabaseName;
    FAccessUserName := SourceMSConfig.AccessUserName;
  end
  else
    inherited Assign(Source);
end;

function TMSConfig.BuildConnectionString: string;
var
  ADOConnectionStringBuilder: TADOConnectionStringBuilder;
begin
  ADOConnectionStringBuilder := TADOConnectionStringBuilder.Create;
  try
    ADOConnectionStringBuilder.ProviderType := ProviderType;
    if IsUsingSqlServer then
    begin
      ADOConnectionStringBuilder.Database := SQLServerDatabaseName;
      ADOConnectionStringBuilder.DataSource := SQLServerName;
      if not SQLIntegratedSecurity then
      begin
        ADOConnectionStringBuilder.UserId := SQLServerUserName;
        ADOConnectionStringBuilder.Password := SQLServerPassword;
      end;
      ADOConnectionStringBuilder.IntegratedSecurity := SQLIntegratedSecurity;
    end
    else
    begin
      ADOConnectionStringBuilder.UserId := AccessUserName;
      ADOConnectionStringBuilder.DataSource := AccessDatabaseName;
    end;

    Result := ADOConnectionStringBuilder.ConnectionString;
  finally
    ADOConnectionStringBuilder.Free;
  end;
end;

function TMSConfig.GetAccessUserName: string;
begin
  ReadFromIniFile();
  Result := FAccessUserName;
end;

function TMSConfig.GetIsUsingSqlServer: Boolean;
begin
  ReadFromIniFile();
  Result := FIsUsingSqlServer;
end;

function TMSConfig.GetProviderType: TProviderType;
begin
  if IsUsingSqlServer then
    Result := ptMsSqlServer
  else
    Result := ptMsAccess;
end;

function TMSConfig.GetSQLServerUserName: string;
begin
  ReadFromIniFile();
  Result := FSQLServerUserName;
end;

procedure TMSConfig.ReadFromIniFile;
var
  IniFilename: string;
  IniFile: TIniFile;
  SQLIntegratedSecurityString: string;
  function ReadString(const Section, Ident: string; const Default: string = ''): string;
  begin
    Result := IniFile.ReadString(Section, Ident, Default);
  end;
begin
  IniFilename := Application.FileNameRelativeTo('.ini');
  if not FileExists(IniFilename) then
    raise EGenericException<TMSConfig>.CreateFmt('Cannot find INI file "%s"', [IniFileName]);

  IniFile := TIniFile.Create(IniFilename);
  try
    FIsUsingSqlServer := ReadString(DataSectionName, DataTypeIdentName) = SQLServerSectionName;

    FSQLServerName := ReadString(SQLServerSectionName, SQLServerServerNameIdentName);
    FSQLServerUserName := ReadString(SQLServerSectionName, SQLServerUserNameIdentName);
    FSQLServerPassword := ReadString(SQLServerSectionName, SQLServerPasswordIdentName);
    FSQLServerDatabaseName := ReadString(SQLServerSectionName, SQLServerDatabaseNameIdentName);
    FSQLIntegratedSecurity := IniFile.ReadBool(SQLServerSectionName, SQLServerIntegratedSecurityIdentName, False);
    SQLIntegratedSecurityString := ReadString(SQLServerSectionName, SQLServerIntegratedSecurityIdentName);
    SQLIntegratedSecurityString := UpperCase(SQLIntegratedSecurityString);
    FSQLIntegratedSecurity := FSQLIntegratedSecurity or (SQLIntegratedSecurityString = 'SSPI') or (SQLIntegratedSecurityString = 'TRUE');

    FAccessDatabaseName := ReadString(AccessSectionName, AccessDatabaseNameIdentName);
    FAccessUserName := ReadString(AccessSectionName, AccessUserNameIdentName);
  finally
    FreeAndNil(IniFile);
  end;
end;

procedure TMSConfig.SetProviderType(const Value: TProviderType);
begin
  IsUsingSqlServer := Value = ptMsSqlServer;
end;

end.
