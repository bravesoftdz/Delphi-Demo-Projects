unit brjbxx_u;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, TFlatEditUnit, Mask, TFlatMaskEditUnit, StrUtils,
  TFlatMaskDateUnit, TFlatComboBoxUnit, FlatComboBoxCode, TFlatPanelUnit,
  FlatSelEdit, shareMsg_u, UserFunc_u, DictIpt, share_u, DB, DBClient;

type
  TOpenDataSet=procedure() of Object;
  Tbrjbxx_fm = class(TFrame)
    Panel1: TPanel;
    pnl_brxx: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edt_brid: TFlatEdit;
    edt_zyh: TFlatEdit;
    edt_bczybs: TOWFlatEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    edt_xm: TFlatEdit;
    cbx_xb: TFlatComboBoxCode;
    edt_csrq: TFlatMaskDate;
    cbx_hyzk: TFlatComboBoxCode;
    edt_mz: TFlatSelEdit;
    edt_csd: TFlatSelEdit;
    edt_gj: TFlatSelEdit;
    edt_gzdw: TFlatEdit;
    edt_txdz: TFlatSelEdit;
    edt_yzbm: TFlatEdit;
    edt_yb: TFlatEdit;
    edt_lxdz: TFlatSelEdit;
    edt_lxdh: TFlatEdit;
    edt_lxrxm: TFlatEdit;
    edt_sfzh: TFlatMaskDate;
    Panel3: TPanel;
    Label22: TLabel;
    Label26: TLabel;
    Label23: TLabel;
    Label27: TLabel;
    Label24: TLabel;
    Label28: TLabel;
    Label25: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label73: TLabel;
    cbx_ryfs: TFlatComboBoxCode;
    Label71: TLabel;
    cbx_md: TFlatComboBoxCode;
    Label31: TLabel;
    edt_dwdh: TFlatEdit;
    Label32: TLabel;
    Panel4: TPanel;
    edt_nl: TFlatEdit;
    Label33: TLabel;
    edt_ryks: TFlatEdit;
    edt_ryrq: TFlatMaskDate;
    edt_cyrq: TFlatMaskDate;
    edt_rybs: TFlatEdit;
    edt_zkks: TFlatEdit;
    edt_cyks: TFlatEdit;
    edt_cybs: TFlatEdit;
    edt_zyts: TFlatEdit;
    Panel2: TPanel;
    edt_fb: TFlatEdit;
    dpt1: TDictIpt;
    edt_lxrgx: TFlatSelEdit;
    edt_zy: TFlatSelEdit;
    procedure edt_bridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_zyhKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_bczybsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_xmKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbx_xbKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_csrqKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbx_hyzkKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_zyClick(Sender: TObject);
    procedure edt_zyDownClick(Sender: TObject);
    procedure edt_zyKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_csdClick(Sender: TObject);
    procedure edt_csdDownClick(Sender: TObject);
    procedure edt_csdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_mzClick(Sender: TObject);
    procedure edt_mzDownClick(Sender: TObject);
    procedure edt_mzKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_gjClick(Sender: TObject);
    procedure edt_gjDownClick(Sender: TObject);
    procedure edt_gjKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_sfzhKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbx_ryfsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbx_mdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_gzdwKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_dwdhKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_yzbmKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_txdzKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_ybKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_lxrxmKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_lxrgx1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_lxdzKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_xmChange(Sender: TObject);
    procedure cbx_xbChange(Sender: TObject);
    procedure edt_csrqChangeNew(Sender: TObject);
    procedure cbx_hyzkChange(Sender: TObject);
    procedure edt_sfzhChangeNew(Sender: TObject);
    procedure cbx_ryfsChange(Sender: TObject);
    procedure cbx_mdChange(Sender: TObject);
    procedure edt_gzdwChange(Sender: TObject);
    procedure edt_dwdhChange(Sender: TObject);
    procedure edt_yzbmChange(Sender: TObject);
    procedure edt_txdzClick(Sender: TObject);
    procedure edt_txdzChange(Sender: TObject);
    procedure edt_ybChange(Sender: TObject);
    procedure edt_lxrxmChange(Sender: TObject);
    procedure edt_lxdzChange(Sender: TObject);
    procedure edt_lxdhChange(Sender: TObject);
    procedure edt_lxrgxClick(Sender: TObject);
    procedure edt_lxrgxDownClick(Sender: TObject);
    procedure edt_lxrgxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_csrqExit(Sender: TObject);
  private
    blSetVal: Boolean;
  public
    OpenBaxx: TOpenDataSet;
    SetBaxx: TOpenDataSet;
    StrZydm,Strmzdm,Strgjdm, Strcsddm, Strgxdm: String;
    Cds_brjbxx: TClientDataSet;
    Cds_brzyjl: TClientDataSet;
    function QryBrxx(Ilx: String): Boolean;
    procedure INITFM;
    Procedure ClearScr;
  end;

