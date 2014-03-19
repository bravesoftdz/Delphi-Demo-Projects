unit zyzdxx_u;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGridEh, DB, DBClient, ExtCtrls, TFlatPanelUnit, FlatSelEdit,
  StdCtrls, TFlatEditUnit, TFlatComboBoxUnit, FlatComboBoxCode, Mask,
  TFlatMaskEditUnit, TFlatMaskDateUnit, UserFunc_u, DictIpt, share_u,
  shareMsg_u,Variants;

type
  TZYZDXX_fm = class(TFrame)
    dbg_Mst: TDBGridEh;
    cds_zdxx: TClientDataSet;
    cds_zdxxlb: TStringField;
    cds_zdxxzdms: TStringField;
    cds_zdxxzddm: TStringField;
    cds_zdxxjg: TStringField;
    cds_zdxxts: TStringField;
    cds_zdxxsfss: TStringField;
    cds_zdxxqzrq: TDateField;
    cds_zdxxzdxh: TStringField;
    edt_zdms: TFlatSelEdit;
    cbx_zljg: TFlatComboBoxCode;
    edt_zlts: TOWFlatEdit;
    cbx_sfss: TFlatComboBoxCode;
    edt_qzrq: TFlatMaskDate;
    ds_zdxx: TDataSource;
    dpt1: TDictIpt;
    cds_zdxxsfssmc: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    edt_mzzd: TFlatSelEdit;
    edt_ryzd: TFlatSelEdit;
    Label3: TLabel;
    Label4: TLabel;
    cbx_ryqk: TFlatComboBoxCode;
    edt_ryqzrq: TFlatMaskDate;
    Label5: TLabel;
    edt_blzd: TFlatSelEdit;
    Label6: TLabel;
    edt_sszdyy: TFlatSelEdit;
    cds_qkdj: TClientDataSet;
    cds_qkdjJGDM: TStringField;
    cds_qkdjJGMC: TStringField;
    cds_zdxxjgmc: TStringField;
    procedure dbg_MstCellClick(Column: TColumnEh);
    procedure edt_zdmsClick(Sender: TObject);
    procedure edt_zdmsDownClick(Sender: TObject);
    procedure edt_zdmsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbx_zljgChange(Sender: TObject);
    procedure cbx_zljgKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_zltsChange(Sender: TObject);
    procedure cbx_sfssChange(Sender: TObject);
    procedure cds_zdxxCalcFields(DataSet: TDataSet);
    procedure edt_qzrqChangeNew(Sender: TObject);
    procedure edt_zltsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbx_sfssKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_qzrqKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_mzzdClick(Sender: TObject);
    procedure edt_mzzdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbx_ryqkKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_ryzdClick(Sender: TObject);
    procedure edt_ryzdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_ryqzrqKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_blzdClick(Sender: TObject);
    procedure edt_blzdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_sszdyyClick(Sender: TObject);
    procedure edt_sszdyyKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbx_ryqkChange(Sender: TObject);
  private
    Strzdbm: String;
    procedure OpenJbmc;
  public
    Cds_zybrjl: TClientDataSet;
    StrMzzd, StrRyzd, StrBlzd, StrSszdyy: String;
    StrZyts: String;
    procedure SetVisible;
    procedure SetInput;
    Procedure INITFM;
    Procedure SetZyZdxx(Cds_zyzd: TClientDataSet; AStrZyts: String);
    procedure GetZyzdxx(Cds_Zyzd: TClientDataSet; StrBrbs,StrBczybs: String);
    Procedure UnINITFM;
    Procedure ClearScr;
  end;

implementation

uses dm_u, jbmcxz_u;

{$R *.dfm}

{ TZYZDXX_fm }

