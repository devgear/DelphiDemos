object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Batch Move DEMO'
  ClientHeight = 409
  ClientWidth = 632
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
    Width = 632
    Height = 409
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'DataSet to Text'
      object Button1: TButton
        Left = 0
        Top = 0
        Width = 624
        Height = 25
        Align = alTop
        Caption = 'Batch move DataSet to Text '#49892#54665
        TabOrder = 0
        OnClick = Button1Click
      end
      object Panel3: TPanel
        Left = 0
        Top = 25
        Width = 624
        Height = 356
        Align = alClient
        TabOrder = 1
        object Splitter1: TSplitter
          Left = 308
          Top = 1
          Width = 4
          Height = 354
          Align = alRight
          ExplicitLeft = 302
        end
        object GroupBox1: TGroupBox
          Left = 1
          Top = 1
          Width = 307
          Height = 354
          Align = alClient
          Caption = #45936#51060#53552#48288#51060#49828
          TabOrder = 0
          object TPanel
            Left = 2
            Top = 15
            Width = 303
            Height = 41
            Align = alTop
            TabOrder = 0
            object Button4: TButton
              Left = 8
              Top = 10
              Width = 75
              Height = 25
              Caption = 'Load'
              TabOrder = 0
              OnClick = Button4Click
            end
          end
          object DBGrid1: TDBGrid
            Left = 2
            Top = 56
            Width = 303
            Height = 296
            Align = alClient
            DataSource = DM.DataSource1
            Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
        end
        object GroupBox2: TGroupBox
          Left = 312
          Top = 1
          Width = 311
          Height = 354
          Align = alRight
          Caption = #53581#49828#53944#54028#51068
          TabOrder = 1
          object TPanel
            Left = 2
            Top = 15
            Width = 307
            Height = 41
            Align = alTop
            TabOrder = 0
            object Button5: TButton
              Left = 8
              Top = 10
              Width = 75
              Height = 25
              Caption = 'Load'
              TabOrder = 0
              OnClick = Button5Click
            end
            object Button6: TButton
              Left = 89
              Top = 10
              Width = 75
              Height = 25
              Caption = 'Delete'
              TabOrder = 1
              OnClick = Button6Click
            end
          end
          object Memo1: TMemo
            Left = 2
            Top = 56
            Width = 307
            Height = 296
            Align = alClient
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 1
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Text To DataSet'
      ImageIndex = 1
      object Button2: TButton
        Left = 0
        Top = 0
        Width = 624
        Height = 25
        Align = alTop
        Caption = 'Batch move Text to DataSet '#49892#54665
        TabOrder = 0
        OnClick = Button2Click
      end
      object Panel2: TPanel
        Left = 0
        Top = 25
        Width = 624
        Height = 356
        Align = alClient
        TabOrder = 1
        object Splitter2: TSplitter
          Left = 308
          Top = 1
          Width = 4
          Height = 354
          Align = alRight
          ExplicitLeft = 302
        end
        object GroupBox3: TGroupBox
          Left = 1
          Top = 1
          Width = 307
          Height = 354
          Align = alClient
          Caption = #53581#49828#53944#54028#51068
          TabOrder = 0
          ExplicitTop = 6
          object TPanel
            Left = 2
            Top = 15
            Width = 303
            Height = 41
            Align = alTop
            TabOrder = 0
            object Button7: TButton
              Left = 8
              Top = 10
              Width = 75
              Height = 25
              Caption = 'Load'
              TabOrder = 0
              OnClick = Button7Click
            end
          end
          object Memo2: TMemo
            Left = 2
            Top = 56
            Width = 303
            Height = 296
            Align = alClient
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 1
          end
        end
        object GroupBox4: TGroupBox
          Left = 312
          Top = 1
          Width = 311
          Height = 354
          Align = alRight
          Caption = #45936#51060#53552#48288#51060#49828
          TabOrder = 1
          object TPanel
            Left = 2
            Top = 15
            Width = 307
            Height = 41
            Align = alTop
            TabOrder = 0
            object Button8: TButton
              Left = 8
              Top = 10
              Width = 75
              Height = 25
              Caption = 'Load'
              TabOrder = 0
              OnClick = Button8Click
            end
            object Button9: TButton
              Left = 89
              Top = 10
              Width = 75
              Height = 25
              Caption = 'Delete'
              TabOrder = 1
              OnClick = Button9Click
            end
          end
          object DBGrid2: TDBGrid
            Left = 2
            Top = 56
            Width = 307
            Height = 296
            Align = alClient
            DataSource = DM.DataSource2
            Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Interbase to MSSQL'
      ImageIndex = 2
      object Button3: TButton
        Left = 0
        Top = 0
        Width = 624
        Height = 25
        Align = alTop
        Caption = 'Batch move IB to MSSQL '#49892#54665
        TabOrder = 0
        OnClick = Button3Click
      end
      object Panel1: TPanel
        Left = 0
        Top = 25
        Width = 624
        Height = 356
        Align = alClient
        TabOrder = 1
        object Splitter3: TSplitter
          Left = 308
          Top = 1
          Width = 4
          Height = 354
          Align = alRight
          ExplicitLeft = 302
        end
        object GroupBox5: TGroupBox
          Left = 1
          Top = 1
          Width = 307
          Height = 354
          Align = alClient
          Caption = 'InterBase'
          TabOrder = 0
          object TPanel
            Left = 2
            Top = 15
            Width = 303
            Height = 41
            Align = alTop
            TabOrder = 0
            object Button10: TButton
              Left = 8
              Top = 10
              Width = 75
              Height = 25
              Caption = 'Load'
              TabOrder = 0
              OnClick = Button8Click
            end
          end
          object DBGrid4: TDBGrid
            Left = 2
            Top = 56
            Width = 303
            Height = 296
            Align = alClient
            DataSource = DM.DataSource2
            Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
        end
        object GroupBox6: TGroupBox
          Left = 312
          Top = 1
          Width = 311
          Height = 354
          Align = alRight
          Caption = 'MSSQL'
          TabOrder = 1
          object TPanel
            Left = 2
            Top = 15
            Width = 307
            Height = 41
            Align = alTop
            TabOrder = 0
            object Button11: TButton
              Left = 8
              Top = 10
              Width = 75
              Height = 25
              Caption = 'Load'
              TabOrder = 0
              OnClick = Button11Click
            end
            object Button12: TButton
              Left = 89
              Top = 10
              Width = 75
              Height = 25
              Caption = 'Delete'
              TabOrder = 1
              OnClick = Button12Click
            end
          end
          object DBGrid3: TDBGrid
            Left = 2
            Top = 56
            Width = 307
            Height = 296
            Align = alClient
            DataSource = DM.DataSource3
            Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
        end
      end
    end
  end
end
