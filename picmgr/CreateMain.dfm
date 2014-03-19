object Form_Create: TForm_Create
  Left = 464
  Top = 231
  Width = 353
  Height = 376
  Caption = #21019#24314#22270#29255#25968#25454' ( ALT+C '#21019#24314#25968#25454#24211' )'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DropFileListBox1: TDropFileListBox
    Left = 0
    Top = 0
    Width = 345
    Height = 342
    Align = alClient
    ItemHeight = 13
    Sorted = True
    TabOrder = 0
    OnDblClick = DropFileListBox1DblClick
    OnKeyDown = DropFileListBox1KeyDown
    OnDropFiles = DropFileListBox1DropFiles
    DropEnabled = True
  end
  object Button1: TButton
    Left = 0
    Top = 0
    Width = 0
    Height = 0
    Caption = 'create(&c)'
    TabOrder = 1
    OnClick = Button1Click
  end
  object ADS: TADODataSet
    Parameters = <>
    Left = 142
    Top = 157
  end
  object dlgSv: TSaveDialog
    DefaultExt = 'noname.mdb'
    Filter = '*.mdb|*.mdb'
    InitialDir = '.'
    Left = 174
    Top = 157
  end
end
