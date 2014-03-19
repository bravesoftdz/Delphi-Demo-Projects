object ydpj_fm: Tydpj_fm
  Left = 0
  Top = 0
  Width = 759
  Height = 331
  TabOrder = 0
  object pnl_sfxm: TPanel
    Left = 0
    Top = 0
    Width = 755
    Height = 329
    BevelOuter = bvNone
    Enabled = False
    ParentColor = True
    TabOrder = 0
    object dbg_Mst: TDBGridEh
      Left = 0
      Top = 0
      Width = 753
      Height = 328
      Color = clWhite
      DataSource = ds_sfxm
      FixedColor = 14215660
      Flat = True
      FooterColor = 16050922
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      FooterRowCount = 1
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind]
      RowHeight = 20
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleHeight = 14
      VertScrollBar.VisibleMode = sbNeverShowEh
      OnCellClick = dbg_MstCellClick
      OnDrawColumnCell = dbg_MstDrawColumnCell
      Columns = <
        item
          EditButtons = <>
          FieldName = 'ysxm'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #21307#29983
          Width = 57
        end
        item
          EditButtons = <>
          FieldName = 'cfxhxs'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #21333#25454
          Width = 29
        end
        item
          EditButtons = <>
          FieldName = 'jbflmc'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #20998#31867
          Width = 48
        end
        item
          EditButtons = <>
          FieldName = 'cyjsxs'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #21058#25968
          Width = 33
        end
        item
          EditButtons = <>
          FieldName = 'xmmc'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #39033#30446#21517#31216
          Width = 158
        end
        item
          EditButtons = <>
          FieldName = 'xmgg'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #35268#26684
          Width = 91
        end
        item
          EditButtons = <>
          FieldName = 'dw'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #21333#20301
          Width = 43
        end
        item
          EditButtons = <>
          FieldName = 'jg'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #21333#20215
          Width = 51
        end
        item
          Alignment = taRightJustify
          EditButtons = <>
          FieldName = 'sls'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #25968#37327
          Width = 56
        end
        item
          EditButtons = <>
          FieldName = 'PH'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #25209#21495
          Width = 84
        end
        item
          EditButtons = <>
          FieldName = 'sfje'
          Footer.DisplayFormat = '0.00'
          Footer.EndEllipsis = True
          Footer.ValueType = fvtSum
          Footer.WordWrap = True
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #36153#29992
          Width = 77
        end>
    end
    object cbx_jbfl: TFlatComboBoxCode
      Left = 104
      Top = 32
      Width = 41
      Height = 21
      Style = csDropDownList
      Color = clWindow
      ColorArrowBackground = 14215660
      ColorBorder = 12164479
      ItemHeight = 13
      TabOrder = 1
      Visible = False
      ItemIndex = -1
      OnChange = cbx_jbflChange
      OnEnter = cbx_jbflEnter
      OnKeyDown = cbx_jbflKeyDown
    end
    object edt_xmmc: TFlatSelEdit
      Left = 184
      Top = 32
      Width = 89
      Height = 20
      ParentColor = True
      Visible = False
      ColorHighLight = 12164479
      ColorShadow = 12164479
      TabOrder = 2
      OnClick = edt_xmmcClick
      OnEnter = edt_xmmcEnter
      SelStart = 0
      OnDownClick = edt_xmmcDownClick
      OnKeyDown = edt_xmmcKeyDown
      ShapeColor = 12164479
      MaxLength = 0
      SelLength = 0
      ReadOnly = True
      ColorFlat = clWhite
      ColorFocused = clWhite
      HintType = htDown
    end
    object cbx_xmgg: TFlatComboBoxCode
      Left = 288
      Top = 32
      Width = 89
      Height = 21
      Style = csDropDownList
      Color = clWindow
      ColorArrowBackground = 14215660
      ColorBorder = 12164479
      ItemHeight = 13
      TabOrder = 3
      Visible = False
      ItemIndex = -1
      OnChange = cbx_xmggChange
      OnEnter = cbx_xmggEnter
      OnExit = cbx_xmggExit
      OnKeyDown = cbx_xmggKeyDown
    end
    object edt_jg: TFloatEdit
      Left = 480
      Top = 40
      Width = 53
      Height = 20
      MaxLength = 10
      ColorFlat = clWhite
      DataType = dtFloat
      DecimalLength = 2
      Text = '0.00'
      NOFormat = False
      ONKeyDown = edt_jgKeyDown
      OnChange = edt_jgChange
      Visible = False
      TabOrder = 4
      ONExit = edt_jgExit
    end
    object edt_sl: TFloatEdit
      Left = 538
      Top = 48
      Width = 58
      Height = 20
      MaxLength = 10
      ColorFlat = clWhite
      DataType = dtFloat
      DecimalLength = 2
      Text = '0.00'
      NOFormat = False
      ONKeyDown = edt_slKeyDown
      OnChange = edt_slChange
      Visible = False
      TabOrder = 5
      ONEnter = edt_slEnter
    end
    object edt_zxks: TFlatSelEdit
      Left = 594
      Top = 40
      Width = 90
      Height = 20
      ParentColor = True
      Visible = False
      ColorHighLight = 12164479
      ColorShadow = 12164479
      TabOrder = 6
      OnClick = edt_zxksClick
      OnEnter = edt_zxksEnter
      SelStart = 0
      OnKeyDown = edt_zxksKeyDown
      ShapeColor = 12164479
      MaxLength = 0
      SelLength = 0
      ReadOnly = True
      ColorFlat = clWhite
      ColorFocused = clWhite
      HintType = htDown
    end
    object edt_cfys: TFlatSelEdit
      Left = 10
      Top = 34
      Width = 59
      Height = 20
      ParentColor = True
      Visible = False
      ColorHighLight = 12164479
      ColorShadow = 12164479
      TabOrder = 7
      OnClick = edt_cfysClick
      OnEnter = edt_cfysEnter
      SelStart = 0
      OnDownClick = edt_cfysDownClick
      OnKeyDown = edt_cfysKeyDown
      ShapeColor = 12164479
      MaxLength = 0
      SelLength = 0
      ColorFlat = clWhite
      ColorFocused = clWhite
      HintType = htDown
    end
    object edt_cfxh: TFloatEdit
      Left = 68
      Top = 72
      Width = 31
      Height = 20
      MaxLength = 2
      ColorFlat = clWhite
      DataType = DtInt
      DecimalLength = 0
      Text = '0'
      NOFormat = False
      ONKeyDown = edt_cfxhKeyDown
      OnChange = edt_cfxhChange
      Visible = False
      TabOrder = 8
    end
    object edt_cyjs: TFloatEdit
      Left = 148
      Top = 88
      Width = 36
      Height = 20
      MaxLength = 2
      ColorFlat = clWhite
      DataType = DtInt
      DecimalLength = 0
      Text = '0'
      NOFormat = False
      ONKeyDown = edt_cyjsKeyDown
      OnChange = edt_cyjsChange
      Visible = False
      TabOrder = 9
    end
    object cbx_dw: TFlatComboBoxCode
      Left = 432
      Top = 24
      Width = 41
      Height = 21
      Style = csDropDownList
      Color = clWindow
      ColorArrowBackground = 14215660
      ColorBorder = 12164479
      ItemHeight = 13
      TabOrder = 10
      Visible = False
      ItemIndex = -1
      OnChange = cbx_dwChange
      OnEnter = cbx_dwEnter
      OnKeyDown = cbx_dwKeyDown
    end
    object cbx_ph: TFlatComboBoxCode
      Left = 456
      Top = 136
      Width = 89
      Height = 21
      Style = csDropDownList
      Color = clWindow
      ColorArrowBackground = 14215660
      ColorBorder = 12164479
      ItemHeight = 13
      TabOrder = 11
      Visible = False
      ItemIndex = -1
      OnChange = cbx_phChange
    end
  end
  object Cds_sfxm: TClientDataSet
    Active = True
    Aggregates = <>
    AggregatesActive = True
    FieldDefs = <
      item
        Name = 'cfxh'
        DataType = ftSmallint
      end
      item
        Name = 'ysxm'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'jbfldm'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'jbflmc'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'xmdm'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'xmmc'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'xmgg'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'dw'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'jg'
        DataType = ftFloat
      end
      item
        Name = 'sl'
        DataType = ftFloat
      end
      item
        Name = 'zxksdm'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'zxksmc'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'jbjls'
        DataType = ftInteger
      end
      item
        Name = 'jbjg'
        DataType = ftFloat
      end
      item
        Name = 'jbzxks'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'cyjs'
        DataType = ftInteger
      end
      item
        Name = 'ysdm'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'cfxhxs'
        DataType = ftInteger
      end
      item
        Name = 'cyjsxs'
        DataType = ftInteger
      end
      item
        Name = 'fphm'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'mzfl'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'mzsjmc'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'hsfl'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ypbz'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ypbzj'
        DataType = ftSmallint
      end
      item
        Name = 'mzcl1'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'mzcl2'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'nhbz1'
        DataType = ftInteger
      end
      item
        Name = 'nh1dw'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'nhbz2'
        DataType = ftInteger
      end
      item
        Name = 'nh2dw'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'zddw'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'cjbs'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'pbbz'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'kjkm'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'baxm'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'yhhjg'
        DataType = ftFloat
      end
      item
        Name = 'yhjg'
        DataType = ftFloat
      end
      item
        Name = 'ypgg'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'jbcjbs'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'zflb'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'yhbl'
        DataType = ftFloat
      end
      item
        Name = 'PH'
        DataType = ftString
        Size = 16
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterScroll = Cds_sfxmAfterScroll
    OnCalcFields = Cds_sfxmCalcFields
    Data = {
      B80300009619E0BD01000000180000002B000000000003000000B80304636678
      680200010000000000047973786D010049000000010005574944544802000200
      1400066A62666C646D0100490000000100055749445448020002000100066A62
      666C6D630100490000000100055749445448020002000A0004786D646D010049
      0000000100055749445448020002000E0004786D6D6301004900000001000557
      4944544802000200280004786D67670100490000000100055749445448020002
      0014000264770100490000000100055749445448020002000800026A67080004
      000000000002736C0800040000000000067A786B73646D010049000000010005
      5749445448020002000800067A786B736D630100490000000100055749445448
      020002001400056A626A6C730400010000000000046A626A6708000400000000
      00066A627A786B7301004900000001000557494454480200020008000463796A
      730400010000000000047973646D010049000000010005574944544802000200
      08000663667868787304000100000000000663796A7378730400010000000000
      046670686D0100490000000100055749445448020002000800046D7A666C0100
      490000000100055749445448020002000100066D7A736A6D6301004900000001
      00055749445448020002000A00046873666C0100490000000100055749445448
      020002000100047970627A010049000000010005574944544802000200010005
      7970627A6A0200010000000000056D7A636C3101004900000001000557494454
      48020002000100056D7A636C3201004900000001000557494454480200020001
      00056E68627A310400010000000000056E683164770100490000000100055749
      445448020002000800056E68627A320400010000000000056E68326477010049
      0000000100055749445448020002000800047A64647701004900000001000557
      4944544802000200080004636A62730100490000000100055749445448020002
      000A00047062627A0100490000000100055749445448020002000100046B6A6B
      6D0100490000000100055749445448020002000400046261786D010049000000
      0100055749445448020002000400057968686A6708000400000000000479686A
      6708000400000000000479706767010049000000010005574944544802000200
      1400066A62636A62730100490000000100055749445448020002000A00047A66
      6C620100490000000100055749445448020002000100047968626C0800040000
      00000002504801004900000001000557494454480200020010000000}
    object Cds_sfxmjbfldm: TStringField
      FieldName = 'jbfldm'
      Size = 1
    end
    object Cds_sfxmjbflmc: TStringField
      FieldName = 'jbflmc'
      Size = 10
    end
    object Cds_sfxmxmdm: TStringField
      FieldName = 'xmdm'
      Size = 14
    end
    object Cds_sfxmxmmc: TStringField
      FieldName = 'xmmc'
      Size = 40
    end
    object Cds_sfxmxmgg: TStringField
      FieldName = 'xmgg'
    end
    object Cds_sfxmdw: TStringField
      FieldName = 'dw'
      Size = 8
    end
    object Cds_sfxmjg: TFloatField
      FieldName = 'jg'
      DisplayFormat = '0.0000'
    end
    object Cds_sfxmsl: TFloatField
      FieldName = 'sl'
    end
    object Cds_sfxmzxksdm: TStringField
      FieldName = 'zxksdm'
      Size = 8
    end
    object Cds_sfxmzxksmc: TStringField
      FieldName = 'zxksmc'
    end
    object Cds_sfxmjbjls: TIntegerField
      FieldName = 'jbjls'
    end
    object Cds_sfxmjbjg: TFloatField
      FieldName = 'jbjg'
    end
    object Cds_sfxmjbzxks: TStringField
      FieldName = 'jbzxks'
      Size = 8
    end
    object Cds_sfxmcfxh: TSmallintField
      FieldName = 'cfxh'
    end
    object Cds_sfxmysxm: TStringField
      FieldName = 'ysxm'
    end
    object Cds_sfxmje: TFloatField
      FieldKind = fkCalculated
      FieldName = 'je'
      DisplayFormat = '0.0000'
      Calculated = True
    end
    object Cds_sfxmsls: TStringField
      FieldKind = fkCalculated
      FieldName = 'sls'
      Calculated = True
    end
    object Cds_sfxmysdm: TStringField
      FieldName = 'ysdm'
      Size = 8
    end
    object Cds_sfxmcfxhxs: TIntegerField
      FieldName = 'cfxhxs'
    end
    object Cds_sfxmcyjs: TIntegerField
      FieldName = 'cyjs'
    end
    object Cds_sfxmcyjsxs: TIntegerField
      FieldName = 'cyjsxs'
    end
    object Cds_sfxmmzfl: TStringField
      FieldName = 'mzfl'
      Size = 1
    end
    object Cds_sfxmmzsjmc: TStringField
      FieldName = 'mzsjmc'
      Size = 10
    end
    object Cds_sfxmfphm: TStringField
      FieldName = 'fphm'
      Size = 8
    end
    object Cds_sfxmhsfl: TStringField
      FieldName = 'hsfl'
      Size = 1
    end
    object Cds_sfxmypbz: TStringField
      FieldName = 'ypbz'
      Size = 1
    end
    object Cds_sfxmmzcl1: TStringField
      FieldName = 'mzcl1'
      Size = 1
    end
    object Cds_sfxmmzcl2: TStringField
      FieldName = 'mzcl2'
      Size = 1
    end
    object Cds_sfxmnhbz1: TIntegerField
      FieldName = 'nhbz1'
    end
    object Cds_sfxmnh1dw: TStringField
      FieldName = 'nh1dw'
      Size = 8
    end
    object Cds_sfxmnhbz2: TIntegerField
      FieldName = 'nhbz2'
    end
    object Cds_sfxmnh2dw: TStringField
      FieldName = 'nh2dw'
      Size = 8
    end
    object Cds_sfxmzddw: TStringField
      FieldName = 'zddw'
      Size = 8
    end
    object Cds_sfxmypbzj: TSmallintField
      FieldName = 'ypbzj'
    end
    object Cds_sfxmcjbs: TStringField
      FieldName = 'cjbs'
      Size = 10
    end
    object Cds_sfxmpbbz: TStringField
      FieldName = 'pbbz'
      Size = 1
    end
    object Cds_sfxmkjkm: TStringField
      FieldName = 'kjkm'
      Size = 4
    end
    object Cds_sfxmbaxm: TStringField
      FieldName = 'baxm'
      Size = 4
    end
    object Cds_sfxmyhhjg: TFloatField
      FieldName = 'yhhjg'
    end
    object Cds_sfxmyhjg: TFloatField
      FieldName = 'yhjg'
    end
    object Cds_sfxmsfje: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sfje'
      DisplayFormat = '0.0000'
      Calculated = True
    end
    object Cds_sfxmypgg: TStringField
      FieldName = 'ypgg'
    end
    object Cds_sfxmjbcjbs: TStringField
      FieldName = 'jbcjbs'
      Size = 10
    end
    object Cds_sfxmzflb: TStringField
      FieldName = 'zflb'
      Size = 1
    end
    object Cds_sfxmyhbl: TFloatField
      FieldName = 'yhbl'
    end
    object Cds_sfxmPH: TStringField
      FieldName = 'PH'
      Size = 16
    end
  end
  object Cds_fpxm: TClientDataSet
    Active = True
    Aggregates = <>
    AggregatesActive = True
    FieldDefs = <
      item
        Name = 'fphm'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'mzsjdm'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'mzsjmc'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'zxksdm'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'zxksmc'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'jjje'
        DataType = ftFloat
      end
      item
        Name = 'je'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 8
    Top = 64
    Data = {
      B70000009619E0BD010000001800000007000000000003000000B70004667068
      6D0100490000000100055749445448020002001400066D7A736A646D01004900
      00000100055749445448020002000100066D7A736A6D63010049000000010005
      5749445448020002000A00067A786B73646D0100490000000100055749445448
      020002000800067A786B736D6301004900000001000557494454480200020014
      00046A6A6A650800040000000000026A6508000400000000000000}
  end
  object ds_sfxm: TDataSource
    DataSet = Cds_sfxm
    Left = 16
  end
  object Dpt: TDictIpt
    FieldCode = 'Code'
    FieldInCode = 'Input_Code'
    FieldName = 'Name'
    Left = 144
    Top = 104
  end
  object Cds_Prc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAll'
    RemoteServer = DM.SockConn
    Left = 224
    Top = 72
  end
  object cds_ybml: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAll'
    RemoteServer = DM.SockConn
    Left = 224
    Top = 120
  end
  object cds_ybfp: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'jzlb'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'ysbh'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'jzje'
        DataType = ftCurrency
      end
      item
        Name = 'jls'
        DataType = ftSmallint
      end
      item
        Name = 'jzbh'
        DataType = ftString
        Size = 16
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 24
    Top = 168
    Data = {
      920000009619E0BD0100000018000000050000000000030000009200046A7A6C
      6201004900000001000557494454480200020002000479736268010049000000
      0100055749445448020002000500046A7A6A6508000400000001000753554254
      5950450200490006004D6F6E657900036A6C730200010000000000046A7A6268
      01004900000001000557494454480200020010000000}
  end
  object cds_jbybdz: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAll'
    RemoteServer = DM.SockConn
    Left = 224
    Top = 168
  end
end
