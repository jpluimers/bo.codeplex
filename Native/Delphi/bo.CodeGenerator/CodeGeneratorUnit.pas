unit CodeGeneratorUnit;

interface

uses
  Classes, SysUtils, TypInfo,
  Variants, Rtti,
  Generics.Collections,
  StringListWrapperUnit,
  ConcreteCollectionsUnit;

type
  TSupportedCodeSection = (
    scsFinalizationText,
    scsImplementationText,
    scsImplementationUnits,
    scsInitializationText,
    scsInterfaceText,
    scsInterfaceUnits);
  TSupportedCodeSections = set of TSupportedCodeSection;

  TBindingKind = (bkRegular, bkVirtual, bkDynamic, bkMessage, bkOverride);

  TVisibility = (vDefault, vStrictPrivate, vPrivate, vStrictProtected, vProtected, vPublic, vPublished, vAutomated);

const
  AllSupportedCodeSection = [ Low(TSupportedCodeSection) .. High(TSupportedCodeSection)]; //##jpl: Delphi code formatter gaat hier de mist in

type
  TGeneratableInUnit = class;
  TGeneratableInUnitProc = TProc<TGeneratableInUnit>;
  TStringListWrapperGeneratableInUnitProc = TProc<IStringListWrapper, TGeneratableInUnit>;

  TListOfGeneratableInUnit = TList<TGeneratableInUnit>;

  TGeneratable = class(TComponent)
  strict private
    FMemberName: string;
  strict protected
    procedure InitializeOrCreateFields; virtual;
    procedure RunOnMember(const Member: TGeneratableInUnit; const Proc: TGeneratableInUnitProc; const WithVisibility: TVisibility); virtual;
    procedure SetMemberName(const Value: string); virtual;
  public
    constructor Create(Owner: TComponent); overload; override;
    constructor Create(const Owner: TComponent; const MemberName: string); reintroduce; overload; virtual;
    destructor Destroy; override;
    //1 Mag geen Name zijn, omdat TComponent.Name al bestaat, en die Name uniek moet zijn binnen Owner
    property MemberName: string read FMemberName write SetMemberName;
  end;

  TGeneratableClass = class;
  TGeneratableConstant = class;
  TGeneratableFieldOrConstant = class;
  TGeneratableMethod = class;
  TGeneratableProperty = class;

  TListOfGeneratableClass = TList<TGeneratableClass>;
  TListOfGeneratableMethod = TList<TGeneratableMethod>;
  TListOfGeneratableConstant = TList<TGeneratableConstant>;
  TListOfGeneratableField = TList<TGeneratableFieldOrConstant>;
  TListOfGeneratableProperty = TList<TGeneratableProperty>;

  TGeneratableUnit = class(TGeneratable)
  strict private
    FClasses: TListOfGeneratableClass;
    FFinalImplementationComments: TListOfString;
    FMethods: TListOfGeneratableMethod;
  strict protected
    procedure AppendFinalization(const StringBuilder: TStringBuilder); virtual;
    procedure AppendForwardedClassDeclarations(const StringBuilder: TStringBuilder); virtual;
    procedure AppendImplementationText(const StringBuilder: TStringBuilder); virtual;
    procedure AppendImplementationUses(const StringBuilder: TStringBuilder); virtual;
    procedure AppendInitialization(const StringBuilder: TStringBuilder); virtual;
    procedure AppendInitializationOrFinalization(const StringBuilder:
        TStringBuilder; const InitializationOrFinalizationKeyword: string; const
        MemberProc: TProc<IStringListWrapper, TGeneratableInUnit>); virtual;
    procedure AppendInterfaceText(const StringBuilder: TStringBuilder); virtual;
    procedure AppendInterfaceUses(const StringBuilder: TStringBuilder); virtual;
    procedure AppendMember(const Strings: IStringListWrapper; const Member: TGeneratableInUnit;
      const GetMemberStringListWrapper: TFunc<TGeneratableInUnit, IStringListWrapper>); virtual;
    procedure AppendMemberStringListWrapper(const StringBuilder: TStringBuilder;
        const GetMemberStringListWrapper: TFunc<TGeneratableInUnit,
        IStringListWrapper>); virtual;
    procedure AppendMemberUses(const StringBuilder: TStringBuilder; const GetMemberStringListWrapper: TFunc<TGeneratableInUnit, IStringListWrapper>);
      virtual;
    procedure AppendUsesList(const UnitNameList: IStringListWrapper; const Member: TGeneratableInUnit;
      const GetMemberStringListWrapper: TFunc<TGeneratableInUnit, IStringListWrapper>); virtual;
    procedure InitializeOrCreateFields; override;
    procedure RunOnClassesAndMethods(const Proc: TGeneratableInUnitProc); overload; virtual;
    procedure RunOnClassesAndMethods(const Proc: TGeneratableInUnitProc; const WithVisibility: TVisibility); overload; virtual;
  public
    destructor Destroy; override;
    function ToString: string; override;
    property Classes: TListOfGeneratableClass read FClasses;
    property FinalImplementationComments: TListOfString read FFinalImplementationComments;
    property Methods: TListOfGeneratableMethod read FMethods;
  end;

  TGeneratableInUnit = class(TGeneratable)
  strict private
    FSupportedCodeSections: TSupportedCodeSections;
    FVisibility: TVisibility;
  strict protected
    procedure AddSupportedCodeSections(AdditionalSupportedCodeSections: TSupportedCodeSections); virtual;
    function GetFinalizationText: IStringListWrapper; virtual;
    function GetHasSubMembers: Boolean; virtual;
    function GetImplementationText: IStringListWrapper; virtual;
    function GetImplementationUnits: IStringListWrapper; virtual;
    function GetInitializationText: IStringListWrapper; virtual;
    function GetInterfaceText: IStringListWrapper; virtual;
    function GetInterfaceUnits: IStringListWrapper; virtual;
    function GetSupportedCodeSections: TSupportedCodeSections; virtual;
    function GetVisibility: string; overload; virtual;
    function GetVisibility(const Visibility: TVisibility): string; overload; virtual;
    procedure Indent(const StringBuilder: TStringBuilder); virtual;
    procedure InitializeOrCreateFields; override;
    //1 cannot be public, as we don't want this to be called from the outside world
    procedure SetSupportedCodeSections(const Value: TSupportedCodeSections); virtual;
    procedure SetVisibility(const Value: TVisibility); virtual;
  public
    procedure FillSubMembers(const SubMembers: TListOfGeneratableInUnit); virtual;
    function CreateStringListWrapperThenForSelfAndSubMembers(const Proc:
        TStringListWrapperGeneratableInUnitProc): IStringListWrapper; virtual;
    function CreateStringListWrapperThenForSelf(const Proc:
        TStringListWrapperGeneratableInUnitProc): IStringListWrapper; virtual;
    property FinalizationText: IStringListWrapper read GetFinalizationText;
    property HasSubMembers: Boolean read GetHasSubMembers;
    property ImplementationText: IStringListWrapper read GetImplementationText;
    property ImplementationUnits: IStringListWrapper read GetImplementationUnits;
    property InitializationText: IStringListWrapper read GetInitializationText;
    property InterfaceText: IStringListWrapper read GetInterfaceText;
    property InterfaceUnits: IStringListWrapper read GetInterfaceUnits;
    property SupportedCodeSections: TSupportedCodeSections read GetSupportedCodeSections;
    property Visibility: TVisibility read FVisibility write SetVisibility;
  end;

  TGeneratableInUnitMaintainingUsesLists = class(TGeneratableInUnit)
  strict private
    FImplementationUnits: IStringListWrapper;
    FInterfaceUnits: IStringListWrapper;
  strict protected
    function GetImplementationUnits: IStringListWrapper; override;
    function GetInterfaceUnits: IStringListWrapper; override;
    procedure InitializeOrCreateFields; override;
  public
    destructor Destroy; override;
  end;

  TGeneratableClass = class(TGeneratableInUnitMaintainingUsesLists)
  strict private
    FAncestorName: string;
    FConstants: TListOfGeneratableConstant;
    FFields: TListOfGeneratableField;
    FMethods: TListOfGeneratableMethod;
    FProperties: TListOfGeneratableProperty;
    FRequiresForwardDeclaration: Boolean;
  strict protected
    procedure CollectMembersWithVisibility<T: TGeneratableInUnit>(const Target: TListOfGeneratableInUnit; const Source: TList<T>;
      const Visibility: TVisibility);
    function GetDeclaration: string;
    function GetForwardDeclaration: string;
    function GetImplementationText: IStringListWrapper; override;
    function GetInterfaceText: IStringListWrapper; override;
    function GetConstants: TListOfGeneratableConstant; virtual;
    function GetFields: TListOfGeneratableField; virtual;
    function GetHasSubMembers: Boolean; override;
    procedure InitializeOrCreateFields; override;
    procedure SetAncestorName(const Value: string); virtual;
    procedure SetRequiresForwardDeclaration(const Value: Boolean); virtual;
  public
    constructor Create(const Owner: TComponent; const MemberName: string; const AncestorName: string = 'TObject';
      const RequiresForwardDeclaration: Boolean = False);
    destructor Destroy; override;
    procedure FillSubMembers(const SubMembers: TListOfGeneratableInUnit); override;
    property AncestorName: string read FAncestorName write SetAncestorName;
    property Declaration: string read GetDeclaration;
    property ForwardDeclaration: string read GetForwardDeclaration;
    property Constants: TListOfGeneratableConstant read GetConstants;
    property Fields: TListOfGeneratableField read GetFields;
    property Methods: TListOfGeneratableMethod read FMethods;
    property Properties: TListOfGeneratableProperty read FProperties;
    property RequiresForwardDeclaration: Boolean read FRequiresForwardDeclaration write SetRequiresForwardDeclaration;
  end;

  TClassSection = (csDeclaration, csDefinition);

  TGeneratableMethod = class(TGeneratableInUnitMaintainingUsesLists)
  strict private
    FBindingKind: TBindingKind;
    FIsOverload: Boolean;
    FBodyText: IStringListWrapper;
    FLocalVars: TStringDictionaryOfString;
    FMethodKind: TMethodKind;
    FReturnType: string;
    FParameters: string;
  strict protected
    function GetBindingKindSuffix: string; virtual;
    function GetBodyText: IStringListWrapper; virtual;
    function GetLocalVars: TStringDictionaryOfString; virtual;
    function GetImplementationText: IStringListWrapper; override;
    function GetInterfaceText: IStringListWrapper; override;
    function GetMehodKindPrefix: string; virtual;
    function GetMethodSignature(const ClassSection: TClassSection = csDeclaration): string; virtual;
    procedure InitializeOrCreateFields; override;
    procedure SetBindingKind(const Value: TBindingKind); virtual;
    procedure SetIsOverload(const Value: Boolean); virtual;
    procedure SetMethodKind(const Value: TMethodKind); virtual;
    procedure SetReturnType(const Value: string); virtual;
    procedure SetParameters(const Value: string); virtual;
  public
    constructor Create(const Owner: TComponent; const MemberName: string; const Visibility: TVisibility = vDefault;
      const BindingKind: TBindingKind = bkRegular; const IsOverload: Boolean = False); overload; virtual;
    destructor Destroy; override;
    property BindingKind: TBindingKind read FBindingKind write SetBindingKind;
    property IsOverload: Boolean read FIsOverload write SetIsOverload;
    property BodyText: IStringListWrapper read GetBodyText;
    property LocalVars: TStringDictionaryOfString read GetLocalVars;
    property MethodKind: TMethodKind read FMethodKind write SetMethodKind;
    property ReturnType: string read FReturnType write SetReturnType;
    property Parameters: string read FParameters write SetParameters;
  end;

  TFreeFormatGeneratableInUnit = class(TGeneratableInUnitMaintainingUsesLists)
  strict private
    FFinalizationText: IStringListWrapper;
    FImplementationText: IStringListWrapper;
    FInitializationText: IStringListWrapper;
    FInterfaceText: IStringListWrapper;
  strict protected
    function GetFinalizationText: IStringListWrapper; override;
    function GetImplementationText: IStringListWrapper; override;
    function GetInitializationText: IStringListWrapper; override;
    function GetInterfaceText: IStringListWrapper; override;
    procedure InitializeOrCreateFields; override;
  public
    destructor Destroy; override;
  end;

  TGeneratableProperty = class(TGeneratableInUnitMaintainingUsesLists)
  strict private
    FReadMember: string;
    FTypeName: string;
    FWriteMember: string;
  strict protected
    function GetInterfaceText: IStringListWrapper; override;
    procedure InitializeOrCreateFields; override;
    procedure SetReadMember(const Value: string); virtual;
    procedure SetTypeName(const Value: string); virtual;
    procedure SetWriteMember(const Value: string); virtual;
  public
    constructor Create(const Owner: TComponent; const MemberName, TypeName: string; const Visibility: TVisibility = vDefault); overload; virtual;
    property ReadMember: string read FReadMember write SetReadMember;
    property TypeName: string read FTypeName write SetTypeName;
    property WriteMember: string read FWriteMember write SetWriteMember;
  end;

  TGeneratableFieldOrConstant = class(TGeneratableInUnitMaintainingUsesLists)
  strict private
    FTypeName: string;
  strict protected
    function GetConstantExpressionPart: string; virtual;
    function GetInterfaceText: IStringListWrapper; override;
    function GetRequiresTypeName: Boolean; virtual;
    procedure InitializeOrCreateFields; override;
    procedure SetTypeName(const Value: string); virtual;
  public
    constructor Create(const Owner: TComponent; const MemberName, TypeName: string; const Visibility: TVisibility =
        vDefault); overload; virtual;
    property ConstantExpressionPart: string read GetConstantExpressionPart;
    property RequiresTypeName: Boolean read GetRequiresTypeName;
    property TypeName: string read FTypeName write SetTypeName;
  end;

  TGeneratableConstant = class(TGeneratableFieldOrConstant)
  strict private
    FValue: string;
  strict protected
    function GetConstantExpressionPart: string; override;
    function GetRequiresTypeName: Boolean; override;
    procedure Indent(const StringBuilder: TStringBuilder); override;
    procedure InitializeOrCreateFields; override;
    procedure SetValue(const Value: string); virtual;
  public
    constructor Create(const Owner: TComponent; const MemberName, Value: string; const TypeName: string = ''; const Visibility: TVisibility = vDefault);
        overload; virtual;
    property Value: string read FValue write SetValue;
  end;

  TGeneratableField = class(TGeneratableFieldOrConstant)
  end;

