unit prop_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, TFlatPanelUnit, FlatSelEdit, StdCtrls,
  TFlatComboBoxUnit, FlatComboBoxCode, TFlatMemoUnit, TFlatEditUnit,
  Buttons, DB, DBClient, dm_u, Share_u, ShareMsg_u, TFlatListBoxUnit,
  DictIpt, DllFunc_u, UserFunc_U;

type
  TFrm_Prop = class(TForm)
    Fsdt_ssfl: TFlatSelEdit;
    Lb_mbmc: TLabel;
    Lb_sslx: TLabel;
    Fdt_mbmc: TFlatEdit;
    Lb_syxb: TLabel;
    CBox_sslx: TComboBox;
    CBox_syxb: TComboBox;
    Fsdt_sybz: TFlatSelEdit;
    Lb_ssfl: TLabel;
    Fmmo_ms: TFlatMemo;
    Lb_sybz: TLabel;
    Lb_ms: TLabel;
    btn_ok: TBitBtn;
    btn_cancle: TBitBtn;
    Cds_prop: TClientDataSet;
    btn_addIcd: TBitBtn;
    Edt_mbid: TEdit;
    Lst_sybz: TListBox;
    DictIpt2: TDictIpt;
    Cds_sybz: TClientDataSet;
    procedure btn_okClick(Sender: TObject);
    procedure btn_cancleClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Lst_sybzDblClick(Sender: TObject);
    procedure Fdt_mbmcKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CBox_sslxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Fsdt_ssflKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CBox_syxbKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Fsdt_sybzKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_addIcdClick(Sender: TObject);
    procedure Fsdt_ssflClick(Sender: TObject);
    procedure Fsdt_sybzClick(Sender: TObject);
    procedure Fsdt_ssflDownClick(Sender: TObject);
    procedure Fsdt_sybzDownClick(Sender: TObject);
    procedure Fmmo_msKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    function GetBlmbID: string;
    function IntToStrCount(AInt, ACount: Integer): string;
    function GetKsByYhbs(bs: string): string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Prop: TFrm_Prop;

implementation

{$R *.dfm}

function TFrm_Prop.IntToStrCount(AInt, ACount: Integer): string;
var
  tmpstr: string;
  i: Integer;
begin
  tmpstr := IntToStr(AInt);
  if Length(tmpstr) >= ACount then
    Result := tmpstr
  else
  begin
    for i := 1 to ACount - Length(tmpstr) do
    begin
      tmpstr := '0' + tmpstr;
    end;
    Result := tmpstr;
  end;
end;

function TFrm_Prop.GetKsByYhbs(bs: string): string;
var
  Cds_KS: TClientDataSet;
