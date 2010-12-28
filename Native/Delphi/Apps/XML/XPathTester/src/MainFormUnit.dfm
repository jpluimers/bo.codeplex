object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'XPathTester MainForm'
  ClientHeight = 573
  ClientWidth = 792
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
  object Splitter1: TSplitter
    Left = 394
    Top = 159
    Height = 414
    ExplicitLeft = 328
    ExplicitTop = 136
    ExplicitHeight = 100
  end
  object ActionPanel: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 159
    Align = alTop
    TabOrder = 0
    DesignSize = (
      792
      159)
    object Label1: TLabel
      Tag = 2
      Left = 8
      Top = 37
      Width = 38
      Height = 13
      Caption = '&Vendor:'
      FocusControl = DomVendorComboBox
    end
    object XPathLabeledEdit: TLabeledEdit
      Left = 50
      Top = 7
      Width = 736
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      EditLabel.Width = 32
      EditLabel.Height = 13
      EditLabel.Caption = 'X&Path:'
      LabelPosition = lpLeft
      TabOrder = 0
      Text = '//bk:Book[position()<=2]'
    end
    object RunButton: TButton
      Left = 50
      Top = 96
      Width = 135
      Height = 25
      Caption = '&Run XPath'
      TabOrder = 1
      OnClick = RunButtonClick
    end
    object LoadXmlButton: TButton
      Left = 191
      Top = 65
      Width = 135
      Height = 25
      Caption = '&Load XML file'
      TabOrder = 6
      OnClick = LoadXmlButtonClick
    end
    object ShowNameSpacesButton: TButton
      Left = 50
      Top = 127
      Width = 135
      Height = 25
      Caption = 'Show &namespaces'
      TabOrder = 2
      OnClick = ShowNameSpacesButtonClick
    end
    object ShowXmlInResultCheckBox: TCheckBox
      Left = 50
      Top = 77
      Width = 131
      Height = 17
      Caption = '&Show XML in the results'
      TabOrder = 10
    end
    object ShowTextInResultCheckBox: TCheckBox
      Left = 50
      Top = 58
      Width = 125
      Height = 17
      Caption = 'Show &text in results'
      TabOrder = 5
    end
    object LoadXmlExample1Button: TButton
      Left = 191
      Top = 96
      Width = 135
      Height = 25
      Caption = 'Load Example &1'
      TabOrder = 7
      OnClick = LoadXmlExample1ButtonClick
    end
    object LoadXmlExample2Button: TButton
      Left = 191
      Top = 127
      Width = 135
      Height = 25
      Caption = 'Load Example &2'
      TabOrder = 8
      OnClick = LoadXmlExample2ButtonClick
    end
    object HistoryGroupBox: TGroupBox
      Left = 332
      Top = 34
      Width = 453
      Height = 119
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = '&History'
      TabOrder = 9
      DesignSize = (
        453
        119)
      object HistoryListBox: TListBox
        Left = 8
        Top = 16
        Width = 435
        Height = 94
        Anchors = [akLeft, akTop, akRight, akBottom]
        ItemHeight = 13
        TabOrder = 0
        OnClick = HistoryListBoxClick
      end
    end
    object ShowMsxml6Version: TButton
      Left = 191
      Top = 34
      Width = 135
      Height = 25
      Caption = 'Show MSXML&6 version'
      TabOrder = 4
      OnClick = ShowMsxml6VersionClick
    end
    object DomVendorComboBox: TComboBox
      Left = 50
      Top = 34
      Width = 135
      Height = 21
      TabOrder = 3
      Text = 'DomVendorComboBox'
    end
  end
  object ResultsGroupBox: TGroupBox
    Left = 397
    Top = 159
    Width = 395
    Height = 414
    Align = alClient
    Caption = '&Results'
    TabOrder = 1
    object ResultsMemo: TMemo
      Left = 2
      Top = 15
      Width = 391
      Height = 397
      Align = alClient
      ScrollBars = ssBoth
      TabOrder = 0
      WordWrap = False
    end
  end
  object XmlGroupBox: TGroupBox
    Left = 0
    Top = 159
    Width = 394
    Height = 414
    Align = alLeft
    Caption = 'Xml'
    TabOrder = 2
    object XmlPageControl: TPageControl
      Left = 2
      Top = 15
      Width = 390
      Height = 397
      ActivePage = XmlViewTabSheet
      Align = alClient
      TabOrder = 0
      OnChange = XmlPageControlChange
      object XmlMemoTabSheet: TTabSheet
        Caption = '&Edit'
        object XmlMemo: TMemo
          Left = 0
          Top = 0
          Width = 382
          Height = 369
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
          Height = 369
          Align = alClient
          TabOrder = 0
          ExplicitLeft = 112
          ExplicitTop = 120
          ExplicitWidth = 300
          ExplicitHeight = 150
          ControlData = {
            4C0000007B270000232600000000000000000000000000000000000000000000
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
          Height = 369
          Align = alClient
          TabOrder = 0
        end
      end
    end
  end
  object XmlOpenDialog: TOpenDialog
    Filter = 'Xml files (*.xml)|*.xml|All files (*.*)|*.*'
    Options = [ofEnableSizing]
    Left = 370
    Top = 68
  end
end