implementation

uses
  StrUtils;

const
  STwoSpaces = '  ';

procedure TGeneratableInUnit.AddSupportedCodeSections(AdditionalSupportedCodeSections: TSupportedCodeSections);
begin
  SetSupportedCodeSections(SupportedCodeSections + AdditionalSupportedCodeSections);
end;

function TGeneratableInUnit.GetFinalizationText: IStringListWrapper;
begin
  raise ENotSupportedException.CreateFmt('GetFinalizationText is not overrided in %s', [Self.ClassName]);
end;

function TGeneratableInUnit.GetHasSubMembers: Boolean;
begin
  Result := False;
end;

procedure TGeneratableInUnit.FillSubMembers(const SubMembers: TListOfGeneratableInUnit);
begin
end;

function TGeneratableInUnit.CreateStringListWrapperThenForSelfAndSubMembers(const Proc: TStringListWrapperGeneratableInUnitProc): IStringListWrapper;
var
  SubMember: TGeneratableInUnit;
  SubMembers: TListOfGeneratableInUnit;
begin
  Result := CreateStringListWrapperThenForSelf(Proc);
  if HasSubMembers then
  begin
    SubMembers := TListOfGeneratableInUnit.Create();
    try
      FillSubMembers(SubMembers);
      for SubMember in SubMembers do
        Proc(Result, SubMember);
    finally
      SubMembers.Free;
    end;
  end;
