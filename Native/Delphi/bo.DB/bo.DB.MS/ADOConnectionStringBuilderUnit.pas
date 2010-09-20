unit ADOConnectionStringBuilderUnit;

interface

uses
  Classes, SysUtils;

// Provider "SQL Native Client":Provider=SQLNCLI.1;Integrated Security=SSPI;Persist Security Info=False;Data Source=.\SQLEXPRESS
// Provider "SQL Server Native Client 10.0": "Provider=SQLNCLI10.1;Integrated Security=SSPI;Persist Security Info=False;User ID="";Initial Catalog="";Data Source=.\SQLEXPRESS;Initial File Name="";Server SPN="""
// Provider "Microsoft OLE DB Provider for SQL Server": Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Data Source=.\SQLEXPRESS
// Provider "Microsoft OLE DB Provider for SQL Server": Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=ORM;Data Source=.\SQLEXPRESS
(*

Good: Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=ORM;Data Source=.\SQLEXPRESS
Bad:  Provider=SQLOLEDB.1;Integrated Security=True;Persist Security Info=False;Initial Catalog=ORM;Data Source=.\SQLEXPRESS

---------------------------
Error
---------------------------
Error connecting to the database!
Database name: "Provider="SQLOLEDB.1";Persist Security Info="False";Integrated Security="True";Initial Catalog="ORM";Data Source=".\SQLEXPRESS""
Class: EOleException
Message: Multiple-step OLE DB operation generated errors. Check each OLE DB status value, if available. No work was done
Source: Provider
HelpFile:

---------------------------
OK
---------------------------

---------------------------
Error
---------------------------
Error connecting to the database!
Database name: "Provider="SQLOLEDB.1";Persist Security Info="True";Integrated Security="True";Initial Catalog="ORM";Data Source=".\SQLEXPRESS""
Class: EOleException
Message: Multiple-step OLE DB operation generated errors. Check each OLE DB status value, if available. No work was done
Source: Provider
HelpFile:

---------------------------
OK
---------------------------
*)

type
  TProviderType = (ptMsSqlServer, ptMsAccess);
  TADOConnectionStringBuilder = class
  strict private
    FProviderType: TProviderType;
    FStrings: TStrings;
  private
    procedure FromBoolean(const Key: string; const Value: Boolean);
  strict protected
    procedure AppendKeyValuePairBuilder(builder: TStringBuilder; keyName: string; keyValue: string; useOdbcRules: Boolean = False); virtual;
    function GetConnectionString: string; virtual;
    function GetDatabase: string; virtual;
    function GetDataSource: string; virtual;
    function GetInitialCatalog: string; virtual;
    function GetIntegratedSecurity: Boolean; virtual;
    function GetPassword: string; virtual;
    function GetPersistSecurityInfo: Boolean; virtual;
    function GetProvider: string; virtual;
    function GetProviderType: TProviderType; virtual;
    function GetUserId: string; virtual;
    procedure SetDatabase(const Value: string); virtual;
    procedure SetDataSource(const Value: string); virtual;
    procedure SetInitialCatalog(const Value: string); virtual;
    procedure SetIntegratedSecurity(const Value: Boolean); virtual;
    procedure SetPassword(const Value: string); virtual;
    procedure SetPersistSecurityInfo(const Value: Boolean); virtual;
    procedure SetProvider(const Value: string); virtual;
    procedure SetProviderType(const Value: TProviderType); virtual;
    procedure SetUserId(const Value: string); virtual;
    function ToBoolean(const Key: string): Boolean; virtual;
  public
    constructor Create;
    destructor Destroy; override;
    property ConnectionString: string read GetConnectionString;
    property Provider: string read GetProvider write SetProvider;
    property UserId: string read GetUserId write SetUserId;
    property Password: string read GetPassword write SetPassword;
    property DataSource: string read GetDataSource write SetDataSource;
    property Database: string read GetDatabase write SetDatabase;
    property InitialCatalog: string read GetInitialCatalog write SetInitialCatalog;
    property IntegratedSecurity: Boolean read GetIntegratedSecurity write SetIntegratedSecurity;
    property PersistSecurityInfo: Boolean read GetPersistSecurityInfo write SetPersistSecurityInfo;
    property ProviderType: TProviderType read GetProviderType write SetProviderType;
  end;

