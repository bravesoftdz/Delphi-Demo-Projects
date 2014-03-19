unit ypck_u;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TFlatEditUnit, StdCtrls, TFlatComboBoxUnit, FlatComboBoxCode, FFloatdit,
  TFlatPanelUnit, FlatSelEdit, Grids, DBGridEh, ExtCtrls, DictIpt, DB,
  DBClient, Share_u, UserFunc_u, ShareMsg_u,StatusBarEx, StrUtils, Variants,
  INIFiles;

type
  TRkxx = record
    case Detail: Boolean of
    true:
    (
      xh:   Array[0..1] of char;        //1,2
      ypbm: Array[0..13] of Char;       //3,14
      ypgg: Array[0..19] of Char;       //17,20
      ypdw: Array[0..7] of Char;        //37,8
      sl: Array[0..11] of Char;         //45,12
      bzgg: Array[0..29] of Char;       //57,30
      ph: Array[0..19] of Char;         //87,20
      yxq: Array[0..9] of Char;        //107,10
      zk: Array[0..11] of Char;         //117,12
      cj: Array[0..9] of Char;          //129,10
      bzdw: Array[0..7] of Char;        //139,8
      nhbz1: Array[0..11] of Char;      //147,12
      Nh1dw: Array[0..7] of Char;       //159,8
      Nhbz2: Array[0..11] of Char;      //167,12
      Nh2dw: Array[0..7] of Char;       //179,8
      dgj: Array[0..11] of Char;        //187,12       //出入库价
      jgfs: Array[0..7] of Char;        //199,8
      rkdh: Array[0..15] of Char;       //207,16
      scpfj: Array[0..11] of Char;      //223,12
      sclsj: Array[0..11] of Char;      //235,12
      ckbzj: Char;                      //247,1
      Cbj: Array[0..11] of Char;        //248,12      //成本价
      jbcjbs: Array[0..9] of Char;      //260,10
      Kzgg: Array[0..29] of Char;       //270,30
      Kzph: Array[0..15] of char;       //300,16     //护展批号
    );
    false:
    (
      MstInfo: Array[0..314] of Char;
    )
  end;
  TYPCK_FM = class(TFrame)
    Pnl_Grd: TPanel;
    dbgMst: TDBGridEh;
    edt_ypmc: TFlatSelEdit;
    Edt_Ph: TFlatSelEdit;
    cbx_ypgg: TFlatComboBoxCode;
    Cds_1: TClientDataSet;
    ds_1: TDataSource;
    Dpt: TDictIpt;
    Panel2: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label9: TLabel;
    edt_bzgg: TFlatEdit;
    edt_ypjx: TFlatEdit;
    edt_bzdw: TFlatEdit;
    edt_scpfj: TFloatEdit;
    edt_sclsj: TFloatEdit;
    edt_je: TFloatEdit;
    edt_zk: TFloatEdit;
    edt_cj: TFlatEdit;
    lblZk: TLabel;
    cbx_dw: TFlatComboBoxCode;
    pnl_sl1: TFlatPanel;
    edt_sl1: TFloatEdit;
    lbl_dw1: TLabel;
    edt_sl2: TFloatEdit;
    lbl_dw2: TLabel;
    pnl_sl: TFlatPanel;
    edt_sl: TFloatEdit;
    lbl_dw: TLabel;
    cbx_czfl: TFlatComboBoxCode;
    Cds_1xh: TSmallintField;
    Cds_1ypbm: TStringField;
    Cds_1ypmc: TStringField;
    Cds_1ypgg: TStringField;
    Cds_1ypdw: TStringField;
    Cds_1ypjx: TStringField;
    Cds_1sl: TFloatField;
    Cds_1bzgg: TStringField;
    Cds_1dgj: TFloatField;
    Cds_1ph: TStringField;
    Cds_1scpfj: TFloatField;
    Cds_1sclsj: TFloatField;
    Cds_1zk: TFloatField;
    Cds_1bzdw: TStringField;
    Cds_1Nhbz1: TFloatField;
    Cds_1Nh1dw: TStringField;
    Cds_1Nhbz2: TFloatField;
    Cds_1Nh2dw: TStringField;
    Cds_1cjmc: TStringField;
    Cds_1cjdm: TStringField;
    Cds_1bzjs: TSmallintField;
    Cds_1Jgfs: TStringField;
    Cds_1rkdh: TStringField;
    Cds_1bzgg1: TStringField;
    Cds_1ckdw: TStringField;
    Cds_1ckbz: TIntegerField;
    Cds_1Jhj: TFloatField;
    Cds_1czdm: TStringField;
    Cds_1jbcjbs: TStringField;
    Cds_1czfl: TStringField;
    Cds_1SL1: TIntegerField;
    Cds_1SL2: TIntegerField;
    Cds_1ggdw: TStringField;
    Cds_1je: TFloatField;
    Cds_1bzsl: TStringField;
    Cds_1yxq: TStringField;
    Cds_1PFJE: TFloatField;
    Cds_1Lsje: TFloatField;
    Cds_1cbj: TFloatField;
    Cds_1ckj: TFloatField;
    Cds_1ckjs: TStringField;
    Cds_1Kzgg: TStringField;
    Cds_1Kzph: TStringField;
    Label1: TLabel;
    edt_Kzgg: TFlatEdit;
    cds_czfl: TClientDataSet;
    procedure edt_ypmcClick(Sender: TObject);
    procedure cbx_ypggChange(Sender: TObject);
    procedure cbx_ypggKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edt_PhClick(Sender: TObject);
    procedure Edt_PhKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Cds_1AfterPost(DataSet: TDataSet);
    procedure Cds_1CalcFields(DataSet: TDataSet);
    procedure dbgMstCellClick(Column: TColumnEh);
    procedure edt_ypmcDownClick(Sender: TObject);
    procedure cbx_dwKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbx_dwChange(Sender: TObject);
    procedure edt_ypmcEnter(Sender: TObject);
    procedure cbx_ypggEnter(Sender: TObject);
    procedure Edt_PhEnter(Sender: TObject);
    procedure edt_ypmcKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbx_dwEnter(Sender: TObject);
    procedure pnl_sl1Enter(Sender: TObject);
    procedure edt_slChange(Sender: TObject);
    procedure edt_slEnter(Sender: TObject);
    procedure edt_slKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Cds_1AfterScroll(DataSet: TDataSet);
    procedure cbx_czflEnter(Sender: TObject);
    procedure cbx_czflChange(Sender: TObject);
    procedure cbx_czflKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Cds_1PostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
  private
    blInit: Boolean;
    defdrugclscode,defdrugclsname: String;
    slfgf: String;
    procedure QueryAmount(StrYpbm: String; Const blAll: Boolean= true);
    procedure ClearYpgg;
  public
    StrXzczfl: String;  //1--允许选择材质分类
    blPrn: Boolean;
    Strkf: String;
    dwfl: Integer;
    StrJgfs: String;
    Stbr_xx: TStatusBarEx;
    blInOut: Boolean;
    StrCzfl: String;
    StrCkmx1, StrCkmx2, StrCkmx3, StrCkmx4, StrCkmx5: String;
    StrLx: String; //1-存取药
    function GetStrInfo: String;
    function checkRow: Boolean;

    procedure SetPosition(ARect : TRect;Com : TWinControl);//设置控件坐标
    procedure SetVisible(Sender : TWinControl); //设置控件显示
    procedure SetInput;
    procedure SetCdsVal(const blClear: Boolean=false);
    procedure SetBillVal(StrDjh: String; Const blOutBill: Boolean= true);
    procedure SetEdtval;
    procedure SetFrameInfo;
    procedure GotoCdsFirst;
  end;

