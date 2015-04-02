object Form2: TForm2
  Left = 0
  Top = 0
  Caption = #52628#51201#44284' '#47784#45768#53552#47553' / '#47700#53440#45936#51060#53552' '#53244#47532' '#45936#47784
  ClientHeight = 472
  ClientWidth = 701
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 701
    Height = 472
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    ExplicitTop = 41
    ExplicitHeight = 431
    object TabSheet1: TTabSheet
      Caption = #52628#51201' && '#47784#45768#53552#47553
      ExplicitLeft = 8
      ExplicitTop = 28
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 693
        Height = 73
        Align = alTop
        TabOrder = 0
        object Label1: TLabel
          Left = 142
          Top = 15
          Width = 281
          Height = 13
          Caption = #50896#44201' '#47784#45768#53552#47553' '#49884#51089' '#51204' Tools > FireDAC Monitor '#49892#54665' '#54624' '#44163
        end
        object Label2: TLabel
          Left = 142
          Top = 46
          Width = 414
          Height = 13
          Caption = #54028#51068' '#47784#45768#53552#47553#51008' '#50528#54540#47532#52992#51060#49496' '#51333#47308' '#54980' '#49892#54665#54028#51068#44284' '#44057#51008' '#44221#47196#51032' trace.txt'#50640' '#47196#44536' '#44592#47197
        end
        object Button1: TButton
          Left = 0
          Top = 10
          Width = 129
          Height = 25
          Caption = #50896#44201' '#47784#45768#53552#47553
          TabOrder = 0
          OnClick = Button1Click
        end
        object Button2: TButton
          Left = 0
          Top = 41
          Width = 129
          Height = 25
          Caption = #54028#51068' '#47784#45768#53552#47553
          TabOrder = 1
          OnClick = Button2Click
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 73
        Width = 693
        Height = 371
        Align = alClient
        DataSource = DM.dsEmployee
        Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object TabSheet2: TTabSheet
      Caption = #50672#44208#51221#48372
      ImageIndex = 1
      ExplicitWidth = 493
      ExplicitHeight = 293
      object Memo1: TMemo
        Left = 0
        Top = 41
        Width = 693
        Height = 403
        Align = alClient
        TabOrder = 0
        ExplicitTop = 0
        ExplicitWidth = 493
        ExplicitHeight = 293
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 693
        Height = 41
        Align = alTop
        TabOrder = 1
        ExplicitTop = 8
        object Button3: TButton
          Left = 0
          Top = 10
          Width = 137
          Height = 25
          Caption = #50672#44208#51221#48372' '#52636#47141#54616#44592
          TabOrder = 0
          OnClick = Button3Click
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #47700#53440#45936#51060#53552'-TFDConnection'
      ImageIndex = 2
      ExplicitHeight = 403
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 693
        Height = 41
        Align = alTop
        TabOrder = 0
        ExplicitTop = 8
        object Button6: TButton
          Left = 5
          Top = 10
          Width = 113
          Height = 25
          Caption = 'GetTableNames'
          TabOrder = 0
          OnClick = Button4Click
        end
        object Button7: TButton
          Left = 124
          Top = 10
          Width = 113
          Height = 25
          Caption = 'GetFieldNames'
          TabOrder = 1
          OnClick = Button4Click
        end
        object Button8: TButton
          Left = 243
          Top = 10
          Width = 113
          Height = 25
          Caption = 'GetGeneratorNames'
          TabOrder = 2
          OnClick = Button4Click
        end
        object Button4: TButton
          Left = 362
          Top = 10
          Width = 113
          Height = 25
          Caption = 'GetStoredProcName'
          TabOrder = 3
          OnClick = Button4Click
        end
      end
      object Memo2: TMemo
        Left = 0
        Top = 41
        Width = 693
        Height = 403
        Align = alClient
        TabOrder = 1
        ExplicitTop = 0
        ExplicitWidth = 493
        ExplicitHeight = 293
      end
    end
    object TabSheet4: TTabSheet
      Caption = #47700#53440#45936#51060#53552'-TFDMetaInfoQuery'
      ImageIndex = 3
      ExplicitHeight = 403
      object DBGrid2: TDBGrid
        Left = 0
        Top = 41
        Width = 693
        Height = 403
        Align = alClient
        DataSource = DM.dsMetadata
        Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 693
        Height = 41
        Align = alTop
        TabOrder = 1
        ExplicitTop = 8
        object Button5: TButton
          Left = 5
          Top = 10
          Width = 113
          Height = 25
          Caption = 'GetTableNames'
          TabOrder = 0
          OnClick = Button5Click
        end
        object Button9: TButton
          Left = 124
          Top = 10
          Width = 113
          Height = 25
          Caption = 'GetFieldNames'
          TabOrder = 1
          OnClick = Button5Click
        end
        object Button10: TButton
          Left = 243
          Top = 10
          Width = 113
          Height = 25
          Caption = 'GetGeneratorNames'
          TabOrder = 2
          OnClick = Button5Click
        end
        object Button11: TButton
          Left = 362
          Top = 10
          Width = 113
          Height = 25
          Caption = 'GetStoredProcName'
          TabOrder = 3
          OnClick = Button5Click
        end
      end
    end
  end
end
