object TypeSizeDemoForm: TTypeSizeDemoForm
  Left = 0
  Top = 0
  Caption = 'Size of Pointer / Integer'
  ClientHeight = 234
  ClientWidth = 482
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
    Left = 66
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
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 66
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
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 66
    Top = 58
    Width = 80
    Height = 13
    Caption = 'Size of NativeInt'
  end
  object NativeIntLabel: TLabel
    Left = 170
    Top = 58
    Width = 30
    Height = 13
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 66
    Top = 77
    Width = 98
    Height = 13
    Caption = 'Size of Tag Property'
  end
  object TagLabel: TLabel
    Left = 170
    Top = 77
    Width = 30
    Height = 13
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 66
    Top = 172
    Width = 92
    Height = 13
    Caption = 'Range of NativeInt'
  end
  object NativeIntRangeLabel: TLabel
    Left = 170
    Top = 172
    Width = 300
    Height = 13
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 66
    Top = 96
    Width = 55
    Height = 13
    Caption = 'Size of Int8'
  end
  object Int8Label: TLabel
    Left = 170
    Top = 96
    Width = 30
    Height = 13
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 66
    Top = 115
    Width = 61
    Height = 13
    Caption = 'Size of Int16'
  end
  object Int16Label: TLabel
    Left = 170
    Top = 115
    Width = 30
    Height = 13
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label10: TLabel
    Left = 66
    Top = 134
    Width = 61
    Height = 13
    Caption = 'Size of Int32'
  end
  object Int32Label: TLabel
    Left = 170
    Top = 134
    Width = 30
    Height = 13
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label12: TLabel
    Left = 66
    Top = 153
    Width = 61
    Height = 13
    Caption = 'Size of Int64'
  end
  object Int64Label: TLabel
    Left = 170
    Top = 153
    Width = 30
    Height = 13
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object TypeSizeButton: TButton
    Left = 72
    Top = 191
    Width = 120
    Height = 25
    Caption = 'Display Sizes'
    TabOrder = 0
    OnClick = TypeSizeButtonClick
  end
end