procedure TZYZDXX_fm.INITFM;
begin
  cds_zdxx.CreateDataSet;
  with Cds_zdxx do
  begin
    First;
    Append;
    FieldByName('lb').AsString:= '主要诊断';
    FieldByName('sfss').AsString:= '0';
    Post;
    Append;
    FieldByName('lb').AsString:= '其他诊断';
    FieldByName('sfss').AsString:= '0';
    Post;
    Append;
    FieldByName('lb').AsString:= '';
    FieldByName('sfss').AsString:= '0';
    Post;
    Append;
    FieldByName('lb').AsString:= '';
    FieldByName('sfss').AsString:= '0';
    Post;
    Append;
    FieldByName('lb').AsString:= '';
    FieldByName('sfss').AsString:= '0';
    Post;
    Append;
    FieldByName('lb').AsString:= '';
    FieldByName('sfss').AsString:= '0';
    Post;
    Append;
    FieldByName('lb').AsString:= '';
    FieldByName('sfss').AsString:= '0';
    Post;
    Append;
    FieldByName('lb').AsString:= '医院感染名称';
    FieldByName('sfss').AsString:= '0';
    Post;
    Append;
    FieldByName('lb').AsString:= '手术并发症';
    FieldByName('sfss').AsString:= '0';
    Post;
    Append;
    FieldByName('lb').AsString:= '非手术并发症';
    FieldByName('sfss').AsString:= '0';
    Post;
    First;
  end;
  with dm.Cds_Qry do
  begin
    Close;
    CommandText:='select * from xt_zd_zljg Order by XH';
    Open;
    cbxItemAdd(cbx_zljg,dm.cds_qry,'jgmc','jgdm');
    Close;
    Commandtext:='select * from xt_zd_rybq order by xh';
    Open;
    cbxItemAdd(cbx_ryqk,dm.cds_qry,'ztmc','ztdm');
    Close;
  end;
  jbmcxz_f:= Tjbmcxz_f.Create(nil);
  with jbmcxz_f do
  begin
    OpenDataSet:= OpenJbmc;
    OpenJbmc;
  end;
end;

procedure TZYZDXX_fm.SetInput;
var
  ACol: Longint;
  r: TRect;
begin
  ACol := dbg_Mst.Col;
  //ARow := dbg_Mst.Row + 1;
  GetCellRectU(r,dbg_Mst);
  SetVisible;
  case ACol of
    2:
    begin
      edt_zdms.Text:= Cds_zdxx.FieldByName('zdms').AsString;
      SetPositionU(r,edt_zdms);
    end;
    3:
    begin
      if cds_zdxx.FieldByName('zddm').AsString='' then exit;
      cbx_zljg.ItemIndex:= cbx_zljg.ItemCodes.IndexOf(Cds_Zdxx.FieldByName('jg').AsString);
      SetPositionU(r,cbx_zljg);
    end;
    4:
    begin
      if cds_zdxx.FieldByName('zddm').AsString='' then exit;
      edt_zlts.Text:= Cds_Zdxx.FieldByName('ts').AsString;
      SetPositionU(r,edt_zlts);
    end;
    5:
    begin
      if cds_zdxx.FieldByName('zddm').AsString='' then exit;
      cbx_sfss.ItemIndex:= cbx_sfss.ItemCodes.IndexOf(Cds_zdxx.FieldByName('sfss').AsString);
      SetPositionU(r,cbx_sfss);
    end;
    6:
    begin
      if cds_zdxx.FieldByName('zddm').AsString='' then exit;
      if Cds_zdxx.FieldByName('qzrq').AsString = '' then
        edt_qzrq.Text:= '0000-00-00'
      else
        edt_qzrq.Text:= FormatDateTime('yyyy-mm-dd',Cds_Zdxx.FieldByName('qzrq').AsDateTime);
      SetPositionU(r,edt_qzrq);
    end;
  end;

end;

procedure TZYZDXX_fm.SetVisible;
begin
  edt_zdms.Visible:= false;
  cbx_zljg.Visible:= false;
  edt_zlts.Visible:= false;
  cbx_sfss.Visible:= false;
  edt_qzrq.Visible:= false;
end;

procedure TZYZDXX_fm.dbg_MstCellClick(Column: TColumnEh);
begin
  SetInput;
end;

procedure TZYZDXX_fm.edt_zdmsClick(Sender: TObject);
begin
  with jbmcxz_f do
  begin
    IType:= 1;
    iMode:= 3;
    edt_bm:= edt_zdms;
    blzdyy:= false;
    AdjustDropDownForm(jbmcxz_f,edt_zdms);
    ShowItem;
    if not blok then exit;
    edt_zdms.Text:= Cds_item.FieldByName('xmmc').AsString;
    Strzdbm:= Cds_item.FieldByName('xmdm').AsString;
  end;
  with cds_zdxx do
  begin
    SetClientDataSetStatus(Cds_zdxx);
    FieldByName('zdms').AsString:= edt_zdms.text;
    FieldByName('zddm').AsString:= Strzdbm;
    FieldbyName('ts').AsString:= StrZyts;
  end;
  dbg_mst.SelectedIndex:= 2;
  SetInput;
end;

procedure TZYZDXX_fm.edt_zdmsDownClick(Sender: TObject);
begin
  OpenJbmc;
  MsgInfo('疾病名称信息下载成功！！',1);
end;

