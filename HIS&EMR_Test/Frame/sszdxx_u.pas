unit sszdxx_u;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, TFlatMaskEditUnit, TFlatMaskDateUnit, TFlatComboBoxUnit,
  FlatComboBoxCode, ExtCtrls, TFlatPanelUnit, FlatSelEdit, Grids, DBGridEh,
  DB, DBClient, share_u, shareMsg_u, UserFunc_u;

type
  Tsszdxx_fm = class(TFrame)
    dbg_mst: TDBGridEh;
    edt_ssmc: TFlatSelEdit;
    cbx_qk: TFlatComboBoxCode;
    cbx_yh: TFlatComboBoxCode;
    ds_ssxx: TDataSource;
    cds_yh: TClientDataSet;
    cds_yhQKDM: TStringField;
    cds_yhQKMC: TStringField;
    cds_qkdj: TClientDataSet;
    cds_qkdjDJDM: TStringField;
    cds_qkdjDJMC: TStringField;
    cds_ssxx: TClientDataSet;
    cds_ssxxssxh: TIntegerField;
    cds_ssxxssmc: TStringField;
    cds_ssxxssbm: TStringField;
    cds_ssxxqkdj: TStringField;
    cds_ssxxssrq: TStringField;
    cds_ssxxmzff: TStringField;
    cds_ssxxssys: TStringField;
    cds_ssxxdjmc: TStringField;
    cds_ssxxqkyhqk: TStringField;
    cds_ssxxyh: TStringField;
    cds_ssxxSSYZ: TStringField;
    cds_ssxxSSEZ: TStringField;
    cds_ssxxmzys: TStringField;
    edt_ssys: TFlatSelEdit;
    edt_ssyz: TFlatSelEdit;
    edt_ssez: TFlatSelEdit;
    edt_mzfs: TFlatSelEdit;
    edt_mzys: TFlatSelEdit;
    cds_ssxxmzffmc: TStringField;
    cds_ssxxssysmc: TStringField;
    cds_ssxxssyzmc: TStringField;
    cds_ssxxssezmc: TStringField;
    cds_ssxxmzysmc: TStringField;
    Cds_ys: TClientDataSet;
    Cds_ysXM: TStringField;
    Cds_ysRYBH: TStringField;
    edt_ssrq: TFlatMaskDate;
    procedure edt_ssrqChangeNew(Sender: TObject);
    procedure dbg_mstCellClick(Column: TColumnEh);
    procedure edt_ssrqKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_ssmcClick(Sender: TObject);
    procedure edt_ssmcDownClick(Sender: TObject);
    procedure edt_ssmcKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_ssysClick(Sender: TObject);
    procedure edt_ssysDownClick(Sender: TObject);
    procedure edt_ssysKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_ssyzClick(Sender: TObject);
    procedure edt_ssyzKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_ssezClick(Sender: TObject);
    procedure edt_ssezKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_mzfsClick(Sender: TObject);
    procedure edt_mzfsDownClick(Sender: TObject);
    procedure edt_mzfsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_mzysClick(Sender: TObject);
    procedure edt_mzysKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbx_qkChange(Sender: TObject);
    procedure cbx_qkKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbx_yhChange(Sender: TObject);
    procedure cbx_yhKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_ssrqExit(Sender: TObject);
  private
    StrSsdm: String;
    StrYsdm: String;
    StrMzdm: String;
    procedure OpenSscz;
    procedure OPenMzff;
    Procedure OpenZyys;
  public
    StrQsrq, StrZzrq: String;
    procedure SetVisible;
    procedure SetInput;
    Procedure SetZyxxxx(Cds_zyss: TClientDataSet);
    procedure GetZyxxxx(Cds_Zyss: TClientDataSet; StrBrbs,StrBczybs: String);
    procedure INITFM;
    procedure UnInitFM;
  end;

implementation

uses ssczxz_u, mzfsxz_u, zyysxz_u, dm_u;

{$R *.dfm}

{ Tsszdxx_f }

