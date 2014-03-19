unit basyxx_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PlugIn_u, ComCtrls, brjbxx_u, zyzdxx_u, ExtCtrls, sszdxx_u,
  StdCtrls, TFlatEditUnit, TFlatComboBoxUnit, FlatComboBoxCode, Db,
  TFlatPanelUnit, FlatSelEdit, XPButton, UserFunc_u, DictIpt, share_u, shareMsg_u;

type
  TOpenDataSet=procedure() of Object;
  Tbasyxx_f = class(TPlugIn_f)
    pgc_syxx: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    pnl_zdxx: TPanel;
    ZDXX_FM: TZYZDXX_fm;
    pnl_ssxx: TPanel;
    Label1: TLabel;
    edt_gmyw: TFlatEdit;
    Label36: TLabel;
    edt_ywfy: TFlatEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    pnl_fyxx: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    cbx_hbsag: TFlatComboBoxCode;
    cbx_hcv: TFlatComboBoxCode;
    cbx_hiv: TFlatComboBoxCode;
    cbx_fsbl: TFlatComboBoxCode;
    cbx_mzcy: TFlatComboBoxCode;
    cbx_sqsh: TFlatComboBoxCode;
    cbx_lcbl: TFlatComboBoxCode;
    edt_qjcs: TOWFlatEdit;
    edt_cgcs: TOWFlatEdit;
    edt_kzr: TFlatSelEdit;
    edt_zrys: TFlatSelEdit;
    edt_zzys: TFlatSelEdit;
    edt_zyys: TFlatSelEdit;
    edt_zkhs: TFlatSelEdit;
    edt_zkys: TFlatSelEdit;
    edt_jxys: TFlatEdit;
    edt_yjssxys: TFlatEdit;
    edt_sxys: TFlatEdit;
    Label39: TLabel;
    cbx_rycy: TFlatComboBoxCode;
    cbx_bazl: TFlatComboBoxCode;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    cbx_stjc: TFlatComboBoxCode;
    cbx_dyl: TFlatComboBoxCode;
    cbx_sz: TFlatComboBoxCode;
    edt_szn: TOWFlatEdit;
    edt_szy: TOWFlatEdit;
    edt_szr: TOWFlatEdit;
    cbx_sjbl: TFlatComboBoxCode;
    cbx_xx: TFlatComboBoxCode;
    cbx_rh: TFlatComboBoxCode;
    cbx_sxfy: TFlatComboBoxCode;
    edt_hxb: TOWFlatEdit;
    edt_xxb: TOWFlatEdit;
    edt_xj: TOWFlatEdit;
    edt_qx: TOWFlatEdit;
    edt_qt: TOWFlatEdit;
    Btn_bc: TXPButton;
    btn_qp: TXPButton;
    Btn_gb: TXPButton;
    stbr_xx: TStatusBar;
    dpt1: TDictIpt;
    jbxx_fm: Tbrjbxx_fm;
    ssxx_fm: Tsszdxx_fm;

    procedure FormCreate(Sender: TObject);
    procedure jbxx_fmedt_lxdhKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZDXX_FMedt_sszdyyClick(Sender: TObject);
    procedure ZDXX_FMedt_sszdyyKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_gmywKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_ywfyKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbx_hcvKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbx_hivKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbx_hbsagKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbx_mzcyKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbx_rycyKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbx_sqshKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbx_lcblKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbx_fsblKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_qjcsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_cgcsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbx_bazlKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_kzrKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_zrysKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_zzysKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_zyysKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_jxysKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_yjssxysKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_sxysKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_zkysKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_zkhsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ssxx_fmcbx_yhKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbx_stjcKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbx_dylKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbx_szKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_sznKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_szyKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_szrKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbx_sjblKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbx_xxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbx_rhKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbx_sxfyKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_hxbKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_xxbKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_xjKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_qxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_qtKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ssxx_fmedt_ssrqKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_kzrClick(Sender: TObject);
    procedure edt_gmywChange(Sender: TObject);
    procedure edt_ywfyChange(Sender: TObject);
    procedure cbx_hbsagChange(Sender: TObject);
    procedure cbx_hcvChange(Sender: TObject);
    procedure cbx_hivChange(Sender: TObject);
    procedure cbx_mzcyChange(Sender: TObject);
    procedure cbx_rycyChange(Sender: TObject);
    procedure cbx_sqshChange(Sender: TObject);
    procedure cbx_lcblChange(Sender: TObject);
    procedure cbx_fsblChange(Sender: TObject);
    procedure edt_qjcsChange(Sender: TObject);
    procedure edt_cgcsChange(Sender: TObject);
    procedure cbx_bazlChange(Sender: TObject);
    procedure edt_zrysClick(Sender: TObject);
    procedure edt_zzysClick(Sender: TObject);
    procedure edt_zyysClick(Sender: TObject);
    procedure edt_yjssxysChange(Sender: TObject);
    procedure edt_sxysChange(Sender: TObject);
    procedure edt_zkysClick(Sender: TObject);
    procedure edt_zkhsClick(Sender: TObject);
    procedure cbx_stjcChange(Sender: TObject);
    procedure cbx_dylChange(Sender: TObject);
    procedure cbx_szChange(Sender: TObject);
    procedure edt_sznChange(Sender: TObject);
    procedure edt_szyChange(Sender: TObject);
    procedure edt_szrChange(Sender: TObject);
    procedure cbx_sjblChange(Sender: TObject);
    procedure cbx_xxChange(Sender: TObject);
    procedure cbx_rhChange(Sender: TObject);
    procedure cbx_sxfyChange(Sender: TObject);
    procedure edt_hxbChange(Sender: TObject);
    procedure edt_xxbChange(Sender: TObject);
    procedure edt_xjChange(Sender: TObject);
    procedure edt_qxChange(Sender: TObject);
    procedure edt_qtChange(Sender: TObject);
    procedure edt_kzrDownClick(Sender: TObject);
    procedure edt_zkhsDownClick(Sender: TObject);
    procedure Btn_bcClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edt_jxysChange(Sender: TObject);
  private
    blSetValue: Boolean;
    procedure Openbaxx;
    procedure SetBaxx;
    function SaveData(var ErrStr: String): Boolean;
  public

  end;