implementation

uses dm_u, yckxz_u;

{$R *.dfm}

{ TYPCK_FM }

procedure TYPCK_FM.SetCdsVal(const blClear: Boolean);
var
  i: Integer;
  rCkjg: real;
begin
  with dm.Cds_Com3 do
  begin
    Cds_1.Edit;
    if not blClear then
    begin
      Cds_1.FieldbyName('jgfs').AsString:= StrJgfs;
      Cds_1.FieldByName('ypdw').AsString:= FieldByName('ypdw').AsString;
      Cds_1.FieldByName('jhj').AsString:= FieldByName('jhj').AsString;
      Cds_1.FieldByName('cbj').AsString:= FieldByName('cbj').AsString;
      Cds_1.FieldByName('ph').AsString:= FieldBYName('ph').AsString;
      Cds_1.FieldByName('bzgg').AsString:= FieldByName('bzgg').AsString;
      Cds_1.FieldByName('bzdw').AsString:= FieldByName('bzdw').AsString;
      Cds_1.FieldByName('nhbz1').AsString:= FieldByName('nhbz1').AsString;
      Cds_1.FieldByName('nh1dw').AsString:= FieldByName('nh1dw').AsString;
      Cds_1.FieldByName('nhbz2').AsString:= FieldByName('nhbz2').AsString;
      Cds_1.FieldByName('nh2dw').AsString:= FieldByName('nh2dw').AsString;
      Cds_1.FieldByName('Cjdm').AsString:= FieldByName('cjbs').AsString;
      Cds_1.FieldByName('Rkdh').AsString:= FieldByName('Rkdh').AsString;
      Cds_1.FieldByName('Yxq').AsString:= ifthen(FieldByName('yxq').AsString='','',FormatDateTime('yyyy-mm-dd',FieldByName('Yxq').AsDateTime));
      Cds_1.FieldByName('cjmc').AsString:= FieldByName('cjmc').AsString;
      Cds_1.FieldByName('scpfj').AsString:= FieldByName('scpfj').AsString;
      Cds_1.FieldByName('sclsj').AsString:= FieldByName('sclsj').AsString;
      Cds_1.FieldByName('ypjx').AsString:= FieldByName('ypjx').AsString;
      Cds_1.FieldByName('bzgg1').AsString:= FieldByName('bzgg1').AsString;
      Cds_1.FieldByName('Kzgg').AsString:= FieldByName('Kzgg').AsString;
      Cds_1.FieldByName('Kzph').AsString:= FieldByName('Kzph').AsString;
      if blInout then //入库单
        case ImportPrice of
          0: Cds_1.FieldByName('dgj').AsString:= FieldByName('scpfj').AsString;
          1: Cds_1.FieldByName('dgj').AsString:= FieldByName('sclsj').AsString;
          2: Cds_1.FieldByName('dgj').AsString:= FieldByName('jhj').AsString;
        end
      else
        case ExportPrice of
          0: Cds_1.FieldByName('dgj').AsString:= FieldByName('scpfj').AsString;
          1: Cds_1.FieldByName('dgj').AsString:= FieldByName('sclsj').AsString;
          2: Cds_1.FieldByName('dgj').AsString:= FieldByName('cbj').AsString;
        end;
      if blInOut then
        case ImportPrice of
          0: rCkjg:= Cds_1Scpfj.AsFloat;
          1: rCkjg:= Cds_1Sclsj.AsFloat;

          2: rCkjg:= dm.Cds_Com3.FieldByName('jhj').AsFloat;
        end
      else
        case ExportPrice of
          0: rCkjg:= Cds_1Scpfj.AsFloat;
          1: rCkjg:= Cds_1Sclsj.AsFloat;

          2: rCkjg:= dm.Cds_Com3.FieldByName('cbj').AsFloat;
        end;
      Cds_1Ckj.AsFloat:= rCkjg;
      Cds_1Ckjs.AsString:= ifThen(Cds_1Bzdw.AsString<>'',FormatFloat('0.0000',Cds_1Ckj.AsFloat)+'/'+Cds_1Bzdw.AsString,'');
      //else
      //  Cds_1Ckj.AsFloat:= Cds_1Dgj.AsFloat;
      cds_1.FieldByName('jbcjbs').AsString:= FieldByName('jbcjbs').AsString;
      cbx_dw.ItemInput.Clear;
      cbx_dw.Items.Clear;
      cbx_dw.ItemCodes.Clear;
      i:= 1;
      if (FieldByName('nh2dw').AsString<> '') then
      begin
        cbx_dw.ItemInput.Add(IntToStr(i));
        inc(i);
        cbx_dw.Items.Add(FieldByName('nh2dw').AsString);
        cbx_dw.ItemCodes.Add('2');
      end;
      if (FieldByName('nh1dw').AsString<> '') then
      begin
        cbx_dw.ItemInput.Add(IntToStr(i));
        inc(i);
        cbx_dw.Items.Add(FieldByName('nh1dw').AsString);
        cbx_dw.ItemCodes.Add('1');
      end;
      cbx_dw.ItemInput.Add(IntToStr(i));
      cbx_dw.Items.Add(FieldByName('ypdw').AsString);
      cbx_dw.ItemCodes.Add('0');
      Cds_1.FieldByName('ckdw').AsString:= cbx_dw.Items.Strings[0];
      Cds_1.FieldByName('ckbz').AsString:= cbx_dw.ItemCodes.Strings[0];
    end
    else
    begin
      clearYpgg;
    end;
  end;
