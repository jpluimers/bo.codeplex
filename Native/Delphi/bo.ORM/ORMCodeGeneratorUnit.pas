unit ORMCodeGeneratorUnit;

interface

uses
  Classes, SysUtils, Generics.Collections,
  ReporterUnit, CodeGeneratorUnit,
  StringListWrapperUnit, LoggerUnit,
  MSSystemColumnUnit, MSSystemTableUnit;

type
  TSysColumnHelper = class(TComponent)
  strict private
    function SysColumnColTypeLoByte(const MSSystemColumn: TMSSystemColumn): Byte;
  strict protected
    function SysColumnAsDelphiTypeName(const MSSystemColumn: TMSSystemColumn): string; virtual;
    function SysColumnIsIdColumnOf(const MSSystemColumn: TMSSystemColumn; const MSSystemTable: TMSSystemTable): Boolean; virtual;
    function SysColumnAsTFieldClassName(const MSSystemColumn: TMSSystemColumn): string; virtual;
    function SysColumnAsTNullableTypeName(const MSSystemColumn: TMSSystemColumn): string; virtual;
    //1 Required
    function SysColumnIsRequired(const MSSystemColumn: TMSSystemColumn): Boolean; virtual;
  end;

  TJoinReferenceRecord = record
    SourceSysTable: TMSSystemTable;
    SourceSysColumn: TMSSystemColumn;
    ReferenceSysTable: TMSSystemTable;
    ReferenceSysColumn: TMSSystemColumn;
  end;

  TQualifiedColumnRecord = record
    MSSystemTable: TMSSystemTable;
    MSSystemColumn: TMSSystemColumn;
  end;

  TListOfJoinReferenceRecord = TList<TJoinReferenceRecord>;
  TListOfQualifiedColumnRecord = TList<TQualifiedColumnRecord>;

  TEntityStructure = class(TSysColumnHelper)
  strict private
    FFirstTableName: string;
    FJoinReferenceRecords: TListOfJoinReferenceRecord;
    FAllQualifiedColumnRecords: TListOfQualifiedColumnRecord;
    FFirstTableQualifiedColumnRecords: TListOfQualifiedColumnRecord;
    FLogger: TLogger;
    FMSSystemTables: TMSSystemTables;
  strict protected
    procedure AddQualifiedColumnRecord(const ListOfQualifiedColumnRecord: TListOfQualifiedColumnRecord; const MSSystemTable: TMSSystemTable; const MSSystemColumn:
        TMSSystemColumn); virtual;
    procedure AddQualifiedColumnRecords(const ListOfQualifiedColumnRecord: TListOfQualifiedColumnRecord; const ReferenceSysTable: TMSSystemTable); virtual;
    function CreateAndFillListOfQualifiedColumnRecords(const IncludeJoinedTables: Boolean): TListOfQualifiedColumnRecord; virtual;
    procedure FillJoinTables(const SourceSysTable: TMSSystemTable; const JoinReferenceRecords: TListOfJoinReferenceRecord); virtual;
    function GetFirstSysTable: TMSSystemTable; virtual;
    function GetJoinReferenceRecords: TListOfJoinReferenceRecord;
    function GetAllQualifiedColumnRecords: TListOfQualifiedColumnRecord;
    function GetFirstTableQualifiedColumnRecords: TListOfQualifiedColumnRecord;
    property FirstSysTable: TMSSystemTable read GetFirstSysTable;
    property FirstTableName: string read FFirstTableName;
    property JoinReferenceRecords: TListOfJoinReferenceRecord read GetJoinReferenceRecords;
    property AllQualifiedColumnRecords: TListOfQualifiedColumnRecord read GetAllQualifiedColumnRecords;
    property FirstTableQualifiedColumnRecords: TListOfQualifiedColumnRecord read GetFirstTableQualifiedColumnRecords;
    property Logger: TLogger read FLogger;
    property MSSystemTables: TMSSystemTables read FMSSystemTables;
  public
    constructor Create(const Owner: TComponent; const MSSystemTables: TMSSystemTables; const FirstTableName: string; const Logger:
        TLogger); reintroduce;
    destructor Destroy; override;
    function GetChangedColumnName(const ColumnName: string): string;
    function GetFieldColumnName(const ColumnName: string): string;
  end;

  TUnitType = (utBase, utActual { , utForm } );

  TORMCodeGenerator = class(TEntityStructure)
  strict private
    FAsString: string;
    FUnitType: TUnitType;
  strict protected
    procedure AddQualifiedColumnToSelect(const ColumnsStringBuilder: TStringBuilder; const TableName, ColumnName: string); virtual;
    procedure AppendTrailingCommaInSqlStatementLineInSourceCode(const ColumnsStringBuilder: TStringBuilder); virtual;
    procedure Generate; virtual;
    procedure GenerateActual(const MemberListName: string; const TheUnit: TGeneratableUnit); virtual;
    procedure GenerateBase(const MemberListName: string; const TheUnit: TGeneratableUnit); virtual;
    function GenerateFieldName(const CurrentColumnName: string): string; virtual;
    procedure GenerateSelectStatement(const MethodBodyText: IStringListWrapper); virtual;
    function GenerateTableName(const TableName: string): string; virtual;
    function GenerateTheActualClass(const MemberName, MemberListName: string; const TheUnit: TGeneratableUnit): TGeneratableClass; virtual;
    function GenerateTheActualEnumeratorClass(const MemberName: string; const TheUnit: TGeneratableUnit; const TheActualClass: TGeneratableClass):
        TGeneratableClass; virtual;
    function GenerateTheActualListClass(const MemberName, MemberListName: string; const TheUnit: TGeneratableUnit; const TheActualEnumeratorClass,
        TheActualClass: TGeneratableClass): TGeneratableClass; virtual;
    function GenerateTheBaseClass(const MemberName, MemberListName: string; const TheUnit: TGeneratableUnit): TGeneratableClass; virtual;
    function GenerateTheBaseClientDataSetClass(const MemberName, MemberListName: string; const TheUnit: TGeneratableUnit; const TheBaseClass:
        TGeneratableClass): TGeneratableClass; virtual;
    function GenerateTheBaseEnumeratorClass(const MemberName: string; const TheUnit: TGeneratableUnit; const TheBaseClass: TGeneratableClass):
        TGeneratableClass; virtual;
    function GenerateTheBaseListClass(const MemberName, MemberListName: string; const TheBaseClientDataSetClass, TheBaseEnumeratorClass:
        TGeneratableClass; const TheUnit: TGeneratableUnit): TGeneratableClass; virtual;
    procedure GenerateTheBasesClassQueryMethods(const TheBaseListClass: TGeneratableClass; const MemberName: string); virtual;
    function GetMemberName: string; virtual;
    procedure RunForEachColumnNameInSysTableAndAppendCommasWhereNeeded(const MSSystemTable: TMSSystemTable; const ColumnsStringBuilder: TStringBuilder; const Proc:
        TProc<string>; const SkipIdColums: Boolean = False); virtual;
  public
    constructor Create(const Owner: TComponent; const SysTables: TMSSystemTables; const TableName: string; const UnitType:
        TUnitType; const Logger: TLogger);
    function FileBaseName: string; virtual;
    function FileName: string; virtual;
    function ToString: string; override;
    property AsString: string read FAsString;
    property MemberName: string read GetMemberName;
    property UnitType: TUnitType read FUnitType;
  end;

implementation

uses
  Variants, StrUtils, TypInfo, Windows, FieldNameHelperUnit, SqlConstsUnit, StringUtilsUnit;

constructor TORMCodeGenerator.Create(const Owner: TComponent; const SysTables: TMSSystemTables; const TableName:
    string; const UnitType: TUnitType; const Logger: TLogger);
begin
  inherited Create(Owner, SysTables, TableName, Logger);
  Self.FUnitType := UnitType;
end;

procedure TORMCodeGenerator.AddQualifiedColumnToSelect(const ColumnsStringBuilder: TStringBuilder; const TableName, ColumnName: string);
begin
  ColumnsStringBuilder.AppendFormat('  ''  %s.%s', [TableName, ColumnName]);
end;

procedure TORMCodeGenerator.AppendTrailingCommaInSqlStatementLineInSourceCode(const ColumnsStringBuilder: TStringBuilder);
begin
  ColumnsStringBuilder.AppendLine(', '' +');
end;

function TORMCodeGenerator.FileBaseName: string;
begin
  case Self.UnitType of
    utBase:
      Result := Format('%sBaseUnit', [MemberName]);
    utActual:
      Result := Format('%sUnit', [MemberName]);
  else
    Result := Format('%sFormUnit', [MemberName]);
  end;
end;

function TORMCodeGenerator.FileName: string;
begin
  Result := Format('%s.pas', [FileBaseName]);
end;

procedure TORMCodeGenerator.Generate;
var
  TheUnitInterfaceComponentReference: IInterfaceComponentReference;
  TheUnit: TGeneratableUnit;
  MemberListName: string;
begin
  TheUnit := TGeneratableUnit.Create(nil, FileBaseName);
  TheUnitInterfaceComponentReference := TheUnit;

  MemberListName := Format('%sList', [MemberName]);
  //jpl: 20100101 doen we niet meer: algoritme voor nederlandse meervouden, bijvoorbeeld met deze regelset: http://www.dutchgrammar.com/nl/?n=NounsAndArticles.11

  case Self.UnitType of
    utBase:
      GenerateBase(MemberListName, TheUnit);
    utActual:
      GenerateActual(MemberListName, TheUnit);
  end;

  FAsString := TheUnit.ToString;