procedure Tsszdxx_fm.INITFM;
begin
  with dm.Cds_Qry do
  begin
    Close;
    CommandText:='select * from xt_zd_qkdj order by djmc asc';
    open;
    cbxItemAdd(cbx_qk,dm.cds_qry,'djmc','djdm');
    Close;
    CommandText:='select * from XT_ZD_QKYHQK ';
    open;
    cbxItemAdd(cbx_yh,dm.Cds_qry,'qkmc','qkdm');
  end;
  ssczxz_f:= Tssczxz_f.Create(nil);
  with ssczxz_f do
  begin
    OpenDataSet:= Opensscz;
    OPensscz;
  end;
  mzfsxz_f:= Tmzfsxz_f.Create(nil);
  with mzfsxz_f do
  begin
    OpenDataSet:= Openmzff;
    Openmzff;
  end;
  zyysxz_f:= Tzyysxz_f.Create(nil);
  with zyysxz_f do
  begin
    OpenDataSet:= Openzyys;
    Openzyys;
  end;
  Cds_ssxx.CreateDataSet;
  with cds_ssxx do
  begin
    Append;
    FieldByName('ssxh').AsString:= '1';
    Post;
    Append;
    FieldByName('ssxh').AsString:= '2';
    Post;
    Append;
    FieldByName('ssxh').AsString:= '3';
    Post;
    Append;
    FieldByName('ssxh').AsString:= '4';
    Post;
    AddIndex('ssxhidx','ssxh',[]);
    IndexName:= 'ssxhidx';
  end;

end;

procedure Tsszdxx_fm.OPenMzff;
begin
  with dm.Cds_Com do
  begin
    Close;
    DataRequest('BA_JBSS_CX');
    FetchParams;
    Params.ParamByName('Ilx').AsString:= '3';
    Open;
    mzfsxz_f.cds_item.CloneCursor(dm.Cds_Com,false);
    mzfsxz_f.cds_item.Filtered:= true;
    Close;
  end;
end;

procedure Tsszdxx_fm.OpenSscz;
begin
  with ssczxz_f.cds_item do
  begin
    Close;
    DataRequest('BA_JBSS_CX');
    FetchParams;
    Params.ParamByName('Ilx').AsString:= '2';
    Open;
    Filtered:= true;
  end;
end;

procedure Tsszdxx_fm.OpenZyys;
begin
  with dm.Cds_Com do
  begin
    Close;
    DataRequest('BA_JBSS_CX');
    FetchParams;
    Params.ParamByName('Ilx').AsString:= '4';
    Open;
    zyysxz_f.cds_item.CloneCursor(dm.Cds_Com,false);
    zyysxz_f.cds_item.Filtered:= true;
    Close;
  end;
end;

procedure Tsszdxx_fm.SetInput;
var
  ACol: Longint;
  r: TRect;
begin
  ACol := dbg_Mst.Col;
  //ARow := dbg_Mst.Row + 1;
  GetCellRectU(r,dbg_Mst);
  SetVisible;
  case ACol of
    1:
    begin
      if Cds_ssxx.FieldByName('ssrq').AsString='' then
        edt_ssrq.Text:= '0000-00-00'
      else
        edt_ssrq.Text:= FormatDateTime('yyyy-mm-dd',Cds_ssxx.FielDByName('ssrq').AsDateTime);
      SetPositionU(r,edt_ssrq);
    end;
    3:
    begin
      if Cds_ssxx.FieldByName('ssrq').AsString='' then exit;
      edt_ssmc.Text:= Cds_ssxx.FieldByName('ssmc').AsString;
      SetPositionU(r,edt_ssmc); 
    end;
    4:
    begin
      if cds_ssxx.FieldByName('ssbm').AsString='' then exit;
      edt_ssys.Text:= Cds_ssxx.FieldByName('ssysmc').AsString;
      SetPositionU(r,edt_ssys);
    end;
    5:
    begin
      if cds_ssxx.FieldByName('ssys').AsString='' then exit;
      edt_ssyz.Text:= Cds_ssxx.FieldByName('ssyzmc').AsString;
      SetPositionU(r,edt_ssyz);
    end;
    6:
    begin
      if cds_ssxx.FieldByName('ssyz').AsString='' then exit;
      edt_ssez.Text:= Cds_ssxx.FieldByName('ssezmc').AsString;
      SetPositionU(r,edt_ssez);
    end;
    7:
    begin
      if cds_ssxx.FieldByName('ssbm').AsString='' then exit;
      edt_mzfs.Text:= Cds_ssxx.FieldByName('mzffmc').AsString;
      SetPositionU(r,edt_mzfs);
    end;
    8:
    begin
      if cds_ssxx.FieldByName('mzff').AsString='' then exit;
      edt_mzys.Text:= Cds_ssxx.FieldByName('mzysmc').AsString;
      SetPositionU(r,edt_mzys);
    end;
    9:
    begin
      if cds_ssxx.FieldByName('ssbm').AsString='' then exit;
      cbx_qk.ItemIndex:= Cbx_qk.ItemCodes.IndexOf(Cds_ssxx.FieldByName('qkdj').AsString);
      SetPositionU(r,cbx_qk);
    end;
    10:
    begin
      if cds_ssxx.FieldByName('ssbm').AsString='' then exit;
      cbx_yh.ItemIndex:= Cbx_yh.ItemCodes.IndexOf(Cds_ssxx.FieldByName('yh').AsString);
      SetPositionU(r,cbx_yh);
    end;
  end;
