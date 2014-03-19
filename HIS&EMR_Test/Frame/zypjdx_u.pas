unit zypjdx_u;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, FFloatdit, TFlatPanelUnit, FlatSelEdit, TFlatComboBoxUnit,
  FlatComboBoxCode, Grids, DBGridEh, ExtCtrls, UserFunc_u, DB, DBClient,
  StrUtils, math, Variants, DllFunc_u, share_U, DictIpt, shareMsg_u,
  StatusBarEx, DBGrids, INIFiles, TFlatEditUnit;
const
  Win_NOCLen: Integer = 2;
type
  Tzypjdx_fm = class(TFrame)
    pnl_sfxm: TPanel;
    dbg_Mst: TDBGridEh;
    edt_xmmc: TFlatSelEdit;
    edt_jg: TFloatEdit;
    edt_sl: TFloatEdit;
    edt_zxks: TFlatSelEdit;
    Cds_sfxm: TClientDataSet;
    Cds_sfxmjbfldm: TStringField;
    Cds_sfxmjbflmc: TStringField;
    Cds_sfxmxmdm: TStringField;
    Cds_sfxmxmmc: TStringField;
    Cds_sfxmjg: TFloatField;
    Cds_sfxmsl: TFloatField;
    Cds_sfxmzxksdm: TStringField;
    Cds_sfxmzxksmc: TStringField;
    Cds_sfxmjbjls: TIntegerField;
    Cds_sfxmjbjg: TFloatField;
    Cds_sfxmjbzxks: TStringField;
    Cds_sfxmysxm: TStringField;
    Cds_sfxmje: TFloatField;
    Cds_sfxmsls: TStringField;
    Cds_sfxmysdm: TStringField;
    Cds_sfxmcfxhxs: TIntegerField;
    Cds_sfxmcyjs: TIntegerField;
    Cds_sfxmmzfl: TStringField;
    Cds_sfxmmzsjmc: TStringField;
    Cds_sfxmfphm: TStringField;
    Cds_sfxmhsfl: TStringField;
    Cds_sfxmypbz: TStringField;
    Cds_sfxmmzcl1: TStringField;
    Cds_sfxmmzcl2: TStringField;
    Cds_sfxmnhbz1: TIntegerField;
    Cds_sfxmnh1dw: TStringField;
    Cds_sfxmnhbz2: TIntegerField;
    Cds_sfxmnh2dw: TStringField;
    Cds_sfxmzddw: TStringField;
    Cds_sfxmypbzj: TSmallintField;
    Cds_sfxmjekj: TAggregateField;
    Cds_fpxm: TClientDataSet;
    ds_sfxm: TDataSource;
    Dpt: TDictIpt;
    Cds_sfxmcjbs: TStringField;
    Cds_Prc: TClientDataSet;
    Cds_sfxmpbbz: TStringField;
    Cds_sfxmsfjekj: TAggregateField;
    Cds_sfxmkjkm: TStringField;
    Cds_sfxmbaxm: TStringField;
    Cds_sfxmyhhjg: TFloatField;
    Cds_sfxmyhjg: TFloatField;
    Cds_sfxmsfje: TFloatField;
    Cds_fpxmjjjekj: TAggregateField;
    Cds_fpxmssjekj: TAggregateField;
    edt_cfys: TFlatEdit;
    edt_cfxh: TFlatEdit;
    cbx_xmgg: TFloatEdit;
    cbx_dw: TFloatEdit;
    Cds_sfxmdj: TFloatField;
    Cds_sfxmcyjsxs: TStringField;
    Cds_sfxmcfxh: TStringField;
    Cds_sfxmxmgg: TFloatField;
    Cds_sfxmdw: TFloatField;
    procedure edt_cfysClick(Sender: TObject);
    procedure edt_cfysDownClick(Sender: TObject);
    procedure edt_cfysEnter(Sender: TObject);
    procedure edt_cfysKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbg_MstCellClick(Column: TColumnEh);
    procedure Cds_sfxmAfterScroll(DataSet: TDataSet);
    procedure Cds_sfxmCalcFields(DataSet: TDataSet);
    procedure edt_cfxhChange(Sender: TObject);
    procedure edt_cfxhKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbx_jbflEnter(Sender: TObject);
    procedure cbx_jbflKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_cyjsChange(Sender: TObject);
    procedure edt_cyjsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_xmmcDownClick(Sender: TObject);
    procedure edt_xmmcEnter(Sender: TObject);
    procedure edt_xmmcKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbx_xmggEnter(Sender: TObject);
    procedure cbx_xmggKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbx_dwChange(Sender: TObject);
    procedure cbx_dwEnter(Sender: TObject);
    procedure cbx_dwKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_jgChange(Sender: TObject);
    procedure edt_jgKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_slChange(Sender: TObject);
    procedure edt_slEnter(Sender: TObject);
    procedure edt_slKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_zxksClick(Sender: TObject);
    procedure edt_zxksEnter(Sender: TObject);
    procedure edt_zxksKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_jgExit(Sender: TObject);
    procedure edt_cfysChange(Sender: TObject);
    procedure cbx_xmggChange(Sender: TObject);
    procedure edt_cfysExit(Sender: TObject);
  private
    xyjbdm: String;   //西药价表代码
    xyzxdm: String;   //西药执行科室代码
    xyzxmc: String;   //西药执行科室名称
    zyjbdm: String;
    zyzxdm: String;
    zyzxmc: String;
    cyjbdm: String;
    cyzxdm: String;
    cyzxmc: String;

    jyypkc: String;  //检验药品库存
    ypzldw: String;  //药品拆分单位
  public
    iMaxCfxh: Integer;
    fpxmsl: Integer;

    stbr_Info: TStatusBarEx;
    IniFFM: TINIFile;
    StrKsdm: String;
    StrFb: String;

    function GetZxsl: Real;
    function Getbzsl(cds: TClientDataSet;bzjb: Integer): Integer;
    procedure SetXmxx;
    procedure dbgSetFocus(Strcfxh,Strcfxhxs,strYsdm,Strysxm, StrJbfldm, StrJbflmc, StrCybs: String);
    function CheckRecord: TRowStatus; //检查记录是否合格

    procedure SetFpxm(StrBrbsh, Strxm, StrFb, Strmzrq, StrJzxh: String;
      var StrYfphm: String; var StrXFphm: String);
    function SaveData: Boolean;
    //procedure SaveData1;
    procedure SetInput;
    procedure SetPosition(ARect : TRect;Com : TWinControl);//设置控件坐标
    procedure SetVisible(Sender : TWinControl); //设置控件显示
    procedure INITFM;
    //得到项目优惠价
    function GetPreferentialPrice(Strfb,StrXmfl,StrXmdm,StrXmgg, Strtsxm: String;
      APrice: real): real;
  end;

implementation

uses dm_u, zydxjz_u;

{$R *.dfm}

{ Tmzpj_fm }

function Tzypjdx_fm.CheckRecord: TRowStatus;
var
  strkfdm: String;