end;

procedure TORMCodeGenerator.GenerateActual(const MemberListName: string; const TheUnit: TGeneratableUnit);
var
  TheActualClass: TGeneratableClass;
  TheActualEnumeratorClass: TGeneratableClass;
  TheActualListClass: TGeneratableClass;
begin
  TheActualClass := GenerateTheActualClass(MemberName, MemberListName, TheUnit);
  TheActualEnumeratorClass := GenerateTheActualEnumeratorClass(MemberName, TheUnit, TheActualClass);
  TheActualListClass := GenerateTheActualListClass(MemberName, MemberListName, TheUnit, TheActualEnumeratorClass, TheActualClass);
end;

procedure TORMCodeGenerator.GenerateBase(const MemberListName: string; const TheUnit: TGeneratableUnit);
var
  ColumnName: string;
  TheBaseClass: TGeneratableClass;
  TheBaseEnumeratorClass: TGeneratableClass;
  TheBaseClientDataSetClass: TGeneratableClass;
  TheBaseListClass: TGeneratableClass;
  QualifiedColumnRecord: TQualifiedColumnRecord;
  Y: Integer;
  T: Integer;
begin
  TheBaseClass := GenerateTheBaseClass(MemberName, MemberListName, TheUnit);
  TheBaseClientDataSetClass := GenerateTheBaseClientDataSetClass(MemberName, MemberListName, TheUnit, TheBaseClass);
  TheBaseEnumeratorClass := GenerateTheBaseEnumeratorClass(MemberName, TheUnit, TheBaseClass);
  TheBaseListClass := GenerateTheBaseListClass(MemberName, MemberListName, TheBaseClientDataSetClass, TheBaseEnumeratorClass, TheUnit);
  Y := 8;
  T := 0;
  for QualifiedColumnRecord in AllQualifiedColumnRecords do
  begin
    ColumnName := QualifiedColumnRecord.MSSystemColumn.ToString();
    TheUnit.FinalImplementationComments.Add(Format('object %sDbDisplayLabel: TDbDisplayLabel', [ColumnName]));
    TheUnit.FinalImplementationComments.Add(Format('  Left = 13', []));
    TheUnit.FinalImplementationComments.Add(Format('  Top = %d', [Y]));
    TheUnit.FinalImplementationComments.Add(Format('  Width = 165', []));
    TheUnit.FinalImplementationComments.Add(Format('  Height = 17', []));
    TheUnit.FinalImplementationComments.Add(Format('  FocusControl = %sDbEdit', [ColumnName]));
    TheUnit.FinalImplementationComments.Add(Format('end', []));
    TheUnit.FinalImplementationComments.Add(Format('object %sDbEdit: TDBEdit', [ColumnName]));
    TheUnit.FinalImplementationComments.Add(Format('  Left = 10', []));
    TheUnit.FinalImplementationComments.Add(Format('  Top = %d', [Y+14]));
    TheUnit.FinalImplementationComments.Add(Format('  Width = 221', []));
    TheUnit.FinalImplementationComments.Add(Format('  Height = 21', []));
    TheUnit.FinalImplementationComments.Add(Format('  TabOrder = %d', [T]));
    TheUnit.FinalImplementationComments.Add(Format('end', []));
    Inc(T);
    Inc(Y, 42);
{
object GebruikersnaamDbDisplayLabel: TDbDisplayLabel
  Left = 10
  Top = 8
  Width = 165
  Height = 17
  FocusControl = GebruikersnaamDbEdit
end
object GebruikersnaamDbEdit: TDBEdit
  Left = 10
  Top = 22
  Width = 221
  Height = 21
  TabOrder = 0
end
object WachtwoordDbDisplayLabel: TDbDisplayLabel
  Left = 10
  Top = 50
  Width = 165
  Height = 17
end
object WachtwoordDbEdit: TDBEdit
  Left = 10
  Top = 64
  Width = 221
  Height = 21
  TabOrder = 1
end
}
  end;
  TheUnit.FinalImplementationComments.Add('');

  TheUnit.FinalImplementationComments.Add(Format('procedure T%sWijzigenForm.Set%s(const Value: T%s);', [MemberName, MemberName, MemberName]));
  TheUnit.FinalImplementationComments.Add('var');
  TheUnit.FinalImplementationComments.Add(Format('  %s: T%s;', [MemberListName, MemberListName]));
  TheUnit.FinalImplementationComments.Add('begin');
  TheUnit.FinalImplementationComments.Add('  if Assigned(Value) then');
  TheUnit.FinalImplementationComments.Add('  begin');
  TheUnit.FinalImplementationComments.Add(Format('    %s:= Value.%s;', [MemberListName, MemberListName]));
  for QualifiedColumnRecord in AllQualifiedColumnRecords do
  begin
    ColumnName := QualifiedColumnRecord.MSSystemColumn.ToString();
    TheUnit.FinalImplementationComments.Add(Format('    AssignDataField(Self.%sDbDisplayLabel, Self.%sDbEdit, %s.%sField);',
      [ColumnName, ColumnName, MemberListName, ColumnName]));
  end;
  TheUnit.FinalImplementationComments.Add(Format('    F%s := Value;', [MemberName]));
  TheUnit.FinalImplementationComments.Add(Format('    DataSource.DataSet := %s;', [MemberListName]));
  TheUnit.FinalImplementationComments.Add('  end');
  TheUnit.FinalImplementationComments.Add('  else');
  TheUnit.FinalImplementationComments.Add('    DataSource.DataSet := nil;');
  TheUnit.FinalImplementationComments.Add('end;');
{
procedure TGebruikerWijzigenForm.SetGebruiker(const Value: TGebruiker);
var
  GebruikerList: TGebruikerList;
begin
  FGebruiker := Value;
  if Assigned(Value) then
  begin
    GebruikerList := Value.GebruikerList;
    AssignDataField(Self.GebruikersnaamDbDisplayLabel, Self.GebruikersnaamDbEdit, GebruikerList.GebruikersnaamField);
    AssignDataField(Self.WachtwoordDbDisplayLabel, Self.WachtwoordDbEdit, GebruikerList.WachtwoordHashField);
    AssignDataField(Self.StartDatumDbDisplayLabel, Self.StartDatumDbEdit, GebruikerList.StartdatumField);
    AssignDataField(Self.EindDatumDbDisplayLabel, Self.EindDatumDbEdit, GebruikerList.EindDatumField);
    AssignDataField(Self.OpmerkingDbDisplayLabel, Self.OpmerkingDBEdit, GebruikerList.OpmerkingField);
//    Self.OpmerkingDBEdit.DataField := GebruikerList.
    DataSource.DataSet := GebruikerList;
  end
  else
    DataSource.DataSet := nil;
end;
}
end;

procedure TORMCodeGenerator.GenerateSelectStatement(const MethodBodyText: IStringListWrapper);
var
  ColumnsStringBuilder: TStringBuilder;
  JoinsStringBuilder: TStringBuilder;
  JoinReferenceRecord: TJoinReferenceRecord;
  ReferenceSysTable: TMSSystemTable;
  ReferenceTableName: string;
  QualifiedColumnRecord: TQualifiedColumnRecord;
  IsFirstColumn: Boolean;
  OpeningParentheses: string;
