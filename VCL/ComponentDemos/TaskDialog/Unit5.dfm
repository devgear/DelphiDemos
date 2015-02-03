object Form5: TForm5
  Left = 0
  Top = 0
  Caption = 'TaskDialog '#52980#54252#45324#53944' '#45936#47784
  ClientHeight = 312
  ClientWidth = 554
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object LabeledEdit1: TLabeledEdit
    Left = 24
    Top = 32
    Width = 121
    Height = 21
    EditLabel.Width = 37
    EditLabel.Height = 13
    EditLabel.Caption = 'Caption'
    TabOrder = 0
    Text = #51089#50629#52285#51032' '#52897#49496
  end
  object LabeledEdit2: TLabeledEdit
    Left = 151
    Top = 32
    Width = 121
    Height = 21
    EditLabel.Width = 20
    EditLabel.Height = 13
    EditLabel.Caption = 'Title'
    TabOrder = 1
    Text = #51089#50629#51032' '#51228#47785
  end
  object LabeledEdit3: TLabeledEdit
    Left = 278
    Top = 32
    Width = 163
    Height = 21
    EditLabel.Width = 22
    EditLabel.Height = 13
    EditLabel.Caption = 'Text'
    TabOrder = 2
    Text = #51089#50629#50640' '#45824#54620' '#45236#50857#51012' '#51077#47141#54633#45768#45796'.'
  end
  object Button1: TButton
    Left = 447
    Top = 30
    Width = 75
    Height = 25
    Caption = #49892#54665
    TabOrder = 3
    OnClick = Button1Click
  end
  object LabeledEdit4: TLabeledEdit
    Left = 24
    Top = 80
    Width = 121
    Height = 21
    EditLabel.Width = 70
    EditLabel.Height = 13
    EditLabel.Caption = 'ExpandedText'
    TabOrder = 4
    Text = #51088#49464#54620#51221#48372'('#52628#44032#51221#48372')'#47484' '#51077#47141' '#54624' '#49688' '#51080#49845#45768#45796'.'
  end
  object LabeledEdit5: TLabeledEdit
    Left = 151
    Top = 80
    Width = 121
    Height = 21
    EditLabel.Width = 105
    EditLabel.Height = 13
    EditLabel.Caption = 'ExpandButtonCaption'
    TabOrder = 5
    Text = #51088#49464#54620' '#51221#48372' '#48260#53948#51032' '#51228#47785
  end
  object RadioGroup1: TRadioGroup
    Left = 24
    Top = 163
    Width = 417
    Height = 46
    Caption = 'MainIcon'
    Columns = 5
    ItemIndex = 3
    Items.Strings = (
      'None'
      'Warning'
      'Error'
      'Information'
      'Shield')
    TabOrder = 6
  end
  object GroupBox1: TGroupBox
    Left = 24
    Top = 107
    Width = 417
    Height = 50
    Caption = 'CommonButtons'
    TabOrder = 7
    object CheckBox1: TCheckBox
      Left = 9
      Top = 23
      Width = 64
      Height = 17
      Caption = 'Ok'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object CheckBox2: TCheckBox
      Left = 65
      Top = 23
      Width = 64
      Height = 17
      Caption = 'Yes'
      TabOrder = 1
    end
    object CheckBox3: TCheckBox
      Left = 113
      Top = 23
      Width = 64
      Height = 17
      Caption = 'No'
      TabOrder = 2
    end
    object CheckBox4: TCheckBox
      Left = 153
      Top = 23
      Width = 64
      Height = 17
      Caption = 'Cancel'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object CheckBox5: TCheckBox
      Left = 217
      Top = 23
      Width = 64
      Height = 17
      Caption = 'Retry'
      TabOrder = 4
    end
    object CheckBox6: TCheckBox
      Left = 273
      Top = 23
      Width = 64
      Height = 17
      Caption = 'Close'
      TabOrder = 5
    end
    object CheckBox7: TCheckBox
      Left = 329
      Top = 23
      Width = 64
      Height = 17
      Caption = 'Custom'
      TabOrder = 6
    end
  end
  object Edit1: TEdit
    Left = 447
    Top = 61
    Width = 75
    Height = 21
    TabOrder = 8
    TextHint = #44208#44284' '#44050
  end
  object CheckBox8: TCheckBox
    Left = 24
    Top = 224
    Width = 97
    Height = 17
    Caption = 'Use Footer Text'
    TabOrder = 9
  end
  object Edit2: TEdit
    Left = 127
    Top = 222
    Width = 90
    Height = 21
    TabOrder = 10
    Text = #54616#45800#50640' '#52628#44032' '#49444#47749
  end
  object Edit3: TEdit
    Left = 343
    Top = 222
    Width = 98
    Height = 21
    TabOrder = 11
    Text = #54869#51064' '#52404#53356#48149#49828' '#49444#47749
  end
  object CheckBox9: TCheckBox
    Left = 223
    Top = 224
    Width = 114
    Height = 17
    Caption = 'Use Verification Text'
    TabOrder = 12
  end
  object CheckBox10: TCheckBox
    Left = 24
    Top = 255
    Width = 161
    Height = 17
    Caption = 'Use Radio Buttons'
    TabOrder = 13
  end
  object CheckBox11: TCheckBox
    Left = 176
    Top = 255
    Width = 161
    Height = 17
    Caption = 'Use Command link'
    TabOrder = 14
  end
  object Edit4: TEdit
    Left = 40
    Top = 278
    Width = 121
    Height = 21
    TabOrder = 15
    TextHint = #49440#53469#54620' Radio button'
  end
  object CheckBox12: TCheckBox
    Left = 312
    Top = 255
    Width = 161
    Height = 17
    Caption = 'Show statusbar'
    TabOrder = 16
  end
  object TaskDialog1: TTaskDialog
    Buttons = <>
    FooterIcon = 3
    RadioButtons = <>
    OnRadioButtonClicked = TaskDialog1RadioButtonClicked
    OnVerificationClicked = TaskDialog1VerificationClicked
    Left = 464
    Top = 104
  end
end
