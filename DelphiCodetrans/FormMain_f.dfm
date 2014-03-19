object FormMain: TFormMain
  Left = 270
  Top = 214
  Width = 491
  Height = 206
  Caption = 'DelphiCodeTranslate'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 15
    Top = 15
    Width = 450
    Height = 41
    TabOrder = 0
  end
  object btn1: TButton
    Left = 58
    Top = 73
    Width = 120
    Height = 25
    Caption = 'UnicodeToAnsi'
    TabOrder = 1
    OnClick = btn1Click
  end
  object Memo2: TMemo
    Left = 15
    Top = 112
    Width = 450
    Height = 41
    TabOrder = 2
  end
  object btn2: TButton
    Left = 182
    Top = 73
    Width = 120
    Height = 25
    Caption = 'AnsiToUnicode'
    TabOrder = 3
    OnClick = btn2Click
  end
  object btn3: TButton
    Left = 306
    Top = 73
    Width = 120
    Height = 25
    Caption = 'DelphiUnicodeToAnsi'
    TabOrder = 4
    OnClick = btn3Click
  end
end