end;

procedure Tsszdxx_fm.SetVisible;
begin
  edt_ssrq.Visible:= false;
  edt_ssmc.Visible:= false;
  edt_ssys.Visible:= false;
  edt_ssyz.Visible:= false;
  edt_ssez.Visible:= false;
  edt_mzfs.Visible:= false;
  edt_mzys.Visible:= false;
  cbx_qk.Visible:= false;
  cbx_yh.Visible:= false;
end;

procedure Tsszdxx_fm.UnInitFM;
begin
  FreeAndNil(ssczxz_f);
  FreeAndNil(mzfsxz_f);
  FreeAndNil(zyysxz_f);
end;

procedure Tsszdxx_fm.edt_ssrqChangeNew(Sender: TObject);
begin
  if edt_ssrq.Text='0000-00-00' then exit;
  with Cds_ssxx do
  begin
    SetClientDataSetStatus(Cds_ssxx);
    FieldByName('ssrq').AsString:= edt_ssrq.Text;
  end;
end;

procedure Tsszdxx_fm.dbg_mstCellClick(Column: TColumnEh);
begin
  SetInput;
end;

procedure Tsszdxx_fm.edt_ssrqKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
    begin
      if edt_ssrq.Text='0000-00-00' then exit;
      dbg_mst.SelectedIndex:= 2;
      SetInput;
    end;
  end;
end;

procedure Tsszdxx_fm.edt_ssmcClick(Sender: TObject);
begin
  with ssczxz_f do
  begin
    IType:= 1;
    iMode:= 4;
    edt_bm:= edt_ssmc;
    AdjustDropDownForm(ssczxz_f,edt_ssmc);
    ShowItem;
    if not blok then exit;
    edt_ssmc.Text:= Cds_item.FieldByName('xmmc').AsString;
    Strssdm:= Cds_item.FieldByName('xmdm').AsString;
  end;
  with cds_ssxx do
  begin
    SetClientDataSetStatus(Cds_ssxx);
    FieldByName('ssmc').AsString:= edt_ssmc.text;
    FieldByName('ssbm').AsString:= Strssdm;
    FieldbyName('qkdj').AsString:= '0';
    FieldByName('qkyhqk').AsString:= '0';
  end;
  dbg_mst.SelectedIndex:= 3;
  SetInput;
end;

procedure Tsszdxx_fm.edt_ssmcDownClick(Sender: TObject);
begin
  OpenSscz;
  MsgInfo('刷新手术操作编码成功',1);
end;