end;

procedure TYPCK_FM.SetInput;
var
  ACol ,ARow: Longint;
  r: TRect;
begin
  ACol := dbgMst.Col;
  ARow := dbgMst.Row + 1;
  GetCellRectU(r,dbgMst);
  //设置显示控件
  SetVisible(TWinControl(dbgMst));
  case ACol of
    2:
    begin
      if StrXzczfl<>'1' then exit;
      //if defdrugclsCode='!' then exit;
      cbx_czfl.ItemIndex:= cbx_czfl.Items.IndexOf(Cds_1czfl.AsString);
      setPosition(r,cbx_czfl);
    end;
    3:
    begin
      edt_ypmc.Text:= Cds_1.FieldByName('ypmc').AsString;
      SetPosition(r,edt_ypmc);
    end;
    4:
    begin
      if Cds_1.FieldByName('ypbm').AsString = '' then exit;
      cbx_ypgg.ItemIndex:= cbx_ypgg.Items.IndexOf(Cds_1.FieldByName('ypgg').AsString);
      SetPosition(r,cbx_ypgg);
    end;
    5:
    begin
      if Cds_1.FieldByName('ypgg').AsString = '' then exit;
      edt_ph.Text:= Cds_1.FieldByName('ph').AsString;
      SetPosition(r,edt_ph);
    end;
    {6:
    begin
      if Cds_1.FieldByName('ypgg').AsString = '' then exit;
      cbx_dw.ItemIndex:= cbx_dw.Items.IndexOf(Cds_1.FieldByName('ckdw').AsString);
      SetPosition(r,cbx_dw);
    end; }
    6:
    begin
      if Cds_1.FieldByName('ph').AsString = '' then exit;
      
      if (dwfl=1) and (Cds_1Nhbz1.AsInteger>=1) then
      begin
        edt_sl1.Text:= Cds_1.FieldByName('sl1').AsString;
        edt_sl2.Text:= Cds_1.FieldBYName('sl2').AsString;
        lbl_dw1.Caption:= Cds_1.FieldByName('bzdw').AsString;
        lbl_dw2.Caption:= Cds_1.FieldByName('ypdw').AsString;
        SetPosition(r,pnl_sl1);
        edt_sl1.SetFocus;
      end
      else
      begin
        edt_sl.Text:= Cds_1.FieldByName('sl1').AsString;
        lbl_dw.Caption:= Cds_1.FieldBYName('bzdw').AsString;
        SetPosition(r,pnl_sl);
        edt_sl.SetFocus;
      end;
      {edt_sl.Text:= Cds_1.FieldByName('sl').AsString;
      SetPosition(r,edt_sl);}
    end;
  end;

end;

procedure TYPCK_FM.SetPosition(ARect: TRect; Com: TWinControl);
begin
  SetVisible(Com);
  SetPositionU(ARect,Com);
end;

procedure TYPCK_FM.SetVisible(Sender: TWinControl);
begin
  edt_ypmc.Visible:= false;
  cbx_ypgg.Visible:= false;
  pnl_sl.Visible:= false;
  pnl_sl1.Visible:= false;
  edt_ph.Visible:= false;
  cbx_dw.Visible:= false;
  cbx_czfl.Visible:= false;
end;

procedure TYPCK_FM.edt_ypmcClick(Sender: TObject);
var
  ypbm: String;
  i: Integer;
  czfl: String;
