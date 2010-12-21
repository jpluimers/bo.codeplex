object GenericPublishSubscribeMainForm: TGenericPublishSubscribeMainForm
  Left = 0
  Top = 0
  Caption = 'GenericPublishSubscribeMainForm'
  ClientHeight = 348
  ClientWidth = 643
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    643
    348)
  PixelsPerInch = 96
  TextHeight = 13
  object TestPublisherButton: TButton
    Left = 8
    Top = 8
    Width = 150
    Height = 25
    Caption = 'TestPublisherButton'
    TabOrder = 0
    OnClick = TestPublisherButtonClick
  end
  object LogMemo: TMemo
    Left = 8
    Top = 39
    Width = 627
    Height = 301
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      'LogMemo')
    TabOrder = 1
  end
end