implementation

uses dm_u;

{$R *.dfm}
function Tbrjbxx_fm.QryBrxx(Ilx: String): Boolean;
begin
  with dm.Cds_com do
  begin
    Close;
    DataRequest('BA_BRXX_CX');
    FetchParams;
    Params.ParamByName('Ilx').AsString:= Ilx;
    Params.ParamByName('Izyh').AsString:= edt_zyh.Text;
    Params.ParamByName('IBrbs').AsString:= edt_brid.Text;
    Params.ParamByName('IBczybs').AsString:= edt_bczybs.Text;
    Open;
    if RecordCount=0 then
    begin
      MsgInfo('找不到病人记录',2);
      ClearScr;
      result:= false;
      exit;
    end;
    blSetVal:= false;
    edt_zyh.Text:= FieldbyName('zyh').AsString;
    edt_brid.Text:= FieldByName('brbs').AsString;
    edt_xm.Text:= FielDByName('xm').AsString;
    edt_bczybs.Text:= FieldByName('bczybs').AsString; 
    cbx_xb.ItemIndex:= cbx_xb.Items.IndexOf(FieldByName('xb').AsString);
    edt_csrq.Text:= FormatDateTime('yyyy-mm-dd',FieldByName('csrq').AsDateTime);
    edt_nl.Text:= FieldByName('nl').AsString;
    edt_fb.Text:= FieldByName('fb').AsString;
    cbx_hyzk.ItemIndex:= cbx_hyzk.ItemCodes.IndexOf(FielDByName('hyzk').AsString);
    StrZYdm:= FieldbyName('zy').AsString;
    edt_zy.Text:= FieldByName('zymc').AsString;
    StrCsddm:= FieldByName('csd').AsString;
    edt_csd.Text:= FieldByName('csdmc').AsString;
    StrGjdm:= FieldByName('gj').AsString;
    edt_gj.Text:= FieldByName('gjmc').AsString;
    StrMzdm:= FieldByName('mz').AsString;
    edt_mz.Text:= FieldByName('mzmc').AsString;
    edt_sfzh.Text:= SetIDCardEdit(FieldByName('sfzh').AsString);
    cbx_ryfs.ItemIndex:= cbx_ryfs.ItemCodes.IndexOf(FieldByName('ryfs').AsString);
    cbx_md.ItemIndex:= cbx_md.ItemCodes.IndexOf(FieldByName('zymd').AsString);
    edt_gzdw.Text:= FielDByName('gzdw').AsString;
    edt_dwdh.Text:= FielDByName('dwdh').AsString;
    edt_yzbm.Text:= FielDByName('yzbm').AsString;
    edt_txdz.Text:= FielDByName('txdz').AsString;
    edt_yb.Text:= FieldByName('hkyb').AsString;
    edt_lxrxm.Text:= FielDByName('lxrxm').AsString;
    edt_lxrgx.Text:= FielDByName('lxrgx').AsString;
    edt_lxdz.Text:= FielDByName('lxrdz').AsString;
    edt_lxdh.Text:= FielDByName('lxrdh').AsString;
    edt_ryrq.Text:= FormatdateTime('yyyy-mm-dd hh:mm:ss',FieldbyName('ryrqj').AsDateTime);
    edt_cyrq.Text:= FormatdateTime('yyyy-mm-dd hh:mm:ss',FieldbyName('cyrqj').AsDateTime);
    edt_ryks.Text:= FieldbyName('ryksmc').AsString;
    edt_cyks.Text:= FieldBYName('cyksmc').AsString;
    edt_zkks.Text:= FieldbyName('zkks').AsString;
    edt_rybs.Text:= FieldbyName('rybs').AsString;
    edt_cybs.Text:= Fieldbyname('cybs').AsString;
    edt_zyts.Text:= FieldByName('zyts').AsString;
    blSetVal:= true;
  end;
  OpenBaxx;
  SetBaxx;
  result:= true;
