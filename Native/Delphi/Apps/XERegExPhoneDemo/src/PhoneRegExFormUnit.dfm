object PhoneRegExForm: TPhoneRegExForm
  Left = 0
  Top = 0
  Caption = 'PhoneRegExForm'
  ClientHeight = 184
  ClientWidth = 242
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    242
    184)
  PixelsPerInch = 96
  TextHeight = 13
  object PhoneNumberLabeledEdit: TLabeledEdit
    Left = 8
    Top = 24
    Width = 121
    Height = 21
    EditLabel.Width = 122
    EditLabel.Height = 13
    EditLabel.Caption = 'PhoneNumberLabeledEdit'
    TabOrder = 0
    Text = '1-800-444-4444'
  end
  object TestPhoneNumberButton: TButton
    Left = 8
    Top = 51
    Width = 121
    Height = 25
    Caption = 'TestPhoneNumberButton'
    Default = True
    TabOrder = 1
    OnClick = TestPhoneNumberButtonClick
  end
  object ResultMemo: TMemo
    Left = 8
    Top = 82
    Width = 226
    Height = 89
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      'ResultMemo')
    TabOrder = 2
  end
end
