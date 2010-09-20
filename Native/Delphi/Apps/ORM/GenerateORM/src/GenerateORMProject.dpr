program GenerateORMProject;

uses
  Forms,
  GenerateORMMainFormUnit in 'GenerateORMMainFormUnit.pas' {GenerateORMMainForm},
  ReportersUnit in '..\..\..\..\bo.Logging\ReportersUnit.pas',
  LoggersUnit in '..\..\..\..\bo.Logging\LoggersUnit.pas',
  ReporterUnit in '..\..\..\..\bo.Logging\ReporterUnit.pas',
  LoggerUnit in '..\..\..\..\bo.Logging\LoggerUnit.pas',
  MSSystemItemUnit in '..\..\..\..\bo.DB\bo.DB.MS\MSSystemItemUnit.pas',
  MSSystemTableUnit in '..\..\..\..\bo.DB\bo.DB.MS\MSSystemTableUnit.pas',
  RecordTypeInfoUnit in '..\..\..\..\bo.TypeInfo\RecordTypeInfoUnit.pas',
  SetTypeInfoUnit in '..\..\..\..\bo.TypeInfo\SetTypeInfoUnit.pas',
  EnumTypeInfoUnit in '..\..\..\..\bo.TypeInfo\EnumTypeInfoUnit.pas',
  MSConnectionDataModuleUnit in '..\..\..\..\bo.DB\bo.DB.MS\MSConnectionDataModuleUnit.pas' {MSConnectionDataModule: TDataModule},
  MSSystemColumnUnit in '..\..\..\..\bo.DB\bo.DB.MS\MSSystemColumnUnit.pas',
  MSConnectionLayerUnit in '..\..\..\..\bo.DB\bo.DB.MS\MSConnectionLayerUnit.pas',
  ADOConnectionStringBuilderUnit in '..\..\..\..\bo.DB\bo.DB.MS\ADOConnectionStringBuilderUnit.pas',
  MSConfigUnit in '..\..\..\..\bo.DB\bo.DB.MS\MSConfigUnit.pas',
  NullablesUnit in '..\..\..\..\bo.System\NullablesUnit.pas',
  ApplicationHelperUnit in '..\..\..\..\bo.Helpers\ApplicationHelperUnit.pas',
  BaseTypesUnit in '..\..\..\..\bo.System\BaseTypesUnit.pas',
  FormatSettingsHelperUnit in '..\..\..\..\bo.Helpers\FormatSettingsHelperUnit.pas',
  MathUnit in '..\..\..\..\bo.System\MathUnit.pas',
  FieldNameHelperUnit in '..\..\..\..\bo.DB\bo.DB.Helpers\FieldNameHelperUnit.pas',
  FileUnit in '..\..\..\..\bo.IO\FileUnit.pas',
  ORMCodeGeneratorUnit in '..\..\..\..\bo.ORM\ORMCodeGeneratorUnit.pas',
  StringUtilsUnit in '..\..\..\..\bo.Text\StringUtilsUnit.pas',
  CodeGeneratorUnit in '..\..\..\..\bo.CodeGenerator\CodeGeneratorUnit.pas',
  StringListWrapperUnit in '..\..\..\..\bo.Text\StringListWrapperUnit.pas',
  SqlConstsUnit in '..\..\..\..\bo.DB\SqlConstsUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TGenerateORMMainForm, GenerateORMMainForm);
  Application.Run;
end.
