object DownloadFromUrlMainForm: TDownloadFromUrlMainForm
  Left = 0
  Top = 0
  Caption = 'DownloadFromUrlMainForm'
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 643
    Height = 93
    Align = alTop
    TabOrder = 0
    object UrlLabel: TLabel
      Left = 8
      Top = 11
      Width = 23
      Height = 13
      Caption = '&URL:'
    end
    object UserAgentLabel: TLabel
      Left = 8
      Top = 38
      Width = 57
      Height = 13
      Caption = 'User &agent:'
      FocusControl = UserAgentComboBox
    end
    object UrlComboBox: TComboBox
      Left = 71
      Top = 8
      Width = 564
      Height = 21
      ItemIndex = 0
      TabOrder = 0
      Text = 'http://www.cl.cam.ac.uk/~mgk25/ucs/examples/UTF-8-demo.txt'
      Items.Strings = (
        'http://www.cl.cam.ac.uk/~mgk25/ucs/examples/UTF-8-demo.txt'
        'http://www.robotstxt.org/robots.txt')
    end
    object UserAgentComboBox: TComboBox
      Left = 71
      Top = 35
      Width = 564
      Height = 21
      ItemIndex = 0
      TabOrder = 1
      Text = 
        'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/534.' +
        '10 (KHTML, like Gecko) Chrome/8.0.552.224 Safari/534.10'
      Items.Strings = (
        
          'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/534.' +
          '10 (KHTML, like Gecko) Chrome/8.0.552.224 Safari/534.10'
        
          'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Triden' +
          't/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3' +
          '.0.30729; Media Center PC 6.0; InfoPath.2; .NET4.0C; .NET4.0E; M' +
          'S-RTC LM 8)')
    end
    object LoadAnsiStringButton: TButton
      Left = 71
      Top = 62
      Width = 100
      Height = 25
      Caption = '&Load AnsiString'
      TabOrder = 2
      OnClick = LoadAnsiStringButtonClick
    end
    object LoadUtf8StringButton: TButton
      Left = 177
      Top = 62
      Width = 100
      Height = 25
      Caption = 'Load Utf&8String'
      TabOrder = 3
      OnClick = LoadUtf8StringButtonClick
    end
    object DownloadBinaryFileButton: TButton
      Left = 283
      Top = 62
      Width = 125
      Height = 25
      Caption = 'Download &Binary File'
      TabOrder = 4
      OnClick = DownloadBinaryFileButtonClick
    end
  end
  object ResponsePageControl: TPageControl
    Left = 0
    Top = 93
    Width = 643
    Height = 255
    ActivePage = ResponseContentTabSheet
    Align = alClient
    TabOrder = 1
    object ResponseContentTabSheet: TTabSheet
      Caption = 'Response &content'
      object ResponseContentMemo: TMemo
        Left = 0
        Top = 0
        Width = 635
        Height = 227
        Align = alClient
        TabOrder = 0
      end
    end
    object ResponseHeadersTabSheet: TTabSheet
      Caption = 'Response &headers'
      ImageIndex = 1
      object ResponseHeadersMemo: TMemo
        Left = 0
        Top = 0
        Width = 635
        Height = 227
        Align = alClient
        TabOrder = 0
      end
    end
  end
  object SaveDialog: TSaveDialog
    Left = 424
    Top = 66
  end
end
