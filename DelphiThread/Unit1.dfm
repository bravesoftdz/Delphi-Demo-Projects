object Form1: TForm1
  Left = 228
  Top = 197
  Width = 459
  Height = 478
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object BtnGoPause: TButton
    Left = 176
    Top = 48
    Width = 75
    Height = 25
    Caption = 'BtnGoPause'
    TabOrder = 0
    OnClick = BtnGoPauseClick
  end
  object lst1: TListBox
    Left = 24
    Top = 80
    Width = 121
    Height = 257
    ItemHeight = 13
    TabOrder = 1
  end
  object lst2: TListBox
    Left = 240
    Top = 80
    Width = 121
    Height = 257
    ItemHeight = 13
    TabOrder = 2
  end
end
