object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #50640#46356#53944'/'#48260#53948' '#49549#49457#46308
  ClientHeight = 518
  ClientWidth = 301
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
  object Label1: TLabel
    Left = 24
    Top = 21
    Width = 110
    Height = 13
    Caption = #53581#49828#53944#51221#47148'(Alignment)'
  end
  object Button1: TButton
    Left = 48
    Top = 67
    Width = 75
    Height = 25
    Caption = #51221#47148
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 24
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 1
    Text = #53581#49828#53944' '#51221#47148
  end
  object LabeledEdit1: TLabeledEdit
    Left = 24
    Top = 128
    Width = 121
    Height = 21
    EditLabel.Width = 151
    EditLabel.Height = 13
    EditLabel.Caption = #53581#49828#53944#55180#53944' '#54364#49884#54616#44592'(TextHint)'
    TabOrder = 2
    TextHint = #53581#49828#53944#55180#53944
  end
  object LabeledEdit2: TLabeledEdit
    Left = 24
    Top = 184
    Width = 121
    Height = 21
    EditLabel.Width = 83
    EditLabel.Height = 13
    EditLabel.Caption = #49707#51088#47564' '#51077#47141' '#48155#44592
    NumbersOnly = True
    TabOrder = 3
    Text = '3'
  end
  object LabeledEdit3: TLabeledEdit
    Left = 160
    Top = 184
    Width = 121
    Height = 21
    EditLabel.Width = 69
    EditLabel.Height = 13
    EditLabel.Caption = #48708#48128#48264#54840' '#47928#51088
    PasswordChar = #9632
    TabOrder = 4
    Text = 'password'
  end
  object ComboBox1: TComboBox
    Left = 160
    Top = 128
    Width = 121
    Height = 21
    Style = csDropDownList
    TabOrder = 5
    TextHint = #46020#49884#47484' '#49440#53469#54616#49464#50836'.'
    OnKeyUp = ComboBox1KeyUp
    Items.Strings = (
      #49436#50872
      #48512#49328
      #51064#52380
      #45824#44396
      #45824#51204
      #44305#51452
      #50872#49328
      #51228#51452)
  end
  object Memo1: TMemo
    Left = 24
    Top = 272
    Width = 257
    Height = 89
    Lines.Strings = (
      'Humphery Kim')
    TabOrder = 6
  end
  object Button2: TButton
    Left = 24
    Top = 217
    Width = 121
    Height = 25
    Caption = 'CharCase'
    TabOrder = 7
    OnClick = Button2Click
  end
  object Edit2: TEdit
    Left = 24
    Top = 248
    Width = 257
    Height = 21
    TabOrder = 8
    Text = 'Humphery Kim'
  end
  object Button3: TButton
    Left = 24
    Top = 382
    Width = 257
    Height = 25
    Caption = #44288#47532#51088' '#44428#54620' '#50836#52397
    ElevationRequired = True
    TabOrder = 9
  end
  object Button4: TButton
    Left = 24
    Top = 413
    Width = 257
    Height = 41
    Caption = #52964#47592#46300' '#47553#53356' '#48169#49885
    Style = bsCommandLink
    TabOrder = 10
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 24
    Top = 460
    Width = 257
    Height = 41
    Caption = #48516#54624' '#48260#53948
    DropDownMenu = PopupMenu1
    Style = bsSplitButton
    TabOrder = 11
  end
  object PopupMenu1: TPopupMenu
    Left = 224
    Top = 462
    object N11: TMenuItem
      Caption = #48516#54624#48260#53948' '#46300#46989#45796#50868' '#49436#48652#47700#45684'1'
    end
    object N21: TMenuItem
      Caption = #48516#54624#48260#53948' '#46300#46989#45796#50868' '#49436#48652#47700#45684'2'
    end
  end
end
