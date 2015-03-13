object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 293
  Width = 413
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Public\Documents\Embarcadero\Studio\15.0\Sampl' +
        'es\Data\dbdemos.gdb'
      'Password=masterkey'
      'User_Name=sysdba'
      'DriverID=IB')
    Connected = True
    LoginPrompt = False
    Left = 24
    Top = 32
  end
  object qryTables: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT RDB$RELATION_NAME AS TABLENAME'
      '  FROM RDB$RELATIONS'
      '        WHERE ((RDB$SYSTEM_FLAG = 0) OR'
      '              (RDB$SYSTEM_FLAG IS NULL)) AND'
      '              (RDB$VIEW_SOURCE IS NULL)'
      '        ORDER BY RDB$RELATION_NAME')
    Left = 24
    Top = 104
  end
  object FDMoniRemoteClientLink1: TFDMoniRemoteClientLink
    EventKinds = [ekCmdPrepare]
    Tracing = True
    Left = 72
    Top = 224
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 200
    Top = 224
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 320
    Top = 224
  end
  object qryFields: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM &TableName WHERE 1=2')
    Left = 96
    Top = 104
    MacroData = <
      item
        Value = 'Customer'
        Name = 'TABLENAME'
      end>
  end
  object qrySelect: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT &FieldList FROM &TableName')
    Left = 168
    Top = 104
    MacroData = <
      item
        Value = 'Company'
        Name = 'FIELDLIST'
      end
      item
        Value = 'Customer'
        Name = 'TABLENAME'
      end>
  end
  object qryMacroQuery: TFDQuery
    Filtered = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT {Current_Date()} as Today, c.*'
      '  FROM &TabNam c'
      ' WHERE {Extract(Year, c.SaleDate)} = {e 1988}')
    Left = 288
    Top = 104
    MacroData = <
      item
        Value = 'ORDERS'
        Name = 'TABNAM'
      end>
  end
end
