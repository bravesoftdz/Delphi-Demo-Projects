object Form1: TForm1
  Left = 774
  Top = 249
  Width = 615
  Height = 341
  AlphaBlend = True
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
  object Btn_1: TButton
    Left = 520
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Btn_1'
    TabOrder = 0
    OnClick = Btn_1Click
  end
  object LstViw_1: TListView
    Left = 24
    Top = 16
    Width = 369
    Height = 225
    BevelOuter = bvNone
    BevelKind = bkFlat
    Columns = <
      item
        Caption = #30149#21382#32534#21495
        Width = 65
      end
      item
        Alignment = taCenter
        Caption = #30149#21382#21517#31216
        Width = 140
      end
      item
        Caption = #21019#24314#26102#38388
        Width = 150
      end>
    DragMode = dmAutomatic
    ReadOnly = True
    RowSelect = True
    TabOrder = 1
    TabStop = False
    ViewStyle = vsReport
    OnColumnClick = LstViw_1ColumnClick
    OnCompare = LstViw_1Compare
    OnDragDrop = LstViw_1DragDrop
    OnDragOver = LstViw_1DragOver
  end
end
