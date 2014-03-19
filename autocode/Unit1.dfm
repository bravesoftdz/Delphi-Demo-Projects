object Form1: TForm1
  Left = 194
  Top = 140
  AutoScroll = False
  Caption = 'Form1'
  ClientHeight = 501
  ClientWidth = 891
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object label2: TLabel
    Left = 16
    Top = 64
    Width = 85
    Height = 13
    AutoSize = False
    Caption = 'ClassName'
  end
  object Label1: TLabel
    Left = 16
    Top = 104
    Width = 85
    Height = 13
    AutoSize = False
    Caption = 'PackageName'
  end
  object cbb1: TComboBox
    Left = 16
    Top = 16
    Width = 185
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    OnChange = cbb1Change
  end
  object btn_1: TButton
    Left = 210
    Top = 16
    Width = 79
    Height = 24
    Caption = 'gettable'
    TabOrder = 1
    OnClick = btn_1Click
  end
  object memo2: TMemo
    Left = 0
    Top = 144
    Width = 537
    Height = 357
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object class_name: TEdit
    Left = 114
    Top = 64
    Width = 120
    Height = 21
    TabOrder = 3
  end
  object btn_Copy: TButton
    Left = 269
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Copy'
    TabOrder = 4
    OnClick = btn_CopyClick
  end
  object AutoXML: TButton
    Left = 296
    Top = 16
    Width = 75
    Height = 25
    Caption = 'AutoXML'
    TabOrder = 5
    OnClick = AutoXMLClick
  end
  object btn_Clear: TButton
    Left = 269
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Clear'
    TabOrder = 6
    OnClick = btn_ClearClick
  end
  object dbgrd1: TDBGrid
    Left = 400
    Top = 0
    Width = 481
    Height = 137
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgrd1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'COLUMN_NAME'
        Title.Caption = 'CODE'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMMENTS'
        Title.Caption = 'NAME'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NULLABLE'
        Title.Caption = 'NULL'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_TYPE'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_LENGTH'
        Title.Caption = 'LEN'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PKEY'
        Width = 35
        Visible = True
      end>
  end
  object package_Name: TEdit
    Left = 112
    Top = 104
    Width = 120
    Height = 21
    TabOrder = 8
    OnChange = package_NameChange
  end
  object AutoClass: TGroupBox
    Left = 774
    Top = 288
    Width = 110
    Height = 205
    Caption = 'AutoClass'
    TabOrder = 9
    object AutoInaction: TButton
      Left = 10
      Top = 20
      Width = 90
      Height = 25
      Caption = 'AutoInaction'
      TabOrder = 0
      OnClick = AutoInactionClick
    end
    object AutoInactionImpl: TButton
      Left = 10
      Top = 50
      Width = 90
      Height = 25
      Caption = 'AutoInactionImpl'
      TabOrder = 1
      OnClick = AutoInactionImplClick
    end
    object AutoApplogic: TButton
      Left = 10
      Top = 80
      Width = 90
      Height = 25
      Caption = 'AutoApplogic'
      TabOrder = 2
      OnClick = AutoApplogicClick
    end
    object AutoApplogicImpl: TButton
      Left = 10
      Top = 110
      Width = 90
      Height = 25
      Caption = 'AutoApplogicImpl'
      TabOrder = 3
      OnClick = AutoApplogicImplClick
    end
    object AutoSdo: TButton
      Left = 10
      Top = 140
      Width = 90
      Height = 25
      Caption = 'AutoSdo'
      TabOrder = 4
      OnClick = AutoSdoClick
    end
    object AutoSdoImpl: TButton
      Left = 10
      Top = 170
      Width = 90
      Height = 25
      Caption = 'AutoSdoImpl'
      TabOrder = 5
      OnClick = AutoSdoImplClick
    end
  end
  object AutoJsp: TGroupBox
    Left = 659
    Top = 288
    Width = 110
    Height = 193
    Caption = 'AutoJsp'
    TabOrder = 10
    object Header: TButton
      Left = 10
      Top = 20
      Width = 90
      Height = 25
      Caption = 'Header'
      TabOrder = 0
      OnClick = HeaderClick
    end
    object AutoForm: TButton
      Left = 10
      Top = 80
      Width = 90
      Height = 25
      Caption = 'AutoForm'
      TabOrder = 1
      OnClick = AutoFormClick
    end
    object AutoGrid: TButton
      Left = 10
      Top = 110
      Width = 90
      Height = 25
      Caption = 'AutoGrid'
      TabOrder = 2
      OnClick = AutoGridClick
    end
    object AutoBtn: TButton
      Left = 10
      Top = 140
      Width = 90
      Height = 25
      Caption = 'AutoBtn'
      TabOrder = 3
      OnClick = AutoBtnClick
    end
    object AutoQueryForm: TButton
      Left = 10
      Top = 50
      Width = 90
      Height = 25
      Caption = 'AutoQueryForm'
      TabOrder = 4
      OnClick = AutoQueryFormClick
    end
  end
  object SelectList: TListBox
    Left = 552
    Top = 144
    Width = 145
    Height = 137
    ItemHeight = 13
    TabOrder = 11
    OnDblClick = SelectListDblClick
  end
  object AutoJs: TGroupBox
    Left = 544
    Top = 288
    Width = 110
    Height = 209
    Caption = 'AutoJs'
    TabOrder = 12
    object AutoJsHeader: TButton
      Left = 10
      Top = 20
      Width = 90
      Height = 25
      Caption = 'AutoJsHeader'
      TabOrder = 0
      OnClick = AutoJsHeaderClick
    end
    object AutoQuery: TButton
      Left = 10
      Top = 50
      Width = 90
      Height = 25
      Caption = 'AutoQuery'
      TabOrder = 1
      OnClick = AutoQueryClick
    end
    object AutoAdd: TButton
      Left = 10
      Top = 80
      Width = 90
      Height = 25
      Caption = 'AutoAdd'
      TabOrder = 2
      OnClick = AutoAddClick
    end
    object AutoDel: TButton
      Left = 10
      Top = 110
      Width = 90
      Height = 25
      Caption = 'AutoDel'
      TabOrder = 3
      OnClick = AutoDelClick
    end
    object AutoOutKey: TButton
      Left = 10
      Top = 140
      Width = 90
      Height = 25
      Caption = 'AutoOutKey'
      TabOrder = 4
      OnClick = AutoOutKeyClick
    end
    object AutoSave: TButton
      Left = 10
      Top = 170
      Width = 90
      Height = 25
      Caption = 'AutoSave'
      TabOrder = 5
      OnClick = AutoSaveClick
    end
  end
  object cbb2: TComboBox
    Left = 712
    Top = 208
    Width = 169
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 13
    OnChange = cbb2Change
  end
  object qry1: TADOQuery
    ConnectionString = 
      'Provider=MSDAORA.1;Password=ehr;User ID=ehr;Data Source=ehr;Pers' +
      'ist Security Info=True'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select a.column_name,b.comments,a.nullable,a.data_type,a.data_le' +
        'ngth,'
      
        '       (select au.constraint_type from user_cons_columns cu, use' +
        'r_constraints au  '
      
        '        where au.constraint_type = '#39'P'#39' and cu.constraint_name = ' +
        'au.constraint_name'
      '              and cu.table_name=a.table_name'
      '              and cu.column_name=a.column_name'
      '       ) as Pkey'
      'from user_tab_columns a,user_col_comments b'
      'where a.table_name=b.table_name'
      '      and a.column_name=b.column_name'
      'order by column_id')
    Left = 431
    Top = 236
  end
  object qry2: TADOQuery
    ConnectionString = 
      'Provider=MSDAORA.1;Password=ehr;User ID=ehr;Data Source=ehr;Pers' +
      'ist Security Info=True'
    Parameters = <>
    Left = 399
    Top = 236
  end
  object DataSource1: TDataSource
    DataSet = qry1
    Left = 463
    Top = 236
  end
end
