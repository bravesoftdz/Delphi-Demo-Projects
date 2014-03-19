inherited basyxx_f: Tbasyxx_f
  Left = 352
  Top = 158
  Caption = #30149#26696#39318#39029
  ClientHeight = 432
  ClientWidth = 756
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object pgc_syxx: TPageControl
    Left = 4
    Top = 4
    Width = 752
    Height = 378
    ActivePage = TabSheet3
    Style = tsButtons
    TabHeight = 24
    TabIndex = 2
    TabOrder = 0
    TabWidth = 80
    object TabSheet1: TTabSheet
      Caption = #22522#26412#20449#24687
      inline jbxx_fm: Tbrjbxx_fm
        Left = 2
        Top = 2
        Width = 740
        Height = 336
        Color = 14215660
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        inherited pnl_brxx: TPanel
          inherited edt_lxdh: TFlatEdit
            OnKeyDown = jbxx_fmedt_lxdhKeyDown
          end
          inherited Panel3: TPanel
            inherited edt_ryrq: TFlatMaskDate
              Text = '2007-06-26 14:32:25'
            end
            inherited edt_cyrq: TFlatMaskDate
              Text = '2007-06-26 14:32:25'
            end
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #35786#26029#20449#24687
      ImageIndex = 1
      object pnl_zdxx: TPanel
        Left = 0
        Top = 2
        Width = 744
        Height = 341
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Enabled = False
        ParentColor = True
        TabOrder = 0
        inline ZDXX_FM: TZYZDXX_fm
          Left = 2
          Top = 3
          Width = 740
          Height = 336
          Color = 14215660
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          inherited edt_blzd: TFlatSelEdit
            Width = 673
          end
          inherited edt_sszdyy: TFlatSelEdit
            OnClick = ZDXX_FMedt_sszdyyClick
            OnKeyDown = ZDXX_FMedt_sszdyyKeyDown
          end
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #25163#26415#24773#20917
      ImageIndex = 2
      object pnl_ssxx: TPanel
        Left = 2
        Top = 3
        Width = 740
        Height = 336
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Enabled = False
        ParentColor = True
        TabOrder = 0
        object Label1: TLabel
          Left = 5
          Top = 8
          Width = 48
          Height = 12
          Caption = #36807#25935#33647#29289
        end
        object Label36: TLabel
          Left = 333
          Top = 8
          Width = 72
          Height = 12
          Caption = #19981#33391#33647#29289#21453#24212
        end
        object Label2: TLabel
          Left = 23
          Top = 39
          Width = 30
          Height = 12
          Caption = 'HBsAG'
        end
        object Label3: TLabel
          Left = 122
          Top = 39
          Width = 36
          Height = 12
          Caption = 'HCV_Ab'
        end
        object Label4: TLabel
          Left = 226
          Top = 39
          Width = 36
          Height = 12
          Caption = 'HIV_Ab'
        end
        object Label5: TLabel
          Left = 328
          Top = 39
          Width = 60
          Height = 12
          Caption = #38376#35786#19982#20986#38498
        end
        object Label6: TLabel
          Left = 600
          Top = 39
          Width = 60
          Height = 12
          Caption = #26415#21069#19982#26415#21518
        end
        object Label7: TLabel
          Left = 8
          Top = 72
          Width = 60
          Height = 12
          Caption = #20020#24202#19982#30149#29702
        end
        object Label8: TLabel
          Left = 152
          Top = 72
          Width = 60
          Height = 12
          Caption = #25918#23556#19982#30149#29702
        end
        object Label9: TLabel
          Left = 296
          Top = 72
          Width = 66
          Height = 12
          Caption = #25250#25937'     '#27425
        end
        object Label10: TLabel
          Left = 368
          Top = 72
          Width = 72
          Height = 12
          Caption = #25104#21151'      '#27425
        end
        object Label28: TLabel
          Left = 18
          Top = 105
          Width = 36
          Height = 12
          Caption = #31185#20027#20219
        end
        object Label29: TLabel
          Left = 176
          Top = 105
          Width = 84
          Height = 12
          Caption = #20027'('#21103')'#20027#20219#21307#24072
        end
        object Label30: TLabel
          Left = 408
          Top = 105
          Width = 48
          Height = 12
          Caption = #20027#27835#21307#24072
        end
        object Label31: TLabel
          Left = 590
          Top = 105
          Width = 48
          Height = 12
          Caption = #20303#38498#21307#24072
        end
        object Label32: TLabel
          Left = 8
          Top = 142
          Width = 48
          Height = 12
          Caption = #36827#20462#21307#24072
        end
        object Label33: TLabel
          Left = 131
          Top = 142
          Width = 84
          Height = 12
          Caption = #30740#31350#29983#23454#20064#21307#24072
        end
        object Label34: TLabel
          Left = 292
          Top = 142
          Width = 48
          Height = 12
          Caption = #23454#20064#21307#24072
        end
        object Label35: TLabel
          Left = 456
          Top = 72
          Width = 48
          Height = 12
          Caption = #30149#26696#36136#37327
        end
        object Label37: TLabel
          Left = 414
          Top = 142
          Width = 48
          Height = 12
          Caption = #36136#25511#21307#29983
        end
        object Label38: TLabel
          Left = 589
          Top = 142
          Width = 48
          Height = 12
          Caption = #30149#25511#25252#22763
        end
        object Label39: TLabel
          Left = 465
          Top = 39
          Width = 60
          Height = 12
          Caption = #20837#38498#19982#20986#38498
        end
        object Label11: TLabel
          Left = 8
          Top = 313
          Width = 24
          Height = 12
          Caption = #23608#26816
        end
        object Label12: TLabel
          Left = 96
          Top = 313
          Width = 204
          Height = 12
          Caption = #25163#26415#12289#27835#30103#12289#26816#26597#12289#35786#26029#20026#26412#38498#31532#19968#20363
        end
        object Label13: TLabel
          Left = 356
          Top = 313
          Width = 24
          Height = 12
          Caption = #38543#35786
        end
        object Label14: TLabel
          Left = 432
          Top = 313
          Width = 48
          Height = 12
          Caption = #38543#35786#26399#38480
        end
        object Label15: TLabel
          Left = 512
          Top = 313
          Width = 12
          Height = 12
          Caption = #24180
        end
        object Label16: TLabel
          Left = 560
          Top = 313
          Width = 12
          Height = 12
          Caption = #26376
        end
        object Label17: TLabel
          Left = 608
          Top = 313
          Width = 12
          Height = 12
          Caption = #26085
        end
        object Label18: TLabel
          Left = 640
          Top = 313
          Width = 48
          Height = 12
          Caption = #26410#25945#30149#20363
        end
        object edt_gmyw: TFlatEdit
          Left = 56
          Top = 5
          Width = 265
          Height = 18
          ColorBorder = 12164479
          ColorFlat = clWindow
          Font.Charset = GB2312_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnChange = edt_gmywChange
          OnKeyDown = edt_gmywKeyDown
        end
        object edt_ywfy: TFlatEdit
          Left = 409
          Top = 5
          Width = 325
          Height = 18
          ColorBorder = 12164479
          ColorFlat = clWindow
          Font.Charset = GB2312_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnChange = edt_ywfyChange
          OnKeyDown = edt_ywfyKeyDown
        end
        object cbx_hbsag: TFlatComboBoxCode
          Left = 55
          Top = 35
          Width = 54
          Height = 20
          Style = csDropDownList
          Color = clWindow
          ColorArrowBackground = 14215660
          ColorBorder = 12164479
          ItemHeight = 12
          Items.Strings = (
            #26410#20570
            #38452#24615
            #38451#24615)
          TabOrder = 2
          ItemIndex = -1
          OnChange = cbx_hbsagChange
          OnKeyDown = cbx_hbsagKeyDown
          ItemCodes.Strings = (
            '0'
            '1'
            '2')
          ItemInput.Strings = (
            '0'
            '1'
            '2')
        end
        object cbx_hcv: TFlatComboBoxCode
          Left = 162
          Top = 35
          Width = 54
          Height = 20
          Style = csDropDownList
          Color = clWindow
          ColorArrowBackground = 14215660
          ColorBorder = 12164479
          ItemHeight = 12
          Items.Strings = (
            #26410#20570
            #38452#24615
            #38451#24615)
          TabOrder = 3
          ItemIndex = -1
          OnChange = cbx_hcvChange
          OnKeyDown = cbx_hcvKeyDown
          ItemCodes.Strings = (
            '0'
            '1'
            '2')
          ItemInput.Strings = (
            '0'
            '1'
            '2')
        end
        object cbx_hiv: TFlatComboBoxCode
          Left = 264
          Top = 35
          Width = 54
          Height = 20
          Style = csDropDownList
          Color = clWindow
          ColorArrowBackground = 14215660
          ColorBorder = 12164479
          ItemHeight = 12
          Items.Strings = (
            #26410#20570
            #38452#24615
            #38451#24615)
          TabOrder = 4
          ItemIndex = -1
          OnChange = cbx_hivChange
          OnKeyDown = cbx_hivKeyDown
          ItemCodes.Strings = (
            '0'
            '1'
            '2')
          ItemInput.Strings = (
            '0'
            '1'
            '2')
        end
        object cbx_fsbl: TFlatComboBoxCode
          Left = 219
          Top = 67
          Width = 68
          Height = 20
          Style = csDropDownList
          Color = clWindow
          ColorArrowBackground = 14215660
          ColorBorder = 12164479
          ItemHeight = 12
          Items.Strings = (
            #26410#20570
            #31526#21512
            #19981#31526#21512)
          TabOrder = 5
          ItemIndex = -1
          OnChange = cbx_fsblChange
          OnKeyDown = cbx_fsblKeyDown
          ItemCodes.Strings = (
            '0'
            '1'
            '2')
          ItemInput.Strings = (
            '0'
            '1'
            '2')
        end
        object cbx_mzcy: TFlatComboBoxCode
          Left = 390
          Top = 35
          Width = 68
          Height = 20
          Style = csDropDownList
          Color = clWindow
          ColorArrowBackground = 14215660
          ColorBorder = 12164479
          ItemHeight = 12
          Items.Strings = (
            #26410#20570
            #31526#21512
            #19981#31526#21512)
          TabOrder = 6
          ItemIndex = -1
          OnChange = cbx_mzcyChange
          OnKeyDown = cbx_mzcyKeyDown
          ItemCodes.Strings = (
            '0'
            '1'
            '2')
          ItemInput.Strings = (
            '0'
            '1'
            '2')
        end
        object cbx_sqsh: TFlatComboBoxCode
          Left = 667
          Top = 35
          Width = 68
          Height = 20
          Style = csDropDownList
          Color = clWindow
          ColorArrowBackground = 14215660
          ColorBorder = 12164479
          ItemHeight = 12
          Items.Strings = (
            #26410#20570
            #31526#21512
            #19981#31526#21512)
          TabOrder = 7
          ItemIndex = -1
          OnChange = cbx_sqshChange
          OnKeyDown = cbx_sqshKeyDown
          ItemCodes.Strings = (
            '0'
            '1'
            '2')
          ItemInput.Strings = (
            '0'
            '1'
            '2')
        end
        object cbx_lcbl: TFlatComboBoxCode
          Left = 71
          Top = 67
          Width = 68
          Height = 20
          Style = csDropDownList
          Color = clWindow
          ColorArrowBackground = 14215660
          ColorBorder = 12164479
          ItemHeight = 12
          Items.Strings = (
            #26410#20570
            #31526#21512
            #19981#31526#21512)
          TabOrder = 8
          ItemIndex = -1
          OnChange = cbx_lcblChange
          OnKeyDown = cbx_lcblKeyDown
          ItemCodes.Strings = (
            '0'
            '1'
            '2')
          ItemInput.Strings = (
            '0'
            '1'
            '2')
        end
        object edt_qjcs: TOWFlatEdit
          Left = 325
          Top = 67
          Width = 23
          Height = 21
          ColorBorder = 12164479
          ColorFlat = clWhite
          MaxLength = 2
          TabOrder = 9
          Text = '0'
          OnChange = edt_qjcsChange
          OnKeyDown = edt_qjcsKeyDown
          SelStart = 0
          DataType = tInteger
        end
        object edt_cgcs: TOWFlatEdit
          Left = 398
          Top = 67
          Width = 23
          Height = 20
          ColorBorder = 12164479
          ColorFlat = clWhite
          MaxLength = 2
          TabOrder = 10
          Text = '0'
          OnChange = edt_cgcsChange
          OnKeyDown = edt_cgcsKeyDown
          SelStart = 0
          DataType = tInteger
        end
        object edt_kzr: TFlatSelEdit
          Left = 55
          Top = 101
          Width = 85
          Height = 20
          Caption = 'edt_kzr'
          ParentColor = True
          ColorHighLight = 12164479
          ColorShadow = 12164479
          TabOrder = 11
          OnClick = edt_kzrClick
          SelStart = 0
          OnDownClick = edt_kzrDownClick
          OnKeyDown = edt_kzrKeyDown
          ShapeColor = 12164479
          MaxLength = 0
          SelLength = 0
          ColorFlat = clWindow
          ColorFocused = clWindow
          HintType = htDown
        end
        object edt_zrys: TFlatSelEdit
          Left = 268
          Top = 101
          Width = 93
          Height = 20
          Caption = 'edt_mz'
          ParentColor = True
          ColorHighLight = 12164479
          ColorShadow = 12164479
          TabOrder = 12
          OnClick = edt_zrysClick
          SelStart = 0
          OnDownClick = edt_kzrDownClick
          OnKeyDown = edt_zrysKeyDown
          ShapeColor = 12164479
          MaxLength = 0
          SelLength = 0
          ColorFlat = clWindow
          ColorFocused = clWindow
          HintType = htDown
        end
        object edt_zzys: TFlatSelEdit
          Left = 460
          Top = 101
          Width = 93
          Height = 20
          Caption = 'edt_mz'
          ParentColor = True
          ColorHighLight = 12164479
          ColorShadow = 12164479
          TabOrder = 13
          OnClick = edt_zzysClick
          SelStart = 0
          OnDownClick = edt_kzrDownClick
          OnKeyDown = edt_zzysKeyDown
          ShapeColor = 12164479
          MaxLength = 0
          SelLength = 0
          ColorFlat = clWindow
          ColorFocused = clWindow
          HintType = htDown
        end
        object edt_zyys: TFlatSelEdit
          Left = 642
          Top = 101
          Width = 93
          Height = 20
          Caption = 'edt_mz'
          ParentColor = True
          ColorHighLight = 12164479
          ColorShadow = 12164479
          TabOrder = 14
          OnClick = edt_zyysClick
          SelStart = 0
          OnDownClick = edt_kzrDownClick
          OnKeyDown = edt_zyysKeyDown
          ShapeColor = 12164479
          MaxLength = 0
          SelLength = 0
          ColorFlat = clWindow
          ColorFocused = clWindow
          HintType = htDown
        end
        object edt_zkhs: TFlatSelEdit
          Left = 641
          Top = 139
          Width = 93
          Height = 20
          Caption = 'edt_mz'
          ParentColor = True
          ColorHighLight = 12164479
          ColorShadow = 12164479
          TabOrder = 15
          OnClick = edt_zkhsClick
          SelStart = 0
          OnDownClick = edt_zkhsDownClick
          OnKeyDown = edt_zkhsKeyDown
          ShapeColor = 12164479
          MaxLength = 0
          SelLength = 0
          ColorFlat = clWindow
          ColorFocused = clWindow
          HintType = htDown
        end
        object edt_zkys: TFlatSelEdit
          Left = 466
          Top = 139
          Width = 93
          Height = 20
          Caption = 'edt_mz'
          ParentColor = True
          ColorHighLight = 12164479
          ColorShadow = 12164479
          TabOrder = 16
          OnClick = edt_zkysClick
          SelStart = 0
          OnDownClick = edt_kzrDownClick
          OnKeyDown = edt_zkysKeyDown
          ShapeColor = 12164479
          MaxLength = 0
          SelLength = 0
          ColorFlat = clWindow
          ColorFocused = clWindow
          HintType = htDown
        end
        object edt_jxys: TFlatEdit
          Left = 56
          Top = 139
          Width = 65
          Height = 18
          ColorBorder = 12164479
          ColorFlat = clWindow
          Font.Charset = GB2312_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 17
          OnChange = edt_jxysChange
          OnKeyDown = edt_jxysKeyDown
        end
        object edt_yjssxys: TFlatEdit
          Left = 219
          Top = 139
          Width = 65
          Height = 18
          ColorBorder = 12164479
          ColorFlat = clWindow
          Font.Charset = GB2312_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 18
          OnChange = edt_yjssxysChange
          OnKeyDown = edt_yjssxysKeyDown
        end
        object edt_sxys: TFlatEdit
          Left = 340
          Top = 139
          Width = 65
          Height = 18
          ColorBorder = 12164479
          ColorFlat = clWindow
          Font.Charset = GB2312_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 19
          OnChange = edt_sxysChange
          OnKeyDown = edt_sxysKeyDown
        end
        object cbx_rycy: TFlatComboBoxCode
          Left = 527
          Top = 35
          Width = 68
          Height = 20
          Style = csDropDownList
          Color = clWindow
          ColorArrowBackground = 14215660
          ColorBorder = 12164479
          ItemHeight = 12
          Items.Strings = (
            #26410#20570
            #31526#21512
            #19981#31526#21512)
          TabOrder = 20
          ItemIndex = -1
          OnChange = cbx_rycyChange
          OnKeyDown = cbx_rycyKeyDown
          ItemCodes.Strings = (
            '0'
            '1'
            '2')
          ItemInput.Strings = (
            '0'
            '1'
            '2')
        end
        object cbx_bazl: TFlatComboBoxCode
          Left = 507
          Top = 67
          Width = 68
          Height = 20
          Style = csDropDownList
          Color = clWindow
          ColorArrowBackground = 14215660
          ColorBorder = 12164479
          ItemHeight = 12
          Items.Strings = (
            #30002
            #20057
            #19993)
          TabOrder = 21
          ItemIndex = -1
          OnChange = cbx_bazlChange
          OnKeyDown = cbx_bazlKeyDown
          ItemCodes.Strings = (
            '1'
            '2'
            '3')
          ItemInput.Strings = (
            '1'
            '2'
            '3')
        end
        object cbx_stjc: TFlatComboBoxCode
          Left = 39
          Top = 307
          Width = 42
          Height = 20
          Style = csDropDownList
          Color = clWindow
          ColorArrowBackground = 14215660
          ColorBorder = 12164479
          ItemHeight = 12
          Items.Strings = (
            #26159
            #21542)
          TabOrder = 22
          ItemIndex = -1
          OnChange = cbx_stjcChange
          OnKeyDown = cbx_stjcKeyDown
          ItemCodes.Strings = (
            '1'
            '2')
          ItemInput.Strings = (
            '1'
            '2')
        end
        object cbx_dyl: TFlatComboBoxCode
          Left = 303
          Top = 307
          Width = 42
          Height = 20
          Style = csDropDownList
          Color = clWindow
          ColorArrowBackground = 14215660
          ColorBorder = 12164479
          ItemHeight = 12
          Items.Strings = (
            #26159
            #21542)
          TabOrder = 23
          ItemIndex = -1
          OnChange = cbx_dylChange
          OnKeyDown = cbx_dylKeyDown
          ItemCodes.Strings = (
            '1'
            '2')
          ItemInput.Strings = (
            '1'
            '2')
        end
        object cbx_sz: TFlatComboBoxCode
          Left = 383
          Top = 307
          Width = 42
          Height = 20
          Style = csDropDownList
          Color = clWindow
          ColorArrowBackground = 14215660
          ColorBorder = 12164479
          ItemHeight = 12
          Items.Strings = (
            #26159
            #21542)
          TabOrder = 24
          ItemIndex = -1
          OnChange = cbx_szChange
          OnKeyDown = cbx_szKeyDown
          ItemCodes.Strings = (
            '1'
            '2')
          ItemInput.Strings = (
            '1'
            '2')
        end
        object edt_szn: TOWFlatEdit
          Left = 485
          Top = 307
          Width = 23
          Height = 21
          ColorBorder = 12164479
          ColorFlat = clWhite
          MaxLength = 2
          TabOrder = 25
          Text = '0'
          OnChange = edt_sznChange
          OnKeyDown = edt_sznKeyDown
          SelStart = 0
          DataType = tInteger
        end
        object edt_szy: TOWFlatEdit
          Left = 533
          Top = 307
          Width = 23
          Height = 21
          ColorBorder = 12164479
          ColorFlat = clWhite
          MaxLength = 2
          TabOrder = 26
          Text = '0'
          OnChange = edt_szyChange
          OnKeyDown = edt_szyKeyDown
          SelStart = 0
          DataType = tInteger
        end
        object edt_szr: TOWFlatEdit
          Left = 581
          Top = 307
          Width = 23
          Height = 21
          ColorBorder = 12164479
          ColorFlat = clWhite
          MaxLength = 2
          TabOrder = 27
          Text = '0'
          OnChange = edt_szrChange
          OnKeyDown = edt_szrKeyDown
          SelStart = 0
          DataType = tInteger
        end
        object cbx_sjbl: TFlatComboBoxCode
          Left = 693
          Top = 307
          Width = 42
          Height = 20
          Style = csDropDownList
          Color = clWindow
          ColorArrowBackground = 14215660
          ColorBorder = 12164479
          ItemHeight = 12
          Items.Strings = (
            #26159
            #21542)
          TabOrder = 28
          ItemIndex = -1
          OnChange = cbx_sjblChange
          OnKeyDown = cbx_sjblKeyDown
          ItemCodes.Strings = (
            '1'
            '2')
          ItemInput.Strings = (
            '1'
            '2')
        end
        inline ssxx_fm: Tsszdxx_fm
          Left = 2
          Top = 163
          Width = 736
          Height = 137
          Color = 14215660
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 29
          inherited dbg_mst: TDBGridEh
            Left = 1
          end
          inherited cbx_yh: TFlatComboBoxCode
            OnKeyDown = ssxx_fmcbx_yhKeyDown
          end
          inherited edt_ssrq: TFlatMaskDate
            OnKeyDown = ssxx_fmedt_ssrqKeyDown
          end
          inherited cds_yh: TClientDataSet
            Active = False
          end
          inherited cds_qkdj: TClientDataSet
            Active = False
          end
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = #20854#20182#20449#24687
      ImageIndex = 3
      object pnl_fyxx: TPanel
        Left = 2
        Top = 3
        Width = 740
        Height = 336
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Enabled = False
        ParentColor = True
        TabOrder = 0
        object Label19: TLabel
          Left = 8
          Top = 14
          Width = 24
          Height = 12
          Caption = #34880#22411
        end
        object Label20: TLabel
          Left = 152
          Top = 13
          Width = 12
          Height = 12
          Caption = 'Rh'
        end
        object Label21: TLabel
          Left = 216
          Top = 13
          Width = 48
          Height = 12
          Caption = #36755#34880#21453#24212
        end
        object Label22: TLabel
          Left = 8
          Top = 44
          Width = 48
          Height = 12
          Caption = #36755#34880#21697#31181
        end
        object Label24: TLabel
          Left = 232
          Top = 44
          Width = 126
          Height = 12
          Caption = '2'#12289#34880#23567#26495'          '#34955
        end
        object Label23: TLabel
          Left = 85
          Top = 44
          Width = 138
          Height = 12
          Caption = '1'#12289#32418#32454#32990'          '#21333#20301
        end
        object Label25: TLabel
          Left = 371
          Top = 44
          Width = 114
          Height = 12
          Caption = '3'#12289#34880#27974'          ml'
        end
        object Label26: TLabel
          Left = 495
          Top = 44
          Width = 114
          Height = 12
          Caption = '4'#12289#20840#34880'          ml'
        end
        object Label27: TLabel
          Left = 619
          Top = 44
          Width = 114
          Height = 12
          Caption = '5'#12289#20854#20182'          ml'
        end
        object cbx_xx: TFlatComboBoxCode
          Left = 34
          Top = 11
          Width = 106
          Height = 20
          Style = csDropDownList
          Color = clWindow
          ColorArrowBackground = 14215660
          ColorBorder = 12164479
          ItemHeight = 12
          Items.Strings = (
            'A'
            'B'
            'AB'
            '0'
            #20854#20182)
          TabOrder = 0
          ItemIndex = -1
          OnChange = cbx_xxChange
          OnKeyDown = cbx_xxKeyDown
          ItemCodes.Strings = (
            '1'
            '2'
            '3'
            '4'
            '5')
          ItemInput.Strings = (
            '1'
            '2'
            '3'
            '4'
            '5')
        end
        object cbx_rh: TFlatComboBoxCode
          Left = 167
          Top = 11
          Width = 42
          Height = 20
          Style = csDropDownList
          Color = clWindow
          ColorArrowBackground = 14215660
          ColorBorder = 12164479
          ItemHeight = 12
          Items.Strings = (
            #38452
            #38451)
          TabOrder = 1
          ItemIndex = -1
          OnChange = cbx_rhChange
          OnKeyDown = cbx_rhKeyDown
          ItemCodes.Strings = (
            '1'
            '2')
          ItemInput.Strings = (
            '1'
            '2')
        end
        object cbx_sxfy: TFlatComboBoxCode
          Left = 271
          Top = 11
          Width = 42
          Height = 20
          Style = csDropDownList
          Color = clWindow
          ColorArrowBackground = 14215660
          ColorBorder = 12164479
          ItemHeight = 12
          Items.Strings = (
            #26377
            #26080)
          TabOrder = 2
          ItemIndex = -1
          OnChange = cbx_sxfyChange
          OnKeyDown = cbx_sxfyKeyDown
          ItemCodes.Strings = (
            '1'
            '2')
          ItemInput.Strings = (
            '1'
            '2')
        end
        object edt_hxb: TOWFlatEdit
          Left = 143
          Top = 41
          Width = 55
          Height = 21
          ColorBorder = 12164479
          ColorFlat = clWhite
          MaxLength = 4
          TabOrder = 3
          Text = '0'
          OnChange = edt_hxbChange
          OnKeyDown = edt_hxbKeyDown
          SelStart = 0
          DataType = tInteger
        end
        object edt_xxb: TOWFlatEdit
          Left = 290
          Top = 41
          Width = 55
          Height = 21
          ColorBorder = 12164479
          ColorFlat = clWhite
          MaxLength = 4
          TabOrder = 4
          Text = '0'
          OnChange = edt_xxbChange
          OnKeyDown = edt_xxbKeyDown
          SelStart = 0
          DataType = tInteger
        end
        object edt_xj: TOWFlatEdit
          Left = 413
          Top = 41
          Width = 55
          Height = 21
          ColorBorder = 12164479
          ColorFlat = clWhite
          MaxLength = 4
          TabOrder = 5
          Text = '0'
          OnChange = edt_xjChange
          OnKeyDown = edt_xjKeyDown
          SelStart = 0
          DataType = tInteger
        end
        object edt_qx: TOWFlatEdit
          Left = 537
          Top = 41
          Width = 55
          Height = 21
          ColorBorder = 12164479
          ColorFlat = clWhite
          MaxLength = 4
          TabOrder = 6
          Text = '0'
          OnChange = edt_qxChange
          OnKeyDown = edt_qxKeyDown
          SelStart = 0
          DataType = tInteger
        end
        object edt_qt: TOWFlatEdit
          Left = 661
          Top = 41
          Width = 55
          Height = 21
          ColorBorder = 12164479
          ColorFlat = clWhite
          MaxLength = 4
          TabOrder = 7
          Text = '0'
          OnChange = edt_qtChange
          OnKeyDown = edt_qtKeyDown
          SelStart = 0
          DataType = tInteger
        end
      end
    end
  end
  object Btn_bc: TXPButton
    Left = 582
    Top = 383
    Width = 80
    Height = 25
    TabOrder = 1
    TabStop = False
    OnClick = Btn_bcClick
    Enable = True
    CaptionTitle = #20445#23384'(&S)'
  end
  object btn_qp: TXPButton
    Left = 491
    Top = 383
    Width = 80
    Height = 23
    TabOrder = 2
    TabStop = False
    Enable = True
    CaptionTitle = #28165#23631'(&R)'
  end
  object Btn_gb: TXPButton
    Left = 672
    Top = 383
    Width = 80
    Height = 23
    TabOrder = 3
    TabStop = False
    Enable = True
    CaptionTitle = #20851#38381'(&X)'
  end
  object stbr_xx: TStatusBar
    Left = 0
    Top = 413
    Width = 756
    Height = 19
    Panels = <
      item
        Width = 50
      end>
    ParentColor = True
    SimplePanel = False
  end
  object dpt1: TDictIpt
    FieldCode = 'Code'
    FieldInCode = 'Input_Code'
    FieldName = 'Name'
    Left = 267
    Top = 36
  end
end
