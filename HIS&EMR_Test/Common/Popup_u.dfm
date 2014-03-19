inherited Popup_f: TPopup_f
  Left = 405
  Top = 238
  BorderStyle = bsNone
  Caption = 'Popup_f'
  OldCreateOrder = True
  Position = poDesigned
  OnActivate = FormActivate
  OnClose = FormClose
  OnDeactivate = FormDeactivate
  PixelsPerInch = 96
  TextHeight = 12
  object pnl_border1: TFlatPanel
    Left = 0
    Top = 0
    Width = 268
    Height = 152
    ParentColor = True
    ColorHighLight = 8404992
    ColorShadow = 8404992
    Align = alClient
    TabOrder = 0
    object pnl_border2: TPanel
      Left = 1
      Top = 1
      Width = 266
      Height = 150
      Align = alClient
      Color = 14215660
      TabOrder = 0
      object bvl_title: TBevel
        Left = 1
        Top = 18
        Width = 264
        Height = 7
        Align = alTop
        Shape = bsTopLine
      end
      object pnl_title: TPanel
        Left = 1
        Top = 1
        Width = 264
        Height = 17
        Align = alTop
        BevelOuter = bvNone
        Color = clNavy
        Font.Charset = GB2312_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
  end
end