end;

function TGeneratableInUnit.CreateStringListWrapperThenForSelf(const Proc: TStringListWrapperGeneratableInUnitProc): IStringListWrapper;
begin
  Result := TStringListWrapper.Create();
  Proc(Result, Self);
end;

function TGeneratableInUnit.GetImplementationText: IStringListWrapper;
begin
  raise ENotSupportedException.CreateFmt('GetImplementationText is not overrided in %s', [Self.ClassName]);
end;

function TGeneratableInUnit.GetImplementationUnits: IStringListWrapper;
begin
  raise ENotSupportedException.CreateFmt('GetImplementationUnits is not overrided in %s', [Self.ClassName]);
end;

function TGeneratableInUnit.GetInitializationText: IStringListWrapper;
begin
  raise ENotSupportedException.CreateFmt('GetInitializationText is not overrided in %s', [Self.ClassName]);
end;

function TGeneratableInUnit.GetInterfaceText: IStringListWrapper;
begin
  raise ENotSupportedException.CreateFmt('GetInterfaceText is not overrided in %s', [Self.ClassName]);
end;

function TGeneratableInUnit.GetInterfaceUnits: IStringListWrapper;
begin
  raise ENotSupportedException.CreateFmt('GetInterfaceUnits is not overrided in %s', [Self.ClassName]);
end;

function TGeneratableInUnit.GetSupportedCodeSections: TSupportedCodeSections;
begin
  Result := FSupportedCodeSections;
end;

function TGeneratableInUnit.GetVisibility: string;
begin
  Result := GetVisibility(Visibility);
end;

function TGeneratableInUnit.GetVisibility(const Visibility: TVisibility): string;
begin
  case Visibility of
    vDefault:
      Result := '';
    vStrictPrivate:
      Result := 'strict private';
    vPrivate:
      Result := 'private';
    vStrictProtected:
      Result := 'strict protected';
    vProtected:
      Result := 'protected';
    vPublic:
      Result := 'public';
    vPublished:
      Result := 'published';
    vAutomated:
      Result := 'automated';
  else
    raise ENotSupportedException.Create('unknown Visibility in TGeneratableInUnit.GetVisibility');
  end;