procedure TZYZDXX_fm.edt_zdmsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_Left:
    begin
      case cds_zdxx.RecNo of
        1:
        begin
          SetVisible;
          edt_ryqzrq.SetFocus;
        end;
      else
        Cds_zdxx.RecNo:= 1;
        dbg_mst.SelectedIndex:= 5;
        SetInput;
      end;
    end;
    VK_RETURN:
    begin
      case cds_zdxx.RecNo of
        1:
        begin
          if cds_zdxx.FieldByName('zddm').AsString='' then exit;
          dbg_mst.SelectedIndex:= 2;
          SetInput;
        end;
        2..7:
        begin
          if cds_zdxx.FieldByName('zddm').AsString='' then
          begin
            Cds_Zdxx.RecNo:= 8;
            dbg_mst.SelectedIndex:= 1;
            SetInput;
            exit;
          end;
          dbg_mst.SelectedIndex:= 2;
          SetInput;
        end;
        8,9:
        begin
          if cds_zdxx.FieldByName('zddm').AsString='' then
          begin
            Cds_Zdxx.RecNo:= Cds_Zdxx.RecNo+1;
            dbg_mst.SelectedIndex:= 1;
            SetInput;
            exit;
          end;
          dbg_mst.SelectedIndex:= 2;
          SetInput;
        end;
        10:
        begin
          if cds_zdxx.FieldByName('zddm').AsString='' then
          begin
            edt_blzd.SetFocus;
            exit;
          end;
          dbg_mst.SelectedIndex:= 2;
          SetInput;
        end;
      end;
    end;
    Ord('A')..Ord('Z'),Ord('0')..Ord('9'),96..105:
    begin
      if not jbmcxz_f.blShow then
      begin
        edt_zdms.Text:= '';
        if (Key>=96) and (Key<=105) then
          jbmcxz_f.StrInit:= Chr(Key-48)
        else
          jbmcxz_f.StrInit:= Chr(Key);
        edt_zdmsClick(edt_zdms);
      end;
    end;
  end;
end;

procedure TZYZDXX_fm.cbx_zljgChange(Sender: TObject);
begin
  if cbx_zljg.ItemIndex < 0 then exit;
  with Cds_zdxx do
  begin
    SetClientDataSetStatus(Cds_zdxx);
    FieldByName('JG').AsString:=cbx_zljg.ItemCodes.Strings[cbx_zljg.ItemIndex];
  end;
  
end;

procedure TZYZDXX_fm.cbx_zljgKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_Left:
    begin
      dbg_mst.SelectedIndex:= 1;
      SetInput;
    end;
    VK_RETURN:
    begin
      if (Cds_Zdxx.FieldByName('jg').AsString='') and (cds_zdxx.RecNo=1) then exit;
      dbg_mst.SelectedIndex:=3;
      SetInput;
    end;
  end;
end;

procedure TZYZDXX_fm.edt_zltsChange(Sender: TObject);
begin
  with Cds_zdxx do
  begin
    SetClientDataSetStatus(Cds_zdxx);
    FieldByName('ts').AsString:= edt_zlts.Text;
  end;
end;

procedure TZYZDXX_fm.cbx_sfssChange(Sender: TObject);
begin
  if cbx_sfss.ItemIndex < 0 then exit;
  with Cds_zdxx do
  begin
    SetClientDataSetStatus(Cds_zdxx);
    FieldByName('sfss').AsString:= cbx_sfss.ItemCodes.Strings[cbx_sfss.ItemIndex];
  end;
end;

procedure TZYZDXX_fm.cds_zdxxCalcFields(DataSet: TDataSet);
begin
  if Cds_Zdxxsfss.AsString='1' then
    Cds_zdxxSfssmc.AsString:= '是'
  else
    Cds_zdxxSfssmc.AsString:= '';
end;

procedure TZYZDXX_fm.edt_qzrqChangeNew(Sender: TObject);
begin
  if edt_qzrq.Text='0000-00-00' then exit;
  with Cds_zdxx do
  begin
    SetClientDataSetStatus(Cds_zdxx);
    FieldByName('qzrq').AsString:= edt_qzrq.Text;
  end;
end;

procedure TZYZDXX_fm.edt_zltsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_Left:
    begin
      if edt_zlts.SelStart= 0 then
      begin
        dbg_mst.SelectedIndex:= 2;
        SetInput;
      end;
    end;
    VK_RETURN:
    begin
      dbg_mst.SelectedIndex:= 4;
      SetInput;
    end;
  end;
end;

procedure TZYZDXX_fm.cbx_sfssKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_Left:
    begin
      dbg_mst.SelectedIndex:= 3;
      SetINput;
    end;
    VK_RETURN:
    begin
      dbg_mst.SelectedIndex:= 5;
      SetInput;
    end;
  end;
end;

procedure TZYZDXX_fm.edt_qzrqKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_Left:
    begin
      dbg_mst.SelectedIndex:= 4;
      SetInput;
    end;
    VK_RETURN:
    begin
      case cds_zdxx.RecNo of
        1..9:
        begin
          cds_zdxx.Next;
          dbg_mst.SelectedIndex:= 1;
          SetInput;
        end;
        10:
        begin
          SetVisible;
          edt_blzd.SetFocus;
        end;
      end;
    end;
  end;