var
  basyxx_f: Tbasyxx_f;

implementation

uses dm_u;

{$R *.dfm}

procedure Tbasyxx_f.FormCreate(Sender: TObject);
begin
  inherited;
  jbxx_fm.OpenBaxx:= OpenBaxx;
  jbxx_fm.SetBaxx:= Setbaxx;
  jbxx_fm.Cds_brzyjl:= dm.Cds_Mst;
  jbxx_fm.Cds_brjbxx:= dm.cds_dtl2;
  zdxx_fm.Cds_zybrjl:= dm.Cds_Mst;
  jbxx_fm.INITFM;
  zdxx_fm.INITFM;
  ssxx_fm.INITFM;
  blSetValue:= true;
end;

procedure Tbasyxx_f.jbxx_fmedt_lxdhKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_RETURN:
    begin
      pgc_syxx.ActivePageIndex:= 1;
      pnl_zdxx.Enabled:= true;
      zdxx_fm.edt_mzzd.SetFocus;
    end;
  end;
end;

procedure Tbasyxx_f.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  zdxx_fm.UnINITFM;
  ssxx_fm.UnInitFM;
end;

procedure Tbasyxx_f.ZDXX_FMedt_sszdyyClick(Sender: TObject);
begin
  inherited;
  ZDXX_FM.edt_sszdyyClick(Sender);
  pgc_syxx.ActivePageIndex:= 2;
  pnl_ssxx.Enabled:= true;
  edt_gmyw.SetFocus;
end;

procedure Tbasyxx_f.ZDXX_FMedt_sszdyyKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  ZDXX_FM.edt_sszdyyKeyDown(Sender, Key, Shift);
  pgc_syxx.ActivePageIndex:= 2;
  pnl_ssxx.Enabled:= true;
  edt_gmyw.SetFocus;
end;

procedure Tbasyxx_f.edt_gmywKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_RETURN: edt_ywfy.SetFocus;
  end;
end;

procedure Tbasyxx_f.edt_ywfyKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_RETURN: cbx_hbsag.SetFocus;
  end;
end;

procedure Tbasyxx_f.cbx_hbsagKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_RETURN: cbx_hcv.SetFocus;
  end;
end;

procedure Tbasyxx_f.cbx_hcvKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_RETURN: cbx_hiv.SetFocus;
  end;
end;

procedure Tbasyxx_f.cbx_hivKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_RETURN: cbx_mzcy.SetFocus;
  end;
end;

procedure Tbasyxx_f.cbx_mzcyKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_RETURN: cbx_rycy.SetFocus;
  end;
end;

procedure Tbasyxx_f.cbx_rycyKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_RETURN: cbx_sqsh.SetFocus;
  end;
end;

procedure Tbasyxx_f.cbx_sqshKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_RETURN: cbx_lcbl.SetFocus;
  end;
end;

procedure Tbasyxx_f.cbx_lcblKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_RETURN: cbx_fsbl.SetFocus;
  end;
end;

procedure Tbasyxx_f.cbx_fsblKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_RETURN: edt_qjcs.SetFocus;
  end;
end;

procedure Tbasyxx_f.edt_qjcsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_RETURN: edt_cgcs.SetFocus;
  end;
end;

procedure Tbasyxx_f.edt_cgcsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_RETURN: cbx_bazl.SetFocus;
  end;
end;

procedure Tbasyxx_f.cbx_bazlKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_RETURN: edt_Kzr.SetFocus;
  end;
end;

procedure Tbasyxx_f.edt_kzrKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_RETURN: edt_zrys.SetFocus;
    Ord('A')..Ord('Z'),Ord('0')..Ord('9'),96..105:
    begin
      if not dpt1.blShow then
      begin
        edt_kzr.Text:= '';
        if (Key>=96) and (Key<=105) then
          dpt1.InitValue := Chr(Key-48)
        else
          dpt1.InitValue:= Chr(Key);
        edt_kzrClick(edt_kzr);
      end;
    end;
  end;