end;

procedure TGeneratableInUnit.Indent(const StringBuilder: TStringBuilder);
var
  TheOwner: TComponent;
begin
  TheOwner := Owner;
  while TheOwner <> nil do
  begin
    //    if TheOwner is TGeneratableClass then
    StringBuilder.Append(STwoSpaces);
    TheOwner := TheOwner.Owner;
  end;
end;

procedure TGeneratableInUnit.InitializeOrCreateFields;
begin
  inherited InitializeOrCreateFields();
  SetSupportedCodeSections(AllSupportedCodeSection);
  Visibility := vDefault;
end;

procedure TGeneratableInUnit.SetSupportedCodeSections(const Value: TSupportedCodeSections);
begin
  FSupportedCodeSections := Value;
end;

procedure TGeneratableInUnit.SetVisibility(const Value: TVisibility);
begin
  FVisibility := Value;
end;

destructor TGeneratableUnit.Destroy;
begin
  FreeAndNil(FMethods);
  FreeAndNil(FFinalImplementationComments);
  FreeAndNil(FClasses);
  inherited Destroy;
end;

procedure TGeneratableUnit.AppendFinalization(const StringBuilder: TStringBuilder);
begin
  AppendInitializationOrFinalization(StringBuilder, 'finalization',
    procedure (StringListWrapper: IStringListWrapper; InnerMember: TGeneratableInUnit)
    begin
      if scsFinalizationText in InnerMember.SupportedCodeSections then
        StringListWrapper.AddStringListWrapper(InnerMember.FinalizationText);
    end
  );
end;

procedure TGeneratableUnit.AppendForwardedClassDeclarations(const StringBuilder: TStringBuilder);
var
  Member: TGeneratableClass;
  DoneAtLeastOne: Boolean;
begin
  DoneAtLeastOne := False;
  for Member in Classes do
  begin
    if Member.RequiresForwardDeclaration then
    begin
      StringBuilder.AppendFormat('  %s = class;', [Member.MemberName]);
      StringBuilder.AppendLine;
      DoneAtLeastOne := True;
    end;
  end;
  if DoneAtLeastOne then
    StringBuilder.AppendLine();
end;

procedure TGeneratableUnit.AppendImplementationText(const StringBuilder: TStringBuilder);
var
  CommentLine: string;
begin
  AppendMemberStringListWrapper(StringBuilder,
    function(Member: TGeneratableInUnit): IStringListWrapper
    begin
      // ImplementationText: no need for SubMembers
      Result := Member.CreateStringListWrapperThenForSelf(
        procedure (StringListWrapper: IStringListWrapper; InnerMember: TGeneratableInUnit)
        begin
          if scsImplementationText in InnerMember.SupportedCodeSections then
            StringListWrapper.AddStringListWrapper(InnerMember.ImplementationText);
        end
      );
    end
  );

  if FinalImplementationComments.Count > 0 then
  begin
    StringBuilder.AppendLine('{');
    for CommentLine in FinalImplementationComments do
    begin
      StringBuilder.AppendLine(CommentLine);
    end;
    StringBuilder.AppendLine('}');
  end;
end;

procedure TGeneratableUnit.AppendImplementationUses(const StringBuilder: TStringBuilder);
begin
  Self.AppendMemberUses(StringBuilder,
    function(Member: TGeneratableInUnit): IStringListWrapper
    begin
      Result := Member.CreateStringListWrapperThenForSelfAndSubMembers(
        procedure (StringListWrapper: IStringListWrapper; InnerMember: TGeneratableInUnit)
        begin
          if scsImplementationUnits in InnerMember.SupportedCodeSections then
            StringListWrapper.AddStringListWrapper(InnerMember.ImplementationUnits);
        end
      );
    end
  );
end;

procedure TGeneratableUnit.AppendInitialization(const StringBuilder: TStringBuilder);
begin
  AppendInitializationOrFinalization(StringBuilder, 'initialization',
    procedure (StringListWrapper: IStringListWrapper; InnerMember: TGeneratableInUnit)
    begin
      if scsInitializationText in InnerMember.SupportedCodeSections then
        StringListWrapper.AddStringListWrapper(InnerMember.InitializationText);
    end
  );
end;

procedure TGeneratableUnit.AppendInitializationOrFinalization(const
    StringBuilder: TStringBuilder; const InitializationOrFinalizationKeyword:
    string; const MemberProc: TProc<IStringListWrapper, TGeneratableInUnit>);
var
  InitializationStringBuilder: TStringBuilder;
begin
  InitializationStringBuilder := TStringBuilder.Create();
  try
    AppendMemberStringListWrapper(InitializationStringBuilder,
      function(Member: TGeneratableInUnit): IStringListWrapper
      begin
        Result := Member.CreateStringListWrapperThenForSelfAndSubMembers(MemberProc);
      end
    );
    if InitializationStringBuilder.Length > 0 then
    begin
      StringBuilder.AppendLine(InitializationOrFinalizationKeyword);
      StringBuilder.Append(InitializationStringBuilder.ToString);
      StringBuilder.AppendLine();
    end;
  finally
    InitializationStringBuilder.Free;
  end;
end;

procedure TGeneratableUnit.AppendInterfaceText(const StringBuilder: TStringBuilder);
begin
  if Classes.Count > 0 then
    StringBuilder.AppendLine('type');
  AppendForwardedClassDeclarations(StringBuilder);
  AppendMemberStringListWrapper(StringBuilder,
    function(Member: TGeneratableInUnit): IStringListWrapper
    begin
      // InterfaceText: no need for SubMembers
      Result := Member.CreateStringListWrapperThenForSelf(
        procedure (StringListWrapper: IStringListWrapper; InnerMember: TGeneratableInUnit)
        begin
          if scsInterfaceText in InnerMember.SupportedCodeSections then
            StringListWrapper.AddStringListWrapper(InnerMember.InterfaceText);
        end
      );
    end
  );