end;
procedure Tbrjbxx_fm.edt_bridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_Left:
    begin
      if edt_brid.SelStart= 0 then
        edt_zyh.SetFocus;
    end;
    VK_RETURN:
    begin
      edt_bczybs.SetFocus;
    end;
  end;
end;

procedure Tbrjbxx_fm.edt_zyhKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of

    VK_RETURN:
    begin
      if trim(edt_zyh.Text)<>'' then
      begin
        if not QryBrxx('1') then exit;
        pnl_brxx.Enabled:= true;
        edt_xm.SetFocus;
      end
      else
        edt_brid.SetFocus;
    end;
  end;
end;

procedure Tbrjbxx_fm.edt_bczybsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_Left:
    begin
      if edt_bczybs.SelStart= 0 then
        edt_brid.SetFocus;
    end;
    VK_RETURN:
    begin
      if (trim(edt_zyh.Text)='') and (trim(edt_brid.Text)='') then
      begin
        MsgInfo('住院号和病人ID不能都为空',2);
        ClearScr;
        edt_zyh.SetFocus;
      end;
      if not QryBrxx(ifThen(trim(edt_zyh.Text)='','2','1')) then exit;
      pnl_brxx.Enabled:= true;
      edt_xm.SetFocus;
    end;
  end;
end;

procedure Tbrjbxx_fm.INITFM;
begin
  with dm.Cds_Qry do
  begin
    Close;
    CommandText:='select xbmc,xbdm from xt_zd_xb order by xh';
    Open;
    cbxItemAdd(cbx_xb,dm.cds_qry,'xbmc','xbdm');
    Close;
    CommandText:='select mc,dm from xt_zd_hyzk order by xh';
    Open;
    cbxItemAdd(cbx_hyzk,dm.cds_qry,'mc','dm');
    Close;
    CommandText:='select lbdm,lbmc from xt_zd_ryfs order by xh';
    Open;
    cbxItemAdd(cbx_ryfs,dm.cds_qry,'lbmc','lbdm');
    Close;
    CommandText:='select zydm,zymc from xt_zd_zymd order by xh';
    Open;
    cbxItemAdd(cbx_md,dm.cds_qry,'zymc','zydm');
    Close;
  end;
end;

procedure Tbrjbxx_fm.edt_xmKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_Left:
    begin
      if edt_xm.SelStart= 0 then
        edt_bczybs.SetFocus;
    end;
    VK_RETURN: cbx_xb.SetFocus;
  end;
end;

procedure Tbrjbxx_fm.cbx_xbKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_LEFT: edt_xm.SetFocus;
    VK_RETURN: edt_csrq.SetFocus;
  end;
end;

procedure Tbrjbxx_fm.edt_csrqKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_Left:
    begin
      if edt_csrq.SelStart= 0 then
        cbx_xb.SetFocus;
    end;
    VK_RETURN: cbx_hyzk.SetFocus;
  end;
end;

procedure Tbrjbxx_fm.cbx_hyzkKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_Left: edt_csrq.SetFocus;
    VK_RETURN: edt_zy.SetFocus;
  end;
end;

procedure Tbrjbxx_fm.edt_zyClick(Sender: TObject);
begin
  if not ShowDictIpt(dpt1,TWinControl(edt_zy),ExePath+'Dict\XT_ZD_ZYFL.xml',StrZydm,Screen) then exit;
  SetClientDataSetStatus(Cds_brzyjl);
  Cds_brzyjl.FieldByName('zy').AsString:= StrZydm;
  edt_csd.SetFocus;
