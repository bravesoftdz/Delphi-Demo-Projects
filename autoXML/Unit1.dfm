object Form1: TForm1
  Left = 228
  Top = 163
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
  PixelsPerInch = 96
  TextHeight = 13
  object btn_1: TButton
    Left = 570
    Top = 72
    Width = 79
    Height = 24
    Caption = 'gettable'
    TabOrder = 0
    OnClick = btn_1Click
  end
  object memo2: TMemo
    Left = 0
    Top = 0
    Width = 561
    Height = 501
    Align = alLeft
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object dbgrd1: TDBGrid
    Left = 658
    Top = 0
    Width = 233
    Height = 501
    Align = alRight
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgrd1DblClick
  end
  object Clear_btn: TButton
    Left = 570
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Clear_btn'
    TabOrder = 3
    OnClick = Clear_btnClick
  end
  object Copy_Btn: TButton
    Left = 570
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Copy_Btn'
    TabOrder = 4
    OnClick = Copy_BtnClick
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
    DataSet = qry2
    Left = 463
    Top = 236
  end
end
