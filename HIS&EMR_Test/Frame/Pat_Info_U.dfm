object Pat_Info_fm: TPat_Info_fm
  Left = 0
  Top = 0
  Width = 563
  Height = 129
  Color = 14215660
  ParentColor = False
  TabOrder = 0
  object DBGridEh1: TDBGridEh
    Left = 3
    Top = 2
    Width = 557
    Height = 127
    DataSource = ds_Jtb
    FixedColor = 14215660
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    RowHeight = 18
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleHeight = 14
    VertScrollBar.VisibleMode = sbAlwaysShowEh
    Columns = <
      item
        EditButtons = <>
        FieldName = 'xm1'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #22995#21517
        Width = 74
      end
      item
        DisplayFormat = '0.00'
        EditButtons = <>
        EditMask = '0.0000'
        FieldName = 'brid1'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #30149#20154'ID'
        Width = 86
      end
      item
        EditButtons = <>
        FieldName = 'xm2'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #22995#21517
        Width = 83
      end
      item
        EditButtons = <>
        FieldName = 'brid2'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #30149#20154'ID'
        Width = 97
      end
      item
        EditButtons = <>
        FieldName = 'xm3'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #22995#21517
        Width = 90
      end
      item
        EditButtons = <>
        FieldName = 'brid3'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #30149#20154'ID'
        Width = 92
      end>
  end
  object Cds_Jtb: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'xm1'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'brid1'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'xm2'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'brid2'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'xm3'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'brid3'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 216
    Top = 80
    Data = {
      B00000009619E0BD010000001800000006000000000003000000B00003786D31
      0100490000000100055749445448020002001400056272696431010049000000
      010005574944544802000200140003786D320100490000000100055749445448
      0200020014000562726964320100490000000100055749445448020002001400
      03786D3301004900000001000557494454480200020014000562726964330100
      4900000001000557494454480200020014000000}
    object Cds_Jtbxm1: TStringField
      FieldName = 'xm1'
    end
    object Cds_Jtbbrid1: TStringField
      FieldName = 'brid1'
    end
    object Cds_Jtbxm2: TStringField
      FieldName = 'xm2'
    end
    object Cds_Jtbbrid2: TStringField
      FieldName = 'brid2'
    end
    object Cds_Jtbxm3: TStringField
      FieldName = 'xm3'
    end
    object Cds_Jtbbrid3: TStringField
      FieldName = 'brid3'
    end
  end
  object ds_Jtb: TDataSource
    DataSet = Cds_Jtb
    Left = 184
    Top = 80
  end
end