begin
  // dit was heel simpel:
  //  TheMethod.BodyText.Add(Format('  ReadQuery.SQL.Add(''SELECT * FROM %s'');', [MemberName]));
  // 20100107: nu is het ietsje ingewikkelder:
  //  ReadQuery.SQL.Add('SELECT ' +
  //  '  Gebruiker.ID_Gebruiker, ' +
  //  '  Gebruiker.EID_NatuurlijkPersoon, ' +
  //  '  Gebruiker.Gebruikersnaam, ' +
  //  '  Gebruiker.WachtwoordHash, ' +
  //  '  Gebruiker.Startdatum, ' +
  //  '  Gebruiker.EindDatum, ' +
  //  '  Gebruiker.Opmerking ' +
  //  'FROM Gebruiker');
  // 2010108 maar het wordt nog veel ingewikkelder:
  //SELECT
  //  Client.ID_Client,
  //  Client.EID_NatuurlijkPersoon,
  //  Client.ID_FamilieContactPersoon,
  //  Client.ID_FinancieelContactPersoon,
  //  Client.ID_VerblijfsinstellingRechtsPersoon,
  //  Client.ID_VerblijfsinstellingContactPersoon,
  //--  NatuurlijkPersoon.ID_NatuurlijkPersoon,
  //  NatuurlijkPersoon.EID_Entiteit,
  //  NatuurlijkPersoon.GeslachtsCode,
  //  NatuurlijkPersoon.Roepnaam,
  //  NatuurlijkPersoon.Voornamen,
  //  NatuurlijkPersoon.GeboorteDatum,
  //  NatuurlijkPersoon.GeboortePlaatsNaam,
  //  NatuurlijkPersoon.Voorletters,
  //  NatuurlijkPersoon.TussenVoegsel,
  //  NatuurlijkPersoon.Achternaam,
  //  NatuurlijkPersoon.PartnerTussenVoegsel,
  //  NatuurlijkPersoon.PartnerAchternaam,
  //  NatuurlijkPersoon.BSN,
  //--  Entiteit.ID_Entiteit,
  //  Entiteit.ID_GebruikerInvoer,
  //  Entiteit.TimeStampInvoer,
  //  Entiteit.ID_GebruikerLaatsteWijziging,
  //  Entiteit.TimeStampLaatsteWijziging,
  //  Entiteit.ExternNummer
  //FROM
  //  Client
  //LEFT JOIN
  //  NatuurlijkPersoon
  //ON
  //  NatuurlijkPersoon.ID_NatuurlijkPersoon = Client.EID_NatuurlijkPersoon
  //LEFT JOIN
  //  Entiteit
  //ON
  //  Entiteit.ID_Entiteit = NatuurlijkPersoon.EID_Entiteit

  ColumnsStringBuilder := TStringBuilder.Create;
  try
    JoinsStringBuilder := TStringBuilder.Create;
    try
      // columns
      IsFirstColumn := True;
      for QualifiedColumnRecord in AllQualifiedColumnRecords do
      begin
        if not IsFirstColumn then
          AppendTrailingCommaInSqlStatementLineInSourceCode(ColumnsStringBuilder);
        AddQualifiedColumnToSelect(ColumnsStringBuilder, QualifiedColumnRecord.MSSystemTable.ToString(), QualifiedColumnRecord.MSSystemColumn.ToString());
        IsFirstColumn := False;
      end;
      // first table
      OpeningParentheses := DupeString('(', JoinReferenceRecords.Count); // jpl: Access compatible - one opening parenthesis ( for each JOIN
      JoinsStringBuilder.AppendFormat('  ''   FROM %s %s ''', [OpeningParentheses, FirstTableName]); // jpl: meerdere spaties voor de FROM want makkelijker zoeken in de SQL
      // subsequent tables
      for JoinReferenceRecord in JoinReferenceRecords do
      begin
        ReferenceSysTable := JoinReferenceRecord.ReferenceSysTable;
        ReferenceTableName := ReferenceSysTable.ToString();
        if not SameStr(ReferenceTableName, FirstTableName) then
        begin
          JoinsStringBuilder.AppendLine(' +');
          // jpl: meerdere spaties voor de LEFT want makkelijker zoeken in de SQL
          JoinsStringBuilder.AppendFormat('  ''   LEFT JOIN %s ON %s.%s = %s.%s) ''', [ // jpl: Access compatible - closing parenthesis )
            ReferenceTableName,
            ReferenceTableName, JoinReferenceRecord.ReferenceSysColumn.ToString(),
            JoinReferenceRecord.SourceSysTable.ToString(), JoinReferenceRecord.SourceSysColumn.ToString()]);
        end;
      end;
      // final strings
      ColumnsStringBuilder.Append(' '' +');
      JoinsStringBuilder.Append(' +');
      JoinsStringBuilder.AppendLine();
      JoinsStringBuilder.AppendFormat('  ''%s ''', [DefaultWhereClause]);
      JoinsStringBuilder.AppendLine();
      JoinsStringBuilder.Append('  );');

      MethodBodyText.Add('  ReadQuery.SQL.Add(''   SELECT '' +'); // jpl: meerdere spaties voor de SELECT want makkelijker zoeken in de SQL
      MethodBodyText.Add(ColumnsStringBuilder.ToString);
      MethodBodyText.Add(JoinsStringBuilder.ToString);
    finally
      JoinsStringBuilder.Free;
    end;
  finally
    ColumnsStringBuilder.Free;
  end;
end;

function TORMCodeGenerator.GenerateTheActualClass(const MemberName, MemberListName: string; const TheUnit: TGeneratableUnit): TGeneratableClass;
var
  TheActualClass: TGeneratableClass;
  MembersNameClass: string;
  MSSystemColumn: TMSSystemColumn;
  TheMethod: TGeneratableMethod;
  TheProperty: TGeneratableProperty;
  CurrentColumnName: string;
  GetMembersName: string;
  GetMethodName: string;
  SetMethodName: string;
  NullableTypeName: string;
begin
  TheActualClass := TGeneratableClass.Create(TheUnit, Format('T%s', [MemberName]), Format('T%sBase', [MemberName]), True);
  //  TGebruiker = class(TGebruikerBase)
  TheActualClass.InterfaceUnits.Add('ORMEntityUnit');
  TheActualClass.InterfaceUnits.Add(Format('%sBaseUnit', [MemberName]));
  TheActualClass.InterfaceUnits.Add('NullablesUnit');
  TheActualClass.InterfaceUnits.Add('Classes');

  MembersNameClass := Format('T%s', [MemberListName]);
  GetMembersName := Format('Get%s', [MemberListName]);

  { --> dit stuk lijkt als twee druppens water op het 1e stuk van GenerateTheBaseClass }
  TheMethod := TGeneratableMethod.Create(TheActualClass, GetMembersName, vStrictProtected, bkVirtual);
  TheMethod.ReturnType := MembersNameClass;
  //  strict protected
  //    function GetGebruikers: TGebruikers; virtual;
  TheMethod.BodyText.Add(Format('  Result := EntityList as %s;', [MembersNameClass]));
  //function TGebruiker.GetGebruikers: TGebruikers;
  //begin
  //  Result := EntityList as TGebruikers;
  //end;

  TheProperty := TGeneratableProperty.Create(TheActualClass, MemberListName, MembersNameClass, vPublic);
  TheProperty.ReadMember := GetMembersName;
  //  strict protected
  //    property Gebruikers: TGebruikers read GetGebruikers;

  TheMethod := TGeneratableMethod.Create(TheActualClass, 'GetEntityListClass', vStrictProtected, bkOverride);
  TheMethod.ReturnType := 'TEntityListClass';
  TheMethod.BodyText.Add(Format('  Result := %s;', [MembersNameClass]));
  //  strict protected
  //    function GetEntityListClass: TEntityListClass; override;
  //function TGebruikerBase.GetEntityListClass: TEntityListClass;
  //begin
  //  Result := TGebruikers;
  //end;
  { dit stuk lijkt als twee druppens water op het 1e stuk van GenerateTheBaseClass <-- }

  TheMethod := TGeneratableMethod.Create(TheActualClass, 'Destroy', vPublic, bkOverride);
  TheMethod.MethodKind := mkDestructor;
  //  public
  //    destructor Destroy; override;
  TheMethod.BodyText.Add('  inherited Destroy;');
  //destructor TGebruiker.Destroy;
  //begin
  //  inherited Destroy;
  //end;

  Result := TheActualClass;
end;

function TORMCodeGenerator.GenerateTheActualEnumeratorClass(const MemberName: string; const TheUnit: TGeneratableUnit;
  const TheActualClass: TGeneratableClass): TGeneratableClass;
var
  TheProperty: TGeneratableProperty;
  TheActualEnumeratorClass: TGeneratableClass;
  TheMethod: TGeneratableMethod;
begin
  TheActualEnumeratorClass := TGeneratableClass.Create(TheUnit, Format('T%sEnumerator', [MemberName]), Format('T%sBaseEnumerator', [MemberName]));
  TheMethod := TGeneratableMethod.Create(TheActualEnumeratorClass, 'GetCurrent', vPublic);
  TheMethod.ReturnType := TheActualClass.MemberName;

  TheMethod.LocalVars.Add('Value', Format('T%sBase', [MemberName]));

  TheMethod.BodyText.Add('  Value := inherited Current;');
  TheMethod.BodyText.Add(Format('  Result := Value as %s;', [TheActualClass.MemberName]));
  //  TGebruikersBaseEnumerator = class(TEntityListEnumerator)
  //  public
  //    function GetCurrent(): TGebruiker;
  //    property Current: TGebruiker read GetCurrent;
  //  end;
  //function TGebruikersBaseEnumerator.GetCurrent(): TGebruiker;
  //var
  //  Value: TGebruikerBase;
  //begin
  //  Value := inherited Current;
  //  Result := Value as TGebruikerBase;
  //end;
  TheProperty := TGeneratableProperty.Create(TheActualEnumeratorClass, 'Current', TheActualClass.MemberName, vPublic);
  TheProperty.ReadMember := TheMethod.MemberName;

  Result := TheActualEnumeratorClass;
end;

function TORMCodeGenerator.GenerateTheActualListClass(const MemberName, MemberListName: string; const TheUnit: TGeneratableUnit;
  const TheActualEnumeratorClass, TheActualClass: TGeneratableClass): TGeneratableClass;
var
  TheActualListClass: TGeneratableClass;
  TheMethod: TGeneratableMethod;
  TheProperty: TGeneratableProperty;
