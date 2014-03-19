object YPCK_FM: TYPCK_FM
  Left = 0
  Top = 0
  Width = 765
  Height = 279
  Color = 14215660
  ParentColor = False
  TabOrder = 0
  object Pnl_Grd: TPanel
    Left = -1
    Top = 0
    Width = 630
    Height = 275
    BevelOuter = bvNone
    Enabled = False
    ParentColor = True
    TabOrder = 0
    object dbgMst: TDBGridEh
      Left = 1
      Top = 1
      Width = 628
      Height = 273
      DataSource = ds_1
      FixedColor = 14215660
      Flat = True
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      FooterColor = clWindow
      FooterFont.Charset = GB2312_CHARSET
      FooterFont.Color = clNavy
      FooterFont.Height = -12
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      FooterRowCount = 1
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      RowHeight = 20
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      TitleHeight = 14
      VertScrollBar.VisibleMode = sbNeverShowEh
      OnCellClick = dbgMstCellClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'xh'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = 'NO'
          Width = 18
        end
        item
          EditButtons = <>
          FieldName = 'czfl'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #31867#21035
          Width = 53
        end
        item
          EditButtons = <>
          FieldName = 'ypmc'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #33647#21697#21517#31216
          Width = 165
        end
        item
          EditButtons = <>
          FieldName = 'ggdw'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #35268#26684'/'#21333#20301
          Width = 84
        end
        item
          EditButtons = <>
          FieldName = 'ph'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #25209#21495
          Width = 59
        end
        item
          Alignment = taRightJustify
          EditButtons = <>
          FieldName = 'bzsl'
          Footer.Alignment = taRightJustify
          Footer.Value = #37329#39069
          Footer.ValueType = fvtStaticText
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #25968#37327
          Width = 94
        end
        item
          Alignment = taRightJustify
          EditButtons = <>
          FieldName = 'ckjs'
          Footer.DisplayFormat = '0.00'
          Footer.FieldName = 'je'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #20986#24211#20215
          Width = 67
        end
        item
          EditButtons = <>
          FieldName = 'yxq'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #26377#25928#26399
          Width = 66
        end>
    end
    object edt_ypmc: TFlatSelEdit
      Left = 88
      Top = 32
      Width = 177
      Height = 20
      ParentColor = True
      Visible = False
      ColorHighLight = 12164479
      ColorShadow = 12164479
      TabOrder = 1
      OnClick = edt_ypmcClick
      OnEnter = edt_ypmcEnter
      SelStart = 0
      OnDownClick = edt_ypmcDownClick
      OnKeyDown = edt_ypmcKeyDown
      ShapeColor = 12164479
      MaxLength = 0
      SelLength = 0
      ColorFlat = clWhite
      ColorFocused = clBlack
      HintType = htDown
    end
    object Edt_Ph: TFlatSelEdit
      Left = 344
      Top = 56
      Width = 50
      Height = 20
      ParentColor = True
      Visible = False
      ColorHighLight = 12164479
      ColorShadow = 12164479
      TabOrder = 2
      OnClick = Edt_PhClick
      OnEnter = Edt_PhEnter
      SelStart = 0
      OnKeyDown = Edt_PhKeyDown
      ShapeColor = 12164479
      MaxLength = 0
      SelLength = 0
      ReadOnly = True
      ColorFlat = clWhite
      ColorFocused = clBlack
      HintType = htDown
    end
    object cbx_ypgg: TFlatComboBoxCode
      Left = 256
      Top = 24
      Width = 81
      Height = 21
      Style = csDropDownList
      Color = clWindow
      ColorArrowBackground = 14215660
      ColorBorder = 12164479
      ItemHeight = 13
      Sorted = True
      TabOrder = 3
      Visible = False
      ItemIndex = -1
      OnChange = cbx_ypggChange
      OnEnter = cbx_ypggEnter
      OnKeyDown = cbx_ypggKeyDown
    end
    object cbx_dw: TFlatComboBoxCode
      Left = 392
      Top = 176
      Width = 57
      Height = 21
      Style = csDropDownList
      Color = clWindow
      ColorArrowBackground = 14215660
      ColorBorder = 12164479
      ItemHeight = 13
      TabOrder = 4
      Visible = False
      ItemIndex = -1
      OnChange = cbx_dwChange
      OnEnter = cbx_dwEnter
      OnKeyDown = cbx_dwKeyDown
    end
    object pnl_sl1: TFlatPanel
      Left = 400
      Top = 231
      Width = 95
      Height = 20
      Color = clWhite
      Visible = False
      ColorHighLight = 12164479
      ColorShadow = 12164479
      TabOrder = 5
      OnEnter = pnl_sl1Enter
      object lbl_dw1: TLabel
        Left = 41
        Top = 4
        Width = 11
        Height = 12
        AutoSize = False
        Font.Charset = GB2312_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lbl_dw2: TLabel
        Left = 82
        Top = 4
        Width = 11
        Height = 12
        AutoSize = False
        Font.Charset = GB2312_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object edt_sl1: TFloatEdit
        Tag = 2
        Left = 0
        Top = 0
        Width = 39
        Height = 20
        MaxLength = 4
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ColorFlat = clWhite
        DataType = DtInt
        DecimalLength = 0
        Text = '0'
        NOFormat = False
        ONKeyDown = edt_slKeyDown
        OnChange = edt_slChange
        TabOrder = 0
        ONEnter = edt_slEnter
      end
      object edt_sl2: TFloatEdit
        Tag = 3
        Left = 54
        Top = 0
        Width = 27
        Height = 20
        MaxLength = 3
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ColorFlat = clWhite
        DataType = DtInt
        DecimalLength = 0
        Text = '0'
        NOFormat = False
        ONKeyDown = edt_slKeyDown
        OnChange = edt_slChange
        TabOrder = 1
        ONEnter = edt_slEnter
      end
    end
    object pnl_sl: TFlatPanel
      Left = 408
      Top = 239
      Width = 95
      Height = 20
      Color = clWhite
      Visible = False
      ColorHighLight = 12164479
      ColorShadow = 12164479
      TabOrder = 6
      object lbl_dw: TLabel
        Left = 81
        Top = 4
        Width = 11
        Height = 12
        AutoSize = False
        Font.Charset = GB2312_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object edt_sl: TFloatEdit
        Tag = 1
        Left = 0
        Top = 0
        Width = 79
        Height = 20
        MaxLength = 6
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ColorFlat = clWhite
        DataType = DtInt
        DecimalLength = 0
        Text = '0'
        NOFormat = False
        ONKeyDown = edt_slKeyDown
        OnChange = edt_slChange
        TabOrder = 0
        ONEnter = edt_slEnter
      end
    end
    object cbx_czfl: TFlatComboBoxCode
      Left = 40
      Top = 32
      Width = 41
      Height = 21
      Style = csDropDownList
      Color = clWindow
      ColorArrowBackground = 14215660
      ColorBorder = 12164479
      ItemHeight = 13
      TabOrder = 7
      Visible = False
      ItemIndex = -1
      OnChange = cbx_czflChange
      OnEnter = cbx_czflEnter
      OnKeyDown = cbx_czflKeyDown
    end
  end
  object Panel2: TPanel
    Left = 629
    Top = 1
    Width = 136
    Height = 274
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Enabled = False
    ParentColor = True
    TabOrder = 1
    object Label14: TLabel
      Left = 26
      Top = 11
      Width = 24
      Height = 13
      Caption = #37329#39069
    end
    object Label15: TLabel
      Left = 14
      Top = 39
      Width = 36
      Height = 13
      Caption = #25209#21457#20215
    end
    object Label16: TLabel
      Left = 14
      Top = 70
      Width = 36
      Height = 13
      Caption = #38646#21806#20215
    end
    object Label17: TLabel
      Left = 2
      Top = 98
      Width = 48
      Height = 13
      Caption = #21253#35013#35268#26684
    end
    object Label18: TLabel
      Left = 2
      Top = 127
      Width = 48
      Height = 13
      Caption = #33647#21697#21058#22411
    end
    object Label19: TLabel
      Left = 2
      Top = 155
      Width = 48
      Height = 13
      Caption = #21253#35013#21333#20301
    end
    object Label20: TLabel
      Left = 15
      Top = 207
      Width = 36
      Height = 13
      Caption = #25240#25187#29575
    end
    object lblZk: TLabel
      Left = 121
      Top = 204
      Width = 10
      Height = 19
      Caption = '%'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 25
      Top = 235
      Width = 24
      Height = 13
      Caption = #21378#23478
    end
    object Label1: TLabel
      Left = 2
      Top = 181
      Width = 48
      Height = 13
      Caption = #25193#23637#35268#26684
    end
    object edt_bzgg: TFlatEdit
      Left = 54
      Top = 96
      Width = 77
      Height = 18
      ColorBorder = clBlack
      ColorFlat = 14215660
      ParentColor = True
      Font.Charset = GB2312_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object edt_ypjx: TFlatEdit
      Left = 54
      Top = 124
      Width = 77
      Height = 18
      ColorBorder = clBlack
      ColorFlat = 14215660
      ParentColor = True
      Font.Charset = GB2312_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object edt_bzdw: TFlatEdit
      Left = 54
      Top = 152
      Width = 77
      Height = 18
      ColorBorder = clBlack
      ColorFlat = 14215660
      ParentColor = True
      Font.Charset = GB2312_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object edt_scpfj: TFloatEdit
      Left = 54
      Top = 35
      Width = 77
      Height = 19
      MaxLength = 10
      Font.Charset = GB2312_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ColorFlat = 14215660
      ColorBorder = -1
      ColorFocused = 14215660
      DataType = dtFloat
      DecimalLength = 4
      Text = '0.0000'
      NOFormat = False
      TabOrder = 3
    end
    object edt_sclsj: TFloatEdit
      Left = 54
      Top = 66
      Width = 77
      Height = 19
      MaxLength = 10
      Font.Charset = GB2312_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ColorFlat = 14215660
      ColorBorder = -1
      ColorFocused = 14215660
      DataType = dtFloat
      DecimalLength = 4
      Text = '0.0000'
      NOFormat = False
      TabOrder = 4
    end
    object edt_je: TFloatEdit
      Left = 54
      Top = 7
      Width = 77
      Height = 19
      MaxLength = 10
      Font.Charset = GB2312_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ColorFlat = 14215660
      ColorBorder = -1
      ColorFocused = 14215660
      DataType = dtFloat
      DecimalLength = 4
      Text = '0.0000'
      NOFormat = False
      TabOrder = 5
    end
    object edt_zk: TFloatEdit
      Left = 54
      Top = 204
      Width = 65
      Height = 19
      MaxLength = 6
      Font.Charset = GB2312_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ColorFlat = 14215660
      ColorBorder = -1
      ColorFocused = 14215660
      DataType = dtFloat
      DecimalLength = 2
      Text = '0.00'
      NOFormat = False
      TabOrder = 6
    end
    object edt_cj: TFlatEdit
      Left = 53
      Top = 232
      Width = 77
      Height = 18
      ColorBorder = clBlack
      ColorFlat = 14215660
      ParentColor = True
      Font.Charset = GB2312_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object edt_Kzgg: TFlatEdit
      Left = 54
      Top = 178
      Width = 77
      Height = 18
      ColorBorder = clBlack
      ColorFlat = 14215660
      ParentColor = True
      Font.Charset = GB2312_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 8
    end
  end
  object Cds_1: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'xh'
        DataType = ftSmallint
      end
      item
        Name = 'ypbm'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'ypmc'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ypgg'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ypdw'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'ypjx'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'sl'
        DataType = ftFloat
      end
      item
        Name = 'bzgg'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'dgj'
        DataType = ftFloat
      end
      item
        Name = 'ph'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'yxq'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'scpfj'
        DataType = ftFloat
      end
      item
        Name = 'sclsj'
        DataType = ftFloat
      end
      item
        Name = 'zk'
        DataType = ftFloat
      end
      item
        Name = 'bzdw'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'Nhbz1'
        DataType = ftFloat
      end
      item
        Name = 'Nh1dw'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'Nhbz2'
        DataType = ftFloat
      end
      item
        Name = 'Nh2dw'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'cjmc'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'cjdm'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'bzjs'
        DataType = ftSmallint
      end
      item
        Name = 'Jgfs'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'rkdh'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'bzgg1'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ckdw'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'ckbz'
        DataType = ftInteger
      end
      item
        Name = 'Jhj'
        DataType = ftFloat
      end
      item
        Name = 'czdm'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'jbcjbs'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'cbj'
        DataType = ftFloat
      end
      item
        Name = 'ckj'
        DataType = ftFloat
      end
      item
        Name = 'ckjs'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Kzgg'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Kzph'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterPost = Cds_1AfterPost
    AfterScroll = Cds_1AfterScroll
    OnCalcFields = Cds_1CalcFields
    OnPostError = Cds_1PostError
    Left = 144
    Top = 184
    Data = {
      E50200009619E0BD010000001800000023000000000003000000E50202786802
      00010000000000047970626D0100490000000100055749445448020002000E00
      0479706D63010049000000010005574944544802000200280004797067670100
      4900000001000557494454480200020014000479706477010049000000010005
      57494454480200020008000479706A7801004900000001000557494454480200
      02000A0002736C080004000000000004627A6767010049000000010005574944
      5448020002001E000364676A0800040000000000027068010049000000010005
      5749445448020002001400037978710100490000000100055749445448020002
      000A0005736370666A08000400000000000573636C736A080004000000000002
      7A6B080004000000000004627A64770100490000000100055749445448020002
      000800054E68627A310800040000000000054E68316477010049000000010005
      5749445448020002000800054E68627A320800040000000000054E6832647701
      0049000000010005574944544802000200080004636A6D630100490000000100
      05574944544802000200280004636A646D010049000000010005574944544802
      0002000A0004627A6A730200010000000000044A676673010049000000010005
      574944544802000200080004726B646801004900000001000557494454480200
      02000E0005627A67673101004900000001000557494454480200020014000463
      6B6477010049000000010005574944544802000200080004636B627A04000100
      00000000034A686A080004000000000004637A646D0100490000000100055749
      445448020002000100066A62636A627301004900000001000557494454480200
      02000A000363626A080004000000000003636B6A080004000000000004636B6A
      730100490000000100055749445448020002001E00044B7A6767010049000000
      0100055749445448020002001400044B7A706801004900000001000557494454
      480200020014000000}
    object Cds_1xh: TSmallintField
      FieldName = 'xh'
    end
    object Cds_1ypbm: TStringField
      FieldName = 'ypbm'
      Size = 14
    end
    object Cds_1ypmc: TStringField
      FieldName = 'ypmc'
      Size = 40
    end
    object Cds_1ypgg: TStringField
      FieldName = 'ypgg'
    end
    object Cds_1ypdw: TStringField
      FieldName = 'ypdw'
      Size = 8
    end
    object Cds_1ypjx: TStringField
      FieldName = 'ypjx'
      Size = 10
    end
    object Cds_1sl: TFloatField
      FieldName = 'sl'
    end
    object Cds_1bzgg: TStringField
      FieldName = 'bzgg'
      Size = 30
    end
    object Cds_1dgj: TFloatField
      FieldName = 'dgj'
    end
    object Cds_1ph: TStringField
      FieldName = 'ph'
    end
    object Cds_1scpfj: TFloatField
      FieldName = 'scpfj'
    end
    object Cds_1sclsj: TFloatField
      FieldName = 'sclsj'
    end
    object Cds_1zk: TFloatField
      FieldName = 'zk'
    end
    object Cds_1bzdw: TStringField
      FieldName = 'bzdw'
      Size = 8
    end
    object Cds_1Nhbz1: TFloatField
      FieldName = 'Nhbz1'
    end
    object Cds_1Nh1dw: TStringField
      FieldName = 'Nh1dw'
      Size = 8
    end
    object Cds_1Nhbz2: TFloatField
      FieldName = 'Nhbz2'
    end
    object Cds_1Nh2dw: TStringField
      FieldName = 'Nh2dw'
      Size = 8
    end
    object Cds_1cjmc: TStringField
      FieldName = 'cjmc'
      Size = 40
    end
    object Cds_1cjdm: TStringField
      FieldName = 'cjdm'
      Size = 10
    end
    object Cds_1bzjs: TSmallintField
      FieldName = 'bzjs'
    end
    object Cds_1Jgfs: TStringField
      FieldName = 'Jgfs'
      Size = 8
    end
    object Cds_1rkdh: TStringField
      FieldName = 'rkdh'
      Size = 14
    end
    object Cds_1bzgg1: TStringField
      FieldName = 'bzgg1'
    end
    object Cds_1ckdw: TStringField
      FieldName = 'ckdw'
      Size = 8
    end
    object Cds_1ckbz: TIntegerField
      FieldName = 'ckbz'
    end
    object Cds_1Jhj: TFloatField
      FieldName = 'Jhj'
    end
    object Cds_1czdm: TStringField
      FieldName = 'czdm'
      Size = 1
    end
    object Cds_1jbcjbs: TStringField
      FieldName = 'jbcjbs'
      Size = 10
    end
    object Cds_1czfl: TStringField
      FieldKind = fkCalculated
      FieldName = 'czfl'
      Calculated = True
    end
    object Cds_1SL1: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'SL1'
      Calculated = True
    end
    object Cds_1SL2: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'SL2'
      Calculated = True
    end
    object Cds_1ggdw: TStringField
      FieldKind = fkCalculated
      FieldName = 'ggdw'
      Calculated = True
    end
    object Cds_1je: TFloatField
      FieldKind = fkCalculated
      FieldName = 'je'
      Calculated = True
    end
    object Cds_1bzsl: TStringField
      FieldKind = fkCalculated
      FieldName = 'bzsl'
      Calculated = True
    end
    object Cds_1yxq: TStringField
      FieldName = 'yxq'
      Size = 10
    end
    object Cds_1PFJE: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PFJE'
      Calculated = True
    end
    object Cds_1Lsje: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Lsje'
      Calculated = True
    end
    object Cds_1cbj: TFloatField
      FieldName = 'cbj'
    end
    object Cds_1ckj: TFloatField
      FieldName = 'ckj'
    end
    object Cds_1ckjs: TStringField
      FieldName = 'ckjs'
      Size = 30
    end
    object Cds_1Kzgg: TStringField
      FieldName = 'Kzgg'
    end
    object Cds_1Kzph: TStringField
      FieldName = 'Kzph'
    end
  end
  object ds_1: TDataSource
    DataSet = Cds_1
    Left = 200
    Top = 192
  end
  object Dpt: TDictIpt
    FieldCode = 'Code'
    FieldInCode = 'Input_Code'
    FieldName = 'Name'
    Left = 248
    Top = 192
  end
  object cds_czfl: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry'
    RemoteServer = DM.SockConn
    Left = 104
    Top = 88
  end
end
