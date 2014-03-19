object RCPT_Item_fm: TRCPT_Item_fm
  Left = 0
  Top = 0
  Width = 565
  Height = 181
  Color = 14215660
  ParentColor = False
  TabOrder = 0
  object DBGridEh1: TDBGridEh
    Left = 3
    Top = 2
    Width = 557
    Height = 175
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
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
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
        Title.Caption = #39033#30446
        Width = 96
      end
      item
        DisplayFormat = '0.00'
        EditButtons = <>
        EditMask = '0.0000'
        FieldName = 'je1'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #37329#39069
        Width = 86
      end
      item
        EditButtons = <>
        FieldName = 'xm2'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #39033#30446
        Width = 85
      end
      item
        DisplayFormat = '0.00'
        EditButtons = <>
        EditMask = '0.0000'
        FieldName = 'je2'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #37329#39069
        Width = 87
      end
      item
        EditButtons = <>
        FieldName = 'xm3'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #39033#30446
        Width = 87
      end
      item
        DisplayFormat = '0.00'
        EditButtons = <>
        EditMask = '0.0000'
        FieldName = 'je3'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #37329#39069
        Width = 79
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
        Name = 'je1'
        DataType = ftFloat
      end
      item
        Name = 'xm2'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'je2'
        DataType = ftFloat
      end
      item
        Name = 'xm3'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'je3'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 216
    Top = 80
    Data = {
      860000009619E0BD010000001800000006000000000003000000860003786D31
      0100490000000100055749445448020002001400036A65310800040000000000
      03786D320100490000000100055749445448020002001400036A653208000400
      0000000003786D330100490000000100055749445448020002001400036A6533
      08000400000000000000}
  end
  object ds_Jtb: TDataSource
    DataSet = Cds_Jtb
    Left = 184
    Top = 80
  end
end
