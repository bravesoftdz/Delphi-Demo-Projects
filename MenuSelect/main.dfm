object main_f: Tmain_f
  Left = 247
  Top = 198
  Width = 397
  Height = 173
  Caption = 'Demo for Menu Select'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = Menu_1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Edt_1: TEdit
    Left = 0
    Top = 2
    Width = 118
    Height = 21
    TabOrder = 0
    OnKeyDown = Edt_1KeyDown
  end
  object Stat_1: TStatusBar
    Left = 0
    Top = 100
    Width = 389
    Height = 19
    Panels = <
      item
        Text = #25991#26412#26694#20869#36755#20837#25991#26412#28982#21518#22238#36710#20197#26597#25214#33756#21333#39033#65292#25903#25345#22810#25991#26412#26597#25214#65292#31354#26684#20998#38548
        Width = 500
      end>
    SimplePanel = False
  end
  object Menu_1: TMainMenu
    Left = 222
    object Mitem_A: TMenuItem
      AutoHotkeys = maManual
      Caption = 'A'
      object Mitem_A1: TMenuItem
        AutoHotkeys = maManual
        Caption = 'A1'
        OnClick = Mitem_A1Click
      end
      object Mitem_A2: TMenuItem
        AutoHotkeys = maManual
        Caption = 'A2'
        OnClick = Mitem_A2Click
      end
      object Mitem_A3: TMenuItem
        AutoHotkeys = maManual
        Caption = 'A3'
        OnClick = Mitem_A3Click
      end
    end
    object Mitem_B: TMenuItem
      AutoHotkeys = maManual
      Caption = 'B'
      object Mitem_B1: TMenuItem
        AutoHotkeys = maManual
        Caption = 'B1'
        OnClick = Mitem_B1Click
      end
      object Mitem_B2: TMenuItem
        AutoHotkeys = maManual
        Caption = 'B2'
        OnClick = Mitem_B2Click
      end
      object Mitem_B3: TMenuItem
        AutoHotkeys = maManual
        Caption = 'B3'
        OnClick = Mitem_B3Click
      end
    end
    object Mitem_C: TMenuItem
      AutoHotkeys = maManual
      Caption = 'C'
      object Mitem_C1: TMenuItem
        AutoHotkeys = maManual
        Caption = 'C1'
        OnClick = Mitem_C1Click
      end
      object Mitem_C2: TMenuItem
        AutoHotkeys = maManual
        Caption = 'C2'
        OnClick = Mitem_C2Click
      end
      object Mitem_C3: TMenuItem
        AutoHotkeys = maManual
        Caption = 'C3'
        OnClick = Mitem_C3Click
      end
    end
    object Mitem_D: TMenuItem
      AutoHotkeys = maManual
      Caption = 'D'
      object Mitem_D1: TMenuItem
        AutoHotkeys = maManual
        Caption = 'D1'
        OnClick = Mitem_D1Click
      end
      object Mitem_D2: TMenuItem
        AutoHotkeys = maManual
        Caption = 'D2'
        OnClick = Mitem_D2Click
      end
      object Mitem_D3: TMenuItem
        AutoHotkeys = maManual
        Caption = 'D3'
        OnClick = Mitem_D3Click
      end
    end
  end
  object PupMenu_1: TPopupMenu
    Left = 184
    object Mitem_select: TMenuItem
      Caption = 'select'
    end
  end
end
