object CodeGeneratorMainForm: TCodeGeneratorMainForm
  Left = 0
  Top = 0
  Caption = 'CodeGeneratorMainForm'
  ClientHeight = 348
  ClientWidth = 643
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 643
    Height = 41
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 0
    object GenerateUnitButton: TButton
      Left = 8
      Top = 6
      Width = 149
      Height = 25
      Caption = 'GenerateUnitButton'
      TabOrder = 0
      OnClick = GenerateUnitButtonClick
    end
    object Edit1: TEdit
      Left = 264
      Top = 8
      Width = 121
      Height = 24
      TabOrder = 1
      Text = 'Edit1'
    end
  end
  object GeneratedUnitGroupBox: TGroupBox
    Left = 0
    Top = 41
    Width = 643
    Height = 307
    Align = alClient
    Caption = 'GeneratedUnitGroupBox'
    TabOrder = 1
    object GeneratedUnitMemo: TMemo
      Left = 2
      Top = 18
      Width = 639
      Height = 287
      Align = alClient
      Lines.Strings = (
        'GeneratedUnitMemo')
      TabOrder = 0
    end
  end
end
