object TypeSizeDemoForm: TTypeSizeDemoForm
  Left = 0
  Top = 0
  Caption = 'Size of Pointer / Integer'
  ClientHeight = 100
  ClientWidth = 280
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 80
    Top = 20
    Width = 69
    Height = 13
    Caption = 'Size of Pointer'
  end
  object PointerLabel: TLabel
    Left = 170
    Top = 20
    Width = 30
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 80
    Top = 39
    Width = 71
    Height = 13
    Caption = 'Size of Integer'
  end
  object IntegerLabel: TLabel
    Left = 170
    Top = 39
    Width = 30
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object TypeSizeButton: TButton
    Left = 80
    Top = 58
    Width = 123
    Height = 25
    Caption = 'Display Sizes'
    TabOrder = 0
    OnClick = TypeSizeButtonClick
  end
end