begin
  Cds_KS := TClientDataSet.Create(nil);
  try
    with Cds_KS do
    begin
      RemoteServer := DM.SockConn;
      ProviderName := 'dspDtl7';
      CommandText := 'select YHBM from xt_xt_yhjl where yhbs = ''' + bs + '''';

      try
        Open;
      except
        on e: Exception do
        begin
          MsgInfo('取用户所属科室失败！' + e.Message, 3);
          Result := '';
          Exit;
        end;
      end;

      if RecordCount = 0 then
      begin
        MsgInfo('取用户所属科室失败！', 3);
        Result := '';
        Exit;
      end;

      if FieldByName('YHBM').AsString <> '' then
        Result := FieldByName('YHBM').AsString
      else
        Result := '';
    end;
  finally
    Cds_KS.Free;
  end;
end;  

function TFrm_Prop.GetBlmbID: string;
var
  Cds_ID: TClientDataSet;
begin
  Cds_ID := TClientDataSet.Create(nil);
  try
    with Cds_ID do
    begin
      RemoteServer := DM.SockConn;
      ProviderName := 'dspDtl7';
      CommandText := 'select EMR_MBID_IDENTITY.nextval as IDENTITY from dual';
      try
        Open;
      except
        on e: Exception do
        begin
          MsgInfo('新建病历模板ID失败！' + e.Message, 3);
          Result := '';
          Exit;
        end;
      end;

      if RecordCount = 0 then
      begin
        MsgInfo('新建病历模板ID失败！', 3);
        Result := '';
        Exit;
      end;

      if FieldByName('IDENTITY').AsString <> '' then
        Result := FieldByName('IDENTITY').AsString
      else
        Result := '';
    end;
  finally
    Cds_ID.Free;
  end;
end;  

procedure TFrm_Prop.btn_okClick(Sender: TObject);
var
  OleData: array of OleVariant;
  OleTable: array of OleVariant;
  v1, v2: OleVariant;
  iOle, iErr: integer;
  AErrStr: string;
  wstr: WideString;
  i: Integer;
begin
  //save
  if Fdt_mbmc.Text = '' then
  begin
    MsgInfo('模板名称不能为空！', 2);
    Fdt_mbmc.SetFocus;
    Exit;
  end;

  if CBox_sslx.ItemIndex = -1 then
  begin
    MsgInfo('所属类型不能为空！', 2);
    CBox_sslx.SetFocus;
    Exit;
  end;

  if Fsdt_ssfl.Caption = '' then
  begin
    MsgInfo('所属分类不能为空！', 2);
    Fsdt_ssfl.SetFocus;
    Exit;
  end;

  if Edt_mbid.Text = '' then
  begin
    Edt_mbid.Text := GetBlmbID;
    if Edt_mbid.Text = '' then
      Exit;
  end;

  with Cds_prop do
  begin
    Close;
    CommandText := 'select MBID,SSFL,SSLX,MBMC,SYXB,MS,SSKS,CJR ' +
      'from emr_blmb where MBID = ''' + Edt_mbid.Text + '''';
    try
      Open;
    except
      on e: Exception do
      begin
        MsgInfo('打开病历模板数据集失败！' + e.Message, 3);
        Exit;
      end;
    end;

    if RecordCount = 0 then
    begin
      Append;
    end
    else
      Edit;
    
    FieldByName('MBID').AsString := Edt_mbid.Text;
    FieldByName('SSFL').AsString := Fsdt_ssfl.Caption;
    FieldByName('SSLX').AsString := IntToStrCount(CBox_sslx.ItemIndex + 1, 2);
    FieldByName('MBMC').AsString := Fdt_mbmc.Text;
    FieldByName('SYXB').AsString := IntToStrCount(CBox_syxb.ItemIndex + 1, 1);
    FieldByName('MS').AsString := Fmmo_ms.Lines.Text;
    FieldByName('SSKS').AsString := GetKsByYhbs(Yhxx.yhbs);
    FieldByName('CJR').AsString := Yhxx.yhbs;

    Post;
  end;

  if Lst_sybz.Count = 0 then
  begin
    try
      Cds_prop.ApplyUpdates(0);
      MsgInfo('信息保存成功！', 1);
      DM.cds_dtl5.CommandText := Edt_mbid.Text;
      Close;
      Exit;
    except
      on e: Exception do
      begin
        MsgInfo('信息保存失败！', 3);
        Exit;
      end;
    end;
  end;

  with Cds_sybz do
  begin
    Close;
    CommandText := 'delete from EMR_MBSYBZ where ' +
      'MBID = ''' + Edt_mbid.Text + '''';
    try
      Execute;
    except
      on e: Exception do
      begin
        MsgInfo('清理模板适用病种数据集失败！' + e.Message, 3);
        Exit;
      end;
    end;

    Close;
    CommandText := 'select MBID,ICDBM from EMR_MBSYBZ where ' +
      'MBID = ''' + Edt_mbid.Text + '''';
    try
      Open;
    except
      on e: Exception do
      begin
        MsgInfo('打开模板适用病种数据集失败！' + e.Message, 3);
        Exit;
      end;
    end;

//    while not Eof do
//      Delete;

    for i := 0 to Lst_sybz.Items.Count - 1 do
    begin
      Append;
      FieldByName('MBID').AsString := Edt_mbid.Text;
      FieldByName('ICDBM').AsString := Lst_sybz.Items.Strings[i];
      Post;
    end;
  end;


  iOle := 1;
  if Cds_prop.ChangeCount > 0 then
  begin
    SetLength(OleData, iOle);
    SetLength(OleTable, iOle);
    OleData[iOle - 1] := Cds_prop.Delta;
    OleTable[iOle - 1] := 'emr_blmb';
    inc(iOle);
  end;

  if Cds_sybz.ChangeCount > 0 then
  begin
    SetLength(OleData, iOle);
    SetLength(OleTable, iOle);
    OleData[iOle - 1] := Cds_sybz.Delta;
    OleTable[iOle - 1] := 'emr_mbsybz';
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
  if iErr = 0 then
  begin
    MsgInfo('信息保存成功!', 1);
    DM.cds_dtl5.CommandText := Edt_mbid.Text;
    Close;
  end
  else
  begin
    MsgInfo('保存失败！' + #13#10 + AErrStr, 3);
  end;
end;

procedure TFrm_Prop.btn_cancleClick(Sender: TObject);
begin
  //cancle
  Close;
end;

procedure TFrm_Prop.FormShow(Sender: TObject);
begin
  //Init
  Fdt_mbmc.SetFocus;
  if Edt_mbid.Text <> '' then
  begin
    with Cds_prop do
    begin
      Close;
      CommandText := 'select MBID,SSFL,SSLX,MBMC,SYXB,MS,SSKS,CJR ' +
        'from emr_blmb where MBID = ''' + Edt_mbid.Text + '''';
      try
        Open;
      except
        on e: Exception do
        begin
          MsgInfo('打开病历模板数据集失败！' + e.Message, 3);
          Exit;
        end;
      end;

      if RecordCount <> 0 then
      begin
        Fdt_mbmc.Text := FieldByName('MBMC').AsString;
        CBox_syxb.ItemIndex := StrToInt(FieldByName('SYXB').AsString) - 1;
        Fmmo_ms.Lines.Text := FieldByName('MS').AsString;
      end;
    end;

    with Cds_sybz do
    begin
      Close;
      CommandText := 'select MBID,ICDBM from EMR_MBSYBZ where ' +
        'MBID = ''' + Edt_mbid.Text + '''';
      try
        Open;
      except
        on e: Exception do
        begin
          MsgInfo('打开模板适用病种数据集失败！' + e.Message, 3);
          Exit;
        end;
      end;

      Lst_sybz.Clear;
      First;
      while not Eof do
      begin
        Lst_sybz.Items.Add(FieldByName('ICDBM').AsString);
        Next;
      end;
    end;
  end;
end;

procedure TFrm_Prop.Lst_sybzDblClick(Sender: TObject);
begin
  Lst_sybz.DeleteSelected;
end;

procedure TFrm_Prop.Fdt_mbmcKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    if Fdt_mbmc.Text = '' then
    begin
      MsgInfo('模板名称不能为空！', 2);
      Fdt_mbmc.SetFocus;
    end
    else
      CBox_sslx.SetFocus;
  end;
end;

procedure TFrm_Prop.CBox_sslxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    if CBox_sslx.ItemIndex = -1 then
    begin
      MsgInfo('所属类型不能为空！', 2);
      CBox_sslx.SetFocus;
    end
    else
      Fsdt_ssfl.SetFocus;
  end;
end;

procedure TFrm_Prop.Fsdt_ssflKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    if Fsdt_ssfl.Caption = '' then
    begin
      MsgInfo('所属分类不能为空！', 2);
      Fsdt_ssfl.SetFocus;
    end
    else
      CBox_syxb.SetFocus;
  end;
end;

procedure TFrm_Prop.Fsdt_ssflDownClick(Sender: TObject);
var
  Cds_Down: TClientDataSet;
begin
  Cds_Down := TClientDataSet.Create(nil);
  try
    with Cds_Down do
    begin
      RemoteServer := DM.SockConn;
      ProviderName := 'dspDtl6';
      CommandText := 'select FLBH as Code,FLMC as Name,SRM as Input_Code from emr_blmbfl order by Input_Code';
      try
        Open;
      except
        on e: Exception do
        begin
          MsgInfo('模板分类字典刷新失败！' + e.Message, 3);
          Exit;
        end;
      end;
//      First;
//      while not Eof do
//      begin
//        Edit;
//        FieldByName('Input_Code').AsString :=
//          GetSpellCode(PChar(FieldByName('Name').AsString),2,8);
//        Next;
//      end;
      SaveToFile(ExePath + 'Dict\emr_blmbfl.xml', dfXML);
    end;
    MsgInfo('模板分类字典刷新成功！', 1);
  finally
    Cds_Down.Free;
  end;
end;

procedure TFrm_Prop.Fsdt_ssflClick(Sender: TObject);
var
  tempstr: string;
begin
  if not ShowDictIpt(DictIpt2, TWinControl(Fsdt_ssfl), ExePath + '\Dict\emr_blmbfl.xml', tempstr, Screen) then
    Exit;
  Fsdt_ssfl.Caption := tempstr;
end;

procedure TFrm_Prop.CBox_syxbKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    if CBox_syxb.ItemIndex = -1 then
    begin
      MsgInfo('适用性别不能为空！', 2);
      CBox_syxb.SetFocus;
    end
    else
      Fsdt_sybz.SetFocus;
  end;
end;

procedure TFrm_Prop.Fsdt_sybzKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    if Fsdt_sybz.Caption = '' then
    begin
      MsgInfo('添加适用病种不能为空！', 2);
      Fsdt_sybz.SetFocus;
    end
    else
      btn_addIcd.SetFocus;
  end
  else
  if Key = VK_ESCAPE then
  begin
    Fmmo_ms.SetFocus;
  end;
end;

procedure TFrm_Prop.Fsdt_sybzDownClick(Sender: TObject);
var
  Cds_Down: TClientDataSet;
begin
  Cds_Down := TClientDataSet.Create(nil);
  try
    with Cds_Down do
    begin
      RemoteServer := DM.SockConn;
      ProviderName := 'dspDtl6';
      CommandText := 'select ZDDM as Code,ZDMC as Name,SRM as Input_Code from xt_zd_jb order by Input_Code';
      try
        Open;
      except
        on e: Exception do
        begin
          MsgInfo('适用病种字典刷新失败！' + e.Message, 3);
          Exit;
        end;
      end;
//      First;
//      while not Eof do
//      begin
//        Edit;
//        FieldByName('Input_Code').AsString :=
//          GetSpellCode(PChar(FieldByName('Name').AsString),2,8);
//        Next;
//      end;
      SaveToFile(ExePath + 'Dict\xt_zd_jb.xml', dfXML);
    end;
    MsgInfo('适用病种字典刷新成功！', 1);
  finally
    Cds_Down.Free;
  end;
end;

procedure TFrm_Prop.Fsdt_sybzClick(Sender: TObject);
var
  tempstr: string;
begin
  if not ShowDictIpt(DictIpt2, TWinControl(Fsdt_sybz), ExePath + 'Dict\xt_zd_jb.xml', tempstr, Screen) then
    Exit;
  Fsdt_sybz.Caption := tempstr;
end;

procedure TFrm_Prop.btn_addIcdClick(Sender: TObject);
var
  i: Integer;
begin
  if Fsdt_sybz.Caption <> '' then
  begin
    for i := 0 to Lst_sybz.Count - 1 do
    begin
      if Lst_sybz.Items.Strings[i] = Fsdt_sybz.Caption then
      begin
        Fsdt_sybz.Text := '';
        Fsdt_sybz.Caption := '';
        Fsdt_sybz.SetFocus;
        Exit;
      end;
    end;
    Lst_sybz.Items.Add(Fsdt_sybz.Caption);
    Fsdt_sybz.Text := '';
    Fsdt_sybz.Caption := '';
    Fsdt_sybz.SetFocus;
  end
  else
  begin
    Fsdt_sybz.Text := '';
    Fsdt_sybz.Caption := '';
    Fsdt_sybz.SetFocus;
  end;

end;

procedure TFrm_Prop.Fmmo_msKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    btn_ok.SetFocus;
  end;
end;

end.
