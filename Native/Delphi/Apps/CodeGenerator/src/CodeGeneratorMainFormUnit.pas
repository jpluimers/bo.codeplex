unit CodeGeneratorMainFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, StringListWrapperUnit,
  ConcreteMethodReferencesUnit;

type
  TCodeGeneratorMainForm = class(TForm)
    Panel1: TPanel;
    GenerateUnitButton: TButton;
    GeneratedUnitGroupBox: TGroupBox;
    GeneratedUnitMemo: TMemo;
    procedure GenerateUnitButtonClick(Sender: TObject);
  strict protected
    procedure ForEach(
      const StringListWrapper: IStringListWrapper;
      const Proc: TStringStringProc); virtual;
  end;

var
  CodeGeneratorMainForm: TCodeGeneratorMainForm;

implementation

uses
  CodeGeneratorUnit;

const
  SDoChanged = 'DoChanged';

{$R *.dfm}

procedure TCodeGeneratorMainForm.GenerateUnitButtonClick(Sender: TObject);
var
  GetMethodName: string;
  PropertyNames: IStringListWrapper;
  SetMethodName: string;
  TheUnit: TGeneratableUnit;
  TheBaseClass: TGeneratableClass;
  TheNotificationMethod: TGeneratableMethod;
  TheConstant: TGeneratableConstant;
  TheField: TGeneratableField;
  TheMethod: TGeneratableMethod;
  TheProperty: TGeneratableProperty;
  TheActualClass: TGeneratableClass;
begin
  TheUnit := TGeneratableUnit.Create(nil, 'GeneratedUnit');
  try
    TheBaseClass := TGeneratableClass.Create(TheUnit, 'TBasePerson', 'TComponent');
    TheBaseClass.InterfaceUnits.Add('Classes');

    TheNotificationMethod := TGeneratableMethod.Create(
      TheBaseClass, SDoChanged, vPublic, bkVirtual);

    PropertyNames := TStringListWrapper.Create();
    PropertyNames.Values['FirstName'] := 'string';
    PropertyNames.Values['Initials'] := 'string';
    PropertyNames.Values['LastName'] := 'string';
    PropertyNames.Values['Age'] := 'Integer';

    TheConstant := TGeneratableConstant.Create(
      TheBaseClass, 'MyPi', '3.14', 'Double', vPublic);

    TheConstant := TGeneratableConstant.Create(
      TheBaseClass, 'MyE', '2.72', '', vPublic);

    //Generics: show the method CollectMembersWithVisibility and its usage
    ForEach(PropertyNames,
      procedure (Name, Value: string)
      begin
        TheField := TGeneratableField.Create(
          TheBaseClass, 'F' + Name, Value, vStrictPrivate);
      end
    );

    ForEach(PropertyNames,
      procedure (Name, Value: string)
      begin
        GetMethodName := 'Get' + Name;
        TheMethod := TGeneratableMethod.Create(TheBaseClass,
          GetMethodName, vStrictProtected, bkVirtual, True);
        TheMethod.ReturnType := Value;
        TheMethod.BodyText.Add(Format('  Result := F%s;', [Name]));
      end
    );

    ForEach(PropertyNames,
      procedure (Name, Value: string)
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
      end
    );

    TheActualClass := TGeneratableClass.Create(TheUnit, 'TActualPerson',
      TheBaseClass.MemberName, True);

    TheNotificationMethod := TGeneratableMethod.Create(TheActualClass,
      SDoChanged, vPublic, bkOverride);
    TheNotificationMethod.LocalVars.Add('Foo', 'string');
    TheNotificationMethod.BodyText.Append('  Beep();');
    TheNotificationMethod.InterfaceUnits.Add('SysUtils');

    ForEach(PropertyNames,
      procedure (Name, Value: string)
      begin
        TheProperty := TGeneratableProperty.Create(
          TheActualClass, Name, '', vPublished);
      end
    );

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

end.

