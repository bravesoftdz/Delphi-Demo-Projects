object Frm_Prop: TFrm_Prop
  Left = 631
  Top = 181
  AutoScroll = False
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #30149#21382#27169#26495#23646#24615#35774#32622
  ClientHeight = 414
  ClientWidth = 647
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Lb_mbmc: TLabel
    Left = 27
    Top = 20
    Width = 70
    Height = 20
    Alignment = taCenter
    AutoSize = False
    Caption = #27169#26495#21517#31216#65306
    Layout = tlCenter
  end
  object Lb_sslx: TLabel
    Left = 27
    Top = 70
    Width = 70
    Height = 20
    Alignment = taCenter
    AutoSize = False
    Caption = #25152#23646#31867#22411#65306
    Layout = tlCenter
  end
  object Lb_syxb: TLabel
    Left = 27
    Top = 120
    Width = 70
    Height = 20
    Alignment = taCenter
    AutoSize = False
    Caption = #36866#29992#24615#21035#65306
    Layout = tlCenter
  end
  object Lb_ssfl: TLabel
    Left = 326
    Top = 70
    Width = 70
    Height = 20
    Alignment = taCenter
    AutoSize = False
    Caption = #25152#23646#20998#31867#65306
    Layout = tlCenter
  end
  object Lb_sybz: TLabel
    Left = 27
    Top = 170
    Width = 70
    Height = 20
    Alignment = taCenter
    AutoSize = False
    Caption = #36866#29992#30149#31181#65306
    Layout = tlCenter
  end
  object Lb_ms: TLabel
    Left = 27
    Top = 287
    Width = 70
    Height = 20
    Alignment = taCenter
    AutoSize = False
    Caption = #27169#26495#25551#36848#65306
    Layout = tlCenter
  end
  object Fsdt_ssfl: TFlatSelEdit
    Left = 411
    Top = 70
    Width = 200
    Height = 20
    ParentColor = True
    TabOrder = 2
    OnClick = Fsdt_ssflClick
    SelStart = 0
    OnDownClick = Fsdt_ssflDownClick
    OnKeyDown = Fsdt_ssflKeyDown
    MaxLength = 0
    SelLength = 0
    ColorFlat = clWindow
    ColorFocused = clBlack
    HintType = htDown
  end
  object Fdt_mbmc: TFlatEdit
    Left = 112
    Top = 20
    Width = 499
    Height = 20
    ColorFlat = clWindow
    TabOrder = 0
    OnKeyDown = Fdt_mbmcKeyDown
  end
  object CBox_sslx: TComboBox
    Left = 112
    Top = 69
    Width = 200
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
    OnKeyDown = CBox_sslxKeyDown
    Items.Strings = (
      #20840#38498
      #31185#23460
      #20010#20154)
  end
  object CBox_syxb: TComboBox
    Left = 112
    Top = 119
    Width = 200
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 3
    OnKeyDown = CBox_syxbKeyDown
    Items.Strings = (
      #30007
      #22899
      #20854#20182)
  end
  object Fsdt_sybz: TFlatSelEdit
    Left = 99
    Top = 170
    Width = 200
    Height = 20
    Hint = #25353#22238#36710#36339#21040#25353#38062#28155#21152#36866#29992#30149#31181#13#10#25353'ESC'#38190#21017#36339#21040#27169#26495#25551#36848
    ParentColor = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = Fsdt_sybzClick
    SelStart = 0
    OnDownClick = Fsdt_sybzDownClick
    OnKeyDown = Fsdt_sybzKeyDown
    MaxLength = 0
    SelLength = 0
    ColorFlat = clWindow
    ColorFocused = clBlack
    HintType = htDown
  end
  object Fmmo_ms: TFlatMemo
    Left = 115
    Top = 287
    Width = 494
    Height = 58
    Hint = #25353'ESC'#38190#36339#33267#30830#35748#25353#38062
    TabStop = False
    ColorFlat = clWindow
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnKeyDown = Fmmo_msKeyDown
  end
  object btn_ok: TBitBtn
    Left = 175
    Top = 375
    Width = 137
    Height = 25
    Caption = #30830#35748
    TabOrder = 7
    OnClick = btn_okClick
  end
  object btn_cancle: TBitBtn
    Left = 335
    Top = 375
    Width = 137
    Height = 25
    Caption = #21462#28040
    TabOrder = 8
    OnClick = btn_cancleClick
  end
  object btn_addIcd: TBitBtn
    Left = 27
    Top = 232
    Width = 270
    Height = 25
    Caption = #28857#20987#21521#21491#36793#21015#34920#28155#21152#36866#29992#30149#31181
    TabOrder = 5
    OnClick = btn_addIcdClick
  end
  object Edt_mbid: TEdit
    Left = 16
    Top = 376
    Width = 121
    Height = 21
    TabStop = False
    TabOrder = 9
    Visible = False
  end
  object Lst_sybz: TListBox
    Left = 328
    Top = 170
    Width = 281
    Height = 87
    Hint = #21452#20987#21024#38500#36873#20013#39033
    ItemHeight = 13
    TabOrder = 10
    OnDblClick = Lst_sybzDblClick
  end
  object Cds_prop: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDtl8'
    RemoteServer = DM.SockConn
    Left = 40
    Top = 312
  end
  object DictIpt2: TDictIpt
    FieldCode = 'Code'
    FieldInCode = 'Input_Code'
    FieldName = 'Name'
    Left = 72
    Top = 312
  end
  object Cds_sybz: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDtl7'
    RemoteServer = DM.SockConn
    Left = 40
    Top = 344
  end
end
