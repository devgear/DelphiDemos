object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  Height = 399
  Width = 426
  object FDConnectionEMPLOYEE: TFDConnection
    Params.Strings = (
      'MonitorBy=Remote'
      'ConnectionDef=EMPLOYEE')
    Connected = True
    LoginPrompt = False
    Left = 88
    Top = 48
  end
  object FDQueryCUSTOMER: TFDQuery
    Connection = FDConnectionEMPLOYEE
    SQL.Strings = (
      'SELECT CUST_NO, CUSTOMER FROM CUSTOMER')
    Left = 88
    Top = 128
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 232
    Top = 48
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 232
    Top = 128
  end
  object FDMoniRemoteClientLink1: TFDMoniRemoteClientLink
    Tracing = True
    Left = 224
    Top = 256
  end
end
