{ Copyright (c) 2007-2012 Jeroen Wiert Pluimers for BeSharp.net and better office benelux.
Full BSD License is available at http://besharp.codeplex.com/license and http://bo.codeplex.com/license }

unit TestMainFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Spin, NullableIntegerStaticTextUnit,
  NullableDoubleStaticTextUnit, NumericStaticTextUnit,
  NullableCurrencyStaticTextUnit;

type
  TTestMainForm = class(TForm)
    CustomNullableCurrencyStaticText1: TCustomNullableCurrencyStaticText;
    CustomNullableDoubleStaticText1: TCustomNullableDoubleStaticText;
    NullableIntegerStaticText1: TNullableIntegerStaticText;
    SetNullButton: TButton;
    SetRandomButton: TButton;
    procedure SetNullButtonClick(Sender: TObject);
    procedure SetRandomButtonClick(Sender: TObject);
  end;

var
  TestMainForm: TTestMainForm;

implementation

uses
  NullablesUnit;

{$R *.dfm}

procedure TTestMainForm.SetNullButtonClick(Sender: TObject);
begin
//  NullableIntegerStaticText1.Value.Clear(); // TODO fix this ##jpl: gaat nog niet goed
  NullableIntegerStaticText1.Value :=
    TNullableInteger.Null;
end;

procedure TTestMainForm.SetRandomButtonClick(Sender: TObject);
begin
  NullableIntegerStaticText1.Value :=
    Random(1000);
end;

end.
