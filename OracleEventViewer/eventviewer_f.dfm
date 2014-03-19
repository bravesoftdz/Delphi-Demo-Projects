object Form1: TForm1
  Left = 213
  Top = 150
  Width = 1020
  Height = 481
  Caption = 'OracleEventViewer'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Mem_1: TMemo
    Left = 5
    Top = 320
    Width = 1000
    Height = 121
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
    OnDblClick = Mem_1DblClick
  end
  object Grp1: TGroupBox
    Left = 5
    Top = 5
    Width = 1000
    Height = 45
    TabOrder = 1
    DesignSize = (
      1000
      45)
    object Lb_1: TLabel
      Left = 15
      Top = 13
      Width = 90
      Height = 21
      Alignment = taRightJustify
      Anchors = [akBottom]
      AutoSize = False
      Caption = #25968#25454#24211#26381#21153#21517
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object Lb_2: TLabel
      Left = 185
      Top = 13
      Width = 55
      Height = 21
      Alignment = taRightJustify
      Anchors = [akBottom]
      AutoSize = False
      Caption = #30331#38470#36134#21495
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object Lb_3: TLabel
      Left = 340
      Top = 13
      Width = 55
      Height = 21
      Alignment = taRightJustify
      Anchors = [akBottom]
      AutoSize = False
      Caption = #30331#38470#23494#30721
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object Lb_4: TLabel
      Left = 495
      Top = 13
      Width = 55
      Height = 21
      Alignment = taRightJustify
      Anchors = [akBottom]
      AutoSize = False
      Caption = #31579#36873#36134#25143
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object Lb_5: TLabel
      Left = 680
      Top = 13
      Width = 55
      Height = 21
      Alignment = taRightJustify
      Anchors = [akBottom]
      AutoSize = False
      Caption = #31579#36873#36827#31243
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object Edt_srv: TEdit
      Left = 110
      Top = 13
      Width = 70
      Height = 21
      TabOrder = 0
      OnExit = Edt_srvExit
    end
    object Edt_act: TEdit
      Left = 245
      Top = 13
      Width = 90
      Height = 21
      TabOrder = 1
      OnExit = Edt_actExit
    end
    object Edt_pwd: TEdit
      Left = 400
      Top = 13
      Width = 90
      Height = 21
      TabOrder = 2
      OnExit = Edt_pwdExit
    end
    object CBox_usr: TComboBox
      Left = 555
      Top = 13
      Width = 120
      Height = 21
      ItemHeight = 13
      TabOrder = 3
      OnChange = CBox_usrChange
    end
    object CBox_prs: TComboBox
      Left = 740
      Top = 13
      Width = 120
      Height = 21
      ItemHeight = 13
      TabOrder = 4
      OnChange = CBox_prsChange
    end
    object Btn_Refresh: TButton
      Left = 880
      Top = 13
      Width = 105
      Height = 21
      Caption = #21047#26032
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = Btn_RefreshClick
    end
  end
  object EDBGrd_1: TDBGrid
    Left = 5
    Top = 64
    Width = 1000
    Height = 250
    DataSource = Dsource_1

    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        FieldName = 'SQL_TEXT'
        Title.Caption = 'SQL_Command'
        Width = 670
      end
      item
        FieldName = 'PARSING_SCHEMA_NAME'
        Title.Caption = 'Current_User'
        Width = 100
      end
      item
        FieldName = 'MODULE'
        Title.Caption = 'Current_Process'
        Width = 100
      end
      item
        FieldName = 'LAST_ACTIVE_TIME'
        Title.Caption = 'Active_Time'
        Width = 100
      end>
  end
  object Dsource_1: TDataSource
    DataSet = ADOQry_1
    Left = 508
    Top = 209
  end
  object ADOQry_1: TADOQuery
    ConnectionString = 
      'Provider=MSDAORA.1;Password=ehr;User ID=ehr;Data Source=ehr;Pers' +
      'ist Security Info=True'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select sql_text,sql_fulltext,parsing_schema_name,module,last_act' +
        'ive_time from v$sqlarea order by last_active_time desc')
    Left = 476
    Top = 209
  end
  object ADOQry_2: TADOQuery
    Parameters = <>
    Left = 444
    Top = 209
  end
  object tmr1: TTimer
    Interval = 150
    OnTimer = tmr1Timer
    Left = 540
    Top = 209
  end
end