end;

procedure TGeneratableUnit.AppendInterfaceUses(const StringBuilder: TStringBuilder);
begin
  Self.AppendMemberUses(StringBuilder,
    function(Member: TGeneratableInUnit): IStringListWrapper
    begin
      Result := Member.CreateStringListWrapperThenForSelfAndSubMembers(
        procedure (StringListWrapper: IStringListWrapper; InnerMember: TGeneratableInUnit)
        begin
          if scsInterfaceUnits in InnerMember.SupportedCodeSections then
            StringListWrapper.AddStringListWrapper(InnerMember.InterfaceUnits);
        end
      );
    end
  );
end;

procedure TGeneratableUnit.AppendMember(const Strings: IStringListWrapper; const Member: TGeneratableInUnit;
  const GetMemberStringListWrapper: TFunc<TGeneratableInUnit, IStringListWrapper>);
var
  MemberStringListWrapper: IStringListWrapper;
begin
  MemberStringListWrapper := GetMemberStringListWrapper(Member);
  if MemberStringListWrapper.Count > 0 then
  begin
    if not(Member is TGeneratableClass) then
      Strings.Add(Format('// %s', [Member.MemberName]));
    Strings.AddStringListWrapper(MemberStringListWrapper);
    Strings.Add('');
  end;
end;

procedure TGeneratableUnit.AppendMemberStringListWrapper(const StringBuilder:
    TStringBuilder; const GetMemberStringListWrapper: TFunc<TGeneratableInUnit,
    IStringListWrapper>);
var
  Strings: IStringListWrapper;
begin
  Strings := TStringListWrapper.Create();
  RunOnClassesAndMethods(
    procedure(Member: TGeneratableInUnit)
    begin
      AppendMember(Strings, Member, GetMemberStringListWrapper);
    end
  );
  StringBuilder.Append(Strings.Text);
end;

procedure TGeneratableUnit.AppendMemberUses(const StringBuilder: TStringBuilder; const GetMemberStringListWrapper: TFunc<TGeneratableInUnit,
  IStringListWrapper>);
var
  UnitNameList: IStringListWrapper;
  UnitName: string;
  First: Boolean;
begin
  UnitNameList := TStringListWrapper.Create();

  RunOnClassesAndMethods(
    procedure(Member: TGeneratableInUnit)
    begin
      AppendUsesList(UnitNameList, Member, GetMemberStringListWrapper);
    end
  );

  if UnitNameList.Count > 0 then
  begin
    StringBuilder.AppendLine('uses');
    First := True;
    for UnitName in UnitNameList do
    begin
      if First then
        First := False
      else
        StringBuilder.AppendLine(',');
      StringBuilder.AppendFormat('  %s', [UnitName]);
    end;
    StringBuilder.AppendLine(';');
    StringBuilder.AppendLine();
  end;
end;

procedure TGeneratableUnit.AppendUsesList(const UnitNameList: IStringListWrapper; const Member: TGeneratableInUnit;
  const GetMemberStringListWrapper: TFunc<TGeneratableInUnit, IStringListWrapper>);
var
  MemberUnitNameList: IStringListWrapper;
  UnitName: string;
begin
  MemberUnitNameList := GetMemberStringListWrapper(Member);
  for UnitName in MemberUnitNameList do
  begin
    if -1 = UnitNameList.IndexOf(UnitName) then
      UnitNameList.Add(UnitName);
  end;
end;

procedure TGeneratableUnit.InitializeOrCreateFields;
begin
  inherited InitializeOrCreateFields();
  FClasses := TListOfGeneratableClass.Create();
  FMethods := TListOfGeneratableMethod.Create();
  FFinalImplementationComments := TListOfString.Create();
end;

procedure TGeneratableUnit.RunOnClassesAndMethods(const Proc: TGeneratableInUnitProc);
var
  Visibility: TVisibility;
begin
  for Visibility := Low(TVisibility) to High(TVisibility) do
    RunOnClassesAndMethods(Proc, Visibility);
end;

procedure TGeneratableUnit.RunOnClassesAndMethods(const Proc: TGeneratableInUnitProc; const WithVisibility: TVisibility);
var
  Member: TGeneratableInUnit;
begin
  for Member in Classes do
    RunOnMember(Member, Proc, WithVisibility);
  for Member in Methods do
    RunOnMember(Member, Proc, WithVisibility);
end;

function TGeneratableUnit.ToString: string;
var
  StringBuilder: TStringBuilder;
begin
  StringBuilder := TStringBuilder.Create();
  try
    StringBuilder.AppendLine(Format('unit %s;', [MemberName]));
    StringBuilder.AppendLine();
    StringBuilder.AppendLine('interface');
    StringBuilder.AppendLine();
    AppendInterfaceUses(StringBuilder);
    AppendInterfaceText(StringBuilder);
    StringBuilder.AppendLine('implementation');
    StringBuilder.AppendLine();
    AppendImplementationUses(StringBuilder);
    AppendImplementationText(StringBuilder);
    AppendInitialization(StringBuilder);
    AppendFinalization(StringBuilder);
    StringBuilder.AppendLine('end.');
    Result := StringBuilder.ToString;
  finally
    StringBuilder.Free;
  end;
end;

constructor TGeneratable.Create(Owner: TComponent);
begin
  inherited Create(Owner);
  InitializeOrCreateFields();
  Self.MemberName := '';
end;

constructor TGeneratable.Create(const Owner: TComponent; const MemberName:
    string);
begin
  Assert(MemberName <> NullAsStringValue, Format('%s requires a non-empty MemberName', [ClassName]));
  inherited Create(Owner);
  InitializeOrCreateFields();
  Self.MemberName := MemberName;
end;

destructor TGeneratable.Destroy;
begin
  inherited Destroy;
end;

procedure TGeneratable.InitializeOrCreateFields;
begin
end;

procedure TGeneratable.RunOnMember(const Member: TGeneratableInUnit; const Proc: TGeneratableInUnitProc; const WithVisibility: TVisibility);
begin
  if Member.Visibility = WithVisibility then
    Proc(Member);
