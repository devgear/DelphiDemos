object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 318
  Width = 415
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=D:\Projects\Datas\SAMPLE.GDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'CharacterSet=UTF8'
      'DriverID=IB')
    Connected = True
    LoginPrompt = False
    Left = 47
    Top = 24
  end
  object FDQuery1: TFDQuery
    Active = True
    OnCalcFields = FDQuery1CalcFields
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM TABLE1')
    Left = 47
    Top = 88
    object FDQuery1Status: TStringField
      FieldKind = fkCalculated
      FieldName = 'Status'
      Calculated = True
    end
    object FDQuery1SEQ: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'SEQ'
      Origin = 'SEQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQuery1FIELD1: TWideStringField
      FieldName = 'FIELD1'
      Origin = 'FIELD1'
      Size = 200
    end
    object FDQuery1FIELD2: TIntegerField
      FieldName = 'FIELD2'
      Origin = 'FIELD2'
    end
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 319
    Top = 32
  end
  object dsData: TDataSource
    DataSet = FDQuery1
    Left = 47
    Top = 160
  end
  object FDMemTable1: TFDMemTable
    OnCalcFields = FDQuery1CalcFields
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    AutoCommitUpdates = False
    Left = 144
    Top = 88
    object FDMemTable1Status: TStringField
      FieldKind = fkCalculated
      FieldName = 'Status'
      Calculated = True
    end
    object FDMemTable1SEQ: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'SEQ'
      Origin = 'SEQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDMemTable1FIELD1: TWideStringField
      FieldName = 'FIELD1'
      Origin = 'FIELD1'
      Size = 200
    end
    object FDMemTable1FIELD2: TIntegerField
      FieldName = 'FIELD2'
      Origin = 'FIELD2'
    end
  end
  object dsCache: TDataSource
    DataSet = FDMemTable1
    Left = 144
    Top = 160
  end
end