end;

procedure TZYZDXX_fm.edt_mzzdClick(Sender: TObject);
begin
  with jbmcxz_f do
  begin
    IType:= 1;
    iMode:= 3;
    edt_bm:= edt_mzzd;
    blzdyy:= false;
    AdjustDropDownForm(jbmcxz_f,edt_mzzd);
    ShowItem;
    if not blok then exit;
    edt_mzzd.Text:= Cds_item.FieldByName('xmmc').AsString;
    StrMzzd:= Cds_item.FieldByName('xmdm').AsString;
  end;
  cbx_ryqk.SetFocus;
end;

procedure TZYZDXX_fm.edt_mzzdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
    begin
      cbx_ryqk.SetFocus;
    end;
    Ord('A')..Ord('Z'),Ord('0')..Ord('9'),96..105:
    begin
      if not jbmcxz_f.blShow then
      begin
        edt_mzzd.Text:= '';
        if (Key>=96) and (Key<=105) then
          jbmcxz_f.StrInit:= Chr(Key-48)
        else
          jbmcxz_f.StrInit:= Chr(Key);
        edt_mzzdClick(edt_mzzd);
      end;
    end;
  end;
end;

procedure TZYZDXX_fm.cbx_ryqkKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_Left: edt_mzzd.SetFocus;
    VK_RETURN:
    begin
      edt_ryzd.SetFocus;
    end;
  end;
end;

procedure TZYZDXX_fm.edt_ryzdClick(Sender: TObject);
begin
  with jbmcxz_f do
  begin
    IType:= 1;
    iMode:= 3;
    edt_bm:= edt_ryzd;
    blzdyy:= false;
    AdjustDropDownForm(jbmcxz_f,edt_ryzd);
    ShowItem;
    if not blok then exit;
    edt_ryzd.Text:= Cds_item.FieldByName('xmmc').AsString;
    StrRyzd:= Cds_item.FieldByName('xmdm').AsString;
  end;
  edt_ryqzrq.SetFocus;
end;

procedure TZYZDXX_fm.edt_ryzdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_Left: cbx_ryqk.SetFocus;
    VK_RETURN:
    begin
      edt_ryqzrq.SetFocus;
    end;
    Ord('A')..Ord('Z'),Ord('0')..Ord('9'),96..105:
    begin
      if not jbmcxz_f.blShow then
      begin
        edt_ryzd.Text:= '';
        if (Key>=96) and (Key<=105) then
          jbmcxz_f.StrInit:= Chr(Key-48)
        else
          jbmcxz_f.StrInit:= Chr(Key);
        edt_ryzdClick(edt_ryzd);
      end;
    end;
  end;
end;

procedure TZYZDXX_fm.edt_ryqzrqKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_Left:
    begin
      if edt_ryqzrq.SelStart= 0 then
        edt_ryzd.SetFocus;
    end;
    VK_RETURN:
    begin
      cds_zdxx.First;
      dbg_mst.SelectedIndex:= 1;
      SetInput;
    end;
  end;
end;

procedure TZYZDXX_fm.edt_blzdClick(Sender: TObject);
begin
  with jbmcxz_f do
  begin
    IType:= 1;
    iMode:= 3;
    edt_bm:= edt_blzd;
    blzdyy:= false;
    AdjustDropDownForm(jbmcxz_f,edt_blzd);
    ShowItem;
    if not blok then exit;
    edt_blzd.Text:= Cds_item.FieldByName('xmmc').AsString;
    StrBlzd:= Cds_item.FieldByName('xmdm').AsString;
  end;
  edt_sszdyy.SetFocus;
end;

procedure TZYZDXX_fm.edt_blzdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_Left:
    begin
      Cds_zdxx.RecNo:= 1;
      Dbg_mst.SelectedIndex:= 1;
      SetInput;
    end;
    VK_RETURN:
    begin
      edt_sszdyy.SetFocus;
    end;
    Ord('A')..Ord('Z'),Ord('0')..Ord('9'),96..105:
    begin
      if not jbmcxz_f.blShow then
      begin
        edt_blzd.Text:= '';
        if (Key>=96) and (Key<=105) then
          jbmcxz_f.StrInit:= Chr(Key-48)
        else
          jbmcxz_f.StrInit:= Chr(Key);
        edt_blzdClick(edt_blzd);
      end;
    end;
  end;
end;

