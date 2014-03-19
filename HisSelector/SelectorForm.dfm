object FormMain: TFormMain
  Left = 41
  Top = 32
  AutoScroll = False
  BorderIcons = [biSystemMenu]
  Caption = 'HisSelector'
  ClientHeight = 401
  ClientWidth = 347
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object edit2: TEdit
    Left = 140
    Top = 40
    Width = 200
    Height = 21
    TabOrder = 0
    OnChange = edit2Change
  end
  object grp1: TGroupBox
    Left = 5
    Top = 0
    Width = 130
    Height = 70
    TabOrder = 1
    object rb1: TRadioButton
      Left = 15
      Top = 15
      Width = 100
      Height = 17
      Caption = #26597#35810#27721#23383#21517#31216
      TabOrder = 0
      OnKeyDown = rb1KeyDown
    end
    object rb2: TRadioButton
      Left = 15
      Top = 40
      Width = 100
      Height = 17
      Caption = #26597#35810#33521#25991#21517#31216
      TabOrder = 1
      OnKeyDown = rb2KeyDown
    end
  end
  object cbb1: TComboBox
    Left = 140
    Top = 12
    Width = 200
    Height = 21
    BevelKind = bkSoft
    Style = csDropDownList
    ImeMode = imDisable
    ItemHeight = 13
    TabOrder = 2
    OnChange = cbb1Change
    OnKeyDown = cbb1KeyDown
  end
  object dbgrd1: TDBGrid
    Left = 5
    Top = 75
    Width = 335
    Height = 321
    TabStop = False
    BiDiMode = bdRightToLeftNoAlign
    Color = clWhite
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    ParentBiDiMode = False
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        ButtonStyle = cbsNone
        Expanded = False
        FieldName = 'chname'
        Title.Caption = #20013#25991#21517#31216
        Width = 145
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'enname'
        Title.Caption = #33521#25991#21517#31216
        Width = 145
        Visible = True
      end>
  end
  object qry1: TADOQuery
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=his.mdb;Persist Sec' +
      'urity Info=False'
    Parameters = <>
    Left = 273
    Top = 231
  end
  object DataSource1: TDataSource
    DataSet = qry1
    Left = 305
    Top = 231
  end
end
