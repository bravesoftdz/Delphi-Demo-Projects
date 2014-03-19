object Main: TMain
  Left = 263
  Top = 206
  Width = 373
  Height = 124
  Caption = 'TaskKill'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Lb_TskNm: TLabel
    Left = 35
    Top = 41
    Width = 65
    Height = 16
    Caption = 'Task Name:'
  end
  object Edt_TskNm: TEdit
    Left = 120
    Top = 33
    Width = 120
    Height = 24
    TabOrder = 0
  end
  object Btn_Kill: TButton
    Left = 259
    Top = 33
    Width = 72
    Height = 24
    Caption = 'Btn_Kill'
    TabOrder = 1
    OnClick = Btn_KillClick
  end
end