end;

procedure Tbrjbxx_fm.edt_zyDownClick(Sender: TObject);
begin
  if  UpgradeSigleFile(4,ExePath+'Dict\','XT_ZD_ZYFL.xml','0')  then
    MsgInfo('职业字典下载成功！！',1)
  else
    MsgInfo('职业字典下载失败！！',2);
end;

procedure Tbrjbxx_fm.edt_zyKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_Left: cbx_hyzk.SetFocus;
    VK_RETURN:
      edt_csd.SetFocus;
    Ord('A')..Ord('Z'),Ord('0')..Ord('9'),96..105:
    begin
      if not dpt1.blShow then
      begin
        edt_zy.Text:= '';
        if (Key>=96) and (Key<=105) then
          dpt1.InitValue := Chr(Key-48)
        else
          dpt1.InitValue:= Chr(Key);
        edt_zyClick(edt_zy);
      end;
    end;
  end;
end;

procedure Tbrjbxx_fm.edt_csdClick(Sender: TObject);
begin
  if not ShowDictIpt(dpt1,TWinControl(edt_csd),ExePath+'Dict\XT_ZD_XZQ.xml',Strcsddm,Screen) then exit;
  SetClientDataSetStatus(Cds_brjbxx);
  Cds_brjbxx.FieldByName('csd').AsString:= Strcsddm;
  edt_mz.SetFocus;
end;

procedure Tbrjbxx_fm.edt_csdDownClick(Sender: TObject);
begin
  if  UpgradeSigleFile(4,ExePath+'Dict\','XT_ZD_XZQ.xml','0')  then
    MsgInfo('行政区划字典下载成功！！',1)
  else
    MsgInfo('行政区划字典下载失败！！',2);
end;

procedure Tbrjbxx_fm.edt_csdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_Left: edt_zy.SetFocus;
    VK_RETURN:
      edt_mz.SetFocus;
    Ord('A')..Ord('Z'),Ord('0')..Ord('9'),96..105:
    begin
      if not dpt1.blShow then
      begin
        edt_csd.Text:= '';
        if (Key>=96) and (Key<=105) then
          dpt1.InitValue := Chr(Key-48)
        else
          dpt1.InitValue:= Chr(Key);
        edt_csdClick(edt_csd);
      end;
    end;
  end;
end;

procedure Tbrjbxx_fm.edt_mzClick(Sender: TObject);
begin
  if not ShowDictIpt(dpt1,TWinControl(edt_mz),ExePath+'Dict\XT_ZD_MZ.xml',Strmzdm,Screen) then exit;
  SetClientDataSetStatus(Cds_brjbxx);
  Cds_brjbxx.FieldByName('mz').AsString:= Strmzdm;
  edt_gj.SetFocus;
end;

procedure Tbrjbxx_fm.edt_mzDownClick(Sender: TObject);
begin
  if  UpgradeSigleFile(4,ExePath+'Dict\','XT_ZD_MZ.xml','0')  then
    MsgInfo('民族字典下载成功！！',1)
  else
    MsgInfo('民族字典下载失败！！',2);
end;

procedure Tbrjbxx_fm.edt_mzKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_Left: edt_csd.SetFocus;
    VK_RETURN:
      edt_Gj.SetFocus;
    Ord('A')..Ord('Z'),Ord('0')..Ord('9'),96..105:
    begin
      if not dpt1.blShow then
      begin
        edt_mz.Text:= '';
        if (Key>=96) and (Key<=105) then
          dpt1.InitValue := Chr(Key-48)
        else
          dpt1.InitValue:= Chr(Key);
        edt_mzClick(edt_mz);
      end;
    end;
  end;
end;

procedure Tbrjbxx_fm.edt_gjClick(Sender: TObject);
begin
  if not ShowDictIpt(dpt1,TWinControl(edt_gj),ExePath+'Dict\XT_ZD_GJDQ.xml',Strgjdm,Screen) then exit;
  SetClientDataSetStatus(Cds_brjbxx);
  Cds_brjbxx.FieldByName('gj').AsString:= Strgjdm;
  edt_sfzh.SetFocus;
end;

procedure Tbrjbxx_fm.edt_gjDownClick(Sender: TObject);
begin
  if  UpgradeSigleFile(4,ExePath+'Dict\','XT_ZD_GJDQ.xml','0')  then
    MsgInfo('职业字典下载成功！！',1)
  else
    MsgInfo('职业字典下载失败！！',2);
end;

procedure Tbrjbxx_fm.edt_gjKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_Left: edt_mz.SetFocus;
    VK_RETURN:
      edt_sfzh.SetFocus;
    Ord('A')..Ord('Z'),Ord('0')..Ord('9'),96..105:
    begin
      if not dpt1.blShow then
      begin
        edt_gj.Text:= '';
        if (Key>=96) and (Key<=105) then
          dpt1.InitValue := Chr(Key-48)
        else
          dpt1.InitValue:= Chr(Key);
        edt_gjClick(edt_gj);
      end;
    end;
  end;
end;

procedure Tbrjbxx_fm.edt_sfzhKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_Left:
    begin
      if edt_sfzh.SelStart= 0 then
        edt_gj.SetFocus;
    end;
    VK_RETURN:  cbx_ryfs.SetFocus;
  end;
end;

procedure Tbrjbxx_fm.cbx_ryfsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_Left: edt_sfzh.SetFocus;
    VK_RETURN:  cbx_md.SetFocus;
  end;
end;

procedure Tbrjbxx_fm.cbx_mdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_Left: cbx_ryfs.SetFocus;
    VK_RETURN:  edt_gzdw.SetFocus;
  end;
end;

procedure Tbrjbxx_fm.edt_gzdwKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_Left:
    begin
      if edt_gzdw.SelStart= 0 then
        cbx_md.SetFocus;
    end;
    VK_RETURN:
    begin
      edt_txdz.Text:= edt_gzdw.Text;
      edt_lxdz.Text:= edt_gzdw.Text;
      edt_dwdh.SetFocus;
    end;
  end;
end;

procedure Tbrjbxx_fm.edt_dwdhKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_Left:
    begin
      if edt_dwdh.SelStart= 0 then
        edt_gzdw.SetFocus;
    end;
    VK_RETURN:
    begin
      edt_lxdh.Text:= edt_dwdh.Text;
      edt_yzbm.SetFocus;
    end;
  end;
end;

procedure Tbrjbxx_fm.edt_yzbmKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_Left:
    begin
      if edt_yzbm.SelStart= 0 then
        edt_dwdh.SetFocus;
    end;
    VK_RETURN:
    begin
      edt_yb.Text:= edt_yzbm.Text;
      edt_txdz.SetFocus;
    end;
  end;
end;

procedure Tbrjbxx_fm.edt_txdzKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_Left:
    begin
        edt_yzbm.SetFocus;
    end;
    VK_RETURN:  edt_yb.SetFocus;
  end;
end;

procedure Tbrjbxx_fm.edt_ybKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_Left:
    begin
      if edt_yb.SelStart= 0 then
        edt_txdz.SetFocus;
    end;
    VK_RETURN:  edt_lxrxm.SetFocus;
  end;
end;

procedure Tbrjbxx_fm.edt_lxrxmKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_Left:
    begin
      if edt_lxrxm.SelStart= 0 then
        edt_yb.SetFocus;
    end;
    VK_RETURN:  edt_lxrgx.SetFocus;
  end;
end;

procedure Tbrjbxx_fm.edt_lxrgx1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN:  edt_lxdz.SetFocus;
  end;
end;

procedure Tbrjbxx_fm.edt_lxdzKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_Left: edt_lxrgx.SetFocus;
    VK_RETURN:  edt_lxdh.SetFocus;
  end;
end;
procedure Tbrjbxx_fm.edt_xmChange(Sender: TObject);
begin
  if not blSetVal then exit;
  SetClientDataSetStatus(Cds_brjbxx);
  Cds_brjbxx.FieldByName('xm').AsString:= edt_xm.Text;
end;

procedure Tbrjbxx_fm.cbx_xbChange(Sender: TObject);
begin
  if not blSetVal then exit;
  SetClientDataSetStatus(Cds_brjbxx);
  Cds_brjbxx.FieldByName('xb').AsString:= cbx_xb.Text;
end;

procedure Tbrjbxx_fm.edt_csrqChangeNew(Sender: TObject);
begin
  if not blSetVal then exit;
  SetClientDataSetStatus(Cds_brjbxx);
  Cds_brjbxx.FieldByName('csrq').AsString:= edt_csrq.Text;
end;

procedure Tbrjbxx_fm.cbx_hyzkChange(Sender: TObject);
begin
  if not blSetVal then exit;
  if cbx_hyzk.ItemIndex < 0 then exit;
  SetClientDataSetStatus(Cds_brzyjl);
  Cds_brzyjl.FieldByName('hyzk').AsString:= cbx_hyzk.ItemCodes.Strings[cbx_Hyzk.ItemIndex];
end;

procedure Tbrjbxx_fm.edt_sfzhChangeNew(Sender: TObject);
begin
  if not blSetVal then exit;
  SetClientDataSetStatus(Cds_brjbxx);
  Cds_brjbxx.FieldByName('sfzh').AsString:= edt_sfzh.value;
end;

procedure Tbrjbxx_fm.cbx_ryfsChange(Sender: TObject);
begin
  if not blSetVal then exit;
  if cbx_ryfs.ItemIndex < 0 then exit;
  SetClientDataSetStatus(Cds_brzyjl);
  Cds_brzyjl.FieldByName('ryfs').AsString:= cbx_ryfs.ItemCodes.Strings[cbx_ryfs.ItemIndex];
end;

procedure Tbrjbxx_fm.cbx_mdChange(Sender: TObject);
begin
  if not blSetVal then exit;
  if cbx_md.ItemIndex < 0 then exit;
  SetClientDataSetStatus(Cds_brzyjl);
  Cds_brzyjl.FieldByName('zymd').AsString:= cbx_md.ItemCodes.Strings[cbx_md.ItemIndex];
end;

procedure Tbrjbxx_fm.edt_gzdwChange(Sender: TObject);
begin
  if not blSetVal then exit;
  SetClientDataSetStatus(Cds_brzyjl);
  Cds_brzyjl.FieldByName('gzdw').AsString:= edt_gzdw.Text;
end;

procedure Tbrjbxx_fm.edt_dwdhChange(Sender: TObject);
begin
  if not blSetVal then exit;
  SetClientDataSetStatus(Cds_brzyjl);
  Cds_brzyjl.FieldByName('dwdh').AsString:= edt_dwdh.Text;
end;

procedure Tbrjbxx_fm.edt_yzbmChange(Sender: TObject);
begin
  if not blSetVal then exit;
  SetClientDataSetStatus(Cds_brzyjl);
  Cds_brzyjl.FieldByName('yzbm').AsString:= edt_yzbm.Text;
end;

procedure Tbrjbxx_fm.edt_txdzClick(Sender: TObject);
begin
  if not ShowDictIpt(dpt1,TWinControl(edt_txdz),ExePath+'Dict\XT_ZD_XZQ.xml',StrZydm,Screen) then exit;
end;

procedure Tbrjbxx_fm.edt_txdzChange(Sender: TObject);
begin
  if not blSetVal then exit;
  SetClientDataSetStatus(Cds_brzyjl);
  Cds_brzyjl.FieldByName('txdz').AsString:= edt_txdz.Text;
end;

procedure Tbrjbxx_fm.edt_ybChange(Sender: TObject);
begin
  if not blSetVal then exit;
  SetClientDataSetStatus(Cds_brzyjl);
  Cds_brzyjl.FieldByName('hkyb').AsString:= edt_yb.Text;
end;

procedure Tbrjbxx_fm.edt_lxrxmChange(Sender: TObject);
begin
  if not blSetVal then exit;
  SetClientDataSetStatus(Cds_brzyjl);
  Cds_brzyjl.FieldByName('Lxrxm').AsString:= edt_lxrxm.Text;
end;

procedure Tbrjbxx_fm.edt_lxdzChange(Sender: TObject);
begin
  if not blSetVal then exit;
  SetClientDataSetStatus(Cds_brzyjl);
  Cds_brzyjl.FieldByName('lxrdz').AsString:= edt_lxdz.Text;
end;

procedure Tbrjbxx_fm.edt_lxdhChange(Sender: TObject);
begin
  if not blSetVal then exit;
  SetClientDataSetStatus(Cds_brzyjl);
  Cds_brzyjl.FieldByName('lxrdh').AsString:= edt_lxdh.Text;
end;

procedure Tbrjbxx_fm.edt_lxrgxClick(Sender: TObject);
begin
  if not ShowDictIpt(dpt1,TWinControl(edt_lxrgx),ExePath+'Dict\XT_ZD_JTGX.xml',Strgxdm,Screen) then exit;
  SetClientDataSetStatus(Cds_brzyjl);
  Cds_brzyjl.FieldByName('lxrgx').AsString:= edt_lxrgx.Text;
  edt_lxdz.SetFocus;
end;

procedure Tbrjbxx_fm.edt_lxrgxDownClick(Sender: TObject);
begin
  if  UpgradeSigleFile(4,ExePath+'Dict\','XT_ZD_JTGX.xml','0')  then
    MsgInfo('家庭关系字典下载成功！！',1)
  else
    MsgInfo('家庭关系字典下载失败！！',2);
end;

procedure Tbrjbxx_fm.edt_lxrgxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_Left: edt_lxrxm.SetFocus;
    VK_RETURN:
      edt_lxdz.SetFocus;
    Ord('A')..Ord('Z'),Ord('0')..Ord('9'),96..105:
    begin
      if not dpt1.blShow then
      begin
        edt_lxrgx.Text:= '';
        if (Key>=96) and (Key<=105) then
          dpt1.InitValue := Chr(Key-48)
        else
          dpt1.InitValue:= Chr(Key);
        edt_lxrgxClick(edt_lxrgx);
      end;
    end;
  end;
end;

procedure Tbrjbxx_fm.edt_csrqExit(Sender: TObject);
begin
  edt_nl.Text:= IntToStr(StrToInt(copy(formatDateTime('yyyy-mm-dd',Date),1,4))-
    StrToInt(Copy(edt_csrq.Text,1,4)));
end;

procedure Tbrjbxx_fm.ClearScr;
begin
  edt_zyh.Text:= '';
  edt_brid.Text:= '';
  edt_bczybs.Text:= '0';
  edt_xm.Text:= '';
  cbx_xb.ItemIndex:= -1;
  edt_csrq.Text:= FormatDateTime('yyyy-mm-dd',Date);
  edt_nl.Text:= '';
  edt_fb.Text:= '';
  cbx_hyzk.ItemIndex:= -1;
  edt_zy.Text:= '';
  edt_csd.Text:= '';
  edt_mz.Text:= '';
  edt_gj.Text:= '';
  edt_sfzh.Text:= '000000-00000000-0000';
  cbx_ryfs.ItemIndex:= -1;
  cbx_md.ItemIndex:= -1;
  edt_gzdw.Text:= '';
  edt_dwdh.Text:= '';
  edt_yzbm.Text:= '';
  edt_txdz.Text:= '';
  edt_yb.Text:= '';
  edt_lxrxm.Text:= '';
  edt_lxrgx.Text:= '';
  edt_lxdz.Text:= '';
  edt_lxdh.Text:= '';
  edt_ryrq.Text:= '';
  edt_cyrq.Text:= '';
  edt_ryks.Text:= '';
  edt_cyks.Text:= '';
  edt_rybs.Text:= '';
  edt_cybs.Text:= '';
  edt_zkks.Text:= '';
  edt_zyts.Text:= '';
end;

end.
