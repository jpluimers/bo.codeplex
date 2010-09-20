object ClientDetailForm: TClientDetailForm
  Left = 0
  Top = 0
  Caption = 'ClientDetailForm'
  ClientHeight = 570
  ClientWidth = 1042
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
    Width = 1042
    Height = 41
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 0
  end
  object Panel3: TPanel
    Left = 0
    Top = 529
    Width = 1042
    Height = 41
    Align = alBottom
    Caption = 'Panel1'
    TabOrder = 1
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
    Width = 1042
    Height = 488
    Align = alClient
    TabOrder = 2
    object ID_ClientDbDisplayLabel: TDbDisplayLabel
      Left = 13
      Top = 8
      Width = 165
      Height = 17
      FocusControl = ID_ClientDbEdit
    end
    object EID_NaturalPersonDbDisplayLabel: TDbDisplayLabel
      Left = 13
      Top = 50
      Width = 165
      Height = 17
      FocusControl = EID_NaturalPersonDbEdit
    end
    object ID_Company_LegalPersonDbDisplayLabel: TDbDisplayLabel
      Left = 13
      Top = 92
      Width = 165
      Height = 17
      FocusControl = ID_Company_LegalPersonDbEdit
    end
    object ID_NaturalPersonDbDisplayLabel: TDbDisplayLabel
      Left = 13
      Top = 134
      Width = 165
      Height = 17
      FocusControl = ID_NaturalPersonDbEdit
    end
    object EID_BaseEntityDbDisplayLabel: TDbDisplayLabel
      Left = 13
      Top = 176
      Width = 165
      Height = 17
      FocusControl = EID_BaseEntityDbEdit
    end
    object FirstNameDbDisplayLabel: TDbDisplayLabel
      Left = 13
      Top = 218
      Width = 165
      Height = 17
      FocusControl = FirstNameDbEdit
    end
    object InitialsDbDisplayLabel: TDbDisplayLabel
      Left = 13
      Top = 260
      Width = 165
      Height = 17
      FocusControl = InitialsDbEdit
    end
    object LastNameDbDisplayLabel: TDbDisplayLabel
      Left = 13
      Top = 302
      Width = 165
      Height = 17
      FocusControl = LastNameDbEdit
    end
    object BirthDateDbDisplayLabel: TDbDisplayLabel
      Left = 13
      Top = 344
      Width = 165
      Height = 17
      FocusControl = BirthDateDbEdit
    end
    object PlaceOfBirthDbDisplayLabel: TDbDisplayLabel
      Left = 13
      Top = 386
      Width = 165
      Height = 17
      FocusControl = PlaceOfBirthDbEdit
    end
    object SSNDbDisplayLabel: TDbDisplayLabel
      Left = 13
      Top = 428
      Width = 165
      Height = 17
      FocusControl = SSNDbEdit
    end
    object ID_BaseEntityDbDisplayLabel: TDbDisplayLabel
      Left = 259
      Top = 8
      Width = 165
      Height = 17
      FocusControl = ID_BaseEntityDbEdit
    end
    object ExternalIDDbDisplayLabel: TDbDisplayLabel
      Left = 259
      Top = 50
      Width = 165
      Height = 17
      FocusControl = ExternalIDDbEdit
    end
    object ID_UserPersonInsertDbDisplayLabel: TDbDisplayLabel
      Left = 259
      Top = 92
      Width = 165
      Height = 17
      FocusControl = ID_UserPersonInsertDbEdit
    end
    object TimeStampInsertDbDisplayLabel: TDbDisplayLabel
      Left = 259
      Top = 134
      Width = 165
      Height = 17
      FocusControl = TimeStampInsertDbEdit
    end
    object ID_UserPersonUpdateDbDisplayLabel: TDbDisplayLabel
      Left = 259
      Top = 176
      Width = 165
      Height = 17
      FocusControl = ID_UserPersonUpdateDbEdit
    end
    object TimeStampLastUpdateDbDisplayLabel: TDbDisplayLabel
      Left = 259
      Top = 218
      Width = 165
      Height = 17
      FocusControl = TimeStampLastUpdateDbEdit
    end
    object StartDateTimeDbDisplayLabel: TDbDisplayLabel
      Left = 259
      Top = 260
      Width = 165
      Height = 17
      FocusControl = StartDateTimeDbEdit
    end
    object FinishDateTimeDbDisplayLabel: TDbDisplayLabel
      Left = 259
      Top = 302
      Width = 165
      Height = 17
      FocusControl = FinishDateTimeDbEdit
    end
    object RemarkDbDisplayLabel: TDbDisplayLabel
      Left = 259
      Top = 344
      Width = 165
      Height = 17
      FocusControl = RemarkDbEdit
    end
    object ID_ClientDbEdit: TDBEdit
      Left = 10
      Top = 22
      Width = 221
      Height = 21
      TabOrder = 0
    end
    object EID_NaturalPersonDbEdit: TDBEdit
      Left = 10
      Top = 64
      Width = 221
      Height = 21
      TabOrder = 1
    end
    object ID_Company_LegalPersonDbEdit: TDBEdit
      Left = 10
      Top = 106
      Width = 221
      Height = 21
      TabOrder = 2
    end
    object ID_NaturalPersonDbEdit: TDBEdit
      Left = 10
      Top = 148
      Width = 221
      Height = 21
      TabOrder = 3
    end
    object EID_BaseEntityDbEdit: TDBEdit
      Left = 10
      Top = 190
      Width = 221
      Height = 21
      TabOrder = 4
    end
    object FirstNameDbEdit: TDBEdit
      Left = 10
      Top = 232
      Width = 221
      Height = 21
      TabOrder = 5
    end
    object InitialsDbEdit: TDBEdit
      Left = 10
      Top = 274
      Width = 221
      Height = 21
      TabOrder = 6
    end
    object LastNameDbEdit: TDBEdit
      Left = 10
      Top = 316
      Width = 221
      Height = 21
      TabOrder = 7
    end
    object BirthDateDbEdit: TDBEdit
      Left = 10
      Top = 358
      Width = 221
      Height = 21
      TabOrder = 8
    end
    object PlaceOfBirthDbEdit: TDBEdit
      Left = 10
      Top = 400
      Width = 221
      Height = 21
      TabOrder = 9
    end
    object SSNDbEdit: TDBEdit
      Left = 10
      Top = 442
      Width = 221
      Height = 21
      TabOrder = 10
    end
    object ID_BaseEntityDbEdit: TDBEdit
      Left = 256
      Top = 22
      Width = 221
      Height = 21
      TabOrder = 11
    end
    object ExternalIDDbEdit: TDBEdit
      Left = 256
      Top = 64
      Width = 221
      Height = 21
      TabOrder = 12
    end
    object ID_UserPersonInsertDbEdit: TDBEdit
      Left = 256
      Top = 106
      Width = 221
      Height = 21
      TabOrder = 13
    end
    object TimeStampInsertDbEdit: TDBEdit
      Left = 256
      Top = 148
      Width = 221
      Height = 21
      TabOrder = 14
    end
    object ID_UserPersonUpdateDbEdit: TDBEdit
      Left = 256
      Top = 190
      Width = 221
      Height = 21
      TabOrder = 15
    end
    object TimeStampLastUpdateDbEdit: TDBEdit
      Left = 256
      Top = 232
      Width = 221
      Height = 21
      TabOrder = 16
    end
    object StartDateTimeDbEdit: TDBEdit
      Left = 256
      Top = 274
      Width = 221
      Height = 21
      TabOrder = 17
    end
    object FinishDateTimeDbEdit: TDBEdit
      Left = 256
      Top = 316
      Width = 221
      Height = 21
      TabOrder = 18
    end
    object RemarkDbEdit: TDBEdit
      Left = 256
      Top = 358
      Width = 221
      Height = 21
      TabOrder = 19
    end
  end
  object DataSource: TDataSource
    Left = 512
    Top = 284
  end
  object DataAwareControlController: TDataAwareControlController
    DataSource = DataSource
    Left = 510
    Top = 116
  end
end
