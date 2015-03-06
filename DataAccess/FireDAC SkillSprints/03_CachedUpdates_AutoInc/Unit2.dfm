object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Auto-inc & Cached updates'
  ClientHeight = 383
  ClientWidth = 489
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 40
    Width = 473
    Height = 233
    DataSource = DataSource1
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'SEQ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FIELD1'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FIELD2'
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 9
    Width = 240
    Height = 25
    DataSource = DataSource1
    TabOrder = 1
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 302
    Width = 473
    Height = 74
    Caption = '                                    '
    TabOrder = 2
    object Label1: TLabel
      Left = 13
      Top = 23
      Width = 457
      Height = 13
      AutoSize = False
      Caption = #48320#44221'/'#49325#51228#46108' '#45236#50857#51012' '#52880#49772#50640' '#45812#50500' '#46160#44256' '#51068#44292#50629#45936#51060#53944'(ApplyUpdates)'
    end
    object btnCancelRefresh: TButton
      Left = 8
      Top = 42
      Width = 146
      Height = 25
      Caption = 'Cancel && Refresh'
      Enabled = False
      TabOrder = 0
      OnClick = btnCancelRefreshClick
    end
    object btnApplyUpdates: TButton
      Left = 160
      Top = 42
      Width = 152
      Height = 25
      Caption = 'Apply Update(Save)'
      Enabled = False
      TabOrder = 1
      OnClick = btnApplyUpdatesClick
    end
    object chkUseCachedUpdates: TCheckBox
      Left = 13
      Top = 0
      Width = 97
      Height = 17
      Caption = 'Cached Updates'
      TabOrder = 2
      OnClick = chkUseCachedUpdatesClick
    end
  end
  object chkUseAutoGenerateValue: TCheckBox
    Left = 21
    Top = 279
    Width = 460
    Height = 17
    Caption = 'AutoGenerateValue - DB'#51032' '#51088#46041#51613#44032' '#52972#47100#51032' '#44592#48376#44050#51012' '#51088#46041#49373#49457#54616#45716' '#49549#49457
    Checked = True
    State = cbChecked
    TabOrder = 3
    OnClick = chkUseAutoGenerateValueClick
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=D:\Projects\Datas\SAMPLE.GDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'CharacterSet=UTF8'
      'DriverID=IB')
    Connected = True
    LoginPrompt = False
    Left = 392
    Top = 16
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM TABLE1')
    Left = 392
    Top = 80
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
    Left = 392
    Top = 144
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 392
    Top = 208
  end
  object FDTable1: TFDTable
    Active = True
    IndexFieldNames = 'SEQ'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'TABLE1'
    TableName = 'TABLE1'
    Left = 240
    Top = 200
  end
end
