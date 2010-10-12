object NLFMJSON2ASXForm: TNLFMJSON2ASXForm
  Left = 0
  Top = 0
  Caption = 'NLFMJSON2ASXForm'
  ClientHeight = 601
  ClientWidth = 830
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
    Width = 830
    Height = 41
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 0
    object JSON2AsxButton: TButton
      Left = 8
      Top = 9
      Width = 75
      Height = 25
      Caption = 'JSON2Asx'
      TabOrder = 0
      OnClick = JSON2AsxButtonClick
    end
  end
  object JSONGroupBox: TGroupBox
    Left = 0
    Top = 41
    Width = 830
    Height = 40
    Align = alTop
    Caption = 'JSONGroupBox'
    TabOrder = 1
    object JSONMemo: TEdit
      Left = 2
      Top = 15
      Width = 826
      Height = 23
      Align = alClient
      TabOrder = 0
      Text = 
        'zenders = {"numRows":3,"identifier":"z","items":[{"z":"100pnl","' +
        's":"http:\/\/player.100p.nl\/nederlandfm\/","w":"http:\/\/www.10' +
        '0p.nl","o":"100% NL - de muziek van Nederland","p":"totaal","b":' +
        'null,"wi":null,"hi":null,"m":"http:\/\/wm1.streaming.castor.nl:8' +
        '000\/100pctnl.mp3"},{"z":"3fm","s":"http:\/\/livestreams.omroep.' +
        'nl\/npo\/3fm-bb","w":"http:\/\/www.3fm.nl","o":"3FM","p":"wmp","' +
        'b":"http:\/\/radioplayer.omroep.nl\/3fm-nlfm","wi":null,"hi":nul' +
        'l,"m":"http:\/\/shoutcast.omroep.nl:8134\/"},{"z":"538dancedept"' +
        ',"s":"http:\/\/www.radiodigitaal.nl\/static\/download\/nederland' +
        'FM\/Players\/dancedept_streamspot.php","w":"http:\/\/www.radiodi' +
        'gitaal.nl","o":"538 Dancedepartment","p":"totaal","b":null,"wi":' +
        'null,"hi":null,"m":"http:\/\/82.201.100.10:8000\/RD01_538_Danced' +
        'epartment"}]}'
      ExplicitHeight = 21
    end
  end
  object AsxGroupBox: TGroupBox
    Left = 0
    Top = 81
    Width = 830
    Height = 520
    Align = alClient
    Caption = 'AsxGroupBox'
    TabOrder = 2
    object AsxMemo: TMemo
      Left = 2
      Top = 15
      Width = 826
      Height = 503
      Align = alClient
      Lines.Strings = (
        'AsxMemo')
      TabOrder = 0
    end
  end
end