begin
  TheActualListClass := TGeneratableClass.Create(
    TheUnit, Format('T%s', [MemberListName]), Format('T%sBase', [MemberListName]), True);
  TheActualListClass.ImplementationUnits.Add('SysUtils');
  //  TGebruikers = class(TGebruikersBase)

  TheMethod := TGeneratableMethod.Create(TheActualListClass, 'GetData', vStrictProtected, bkOverride);
  TheMethod.ReturnType := 'Integer';
  //  strict protected
  //    function GetData: Integer; overload; override;
  TheMethod.BodyText.Add('  Result := inherited GetData();');
  TheMethod.BodyText.Add('  HideIDColumns();');
  //function TGebruikers.GetData: Integer;
  //begin
  //  Result := inherited GetData();
  //  HideIDColumns();
  //end;

  TheMethod := TGeneratableMethod.Create(TheActualListClass, 'GetEntityClass', vStrictProtected, bkOverride);
  TheMethod.ReturnType := 'TEntityClass';
  //  strict protected
  //    function GetEntityClass: TEntityClass; override;
  TheMethod.BodyText.Add(Format('  Result := %s;', [TheActualClass.MemberName]));
  //function TGebruikers.GetEntityClass: TEntityClass;
  //begin
  //  Result := TGebruiker;
  //end;

  //  public
  //    function GetEnumerator: TGebruikersEnumerator;
  TheMethod := TGeneratableMethod.Create(TheActualListClass, 'GetEnumerator', vPublic);
  TheMethod.ReturnType := TheActualEnumeratorClass.MemberName;
  TheMethod.BodyText.Add(Format('  Result := %s.Create(Self);', [TheActualEnumeratorClass.MemberName]));
  Result := TheActualListClass;

//  strict protected
//    function GetById(ID: TNullableInteger): TGebruiker; virtual;
  TheMethod := TGeneratableMethod.Create(TheActualListClass, 'GetById', vStrictProtected);
  TheMethod.ReturnType := TheActualClass.MemberName;
  TheMethod.Parameters := 'ID: TNullableInteger'; //jpl: mag geen CONST parameter zijn, want dat slikt de Delphi compiler niet bij de property
  TheMethod.BodyText.Add(Format('  Result := GetEntityById(ID) as %s;', [TheActualClass.MemberName]));
//  Result := GetEntityById(ID) as TGebruiker;
  Result := TheActualListClass;

//  public
//    property ById[ID: TNullableInteger]: TGebruiker read GetById;
  TheProperty := TGeneratableProperty.Create(TheActualListClass, 'ById[ID: TNullableInteger]', TheActualClass.MemberName, vPublic);
  TheProperty.ReadMember := TheMethod.MemberName;

//  strict private
//    function GetCurrent: TGebruiker;
  TheMethod := TGeneratableMethod.Create(TheActualListClass, 'GetCurrent', vStrictPrivate); //jpl: 20100204 - non-virtual; strict private
  TheMethod.ReturnType := TheActualClass.MemberName;
  TheMethod.BodyText.Add(Format('  Result := CurrentEntity as %s;', [TheActualClass.MemberName]));
//  Result := CurrentEntity as TGebruiker;
  Result := TheActualListClass;

//  public
//    property Current: TGebruiker read GetCurrent;
  TheProperty := TGeneratableProperty.Create(TheActualListClass, 'Current', TheActualClass.MemberName, vPublic);
  TheProperty.ReadMember := TheMethod.MemberName;
end;

function TORMCodeGenerator.GenerateTheBaseClass(const MemberName, MemberListName: string; const TheUnit: TGeneratableUnit): TGeneratableClass;
var
  JoinReferenceRecord: TJoinReferenceRecord;
  JoinedTableName: string;
  TheBaseClassAncestorName: string;
  TheBaseClass: TGeneratableClass;
  MembersNameClass: string;
  MSSystemColumn: TMSSystemColumn;
  TheMethod: TGeneratableMethod;
  TheProperty: TGeneratableProperty;
  CurrentColumnName: string;
  GetMembersName: string;
  GetMethodName: string;
  SetMethodName: string;
  NullableTypeName: string;
  QualifiedColumnRecord: TQualifiedColumnRecord;
begin
  if JoinReferenceRecords.Count > 0 then
  begin
    JoinReferenceRecord := JoinReferenceRecords.First;
    JoinedTableName := JoinReferenceRecord.ReferenceSysTable.ToString();
    TheBaseClassAncestorName := Format('T%s', [JoinedTableName]);
  end
  else
  begin
    TheBaseClassAncestorName := 'TEntity';
  end;

  TheBaseClass := TGeneratableClass.Create(TheUnit, Format('T%sBase', [MemberName]), TheBaseClassAncestorName, True);
  TheBaseClass.InterfaceUnits.Add('MSConnectionLayerUnit');
  TheBaseClass.InterfaceUnits.Add('SysUtils');
  TheBaseClass.InterfaceUnits.Add('ORMEntityUnit');
  TheBaseClass.InterfaceUnits.Add('DataSetEnumeratorUnit');
  TheBaseClass.InterfaceUnits.Add('NullablesUnit');
  TheBaseClass.InterfaceUnits.Add('db');
  TheBaseClass.InterfaceUnits.Add('ADODB');

  MembersNameClass := Format('T%sBase', [MemberListName]);
  GetMembersName := Format('Get%sBase', [MemberListName]);

  TheMethod := TGeneratableMethod.Create(TheBaseClass, GetMembersName, vStrictProtected, bkVirtual);
  TheMethod.ReturnType := MembersNameClass;
  TheMethod.BodyText.Add(Format('  Result := EntityList as %s;', [MembersNameClass]));
  //  strict protected
  //    function GetGebruikersBase: TGebruikersBase; virtual;

  TheProperty := TGeneratableProperty.Create(TheBaseClass, MemberListName, MembersNameClass, vStrictProtected);
  TheProperty.ReadMember := GetMembersName;
  //  strict protected
  //    property GebruikersBase: TGebruikersBase read GetGebruikersBase;
  //function TGebruikerBase.GetGebruikersBase: TGebruikersBase;
  //begin
  //  Result := EntityList as TGebruikersBase;
  //end;

  TheMethod := TGeneratableMethod.Create(TheBaseClass, 'GetEntityListClass', vStrictProtected, bkOverride);
  TheMethod.ReturnType := 'TEntityListClass';
  TheMethod.BodyText.Add(Format('  Result := %s;', [MembersNameClass]));
  //  strict protected
  //    function GetEntityListClass: TEntityListClass; override;
  //function TGebruikerBase.GetEntityListClass: TEntityListClass;
  //begin
  //  Result := TGebruikersBase;
  //end;

  for QualifiedColumnRecord in FirstTableQualifiedColumnRecords do
  begin
    MSSystemColumn := QualifiedColumnRecord.MSSystemColumn;
    CurrentColumnName := MSSystemColumn.ToString();

    NullableTypeName := SysColumnAsTNullableTypeName(MSSystemColumn);
    GetMethodName := Format('Get%s', [CurrentColumnName]);
    SetMethodName := Format('Set%s', [CurrentColumnName]);

    //  strict protected
    //    function GetEindDatum: TNullableDateTime; virtual;
    TheMethod := TGeneratableMethod.Create(TheBaseClass, GetMethodName, vStrictProtected, bkVirtual);
    TheMethod.ReturnType := NullableTypeName;
    //jpl: "Value" tussenresultaat is nodig omdat je in de "anonymous method" geen Result mag gebruiken
    TheMethod.LocalVars.Add('Value', NullableTypeName);
    TheMethod.BodyText.Add('  ExecuteAtDictionaryID(');
    TheMethod.BodyText.Add('  procedure');
    TheMethod.BodyText.Add('  begin');
    TheMethod.BodyText.Add(Format('    Value := %s.%s;', [MemberListName, CurrentColumnName]));
    TheMethod.BodyText.Add('  end');
    TheMethod.BodyText.Add('  );');
    TheMethod.BodyText.Add('  Result := Value;');
    //function TGebruikerBase.GetEindDatum: TNullableDateTime;
    //var
    //  Value: TNullableDateTime;
    //begin
    //  ExecuteAtDictionaryID(
    //  procedure
    //  begin
    //    Value := GebruikersBase.EindDatum;
    //  end
    //  );
    //  Result := Value;
    //end;

    //  strict protected
    //    procedure SetEindDatum(const Value: TNullableDateTime); virtual;

    TheMethod := TGeneratableMethod.Create(TheBaseClass, SetMethodName, vStrictProtected, bkVirtual);
    TheMethod.Parameters := Format('const Value: %s', [SysColumnAsTNullableTypeName(MSSystemColumn)]);
    //jpl: de "Value" parameter mag niet in de context van anonymous method gebruikt worden, want dan can er geen volledige capture genomen worden
    TheMethod.LocalVars.Add('NewValue', NullableTypeName);
    TheMethod.BodyText.Add('  NewValue := Value;');
    TheMethod.BodyText.Add('  ExecuteAtBookmarkInEditMode(');
    TheMethod.BodyText.Add('    procedure');
    TheMethod.BodyText.Add('    begin');
    TheMethod.BodyText.Add(Format('      %s.%s := NewValue;', [MemberListName, CurrentColumnName]));
    TheMethod.BodyText.Add('    end');
    TheMethod.BodyText.Add('  );');
    //procedure TGebruikerBase.SetEindDatum(const Value: TNullableDateTime);
    //var
    //  NewValue: TNullableDateTime;
    //begin
    //  NewValue := Value; //jpl: de "Value" parameter mag niet in de context van anonymous method gebruikt worden, want dan can er geen volledige capture genomen worden
    //  ExecuteAtBookmarkInEditMode(
    //    procedure
    //    begin
    //      GebruikersBase.EindDatum := NewValue;
    //    end
    //  );
    //end;

    //  public
    //    property EindDatum: TNullableDateTime read GetEindDatum write SetEindDatum;
    TheProperty := TGeneratableProperty.Create(TheBaseClass, CurrentColumnName, NullableTypeName, vPublic);
    TheProperty.ReadMember := GetMethodName;
    TheProperty.WriteMember := SetMethodName;
  end;

  Result := TheBaseClass;
