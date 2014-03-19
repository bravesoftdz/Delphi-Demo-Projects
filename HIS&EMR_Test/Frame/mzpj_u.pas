unit mzpj_u;


interface                                                                 
uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, FFloatdit, TFlatPanelUnit, FlatSelEdit, TFlatComboBoxUnit,
  FlatComboBoxCode, Grids, DBGridEh, ExtCtrls, UserFunc_u, DB, DBClient,
  StrUtils, math, Variants, DllFunc_u, share_U, DictIpt, shareMsg_u,
  StatusBarEx, DBGrids, INIFiles, Insur_u, Printers, print_u;
const
  Win_NOCLen: Integer = 2;
type
  Tmzpj_fm = class(TFrame)
    pnl_sfxm: TPanel;
    dbg_Mst: TDBGridEh;
    cbx_jbfl: TFlatComboBoxCode;
    edt_xmmc: TFlatSelEdit;
    edt_jg: TFloatEdit;
    edt_sl: TFloatEdit;
    edt_zxks: TFlatSelEdit;
    edt_cfys: TFlatSelEdit;
    edt_cfxh: TFloatEdit;
    edt_cyjs: TFloatEdit;
    cbx_dw: TFlatComboBoxCode;
    Cds_sfxm: TClientDataSet;
    Cds_sfxmjbfldm: TStringField;
    Cds_sfxmjbflmc: TStringField;
    Cds_sfxmxmdm: TStringField;
    Cds_sfxmxmmc: TStringField;
    Cds_sfxmxmgg: TStringField;
    Cds_sfxmdw: TStringField;
    Cds_sfxmjg: TFloatField;
    Cds_sfxmsl: TFloatField;
    Cds_sfxmzxksdm: TStringField;
    Cds_sfxmzxksmc: TStringField;
    Cds_sfxmjbjls: TIntegerField;
    Cds_sfxmjbjg: TFloatField;
    Cds_sfxmjbzxks: TStringField;
    Cds_sfxmcfxh: TSmallintField;
    Cds_sfxmysxm: TStringField;
    Cds_sfxmje: TFloatField;
    Cds_sfxmsls: TStringField;
    Cds_sfxmysdm: TStringField;
    Cds_sfxmcfxhxs: TIntegerField;
    Cds_sfxmcyjs: TIntegerField;
    Cds_sfxmcyjsxs: TIntegerField;
    Cds_sfxmmzfl: TStringField;
    Cds_sfxmmzsjmc: TStringField;
    Cds_sfxmfphm: TStringField;
    Cds_sfxmypbz: TStringField;
    Cds_sfxmmzcl1: TStringField;
    Cds_sfxmmzcl2: TStringField;
    Cds_sfxmnhbz1: TIntegerField;
    Cds_sfxmnh1dw: TStringField;
    Cds_sfxmnhbz2: TIntegerField;
    Cds_sfxmnh2dw: TStringField;
    Cds_sfxmzddw: TStringField;
    Cds_sfxmypbzj: TSmallintField;
    Cds_fpxm: TClientDataSet;
    ds_sfxm: TDataSource;
    Dpt: TDictIpt;
    Cds_sfxmcjbs: TStringField;
    Cds_Prc: TClientDataSet;
    Cds_sfxmpbbz: TStringField;
    Cds_sfxmkjkm: TStringField;
    Cds_sfxmbaxm: TStringField;
    Cds_sfxmyhhjg: TFloatField;
    Cds_sfxmyhjg: TFloatField;
    Cds_sfxmsfje: TFloatField;
    Cds_sfxmypgg: TStringField;
    Cds_sfxmjbcjbs: TStringField;
    Cds_sfxmzflb: TStringField;
    cds_ybfp: TClientDataSet;
    cds_jbybdz: TClientDataSet;
    Cds_sfxmyhbl: TFloatField;
    Cds_sfxmmbxh: TIntegerField;
    Cds_sfxmhsfl: TStringField;
    edt_xmgg: TFlatSelEdit;
    Cds_sfxmfybz: TStringField;
    Cds_sfxmph: TStringField;
    Cds_sfxmhsflmc: TStringField;
    Cds_sfxmscpfj: TFloatField;
    Cds_sfxmsclsj: TFloatField;
    Cds_sfxmybxmdm: TStringField;
    Cds_sfxmcd: TStringField;
    Cds_sfxmybjzlb: TStringField;
    Cds_sfxmkzgg: TStringField;
    Cds_sfxmkzph: TStringField;
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
    procedure cbx_jbflChange(Sender: TObject);
    procedure cbx_jbflEnter(Sender: TObject);
    procedure cbx_jbflKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_cyjsChange(Sender: TObject);
    procedure edt_cyjsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_xmmcClick(Sender: TObject);
    procedure edt_xmmcDownClick(Sender: TObject);
    procedure edt_xmmcEnter(Sender: TObject);
    procedure edt_xmmcKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbx_xmggChange(Sender: TObject);
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
    procedure cbx_xmggExit(Sender: TObject);
    procedure dbg_MstDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure dbg_MstMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edt_zxksDownClick(Sender: TObject);
    procedure Cds_sfxmPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
  private
    blChange: Boolean;

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
    procedure SetSfmb(StrMbbm: String);
    procedure Openjjxm;
  public
    blbftf: Boolean;  //部分退费
    iMaxCfxh: Integer;
    fpxmsl: Integer;

    stbr_Info: TStatusBarEx;
    IniFFM: TINIFile;
    StrKsdm: String;
    StrKsmc: String;
    StrKdys: String;
    StrFb: String;
    
    rjjjekj: real; //计价金额合计
    rssjekj: real; //实收金额合计
    StrInsurClass: String;
    StrNInsurclass: String;  //新农合类别
    StrYbbxx: String;  //医保包信息
    StrGrdnh: String;  //个人电脑号
    StrMzlb: Char;   //门诊类别
    Strmrxmfl: String; //默认项目分类
    StrMrxmflmc: String;
    blOKFpxm: Boolean;
    imbxh: Integer;
    Price_depot: String; //划价药房 1-门诊 2住院 3全部
    StrYbmlfb: String;   //医保目录费别
    StrYbmljg: String;   //医保目录机构
    cds_yfpxm: TClientDataSet;
    StrSfyh: String;     //是否优惠
    function GetZxsl: Real;
    function Getbzsl(cds: TClientDataSet;bzjb: Integer): Integer;
    procedure SetXmxx;
    procedure dbgSetFocus(Strcfxh,Strcfxhxs,strYsdm,Strysxm, StrJbfldm, StrJbflmc, StrCybs: String;
      Const blAppend: Boolean = true);
    function CheckRecord: TRowStatus; //检查记录是否合格

    function SetFpxm(StrBrbsh, Strxm, StrFb, Strmzrq, StrJzxh, StrSysDt: String;
      var StrYfphm: String; var StrXFphm: String): boolean;
    function SaveData(var AErrStr: String): Boolean;

    procedure SetInput;
    procedure SetPosition(ARect : TRect;Com : TWinControl);//设置控件坐标
    procedure SetVisible(Sender : TWinControl); //设置控件显示
    procedure INITFM;
    Procedure UnINITFM;
    procedure OpenInsur;
    procedure SetInsurMst(AOutpFeeRst: TOutpFeeRst; Strxtsj: String);
    procedure SetPrnBill(StrPzdm: String; const bldyhspj: Boolean = true);
    function QryPrc(AStrLx,AStrYpbz, Ajbfldm, AStrXmdm: String; Const AStrXmgg: String = '!'): Boolean;
  end;

implementation

uses dm_u, ypggxz_u, mzxmxz_u;

{$R *.dfm}

{ Tmzpj_fm }

function Tmzpj_fm.CheckRecord: TRowStatus;
var
  strkfdm: String;
