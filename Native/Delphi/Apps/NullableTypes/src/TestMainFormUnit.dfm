object TestMainForm: TTestMainForm
  Left = 0
  Top = 0
  Caption = 'TestMainForm'
  ClientHeight = 348
  ClientWidth = 643
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object CustomNullableCurrencyStaticText1: TCustomNullableCurrencyStaticText
    Left = 8
    Top = 8
    Width = 100
    Height = 44
  end
  object CustomNullableDoubleStaticText1: TCustomNullableDoubleStaticText
    Left = 128
    Top = 8
    Width = 100
    Height = 44
  end
  object NullableIntegerStaticText1: TNullableIntegerStaticText
    Left = 256
    Top = 8
    Width = 73
    Height = 44
    ValueEditor.IsNull = False
    ValueEditor.Value = 1234
    TabOrder = 2
  end
  object SetNullButton: TButton
    Left = 8
    Top = 128
    Width = 159
    Height = 25
    Caption = 'SetNullButton'
    TabOrder = 3
    OnClick = SetNullButtonClick
  end
  object SetRandomButton: TButton
    Left = 180
    Top = 128
    Width = 173
    Height = 25
    Caption = 'SetRandomButton'
    TabOrder = 4
    OnClick = SetRandomButtonClick
  end
end
