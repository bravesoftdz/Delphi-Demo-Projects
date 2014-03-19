object sszdxx_fm: Tsszdxx_fm
  Left = 0
  Top = 0
  Width = 740
  Height = 156
  Color = 14215660
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  ParentColor = False
  ParentFont = False
  TabOrder = 0
  object dbg_mst: TDBGridEh
    Left = 3
    Top = 3
    Width = 734
    Height = 133
    DataSource = ds_ssxx
    FixedColor = 14215660
    Flat = True
    Font.Charset = GB2312_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    FooterColor = clWindow
    FooterFont.Charset = GB2312_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -12
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    RowHeight = 20
    SumList.Active = True
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    TitleHeight = 14
    UseMultiTitle = True
    VertScrollBar.VisibleMode = sbNeverShowEh
    OnCellClick = dbg_mstCellClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ssrq'
        Footers = <>
        Title.Caption = #25163#26415#12289#25805#20316'|'#26085'  '#26399
        Width = 69
      end
      item
        EditButtons = <>
        FieldName = 'ssbm'
        Footers = <>
        Title.Caption = #25163#26415#12289#25805#20316'|'#32534#30721
        Width = 58
      end
      item
        EditButtons = <>
        FieldName = 'ssmc'
        Footers = <>
        Title.Caption = #25163#26415#12289#25805#20316'|'#21517'      '#31216
        Width = 193
      end
      item
        EditButtons = <>
        FieldName = 'ssysmc'
        Footers = <>
        Title.Caption = #25163#26415#12289#25805#20316#21307#24072'|'#26415#32773
        Width = 56
      end
      item
        EditButtons = <>
        FieldName = 'ssyzmc'
        Footers = <>
        Title.Caption = #25163#26415#12289#25805#20316#21307#24072'|'#8544'  '#21161
        Width = 56
      end
      item
        EditButtons = <>
        FieldName = 'ssezmc'
        Footers = <>
        Title.Caption = #25163#26415#12289#25805#20316#21307#24072'|'#8545'  '#21161
        Width = 55
      end
      item
        EditButtons = <>
        FieldName = 'mzffmc'
        Footers = <>
        Title.Caption = #40635#37257'|'#26041#24335
        Width = 78
      end
      item
        EditButtons = <>
        FieldName = 'mzysmc'
        Footers = <>
        Title.Caption = #40635#37257'|'#21307#24072
        Width = 52
      end
      item
        EditButtons = <>
        FieldName = 'djmc'
        Footers = <>
        Title.Caption = #20999#21475'|'#31561#32423
        Width = 47
      end
      item
        EditButtons = <>
        FieldName = 'yh'
        Footers = <>
        Title.Caption = #20999#21475'|'#24840#21512
        Width = 46
      end>
  end
  object edt_ssmc: TFlatSelEdit
    Left = 147
    Top = 54
    Width = 190
    Height = 20
    Font.Charset = GB2312_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentColor = True
    Visible = False
    ColorHighLight = 12164479
    ColorShadow = 12164479
    TabOrder = 1
    OnClick = edt_ssmcClick
    SelStart = 0
    OnDownClick = edt_ssmcDownClick
    OnKeyDown = edt_ssmcKeyDown
    ShapeColor = 12164479
    MaxLength = 0
    SelLength = 0
    Char = False
    ColorFlat = clWindow
    ColorFocused = clWindow
    HintType = htDown
  end
  object cbx_qk: TFlatComboBoxCode
    Left = 641
    Top = 52
    Width = 38
    Height = 20
    Style = csDropDownList
    Color = clWindow
    ColorArrowBackground = 14215660
    ColorBorder = 12164479
    Font.Charset = GB2312_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ItemHeight = 12
    ParentFont = False
    TabOrder = 2
    Visible = False
    ItemIndex = -1
    OnChange = cbx_qkChange
    OnKeyDown = cbx_qkKeyDown
  end
  object cbx_yh: TFlatComboBoxCode
    Left = 688
    Top = 52
    Width = 31
    Height = 20
    Style = csDropDownList
    Color = clWindow
    ColorArrowBackground = 14215660
    ColorBorder = 12164479
    Font.Charset = GB2312_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ItemHeight = 12
    ParentFont = False
    TabOrder = 3
    Visible = False
    ItemIndex = -1
    OnChange = cbx_yhChange
    OnKeyDown = cbx_yhKeyDown
  end
  object edt_ssys: TFlatSelEdit
    Left = 339
    Top = 62
    Width = 46
    Height = 20
    Font.Charset = GB2312_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentColor = True
    Visible = False
    ColorHighLight = 12164479
    ColorShadow = 12164479
    TabOrder = 4
    OnClick = edt_ssysClick
    SelStart = 0
    OnDownClick = edt_ssysDownClick
    OnKeyDown = edt_ssysKeyDown
    ShapeColor = 12164479
    MaxLength = 0
    SelLength = 0
    ColorFlat = clWindow
    ColorFocused = clWindow
    HintType = htDown
  end
  object edt_ssyz: TFlatSelEdit
    Left = 395
    Top = 54
    Width = 46
    Height = 20
    Font.Charset = GB2312_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentColor = True
    Visible = False
    ColorHighLight = 12164479
    ColorShadow = 12164479
    TabOrder = 5
    OnClick = edt_ssyzClick
    SelStart = 0
    OnDownClick = edt_ssysDownClick
    OnKeyDown = edt_ssyzKeyDown
    ShapeColor = 12164479
    MaxLength = 0
    SelLength = 0
    ColorFlat = clWindow
    ColorFocused = clWindow
    HintType = htDown
  end
  object edt_ssez: TFlatSelEdit
    Left = 451
    Top = 46
    Width = 46
    Height = 20
    Font.Charset = GB2312_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentColor = True
    Visible = False
    ColorHighLight = 12164479
    ColorShadow = 12164479
    TabOrder = 6
    OnClick = edt_ssezClick
    SelStart = 0
    OnDownClick = edt_ssysDownClick
    OnKeyDown = edt_ssezKeyDown
    ShapeColor = 12164479
    MaxLength = 0
    SelLength = 0
    ColorFlat = clWindow
    ColorFocused = clWindow
    HintType = htDown
  end
  object edt_mzfs: TFlatSelEdit
    Left = 507
    Top = 54
    Width = 46
    Height = 20
    Font.Charset = GB2312_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentColor = True
    Visible = False
    ColorHighLight = 12164479
    ColorShadow = 12164479
    TabOrder = 7
    OnClick = edt_mzfsClick
    SelStart = 0
    OnDownClick = edt_mzfsDownClick
    OnKeyDown = edt_mzfsKeyDown
    ShapeColor = 12164479
    MaxLength = 0
    SelLength = 0
    ColorFlat = clWindow
    ColorFocused = clWindow
    HintType = htDown
  end
  object edt_mzys: TFlatSelEdit
    Left = 587
    Top = 54
    Width = 46
    Height = 20
    Font.Charset = GB2312_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentColor = True
    Visible = False
    ColorHighLight = 12164479
    ColorShadow = 12164479
    TabOrder = 8
    OnClick = edt_mzysClick
    SelStart = 0
    OnDownClick = edt_ssysDownClick
    OnKeyDown = edt_mzysKeyDown
    ShapeColor = 12164479
    MaxLength = 0
    SelLength = 0
    ColorFlat = clWindow
    ColorFocused = clWindow
    HintType = htDown
  end
  object edt_ssrq: TFlatMaskDate
    Left = 24
    Top = 48
    Width = 73
    Height = 18
    ColorBorder = 12164479
    ColorFlat = clWindow
    AutoSize = False
    BorderStyle = bsNone
    EditMask = '!9999/99/99;1;_'
    MaxLength = 10
    TabOrder = 9
    Text = '2009-01-20'
    Visible = False
    OnExit = edt_ssrqExit
    OnKeyDown = edt_ssrqKeyDown
    SelMonth = sYear
    MaskType = mtDate
    OnChangeNew = edt_ssrqChangeNew
  end
  object ds_ssxx: TDataSource
    DataSet = cds_ssxx
    Left = 280
    Top = 2
  end
  object cds_yh: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from xt_zd_qkyhqk'
    Params = <>
    ProviderName = 'dspQry'
    RemoteServer = DM.SockConn
    Left = 168
    Top = 114
    object cds_yhQKDM: TStringField
      FieldName = 'QKDM'
      Size = 1
    end
    object cds_yhQKMC: TStringField
      FieldName = 'QKMC'
      Size = 2
    end
  end
  object cds_qkdj: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from xt_zd_qkdj'
    Params = <>
    ProviderName = 'dspAll'
    RemoteServer = DM.SockConn
    Left = 120
    Top = 104
    object cds_qkdjDJDM: TStringField
      FieldName = 'DJDM'
      Size = 1
    end
    object cds_qkdjDJMC: TStringField
      FieldName = 'DJMC'
      Size = 2
    end
  end
  object cds_ssxx: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ssxh'
        DataType = ftInteger
      end
      item
        Name = 'ssmc'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'ssbm'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'qkdj'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'qkyhqk'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'ssrq'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'mzff'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'ssys'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'SSYZ'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'SSEZ'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'mzys'
        DataType = ftString
        Size = 8
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 56
    Top = 90
    object cds_ssxxssxh: TIntegerField
      FieldName = 'ssxh'
    end
    object cds_ssxxssmc: TStringField
      FieldName = 'ssmc'
      Size = 100
    end
    object cds_ssxxssbm: TStringField
      FieldName = 'ssbm'
      Size = 8
    end
    object cds_ssxxqkdj: TStringField
      FieldName = 'qkdj'
      Size = 2
    end
    object cds_ssxxssrq: TStringField
      FieldName = 'ssrq'
      Size = 10
    end
    object cds_ssxxmzff: TStringField
      FieldName = 'mzff'
      Size = 16
    end
    object cds_ssxxssys: TStringField
      FieldName = 'ssys'
      Size = 8
    end
    object cds_ssxxdjmc: TStringField
      FieldKind = fkLookup
      FieldName = 'djmc'
      LookupDataSet = cds_qkdj
      LookupKeyFields = 'DJDM'
      LookupResultField = 'DJMC'
      KeyFields = 'qkdj'
      Lookup = True
    end
    object cds_ssxxqkyhqk: TStringField
      FieldName = 'qkyhqk'
      Size = 2
    end
    object cds_ssxxyh: TStringField
      FieldKind = fkLookup
      FieldName = 'yh'
      LookupDataSet = cds_yh
      LookupKeyFields = 'QKDM'
      LookupResultField = 'QKMC'
      KeyFields = 'qkyhqk'
      Lookup = True
    end
    object cds_ssxxSSYZ: TStringField
      FieldName = 'SSYZ'
      Size = 8
    end
    object cds_ssxxSSEZ: TStringField
      FieldName = 'SSEZ'
      Size = 8
    end
    object cds_ssxxmzys: TStringField
      FieldName = 'mzys'
      Size = 8
    end
    object cds_ssxxmzffmc: TStringField
      FieldKind = fkLookup
      FieldName = 'mzffmc'
      LookupDataSet = mzfsxz_f.cds_item
      LookupKeyFields = 'xmdm'
      LookupResultField = 'xmmc'
      KeyFields = 'mzff'
      Size = 40
      Lookup = True
    end
    object cds_ssxxssysmc: TStringField
      FieldKind = fkLookup
      FieldName = 'ssysmc'
      LookupDataSet = Cds_ys
      LookupKeyFields = 'RYBH'
      LookupResultField = 'XM'
      KeyFields = 'ssys'
      Lookup = True
    end
    object cds_ssxxssyzmc: TStringField
      FieldKind = fkLookup
      FieldName = 'ssyzmc'
      LookupDataSet = Cds_ys
      LookupKeyFields = 'RYBH'
      LookupResultField = 'XM'
      KeyFields = 'SSYZ'
      Lookup = True
    end
    object cds_ssxxssezmc: TStringField
      FieldKind = fkLookup
      FieldName = 'ssezmc'
      LookupDataSet = Cds_ys
      LookupKeyFields = 'RYBH'
      LookupResultField = 'XM'
      KeyFields = 'SSEZ'
      Lookup = True
    end
    object cds_ssxxmzysmc: TStringField
      FieldKind = fkLookup
      FieldName = 'mzysmc'
      LookupDataSet = Cds_ys
      LookupKeyFields = 'RYBH'
      LookupResultField = 'XM'
      KeyFields = 'mzys'
      Lookup = True
    end
  end
  object Cds_ys: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from xt_zd_gzry'
    Params = <>
    ProviderName = 'dspAll'
    RemoteServer = DM.SockConn
    Left = 248
    Top = 96
    object Cds_ysXM: TStringField
      FieldName = 'XM'
      Size = 10
    end
    object Cds_ysRYBH: TStringField
      FieldName = 'RYBH'
      Required = True
      Size = 6
    end
  end
end
