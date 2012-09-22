{ Copyright (c) 2007-2012 Jeroen Wiert Pluimers for BeSharp.net and better office benelux.
Full BSD License is available at http://besharp.codeplex.com/license and http://bo.codeplex.com/license }

unit NullableControlsRegistrationUnit;

interface

procedure Register;

implementation

uses
  Classes,
  NullableCurrencyStaticTextUnit,
  NullableDoubleStaticTextUnit,
  NullableIntegerStaticTextUnit;

procedure Register;
begin
  RegisterComponents('bo.Controls.Nullable', [
    NullableCurrencyStaticTextUnit.TCustomNullableCurrencyStaticText,
    NullableDoubleStaticTextUnit.TCustomNullableDoubleStaticText,
    NullableIntegerStaticTextUnit.TNullableIntegerStaticText
  ]);
end;

end.
