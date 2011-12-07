object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'MainForm'
  ClientHeight = 236
  ClientWidth = 572
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 16
    Top = 56
    Width = 31
    Height = 13
    Caption = 'Label2'
  end
  object StaticText1: TStaticText
    Left = 96
    Top = 16
    Width = 28
    Height = 17
    Caption = 'Edit1'
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 96
    Top = 53
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '26'
    OnChange = Edit1Change
  end
  object TrackBar1: TTrackBar
    Left = 88
    Top = 96
    Width = 150
    Height = 45
    Max = 200
    TabOrder = 2
    OnChange = TrackBar1Change
  end
  object ScrollBar1: TScrollBar
    Left = 96
    Top = 147
    Width = 121
    Height = 17
    PageSize = 0
    TabOrder = 3
    OnChange = ScrollBar1Change
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    UseAppManager = True
    Left = 248
    Top = 24
    object BindExpression1: TBindExpression
      Category = 'Binding Expressions'
      ControlComponent = StaticText1
      SourceComponent = Edit1
      SourceExpression = 
        'UpperCase(Text) + " " + ToStr(Left) + " " + Font.Name + " " + Pa' +
        'rent.Label2.Caption'
      ControlExpression = 'Caption'
      NotifyOutputs = False
      Direction = dirSourceToControl
    end
    object BindExpression2: TBindExpression
      Category = 'Binding Expressions'
      ControlComponent = TrackBar1
      SourceComponent = Edit1
      SourceExpression = 'Left'
      ControlExpression = 'Position'
      NotifyOutputs = False
      Direction = dirBidirectional
    end
    object BindExpression3: TBindExpression
      Category = 'Binding Expressions'
      ControlComponent = TrackBar1
      SourceComponent = ScrollBar1
      SourceExpression = 'Position'
      ControlExpression = 'Position'
      NotifyOutputs = False
      Direction = dirBidirectional
    end
  end
end