end;

procedure Tbasyxx_f.edt_zrysKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_RETURN: edt_zzys.SetFocus;
    Ord('A')..Ord('Z'),Ord('0')..Ord('9'),96..105:
    begin
      if not dpt1.blShow then
      begin
        edt_zrys.Text:= '';
        if (Key>=96) and (Key<=105) then
          dpt1.InitValue := Chr(Key-48)
        else
          dpt1.InitValue:= Chr(Key);
        edt_zrysClick(edt_zrys);
      end;
    end;
  end;
end;

procedure Tbasyxx_f.edt_zzysKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_RETURN: edt_Zyys.SetFocus;
    Ord('A')..Ord('Z'),Ord('0')..Ord('9'),96..105:
    begin
      if not dpt1.blShow then
      begin
        edt_zzys.Text:= '';
        if (Key>=96) and (Key<=105) then
          dpt1.InitValue := Chr(Key-48)
        else
          dpt1.InitValue:= Chr(Key);
        edt_zzysClick(edt_zzys);
      end;
    end;
  end;
end;

procedure Tbasyxx_f.edt_zyysKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_RETURN: edt_jxys.SetFocus;
    Ord('A')..Ord('Z'),Ord('0')..Ord('9'),96..105:
    begin
      if not dpt1.blShow then
      begin
        edt_zyys.Text:= '';
        if (Key>=96) and (Key<=105) then
          dpt1.InitValue := Chr(Key-48)
        else
          dpt1.InitValue:= Chr(Key);
        edt_zyysClick(edt_zyys);
      end;
    end;
  end;
end;

procedure Tbasyxx_f.edt_jxysKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_RETURN: edt_yjssxys.SetFocus;
  end;
end;

procedure Tbasyxx_f.edt_yjssxysKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_RETURN: edt_sxys.SetFocus;
  end;
end;

procedure Tbasyxx_f.edt_sxysKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_RETURN: edt_zkys.SetFocus;
  end;
end;

procedure Tbasyxx_f.edt_zkysKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_RETURN: edt_zkhs.SetFocus;
    Ord('A')..Ord('Z'),Ord('0')..Ord('9'),96..105:
    begin
      if not dpt1.blShow then
      begin
        edt_zkys.Text:= '';
        if (Key>=96) and (Key<=105) then
          dpt1.InitValue := Chr(Key-48)
        else
          dpt1.InitValue:= Chr(Key);
        edt_zkysClick(edt_zkys);
      end;
    end;
  end;
end;

procedure Tbasyxx_f.edt_zkhsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_RETURN:
    begin
      ssxx_fm.cds_ssxx.First;
      ssxx_fm.dbg_mst.SelectedIndex:= 0;
      ssxx_fm.SetInput;
    end;
    Ord('A')..Ord('Z'),Ord('0')..Ord('9'),96..105:
    begin
      if not dpt1.blShow then
      begin
        edt_zkhs.Text:= '';
        if (Key>=96) and (Key<=105) then
          dpt1.InitValue := Chr(Key-48)
        else
          dpt1.InitValue:= Chr(Key);
        edt_zkhsClick(edt_zkhs);
      end;
    end;
  end;
end;

procedure Tbasyxx_f.ssxx_fmedt_ssrqKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  ssxx_fm.edt_ssrqKeyDown(Sender, Key, Shift);
  case Key of
    VK_RETURN:
      if ssxx_fm.cds_ssxx.FieldbyName('ssrq').AsString='' then
      begin
        ssxx_fm.SetVisible;
        cbx_stjc.SetFocus;
      end;
  end;
end;
procedure Tbasyxx_f.ssxx_fmcbx_yhKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  ssxx_fm.cbx_yhKeyDown(Sender, Key, Shift);
  case Key of
    VK_RETURN:
      if ssxx_fm.cds_ssxx.RecNo=4 then
      begin
        ssxx_fm.SetVisible;
        Cbx_stjc.SetFocus;
      end;
  end;
end;

procedure Tbasyxx_f.cbx_stjcKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case key of
    VK_RETURN: cbx_dyl.SetFocus;
  end;
end;

procedure Tbasyxx_f.cbx_dylKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case key of
    VK_RETURN: cbx_sz.SetFocus;
  end;
end;

procedure Tbasyxx_f.cbx_szKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case key of
    VK_RETURN: edt_szn.SetFocus;
  end;
end;

procedure Tbasyxx_f.edt_sznKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case key of
    VK_RETURN: edt_szy.SetFocus;
  end;
end;

procedure Tbasyxx_f.edt_szyKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case key of
    VK_RETURN: edt_szr.SetFocus;
  end;
end;

procedure Tbasyxx_f.edt_szrKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case key of
    VK_RETURN: cbx_sjbl.SetFocus;
  end;
end;

