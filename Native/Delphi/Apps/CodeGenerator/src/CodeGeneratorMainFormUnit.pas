unit CodeGeneratorMainFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, StringListWrapperUnit,
  ConcreteMethodReferencesUnit, NullablesUnit, CodeGeneratorUnit;

type
  TCodeGeneratorMainForm = class(TForm)
    Panel1: TPanel;
    GenerateUnitButton: TButton;
    GeneratedUnitGroupBox: TGroupBox;
    GeneratedUnitMemo: TMemo;
    Edit1: TEdit;
    procedure GenerateUnitButtonClick(Sender: TObject);
  private
    procedure GenerateClasses(TheUnit: TGeneratableUnit);
    procedure GenerateRecords(TheUnit: TGeneratableUnit);
  strict protected
    procedure ForEach(
      const StringListWrapper: IStringListWrapper;
      const Proc: TStringStringProc); virtual;
  end;

var
  CodeGeneratorMainForm: TCodeGeneratorMainForm;

implementation

const
  SDoChanged = 'DoChanged';

{$R *.dfm}

procedure TCodeGeneratorMainForm.GenerateUnitButtonClick(Sender: TObject);
var
  TheUnit: TGeneratableUnit;
  TheEnumeration: TGeneratableEnumeration;
begin
  TheUnit := TGeneratableUnit.Create(nil, 'GeneratedUnit');
  try
    TheEnumeration := TGeneratableEnumeration.Create(TheUnit, 'TDateTimeFormat');
    TheEnumeration.Identifiers.Add('dtfDateOnly');
    TheEnumeration.Identifiers.Add('dtfTimeOnly');
    TheEnumeration.Identifiers.Add('dtfDateTime');

    GenerateRecords(TheUnit);

    GenerateClasses(TheUnit);

    GeneratedUnitMemo.Text := TheUnit.ToString;
  finally
    TheUnit.Free;
  end;
end;

procedure TCodeGeneratorMainForm.ForEach(
  const StringListWrapper: IStringListWrapper;
  const Proc: TStringStringProc);
var
  Name: string;
  Value: string;
  Index: Integer;
begin
  for Index := 0 to StringListWrapper.Count - 1 do
  begin
    Name := StringListWrapper.Names[Index];
    Value := StringListWrapper.Values[Name];
    Proc(Name, Value);
  end;
end;

procedure TCodeGeneratorMainForm.GenerateRecords(TheUnit: TGeneratableUnit);
var
  TheRecord: TGeneratableRecord;
begin
  TheRecord := TGeneratableRecord.Create(TheUnit, 'TNullableDateTime');
(*
  TNullableDateTime = record
  strict private
    FIsFilled: Boolean;
    FValue: TDateTime;
    function GetIsNull: Boolean;
    procedure SetIsNull(const Value: Boolean);
    procedure SetValue(const Value: TDateTime);
    procedure SetIsFilled(const Value: Boolean);
  public
    procedure Clear;
    class function DateTimeToStr(aDateTime: TDateTime; IncludeSecs: Boolean = False; IncludeMSecs: Boolean = False): string; static;
    class function DateToStr(const Date: TDate): string; static;
    class function Compare(a, b: TNullableDateTime): Integer; static;
    class function FillableDateToStr(fdt: TNullableDateTime): string; static;
    function ToDateString: string;
    class function Null: TNullableDateTime; static;
    function IncYear(const ANumberOfYears: Integer = 1): TNullableDateTime;
    //##jpl: convert to Create Constructor?
    class function Parse(const Value: string; const FormatSettings: TFormatSettings): TNullableDateTime; static;
    class function TimeToStr(aTime: TTime; IncludeSecs: Boolean = False; IncludeMSecs: Boolean = False): string; static;
    function ToLongDayName: string;
    function ToString(const aIncludeSec: Boolean = False; const aIncludeMSec: Boolean = False): string; overload;
    function ToString(const FormatSettings: TFormatSettings; const DateTimeFormat: TDateTimeFormat): string; overload;
    function ToString(const DateTimeFormat: TDateTimeFormat): string; overload;
    function ToTimeString: string;
    function YearOf: Word;
    class operator Implicit(aValue: TDateTime): TNullableDateTime; overload;
    class operator Implicit(aValue: Variant): TNullableDateTime; overload;
    class operator NotEqual(a, b: TNullableDateTime): Boolean;
    //    procedure Clear; //jpl: not yet needed
    property IsFilled: Boolean read FIsFilled write SetIsFilled;
    property IsNull: Boolean read GetIsNull write SetIsNull;
    property Value: TDateTime read FValue write SetValue;
  end;
*)
end;

