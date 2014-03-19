object Form1: TForm1
  Left = 212
  Top = 165
  Width = 940
  Height = 564
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object NsoCtrl_1: TNsoControl
    Left = 728
    Top = 0
    Width = 204
    Height = 530
    Align = alRight
    TabOrder = 0
    OnNsoKeyPressedEvent = NsoCtrl_1NsoKeyPressedEvent
    OnNsoToolbarAddinEvent = NsoCtrl_1NsoToolbarAddinEvent
    ControlData = {0009000016150000C7360000}
  end
  object Btn_1: TButton
    Left = 16
    Top = 81
    Width = 75
    Height = 25
    Caption = 'Add'
    TabOrder = 1
    OnClick = Btn_1Click
  end
  object Btn_2: TButton
    Left = 16
    Top = 16
    Width = 75
    Height = 25
    Caption = 'showlist'
    TabOrder = 2
    OnClick = Btn_2Click
  end
  object Btn_3: TButton
    Left = 16
    Top = 49
    Width = 75
    Height = 25
    Caption = 'clear'
    TabOrder = 3
    OnClick = Btn_3Click
  end
  object Btn_4: TButton
    Left = 16
    Top = 114
    Width = 75
    Height = 25
    Caption = 'show'
    TabOrder = 4
    OnClick = Btn_4Click
  end
  object Btn_5: TButton
    Left = 16
    Top = 147
    Width = 75
    Height = 25
    Caption = 'close'
    TabOrder = 5
    OnClick = Btn_5Click
  end
  object Btn_6: TButton
    Left = 16
    Top = 180
    Width = 75
    Height = 25
    Caption = 'savestream'
    TabOrder = 6
    OnClick = Btn_6Click
  end
  object Btn_7: TButton
    Left = 16
    Top = 212
    Width = 75
    Height = 25
    Caption = 'loadstream'
    TabOrder = 7
    OnClick = Btn_7Click
  end
  object Btn_8: TButton
    Left = 16
    Top = 245
    Width = 75
    Height = 25
    Caption = 'node grid'
    TabOrder = 8
    OnClick = Btn_8Click
  end
  object EhGrd_1: TDBGridEh
    Left = 104
    Top = 0
    Width = 300
    Height = 65
    AutoFitColWidths = True
    DataSource = Dsource_1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 9
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Btn_9: TButton
    Left = 16
    Top = 278
    Width = 75
    Height = 25
    Caption = 'list item'
    TabOrder = 10
    OnClick = Btn_9Click
  end
  object Btn_10: TButton
    Left = 104
    Top = 221
    Width = 75
    Height = 25
    Caption = 'addsct'
    TabOrder = 11
    OnClick = Btn_10Click
  end
  object Edt_1: TEdit
    Left = 184
    Top = 225
    Width = 73
    Height = 21
    TabOrder = 12
  end
  object Btn_11: TButton
    Left = 16
    Top = 311
    Width = 75
    Height = 25
    Caption = 'list struct'
    TabOrder = 13
    OnClick = Btn_11Click
  end
  object Btn_12: TButton
    Left = 16
    Top = 343
    Width = 75
    Height = 25
    Caption = 'part grid'
    TabOrder = 14
    OnClick = Btn_12Click
  end
  object EhGrd_2: TDBGridEh
    Left = 104
    Top = 75
    Width = 300
    Height = 65
    AutoFitColWidths = True
    DataSource = Dsource_2
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 15
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = EhGrd_2DblClick
  end
  object Btn_13: TButton
    Left = 16
    Top = 408
    Width = 75
    Height = 25
    Caption = 'show tree'
    TabOrder = 16
    OnClick = Btn_13Click
  end
  object Tview_1: TTreeView
    Left = 104
    Top = 150
    Width = 300
    Height = 65
    Indent = 19
    TabOrder = 17
    OnDblClick = Tview_1DblClick
  end
  object Btn_14: TButton
    Left = 16
    Top = 376
    Width = 75
    Height = 25
    Caption = 'xml'
    TabOrder = 18
    OnClick = Btn_14Click
  end
  object EhGrd_3: TDBGridEh
    Left = 104
    Top = 256
    Width = 300
    Height = 65
    AutoFitColWidths = True
    DataSource = Dsource_3
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 19
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = EhGrd_2DblClick
  end
  object Btn_15: TButton
    Left = 8
    Top = 440
    Width = 81
    Height = 25
    Caption = 'SysElmtGetText'
    TabOrder = 20
    OnClick = Btn_15Click
  end
  object btn1: TButton
    Left = 16
    Top = 472
    Width = 75
    Height = 25
    Caption = 'Recension'
    TabOrder = 21
    OnClick = btn1Click
  end
  object Btn_16: TButton
    Left = 264
    Top = 221
    Width = 75
    Height = 25
    Caption = #35774#32622#20462#25913#32773
    TabOrder = 22
    OnClick = Btn_16Click
  end
  object Button1: TButton
    Left = 104
    Top = 328
    Width = 129
    Height = 25
    Caption = 'AcceptRecension'
    TabOrder = 23
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 240
    Top = 328
    Width = 121
    Height = 25
    Caption = 'RejectRecension'
    TabOrder = 24
    OnClick = Button2Click
  end
  object edt1: TEdit
    Left = 344
    Top = 225
    Width = 73
    Height = 21
    TabOrder = 25
    Text = 'edt1'
  end
  object Btn_17: TButton
    Left = 24
    Top = 504
    Width = 75
    Height = 25
    Caption = 'InsertFile'
    TabOrder = 26
    OnClick = Btn_17Click
  end
  object Btn_18: TButton
    Left = 96
    Top = 352
    Width = 75
    Height = 25
    Caption = 'SaveZip'
    TabOrder = 27
    OnClick = Btn_18Click
  end
  object Btn_19: TButton
    Left = 176
    Top = 352
    Width = 75
    Height = 25
    Caption = 'OpenZip'
    TabOrder = 28
    OnClick = Btn_19Click
  end
  object Btn_20: TButton
    Left = 256
    Top = 352
    Width = 75
    Height = 25
    Caption = 'saveas2'
    TabOrder = 29
    OnClick = Btn_20Click
  end
  object Btn_21: TButton
    Left = 336
    Top = 352
    Width = 75
    Height = 25
    Caption = 'createnew'
    TabOrder = 30
    OnClick = Btn_21Click
  end
  object Btn_22: TButton
    Left = 336
    Top = 384
    Width = 75
    Height = 25
    Caption = 'IsModify'
    TabOrder = 31
    OnClick = Btn_22Click
  end
  object Btn_23: TButton
    Left = 96
    Top = 384
    Width = 75
    Height = 25
    Caption = 'cdssave'
    TabOrder = 32
    OnClick = Btn_23Click
  end
  object EhGrd_4: TDBGridEh
    Left = 104
    Top = 424
    Width = 300
    Height = 89
    DataSource = DSrce_1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    TabOrder = 33
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Btn_24: TButton
    Left = 176
    Top = 384
    Width = 75
    Height = 25
    Caption = 'cdsopen'
    TabOrder = 34
    OnClick = Btn_24Click
  end
  object Btn_25: TButton
    Left = 256
    Top = 384
    Width = 75
    Height = 25
    Caption = 'index.xml'
    TabOrder = 35
    OnClick = Btn_25Click
  end
  object btn_26: TBitBtn
    Left = 416
    Top = 24
    Width = 75
    Height = 25
    Caption = 'savelog'
    TabOrder = 36
    OnClick = btn_26Click
  end
  object btn_27: TBitBtn
    Left = 504
    Top = 24
    Width = 75
    Height = 25
    Caption = 'showlog'
    TabOrder = 37
    OnClick = btn_27Click
  end
  object dbgrd_1: TDBGrid
    Left = 424
    Top = 56
    Width = 289
    Height = 81
    DataSource = DSrce_2
    TabOrder = 38
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Cds_test: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 885
    Top = 391
  end
  object Dsource_1: TDataSource
    DataSet = Cds_test
    Left = 885
    Top = 455
  end
  object Dsource_2: TDataSource
    DataSet = Cds_1
    Left = 885
    Top = 487
  end
  object Cds_1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 885
    Top = 327
  end
  object Dsource_3: TDataSource
    DataSet = Cds_2
    Left = 885
    Top = 423
  end
  object Cds_2: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 885
    Top = 359
  end
  object dlgSave1: TSaveDialog
    DefaultExt = '.bzip'
    Filter = '*.bzip|*.bzip'
    Options = [ofOverwritePrompt, ofEnableSizing]
    Left = 232
    Top = 344
  end
  object dlgOpen1: TOpenDialog
    DefaultExt = '.bzip'
    Filter = '*.bzip|*.bzip'
    Left = 272
    Top = 344
  end
  object DSrce_1: TDataSource
    DataSet = Cds_3
    Left = 136
    Top = 424
  end
  object Cds_3: TClientDataSet
    Aggregates = <>
    FileName = 
      'D:\Darklinden\darklindenlocal\USE_HIS&CTRLS\test\DocTempFiles\In' +
      'dex.xml'
    Params = <>
    ProviderName = 'dspDtl'
    RemoteServer = DM.SockConn
    Left = 184
    Top = 424
    object Cds_3DATAID: TStringField
      FieldName = 'DATAID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
    end
    object Cds_3DATAFILE: TStringField
      FieldName = 'DATAFILE'
      FixedChar = True
      Size = 50
    end
    object Cds_3OWNER: TStringField
      FieldName = 'OWNER'
      FixedChar = True
    end
    object Cds_3DATATYPE: TStringField
      FieldName = 'DATATYPE'
      FixedChar = True
      Size = 2
    end
    object Cds_3DATADATE: TStringField
      FieldName = 'DATADATE'
      FixedChar = True
    end
  end
  object Cds_4: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDtl'
    RemoteServer = DM.SockConn
    Left = 544
    Top = 72
  end
  object DSrce_2: TDataSource
    DataSet = Cds_4
    Left = 504
    Top = 72
  end
end