end;

procedure TGeneratable.SetMemberName(const Value: string);
begin
  FMemberName := Value;
end;

constructor TGeneratableClass.Create(const Owner: TComponent; const MemberName: string; const AncestorName: string = 'TObject';
  const RequiresForwardDeclaration: Boolean = False);
begin
  inherited Create(Owner, MemberName);
  Self.AncestorName := AncestorName;
  Self.RequiresForwardDeclaration := RequiresForwardDeclaration;
end;

destructor TGeneratableClass.Destroy;
begin
  FreeAndNil(FProperties);
  FreeAndNil(FMethods);
  FreeAndNil(FFields);
  FreeAndNil(FConstants);
  inherited Destroy;
end;

procedure TGeneratableClass.CollectMembersWithVisibility<T>(const Target: TListOfGeneratableInUnit; const Source: TList<T>;
  const Visibility: TVisibility);
var
  Member: TGeneratableInUnit;
begin
  for Member in Source do
  begin
    if Member.Visibility = Visibility then
      Target.Add(Member);
  end;
end;

procedure TGeneratableClass.FillSubMembers(const SubMembers:
    TListOfGeneratableInUnit);
var
  Member: TGeneratableInUnitMaintainingUsesLists;
begin
  for Member in Constants do
    SubMembers.Add(Member);
  for Member in Fields do
    SubMembers.Add(Member);
  for Member in Methods do
    SubMembers.Add(Member);
  for Member in Properties do
    SubMembers.Add(Member);
end;

function TGeneratableClass.GetDeclaration: string;
var
  Content: IStringListWrapper;
  Visibility: TVisibility;
  Members: TListOfGeneratableInUnit;
  Member: TGeneratableInUnit;
  VisibilityText: string;
  HaveGeneratableConstants: Boolean;
begin
  Content := TStringListWrapper.Create();
  Content.Add(Format('  %s = class(%s)', [MemberName, AncestorName]));
  for Visibility := Low(TVisibility) to High(TVisibility) do
  begin
    Members := TListOfGeneratableInUnit.Create();
    try
      CollectMembersWithVisibility<TGeneratableConstant>(Members, Constants, Visibility);
      HaveGeneratableConstants := Members.Count > 0;
      CollectMembersWithVisibility<TGeneratableFieldOrConstant>(Members, Fields, Visibility);
      CollectMembersWithVisibility<TGeneratableMethod>(Members, Methods, Visibility);
      CollectMembersWithVisibility<TGeneratableProperty>(Members, Properties, Visibility);
      if Members.Count > 0 then
      begin
        VisibilityText := Self.GetVisibility(Visibility);
        if VisibilityText <> NullAsStringValue then
          Content.Add(Format('  %s', [VisibilityText]));
        if HaveGeneratableConstants then
        begin
          Content.Add('    const');
          for Member in Constants do
            Content.AddStringListWrapper(Member.InterfaceText);
        end;
        for Member in Members do
        begin
          if not (Member is TGeneratableConstant) then
            Content.AddStringListWrapper(Member.InterfaceText);
        end;
      end;
    finally
      Members.Free;
    end;
  end;
  Content.Add('  end;');
  Result := Content.Text;
end;

function TGeneratableClass.GetForwardDeclaration: string;
begin
  Result := Format(' %s = class;', [MemberName]);
end;

function TGeneratableClass.GetImplementationText: IStringListWrapper;
var
  Method: TGeneratableMethod;
begin
  Result := TStringListWrapper.Create();
  if Methods.Count > 0 then
  begin
    Result.Add(Format('{ %s }', [MemberName]));
    for Method in Methods do
      Result.AddStringListWrapper(Method.ImplementationText);
  end;
end;

function TGeneratableClass.GetInterfaceText: IStringListWrapper;
begin
  Result := TStringListWrapper.Create();
  Result.Text := Declaration;
end;

function TGeneratableClass.GetConstants: TListOfGeneratableConstant;
begin
  Result := FConstants;
end;

function TGeneratableClass.GetFields: TListOfGeneratableField;
begin
  Result := FFields;
end;

function TGeneratableClass.GetHasSubMembers: Boolean;
begin
  Result := inherited GetHasSubMembers;
  Result := Result or (Constants.Count > 0);
  Result := Result or (Fields.Count > 0);
  Result := Result or (Methods.Count > 0);
  Result := Result or (Properties.Count > 0);
end;

procedure TGeneratableClass.InitializeOrCreateFields;
begin
  inherited InitializeOrCreateFields();
  FConstants := TListOfGeneratableConstant.Create();
  FFields := TListOfGeneratableField.Create();
  FMethods := TListOfGeneratableMethod.Create();
  FProperties := TListOfGeneratableProperty.Create();
  AddSupportedCodeSections([scsImplementationText, scsInterfaceText]);
  if Owner is TGeneratableUnit then (Owner as TGeneratableUnit)
    .Classes.Add(Self);
end;

procedure TGeneratableClass.SetAncestorName(const Value: string);
begin
  FAncestorName := Value;
end;

procedure TGeneratableClass.SetRequiresForwardDeclaration(const Value: Boolean);
begin
  FRequiresForwardDeclaration := Value;
end;

constructor TGeneratableMethod.Create(const Owner: TComponent; const MemberName: string; const Visibility: TVisibility = vDefault;
  const BindingKind: TBindingKind = bkRegular; const IsOverload: Boolean = False);
begin
  inherited Create(Owner, MemberName);
  Self.Visibility := Visibility;
  Self.BindingKind := BindingKind;
  Self.IsOverload := IsOverload;
end;

destructor TGeneratableMethod.Destroy;
begin
  FBodyText := nil;
  FLocalVars.Free();
  inherited Destroy;
end;

