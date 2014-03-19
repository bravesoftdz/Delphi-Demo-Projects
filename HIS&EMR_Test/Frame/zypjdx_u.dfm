object zypjdx_fm: Tzypjdx_fm
  Left = 0
  Top = 0
  Width = 694
  Height = 265
  TabOrder = 0
  object pnl_sfxm: TPanel
    Left = 0
    Top = 0
    Width = 694
    Height = 264
    BevelOuter = bvNone
    Enabled = False
    ParentColor = True
    TabOrder = 0
    object dbg_Mst: TDBGridEh
      Left = 0
      Top = 0
      Width = 692
      Height = 265
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
      VertScrollBar.VisibleMode = sbAlwaysShowEh
      OnCellClick = dbg_MstCellClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'ysxm'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #30149#20154'ID'
          Width = 63
        end
        item
          EditButtons = <>
          FieldName = 'cfxh'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #20303#38498#21495
          Width = 63
        end
        item
          EditButtons = <>
          FieldName = 'jbflmc'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #22995#21517
          Width = 59
        end
        item
          EditButtons = <>
          FieldName = 'cyjsxs'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #36153#21035
          Width = 41
        end
        item
          EditButtons = <>
          FieldName = 'xmmc'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #39044#20132#37329#20313#39069
          Width = 82
        end
        item
          EditButtons = <>
          FieldName = 'dj'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #21333#20215
        end
        item
          EditButtons = <>
          FieldName = 'xmgg'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #25968#37327
          Width = 72
        end
        item
          EditButtons = <>
          FieldName = 'dw'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #35745#20215#37329#39069
          Width = 67
        end
        item
          EditButtons = <>
          FieldName = 'jg'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #24212#25910#37329#39069
          Width = 76
        end
        item
          Alignment = taRightJustify
          EditButtons = <>
          FieldName = 'zxksmc'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #24320#21333#31185#23460
          Width = 63
        end>
    end
    object edt_xmmc: TFlatSelEdit
      Left = 152
      Top = 56
      Width = 89
      Height = 20
      ParentColor = True
      Visible = False
      ColorHighLight = 12164479
      ColorShadow = 12164479
      TabOrder = 1
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
    object edt_jg: TFloatEdit
      Left = 320
      Top = 24
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
      TabOrder = 2
      ONExit = edt_jgExit
    end
    object edt_sl: TFloatEdit
      Left = 474
      Top = 64
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
      TabOrder = 3
      ONEnter = edt_slEnter
    end
    object edt_zxks: TFlatSelEdit
      Left = 592
      Top = 24
      Width = 60
      Height = 20
      ParentColor = True
      Visible = False
      ColorHighLight = 12164479
      ColorShadow = 12164479
      TabOrder = 4
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
    object edt_cfys: TFlatEdit
      Left = 24
      Top = 24
      Width = 41
      Height = 19
      ColorBorder = 12164479
      ColorFlat = clWhite
      TabOrder = 5
      OnChange = edt_cfysChange
      OnExit = edt_cfysExit
      OnKeyDown = edt_cfysKeyDown
    end
    object edt_cfxh: TFlatEdit
      Left = 80
      Top = 24
      Width = 49
      Height = 19
      ColorBorder = 12164479
      ColorFlat = clWhite
      TabOrder = 6
      OnChange = edt_cfxhChange
      OnKeyDown = edt_cfxhKeyDown
    end
    object cbx_xmgg: TFloatEdit
      Left = 392
      Top = 24
      Width = 49
      Height = 20
      MaxLength = 10
      ColorFlat = clWhite
      DataType = dtFloat
      DecimalLength = 2
      Text = '0.00'
      NOFormat = False
      ONKeyDown = cbx_xmggKeyDown
      OnChange = cbx_xmggChange
      TabOrder = 7
      ONEnter = cbx_xmggEnter
    end
    object cbx_dw: TFloatEdit
      Left = 456
      Top = 24
      Width = 57
      Height = 20
      MaxLength = 10
      ColorFlat = clWhite
      DataType = dtFloat
      DecimalLength = 2
      Text = '0.00'
      NOFormat = False
      ONKeyDown = cbx_dwKeyDown
      OnChange = cbx_dwChange
      TabOrder = 8
      ONEnter = cbx_dwEnter
    end
  end
  object Cds_sfxm: TClientDataSet
    Active = True
    Aggregates = <>
    AggregatesActive = True
    FieldDefs = <
      item
        Name = 'cfxh'
        DataType = ftString
        Size = 20
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
        DataType = ftFloat
      end
      item
        Name = 'dw'
        DataType = ftFloat
      end
      item
        Name = 'jg'
        DataType = ftFloat
      end
      item
        Name = 'dj'
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
        DataType = ftString
        Size = 20
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
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterScroll = Cds_sfxmAfterScroll
    OnCalcFields = Cds_sfxmCalcFields
    Left = 96
    Top = 96
    Data = {
      520300009619E0BD010000001800000027000000000003000000520304636678
      680100490000000100055749445448020002001400047973786D010049000000
      0100055749445448020002001400066A62666C646D0100490000000100055749
      445448020002000100066A62666C6D6301004900000001000557494454480200
      02000A0004786D646D0100490000000100055749445448020002000E0004786D
      6D63010049000000010005574944544802000200280004786D67670800040000
      0000000264770800040000000000026A67080004000000000002646A08000400
      0000000002736C0800040000000000067A786B73646D01004900000001000557
      49445448020002000800067A786B736D63010049000000010005574944544802
      0002001400056A626A6C730400010000000000046A626A670800040000000000
      066A627A786B7301004900000001000557494454480200020008000463796A73
      0400010000000000047973646D01004900000001000557494454480200020008
      000663667868787304000100000000000663796A737873010049000000010005
      5749445448020002001400046670686D01004900000001000557494454480200
      02000800046D7A666C0100490000000100055749445448020002000100066D7A
      736A6D630100490000000100055749445448020002000A00046873666C010049
      0000000100055749445448020002000100047970627A01004900000001000557
      49445448020002000100057970627A6A0200010000000000056D7A636C310100
      490000000100055749445448020002000100056D7A636C320100490000000100
      055749445448020002000100056E68627A310400010000000000056E68316477
      0100490000000100055749445448020002000800056E68627A32040001000000
      0000056E683264770100490000000100055749445448020002000800047A6464
      77010049000000010005574944544802000200080004636A6273010049000000
      0100055749445448020002000A00047062627A01004900000001000557494454
      48020002000100046B6A6B6D0100490000000100055749445448020002000400
      046261786D0100490000000100055749445448020002000400057968686A6708
      000400000000000479686A6708000400000000000000}
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
      Calculated = True
    end
    object Cds_sfxmdj: TFloatField
      FieldName = 'dj'
    end
    object Cds_sfxmcyjsxs: TStringField
      FieldName = 'cyjsxs'
    end
    object Cds_sfxmcfxh: TStringField
      FieldName = 'cfxh'
    end
    object Cds_sfxmxmgg: TFloatField
      FieldName = 'xmgg'
    end
    object Cds_sfxmdw: TFloatField
      FieldName = 'dw'
    end
    object Cds_sfxmjekj: TAggregateField
      FieldName = 'jekj'
      Active = True
      Expression = 'sum(sl*jg*cyjs)'
    end
    object Cds_sfxmsfjekj: TAggregateField
      FieldName = 'sfjekj'
      Active = True
      Expression = 'sum(sl*yhhjg*cyjs)'
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
    object Cds_fpxmjjjekj: TAggregateField
      FieldName = 'jjjekj'
      Active = True
      Expression = 'sum(jjje)'
    end
    object Cds_fpxmssjekj: TAggregateField
      FieldName = 'ssjekj'
      Active = True
      Expression = 'sum(je)'
    end
  end
  object ds_sfxm: TDataSource
    DataSet = Cds_sfxm
    Left = 136
    Top = 152
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
    Left = 224
    Top = 72
  end
end
