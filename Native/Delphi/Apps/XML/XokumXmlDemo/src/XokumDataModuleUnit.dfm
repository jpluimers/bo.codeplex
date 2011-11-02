object XokumDataModule: TXokumDataModule
  OldCreateOrder = False
  Height = 256
  Width = 354
  object XokumClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'XokumXMLTransformProvider'
    Left = 52
    Top = 32
    object XokumClientDataSetachternaam: TStringField
      FieldName = 'achternaam'
      Required = True
      Size = 40
    end
    object XokumClientDataSetvoorletters: TStringField
      FieldName = 'voorletters'
      Size = 10
    end
    object XokumClientDataSetstraat: TStringField
      FieldName = 'straat'
      Required = True
    end
    object XokumClientDataSetnummer: TIntegerField
      FieldName = 'nummer'
    end
    object XokumClientDataSetabonneenummer: TIntegerField
      FieldName = 'abonneenummer'
      Required = True
    end
    object XokumClientDataSetplaats: TStringField
      FieldName = 'plaats'
      Required = True
    end
    object XokumClientDataSetnetnummer: TIntegerField
      FieldName = 'netnummer'
      Required = True
    end
  end
  object XokumXMLTransformProvider: TXMLTransformProvider
    TransformRead.TransformationFile = '..\data\XokumXmlToXokumClientDataSet.xtr'
    TransformWrite.TransformationFile = '..\data\XokumClientDataSetToXokumXml.xtr'
    XMLDataFile = '..\data\xokum.edit.xml'
    Left = 200
    Top = 148
  end
end