procedure TZYZDXX_fm.edt_sszdyyClick(Sender: TObject);
begin
  with jbmcxz_f do
  begin
    IType:= 1;
    iMode:= 3;
    edt_bm:= edt_sszdyy;
    blzdyy:= true;
    AdjustDropDownForm(jbmcxz_f,edt_sszdyy);
    ShowItem;
    if not blok then exit;
    edt_sszdyy.Text:= Cds_item.FieldByName('xmmc').AsString;
    Strsszdyy:= Cds_item.FieldByName('xmdm').AsString;
  end;
end;

procedure TZYZDXX_fm.UnINITFM;
begin
  FreeAndNil(jbmcxz_f);
end;
{
 ==============
 ===============
}
{给疾病名称赋值}
procedure TZYZDXX_fm.OpenJbmc;
begin
  with jbmcxz_f.cds_item do
  begin
    Close;
    DataRequest('BA_JBSS_CX');
    FetchParams;
    Params.ParamByName('Ilx').AsString:= '1';
    Open;
    Filtered:= true;
  end;
end;

procedure TZYZDXX_fm.edt_sszdyyKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_Left: edt_blzd.SetFocus;
    Ord('A')..Ord('Z'),Ord('0')..Ord('9'),96..105:
    begin
      if not jbmcxz_f.blShow then
      begin
        edt_sszdyy.Text:= '';
        if (Key>=96) and (Key<=105) then
          jbmcxz_f.StrInit:= Chr(Key-48)
        else
          jbmcxz_f.StrInit:= Chr(Key);
        edt_sszdyyClick(edt_sszdyy);
      end;
    end;
  end;
end;

procedure TZYZDXX_fm.SetZyZdxx(Cds_zyzd: TClientDataSet; AStrZyts: String);
var
  i: Integer;