end;

function TORMCodeGenerator.GenerateTheBaseClientDataSetClass(const MemberName, MemberListName: string; const TheUnit: TGeneratableUnit;
    const TheBaseClass: TGeneratableClass): TGeneratableClass;
var
  JoinReferenceRecord: TJoinReferenceRecord;
  JoinedTableName: string;
  TheProperty: TGeneratableProperty;
  TheBaseClientDataSetClass: TGeneratableClass;
  TheMethod: TGeneratableMethod;
  CurrentColumnName: string;
  FieldNameConstantName: string;
  MSSystemColumn: TMSSystemColumn;
  QualifiedColumnRecord: TQualifiedColumnRecord;
  TheBaseClientDataSetClassAncestorName: string;
  TheConstant: TGeneratableConstant;
begin
  //  TheMethod := TGeneratableMethod.Create(TheBaseClientDataSetClass, 'GetCurrent', vPublic);
  //  TheMethod.ReturnType := TheBaseClass.MemberName;
  //  TheMethod.BodyText.Add(Format('  raise ENotSupportedException.Create(''not supported yet: function %s.%s: %s;''', [TheBaseClientDataSetClass.MemberName,
  //      TheMethod.MemberName, TheBaseClass.MemberName]));
  //  TheMethod.BodyText.Add(Format('    //  Result := %s(FCollection[FIndex]);', [TheBaseClass.MemberName]));
  //  TheProperty := TGeneratableProperty.Create(TheBaseClientDataSetClass, 'Current', TheBaseClass.MemberName, vPublic);

  if JoinReferenceRecords.Count > 0 then
  begin
    JoinReferenceRecord := JoinReferenceRecords.First;
    JoinedTableName := JoinReferenceRecord.ReferenceSysTable.ToString();
    TheBaseClientDataSetClassAncestorName := Format('T%sList', [JoinedTableName]);
    TheBaseClass.InterfaceUnits.Add(Format('%sUnit', [JoinedTableName]));
  end
  else
  begin
    TheBaseClientDataSetClassAncestorName := 'TEntityListClientDataSet';
  end;
  TheBaseClientDataSetClass := TGeneratableClass.Create(TheUnit, Format('T%sBaseClientDataSet', [MemberListName]), TheBaseClientDataSetClassAncestorName);

  //  TGebruikerBaseClientDataSet = class(TEntityListClientDataSet)

  //  strict protected
  //    function GetData: Integer; overload; override;
  TheMethod := TGeneratableMethod.Create(TheBaseClientDataSetClass, 'GetData', vStrictProtected, bkOverride, True);
  TheMethod.ReturnType := 'Integer';
  TheMethod.BodyText.Add('  Result := inherited GetData();');
  for QualifiedColumnRecord in FirstTableQualifiedColumnRecords do
  begin
    MSSystemColumn := QualifiedColumnRecord.MSSystemColumn;
    CurrentColumnName := MSSystemColumn.ToString();
    if SysColumnIsRequired(MSSystemColumn) then
      if not IsEIDFieldName(CurrentColumnName) then
        if not SysColumnIsIdColumnOf(MSSystemColumn, FirstSysTable) then
          TheMethod.BodyText.Add(Format('  %s.Required := True;', [GetFieldColumnName(CurrentColumnName)]));
  end;

  //    function GetEntityClass: TEntityClass; override;
  TheMethod := TGeneratableMethod.Create(TheBaseClientDataSetClass, 'GetEntityClass', vStrictProtected, bkOverride, True);
  TheMethod.ReturnType := 'TEntityClass';
  TheMethod.BodyText.Add(Format('  Result := %s;', [TheBaseClass.MemberName]));


  for QualifiedColumnRecord in FirstTableQualifiedColumnRecords do
  begin
    MSSystemColumn := QualifiedColumnRecord.MSSystemColumn;
    CurrentColumnName := MSSystemColumn.ToString();

    FieldNameConstantName := GenerateFieldName(CurrentColumnName);

    //  public
    //    const ID_GebruikerFieldName = 'ID_Gebruiker';
    TheConstant := TGeneratableConstant.Create(TheBaseClientDataSetClass,
      FieldNameConstantName,
      Format('''%s''', [CurrentColumnName]),
      NullAsStringValue,
      vPublic);

    //  public
    //    const ID_Gebruiker_UpdateFieldName = 'ID_Gebruiker_Update';
    TheConstant := TGeneratableConstant.Create(TheBaseClientDataSetClass,
      Format('%sParameterName', [GetChangedColumnName(CurrentColumnName)]),
      Format('''%s''', [GetChangedColumnName(CurrentColumnName)]),
      NullAsStringValue,
      vPublic);

    //  strict protected
    //    function GetEindDatumField: TDateTimeField; virtual;
    TheMethod := TGeneratableMethod.Create(TheBaseClientDataSetClass, Format('Get%sField', [CurrentColumnName]), vStrictProtected, bkVirtual);
    TheMethod.ReturnType := SysColumnAsTFieldClassName(MSSystemColumn);
    TheMethod.BodyText.Add(Format('  Result := Fields.FieldByName(%s) as %s;', [FieldNameConstantName, TheMethod.ReturnType]));

    //  public
    //    property EindDatumField: TDateTimeField read GetEindDatumField;
    TheProperty := TGeneratableProperty.Create(TheBaseClientDataSetClass, Format('%sField', [CurrentColumnName]), TheMethod.ReturnType, vPublic);
    TheProperty.ReadMember := TheMethod.MemberName;
  end;

  Result := TheBaseClientDataSetClass;
end;

function TORMCodeGenerator.GenerateTheBaseEnumeratorClass(const MemberName: string; const TheUnit: TGeneratableUnit;
  const TheBaseClass: TGeneratableClass): TGeneratableClass;
var
  TheProperty: TGeneratableProperty;
  TheBaseEnumeratorClass: TGeneratableClass;
  TheMethod: TGeneratableMethod;
begin
  TheBaseEnumeratorClass := TGeneratableClass.Create(TheUnit, Format('T%sBaseEnumerator', [MemberName]), 'TEntityListEnumerator');
  TheMethod := TGeneratableMethod.Create(TheBaseEnumeratorClass, 'GetCurrent', vStrictPrivate); //jpl: 20100204 - non-virtual; strict private
  TheMethod.ReturnType := TheBaseClass.MemberName;

  TheMethod.LocalVars.Add('Entity', 'TEntity');

  TheMethod.BodyText.Add('  Entity := inherited Current;');
  TheMethod.BodyText.Add(Format('  Result := Entity as %s;', [TheBaseClass.MemberName]));
  //  TGebruikersBaseEnumerator = class(TEntityListEnumerator)
  //  strict private
  //    function GetCurrent(): TGebruikerBase;
  //  public
  //    property Current: TGebruikerBase read GetCurrent;
  //  end;
  //function TGebruikersBaseEnumerator.GetCurrent(): TGebruikerBase;
  //var
  //  Entity: TEntity;
  //begin
  //  Entity := inherited Current;
  //  Result := Entity as TGebruikerBase;
  //end;
  TheProperty := TGeneratableProperty.Create(TheBaseEnumeratorClass, 'Current', TheBaseClass.MemberName, vPublic);
  TheProperty.ReadMember := TheMethod.MemberName;

  Result := TheBaseEnumeratorClass;
end;

function TORMCodeGenerator.GenerateTheBaseListClass(const MemberName, MemberListName: string; const TheBaseClientDataSetClass,
    TheBaseEnumeratorClass: TGeneratableClass; const TheUnit: TGeneratableUnit): TGeneratableClass;
var
  TheBaseListClass: TGeneratableClass;
  MSSystemColumn: TMSSystemColumn;
  CurrentColumnName: string;
  NullableTypeName: string;
  NullableHelperName: string;
  GetMethodName: string;
  SetMethodName: string;
  TheMethod: TGeneratableMethod;
  TheProperty: TGeneratableProperty;
  QualifiedColumnRecord: TQualifiedColumnRecord;