procedure Tsszdxx_fm.edt_ssmcKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
    begin
      if Cds_ssxx.FieldByName('ssbm').AsString='' then exit;
      dbg_mst.SelectedIndex:= 3;
      SetInput;
    end;
    Ord('A')..Ord('Z'),Ord('0')..Ord('9'),96..105:
    begin
      if not ssczxz_f.blShow then
      begin
        edt_ssmc.Text:= '';
        if (Key>=96) and (Key<=105) then
          ssczxz_f.edt_ssbm.Text:= Chr(Key-48)
        else
          ssczxz_f.edt_ssbm.Text:= Chr(Key);
        edt_ssmcClick(edt_ssmc);
      end;
    end;
    VK_LEFT:
    begin
      dbg_mst.SelectedIndex:= 0;
      SetInput;
    end;
    VK_BACK:
    begin
      with cds_ssxx do
      begin

        if RecNO < RecordCount then
        begin
          DisableControls;
          Next;
          if FieldByName('ssbm').AsString<>'' then
          begin
            MsgInfo('不是最后手术记录，不能删除',2);
            Prior;
            EnableControls;
            exit;
          end;
          Prior;
          EnableControls;
        end;

        edit;
        FieldByName('ssrq').AsString:= '';
        FieldByName('ssmc').AsString:= '';
        FieldByName('ssbm').AsString:= '';
        FieldByName('qkdj').AsString:= '';
        FieldByName('mzff').AsString:= '';
        FieldByName('ssys').AsString:= '';
        FieldByName('ssyz').AsString:= '';
        FieldByName('ssez').AsString:= '';
        FieldByName('qkyhqk').AsString:= '';
        FieldByName('mzys').AsString:= '';
        Post;
      end;
    end;
  end;
end;

procedure Tsszdxx_fm.edt_ssysClick(Sender: TObject);
begin
  with zyysxz_f do
  begin
    IType:= 1;
    iMode:= 3;
    edt_bm:= edt_ssys;
    AdjustDropDownForm(zyysxz_f,edt_ssys);
    ShowItem;
    if not blok then exit;
    edt_ssys.Text:= Cds_item.FieldByName('xmmc').AsString;
    StrYsdm:= Cds_item.FieldByName('xmdm').AsString;
    Cds_item.Filter:= '';
  end;
  with cds_ssxx do
  begin
    SetClientDataSetStatus(Cds_ssxx);
    FieldByName('ssysmc').AsString:= edt_ssys.text;
    FieldByName('ssys').AsString:= StrYsdm;
  end;
  dbg_mst.SelectedIndex:= 4;
  SetInput;
end;

procedure Tsszdxx_fm.edt_ssysDownClick(Sender: TObject);
begin
  OpenZYys;
  MsgInfo('刷新医生字典成功',1);
end;

procedure Tsszdxx_fm.edt_ssysKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
    VK_RETURN:
    begin
      if Cds_ssxx.FieldByName('ssys').AsString='' then exit;
      dbg_mst.SelectedIndex:= 4;
      SetInput;
    end;
    Ord('A')..Ord('Z'),Ord('0')..Ord('9'),96..105:
    begin
      if not zyysxz_f.blShow then
      begin
        edt_ssys.Text:= '';
        if (Key>=96) and (Key<=105) then
          zyysxz_f.StrInit:= Chr(Key-48)
        else
          zyysxz_f.StrInit:= Chr(Key);
        edt_ssysClick(edt_ssys);
      end;
    end;
    VK_LEFT:
    begin
      dbg_mst.SelectedIndex:= 2;
      SetInput;
    end;
  end;
end;

procedure Tsszdxx_fm.edt_ssyzClick(Sender: TObject);
begin
  with zyysxz_f do
  begin
    IType:= 1;
    iMode:= 3;
    edt_bm:= edt_ssyz;
    AdjustDropDownForm(zyysxz_f,edt_ssyz);
    ShowItem;
    if not blok then exit;
    edt_ssyz.Text:= Cds_item.FieldByName('xmmc').AsString;
    StrYsdm:= Cds_item.FieldByName('xmdm').AsString;
    Cds_item.Filter:= '';
  end;
  with cds_ssxx do
  begin
    SetClientDataSetStatus(Cds_ssxx);
    FieldByName('ssyzmc').AsString:= edt_ssyz.text;
    FieldByName('ssyz').AsString:= StrYsdm;
  end;
  dbg_mst.SelectedIndex:= 5;
  SetInput;