begin
  StrZyts:= AStrZyts;
  with cds_Zyzd do
  begin
    if Locate('zdlb;zdxh',VarArrayof(['1',1]),[]) then
    begin
      edt_mzzd.Text:= FieldByName('zd').AsString;
      StrMzzd:= FieldByName('zddm').AsString;
    end
    else
    begin
      edt_mzzd.Text:= '';
      StrMzzd:= '';
    end;
    edt_ryqzrq.Text:= '0000-00-00';
    if Locate('zdlb;zdxh',VarArrayof(['2',1]),[]) then
    begin
      edt_ryzd.Text:= FieldByName('zd').AsString;
      Strryzd:= FieldByName('zddm').AsString;
      if FieldByName('zdrq').AsString<>'' then
        edt_ryqzrq.Text:= FormatDateTime('yyyy-mm-dd',FieldByName('zdrq').AsDateTime);
    end
    else
    begin
      edt_ryzd.Text:= '';
      StrRyzd:= '';
    end;
    for i:= 1 to 7 do
    begin
      Cds_Zdxx.RecNo:= i;
      if Locate('zdlb;zdxh',VarArrayof(['3',i]),[]) then
      begin
        Cds_Zdxx.Edit;
        Cds_Zdxx.FieldByName('zdms').AsString:= FielDByName('zd').AsString;
        Cds_Zdxx.FieldByName('zddm').AsString:= FielDByName('zddm').AsString;
        Cds_Zdxx.FieldByName('qzrq').AsString:= FielDByName('zdrq').AsString;
        Cds_Zdxx.FieldByName('ts').AsString:= FielDByName('zlts').AsString;
        Cds_Zdxx.FieldByName('jg').AsString:= FieldByName('zljg').AsString;
        Cds_Zdxx.FieldByName('sfss').AsString:= FielDByName('sszlbz').AsString;
        Cds_Zdxx.Post;
      end
      else
      begin
        Cds_Zdxx.Edit;
        Cds_Zdxx.FieldByName('zdms').AsString:= '';
        Cds_Zdxx.FieldByName('zddm').AsString:= '';
        Cds_Zdxx.FieldByName('qzrq').AsString:= '';
        Cds_Zdxx.FieldByName('ts').AsString:= '';
        Cds_Zdxx.FieldByName('jg').AsString:= '';
        Cds_Zdxx.FieldByName('sfss').AsString:= '';
        Cds_Zdxx.Post;
      end;
    end;
    if Locate('zdlb;zdxh',VarArrayof(['5',1]),[]) then
    begin
      Cds_Zdxx.RecNo:= 8;
      Cds_Zdxx.Edit;
      Cds_Zdxx.FieldByName('zdms').AsString:= FielDByName('zd').AsString;
      Cds_Zdxx.FieldByName('zddm').AsString:= FielDByName('zddm').AsString;
      Cds_Zdxx.FieldByName('qzrq').AsString:= FielDByName('zdrq').AsString;
      Cds_Zdxx.FieldByName('ts').AsString:= FielDByName('zlts').AsString;
      Cds_Zdxx.FieldByName('jg').AsString:= FieldByName('zljg').AsString;
      Cds_Zdxx.FieldByName('sfss').AsString:= FielDByName('sszlbz').AsString;
      Cds_Zdxx.Post;
    end
    else
    begin
      Cds_Zdxx.RecNo:= 8;
      Cds_Zdxx.Edit;
      Cds_Zdxx.FieldByName('zdms').AsString:= '';
      Cds_Zdxx.FieldByName('zddm').AsString:= '';
      Cds_Zdxx.FieldByName('qzrq').AsString:= '';
      Cds_Zdxx.FieldByName('ts').AsString:= '';
      Cds_Zdxx.FieldByName('jg').AsString:= '';
      Cds_Zdxx.FieldByName('sfss').AsString:= '';
      Cds_Zdxx.Post;
    end;
    if Locate('zdlb;zdxh',VarArrayof(['7',1]),[]) then
    begin
      Cds_Zdxx.RecNo:= 9;
      Cds_Zdxx.Edit;
      Cds_Zdxx.FieldByName('zdms').AsString:= FielDByName('zd').AsString;
      Cds_Zdxx.FieldByName('zddm').AsString:= FielDByName('zddm').AsString;
      Cds_Zdxx.FieldByName('qzrq').AsString:= FielDByName('zdrq').AsString;
      Cds_Zdxx.FieldByName('ts').AsString:= FielDByName('zlts').AsString;
      Cds_Zdxx.FieldByName('jg').AsString:= FieldByName('zljg').AsString;
      Cds_Zdxx.FieldByName('sfss').AsString:= FielDByName('sszlbz').AsString;
      Cds_Zdxx.Post;
    end
    else
    begin
      Cds_Zdxx.Edit;
      Cds_Zdxx.FieldByName('zdms').AsString:= '';
      Cds_Zdxx.FieldByName('zddm').AsString:= '';
      Cds_Zdxx.FieldByName('qzrq').AsString:= '';
      Cds_Zdxx.FieldByName('ts').AsString:= '';
      Cds_Zdxx.FieldByName('jg').AsString:= '';
      Cds_Zdxx.FieldByName('sfss').AsString:= '';
      Cds_Zdxx.Post;
    end;
    if Locate('zdlb;zdxh',VarArrayof(['8',1]),[]) then
    begin
      Cds_Zdxx.RecNo:= 10;
      Cds_Zdxx.Edit;
      Cds_Zdxx.FieldByName('zdms').AsString:= FielDByName('zd').AsString;
      Cds_Zdxx.FieldByName('zddm').AsString:= FielDByName('zddm').AsString;
      Cds_Zdxx.FieldByName('qzrq').AsString:= FielDByName('zdrq').AsString;
      Cds_Zdxx.FieldByName('ts').AsString:= FielDByName('zlts').AsString;
      Cds_Zdxx.FieldByName('jg').AsString:= FieldByName('zljg').AsString;
      Cds_Zdxx.FieldByName('sfss').AsString:= FielDByName('sszlbz').AsString;
      Cds_Zdxx.Post;
    end
    else
    begin
      Cds_Zdxx.Edit;
      Cds_Zdxx.FieldByName('zdms').AsString:= '';
      Cds_Zdxx.FieldByName('zddm').AsString:= '';
      Cds_Zdxx.FieldByName('qzrq').AsString:= '';
      Cds_Zdxx.FieldByName('ts').AsString:= '';
      Cds_Zdxx.FieldByName('jg').AsString:= '';
      Cds_Zdxx.FieldByName('sfss').AsString:= '';
      Cds_Zdxx.Post;
    end;
    if Locate('zdlb;zdxh',VarArrayof(['4',1]),[]) then
    begin
      edt_blzd.Text:= FieldByName('zd').AsString;
      StrBlzd:= FieldByName('zddm').AsString;
    end
    else
    begin
      edt_blzd.Text:= '';
      StrBlzd:= '';
    end;
    if Locate('zdlb;zdxh',VarArrayof(['6',1]),[]) then
    begin
      edt_sszdyy.Text:= FieldByName('zd').AsString;
      Strsszdyy:= FieldByName('zddm').AsString;
    end
    else
    begin
      edt_sszdyy.Text:= '';
      Strsszdyy:= '';
    end;
  end;
  cbx_ryqk.ItemIndex:= cbx_ryqk.ItemCodes.IndexOf(cds_zybrjl.FieldByName('rybq').AsString);
end;

procedure TZYZDXX_fm.GetZyzdxx(Cds_Zyzd: TClientDataSet; StrBrbs,StrBczybs: String);
var
  i: Integer;
