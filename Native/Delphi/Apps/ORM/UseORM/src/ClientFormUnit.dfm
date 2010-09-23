object ClientForm: TClientForm
  Left = 0
  Top = 0
  Caption = 'ClientForm'
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 643
    Height = 41
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 0
    object ClientListButton: TButton
      Left = 16
      Top = 9
      Width = 175
      Height = 25
      Caption = 'ClientListButton'
      TabOrder = 0
      OnClick = ClientListButtonClick
    end
    object GenderListButton: TButton
      Left = 208
      Top = 9
      Width = 175
      Height = 25
      Caption = 'GenderListButton'
      TabOrder = 1
      OnClick = GenderListButtonClick
    end
  end
end