end;

procedure Tsszdxx_fm.edt_ssyzKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
    begin
      if Cds_ssxx.FieldByName('ssyz').AsString='' then
        dbg_mst.SelectedIndex:= 6
      else
        dbg_mst.SelectedIndex:= 5;
      SetInput;
    end;
    Ord('A')..Ord('Z'),Ord('0')..Ord('9'),96..105:
    begin
      if not zyysxz_f.blShow then
      begin
        edt_ssyz.Text:= '';
        if (Key>=96) and (Key<=105) then
          zyysxz_f.StrInit:= Chr(Key-48)
        else
          zyysxz_f.StrInit:= Chr(Key);
        edt_ssyzClick(edt_ssyz);
      end;
    end;
    VK_LEFT:
    begin
      dbg_mst.SelectedIndex:= 3;
      SetInput;
    end;
  end;
end;

procedure Tsszdxx_fm.edt_ssezClick(Sender: TObject);
begin
  with zyysxz_f do
  begin
    IType:= 1;
    iMode:= 3;
    edt_bm:= edt_ssez;
    AdjustDropDownForm(zyysxz_f,edt_ssez);
    ShowItem;
    if not blok then exit;
    edt_ssez.Text:= Cds_item.FieldByName('xmmc').AsString;
    StrYsdm:= Cds_item.FieldByName('xmdm').AsString;
    Cds_item.Filter:= '';
  end;
  with cds_ssxx do
  begin
    SetClientDataSetStatus(Cds_ssxx);
    FieldByName('ssezmc').AsString:= edt_ssez.text;
    FieldByName('ssez').AsString:= StrYsdm;
  end;
  dbg_mst.SelectedIndex:= 6;
  SetInput;
end;

procedure Tsszdxx_fm.edt_ssezKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
    begin
      dbg_mst.SelectedIndex:= 6;
      SetInput;
    end;
    Ord('A')..Ord('Z'),Ord('0')..Ord('9'),96..105:
    begin
      if not zyysxz_f.blShow then
      begin
        edt_ssez.Text:= '';
        if (Key>=96) and (Key<=105) then
          zyysxz_f.StrInit:= Chr(Key-48)
        else
          zyysxz_f.StrInit:= Chr(Key);
        edt_ssezClick(edt_ssez);
      end;
    end;
    VK_LEFT:
    begin
      dbg_mst.SelectedIndex:= 4;
      SetInput;
    end;
  end;
end;

procedure Tsszdxx_fm.edt_mzfsClick(Sender: TObject);
begin
  with mzfsxz_f do
  begin
    IType:= 1;
    iMode:= 3;
    edt_bm:= edt_mzfs;
    AdjustDropDownForm(mzfsxz_f,edt_mzfs);
    ShowItem;
    if not blok then exit;
    edt_mzfs.Text:= Cds_item.FieldByName('xmmc').AsString;
    Strmzdm:= Cds_item.FieldByName('xmdm').AsString;
    Cds_item.Filter:= '';
  end;
  with cds_ssxx do
  begin
    SetClientDataSetStatus(Cds_ssxx);
    FieldByName('mzffmc').AsString:= edt_mzfs.text;
    FieldByName('mzff').AsString:= StrMzdm;
  end;
  dbg_mst.SelectedIndex:= 7;
  SetInput;
end;

procedure Tsszdxx_fm.edt_mzfsDownClick(Sender: TObject);
begin
  OpenMzff;
  MsgInfo('刷新麻醉方式成功',1);
end;

procedure Tsszdxx_fm.edt_mzfsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
    begin
      if Cds_ssxx.FieldByName('mzff').AsString='' then exit;
      dbg_mst.SelectedIndex:= 7;
      SetInput;
    end;
    Ord('A')..Ord('Z'),Ord('0')..Ord('9'),96..105:
    begin
      if not mzfsxz_f.blShow then
      begin
        edt_mzfs.Text:= '';
        if (Key>=96) and (Key<=105) then
          mzfsxz_f.StrInit:= Chr(Key-48)
        else
          mzfsxz_f.StrInit:= Chr(Key);
        edt_mzfsClick(edt_mzfs);
      end;
    end;
    VK_LEFT:
    begin
      dbg_mst.SelectedIndex:= 5;
      SetInput;
    end;
  end;