implementation

uses
  Variants, StrUtils;

const
  Provider_SQLServer_SSQLOLEDB1 = 'SQLOLEDB.1';
  Provider_Paradox_MSDASQL1 = 'MSDASQL.1';
  Provider_Access_MicrosoftJetOLEDB40 = 'Microsoft.Jet.OLEDB.4.0';
  UserID_admin = 'admin';

  SPersistSecurityInfo = 'Persist Security Info';
  SInitialCatalog = 'Initial Catalog'; // same as 'Database', see http://msdn.microsoft.com/en-us/library/system.data.sqlclient.sqlconnection.connectionstring.aspx
  SDataSource = 'Data Source';
  SPassword = 'Password';
  SUserID = 'User ID';
  SProvider = 'Provider';
  SIntegratedSecurity = 'Integrated Security';
  SIntegratedSecurity_True = 'SSPI';
  // Paradox: Provider=MSDASQL.1;Persist Security Info=False;User ID=johan;Data Source=mw-sql;Initial Catalog=MW
  // SQL-Server: Provider=SQLOLEDB.1;Password=johan;Persist Security Info=True;User ID=johan;Initial Catalog=ORM;Data Source=PC346\SQLEXPRESS
  // Access: Provider=Microsoft.Jet.OLEDB.4.0;User ID=admin;Data Source=..\Database\Data.mdb;Persist Security Info=False
  // see: http://msdn.microsoft.com/en-us/library/system.data.sqlclient.sqlconnection.connectionstring.aspx

// jpl: ACE gaat niet werken, want is niet overal geinstalleerd: http://stackoverflow.com/questions/155848/how-do-i-create-a-microsft-jet-access-database-without-an-interop-assembly
//        ADOConnection.ConnectionString := 'Provider=Microsoft.ACE.OLEDB.12.0;Data Source=..\data\ORM.mdb;Persist Security Info=False';

constructor TADOConnectionStringBuilder.Create;
begin
  inherited Create;
  FStrings := TStringList.Create();
  ProviderType := ptMsSqlServer;
  IntegratedSecurity := False;
end;

destructor TADOConnectionStringBuilder.Destroy;
begin
  inherited Destroy;
end;

procedure TADOConnectionStringBuilder.FromBoolean(const Key: string; const Value: Boolean);
begin
  FStrings.Values[Key] := BoolToStr(Value, True);
end;

function TADOConnectionStringBuilder.ToBoolean(const Key: string): Boolean;
var
  ResultString: string;
begin
  ResultString := FStrings.Values[Key];
  Result := StrToBoolDef(ResultString, False);
end;

procedure TADOConnectionStringBuilder.AppendKeyValuePairBuilder(builder: TStringBuilder; keyName: string; keyValue: string;
  useOdbcRules: Boolean = False);
const
  SConnectionStringDelimiter = ';';
  SDriverKeyName = 'Driver';
var
  keyNameIsDriver: Boolean;
  keyValueHasSemicolon: Boolean;
  keyValueContainsDoubleQuote: Boolean;
  keyValueContainsNoSingleQuote: Boolean;
  keyValueNotEmpty: Boolean;
  keyValueStartsWithBrace: Boolean;
