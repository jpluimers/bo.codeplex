program UseORMProject;

uses
  FastMM4BootstrapUnit in '..\src\FastMM4BootstrapUnit.pas',
  Forms,
  UseORMMainFormUnit in '..\src\UseORMMainFormUnit.pas' {UseORMMainForm},
  ClientFormUnit in '..\src\ClientFormUnit.pas' {ClientForm},
  LazyFormFactoryUnit in '..\..\..\..\bo.Generics\LazyFormFactoryUnit.pas',
  ORMEntityListFactoryDataModuleIUnit in '..\src\ORMEntityListFactoryDataModuleIUnit.pas' {ORMEntityListFactoryDataModule: TDataModule},
  ClientDetailFormUnit in '..\src\ClientDetailFormUnit.pas' {ClientDetailForm},
  ORMEntityUnit in '..\..\..\..\bo.ORM\ORMEntityUnit.pas',
  MSConnectionLayerUnit in '..\..\..\..\bo.DB\bo.DB.MS\MSConnectionLayerUnit.pas',
  DataSetEnumeratorUnit in '..\..\..\..\bo.DB\DataSetEnumeratorUnit.pas',
  DataSetHelperUnit in '..\..\..\..\bo.DB\bo.DB.Helpers\DataSetHelperUnit.pas',
  MSConnectionDataModuleUnit in '..\..\..\..\bo.DB\bo.DB.MS\MSConnectionDataModuleUnit.pas' {MSConnectionDataModule: TDataModule},
  ADOConnectionStringBuilderUnit in '..\..\..\..\bo.DB\bo.DB.MS\ADOConnectionStringBuilderUnit.pas',
  BaseTypesUnit in '..\..\..\..\bo.System\BaseTypesUnit.pas',
  ComponentHelperUnit in '..\..\..\..\bo.Helpers\ComponentHelperUnit.pas',
  MSConfigUnit in '..\..\..\..\bo.DB\bo.DB.MS\MSConfigUnit.pas',
  FormatSettingsHelperUnit in '..\..\..\..\bo.Helpers\FormatSettingsHelperUnit.pas',
  MathUnit in '..\..\..\..\bo.System\MathUnit.pas',
  StringUtilsUnit in '..\..\..\..\bo.Text\StringUtilsUnit.pas',
  FieldNameHelperUnit in '..\..\..\..\bo.DB\bo.DB.Helpers\FieldNameHelperUnit.pas',
  ApplicationHelperUnit in '..\..\..\..\bo.Helpers\ApplicationHelperUnit.pas',
  ScreenSupportUnit in '..\..\..\..\bo.VCL\ScreenSupportUnit.pas',
  FieldHelperUnit in '..\..\..\..\bo.DB\bo.DB.Helpers\FieldHelperUnit.pas',
  DbCrackerUnit in '..\..\..\..\bo.DB\DbCrackerUnit.pas',
  SqlConstsUnit in '..\..\..\..\bo.DB\SqlConstsUnit.pas',
  DbDisplayLabelUnit in '..\..\..\..\bo.Controls\DbDisplayLabelUnit.pas',
  DataLinkReflectorUnit in '..\..\..\..\bo.DB\DataLinkReflectorUnit.pas',
  DataAwareControlControllerUnit in '..\..\..\..\bo.Components\bo.Components.DB\DataAwareControlControllerUnit.pas',
  EnumTypeInfoUnit in '..\..\..\..\bo.TypeInfo\EnumTypeInfoUnit.pas',
  DbUtilityUnit in '..\..\..\..\bo.DB\DbUtilityUnit.pas',
  SetTypeInfoUnit in '..\..\..\..\bo.TypeInfo\SetTypeInfoUnit.pas',
  DataAwareControlHelperUnit in '..\..\..\..\bo.DB\DataAwareControlHelperUnit.pas',
  GenericExceptionUnit in '..\..\..\..\bo.Generics\GenericExceptionUnit.pas',
  FastMM4 in '..\..\..\..\..\..\Forks\FastMM\FastMM4.pas',
  FastMM4Messages in '..\..\..\..\..\..\Forks\FastMM\FastMM4Messages.pas',
  ConcreteCollectionsUnit in '..\..\..\..\bo.Generics\ConcreteCollectionsUnit.pas',
  JoinedColumnPairUnit in '..\..\..\..\bo.DB\JoinedColumnPairUnit.pas',
  NullablesUnit in '..\..\..\..\bo.System\NullablesUnit.pas',
  MSDMLQueryRecordUnit in '..\..\..\..\bo.DB\bo.DB.MS\MSDMLQueryRecordUnit.pas',
  AddressBaseUnit in '..\src\ORM\ORM.Base\AddressBaseUnit.pas',
  BaseEntityBaseUnit in '..\src\ORM\ORM.Base\BaseEntityBaseUnit.pas',
  ClientBaseUnit in '..\src\ORM\ORM.Base\ClientBaseUnit.pas',
  DatabaseMetaDataBaseUnit in '..\src\ORM\ORM.Base\DatabaseMetaDataBaseUnit.pas',
  LegalPersonBaseUnit in '..\src\ORM\ORM.Base\LegalPersonBaseUnit.pas',
  NaturalPersonBaseUnit in '..\src\ORM\ORM.Base\NaturalPersonBaseUnit.pas',
  UserPersonBaseUnit in '..\src\ORM\ORM.Base\UserPersonBaseUnit.pas',
  AddressUnit in '..\src\ORM\ORM.Actual\AddressUnit.pas',
  BaseEntityUnit in '..\src\ORM\ORM.Actual\BaseEntityUnit.pas',
  ClientUnit in '..\src\ORM\ORM.Actual\ClientUnit.pas',
  DatabaseMetaDataUnit in '..\src\ORM\ORM.Actual\DatabaseMetaDataUnit.pas',
  LegalPersonUnit in '..\src\ORM\ORM.Actual\LegalPersonUnit.pas',
  NaturalPersonUnit in '..\src\ORM\ORM.Actual\NaturalPersonUnit.pas',
  UserPersonUnit in '..\src\ORM\ORM.Actual\UserPersonUnit.pas',
  ClientDataSetSupportingCalculatedAndLookupFieldsUnit in '..\..\..\..\bo.DB\ClientDataSetSupportingCalculatedAndLookupFieldsUnit.pas',
  SqlWhereCriterionsUnit in '..\..\..\..\bo.DB\SqlWhereCriterionsUnit.pas',
  ClientDataSetSupportingWhereOrderByUnit in '..\..\..\..\bo.DB\ClientDataSetSupportingWhereOrderByUnit.pas',
  StringListWrapperUnit in '..\..\..\..\bo.Text\StringListWrapperUnit.pas',
  GenderBaseUnit in '..\src\ORM\ORM.Base\GenderBaseUnit.pas',
  GenderUnit in '..\src\ORM\ORM.Actual\GenderUnit.pas',
  GenderDetailFormUnit in '..\src\GenderDetailFormUnit.pas' {GenderDetailForm},
  GenderListFormUnit in '..\src\GenderListFormUnit.pas' {GenderListForm},
  ClientListFormUnit in '..\src\ClientListFormUnit.pas' {ClientListForm},
  ORMDetailBaseFormUnit in '..\..\..\..\bo.ORM\ORMDetailBaseFormUnit.pas',
  ORMListBaseFormUnit in '..\..\..\..\bo.ORM\ORMListBaseFormUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TORMEntityListFactoryDataModule, ORMEntityListFactoryDataModule);
  Application.CreateForm(TUseORMMainForm, UseORMMainForm);
  Application.CreateForm(TClientForm, ClientForm);
  Application.CreateForm(TClientDetailForm, ClientDetailForm);
  Application.CreateForm(TGenderDetailForm, GenderDetailForm);
  Application.CreateForm(TGenderListForm, GenderListForm);
  Application.CreateForm(TClientListForm, ClientListForm);
  Application.Run;
end.