begin
  TheBaseListClass := TGeneratableClass.Create(TheUnit, Format('T%sBase', [MemberListName]), TheBaseClientDataSetClass.MemberName, True);
  TheBaseListClass.ImplementationUnits.Add('FieldHelperUnit');

  GenerateTheBasesClassQueryMethods(TheBaseListClass, MemberName);

  for QualifiedColumnRecord in FirstTableQualifiedColumnRecords do
  begin
    MSSystemColumn := QualifiedColumnRecord.MSSystemColumn;
    CurrentColumnName := MSSystemColumn.ToString();

    NullableTypeName := SysColumnAsTNullableTypeName(MSSystemColumn);
    NullableHelperName := Format('As%s', [StrUtils.RightStr(NullableTypeName, Length(NullableTypeName) - 1)]);

    GetMethodName := Format('Get%s', [CurrentColumnName]);
    SetMethodName := Format('Set%s', [CurrentColumnName]);

    TheMethod := TGeneratableMethod.Create(TheBaseListClass, GetMethodName, vStrictProtected, bkVirtual);
    TheMethod.ReturnType := NullableTypeName;
    //  strict protected
    //    function GetEindDatum: TNullableDateTime; virtual;
    TheMethod.BodyText.Add(Format('  Result := %s.%s;', [GetFieldColumnName(CurrentColumnName), NullableHelperName]));
    //function TGebruikersBase.GetEindDatum: TNullableDateTime;
    //begin
    //  Result := EindDatumField.AsNullableDateTime;
    //end;

    TheMethod := TGeneratableMethod.Create(TheBaseListClass, SetMethodName, vStrictProtected, bkVirtual);
    TheMethod.Parameters := Format('const Value: %s', [SysColumnAsTNullableTypeName(MSSystemColumn)]);
    //  strict protected
    //    procedure SetEindDatum(const Value: TNullableDateTime); virtual;
    TheMethod.BodyText.Add(Format('  %s.%s := Value;', [GetFieldColumnName(CurrentColumnName), NullableHelperName]));
    //procedure TGebruikersBase.SetEindDatum(const Value: TNullableDateTime);
    //begin
    //  EindDatumField.AsNullableDateTime := Value;
    //end;

    //  public
    //    property EindDatum: TNullableDateTime read GetEindDatum write SetEindDatum;
    TheProperty := TGeneratableProperty.Create(TheBaseListClass, CurrentColumnName, NullableTypeName, vPublic);
    TheProperty.ReadMember := GetMethodName;
    TheProperty.WriteMember := SetMethodName;
  end;

  //  public
  //    function GetEnumerator: TGebruikersBaseEnumerator;
  TheMethod := TGeneratableMethod.Create(TheBaseListClass, 'GetEnumerator', vPublic);
  TheMethod.ReturnType := TheBaseEnumeratorClass.MemberName;
  TheMethod.BodyText.Add(Format('  Result := %s.Create(Self);', [TheBaseEnumeratorClass.MemberName]));

  Result := TheBaseListClass;
end;

procedure TORMCodeGenerator.GenerateTheBasesClassQueryMethods(const TheBaseListClass: TGeneratableClass; const MemberName: string);
var
  ColumnName: string;
  ColumnsStringBuilder: TStringBuilder;
  IDColumnName: string;
  TheMethod: TGeneratableMethod;
  MSSystemColumn: TMSSystemColumn;
  JoinReferenceRecord: TJoinReferenceRecord;
  TheConstant: TGeneratableConstant;
