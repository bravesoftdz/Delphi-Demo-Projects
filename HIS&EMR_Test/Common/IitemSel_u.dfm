inherited IitemSel_f: TIitemSel_f
  Left = 415
  Top = 242
  BorderStyle = bsNone
  Caption = #25163#26415#25805#20316#36873#25321
  ClientHeight = 253
  ClientWidth = 539
  ParentFont = True
  OldCreateOrder = True
  Position = poDesigned
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Shape1: TShape
    Left = 0
    Top = 0
    Width = 539
    Height = 253
    Pen.Color = clGreen
  end
  object dbg_xm: TDBGridEh
    Left = 2
    Top = 3
    Width = 536
    Height = 224
    DataSource = ds_item
    FixedColor = 14215660
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = GB2312_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -12
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    FooterRowCount = 1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    RowHeight = 20
    SumList.Active = True
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    TitleHeight = 12
    VertScrollBar.VisibleMode = sbAlwaysShowEh
    OnDblClick = dbg_xmDblClick
    OnKeyDown = dbg_xmKeyDown
    Columns = <
      item
        EditButtons = <>
        FieldName = 'xmdm'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #39033#30446#20195#30721
        Width = 83
      end
      item
        EditButtons = <>
        FieldName = 'ypmc'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #39033#30446#21517#31216
        Width = 181
      end
      item
        EditButtons = <>
        FieldName = 'bzgg'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #35268#26684
        Width = 95
      end
      item
        EditButtons = <>
        FieldName = 'bzdw'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #21333#20301
        Width = 41
      end
      item
        EditButtons = <>
        FieldName = 'jg'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #20215#26684
        Width = 66
      end
      item
        EditButtons = <>
        FieldName = 'zflbmc'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #25903#20184
        Width = 32
      end>
  end
  object stbr_item: TStatusBarEx
    Left = 2
    Top = 226
    Width = 535
    Height = 24
    Align = alNone
    Font.Charset = GB2312_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    Panels = <
      item
        Alignment = taCenter
        Text = #31934#30830
        Width = 50
      end
      item
        Text = #21161#35789#30721#26816#32034
        Width = 180
      end
      item
        Text = #25353#12304'F5'#12305#26356#26032#25910#36153#39033#30446
        Width = 180
      end>
    ParentColor = True
    SimplePanel = False
    UseSystemFont = False
  end
  object cds_item: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCom'
    RemoteServer = DM.SockConn
    Left = 48
    Top = 40
  end
  object ds_item: TDataSource
    DataSet = cds_item
    Left = 88
    Top = 48
  end
end