end;

procedure Tsszdxx_fm.edt_mzysClick(Sender: TObject);
begin
  with zyysxz_f do
  begin
    IType:= 1;
    iMode:= 3;
    edt_bm:= edt_mzys;
    AdjustDropDownForm(zyysxz_f,edt_mzys);
    ShowItem;
    if not blok then exit;
    edt_mzys.Text:= Cds_item.FieldByName('xmmc').AsString;
    StrYsdm:= Cds_item.FieldByName('xmdm').AsString;
    Cds_item.Filter:= '';
  end;
  with cds_ssxx do
  begin
    SetClientDataSetStatus(Cds_ssxx);
    FieldByName('mzysmc').AsString:= edt_mzys.text;
    FieldByName('mzys').AsString:= StrYsdm;
  end;
  dbg_mst.SelectedIndex:= 8;
  SetInput;
end;

procedure Tsszdxx_fm.edt_mzysKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
    begin
      if Cds_ssxx.FieldByName('mzys').AsString='' then exit;
      dbg_mst.SelectedIndex:= 8;
      SetInput;
    end;
    Ord('A')..Ord('Z'),Ord('0')..Ord('9'),96..105:
    begin
      if not zyysxz_f.blShow then
      begin
        edt_mzys.Text:= '';
        if (Key>=96) and (Key<=105) then
          zyysxz_f.StrInit:= Chr(Key-48)
        else
          zyysxz_f.StrInit:= Chr(Key);
        edt_mzysClick(edt_mzys);
      end;
    end;
    VK_LEFT:
    begin
      dbg_mst.SelectedIndex:= 6;
      SetInput;
    end;
  end;
end;

procedure Tsszdxx_fm.cbx_qkChange(Sender: TObject);
begin
  if cbx_qk.ItemIndex < 0 then exit;
  with Cds_ssxx do
  begin
    SetClientDataSetStatus(Cds_ssxx);
    FieldByName('qkdj').AsString:=cbx_qk.ItemCodes.Strings[cbx_qk.ItemIndex];
  end;
end;

procedure Tsszdxx_fm.cbx_qkKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
    begin
      if Cds_ssxx.FieldByName('qkdj').AsString='' then exit;
      dbg_mst.SelectedIndex:= 9;
      SetInput;
    end;
    VK_LEFT:
    begin
      dbg_mst.SelectedIndex:= 7;
      SetInput;
    end;
  end;
end;

procedure Tsszdxx_fm.cbx_yhChange(Sender: TObject);
begin
  if cbx_yh.ItemIndex < 0 then exit;
  with Cds_ssxx do
  begin
    SetClientDataSetStatus(Cds_ssxx);
    FieldByName('qkyhqk').AsString:=cbx_yh.ItemCodes.Strings[cbx_yh.ItemIndex];
  end;
end;

procedure Tsszdxx_fm.cbx_yhKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
    begin
      if cds_ssxx.FieldByName('qkyhqk').AsString='' then exit;
      if cds_ssxx.RecNo<4 then
      begin
        cds_ssxx.Next;
        dbg_mst.SelectedIndex:= 0;
        SetInput;
      end;
    end;
    VK_LEFT:
    begin
      dbg_mst.SelectedIndex:= 8;
      SetInput;
    end;
  end;
end;

procedure Tsszdxx_fm.GetZyxxxx(Cds_Zyss: TClientDataSet; StrBrbs,
  StrBczybs: String);
var
  i: Integer;