begin
  result:= rsVaild;
  with cds_sfxm do
  begin
    if FieldByName('cfxh').AsInteger = 0 then
    begin
      result:= rsBlank;
      exit;
    end
    else if FieldByName('jbfldm').AsString= '' then
    begin
      result:= rsInvaild;
      exit;
    end
    else if FieldByName('xmmc').AsString= '' then
    begin
      result:= rsInvaild;
      exit;
    end
    else if FieldByName('jg').AsFloat = 0 then
    begin
      result:= rsInvaild;
      exit;
    end
    else if FieldByName('sl').AsFloat = 0 then
    begin
      result:= rsInvaild;
      exit;
    end
    else if (FieldByName('zxksdm').AsString= '') or (FieldByName('zxksdm').AsString= '*') then
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
      {with dm.Cds_Qry do
      begin
        Close;
        CommandText:='select ypgg,sum(sl-nvl(ydsl,0)) as sl from yp_ypkc where ypbm='''+Cds_Sfxm.FieldByName('xmdm').AsString
          +''' and bzgg='''+Cds_sfxm.FieldByName('xmgg').AsString+''' and cjbs= '''
          +cds_sfxm.FieldByName('cjbs').AsString+''' and kf='''+cds_sfxm.FieldByName('zxksdm').AsString+''' group by ypgg';
        Open;
        //stbr_info.Panels[1].Text:= '库存：'+FieldByName('sl').AsString;
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

      end;}
      if FieldbyName('fybz').AsString='' then
      begin
        if dm.Cds_Com.FieldByName('sl').AsFloat< GetZxsl then
        begin
          MsgInfo('库存数量不足',2);
          result:= rslackAmount;
          exit;
        end;
        edit;
        FieldByName('ypgg').AsString:= dm.Cds_Com.FieldByName('ypgg').AsString;
        Post;
      end;
    end;
  end;

end;

procedure Tmzpj_fm.dbgSetFocus(Strcfxh, Strcfxhxs, strYsdm, Strysxm,
  StrJbfldm, StrJbflmc, StrCybs: String; const blAppend: Boolean);
begin
  pnl_sfxm.Enabled:= true;
  iMaxCfxh:= Max(iMaxCfxh,StrToIntDef(StrCfxh,0));
  with Cds_sfxm do
  begin
    if (CheckRecord=rsVaild) or (RecordCount=0) then
    begin
      if (blAppend) then
        Append
      else
      begin
        next;
        insert;

      end;
      FieldByName('cfxh').AsString:= Strcfxh;
      FieldByName('cfxhxs').AsString:= Strcfxhxs;
      FieldByName('ysdm').AsString:= Strysdm;
      FieldByName('ysxm').AsString:= Strysxm;
      FieldByName('jbfldm').AsString:= Strjbfldm;
      FieldByName('jbflmc').AsString:= Strjbflmc;
      FieldByName('cyjs').AsInteger:= max(StrToIntDef(StrCybs,0),1);
    end;
    if StrJbfldm<>'' then
      dbg_mst.SelectedIndex:= 4
    else
      dbg_mst.SelectedIndex:= 2;
  end;
  SetInput;
end;

function Tmzpj_fm.SaveData(var AErrStr: String): Boolean;
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
    OleTable[iOle-1]:= 'mf_ylsjjl';
    inc(iOle);
  end
  else
  begin
    MsgInfo('没有费用主记录',2);
    result:= false;
    exit;
  end;
  if dm.Cds_Dtl.ChangeCount > 0 then
  begin
    SetLength(OleData,iOle);
    SetLength(OleTable,iOle);
    OleData[iOle-1]:= dm.Cds_Dtl.Delta;
    OleTable[iOle-1]:= 'mf_brzlfy';
    inc(iOle);
  end
  else
  begin
    MsgInfo('没有费用明细',2);
    result:= false;
    exit;
  end;
  if dm.Cds_Dtl1.ChangeCount > 0 then
  begin
    SetLength(OleData,iOle);
    SetLength(OleTable,iOle);
    OleData[iOle-1]:= dm.Cds_Dtl1.Delta;
    OleTable[iOle-1]:= 'mf_brzffs';
    inc(iOle);
  end
  else
  begin
    if StrFb<>'医疗保险' then
    begin
      MsgInfo('没有收费支付记录',2);
      result:= false;
      exit;
    end;
  end;
  if dm.Cds_Dtl2.ChangeCount > 0 then
  begin
    SetLength(OleData,iOle);
    SetLength(OleTable,iOle);
    OleData[iOle-1]:= dm.Cds_Dtl2.Delta;
    OleTable[iOle-1]:= 'mf_kdjl';
    inc(iOle);
  end
  else
  begin
    MsgInfo('没有开单明细记录',2);
    result:= false;
    exit;
  end;
  if dm.cds_Dtl4.ChangeCount > 0 then
  begin
    SetLength(OleData,iOle);
    SetLength(OleTable,iOle);
    OleData[iOle-1]:= dm.Cds_Dtl4.Delta;
    OleTable[iOle-1]:= 'yp_mz_dffmxl';
    inc(iOle);
  end;
  if dm.cds_Dtl3.ChangeCount > 0 then
  begin
    SetLength(OleData,iOle);
    SetLength(OleTable,iOle);
    OleData[iOle-1]:= dm.Cds_Dtl3.Delta;
    OleTable[iOle-1]:= 'yp_mz_dffzjl';
    inc(iOle);
  end;
  if dm.Cds_dtl5.ChangeCount > 0 then
  begin
    SetLength(OleData,iOle);
    SetLength(OleTable,iOle);
    OleData[iOle-1]:= dm.Cds_Dtl5.Delta;
    OleTable[iOle-1]:= 'yb_mzsfmx';
    inc(iOle);
  end
  else
  begin
    if StrFb='医疗保险' then
    begin
      MsgInfo('没有医保明细记录',2);
      result:= false;
      exit;
    end;
  end;
  if iOle<4 then
  begin
    MsgInfo('数据项目不一致，不能收费',2);
    result:= false;
    exit;
  end;
  {if dm.Cds_dtl6.ChangeCount > 0 then
  begin
    SetLength(OleData,iOle);
    SetLength(OleTable,iOle);
    OleData[iOle-1]:= dm.Cds_Dtl6.Delta;
    OleTable[iOle-1]:= 'yb_mzsfzjl';
    inc(iOle);
  end;}
  v1:= VarArrayCreate([0,iOle-2],varVariant);
  v2:= VarArrayCreate([0,iOle-2],varVariant);
  for iErr:= Low(OleData) to High(OleData) do
  begin
    v1[iErr]:= OleData[iErr];
    v2[iErr]:= OleTable[iErr];
  end;
  dm.SockConn.AppServer.Updates(v1,v2,0,iErr,AErrStr);
  if iErr=0 then
  begin
    result:= true;
  end
  else
    result:= false;

end;

function Tmzpj_fm.SetFpxm(StrBrbsh, Strxm, StrFb, Strmzrq, StrJzxh, StrSysDt: String;
      var StrYfphm: String; var StrXFphm: String): Boolean;
(*生成发票项目*)
function Addfpxm: Boolean;
var
  StrMzybJzbh, StrXtsj: String;
begin
  Result:= true;
  with Cds_sfxm do
  begin
    if (Cds_fpxm.RecordCount > 0) and (cds_fpxm.RecordCount mod fpxmsl=0) then
    begin
      if (strFb=StrInsurclass) or (StrFb=StrNInsurclass) or (blbftf) then
      begin
        MsgInfo('项目超过发票打印项目，不能收费',2);
        result:= false;
        exit;
      end;
      StrXfphm:= incRcpt_NO(StrXfphm,Win_NOCLen);
    end;
    Cds_fpxm.Append;
    Cds_fpxm.FieldByName('fphm').AsString:= StrXfphm;
    Cds_fpxm.FieldByName('mzsjdm').AsString:= FieldByName('mzfl').AsString;
    Cds_fpxm.FieldByName('mzsjmc').AsString:= FieldByName('mzsjmc').AsString;
    Cds_fpxm.FieldByName('zxksdm').AsString:= FieldByName('zxksdm').AsString;
    Cds_fpxm.FieldByName('zxksmc').AsString:= FieldByName('zxksmc').AsString;
    Cds_fpxm.FieldByName('jjje').AsFloat:= FieldByName('je').AsFloat;
    Cds_fpxm.FieldByName('je').AsFloat:= FieldByName('sfje').AsFloat;
    Cds_fpxm.FieldByName('hsfl').AsString:= FieldByName('hsfl').AsString;
    Cds_fpxm.FieldByName('hsflmc').AsString:= FieldByName('hsflmc').AsString;
    cds_fpxm.FieldByName('fybz').AsString:= FieldByName('fybz').AsString;
    Cds_fpxm.Post;
  end;
  if Strfb=StrInsurClass then
  begin
    StrMzybjzbh:= GetXH('0702',StrXtsj);
    with cds_sfxm do
    begin
      
      {if not Cds_jbybdz.Locate('jbfl',Cds_sfxm.FieldByName('hsfl').AsString,[]) then
      begin
        Result:= false;
        exit;
      end;}
      cds_ybfp.Append;
      cds_ybfp.FieldByName('jzbh').AsString:= StrMzybjzbh;
      Cds_ybfp.FieldByName('jzlb').AsString:= FieldByName('ybjzlb').AsString;
      Cds_ybfp.FieldByName('ysbh').AsString:= FieldByName('ysdm').AsString;
      Cds_ybfp.FieldByName('jzje').AsFloat:= 0;
      Cds_ybfp.FieldByName('jls').AsInteger:= 0;
      Cds_ybfp.FieldByName('hsfl').AsString:= FieldbyName('hsfl').AsString;
      Cds_ybfp.FieldByName('zxks').AsString:= FieldByName('zxksdm').AsString;
      Cds_ybfp.Post;
    end;
  end;
end;
(*生成门诊收据*)
procedure BuildRcpt(StrSysDt: String);
begin
  with dm.Cds_Mst do
  begin
    if not Locate('sjh',cds_fpxm.FieldByName('fphm').AsString,[]) then
    begin
      Append;
      FieldByName('sjh').AsString:= cds_fpxm.FieldByName('fphm').AsString;
      FieldByName('brbsh').AsString:= StrBrbsh;
      FieldByName('xm').AsString:= Strxm;
      FieldByName('xmpy').AsString:= GetSpellCode(PChar(Strxm),1,16);
      FieldByName('fb').AsString:= StrFb;
      FieldByName('jzrq').AsString:= StrMzrq;
      FieldByName('jzxh').AsString:= StrJzxh;
      FieldByName('zfy').AsString:= formatFloat('0.00',Get_Round(cds_fpxm.FieldByName('jjje').AsFloat,2));
      FieldByName('ysf').AsString:= FormatFloat('0.00',Get_Round(cds_fpxm.FieldByName('je').AsFloat,2));
      FieldByName('sky').AsString:= yhxx.yhbs;
      if (StrFb=StrINsurClass) and (not blbftf) then
        FieldByName('jfbz').AsString:= '1'
      else
        FieldByName('jfbz').AsString:= '0';
      FieldByName('jzks').AsString:= StrKsdm;
      FieldByName('sfsj').AsString:= StrSysDt;
      Post;
    end
    else
    begin
      edit;
      FieldByName('zfy').AsFloat:= FieldByName('zfy').AsFloat
        + StrToFloat(FormatFloat('0.00',Get_Round(cds_fpxm.FieldByName('jjje').AsFloat,2)));
      FieldByName('ysf').AsFloat:= FieldByName('ysf').AsFloat
        + StrToFloat(FormatFloat('0.00',Get_Round(cds_fpxm.FieldByName('je').AsFloat,2)));
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
    FieldByName('yhjg').AsString:= Cds_sfxm.FieldByName('yhhjg').AsString;
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
    FieldByName('pbbz').AsString:= cds_sfxm.FieldByName('pbbz').AsString;
    FieldByName('fybz').AsString:= ifthen(cds_sfxm.FieldByName('fybz').AsString='1','1','0');
    FieldByName('tysl').AsFloat:= 0;
    Post;
  end;
end;
(*生成开单记录*)
procedure BuildDeptItem;
begin
  with dm.cds_dtl2 do
  begin
    if not Locate('kdks;kdys;zxks;sjh;hsfl;',VarArrayOf([Strksdm,cds_sfxm.FieldByName('ysdm').AsString,
      cds_sfxm.FieldByName('zxksdm').AsString,
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
      FieldByName('fyly').AsString:= '0';
      FieldByName('jzbh').AsString:= '#';
      FieldByName('yhje').AsFloat:= Cds_sfxm.FieldByName('sfje').AsFloat;
      FieldbyName('brks').AsString:= Strksdm;
      FieldbyName('zxks').AsString:= Cds_sfxm.FieldByName('zxksdm').AsString;
      Post;
    end
    else
    begin
      edit;
      FieldByName('je').AsFloat:= FieldByName('je').AsFloat + Cds_sfxm.FieldByName('je').AsFloat;
      FieldByName('sfje').AsFloat:= FieldByName('sfje').AsFloat + Cds_sfxm.FieldByName('sfje').AsFloat;
      FieldByName('yhje').AsFloat:= FieldByName('yhje').AsFloat + Cds_sfxm.FieldByName('sfje').AsFloat;
      Post;
    end;
  end;
end;
(*生成待发处方主记录*)
procedure BuildPrescMst;
begin
  with dm.cds_Dtl3 do
  begin
    if not Locate('jzrq;jzxh;sfdjh;sjh;kdys;zxyj',VarArrayOf([StrMzrq,strJzxh,
      Cds_sfxm.FieldByName('cfxh').AsString,
      Cds_Sfxm.FieldByName('fphm').AsString,
      Cds_Sfxm.FieldByName('ysdm').AsString,
      Cds_Sfxm.FieldByName('zxksdm').AsString]),[]) then
    begin
      Append;
      FieldByName('jzrq').AsString:= StrMzrq;
      FieldByName('jzxh').AsString:= StrJzxh;
      FieldByName('sfdjh').AsString:= Cds_Sfxm.FieldByName('cfxh').AsString;
      FieldByName('cfxh').AsString:= Cds_Sfxm.FieldByName('cfxh').AsString;
      FieldByName('brbsh').AsString:= StrBrbsh;
      FieldByName('xm').AsString:= StrXm;
      FieldByName('xmpy').AsString:= GetSpellCode(Pchar(StrXM),1,16);
      FieldByName('fb').AsString:= StrFb;
      if Cds_sfxm.FieldByName('jbfldm').AsString = cyjbdm then
        FieldByName('cflb').AsString:= '1'
      else
        FieldByName('cflb').AsString:= '0';
      FieldByName('cfly').AsString:= '0';
      FieldByName('cyjs').AsString:= Cds_sfxm.FieldByName('cyjs').AsString;
      FieldByName('zxyj').AsString:= Cds_Sfxm.FieldByName('zxksdm').AsString;
      FieldByName('kdks').AsString:= StrKsdm;
      FieldByName('kdys').AsString:= Cds_sfxm.FieldByName('ysdm').AsString;
      FieldByName('lrr').AsString:= yhxx.yhbs;
      FieldByName('jjbz').AsString:= '1';
      FieldByName('cfhgbz').AsString:= '1';
      FieldByName('fybz').AsString:= '0';
      FieldByName('sjh').AsString:= Cds_Sfxm.FieldByName('fphm').AsString;
      Post;
    end;
  end;
end;
(*生成待发处方明细*)
function BuildPrescDtl: Boolean;
begin
  result:= false;
  {if dm.cds_Dtl3.FieldByName('zxyj').AsString <> Cds_Sfxm.FieldByName('zxksdm').AsString then
  begin
    MsgInfo('执行科室错误',2);
    exit;
  end;}
  with dm.cds_dtl4 do
  begin
    Append;
    FieldByName('jzrq').AsString:= StrMzrq;
    FieldByName('jzxh').AsString:= StrJzxh;
    FieldByName('sfdjh').AsString:= Cds_Sfxm.FieldByName('cfxh').AsString;
    FieldByName('cfxh').AsString:=  Cds_Sfxm.FieldByName('cfxh').AsString;
    FieldByName('xh').AsInteger:= cds_sfxm.RecNo;
    FieldByName('sjxmfl').AsString:= Cds_Sfxm.FieldByName('mzfl').AsString;
    FieldByName('ypgg').AsString:= cds_sfxm.FieldByName('ypgg').AsString;
    FieldByName('ypbm').AsString:= Cds_Sfxm.FieldByName('xmdm').AsString;
    FieldByName('ypmc').AsString:= Cds_Sfxm.FieldByName('xmmc').AsString;
    FieldByName('bzgg').AsString:= Cds_Sfxm.FieldByName('xmgg').AsString;
    FieldByName('bzdw').AsString:= Cds_Sfxm.FieldByName('zddw').AsString;
    FieldByName('sl').AsFloat:= GetZxsl;
    FieldByName('dw').AsString:= Cds_Sfxm.FieldByName('dw').AsString;
    FieldByName('jg').AsString:= Cds_Sfxm.FieldByName('jg').AsString;
    FieldByName('yhjg').AsString:= Cds_Sfxm.FieldByName('yhhjg').AsString;
    FieldByName('nhbz1').AsString:= Cds_Sfxm.FieldByName('nhbz1').AsString;
    FieldByName('nh1dw').AsString:= Cds_Sfxm.FieldByName('nh1dw').AsString;
    FieldByName('nhbz2').AsString:= Cds_Sfxm.FieldByName('nhbz2').AsString;
    FieldByName('nh2dw').AsString:= Cds_Sfxm.FieldByName('nh2dw').AsString;
    FieldByName('cjbs').AsString:= Cds_Sfxm.FieldByName('cjbs').AsString;
    FieldByName('fy').AsString:= Cds_Sfxm.FieldByName('je').AsString;
    FieldByName('sffy').AsString:= Cds_Sfxm.FieldByName('sfje').AsString;
    FieldByName('sjh').AsString:= Cds_Sfxm.FieldByName('fphm').AsString;
    FieldByName('Ypbzj').AsString:= Cds_Sfxm.FieldByName('ypbzj').AsString;
    FieldByName('cyjs').AsString:= Cds_Sfxm.FieldByName('cyjs').AsString;
    FieldByName('Jbcjbs').AsString:= cds_sfxm.FieldByName('jbcjbs').AsString;
    FieldByName('cfly').AsString:= '0';
    FieldByName('sflsh').AsString:= '0';
    FieldByName('zxyj').AsString:= Cds_Sfxm.FieldByName('zxksdm').AsString;
    FieldByName('fybz').AsString:= '0';
    FieldByName('ph').AsString:= Cds_Sfxm.FieldByName('ph').AsString;
    FieldByName('scpfj').AsString:= Cds_Sfxm.FieldByName('scpfj').AsString;
    FieldByName('sclsj').AsString:= Cds_Sfxm.FieldByName('sclsj').AsString;
    FieldByName('kzgg').AsString:= Cds_Sfxm.FieldByName('kzgg').AsString;
    FieldByName('kzph').AsString:= Cds_Sfxm.FieldByName('kzph').AsString;
    Post;
  end;
  result:= true;
end;
procedure buileInsurdtl(var Aiybzjls: Integer);
  procedure AddInsurDtlHead;
  begin
    with dm.cds_dtl5 do
    begin
      Append;
      FieldByName('Sjh').AsString:= Cds_Sfxm.FieldByName('fphm').AsString;
      FieldByName('jzbh').AsString:= Cds_ybfp.FieldByName('jzbh').AsString;
      FieldByName('yyjbfl').AsString:= cds_sfxm.FieldByName('hsfl').AsString;
      FieldByName('cfxh').AsInteger:= Cds_ybfp.RecNo;
      FieldByName('ysbh').AsString:= Cds_ybfp.FieldByName('ysbh').AsString;
      FieldByName('yyxmbm').AsString:= Cds_sfxm.FieldByName('xmdm').AsString;
      FieldByName('yyxmxh').AsInteger:= cds_sfxm.RECNO;
      //cds_jbybdz.Filter:= '[xmfl]='''+cds_sfxm.FieldByName('hsfl').AsString
    end;
  end;
  procedure EditYbfp(StrJzje: String);
  begin
    with cds_ybfp do
    begin
      Edit;
      FieldByName('jzje').AsFloat:= FieldByName('jzje').AsFloat+ StrToFloat(StrJzje);
      FieldByName('jls').AsInteger:= FieldByName('jls').AsInteger+ 1;
      Post;
    end;
  end;
var
  iNO: Integer;
begin
  iNO:= 1;
  cds_ybfp.Locate('jzlb;hsfl;zxks',VarArrayOf([cds_sfxm.FIeldByName('ybjzlb').AsString,
    cds_sfxm.FieldbyName('hsfl').AsString,cds_sfxm.FielDByName('zxksdm').AsString]),[]);
  with dm.cds_dtl5 do
  begin
    AddInsurDtlHead;
    FieldByName('ybxmxh').AsInteger:= iNO;
    FieldbyName('zxks').AsString:= cds_sfxm.FieldByName('zxksdm').AsString;
    FieldByName('jzlb').AsString:= Cds_sfxm.FieldByName('YBJZLB').AsString;
    FieldByName('ybxmbm').AsString:= Cds_sfxm.FieldbyName('ybxmdm').AsString;
    FieldByName('xmmc').AsString:= Cds_sfxm.FieldByName('xmmc').AsString;
    FieldByName('xmgg').AsString:= Cds_sfxm.FieldByName('xmgg').AsString;
    FieldByName('xmdw').AsString:= Cds_sfxm.FieldByName('dw').AsString;
    FieldByName('jg').AsString:= Cds_sfxm.FieldByName('yhhjg').AsString;
    FieldByName('sl').AsFloat:= Cds_sfxm.FieldByName('sl').AsFloat;
    FieldByName('cyjs').AsString:= Cds_sfxm.FieldByName('cyjs').AsString;
    FieldByName('cdlb').AsString:= Cds_sfxm.FielDByName('cd').AsString;
    FieldByName('zflb').AsString:= Cds_sfxm.FieldByName('zflb').AsString;
    Post;
    EditYbfp(formatFloat('0.0000',StrToFloat(FormatFloat('0.0000',FieldByname('jg').AsFloat+0.00001))*FieldByName('sl').AsFloat*FieldByName('cyjs').AsInteger));
    inc(Aiybzjls);
    {if cds_sfxm.FieldByName('ypbz').AsString='1' then
      cds_ybml.Filter:= '[xmfl]='''+cds_sfxm.FieldByName('hsfl').AsString
        +''' and [xmdm]='''+Cds_sfxm.FieldByName('xmdm').AsString
        +''' and [ybxmgg]='''+cds_sfxm.FieldByName('xmgg').AsString+''''
    else
      cds_ybml.Filter:= '[xmfl]='''+cds_sfxm.FieldByName('hsfl').AsString
        +''' and [xmdm]='''+Cds_sfxm.FieldByName('xmdm').AsString+'''';
    Cds_ybml.First;
    iNO:= 1;
    cds_ybfp.Locate('jzlb',cds_ybml.FIeldByName('ybjzfl').AsString,[]);
    case cds_ybml.RecordCount of
      0:
      begin
        AddInsurDtlHead;
        FieldByName('ybxmxh').AsInteger:= iNO;
        FieldByName('xmmc').AsString:= Cds_sfxm.FieldByName('xmmc').AsString;
        FieldByName('xmgg').AsString:= Cds_sfxm.FieldByName('xmgg').AsString;
        FieldByName('xmdw').AsString:= Cds_sfxm.FieldByName('dw').AsString;
        FieldByName('jg').AsString:= Cds_sfxm.FieldByName('yhhjg').AsString;
        FieldByName('sl').AsString:= Cds_sfxm.FieldByName('sl').AsString;
        FieldByName('cyjs').AsString:= Cds_sfxm.FieldByName('cyjs').AsString;
        FieldByName('cdlb').AsString:= '1';
        FieldByName('zflb').AsString:= '3';
        Post;

        EditYbfp(formatFloat('0.0000',FieldByname('jg').AsFloat*FieldByName('sl').AsFloat*FieldByName('cyjs').AsInteger));
        inc(Aiybzjls);
      end;
      1:
      begin
        AddInsurDtlHead;
        FieldByName('ybxmxh').AsInteger:= iNO;
        FieldByName('jzlb').AsString:= Cds_ybml.FieldByName('YBJZFL').AsString;
        FieldByName('ybxmbm').AsString:= Cds_ybml.FieldbyName('ybxmdm').AsString;
        FieldByName('xmmc').AsString:= Cds_sfxm.FieldByName('xmmc').AsString;
        FieldByName('xmgg').AsString:= Cds_sfxm.FieldByName('xmgg').AsString;
        FieldByName('xmdw').AsString:= Cds_sfxm.FieldByName('dw').AsString;
        FieldByName('jg').AsString:= Cds_sfxm.FieldByName('yhhjg').AsString;
        FieldByName('sl').AsFloat:= Cds_sfxm.FieldByName('sl').AsFloat;
        FieldByName('cyjs').AsString:= Cds_sfxm.FieldByName('cyjs').AsString;
        FieldByName('cdlb').AsString:= cds_ybml.FielDByName('cd').AsString;
        FieldByName('zflb').AsString:= cds_ybml.FieldByName('zflb').AsString;
        Post;
        EditYbfp(formatFloat('0.0000',FieldByname('jg').AsFloat*FieldByName('sl').AsFloat*FieldByName('cyjs').AsInteger));
        inc(Aiybzjls);
      end;
    else
      cds_ybml.First;
      while not cds_ybml.eof do
      begin
        AddInsurDtlHead;
        FieldByName('ybxmxh').AsInteger:= iNO;
        FieldByName('ybxmbm').AsString:= Cds_ybml.FieldbyName('ybxmdm').AsString;
        FieldByName('xmmc').AsString:= cds_ybml.FieldByName('ybxmmc').AsString;
        FieldByName('xmgg').AsString:= Cds_sfxm.FieldByName('xmgg').AsString;
        FieldByName('xmdw').AsString:= Cds_sfxm.FieldByName('dw').AsString;
        FieldByName('jg').AsFloat:= cds_ybml.FieldByName('jg').AsFloat*
          IfThen(cds_sfxm.FieldByName('je').AsFloat=0,1,Cds_sfxm.FieldByName('sfje').AsFloat/cds_sfxm.FieldByName('je').AsFloat);
        FieldByName('sl').AsFloat:= cds_ybml.FieldByName('sl').AsFloat*Cds_sfxm.FieldByName('sl').AsFloat;
        FieldByName('cyjs').AsString:= Cds_sfxm.FieldByName('cyjs').AsString;
        FieldByName('cdlb').AsString:= cds_ybml.FielDByName('cd').AsString;
        FieldByName('zflb').AsString:= cds_ybml.FieldByName('zflb').AsString;
        Post;
        EditYbfp(formatFloat('0.0000',FieldByname('jg').AsFloat*FieldByName('sl').AsFloat*FieldByName('cyjs').AsInteger));
        inc(Aiybzjls);
        inc(iNO);
        cds_ybml.Next;
      end;
    end;}
  end;
end;
var
  iybzjls: Integer;
  iCnt: Integer;
  OutpMst: TOutpFeeMst;  //发包头
  OutpDtl: TOutpFeeDtl;  //明细头
  OutpItem: TOutpFeeItem;  //明细项目
  ilsmbxh: Integer;
begin
  blOKFpxm:= true;
  iYbzjls:= 0;
  StrYbbxx:= '';
  StrXfphm:= StrYFphm;
  result:= false;
  with cds_sfxm do
  begin
    First;
    while not eof do
    begin
      if FieldByName('ypbz').AsString='1' then  //药品
      begin
        if not Cds_fpxm.Locate('mzsjdm;zxksdm;fybz',VarArrayOf([FieldByName('mzfl').AsString,
          FieldByName('zxksdm').AsString,FieldByName('fybz').AsString]),[]) then
        begin
          blOKFpxm:= AddFpxm;
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
        //if ilsMbxh<>FieldByName('cfxh').AsInteger then
        if not Cds_fpxm.Locate('mzsjdm;zxksdm;hsfl;fybz',VarArrayOf([FieldByName('mzfl').AsString,
          FieldByName('zxksdm').AsString,FieldByName('hsfl').AsString,FieldByName('fybz').AsString]),[]) then
          blOKFpxm:= AddFpxm
        else
        begin
          Cds_fpxm.Edit;
          cds_fpxm.FieldByName('jjje').AsFloat:= Cds_fpxm.FieldByName('jjje').AsFloat
            +FieldByName('je').AsFloat;
          Cds_fpxm.FieldByName('je').AsFloat:= Cds_fpxm.FieldByName('je').AsFloat
            +FieldByName('sfje').AsFloat;
          Cds_fpxm.Post;
        end;
      end;
      ilsMbxh:= FieldByName('cfxh').AsInteger;
      edit;
      //FieldByName('fphm').AsString:= StrXfphm;
      FieldByName('fphm').AsString:= Cds_fpxm.FieldByName('fphm').AsString;
      Post;
      //if not dm.Cds_Mst.Locate('sjh',StrXfphm,[]) then

      BuildBill; //生成明细
      BuildDeptItem; //生成核算
      if (Strfb=StrInsurClass) and (not blbftf) then
        buileInsurdtl(iybzjls);    //生成医保信息
      if (FieldByName('ypbz').AsString = '1') and (FieldByName('fybz').AsString<>'1') then
      begin
        BuildPrescMst;//生成处方主记录
        if not BuildPrescDtl then
        begin
          blOKFpxm:= false;
          exit;//生成处方明细
        end;
      end;
      next;
    end;
  end;
  //EditPrescNO;//修改处方号

  with cds_fpxm do
  begin
    First;
    while not eof do
    begin
      BuildRcpt(StrSysDt); //生成发票
      rjjjekj:= rjjjekj+ StrToFloatDef(FormatFloat('0.00',Get_Round(FieldByName('jjje').asFloat,2)),0.0);
      rssjekj:= rssjekj+ StrToFloatDef(FormatFloat('0.00',Get_Round(FieldByName('je').asFloat,2)),0.0);
      next;
    end;
  end;
  //组医疗保险发送包
  if strfb=StrInsurClass then
  begin

    with dm.cds_dtl5 do
    begin
      {First;
      CdsRcpt.Filtered:= true;
      CdsRcpt.Filter:='[ItemCnt]>0';
      CdsRcpt.First;
      if CdsRcpt.RecordCount = 0 then
      begin
        Application.MessageBox('没有医保项目','提示信息',MB_IconInformation+MB_OK);
        result:= false;
        exit;
      end;}
      //建立包头
      Filter:= '';
      CopyArr(OutpMst.Bc,IntToStr(120+Cds_ybfp.RecordCount*33+RecordCount*104),' ');
      CopyArr(OutpMst.Grdnh,StrGrdnh,' ');
      CopyArr(OutpMst.Sjh,FieldByName('Sjh').AsString,' ');
      CopyArr(OutpMst.Sjje,formatFloat('0.00',rssjekj+0.00001),' ',2);
      OutpMst.mzlb:= StrMzlb;
      CopyArr(OutpMst.cfzs,IntToStr(cds_ybfp.RecordCount),' ');
      OutpMst.cf1wz:= ' 121';
      OutpMst.cf2wz:= '    ';
      OutpMst.cf3wz:= '    ';
      OutpMst.cf4wz:= '    ';
      OutpMst.cf5wz:= '    ';
      OutpMst.cf6wz:= '    ';
      OutpMst.cf7wz:= '    ';
      OutpMst.cf8wz:= '    ';
      OutpMst.cf9wz:= '    ';
      OutpMst.cf10wz:= '    ';
      OutpMst.cf11wz:= '    ';
      OutpMst.cf12wz:= '    ';
      OutpMst.cf13wz:= '    ';
      OutpMst.cf14wz:= '    ';
      OutpMst.cf15wz:= '    ';
      OutpMst.cf16wz:= '    ';
      OutpMst.cf17wz:= '    ';
      OutpMst.cf18wz:= '    ';
      if Cds_ybfp.RecordCount > 1 then
      begin
        Cds_ybfp.RecNo:= 1;
        icnt:= Cds_ybfp.FieldByName('jls').AsInteger;
        CopyArr(OutpMst.cf2wz,IntToStr(120+33+iCnt*104+1),' ');
      end;

      if Cds_ybfp.RecordCount > 2 then
      begin
        Cds_ybfp.RecNo:= 2;
        iCnt:= iCnt + Cds_ybfp.FieldByName('jls').AsInteger;
        CopyArr(OutpMst.cf3wz,IntToStr(120+33*2+iCnt*104+1),' ');
      end;
      StrYbbxx:= OutpMst.MstInfo;
      Filtered:= true;
      cds_ybfp.First;
      while not cds_ybfp.Eof do
      begin
        Filter:= '[jzlb]='''+cds_ybfp.FieldByName('jzlb').AsString
          +''' and [yyjbfl]='''+cds_ybfp.FieldByName('hsfl').AsString
          +''' and [zxks]='''+cds_ybfp.FieldByName('zxks').AsString+'''';
        CopyArr(OutpDtl.jzbh,FieldByName('jzbh').AsString,' ');
        CopyArr(OutpDtl.jzlb,FieldByName('jzlb').AsString,' ');
        CopyArr(OutpDtl.ysbh,FieldByName('ysbh').AsString,' ');
        CopyArr(OutpDtl.jzje,trim(format('%8.2f',[cds_ybfp.FieldByName('jzje').AsFloat+0.00001])),' ',2);
        StrYbbxx:= StrYbbxx + OutpDtl.MstInfo;
        First;
        while Not Eof do
        begin
          CopyArr(OutpItem.ybxmbm,FieldByName('ybxmbm').AsString,' ');
          CopyArr(OutpItem.yyxmbm,FieldByName('yyxmbm').AsString,' ');
          CopyArr(OutpItem.xmmc,FieldByName('xmmc').AsString,' ');
          CopyArr(OutpItem.xmgg,FieldByName('xmgg').AsString,' ');
          CopyArr(OutpItem.xmdw,FieldByName('xmdw').AsString,' ');
          CopyArr(OutpItem.jg,format('%8.4f',[FieldByName('jg').AsFloat+0.00001]),' ',4);
          CopyArr(OutpItem.sl,format('%8.2f',[FieldByName('sl').AsFloat]),' ',2);
          CopyArr(OutpItem.cyjs,FieldByName('cyjs').AsString,' ');
          if FieldByName('cdlb').AsString='' then
            OutpItem.cd:= ' '
          else
            OutpItem.cd:= FieldByName('cdlb').AsString[1];
          if FieldByName('zflb').AsString='' then
            OutpItem.zflb:= '3'
          else
            OutpItem.zflb:= FieldByName('zflb').AsString[1];

          StrYbbxx:= StrYbbxx + OutpItem.MstInfo;
          next;
        end;
        Cds_ybfp.Next;
      end;
      Cds_ybfp.Filtered:= false;
      Cds_ybfp.Filter:= '';
      Filtered:= false;
    end;
  end;
  result:= blOKFpxm;
end;

procedure Tmzpj_fm.SetInput;
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
      {edt_cfys.Text:= cds_sfxm.FieldByName('ysxm').AsString;
      SetPosition(r,edt_cfys);}
    end;
    2:
    begin
      edt_cfxh.Text:= Cds_sfxm.FieldByName('cfxh').AsString;
      SetPosition(r,edt_cfxh);
    end;
    3:
    begin
      cbx_jbfl.ItemIndex:= cbx_jbfl.ItemCodes.IndexOf(StrJbfldm);
      SetPosition(r,cbx_jbfl);
    end;
    4:
    begin
      if (Cds_sfxm.FieldByName('jbfldm').AsString=Cyjbdm)
        and (Cds_sfxm.FieldByName('jbflmc').AsString<>'' ) then
      begin
        SetPosition(r,edt_cyjs);
      end;
    end;
    5:
    begin
      //if (StrJbfldm<>'') then
      begin
        edt_xmmc.Text:= cds_sfxm.FieldByName('xmmc').AsString;
        SetPosition(r,edt_xmmc);
      end;
    end;
    6:
    begin
      if (StrJbfldm<>'') and (Cds_sfxm.FieldByName('jbjls').AsInteger>1) then
      begin
        //cbx_xmgg.ItemIndex:= cbx_xmgg.Items.IndexOf(cds_sfxm.FieldByName('xmgg').AsString);
        SetPosition(r,edt_xmgg);
      end;
    end;
    7:
    begin
      if (StrJbfldm<>'') and ((Cds_sfxm.FieldByName('mzcl1').AsString='1')
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
      end;
    end;
    8:
    begin
      if (StrJbfldm<>'') and (cds_sfxm.FieldByName('jbjg').AsFloat = 0) then
      begin
        edt_jg.Text:= cds_sfxm.FieldByName('jg').AsString;
        SetPosition(r,edt_jg);
      end;
    end;
    9:
    begin
      if (StrJbfldm<>'') and (cds_sfxm.FieldByName('xmgg').AsString<>'') then
      begin
        edt_sl.Text:= cds_sfxm.FieldByName('sl').AsString;
        SetPosition(r,edt_sl);
      end;
    end;
    10:
    begin
      if (StrJbfldm<>'') and ((cds_sfxm.FieldbyName('jbzxks').AsString='*')
        or (cds_sfxm.FieldByName('jbzxks').AsString='')) then
      begin
        edt_zxks.Text:= Cds_sfxm.FieldByName('zxksmc').AsString;
        SetPosition(r,edt_zxks);
      end;
    end;
  end;

end;

procedure Tmzpj_fm.SetPosition(ARect: TRect; Com: TWinControl);
begin
  SetVisible(Com);
  SetPositionU(ARect,Com);
end;

procedure Tmzpj_fm.SetVisible(Sender: TWinControl);
begin
  edt_cfxh.Visible:= false;
  edt_cfys.Visible:= false;
  cbx_jbfl.Visible:= false;
  edt_cyjs.Visible:= false;
  edt_xmmc.Visible:= false;
  cbx_dw.Visible:= false;
  edt_xmgg.Visible:= false;
  edt_jg.Visible:= false;
  edt_sl.Visible:= false;
  edt_zxks.Visible:= false;
end;

procedure Tmzpj_fm.SetXmxx;
var
  StrZflb: String;
  StrCd: String;
  Strybxmdm: String;
  strYbjzlb: String;
begin
  with Cds_Sfxm do
  begin
    if (State <> dsEdit) and (State <> dsInsert) then
      Edit;
    FieldByName('jbjls').AsInteger:= dm.Cds_Com.RecordCount;
    FieldByName('xmgg').AsString:= dm.Cds_Com.FieldByName('xmgg').AsString;

    FieldByName('zddw').AsString:= dm.Cds_Com.FieldByName('dw').AsString;
    FieldByName('yhbl').AsString:= dm.Cds_Com.FieldByName('yhbl').AsString;
    FieldByName('yhjg').AsFloat:= dm.Cds_Com.FieldByName('jg').AsFloat*FieldByName('yhbl').AsFloat;
    if ypzldw='0' then  //药品最小出单位
    begin
      FieldByName('dw').AsString:= dm.Cds_Com.FieldByName('dw').AsString;
      FieldByName('jg').AsString:= dm.Cds_Com.FieldByName('jg').AsString;
      FieldByName('yhhjg').AsFloat:= FieldByName('yhjg').AsFloat;
      FieldByName('ypbzj').AsInteger:= 0;
    end
    else
    begin
      if (dm.Cds_Com.FieldByName('mzcl1').AsString = '1') then
      begin
        FieldByName('dw').AsString:= dm.Cds_Com.FieldByName('nh1dw').AsString;
        FieldByName('jg').AsFloat:= Get_Round(dm.Cds_Com.FieldByName('jg').AsFloat/GetBzsl(dm.Cds_Com,0),4);
        FieldByName('yhhjg').AsFloat:= Get_Round(FieldByName('yhjg').AsFloat/GetBzsl(dm.Cds_Com,0),4);
        FieldByName('ypbzj').AsInteger:= 1;
      end
      else if (dm.Cds_Com.FieldByName('mzcl2').AsString = '1') then
      begin
        FieldByName('dw').AsString:= dm.Cds_Com.FieldByName('nh2dw').AsString;
        FieldByName('jg').AsFloat:= Get_Round(dm.Cds_Com.FieldByName('jg').AsFloat/GetBzsl(dm.Cds_Com,2),4);
        FieldByName('yhhjg').AsFloat:= Get_Round(FieldByName('yhjg').AsFloat/GetBzsl(dm.Cds_Com,2),4);
        FieldByName('ypbzj').AsInteger:= 2;
      end
      else
      begin
        FieldByName('dw').AsString:= dm.Cds_Com.FieldByName('dw').AsString;
        FieldByName('jg').AsString:= dm.Cds_Com.FieldByName('jg').AsString;
        FieldByName('ypbzj').AsInteger:= 0;
        FieldByName('yhhjg').AsFloat:= FieldByName('yhjg').AsFloat;
      end;

    end;
    FieldByName('jbjg').AsString:= dm.Cds_Com.FieldBYName('jg').AsString;
    FieldByName('mzfl').AsString:= dm.Cds_Com.FieldByName('mzfl').AsString;
    FieldByName('mzsjmc').AsString:= dm.Cds_Com.FieldByName('mzsjmc').AsString;
    FieldByName('hsfl').AsString:= dm.Cds_Com.FieldByName('hsfl').AsString;
    FieldByName('kjkm').AsString:= dm.Cds_Com.FieldByName('kjkm').AsString;
    FieldByName('baxm').AsString:= dm.Cds_Com.FieldByName('bafl').AsString;
    FieldByName('ypbz').AsString:= dm.Cds_Com.FieldByName('ypbz').AsString;
    FieldByName('mzcl1').AsString:= dm.Cds_Com.FieldByName('mzcl1').AsString;
    FieldByName('mzcl2').AsString:= dm.Cds_Com.FieldByName('mzcl2').AsString;
    FieldByName('nhbz1').AsString:= dm.Cds_Com.FieldByName('nhbz1').AsString;
    FieldByName('nh1dw').AsString:= dm.Cds_Com.FieldByName('nh1dw').AsString;
    FieldByName('nhbz2').AsString:= dm.Cds_Com.FieldByName('nhbz2').AsString;
    FieldByName('nh2dw').AsString:= dm.Cds_Com.FieldByName('nh2dw').AsString;

    FieldByName('cjbs').AsString:= dm.Cds_Com.FieldByName('cjbs').AsString;
    FieldByName('pbbz').AsString:= dm.Cds_Com.FieldByName('pbbz').AsString;
    FieldByName('jbcjbs').AsString:= dm.Cds_Com.FieldByName('jbcjbs').AsString;
    FieldByName('hsflmc').AsString:= dm.Cds_Com.FieldByName('hsflmc').AsString;
    if FieldByName('ypbz').AsString='1' then
    begin
      stbr_info.Panels[1].Text:= '库存:('+dm.Cds_Com.FieldByName('sl').AsString+')'+dm.Cds_Com.FieldByName('ypdw').AsString;
      FieldByName('kzgg').AsString:= dm.Cds_Com.FieldByName('kzgg').AsString;
      FieldByName('kzph').AsString:= dm.Cds_Com.FieldByName('kzph').AsString;
    end
    else
      stbr_info.Panels[1].Text:= '';
    if dm.Cds_Com.FieldByName('zxks').AsString='#' then
    begin
      FieldByName('zxksmc').AsString:= Strksmc;
      FieldByname('zxksdm').AsString:= Strksdm;
      FieldByname('jbzxks').AsString:= Strksdm;
    end
    else if dm.Cds_Com.FieldByName('zxks').AsString='*' then
    begin
      FieldByName('zxksmc').AsString:= Strksmc;
      FieldByname('zxksdm').AsString:= Strksdm;
      FieldByname('jbzxks').AsString:= dm.Cds_Com.FieldByName('zxks').AsString;
    end
    else
    begin
      FieldByName('zxksmc').AsString:= dm.Cds_Com.FieldByName('ksmc').AsString;
      FieldByname('zxksdm').AsString:= dm.Cds_Com.FieldByName('zxks').AsString;
      FieldByname('jbzxks').AsString:= dm.Cds_Com.FieldByName('zxks').AsString;
    end;
    if FieldByName('ypbz').AsString='1' then
    begin
      FieldByName('ypgg').AsString:= dm.Cds_Com.FieldByName('ypgg').AsString;
      FieldByName('ph').AsString:= dm.Cds_Com.FieldByName('ph').AsString;
      FieldByName('sclsj').AsString:= dm.Cds_Com.FieldByName('sclsj').AsString;
      FieldByName('scpfj').AsString:= dm.Cds_Com.FieldByName('scpfj').AsString;
    end;
    FieldByName('fybz').AsString:= '0';
    Cds_jbybdz.Locate('fb;ybjg;jbfl',VarArrayof([StrYbmlfb,StrYbmljg,Cds_sfxm.FieldByName('hsfl').AsString]),[]);
    FieldByName('ybjzlb').AsString:= cds_jbybdz.FieldByName('ybfl').AsString;
  end;
end;

procedure Tmzpj_fm.dbg_MstCellClick(Column: TColumnEh);
begin
  if (not (dgRowSelect in dbg_Mst.Options)) then
   if cds_sfxm.FieldByName('fybz').AsString<>'1' then
    SetInput
   else
     SetVisible(nil);
end;

procedure Tmzpj_fm.Cds_sfxmAfterScroll(DataSet: TDataSet);
begin
  if (not (dgRowSelect in dbg_Mst.Options)) and (Cds_sfxm.RecordCount > 1)
    and (pnl_sfxm.Enabled) then
  begin
    SetInput;
  end;
end;

procedure Tmzpj_fm.Cds_sfxmCalcFields(DataSet: TDataSet);
begin
  if Cds_sfxmcyjs.AsInteger > 1 then
  begin
    if Cds_sfxmsl.AsFloat > 0 then
      Cds_sfxmsls.AsString:= Cds_sfxmsl.AsString+'×'+Cds_sfxmcyjs.AsString+'剂';
  end
  else
  begin
    Cds_sfxmsls.AsString:= Cds_sfxmsl.AsString;
  end;
  Cds_sfxmJe.AsFloat:= Cds_sfxmsl.AsFloat* StrToFloat(FormatFloat('0.0000',Cds_sfxmjg.AsFloat+0.000001))*Cds_sfxmCyjs.AsInteger;
  cds_sfxmsfje.AsFloat:= Cds_sfxmsl.AsFloat*StrToFloat(FormatFloat('0.0000',Cds_sfxmyhhjg.AsFloat+0.000001))
  *Cds_sfxmCyjs.AsInteger;
end;

procedure Tmzpj_fm.edt_cfysClick(Sender: TObject);
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

procedure Tmzpj_fm.edt_cfysDownClick(Sender: TObject);
begin
  if UpgradeSigleFile(4,exePath+'Dict\','xt_zd_gzry_ys_View.xml','') then
    MsgInfo('更新医生字典成功',1)
  else
    MsgInfo('更新医生字典失败',2);
end;

procedure Tmzpj_fm.edt_cfysEnter(Sender: TObject);
begin
  stbr_Info.Panels[0].Text:= format(strDptEnter2,['医生字典','医生字典']);
  if (edt_cfys.Text='') and (xtxx.AutoShowDpt = 1) then
    edt_cfysClick(Sender);
end;

procedure Tmzpj_fm.edt_cfysKeyDown(Sender: TObject; var Key: Word;
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
    ord('A')..Ord('Z'),Ord('0')..Ord('9'),Ord('%'),96..105:
    begin
      edt_cfys.Text:= '';
      dpt.InitValue:= Chr(Key);
      if not dpt.BlSHow then edt_cfysClick(edt_cfys);
    end;
  end;
end;

procedure Tmzpj_fm.edt_cfxhChange(Sender: TObject);
begin
  with Cds_Sfxm do
  begin
    if (State <> dsEdit) and (State <> dsInsert) then
      Edit;
    FieldByName('cfxh').AsString:= edt_cfxh.Text;
    FieldByName('cfxhxs').AsString:= edt_cfxh.Text;
    FieldByName('jbfldm').AsString:= '';
    fieldByName('jbflmc').AsString:= '';
    iMaxCfxh:= Max(iMaxCfxh,StrToIntDef(edt_cfxh.Text,0));
  end;
end;

procedure Tmzpj_fm.edt_cfxhKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
    begin
      dbg_mst.SelectedIndex:= 2;
      SetInput;
    end;
    {VK_ESCAPE:
    begin
      btn_kjBtn_YgClick(Sender);
    end;}
  end;
end;

procedure Tmzpj_fm.cbx_jbflChange(Sender: TObject);
var
  StrJbfldm: String;
begin
  if cbx_jbfl.ItemIndex < 0 then exit;
  StrJbfldm:= cbx_jbfl.ItemCodes.Strings[cbx_jbfl.ItemIndex];
  with Cds_Sfxm do
  begin
    if (State <> dsEdit) and (State <> dsInsert) then
      Edit;
    if FieldByName('cfxhxs').AsString = '' then
    begin
        inc(iMaxCfxh);
        FieldByName('cfxh').AsInteger:= iMaxCfxh;
        FieldByName('cfxhxs').AsInteger:= iMaxCfxh;
    end;
    FieldByName('cyjsxs').AsString:= '';

    FieldByName('jbfldm').AsString:= StrJbfldm;
    FieldByName('jbflmc').AsString:= cbx_jbfl.Text;
    FieldByName('cyjs').AsString:= '1';
    FieldByName('xmmc').AsString:= '';
    FieldByName('xmgg').AsString:= '';
    FieldByName('dw').AsString:= '';
    FieldByName('jg').AsString:= '';
    FieldByName('sl').AsString:= '';
    FIeldByName('zxksmc').AsString:= '';
    if FieldByName('jbfldm').AsString = cyjbdm then
    begin
      dbg_mst.SelectedIndex:= 3;
    end
    else
      dbg_mst.SelectedIndex:= 4;
    SetInput;
  end;

end;

procedure Tmzpj_fm.cbx_jbflEnter(Sender: TObject);
begin
  stbr_info.Panels[0].Text:= cbx_jbfl.GetItemStr;
end;

procedure Tmzpj_fm.cbx_jbflKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    {VK_ESCAPE:
    begin
      btn_kjBtn_YgClick(Sender);
    end;}
    VK_RETURN:
    begin
      if cds_sfxmjbfldm.AsString= '' then exit;
      if (Cds_sfxmjbfldm.AsString = cyjbdm) and (cds_sfxmcfxhxs.AsInteger > 0) then
        dbg_mst.SelectedIndex:= 3
      else
        dbg_mst.SelectedIndex:= 4;
      SetInput;
    end;
  end;
end;

procedure Tmzpj_fm.edt_cyjsChange(Sender: TObject);
begin
  with Cds_Sfxm do
  begin
    if (State <> dsEdit) and (State <> dsInsert) then
      Edit;
    FieldByName('cyjs').AsString:=  edt_cyjs.Text;
    if FIeldByName('jbflmc').AsString <> '' then
      FieldByName('cyjsxs').AsString:= edt_cyjs.Text;
  end;
end;

procedure Tmzpj_fm.edt_cyjsKeyDown(Sender: TObject; var Key: Word;
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
      if StrToIntDef(edt_cyjs.Text,0) > 0 then
      begin
        dbg_mst.SelectedIndex:= 4;
        SetInput;
      end;
    end;
  end;
end;

procedure Tmzpj_fm.edt_xmmcClick(Sender: TObject);
var
  jbfldm: String;
  Strxmdm: String;
  StrXmmc: String;
  StrYpbz: String;
  StrYbxmdm: String;  //医保项目代码
  StrZflb: String;    //医保支付类别
  StrCd: String;      //医保产地
  i: Integer;
  StrSQL: String;
  StrFilter: String;
  Pg: TPoint;
  icnt1: Integer;
begin
  inherited;
  jbfldm:= cds_sfxm.FieldByName('jbfldm').AsString;
  with mzxmxz_f do
  begin
    InitFilter:= '[jbxmfl]='''+jbfldm+''' and [fb] in (''*'','''+StrYbmlfb+''')';
    IType:= 1;
    iMode:= 3;
    edt_bm:= edt_xmmc;
    AdjustDropDownForm(mzxmxz_f,edt_xmmc);
    ShowItem;
    //ShowModal;
    if not blok then exit;
  end;
  with mzxmxz_f.cds_item do
  begin
    StrYpbz:= FieldByName('ypbz').AsString;
    jbfldm:= FieldByName('jbxmfl').AsString;
    StrXmdm:= FieldByname('xmdm').AsString;
    StrXmmc:= FieldByname('ypmc').AsString;
    StrYbxmdm:= FieldByname('ybxmdm').AsString;
    StrZflb:=FieldByname('zflb').AsString;
    StrCd:= FieldByname('cd').AsString;
  end;
  if jbfldm='*' then
  begin
    SetSfmb(StrXmdm);
    inc(iMbxh);
    exit;
  end;

  with dm.Cds_Com do
  begin
    Close;
    DataRequest('XT_FY_CXJB');
    FetchParams;
    Params.ParamByName('ILx').AsString:= '1';
    Params.ParamByName('IYpbz').AsString:= StrYpbz;
    Params.ParamByName('IXmfldm').AsString:= jbfldm;
    Params.ParamByName('IXmdm').AsString:= StrXmdm;
    Params.ParamByName('IXmgg').AsString:= '!';
    Params.ParamByName('IFb').AsString:= StrFb;
    Params.ParamByName('IKf').AsString:= Price_depot;
    Params.ParamByName('ISfyh').AsString:= StrSfyh;
    Open;
    Filtered:= false;
    iCnt1:= RecordCount;
    Filtered:= true;
    Filter:= '[sl]>0';
    case RecordCount of
      0:
      begin
        if Icnt1=0 then
          MsgInfo('价表记录不存在',2)
        else
          MsgInfo('药品库存数量为0',2);
        edt_xmmc.SelLength:= Length(Edt_xmmc.Text);
        exit;
      end;
      else
        with Cds_Sfxm do
        begin
          if (State <> dsEdit) and (State <> dsInsert) then
            Edit;
          FieldByName('mbxh').AsInteger:= iMbxh;
          inc(iMbxh);
          FieldByName('xmdm').AsString:= Strxmdm;
          FieldByName('ybxmdm').AsString:= Strybxmdm;
          FieldByName('xmmc').AsString:= StrXmmc;
          FieldByName('zflb').AsString:= Strzflb;
          FieldByName('cd').AsString:= Strcd;
          FieldByName('jbjls').AsInteger:= dm.Cds_Com.RecordCount;
          FieldbyName('sl').AsFloat:= 0;
          FieldByName('jbfldm').AsString:= jbfldm;
          FIeldByName('jbflmc').AsString:= cbx_jbfl.Items.Strings[cbx_jbfl.ItemCodes.IndexOf(jbfldm)];
          FieldbyName('ypbz').AsString:= StrYpbz;
        end;
        if (RecordCount=1) and (StrYpbz='0') then
        begin
          SetXmxx;
          if cds_sfxm.FieldByName('jbjg').AsFloat = 0 then
            dbg_mst.SelectedIndex:= 7
          else
            dbg_mst.SelectedIndex:= 8;
        end
        else
        begin
          if not Assigned(ypggxz_f) then
            ypggxz_f:= TYpggxz_f.Create(nil);
          Pg.X:= edt_xmmc.Left;
          Pg.Y:= edt_xmmc.Top;
          Pg:= self.ClientToScreen(pg);
          with ypggxz_f do
          begin
            Left:= pg.X;
            Top:= pg.Y+20;
            ShowModal;
            if not blok then exit;
          end;
          SetXmxx;
          if cds_sfxm.FieldByName('jbjg').AsFloat = 0 then
            dbg_mst.SelectedIndex:= 7
          else
            dbg_mst.SelectedIndex:= 8;
        end;
      end;

  end;

  SetInput;

end;

procedure Tmzpj_fm.edt_xmmcDownClick(Sender: TObject);
var
  Strxmdm: String;
  i: Integer;
begin
  inherited;
  if UpgradeSigleFile(4,exePath+'Dict\','Jbxm.xml','') then
    MsgInfo('更新收费项目字典成功',1)
  else
    MsgInfo('更新收费项目字典失败',2);
end;

procedure Tmzpj_fm.edt_xmmcEnter(Sender: TObject);
begin
  //edt_xmmc.SelStart:= Length(edt_xmmc.Text);
  stbr_info.Panels[0].Text:= format(StrDptEnter2,['收费项目','收费项目']);
  if (edt_xmmc.Text= '') and (xtxx.AutoShowDpt = 1) then
    edt_xmmcClick(Sender);
end;

procedure Tmzpj_fm.edt_xmmcKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  ijbfl: Integer;
begin
  case Key of
    VK_ESCAPE:
    begin
      dbg_mst.SelectedIndex:= 2;
      SetInput;
    end;
    VK_RETURN:
    begin
      if cds_sfxmxmdm.AsString= '' then
      begin
        //SendMessage(cbx_jbfl.Handle,WM_KEYDOWN,VK_RETURN,0);
        exit;
      end;
      if cds_sfxm.FieldByName('jbjg').AsFloat = 0 then
        dbg_mst.SelectedIndex:= 7
      else
        dbg_mst.SelectedIndex:= 8;
      SetInput;
    end;
    Ord('A')..Ord('Z'),Ord('0')..Ord('9'),96..105:
    begin
      if not mzxmxz_f.blShow then
      begin
        edt_xmmc.Text:= '';
        if (Key>=96) and (Key<=105) then
          mzxmxz_f.StrInit:= Chr(Key-48)
        else
          mzxmxz_f.StrInit:= Chr(Key);
        edt_xmmcClick(edt_xmmc);
      end;
    end;
    else
      if ssShift in Shift then
      begin
        iJbfl:= cbx_jbfl.ItemCodes.IndexOf(cds_sfxm.FieldByName('jbfldm').AsString);
        if IJbfl>=cbx_jbfl.Items.Count-2 then
          iJbfl:= 0
        else
          inc(iJbfl);
        cbx_jbfl.ItemIndex:= iJbfl;
        cbx_jbflChange(Cbx_jbfl);
        Shift:=Shift-[ssShift];
      end;
      if ssCtrl in Shift then
      begin
        cbx_jbfl.ItemIndex:= cbx_jbfl.Items.Count - 1;
        cbx_jbflChange(Cbx_jbfl);
      end;
  end;
end;

procedure Tmzpj_fm.cbx_xmggChange(Sender: TObject);
begin
  if not blChange then exit;
  {if cbx_xmgg.ItemIndex < 0 then exit;
  dm.Cds_Com.RecNo := cbx_xmgg.ItemIndex + 1;
  SetXmxx;
  if cds_sfxm.FieldByName('jbjg').AsFloat = 0 then
    dbg_mst.SelectedIndex:= 7
  else
    dbg_mst.SelectedIndex:= 8;
  SetInput;}
end;

procedure Tmzpj_fm.cbx_xmggKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  {case Key of
    VK_ESCAPE:
    begin
      dbg_Mst.SelectedIndex:= 2;
      SetInput;
    end;
    VK_RETURN:
    begin
      if cds_sfxm.FieldByName('jbjg').AsFloat = 0 then
        dbg_mst.SelectedIndex:= 7
      else
        dbg_mst.SelectedIndex:= 8;
      SetInput;
    end;
  end;}
end;

procedure Tmzpj_fm.cbx_dwChange(Sender: TObject);
var
  StrBzsl: Integer;
  StrSpeedChar: String;
begin
  inherited;
  if cbx_dw.ItemIndex < 0 then exit;
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
  SetInput;

end;

procedure Tmzpj_fm.cbx_dwEnter(Sender: TObject);
begin
  stbr_info.Panels[0].Text:= cbx_dw.GetItemStr;
end;

procedure Tmzpj_fm.cbx_dwKeyDown(Sender: TObject; var Key: Word;
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
      dbg_mst.SelectedIndex:= 8;
      SetInput;
    end;
  end;
end;

procedure Tmzpj_fm.edt_jgChange(Sender: TObject);
begin
  with Cds_Sfxm do
  begin
    if (State <> dsEdit) and (State <> dsInsert) then
      Edit;
    FieldByName('jg').AsString:= edt_jg.Text;
    FieldByName('yhjg').AsFloat:= FieldbyName('jg').AsFloat*FieldByName('yhbl').AsFloat;
    FieldByName('yhhjg').AsFloat:= FieldByName('yhjg').AsFloat;
  end;
end;

procedure Tmzpj_fm.edt_jgKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    VK_RETURN:
    begin
      dbg_mst.SelectedIndex:= 8;
      SetInput;
    end;
    VK_ESCAPE:
    begin
      dbg_mst.SelectedIndex:= 2;
      SetInput;
    end;
  end;
end;

procedure Tmzpj_fm.edt_jgExit(Sender: TObject);
begin
  with Cds_Sfxm do
  begin
    if (State <> dsEdit) and (State <> dsInsert) then
      Edit;
    FieldByName('yhjg').AsFloat:= FieldByName('jg').AsFloat*FieldByName('yhbl').AsFloat;
    FieldByName('yhhjg').AsFloat:= FieldByName('yhjg').AsFloat;
  end;
end;

procedure Tmzpj_fm.edt_slChange(Sender: TObject);
begin
  with Cds_Sfxm do
  begin
    if (State <> dsEdit) and (State <> dsInsert) then
      Edit;
    FieldByName('sl').AsString:= edt_sl.Text;
  end;
end;

procedure Tmzpj_fm.edt_slEnter(Sender: TObject);
begin
  if (Cds_sfxm.FieldByName('mzcl1').AsString= '1') or
    (Cds_sfxm.FieldByName('mzcl2').AsString='1') then
    stbr_info.Panels[0].Text:= '按Shift键选择药品单位'
  else
    stbr_info.Panels[0].Text:= '';
end;


procedure Tmzpj_fm.edt_slKeyDown(Sender: TObject; var Key: Word;
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
        if cds_sfxm.FieldByName('sl').AsInteger<> 0 then
        begin
          dbg_mst.SelectedIndex:= 9;
          SetInput;
        end;
      end
      else
      begin
        if checkRecord = rsVaild then dbgSetFocus(cds_sfxmcfxh.AsString,'',cds_sfxmysdm.AsString,
          '',
          Cds_sfxmjbfldm.AsString,'',cds_sfxmcyjs.AsString);
      end;
    end;
    VK_UP:
    begin
      if not Cds_sfxm.Bof then Cds_sfxm.Prior;
      dbg_mst.SelectedIndex:= 8;
      SetInput;
    end;
    VK_Down:
    begin
      if not Cds_sfxm.Eof then Cds_sfxm.Next;
      dbg_mst.SelectedIndex:= 8;
      SetInput;
    end;
  end;
end;

procedure Tmzpj_fm.edt_zxksClick(Sender: TObject);
var
  StrFilter: String;
  StrzxKsdm: String;
begin
  inherited;
  if cds_sfxm.FieldByName('jbzxks').AsString='' then
    StrFilter:= ''
  else if Cds_sfxm.FieldByName('jbzxks').AsString= '*' then
  begin
    with dm.Cds_Qry do
    begin
      Close;
      CommandText:='select zxks from xt_fy_jbxmks where jbfl='''
        +Cds_sfxm.FieldByName('jbfldm').AsString+''' and jbdm='''
        +Cds_sfxm.FieldByName('xmdm').AsString+'''';
      Open;
      StrFilter:= '';
      if (RecordCount > 0) and (FieldByname('zxks').AsString<>'*') then
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

procedure Tmzpj_fm.edt_zxksEnter(Sender: TObject);
begin
  edt_zxks.SelLength:= Length(trim(edt_zxks.Text));
  stbr_info.Panels[0].Text:= format(StrDptEnter2,['科室字典','科室字典']);
  if (edt_zxks.Text= '') and (xtxx.AutoShowDpt = 1) then
    edt_zxksClick(Sender);
end;

procedure Tmzpj_fm.edt_zxksKeyDown(Sender: TObject; var Key: Word;
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
      dbg_mst.SelectedIndex:= 2;
      SetInput;
    end;
    ord('A')..Ord('Z'),Ord('0')..Ord('9'),Ord('%'),96..105:
    begin
      edt_zxks.Text:= '';
      dpt.InitValue:= Chr(Key);
      if not dpt.BlSHow then edt_zxksClick(edt_zxks);
    end;
  end;
end;

procedure Tmzpj_fm.INITFM;
var
  i: Integer;
begin
  with dm.Cds_Qry do
  begin
    Close;
    CommandText:= 'select fldm,flmc from xt_fy_jbxmfl where mzbz=1 order by xh';
    Open;
    while not eof do
    begin
      cbx_jbfl.Items.Add(FieldByName('flmc').AsString);
      cbx_jbfl.ItemInput.Add(FieldByName('fldm').AsString);
      cbx_jbfl.ItemCodes.Add(FieldByName('fldm').AsString);
      next;
    end;
    cbx_jbfl.Items.Add('模板');
    cbx_jbfl.ItemInput.Add('X');
    cbx_jbfl.ItemCodes.Add('*');
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
    StrMrxmfl:= ReadString('项目分类','defaultclass','A');
    Price_depot:= readString('划价药房','Price_depot','1');
    StrInsurclass:= ReadString('软件','insurclass','医疗保险');
    StrNInsurclass:= ReadString('软件','ninsurclass','新农合');
    i:= cbx_jbfl.ItemCodes.IndexOf(StrMrxmfl);
    if i>= 0 then
    StrMrxmflmc:= cbx_jbfl.Items.Strings[i];
  end;
  with mzxmxz_f do
  begin
    OpenDataSet:= OpenJJxm;
    OpenJjxm;
  end;
  OpenInsur;
end;

function Tmzpj_fm.Getbzsl(cds: TClientDataSet;bzjb: Integer): Integer;
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

function Tmzpj_fm.GetZxsl: Real;
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
procedure Tmzpj_fm.cbx_xmggExit(Sender: TObject);
begin
  blChange:= false;
end;

procedure Tmzpj_fm.OpenInsur;
begin
  with Cds_jbybdz do
  begin
    Close;
    CommandText:= 'select * from yb_zd_jbfldz order by jbfl';
    Open;
  end;
end;

procedure Tmzpj_fm.dbg_MstDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if strFb=StrInsurClass then
  begin
    if Cds_Sfxm.FieldByName('zflb').AsString='3' then
      dbg_mst.Canvas.Brush.Color:= $00C8C8FF
    else if Cds_Sfxm.FieldByName('zflb').AsString='2' then
      dbg_mst.Canvas.Brush.Color:= $00FFCD9B
    else
      dbg_mst.Canvas.Brush.Color:=  dbg_mst.EvenRowColor;
  end
  else
    dbg_mst.Canvas.Brush.Color:= dbg_mst.EvenRowColor;
  if cds_sfxm.FieldByName('fybz').AsString='1' then
    dbg_mst.Canvas.Font.Color:= clBlue
  else
    dbg_mst.Canvas.Font.Color:= clBlack;
  dbg_mst.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure Tmzpj_fm.SetInsurMst(AOutpFeeRst: TOutpFeeRst; Strxtsj: String);
begin
  with dm.cds_dtl6,AOutpFeeRst do
  begin
    Append;
    FieldByName('jzrq').AsString:= dm.Cds_Mst.FieldByName('jzrq').AsString;
    FieldByName('jzxh').AsString:= dm.Cds_Mst.FieldByName('jzxh').AsString;
    FieldByName('grdnh').AsString:= Grdnh;
    FieldByName('sjh').AsString:= dm.Cds_Mst.FieldByName('sjh').AsString;
    FieldByName('sjje').AsString:= dm.Cds_Mst.FieldByName('YSF').AsString;
    FieldByName('mzlb').AsString:= StrMzlb;
    FieldByName('jlje').AsFloat:= ArrToFloat(JLJE,2);
    FieldByName('ylje').AsFloat:= ArrToFloat(YLJE,2);
    FieldByName('zfje').AsFloat:= ArrToFloat(ZFJE,2);
    FieldByName('dffs').AsString:= dffs;
    FieldByName('bntcyzf').AsFloat:= ArrToFloat(bntcyzf,2);

    FieldByName('ylzfy').AsFloat:= ArrToFloat(ylzfy,2);
    FieldByName('tcjjzf').AsFloat:= ArrToFloat(tcjjzf,2);
    FieldByName('grzf').AsFloat:= ArrToFloat(grzf,2);
    FieldByName('dbbxje').AsFloat:= ArrToFloat(dbbxje,2);
    FieldByName('dbgrzf').AsFloat:= ArrToFloat(dbgrzf,2);
    FieldByName('cdbje').AsFloat:= ArrToFloat(cdbje,2);
    FieldByName('gwyjb').AsFloat:= ArrToFloat(gwyjb,2);
    FieldByName('gwydb').AsFloat:= ArrToFloat(gwydb,2);
    FieldByName('gwycdb').AsFloat:= ArrToFloat(gwycdb,2);
    FieldByName('knyje').AsFloat:= ArrToFloat(knyje,2);
    FieldByName('kzfje').AsFloat:= ArrToFloat(kzfje,2);
    FieldByName('dqknje').AsFloat:= ArrToFloat(dqknje,2);
    FieldByName('xjzfje').AsFloat:= ArrToFloat(xjzfje,2);
    FieldByName('sfsj').AsString:= Strxtsj;
    FieldByName('czbz').AsString:= '1';
    FieldByName('sydffs').AsString:= '1';
    FieldByName('syjjzf').AsString:= '0';
    FieldByName('syjtts').AsString:= '0';
    FieldByName('syjtzf').AsString:= '0';
    FieldByName('bcwccs').AsString:= '0';
    Post;
  end;
end;

procedure Tmzpj_fm.SetPrnBill(StrPzdm: String; const bldyhspj: Boolean);
  Procedure EditSj(ixh: Integer; StrValue: String);
  begin
    with dm.Cds_Com1 do
    begin
      if Locate('xmxh',ixh,[]) then
      begin
        Edit;
        FieldByName('sj').AsString:= StrValue;
        Post;
      end;
    end;
  end;
  procedure SetHS(iRecNO, iXh: Integer; blhs: Boolean);
  var
    bldyhs: Boolean;
  begin
    with dm.Cds_Com1 do
    begin
      //核算 科室
      bldyhs:= false;
      if (cds_fpxm.RecordCount > (iRecNO-1)) then
      begin
        cds_fpxm.RecNo:= iRecNO;
        if blhs then
          bldyhs:= True
        else
        begin
          if cds_yfpxm.Locate('mzsjdm;zxksdm;hsfl',VarArrayof([cds_fpxm.FieldByName('mzsjdm').AsString,Cds_fpxm.FieldByName('zxksdm').AsString,Cds_fpxm.FieldByName('hsfl').AsString]),[]) then
          begin
            if FormatFloat('0.00',Get_round(cds_yfpxm.FieldbyName('jjje').AsFloat,2))
              =FormatFloat('0.00',Get_round(cds_fpxm.FieldByName('jjje').AsFloat,2)) then
              bldyhs:= false
            else
              bldyhs:= True;
          end
          else
            bldyhs:= True;
        end;
      end
      else
        bldyhs:= false;
      if bldyhs then   //打印执行科室
        EditSj(ixh,cds_fpxm.FieldByName('zxksmc').AsString)
      else
        EditSj(ixh,'作废');
      //核算 姓名
      if bldyhs then
        EditSj(ixh+1,dm.Cds_Mst.FieldByName('xm').AsString)
      else
        EditSj(ixh+1,'');

      {if (cds_fpxm.RecordCount > (iRecNO-1)) then
      begin
        cds_fpxm.RecNo:= iRecNO;
        if (cds_fpxm.FieldByName('fybz').AsString<>'1') then
          EditSj(ixh+1,dm.Cds_Mst.FieldByName('xm').AsString)
        else
          EditSj(ixh+4,'');
      end
      else
        EditSj(ixh+1,'');}
      //核算 项目
      if bldyhs then
         EditSj(ixh+2,cds_fpxm.FieldByName('hsflmc').AsString)
      else
        EditSj(ixh+2,'');
      {if (cds_fpxm.RecordCount > (iRecNO-1)) then
      begin
        cds_fpxm.RecNo:= iRecNO;
        if (cds_fpxm.FieldByName('fybz').AsString<>'1') then
          EditSj(ixh+2,cds_fpxm.FieldByName('hsflmc').AsString)
        else
          EditSj(ixh+4,'');
      end
      else
        EditSj(ixh+2,'');}
      //核算 金额
      if bldyhs then
        EditSj(ixh+3,formatFloat('0.00',Get_round(cds_fpxm.FieldByName('jjje').AsFloat,2)))
      else
        EditSj(ixh+3,'');
      {if (cds_fpxm.RecordCount > (iRecNO-1)) then
      begin
        cds_fpxm.RecNo:= iRecNO;
        if (cds_fpxm.FieldByName('fybz').AsString<>'1') then
          EditSj(ixh+3,formatFloat('0.00',cds_fpxm.FieldByName('je').AsFloat))
        else
          EditSj(ixh+4,'');
      end
      else
        EditSj(ixh+3,'');}
      //票号
      if bldyhs then
        EditSj(ixh+4,'票号:'+dm.Cds_Mst.FieldByName('sjh').AsString)
      else
        EditSj(ixh+4,'');
      if bldyhs then
        EditSj(ixh+5,'医生:'+StrKdys)
      else
        EditSj(ixh+5,'');
      //核算 日期
      if bldyhs then
        EditSj(ixh+6,formatDateTime('yyyy-mm-dd',dm.Cds_Mst.FieldByName('sfsj').AsDateTime))
      else
        EditSj(ixh+6,'');
      if bldyhs then
        EditSj(ixh+7,formatDateTime('hh:mm:ss',dm.Cds_Mst.FieldByName('sfsj').AsDateTime))
      else
        EditSj(ixh+7,'');
      {if (cds_fpxm.RecordCount > (iRecNO-1)) then
      begin
        cds_fpxm.RecNo:= iRecNO;
        if (cds_fpxm.FieldByName('fybz').AsString<>'1') then
          EditSj(ixh+4,formatDateTime('yyyy-mm-dd',dm.Cds_Mst.FieldByName('sfsj').AsDateTime))
        else
          EditSj(ixh+4,'');
      end
      else
        EditSj(ixh+4,'');}
    end;
  end;
  procedure SetXM(iRecNO,iXh: Integer);
  begin
    if cds_fpxm.RecordCount > (iRecNO-1) then  //收费项目
    begin
      cds_fpxm.RecNo:= iRecNO;
      EditSj(ixh,cds_fpxm.FieldByName('mzsjmc').AsString);
    end
    else
        EditSj(ixh,'');
    if cds_fpxm.RecordCount > (iRecNO-1) then       //收费金额
    begin
      cds_fpxm.RecNo:= iRecNO;
      Editsj(ixh+1,formatFloat('0.00',Get_Round(cds_fpxm.FieldByName('jjje').AsFloat,2)));
    end
    else
      EditSj(iXh+1,'');
  end;
begin
  with dm.Cds_Com1 do
  begin
    Close;
    DataRequest('xt_xt_dypz');
    FetchParams;
    Params.ParamByName('IPzdm').AsString:= StrPzdm;
    Open;

    if Params.ParamByName('ErrCode').AsInteger <> 0 then exit;
    dm.Cds_Mst.First;
    cds_fpxm.Filtered:= true;
    try
      if not bldyhspj then
        dm.Cds_Mst.RecNo:= dm.Cds_Mst.RecordCount;

    while not dm.Cds_Mst.Eof do
    begin
      if bldyhspj then
        cds_fpxm.Filter:= '[fphm]='''+dm.Cds_Mst.FieldByName('sjh').AsString+'''';
      EditSj(101,'姓名：'+dm.Cds_Mst.FieldByName('xm').AsString);  //收据姓名
      EditSj(102,formatDateTime('yyyy-mm-dd',dm.Cds_Mst.FieldByName('sfsj').AsDateTime));//收据日期
      SetXm(1,103);  //收费项目1
      SetXm(2,105);  //收费项目2
      Setxm(3,107);  //收费项目3
      EditSj(109,formatFloat('0.00',dm.Cds_Mst.FieldByName('ysf').AsFloat+0.00001));   //收据合计
      EditSj(110,dm.Cds_Mst.FieldByName('sjh').AsString);  //收据流水号
      EditSj(111,yhxx.yhbs);  //收据制单

      if dm.Cds_dtl6.RecordCount =0 then
      begin
        EditSj(201,'作废');          //医保姓名
        EditSj(202,'');              //医保电脑号
        EditSj(203,'');              //个人自费
        EditSj(204,'');              //个人自负
        EditSj(205,'');              //医保起付标准
        EditSj(206,'');              //医保按比例自负
        EditSj(207,'');              //医保统筹记帐
        EditSj(208,'');              //医保大病记帐
        EditSj(209,'');              //医保公务员记帐
        EditSj(210,'');              //医保个人帐户
        EditSj(211,'');              //医保现金支付
        EditSj(212,'作废');          //医保合计
        EditSj(213,'');              //医保流水号
        EditSj(214,'');              //医保制单
      end
      else
      begin
        EditSj(201,dm.Cds_Mst.FieldByName('xm').AsString);
        EditSj(202,dm.Cds_Dtl6.FieldByName('grdnh').AsString);
        EditSj(203,formatFloat('0.00',dm.Cds_Dtl6.FieldByName('zfje').AsFloat));
        EditSj(204,formatFloat('0.00',dm.Cds_Dtl6.FieldByName('grzf').AsFloat));
        EditSj(205,'0.00');
        EditSj(206,formatFloat('0.00',dm.Cds_Dtl6.FieldByName('grzf').AsFloat));
        EditSj(207,formatFloat('0.00',dm.Cds_Dtl6.FieldByName('tcjjzf').AsFloat));
        EditSj(208,formatFloat('0.00',dm.Cds_Dtl6.FieldByName('DBBXJE').AsFloat));
        EditSj(209,formatFloat('0.00',dm.Cds_Dtl6.FieldByName('gwyjb').AsFloat
          +dm.Cds_Dtl6.FieldByName('gwydb').AsFloat+dm.Cds_Dtl6.FieldByName('gwycdb').AsFloat));
        EditSj(210,formatFloat('0.00',dm.Cds_Dtl6.FieldByName('kzfje').AsFloat));
        EditSj(211,formatFloat('0.00',dm.Cds_Dtl6.FieldByName('xjzfje').AsFloat));
        EditSj(212,formatFloat('0.00',dm.Cds_Mst.FieldByName('ysf').AsFloat+0.00001));
        EditSj(213,dm.Cds_Mst.FieldByName('sjh').AsString);
        EditSj(214,yhxx.yhbs);
      end;
      EditSj(301,dm.Cds_Mst.FieldByName('xm').AsString);//发票姓名
      EditSj(302,formatDateTime('yyyy-mm-dd',dm.Cds_Mst.FieldByName('sfsj').AsDateTime)); //发票日期
      {if dm.Cds_dtl6.RecordCount = 0 then   //发票结算形式
        EditSj(27,'自费')
      else
        EditSj(27,ifThen(dm.cds_dtl6.FieldByName('dffs').AsString='0','医院垫付','个人垫付'));}
      EditSj(303,'');
      SetXm(1,304);  //发票项目1
      SetXm(2,306);  //发票项目2
      SetXm(3,308);  //发票项目3
      if dm.cds_dtl6.RecordCount = 0 then
      begin
        if FormatFloat('0.00',dm.Cds_Mst.FieldByName('ysf').AsFloat)<>FormatFloat('0.00',dm.Cds_Mst.FieldByName('zfy').AsFloat) then
          editSj(501,'优惠金额:'+FormatFloat('0.00',dm.Cds_Mst.FieldByName('zfy').AsFloat-dm.Cds_Mst.FieldByName('ysf').AsFloat))
        else
          editSj(501,'');
        editSj(502,'');
        editSj(503,'');
        EditSj(531,formatFloat('0.00',dm.Cds_Mst.FieldByName('ysf').AsFloat+0.00001));  //发票自费费用
        EditSj(532,formatFloat('0.00',dm.Cds_Mst.FieldByName('ysf').AsFloat+0.00001));     //发票个人自付
        EditSj(533,'');                                                           //发票起付标准
        EditSj(534,'');                                                           //发票按比例自负
        EditSj(535,'');                                                           //发票统筹记帐
        EditSj(536,'');                                                           //发票大额记帐
        EditSj(537,'');                                                           //发票公务员记帐
        EditSj(538,'');                                                           //发票个人帐户
        EditSj(539,formatFloat('0.00',dm.Cds_Mst.FieldByName('ysf').AsFloat+0.00001));    //发票现金支付
      end
      else
      begin
        editSj(501,'原余额:'+formatFloat('0.00',dm.Cds_Dtl6.FieldByName('knyje').AsFloat));
        editSj(502,'扣卡:'+formatFloat('0.00',dm.Cds_Dtl6.FieldByName('kzfje').AsFloat));
        editSj(503,'现余额:'+formatFloat('0.00',dm.Cds_Dtl6.FieldByName('dqknje').AsFloat));
        EditSj(531,formatFloat('0.00',dm.Cds_Dtl6.FieldByName('zfje').AsFloat));
        EditSj(532,formatFloat('0.00',dm.Cds_Dtl6.FieldByName('grzf').AsFloat));
        EditSj(533,'0.00');
        EditSj(534,formatFloat('0.00',dm.Cds_Dtl6.FieldByName('grzf').AsFloat));
        EditSj(535,formatFloat('0.00',dm.Cds_Dtl6.FieldByName('tcjjzf').AsFloat));
        EditSj(536,formatFloat('0.00',dm.Cds_Dtl6.FieldByName('dbbxje').AsFloat));
        EditSj(537,formatFloat('0.00',dm.Cds_Dtl6.FieldByName('gwyjb').AsFloat
          +dm.Cds_Dtl6.FieldByName('gwydb').AsFloat+dm.Cds_Dtl6.FieldByName('gwycdb').AsFloat));
        EditSj(538,formatFloat('0.00',dm.Cds_Dtl6.FieldByName('kzfje').AsFloat));
        EditSj(539,formatFloat('0.00',dm.Cds_Dtl6.FieldByName('xjzfje').AsFloat));

      end;
      EditSj(540,CurrToStr(dm.Cds_Mst.FieldByName('ysf').AsFloat));             //发票合计大写
      EditSj(541,formatFloat('0.00',dm.Cds_Mst.FieldByName('ysf').AsFloat+0.00001));     //发票合计小写
      EditSj(542,dm.Cds_Mst.FieldByName('sjh').AsString);  //发票流水号
      EditSj(543,yhxx.yhbs);   //发票制单
      EditSj(544,yhxx.yhbs);   //发票收款
      SetHs(1,901,bldyhspj);  //核算联1
      SetHs(2,931,bldyhspj);  //核算联2
      SetHs(3,961,bldyhspj);  //核算联3
      PrintBill(dm.Cds_Com1,Params.ParamByName('Ipzh').AsInteger,
        Params.ParamByName('Ipzg').AsInteger,poPortrait,false,false);
      dm.cds_mst.next;
    end;
    finally
      cds_fpxm.Filter:= '';
      cds_fpxm.Filtered:= false;
    end;
  end;
end;

procedure Tmzpj_fm.SetSfmb(StrMbbm: String);
var
  blFirst: Boolean;
  i: Integer;
begin
  with dm.Cds_Com do
  begin
    QryPrc('3','','',StrMbbm,'');
    blFirst:= true;
    while not eof do
    begin
      if not blFirst then
        dbgSetFocus(cds_sfxmcfxh.AsString,'',cds_sfxmysdm.AsString,'',
          Cds_sfxmjbfldm.AsString,'',cds_sfxmcyjs.AsString)
      else
        cds_sfxm.Edit;
      with cds_sfxm do
      begin
        FieldByName('mbxh').AsInteger:= iMbxh;
        FieldByName('jbfldm').AsString:= dm.Cds_Com.FieldByName('xmfldm').AsString;
        FieldByName('jbflmc').AsString:= dm.Cds_Com.FieldByName('xmfl').AsString;
        FieldByName('cyjs').AsString:= '1';
        FieldByName('xmdm').AsString:= dm.Cds_Com.FieldByName('xmdm').AsString;
        FieldByName('xmmc').AsString:= dm.Cds_Com.FieldByName('xmmc').AsString;
        FieldByName('xmgg').AsString:= dm.Cds_Com.FieldByName('xmgg').AsString;
        FieldByName('dw').AsString:= dm.Cds_Com.FieldByName('dw').AsString;
        FieldByName('jg').AsString:= dm.Cds_Com.FieldByName('jg').AsString;
        FieldByName('jbjls').AsInteger:= dm.Cds_Com.RecordCount;
        FieldByName('sl').AsString:= dm.Cds_Com.FieldByName('sl').AsString;
        FieldByName('zddw').AsString:= dm.Cds_Com.FieldByName('dw').AsString;
        FieldByName('yhbl').AsString:= dm.Cds_Com.FieldByName('yhbl').AsString;
        FieldByName('yhjg').AsFloat:= dm.Cds_Com.FieldByName('jg').AsFloat*FieldByName('yhbl').AsFloat;
        FieldByName('jbjg').AsString:= dm.Cds_Com.FieldBYName('jg').AsString;
        FieldByName('mzfl').AsString:= dm.Cds_Com.FieldByName('mzfl').AsString;
        FieldByName('mzsjmc').AsString:= dm.Cds_Com.FieldByName('mzsjmc').AsString;
        FieldByName('hsfl').AsString:= dm.Cds_Com.FieldByName('hsfl').AsString;
        FieldByName('kjkm').AsString:= dm.Cds_Com.FieldByName('kjkm').AsString;
        FieldByName('baxm').AsString:= dm.Cds_Com.FieldByName('bafl').AsString;
        FieldByName('ypbz').AsString:= dm.Cds_Com.FieldByName('ypbz').AsString;
        FieldByName('mzcl1').AsString:= dm.Cds_Com.FieldByName('mzcl1').AsString;
        FieldByName('mzcl2').AsString:= dm.Cds_Com.FieldByName('mzcl2').AsString;
        FieldByName('nhbz1').AsString:= dm.Cds_Com.FieldByName('nhbz1').AsString;
        FieldByName('nh1dw').AsString:= dm.Cds_Com.FieldByName('nh1dw').AsString;
        FieldByName('nhbz2').AsString:= dm.Cds_Com.FieldByName('nhbz2').AsString;
        FieldByName('nh2dw').AsString:= dm.Cds_Com.FieldByName('nh2dw').AsString;
        FieldByName('yhhjg').AsFloat:= FieldByName('yhjg').AsFloat;
        FieldByName('ypbzj').AsInteger:= 0;
        FieldByName('cjbs').AsString:= dm.Cds_Com.FieldByName('cjbs').AsString;
        FieldByName('pbbz').AsString:= dm.Cds_Com.FieldByName('pbbz').AsString;
        FieldByName('jbcjbs').AsString:= dm.Cds_Com.FieldByName('jbcjbs').AsString;
        if dm.Cds_Com.FieldByName('zxks').AsString='#' then
        begin
          FieldByName('zxksdm').AsString:= StrKsdm;
          FieldByName('zxksmc').AsString:= Strksmc;
          FieldByName('jbzxks').AsString:= strKsdm;
        end
        else if dm.Cds_Com.FieldByName('zxks').AsString='*' then
        begin
          FieldByName('zxksdm').AsString:= StrKsdm;
          FieldByName('zxksmc').AsString:= Strksmc;
          FieldByName('jbzxks').AsString:= dm.Cds_Com.FieldByName('zxks').AsString;
        end
        else
        begin
          FieldByName('zxksmc').AsString:= dm.Cds_Com.FieldByName('ksmc').AsString;
          FieldByname('zxksdm').AsString:= dm.Cds_Com.FieldByName('zxks').AsString;
          FieldByname('jbzxks').AsString:= dm.Cds_Com.FieldByName('zxks').AsString;
        end;
        FieldbyName('zflb').AsString:= dm.Cds_Com.FieldByName('zflb').AsString;
        FieldbyName('ybxmdm').AsString:= dm.Cds_Com.FieldByName('ybxmdm').AsString;
        FieldbyName('cd').AsString:= dm.Cds_Com.FieldByName('cd').AsString;
        Cds_jbybdz.Locate('jbfl',Cds_sfxm.FieldByName('hsfl').AsString,[]);
        FieldByName('ybjzlb').AsString:= cds_jbybdz.FieldByName('ybfl').AsString;
        FielDByName('fybz').AsString:= '0';
      end;
      //SetZflb;
      blFirst:= false;
      next;
    end;
    dbgSetFocus(cds_sfxmcfxh.AsString,'',cds_sfxmysdm.AsString,'',
          Cds_sfxmjbfldm.AsString,'',cds_sfxmcyjs.AsString);
    SetInput;
  end;
end;

function Tmzpj_fm.QryPrc(AStrLx,AStrYpbz, Ajbfldm, AStrXmdm: String; Const AStrXmgg: String): Boolean;
begin
  with dm.Cds_Com do
  begin
    Close;
    DataRequest('XT_FY_CXJB');
    FetchParams;
    Params.ParamByName('ILx').AsString:= AStrLx;
    Params.ParamByName('IFb').AsString:= StrFb;
    Params.ParamByName('IYpbz').AsString:= AStrYpbz;
    Params.ParamByName('IXmfldm').AsString:= Ajbfldm;
    Params.ParamByName('IXmdm').AsString:= AStrXmdm;
    Params.ParamByName('IXmgg').AsString:= AStrXmgg;
    if Ajbfldm=xyjbdm then
      Params.ParamByName('IKf').AsString:= xyzxdm
    else if Ajbfldm=zyjbdm then
      Params.ParamByName('IKf').AsString:= zyzxdm
    else if Ajbfldm=cyjbdm then
      Params.ParamByName('IKf').AsString:= zyzxdm;
    Params.ParamByName('Isfyh').AsString:= StrSfyh;
    Open;
  end;
end;

procedure Tmzpj_fm.dbg_MstMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  {if Button=mbLeft then
  begin
    if not (checkRecord=rsVaild) then
      cds_sfxm.Delete;
  end;}
  if (Button=mbRight) and (cds_sfxm.FieldByName('fybz').AsString<>'1') then
  begin
    if cds_sfxm.RecordCount= 0 then exit;
    if MsgDelInfo('确定删除整条记录吗？')=ID_NO then exit;
    cds_sfxm.Delete;
    dbg_Mst.SelectedIndex:= 4;
    SetInput;
  end;
end;

procedure Tmzpj_fm.edt_zxksDownClick(Sender: TObject);
begin
  if UpgradeSigleFile(4,exePath+'Dict\','xt_zd_ks.xml','') then
    MsgInfo('更新收费项目字典成功',1)
  else
    MsgInfo('更新收费项目字典失败',2);
end;

procedure Tmzpj_fm.Cds_sfxmPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  Action:= daFail;
  cds_sfxm.Cancel;
end;

procedure Tmzpj_fm.UnINITFM;
begin
  if Assigned(ypggxz_f) then
    FreeAndNil(ypggxz_f);
end;
procedure Tmzpj_fm.Openjjxm;
begin
  with mzxmxz_f.cds_item do
  begin
    Close;
    DataRequest('xt_fy_cxjb_mc');
    FetchParams;
    Params.ParamByName('Ilx').AsString:= '2';
    Params.ParamByName('Ikf').AsString:= Price_depot;
    Open;
    Filtered:= true;
  end;
end;

end.
