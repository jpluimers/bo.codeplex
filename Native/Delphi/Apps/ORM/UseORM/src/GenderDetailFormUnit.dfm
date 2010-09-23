object GenderDetailForm: TGenderDetailForm
  Left = 0
  Top = 0
  Caption = 'GenderDetailForm'
  ClientHeight = 385
  ClientWidth = 742
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
    Width = 742
    Height = 41
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 0
    ExplicitLeft = -99
  end
  object Panel3: TPanel
    Left = 0
    Top = 344
    Width = 742
    Height = 41
    Align = alBottom
    Caption = 'Panel3'
    TabOrder = 1
    ExplicitLeft = -99
    ExplicitTop = 307
    object BitBtn1: TBitBtn
      Left = 12
      Top = 10
      Width = 75
      Height = 25
      DoubleBuffered = True
      Kind = bkOK
      NumGlyphs = 2
      ParentDoubleBuffered = False
      TabOrder = 0
    end
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 41
    Width = 742
    Height = 303
    Align = alClient
    TabOrder = 2
    ExplicitWidth = 643
    ExplicitHeight = 266
    object ID_GenderDbDisplayLabel: TDbDisplayLabel
      Left = 13
      Top = 8
      Width = 165
      Height = 17
      FocusControl = ID_GenderDbEdit
    end
    object EID_BaseEntityDbDisplayLabel: TDbDisplayLabel
      Left = 13
      Top = 50
      Width = 165
      Height = 17
      FocusControl = EID_BaseEntityDbEdit
    end
    object NameDbDisplayLabel: TDbDisplayLabel
      Left = 13
      Top = 92
      Width = 165
      Height = 17
      FocusControl = NameDbEdit
    end
    object ID_BaseEntityDbDisplayLabel: TDbDisplayLabel
      Left = 245
      Top = 8
      Width = 165
      Height = 17
      FocusControl = ID_BaseEntityDbEdit
    end
    object ExternalIDDbDisplayLabel: TDbDisplayLabel
      Left = 245
      Top = 50
      Width = 165
      Height = 17
      FocusControl = ExternalIDDbEdit
    end
    object ID_UserPersonInsertDbDisplayLabel: TDbDisplayLabel
      Left = 245
      Top = 92
      Width = 165
      Height = 17
      FocusControl = ID_UserPersonInsertDbEdit
    end
    object TimeStampInsertDbDisplayLabel: TDbDisplayLabel
      Left = 477
      Top = 8
      Width = 165
      Height = 17
      FocusControl = TimeStampInsertDbEdit
    end
    object ID_UserPersonUpdateDbDisplayLabel: TDbDisplayLabel
      Left = 477
      Top = 50
      Width = 165
      Height = 17
      FocusControl = ID_UserPersonUpdateDbEdit
    end
    object TimeStampLastUpdateDbDisplayLabel: TDbDisplayLabel
      Left = 477
      Top = 92
      Width = 165
      Height = 17
      FocusControl = TimeStampLastUpdateDbEdit
    end
    object StartDateTimeDbDisplayLabel: TDbDisplayLabel
      Left = 477
      Top = 134
      Width = 165
      Height = 17
      FocusControl = StartDateTimeDbEdit
    end
    object FinishDateTimeDbDisplayLabel: TDbDisplayLabel
      Left = 477
      Top = 176
      Width = 165
      Height = 17
      FocusControl = FinishDateTimeDbEdit
    end
    object RemarkDbDisplayLabel: TDbDisplayLabel
      Left = 477
      Top = 218
      Width = 165
      Height = 17
      FocusControl = RemarkDbEdit
    end
    object ID_GenderDbEdit: TDBEdit
      Left = 10
      Top = 22
      Width = 221
      Height = 21
      TabOrder = 0
    end
    object EID_BaseEntityDbEdit: TDBEdit
      Left = 10
      Top = 64
      Width = 221
      Height = 21
      TabOrder = 1
    end
    object NameDbEdit: TDBEdit
      Left = 10
      Top = 106
      Width = 221
      Height = 21
      TabOrder = 2
    end
    object ID_BaseEntityDbEdit: TDBEdit
      Left = 242
      Top = 22
      Width = 221
      Height = 21
      TabOrder = 3
    end
    object ExternalIDDbEdit: TDBEdit
      Left = 242
      Top = 64
      Width = 221
      Height = 21
      TabOrder = 4
    end
    object ID_UserPersonInsertDbEdit: TDBEdit
      Left = 242
      Top = 106
      Width = 221
      Height = 21
      TabOrder = 5
    end
    object TimeStampInsertDbEdit: TDBEdit
      Left = 474
      Top = 22
      Width = 221
      Height = 21
      TabOrder = 6
    end
    object ID_UserPersonUpdateDbEdit: TDBEdit
      Left = 474
      Top = 64
      Width = 221
      Height = 21
      TabOrder = 7
    end
    object TimeStampLastUpdateDbEdit: TDBEdit
      Left = 474
      Top = 106
      Width = 221
      Height = 21
      TabOrder = 8
    end
    object StartDateTimeDbEdit: TDBEdit
      Left = 474
      Top = 148
      Width = 221
      Height = 21
      TabOrder = 9
    end
    object FinishDateTimeDbEdit: TDBEdit
      Left = 474
      Top = 190
      Width = 221
      Height = 21
      TabOrder = 10
    end
    object RemarkDbEdit: TDBEdit
      Left = 474
      Top = 232
      Width = 221
      Height = 21
      TabOrder = 11
    end
  end
  object DataAwareControlController: TDataAwareControlController
    DataSource = DataSource
    Left = 294
    Top = 4
  end
  object DataSource: TDataSource
    Left = 408
    Top = 4
  end
end