begin
  IDColumnName := IDFieldName(MemberName);

  TheMethod := TGeneratableMethod.Create(TheBaseListClass, 'SetDeleteQueryText', vStrictPrivate, bkRegular);
  TheMethod.Parameters := 'var DeleteQueryText: string';
  //  strict private
  //    procedure SetDeleteQueryText(const SetDeleteQueryText: string);
  TheMethod.BodyText.Add(Format('  DeleteQueryText := ''DELETE FROM %s WHERE %s = :%s'';', [MemberName, IDColumnName, IDColumnName]));
  //procedure TGebruikersBase.SetDeleteQueryText(const DeleteQuery: TDBQuery);
  //begin
  //  DeleteQueryText := 'DELETE FROM Gebruiker WHERE ID_Gebruiker = :ID_Gebruiker';
  //end;

  TheMethod := TGeneratableMethod.Create(TheBaseListClass, 'SetInsertQueryText', vStrictPrivate, bkRegular);
  TheMethod.Parameters := 'var InsertQueryText: string';
  //  strict private
  //    procedure SetInsertQueryText(var InsertQueryText: string);
  //  procedure TContactPersoonListBase.SetInsertQueryText(var InsertQueryText: string);
  //  begin
  //    InsertQueryText :=
  //    'INSERT INTO ContactPersoon (' +
  //    '  EID_NatuurlijkPersoon  ) VALUES (' +
  //    '  :EID_NatuurlijkPersoon_Changed  )';
  //  end;
  ColumnsStringBuilder := TStringBuilder.Create;
  try
    ColumnsStringBuilder.AppendLine('  InsertQueryText :=');
    ColumnsStringBuilder.AppendFormat('  ''INSERT INTO %s ('' +', [MemberName]);
    ColumnsStringBuilder.AppendLine;
    RunForEachColumnNameInSysTableAndAppendCommasWhereNeeded(FirstSysTable, ColumnsStringBuilder,
      procedure(ColumnName: string)begin ColumnsStringBuilder.AppendFormat('  ''  %s', [ColumnName]); end, True);
    ColumnsStringBuilder.AppendLine('  ) VALUES ('' +');
    RunForEachColumnNameInSysTableAndAppendCommasWhereNeeded(FirstSysTable, ColumnsStringBuilder,
      procedure(ColumnName: string)begin ColumnsStringBuilder.AppendFormat('  ''  :%s', [GetChangedColumnName(ColumnName)]); end, True);
    ColumnsStringBuilder.Append('  )'';');
    TheMethod.BodyText.Add(ColumnsStringBuilder.ToString);
  finally
    ColumnsStringBuilder.Free;
  end;

  TheMethod := TGeneratableMethod.Create(TheBaseListClass, 'SetReadQueryText', vStrictProtected, bkOverride);
  TheMethod.Parameters := 'const ReadQuery: TDBQuery';
  //  strict protected
  //    procedure SetReadQueryText(const ReadQuery: TDBQuery); override;
  //  TheMethod.BodyText.Add(Format('  ReadQuery.SQL.Add(''SELECT * FROM %s'');', [MemberName]));
  GenerateSelectStatement(TheMethod.BodyText);
  //procedure TGebruikersBase.SetReadQueryText(const ReadQuery: TDBQuery);
  //begin
  //  ReadQuery.SQL.Add('SELECT * FROM Gebruiker');
  //end;

  TheMethod := TGeneratableMethod.Create(TheBaseListClass, 'SetUpdateQueryText', vStrictPrivate, bkRegular);
  TheMethod.Parameters := 'var UpdateQueryText: string';
  //  strict private
  //    procedure SetUpdateQueryText(const UpdateQueryText: string);
  ColumnsStringBuilder := TStringBuilder.Create;
  try
    ColumnsStringBuilder.AppendLine('  UpdateQueryText :=');
    ColumnsStringBuilder.AppendFormat('  ''UPDATE %s '' + ''SET '' +', [MemberName]);
    ColumnsStringBuilder.AppendLine;
    RunForEachColumnNameInSysTableAndAppendCommasWhereNeeded(FirstSysTable, ColumnsStringBuilder,
      procedure(ColumnName: string)begin ColumnsStringBuilder.AppendFormat('  ''  %s = :%s', [ColumnName, GetChangedColumnName(ColumnName)]); end, True);
    ColumnsStringBuilder.AppendLine(' '' +');
    ColumnsStringBuilder.AppendFormat('  ''WHERE %s = :%s '';', [IDColumnName, IDColumnName]);
    //    UpdateQueryText :=
    //    'UPDATE Gebruiker ' + 'SET ' +
    //    //'  ID_NatuurlijkPersoon = :ID_NatuurlijkPersoon_Update, ' + // skip Identity field!
    //    '  Gebruikersnaam = :Gebruikersnaam_Update, ' +
    //    '  WachtwoordHash = :WachtwoordHash_Update, ' +
    //    '  Startdatum = :Startdatum_Update, ' +
    //    '  EindDatum = :EindDatum_Update ' +
    //    'WHERE ID_Gebruiker = :ID_Gebruiker ';
    TheMethod.BodyText.Add(ColumnsStringBuilder.ToString);
  finally
    ColumnsStringBuilder.Free;
  end;
  //procedure TGebruikersBase.SetUpdateQueryText(const UpdateQuery: TDBQuery);
  //begin
  //  UpdateQuery.SQL.Add('UPDATE Gebruiker ' + 'SET ' +
  //    'ID_NatuurlijkPersoon = :ID_NatuurlijkPersoon_Update, ' +
  //    'Gebruikersnaam = :Gebruikersnaam_Update, ' +
  //    'WachtwoordHash = :WachtwoordHash_Update, ' +
  //    'Startdatum = :Startdatum_Update, ' +
  //    'EindDatum = :EindDatum_Update ' +
  //    'WHERE ' + 'ID_Gebruiker = :ID_Gebruiker ');
  //end;
  TheMethod := TGeneratableMethod.Create(TheBaseListClass, 'SetParams', vStrictPrivate, bkRegular);
  TheMethod.Parameters := 'const DBQuery: TDBQuery';
  //  strict protected
  //    procedure SetParams(const DBQuery: TDBQuery); override;
  for MSSystemColumn in FirstSysTable.MSSystemColumns do
  begin
    if not SysColumnIsIdColumnOf(MSSystemColumn, FirstSysTable) then
    begin
      ColumnName := MSSystemColumn.ToString();
      //  DBQuery.AssignParam(ID_NatuurlijkPersoon, ID_NatuurlijkPersoonFieldName);
      TheMethod.BodyText.Add(Format('  DBQuery.AssignParam(%s, %sParameterName);', [ColumnName,  GetChangedColumnName(ColumnName)]));
    end;
  end;
  //procedure TGebruikersBase.SetParams(const DBQuery: TDBQuery);
  //begin
  //  // DBQuery.AssignParam(ID_Gebruiker, 'ID_Gebruiker'); // Skip ID column!
  //  DBQuery.AssignParam(ID_NatuurlijkPersoon, 'ID_NatuurlijkPersoon');
  //  DBQuery.AssignParam(Gebruikersnaam, 'Gebruikersnaam');
  //  DBQuery.AssignParam(WachtwoordHash, 'WachtwoordHash');
  //  DBQuery.AssignParam(Startdatum, 'Startdatum');
  //  DBQuery.AssignParam(EindDatum, 'EindDatum');
  //end;

  TheConstant := TGeneratableConstant.Create(TheBaseListClass,
    Format('%s', [GenerateTableName(MemberName)]),
    Format('''%s''', [MemberName]),
    NullAsStringValue,
    vPublic);

  TheMethod := TGeneratableMethod.Create(TheBaseListClass, 'FillJoinedColumnPair', vStrictPrivate, bkRegular);
  TheMethod.ReturnType := 'TJoinedColumnPair';
  //  strict private
  //    function FillJoinedColumnPair: TJoinedColumnPair;
  if JoinReferenceRecords.Count = 0 then
  begin
    TheMethod.BodyText.Add(Format('  Result := TJoinedColumnPair.Create(%s, %s);', [
      TheConstant.MemberName, GenerateFieldName(FirstSysTable.IDColumnName)]));
    //  Result := TJoinedColumnPair.Create(Entiteit_TableName, Self.ID_EntiteitFieldName);
  end
  else
  begin
    JoinReferenceRecord := JoinReferenceRecords.First;
    TheMethod.BodyText.Add(Format('  Result := TJoinedColumnPair.Create(%s, %s, %s, %s);', [
      TheConstant.MemberName,
      GenerateFieldName(JoinReferenceRecord.SourceSysColumn.ToString()),
      GenerateTableName(JoinReferenceRecord.ReferenceSysTable.ToString()),
      GenerateFieldName(JoinReferenceRecord.ReferenceSysColumn.ToString())]));
  //  Result := TJoinedColumnPair.Create(Client_TableName, EID_NatuurlijkPersoonFieldName, NatuurlijkPersoon_TableName, ID_NatuurlijkPersoonFieldName);
  end;
  //function TContactPersoonListBase.FillJoinedColumnPair: TJoinedColumnPair;
  //begin
  //  Result := TJoinedColumnPair.Create(Entiteit_TableName, Self.ID_EntiteitFieldName);
  //  Result := TJoinedColumnPair.Create(Client_TableName, EID_NatuurlijkPersoonFieldName, NatuurlijkPersoon_TableName, ID_NatuurlijkPersoonFieldName);
  //end;

  TheMethod := TGeneratableMethod.Create(TheBaseListClass, 'FillDeleteQueryRecordList', vStrictProtected, bkOverride);
  TheMethod.Parameters := 'const DeleteQueryRecordList: TEntityQueryRecordList';
  //  strict protected
  //    procedure FillDeleteQueryRecordList(const DeleteQueryRecordList: TEntityQueryRecordList); override;
  TheMethod.LocalVars.Add('DeleteQueryRecord', 'TEntityQueryRecord');
  TheMethod.BodyText.Add('  inherited FillDeleteQueryRecordList(DeleteQueryRecordList);');
  TheMethod.BodyText.Add('  DeleteQueryRecord.SetQueryTextMethod := Self.SetDeleteQueryText;');
  TheMethod.BodyText.Add('  DeleteQueryRecord.SetParamsMethod := nil;');
  TheMethod.BodyText.Add('  DeleteQueryRecord.JoinedColumnPair := FillJoinedColumnPair();');
  TheMethod.BodyText.Add('  DeleteQueryRecordList.Add(DeleteQueryRecord);');
  //procedure TContactPersoonListBase.FillDeleteQueryRecordList(const DeleteQueryRecordList: TEntityQueryRecordList);
  //var
  //  DeleteQueryRecord: TEntityQueryRecord;
  //begin
  //  inherited FillDeleteQueryRecordList(DeleteQueryRecordList);
  //  DeleteQueryRecord.SetQueryTextMethod := Self.SetDeleteQueryText;
  //  DeleteQueryRecord.SetParamsMethod := nil;
  //  DeleteQueryRecord.JoinedColumnPair := FillJoinedColumnPair();
  //  DeleteQueryRecordList.Add(DeleteQueryRecord);
  //end;

  TheMethod := TGeneratableMethod.Create(TheBaseListClass, 'FillInsertQueryRecordList', vStrictProtected, bkOverride);
  TheMethod.Parameters := 'const InsertQueryRecordList: TEntityQueryRecordList';
  //  strict protected
  //    procedure FillInsertQueryRecordList(const InsertQueryRecordList: TEntityQueryRecordList); override;
  TheMethod.LocalVars.Add('InsertQueryRecord', 'TEntityQueryRecord');
  TheMethod.BodyText.Add('  inherited FillInsertQueryRecordList(InsertQueryRecordList);');
  TheMethod.BodyText.Add('  InsertQueryRecord.SetQueryTextMethod := Self.SetInsertQueryText;');
  TheMethod.BodyText.Add('  InsertQueryRecord.SetParamsMethod := Self.SetParams;');
  TheMethod.BodyText.Add('  InsertQueryRecord.JoinedColumnPair := FillJoinedColumnPair();');
  TheMethod.BodyText.Add('  InsertQueryRecordList.Add(InsertQueryRecord);');
  //procedure TContactPersoonListBase.FillInsertQueryRecordList(const InsertQueryRecordList: TEntityQueryRecordList);
  //var
  //  InsertQueryRecord: TEntityQueryRecord;
  //begin
  //  inherited FillInsertQueryRecordList(InsertQueryRecordList);
  //  InsertQueryRecord.SetQueryTextMethod := Self.SetInsertQueryText;
  //  InsertQueryRecord.SetParamsMethod := Self.SetParams;
  //  InsertQueryRecord.JoinedColumnPair := FillJoinedColumnPair();
  //  InsertQueryRecordList.Add(InsertQueryRecord);
  //end;

  TheMethod := TGeneratableMethod.Create(TheBaseListClass, 'FillUpdateQueryRecordList', vStrictProtected, bkOverride);
  TheMethod.Parameters := 'const UpdateQueryRecordList: TEntityQueryRecordList';
  //  strict protected
  //    procedure FillUpdateQueryRecordList(const UpdateQueryRecordList: TEntityQueryRecordList); override;
  TheMethod.LocalVars.Add('UpdateQueryRecord', 'TEntityQueryRecord');
  TheMethod.BodyText.Add('  inherited FillUpdateQueryRecordList(UpdateQueryRecordList);');
  TheMethod.BodyText.Add('  UpdateQueryRecord.SetQueryTextMethod := Self.SetUpdateQueryText;');
  TheMethod.BodyText.Add('  UpdateQueryRecord.SetParamsMethod := Self.SetParams;');
  TheMethod.BodyText.Add('  UpdateQueryRecord.JoinedColumnPair := FillJoinedColumnPair();');
  TheMethod.BodyText.Add('  UpdateQueryRecordList.Add(UpdateQueryRecord);');
  //procedure TContactPersoonListBase.FillUpdateQueryRecordList(const UpdateQueryRecordList: TEntityQueryRecordList);
  //var
  //  UpdateQueryRecord: TEntityQueryRecord;
  //begin
  //  inherited FillUpdateQueryRecordList(UpdateQueryRecordList);
  //  UpdateQueryRecord.SetQueryTextMethod := Self.SetUpdateQueryText;
  //  UpdateQueryRecord.SetParamsMethod := Self.SetParams;
  //  UpdateQueryRecord.JoinedColumnPair := FillJoinedColumnPair();
  //  UpdateQueryRecordList.Add(UpdateQueryRecord);
  //end;
end;

function TORMCodeGenerator.GetMemberName: string;
begin
  Result := Self.FirstTableName;
end;

procedure TORMCodeGenerator.RunForEachColumnNameInSysTableAndAppendCommasWhereNeeded(const MSSystemTable: TMSSystemTable;
  const ColumnsStringBuilder: TStringBuilder; const Proc: TProc<string>; const SkipIdColums: Boolean = False);
var
  First: Boolean;
  ColumnIndex: Integer;
  ColumnName: string;
  MSSystemColumn: TMSSystemColumn;
begin
  First := True;
  for ColumnIndex := 0 to MSSystemTable.MSSystemColumns.Count - 1 do
  begin
    MSSystemColumn := MSSystemTable.MSSystemColumns[ColumnIndex];
    ColumnName := MSSystemColumn.ToString();
    if SkipIdColums and (ColumnName = MSSystemTable.IDColumnName) then
    begin
      // do nothing
    end
    else
    begin
      if not First then
        AppendTrailingCommaInSqlStatementLineInSourceCode(ColumnsStringBuilder);
      Proc(ColumnName);
      First := False;
    end;
  end;
end;

function TORMCodeGenerator.ToString: string;
begin
  if FAsString = NullAsStringValue then
    Generate();
  Result := AsString;
end;

function TORMCodeGenerator.GenerateFieldName(const CurrentColumnName: string): string;
begin
  Result := Format('%sFieldName', [CurrentColumnName]);
end;

function TORMCodeGenerator.GenerateTableName(const TableName: string): string;
begin
  Result := Format('%s_TableName', [TableName]);
end;

function TSysColumnHelper.SysColumnAsDelphiTypeName(const MSSystemColumn: TMSSystemColumn): string;
// zie: syscolmns, coltype
// http://msdn.microsoft.com/en-us/library/aa260398(SQL.80).aspx
// http://devpinoy.org/blogs/keithrull/archive/2006/06/17/HowTo_3A00_-List-Database-Objects-in-SQL-Server-using-sysobjects_2C00_-MSSystemColumns-and-systypes.aspx
// xtype zit uiteindelijk in systypes:
// http://msdn.microsoft.com/en-us/library/aa260587(SQL.80).aspx
// is_identity:
// http://stackoverflow.com/questions/87747/how-do-you-determine-what-sql-tables-have-an-identity-column-programatically
var
  ColType: Integer;
