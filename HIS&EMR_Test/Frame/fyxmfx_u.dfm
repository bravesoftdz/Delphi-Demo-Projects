object fyxmfx_fm: Tfyxmfx_fm
  Left = 0
  Top = 0
  Width = 759
  Height = 329
  Color = 14215660
  ParentColor = False
  TabOrder = 0
  object dbg_fyfx: TDBGridEh
    Left = 3
    Top = 3
    Width = 755
    Height = 323
    DataSource = ds_fyxm
    FixedColor = 14215660
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    RowHeight = 20
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleHeight = 14
    VertScrollBar.VisibleMode = sbNeverShowEh
    Columns = <
      item
        EditButtons = <>
        FieldName = 'xmmc1'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #39033#30446
        Width = 197
      end
      item
        EditButtons = <>
        FieldName = 'xmje1'
        Footer.ValueType = fvtStaticText
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #37329#39069
        Width = 90
      end
      item
        EditButtons = <>
        FieldName = 'xmbl1'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #30334#20998#27604
        Width = 77
      end
      item
        EditButtons = <>
        FieldName = 'xmmc2'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #39033#30446
        Width = 190
      end
      item
        EditButtons = <>
        FieldName = 'xmje2'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #37329#39069
        Width = 101
      end
      item
        EditButtons = <>
        FieldName = 'xmbl2'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #30334#20221#27604
        Width = 79
      end>
  end
  object cds_fyxm: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'xmmc1'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'xmje1'
        DataType = ftFloat
      end
      item
        Name = 'xmbl1'
        DataType = ftFloat
      end
      item
        Name = 'xmmc2'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'xmje2'
        DataType = ftFloat
      end
      item
        Name = 'xmbl2'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 8
    Top = 16
    Data = {
      860000009619E0BD010000001800000006000000000003000000860005786D6D
      63310100490000000100055749445448020002001E0005786D6A653108000400
      0000000005786D626C31080004000000000005786D6D63320100490000000100
      055749445448020002001E0005786D6A6532080004000000000005786D626C32
      08000400000000000000}
  end
  object ds_fyxm: TDataSource
    DataSet = cds_fyxm
    Left = 48
    Top = 24
  end
end