procedure Tbasyxx_f.cbx_sjblKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case key of
    VK_RETURN:
    begin
      pgc_syxx.ActivePageIndex:= 3;
      pnl_fyxx.Enabled:= true;
      cbx_xx.SetFocus;
    end;
  end;
end;

procedure Tbasyxx_f.cbx_xxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case key of
    VK_RETURN: cbx_rh.SetFocus;
  end;
end;

procedure Tbasyxx_f.cbx_rhKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case key of
    VK_RETURN: cbx_sxfy.SetFocus;
  end;
end;

procedure Tbasyxx_f.cbx_sxfyKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case key of
    VK_RETURN: edt_hxb.SetFocus;
  end;
end;

procedure Tbasyxx_f.edt_hxbKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case key of
    VK_RETURN: edt_xxb.SetFocus;
  end;
end;

procedure Tbasyxx_f.edt_xxbKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case key of
    VK_RETURN: edt_xj.SetFocus;
  end;
end;

procedure Tbasyxx_f.edt_xjKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case key of
    VK_RETURN: edt_qx.SetFocus;
  end;
end;

procedure Tbasyxx_f.edt_qxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case key of
    VK_RETURN: edt_qt.SetFocus;
  end;
end;

procedure Tbasyxx_f.edt_qtKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if btn_bc.Enable then
    btn_bc.SetFocus;
end;

procedure Tbasyxx_f.edt_kzrClick(Sender: TObject);
var
  StrKzr: String;
begin
  inherited;
  if not ShowDictIpt(dpt1,TWinControl(edt_kzr),ExePath+'Dict\xt_zd_gzry_ys_view.xml',StrKzr,Screen,'[zl]=''住院医生组''') then exit;
  SetClientDataSetStatus(dm.Cds_Mst);
  dm.Cds_Mst.FieldByName('kzr').AsString:= edt_kzr.Text;
  edt_zrys.SetFocus;
end;