begin
  result:= rsVaild;
  with cds_sfxm do
  begin
    if FieldByName('ysxm').AsString = '' then
    begin
      result:= rsBlank;
      exit;
    end
    else if FieldByName('cfxh').AsString= '' then
    begin
      result:= rsInvaild;
      exit;
    end
    {else if FieldByName('xmmc').AsString= '' then
    begin
      result:= rsInvaild;
      exit;
    end
    else if FieldByName('jg').AsFloat = 0 then
    begin
      result:= rsInvaild;
      exit;
    end }
    else if FieldByName('xmgg').AsFloat = 0 then
    begin
      result:= rsInvaild;
      exit;
    end
    else if FieldByName('zxksmc').AsString= '' then
    begin
      result:= rsInvaild;
      exit;
    end;
  end;
  with cds_sfxm do
  begin
    if (jyypkc = '1') and (FieldByName('ypbz').AsString='1') then
    begin
      if FieldByName('jbfldm').AsString=xyjbdm then
      begin
        Strkfdm:= xyzxdm;
      end
      else if FieldByName('jbfldm').AsString=zyjbdm then
      begin
        strkfdm:= zyzxdm;
      end
      else if FieldByName('jbfldm').AsString=cyjbdm then
      begin
        Strkfdm:= cyzxdm;
      end;
      with dm.Cds_All do
      begin
        Close;
        CommandText:='select sum(sl) as sl from yp_ypkc where ypbm='''+Cds_Sfxm.FieldByName('xmdm').AsString
          +''' and bzgg='''+Cds_sfxm.FieldByName('xmgg').AsString+''' and cjbs= '''
          +cds_sfxm.FieldByName('cjbs').AsString+''' and kf='''+StrKfdm+'''';
        Open;
        if FieldByName('sl').AsString = '' then
        begin
          MsgInfo('没有库存记录',2);
          result:= rsNOAmount;
          exit;
        end
        else if FieldByName('sl').AsFloat < GetZxsl then
        begin
          MsgInfo('库存数量不足',2);
          result:= rslackAmount;
          exit;
        end;
      end;
    end;
  end;

end;

procedure Tzypjdx_fm.dbgSetFocus(Strcfxh, Strcfxhxs, strYsdm, Strysxm,
  StrJbfldm, StrJbflmc, StrCybs: String);
begin
  pnl_sfxm.Enabled:= true;
  iMaxCfxh:= Max(iMaxCfxh,StrToIntDef(StrCfxh,0));
  with Cds_sfxm do
  begin
    if (CheckRecord=rsVaild) or (RecordCount=0) then
    begin
      Append;
      FieldByName('cfxh').AsString:= Strcfxh;
      FieldByName('cfxhxs').AsString:= Strcfxhxs;
      FieldByName('ysdm').AsString:= Strysdm;
      FieldByName('ysxm').AsString:= Strysxm;
      FieldByName('jbfldm').AsString:= Strjbfldm;
      FieldByName('jbflmc').AsString:= Strjbflmc;
      FieldByName('cyjs').AsInteger:= max(StrToIntDef(StrCybs,0),1);
    end;
    if Strysxm<>'' then
      dbg_mst.SelectedIndex:= 1
    else
      dbg_mst.SelectedIndex:= 0;
  end;
  SetInput;
end;

function Tzypjdx_fm.SaveData: Boolean;
var
  OleData: Array of OleVariant;
  OleTable: Array of OleVariant;
  v1,v2: OleVariant;
  iOle, iErr: Integer;
begin
  iOle:= 1;
  if dm.Cds_Mst.ChangeCount > 0 then
  begin
    SetLength(OleData,iOle);
    SetLength(OleTable,iOle);
    OleData[iOle-1]:= dm.Cds_Mst.Delta;
    OleTable[iOle-1]:= 'zy_brfymx';
    inc(iOle);
  end;
  v1:= VarArrayCreate([0,iOle-2],varVariant);
  v2:= VarArrayCreate([0,iOle-2],varVariant);
  for iErr:= Low(OleData) to High(OleData) do
  begin
    v1[iErr]:= OleData[iErr];
    v2[iErr]:= OleTable[iErr];
  end;
  dm.SockConn.AppServer.Updates(v1,v2,0,iErr);
  if iErr=0 then
  begin
    MsgInfo('用户信息保存成功！！',1);
    //jjlr_f.Btn_bc.Enable:=False;
  end
  else
    MsgInfo('用户信息保存失败！！',2);

end;

procedure Tzypjdx_fm.SetFpxm(StrBrbsh, Strxm, StrFb, Strmzrq, StrJzxh: String;
      var StrYfphm: String; var StrXFphm: String);
(*生成发票项目*)
procedure Addfpxm;
begin
  with Cds_sfxm do
  begin
    if (Cds_fpxm.RecordCount > 0) and (cds_fpxm.RecordCount mod fpxmsl=0) then
      StrXfphm:= incRcpt_NO(StrXfphm,Win_NOCLen);
    Cds_fpxm.Append;
    Cds_fpxm.FieldByName('fphm').AsString:= StrXfphm;
    Cds_fpxm.FieldByName('mzsjdm').AsString:= FieldByName('mzfl').AsString;
    Cds_fpxm.FieldByName('mzsjmc').AsString:= FieldByName('mzsjmc').AsString;
    Cds_fpxm.FieldByName('zxksdm').AsString:= FieldByName('zxksdm').AsString;
    Cds_fpxm.FieldByName('zxksmc').AsString:= FieldByName('zxksmc').AsString;
    Cds_fpxm.FieldByName('jjje').AsFloat:= FieldByName('je').AsFloat;
    Cds_fpxm.FieldByName('je').AsFloat:= FieldByName('sfje').AsFloat;
    Cds_fpxm.Post;
  end;
end;
(*生成门诊收据*)
procedure BuildRcpt;
begin
  with dm.Cds_Mst do
  begin
    if not Locate('sjh',cds_sfxm.FieldByName('fphm').AsString,[]) then
    begin
      Append;
      FieldByName('sjh').AsString:= Cds_sfxm.FieldByName('fphm').AsString;
      FieldByName('brbsh').AsString:= StrBrbsh;
      FieldByName('xm').AsString:= Strxm;
      FieldByName('xmpy').AsString:= GetSpellCode(PChar(Strxm),1,16);
      FieldByName('fb').AsString:= StrFb;
      FieldByName('jzrq').AsString:= StrMzrq;
      FieldByName('jzxh').AsString:= StrJzxh;
      FieldByName('zfy').AsFloat:= cds_sfxm.FieldByName('je').AsFloat;
      FieldByName('ysf').AsFloat:= cds_sfxm.FieldByName('sfje').AsFloat;
      FieldByName('sky').AsString:= yhxx.yhbs;
      FieldByName('jfbz').AsString:= '0';
      Post;
    end
    else
    begin
      edit;
      FieldByName('zfy').AsFloat:= FieldByName('zfy').AsFloat
        + cds_sfxm.FieldByName('je').AsFloat;
      FieldByName('ysf').AsFloat:= FieldByName('ysf').AsFloat
        + cds_sfxm.FieldByName('sfje').AsFloat;;
      Post;
    end;
  end;
end;
(*生成单据明细*)
procedure BuildBill;
begin
  with dm.Cds_Dtl do
  begin
    Append;
    FieldByName('jzrq').AsString:= StrMzrq;
    FieldByName('jzxh').AsString:= Strjzxh;
    FieldByName('sjh').AsString:= cds_sfxm.FieldByName('fphm').AsString;
    FieldByName('xh').AsInteger := cds_sfxm.RecNo;
    FieldByName('jbxmfl').AsString:= Cds_sfxm.FieldByName('jbfldm').AsString;
    FieldByName('sjxmfl').AsString:= Cds_sfxm.FieldByName('mzfl').AsString;
    FieldByName('hsxmfl').AsString:= Cds_sfxm.FieldByName('hsfl').AsString;
    FieldByName('kjkmfl').AsString:= Cds_sfxm.FieldByName('kjkm').AsString;
    FieldByName('baxmfl').AsString:= Cds_sfxm.FieldByName('baxm').AsString;
    FieldByName('xmdm').AsString:= Cds_sfxm.FieldByName('xmdm').AsString;
    FieldByName('xmmc').AsString:= Cds_sfxm.FieldByName('xmmc').AsString;
    FieldByName('xmgg').AsString:= Cds_sfxm.FieldByName('xmgg').AsString;
    FieldByName('sl').AsString:= Cds_sfxm.FieldByName('sl').AsString;
    FieldByName('dw').AsString:= Cds_sfxm.FieldByName('dw').AsString;
    FieldByName('jg').AsString:= Cds_sfxm.FieldByName('jg').AsString;
    FieldByName('zxks').AsString:= Cds_sfxm.FieldByName('zxksdm').AsString;
    FieldByName('fy').AsString:= Cds_sfxm.FieldByName('je').AsString;
    FieldByName('yffy').AsString:= Cds_sfxm.FieldByName('sfje').AsString;
    FieldByName('kdks').AsString:= Strksdm;
    FieldByName('kdys').AsString:= Cds_sfxm.FieldByName('ysdm').AsString;
    FieldbyName('cfxh').AsInteger:= Cds_sfxm.FieldByName('cfxh').AsInteger;
    FieldByName('cyjs').AsInteger:= Cds_sfxm.FieldByName('cyjs').AsInteger;
    FieldByName('ypbz').AsInteger:= Cds_sfxm.FieldByName('ypbz').AsInteger;
    FieldByName('ypbzj').AsInteger:= Cds_sfxm.FieldByName('ypbzj').AsInteger;
    FieldByName('cjbs').AsString:= cds_sfxm.FieldByName('cjbs').AsString;
    FieldByName('sky').AsString:= yhxx.yhbs;
    Post;
  end;
end;
(*生成开单记录*)
procedure BuildDeptItem;
begin
  with dm.cds_dtl2 do
  begin
    if not Locate('kdks;kdys;sjh;hsfl;',VarArrayOf([Strksdm,cds_sfxm.FieldByName('ysdm').AsString,
      cds_sfxm.FieldByName('fphm').AsString,Cds_sfxm.FieldByName('hsfl').AsString]),[]) then
    begin
      Append;
      FieldByName('jzrq').AsString:= Strmzrq;
      FieldByName('jzxh').AsString:= Strjzxh;
      FieldByName('brbsh').AsString:= StrBrbsh;
      FieldByName('kdks').AsString:= StrKsdm;
      FieldByName('sjh').AsString:= cds_sfxm.FieldByName('fphm').AsString;
      FieldByName('kdys').AsString:= cds_sfxm.FieldByName('ysdm').AsString;
      FieldByName('hsfl').AsString:= cds_sfxm.FieldByName('hsfl').AsString;
      FieldByName('je').AsFloat:= Cds_sfxm.FieldByName('je').AsFloat;
      FieldByName('sfje').AsFloat:= Cds_sfxm.FieldByName('sfje').AsFloat;
      Post;
    end
    else
    begin
      edit;
      FieldByName('je').AsFloat:= FieldByName('je').AsFloat + Cds_sfxm.FieldByName('je').AsFloat;
      FieldByName('sfje').AsFloat:= FieldByName('sfje').AsFloat + Cds_sfxm.FieldByName('sfje').AsFloat;
      Post;
    end;
  end;
end;
(*生成待发处方主记录*)


(*修改待发处方号*)
procedure EditPrescNO;
begin
  with dm.cds_Dtl3 do
  begin
    First;
    dm.cds_dtl4.Filtered:= true;
    while not eof do
    begin
      if FieldByName('cfh').AsInteger= RecNO then
      begin
        next;
        Continue;
      end;
      dm.cds_dtl4.Filter:= '[cfh]='+FieldByName('cfh').AsString;
      while not dm.cds_dtl4.eof do
      begin
        dm.cds_dtl4.Edit;
        dm.cds_dtl4.FieldByName('cfh').AsInteger:= RecNO;
        dm.cds_dtl4.Post;
      end;
      edit;
      FieldByName('cfh').AsInteger:= RecNO;
      Post;
      next;
    end;
    dm.cds_dtl4.Filtered:= false;
  end;
end;
begin
  StrXfphm:= StrYFphm;
  with cds_sfxm do
  begin
    First;
    while not eof do
    begin
      if (FieldByName('jbfldm').AsString= xyjbdm) or (FieldByName('jbfldm').AsString=zyjbdm)
        or (FieldByName('jbfldm').AsString=cyjbdm) then  //药品
      begin
        if not Cds_fpxm.Locate('mzsjdm;zxksdm',VarArrayOf([FieldByName('mzfl').AsString,
          FieldByName('zxksdm').AsString]),[]) then
        begin
          AddFpxm;
        end
        else
        begin
          Cds_fpxm.Edit;
          cds_fpxm.FieldByName('jjje').AsFloat:= Cds_fpxm.FieldByName('jjje').AsFloat
            +FieldByName('je').AsFloat;
          Cds_fpxm.FieldByName('je').AsFloat:= Cds_fpxm.FieldByName('je').AsFloat
            +FieldByName('sfje').AsFloat;
          Cds_fpxm.Post;
        end;

      end
      else             //诊疗
      begin
        AddFpxm;
      end;
      edit;
      FieldByName('fphm').AsString:= StrXfphm;
      Post;
      BuildRcpt; //生成发票
      BuildBill; //生成明细
      BuildDeptItem; //生成核算
      if FieldByName('ypbz').AsString = '1' then
      begin
        
       
      end;
      next;
    end;
  end;
  EditPrescNO;//修改处方号

end;

procedure Tzypjdx_fm.SetInput;
var
  ACol ,ARow: Longint;
  r: TRect;
  Strjbfldm: String;
  StrNhbz1, StrNhbz2: String;
begin
  ACol := dbg_Mst.Col;
  ARow := dbg_Mst.Row + 1;
  GetCellRectU(r,dbg_Mst);
  //设置显示控件
  Strjbfldm:= cds_sfxm.FieldByName('jbfldm').AsString;
  SetVisible(TWinControl(dbg_Mst));
  case ACol of
    1:
    begin
      edt_cfys.Text:= cds_sfxm.FieldByName('ysxm').AsString;
      SetPosition(r,edt_cfys);
    end;
    2:
    begin
      edt_cfxh.Text:= Cds_sfxm.FieldByName('cfxh').AsString;
      SetPosition(r,edt_cfxh);
    end;
    3:
    begin
      //cbx_jbfl.ItemIndex:= cbx_jbfl.ItemCodes.IndexOf(StrJbfldm);
     // SetPosition(r,cbx_jbfl);
    end;
    4:
    begin
     { if (Cds_sfxm.FieldByName('jbfldm').AsString=Cyjbdm)
        and (Cds_sfxm.FieldByName('jbflmc').AsString<>'' ) then
      begin
        SetPosition(r,edt_cyjs);
      end; }
    end;
    5:
    begin
      if (StrJbfldm<>'') then
      begin
        edt_xmmc.Text:= cds_sfxm.FieldByName('xmmc').AsString;
        SetPosition(r,edt_xmmc);
      end;
    end;
    6:
    begin
      edt_jg.Text:= cds_sfxm.FieldByName('dj').AsString;
      SetPosition(r,edt_jg);
      {cbx_xmgg.Text:= cds_sfxm.FieldByName('xmgg').AsString;
      SetPosition(r,cbx_xmgg); }
    end;
    7:
    begin
      cbx_xmgg.Text:= cds_sfxm.FieldByName('xmgg').AsString;
      SetPosition(r,cbx_xmgg);
      {if (StrJbfldm<>'') and ((Cds_sfxm.FieldByName('mzcl1').AsString='1')
        or (Cds_sfxm.FieldByName('mzcl2').AsString='1')) then
      begin
        cbx_dw.Items.Clear;
        cbx_dw.ItemInput.Clear;
        cbx_dw.ItemCodes.Clear;
        cbx_dw.ItemInput.Add('A');
        cbx_dw.Items.Add(Cds_sfxm.FieldByName('zddw').AsString);
        cbx_dw.ItemCodes.Add('1');

        if Cds_sfxm.FieldByName('mzcl1').AsString='1' then
        begin

          cbx_dw.ItemInput.Add('B');
          StrNhbz1:= ifThen(Cds_sfxm.FieldByName('nhbz1').AsFloat > 0,
            Cds_sfxm.FieldByName('nhbz1').AsString,'1');
          StrNhbz2:= ifThen(Cds_sfxm.FieldByName('nhbz2').AsFloat > 0,
            Cds_sfxm.FieldByName('nhbz2').AsString,'1');
          cbx_dw.Items.Add(Cds_sfxm.FieldByName('nh1dw').AsString);
          cbx_dw.ItemCodes.Add(IntToStr(StrToInt(Strnhbz1)*StrToInt(Strnhbz2)));
        end;
        if Cds_sfxm.FieldByName('mzcl2').AsString='1' then
        begin
          cbx_dw.ItemInput.Add('C');
          cbx_dw.Items.Add(Cds_sfxm.FieldByName('nh2dw').AsString);
          cbx_dw.ItemCodes.Add(Cds_sfxm.FieldByName('nhbz2').AsString);
        end;
        SetPosition(r,cbx_dw);
        SetPosition(r,cbx_dw);
      end; }
    end;
    8:
    begin
      cbx_dw.Text:= cds_sfxm.FieldByName('dw').AsString;
      SetPosition(r,cbx_dw);
      {if (StrJbfldm<>'') and (cds_sfxm.FieldByName('jbjg').AsFloat = 0) then
      begin
        edt_jg.Text:= cds_sfxm.FieldByName('jg').AsString;
        SetPosition(r,edt_jg);
      end; }
    end;
    9:
    begin
      {if (StrJbfldm<>'') and (cds_sfxm.FieldByName('xmgg').AsString<>'') then
      begin
        edt_sl.Text:= cds_sfxm.FieldByName('sl').AsString;
        SetPosition(r,edt_sl);
      end;}
      //if (StrJbfldm<>'') and ((cds_sfxm.FieldbyName('jbzxks').AsString='*')
        //or (cds_sfxm.FieldByName('jbzxks').AsString='')) then
      {begin
        edt_zxks.Text:= Cds_sfxm.FieldByName('zxksmc').AsString;
        SetPosition(r,edt_zxks);
      end; }
    end;
    10:
    begin
      edt_zxks.Text:= Cds_sfxm.FieldByName('zxksmc').AsString;
      SetPosition(r,edt_zxks);
      {if (StrJbfldm<>'') and ((cds_sfxm.FieldbyName('jbzxks').AsString='*')
        or (cds_sfxm.FieldByName('jbzxks').AsString='')) then
      begin
        edt_zxks.Text:= Cds_sfxm.FieldByName('zxksmc').AsString;
        SetPosition(r,edt_zxks);
      end;}
    end;
  end;

end;

procedure Tzypjdx_fm.SetPosition(ARect: TRect; Com: TWinControl);
begin
  SetVisible(Com);
  SetPositionU(ARect,Com);
end;

procedure Tzypjdx_fm.SetVisible(Sender: TWinControl);
begin
  edt_cfxh.Visible:= false;
  edt_cfys.Visible:= false;
  //cbx_jbfl.Visible:= false;
  //edt_cyjs.Visible:= false;
  edt_xmmc.Visible:= false;
  cbx_dw.Visible:= false;
  cbx_xmgg.Visible:= false;
  edt_jg.Visible:= false;
  edt_sl.Visible:= false;
  edt_zxks.Visible:= false;
end;

procedure Tzypjdx_fm.SetXmxx;
begin
  with Cds_Sfxm do
  begin
    if (State <> dsEdit) and (State <> dsInsert) then
      Edit;
    FieldByName('jbjls').AsInteger:= dm.Cds_Qry.RecordCount;
    FieldByName('cfxh').AsString:= dm.Cds_Qry.FieldByName('zyh').AsString;
    FieldByName('jbflmc').AsString:= dm.Cds_Qry.FieldByName('xm').AsString;
    FieldByName('cyjsxs').AsString:= dm.Cds_Qry.FieldByName('fb').AsString;
    FieldByName('xmmc').AsString:= dm.Cds_Qry.FieldByName('yjjye').AsString;
    FieldByName('dj').AsString:= jjlr_f.edt_bzjg.Text;
   // FieldByName('zddw').AsString:= dm.Cds_Qry.FieldByName('dw').AsString;
    //FieldByName('yhjg').AsFloat:= GetPreferentialPrice(strfb,cds_sfxmjbfldm.AsString,
      //cds_Sfxmxmdm.AsString,cds_sfxmxmgg.AsString,dm.Cds_Qry.FieldByName('pbbz').AsString,
       //dm.Cds_Qry.FieldByName('jg').AsFloat);
    if ypzldw='0' then  //药品最小出单位
    begin
      FieldByName('dw').AsString:= dm.Cds_Qry.FieldByName('dw').AsString;
      FieldByName('jg').AsString:= dm.Cds_Qry.FieldByName('jg').AsString;
      FieldByName('yhhjg').AsFloat:= FieldByName('yhjg').AsFloat;
      FieldByName('ypbzj').AsInteger:= 0;
    end
    else
    begin
     { if (dm.Cds_Qry.FieldByName('mzcl1').AsString = '1') then
      begin
        FieldByName('dw').AsString:= dm.Cds_Qry.FieldByName('nh1dw').AsString;
        FieldByName('jg').AsFloat:= dm.Cds_Qry.FieldByName('jg').AsFloat/GetBzsl(dm.cds_qry,0);
        FieldByName('yhhjg').AsFloat:= FieldByName('yhjg').AsFloat/GetBzsl(dm.cds_qry,0);
        FieldByName('ypbzj').AsInteger:= 1;
      end
      else if (dm.Cds_Qry.FieldByName('mzcl2').AsString = '1') then
      begin
        FieldByName('dw').AsString:= dm.Cds_Qry.FieldByName('nh2dw').AsString;
        FieldByName('jg').AsFloat:= dm.Cds_Qry.FieldByName('jg').AsFloat/GetBzsl(dm.Cds_Qry,2);
        FieldByName('yhhjg').AsFloat:= FieldByName('yhjg').AsFloat/GetBzsl(dm.Cds_Qry,2);
        FieldByName('ypbzj').AsInteger:= 2;
      end
      else
      begin
        FieldByName('dw').AsString:= dm.Cds_Qry.FieldByName('dw').AsString;
        FieldByName('jg').AsString:= dm.Cds_Qry.FieldByName('jg').AsString;
        FieldByName('ypbzj').AsInteger:= 0;
        FieldByName('yhhjg').AsFloat:= FieldByName('yhjg').AsFloat;
      end; }

    end;
    {FieldByName('jbjg').AsString:= dm.Cds_Qry.FieldBYName('jg').AsString;
    FieldByName('mzfl').AsString:= dm.Cds_Qry.FieldByName('zyfl').AsString;
    FieldByName('mzsjmc').AsString:= dm.Cds_Qry.FieldByName('zysjmc').AsString;
    FieldByName('hsfl').AsString:= dm.Cds_Qry.FieldByName('hsfl').AsString;
    FieldByName('kjkm').AsString:= dm.Cds_Qry.FieldByName('kjkm').AsString;
    FieldByName('baxm').AsString:= dm.Cds_Qry.FieldByName('bafl').AsString;
    FieldByName('ypbz').AsString:= dm.Cds_Qry.FieldByName('ypbz').AsString;
    FieldByName('mzcl1').AsString:= dm.Cds_Qry.FieldByName('mzcl1').AsString;
    FieldByName('mzcl2').AsString:= dm.Cds_Qry.FieldByName('mzcl2').AsString;
    FieldByName('nhbz1').AsString:= dm.Cds_Qry.FieldByName('nhbz1').AsString;
    FieldByName('nh1dw').AsString:= dm.Cds_Qry.FieldByName('nh1dw').AsString;
    FieldByName('nhbz2').AsString:= dm.Cds_Qry.FieldByName('nhbz2').AsString;
    FieldByName('nh2dw').AsString:= dm.Cds_Qry.FieldByName('nh2dw').AsString;

    FieldByName('cjbs').AsString:= dm.Cds_Qry.FieldByName('cjbs').AsString;
    FieldByName('pbbz').AsString:= dm.Cds_Qry.FieldByName('pbbz').AsString;
    if FieldByName('jbfldm').AsString=xyjbdm then
    begin
      FieldByName('zxksmc').AsString:= xyzxmc;
      FieldByName('zxksdm').AsString:= xyzxdm;
      FieldByname('jbzxks').AsString:= xyzxdm;
    end
    else if FieldByName('jbfldm').AsString=zyjbdm then
    begin
      FieldByName('zxksmc').AsString:= zyzxmc;
      FieldByName('zxksdm').AsString:= zyzxdm;
      FieldByname('jbzxks').AsString:= zyzxdm;
    end
    else if FieldByName('jbfldm').AsString=cyjbdm then
    begin
      FieldByName('zxksmc').AsString:= cyzxmc;
      FieldByName('zxksdm').AsString:= cyzxdm;
      FieldByname('jbzxks').AsString:= cyzxdm;
    end
    else
    begin
      FieldByName('zxksmc').AsString:= dm.Cds_Qry.FieldByName('ksmc').AsString;
      FieldByname('zxksdm').AsString:= dm.Cds_Qry.FieldByName('zxks').AsString;
      FieldByname('jbzxks').AsString:= dm.Cds_Qry.FieldByName('zxks').AsString;
    end;}
  end;
end;

procedure Tzypjdx_fm.dbg_MstCellClick(Column: TColumnEh);
begin
  if not (dgRowSelect in dbg_Mst.Options) then
    SetInput;
end;

procedure Tzypjdx_fm.Cds_sfxmAfterScroll(DataSet: TDataSet);
begin
  if (not (dgRowSelect in dbg_Mst.Options)) and (Cds_sfxm.RecordCount > 1)
    and (pnl_sfxm.Enabled) then
    SetInput;
end;

procedure Tzypjdx_fm.Cds_sfxmCalcFields(DataSet: TDataSet);
begin
  {if Cds_sfxmcyjs.AsInteger > 1 then
  begin
    if Cds_sfxmsl.AsFloat > 0 then
      Cds_sfxmsls.AsString:= Cds_sfxmsl.AsString+'×'+Cds_sfxmcyjs.AsString+'剂';
  end
  else
  begin
    Cds_sfxmsls.AsString:= Cds_sfxmsl.AsString;
  end;
  Cds_sfxmJe.AsFloat:= Cds_sfxmsl.AsFloat* Cds_sfxmjg.AsFloat*Cds_sfxmCyjs.AsInteger;
  cds_sfxmsfje.AsFloat:= Cds_sfxmsl.AsFloat*GetPreferentialPrice(Strfb,
      Cds_sfxmjbfldm.AsString,Cds_sfxmxmdm.AsString,cds_sfxmxmgg.AsString,
      cds_sfxmpbbz.AsString,Cds_sfxmjg.AsFloat)*Cds_sfxmCyjs.AsInteger; }
  Cds_sfxmsfje.AsFloat:=Cds_sfxmdj.AsFloat*Cds_sfxmxmgg.AsFloat;
  cds_sfxmje.AsFloat:= Cds_sfxmxmgg.AsFloat*GetPreferentialPrice(Strfb,
      Cds_sfxmjbfldm.AsString,Cds_sfxmxmdm.AsString,cds_sfxmxmgg.AsString,
      cds_sfxmpbbz.AsString,Cds_sfxmjg.AsFloat)*Cds_sfxmCyjs.AsInteger;
end;

procedure Tzypjdx_fm.edt_cfysClick(Sender: TObject);
var
  StrFilter: String;
  Strcfysdm: String;
begin
  inherited;
  StrFilter:= '[zl]=''门诊医生组'' and [ksdm]='''+StrKsdm+'''';
  if not ShowDictIpt(Dpt,TWinControl(edt_cfys),
    exePath+'Dict\xt_zd_gzry_ys_View.xml',Strcfysdm,Screen,StrFilter) then
  begin
    if not (CheckRecord = rsVaild) then
        cds_sfxm.Cancel;
      cds_sfxm.Last;
      dbg_mst.SelectedIndex:= 2;
      SetInput;
    exit;
  end;
  with Cds_Sfxm do
  begin
    if (State <> dsEdit) and (State <> dsInsert) then
      Edit;
    FieldByName('ysdm').AsString:= StrCfysdm;
    FieldByName('ysxm').AsString:= edt_cfys.Text;
    if FieldByName('cfxhhs').AsInteger = 0 then
    begin
      inc(iMaxcfxh);
      FieldByName('cfxh').AsInteger:= iMaxCfxh;
      FieldByName('cfxhxs').AsInteger:= iMaxCfxh;
    end;
    dbg_mst.SelectedIndex:= 2;
    SetInput;
  end;

end;

procedure Tzypjdx_fm.edt_cfysDownClick(Sender: TObject);
begin
  if UpgradeSigleFile(4,exePath+'Dict\','xt_zd_gzry_ys_View.xml','') then
    MsgInfo('更新医生字典成功',1)
  else
    MsgInfo('更新医生字典失败',2);
end;

procedure Tzypjdx_fm.edt_cfysEnter(Sender: TObject);
begin
  //stbr_Info.Panels[0].Text:= format(strDptEnter2,['医生字典','医生字典']);
  if (edt_cfys.Text='') and (xtxx.AutoShowDpt = 1) then
    edt_cfysClick(Sender);
end;

procedure Tzypjdx_fm.edt_cfysKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    VK_ESCAPE:
    begin
      if not (CheckRecord =  rsvaild)then
        cds_sfxm.Cancel;
      cds_sfxm.Last;
      dbg_mst.SelectedIndex:= 2;
      SetInput;
    end;
    VK_RETURN:
    begin
      dbg_mst.SelectedIndex:= 1;
      SetInput;
    end;
  end;
end;

procedure Tzypjdx_fm.edt_cfxhChange(Sender: TObject);
begin
  with Cds_Sfxm do
  begin
    if (State <> dsEdit) and (State <> dsInsert) then
      Edit;
    FieldByName('cfxh').AsString:= edt_cfxh.Text;
  end;
end;

procedure Tzypjdx_fm.edt_cfxhKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
    begin
      if edt_jg.Text='' then
      begin
        dbg_mst.SelectedIndex:= 5;
      end
      else
      begin
        //edt_jg.Enabled:=False;
        dbg_mst.SelectedIndex:= 6;
      end;
      SetInput;
    end;
    {VK_ESCAPE:
    begin
      btn_kjBtn_YgClick(Sender);
    end;}
  end;
end;

procedure Tzypjdx_fm.cbx_jbflEnter(Sender: TObject);
begin
  //stbr_info.Panels[0].Text:= cbx_jbfl.GetItemStr;
end;

procedure Tzypjdx_fm.cbx_jbflKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //case Key of
    {VK_ESCAPE:
    begin
      btn_kjBtn_YgClick(Sender);
    end;}
   { VK_RETURN:
    begin
      if cds_sfxmjbfldm.AsString= '' then exit;
      if (Cds_sfxmjbfldm.AsString = cyjbdm) and (cds_sfxmcfxhxs.AsInteger > 0) then
        dbg_mst.SelectedIndex:= 3
      else
        dbg_mst.SelectedIndex:= 4;
      SetInput;
    end;
  end;}
end;

procedure Tzypjdx_fm.edt_cyjsChange(Sender: TObject);
begin
  with Cds_Sfxm do
  begin
    if (State <> dsEdit) and (State <> dsInsert) then
      Edit;
    //FieldByName('cyjs').AsString:=  edt_cyjs.Text;
    if FIeldByName('jbflmc').AsString <> '' then
      //FieldByName('cyjsxs').AsString:= edt_cyjs.Text;
  end;
end;

procedure Tzypjdx_fm.edt_cyjsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  {Case Key of
    VK_ESCAPE:
    begin
      dbg_mst.SelectedIndex:= 2;
      SetInput;
    end;
    VK_RETURN:
    begin
      if StrToIntDef(edt_cyjs.Text,0) > 0 then
      begin
        dbg_mst.SelectedIndex:= 4;
        SetInput;
      end;
    end;
  end; }
end;

procedure Tzypjdx_fm.edt_xmmcDownClick(Sender: TObject);
var
  jbfldm: String;
  Strxmdm: String;
  i: Integer;
begin
  inherited;
  jbfldm:= cds_sfxm.FieldByName('jbfldm').AsString;
  if UpgradeSigleFile(4,exePath+'Dict\','Jbxm'+jbfldm+'.xml','') then
    MsgInfo('更新收费项目成功',1)
  else
    MsgInfo('更新收费项目失败',2);
end;

procedure Tzypjdx_fm.edt_xmmcEnter(Sender: TObject);
begin
  //stbr_info.Panels[0].Text:= format(StrDptEnter2,['收费项目','收费项目']);
  
end;

procedure Tzypjdx_fm.edt_xmmcKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
    begin
      dbg_mst.SelectedIndex:= 2;
      SetInput;
    end;
    VK_RETURN:
    begin
      if cds_sfxmxmdm.AsString= '' then exit;
      if cds_sfxm.FieldByName('jbjg').AsFloat = 0 then
        dbg_mst.SelectedIndex:= 7
      else
        dbg_mst.SelectedIndex:= 8;
      SetInput;
    end;
  end;
end;

procedure Tzypjdx_fm.cbx_xmggEnter(Sender: TObject);
begin
  //stbr_Info.Panels[0].Text:= cbx_xmgg.GetItemStr;
end;

procedure Tzypjdx_fm.cbx_xmggKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
    begin
      dbg_Mst.SelectedIndex:= 2;
      SetInput;
    end;
    VK_RETURN:
    begin
      if cds_sfxm.FieldByName('xmgg').AsFloat = 0 then
        dbg_mst.SelectedIndex:= 6
      else
        dbg_mst.SelectedIndex:= 9;
      SetInput;
    end;
  end;
end;

procedure Tzypjdx_fm.cbx_dwChange(Sender: TObject);
var
  StrBzsl: Integer;
  StrSpeedChar: String;
begin
  with Cds_Sfxm do
  begin
    if (State <> dsEdit) and (State <> dsInsert) then
      Edit;
    FieldByName('dw').AsString:= cbx_dw.Text;
  end;  
  {if cbx_dw.ItemIndex < 0 then exit;
  with Cds_Sfxm do
  begin
    if (State <> dsEdit) and (State <> dsInsert) then
      Edit;
    if CompareStr(Cds_sfxm.FieldByName('dw').AsString,cbx_dw.Text) <> 0 then
    begin
      Strbzsl:= StrToInt(cbx_dw.ItemCodes.Strings[cbx_dw.ItemIndex]);
      StrSpeedChar:= cbx_dw.ItemInput.Strings[cbx_dw.ItemIndex];
      if StrSpeedChar='C' then
        FieldByName('ypbzj').AsInteger:= 2
      else if StrSpeedChar= 'B' then
        FieldByName('ypbzj').AsInteger:= 1
      else
        FieldByName('ypbzj').AsInteger:= 0;
      FieldByName('dw').AsString:= cbx_dw.Text;
      FieldByName('jg').AsFloat:= FieldByName('jbjg').AsFloat/Strbzsl;
      FieldByName('yhhjg').AsFloat:= FieldByName('yhjg').AsFloat/Strbzsl;
      FieldByName('sl').AsString:= '';
    end;
  end;
  dbg_mst.SelectedIndex:= 8;
  SetInput; }

end;

procedure Tzypjdx_fm.cbx_dwEnter(Sender: TObject);
begin
  //stbr_info.Panels[0].Text:= cbx_dw.GetItemStr;
end;

procedure Tzypjdx_fm.cbx_dwKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    VK_ESCAPE:
    begin
      dbg_mst.SelectedIndex:= 2;
      SetInput;
    end;
    VK_RETURN:
    begin
      dbg_mst.SelectedIndex:= 9;
      SetInput;
    end;
  end;
end;

procedure Tzypjdx_fm.edt_jgChange(Sender: TObject);
begin
  with Cds_Sfxm do
  begin
    if (State <> dsEdit) and (State <> dsInsert) then
      Edit;
    FieldByName('dj').AsString:= edt_jg.Text;
  end;
end;

procedure Tzypjdx_fm.edt_jgKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    VK_RETURN:
    begin
      dbg_mst.SelectedIndex:= 6;
      SetInput;
    end;
    VK_ESCAPE:
    begin
      dbg_mst.SelectedIndex:= 2;
      SetInput;
    end;
  end;
end;

procedure Tzypjdx_fm.edt_jgExit(Sender: TObject);
begin
  with Cds_Sfxm do
  begin
    if (State <> dsEdit) and (State <> dsInsert) then
      Edit;
    FieldByName('yhjg').AsFloat:= GetPreferentialPrice(strfb,cds_sfxmjbfldm.AsString,
      cds_Sfxmxmdm.AsString,cds_sfxmxmgg.AsString,FieldByName('pbbz').AsString,
       FieldByName('jg').AsFloat);
    FieldByName('yhhjg').AsFloat:= FieldByName('yhjg').AsFloat;
  end;
end;

procedure Tzypjdx_fm.edt_slChange(Sender: TObject);
begin
  with Cds_Sfxm do
  begin
    if (State <> dsEdit) and (State <> dsInsert) then
      Edit;
    FieldByName('sl').AsString:= edt_sl.Text;
  end;
end;

procedure Tzypjdx_fm.edt_slEnter(Sender: TObject);
begin
  if (Cds_sfxm.FieldByName('mzcl1').AsString= '1') or
    (Cds_sfxm.FieldByName('mzcl2').AsString='1') then
    //stbr_info.Panels[0].Text:= '按Shift键选择药品单位'
  else
   // stbr_info.Panels[0].Text:= '';
end;


procedure Tzypjdx_fm.edt_slKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ssShift in shift then
  begin
    if (Cds_sfxm.FieldByName('mzcl1').AsString='1')
      or (Cds_sfxm.FieldByName('mzcl2').AsString='1') then
    begin
      dbg_mst.SelectedIndex:= 6;
      SetInput;
    end;
  end;
  Case Key of
    VK_ESCAPE:
    begin
      dbg_mst.SelectedIndex:= 2;
      SetInput;
    end;
    VK_RETURN:
    begin
      if (cds_sfxm.FieldByName('jbzxks').AsString = '') or
        (Cds_sfxm.FieldByName('jbzxks').AsString = '*') then
      begin
        dbg_mst.SelectedIndex:= 9;
        SetInput;
      end
      else
      begin
        if checkRecord = rsVaild then dbgSetFocus(cds_sfxmcfxh.AsString,'',cds_sfxmysdm.AsString,'',
          Cds_sfxmjbfldm.AsString,'',cds_sfxmcyjs.AsString);
      end;
    end;
  end;
end;

procedure Tzypjdx_fm.edt_zxksClick(Sender: TObject);
var
  StrFilter: String;
  StrzxKsdm: String;
begin
  inherited;
  if cds_sfxm.FieldByName('jbzxks').AsString='' then
    StrFilter:= ''
  else if Cds_sfxm.FieldByName('jbzxks').AsString= '*' then
  begin
    with dm.Cds_All do
    begin
      Close;
      CommandText:='select zxks from xt_fy_jbxmks where jbfl='''
        +Cds_sfxm.FieldByName('jbfldm').AsString+''' and jbdm='''
        +Cds_sfxm.FieldByName('xmdm').AsString+'''';
      Open;
      StrFilter:= '';
      if RecordCount > 0 then
      begin
        while not eof do
        begin
          if StrFilter = '' then
            StrFilter:= '[code] in ('''+FieldByName('zxks').AsString+''''
          else
            StrFilter:= StrFilter+','''+FieldByName('zxks').AsString+'''';
          next;
        end;
        StrFilter:= StrFilter+')';
      end;
    end;
  end;
  if not ShowDictIpt(Dpt,TWinControl(edt_zxks),exePath+'Dict\xt_zd_ks.xml',StrzxKsdm,Screen,StrFilter) then exit;
  with Cds_Sfxm do
  begin
    if (State <> dsEdit) and (State <> dsInsert) then
      Edit;
    FieldByName('zxksdm').AsString:= StrZxksdm;
    FieldByName('zxksmc').AsString:= edt_zxks.Text;
  end;
  if checkRecord = rsVaild then dbgSetFocus(cds_sfxmcfxh.AsString,'',cds_sfxmysdm.AsString,'',
    Cds_sfxmjbfldm.AsString,'',cds_sfxmcyjs.AsString);
end;

procedure Tzypjdx_fm.edt_zxksEnter(Sender: TObject);
begin
  //stbr_info.Panels[0].Text:= format(StrDptEnter2,['科室字典','科室字典']);
  if (edt_zxks.Text= '') and (xtxx.AutoShowDpt = 1) then
    edt_zxksClick(Sender);
end;

procedure Tzypjdx_fm.edt_zxksKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    VK_RETURN:
    begin
      if checkRecord = rsVaild then dbgSetFocus(cds_sfxmcfxh.AsString,'',cds_sfxmysdm.AsString,'',
        Cds_sfxmjbfldm.AsString,'',cds_sfxmcyjs.AsString);
    end;
    VK_ESCAPE:
    begin
      dbg_mst.SelectedIndex:= 0;
      SetInput;
    end;
  end;
end;

procedure Tzypjdx_fm.INITFM;
begin
  with dm.Cds_Qry do
  begin
    Close;
    CommandText:= 'select fldm,flmc from xt_fy_jbxmfl where mzbz=1 order by xh';
    Open;
    while not eof do
    begin
      //cbx_jbfl.Items.Add(FieldByName('flmc').AsString);
      //cbx_jbfl.ItemInput.Add(FieldByName('fldm').AsString);
      //cbx_jbfl.ItemCodes.Add(FieldByName('fldm').AsString);
      //next;
    end;
  end;

  with IniFFM do
  begin
    xyjbdm:= ReadString('西药','price_code','');
    xyzxdm:= ReadString('西药','dept_code','');
    xyzxmc:= ReadString('西药','dept_name','');

    zyjbdm:= ReadString('中成药','price_code','');
    zyzxdm:= ReadString('中成药','dept_code','');
    zyzxmc:= ReadString('中成药','dept_name','');

    cyjbdm:= ReadString('中草药','price_code','');
    cyzxdm:= ReadString('中草药','dept_code','');
    cyzxmc:= ReadString('中草药','dept_name','');

    fpxmsl:= ReadInteger('软件','rcpt_item_count',3);
    ypzldw:= ReadString('药品单位','unit_class','0');
    jyypkc:= ReadString('库存校验','check_amount','0');
  end;
end;

function Tzypjdx_fm.Getbzsl(cds: TClientDataSet;bzjb: Integer): Integer;
begin
  with Cds do
  begin
    case bzjb of
      0:
        result:= StrToInt(ifThen(FieldByName('nhbz1').AsInteger > 0,FieldByName('nhbz1').AsString,'1'))*
          StrToInt(ifThen(FieldByName('nhbz2').AsInteger > 0,FieldByName('nhbz2').AsString,'1'));
      1:
        result:= StrToInt(ifThen(FieldByName('nhbz1').AsInteger > 0,FieldByName('nhbz1').AsString,'1'));
      2:
        result:= StrToInt(ifThen(FieldByName('nhbz2').AsInteger > 0,FieldByName('nhbz2').AsString,'1'));
    end;
  end;
end;

function Tzypjdx_fm.GetZxsl: Real;
begin
  if Cds_SfxmCyjs.AsInteger > 0 then
    case Cds_sfxmypbzj.AsInteger of
      0: result:= Cds_sfxmsl.AsFloat*Getbzsl(cds_sfxm,0)*Cds_sfxmcyjs.AsInteger;
      1: result:= Cds_sfxmsl.AsFloat*Cds_sfxmcyjs.AsInteger;
      2: result:= Cds_sfxmsl.AsFloat*Getbzsl(cds_sfxm,1)*Cds_sfxmcyjs.AsInteger;
    end
  else
    case Cds_sfxmypbzj.AsInteger of
    0: result:= Cds_sfxmsl.AsFloat*Getbzsl(cds_sfxm,0);
    1: result:= Cds_sfxmsl.AsFloat;
    2: result:= Cds_sfxmsl.AsFloat*Getbzsl(cds_sfxm,1)*Cds_sfxmcyjs.AsInteger;
  end;
end;

function Tzypjdx_fm.GetPreferentialPrice(Strfb,StrXmfl, StrXmdm, StrXmgg,Strtsxm: String;
  APrice: real): real;
function GetJg: Real;
var
  rjg: Real;
begin
  with Cds_Prc do
  begin
    if (FieldByName('tsxmbz').AsString='0') and (Strtsxm='1') then  //特殊项目屏蔽
    exit;
    if FieldByName('yhsfj').AsFloat>= 0 then                        //优惠金额大于零
    begin
      rJg:= FieldByName('yhsfj').AsFloat;
      if ((APrice-rJg)> FieldByName('mczgxe').AsFloat) and (FieldByName('yhsfj').AsFloat >= 0) then
        result:= APrice-FieldByName('mczgxe').AsFloat
      else
      begin
        if rjg> APrice then
          result:= APrice
        else
          result:= rJg;
      end;
      exit;
    end
    else
    begin
      rJg:= APrice*FieldByName('sfxs').AsFloat/100;
      if (APrice-rJg> FieldByName('mczgxe').AsFloat) and (FieldByName('yhsfj').AsFloat >= 0) then
        result:= APrice-FieldByName('mczgxe').AsFloat
      else
      begin
        if rjg> APrice then
          result:= APrice
        else
          result:= rJg;
      end;
      exit;
    end;
  end;
end;
begin
  result:= APrice;
  if (strfb='') or (strxmfl= '') or (strxmdm='') or (strxmgg='') or (strtsxm='')
    or (APrice = 0) then
    exit;
  with cds_Prc do
  begin
    if not Active then
    begin
      Close;
      CommandText:= 'select * from xt_fy_sfxs_Dqxs_view where sybz in (''0'',''2'')';
      Open;
    end;
    //查找是否是排斥项目
    if Locate('fb;xmlb;xmdm;xmgg;pcxmbz',VarArrayOf([Strfb,StrXmfl,StrXmdm,StrXmgg,'1']),[]) then
      exit;
    if Locate('fb;xmlb;xmdm;xmgg;pcxmbz',VarArrayOf([Strfb,Strxmfl,strxmdm,'*','1']),[]) then
      exit;
    if Locate('fb;xmlb;xmdm;xmgg;pcxmbz',VarArrayOf([Strfb,Strxmfl,'*','*','1']),[]) then
      exit;
    if Locate('fb;xmlb;xmdm;xmgg;pcxmbz',VarArrayOf([Strfb,StrXmfl,StrXmdm,StrXmgg,'0']),[]) then
    begin
      result:= GetJg;
      exit;
    end;
    if Locate('fb;xmlb;xmdm;xmgg;pcxmbz',VarArrayOf([Strfb,StrXmfl,StrXmdm,'*','0']),[]) then
    begin
      result:= GetJg;
      exit;
    end;
    if Locate('fb;xmlb;xmdm;xmgg;pcxmbz',VarArrayOf([Strfb,StrXmfl,'*','*','0']),[]) then
    begin
      result:= GetJg;
      exit;
    end;
  end;
end;

procedure Tzypjdx_fm.edt_cfysChange(Sender: TObject);
begin
  with Cds_Sfxm do
  begin
    if (State <> dsEdit) and (State <> dsInsert) then
      Edit;
    FieldByName('ysxm').AsString:= edt_cfys.Text;
  end;
end;

procedure Tzypjdx_fm.cbx_xmggChange(Sender: TObject);
begin
  with Cds_Sfxm do
  begin
    if (State <> dsEdit) and (State <> dsInsert) then
      Edit;
    FieldByName('xmgg').AsString:= cbx_xmgg.Text;
  end;
  Cds_Sfxm.FieldByName('dw').AsString:=Cds_Sfxm.FieldByName('sfje').AsString;
  Cds_Sfxm.FieldByName('jg').AsString:=Cds_Sfxm.FieldByName('je').AsString;
end;

procedure Tzypjdx_fm.edt_cfysExit(Sender: TObject);
begin
  with dm.Cds_Qry do
  begin
    Close;
    CommandText:='select * from zy_brjbx_view where brbsh='''+edt_cfys.Text+'''';
    Open;
    SetXmxx;
  end;
end;

end.
