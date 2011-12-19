	object Form1: TForm1
  Left = 572
  Top = 283
  ActiveControl = DBImage1
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'FISH FACTS'
  ClientHeight = 365
  ClientWidth = 520
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 6
    Top = 8
    Width = 259
    Height = 217
    Hint = 'Scroll grid below to see other fish'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object DBLabel1: TDBText
      Left = 4
      Top = 183
      Width = 249
      Height = 24
      DataField = 'Common_Name'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'MS Serif'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object DBImage1: TDBImage
      Left = 5
      Top = 8
      Width = 248
      Height = 168
      Hint = 'Scroll grid below to see other fish'
      DataField = 'Graphic'
      DataSource = DataSource1
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 275
    Top = 8
    Width = 223
    Height = 22
    TabOrder = 1
    object Label1: TLabel
      Left = 7
      Top = 4
      Width = 56
      Height = 13
      Caption = 'About the'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBLabel2: TDBText
      Left = 67
      Top = 4
      Width = 99
      Height = 13
      AutoSize = True
      DataField = 'Common_Name'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel3: TPanel
    Left = 276
    Top = 32
    Width = 223
    Height = 193
    BevelOuter = bvLowered
    TabOrder = 2
    object DBMemo1: TDBMemo
      Left = 3
      Top = 2
      Width = 217
      Height = 183
      BorderStyle = bsNone
      Color = clSilver
      Ctl3D = False
      DataField = 'Notes'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 230
    Width = 520
    Height = 135
    Align = alBottom
    BevelInner = bvRaised
    BorderStyle = bsSingle
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 411
      Height = 127
      Hint = 'Scroll up/down to see other fish!'
      Align = alLeft
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
    object BitBtn1: TBitBtn
      Left = 424
      Top = 20
      Width = 57
      Height = 29
      Hint = 'Close Fish Facts'
      Caption = 'E&xit'
      TabOrder = 1
      Kind = bkClose
    end
  end
  object DataSource1: TDataSource
    DataSet = IBTable1
    Left = 19
    Top = 193
  end
  object IBDatabase1: TIBDatabase
    Connected = False
    DatabaseName = 'C:\Program Files\Common Files\CodeGear Shared\Data\dbdemos.gdb'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 136
    Top = 88
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    AutoStopAction = saNone
    Left = 226
    Top = 88
  end
  object IBTable1: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    Active = False
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'SPECIES_NO'
        DataType = ftFloat
      end
      item
        Name = 'CATEGORY'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'COMMON_NAME'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'SPECIES_NAME'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'LENGTH__CM_'
        DataType = ftFloat
      end
      item
        Name = 'LENGTH_IN'
        DataType = ftFloat
      end
      item
        Name = 'NOTES'
        DataType = ftMemo
        Size = 8
      end
      item
        Name = 'GRAPHIC'
        DataType = ftBlob
        Size = 8
      end>
    IndexDefs = <
      item
        Name = 'BIOLIFE0'
        Fields = 'SPECIES_NO'
        Options = [ixUnique]
      end>
    StoreDefs = True
    TableName = 'BIOLIFE'
    Left = 170
    Top = 190
  end
end
