unit zypj_u;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, FFloatdit, TFlatPanelUnit, FlatSelEdit, TFlatComboBoxUnit,
  FlatComboBoxCode, Grids, DBGridEh, ExtCtrls, UserFunc_u, DB, DBClient,
  StrUtils, math, Variants, DllFunc_u, share_U, DictIpt, shareMsg_u,
  StatusBarEx, DBGrids, INIFiles, TFlatCheckBoxUnit;
const
  Win_NOCLen: Integer = 2;
type
  Tzypj_fm = class(TFrame)
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
    Cds_sfxmzyfl: TStringField;
    Cds_sfxmzysjmc: TStringField;
    Cds_sfxmjbcjbs: TStringField;
    Cds_sfxmypgg: TStringField;
    Cds_sfxmyhbl: TFloatField;
    Cds_sfxmmbxh: TIntegerField;
    edt_xmgg: TFlatSelEdit;
    Cds_sfxmhsflmc: TStringField;
    Cds_sfxmPH: TStringField;
    Cds_sfxmzflb: TStringField;
    Cds_sfxmyhjgzx: TFloatField;
    Cds_sfxmscpfj: TFloatField;
    Cds_sfxmsclsj: TFloatField;
    Cds_sfxmkzgg: TStringField;
    Cds_sfxmkzph: TStringField;
    Cds_sfxmjga: TFloatField;
    Cds_sfxmjgb: TFloatField;
    Cds_sfxmjgc: TFloatField;
    Cds_sfxmzljgbz: TStringField;
    Cds_sfxmxjl: TStringField;
    cbx_xz: TFlatCheckBox;
    Cds_sfxmxz: TStringField;
    Cds_sfxmscjl: TStringField;
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
    procedure cbx_xmggExit(Sender: TObject);
    procedure edt_zxksDownClick(Sender: TObject);
    procedure dbg_MstMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Cds_sfxmPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure dbg_MstDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure cbx_xzClick(Sender: TObject);
    procedure cbx_xzKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
    StrInsurClass: String; //医保类别
    StrInsurmsg: String;
    StrInsurmsgbtn: String;
    StrNInsurClass: String;  //农合类别
    StrNInsurmsg: String;
    StrNInsurmsgbtn: String;

    jyypkc: String;  //检验药品库存
    ypcldw: String;  //药品拆分单位

    procedure Setsfmbxm(StrMbbm: String);  //设置收费模板项目
    procedure Openjjxm;
  public
    StrSfyh: String;
    StrZLjgbz: String;  //诊疗价格标准
    StrNwkbz: String;

    iMaxCfxh: Integer;
    fpxmsl: Integer;

    stbr_Info: TStatusBarEx;
    IniFFM: TINIFile;
    StrKsdm: String;
    StrBrks: String;  //病人科室
    StrKsmc: String;
    StrFb: String;
    StrYbjg: String;

    rjjjekj: real; //计价金额合计
    rssjekj: real; //实收金额合计
    StrMrxmfl: String; //默认价表项目
    StrYbmlfb: String;   //医保目录费别
    StrYbmljg: String;   //医保目录机构
    StrYpsfsp: String;
    iMbxh: Integer;
    Price_depot: String; //划价药房 1-门诊 2住院 3全部

    function GetZxsl: Real;
    function Getbzsl(cds: TClientDataSet;bzjb: Integer): Integer;
    function SetXmxx: Boolean;
    procedure dbgSetFocus(Strcfxh,Strcfxhxs,strYsdm,Strysxm, StrJbfldm, StrJbflmc, StrCybs: String;
      Const blAppend: Boolean = true);
    procedure dbgSetxz(Strcfxh,Strcfxhxs,strYsdm,Strysxm, StrJbfldm, StrJbflmc, StrCybs: String;
      Const blAppend: Boolean = true);
    function CheckRecord: TRowStatus; //检查记录是否合格

    function SetFpxm(StrBrbsh, Strbrbcs, StrJzbh, Strzyh, Strxm: String;
      Strjzrq, StrJzxh: String): Boolean;
    function SaveData(var AErrStr: String): Boolean;
    function saveSCData(StrZyh: String; Var AErrStr: String): Boolean;

    procedure SetInput;
    procedure SetPosition(ARect : TRect;Com : TWinControl);//设置控件坐标
    procedure SetVisible(Sender : TWinControl); //设置控件显示
    procedure INITFM;
    Procedure UnINITFM;
    //得到项目优惠价
    function GetPreferentialPrice(Strfb,StrXmfl,StrXmdm,StrXmgg, Strtsxm: String;
      APrice: real): real;
    function QryPrc(AStrLx,AStrYpbz, Ajbfldm, AStrXmdm: String; Const AStrXmgg: String = '!'): Boolean;
  end;

implementation

uses dm_u, ypggxz_u, zyxmxz_u;

{$R *.dfm}

{ Tmzpj_fm }

function Tzypj_fm.CheckRecord: TRowStatus;
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
    else if FieldByName('ysdm').AsString = '' then
    begin
      result:= rsInvaild;
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
    else if FieldByName('zxksdm').AsString= '' then
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
      if dm.Cds_Com.FieldByName('sl').AsFloat< GetZxsl then
      begin
        MsgInfo('库存数量不足',2);
        result:= rslackAmount;
        exit;
      end;
    end;
  end;

end;