procedure Tbasyxx_f.Openbaxx;
begin
  with dm.Cds_Mst do
  begin
    Close;
    CommandText:= 'select * from zy_brzyjl where zyh='''+jbxx_fm.edt_zyh.Text+''' and bczybs='+jbxx_fm.edt_bczybs.Text;
    Open;
  end;
  with dm.Cds_Dtl do
  begin
    Close;
    CommandText:= 'select * from zy_zdjl where brbs='''+jbxx_fm.edt_brid.Text+''' and bczybs='+jbxx_fm.edt_bczybs.Text;
    Open;
  end;
  with dm.Cds_dtl1 do
  begin
    Close;
    CommandText:= 'select * from zy_ssjl where brbs='''+jbxx_fm.edt_brid.Text+''' and bczybs='+jbxx_fm.edt_bczybs.Text;
    Open;
  end;
  with dm.Cds_dtl2 do
  begin
    Close;
    CommandText:= 'select * from zy_brjbxx where brbs='''+jbxx_fm.edt_brid.Text+'''';
    Open;
  end;
end;

procedure Tbasyxx_f.SetBaxx;
begin
  zdxx_fm.SetZyZdxx(dm.cds_dtl);
  ssxx_fm.SetZyxxxx(dm.cds_dtl1);
  blSetvalue:= false;
  with dm.Cds_mst do
  begin
    edt_gmyw.Text:= FieldByName('gmyw').AsString;
    edt_ywfy.Text:= FieldByName('BLFYW').AsString;
    cbx_hbsag.ItemIndex:= cbx_hbsag.ItemCodes.IndexOf(FieldByName('hbsag').AsString);
    cbx_hcv.ItemIndex:= cbx_hcv.ItemCodes.IndexOf(FieldByName('hcv').AsString);
    cbx_hiv.ItemIndex:= cbx_hiv.ItemCodes.IndexOf(FieldByName('hiv').AsString);
    cbx_mzcy.ItemIndex:= cbx_mzcy.ItemCodes.IndexOf(FieldByName('mzcyxf').AsString);
    cbx_rycy.ItemIndex:= cbx_rycy.ItemCodes.IndexOf(FieldByName('rycyxf').AsString);
    cbx_sqsh.ItemIndex:= cbx_sqsh.ItemCodes.IndexOf(FieldByName('sqshxf').AsString);
    cbx_lcbl.ItemIndex:= cbx_lcbl.ItemCodes.IndexOf(FieldByName('lcblxf').AsString);
    cbx_fsbl.ItemIndex:= cbx_fsbl.ItemCodes.IndexOf(FieldByName('fsblxf').AsString);
    edt_qjcs.Text:= FieldByName('qjcs').AsString;
    edt_cgcs.Text:= FieldByName('qjcgs').AsString;
    cbx_bazl.ItemIndex:= cbx_bazl.ItemCodes.IndexOf(FieldByName('bazl').AsString);
    edt_kzr.Text:= FieldByName('kzr').AsString;
    edt_zrys.Text:= FieldByName('zrys').AsString;
    edt_zzys.Text:= FieldByName('zzys').AsString;
    edt_zyys.Text:= FieldByName('jzys').AsString;
    edt_jxys.Text:= FieldByName('jxys').AsString;
    edt_yjssxys.Text:= FieldByName('yjssxys').AsString;
    edt_sxys.Text:= FieldByName('sxys').AsString;
    edt_zkys.Text:= FieldByName('zkys').AsString;
    edt_zkhs.Text:= FieldByName('zkhs').AsString;
    cbx_stjc.ItemIndex:= cbx_stjc.ItemCodes.IndexOf(FieldByName('sjbs').AsString);
    cbx_dyl.ItemIndex:= cbx_dyl.ItemCodes.IndexOf(FieldByName('bydyl').AsString);
    cbx_sz.ItemIndex:= cbx_sz.ItemCodes.IndexOf(FieldByName('sfsz').AsString);
    edt_szn.Text:= FieldByName('szn').AsString;
    edt_szy.Text:= FieldByName('szy').AsString;
    edt_szr.Text:= FieldByName('szr').AsString;
    cbx_sjbl.ItemIndex:= cbx_sjbl.ItemCodes.IndexOf(FieldByName('sjbl').AsString);
    cbx_xx.ItemIndex:= cbx_xx.ItemCodes.IndexOf(FieldByName('xx').AsString);
    cbx_rh.ItemIndex:= cbx_rh.ItemCodes.IndexOf(FieldByName('rh_xx').AsString);
    cbx_sxfy.ItemIndex:= cbx_sxfy.ItemCodes.IndexOf(FieldByName('sxfy').AsString);
    edt_hxb.Text:= FieldByName('hxbsl').AsString;
    edt_xxb.Text:= FieldByName('xxbsl').AsString;
    edt_xj.Text:= FieldByName('xjsl').AsString;
    edt_qx.Text:= FieldByName('qxsl').AsString;
    edt_qt.Text:= FieldByName('qtsl').AsString;
    blSetvalue:= true;
  end;
end;

procedure Tbasyxx_f.edt_gmywChange(Sender: TObject);
begin
  inherited;
  if not blSetValue then exit;
  SetClientDataSetStatus(dm.Cds_Mst);
  dm.Cds_Mst.FieldByName('gmyw').AsString:= edt_gmyw.Text;
end;

procedure Tbasyxx_f.edt_ywfyChange(Sender: TObject);
begin
  inherited;
  if not blSetValue then exit;
  SetClientDataSetStatus(dm.Cds_Mst);
  dm.Cds_Mst.FieldByName('BLFYW').AsString:= edt_ywfy.Text;
end;

procedure Tbasyxx_f.cbx_hbsagChange(Sender: TObject);
begin
  inherited;
  if not blSetValue then exit;
  if cbx_hbsag.ItemIndex< 0 then exit;
  SetClientDataSetStatus(dm.Cds_Mst);
  dm.Cds_Mst.FieldByName('hbsag').AsString:= cbx_hbsag.ItemCodes.Strings[cbx_hbsag.ItemIndex];
end;

procedure Tbasyxx_f.cbx_hcvChange(Sender: TObject);
begin
  inherited;
  if not blSetValue then exit;
  if cbx_hcv.ItemIndex< 0 then exit;
  SetClientDataSetStatus(dm.Cds_Mst);
  dm.Cds_Mst.FieldByName('hcv').AsString:= cbx_hcv.ItemCodes.Strings[cbx_hcv.ItemIndex];
end;

procedure Tbasyxx_f.cbx_hivChange(Sender: TObject);
begin
  inherited;
  if not blSetValue then exit;
  if cbx_hcv.ItemIndex< 0 then exit;
  SetClientDataSetStatus(dm.Cds_Mst);
  dm.Cds_Mst.FieldByName('hiv').AsString:= cbx_hcv.ItemCodes.Strings[cbx_hiv.ItemIndex];
end;

procedure Tbasyxx_f.cbx_mzcyChange(Sender: TObject);
begin
  inherited;
  if not blSetValue then exit;
  if cbx_mzcy.ItemIndex< 0 then exit;
  SetClientDataSetStatus(dm.Cds_Mst);
  dm.Cds_Mst.FieldByName('mzcyxf').AsString:= cbx_mzcy.ItemCodes.Strings[cbx_mzcy.ItemIndex];
end;

procedure Tbasyxx_f.cbx_rycyChange(Sender: TObject);
begin
  inherited;
  if not blSetValue then exit;
  if cbx_rycy.ItemIndex< 0 then exit;
  SetClientDataSetStatus(dm.Cds_Mst);
  dm.Cds_Mst.FieldByName('rycyxf').AsString:= cbx_rycy.ItemCodes.Strings[cbx_rycy.ItemIndex];
end;

procedure Tbasyxx_f.cbx_sqshChange(Sender: TObject);
begin
  inherited;
  if not blSetValue then exit;
  if cbx_sqsh.ItemIndex< 0 then exit;
  SetClientDataSetStatus(dm.Cds_Mst);
  dm.Cds_Mst.FieldByName('sqshxf').AsString:= cbx_sqsh.ItemCodes.Strings[cbx_sqsh.ItemIndex];
end;

procedure Tbasyxx_f.cbx_lcblChange(Sender: TObject);
begin
  inherited;
  if not blSetValue then exit;
  if cbx_lcbl.ItemIndex< 0 then exit;
  SetClientDataSetStatus(dm.Cds_Mst);
  dm.Cds_Mst.FieldByName('lcblxf').AsString:= cbx_lcbl.ItemCodes.Strings[cbx_lcbl.ItemIndex];
end;

procedure Tbasyxx_f.cbx_fsblChange(Sender: TObject);
begin
  inherited;
  if not blSetValue then exit;
  if cbx_fsbl.ItemIndex< 0 then exit;
  SetClientDataSetStatus(dm.Cds_Mst);
  dm.Cds_Mst.FieldByName('fsblxf').AsString:= cbx_fsbl.ItemCodes.Strings[cbx_fsbl.ItemIndex];
end;

procedure Tbasyxx_f.edt_qjcsChange(Sender: TObject);
begin
  inherited;
  if not blSetValue then exit;
  SetClientDataSetStatus(dm.Cds_Mst);
  dm.Cds_Mst.FieldByName('qjcs').AsString:= edt_qjcs.Text;
end;

procedure Tbasyxx_f.edt_cgcsChange(Sender: TObject);
begin
  inherited;
  if not blSetValue then exit;
  SetClientDataSetStatus(dm.Cds_Mst);
  dm.Cds_Mst.FieldByName('qjcgs').AsString:= edt_cgcs.Text;
end;

procedure Tbasyxx_f.cbx_bazlChange(Sender: TObject);
begin
  inherited;
  if not blSetValue then exit;
  if cbx_bazl.ItemIndex< 0 then exit;
  SetClientDataSetStatus(dm.Cds_Mst);
  dm.Cds_Mst.FieldByName('bazl').AsString:= cbx_bazl.ItemCodes.Strings[cbx_bazl.ItemIndex];
end;

procedure Tbasyxx_f.edt_zrysClick(Sender: TObject);
var
  StrKzr: String;
begin
  inherited;
  if not ShowDictIpt(dpt1,TWinControl(edt_zrys),ExePath+'Dict\xt_zd_gzry_ys_view.xml',StrKzr,Screen,'[zl]=''住院医生组''') then exit;
  SetClientDataSetStatus(dm.Cds_Mst);
  dm.Cds_Mst.FieldByName('zrys').AsString:= edt_zrys.Text;
  edt_zzys.SetFocus;
