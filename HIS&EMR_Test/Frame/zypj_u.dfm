object zypj_fm: Tzypj_fm
  Left = 0
  Top = 0
  Width = 756
  Height = 329
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
      Left = 2
      Top = 2
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
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleHeight = 14
      VertScrollBar.VisibleMode = sbNeverShowEh
      OnCellClick = dbg_MstCellClick
      OnDrawColumnCell = dbg_MstDrawColumnCell
      OnMouseDown = dbg_MstMouseDown
      Columns = <
        item
          EditButtons = <>
          FieldName = 'xz'
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #8730
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clRed
          Title.Font.Height = -12
          Title.Font.Name = #23435#20307
          Title.Font.Style = []
          Width = 19
        end
        item
          EditButtons = <>
          FieldName = 'ysxm'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #21307#29983
          Width = 53
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
          Width = 30
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
          Width = 78
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
          Width = 47
        end
        item
          EditButtons = <>
          FieldName = 'zxksmc'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #25191#34892#31185#23460
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
          Width = 66
        end
        item
          EditButtons = <>
          FieldName = 'scjl'
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #21024
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clRed
          Title.Font.Height = -12
          Title.Font.Name = #23435#20307
          Title.Font.Style = []
          Width = 21
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
      TabOrder = 0
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
      ColorFlat = clWhite
      ColorFocused = clWhite
      HintType = htDown
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
      TabOrder = 3
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
      TabOrder = 4
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
      TabOrder = 5
      OnClick = edt_zxksClick
      OnEnter = edt_zxksEnter
      SelStart = 0
      OnDownClick = edt_zxksDownClick
      OnKeyDown = edt_zxksKeyDown
      ShapeColor = 12164479
      MaxLength = 0
      SelLength = 0
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
      TabOrder = 6
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
      TabOrder = 7
    end
    object edt_cyjs: TFloatEdit
      Left = 165
      Top = 88
      Width = 32
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
      TabOrder = 8
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
      TabOrder = 9
      Visible = False
      ItemIndex = -1
      OnChange = cbx_dwChange
      OnEnter = cbx_dwEnter
      OnKeyDown = cbx_dwKeyDown
    end
    object edt_xmgg: TFlatSelEdit
      Left = 344
      Top = 24
      Width = 73
      Height = 20
      ParentColor = True
      Visible = False
      ColorHighLight = 12164479
      ColorShadow = 12164479
      TabOrder = 10
      SelStart = 0
      ShapeColor = 12164479
      MaxLength = 0
      SelLength = 0
      ColorFlat = clWhite
      ColorFocused = clWhite
      HintType = htNone
    end
    object cbx_xz: TFlatCheckBox
      Left = 40
      Top = 160
      Width = 17
      Height = 17
      ColorBorder = clRed
      TabOrder = 11
      TabStop = True
      Visible = False
      OnClick = cbx_xzClick
      OnKeyDown = cbx_xzKeyDown
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
        Attributes = [faRequired]
        DataType = ftString
        Size = 80
      end
      item
        Name = 'xmgg'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'dw'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'jg'
        Attributes = [faRequired]
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
        Name = 'zyfl'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'hsfl'
        DataType = ftString
        Size = 4
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
        Name = 'zysjmc'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'jbcjbs'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ypgg'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'yhbl'
        DataType = ftFloat
      end
      item
        Name = 'mbxh'
        DataType = ftInteger
      end
      item
        Name = 'hsflmc'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PH'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'zflb'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'yhjgzx'
        DataType = ftFloat
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
        Name = 'kzgg'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'kzph'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'jga'
        DataType = ftFloat
      end
      item
        Name = 'jgb'
        DataType = ftFloat
      end
      item
        Name = 'jgc'
        DataType = ftFloat
      end
      item
        Name = 'zljgbz'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'xjl'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'xz'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'scjl'
        DataType = ftString
        Size = 2
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterScroll = Cds_sfxmAfterScroll
    OnCalcFields = Cds_sfxmCalcFields
    OnPostError = Cds_sfxmPostError
    Left = 64
    Top = 112
    Data = {
      C40400009619E0BD010000001800000039000000000003000000C40404636678
      680200010000000000047973786D010049000000010005574944544802000200
      1400066A62666C646D0100490000000100055749445448020002000100066A62
      666C6D630100490000000100055749445448020002000A0004786D646D010049
      0000000100055749445448020002000E0004786D6D6301004900040001000557
      4944544802000200500004786D67670100490000000100055749445448020002
      0014000264770100490000000100055749445448020002000A00026A67080004
      000400000002736C0800040000000000067A786B73646D010049000000010005
      5749445448020002000800067A786B736D630100490000000100055749445448
      020002001400056A626A6C730400010000000000046A626A6708000400000000
      00066A627A786B7301004900000001000557494454480200020008000463796A
      730400010000000000047973646D010049000000010005574944544802000200
      08000663667868787304000100000000000663796A7378730400010000000000
      046670686D0100490000000100055749445448020002000800047A79666C0100
      490000000100055749445448020002000100046873666C010049000000010005
      5749445448020002000400047970627A01004900000001000557494454480200
      02000100057970627A6A0200010000000000056D7A636C310100490000000100
      055749445448020002000100056D7A636C320100490000000100055749445448
      020002000100056E68627A310400010000000000056E68316477010049000000
      0100055749445448020002000800056E68627A320400010000000000056E6832
      64770100490000000100055749445448020002000800047A6464770100490000
      00010005574944544802000200080004636A6273010049000000010005574944
      5448020002000A00047062627A01004900000001000557494454480200020001
      00046B6A6B6D0100490000000100055749445448020002000400046261786D01
      00490000000100055749445448020002000400057968686A6708000400000000
      000479686A670800040000000000067A79736A6D630100490000000100055749
      445448020002001400066A62636A627301004900000001000557494454480200
      02000A0004797067670100490000000100055749445448020002001400047968
      626C0800040000000000046D6278680400010000000000066873666C6D630100
      4900000001000557494454480200020014000250480100490000000100055749
      445448020002001000047A666C62010049000000010005574944544802000200
      01000679686A677A78080004000000000005736370666A080004000000000005
      73636C736A0800040000000000046B7A67670100490000000100055749445448
      020002001400046B7A7068010049000000010005574944544802000200100003
      6A67610800040000000000036A67620800040000000000036A67630800040000
      000000067A6C6A67627A01004900000001000557494454480200020001000378
      6A6C010049000000010005574944544802000200010002787A01004900000001
      000557494454480200020002000473636A6C0100490000000100055749445448
      0200020002000000}
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
      Size = 80
    end
    object Cds_sfxmxmgg: TStringField
      FieldName = 'xmgg'
    end
    object Cds_sfxmdw: TStringField
      FieldName = 'dw'
      Size = 10
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
    object Cds_sfxmfphm: TStringField
      FieldName = 'fphm'
      Size = 8
    end
    object Cds_sfxmhsfl: TStringField
      DisplayWidth = 4
      FieldName = 'hsfl'
      Size = 4
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
    object Cds_sfxmzyfl: TStringField
      FieldName = 'zyfl'
      Size = 1
    end
    object Cds_sfxmzysjmc: TStringField
      FieldName = 'zysjmc'
    end
    object Cds_sfxmjbcjbs: TStringField
      FieldName = 'jbcjbs'
      Size = 10
    end
    object Cds_sfxmypgg: TStringField
      FieldName = 'ypgg'
    end
    object Cds_sfxmyhbl: TFloatField
      FieldName = 'yhbl'
    end
    object Cds_sfxmmbxh: TIntegerField
      FieldName = 'mbxh'
    end
    object Cds_sfxmhsflmc: TStringField
      FieldName = 'hsflmc'
    end
    object Cds_sfxmPH: TStringField
      FieldName = 'PH'
      Size = 16
    end
    object Cds_sfxmzflb: TStringField
      FieldName = 'zflb'
      Size = 1
    end
    object Cds_sfxmyhjgzx: TFloatField
      FieldName = 'yhjgzx'
    end
    object Cds_sfxmscpfj: TFloatField
      FieldName = 'scpfj'
    end
    object Cds_sfxmsclsj: TFloatField
      FieldName = 'sclsj'
    end
    object Cds_sfxmkzgg: TStringField
      FieldName = 'kzgg'
    end
    object Cds_sfxmkzph: TStringField
      FieldName = 'kzph'
      Size = 16
    end
    object Cds_sfxmjga: TFloatField
      FieldName = 'jga'
    end
    object Cds_sfxmjgb: TFloatField
      FieldName = 'jgb'
    end
    object Cds_sfxmjgc: TFloatField
      FieldName = 'jgc'
    end
    object Cds_sfxmzljgbz: TStringField
      FieldName = 'zljgbz'
      Size = 1
    end
    object Cds_sfxmxjl: TStringField
      FieldName = 'xjl'
      Size = 1
    end
    object Cds_sfxmxz: TStringField
      FieldName = 'xz'
      Size = 2
    end
    object Cds_sfxmscjl: TStringField
      FieldName = 'scjl'
      Size = 2
    end
  end
  object Cds_fpxm: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'zysjdm'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'zysjmc'
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
      end
      item
        Name = 'hsfl'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'hsflmc'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'kdysdm'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'kdysxm'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ysdm'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'ysxm'
        DataType = ftString
        Size = 8
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 8
    Top = 64
    Data = {
      3A0100009619E0BD01000000180000000C0000000000030000003A01067A7973
      6A646D0100490000000100055749445448020002000100067A79736A6D630100
      490000000100055749445448020002000A00067A786B73646D01004900000001
      00055749445448020002000800067A786B736D63010049000000010005574944
      5448020002001400046A6A6A650800040000000000026A650800040000000000
      046873666C0100490000000100055749445448020002000400066873666C6D63
      0100490000000100055749445448020002001400066B647973646D0100490000
      000100055749445448020002000600066B647973786D01004900000001000557
      49445448020002001400047973646D0100490000000100055749445448020002
      000600047973786D01004900000001000557494454480200020008000000}
  end
  object ds_sfxm: TDataSource
    DataSet = Cds_sfxm
    Left = 112
    Top = 48
  end
  object Dpt: TDictIpt
    FieldCode = 'Code'
    FieldInCode = 'Input_Code'
    FieldName = 'Name'
    SearchMode = smAll
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
end
