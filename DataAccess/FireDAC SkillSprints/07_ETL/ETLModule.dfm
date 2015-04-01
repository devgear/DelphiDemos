object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 504
  Width = 646
  object FDQuery1: TFDQuery
    Connection = FDConnectionIB
    SQL.Strings = (
      'SELECT '
      '  P.PARTNO, P.DESCRIPTION, V.VENDORNAME, P.LISTPRICE'
      'FROM'
      '  PARTS P, VENDORS V'
      'WHERE'
      '  P.VENDORNO = V.VENDORNO'
      'ORDER BY '
      '  V.VENDORNAME')
    Left = 104
    Top = 24
  end
  object FDBatchMoveDataSetReader1: TFDBatchMoveDataSetReader
    DataSet = FDQuery1
    Left = 112
    Top = 72
  end
  object FDBatchMoveDtoT: TFDBatchMove
    Reader = FDBatchMoveDataSetReader1
    Writer = FDBatchMoveTextWriter1
    Mappings = <>
    LogFileName = 'Data.log'
    Left = 184
    Top = 24
  end
  object FDBatchMoveTextWriter1: TFDBatchMoveTextWriter
    DataDef.Fields = <>
    DataDef.WithFieldNames = True
    Left = 256
    Top = 72
  end
  object FDQuery2: TFDQuery
    Connection = FDConnectionIB
    FetchOptions.AssignedValues = [evMode, evItems]
    FetchOptions.Items = [fiMeta]
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockWait, uvRefreshMode, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.UpdateChangedFields = False
    UpdateOptions.LockWait = True
    UpdateOptions.RefreshMode = rmManual
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    SQL.Strings = (
      'SELECT * FROM DATA')
    Left = 256
    Top = 200
  end
  object FDBatchMoveDataSetWriter1: TFDBatchMoveDataSetWriter
    DataSet = FDQuery2
    Left = 256
    Top = 248
  end
  object FDBatchMoveTextReader1: TFDBatchMoveTextReader
    FileName = 
      'D:\Projects\DelphiDemos\DataAccess\FireDAC SkillSprints\07_ETL\W' +
      'in32\Debug\data.csv'
    DataDef.Fields = <
      item
        DataType = atString
        FieldSize = 2
      end
      item
        DataType = atString
        FieldSize = 4
      end>
    DataDef.WithFieldNames = True
    Left = 112
    Top = 248
  end
  object FDQueryIB: TFDQuery
    Connection = FDConnectionIB
    SQL.Strings = (
      'SELECT * FROM DATA')
    Left = 104
    Top = 376
  end
  object FDBatchMoveDataSetReader2: TFDBatchMoveDataSetReader
    DataSet = FDQueryIB
    Left = 104
    Top = 432
  end
  object FDBatchMoveIBtoMSSQL: TFDBatchMove
    Reader = FDBatchMoveDataSetReader2
    Writer = FDBatchMoveDataSetWriter2
    Mappings = <>
    LogFileName = 'Data.log'
    Left = 184
    Top = 352
  end
  object FDQueryMSSQL: TFDQuery
    Connection = FDConnectionMSSQL
    SQL.Strings = (
      'SELECT * FROM DATA')
    Left = 264
    Top = 376
  end
  object FDBatchMoveDataSetWriter2: TFDBatchMoveDataSetWriter
    DataSet = FDQueryMSSQL
    Left = 264
    Top = 432
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 544
    Top = 312
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 544
    Top = 224
  end
  object FDConnectionMSSQL: TFDConnection
    Params.Strings = (
      'ConnectionDef=DevgearSQLServer')
    LoginPrompt = False
    Left = 544
    Top = 160
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 544
    Top = 96
  end
  object FDConnectionIB: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Public\Documents\Embarcadero\Studio\15.0\Sampl' +
        'es\Data\dbdemos.gdb'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=IB')
    LoginPrompt = False
    Left = 544
    Top = 40
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 32
    Top = 24
  end
  object DataSource2: TDataSource
    DataSet = FDQueryIBData
    Left = 408
    Top = 200
  end
  object FDBatchMoveTtoD: TFDBatchMove
    Reader = FDBatchMoveTextReader1
    Writer = FDBatchMoveDataSetWriter1
    Mappings = <
      item
        DestinationFieldName = 'ID'
      end
      item
        DestinationFieldName = 'NAME'
      end>
    LogFileName = 'Data.log'
    Left = 184
    Top = 200
  end
  object FDQueryIBData: TFDQuery
    Connection = FDConnectionIB
    SQL.Strings = (
      'SELECT * FROM DATA')
    Left = 408
    Top = 248
  end
  object FDQueryMSData: TFDQuery
    Connection = FDConnectionMSSQL
    SQL.Strings = (
      'SELECT * FROM DATA')
    Left = 408
    Top = 432
  end
  object DataSource3: TDataSource
    DataSet = FDQueryMSData
    Left = 408
    Top = 376
  end
end
