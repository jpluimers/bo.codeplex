object GenderListForm: TGenderListForm
  Left = 0
  Top = 0
  Caption = 'GenderListForm'
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
    object NewGenderButton: TButton
      Left = 12
      Top = 9
      Width = 175
      Height = 25
      Caption = 'NewGenderButton'
      TabOrder = 0
      OnClick = NewGenderButtonClick
    end
    object EditGenderButton: TButton
      Left = 193
      Top = 9
      Width = 175
      Height = 25
      Caption = 'EditGenderButton'
      TabOrder = 1
      OnClick = EditGenderButtonClick
    end
  end
  object ClientListDBGrid: TDBGrid
    Left = 0
    Top = 41
    Width = 643
    Height = 307
    Align = alClient
    DataSource = GenderListDataSource
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object GenderListDataSource: TDataSource
    Left = 174
    Top = 104
  end
  object DataAwareControlController1: TDataAwareControlController
    DataSource = ClientDetailForm.DataSource
    Left = 312
    Top = 176
  end
end
