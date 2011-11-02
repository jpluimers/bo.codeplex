object XokumDataBindingForm: TXokumDataBindingForm
  Left = 0
  Top = 0
  Caption = 'XokumDataBindingForm'
  ClientHeight = 348
  ClientWidth = 643
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 643
    Height = 137
    Align = alTop
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 0
    object LoadXokumXmlButton: TButton
      Left = 12
      Top = 9
      Width = 149
      Height = 25
      Caption = 'Load Xokum Xml'
      TabOrder = 0
      OnClick = LoadXokumXmlButtonClick
    end
    object AchternaamLabeledEdit: TLabeledEdit
      Left = 248
      Top = 10
      Width = 121
      Height = 21
      EditLabel.Width = 58
      EditLabel.Height = 13
      EditLabel.Caption = 'Achternaam'
      LabelPosition = lpLeft
      TabOrder = 1
    end
    object VoorlettersLabeledEdit: TLabeledEdit
      Left = 248
      Top = 34
      Width = 121
      Height = 21
      EditLabel.Width = 53
      EditLabel.Height = 13
      EditLabel.Caption = 'Voorletters'
      LabelPosition = lpLeft
      TabOrder = 2
    end
    object StraatLabeledEdit: TLabeledEdit
      Left = 248
      Top = 58
      Width = 121
      Height = 21
      EditLabel.Width = 30
      EditLabel.Height = 13
      EditLabel.Caption = 'Straat'
      LabelPosition = lpLeft
      TabOrder = 3
    end
    object NummerLabeledEdit: TLabeledEdit
      Left = 248
      Top = 82
      Width = 121
      Height = 21
      EditLabel.Width = 39
      EditLabel.Height = 13
      EditLabel.Caption = 'Nummer'
      LabelPosition = lpLeft
      TabOrder = 4
    end
    object AbonneenummerLabeledEdit: TLabeledEdit
      Left = 248
      Top = 106
      Width = 121
      Height = 21
      EditLabel.Width = 81
      EditLabel.Height = 13
      EditLabel.Caption = 'Abonneenummer'
      LabelPosition = lpLeft
      TabOrder = 5
    end
    object AddSubscriberButton: TButton
      Left = 12
      Top = 106
      Width = 149
      Height = 25
      Caption = '&Add Subscriber'
      TabOrder = 6
      OnClick = AddSubscriberButtonClick
    end
  end
  object LogMemo: TMemo
    Left = 0
    Top = 137
    Width = 643
    Height = 211
    Align = alClient
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
end
