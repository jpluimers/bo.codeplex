object MSConnectionDataModule: TMSConnectionDataModule
  OldCreateOrder = False
  Height = 150
  Width = 215
  object MainADOConnection: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;User ID=johan;Dat' +
      'a Source=mw-sql;Initial Catalog=MW;'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'MSDASQL.1'
    Left = 92
    Top = 28
  end
end
