object VoertuigMainForm: TVoertuigMainForm
  Left = 0
  Top = 0
  Caption = 'VoertuigMainForm'
  ClientHeight = 345
  ClientWidth = 473
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    473
    345)
  PixelsPerInch = 96
  TextHeight = 13
  object VoertuigTypeRadioGroup: TRadioGroup
    Left = 8
    Top = 8
    Width = 185
    Height = 57
    Caption = 'VoertuigTypeRadioGroup'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Voertuig'
      'Fiets'
      'Bromfiets'
      'Auto'
      'Personenauto'
      'Vrachtauto')
    TabOrder = 0
  end
  object RijButton: TButton
    Left = 199
    Top = 8
    Width = 75
    Height = 25
    Caption = 'RijButton'
    TabOrder = 1
  end
  object LogMemo: TMemo
    Left = 8
    Top = 71
    Width = 457
    Height = 266
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      'LogMemo')
    TabOrder = 2
  end
end
