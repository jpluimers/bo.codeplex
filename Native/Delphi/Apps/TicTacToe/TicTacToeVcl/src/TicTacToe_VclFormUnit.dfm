object VclForm: TVclForm
  Left = 0
  Top = 0
  Caption = 'TicTacToe.VclForm'
  ClientHeight = 299
  ClientWidth = 590
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object CurrentPlayerLabel: TLabel
    Left = 8
    Top = 106
    Width = 74
    Height = 13
    Caption = 'Current player:'
  end
  object BoardButton1: TButton
    Left = 8
    Top = 8
    Width = 25
    Height = 25
    Caption = '1'
    TabOrder = 0
    OnClick = BoardButtonClick
  end
  object BoardButton2: TButton
    Left = 39
    Top = 8
    Width = 25
    Height = 25
    Caption = '2'
    TabOrder = 1
    OnClick = BoardButtonClick
  end
  object BoardButton3: TButton
    Left = 70
    Top = 8
    Width = 25
    Height = 25
    Caption = '3'
    TabOrder = 2
    OnClick = BoardButtonClick
  end
  object BoardButton4: TButton
    Left = 8
    Top = 39
    Width = 25
    Height = 25
    Caption = '4'
    TabOrder = 3
    OnClick = BoardButtonClick
  end
  object BoardButton5: TButton
    Left = 39
    Top = 39
    Width = 25
    Height = 25
    Caption = '5'
    TabOrder = 4
    OnClick = BoardButtonClick
  end
  object BoardButton6: TButton
    Left = 70
    Top = 39
    Width = 25
    Height = 25
    Caption = '6'
    TabOrder = 5
    OnClick = BoardButtonClick
  end
  object BoardButton7: TButton
    Left = 8
    Top = 70
    Width = 25
    Height = 25
    Caption = '7'
    TabOrder = 6
    OnClick = BoardButtonClick
  end
  object BoardButton8: TButton
    Left = 38
    Top = 70
    Width = 25
    Height = 25
    Caption = '8'
    TabOrder = 7
    OnClick = BoardButtonClick
  end
  object BoardButton9: TButton
    Left = 70
    Top = 70
    Width = 25
    Height = 25
    Caption = '9'
    TabOrder = 8
    OnClick = BoardButtonClick
  end
  object StartNewGameWithPlayerXButton: TButton
    Left = 8
    Top = 125
    Width = 117
    Height = 25
    Caption = 'Start new game with X'
    TabOrder = 9
    OnClick = StartNewGameWithPlayerXButtonClick
  end
  object StartNewGameWithPlayerOButton: TButton
    Left = 8
    Top = 156
    Width = 117
    Height = 25
    Caption = 'Start new game with O'
    TabOrder = 10
    OnClick = StartNewGameWithPlayerOButtonClick
  end
  object ComputerPlaysXCheckBox: TCheckBox
    Left = 8
    Top = 193
    Width = 117
    Height = 17
    Caption = 'Computer plays X'
    TabOrder = 11
  end
  object ComputerPlaysOCheckBox: TCheckBox
    Left = 8
    Top = 224
    Width = 117
    Height = 17
    Caption = 'Computer plays O'
    TabOrder = 12
  end
  object ClearBoardButton: TButton
    Left = 131
    Top = 8
    Width = 125
    Height = 25
    Caption = 'Clear Board'
    TabOrder = 13
    OnClick = ClearBoardButtonClick
  end
  object ViewToBoardButton: TButton
    Left = 131
    Top = 39
    Width = 125
    Height = 25
    Caption = 'ViewToBoard'
    TabOrder = 14
    OnClick = ViewToBoardButtonClick
  end
  object BoardToViewButton: TButton
    Left = 131
    Top = 70
    Width = 125
    Height = 25
    Caption = 'BoardToView'
    TabOrder = 15
    OnClick = BoardToViewButtonClick
  end
  object TestButtonSquareButton: TButton
    Left = 131
    Top = 101
    Width = 125
    Height = 25
    Caption = 'TestButtonSquare'
    TabOrder = 16
    OnClick = TestButtonSquareButtonClick
  end
  object OneSecondTimer: TTimer
    OnTimer = OneSecondTimerTimer
    Left = 152
    Top = 152
  end
end
