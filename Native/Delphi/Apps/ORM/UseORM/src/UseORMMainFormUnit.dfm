object UseORMMainForm: TUseORMMainForm
  Left = 0
  Top = 0
  Caption = 'UseORMMainForm'
  ClientHeight = 343
  ClientWidth = 642
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 642
    Height = 41
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 0
    object ShowClientListButton: TButton
      Left = 14
      Top = 6
      Width = 183
      Height = 25
      Caption = 'ShowClientListButton'
      TabOrder = 0
      OnClick = ShowClientListButtonClick
    end
  end
end
