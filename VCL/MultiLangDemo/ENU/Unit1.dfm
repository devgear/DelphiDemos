object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Multi-language support'
  ClientHeight = 89
  ClientWidth = 244
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
    Left = 24
    Top = 50
    Width = 26
    Height = 13
    Caption = 'Name:'
  end
  object Button1: TButton
    Left = 24
    Top = 8
    Width = 161
    Height = 25
    Caption = 'Press the button'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 86
    Top = 47
    Width = 121
    Height = 21
    TabOrder = 1
    TextHint = 'Enter your name.'
  end
end