function TGeneratableMethod.GetBindingKindSuffix: string;
begin
  case BindingKind of
    bkRegular:
      Result := '';
    bkVirtual:
      Result := 'virtual';
    bkDynamic:
      Result := 'dynamic';
    bkMessage:
      Result := 'message';
    bkOverride:
      Result := 'override';
  else
    raise ENotSupportedException.Create('unknown BindingKind in TGeneratableMethod.GetBindingKindSuffix');
  end;
end;

function TGeneratableMethod.GetBodyText: IStringListWrapper;
begin
  Result := FBodyText;
end;

function TGeneratableMethod.GetLocalVars: TStringDictionaryOfString;
begin
  Result := FLocalVars;
end;

function TGeneratableMethod.GetImplementationText: IStringListWrapper;
var
  Key: string;
  Value: string;
begin
  Result := TStringListWrapper.Create();
  Result.Add('');
  Result.Add(GetMethodSignature(csDefinition));
  if LocalVars.Count > 0 then
  begin
    Result.Add('var');
    for Key in LocalVars.Keys do
    begin
      Value := LocalVars[Key];
      Result.Add(Format('  %s: %s;', [Key, Value]));
    end;
  end;
  Result.Add('begin');
  Result.AddStringListWrapper(BodyText);
  Result.Add('end;');
end;

function TGeneratableMethod.GetInterfaceText: IStringListWrapper;
begin
  Result := TStringListWrapper.Create();
  Result.Add(GetMethodSignature(csDeclaration));
end;

function TGeneratableMethod.GetMehodKindPrefix: string;
begin
  case MethodKind of
    mkProcedure:
      Result := 'procedure';
    mkFunction:
      Result := 'function';
    mkConstructor:
      Result := 'constructor';
    mkDestructor:
      Result := 'destructor';
    mkClassProcedure:
      Result := 'classs procedure';
    mkClassFunction:
      Result := 'class function';
    mkClassConstructor:
      Result := 'class constructor';
    mkClassDestructor:
      Result := 'class destructor';
    mkOperatorOverload:
      Result := 'operator';
    mkSafeProcedure:
      raise ENotSupportedException.Create('mkSafeProcedure is not supported as in TGeneratableMethod.GetMehodKindPrefix');
    mkSafeFunction:
      raise ENotSupportedException.Create('mkSafeFunction is not supported as in TGeneratableMethod.GetMehodKindPrefix');
  else
    raise ENotSupportedException.Create('unknown MethodKind in TGeneratableMethod.GetMehodKindPrefix');
  end;
end;

function TGeneratableMethod.GetMethodSignature(const ClassSection: TClassSection = csDeclaration): string;
var
  StringBuilder: TStringBuilder;
  DefinitionPrefix: string;
  OwnerName: string;
  BindingKindSuffix: string;
begin
  StringBuilder := TStringBuilder.Create;
  try
    if ClassSection = csDeclaration then
      Indent(StringBuilder);

    DefinitionPrefix := NullAsStringValue;
    if ClassSection = csDefinition then
      if Assigned(Owner) then
        if Owner is TGeneratableClass then
        begin
          OwnerName := (Owner as TGeneratableClass).MemberName;
          if OwnerName <> NullAsStringValue then
            DefinitionPrefix := Format('%s.', [OwnerName]);
        end;

    StringBuilder.AppendFormat('%s %s%s(', [GetMehodKindPrefix, DefinitionPrefix, Self.MemberName]);
    StringBuilder.Append(Parameters);
    StringBuilder.Append(')');
    if ReturnType <> '' then
      StringBuilder.AppendFormat(': %s', [ReturnType]);
    StringBuilder.Append(';');
    if ClassSection = csDeclaration then
    begin
      if IsOverload then
        StringBuilder.Append(' overload;');
      BindingKindSuffix := GetBindingKindSuffix;
      if BindingKindSuffix <> NullAsStringValue then
        StringBuilder.AppendFormat(' %s;', [BindingKindSuffix]);
    end;
    Result := StringBuilder.ToString;
  finally
    StringBuilder.Free;
  end;
end;

procedure TGeneratableMethod.InitializeOrCreateFields;
begin
  inherited InitializeOrCreateFields();
  AddSupportedCodeSections([scsImplementationText, scsInterfaceText]);
  BindingKind := bkVirtual;
  FBodyText := TStringListWrapper.Create();
  FLocalVars := TStringDictionaryOfString.Create();
  if Owner is TGeneratableClass then (Owner as TGeneratableClass)
    .Methods.Add(Self);
end;

procedure TGeneratableMethod.SetBindingKind(const Value: TBindingKind);
begin
  FBindingKind := Value;
end;

procedure TGeneratableMethod.SetIsOverload(const Value: Boolean);
begin
  FIsOverload := Value;
end;

procedure TGeneratableMethod.SetMethodKind(const Value: TMethodKind);
begin
  FMethodKind := Value;
end;

procedure TGeneratableMethod.SetReturnType(const Value: string);
begin
  FReturnType := Value;
  if Value = NullAsStringValue then
    case MethodKind of
      mkFunction:
        MethodKind := mkProcedure;
      mkClassFunction:
        MethodKind := mkClassProcedure;
      mkSafeFunction:
        MethodKind := mkSafeProcedure;
    end
  else
    case MethodKind of
      mkProcedure:
        MethodKind := mkFunction;
      mkClassProcedure:
        MethodKind := mkClassFunction;
      mkSafeProcedure:
        MethodKind := mkSafeFunction;
    end;
end;

procedure TGeneratableMethod.SetParameters(const Value: string);
begin
  FParameters := Value;
end;

destructor TFreeFormatGeneratableInUnit.Destroy;
begin
  FFinalizationText := nil;
  FImplementationText := nil;
  FInterfaceText := nil;
  FInitializationText := nil;
  inherited Destroy;
end;

function TFreeFormatGeneratableInUnit.GetFinalizationText: IStringListWrapper;
begin
  Result := FFinalizationText;
end;

function TFreeFormatGeneratableInUnit.GetImplementationText: IStringListWrapper;
begin
  Result := FImplementationText;
end;

function TFreeFormatGeneratableInUnit.GetInitializationText: IStringListWrapper;
begin
  Result := FInitializationText;
end;

