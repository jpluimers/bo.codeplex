object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'MainForm'
  ClientHeight = 573
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 394
    Top = 155
    Height = 418
    ExplicitLeft = 328
    ExplicitTop = 136
    ExplicitHeight = 100
  end
  object ActionPanel: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 155
    Align = alTop
    TabOrder = 0
    DesignSize = (
      792
      155)
    object XPathLabeledEdit: TLabeledEdit
      Left = 40
      Top = 7
      Width = 750
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      EditLabel.Width = 28
      EditLabel.Height = 13
      EditLabel.Caption = 'X&Path'
      LabelPosition = lpLeft
      TabOrder = 0
      Text = '//bk:Book[position()<=2]'
    end
    object RunButton: TButton
      Left = 40
      Top = 34
      Width = 125
      Height = 25
      Caption = '&Run XPath'
      TabOrder = 1
      OnClick = RunButtonClick
    end
    object LoadXmlButton: TButton
      Left = 171
      Top = 34
      Width = 125
      Height = 25
      Caption = '&Load XML file'
      TabOrder = 5
      OnClick = LoadXmlButtonClick
    end
    object ShowNameSpacesButton: TButton
      Left = 40
      Top = 65
      Width = 125
      Height = 25
      Caption = 'Show &namespaces'
      TabOrder = 2
      OnClick = ShowNameSpacesButtonClick
    end
    object ShowXmlInResultCheckBox: TCheckBox
      Left = 171
      Top = 127
      Width = 139
      Height = 17
      Caption = '&Show XML in the results'
      TabOrder = 9
    end
    object ShowTextInResultCheckBox: TCheckBox
      Left = 40
      Top = 127
      Width = 125
      Height = 17
      Caption = 'Show &text in results'
      TabOrder = 4
    end
    object LoadXmlExample1Button: TButton
      Left = 171
      Top = 65
      Width = 125
      Height = 25
      Caption = 'Load Example &1'
      TabOrder = 6
      OnClick = LoadXmlExample1ButtonClick
    end
    object LoadXmlExample2Button: TButton
      Left = 171
      Top = 96
      Width = 125
      Height = 25
      Caption = 'Load Example &2'
      TabOrder = 7
      OnClick = LoadXmlExample2ButtonClick
    end
    object HistoryGroupBox: TGroupBox
      Left = 302
      Top = 34
      Width = 486
      Height = 115
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = '&History'
      TabOrder = 8
      object HistoryListBox: TListBox
        Left = 2
        Top = 15
        Width = 482
        Height = 98
        Align = alClient
        ItemHeight = 13
        TabOrder = 0
        OnClick = HistoryListBoxClick
      end
    end
    object ShowMsxml6Version: TButton
      Left = 40
      Top = 96
      Width = 125
      Height = 25
      Caption = 'Show MSXML6 &version'
      TabOrder = 3
      OnClick = ShowMsxml6VersionClick
    end
  end
  object ResultsGroupBox: TGroupBox
    Left = 397
    Top = 155
    Width = 395
    Height = 418
    Align = alClient
    Caption = '&Results'
    TabOrder = 1
    object ResultsMemo: TMemo
      Left = 2
      Top = 15
      Width = 391
      Height = 401
      Align = alClient
      ScrollBars = ssBoth
      TabOrder = 0
      WordWrap = False
    end
  end
  object XmlGroupBox: TGroupBox
    Left = 0
    Top = 155
    Width = 394
    Height = 418
    Align = alLeft
    Caption = 'Xml'
    TabOrder = 2
    object XmlPageControl: TPageControl
      Left = 2
      Top = 15
      Width = 390
      Height = 401
      ActivePage = XmlMemoTabSheet
      Align = alClient
      TabOrder = 0
      OnChange = XmlPageControlChange
      object XmlMemoTabSheet: TTabSheet
        Caption = '&Edit'
        object XmlMemo: TMemo
          Left = 0
          Top = 0
          Width = 382
          Height = 373
          Align = alClient
          Lines.Strings = (
            '<?xml version="1.0"?>'
            '<bk:Books xmlns:bk='#39'http://myserver/myschemas/Books'#39'>'
            '  <bk:Book>'
            '      <bk:Title>Just XML</bk:Title>'
            '  </bk:Book>'
            '  <bk:Book>'
            '      <bk:Title>Professional XML</bk:Title>'
            '  </bk:Book>'
            '  <bk:Book>'
            '      <bk:Title>XML Step by Step</bk:Title>'
            '  </bk:Book>'
            '  <bk:Book>'
            '      <bk:Title>XML By Example</bk:Title>'
            '  </bk:Book>'
            '</bk:Books>')
          ScrollBars = ssBoth
          TabOrder = 0
          WordWrap = False
        end
      end
      object XmlViewTabSheet: TTabSheet
        Caption = '&View'
        ImageIndex = 1
        object XmlWebBrowser: TWebBrowser
          Left = 0
          Top = 0
          Width = 382
          Height = 373
          Align = alClient
          TabOrder = 0
          ExplicitLeft = 112
          ExplicitTop = 120
          ExplicitWidth = 300
          ExplicitHeight = 150
          ControlData = {
            4C0000007B2700008D2600000000000000000000000000000000000000000000
            000000004C000000000000000000000001000000E0D057007335CF11AE690800
            2B2E126208000000000000004C0000000114020000000000C000000000000046
            8000000000000000000000000000000000000000000000000000000000000000
            00000000000000000100000000000000000000000000000000000000}
        end
      end
      object HistoryTabSheet: TTabSheet
        Caption = 'H&istory'
        ImageIndex = 2
        object HistoryMemo: TMemo
          Left = 0
          Top = 0
          Width = 382
          Height = 373
          Align = alClient
          TabOrder = 0
        end
      end
    end
  end
  object XmlOpenDialog: TOpenDialog
    Filter = 'Xml files (*.xml)|*.xml|All files (*.*)|*.*'
    Options = [ofEnableSizing]
    Left = 352
    Top = 40
  end
end
