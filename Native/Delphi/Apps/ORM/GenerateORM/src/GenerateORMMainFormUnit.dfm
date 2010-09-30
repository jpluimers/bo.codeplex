object GenerateORMMainForm: TGenerateORMMainForm
  Left = 0
  Top = 0
  ActiveControl = OnlyBaseObjectsCheckBox
  Caption = 'GenerateORMMainForm'
  ClientHeight = 555
  ClientWidth = 502
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Padding.Left = 4
  Padding.Top = 4
  Padding.Right = 4
  Padding.Bottom = 4
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object DatabasePanel: TPanel
    Left = 4
    Top = 4
    Width = 494
    Height = 225
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object LeftRightBevel: TBevel
      Left = 216
      Top = -2
      Width = 6
      Height = 217
      Shape = bsLeftLine
    end
    object SQLServerNameLabeledEdit: TLabeledEdit
      Left = 0
      Top = 14
      Width = 200
      Height = 21
      EditLabel.Width = 54
      EditLabel.Height = 13
      EditLabel.Caption = 'SQL Server'
      TabOrder = 0
      Text = '.\SQLEXPRESS'
    end
    object SQLUserNameLabeledEdit: TLabeledEdit
      Left = 0
      Top = 118
      Width = 200
      Height = 21
      EditLabel.Width = 48
      EditLabel.Height = 13
      EditLabel.Caption = 'Username'
      TabOrder = 3
      Text = 'Developer'
    end
    object SQLPasswordLabeledEdit: TLabeledEdit
      Left = 0
      Top = 160
      Width = 200
      Height = 21
      EditLabel.Width = 46
      EditLabel.Height = 13
      EditLabel.Caption = 'Password'
      PasswordChar = '*'
      TabOrder = 4
      Text = 'programmer'
    end
    object SQLDatabaseLabeledEdit: TLabeledEdit
      Left = 0
      Top = 56
      Width = 200
      Height = 21
      EditLabel.Width = 46
      EditLabel.Height = 13
      EditLabel.Caption = 'Database'
      TabOrder = 1
      Text = 'ORM'
    end
    object ConnectToDatabaseButton: TButton
      Left = 0
      Top = 187
      Width = 200
      Height = 25
      Caption = '&Connect to database'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 5
      OnClick = ConnectToDatabaseButtonClick
    end
    object SQLServerUseIntegratedSecurityCheckBox: TCheckBox
      Left = 0
      Top = 83
      Width = 200
      Height = 17
      Caption = 'Use Integrated Security'
      Checked = True
      State = cbChecked
      TabOrder = 2
      OnClick = SQLServerUseIntegratedSecurityCheckBoxClick
    end
    object GenerateORMUnitsButton: TButton
      Left = 228
      Top = 186
      Width = 265
      Height = 25
      Caption = '&Generate ORM units'
      DoubleBuffered = True
      Enabled = False
      ParentDoubleBuffered = False
      TabOrder = 6
      OnClick = GenerateORMUnitsButtonClick
    end
    object OutputDirectoryLabeledEdit: TLabeledEdit
      Left = 228
      Top = 14
      Width = 265
      Height = 21
      EditLabel.Width = 176
      EditLabel.Height = 13
      EditLabel.Caption = 'Output directory for generated units'
      TabOrder = 7
      Text = 'c:\temp\orm'
    end
    object WarnForOverwriteCheckBox: TCheckBox
      Left = 228
      Top = 94
      Width = 265
      Height = 25
      Caption = '&Warn when overwriting .pas file'
      Checked = True
      State = cbChecked
      TabOrder = 8
    end
    object OnlyBaseObjectsCheckBox: TCheckBox
      Left = 228
      Top = 118
      Width = 265
      Height = 25
      Caption = 'Generate &only base objects'
      Checked = True
      State = cbChecked
      TabOrder = 9
    end
    object AutoSelectAllTablesCheckBox: TCheckBox
      Left = 228
      Top = 142
      Width = 265
      Height = 25
      Caption = 'Automatically &select all tables upon connect'
      Checked = True
      State = cbChecked
      TabOrder = 10
    end
  end
  object TablesPanel: TPanel
    Left = 4
    Top = 229
    Width = 494
    Height = 141
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object TablesCheckListBox: TCheckListBox
      Left = 0
      Top = 0
      Width = 216
      Height = 141
      Align = alClient
      ItemHeight = 13
      PopupMenu = TablesPopupMenu
      TabOrder = 0
      OnClick = TablesCheckListBoxClick
    end
    object ColumnsMemo: TMemo
      Left = 216
      Top = 0
      Width = 278
      Height = 141
      Align = alRight
      ParentColor = True
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 1
    end
  end
  object GeneratorPanel: TPanel
    Left = 4
    Top = 370
    Width = 494
    Height = 181
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      494
      181)
    object GeneratorStatusLabel: TLabel
      Left = 0
      Top = 2
      Width = 31
      Height = 13
      Caption = 'Status'
    end
    object StatusMemo: TMemo
      Left = 0
      Top = 16
      Width = 494
      Height = 163
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      ParentColor = True
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object TablesPopupMenu: TPopupMenu
    Left = 114
    Top = 272
    object SelectAllMenuItem: TMenuItem
      Caption = 'Select all'
    end
    object DeselectAllMenuItem: TMenuItem
      Caption = 'Select none'
    end
  end
end
