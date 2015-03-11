object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Tracing & Monitoring'
  ClientHeight = 362
  ClientWidth = 501
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 501
    Height = 41
    Align = alTop
    TabOrder = 0
    object Button1: TButton
      Left = 16
      Top = 10
      Width = 105
      Height = 25
      Caption = #47700#53440#45936#51060#53552
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 127
      Top = 10
      Width = 114
      Height = 25
      Caption = #50672#44208#51221#48372
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 247
      Top = 10
      Width = 98
      Height = 25
      Caption = 'Trace'
      TabOrder = 2
      OnClick = Button3Click
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 41
    Width = 501
    Height = 321
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #45936#51060#53552
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object StringGrid1: TStringGrid
        Left = 0
        Top = 0
        Width = 493
        Height = 293
        Align = alClient
        ColCount = 1
        FixedCols = 0
        RowCount = 2
        TabOrder = 0
        ColWidths = (
          64)
      end
    end
    object TabSheet2: TTabSheet
      Caption = #47196#44536
      ImageIndex = 1
      object Memo1: TMemo
        Left = 0
        Top = 0
        Width = 493
        Height = 293
        Align = alClient
        TabOrder = 0
      end
    end
  end
  object EmployeeConnection: TFDConnection
    Params.Strings = (
      'MonitorBy=FlatFile'
      'ConnectionDef=Employee')
    LoginPrompt = False
    Left = 264
    Top = 91
  end
  object EmployeeTable: TFDQuery
    Connection = EmployeeConnection
    SQL.Strings = (
      'SELECT * FROM EMPLOYEE')
    Left = 265
    Top = 167
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 264
    Top = 248
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = EmployeeTable
    ScopeMappings = <>
    Left = 88
    Top = 192
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 84
    Top = 141
    object LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      GridControl = StringGrid1
      Columns = <>
    end
  end
  object FDMoniFlatFileClientLink1: TFDMoniFlatFileClientLink
    Left = 384
    Top = 136
  end
  object FDMoniRemoteClientLink1: TFDMoniRemoteClientLink
    Left = 384
    Top = 208
  end
end
