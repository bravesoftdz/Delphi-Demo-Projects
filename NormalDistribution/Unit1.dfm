object frmMain: TfrmMain
  Left = 242
  Top = 202
  Width = 1024
  Height = 455
  Caption = 'frmMain'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 369
    Width = 1016
    Height = 4
    Cursor = crVSplit
    Align = alBottom
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 1016
    Height = 369
    Align = alTop
    TabOrder = 0
    object imgAxis: TImage
      Left = 2
      Top = 15
      Width = 1000
      Height = 352
      Align = alClient
      Constraints.MaxWidth = 1000
      Constraints.MinWidth = 1000
    end
  end
  object grpControl: TGroupBox
    Left = 0
    Top = 373
    Width = 1016
    Height = 48
    Align = alBottom
    Caption = 'grpControl'
    Constraints.MaxHeight = 48
    Constraints.MinHeight = 24
    TabOrder = 1
    object btnRandG: TButton
      Left = 16
      Top = 16
      Width = 75
      Height = 25
      Caption = 'btnRandG'
      TabOrder = 0
      OnClick = btnRandGClick
    end
    object chkLogFrequency: TCheckBox
      Left = 128
      Top = 16
      Width = 97
      Height = 17
      Caption = 'chkLogFrequency'
      TabOrder = 1
    end
    object chkDrawEdge: TCheckBox
      Left = 240
      Top = 16
      Width = 97
      Height = 17
      Caption = 'chkDrawEdge'
      Checked = True
      Enabled = False
      State = cbChecked
      TabOrder = 2
    end
    object chkDrawLines: TCheckBox
      Left = 344
      Top = 16
      Width = 97
      Height = 17
      Caption = 'chkDrawLines'
      TabOrder = 3
    end
    object cboxCopyMode: TComboBox
      Left = 464
      Top = 16
      Width = 145
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 4
      Text = 'cmBlackness'
      Items.Strings = (
        'cmBlackness'
        'cmDstInvert'
        'cmMergeCopy'
        'cmMergePaint'
        'cmNotSrcCopy'
        'cmNotSrcErase'
        'cmPatCopy'
        'cmPatInvert'
        'cmPatPaint'
        'cmSrcAnd'
        'cmSrcCopy'
        'cmSrcErase'
        'cmSrcInvert'
        'cmSrcPaint'
        'cmWhiteness')
    end
  end
end
