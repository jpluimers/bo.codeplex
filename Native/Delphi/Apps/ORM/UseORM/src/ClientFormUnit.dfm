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
    object NewClientButton: TButton
      Left = 12
      Top = 9
      Width = 149
      Height = 25
      Caption = 'NewClientButton'
      TabOrder = 0
      OnClick = NewClientButtonClick
    end
    object FilteredCheckBox: TCheckBox
      Left = 408
      Top = 13
      Width = 97
      Height = 17
      Caption = 'FilteredCheckBox'
      TabOrder = 1
      OnClick = FilteredCheckBoxClick
    end
  end
  object ClientListDBGrid: TDBGrid
    Left = 0
    Top = 41
    Width = 643
    Height = 307
    Align = alClient
    DataSource = ClientListDataSource
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object ClientListDataSource: TDataSource
    Left = 174
    Top = 104
  end
end
