object XmlMapperForm: TXmlMapperForm
  Left = 0
  Top = 0
  Caption = 'XmlMapperForm'
  ClientHeight = 348
  ClientWidth = 693
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
    Width = 693
    Height = 41
    Align = alTop
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 0
    ExplicitWidth = 643
    object DBNavigator1: TDBNavigator
      Left = 12
      Top = 8
      Width = 240
      Height = 25
      DataSource = XokumDataSource
      TabOrder = 0
    end
    object OpenButton: TButton
      Left = 264
      Top = 9
      Width = 75
      Height = 25
      Caption = 'OpenButton'
      TabOrder = 1
      OnClick = OpenButtonClick
    end
    object CloseButton: TButton
      Left = 345
      Top = 9
      Width = 75
      Height = 25
      Caption = 'CloseButton'
      TabOrder = 2
      OnClick = CloseButtonClick
    end
    object ApplyUpdatesButton: TButton
      Left = 426
      Top = 9
      Width = 125
      Height = 25
      Caption = 'ApplyUpdatesButton'
      TabOrder = 3
      OnClick = ApplyUpdatesButtonClick
    end
    object SaveToFileButton: TButton
      Left = 557
      Top = 9
      Width = 125
      Height = 25
      Caption = 'SaveToFileButton'
      TabOrder = 4
      OnClick = SaveToFileButtonClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 693
    Height = 307
    Align = alClient
    DataSource = XokumDataSource
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object XokumDataSource: TDataSource
    DataSet = XokumDataModule.XokumClientDataSet
    Left = 108
    Top = 120
  end
end