begin
  with Cds_zyss do
  begin
    for i:= 1 to 4 do
    begin
      Cds_ssxx.RecNo:= i;
      if cds_ssxx.FieldByName('ssbm').AsString<>'' then
      begin
        if Locate('ssxh',i,[]) then
        begin
          Edit;
        end
        else
        begin
          Append;
          FieldByName('brbs').AsString:= StrBrbs;
          FieldByName('bczybs').AsString:= StrBczybs;
          FielDByname('ssxh').AsInteger:= i;
        end;
        FieldByName('ssrq').AsString:= Cds_ssxx.FieldByName('ssrq').AsString;
        FieldByName('ssbm').AsString:= Cds_ssxx.FieldByName('ssbm').AsString;
        FieldByName('ssmc').AsString:= Cds_ssxx.FieldByName('ssmc').AsString;
        FieldByName('ssys').AsString:= Cds_ssxx.FieldByName('ssys').AsString;
        FieldByName('ssyz').AsString:= Cds_ssxx.FieldByName('ssyz').AsString;
        FieldByName('ssez').AsString:= Cds_ssxx.FieldByName('ssez').AsString;
        FieldByName('mzff').AsString:= Cds_ssxx.FieldByName('mzff').AsString;
        FieldByName('mzys').AsString:= Cds_ssxx.FieldByName('mzys').AsString;
        FieldByName('qkdj').AsString:= Cds_ssxx.FieldByName('qkdj').AsString;
        FieldByName('qkyhqk').AsString:= Cds_ssxx.FieldByName('qkyhqk').AsString;
        Post;
      end
      else
      begin
        if Locate('ssxh',i,[]) then
          delete;
      end;
    end;
  end;
end;

procedure Tsszdxx_fm.SetZyxxxx(Cds_zyss: TClientDataSet);
var
  i: Integer;
begin
  with Cds_zyss do
  begin
    for i:= 1 to 4 do
    begin
      Cds_ssxx.RecNo:= i;
      if Locate('ssxh',i,[]) then
      begin
        Cds_ssxx.Edit;
        Cds_ssxx.FieldByName('ssrq').AsString:= formatDatetime('yyyy-mm-dd',FieldByName('ssrq').AsDateTime);
        Cds_ssxx.FieldByName('ssbm').AsString:= FieldByName('ssbm').AsString;
        Cds_ssxx.FieldByName('ssmc').AsString:= FieldByName('ssmc').AsString;
        Cds_ssxx.FieldByName('ssys').AsString:= FieldByName('ssys').AsString;
        Cds_ssxx.FieldByName('ssyz').AsString:= FieldByName('ssyz').AsString;
        Cds_ssxx.FieldByName('ssez').AsString:= FieldByName('ssez').AsString;
        Cds_ssxx.FieldByName('mzff').AsString:= FieldByName('mzff').AsString;
        Cds_ssxx.FieldByName('mzys').AsString:= FieldByName('mzys').AsString;
        Cds_ssxx.FieldByName('qkdj').AsString:= FieldByName('qkdj').AsString;
        Cds_ssxx.FieldByName('qkyhqk').AsString:= FieldByName('qkyhqk').AsString;
        Cds_ssxx.Post;
      end
      else
      begin
        Cds_ssxx.Edit;
        Cds_ssxx.FieldByName('ssrq').AsString:= '';
        Cds_ssxx.FieldByName('ssbm').AsString:= '';
        Cds_ssxx.FieldByName('ssmc').AsString:= '';
        Cds_ssxx.FieldByName('ssys').AsString:= '';
        Cds_ssxx.FieldByName('ssyz').AsString:= '';
        Cds_ssxx.FieldByName('ssez').AsString:= '';
        Cds_ssxx.FieldByName('mzff').AsString:= '';
        Cds_ssxx.FieldByName('mzys').AsString:= '';
        Cds_ssxx.FieldByName('qkdj').AsString:= '';
        Cds_ssxx.FieldByName('qkyhqk').AsString:= '';
        Cds_ssxx.Post;
      end;
    end;
  end;
end;

procedure Tsszdxx_fm.edt_ssrqExit(Sender: TObject);
begin
  if ((edt_ssrq.Text>StrZzrq) or (edt_ssrq.Text<StrQsrq)) and (edt_ssrq.Text<>'0000-00-00') then
  begin
    dbg_mst.SelectedIndex:= 2;
    SetInput;
    exit;
  end;
end;

end.