begin
  with Cds_Zyzd do
  begin
    if (edt_mzzd.Text<>'') then
    begin
      if Locate('zdlb;zdxh',VarArrayof(['1',1]),[]) then
      begin
        Edit;
      end
      else
      begin
        Append;
        FieldByName('brbs').AsString:= StrBrbs;
        FieldByName('bczybs').AsString:= StrBczybs;
        FieldByName('zdlb').AsString:= '1';
        FielDByname('zdxh').AsInteger:= 1;
      end;
      FieldByName('zd').AsString:= edt_mzzd.Text;
      FieldByName('zddm').AsString:= StrMzzd;
      Post;
    end
    else
    begin
      if Locate('zdlb;zdxh',VarArrayof(['1',1]),[]) then
        Delete;
    end;
    if (edt_ryzd.Text<>'') then
    begin
      if Locate('zdlb;zdxh',VarArrayof(['2',1]),[]) then
      begin
        Edit;
      end
      else
      begin
        Append;
        FieldByName('brbs').AsString:= StrBrbs;
        FieldByName('bczybs').AsString:= StrBczybs;
        FieldByName('zdlb').AsString:= '2';
        FielDByname('zdxh').AsInteger:= 1;
      end;
      FieldByName('zd').AsString:= edt_ryzd.Text;
      FieldByName('zddm').AsString:= Strryzd;
      if edt_ryqzrq.Text<>'0000-00-00' then
        FieldByName('zdrq').AsString:= edt_ryqzrq.Text;
      Post;
    end
    else
    begin
      if Locate('zdlb;zdxh',VarArrayof(['2',1]),[]) then
        delete;
    end;
    for i:= 1 to 7 do
    begin
      Cds_Zdxx.RecNo:= i;
      if Cds_Zdxx.FieldByName('zddm').AsString<>'' then
      begin
        if Locate('zdlb;zdxh',VarArrayof(['3',i]),[]) then
        begin
          edit;
        end
        else
        begin
          Append;
          FieldByName('brbs').AsString:= StrBrbs;
          FieldByName('bczybs').AsString:= StrBczybs;
          FieldByName('zdlb').AsString:= '3';
          FielDByname('zdxh').AsInteger:= i;
        end;
        FieldByName('zd').AsString:= Cds_zdxx.FieldByName('zdms').AsString;
        FieldByName('zddm').AsString:= Cds_zdxx.FieldByName('zddm').AsString;
        FieldByName('zljg').AsString:= Cds_zdxx.FieldByName('jg').AsString;
        FieldByName('zlts').AsString:= Cds_zdxx.FieldByName('ts').AsString;
        FieldByName('sszlbz').AsString:= Cds_zdxx.FieldByName('sfss').AsString;
        FieldByName('zdrq').AsString:= Cds_zdxx.FieldByName('qzrq').AsString;
        Post;
      end
      else
      begin
        if Locate('zdlb;zdxh',VarArrayof(['3',i]),[]) then
          delete;
      end;
    end;
    Cds_Zdxx.RecNo:= 8;
    if Cds_Zdxx.FieldByName('zddm').AsString<>'' then
    begin
      if Locate('zdlb;zdxh',VarArrayof(['5',1]),[]) then
      begin
        edit;
      end
      else
      begin
        Append;
        FieldByName('brbs').AsString:= StrBrbs;
        FieldByName('bczybs').AsString:= StrBczybs;
        FieldByName('zdlb').AsString:= '5';
        FielDByname('zdxh').AsInteger:= 1;
      end;
      FieldByName('zd').AsString:= Cds_zdxx.FieldByName('zdms').AsString;
      FieldByName('zddm').AsString:= Cds_zdxx.FieldByName('zddm').AsString;
      FieldByName('zljg').AsString:= Cds_zdxx.FieldByName('jg').AsString;
      FieldByName('zlts').AsString:= Cds_zdxx.FieldByName('ts').AsString;
      FieldByName('sszlbz').AsString:= Cds_zdxx.FieldByName('sfss').AsString;
      FieldByName('zdrq').AsString:= Cds_zdxx.FieldByName('qzrq').AsString;
      Post;
    end
    else
    begin
      if Locate('zdlb;zdxh',VarArrayof(['5',1]),[]) then
        delete;
    end;
    Cds_Zdxx.RecNo:= 9;
    if Cds_Zdxx.FieldByName('zddm').AsString<>'' then
    begin
      if Locate('zdlb;zdxh',VarArrayof(['7',1]),[]) then
      begin
        edit;
      end
      else
      begin
        Append;
        FieldByName('brbs').AsString:= StrBrbs;
        FieldByName('bczybs').AsString:= StrBczybs;
        FieldByName('zdlb').AsString:= '7';
        FielDByname('zdxh').AsInteger:= 1;
      end;
      FieldByName('zd').AsString:= Cds_zdxx.FieldByName('zdms').AsString;
      FieldByName('zddm').AsString:= Cds_zdxx.FieldByName('zddm').AsString;
      FieldByName('zljg').AsString:= Cds_zdxx.FieldByName('jg').AsString;
      FieldByName('zlts').AsString:= Cds_zdxx.FieldByName('ts').AsString;
      FieldByName('sszlbz').AsString:= Cds_zdxx.FieldByName('sfss').AsString;
      FieldByName('zdrq').AsString:= Cds_zdxx.FieldByName('qzrq').AsString;
      Post;
    end
    else
    begin
      if Locate('zdlb;zdxh',VarArrayof(['7',1]),[]) then
        delete;
    end;
    Cds_Zdxx.RecNo:= 10;
    if Cds_Zdxx.FieldByName('zddm').AsString<>'' then
    begin
      if Locate('zdlb;zdxh',VarArrayof(['8',1]),[]) then
      begin
        edit;
      end
      else
      begin
        Append;
        FieldByName('brbs').AsString:= StrBrbs;
        FieldByName('bczybs').AsString:= StrBczybs;
        FieldByName('zdlb').AsString:= '8';
        FielDByname('zdxh').AsInteger:= 1;
      end;
      FieldByName('zd').AsString:= Cds_zdxx.FieldByName('zdms').AsString;
      FieldByName('zddm').AsString:= Cds_zdxx.FieldByName('zddm').AsString;
      FieldByName('zljg').AsString:= Cds_zdxx.FieldByName('jg').AsString;
      FieldByName('zlts').AsString:= Cds_zdxx.FieldByName('ts').AsString;
      FieldByName('sszlbz').AsString:= Cds_zdxx.FieldByName('sfss').AsString;
      FieldByName('zdrq').AsString:= Cds_zdxx.FieldByName('qzrq').AsString;
      Post;
    end
    else
    begin
      if Locate('zdlb;zdxh',VarArrayof(['8',1]),[]) then
        delete;
    end;
    if (edt_blzd.Text<>'') then
    begin
      if Locate('zdlb;zdxh',VarArrayof(['4',1]),[]) then
      begin
        Edit;
      end
      else
      begin
        Append;
        FieldByName('brbs').AsString:= StrBrbs;
        FieldByName('bczybs').AsString:= StrBczybs;
        FieldByName('zdlb').AsString:= '4';
        FielDByname('zdxh').AsInteger:= 1;
      end;
      FieldByName('zd').AsString:= edt_blzd.Text;
      FieldByName('zddm').AsString:= Strblzd;
      Post;
    end
    else
    begin
      if Locate('zdlb;zdxh',VarArrayof(['4',1]),[]) then
        Delete;
    end;
    if (edt_sszdyy.Text<>'') then
    begin
      if Locate('zdlb;zdxh',VarArrayof(['6',1]),[]) then
      begin
        Edit;
      end
      else
      begin
        Append;
        FieldByName('brbs').AsString:= StrBrbs;
        FieldByName('bczybs').AsString:= StrBczybs;
        FieldByName('zdlb').AsString:= '6';
        FielDByname('zdxh').AsInteger:= 1;
      end;
      FieldByName('zd').AsString:= edt_sszdyy.Text;
      FieldByName('zddm').AsString:= Strsszdyy;
      Post;
    end
    else
    begin
      if Locate('zdlb;zdxh',VarArrayof(['6',1]),[]) then
        Delete;
    end;
  end;
end;

procedure TZYZDXX_fm.cbx_ryqkChange(Sender: TObject);
begin
  if cbx_ryqk.ItemIndex < 0 then exit;
  SetClientDataSetStatus(Cds_zybrjl);
  cds_zybrjl.FieldByName('rybq').AsString:= cbx_ryqk.ItemCodes.Strings[cbx_ryqk.ItemIndex];
end;

procedure TZYZDXX_fm.ClearScr;
begin
  edt_mzzd.Text:= '';
  cbx_ryqk.ItemIndex:= -1;
  edt_ryzd.Text:= '';
  edt_ryqzrq.Text:= '0000-00-00';
  with cds_zdxx do
  begin
    First;
    while not eof do
    begin
      edit;
      FieldByname('zdms').AsString:= '';
      FieldByname('zddm').AsString:= '';
      FieldByname('jg').AsString:= '';
      FieldByname('ts').AsString:= '';
      FieldByname('sfss').AsString:= '';
      FieldByname('qzrq').AsString:= '';
      Post;
      next;
    end;
  end;
  edt_blzd.Text:= '';
  edt_sszdyy.Text:= '';
end;

end.