end;

procedure Tbasyxx_f.edt_zzysClick(Sender: TObject);
var
  StrKzr: String;
begin
  inherited;
  if not ShowDictIpt(dpt1,TWinControl(edt_zzys),ExePath+'Dict\xt_zd_gzry_ys_view.xml',StrKzr,Screen,'[zl]=''住院医生组''') then exit;
  SetClientDataSetStatus(dm.Cds_Mst);
  dm.Cds_Mst.FieldByName('zzys').AsString:= edt_zzys.Text;
  edt_zyys.SetFocus;
end;

procedure Tbasyxx_f.edt_zyysClick(Sender: TObject);
var
  StrKzr: String;
begin
  inherited;
  if not ShowDictIpt(dpt1,TWinControl(edt_zyys),ExePath+'Dict\xt_zd_gzry_ys_view.xml',StrKzr,Screen,'[zl]=''住院医生组''') then exit;
  SetClientDataSetStatus(dm.Cds_Mst);
  dm.Cds_Mst.FieldByName('jzys').AsString:= edt_zyys.Text;
  edt_jxys.SetFocus;
end;

procedure Tbasyxx_f.edt_jxysChange(Sender: TObject);
begin
  inherited;
  if not blSetValue then exit;
  SetClientDataSetStatus(dm.Cds_Mst);
  dm.Cds_Mst.FieldByName('jxys').AsString:= edt_jxys.Text;
end;


procedure Tbasyxx_f.edt_yjssxysChange(Sender: TObject);
begin
  inherited;
  if not blSetValue then exit;
  SetClientDataSetStatus(dm.Cds_Mst);
  dm.Cds_Mst.FieldByName('yjssxys').AsString:= edt_yjssxys.Text;
end;

procedure Tbasyxx_f.edt_sxysChange(Sender: TObject);
begin
  inherited;
  if not blSetValue then exit;
  SetClientDataSetStatus(dm.Cds_Mst);
  dm.Cds_Mst.FieldByName('sxys').AsString:= edt_sxys.Text;
end;

procedure Tbasyxx_f.edt_zkysClick(Sender: TObject);
var
  StrKzr: String;
begin
  inherited;
  if not ShowDictIpt(dpt1,TWinControl(edt_zkys),ExePath+'Dict\xt_zd_gzry_ys_view.xml',StrKzr,Screen,'[zl]=''住院医生组''') then exit;
  SetClientDataSetStatus(dm.Cds_Mst);
  dm.Cds_Mst.FieldByName('zkys').AsString:= edt_zkys.Text;
  edt_zkhs.SetFocus;
