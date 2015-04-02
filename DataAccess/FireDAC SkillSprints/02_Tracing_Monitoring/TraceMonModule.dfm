object DM: TDM
  OldCreateOrder = False
  Height = 526
  Width = 632
  object FDMoniFlatFileClientLink1: TFDMoniFlatFileClientLink
    Left = 384
    Top = 136
  end
  object FDMoniRemoteClientLink1: TFDMoniRemoteClientLink
    EventKinds = [ekCmdPrepare, ekCmdExecute, ekCmdDataIn, ekCmdDataOut, ekAdaptUpdate]
    Tracing = True
    Left = 384
    Top = 208
  end
  object FDMetaInfoQuery1: TFDMetaInfoQuery
    Connection = FDConnection1
    MetaInfoKind = mkTableFields
    TableKinds = [tkTable]
    ObjectName = 'CUSTOMER'
    Left = 160
    Top = 112
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 504
    Top = 120
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Public\Documents\Embarcadero\Studio\15.0\Sampl' +
        'es\Data\EMPLOYEE.GDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=IB')
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 40
  end
  object FDTable1: TFDTable
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'EMPLOYEE'
    TableName = 'EMPLOYEE'
    Left = 48
    Top = 112
  end
  object dsEmployee: TDataSource
    DataSet = FDTable1
    Left = 48
    Top = 184
  end
  object dsMetadata: TDataSource
    DataSet = FDMetaInfoQuery1
    Left = 160
    Top = 192
  end
end