procedure Tzypj_fm.dbgSetFocus(Strcfxh, Strcfxhxs, strYsdm, Strysxm,
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
      FieldByName('xjl').AsString:= '1';
      FieldByName('cfxh').AsString:= Strcfxh;
      FieldByName('cfxhxs').AsString:= Strcfxhxs;
      FieldByName('ysdm').AsString:= Strysdm;
      FieldByName('ysxm').AsString:= Strysxm;
      FieldByName('jbfldm').AsString:= Strjbfldm;
      FieldByName('jbflmc').AsString:= Strjbflmc;
      FieldByName('cyjs').AsInteger:= max(StrToIntDef(StrCybs,0),1);
    end;
    if StrYsdm='' then
      dbg_mst.SelectedIndex:= 1
    else
    begin
      if StrJbfldm<>'' then
        dbg_mst.SelectedIndex:= 5
      else
        dbg_mst.SelectedIndex:= 3;
    end;
  end;
  SetInput;
end;

procedure Tzypj_fm.dbgSetxz(Strcfxh, Strcfxhxs, strYsdm, Strysxm,
  StrJbfldm, StrJbflmc, StrCybs: String; const blAppend: Boolean);
begin
  pnl_sfxm.Enabled:= true;
  iMaxCfxh:= Max(iMaxCfxh,StrToIntDef(StrCfxh,0));
  dbg_mst.SelectedIndex:= 0;
  SetInput;
end;
function Tzypj_fm.SaveData(var AErrStr: String): Boolean;
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
  if dm.Cds_Dtl.ChangeCount > 0 then
  begin
    SetLength(OleData,iOle);
    SetLength(OleTable,iOle);
    OleData[iOle-1]:= dm.Cds_Dtl.Delta;
    OleTable[iOle-1]:= 'mf_kdjl';
    inc(iOle);
  end;
  if dm.Cds_Dtl1.ChangeCount > 0 then
  begin
    SetLength(OleData,iOle);
    SetLength(OleTable,iOle);
    OleData[iOle-1]:= dm.Cds_Dtl1.Delta;
    OleTable[iOle-1]:= 'yp_mz_dffzjl';
    inc(iOle);
  end;
  if dm.Cds_Dtl2.ChangeCount > 0 then
  begin
    SetLength(OleData,iOle);
    SetLength(OleTable,iOle);
    OleData[iOle-1]:= dm.Cds_Dtl2.Delta;
    OleTable[iOle-1]:= 'yp_mz_dffmxl';
    inc(iOle);
  end;
  if dm.Cds_Dtl3.ChangeCount > 0 then
  begin
    SetLength(OleData,iOle);
    SetLength(OleTable,iOle);
    OleData[iOle-1]:= dm.Cds_Dtl3.Delta;
    OleTable[iOle-1]:= 'zy_jzsjjl';
    inc(iOle);
  end;
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

function Tzypj_fm.SetFpxm(StrBrbsh, Strbrbcs, Strjzbh, Strzyh, Strxm: String;
      Strjzrq, StrJzxh: String): Boolean;
procedure Addfpxm;
begin
  with Cds_sfxm do
  begin
    Cds_fpxm.Append;
    Cds_fpxm.FieldByName('zysjdm').AsString:= FieldByName('zyfl').AsString;
    Cds_fpxm.FieldByName('zysjmc').AsString:= FieldByName('zysjmc').AsString;
    Cds_fpxm.FieldByName('zxksdm').AsString:= FieldByName('zxksdm').AsString;
    Cds_fpxm.FieldByName('zxksmc').AsString:= FieldByName('zxksmc').AsString;
    Cds_fpxm.FieldByName('jjje').AsFloat:= FieldByName('je').AsFloat;
    Cds_fpxm.FieldByName('je').AsFloat:= FieldByName('sfje').AsFloat;
    Cds_fpxm.FieldByName('hsfl').AsString:= FieldByName('hsfl').AsString;
    Cds_fpxm.FieldByName('hsflmc').AsString:= FieldByName('hsflmc').AsString;
    cds_fpxm.FieldByName('ysdm').AsString:= FieldByName('ysdm').AsString;
    Cds_fpxm.FieldByName('ysxm').AsString:= FieldByName('ysxm').AsString;
    Cds_fpxm.Post;
  end;
end;
(*生成单据明细*)
procedure BuildBill(ixmxh: int64);
begin
  with dm.Cds_Mst do
  begin
    Append;
    FieldByName('brbs').AsString:= StrBrbsh;
    FieldByName('bczybs').AsString:= Strbrbcs;
    FieldByName('zyh').AsString:= Strzyh;
    FieldByName('jzbh').AsString:= Strjzbh;
    case StrToInt(xtxx.Zxtdm) of
      8: FieldByName('fyly').AsString:= '0';
      9: FieldByName('fyly').AsString:= '2';
      12: FieldByName('fyly').AsString:= '3';
    end;
    FieldByName('yzrq').AsDateTime:= Date;
    FieldByName('xmxh').AsInteger := cds_sfxm.RecNo;
    FieldByName('xmlb').AsString:= Cds_sfxm.FieldByName('jbfldm').AsString;
    FieldByName('zyfl').AsString:= Cds_sfxm.FieldByName('zyfl').AsString;
    FieldByName('hsfl').AsString:= Cds_sfxm.FieldByName('hsfl').AsString;
    FieldByName('kjkm').AsString:= Cds_sfxm.FieldByName('kjkm').AsString;
    FieldByName('bafl').AsString:= Cds_sfxm.FieldByName('baxm').AsString;
    FieldByName('xmdm').AsString:= Cds_sfxm.FieldByName('xmdm').AsString;
    FieldByName('xmmc').AsString:= Cds_sfxm.FieldByName('xmmc').AsString;
    FieldByName('xmgg').AsString:= Cds_sfxm.FieldByName('xmgg').AsString;
    FieldByName('sl').AsString:= Cds_sfxm.FieldByName('sl').AsString;
    FieldByName('dw').AsString:= Cds_sfxm.FieldByName('dw').AsString;
    FieldByName('jg').AsString:= Cds_sfxm.FieldByName('jg').AsString;
    FieldByName('yhjg').AsString:= Cds_sfxm.FieldByName('yhhjg').AsString;
    FieldByName('zxks').AsString:= Cds_sfxm.FieldByName('zxksdm').AsString;
    FieldByName('fy').AsString:= Cds_sfxm.FieldByName('je').AsString;
    FieldByName('ysfy').AsString:= Cds_sfxm.FieldByName('sfje').AsString;
    FieldByName('kdks').AsString:= Strksdm;
    FieldByName('sflsh').AsString:= IntToStr(ixmxh);
    FieldByName('kdys').AsString:= Cds_sfxm.FieldByName('ysdm').AsString;
    FieldbyName('cfxh').AsInteger:= Cds_sfxm.FieldByName('cfxh').AsInteger;
    FieldByName('cyjs').AsInteger:= Cds_sfxm.FieldByName('cyjs').AsInteger;
    FieldByName('ypbz').AsInteger:= Cds_sfxm.FieldByName('ypbz').AsInteger;
    FieldByName('ypbzj').AsInteger:= Cds_sfxm.FieldByName('ypbzj').AsInteger;
    FieldByName('cjbs').AsString:= cds_sfxm.FieldByName('cjbs').AsString;
    FieldByName('pbbz').AsString:= cds_sfxm.FieldByName('pbbz').AsString;
    FieldbyName('jjsj').AsDateTime:= Now;
    FieldByName('Sfy').AsString:= yhxx.yhbs;
    FieldByName('jzxh').AsString:= '#';
    FieldByName('ybzt').AsString:= '0';
    FieldByName('yzxh').AsString:= '0';
    FieldByName('yzzxh').AsString:= '0';
    FieldByName('fybz').AsString:= '0';
    FieldByName('tysl').AsString:= '0';
    FieldByName('jga').AsString:= cds_sfxm.FieldbyName('jga').AsString;
    FieldByName('jgb').AsString:= cds_sfxm.FieldbyName('jgb').AsString;
    FieldByName('jgc').AsString:= cds_sfxm.FieldbyName('jgc').AsString;
    FieldByName('zljgbz').AsString:= cds_sfxm.FieldbyName('zljgbz').AsString;
    Post;
  end;
end;
(*生成开单记录*)
procedure BuildDeptItem;
begin
  with dm.cds_dtl do
  begin
    if not Locate('kdks;kdys;hsfl;brks;zxks',VarArrayOf([Strksdm,cds_sfxm.FieldByName('ysdm').AsString,
      Cds_sfxm.FieldByName('hsfl').AsString,StrBrks,Cds_sfxm.FielDByName('zxksdm').AsString]),[]) then
    begin
      Append;
      FieldByName('jzrq').AsString:= Strjzrq;
      FieldByName('jzxh').AsString:= Strjzxh;
      FieldByName('brbsh').AsString:= StrZyh;
      FieldByName('kdks').AsString:= StrKsdm;
      FieldByName('sjh').AsString:= '#';
      FieldByName('kdys').AsString:= cds_sfxm.FieldByName('ysdm').AsString;
      FieldByName('hsfl').AsString:= cds_sfxm.FieldByName('hsfl').AsString;
      FieldByName('je').AsFloat:= Cds_sfxm.FieldByName('je').AsFloat;
      FieldByName('sfje').AsFloat:= Cds_sfxm.FieldByName('sfje').AsFloat;
      FieldByName('fyly').AsString:= '1';
      FieldByName('jzbh').AsString:= StrJzbh;
      FieldByName('yhje').AsFloat:= Cds_sfxm.FieldByName('sfje').AsFloat;
      FieldByName('brks').AsString:= StrBrks;
      FieldByName('zxks').AsString:= Cds_sfxm.FieldByName('zxksdm').AsString;
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
  with dm.cds_Dtl1 do
  begin
    if not Locate('jzrq;jzxh;sfdjh;kdys',VarArrayOf([StrJzrq,strJzxh,
      Cds_sfxm.FieldByName('cfxh').AsString,
      Cds_Sfxm.FieldByName('ysdm').AsString]),[]) then
    begin
      Append;
      FieldByName('jzrq').AsString:= StrJzrq;
      FieldByName('jzxh').AsString:= StrJzxh;
      FieldByName('sfdjh').AsString:= Cds_Sfxm.FieldByName('cfxh').AsString;
      FieldByName('cfxh').AsString:= Cds_Sfxm.FieldByName('cfxh').AsString;
      FieldByName('brbsh').AsString:= StrZyh;
      FieldByName('xm').AsString:= StrXm;
      FieldByName('xmpy').AsString:= GetSpellCode(Pchar(StrXM),1,16);
      FieldByName('fb').AsString:= StrFb;
      if Cds_sfxm.FieldByName('jbfldm').AsString = cyjbdm then
        FieldByName('cflb').AsString:= '1'
      else
        FieldByName('cflb').AsString:= '0';
      FieldByName('cfly').AsString:= ifthen(xtxx.Zxtdm='12','2','1');
      FieldByName('cyjs').AsString:= Cds_sfxm.FieldByName('cyjs').AsString;
      FieldByName('zxyj').AsString:= Cds_Sfxm.FieldByName('zxksdm').AsString;
      FieldByName('kdks').AsString:= StrKsdm;
      FieldByName('kdys').AsString:= Cds_sfxm.FieldByName('ysdm').AsString;
      FieldByName('lrr').AsString:= yhxx.yhbs;
      FieldByName('jjbz').AsString:= '1';
      FieldByName('cfhgbz').AsString:= '1';
      FieldByName('fybz').AsString:= '0';
      FieldByName('sjh').AsString:= StrJzbh;
      Post;
    end;
  end;
end;
(*生成待发处方明细*)
function BuildPrescDtl(ixmxh: int64): Boolean;
begin
  result:= false;
  if dm.cds_Dtl1.FieldByName('zxyj').AsString <> Cds_Sfxm.FieldByName('zxksdm').AsString then
  begin
    MsgInfo('执行科室错误',2);
    exit;
  end;
  with dm.cds_dtl2 do
  begin
    Append;
    FieldByName('jzrq').AsString:= Strjzrq;
    FieldByName('jzxh').AsString:= StrJzxh;
    FieldByName('sfdjh').AsString:= Cds_Sfxm.FieldByName('cfxh').AsString;
    FieldByName('cfxh').AsString:=  Cds_Sfxm.FieldByName('cfxh').AsString;
    FieldByName('xh').AsInteger:= cds_sfxm.RecNo;
    FieldByName('sjxmfl').AsString:= Cds_Sfxm.FieldByName('zyfl').AsString;
    FieldByName('ypbm').AsString:= Cds_Sfxm.FieldByName('xmdm').AsString;
    FieldByName('ypmc').AsString:= Cds_Sfxm.FieldByName('xmmc').AsString;
    FieldByName('ypgg').AsString:= Cds_Sfxm.FieldByName('ypgg').AsString;
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
    FieldByName('sffy').AsString:= Cds_Sfxm.FieldByName('sfje').AsString;;
    FieldByName('sjh').AsString:= StrJzbh;
    FieldByName('Ypbzj').AsString:= Cds_Sfxm.FieldByName('ypbzj').AsString;
    FieldByName('cyjs').AsString:= Cds_Sfxm.FieldByName('cyjs').AsString;
    FieldByName('jbcjbs').AsString:= cds_Sfxm.FieldByName('jbcjbs').AsString;
    FieldByname('cfly').AsString:= ifthen(xtxx.Zxtdm='12','2','1');
    FieldByName('sflsh').AsString:= IntToStr(ixmxh);
    FieldByName('zxyj').AsString:= Cds_Sfxm.FieldByName('zxksdm').AsString;
    FieldByName('fybz').AsString:= '0';
    FieldByName('ph').AsString:= cds_sfxm.FieldByName('ph').AsString;
    FieldByName('scpfj').AsString:= cds_sfxm.FieldByName('scpfj').AsString;
    FieldByName('sclsj').AsString:= cds_sfxm.FieldByName('sclsj').AsString;
    FieldByName('kzgg').AsString:= cds_sfxm.FieldByName('kzgg').AsString;
    FieldByName('kzph').AsString:= cds_sfxm.FieldByName('kzph').AsString;
    Post;
  end;
  result:= true;
end;
var
  iNO: WideString;
  ilsmbxh: Integer;
  StrXtxj: String;
begin
  result:= false;
  iNO:= GetXh('08Z1',StrXtxj,cds_sfxm.RecordCount);
  if iNO='' then
  begin
    MsgInfo('获取计价流水号错误',2);
    exit;
  end;
  with cds_sfxm do
  begin
    First;
    while not eof do
    begin
      if (FieldByName('ypbz').AsString= '1') then  //药品
      begin
        if not Cds_fpxm.Locate('ysdm;zysjdm;zxksdm;hsfl',VarArrayOf([FieldByName('ysdm').AsString,FieldByName('zyfl').AsString,
          FieldByName('zxksdm').AsString,FieldByName('hsfl').AsString]),[]) then
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
        if not Cds_fpxm.Locate('ysdm;zysjdm;zxksdm;hsfl',VarArrayOf([FieldByName('ysdm').AsString,
          FieldByName('zyfl').AsString,
          FieldByName('zxksdm').AsString,FieldByName('hsfl').AsString]),[]) then
          AddFpxm
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
      ilsMbxh:= FieldByName('mbxh').AsInteger;
      BuildBill(StrToInt64(iNO)+RecNO-1); //生成明细
      BuildDeptItem; //生成核算
      if FieldByName('ypbz').AsString = '1' then
      begin
        BuildPrescMst;//生成处方主记录
        if not BuildPrescDtl(StrToInt64(iNO)+RecNO-1) then//生成处方明细
        begin
          result:= false;
          exit;//生成处方明细
        end;
      end;
      next;
    end;
  end;
  rjjjekj:= 0;
  rssjekj:= 0;
  with cds_fpxm do
  begin
    First;
    while not eof do
    begin
      rjjjekj:= rjjjekj+ StrToFloatDef(FormatFloat('0.00',FieldByName('jjje').asFloat),0.0);
      rssjekj:= rssjekj+ StrToFloatDef(FormatFloat('0.00',FieldByName('je').asFloat),0.0);
      dm.cds_Dtl3.Append;
      dm.cds_Dtl3.FieldByName('brbs').AsString:= StrBrbsh;
      dm.cds_Dtl3.FieldByName('bczybs').AsString:= StrBrbcs;
      dm.cds_Dtl3.FieldByName('zyh').AsString:= StrZyh;
      dm.cds_Dtl3.FieldByName('jzbh').AsString:= StrJzbh;
      dm.cds_Dtl3.FieldByName('xh').AsInteger:= RECNO;
      dm.cds_Dtl3.FieldByName('zysjfl').AsString:= FieldByName('zysjdm').AsString;
      dm.cds_Dtl3.FieldByName('jjje').AsString:= FieldByName('jjje').AsString;
      dm.cds_Dtl3.FieldByName('ysje').AsString:= FieldByName('je').AsString;
      dm.cds_Dtl3.FieldByName('sfy').AsString:= yhxx.yhbs;
      dm.cds_Dtl3.FieldByName('jzxh').AsString:= '#';
      dm.Cds_Dtl3.FieldByName('yhje').AsString:= FieldByName('je').AsString;
      dm.cds_Dtl3.Post;
      next;
    end;
  end;
  result:= true;
end;

procedure Tzypj_fm.SetInput;
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
      if Cds_sfxm.FieldByName('xjl').AsString='1' then exit;
      cbx_xz.Checked:= cds_sfxm.FieldByName('xz').AsString='√';
      SetPosition(r,cbx_xz);
    end;
    2:
    begin
      if Cds_sfxm.FieldByName('xjl').AsString='0' then exit;
      edt_cfys.Text:= cds_sfxm.FieldByName('ysxm').AsString;
      SetPosition(r,edt_cfys);
    end;
    3:
    begin
      if Cds_sfxm.FieldByName('xjl').AsString='0' then exit;
      if cds_sfxm.FieldByName('ysdm').AsString<>'' then
      begin
        edt_cfxh.Text:= Cds_sfxm.FieldByName('cfxh').AsString;
        SetPosition(r,edt_cfxh);
      end;
    end;
    4:
    begin
      if Cds_sfxm.FieldByName('xjl').AsString='0' then exit;
      if cds_sfxm.FieldByName('ysdm').AsString<>'' then
      begin
        if StrJbfldm<>'' then
          cbx_jbfl.ItemIndex:= cbx_jbfl.ItemCodes.IndexOf(StrJbfldm);
        SetPosition(r,cbx_jbfl);
      end;
    end;
    5:
    begin
      if Cds_sfxm.FieldByName('xjl').AsString='0' then exit;
      if (Cds_sfxm.FieldByName('jbfldm').AsString=Cyjbdm)
        and (Cds_sfxm.FieldByName('jbflmc').AsString<>'' ) then
      begin

        SetPosition(r,edt_cyjs);
      end;
    end;
    6:
    begin
      if Cds_sfxm.FieldByName('xjl').AsString='0' then exit;
      if (StrJbfldm<>'') then
      begin
        edt_xmmc.Text:= cds_sfxm.FieldByName('xmmc').AsString;
        SetPosition(r,edt_xmmc);
      end;
    end;
    7:
    begin
      if Cds_sfxm.FieldByName('xjl').AsString='0' then exit;
      if (StrJbfldm<>'') and (Cds_sfxm.FieldByName('jbjls').AsInteger>1) then
      begin
        //cbx_xmgg.ItemIndex:= cbx_xmgg.Items.IndexOf(cds_sfxm.FieldByName('xmgg').AsString);
        SetPosition(r,edt_xmgg);
      end;
    end;
    8:
    begin
      if Cds_sfxm.FieldByName('xjl').AsString='0' then exit;
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
    9:
    begin
      if Cds_sfxm.FieldByName('xjl').AsString='0' then exit;
      if (StrJbfldm<>'') and (cds_sfxm.FieldByName('jbjg').AsFloat = 0) then
      begin
        edt_jg.Text:= cds_sfxm.FieldByName('jg').AsString;
        SetPosition(r,edt_jg);
      end;
    end;
    10:
    begin
      if (StrJbfldm<>'') and (cds_sfxm.FieldByName('xmgg').AsString<>'') then
      begin
        edt_sl.Text:= cds_sfxm.FieldByName('sl').AsString;
        SetPosition(r,edt_sl);
      end;
    end;
    11:
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

procedure Tzypj_fm.SetPosition(ARect: TRect; Com: TWinControl);
begin
  SetVisible(Com);
  SetPositionU(ARect,Com);
end;

procedure Tzypj_fm.SetVisible(Sender: TWinControl);
begin
  cbx_xz.Visible:= false;
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

function Tzypj_fm.SetXmxx: boolean;
var
  StrZflb: String;
begin
  result:= false;
  StrZflb:= Cds_sfxm.FieldByName('zflb').AsString;
  if StrZflb = '3' then
  begin
    if StrInsurclass=Strfb then
    begin
      if StrInsurmsg='1' then
      begin
        if msgYesNO('自费项目，是否继续',StrInsurMsgbtn='0')=ID_NO then
        begin
          exit;
        end;
      end;
    end
    else if StrNInsurclass=Strfb then
    begin
      if StrNInsurmsg='1' then
      begin
        if msgYesNO('自费项目，是否继续',StrNInsurMsgbtn='0')=ID_NO then
        begin
          exit;
        end;
      end;
    end;
  end;
  with Cds_Sfxm do
  begin
    if (State <> dsEdit) and (State <> dsInsert) then
      Edit;
    FieldByName('jbjls').AsInteger:= dm.Cds_Com.RecordCount;

    FieldByName('xmgg').AsString:= dm.Cds_Com.FieldByName('xmgg').AsString;
    FieldByName('ypgg').AsString:= dm.Cds_Com.FieldByName('ypgg').AsString;
    FieldByName('zddw').AsString:= dm.Cds_Com.FieldByName('dw').AsString;
    FieldByName('yhbl').AsFloat:= dm.Cds_Com.FieldByName('yhbl').AsFloat;
    FieldByName('yhjg').AsFloat:= dm.Cds_Com.FieldByName('jg').AsFloat*FieldByName('yhbl').AsFloat;
    FieldByName('yhjgzx').AsFloat:= dm.Cds_Com.FieldByName('sclsjxzx').AsFloat*FieldByName('yhbl').AsFloat;
    if ypcldw='0' then  //药品最小出单位
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
        FieldByName('jg').AsFloat:= dm.Cds_Com.FieldByName('jg').AsFloat/GetBzsl(dm.Cds_Com,0);
        FieldByName('yhhjg').AsFloat:= FieldByName('yhjg').AsFloat/GetBzsl(dm.Cds_Com,0);
        FieldByName('ypbzj').AsInteger:= 1;
      end
      else if (dm.Cds_Com.FieldByName('mzcl2').AsString = '1') then
      begin
        FieldByName('dw').AsString:= dm.Cds_Com.FieldByName('nh2dw').AsString;
        FieldByName('jg').AsFloat:= dm.Cds_Com.FieldByName('jg').AsFloat/GetBzsl(dm.Cds_Com,2);
        FieldByName('yhhjg').AsFloat:= FieldByName('yhjg').AsFloat/GetBzsl(dm.Cds_Com,2);
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
    FieldByName('zyfl').AsString:= dm.Cds_Com.FieldByName('zyfl').AsString;
    FieldByName('zysjmc').AsString:= dm.Cds_Com.FieldByName('zysjmc').AsString;
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
      if xtxx.Zxtdm='12' then
      begin
        FieldByName('zxksmc').AsString:= xtxx.bmmc;
        FieldByname('zxksdm').AsString:= xtxx.Zxtbm;
        FieldByname('jbzxks').AsString:= xtxx.Zxtbm;
      end
      else
      begin
        FieldByName('zxksmc').AsString:= StrKsmc;
        FieldByname('zxksdm').AsString:= StrKsdm;
        FieldByname('jbzxks').AsString:= StrKsdm;
      end;
    end
    else if dm.Cds_Com.FieldByName('zxks').AsString='*' then
    begin
      if xtxx.Zxtdm='12' then
      begin
        FieldByName('zxksmc').AsString:= xtxx.bmmc;
        FieldByname('zxksdm').AsString:= xtxx.Zxtbm;
        FieldByname('jbzxks').AsString:= dm.Cds_Com.FieldByName('zxks').AsString;
      end
      else
      begin
        FieldByName('zxksmc').AsString:= Strksmc;
        FieldByname('zxksdm').AsString:= Strksdm;
        FieldByname('jbzxks').AsString:= dm.Cds_Com.FieldByName('zxks').AsString;
      end;
    end
    else
    begin
      FieldByName('zxksmc').AsString:= dm.Cds_Com.FieldByName('ksmc').AsString;
      FieldByname('zxksdm').AsString:= dm.Cds_Com.FieldByName('zxks').AsString;
      FieldByname('jbzxks').AsString:= dm.Cds_Com.FieldByName('zxks').AsString;
    end;
    if FieldByName('ypbz').AsString='1' then
    begin
      FieldByName('ph').AsString:= dm.Cds_Com.FieldByName('ph').AsString;
      FieldByName('scpfj').AsString:= dm.Cds_Com.FieldByName('scpfj').AsString;
      FieldByName('sclsj').AsString:= dm.Cds_Com.FieldByName('sclsj').AsString;
      FieldByName('jga').AsFloat:= FieldByName('jg').AsFloat;
      FieldByName('jgb').AsFloat:= FieldByName('jg').AsFloat;
      FieldByName('jgc').AsFloat:= FieldByName('jg').AsFloat;
      FieldByName('zljgbz').AsString:= '0';
    end
    else
    begin
      if StrZLjgbz='1' then
      begin
        FieldByName('jg').AsString:= dm.Cds_Com.FieldByName('jgb').AsString;
        FieldByName('yhjg').AsString:= dm.Cds_Com.FieldByName('jgb').AsString;
        FieldByName('yhhjg').AsString:= dm.Cds_Com.FieldByName('jgb').AsString;
      end
      else if StrZLjgbz='2' then
      begin
        FieldByName('jg').AsString:= dm.Cds_Com.FieldByName('jgc').AsString;
        FieldByName('yhjg').AsString:= dm.Cds_Com.FieldByName('jgc').AsString;
        FieldByName('yhhjg').AsString:= dm.Cds_Com.FieldByName('jgc').AsString;
      end;
      FieldByName('jga').AsString:= dm.Cds_Com.FieldByName('jga').AsString;
      FieldByName('jgb').AsString:= dm.Cds_Com.FieldByName('jgb').AsString;
      FieldByName('jgc').AsString:= dm.Cds_Com.FieldByName('jgc').AsString;
      FieldByName('zljgbz').AsString:= StrZLjgbz;
    end;
  end;
  result:= true;
end;

procedure Tzypj_fm.dbg_MstCellClick(Column: TColumnEh);
begin
  if not (dgRowSelect in dbg_Mst.Options) then
    SetInput;
  if CompareStr(UpperCase(Column.FieldName),'SCJL')=0 then
  begin
    if Cds_sfxm.FieldByName('xjl').AsString='1' then exit;
    SetClientDataSetStatus(Cds_sfxm);
    if Cds_sfxm.FieldByName('scjl').AsString= '√' then
      Cds_sfxm.FieldByName('scjl').AsString:= ''
    else
      Cds_sfxm.FieldByName('scjl').AsString:= '√';
  end;
end;

procedure Tzypj_fm.Cds_sfxmAfterScroll(DataSet: TDataSet);
begin
  if (not (dgRowSelect in dbg_Mst.Options)) and (Cds_sfxm.RecordCount > 1)
    and (pnl_sfxm.Enabled) then
    SetInput;
end;

procedure Tzypj_fm.Cds_sfxmCalcFields(DataSet: TDataSet);
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
  cds_sfxmsfje.AsFloat:= Cds_sfxmsl.AsFloat*StrToFloat(FormatFloat('0.0000',Cds_sfxmyhhjg.AsFloat+0.000001))*Cds_sfxmCyjs.AsInteger;
end;

procedure Tzypj_fm.edt_cfysClick(Sender: TObject);
var
  StrFilter: String;
  Strcfysdm: String;
begin
  inherited;
  if xtxx.Zxtdm='9' then
    StrFilter:= '[zl]=''住院医生组'' and [ksdm]='''+StrKsdm+''''
  else
  begin
    if xtxx.NWKBZ='3' then
      StrFilter:= '[zl]=''住院医生组'''
    else
      StrFilter:= '[zl]=''住院医生组'' and [ksdm]='''+StrKsdm+'''';
  end;
  if not ShowDictIpt(Dpt,TWinControl(edt_cfys),
    exePath+'Dict\xt_zd_gzry_ys_View.xml',Strcfysdm,Screen,StrFilter) then
  begin
    {if not (CheckRecord = rsVaild) then
        cds_sfxm.Cancel;
      cds_sfxm.Last;
      dbg_mst.SelectedIndex:= 2;
      SetInput;}
    exit;
  end;
  with Cds_Sfxm do
  begin
    if (State <> dsEdit) and (State <> dsInsert) then
      Edit;
    FieldByName('ysdm').AsString:= StrCfysdm;
    FieldByName('ysxm').AsString:= edt_cfys.Text;
    if FieldByName('cfxhxs').AsInteger = 0 then
    begin
      inc(iMaxcfxh);
      FieldByName('cfxh').AsInteger:= iMaxCfxh;
      FieldByName('cfxhxs').AsInteger:= iMaxCfxh;
    end;
    dbg_mst.SelectedIndex:= 3;
    SetInput;
  end;

end;

procedure Tzypj_fm.edt_cfysDownClick(Sender: TObject);
begin
  if UpgradeSigleFile(4,exePath+'Dict\','xt_zd_gzry_ys_View.xml','') then
    MsgInfo('更新医生字典成功',1)
  else
    MsgInfo('更新医生字典失败',2);
end;

procedure Tzypj_fm.edt_cfysEnter(Sender: TObject);
begin
  stbr_Info.Panels[0].Text:= format(strDptEnter2,['医生字典','医生字典']);
  if (edt_cfys.Text='') and (xtxx.AutoShowDpt = 1) then
    edt_cfysClick(Sender);
end;

procedure Tzypj_fm.edt_cfysKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    VK_ESCAPE:
    begin
      {if not (CheckRecord =  rsvaild)then
        cds_sfxm.Cancel;
      cds_sfxm.Last;
      dbg_mst.SelectedIndex:= 2;
      SetInput;}
    end;
    VK_RETURN:
    begin
      if cds_sfxm.FieldByName('ysxm').AsString='' then exit;
      dbg_mst.SelectedIndex:= 2;
      SetInput;
    end;
    Ord('A')..ord('Z'),ord('0')..ord('9'),96..105:
      if not dpt.BlSHow then
      begin
        edt_cfys.Text:= '';
        dpt.InitValue:= Chr(Key);
        edt_cfysClick(edt_cfys);
      end;
  end;
end;

procedure Tzypj_fm.edt_cfxhChange(Sender: TObject);
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

procedure Tzypj_fm.edt_cfxhKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
    begin
      dbg_mst.SelectedIndex:= 3;
      SetInput;
    end;
    {VK_ESCAPE:
    begin
      btn_kjBtn_YgClick(Sender);
    end;}
  end;
end;

procedure Tzypj_fm.cbx_jbflChange(Sender: TObject);
var
  StrJbfldm: String;
begin
  //if dbg_mst.SelectedIndex <> 2 then exit;
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
      dbg_mst.SelectedIndex:= 4;
    end
    else
      dbg_mst.SelectedIndex:= 5;
    SetInput;
  end;

end;

procedure Tzypj_fm.cbx_jbflEnter(Sender: TObject);
begin
  stbr_info.Panels[0].Text:= cbx_jbfl.GetItemStr;
end;

procedure Tzypj_fm.cbx_jbflKeyDown(Sender: TObject; var Key: Word;
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
        dbg_mst.SelectedIndex:= 4
      else
        dbg_mst.SelectedIndex:= 5;
      SetInput;
    end;
  end;
end;

procedure Tzypj_fm.edt_cyjsChange(Sender: TObject);
begin
  with Cds_Sfxm do
  begin
    if edt_cyjs.Text='0' then exit;
    if (State <> dsEdit) and (State <> dsInsert) then
      Edit;
    FieldByName('cyjs').AsString:=  edt_cyjs.Text;
    if FIeldByName('jbflmc').AsString <> '' then
      FieldByName('cyjsxs').AsString:= edt_cyjs.Text;
  end;
end;

procedure Tzypj_fm.edt_cyjsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    VK_ESCAPE:
    begin
      dbg_mst.SelectedIndex:= 3;
      SetInput;
    end;
    VK_RETURN:
    begin
      if StrToIntDef(edt_cyjs.Text,0) > 0 then
      begin
        dbg_mst.SelectedIndex:= 5;
        SetInput;
      end;
    end;
  end;
end;

procedure Tzypj_fm.edt_xmmcClick(Sender: TObject);
var
  jbfldm: String;
  Strxmdm: String;
  StrXmmc: String;
  StrYbxmdm: String;  //医保项目代码
  StrZflb: String;    //医保支付类别
  StrCd: String;      //医保产地
  StrBzgg: String;   //包装规格
  i, iCnt1: Integer;
  StrYpbz: String;
  StrFilter: String;
  Pg: TPoint;
begin
  inherited;
  jbfldm:= cds_sfxm.FieldByName('jbfldm').AsString;
  with zyxmxz_f do
  begin
    InitFilter:= '[jbxmfl]='''+jbfldm+''' and [fb] in (''*'','''+StrYbmlfb+''') and ybjg in (''*'','''+StrYbmljg+''')';
    IType:= 1;
    iMode:= 3;
    edt_bm:= edt_xmmc;
    AdjustDropDownForm(zyxmxz_f,edt_xmmc);
    ShowItem;
    if not blok then exit;
  end;
  with zyxmxz_f.cds_item do
  begin
    StrYpbz:= FieldByName('ypbz').AsString;
    jbfldm:= FieldByName('jbxmfl').AsString;
    StrXmdm:= FieldByname('xmdm').AsString;
    StrXmmc:= FieldByname('ypmc').AsString;
    StrYbxmdm:= FieldByname('ybxmdm').AsString;
    StrZflb:=FieldByname('zflb').AsString;
    StrCd:= FieldByname('cd').AsString;
    StrBzgg:= FieldByName('bzgg').AsString;
  end;
  if (StrYpsfsp='1') and  (StrZflb='9') then
  begin
    MsgInfo('此项目未经目录审批，不能使用',2);
    exit;
  end;
  SetClientDataSetStatus(cds_sfxm);
  with cds_sfxm do
  begin
    FieldByName('zflb').AsString:= StrZflb;
    FieldByName('ypbz').AsString:= StrYpbz;
  end;
  if jbfldm='*' then
  begin
    SetSfmbxm(StrXmdm);
    exit;
  end;
  with dm.Cds_Com do
  begin
    Close;
    DataRequest('XT_FY_CXJB');
    FetchParams;
    Params.ParamByName('ILx').AsString:= '2';
    Params.ParamByName('IYpbz').AsString:= StrYpbz;
    Params.ParamByName('IXmfldm').AsString:= jbfldm;
    Params.ParamByName('Ixmdm').AsString:= StrXmdm;
    Params.ParamByName('IXmgg').AsString:= StrBzgg;
    Params.ParamByName('IKf').AsString:= Price_depot;
    Params.ParamByName('IFb').AsString:= StrFb;
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

          FieldByName('mbxh').AsInteger:= iMbxh;
          inc(iMbxh);
          FieldByName('xmdm').AsString:= Strxmdm;
          FieldByName('xmmc').AsString:= StrXmmc;
          FieldByName('jbjls').AsInteger:= dm.Cds_Com.RecordCount;
          FieldbyName('sl').AsFloat:= 0;
        end;
        if (RecordCount=1) and (StrYpbz='0') then
        begin

          if not SetXmxx then exit;
          if cds_sfxm.FieldByName('jbjg').AsFloat = 0 then
            dbg_mst.SelectedIndex:= 8
          else
            dbg_mst.SelectedIndex:= 9;
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
          if not SetXmxx then exit;
          if cds_sfxm.FieldByName('jbjg').AsFloat = 0 then
            dbg_mst.SelectedIndex:= 8
          else
            dbg_mst.SelectedIndex:= 9;
        end;
    end;
  end;

  SetInput;
  
end;

procedure Tzypj_fm.edt_xmmcDownClick(Sender: TObject);
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

procedure Tzypj_fm.edt_xmmcEnter(Sender: TObject);
begin
  edt_xmmc.SelStart:= 1;
  edt_xmmc.SelLength:= Length(trim(edt_xmmc.Text));
  stbr_info.Panels[0].Text:= format(StrDptEnter2,['收费项目','收费项目']);
  if (edt_xmmc.Text= '') and (xtxx.AutoShowDpt = 1) then
    edt_xmmcClick(Sender);
end;

procedure Tzypj_fm.edt_xmmcKeyDown(Sender: TObject; var Key: Word;
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
      if cds_sfxmxmdm.AsString= '' then exit;
      if edt_xmmc.Text='' then exit;
      if cds_sfxm.FieldByName('jbjg').AsFloat = 0 then
        dbg_mst.SelectedIndex:= 7
      else
        dbg_mst.SelectedIndex:= 8;
      SetInput;
    end;
    Ord('A')..Ord('Z'),Ord('0')..Ord('9'),96..105:
    begin
      if not zyxmxz_f.blShow then
      begin
        edt_xmmc.Text:= '';
        if (Key>=96) and (Key<=105) then
          zyxmxz_f.StrInit:= Chr(Key-48)
        else
          zyxmxz_f.StrInit:= Chr(Key);
        edt_xmmcClick(edt_xmmc);
      end;
    end
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

procedure Tzypj_fm.cbx_xmggChange(Sender: TObject);
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

procedure Tzypj_fm.cbx_xmggEnter(Sender: TObject);
begin
  {stbr_Info.Panels[0].Text:= cbx_xmgg.GetItemStr;
  blChange:= true;}
end;

procedure Tzypj_fm.cbx_xmggKeyDown(Sender: TObject; var Key: Word;
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
      if cds_sfxm.FieldByName('jbjg').AsFloat = 0 then
        dbg_mst.SelectedIndex:= 7
      else
        dbg_mst.SelectedIndex:= 8;
      SetInput;
    end;
  end;
end;

procedure Tzypj_fm.cbx_dwChange(Sender: TObject);
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
      if StrZljgbz='0' then
        FieldByName('yhhjg').AsFloat:= FieldByName('yhjg').AsFloat/Strbzsl
      else
        FieldByName('yhhjg').AsFloat:= FieldByName('jg').AsFloat;
      FieldByName('sl').AsString:= '';
    end;
  end;
  dbg_mst.SelectedIndex:= 9;
  SetInput;

end;

procedure Tzypj_fm.cbx_dwEnter(Sender: TObject);
begin
  stbr_info.Panels[0].Text:= cbx_dw.GetItemStr;
end;

procedure Tzypj_fm.cbx_dwKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    VK_ESCAPE:
    begin
      dbg_mst.SelectedIndex:= 3;
      SetInput;
    end;
    VK_RETURN:
    begin
      dbg_mst.SelectedIndex:= 9;
      SetInput;
    end;
  end;
end;

procedure Tzypj_fm.edt_jgChange(Sender: TObject);
begin
  with Cds_Sfxm do
  begin
    if (State <> dsEdit) and (State <> dsInsert) then
      Edit;
    FieldByName('jg').AsString:= edt_jg.Text;
    if StrZljgbz='0' then
    begin
      FieldbyName('yhjg').AsFloat:= FieldByName('jg').AsFloat*FieldByName('yhbl').AsFloat;
      FieldbyName('yhhjg').AsFloat:= FieldByName('jg').AsFloat*FieldByName('yhbl').AsFloat;
    end
    else
    begin
      FieldbyName('yhjg').AsFloat:= FieldByName('jg').AsFloat;
      FieldbyName('yhhjg').AsFloat:= FieldByName('jg').AsFloat;
    end;
    FieldByName('jga').AsFloat:= FieldByName('jg').AsFloat;
    FieldByName('jgb').AsFloat:= FieldByName('jg').AsFloat;
    FieldByName('jgc').AsFloat:= FieldByName('jg').AsFloat;
  end;
end;

procedure Tzypj_fm.edt_jgKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    VK_RETURN:
    begin
      dbg_mst.SelectedIndex:= 9;
      SetInput;
    end;
    VK_ESCAPE:
    begin
      dbg_mst.SelectedIndex:= 3;
      SetInput;
    end;
  end;
end;

procedure Tzypj_fm.edt_jgExit(Sender: TObject);
begin
  with Cds_Sfxm do
  begin
    if (State <> dsEdit) and (State <> dsInsert) then
      Edit;
    if StrZljgbz='0' then
    begin
      FieldByName('yhjg').AsFloat:= FieldByName('jg').AsFloat*FieldByName('yhbl').AsFloat;
      FieldByName('yhhjg').AsFloat:= FieldByName('yhjg').AsFloat;
    end
    else
      FieldByName('yhhjg').AsFloat:= FieldByName('jg').AsFloat;
  end;
end;

procedure Tzypj_fm.edt_slChange(Sender: TObject);
begin
  with Cds_Sfxm do
  begin
    if (State <> dsEdit) and (State <> dsInsert) then
      Edit;
    FieldByName('sl').AsString:= edt_sl.Text;
  end;
end;

procedure Tzypj_fm.edt_slEnter(Sender: TObject);
begin
  if (Cds_sfxm.FieldByName('mzcl1').AsString= '1') or
    (Cds_sfxm.FieldByName('mzcl2').AsString='1') then
    stbr_info.Panels[0].Text:= '按Shift键选择药品单位'
  else
    stbr_info.Panels[0].Text:= '';
end;


procedure Tzypj_fm.edt_slKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ssShift in shift then
  begin
    if (Cds_sfxm.FieldByName('mzcl1').AsString='1')
      or (Cds_sfxm.FieldByName('mzcl2').AsString='1') then
    begin
      dbg_mst.SelectedIndex:= 7;
      SetInput;
    end;
  end;
  Case Key of
    VK_ESCAPE:
    begin
      dbg_mst.SelectedIndex:= 3;
      SetInput;
    end;
    VK_RETURN:
    begin
      if (cds_sfxm.FieldByName('jbzxks').AsString = '') or
        (Cds_sfxm.FieldByName('jbzxks').AsString = '*') then
      begin
        dbg_mst.SelectedIndex:= 10;
        SetInput;
      end
      else
      begin
        if Cds_sfxm.FieldByName('xjl').AsString='0' then
        begin
          if cds_sfxm.RecNo<cds_sfxm.RecordCount then
          begin
            cds_sfxm.Next;
            dbg_mst.SelectedIndex:= 0;
            SetInput;
            exit;
          end;
        end;
        if checkRecord = rsVaild then dbgSetFocus(cds_sfxmcfxh.AsString,'',cds_sfxmysdm.AsString,'',
          Cds_sfxmjbfldm.AsString,'',cds_sfxmcyjs.AsString);

      end;
    end;
    VK_UP:
    begin
      if not Cds_sfxm.Bof then Cds_sfxm.Prior;
      dbg_mst.SelectedIndex:= 9;
      SetInput;
    end;
    VK_Down:
    begin
      if not Cds_sfxm.Eof then Cds_sfxm.Next;
      dbg_mst.SelectedIndex:= 9;
      SetInput;
    end;
  end;
end;

procedure Tzypj_fm.edt_zxksClick(Sender: TObject);
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

procedure Tzypj_fm.edt_zxksEnter(Sender: TObject);
begin
  stbr_info.Panels[0].Text:= format(StrDptEnter2,['科室字典','科室字典']);
  if (edt_zxks.Text= '') and (xtxx.AutoShowDpt = 1) then
    edt_zxksClick(Sender);
end;

procedure Tzypj_fm.edt_zxksKeyDown(Sender: TObject; var Key: Word;
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
      dbg_mst.SelectedIndex:= 3;
      SetInput;
    end;
    Ord('A')..ord('Z'),ord('0')..ord('9'),96..105:
      if not dpt.BlSHow then
      begin
        edt_zxks.Text:= '';
        dpt.InitValue:= Chr(Key);
        edt_zxksClick(edt_zxks);
      end;
  end;
end;

procedure Tzypj_fm.INITFM;
begin
  zyxmxz_f:= Tzyxmxz_f.Create(nil);
  with dm.Cds_Qry do
  begin
    Close;
    CommandText:= 'select fldm,flmc from xt_fy_jbxmfl order by xh';
    Open;
    while not eof do
    begin
      cbx_jbfl.Items.Add(FieldByName('flmc').AsString);
      cbx_jbfl.ItemInput.Add(FieldByName('fldm').AsString);
      cbx_jbfl.ItemCodes.Add(FieldByName('fldm').AsString);
      next;
    end;
    cbx_jbfl.ItemCodes.Add('*');
    cbx_jbfl.Items.Add('模板');
    cbx_jbfl.ItemInput.Add('X');
    Close;
    CommandText:= 'select csz from xt_xt_yhcsb where zxtdm=0 and yhbs=''*'' and csmc=''YPSFYBSP''';
    Open;
    if RecordCount=0 then
      StrYpsfsp:= '0'
    else
      StrYpsfsp:= FieldbyName('csz').AsString;
    Close;
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
    ypcldw:= ReadString('药品单位','unit_class','0');
    jyypkc:= ReadString('库存校验','check_amount','0');
    Strmrxmfl:= ReadString('项目分类','defaultClass','A');
    Price_depot:= readString('划价药房','Price_depot','1');
    StrInsurclass:= ReadString('软件','insurclass','医疗保险');
    StrNInsurclass:= ReadString('软件','ninsurclass','新农合');
    StrInsurmsg:= ReadString('软件','insurmsg','0');
    StrInsurmsgbtn:= ReadString('软件','insurmsgbtn','0');
    StrNInsurmsg:= ReadString('软件','ninsurmsg','0');
    StrNInsurmsgbtn:= ReadString('软件','ninsurmsgbtn','0');
  end;
  with zyxmxz_f do
  begin
    OpenDataSet:= OpenJJxm;
    OpenJjxm;
  end;
end;

function Tzypj_fm.Getbzsl(cds: TClientDataSet;bzjb: Integer): Integer;
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

function Tzypj_fm.GetZxsl: Real;
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

function Tzypj_fm.GetPreferentialPrice(Strfb, StrXmfl, StrXmdm, StrXmgg,Strtsxm: String;
  APrice: real): real;
function GetJg: Real;
var
  rjg: Real;
begin
  result:= APrice;
  with Cds_Prc do
  begin
    if (FieldByName('tsxmbz').AsString='0') and (Strtsxm='1') then  //特殊项目屏蔽
    exit;
    if FieldByName('yhsfj').AsFloat>= 0 then                        //优惠金额大于零
    begin
      rJg:= FieldByName('yhsfj').AsFloat;
      if ((APrice-rJg)> FieldByName('mczgxe').AsFloat)
        and (FieldByName('yhsfj').AsFloat >= 0)
        and (FieldByName('mczgxe').AsFloat>=0) then
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
      if (APrice-rJg> FieldByName('mczgxe').AsFloat)
        and (FieldByName('yhsfj').AsFloat >= 0)
        and (FieldByName('mczgxe').AsFloat>=0) then
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

procedure Tzypj_fm.cbx_xmggExit(Sender: TObject);
begin
  blChange:= false;
end;

procedure Tzypj_fm.edt_zxksDownClick(Sender: TObject);
begin
  if UpgradeSigleFile(4,exePath+'Dict\','xt_zd_ks.xml','') then
    MsgInfo('更新收费项目字典成功',1)
  else
    MsgInfo('更新收费项目字典失败',2);
end;

procedure Tzypj_fm.Setsfmbxm(StrMbbm: String);
var
  blFirst: Boolean;
  i: Integer;
begin
  with dm.Cds_Com do
  begin
    {Close;
    CommandText:= 'select * from xt_fy_mbmx where mbbm='''+StrMbbm+'''';
    Open;}
    QryPrc('4','','',StrMbbm,'');
    blFirst:= true;
    while not eof do
    begin
      {showMessage(FieldByName('ypbz').AsString+
        ','+FieldByName('xmfl').AsString+','+FieldByName('xmdm').AsString+','+FieldByName('xmgg').AsString);
      }

      if not blFirst then
        dbgSetFocus(cds_sfxmcfxh.AsString,'',cds_sfxmysdm.AsString,'',
          Cds_sfxmjbfldm.AsString,'',cds_sfxmcyjs.AsString)
      else
        cds_sfxm.Edit;
      with cds_sfxm do
      begin
        FielDByName('zflb').AsString:= dm.Cds_Com.FielDByName('zflb').AsString;
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
        FieldByName('zyfl').AsString:= dm.Cds_Com.FieldByName('zyfl').AsString;
        FieldByName('zysjmc').AsString:= dm.Cds_Com.FieldByName('zysjmc').AsString;
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
        FieldByName('zxksdm').AsString:= dm.Cds_Com.FieldByName('zxks').AsString;
        FieldByName('zxksmc').AsString:= dm.Cds_Com.FieldByName('ksmc').AsString;
        FieldByName('jbzxks').AsString:= dm.Cds_Com.FieldByName('zxks').AsString;
        if StrZLjgbz='1' then
        begin
          FieldByName('jg').AsString:= dm.Cds_Com.FieldByName('jgb').AsString;
          FieldByName('yhjg').AsString:= dm.Cds_Com.FieldByName('jgb').AsString;
          FieldByName('yhhjg').AsString:= dm.Cds_Com.FieldByName('jgb').AsString;
        end
        else if StrZLjgbz='2' then
        begin
          FieldByName('jg').AsString:= dm.Cds_Com.FieldByName('jgc').AsString;
          FieldByName('yhjg').AsString:= dm.Cds_Com.FieldByName('jgc').AsString;
          FieldByName('yhhjg').AsString:= dm.Cds_Com.FieldByName('jgc').AsString;
        end;
        FieldByName('jga').AsString:= dm.Cds_Com.FieldByName('jga').AsString;
        FieldByName('jgb').AsString:= dm.Cds_Com.FieldByName('jgb').AsString;
        FieldByName('jgc').AsString:= dm.Cds_Com.FieldByName('jgc').AsString;
        FieldByName('zljgbz').AsString:= StrZljgbz;
      end;
      blFirst:= false;
      next;
    end;
    dbgSetFocus(cds_sfxmcfxh.AsString,'',cds_sfxmysdm.AsString,'',
          Cds_sfxmjbfldm.AsString,'',cds_sfxmcyjs.AsString);
    SetInput;
  end;
end;

function Tzypj_fm.QryPrc(AStrLx, AStrYpbz, Ajbfldm, AStrXmdm: String;
  const AStrXmgg: String): Boolean;
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
    Params.ParamByName('ISfyh').AsString:= StrSfyh;
    Open;
  end;
end;

procedure Tzypj_fm.dbg_MstMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbRight then
  begin
    if (cds_sfxm.State= dsEdit) or (cds_sfxm.State=dsInsert) then
      cds_sfxm.Post;
    if cds_sfxm.RecordCount= 0 then exit;
    if MsgDelInfo('确定删除整条记录吗？')=ID_NO then exit;
    cds_sfxm.Delete;
    dbg_Mst.SelectedIndex:= 4;
    SetInput;
  end;
end;

procedure Tzypj_fm.UnINITFM;
begin
  if Assigned(ypggxz_f) then
    FreeAndNil(ypggxz_f);
  FreeAndNil(zyxmxz_f);
end;

procedure Tzypj_fm.Cds_sfxmPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  Action:= daAbort;
  cds_sfxm.Cancel;
end;

procedure Tzypj_fm.dbg_MstDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if (StrFb=StrInsurClass) or (StrFb=StrNInsurClass) then
  begin
    if Cds_sfxm.FieldByName('zflb').AsString='3' then
      dbg_mst.Canvas.Brush.Color:= $00C8C8FF
    else if Cds_sfxm.FieldByName('zflb').AsString='2' then
      dbg_mst.Canvas.Brush.Color:= $00FFCD9B
    else
      dbg_mst.Canvas.Brush.Color:=  dbg_mst.EvenRowColor;
  end
  else
    dbg_mst.Canvas.Brush.Color:= dbg_mst.EvenRowColor;
  if cds_sfxm.FieldByName('xjl').AsString='0' then
    dbg_mst.Canvas.Font.Color:= clBlue
  else
    dbg_mst.Canvas.Font.Color:= clBlack;
  dbg_mst.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure Tzypj_fm.Openjjxm;
begin
  with zyxmxz_f.cds_item do
  begin
    {Close;
    DataRequest('xt_fy_cxjb_mc');
    FetchParams;
    Params.ParamByName('Ilx').AsString:= '2'; 
    Params.ParamByName('Ikf').AsString:= Price_depot;
    Open;}
    LoadFromFile(exepath+'Dict\yfypzd.xml');
    Filtered:= true;
  end;
end;

procedure Tzypj_fm.cbx_xzClick(Sender: TObject);
begin
  SetClientDataSetStatus(cds_sfxm);
  if cbx_xz.Checked then
    Cds_sfxm.FieldByName('xz').AsString:= '√'
  else
    Cds_sfxm.FieldByName('xz').AsString:= '';
end;


procedure Tzypj_fm.cbx_xzKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
    begin
      dbg_mst.SelectedIndex:= 9;
      SetInput;
    end;
  end;
end;

function Tzypj_fm.saveSCData(StrZyh: String; Var AErrStr: String): Boolean;
var
  OleData: Array of OleVariant;
  OleTable: Array of OleVariant;
  v1,v2: OleVariant;
  iOle, iErr: Integer;
begin
  iOle:= 1;
  if dm.Cds_Dtl6.ChangeCount > 0 then
  begin
  SetLength(OleData,iOle);
  SetLength(OleTable,iOle);
  OleData[iOle-1]:= dm.Cds_Dtl6.Delta;
  OleTable[iOle-1]:= 'ls_gz_lsh';

  inc(iOle);
  end;
  SetLength(OleData,iOle);
  SetLength(OleTable,iOle);
  Oletable[iOle-1]:= '***yz_sclszlxm';
  OleData[iOle-1]:= '[Izyh='+StrZyh+']';
  inc(iOle);
  if iOle= 1 then exit;
  case iOle of
    2:
    begin
      v1:= VarArrayCreate([0,0],varVariant);
      v2:= VarArrayCreate([0,0],varVariant);
    end;
    3:
    begin
      v1:= VarArrayCreate([0,1],varVariant);
      v2:= VarArrayCreate([0,1],varVariant);
    end;
  end;
  for iErr:= Low(OleData) to High(OleData) do

  begin
    v1[iErr]:= OleData[iErr];
    v2[iErr]:= OleTable[iErr];
  end;
  dm.SockConn.AppServer.Updates(v1,v2,0,iErr,AErrStr);
  if iErr=0 then
  begin
    if dm.Cds_Mst.ChangeCount > 0 then
    begin
      dm.Cds_Mst.EmptyDataSet;
    end;
    result:= true;
  end
  else
    result:= false;
end;

end.