begin
  czfl:= StrCzfl;//ifThen(cds_1czdm.AsString='',defdrugclsCode,Cds_1czdm.AsString);
  if czfl='!' then
    czfl:= ''
  else
    czfl:= '[czfl]='''+czfl+'''';
  if StrLx='1' then
  begin
    if not ShowDictIpt(Dpt,TWinControl(Edt_ypmc),ExePath+'Dict\yfypzd.xml',ypbm,Screen) then
      exit;
  end
  else
  begin
    if not ShowDictIpt(Dpt,TWinControl(Edt_ypmc),ExePath+'Dict\yp_zd_mc.xml',ypbm,Screen,czfl) then
      exit;
  end;
  czfl:= dpt.GetValue('czfl');
  with Cds_1 do
  begin
    QueryAmount(ypbm);
    Edit;
    FieldByName('ypbm').AsString:= ypbm;
    FieldByName('ypmc').AsString:= Edt_ypmc.Text;
    FieldByName('czdm').AsString:= czfl;

  end;
  dm.Cds_Com3.Filter:= '';
  with dm.Cds_Com3 do
  begin
    case RecordCount of
      0:
      begin
        Cds_1.Edit;
        Cds_1.FieldByName('ypbm').AsString:= '';
        Cds_1.FieldByName('ypmc').AsString:= '';
        Cds_1.Post;
        SetCdsVal(true);
        MsgInfo('库房没有该药品',1);
        exit;
      end;
    else
      First;
      Case RecordCount of
        1:
        begin
          Cds_1.Edit;
          Cds_1.FieldByName('ypgg').AsString:= FieldByName('ypgg').AsString;

          SetCdsVal;
          SetEdtval;
          dbgMst.SelectedIndex:= 5;
        end;
      else
        SetCdsVal(true);
        case cbx_ypgg.Items.Count of
          1:
          begin
            Cds_1.Edit;
            Cds_1.FieldByName('ypgg').AsString:= FieldByName('ypgg').AsString;
            dbgMst.SelectedIndex:= 4;
          end;
        else
          dbgMst.SelectedIndex:= 3;
        end;
      end;
      SetInput;
    end;
  end;
end;

procedure TYPCK_FM.cbx_ypggChange(Sender: TObject);
begin
  with Cds_1 do
  begin
    Edit;
    FieldByName('ypgg').AsString:= cbx_ypgg.Text;
    FieldByName('ypbm').AsString:= cbx_ypgg.ItemCodes.Strings[cbx_ypgg.ItemIndex];
  end;
  with dm.Cds_Com3 do
  begin
    Filtered:= true;
    Filter:= '[ypbm]='''+cbx_ypgg.ItemCodes.Strings[cbx_ypgg.ItemIndex]
      +''' and [ypgg]='''+cbx_ypgg.Text+'''';
    First;
    if RecordCount = 1 then
      SetCdsVal
    else
    begin
      dbgMst.SelectedIndex:= 4;
      SetInput;
    end;
  end;
end;

procedure TYPCK_FM.cbx_ypggKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    VK_RETURN:
    begin
      if ssShift in Shift then
        SendMessage((Sender as TWinControl).Handle,WM_KEYDOWN,VK_ESCAPE,0)
      else
      begin
        if dm.Cds_Com3.RecordCount = 1 then
          dbgMst.SelectedIndex:= 5
        else
          dbgMst.SelectedIndex:= 4;
        SetInput;
      end;
    end;
    VK_ESCAPE:
    begin
      dbgMst.SelectedIndex:= 2;
      SetInput;
    end;
  end;
end;

procedure TYPCK_FM.Edt_PhClick(Sender: TObject);
begin
  if not dm.Cds_Com3.Active then
  begin
    MsgInfo('请选择药品规格',1);
    dbgMst.SelectedIndex:= 3;
    SetInput;
    exit;
  end;
  if not Assigned(yckxz_f) then
    yckxz_f:= TYckxz_f.Create(Application);
  with yckxz_f do
  begin
    Top:= self.Parent.Top+self.Top+ Edt_Ph.Top+20;
    Left:= self.Parent.Left+self.Left+Edt_Ph.Left;
    ShowModal;
    if not BlOK then exit;
    SetCdsVal;
    SetEdtval;
  end;
  dbgMst.SelectedIndex:= 5;
  SetInput;
end;

procedure TYPCK_FM.Edt_PhKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    VK_RETURN:
    begin
      if ssShift in Shift then
        SendMessage((Sender as TWinControl).Handle,WM_KEYDOWN,VK_ESCAPE,0)
      else
      begin
        dbgMst.SelectedIndex:= 5;
        SetInput;
      end;
    end;
    VK_ESCAPE:
    begin
      dbgMst.SelectedIndex:= 3;
      SetInput;
    end;
  end;
end;

function TYPCK_FM.checkRow: Boolean;
begin
  result:= true;
  with cds_1 do
  begin
    if (FieldByName('ypbm').AsString = '') or (FieldByName('ph').AsString = '')
      or (FieldByName('sl').AsFloat = 0) or (FieldByName('ypgg').AsString = '') then
    result:= false;
  end;
end;

function TYPCK_FM.GetStrInfo: String;
var
  rkxx: TRkxx;
  Strtmp: String;
  i: Integer;
begin
  Cds_1.AutoCalcFields:= false;
  result:= '';
  StrCkmx1:= '';
  StrCkmx2:= '';
  StrCkmx3:= '';
  StrCkmx4:= '';
  StrCkmx5:= '';
  i:= 1;
  with Cds_1 do
  begin
    First;
    while not eof do
    begin
      if not checkRow then
      begin
        MsgInfo('明细行（'+IntToStr(RecNO)+'）有错',2);
        result:= '';
        break;
      end;
      CopyArr(rkxx.xh,FieldByName('xh').AsString,' ');
      CopyArr(rkxx.ypbm,FieldByName('ypbm').AsString,' ');
      CopyArr(rkxx.ypgg,FieldByName('ypgg').AsString,' ');
      CopyArr(rkxx.ypdw,FieldByName('ypdw').AsString,' ');
      CopyArr(rkxx.sl,FormatFloat('0.0000',FieldByName('sl').AsFloat),' ');
      CopyArr(rkxx.bzgg,FieldByName('bzgg').AsString,' ');
      CopyArr(rkxx.ph,FieldByName('ph').AsString,' ');
      CopyArr(rkxx.yxq,FieldByName('yxq').AsString,' ');
      CopyArr(rkxx.zk,FormatFloat('0.00',FieldByName('zk').AsFloat),' ');
      CopyArr(rkxx.cj,FieldByName('cjdm').AsString,' ');
      CopyArr(rkxx.bzdw,FieldByName('bzdw').AsString,' ');
      CopyArr(rkxx.Nhbz1,FieldByName('Nhbz1').AsString,' ');
      CopyArr(rkxx.Nh1dw,FieldByName('Nh1dw').AsString,' ');
      CopyArr(rkxx.Nhbz2,FieldByName('Nhbz2').AsString,' ');
      CopyArr(rkxx.Nh2dw,FieldByName('Nh2dw').AsString,' ');
      CopyArr(rkxx.dgj,FormatFloat('0.0000',FieldByName('ckj').AsFloat),' ');
      CopyArr(rkxx.Jgfs,FieldByName('Jgfs').AsString,' ');
      CopyArr(rkxx.rkdh,FieldByName('rkdh').AsString,' ');
      CopyArr(rkxx.Scpfj,FormatFloat('0.0000',FieldByName('Scpfj').AsFloat),' ');
      CopyArr(rkxx.Sclsj,FormatFloat('0.0000',FieldByName('Sclsj').AsFloat),' ');
      rkxx.ckbzj:= FieldByName('ckbz').AsString[1];
      CopyArr(rkxx.cbj,FormatFloat('0.0000',FieldByName('cbj').AsFloat),' ');
      CopyArr(rkxx.jbcjbs,FieldByName('jbcjbs').AsString,' ');
      CopyArr(rkxx.Kzgg,FieldByName('Kzgg').AsString,' ');
      CopyArr(rkxx.Kzph,FieldByName('Kzph').AsString,' ');
      case i of
        1..10:
          StrCkmx1:= StrCkmx1+rkxx.MstInfo;
        11..20:
          StrCkmx2:= StrCkmx2+rkxx.MstInfo;
        21..30:
          StrCkmx3:= StrCkmx3+rkxx.MstInfo;
        31..40:
          StrCkmx4:= StrCkmx4+rkxx.MstInfo;
        41..49:
          StrCkmx5:= StrCkmx5+rkxx.MstInfo;
      end;
      inc(i);
      //result:= result+rkxx.MstInfo;
      next;
    end;
  end;
  Cds_1.AutoCalcFields:= true;
end;

procedure TYPCK_FM.Cds_1AfterPost(DataSet: TDataSet);
begin
  with Cds_1 do
  begin
    if FieldByName('xh').AsInteger<= 0 then
    begin
      Edit;
      FieldByName('xh').AsInteger:= RECNO;
      Post;
    end;
  end;
end;

procedure TYPCK_FM.Cds_1CalcFields(DataSet: TDataSet);
var
  rCkjg: Real;
  Bzsl: Integer;
begin
  //if blPrn then exit;
  Bzsl:= GetYpslFromBz(Cds_1);
  Cds_1Sl1.AsInteger:= Cds_1Sl.AsInteger div Bzsl;
  Cds_1Sl2.AsInteger:= Cds_1Sl.AsInteger mod Bzsl;
  Cds_1Bzsl.AsString:= ifThen(Cds_1Sl1.AsInteger >0,Cds_1SL1.AsString+Cds_1Bzdw.AsString,'')
    +ifThen(((Cds_1Sl1.AsInteger >0) and (Cds_1Sl2.AsInteger > 0)),slfgf,'')
    +ifThen(Cds_1Sl2.AsInteger>0,Cds_1Sl2.AsString+Cds_1Ypdw.AsString,'');
  Cds_1ggdw.AsString:= Cds_1ypgg.AsString+'/'+cds_1YPdw.AsString;
  
  
  Cds_1Je.AsString:= FormatFloat('0.00',Cds_1SL1.AsFloat*Cds_1Ckj.AsFloat+Cds_1Sl2.AsFloat*(Cds_1Ckj.AsFloat/Bzsl));
  Cds_1PfJe.AsString:= FormatFloat('0.00',Cds_1SL1.AsFloat*Cds_1Cbj.AsFloat+Cds_1Sl2.AsFloat*(Cds_1Cbj.AsFloat/Bzsl));
  Cds_1LsJe.AsString:= FormatFloat('0.00',Cds_1SL1.AsFloat*Cds_1Sclsj.AsFloat+Cds_1Sl2.AsFloat*(Cds_1Sclsj.AsFloat/Bzsl));
  cds_1czfl.AsString:= cbx_czfl.Items.Strings[cbx_czfl.ItemCodes.IndexOf(cds_1Czdm.AsString)];
end;

procedure TYPCK_FM.dbgMstCellClick(Column: TColumnEh);
begin
  SetInput;
end;

procedure TYPCK_FM.edt_ypmcDownClick(Sender: TObject);
begin
  if UpgradeSigleFile(4,exePath+'Dict\','yp_zd_mc.xml','0') then
    MsgInfo('下载药品字典成功',1)
  else
    MsgInfo('下载药品字典失败',2);
end;

procedure TYPCK_FM.SetBillVal(StrDjh: String; Const blOutBill: Boolean);
begin
  Cds_1.AfterScroll:= nil;
  blInit:= true;
  with dm.Cds_Qry do
  begin
    Close;
    if blOutBill then
      CommandText:= 'select * from yp_ckmxl_view where ckdh='''+StrDjh+''''
    else
      CommandText:= 'select * from yp_rkmxl_view where rkdh='''+StrDjh+'''';
    Open;
    while not eof do
    begin
      Cds_1.Append;
      Cds_1.FieldByName('xh').AsString:= FieldByName('xmxh').AsString;
      Cds_1.FieldByName('ypmc').AsString:= FieldByName('ypmc').AsString;
      Cds_1.FieldByName('ypbm').AsString:= FieldByName('ypbm').AsString;
      Cds_1.FieldByName('ypgg').AsString:= FieldByName('ypgg').AsString;
      Cds_1.FieldByName('ypdw').AsString:= FieldByName('ypdw').AsString;
      Cds_1.FieldByName('sl').AsString:= FieldByName('sl').AsString;
      if blOutBill then
      begin
        Cds_1.FieldByName('dgj').AsString:= FieldByName('ckj').AsString
      end
      else
        Cds_1.FieldByName('dgj').AsString:= FieldByName('jhj').AsString;

      Cds_1.FieldByName('ph').AsString:= FieldByName('ph').AsString;
      Cds_1.FieldByName('yxq').AsString:= FieldByName('yxq').AsString;
      Cds_1.FieldByName('ypjx').AsString:= FieldByName('ypjx').AsString;
      Cds_1.FieldByName('bzgg').AsString:= FieldByName('bzgg').AsString;
      Cds_1.FieldByName('scpfj').AsString:= FieldByName('scpfj').AsString;
      Cds_1.FieldByName('sclsj').AsString:= FieldByName('sclsj').AsString;
      Cds_1.FieldByName('cjdm').AsString:= FieldByName('cjbs').AsString;
      Cds_1.FieldByName('cjmc').AsString:= FieldByName('csmc').AsString;
      Cds_1.FieldByName('bzdw').AsString:= FieldByName('bzdw').AsString;
      Cds_1.FieldByName('bzjs').AsInteger:= 0;
      Cds_1.FieldByName('nhbz1').AsString:= FieldByName('nhbz1').AsString;
      Cds_1.FieldByName('nh1dw').AsString:= FieldByName('nh1dw').AsString;
      if FieldByName('nh1dw').AsString<>'' then
        Cds_1.FieldByName('bzjs').AsInteger:= 1;
      Cds_1.FieldByName('nhbz2').AsString:= FieldByName('nhbz2').AsString;
      Cds_1.FieldByName('nh2dw').AsString:= FieldByName('nh2dw').AsString;
      Cds_1.FieldByName('bzgg1').AsString:= FieldByName('Bzgg1').AsString;
      if FieldByName('nh2dw').AsString<>'' then
        Cds_1.FieldByName('bzjs').AsInteger:= 2;
      Cds_1.FieldByName('ckdw').AsString:= FieldByName('ckdw').AsString;
      Cds_1.FieldByName('ckbz').AsString:= FieldByName('ckbzj').AsString;
      Cds_1.FieldByName('jhj').AsString:= FieldByName('cbj').AsString;
      Cds_1.FieldByName('czdm').AsString:= FieldByName('czfl').AsString;
      cds_1.FieldByName('jbcjbs').AsString:= FieldByName('jbcjbs').AsString;
      cds_1.FieldByName('cbj').AsString:= FieldByName('cbj').AsString;
      cds_1.FieldByName('Kzgg').AsString:= FieldByName('Kzgg').AsString;
      cds_1.FieldByName('Kzph').AsString:= FieldByName('Kzph').AsString;
      if blOutBill then
        cds_1.FieldByName('ckj').AsString:= FieldByName('ckj').AsString
      else
        cds_1.FieldByName('ckj').AsString:= FieldByName('jhj').AsString;
      Cds_1Ckjs.AsString:= ifThen(Cds_1Bzdw.AsString<>'',FormatFloat('0.0000',Cds_1Ckj.AsFloat)+'/'+Cds_1Bzdw.AsString,'');
      cds_1.Post;
      next;
    end;
    Close;
    if (Cds_1.State = dsEdit) or (Cds_1.State=dsInsert) then
      Cds_1.Post;
    Cds_1.AfterScroll:= Cds_1AfterScroll;
    Cds_1.First;


  end;
  dbgMst.SumList.Active:= true;
  blInit:= false;
end;

procedure TYPCK_FM.cbx_dwKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
    begin
      dbgMst.SelectedIndex:= 5;
      setInput;
    end;
    VK_ESCAPE:
    begin
      dbgMst.SelectedIndex:= 3;
      SetInput;
    end;
  end;
end;

procedure TYPCK_FM.cbx_dwChange(Sender: TObject);
begin
  if cbx_dw.ItemIndex < 0 then exit;
  with Cds_1 do
  begin
    if (Cds_1.State <> dsEdit) and (Cds_1.State <> dsInsert) then
      Edit;
    FieldByName('ckdw').AsString:= cbx_dw.Text;
    FieldByName('ckbz').AsString:= cbx_dw.ItemCodes.Strings[cbx_dw.ItemIndex];
  end;
  SetEdtval;
  dbgMst.SelectedIndex:= 5;
  SetInput;
end;

procedure TYPCK_FM.edt_ypmcEnter(Sender: TObject);
begin
  stbr_xx.Panels[0].Text:= format(StrDptEnter2,['药品名称字典','药品名称字典']);
  //if (xtxx.AutoShowDpt = 1) and (edt_ypmc.Text='') then edt_ypmcClick(edt_ypmc);
end;

procedure TYPCK_FM.cbx_ypggEnter(Sender: TObject);
begin
  stbr_xx.Panels[0].Text:= cbx_ypgg.GetItemStr;
end;

procedure TYPCK_FM.Edt_PhEnter(Sender: TObject);
begin
  Stbr_xx.Panels[0].Text:= 'F9、空格键或鼠标左键单击按钮查看价格规格信息';
  if (edt_ph.Text='') then edt_phClick(edt_ph);
end;

procedure TYPCK_FM.edt_ypmcKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
    begin
      if edt_ypmc.Text='' then exit;
      if ssShift in Shift then
        SendMessage((Sender as TWinControl).Handle,WM_KEYDOWN,VK_ESCAPE,0)
      else
      begin
        dbgMst.SelectedIndex:= 3;
        SetInput;
      end;
    end;
    VK_ESCAPE:
    begin
      dbgMst.SelectedIndex:= 1;
      SetInput;
    end;
    Ord('A')..Ord('Z'),Ord('0')..Ord('9'),Ord('%'),Ord('('),Ord(')'),96..105:
    begin
      if not dpt.BlSHow then
      begin
        edt_ypmc.Text:= '';
        dpt.InitValue:= Chr(Key);
        edt_ypmcClick(Edt_ypmc);
      end;
    end;
  end;
end;

procedure TYPCK_FM.cbx_dwEnter(Sender: TObject);
begin
  stbr_xx.Panels[0].Text:= cbx_dw.GetItemStr;
end;

procedure TYPCK_FM.pnl_sl1Enter(Sender: TObject);
begin
  pnl_sl1.SetFocus;
end;

procedure TYPCK_FM.edt_slChange(Sender: TObject);
var
  Bzsl: Integer;
begin
  bzsl:= GetypslFromBz(Cds_1);
  with Cds_1 do
  begin
    Edit;
    case (Sender as TWinControl).Tag of
      1: FieldByName('sl').AsInteger:= StrToIntDef(edt_sl.Text,0)*Bzsl;
      2,3: FieldBYName('sl').AsInteger:= StrToIntDef(Edt_sl1.Text,0)*Bzsl+
        StrToIntDef(Edt_Sl2.Text,0);
    end;
  end;
  SetEdtval;
end;

procedure TYPCK_FM.edt_slEnter(Sender: TObject);
begin
  stbr_xx.Panels[0].Text:= '库存数量：'+dm.Cds_Com3.FieldBYName('sl1').AsString;
end;

procedure TYPCK_FM.edt_slKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

begin
  Case Key of
    110,190: if (Sender as TWinControl).Tag = 2 then edt_sl2.SetFocus;
    VK_RETURN:
    begin
      if ssShift in Shift then
        SendMessage((Sender as TWinControl).Handle,WM_KEYDOWN,VK_ESCAPE,0)
      else
      begin
        if pnl_sl.Visible then
        begin
          if edt_sl.Text='0' then exit;
        end
        else
        begin
          if (edt_sl1.Text='0') and (edt_sl2.Text='0') then exit
        end;
        Cds_1.Last;
        Cds_1.Append;
        dbgMst.SelectedIndex:= 2;
        SetInput;
      end;
    end;
    VK_ESCAPE:
    begin
      case (Sender as TWinControl).Tag of
        1,2:
        begin
          if ssShift in shift then
            dbgMst.SelectedIndex:= 1
          else
            dbgMst.SelectedIndex:= 4;
          SetInput;
        end;
        3: edt_sl1.SetFocus;
      end;

    end;
  end;
end;

procedure TYPCK_FM.QueryAmount(StrYpbm: String; Const blAll: Boolean= true);
var
  i: Integer;
begin
  with dm.Cds_Com3 do
  begin
    filtered:= false;
    Close;
    DataRequest('yk_ypck_kccx');
    FetchParams;
    Params.ParamByName('Ikf').AsString:= StrKf;
    Params.ParamByName('IYpbm').AsString:= StrYpbm;
    Open;
    {Close;
    CommandText:= 'select ypbm,ypgg,ypdw,jhj,ph,yxq,cjbs,bzgg,bzdw,'
      +'nhbz1,nh1dw,nhbz2,nh2dw,rkdh,sl,Bzgg1,cbj,'
      +'decode(sl1,0,'''',to_Char(sl1)||bzdw)||decode(sl2,0,'''',''/''||to_Char(sl2)||ypdw) as sl1,'
      +'cjmc,scpfj1 as scpfj,sclsj1 as sclsj,jhj,ypjx,jbcjbs from yp_ypkc_View where ypbm='''
      +StrYpbm+''' and kf='''+StrKf+''' and sl>0';
    Open;}
    i:= 1;
    cbx_ypgg.Items.Clear;
    cbx_ypgg.ItemInput.Clear;
    cbx_ypgg.ItemCodes.Clear;
    while not eof do
    begin
      if cbx_ypgg.Items.IndexOf(FieldByName('ypgg').AsString)< 0 then
      begin
        cbx_ypgg.Items.Add(FieldByName('ypgg').AsString);
        cbx_ypgg.ItemCodes.Add(FieldByName('ypbm').AsString);
        cbx_ypgg.ItemInput.Add(IntToStr(i));
        inc(i);
      end;
      next;
    end;
    if not blAll then
      Locate('ypbm;bzgg;ph;cjbs',VarArrayOf([Cds_1Ypbm.AsString,Cds_1Bzgg.AsString,Cds_1Ph.AsString,Cds_1CjDm.AsString]),[]);
  end;

end;

procedure TYPCK_FM.Cds_1AfterScroll(DataSet: TDataSet);
begin
  SetEdtval;
  with dm.Cds_Com3 do
  begin
    if Cds_1Ypbm.AsString='' then exit;
     if not Active then
     begin
       QueryAmount(Cds_1Ypbm.AsString,false);
       exit;
     end;
     
     if (Cds_1Ypbm.AsString<>FieldByName('ypbm').AsString)
        or (Cds_1Bzgg.AsString<> FieldByName('bzgg').AsString)
        or (Cds_1Cjdm.AsString<> FieldByName('cjbs').AsString)
        or (Cds_1Ph.AsString<> FieldByName('ph').AsString) then
        QueryAmount(Cds_1Ypbm.AsString,false);
  end;
end;

procedure TYPCK_FM.SetEdtval;
begin
  with Cds_1 do
  begin
    edt_bzgg.Text:= FieldByName('bzgg1').AsString;
    Edt_scpfj.Text:= FormatFloat('0.0000',FieldByName('scpfj').AsFloat);
    Edt_sclsj.Text:= FormatFloat('0.0000',FieldByName('sclsj').AsFloat);
    edt_ypjx.Text:= FieldByName('ypjx').AsString;
    edt_bzdw.Text:= FieldByName('bzdw').AsString;
    edt_zk.Text:= FieldByName('zk').AsString;
    edt_cj.Text:= FieldByName('cjmc').AsString;
    edt_je.Text:= formatFloat('0.0000',FieldByName('je').AsFloat);
    edt_kzgg.Text:=FieldByName('kzgg').AsString;
  end;
end;

procedure TYPCK_FM.cbx_czflEnter(Sender: TObject);
begin
  stbr_xx.Panels[0].Text:= cbx_czfl.GetItemStr;
end;

procedure TYPCK_FM.SetFrameInfo;
var
  i: Integer;
begin
  with TINIFile.Create(ExePath+'Brain.ini') do
  begin
    slfgf:= ' '+readString('软件','amountSign','|')+' ';
    defdrugclscode:= readString('软件','defdrugclscode','!');
    defdrugclsName:= readString('软件','defdrugclsname','');

    Free;
  end;

  with dm.Cds_All do
  begin
    close;
    CommandText:='select czdm,czfl from yp_zd_czfl where czdm in (select czfl from yp_zd_kfczfl where kf='''+xtxx.Zxtbm+''') order by czdm';
    open;
    i:= 1;
    while not eof do
    begin
      cbx_czfl.Items.Add(FieldByName('czfl').AsString);
      cbx_czfl.ItemCodes.Add(FieldByName('czdm').AsString);
      cbx_czfl.ItemInput.Add(GetSpeedChar(i));
      next;
    end;
    cbx_czfl.ItemIndex:= 0;
    StrCzfl:= cbx_czfl.ItemCodes.Strings[cbx_czfl.ItemIndex];
    Close;
  end;
end;

procedure TYPCK_FM.cbx_czflChange(Sender: TObject);
var
  idx: Integer;
begin
  idx:= cbx_czfl.ItemIndex;
  if idx < 0 then exit;
  with Cds_1 do
  begin
    edit;
    FieldByName('czdm').AsString:= cbx_czfl.ItemCodes.Strings[idx];
    FieldByName('ypbm').AsString:= '';
    FieldByName('ypmc').AsString:= '';
    clearypgg;
  end;
  StrCzfl:= cbx_czfl.ItemCodes.Strings[idx];
  dbgMst.SelectedIndex:= 2;
  SetInput;

end;

procedure TYPCK_FM.ClearYpgg;
begin
  Cds_1.FieldByName('ypgg').AsString:='';
  Cds_1.FieldByName('ypdw').AsString:= '';
  Cds_1.FieldByName('dgj').AsString:= '';
  Cds_1.FieldByName('ph').AsString:= '';
  Cds_1.FieldByName('bzgg').AsString:= '';
  Cds_1.FieldByName('bzdw').AsString:= '';
  Cds_1.FieldByName('nhbz1').AsString:= '';
  Cds_1.FieldByName('nh1dw').AsString:= '';
  Cds_1.FieldByName('nhbz2').AsString:= '';
  Cds_1.FieldByName('nh2dw').AsString:= '';
  Cds_1.FieldByName('Cjdm').AsString:= '';
  Cds_1.FieldByName('Rkdh').AsString:= '';
  Cds_1.FieldByName('Yxq').AsString:= '';
  Cds_1.FieldByName('cjmc').AsString:= '';
  Cds_1.FieldByName('scpfj').AsString:= '';
  Cds_1.FieldByName('sclsj').AsString:= '';
  Cds_1.FieldByName('ypjx').AsString:= '';
  Cds_1.FieldByName('bzgg1').AsString:= '';
  Cds_1.FieldByName('jhj').AsString:= '';
  cbx_dw.Items.Clear;
  cbx_dw.ItemCodes.Clear;
  Cds_1.FieldByName('ckdw').AsString:= '';
  Cds_1.FieldByName('ckbz').AsString:= '';
  Cds_1.FieldByName('sl').AsString:= '';
end;

procedure TYPCK_FM.cbx_czflKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
    begin
      if ssShift in Shift then
        SendMessage((Sender as TWinControl).Handle,WM_KEYDOWN,VK_ESCAPE,0)
      else
      begin
        dbgMst.SelectedIndex:= 2;
        SetInput;
      end;
    end;
    VK_ESCAPE:
    begin
      if Cds_1.State= dsInsert then
        Cds_1.Last
      else if not Cds_1.Bof then
      begin
        if not CheckRow() then cds_1.Delete;
        Cds_1.Prior;
      end;
      if Cds_1.RecordCount > 1 then
        dbgMst.SelectedIndex:= 5
      else
        dbgMst.SelectedIndex:= 1;
      SetInput;
    end;
  end;
end;

procedure TYPCK_FM.GotoCdsFirst;
begin
  if Cds_1.RecordCount > 0 then
    begin
      Cds_1.Last;
      dbgMst.SelectedIndex:= 8;
      SetInput;
      SendMessage(Edt_sl.Handle,WM_KEYDOWN,VK_RETURN,0);
    end
    else
    begin
      if StrXzCzfl='1' then
        dbgMst.SelectedIndex:= 1
      else
        dbgMst.SelectedIndex:= 2;
      SetInput;
    end;
end;

procedure TYPCK_FM.Cds_1PostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  Action:= daAbort;
  cds_1.Cancel;
end;

end.
