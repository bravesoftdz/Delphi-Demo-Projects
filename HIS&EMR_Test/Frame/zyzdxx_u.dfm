object ZYZDXX_fm: TZYZDXX_fm
  Left = 0
  Top = 0
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
  object Label1: TLabel
    Left = 8
    Top = 5
    Width = 84
    Height = 12
    Caption = #38376#65288#24613#65289#35786#35786#26029
  end
  object Label2: TLabel
    Left = 8
    Top = 30
    Width = 48
    Height = 12
    Caption = #20837#38498#35786#26029
  end
  object Label3: TLabel
    Left = 605
    Top = 8
    Width = 60
    Height = 12
    Caption = #20837#38498#26102#24773#20917
  end
  object Label4: TLabel
    Left = 579
    Top = 30
    Width = 84
    Height = 12
    Caption = #20837#38498#21518#30830#35786#26085#26399
  end
  object Label5: TLabel
    Left = 8
    Top = 291
    Width = 48
    Height = 12
    Caption = #30149#29702#35786#26029
  end
  object Label6: TLabel
    Left = 8
    Top = 315
    Width = 120
    Height = 12
    Caption = #25439#20260#12289#20013#27602#30340#22806#37096#21407#22240
  end
  object dbg_Mst: TDBGridEh
    Left = 3
    Top = 51
    Width = 735
    Height = 234
    DataSource = ds_zdxx
    FixedColor = 14215660
    Flat = True
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    FooterColor = clWindow
    FooterFont.Charset = GB2312_CHARSET
    FooterFont.Color = clBlack
    FooterFont.Height = -12
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    HorzScrollBar.Visible = False
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    RowHeight = 20
    SumList.Active = True
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -12
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    TitleHeight = 14
    VertScrollBar.VisibleMode = sbNeverShowEh
    OnCellClick = dbg_MstCellClick
    Columns = <
      item
        ButtonStyle = cbsNone
        EditButtons = <>
        FieldName = 'lb'
        Font.Charset = GB2312_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #20986#38498#35786#26029
        Width = 115
      end
      item
        ButtonStyle = cbsNone
        EditButtons = <>
        FieldName = 'zdms'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #35786#26029#25551#36848
        Width = 300
      end
      item
        ButtonStyle = cbsNone
        EditButtons = <>
        FieldName = 'jgmc'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #32467#26524
        Width = 58
      end
      item
        ButtonStyle = cbsNone
        EditButtons = <>
        FieldName = 'ts'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #22825#25968
        Width = 49
      end
      item
        ButtonStyle = cbsNone
        Checkboxes = False
        EditButtons = <>
        FieldName = 'sfssmc'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #26159#21542#25163#26415
        Width = 56
      end
      item
        ButtonStyle = cbsNone
        DisplayFormat = 'yyyy-mm-dd'
        EditButtons = <>
        FieldName = 'qzrq'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #30830#35786#26085#26399
        Width = 75
      end
      item
        ButtonStyle = cbsNone
        EditButtons = <>
        FieldName = 'zddm'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #30142#30149#20195#30721
        Width = 59
      end>
  end
  object edt_zdms: TFlatSelEdit
    Left = 147
    Top = 78
    Width = 198
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
    OnClick = edt_zdmsClick
    SelStart = 0
    OnDownClick = edt_zdmsDownClick
    OnKeyDown = edt_zdmsKeyDown
    ShapeColor = 12164479
    MaxLength = 0
    SelLength = 0
    ColorFlat = clWindow
    ColorFocused = clWindow
    HintType = htDown
  end
  object cbx_zljg: TFlatComboBoxCode
    Left = 448
    Top = 74
    Width = 33
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
    OnChange = cbx_zljgChange
    OnKeyDown = cbx_zljgKeyDown
  end
  object edt_zlts: TOWFlatEdit
    Left = 496
    Top = 79
    Width = 33
    Height = 18
    ColorBorder = 12164479
    ColorFlat = clWhite
    MaxLength = 10
    TabOrder = 3
    Text = '0'
    Visible = False
    OnChange = edt_zltsChange
    OnKeyDown = edt_zltsKeyDown
    SelStart = 0
    DataType = tInteger
  end
  object cbx_sfss: TFlatComboBoxCode
    Left = 544
    Top = 72
    Width = 49
    Height = 20
    Style = csDropDownList
    Color = clWindow
    ColorArrowBackground = 14215660
    ColorBorder = 12164479
    ItemHeight = 12
    Items.Strings = (
      #21542
      #26159)
    TabOrder = 4
    Visible = False
    ItemIndex = -1
    OnChange = cbx_sfssChange
    OnKeyDown = cbx_sfssKeyDown
    ItemCodes.Strings = (
      '0'
      '1')
    ItemInput.Strings = (
      '1'
      '2')
  end
  object edt_qzrq: TFlatMaskDate
    Left = 608
    Top = 76
    Width = 65
    Height = 18
    ColorBorder = 12164479
    ColorFlat = clWindow
    AutoSize = False
    BorderStyle = bsNone
    EditMask = '!9999/99/99;1;_'
    MaxLength = 10
    TabOrder = 5
    Text = '2009-02-09'
    Visible = False
    OnKeyDown = edt_qzrqKeyDown
    SelMonth = sMonth
    MaskType = mtDate
    OnChangeNew = edt_qzrqChangeNew
  end
  object edt_mzzd: TFlatSelEdit
    Left = 96
    Top = 3
    Width = 468
    Height = 20
    Font.Charset = GB2312_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentColor = True
    ColorHighLight = 12164479
    ColorShadow = 12164479
    TabOrder = 6
    OnClick = edt_mzzdClick
    SelStart = 0
    OnDownClick = edt_zdmsDownClick
    OnKeyDown = edt_mzzdKeyDown
    ShapeColor = 12164479
    MaxLength = 0
    SelLength = 0
    ColorFlat = clWindow
    ColorFocused = clWindow
    HintType = htDown
  end
  object edt_ryzd: TFlatSelEdit
    Left = 56
    Top = 28
    Width = 508
    Height = 20
    Font.Charset = GB2312_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentColor = True
    ColorHighLight = 12164479
    ColorShadow = 12164479
    TabOrder = 7
    OnClick = edt_ryzdClick
    SelStart = 0
    OnDownClick = edt_zdmsDownClick
    OnKeyDown = edt_ryzdKeyDown
    ShapeColor = 12164479
    MaxLength = 0
    SelLength = 0
    ColorFlat = clWindow
    ColorFocused = clWindow
    HintType = htDown
  end
  object cbx_ryqk: TFlatComboBoxCode
    Left = 666
    Top = 2
    Width = 69
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
    TabOrder = 8
    ItemIndex = -1
    OnChange = cbx_ryqkChange
    OnKeyDown = cbx_ryqkKeyDown
  end
  object edt_ryqzrq: TFlatMaskDate
    Left = 666
    Top = 26
    Width = 69
    Height = 18
    ColorBorder = 12164479
    ColorFlat = clWindow
    AutoSize = False
    BorderStyle = bsNone
    EditMask = '!9999/99/99;1;_'
    MaxLength = 10
    TabOrder = 9
    Text = '2009-02-09'
    OnKeyDown = edt_ryqzrqKeyDown
    SelMonth = sMonth
    MaskType = mtDate
  end
  object edt_blzd: TFlatSelEdit
    Left = 64
    Top = 289
    Width = 675
    Height = 20
    Font.Charset = GB2312_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentColor = True
    ColorHighLight = 12164479
    ColorShadow = 12164479
    TabOrder = 10
    OnClick = edt_blzdClick
    SelStart = 0
    OnDownClick = edt_zdmsDownClick
    OnKeyDown = edt_blzdKeyDown
    ShapeColor = 12164479
    MaxLength = 0
    SelLength = 0
    ColorFlat = clWindow
    ColorFocused = clWindow
    HintType = htDown
  end
  object edt_sszdyy: TFlatSelEdit
    Left = 136
    Top = 313
    Width = 603
    Height = 20
    Font.Charset = GB2312_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentColor = True
    ColorHighLight = 12164479
    ColorShadow = 12164479
    TabOrder = 11
    OnClick = edt_sszdyyClick
    SelStart = 0
    OnDownClick = edt_zdmsDownClick
    OnKeyDown = edt_sszdyyKeyDown
    ShapeColor = 12164479
    MaxLength = 0
    SelLength = 0
    ColorFlat = clWindow
    ColorFocused = clWindow
    HintType = htDown
  end
  object cds_zdxx: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select brbs,bczybs,zdlb,zd,zdxh,zdrq,zljg,sszlbz,zlts, (select z' +
      'ddm from zy_zdfljl) as zddm from zy_zdjl;'
    FieldDefs = <
      item
        Name = 'lb'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'zdms'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'zddm'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'jg'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ts'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'sfss'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'qzrq'
        DataType = ftDate
      end
      item
        Name = 'zdxh'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    OnCalcFields = cds_zdxxCalcFields
    Left = 40
    Top = 112
    object cds_zdxxlb: TStringField
      FieldName = 'lb'
    end
    object cds_zdxxzdms: TStringField
      FieldName = 'zdms'
    end
    object cds_zdxxzddm: TStringField
      FieldName = 'zddm'
    end
    object cds_zdxxjg: TStringField
      FieldName = 'jg'
    end
    object cds_zdxxts: TStringField
      FieldName = 'ts'
    end
    object cds_zdxxsfss: TStringField
      FieldName = 'sfss'
      Size = 1
    end
    object cds_zdxxqzrq: TDateField
      FieldName = 'qzrq'
    end
    object cds_zdxxzdxh: TStringField
      FieldName = 'zdxh'
    end
    object cds_zdxxsfssmc: TStringField
      FieldKind = fkCalculated
      FieldName = 'sfssmc'
      Size = 2
      Calculated = True
    end
    object cds_zdxxjgmc: TStringField
      FieldKind = fkLookup
      FieldName = 'jgmc'
      LookupDataSet = cds_qkdj
      LookupKeyFields = 'JGDM'
      LookupResultField = 'JGMC'
      KeyFields = 'jg'
      Size = 4
      Lookup = True
    end
  end
  object ds_zdxx: TDataSource
    DataSet = cds_zdxx
    Left = 80
    Top = 120
  end
  object dpt1: TDictIpt
    FieldCode = 'Code'
    FieldInCode = 'Input_Code'
    FieldName = 'Name'
    Left = 219
    Top = 4
  end
  object cds_qkdj: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from xt_zd_zljg'
    Params = <>
    ProviderName = 'dspAll'
    RemoteServer = DM.SockConn
    Left = 120
    Top = 136
    object cds_qkdjJGDM: TStringField
      FieldName = 'JGDM'
      Size = 1
    end
    object cds_qkdjJGMC: TStringField
      FieldName = 'JGMC'
      Size = 4
    end
  end
end
