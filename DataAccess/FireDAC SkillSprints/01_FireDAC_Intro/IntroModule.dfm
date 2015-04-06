object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 276
  Width = 354
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Public\Documents\Embarcadero\Studio\15.0\Sampl' +
        'es\Data\MASTSQL.GDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=IB')
    Connected = True
    LoginPrompt = False
    Left = 64
    Top = 24
  end
  object FDTable1: TFDTable
    IndexFieldNames = 'EMPNO'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'EMPLOYEE'
    TableName = 'EMPLOYEE'
    Left = 64
    Top = 96
  end
  object DataSource1: TDataSource
    DataSet = FDTable1
    Left = 64
    Top = 168
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 168
    Top = 96
  end
end
