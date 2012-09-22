program VCLTestProject;

uses
  Forms,
  TestMainFormUnit in '..\src\TestMainFormUnit.pas' {TestMainForm},
  FieldHelperUnit in '..\src\FieldHelperUnit.pas',
  NullableIntegerStaticTextUnit in '..\..\..\bo.Controls\bo.Controls.Nullable\NullableIntegerStaticTextUnit.pas',
  NumericStaticTextUnit in '..\..\..\bo.Controls\bo.Controls.Nullable\NumericStaticTextUnit.pas',
  NullablesUnit in '..\..\..\bo.System\NullablesUnit.pas',
  MathUnit in '..\..\..\bo.System\MathUnit.pas',
  BaseTypesUnit in '..\..\..\bo.System\BaseTypesUnit.pas',
  FormatSettingsHelperUnit in '..\..\..\bo.Helpers\FormatSettingsHelperUnit.pas',
  ControlUtilsUnit in '..\..\..\bo.Controls\bo.Controls.Nullable\ControlUtilsUnit.pas',
  SetTypeInfoUnit in '..\..\..\bo.TypeInfo\SetTypeInfoUnit.pas',
  NullableWrappersUnit in '..\..\..\bo.Controls\bo.Controls.Nullable\NullableWrappersUnit.pas',
  NullableDoubleStaticTextUnit in '..\..\..\bo.Controls\bo.Controls.Nullable\NullableDoubleStaticTextUnit.pas',
  NullableCurrencyStaticTextUnit in '..\..\..\bo.Controls\bo.Controls.Nullable\NullableCurrencyStaticTextUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TTestMainForm, TestMainForm);
  Application.Run;
end.
