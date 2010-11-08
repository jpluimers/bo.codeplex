object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'MainForm'
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
  object Splitter1: TSplitter
    Left = 185
    Top = 41
    Height = 307
    ExplicitLeft = 328
    ExplicitTop = 136
    ExplicitHeight = 100
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 643
    Height = 41
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 0
    object LogButton: TButton
      Left = 8
      Top = 10
      Width = 75
      Height = 25
      Caption = 'LogButton'
      TabOrder = 0
      OnClick = LogButtonClick
    end
  end
  object LogRadioGroup: TRadioGroup
    Left = 0
    Top = 41
    Width = 185
    Height = 307
    Align = alLeft
    Caption = 'LogRadioGroup'
    TabOrder = 1
  end
  object LogMemo: TMemo
    Left = 188
    Top = 41
    Width = 455
    Height = 307
    Align = alClient
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
end
