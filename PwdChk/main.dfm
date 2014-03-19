object main_f: Tmain_f
  Left = 205
  Top = 148
  Width = 690
  Height = 462
  Caption = 'main_f'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Lb_1: TLabel
    Left = 8
    Top = 104
    Width = 140
    Height = 15
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Number of Characters'
    Layout = tlBottom
  end
  object Lb_lmin: TLabel
    Left = 16
    Top = 24
    Width = 153
    Height = 13
    AutoSize = False
    Caption = #23494#30721#38271#24230#38480#21046'-'#26368#30701#20301#25968
    Layout = tlBottom
  end
  object Lb_lmax: TLabel
    Left = 264
    Top = 24
    Width = 153
    Height = 13
    AutoSize = False
    Caption = #23494#30721#38271#24230#38480#21046'-'#26368#38271#20301#25968
    Layout = tlBottom
  end
  object Lb_2: TLabel
    Left = 8
    Top = 139
    Width = 140
    Height = 15
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Uppercase Letters'
    Layout = tlBottom
  end
  object Lb_3: TLabel
    Left = 8
    Top = 174
    Width = 140
    Height = 15
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Lowercase Letters'
    Layout = tlBottom
  end
  object Lb_4: TLabel
    Left = 8
    Top = 209
    Width = 140
    Height = 15
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Numbers'
    Layout = tlBottom
  end
  object Lb_5: TLabel
    Left = 8
    Top = 244
    Width = 140
    Height = 15
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Symbols'
    Layout = tlBottom
  end
  object Lb_6: TLabel
    Left = 8
    Top = 279
    Width = 140
    Height = 15
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Middle Numbers or Symbols'
    Layout = tlBottom
  end
  object Lb_7: TLabel
    Left = 320
    Top = 104
    Width = 200
    Height = 15
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Letters Only'
    Layout = tlBottom
  end
  object Lb_8: TLabel
    Left = 320
    Top = 139
    Width = 200
    Height = 15
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Numbers Only'
    Layout = tlBottom
  end
  object Lb_9: TLabel
    Left = 320
    Top = 174
    Width = 200
    Height = 15
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Repeat Characters (Case Insensitive)'
    Layout = tlBottom
  end
  object Lb_10: TLabel
    Left = 320
    Top = 209
    Width = 200
    Height = 15
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Consecutive Uppercase Letters'
    Layout = tlBottom
  end
  object Lb_11: TLabel
    Left = 320
    Top = 244
    Width = 200
    Height = 15
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Consecutive Lowercase Letters'
    Layout = tlBottom
  end
  object Lb_12: TLabel
    Left = 320
    Top = 279
    Width = 200
    Height = 15
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Consecutive Numbers'
    Layout = tlBottom
  end
  object Lb_13: TLabel
    Left = 320
    Top = 314
    Width = 200
    Height = 15
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Sequential Letters (3+)'
    Layout = tlBottom
  end
  object Lb_14: TLabel
    Left = 320
    Top = 349
    Width = 200
    Height = 15
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Sequential Numbers (3+)'
    Layout = tlBottom
  end
  object Lb_15: TLabel
    Left = 320
    Top = 384
    Width = 200
    Height = 15
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Sequential Symbols (3+)'
    Layout = tlBottom
  end
  object Lb_16: TLabel
    Left = 312
    Top = 56
    Width = 41
    Height = 17
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Score'
    Layout = tlBottom
  end
  object Lb_17: TLabel
    Left = 8
    Top = 314
    Width = 140
    Height = 15
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Requirements'
    Layout = tlBottom
  end
  object Edt_pwd: TEdit
    Left = 48
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Btn_pwdchk: TButton
    Left = 192
    Top = 56
    Width = 75
    Height = 25
    Caption = 'PwdChk'
    TabOrder = 1
    OnClick = Btn_pwdchkClick
  end
  object Edt_lmin: TEdit
    Left = 176
    Top = 16
    Width = 65
    Height = 21
    AutoSize = False
    TabOrder = 2
    Text = '1'
  end
  object Edt_lmax: TEdit
    Left = 440
    Top = 16
    Width = 57
    Height = 21
    AutoSize = False
    TabOrder = 3
    Text = '16'
  end
  object Edt_1: TEdit
    Left = 368
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object Edt_2: TEdit
    Left = 168
    Top = 104
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object Edt_3: TEdit
    Left = 168
    Top = 144
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object Edt_4: TEdit
    Left = 168
    Top = 176
    Width = 121
    Height = 21
    TabOrder = 7
  end
  object Edt_5: TEdit
    Left = 168
    Top = 208
    Width = 121
    Height = 21
    TabOrder = 8
  end
  object Edt_6: TEdit
    Left = 168
    Top = 240
    Width = 121
    Height = 21
    TabOrder = 9
  end
  object Edt_7: TEdit
    Left = 168
    Top = 280
    Width = 121
    Height = 21
    TabOrder = 10
  end
  object Edt_8: TEdit
    Left = 168
    Top = 312
    Width = 121
    Height = 21
    TabOrder = 11
  end
  object Edt_9: TEdit
    Left = 536
    Top = 104
    Width = 121
    Height = 21
    TabOrder = 12
  end
  object Edt_10: TEdit
    Left = 536
    Top = 136
    Width = 121
    Height = 21
    TabOrder = 13
  end
  object Edt_11: TEdit
    Left = 536
    Top = 168
    Width = 121
    Height = 21
    TabOrder = 14
  end
  object Edt_12: TEdit
    Left = 536
    Top = 208
    Width = 121
    Height = 21
    TabOrder = 15
  end
  object Edt_13: TEdit
    Left = 536
    Top = 240
    Width = 121
    Height = 21
    TabOrder = 16
  end
  object Edt_14: TEdit
    Left = 536
    Top = 272
    Width = 121
    Height = 21
    TabOrder = 17
  end
  object Edt_15: TEdit
    Left = 536
    Top = 312
    Width = 121
    Height = 21
    TabOrder = 18
  end
  object Edt_16: TEdit
    Left = 536
    Top = 344
    Width = 121
    Height = 21
    TabOrder = 19
  end
  object Edt_17: TEdit
    Left = 536
    Top = 384
    Width = 121
    Height = 21
    TabOrder = 20
  end
end