begin
  if not Assigned(builder) then
    raise EArgumentException.Create('builder');
  if (keyName = NullAsStringValue) then
    raise EArgumentException.Create('keyName');

  //    if ((keyName = nil) or not DbConnectionOptions.ConnectionStringValidKeyRegex.IsMatch(keyName)) then
  //      raise ADP.InvalidKeyname(keyName);
  //    if ((keyValue <> nil) and not DbConnectionOptions.IsValueValidInternal(keyValue)) then
  //      raise ADP.InvalidValue(keyName);

  if ((0 < builder.Length) and (SConnectionStringDelimiter <> builder.Chars[(builder.Length - 1)])) then
    builder.Append(SConnectionStringDelimiter);

  if (useOdbcRules) then
    builder.Append(keyName)
  else
  begin
    //      builder.Append(keyName.Replace('=', '=='));
    builder.Append(StrUtils.ReplaceStr(keyName, '=', '=='));
  end;

  builder.Append('=');

  if (keyValue <> NullAsStringValue) then
  begin
    if (useOdbcRules) then
    begin
      keyValueNotEmpty := 0 < Length(keyValue);
      keyValueStartsWithBrace := keyValueNotEmpty and ('{' = keyValue[1]);
      keyValueHasSemicolon := keyValueNotEmpty and (1 <= Pos(SConnectionStringDelimiter, keyValue));
      keyNameIsDriver := keyValueNotEmpty and AnsiSameText(SDriverKeyName, keyName);
      if (((keyValueNotEmpty) and (((keyValueStartsWithBrace) or (keyValueHasSemicolon)) or (keyNameIsDriver)))
        //        and not DbConnectionOptions.ConnectionStringQuoteOdbcValueRegex.IsMatch(keyValue)
        ) then
      begin
        builder.Append('{');
        //        builder.Append(keyValue.Replace('}', '}}'));
        builder.Append(StrUtils.ReplaceStr(keyValue, '}', '}}'));
        builder.Append('}');
      end
      else
      begin
        builder.Append(keyValue)
      end;
    end
    //    else if (DbConnectionOptions.ConnectionStringQuoteValueRegex.IsMatch(keyValue)) then
    //    begin
    //      builder.Append(keyValue)
    //    end
    else
    begin
      keyValueContainsDoubleQuote := 0 <> Pos('"', keyValue);
      keyValueContainsNoSingleQuote := 0 = Pos('''', keyValue);
      if ((keyValueContainsDoubleQuote) and (keyValueContainsNoSingleQuote)) then
      begin
        builder.Append('''');
        builder.Append(keyValue);
        builder.Append('''')
      end
      else
      begin
        builder.Append('"');
        //        builder.Append(keyValue.Replace('"', '""'));
        builder.Append(StrUtils.ReplaceStr(keyValue, '"', '""'));
        builder.Append('"')
      end;
    end;
  end;
end;

function TADOConnectionStringBuilder.GetConnectionString: string;
var
  Index: Integer;
  Name: string;
  Value: string;
  StringBuilder: TStringBuilder;
begin
  Result := NullAsStringValue;
  StringBuilder := TStringBuilder.Create;
  try
    for Index := 0 to FStrings.Count - 1 do
    begin
      Name := FStrings.Names[Index];
      Value := FStrings.Values[Name];
      AppendKeyValuePairBuilder(StringBuilder, Name, Value);
    end;
    Result := StringBuilder.ToString;
  finally
    StringBuilder.Free;
  end;
end;

function TADOConnectionStringBuilder.GetProvider: string;
begin
  Result := FStrings.Values[SProvider];
end;

function TADOConnectionStringBuilder.GetUserId: string;
begin
  Result := FStrings.Values[SUserID];
end;

function TADOConnectionStringBuilder.GetPassword: string;
begin
  Result := FStrings.Values[SPassword];
end;

function TADOConnectionStringBuilder.GetDataSource: string;
begin
  Result := FStrings.Values[SDataSource];
end;

function TADOConnectionStringBuilder.GetDatabase: string;
begin
  Result := InitialCatalog;
end;

function TADOConnectionStringBuilder.GetInitialCatalog: string;
begin
  Result := FStrings.Values[SInitialCatalog];
end;

function TADOConnectionStringBuilder.GetIntegratedSecurity: Boolean;
begin
  Result := ToBoolean(SIntegratedSecurity);
end;

function TADOConnectionStringBuilder.GetPersistSecurityInfo: Boolean;
begin
  Result := ToBoolean(SPersistSecurityInfo);
end;

function TADOConnectionStringBuilder.GetProviderType: TProviderType;
begin
  Result := FProviderType;
end;

procedure TADOConnectionStringBuilder.SetProvider(const Value: string);
begin
  FStrings.Values[SProvider] := Value;
end;

procedure TADOConnectionStringBuilder.SetUserId(const Value: string);
begin
  FStrings.Values[SUserID] := Value;
end;

procedure TADOConnectionStringBuilder.SetPassword(const Value: string);
begin
  FStrings.Values[SPassword] := Value;
end;

procedure TADOConnectionStringBuilder.SetDataSource(const Value: string);
begin
  FStrings.Values[SDataSource] := Value;
end;

procedure TADOConnectionStringBuilder.SetDatabase(const Value: string);
begin
  InitialCatalog := Value;
end;

procedure TADOConnectionStringBuilder.SetInitialCatalog(const Value: string);
begin
  FStrings.Values[SInitialCatalog] := Value;
end;

procedure TADOConnectionStringBuilder.SetIntegratedSecurity(const Value: Boolean);
begin
  if Value then
    FStrings.Values[SIntegratedSecurity] := SIntegratedSecurity_True
  else
    FromBoolean(SIntegratedSecurity, Value);
end;

procedure TADOConnectionStringBuilder.SetPersistSecurityInfo(const Value: Boolean);
begin
  FromBoolean(SPersistSecurityInfo, Value);
end;

procedure TADOConnectionStringBuilder.SetProviderType(const Value: TProviderType);
begin
  FProviderType := Value;
  case Value of
    ptMsSqlServer:
      begin
        Provider := Provider_SQLServer_SSQLOLEDB1;
        PersistSecurityInfo := False;
      end;
    ptMsAccess:
      begin
        Provider := Provider_Access_MicrosoftJetOLEDB40;
        PersistSecurityInfo := False;
        UserId := UserID_admin;
      end;
  end;
end;

(*
  internal static void AppendKeyValuePairBuilder(StringBuilder builder, string keyName, string keyValue, bool useOdbcRules)
  {
  ADP.CheckArgumentNull(builder, "builder");
  ADP.CheckArgumentLength(keyName, "keyName");
  if ((keyName == null) || !ConnectionStringValidKeyRegex.IsMatch(keyName))
  {
  throw ADP.InvalidKeyname(keyName);
  }
  if ((keyValue != null) && !IsValueValidInternal(keyValue))
  {
  throw ADP.InvalidValue(keyName);
  }
  if ((0 < builder.Length) && (';' != builder[builder.Length - 1]))
  {
  builder.Append(";");
  }
  if (useOdbcRules)
  {
  builder.Append(keyName);
  }
  else
  {
  builder.Append(keyName.Replace("=", "=="));
  }
  builder.Append("=");
  if (keyValue != null)
  {
  if (useOdbcRules)
  {
  if (((0 < keyValue.Length) && ((('{' == keyValue[0]) || (0 <= keyValue.IndexOf(';'))) || (string.Compare("Driver", keyName, StringComparison.OrdinalIgnoreCase) == 0))) && !ConnectionStringQuoteOdbcValueRegex.IsMatch(keyValue))
  {
  builder.Append('{').Append(keyValue.Replace("}", "}}")).Append('}');
  }
  else
  {
  builder.Append(keyValue);
  }
  }
  else if (ConnectionStringQuoteValueRegex.IsMatch(keyValue))
  {
  builder.Append(keyValue);
  }
  else if ((-1 != keyValue.IndexOf('"')) && (-1 == keyValue.IndexOf('\'')))
  {
  builder.Append('\'');
  builder.Append(keyValue);
  builder.Append('\'');
  }
  else
  {
  builder.Append('"');
  builder.Append(keyValue.Replace("\"", "\"\""));
  builder.Append('"');
  }
  }
  }
  *)
end.
