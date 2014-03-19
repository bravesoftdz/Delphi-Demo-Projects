object Form1: TForm1
  Left = 252
  Top = 153
  Width = 196
  Height = 134
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Btn_go: TButton
    Left = 56
    Top = 18
    Width = 75
    Height = 25
    Caption = 'Btn_setbar'
    TabOrder = 0
    OnClick = Btn_goClick
  end
  object Btn_cache: TButton
    Left = 56
    Top = 58
    Width = 75
    Height = 25
    Caption = 'Btn_cache'
    TabOrder = 1
    OnClick = Btn_cacheClick
  end
end