procedure TCodeGeneratorMainForm.GenerateClasses(TheUnit: TGeneratableUnit);
var
  TheField: TGeneratableField;
  TheMethod: TGeneratableMethod;
  SetMethodName: string;
  TheProperty: TGeneratableProperty;
  TheActualClass: TGeneratableClass;
  TheConstant: TGeneratableConstant;
  TheNotificationMethod: TGeneratableMethod;
  TheBaseClass: TGeneratableClass;
  PropertyNames: IStringListWrapper;
  GetMethodName: string;
begin
  TheBaseClass := TGeneratableClass.Create(TheUnit, 'TBasePerson', 'TComponent');
  TheBaseClass.InterfaceUnits.Add('Classes');
  TheNotificationMethod := TGeneratableMethod.Create(
    TheBaseClass, SDoChanged, vPublic, bkVirtual);
  PropertyNames := TStringListWrapper.Create;
  PropertyNames.Values['FirstName'] := 'string';
  PropertyNames.Values['Initials'] := 'string';
  PropertyNames.Values['LastName'] := 'string';
  PropertyNames.Values['Age'] := 'Integer';
  TheConstant := TGeneratableConstant.Create(TheBaseClass, 'MyPi', '3.14', 'Double', vPublic);
  TheConstant := TGeneratableConstant.Create(TheBaseClass, 'MyE', '2.72', '', vPublic);
  //Generics: show the method CollectMembersWithVisibility and its usage
  ForEach(PropertyNames,
      procedure (Name, Value: string)
      begin
        TheField := TGeneratableField.Create(
          TheBaseClass, 'F' + Name, Value, vStrictPrivate);
      end);
  ForEach(PropertyNames,
      procedure (Name, Value: string)
      begin
        GetMethodName := 'Get' + Name;
        TheMethod := TGeneratableMethod.Create(TheBaseClass,
          GetMethodName, vStrictProtected, bkVirtual, True);
        TheMethod.ReturnType := Value;
        TheMethod.BodyText.Add(Format('  Result := F%s;', [Name]));
      end);
  ForEach(PropertyNames, procedure (Name, Value: string)
  begin
        GetMethodName := 'Get' + Name;
        SetMethodName := 'Set' + Name;
        TheMethod := TGeneratableMethod.Create(TheBaseClass, SetMethodName, vStrictProtected, bkVirtual, True);
        TheMethod.Parameters := 'Value: ' + Value;
        TheMethod.BodyText.Add(Format('  F%s := Value;', [Name]));
        TheMethod.BodyText.Add(Format('  %s();', [TheNotificationMethod.MemberName]));

        TheProperty := TGeneratableProperty.Create(TheBaseClass, Name, Value, vPublic);
        TheProperty.ReadMember := GetMethodName;
        TheProperty.WriteMember := SetMethodName;
      end);
  TheActualClass := TGeneratableClass.Create(TheUnit, 'TActualPerson', TheBaseClass.MemberName, True);
  TheNotificationMethod := TGeneratableMethod.Create(TheActualClass, SDoChanged, vPublic, bkOverride);
  TheNotificationMethod.LocalVars.Add('Foo', 'string');
  TheNotificationMethod.BodyText.Append('  Beep();');
  TheNotificationMethod.InterfaceUnits.Add('SysUtils');
  ForEach(PropertyNames, procedure (Name, Value: string)
  begin
        TheProperty := TGeneratableProperty.Create(
          TheActualClass, Name, '', vPublished);
      end);
end;

end.

