object fmMain: TfmMain
  Left = 197
  Top = 122
  Width = 969
  Height = 579
  Caption = 'SqliteDBInsertToolForExcel'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 223
    Top = 56
    Width = 66
    Height = 13
    Caption = 'Excel file path'
  end
  object Label1: TLabel
    Left = 223
    Top = 96
    Width = 69
    Height = 13
    Caption = 'Sheet In Excel'
  end
  object Label3: TLabel
    Left = 223
    Top = 16
    Width = 55
    Height = 13
    Caption = 'DB file path'
  end
  object Label4: TLabel
    Left = 223
    Top = 136
    Width = 90
    Height = 13
    Caption = 'Table names in DB'
  end
  object editExcelPath: TEdit
    Left = 335
    Top = 52
    Width = 289
    Height = 21
    TabOrder = 0
  end
  object gridMain: TDBGrid
    Left = 8
    Top = 208
    Width = 937
    Height = 329
    DataSource = datasourceMain
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = gridMainDrawColumnCell
    OnTitleClick = gridMainTitleClick
  end
  object cbbTables: TComboBox
    Left = 335
    Top = 132
    Width = 289
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 2
  end
  object btnGetTables: TButton
    Left = 655
    Top = 130
    Width = 75
    Height = 25
    Caption = 'btnGetTables'
    TabOrder = 3
    OnClick = btnGetTablesClick
  end
  object btnSetExcel: TButton
    Left = 655
    Top = 50
    Width = 75
    Height = 25
    Caption = 'btnSetExcel'
    TabOrder = 4
    OnClick = btnSetExcelClick
  end
  object cbbSheets: TComboBox
    Left = 335
    Top = 92
    Width = 289
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 5
  end
  object btnRefreshSheets: TButton
    Left = 655
    Top = 90
    Width = 75
    Height = 25
    Caption = 'btnGetSheets'
    TabOrder = 6
    OnClick = btnRefreshSheetsClick
  end
  object btnShowExcel: TButton
    Left = 327
    Top = 176
    Width = 75
    Height = 25
    Caption = 'btnShowExcel'
    TabOrder = 7
    OnClick = btnShowExcelClick
  end
  object btnInsertData: TButton
    Left = 544
    Top = 184
    Width = 74
    Height = 17
    Caption = 'btnInsertData'
    TabOrder = 8
    OnClick = btnInsertDataClick
  end
  object editDBPath: TEdit
    Left = 335
    Top = 12
    Width = 289
    Height = 21
    TabOrder = 9
  end
  object btnSetDB: TButton
    Left = 655
    Top = 10
    Width = 75
    Height = 25
    Caption = 'btnSetDB'
    TabOrder = 10
    OnClick = btnSetDBClick
  end
  object datasourceMain: TDataSource
    DataSet = datasetMain
    Left = 112
    Top = 443
  end
  object queryTables: TADOQuery
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Data Source=DICOT' +
      'A'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from sqlite_master')
    Left = 80
    Top = 443
  end
  object dlgopenExcelPath: TOpenDialog
    Left = 16
    Top = 475
  end
  object conMain: TADOConnection
    LoginPrompt = False
    Mode = cmRead
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 16
    Top = 443
  end
  object datasetMain: TADODataSet
    Parameters = <>
    Left = 48
    Top = 443
  end
  object dlgopenDBPath: TOpenDialog
    Left = 144
    Top = 443
  end
end