end;

procedure Tbasyxx_f.edt_zkhsClick(Sender: TObject);
var
  StrKzr: String;
begin
  inherited;
  if not ShowDictIpt(dpt1,TWinControl(edt_zkhs),ExePath+'Dict\xt_zd_gzry_hs_view.xml',StrKzr,Screen) then exit;
  SetClientDataSetStatus(dm.Cds_Mst);
  dm.Cds_Mst.FieldByName('zkhs').AsString:= edt_zkhs.Text;
  ssxx_fm.cds_ssxx.First;
  ssxx_fm.dbg_mst.SelectedIndex:= 0;
  ssxx_fm.SetInput;
end;

procedure Tbasyxx_f.cbx_stjcChange(Sender: TObject);
begin
  inherited;
  if not blSetValue then exit;
  if cbx_stjc.ItemIndex< 0 then exit;
  SetClientDataSetStatus(dm.Cds_Mst);
  dm.Cds_Mst.FieldByName('sjbs').AsString:= cbx_stjc.ItemCodes.Strings[cbx_stjc.ItemIndex];
end;

procedure Tbasyxx_f.cbx_dylChange(Sender: TObject);
begin
  inherited;
  if not blSetValue then exit;
  if cbx_dyl.ItemIndex< 0 then exit;
  SetClientDataSetStatus(dm.Cds_Mst);
  dm.Cds_Mst.FieldByName('bydyl').AsString:= cbx_dyl.ItemCodes.Strings[cbx_dyl.ItemIndex];
end;

procedure Tbasyxx_f.cbx_szChange(Sender: TObject);
begin
  inherited;
  if not blSetValue then exit;
  if cbx_sz.ItemIndex< 0 then exit;
  SetClientDataSetStatus(dm.Cds_Mst);
  dm.Cds_Mst.FieldByName('sfsz').AsString:= cbx_sz.ItemCodes.Strings[cbx_sz.ItemIndex];
end;

procedure Tbasyxx_f.edt_sznChange(Sender: TObject);
begin
  inherited;
  if not blSetValue then exit;
  SetClientDataSetStatus(dm.Cds_Mst);
  dm.Cds_Mst.FieldByName('szn').AsString:= edt_szn.Text;
end;

procedure Tbasyxx_f.edt_szyChange(Sender: TObject);
begin
  inherited;
  if not blSetValue then exit;
  SetClientDataSetStatus(dm.Cds_Mst);
  dm.Cds_Mst.FieldByName('szy').AsString:= edt_szy.Text;
end;

procedure Tbasyxx_f.edt_szrChange(Sender: TObject);
begin
  inherited;
  if not blSetValue then exit;
  SetClientDataSetStatus(dm.Cds_Mst);
  dm.Cds_Mst.FieldByName('szr').AsString:= edt_szr.Text;
end;

procedure Tbasyxx_f.cbx_sjblChange(Sender: TObject);
begin
  inherited;
  if not blSetValue then exit;
  if cbx_sjbl.ItemIndex< 0 then exit;
  SetClientDataSetStatus(dm.Cds_Mst);
  dm.Cds_Mst.FieldByName('sjbl').AsString:= cbx_sjbl.ItemCodes.Strings[cbx_sjbl.ItemIndex];
end;

procedure Tbasyxx_f.cbx_xxChange(Sender: TObject);
begin
  inherited;
  if not blSetValue then exit;
  if cbx_xx.ItemIndex< 0 then exit;
  SetClientDataSetStatus(dm.Cds_Mst);
  dm.Cds_Mst.FieldByName('xx').AsString:= cbx_xx.ItemCodes.Strings[cbx_xx.ItemIndex];
end;

procedure Tbasyxx_f.cbx_rhChange(Sender: TObject);
begin
  inherited;
  if not blSetValue then exit;
  if cbx_rh.ItemIndex< 0 then exit;
  SetClientDataSetStatus(dm.Cds_Mst);
  dm.Cds_Mst.FieldByName('rh_xx').AsString:= cbx_rh.ItemCodes.Strings[cbx_rh.ItemIndex];
end;

procedure Tbasyxx_f.cbx_sxfyChange(Sender: TObject);
begin
  inherited;
  if not blSetValue then exit;
  if cbx_sxfy.ItemIndex< 0 then exit;
  SetClientDataSetStatus(dm.Cds_Mst);
  dm.Cds_Mst.FieldByName('sxfy').AsString:= cbx_sxfy.ItemCodes.Strings[cbx_sxfy.ItemIndex];
end;

procedure Tbasyxx_f.edt_hxbChange(Sender: TObject);
begin
  inherited;
  if not blSetValue then exit;
  SetClientDataSetStatus(dm.Cds_Mst);
  dm.Cds_Mst.FieldByName('hxbsl').AsString:= edt_hxb.Text;
end;

