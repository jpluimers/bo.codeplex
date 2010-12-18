object FastMMUsageTrackerMainForm: TFastMMUsageTrackerMainForm
  Left = 0
  Top = 0
  Caption = 'FastMMUsageTrackerMainForm'
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
  object ShowFastMMUsageTrackerButton: TButton
    Left = 8
    Top = 8
    Width = 225
    Height = 25
    Caption = 'ShowFastMMUsageTrackerButton'
    TabOrder = 0
    OnClick = ShowFastMMUsageTrackerButtonClick
  end
  object LeakButton: TButton
    Left = 8
    Top = 39
    Width = 75
    Height = 25
    Caption = 'LeakButton'
    TabOrder = 1
    OnClick = LeakButtonClick
  end
end
