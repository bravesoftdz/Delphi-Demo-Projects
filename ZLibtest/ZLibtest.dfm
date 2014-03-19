object Form1: TForm1
  Left = 240
  Top = 156
  Width = 595
  Height = 220
  Caption = 'Demo for Zlib'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Btn_Decompress: TButton
    Left = 256
    Top = 112
    Width = 75
    Height = 25
    Caption = #35299#21387
    TabOrder = 1
    OnClick = Btn_DecompressClick
  end
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 241
    Height = 153
    Lines.Strings = (
      'Hello World!'
      'Hello World!'
      'Hello World!'
      'Hello World!'
      'Hello World!'
      'Hello World!'
      'Hello World!')
    ScrollBars = ssVertical
    TabOrder = 2
    OnDblClick = Memo1DblClick
  end
  object Memo2: TMemo
    Left = 336
    Top = 8
    Width = 241
    Height = 153
    ScrollBars = ssVertical
    TabOrder = 3
    OnDblClick = Memo2DblClick
  end
  object Btn_Compress: TButton
    Left = 256
    Top = 24
    Width = 75
    Height = 25
    Caption = #21387#32553
    TabOrder = 0
    OnClick = Btn_CompressClick
  end
  object Stat_1: TStatusBar
    Left = 0
    Top = 167
    Width = 587
    Height = 19
    Panels = <
      item
        Text = #24038#20391#25991#26412#26694#21452#20987#40736#26631#20174#21098#36148#26495#31896#36148#65292#21491#20391#25991#26412#26694#21452#20987#20840#37096#22797#21046#21040#21098#36148#26495#12290
        Width = 50
      end>
    SimplePanel = False
  end
end