procedure Tbasyxx_f.edt_xxbChange(Sender: TObject);
begin
  inherited;
  if not blSetValue then exit;
  SetClientDataSetStatus(dm.Cds_Mst);
  dm.Cds_Mst.FieldByName('xxbsl').AsString:= edt_xxb.Text;
end;

procedure Tbasyxx_f.edt_xjChange(Sender: TObject);
begin
  inherited;
  if not blSetValue then exit;
  SetClientDataSetStatus(dm.Cds_Mst);
  dm.Cds_Mst.FieldByName('xjsl').AsString:= edt_xj.Text;
end;

procedure Tbasyxx_f.edt_qxChange(Sender: TObject);
begin
  inherited;
  if not blSetValue then exit;
  SetClientDataSetStatus(dm.Cds_Mst);
  dm.Cds_Mst.FieldByName('qxsl').AsString:= edt_qx.Text;
end;

procedure Tbasyxx_f.edt_qtChange(Sender: TObject);
begin
  inherited;
  if not blSetValue then exit;
  SetClientDataSetStatus(dm.Cds_Mst);
  dm.Cds_Mst.FieldByName('qtsl').AsString:= edt_qt.Text;
end;

procedure Tbasyxx_f.edt_kzrDownClick(Sender: TObject);
begin
  inherited;
  if  UpgradeSigleFile(4,ExePath+'Dict\','xt_zd_gzry_ys_view.xml','0')  then
    MsgInfo('医生字典下载成功！！',1)
  else
    MsgInfo('医生字典下载失败！！',2);
end;

procedure Tbasyxx_f.edt_zkhsDownClick(Sender: TObject);
begin
  inherited;
  if  UpgradeSigleFile(4,ExePath+'Dict\','xt_zd_gzry_hs_view.xml','0')  then
    MsgInfo('护士字典下载成功！！',1)
  else
    MsgInfo('护士字典下载失败！！',2);
end;

function Tbasyxx_f.SaveData(var ErrStr: String): Boolean;
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
    OleTable[iOle-1]:= 'zy_brzyjl';
    inc(iOle);
  end;
  if dm.Cds_dtl.ChangeCount > 0 then
  begin
    SetLength(OleData,iOle);
    SetLength(OleTable,iOle);
    OleData[iOle-1]:= dm.Cds_dtl.Delta;
    OleTable[iOle-1]:= 'zy_zdjl';
    inc(iOle);
  end;
  if dm.cds_dtl1.ChangeCount > 0 then
  begin
    SetLength(OleData,iOle);
    SetLength(OleTable,iOle);
    OleData[iOle-1]:= dm.cds_dtl1.Delta;
    OleTable[iOle-1]:= 'zy_ssjl';
    inc(iOle);
  end;
  if dm.Cds_dtl2.ChangeCount > 0 then
  begin
    SetLength(OleData,iOle);
    SetLength(OleTable,iOle);
    OleData[iOle-1]:= dm.Cds_dtl2.Delta;
    OleTable[iOle-1]:= 'zy_brjbxx';
    inc(iOle);
  end;
  if iOle=1 then
  begin
    MsgInfo('没有任何数据改动',1);
    result:= false;
    exit;
  end;
  v1:= VarArrayCreate([0,iOle-2],varVariant);
  v2:= VarArrayCreate([0,iOle-2],varVariant);
  for iErr:= Low(OleData) to High(OleData) do
  begin
    v1[iErr]:= OleData[iErr];
    v2[iErr]:= OleTable[iErr];
  end;
  dm.SockConn.AppServer.Updates(v1,v2,0,iErr,ErrStr);
  if iErr=0 then
  begin
    MsgInfo('病案首页信息保存成功',1);
    result:= true;
  end
  else
  begin
    result:= false;
    MsgInfo('病案首页信息保存失败'+ErrStr,2)
  end;

end;

procedure Tbasyxx_f.Btn_bcClick(Sender: TObject);
var
  ErrStr: String;
begin
  inherited;
  if dm.Cds_Mst.State = dsEdit then
    dm.Cds_Mst.Post;
  if dm.cds_dtl2.State =dsEdit then
    dm.Cds_Dtl2.Post;
  zdxx_fm.GetZyzdxx(dm.cds_dtl,jbxx_fm.edt_brid.Text,jbxx_fm.edt_bczybs.Text);
  ssxx_fm.GetZyxxxx(dm.Cds_Dtl1,jbxx_fm.edt_brid.Text,jbxx_fm.edt_bczybs.Text);
  if not SaveData(ErrStr) then exit;
  jbxx_fm.pnl_brxx.Enabled:= false;
  pnl_zdxx.Enabled:= false;
  pnl_ssxx.Enabled:= false;
  pnl_fyxx.Enabled:= false;
  pgc_syxx.ActivePageIndex:= 0;
  jbxx_fm.edt_zyh.SetFocus;
end;

procedure Tbasyxx_f.FormShow(Sender: TObject);
begin
  inherited;
  pgc_syxx.ActivePageIndex:= 0;
  jbxx_fm.edt_zyh.SetFocus;
end;


end.