begin
  Result := 'ONBEPAALD!!';

  ColType := SysColumnColTypeLoByte(MSSystemColumn);

  case ColType of
    104:
      Result := 'Boolean';
    35, 167: // 35 = memo; 167 = string
      Result := 'string';
    1:
      Result := 'Smallint';
    56:
      Result := 'Integer';
    62, 106:
      Result := 'Double';
    61:
      Result := 'TDateTime';
    //      11:  Result := NullAsStringValue; BYTE = volgens mij een BLOB
    //      14:  Result := NullAsStringValue; INTERVAL
  end;
end;

function TSysColumnHelper.SysColumnIsIdColumnOf(const MSSystemColumn: TMSSystemColumn; const MSSystemTable: TMSSystemTable): Boolean;
var
  ColumnName: string;
begin
  ColumnName := MSSystemColumn.ToString();
  Result := (ColumnName = MSSystemTable.IDColumnName);
end;

function TSysColumnHelper.SysColumnAsTFieldClassName(const MSSystemColumn: TMSSystemColumn): string;
var
  First: string;
  Rest: string;
begin
  Result := SysColumnAsDelphiTypeName(MSSystemColumn);

  if Result <> NullAsStringValue then
  begin
    if SameText(Result, 'Double') then
      Result := 'Float';
    if SameText(Result, 'string') then
      if SysColumnColTypeLoByte(MSSystemColumn) = 35 then
        Result := 'Blob'; // jpl: 20100318 - 35 = Memo, maar beschouwen we als Blob, want Access vindt het een TWideMemoField en SQL Server een TMemoField

    Result := StripClassPrefixT(Result);

    First := Copy(Result, 1, 1);
    Rest := Copy(Result, 1 + Length(First), Length(Result) - Length(First));
    First := UpperCase(First);

    Result := Format('T%s%sField', [First, Rest]);
  end;
end;

function TSysColumnHelper.SysColumnAsTNullableTypeName(const MSSystemColumn: TMSSystemColumn): string;
var
  First: string;
  Rest: string;
begin
  Result := StripClassPrefixT(SysColumnAsDelphiTypeName(MSSystemColumn));

  if Result <> NullAsStringValue then
  begin
    First := Copy(Result, 1, 1);
    Rest := Copy(Result, 1 + Length(First), Length(Result) - Length(First));
    First := UpperCase(First);

    Result := Format('TNullable%s%s', [First, Rest]);
  end;
end;

function TSysColumnHelper.SysColumnIsRequired(const MSSystemColumn: TMSSystemColumn): Boolean;
var
  ColType: Integer;
begin
  ColType := MSSystemColumn.ColType;
  Result := ColType > High(Byte); // access
  Result := Result or not MSSystemColumn.IsNullable; // SQL Server
end;

function TSysColumnHelper.SysColumnColTypeLoByte(const MSSystemColumn: TMSSystemColumn): Byte;
var
  ColType: Integer;
begin
  ColType := MSSystemColumn.ColType;
  // zie ook SysColumnIsRequired(), als ColType >= 256, dan is het NOT NULL (en dus Required)
  Result := LoByte(ColType);
end;

constructor TEntityStructure.Create(const Owner: TComponent; const MSSystemTables: TMSSystemTables; const FirstTableName: string;
    const Logger: TLogger);
begin
  inherited Create(Owner);
  Self.FMSSystemTables := MSSystemTables;
  Self.FFirstTableName := FirstTableName;
  Self.FLogger := Logger;
end;

destructor TEntityStructure.Destroy;
begin
  inherited Destroy();

  FreeAndNil(FAllQualifiedColumnRecords);
  FreeAndNil(FJoinReferenceRecords);
end;

function TEntityStructure.CreateAndFillListOfQualifiedColumnRecords(const IncludeJoinedTables: Boolean): TListOfQualifiedColumnRecord;
var
  JoinReferenceRecord: TJoinReferenceRecord;
begin
  Result := TListOfQualifiedColumnRecord.Create;
  AddQualifiedColumnRecords(Result, FirstSysTable);
  if IncludeJoinedTables then
    for JoinReferenceRecord in JoinReferenceRecords do
      AddQualifiedColumnRecords(Result, JoinReferenceRecord.ReferenceSysTable);
end;

procedure TEntityStructure.AddQualifiedColumnRecord(const ListOfQualifiedColumnRecord: TListOfQualifiedColumnRecord; const MSSystemTable: TMSSystemTable; const
    MSSystemColumn: TMSSystemColumn);
var
  QualifiedColumnRecord: TQualifiedColumnRecord;
begin
  QualifiedColumnRecord.MSSystemTable := MSSystemTable;
  QualifiedColumnRecord.MSSystemColumn := MSSystemColumn;
  ListOfQualifiedColumnRecord.Add(QualifiedColumnRecord);
end;

procedure TEntityStructure.AddQualifiedColumnRecords(const ListOfQualifiedColumnRecord: TListOfQualifiedColumnRecord; const ReferenceSysTable:
    TMSSystemTable);
const
  SkipIdColumn = False;
var
  CurrentIsIDColumn: Boolean;
  HaveIDColumn: Boolean;
  IDColumnName: string;
  MSSystemColumn: TMSSystemColumn;
begin
  HaveIDColumn := False;
  IDColumnName := ReferenceSysTable.IDColumnName;
  for MSSystemColumn in ReferenceSysTable.MSSystemColumns do
  begin
    CurrentIsIDColumn := MSSystemColumn.ToString() = IDColumnName;
    HaveIDColumn := HaveIDColumn or CurrentIsIDColumn;
    if SkipIdColumn and (CurrentIsIDColumn) then
    begin
      // skip; jpl: 20100121 - komt in de praktijk niet meer voor omdat je voor de JOIN's en de cascaded insert/delete/updates toch de ID kolommen nodig hebt.
    end
    else
      AddQualifiedColumnRecord(ListOfQualifiedColumnRecord, ReferenceSysTable, MSSystemColumn);
  end;
  if not HaveIDColumn then
    Logger.Log('??: Table %s is missing ID column %s', [ReferenceSysTable.ToString, IDColumnName]);
end;

procedure TEntityStructure.FillJoinTables(const SourceSysTable: TMSSystemTable; const JoinReferenceRecords: TListOfJoinReferenceRecord);
var
  SourceSysColumn: TMSSystemColumn;
  ReferenceSysTable: TMSSystemTable;
  ReferenceSysColumn: TMSSystemColumn;
  ColumnName: string;
  ReferencedTableName: string;
  JoinReferenceRecord: TJoinReferenceRecord;
begin
  for SourceSysColumn in SourceSysTable.MSSystemColumns do
  begin
    ColumnName := SourceSysColumn.ToString();
    if IsEIDFieldName(ColumnName) then
    begin
      ReferencedTableName := StripEIDFromFieldName(ColumnName);
      ReferenceSysTable := MSSystemTables.Items[ReferencedTableName];
      ReferenceSysColumn := ReferenceSysTable.MSSystemColumns[ReferenceSysTable.IDColumnName];
      JoinReferenceRecord.SourceSysTable := SourceSysTable;
      JoinReferenceRecord.SourceSysColumn := SourceSysColumn;
      JoinReferenceRecord.ReferenceSysTable := ReferenceSysTable;
      JoinReferenceRecord.ReferenceSysColumn := ReferenceSysColumn;
      JoinReferenceRecords.Add(JoinReferenceRecord);
      FillJoinTables(ReferenceSysTable, JoinReferenceRecords);
    end;
  end;
end;

function TEntityStructure.GetFirstSysTable: TMSSystemTable;
begin
  Result := MSSystemTables[FirstTableName];
end;

function TEntityStructure.GetJoinReferenceRecords: TListOfJoinReferenceRecord;
begin
  if not Assigned(FJoinReferenceRecords) then
  begin
    FJoinReferenceRecords := TListOfJoinReferenceRecord.Create();
    FillJoinTables(FirstSysTable, FJoinReferenceRecords);
  end;
  Result := FJoinReferenceRecords;
end;

function TEntityStructure.GetAllQualifiedColumnRecords: TListOfQualifiedColumnRecord;
begin
  if not Assigned(FAllQualifiedColumnRecords) then
    FAllQualifiedColumnRecords := CreateAndFillListOfQualifiedColumnRecords(True);
  Result := FAllQualifiedColumnRecords;
end;

function TEntityStructure.GetChangedColumnName(const ColumnName: string): string;
begin
  Result := Format('%s_Changed', [ColumnName]);
end;

function TEntityStructure.GetFieldColumnName(const ColumnName: string): string;
begin
  Result := Format('%sField', [ColumnName]);
end;

function TEntityStructure.GetFirstTableQualifiedColumnRecords: TListOfQualifiedColumnRecord;
begin
  if not Assigned(FFirstTableQualifiedColumnRecords) then
    FFirstTableQualifiedColumnRecords := CreateAndFillListOfQualifiedColumnRecords(False);
  Result := FFirstTableQualifiedColumnRecords;
end;

end.
