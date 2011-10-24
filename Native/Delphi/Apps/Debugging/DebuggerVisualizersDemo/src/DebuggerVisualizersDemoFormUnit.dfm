object DebuggerVisualizersDemoForm: TDebuggerVisualizersDemoForm
  Left = 0
  Top = 0
  Caption = 'DebuggerVisualizersDemoForm'
  ClientHeight = 337
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    635
    337)
  PixelsPerInch = 96
  TextHeight = 13
  object HighFrequencyWordsButton: TButton
    Left = 8
    Top = 8
    Width = 300
    Height = 25
    Caption = 'HighFrequencyWordsButton'
    TabOrder = 0
    OnClick = HighFrequencyWordsButtonClick
  end
  object DateTime_Time_Date_Button: TButton
    Left = 8
    Top = 39
    Width = 300
    Height = 25
    Caption = 'DateTime_Time_Date_Button'
    TabOrder = 1
    OnClick = DateTime_Time_Date_ButtonClick
  end
  object Button3: TButton
    Left = 8
    Top = 70
    Width = 300
    Height = 25
    Caption = 'Button3'
    TabOrder = 2
  end
  object Memo1: TMemo
    Left = 8
    Top = 101
    Width = 619
    Height = 228
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
  end
end