function TFreeFormatGeneratableInUnit.GetInterfaceText: IStringListWrapper;
begin
  Result := FInterfaceText;
end;

procedure TFreeFormatGeneratableInUnit.InitializeOrCreateFields;
begin
  inherited InitializeOrCreateFields();
  FFinalizationText := TStringListWrapper.Create();
  FImplementationText := TStringListWrapper.Create();
  FInterfaceText := TStringListWrapper.Create();
  FInitializationText := TStringListWrapper.Create();
end;

destructor TGeneratableInUnitMaintainingUsesLists.Destroy;
begin
  FImplementationUnits := nil;
  FInterfaceUnits := nil;
  inherited Destroy;
end;

function TGeneratableInUnitMaintainingUsesLists.GetImplementationUnits: IStringListWrapper;
begin
  Result := FImplementationUnits;
end;

function TGeneratableInUnitMaintainingUsesLists.GetInterfaceUnits: IStringListWrapper;
begin
  Result := FInterfaceUnits;
end;

procedure TGeneratableInUnitMaintainingUsesLists.InitializeOrCreateFields;
begin
  inherited InitializeOrCreateFields();
  FImplementationUnits := TStringListWrapper.Create();
  FInterfaceUnits := TStringListWrapper.Create();
  SetSupportedCodeSections([scsImplementationUnits, scsInterfaceUnits]);
end;

constructor TGeneratableProperty.Create(const Owner: TComponent; const MemberName, TypeName: string; const Visibility: TVisibility = vDefault);
begin
  inherited Create(Owner, MemberName);
  Self.TypeName := TypeName;
  Self.Visibility := Visibility;
end;

function TGeneratableProperty.GetInterfaceText: IStringListWrapper;
var
  StringBuilder: TStringBuilder;
begin
  StringBuilder := TStringBuilder.Create;
  try
    Indent(StringBuilder);

    StringBuilder.AppendFormat('property %s', [MemberName]);

    if TypeName <> NullAsStringValue then
      StringBuilder.AppendFormat(': %s', [TypeName]);

    if ReadMember <> NullAsStringValue then
      StringBuilder.AppendFormat(' read %s', [ReadMember]);

    if WriteMember <> NullAsStringValue then
      StringBuilder.AppendFormat(' write %s', [WriteMember]);
    StringBuilder.Append(';');
    Result := TStringListWrapper.Create();
    Result.Add(StringBuilder.ToString);
  finally
    StringBuilder.Free;
  end;
end;

procedure TGeneratableProperty.InitializeOrCreateFields;
begin
  inherited InitializeOrCreateFields();
  AddSupportedCodeSections([scsInterfaceText]);
  if Owner is TGeneratableClass then (Owner as TGeneratableClass)
    .Properties.Add(Self);
end;

procedure TGeneratableProperty.SetReadMember(const Value: string);
begin
  FReadMember := Value;
end;

procedure TGeneratableProperty.SetTypeName(const Value: string);
begin
  FTypeName := Value;
end;

procedure TGeneratableProperty.SetWriteMember(const Value: string);
begin
  FWriteMember := Value;
end;

constructor TGeneratableConstant.Create(const Owner: TComponent; const MemberName, Value: string; const TypeName: string = ''; const Visibility:
    TVisibility = vDefault);
begin
  inherited Create(Owner, MemberName, TypeName, Visibility);
  Self.Value := Value;
end;

function TGeneratableConstant.GetConstantExpressionPart: string;
begin
  Result := Format(' = %s', [Value]);
end;

function TGeneratableConstant.GetRequiresTypeName: Boolean;
begin
  Result := False;
end;

procedure TGeneratableConstant.Indent(const StringBuilder: TStringBuilder);
begin
  inherited Indent(StringBuilder);
  StringBuilder.Append(STwoSpaces);
end;

procedure TGeneratableConstant.InitializeOrCreateFields;
begin
  inherited InitializeOrCreateFields();
  if Owner is TGeneratableClass then
  begin
    (Owner as TGeneratableClass).Constants.Add(Self);
    (Owner as TGeneratableClass).Fields.Remove(Self);
  end;
end;

procedure TGeneratableConstant.SetValue(const Value: string);
begin
  FValue := Value;
end;

constructor TGeneratableFieldOrConstant.Create(const Owner: TComponent; const MemberName, TypeName: string; const Visibility:
    TVisibility = vDefault);
begin
  if RequiresTypeName then
    Assert(TypeName <> NullAsStringValue, Format('%s requires a non-empty TypeName parameter', [ClassName]));
  inherited Create(Owner, MemberName);
  Self.TypeName := TypeName;
  Self.Visibility := Visibility;
end;

function TGeneratableFieldOrConstant.GetConstantExpressionPart: string;
begin
  Result := '';
end;

function TGeneratableFieldOrConstant.GetInterfaceText: IStringListWrapper;
var
  ConstantValueText: string;
  StringBuilder: TStringBuilder;
begin
  StringBuilder := TStringBuilder.Create;
  try
    Indent(StringBuilder);
    StringBuilder.AppendFormat('%s', [MemberName]);
    if TypeName <> NullAsStringValue then
      StringBuilder.AppendFormat(': %s', [TypeName]);

    ConstantValueText := ConstantExpressionPart;
    StringBuilder.AppendFormat('%s', [ConstantValueText]);
    StringBuilder.Append(';');

    Result := TStringListWrapper.Create();
    Result.Add(StringBuilder.ToString);
  finally
    StringBuilder.Free;
  end;
end;

function TGeneratableFieldOrConstant.GetRequiresTypeName: Boolean;
begin
  Result := True;
end;

procedure TGeneratableFieldOrConstant.InitializeOrCreateFields;
begin
  inherited InitializeOrCreateFields();
  AddSupportedCodeSections([scsInterfaceText]);
  if Owner is TGeneratableClass then
    (Owner as TGeneratableClass).Fields.Add(Self);
end;

procedure TGeneratableFieldOrConstant.SetTypeName(const Value: string);
begin
  FTypeName := Value;
end;

end.
