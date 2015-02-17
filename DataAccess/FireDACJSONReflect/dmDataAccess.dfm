object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 306
  Width = 357
  object FDMemTableCustomer: TFDMemTable
    FieldDefs = <
      item
        Name = 'CUST_NO'
      end
      item
        Name = 'CUSTOMER'
      end>
    CachedUpdates = True
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    AutoCommitUpdates = False
    StoreDefs = True
    Left = 80
    Top = 64
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 240
    Top = 64
  end
  object DSRestConnection1: TDSRestConnection
    Host = '127.0.0.1'
    Port = 8080
    UserName = 'admin'
    Password = 'admin'
    LoginPrompt = False
    PreserveSessionID = False
    Left = 72
    Top = 168
    UniqueId = '{E1339582-6CB3-4C89-83C0-C54F12FB53AB}'
  end
end
