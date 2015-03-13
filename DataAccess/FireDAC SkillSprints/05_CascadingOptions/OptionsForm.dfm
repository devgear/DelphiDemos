object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Cascading Options DEMO'
  ClientHeight = 373
  ClientWidth = 598
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 347
    Top = 89
    Height = 284
    Align = alRight
    ExplicitLeft = 304
    ExplicitTop = 112
    ExplicitHeight = 100
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 89
    Width = 347
    Height = 284
    Align = alClient
    DataSource = dsEmployee
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
        FieldName = 'FULL_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMP_NO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FIRST_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LAST_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PHONE_EXT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HIRE_DATE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEPT_NO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JOB_CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JOB_GRADE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JOB_COUNTRY'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALARY'
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 350
    Top = 89
    Width = 248
    Height = 284
    Align = alRight
    DataSource = dsProject
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 598
    Height = 89
    Align = alTop
    TabOrder = 2
    object chkFetchRowsetSize: TCheckBox
      Left = 8
      Top = 12
      Width = 137
      Height = 17
      Caption = '3'#44148#50473' '#45208#45600#49436' '#44032#51256#50724#44592
      TabOrder = 0
      OnClick = chkFetchRowsetSizeClick
    end
    object btnFetchNext: TButton
      Left = 23
      Top = 35
      Width = 114
      Height = 25
      Caption = #44032#51256#50724#44592
      Enabled = False
      TabOrder = 1
      OnClick = btnFetchNextClick
    end
    object chkDetailDelay: TCheckBox
      Left = 350
      Top = 12
      Width = 194
      Height = 17
      Caption = #49345#49464#51221#48372' '#51648#50672' '#54364#49884'(DetailDelay)'
      TabOrder = 2
      OnClick = chkDetailDelayClick
    end
    object Button1: TButton
      Left = 160
      Top = 12
      Width = 153
      Height = 48
      Caption = '10'#48264#51704' '#48512#53552' 10'#44148' '#44032#51256#50724#44592'(RecsSkip, RecsMax)'
      TabOrder = 3
      WordWrap = True
      OnClick = Button1Click
    end
    object Edit1: TEdit
      Left = 368
      Top = 35
      Width = 121
      Height = 21
      NumbersOnly = True
      TabOrder = 4
      Text = '300'
    end
  end
  object EmpConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Public\Documents\Embarcadero\Studio\15.0\Sampl' +
        'es\Data\EMPLOYEE.GDB'
      'MonitorBy=Custom'
      'ConnectionDef=Orders')
    FetchOptions.AssignedValues = [evDetailDelay]
    FetchOptions.DetailDelay = 300
    Connected = True
    LoginPrompt = False
    Left = 128
    Top = 78
  end
  object qryEmployee: TFDQuery
    Active = True
    Connection = EmpConnection
    SQL.Strings = (
      'SELECT * FROM EMPLOYEE')
    Left = 128
    Top = 168
    object qryEmployeeFULL_NAME: TStringField
      DisplayWidth = 30
      FieldName = 'FULL_NAME'
      Origin = 'FULL_NAME'
      Size = 37
    end
    object qryEmployeeEMP_NO: TSmallintField
      FieldName = 'EMP_NO'
      Origin = 'EMP_NO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object qryEmployeeFIRST_NAME: TStringField
      DisplayWidth = 18
      FieldName = 'FIRST_NAME'
      Origin = 'FIRST_NAME'
      Required = True
      Size = 15
    end
    object qryEmployeeLAST_NAME: TStringField
      DisplayWidth = 24
      FieldName = 'LAST_NAME'
      Origin = 'LAST_NAME'
      Required = True
    end
    object qryEmployeePHONE_EXT: TStringField
      FieldName = 'PHONE_EXT'
      Origin = 'PHONE_EXT'
      Visible = False
      Size = 4
    end
    object qryEmployeeHIRE_DATE: TSQLTimeStampField
      FieldName = 'HIRE_DATE'
      Origin = 'HIRE_DATE'
      Required = True
      Visible = False
    end
    object qryEmployeeDEPT_NO: TStringField
      FieldName = 'DEPT_NO'
      Origin = 'DEPT_NO'
      Required = True
      Visible = False
      FixedChar = True
      Size = 3
    end
    object qryEmployeeJOB_CODE: TStringField
      DisplayWidth = 11
      FieldName = 'JOB_CODE'
      Origin = 'JOB_CODE'
      Required = True
      Size = 5
    end
    object qryEmployeeJOB_GRADE: TSmallintField
      DisplayWidth = 12
      FieldName = 'JOB_GRADE'
      Origin = 'JOB_GRADE'
      Required = True
    end
    object qryEmployeeJOB_COUNTRY: TStringField
      DisplayWidth = 18
      FieldName = 'JOB_COUNTRY'
      Origin = 'JOB_COUNTRY'
      Required = True
      Size = 15
    end
    object qryEmployeeSALARY: TBCDField
      DisplayWidth = 23
      FieldName = 'SALARY'
      Origin = 'SALARY'
      Required = True
      Precision = 18
      Size = 2
    end
  end
  object dsEmployee: TDataSource
    DataSet = qryEmployee
    Left = 128
    Top = 224
  end
  object qryProject: TFDQuery
    Active = True
    IndexFieldNames = 'EMP_NO'
    MasterSource = dsEmployee
    MasterFields = 'EMP_NO'
    Connection = EmpConnection
    FetchOptions.AssignedValues = [evDetailDelay]
    FetchOptions.DetailDelay = 300
    SQL.Strings = (
      'SELECT PROJ_NAME, EMP_NO FROM EMPLOYEE_PROJECT, PROJECT'
      'WHERE EMPLOYEE_PROJECT.PROJ_ID = PROJECT.PROJ_ID')
    Left = 408
    Top = 144
    object qryProjectPROJ_NAME: TStringField
      FieldName = 'PROJ_NAME'
      Origin = 'PROJ_NAME'
      Required = True
    end
    object qryProjectEMP_NO: TSmallintField
      FieldName = 'EMP_NO'
      Origin = 'EMP_NO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
  end
  object dsProject: TDataSource
    DataSet = qryProject
    Left = 408
    Top = 208
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    ScreenCursor = gcrHourGlass
    Left = 536
    Top = 144
  end
end
