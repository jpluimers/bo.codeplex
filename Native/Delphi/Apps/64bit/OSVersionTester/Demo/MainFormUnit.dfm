object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'MainForm'
  ClientHeight = 380
  ClientWidth = 516
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object VersionMemo: TMemo
    Left = 8
    Top = 8
    Width = 500
    Height = 333
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'VersionMemo')
    ParentFont = False
    TabOrder = 1
  end
  object VersionInfoButton: TButton
    Left = 8
    Top = 347
    Width = 155
    Height = 25
    Caption = 'Display Version Info'
    TabOrder = 0
    OnClick = VersionInfoButtonClick
  end
end
