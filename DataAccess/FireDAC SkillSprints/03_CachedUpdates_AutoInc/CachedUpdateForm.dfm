object Form2: TForm2
  Left = 0
  Top = 0
  Caption = #52880#49772' '#50629#45936#51060#53944'('#51088#46041#51613#44032' '#54596#46300')'
  ClientHeight = 538
  ClientWidth = 642
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 288
    Width = 44
    Height = 13
    Caption = #48320#44221#51060#47141
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 40
    Width = 473
    Height = 233
    DataSource = DM.dsData
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
        FieldName = 'Status'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SEQ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FIELD1'
        Width = 100
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
    DataSource = DM.dsData
    TabOrder = 1
  end
  object DBGrid2: TDBGrid
    Left = 8
    Top = 307
    Width = 473
    Height = 214
    DataSource = DM.dsCache
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnViewCache: TButton
    Left = 496
    Top = 311
    Width = 129
    Height = 25
    Caption = #52880#49772' '#48372#44592
    TabOrder = 3
    OnClick = btnViewCacheClick
  end
  object btnApplyUpdates: TButton
    Left = 496
    Top = 217
    Width = 129
    Height = 25
    Caption = #48320#44221#45236#50857' '#51068#44292#51201#50857
    TabOrder = 4
    OnClick = btnApplyUpdatesClick
  end
  object btnCancelUpdates: TButton
    Left = 496
    Top = 248
    Width = 129
    Height = 25
    Caption = #48320#44221#45236#50857' '#51068#44292#52712#49548
    TabOrder = 5
    OnClick = btnCancelUpdatesClick
  end
  object btnOldValue: TButton
    Left = 496
    Top = 342
    Width = 129
    Height = 25
    Caption = #48320#44221' '#51204' '#44050' '#54869#51064
    TabOrder = 6
    OnClick = btnOldValueClick
  end
  object btnLastUndo: TButton
    Left = 496
    Top = 373
    Width = 129
    Height = 25
    Caption = #47560#51648#47561' '#48320#44221#52712#49548
    TabOrder = 7
    OnClick = btnLastUndoClick
  end
  object btnRevertRecord: TButton
    Left = 496
    Top = 404
    Width = 129
    Height = 25
    Caption = #49440#53469' '#47112#53076#46300' '#48320#44221#52712#49548
    TabOrder = 8
    OnClick = btnRevertRecordClick
  end
  object btnSavePoint: TButton
    Left = 496
    Top = 447
    Width = 129
    Height = 25
    Caption = #51200#51109#51216' '#49373#49457
    TabOrder = 9
    OnClick = btnSavePointClick
  end
  object btnBackSPoint: TButton
    Left = 496
    Top = 478
    Width = 129
    Height = 25
    Caption = #51200#51109#51216#51004#47196' '#46104#46028#47532#44592
    TabOrder = 10
    OnClick = btnBackSPointClick
  end
end
