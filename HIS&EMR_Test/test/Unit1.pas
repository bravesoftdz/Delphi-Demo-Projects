unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, NsoOfficeLib_TLB, ADODB, DB, Grids, DBGrids,
  DBClient, Provider, DBGridEh, dm_u, Math, ComCtrls, XMLDoc, XMLIntf,
  Share_u, ShareMsg_u, ZLib, Buttons;

type
  TListItemInfo = record
    ID,      //����
    Name,    //����
    Value,   //ֵ
    ParentID  //�ϼ�����
      :string;
  end;
  TItemData = ^TListItemInfo;
type
  TListSortInfo = record
    sctName: string; //�ؼ���/ID
    sctTip: string;  //tip����������ID��Ԫ��ID
    IsStart: Boolean;  //True Ϊ��� False Ϊ�յ�
    Position: Integer;  //����λ�õ�����
    IsElement: Boolean;  //�Ƿ���Ԫ�� Ԫ������С�ķָλ
  end;
  TSortData = ^TListSortInfo;

type
  TPartInfo = record
    struct: string; //�ؼ���/ID
    svalue: string;  //tip����������ID��Ԫ��ID
    StartPosition: Integer;  //����λ�õ�����
    EndPosition: Integer;  //����λ�õ�����
  end;
  TPartData = ^TPartInfo;

type
  TForm1 = class(TForm)
    NsoCtrl_1: TNsoControl;
    Btn_1: TButton;
    Btn_2: TButton;
    Btn_3: TButton;
    Btn_4: TButton;
    Btn_5: TButton;
    Btn_6: TButton;
    Btn_7: TButton;
    Cds_test: TClientDataSet;
    Dsource_1: TDataSource;
    Btn_8: TButton;
    EhGrd_1: TDBGridEh;
    Btn_9: TButton;
    Btn_10: TButton;
    Edt_1: TEdit;
    Btn_11: TButton;
    Btn_12: TButton;
    EhGrd_2: TDBGridEh;
    Dsource_2: TDataSource;
    Cds_1: TClientDataSet;
    Btn_13: TButton;
    Tview_1: TTreeView;
    Btn_14: TButton;
    EhGrd_3: TDBGridEh;
    Dsource_3: TDataSource;
    Cds_2: TClientDataSet;
    Btn_15: TButton;
    btn1: TButton;
    Btn_16: TButton;
    Button1: TButton;
    Button2: TButton;
    edt1: TEdit;
    Btn_17: TButton;
    Btn_18: TButton;
    dlgSave1: TSaveDialog;
    dlgOpen1: TOpenDialog;
    Btn_19: TButton;
    Btn_20: TButton;
    Btn_21: TButton;
    Btn_22: TButton;
    Btn_23: TButton;
    DSrce_1: TDataSource;
    Cds_3: TClientDataSet;
    EhGrd_4: TDBGridEh;
    Btn_24: TButton;
    Cds_3DATAID: TStringField;
    Cds_3DATAFILE: TStringField;
    Cds_3OWNER: TStringField;
    Cds_3DATATYPE: TStringField;
    Cds_3DATADATE: TStringField;
    Btn_25: TButton;
    btn_26: TBitBtn;
    btn_27: TBitBtn;
    Cds_4: TClientDataSet;
    DSrce_2: TDataSource;
    dbgrd_1: TDBGrid;
    procedure Btn_1Click(Sender: TObject);
    procedure Btn_2Click(Sender: TObject);
    procedure Btn_3Click(Sender: TObject);
    procedure Btn_4Click(Sender: TObject);
    procedure Btn_5Click(Sender: TObject);
    procedure NsoCtrl_1NsoToolbarAddinEvent(Sender: TObject; nID: Integer;
      const sRev1, sRev2: WideString);
    procedure Btn_6Click(Sender: TObject);
    procedure Btn_7Click(Sender: TObject);
    procedure Btn_8Click(Sender: TObject);
    procedure Btn_9Click(Sender: TObject);
    procedure Btn_10Click(Sender: TObject);
    procedure Btn_11Click(Sender: TObject);
    procedure Btn_12Click(Sender: TObject);
    procedure EhGrd_2DblClick(Sender: TObject);
    procedure Btn_14Click(Sender: TObject);
    procedure Btn_13Click(Sender: TObject);
    procedure Tview_1DblClick(Sender: TObject);
    procedure Btn_15Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure Btn_16Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Btn_17Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Btn_18Click(Sender: TObject);
    procedure Btn_19Click(Sender: TObject);
    procedure NsoCtrl_1NsoKeyPressedEvent(Sender: TObject;
      nKeyCode: Smallint; nKeyChar: ShortInt; nKeyFunction,
      nModifiers: Smallint; out bCancel: WordBool);
    procedure Btn_20Click(Sender: TObject);
    procedure Btn_21Click(Sender: TObject);
    procedure Btn_22Click(Sender: TObject);
    procedure Btn_23Click(Sender: TObject);
    procedure Btn_24Click(Sender: TObject);
    procedure Btn_25Click(Sender: TObject);
    procedure btn_27Click(Sender: TObject);
    procedure btn_26Click(Sender: TObject);
  private
    SortLst: TList;
    PartLst: TList;
    Lst: TList;
    procedure SaveToDB;
    function GetElementValue(ElementName: string): string;
    function GetTextByPosition(StartPos, EndPos: Integer): string;
    function AddXmlChildToTree(Atree: TTreeView; Atreenode: TTreeNode;
      Axmlnode: IXMLNode; var NodeID: Integer): Boolean;
    function SetSysElmtText(ControlName, ElementID: string): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function IntToStrCount(AInt, ACount: Integer): string;
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

function GetExistsFileName(APath: string): string;
var
  year,month,day,hour,min,sec,msec: Word;
begin
  repeat
    year := 0;
    month := 0;
    day := 0;
    hour := 0;
    min := 0;
    sec := 0;
    msec := 0;
    DecodeDate(Now,year,month,day);
    DecodeTime(Now,hour,min,sec,msec);

    Result := APath + IntToStrCount(year,4) + IntToStrCount(month,2) +
      IntToStrCount(day,2) + IntToStrCount(hour,2) + IntToStrCount(min,2) +
      IntToStrCount(sec,2) + IntToStrCount(msec,4) + '.odt';
  until FileExists(Result) = False;
end;

function GetDateTimeStr(ADateTime: TDateTime; kind: Integer): string;
var
  year,month,day,hour,min,sec,msec: Word;
begin
  year := 0;
  month := 0;
  day := 0;
  hour := 0;
  min := 0;
  sec := 0;
  msec := 0;
  DecodeDate(Now,year,month,day);
  DecodeTime(Now,hour,min,sec,msec);
  if kind = 0 then
    Result := IntToStrCount(year,4) + '-' + IntToStrCount(month,2) + '-' +
    IntToStrCount(day,2) + ' ' + IntToStrCount(hour,2) + ':' + IntToStrCount(min,2) +
    ':' + IntToStrCount(sec,2)
  else
    Result := IntToStrCount(year,4) + '-' + IntToStrCount(month,2) + '-' +
    IntToStrCount(day,2) + ' ' + IntToStrCount(hour,2) + ':' + IntToStrCount(min,2) +
    ':' + IntToStrCount(sec,2);
end;

function GetDocErrByCode(ACode: Integer): string;
begin
  case ACode of
    0:Result := '�ĵ��򿪵Ȳ����ɹ�ִ��';
    1:Result := '�ļ����ƴ���';
    2:Result := '�ļ�������';
    3:Result := '����������';
    4:Result := '�������';
    5:Result := '�򿪵��ļ���ֻ��';
    6:Result := '�ı��ĵ�';
    7:Result := '���ĵ�';
    8:Result := '�����ʱ�ļ��д���';
    9:Result := '���浽��ʱ�ļ��д���';
    10:Result := '����ʧ��';
    11:Result := '�½��ĵ�';
    12:Result := '��������';
    13:Result := '�ļ�������';
    14:Result := '�ļ�����';
    18:Result := '�½��ĵ��������Ѿ������޸�';
    19:Result := '�ĵ������޸�';
  else
    Result := '�������';
  end;
end;

procedure TForm1.SaveToDB;
var
  filename: string;
  filenow: string;
  Cds_Sv: TADODataSet;
  errcode: Integer;
  ExePath: string;
begin
  //
  ExePath := GetCurrentDir + '/';
  filename := GetExistsFileName(ExePath + 'DocTempFiles/');
  errcode := NsoCtrl_1.SaveAs(filename);
  if errcode <> wdSuccess then
  begin
    ShowMessage('����ģ�嵽��ʱ�ļ�ʧ�ܣ�' + #13#10 +
      '������Ϣ��' + GetDocErrByCode(errcode));
    Exit;
  end;
  Sleep(2000);

  filenow := GetExistsFileName(ExePath + 'DocTempFiles/');
  errcode := NsoCtrl_1.SaveAs(filenow);
  if errcode <> wdSuccess then
  begin
    ShowMessage('ȡ��ģ����ʱ�ļ�ռ��ʧ�ܣ�' + #13#10 +
      '������Ϣ��' + GetDocErrByCode(errcode));
    Exit;
  end;
  NsoCtrl_1.RemoveFileFromSofficeBin(filename);
  Sleep(2000);
  Cds_Sv := TADODataSet.Create(nil);
  try
    with Cds_Sv do
    begin
      ConnectionString := 'Provider=OraOLEDB.Oracle.1;' +
        'Password=his2926666;' +
        'Persist Security Info=True;' +
        'User ID=his;' +
        'Data Source=his';

      CommandText := 'select mbid, mbwj from emr_blmb ' +
        'where mbid = ''1''';

      try
        Open;
      except
        on e: Exception do
        begin
          ShowMessage('�����ݼ�����ģ��ʧ�ܣ�' + e.Message);
          Exit;
        end;
      end;

      if RecordCount <> 1 then
      begin
        ShowMessage('δ�ҵ�ƥ���ģ����Ϣ������ʧ�ܣ�');
        Exit;
      end;
      Edit;
      TMemoField(FieldByName('mbwj')).LoadFromFile(filename);
      Post;

      errcode := 0;
      try
        Cds_Sv.UpdateStatus;
      except
        on e: Exception do
        begin
          ShowMessage('�����ݼ�����ģ��ʧ�ܣ�' + e.Message);
          Exit;
        end;
      end;

      if errcode > 0 then
      begin
        ShowMessage('�����ݼ�����ģ��ʧ�ܣ�');
        Exit;
      end;

      ShowMessage('����ģ��ɹ���');
    end;
  finally
    Cds_Sv.Free;
  end;
end;

procedure TForm1.Btn_1Click(Sender: TObject);
var
  ExePath, s: string;
  i: Integer;
begin
  If NsoCtrl_1.HasSofficeBin = True Then
  begin
    NsoCtrl_1.KillSofficeBin;
    Sleep(2000);
  end;
  NsoCtrl_1.DeleteOfficeAppData;
  ExePath := ExtractFilePath(Application.ExeName);

//  ��Ӱ�ť
  If not NsoCtrl_1.IsToolbarItemOn('1') Then
  begin
    if not NsoCtrl_1.InsertToolbarItem(ExePath + 'Icons\' + '06.png',
      '1', '�������Ԫ��') then
      s := s + 'Button �������Ԫ�� Added!' + #13#10
    else
        s := s + 'Button �������Ԫ�� Failed!' + #13#10;
  end;

  If not NsoCtrl_1.IsToolbarItemOn('2') Then
  begin
    if not NsoCtrl_1.InsertToolbarItem(ExePath + 'Icons\' + '07.png',
      '2', 'ȡ��������Ԫ��') then
      s := s + 'Button ȡ��������Ԫ�� Added!' + #13#10
    else
        s := s + 'Button ȡ��������Ԫ�� Failed!' + #13#10;
  end;

  If not NsoCtrl_1.IsToolbarItemOn('3') Then
  begin
    if not NsoCtrl_1.InsertToolbarItem(ExePath + 'Icons\' + '09.png',
      '3', '������ѡ����') then
      s := s + 'Button ������ѡ���� Added!' + #13#10
    else
        s := s + 'Button ������ѡ���� Failed!' + #13#10;
  end;

  If not NsoCtrl_1.IsToolbarItemOn('4') Then
  begin
    if not NsoCtrl_1.InsertToolbarItem(ExePath + 'Icons\' + '03.png',
      '4', '������ݽ�') then
      s := s + 'Button ������ݽ� Added!' + #13#10
    else
      s := s + 'Button ������ݽ� Failed!' + #13#10;
  end;

  If not NsoCtrl_1.IsToolbarItemOn('5') Then
  begin
    if not NsoCtrl_1.InsertToolbarItem(ExePath + 'Icons\' + '04.png',
      '5', 'ɾ�����ݽ�') then
      s := s + 'Button ɾ�����ݽ� Added!' + #13#10
    else
      s := s + 'Button ɾ�����ݽ� Failed!' + #13#10;
  end;

  If not NsoCtrl_1.IsToolbarItemOn('6') Then
  begin
    if not NsoCtrl_1.InsertToolbarItem(ExePath + 'Icons\' + '12.png',
      '6', '���/ȥ�����ݽڱ߿�') then
      s := s + 'Button ���/ȥ�����ݽڱ߿� Added!' + #13#10
    else
      s := s + 'Button ���/ȥ�����ݽڱ߿� Failed!' + #13#10;
  end;

  If not NsoCtrl_1.IsToolbarItemOn('7') Then
  begin
    if not NsoCtrl_1.InsertToolbarItem(ExePath + 'Icons\' + '13.png',
      '7', '���ҳü') then
      s := s + 'Button ���ҳü Added!' + #13#10
    else
      s := s + 'Button ���ҳü Failed!' + #13#10;
  end;

  If not NsoCtrl_1.IsToolbarItemOn('8') Then
  begin
    if not NsoCtrl_1.InsertToolbarItem(ExePath + 'Icons\' + '14.png',
      '8', '���ҳ��') then
      s := s + 'Button ���ҳ�� Added!' + #13#10
    else
      s := s + 'Button ���ҳ�� Failed!' + #13#10;
  end;

  If not NsoCtrl_1.IsToolbarItemOn('9') Then
  begin
    if not NsoCtrl_1.InsertToolbarItem(ExePath + 'Icons\' + '15.png',
      '9', '����ҽѧӰ��') then
      s := s + 'Button ����ҽѧӰ�� Added!' + #13#10
    else
      s := s + 'Button ����ҽѧӰ�� Failed!' + #13#10;
  end;

  If not NsoCtrl_1.IsToolbarItemOn('10') Then
  begin
    if not NsoCtrl_1.InsertToolbarItem(ExePath + 'Icons\' + '11.png',
      '10', '����') then
      s := s + 'Button ���� Added!' + #13#10
    else
      s := s + 'Button ���� Failed!' + #13#10;
  end;

  If not NsoCtrl_1.IsToolbarItemOn('11') Then
  begin
    if not NsoCtrl_1.InsertToolbarItem(ExePath + 'Icons\' + '01.png',
      '11', '�˳��༭') then
      s := s + 'Button �˳��༭ Added!' + #13#10
    else
      s := s + 'Button �˳��༭ Failed!' + #13#10;
  end;





//  for i := 1 to 10 do
//  begin
//    If NsoCtrl_1.IsToolbarItemOn(IntToStr(i)) Then
//    begin
//      s := s + 'Button ' + IntToStrCount(i, 2) + ' On!' + #13#10;
//    end
//    else
//    begin
//      if NsoCtrl_1.InsertToolbarItem(path + '\' + IntToStrCount(i, 2) + '.png',
//        IntToStr(i), '��ť' + IntToStrCount(i, 2) + #13#10) then
//        s := s + 'Button ' + IntToStrCount(i, 2) + ' Added!' + #13#10
//      else
//        s := s + 'Button ' + IntToStrCount(i, 2) + ' Failed!' + #13#10;
//    end;
//  end;
  ShowMessage(s);
end;

procedure TForm1.Btn_2Click(Sender: TObject);
var
  i, j: Integer;
  s: string;
begin
  j := 0;
  for i := 1 to 100 do
  begin
    if NsoCtrl_1.IsToolbarItemOn(IntToStr(i)) = true then
    begin
      if j < 9 then
      begin
        s := s + IntToStrCount(i,3) + ' 1  ';
        j := j + 1;
      end
      else
      begin
        s := s + IntToStrCount(i,3) + ' 1  ' + #13#10;
        j := 0;
      end;
    end
    else
    begin
      if j < 9 then
      begin
        s := s + IntToStrCount(i,3) + ' 0  ';
        j := j + 1;
      end
      else
      begin
        s := s + IntToStrCount(i,3) + ' 0  ' + #13#10;
        j := 0;
      end;
    end;
  end;
  ShowMessage(s);

end;

procedure TForm1.Btn_3Click(Sender: TObject);
var
  i: Integer;
  ret: Boolean;
begin
  ret := False;
  for i := 1 to 100 do
    if NsoCtrl_1.IsToolbarItemOn(IntToStr(i)) = true then
    begin
      NsoCtrl_1.RemoveToolbarItem(IntToStr(i));
      ret := True;
    end;
  if ret then
    ShowMessage('Cleared!')
  else
    ShowMessage('Nothing To Clear!')
end;

procedure TForm1.Btn_4Click(Sender: TObject);
begin
//  NsoCtrl_1.CreateNew('swriter');
  NsoCtrl_1.OpenDocument(GetCurrentDir + '\1.odt', 2);
  NsoCtrl_1.RemoveAllListener;
  NsoCtrl_1.AddGlobalDocumentListener;
  NsoCtrl_1.AddKeyListener(0);
  NsoCtrl_1.SetGlobalDocumentListener(False,False,True,False);
  NsoCtrl_1.SetSpecificToolBarVisible('��չ������1',True);

  NsoCtrl_1.SetSpecificToolBarVisible('textobjectbar',True);
  NsoCtrl_1.SetSpecificToolBarVisible('newcontrols',True);
  NsoCtrl_1.SetCustomToolbarVisible('��չ1',True);

  NsoCtrl_1.AddGlobalDocumentListener;
  NsoCtrl_1.SetGlobalDocumentListener(False,False,True,False);
  NsoCtrl_1.SetStatusBarVisible(True);

  NsoCtrl_1.SetAllNewCtrlBGColor(True);

end;

procedure TForm1.Btn_5Click(Sender: TObject);
begin
  NsoCtrl_1.Close;
  NsoCtrl_1.DeleteOfficeAppData;
  NsoCtrl_1.KillSofficeBin;
end;

procedure TForm1.NsoCtrl_1NsoToolbarAddinEvent(Sender: TObject;
  nID: Integer; const sRev1, sRev2: WideString);
begin
//  SaveToDB;
end;

procedure TForm1.Btn_6Click(Sender: TObject);
var
  fileOv: OleVariant;
  fileP: pointer;
  fileStrm: TMemoryStream;
  highBound,lowBound:Integer;
begin
  fileStrm := TMemoryStream.Create;
  try
    try
      ShowMessage(IntToStr( NsoCtrl_1.SaveToStream(fileOv)));
      fileStrm.Position := 0;
      highBound := VarArrayHighBound (fileOv, 1);
      lowBound := VarArrayLowBound (fileOv, 1);
      fileStrm.Size := highBound - lowBound + 1;
      fileP := VarArrayLock (fileOv);
      fileStrm.Write (fileP^, fileStrm.Size);
      VarArrayUnlock (fileOv);
      fileStrm.Position := 0;
      fileStrm.SaveToFile(GetCurrentDir + '\1.odt');
    except
    end;
  finally
  fileStrm.Free;
  end;
end;

procedure TForm1.Btn_7Click(Sender: TObject);
var
  fileOv: OleVariant;
  fileP: pointer;
  fileStrm: TMemoryStream;
  highBound,lowBound:Integer;
begin
  fileStrm := TMemoryStream(TFileStream.Create(GetCurrentDir + '\1.odt',fmOpenReadWrite));
  fileOv := VarArrayCreate ([0, fileStrm.Size - 1], varByte);
  fileP := VarArrayLock (fileOv);
  fileStrm.Position := 0;
  fileStrm.Read (fileP^, fileStrm.Size);
  fileStrm.Free;
  VarArrayUnlock (fileOv);
  ShowMessage(IntToStr(NsoCtrl_1.OpenDocumentWithStream(fileOv,2)));
end;

procedure TForm1.Btn_8Click(Sender: TObject);
var
  i: Integer;
begin
  with Cds_test do
  begin
    Close;
    RemoteServer := DM.SockConn;
    ProviderName := 'dspDtl3';

    CommandText := 'select ' +
      '''                                         ' +
      ''' as sctName,' +
      '''                                         ' +
      ''' as sctTip,' +
      '''                                         ' +
      ''' as IsStart,' +
      '''                                         ' +
      ''' as Position,' +
      '''                                         ' +
      ''' as IsElement ' +
      'from dual';

    try
      Open;
    except
      on e: Exception do
      begin
        ShowMessage('�����ݼ�ʧ�ܣ�' + e.Message);
        Exit;
      end;
    end;
    Delete;
    Edit;
    for i := 0 to SortLst.Count - 1 do
    begin
      Append;
      FieldByName('sctName').AsString := TSortData(SortLst.Items[i]).sctName;
      FieldByName('sctTip').AsString := TSortData(SortLst.Items[i]).sctTip;

      if TSortData(SortLst.Items[i]).IsStart then
        FieldByName('IsStart').AsString := 'True'
      else
        FieldByName('IsStart').AsString := 'False';

      FieldByName('Position').AsInteger := TSortData(SortLst.Items[i]).Position;

      if TSortData(SortLst.Items[i]).IsElement then
        FieldByName('IsElement').AsString := 'True'
      else
        FieldByName('IsElement').AsString := 'False';
    end;
    Post;
  end;
end;

function ComparePosition(Item1, Item2: Pointer): Integer;
begin
  result := Integer(CompareValue(TSortData(Item1)^.Position, TSortData(Item2)^.Position));
end;

procedure TForm1.Btn_9Click(Sender: TObject);
var
  SctLst: TStringList;
  sortp: TSortData;
  NameStr: string;
  i: Integer;
begin
  NameStr := NsoCtrl_1.GetAllSectionNamesByCurrentDoc;
  if NameStr = '' then
    Exit;
  
  SctLst := TStringList.Create;
  SctLst.Delimiter := ',';
  SctLst.DelimitedText := NameStr;

  SortLst := TList.Create;
  for i := 0 to SctLst.Count - 1 do
  begin
    if SctLst.Strings[i] <> '' then
    begin
      New(sortp);
      sortp^.sctName := SctLst.Strings[i];
      sortp^.sctTip := NsoCtrl_1.GetSectionProp(sortp^.sctName, 'HelpTip');
      sortp^.IsStart := True;
      sortp^.Position := NsoCtrl_1.GetSectionBegin(SctLst.Strings[i]);

      if Pos('_ElmtID:', sortp^.sctTip) = 0 then
        sortp^.IsElement := False
      else
        sortp^.IsElement := True;

      SortLst.Add(sortp);

      New(sortp);
      sortp^.sctName := SctLst.Strings[i];
      sortp^.sctTip := NsoCtrl_1.GetSectionProp(sortp^.sctName, 'HelpTip');
      sortp^.IsStart := False;
      sortp^.Position := NsoCtrl_1.GetSectionEnd(SctLst.Strings[i]);

      if Pos('_ElmtID:', sortp^.sctTip) = 0 then
        sortp^.IsElement := False
      else
        sortp^.IsElement := True;

      SortLst.Add(sortp);
    end;
  end;
  SortLst.Sort(@ComparePosition);
end;

procedure TForm1.Btn_10Click(Sender: TObject);
var
  sctname: string;
begin
  sctname := NsoCtrl_1.InsertSectionAtCurrentCursor(Edt_1.Text, ' ');
  NsoCtrl_1.SetSectionProp(sctname, 'Edge', 'True');
  NsoCtrl_1.SetSectionProp(sctname, 'HelpTip', sctname);
end;

function TForm1.GetElementValue(ElementName: string): string;
var
  ctrl: string;
begin
  //
  NsoCtrl_1.SetFocus2;
  NsoCtrl_1.CancelSelectOneArea('',0);
  NsoCtrl_1.SelectOneSection(ElementName);
  ctrl := NsoCtrl_1.GetControlBySelectArea;
  ctrl := Copy(ctrl, 1, Pos(',',ctrl) - 1);
  Result := NsoCtrl_1.GetNewControlText(ctrl);
end;

function TForm1.GetTextByPosition(StartPos, EndPos: Integer): string;
begin
  NsoCtrl_1.SetFocus2;
  NsoCtrl_1.CancelSelectOneArea('',0);
  NsoCtrl_1.SelectOneArea2(StartPos + 1, EndPos);
  Result := NsoCtrl_1.GetSelectText;
end;  

procedure TForm1.Btn_11Click(Sender: TObject);
var
  i,j: Integer;
  nowid, parentid: Integer;
  text: string;
  itemp: TItemData;
  partp: TPartData;
begin
//  NsoCtrl_1.SelectOneArea2(0,1);
//  Lst := TList.Create;
//  mid := 0;
//  parentid := -1;
//
////  if TSortData(SortLst.Items[0])^.Position <> 0 then
////  begin
////    NsoCtrl_1.SelectOneArea2(1,TSortData(SortLst.Items[0])^.Position);
////    New(itemp);
////
////    parentid := nowid;
////    Inc(nowid);
////
////    itemp^.ID := IntToStr(nowid);
////    itemp^.Name := 'text';
////    itemp^.Value := NsoCtrl_1.GetSelectText;
////    itemp^.ParentID := IntToStr(parentid);
////    Text := NsoCtrl_1.GetSelectText;
////  end;
//
  PartLst := TList.Create;
  for i := 0 to SortLst.Count - 2 do
  begin
    j := i + 1;
    if TSortData(SortLst.Items[j])^.Position - TSortData(SortLst.Items[i])^.Position > 1 then
    begin
      if (TSortData(SortLst.Items[i])^.IsStart) and
        (not TSortData(SortLst.Items[j])^.IsStart) and
        (TSortData(SortLst.Items[i])^.IsElement) then
      begin
        New(partp);
        partp^.struct := 'Element';
        partp^.svalue := GetElementValue(TSortData(SortLst.Items[i])^.sctName);
        partp^.StartPosition := TSortData(SortLst.Items[i])^.Position;
        partp^.EndPosition := TSortData(SortLst.Items[j])^.Position;
        PartLst.Add(partp);
      end
      else
      begin
        New(partp);
        partp^.struct := 'text';
        partp^.svalue := GetTextByPosition(TSortData(SortLst.Items[i])^.Position,
          TSortData(SortLst.Items[j])^.Position);
        partp^.StartPosition := TSortData(SortLst.Items[i])^.Position;
        partp^.EndPosition := TSortData(SortLst.Items[j])^.Position;
        PartLst.Add(partp);
      end;
    end;
  end;
end;

procedure TForm1.Btn_12Click(Sender: TObject);
var
  i: Integer;
begin
  with Cds_1 do
  begin
    Close;
    RemoteServer := DM.SockConn;
    ProviderName := 'dspDtl3';

    CommandText := 'select ' +
      '''                                         ' +
      ''' as struct,' +
      '''                                         ' +
      ''' as svalue,' +
      '''                                         ' +
      ''' as StartPosition,' +
      '''                                         ' +
      ''' as EndPosition ' +
      'from dual';

    try
      Open;
    except
      on e: Exception do
      begin
        ShowMessage('�����ݼ�ʧ�ܣ�' + e.Message);
        Exit;
      end;
    end;

    Delete;

    Edit;
    for i := 0 to PartLst.Count - 1 do
    begin
      Append;
      FieldByName('struct').AsString := TPartData(PartLst.Items[i])^.struct;
      FieldByName('svalue').AsString := TPartData(PartLst.Items[i])^.svalue;

      FieldByName('StartPosition').AsInteger := TPartData(PartLst.Items[i])^.StartPosition;
      FieldByName('EndPosition').AsInteger := TPartData(PartLst.Items[i])^.EndPosition;
    end;
    Post;
  end;
end;

procedure TForm1.EhGrd_2DblClick(Sender: TObject);
begin
  NsoCtrl_1.SetFocus2;
  NsoCtrl_1.CancelSelectOneArea('',0);
  NsoCtrl_1.SelectOneArea2(EhGrd_2.Fields[2].AsInteger + 1, EhGrd_2.Fields[3].AsInteger);
end;

function GetReserveBySct(ANode: IXMLNode): string;
var
  i: Integer;
begin
  Result := '';
  if ANode.NodeName = 'NewCtrl' then
    Exit;
  for i := 0 to ANode.ChildNodes.Count - 1 do
  begin
    if ANode.ChildNodes[i].NodeName = 'Reserve' then
    begin
      Result := string(ANode.ChildNodes[i].NodeValue);
      Break;
    end;
  end;
end;

function GetCtrlTextBySct(ANode: IXMLNode): string;
var
  i, j: Integer;
begin
  Result := '';
  if ANode.NodeName = 'NewCtrl' then
    Exit;
  for i := 0 to ANode.ChildNodes.Count - 1 do
  begin
    if ANode.ChildNodes[i].NodeName = 'NewCtrl' then
    begin
      for j := 0 to ANode.ChildNodes[i].ChildNodes.Count - 1 do
      begin
        if ANode.ChildNodes[i].ChildNodes[j].NodeName = 'Content_Text' then
        begin
          if ANode.ChildNodes[i].ChildNodes[j].NodeValue = null then
            Result := ''
          else
            Result := ANode.ChildNodes[i].ChildNodes[j].NodeValue;
          Exit;
        end;
      end;
    end;
  end;
end;

function GetTextBySct(ANode: IXMLNode): string;
var
  i: Integer;
begin
  Result := '';
  if ANode.NodeName = 'NewCtrl' then
    Exit;
  for i := 0 to ANode.ChildNodes.Count - 1 do
  begin
    if ANode.ChildNodes[i].NodeName = 'Content_Text' then
    begin
      if ANode.ChildNodes[i].NodeValue = null then
        Result := ''
      else
        Result := ANode.ChildNodes[i].NodeValue;
      Exit;
    end;
  end;
end;

function TForm1.AddXmlChildToTree(Atree: TTreeView; Atreenode: TTreeNode;
  Axmlnode: IXMLNode; var NodeID: Integer): Boolean;
var
  i: Integer;
  cellnode: IXMLNode;
  treenode: TTreeNode;
  pitem: TItemData;
begin
  Result := True;
  if Axmlnode.ChildNodes.Count < 1 then
    Exit;

  if Axmlnode.NodeName = 'DocObjContent' then
  begin

  end
  else
  begin
    Inc(NodeID);
    New(pitem);
    pitem^.ID := IntToStr(NodeID);
    pitem^.Name := 'text';
    pitem^.Value := GetTextBySct(Axmlnode);
    pitem^.ParentID := TItemData(Atreenode.Data)^.ID;

    treenode := Atree.Items.AddChild(Atreenode,IntToStr(NodeID));
    treenode.Data := pitem;
  end;

  for i := 0 to Axmlnode.ChildNodes.Count - 1 do
  begin
    cellnode := Axmlnode.ChildNodes[i];

    if cellnode.NodeName = 'Section' then
    begin
      if Pos('_ElmtID:', GetReserveBySct(cellnode)) > 0 then
      begin
        //��Ԫ�أ����Ԫ�أ����ٷֽ�
        Inc(NodeID);
        New(pitem);
        pitem^.ID := IntToStr(NodeID);
        pitem^.Name := Copy(GetReserveBySct(cellnode),
          Pos('_ElmtID:', GetReserveBySct(cellnode)) + 8,
          Length(GetReserveBySct(cellnode)) -
            Pos('_ElmtID:', GetReserveBySct(cellnode)) - 7);
        pitem^.Value := GetCtrlTextBySct(cellnode);
        pitem^.ParentID := TItemData(Atreenode.Data)^.ID;
        treenode := Atree.Items.AddChild(Atreenode,pitem^.ID);
        treenode.Data := pitem;
      end
      else
      begin
        //����Ԫ�أ���ӽڵ㣬���
        Inc(NodeID);
        New(pitem);
        pitem^.ID := IntToStr(NodeID);
        pitem^.Name := 'Section';
        pitem^.Value := Copy(GetReserveBySct(cellnode),
          Pos('ID:', GetReserveBySct(cellnode)) + 3,
          Length(GetReserveBySct(cellnode)) -
            Pos('ID:', GetReserveBySct(cellnode)) - 2);
        pitem^.ParentID := TItemData(Atreenode.Data)^.ID;
        treenode := Atree.Items.AddChild(Atreenode,pitem^.ID);
        treenode.Data := pitem;
        if AddXmlChildToTree(Atree, treenode, cellnode, NodeID) = False then
        begin
          Result := False;
          Exit;
        end;
      end;

//      ShowMessage(cellnode.NodeName + '-' +
//        GetReserveBySct(cellnode) + '-' +
//        cellnode.Attributes['Id'] + '-' +
//        cellnode.Attributes['BeginState'] + '-' +
//        cellnode.Attributes['EndState']);
    end;
  end;
end;

procedure TForm1.Btn_14Click(Sender: TObject);
var
  xmlDocument: IXMLDocument;
  rootnode, sctnode: IXMLNode;
  xmlstr: WideString;
  i: Integer;
  pitem: TItemData;
  treeroot: TTreeNode;
begin
  xmlstr := NsoCtrl_1.GetAllSectAndNewCtrlContentByCurrentDoc('0,1', '0,1', 0, 0);

  xmlDocument := NewXMLDocument;
  xmlDocument.Options := [doNodeAutoIndent];
  xmlDocument := LoadXMLData(xmlstr);
  xmlDocument.Active := True;
  xmlDocument.SaveToFile(ExePath + 'index.xml');

  try
    if xmlDocument.ChildNodes.Count < 2 then
      Exit ;
    rootnode := xmlDocument.ChildNodes[1];

    Tview_1.Items.Clear;

    i := 0;
    New(pitem);
    pitem^.ID := IntToStr(i);
    pitem^.Name := 'root';
    pitem^.Value := '';
    pitem^.ParentID := '-1';

    treeroot := Tview_1.Items.AddFirst(nil,'root');
    treeroot.Data := pitem;

    if AddXmlChildToTree(Tview_1, treeroot, rootnode, i) = False then
      raise Exception.Create('err');
  except
    ShowMessage('Read XML Error!');
  end;
  xmlDocument.Active := False;
end;

procedure TForm1.Btn_13Click(Sender: TObject);
var
  i: Integer;
  nownode: TTreeNode;
begin
  with Cds_2 do
  begin
    Close;
    RemoteServer := DM.SockConn;
    ProviderName := 'dspDtl3';

    CommandText := 'select ' +
      '''                                         ' +
      ''' as lid,' +
      '''                                         ' +
      ''' as lname,' +
      '''                                         ' +
      ''' as lvalue,' +
      '''                                         ' +
      ''' as lpid ' +
      'from dual';

    try
      Open;
    except
      on e: Exception do
      begin
        ShowMessage('�����ݼ�ʧ�ܣ�' + e.Message);
        Exit;
      end;
    end;

    Delete;

    Edit;
    nownode := Tview_1.Items.GetFirstNode;

    while nownode <> nil do
    begin
      if TItemData(nownode.Data)^.ID <> '0' then
      begin
        Append;
        FieldByName('lid').AsString := TItemData(nownode.Data)^.ID;
        FieldByName('lname').AsString := TItemData(nownode.Data)^.Name;
        FieldByName('lvalue').AsString := TItemData(nownode.Data)^.Value;
        FieldByName('lpid').AsString := TItemData(nownode.Data)^.ParentID;
      end;
      nownode := nownode.GetNext;
    end;
    Post;
  end;
end;

procedure TForm1.Tview_1DblClick(Sender: TObject);
begin
  if Tview_1.Selected <> nil then
  begin
    ShowMessage(TItemData(Tview_1.Selected.Data)^.ID + '-' +
      TItemData(Tview_1.Selected.Data)^.Name + '-' +
      TItemData(Tview_1.Selected.Data)^.Value + '-' +
      TItemData(Tview_1.Selected.Data)^.ParentID);
  end;  
end;

function TForm1.SetSysElmtText(ControlName, ElementID: string): Boolean;
var
  Cds_SysElmt: TClientDataSet;
  elmtmrz, elmtxtysdz: string;
begin
  Cds_SysElmt := TClientDataSet.Create(nil);
  try
    with Cds_SysElmt do
    begin
      Close;
      RemoteServer := DM.SockConn;
      ProviderName := 'dspDtl4';
      CommandText := 'select mrz,ysjb,xtysdz from emr_blys ' +
        'where ysjb = ''0'' and ysbh = ''' + ElementID + '''';
      try
        Open;
      except
        on e: Exception do
        begin
          Result := False;
          raise e;
          Exit;
        end;
      end;

      if RecordCount = 0 then
      begin
        Result := True;
        Exit;
      end
      else
      begin
        elmtmrz := FieldByName('mrz').AsString;
        elmtxtysdz := FieldByName('xtysdz').AsString;
      end;

      Close;
      CommandText := 'select ' + elmtxtysdz + ' from brjbxx ' +
        'where zyh = ''' + cwbrxx.Patient_ID + '''';

      try
        Open;
      except
        on e: Exception do
        begin
          Result := False;
          raise e;
          Exit;
        end;
      end;

      if RecordCount = 0 then
      begin
        Result := False;
        raise Exception.Create('����ͼȡϵͳԪ��ʧ�ܣ�δ�ҵ�����[' + elmtxtysdz + ']��');
        Exit;
      end
      else
      begin
        if NsoCtrl_1.SetNewControlText(ControlName, FieldByName(elmtxtysdz).AsString) then
        begin
          Result := True;
        end
        else
        begin
          Result := False;
          raise Exception.Create('���ÿؼ��ı�ʧ�ܣ�');
        end;  
      end;
    end;
  finally
    Cds_SysElmt.Free;
  end;
end;  

procedure TForm1.Btn_15Click(Sender: TObject);
var
  ctrlnamelst: TStringList;
  ctrlname,
  sctname,
  scttip,
  elmtid
    :string;
  i: Integer;
  ErrSucs: Boolean;
begin
  ctrlnamelst := TStringList.Create;
  ctrlnamelst.DelimitedText := NsoCtrl_1.GetAllControlNameByCurrentDoc;
  ctrlnamelst.Delimiter := ',';
  for i := 0 to ctrlnamelst.Count - 1 do
  begin
    if ctrlnamelst.Strings[i] <> '' then
    begin
      ctrlname := ctrlnamelst.Strings[i];
      sctname := NsoCtrl_1.GetFatherSectionName(ctrlname);
      scttip := NsoCtrl_1.GetSectionProp(sctname, 'HelpTip');
      elmtid := Copy(scttip , Pos('ID:', scttip) + 3,
        Length(scttip) - Pos('ID:', scttip) - 2);
      ShowMessage(elmtid);
      try
        ErrSucs := SetSysElmtText(ctrlname, elmtid);
      except
        on e: Exception do
        begin
          MsgInfo('��ϵͳԪ������ʧ�ܣ�' + #13#10 +
            '������Ϣ��' + e.Message, 3);
          Break;
        end;
      end;
    end;
  end;

  if not ErrSucs then
  begin
    if MsgYesNO('��ϵͳԪ�����ݳ��ִ����Ƿ����°󶨣�' + #13#10 +
      '�������Ϣ��γ��֣�����ϵϵͳ����Ա��', False) = mrYes then
    begin
      Btn_15Click(Sender);
    end
    else
    begin
      if MsgYesNO('��ϵͳԪ������ʧ�ܣ����´�ģ����ܻ��޸���һ���⡣' + #13#10 +
        '�༭�е��ĵ����ݰ��Ѿ��������⣬�Ƿ�رգ������棩��' + #13#10 +
        '��������棬�򱣴�Ĳ����ܿ��ܳ����������⣡��', False) = mrYes then
      begin
        Close;
      end;
    end;
  end;   
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
  NsoCtrl_1.SwitchRecension(True);
  NsoCtrl_1.ShowRecension(1);
end;

procedure TForm1.Btn_16Click(Sender: TObject);
begin
  NsoCtrl_1.SetRecensionInfo (edt1.Text, edt1.Text, '', 2, '��ɫ');
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  NsoCtrl_1.AcceptRecension;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  NsoCtrl_1.RejectRecension;
end;

procedure TForm1.Btn_17Click(Sender: TObject);
begin
  NsoCtrl_1.JumpToFileEnd;
  NsoCtrl_1.InsertNewLine(-1);
  NsoCtrl_1.MergeDocuments(False,False,GetCurrentDir + '\2.odt');
  NsoCtrl_1.JumpToFileEnd;
//  NsoCtrl_1.InsertNewLine(-1);
  NsoCtrl_1.MergeDocuments(False,False,GetCurrentDir + '\3.odt');
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  NsoCtrl_1.Close;
  NsoCtrl_1.KillSofficeBin
end;

procedure CompressStream(aSource, ATarget: TStream);
var
  comprStream: TCompressionStream;
begin
  comprStream := TCompressionStream.Create(clDefault, atarget);
  try
    comprstream.CopyFrom(aSource, asource.Size);
    comprStream.CompressionRate;
  finally
    comprstream.Free;
  end;
end;

procedure DecompressStream(aSource, aTarget: TStream);
var
  decompStream: tDecompressionStream;
  nRead: integer;
  buffer: array[0..1023] of Char;
begin
  decompstream := TDecompressionStream.Create(asource);
  try
    repeat
      nRead := decompstream.Read(buffer, 1024);
      atarget.Write(buffer, nRead);
    until nread = 0
  finally
    decompstream.Free;
  end;
end;

{��Srcʹ��Zlibѹ�������Dst���� }
procedure PackStream(const Src:TStream; Dst:TStream); 
var 
  CompStream: TCompressionStream; 
begin 
  {���ӡ����ԡ��Է�ֹ����������� }
  Assert(Src <> Nil); 
  Assert(Dst <> Nil); 

  CompStream := TCompressionStream.Create(clDefault,Dst); 
  try 
    {��Դ���ݵ�ƫ��ת���ײ� }
    Src.Seek(0,soFromBeginning); 
    {ʹ��CopyFrom��Դ�������뵽ѹ��������ʵ��ѹ�� }
    CompStream.CopyFrom(Src,0); 
  finally 
    CompStream.Free; 
  end; 
end; 

{����zlibѹ����Src��ѹ�������Dst���� }
procedure UnpackStream(const Src:TStream; Dst:TStream); 
var 
  DecompStream: TDecompressionStream; 
  NewSize: Int64; 
begin 
  {���ӡ����ԡ��Է�ֹ����������� }
  Assert(Src <> Nil); 
  Assert(Dst <> Nil); 

  DecompStream:= TDecompressionStream.Create(Src); 
  try 
    {��Դ���ݵ�ƫ��ת���ײ� }
    NewSize := Src.Seek(0, soFromEnd); 
    Src.Seek(0, soFromBeginning); 
    {//ʹ��CopyFrom��Դ�������뵽��ѹ��������ʵ�ֽ�ѹ�� 
    //���õ�ʵ�ʽ�ѹ��������ݴ�С(NewSize) 
    //�ڲ���ʹ��AllocMem(System��Ԫ����)��Dst�����ڴ����·��� 
    //���ԣ�Dst���ڴ����������AllocMem�����ڴ���� }
    NewSize := Dst.CopyFrom(DecompStream,NewSize); 
    {��������Dst��ʵ�ʴ�С(�Ѿ��ڽ�ѹ�����̵��н������·���) }
    Dst.Size := NewSize;
  finally
    DecompStream.Free;
  end;
end;

procedure TForm1.Btn_18Click(Sender: TObject);
var
  fileOv: OleVariant;
  fileP: pointer;
  fileStrm, saveStrm: TStream;
  highBound,lowBound:Integer;
begin
  fileStrm := TMemoryStream.Create;
  try
    if NsoCtrl_1.SaveToStream(fileOv) <> 0 then
      Exit;
    fileStrm.Position := 0;
    highBound := VarArrayHighBound (fileOv, 1);
    lowBound := VarArrayLowBound (fileOv, 1);
    fileStrm.Size := highBound - lowBound + 1;
    fileP := VarArrayLock (fileOv);
    fileStrm.Write (fileP^, fileStrm.Size);
    VarArrayUnlock (fileOv);
    fileStrm.Position := 0;
    try
      if dlgSave1.Execute then
      begin
        saveStrm := TFileStream.Create(dlgSave1.FileName, fmcreate);
      end;
    except
      on e: Exception do
      begin
        ShowMessage('error:' + e.Message);
        Exit;
      end;
    end;

    CompressStream(fileStrm, saveStrm);
  finally
    fileStrm.Free;
    saveStrm.Free;
  end;
end;

procedure TForm1.Btn_19Click(Sender: TObject);
var
  openStrm, fileStrm:tStream;
  fileOv: OleVariant;
  fileP: pointer;
  highBound,lowBound:Integer;
begin
  try
    try
      if dlgOpen1.Execute then
      begin
        openStrm := TFileStream.Create(dlgOpen1.FileName, fmOpenRead);
      end
      else
        exit;
    except
      on e: Exception do
      begin
        ShowMessage('error:' + e.Message);
        Exit;
      end;
    end;

    fileStrm := TMemoryStream.Create;
    DecompressStream(openStrm, fileStrm);

  fileOv := VarArrayCreate ([0, fileStrm.Size - 1], varByte);
  fileP := VarArrayLock (fileOv);
  fileStrm.Position := 0;
  fileStrm.Read (fileP^, fileStrm.Size);
  VarArrayUnlock (fileOv);
  ShowMessage(IntToStr(NsoCtrl_1.OpenDocumentWithStream(fileOv,2)));


  finally
     openStrm.Free;
     fileStrm.Free;
  end;

end;

procedure TForm1.NsoCtrl_1NsoKeyPressedEvent(Sender: TObject;
  nKeyCode: Smallint; nKeyChar: ShortInt; nKeyFunction,
  nModifiers: Smallint; out bCancel: WordBool);
begin
  if nKeyFunction = 3 then
    bCancel := True;
  if nKeyFunction = 4 then
    bCancel := True;
end;

procedure TForm1.Btn_20Click(Sender: TObject);
begin
  ShowMessage(IntToStr(NsoCtrl_1.SaveAs2(ExePath + 'DocTempFiles\tt.odt',True)));
end;

procedure TForm1.Btn_21Click(Sender: TObject);
begin
  NsoCtrl_1.CreateNew('swriter');
  NsoCtrl_1.RemoveAllListener;
  NsoCtrl_1.AddKeyListener(0);
end;

procedure TForm1.Btn_22Click(Sender: TObject);
begin
  if NsoCtrl_1.IsDocModified then
    ShowMessage('Modified')
  else
    ShowMessage('Haven''t Modified');
end;

procedure TForm1.Btn_23Click(Sender: TObject);
var
  Cds_BaseDB: TClientDataSet;
  datafile: string;
  cnt: Integer;
begin
  datafile := ExePath + 'DocTempFiles\Index.xml';
  if not FileExists(datafile) then
  begin
    Cds_BaseDB := TClientDataSet.Create(nil);
    try
      with Cds_BaseDB do
      begin
        RemoteServer := DM.SockConn;
        ProviderName := 'dspDtl6';
        Close;
        CommandText := 'select ''                    '' as dataid, ' +
          '''                                                  '' as datafile, ' +
          '''                    '' as owner, ' +
          '''  '' as datatype, ' +
          '''                    '' as datadate from dual';// where 1=2';
        try
          Open;
          ShowMessage(IntToStr(Fields.Count));
//          Fields.FindField('dataid').ProviderFlags := [pfInUpdate,pfInWhere,pfInKey];
          Fields.FindField('dataid').Required := True;
          SaveToFile(datafile);
        except

        end;
      end;
    finally
      Cds_BaseDB.Free;
    end;
  end;

  Cds_BaseDB := TClientDataSet.Create(nil);
  try
    with Cds_BaseDB do
    begin
      Close;
      try
        LoadFromFile(datafile);
        Open;
      except

      end;
    end;
  finally
    Cds_BaseDB.Free;
  end;
end;

procedure TForm1.Btn_24Click(Sender: TObject);
begin
  with Cds_3 do
  begin
    Close;
    LoadFromFile(ExePath + 'DocTempFiles\Index.xml');
    Open;
    Delete;
    ApplyUpdates(0);
    SaveToFile(ExePath + 'DocTempFiles\Index.xml');
  end;
end;

function CreateIndexXml(Apath: string): Boolean;
var
  xmlDocument: IXMLDocument;
  rootnode: IXMLNode;
begin
  try
    try
      if FileExists(Apath + 'Index.xml') then
      begin
        Result := True;
        xmlDocument := NewXMLDocument;
        xmlDocument.Options := [doNodeAutoIndent];
        xmlDocument.Active := True;
        xmlDocument := LoadXMLDocument(Apath + 'Index.xml');

        if xmlDocument.ChildNodes.Count <> 2 then
        begin
          raise Exception.Create('XML�ڵ���С��2��');
        end;

        if xmlDocument.ChildNodes[1].NodeName <> 'baseFiles' then
        begin
          raise Exception.Create('XML���ڵ㲻��baseFiles��');
        end;

        if not xmlDocument.ChildNodes[1].HasChildNodes then
        begin
          raise Exception.Create('XML���ڵ����ӽڵ㣡');
        end;

        if ((xmlDocument.ChildNodes[1].ChildNodes[0].NodeName <> 'bl') and
          (xmlDocument.ChildNodes[1].ChildNodes[0].NodeName <> 'mb')) or
          ((xmlDocument.ChildNodes[1].ChildNodes[1].NodeName <> 'bl') and
          (xmlDocument.ChildNodes[1].ChildNodes[1].NodeName <> 'mb')) then
        begin
          raise Exception.Create('XML���ڵ���ӽڵ����');
        end;
      end
      else
      begin
        xmlDocument := NewXMLDocument;
        xmlDocument.Options := [doNodeAutoIndent];
        xmlDocument.Active := True;
        xmlDocument.Version := '1.0';
        xmlDocument.Encoding := 'gb2312';
        rootnode := xmlDocument.AddChild('baseFiles');
        rootnode.AddChild('mb');
        rootnode.AddChild('bl');
        xmlDocument.SaveToFile(Apath + 'Index.xml');
        Result := True;
      end;
    except
      on e: Exception do
      begin
        xmlDocument.Active := False;
        DeleteFile(Apath + 'Index.xml');
        if CreateIndexXml(Apath) then
        begin
          Result := True;
          Exit;
        end
        else
        begin
          MsgInfo('��ʼ�������ļ�Ŀ¼ʧ�ܣ�������Ϣ��' + e.Message, 3);
          Result := False;
          Exit;
        end;
      end;
    end;
  finally
    xmlDocument.Active := False;
  end;
end;

function DeleteIneffective(Apath: string): Boolean;
var
  xmlDocument: IXMLDocument;
  rootNode, readNode: IXMLNode;
  i, j: Integer;
  fileNames: TStringList;
  seacher: TSearchRec;
begin
  Result := True;
  try
    try
      fileNames := TStringList.Create;
      xmlDocument := NewXMLDocument;
      xmlDocument.Options := [doNodeAutoIndent];
      xmlDocument.Active := True;
      xmlDocument := LoadXMLDocument(Apath + 'Index.xml');

      if xmlDocument.ChildNodes.Count < 2 then
      begin
        MsgInfo('��ʼ�������ļ�Ŀ¼ʧ�ܣ�������Ϣ��Ŀ¼�ļ��ṹ����', 3);
        Result := False;
        Exit;
      end;

      rootnode := xmlDocument.ChildNodes[1];

      if not rootNode.HasChildNodes then
      begin
        MsgInfo('��ʼ�������ļ�Ŀ¼ʧ�ܣ�������Ϣ��Ŀ¼�ļ��ṹ����', 3);
        Result := False;
        Exit;
      end;

      for i := 0 to rootnode.ChildNodes.Count - 1 do
      begin
        readNode := rootnode.ChildNodes[i];
        for j := 0 to readNode.ChildNodes.Count - 1 do
        begin
          if (readNode.ChildNodes[j].Attributes['datafile'] <> '') and
            (not FileExists(Apath + readNode.ChildNodes[j].Attributes['datafile'])) then
          begin
            readNode.ChildNodes.Delete(j);
          end
          else
          begin
            fileNames.Add(readNode.ChildNodes[j].Attributes['datafile']);
          end;
        end;
      end;

      if FindFirst(Apath + '*.bbak', faAnyFile, seacher) = 0 then
      begin
        repeat
          if fileNames.IndexOf(seacher.Name) = -1 then
          begin
            DeleteFile(Apath + seacher.Name);
          end;
        until FindNext(seacher) <> 0;
      end;
      FindClose(seacher);

      xmlDocument.SaveToFile(Apath + 'Index.xml');
    except
      on e: Exception do
      begin
        MsgInfo('��ʼ�������ļ�Ŀ¼ʧ�ܣ�������Ϣ��' + e.Message, 3);
        Result := False;
        Exit;
      end;
    end;
  finally
    xmlDocument.Active := False;
    fileNames.Free;
  end;
end;

function SaveFileIndex(const Apath, Adatatype, Adataid, Adatafile: string): Boolean;
var
  xmlDocument: IXMLDocument;
  rootNode, readNode, writeNode: IXMLNode;
  i, j: Integer;
  hasSaved: Boolean;
begin
  Result := True;
  try
    try
      xmlDocument := NewXMLDocument;
      xmlDocument.Options := [doNodeAutoIndent];
      xmlDocument.Active := True;
      xmlDocument := LoadXMLDocument(Apath + 'Index.xml');
      hasSaved := False;
      if xmlDocument.ChildNodes.Count < 2 then
      begin
        Result := False;
        Exit;
      end;

      rootnode := xmlDocument.ChildNodes[1];

      if not rootNode.HasChildNodes then
      begin
        Result := False;
        Exit;
      end;

      for i := 0 to rootnode.ChildNodes.Count - 1 do
      begin
        if rootNode.ChildNodes[i].NodeName = Adatatype then
        begin
          readNode := rootnode.ChildNodes[i];
          for j := 0 to readNode.ChildNodes.Count - 1 do
          begin
            if readNode.ChildNodes[j].Attributes['dataid'] = Adataid then
            begin
              DeleteFile(Apath + readNode.ChildNodes[j].Attributes['datafile']);
              readNode.ChildNodes[j].Attributes['datadate'] := GetDateTimeStr(Now, 0);
              readNode.ChildNodes[j].Attributes['datafile'] := Adatafile;
              hasSaved := True;
              Break;
            end;
          end;

          if not hasSaved then
          begin
            writeNode := readNode.AddChild(Adatatype + 'File');
            writeNode.Attributes['dataid'] := Adataid;
            writeNode.Attributes['datadate'] := GetDateTimeStr(Now, 0);
            writeNode.Attributes['datafile'] := Adatafile;
            hasSaved := True;
          end;
          xmlDocument.SaveToFile(Apath + 'Index.xml');
          Exit;
        end;
      end;   
    except
      on e: Exception do
      begin
        MsgInfo('���汾���ļ�Ŀ¼��Ϣʧ�ܣ�������Ϣ��' + e.Message, 3);
        Result := False;
        Exit;
      end;
    end;
  finally
    xmlDocument.Active := False;
  end;
end;

function LoadFileIndex(const Apath, Adatatype, Adataid: string; var Adatadate, Adatafile: string): Boolean;
var
  xmlDocument: IXMLDocument;
  rootNode, readNode: IXMLNode;
  i, j: Integer;
begin
  Result := True;
  try
    try
      Adatadate := '';
      Adatafile := '';
      xmlDocument := NewXMLDocument;
      xmlDocument.Options := [doNodeAutoIndent];
      xmlDocument.Active := True;
      xmlDocument := LoadXMLDocument(Apath + 'Index.xml');

      if xmlDocument.ChildNodes.Count < 2 then
      begin
        Result := False;
        Exit;
      end;

      rootnode := xmlDocument.ChildNodes[1];

      if not rootNode.HasChildNodes then
      begin
        Result := False;
        Exit;
      end;

      for i := 0 to rootnode.ChildNodes.Count - 1 do
      begin
        if rootNode.ChildNodes[i].NodeName = Adatatype then
        begin
          readNode := rootnode.ChildNodes[i];
          for j := 0 to readNode.ChildNodes.Count - 1 do
          begin
            if readNode.ChildNodes[j].Attributes['dataid'] = Adataid then
            begin
              Adatadate := readNode.ChildNodes[j].Attributes['datadate'];
              Adatafile := readNode.ChildNodes[j].Attributes['datafile'];
              Exit;
            end;
          end;
        end;
      end;
    except
      on e: Exception do
      begin
        MsgInfo('��ȡ�����ļ�Ŀ¼��Ϣʧ�ܣ�������Ϣ��' + e.Message, 3);
        Result := False;
        Exit;
      end;
    end;
  finally
    xmlDocument.Active := False;
  end;
end;

function ClearFileIndex(const Apath, Adatatype, Adataid: string; var Adelcount: Integer): Boolean;
var
  xmlDocument: IXMLDocument;
  rootNode, readNode: IXMLNode;
  i, j: Integer;
begin
  Result := True;
  try
    try
      Adelcount := 0;
      xmlDocument := NewXMLDocument;
      xmlDocument.Options := [doNodeAutoIndent];
      xmlDocument.Active := True;
      xmlDocument := LoadXMLDocument(Apath + 'Index.xml');

      if xmlDocument.ChildNodes.Count < 2 then
      begin
        Result := False;
        Exit;
      end;

      rootnode := xmlDocument.ChildNodes[1];

      if not rootNode.HasChildNodes then
      begin
        Result := False;
        Exit;
      end;

      for i := 0 to rootnode.ChildNodes.Count - 1 do
      begin
        if rootNode.ChildNodes[i].NodeName = Adatatype then
        begin
          readNode := rootnode.ChildNodes[i];
          for j := 0 to readNode.ChildNodes.Count - 1 do
          begin
            if readNode.ChildNodes[j].Attributes['dataid'] = Adataid then
            begin
              DeleteFile(Apath + readNode.ChildNodes[j].Attributes['datafile']);
              readNode.ChildNodes.Delete(j);
              Inc(Adelcount);
            end;
          end;
          xmlDocument.SaveToFile(Apath + 'Index.xml');
          Exit;
        end;
      end;
    except
      on e: Exception do
      begin
        MsgInfo('�������ļ�Ŀ¼��Ϣʧ�ܣ�������Ϣ��' + e.Message, 3);
        Result := False;
        Exit;
      end;
    end;
  finally
    xmlDocument.Active := False;
  end;
end;

type
  TFileIndexInfo = record
    dataid,
    datatype,
    datafile,
    datadate
      :string;
  end;
  TFileIndexItem = ^TFileIndexInfo;

function ListFileIndex(const Apath, Adatatype: string; var ALst: TList): Boolean;
var
  xmlDocument: IXMLDocument;
  rootNode, readNode: IXMLNode;
  i, j: Integer;
  p: TFileIndexItem;
begin
  Result := True;
  try
    try
      xmlDocument := NewXMLDocument;
      xmlDocument.Options := [doNodeAutoIndent];
      xmlDocument.Active := True;
      xmlDocument := LoadXMLDocument(Apath + 'Index.xml');

      if xmlDocument.ChildNodes.Count < 2 then
      begin
        Result := False;
        Exit;
      end;

      rootnode := xmlDocument.ChildNodes[1];

      if not rootNode.HasChildNodes then
      begin
        Result := False;
        Exit;
      end;

      if Adatatype = '' then
      begin
        for i := 0 to rootnode.ChildNodes.Count - 1 do
        begin
          readNode := rootnode.ChildNodes[i];
          for j := 0 to readNode.ChildNodes.Count - 1 do
          begin
            New(p);
            p.dataid := readNode.ChildNodes[j].Attributes['dataid'];
            p.datatype := readNode.NodeName;
            p.datafile := readNode.ChildNodes[j].Attributes['datafile'];
            p.datadate := readNode.ChildNodes[j].Attributes['datadate'];
            ALst.Add(p);
          end;
        end;
      end
      else
      begin
        for i := 0 to rootnode.ChildNodes.Count - 1 do
        begin
          if readNode.NodeName = Adatatype then
          begin
            readNode := rootnode.ChildNodes[i];
            for j := 0 to readNode.ChildNodes.Count - 1 do
            begin
              New(p);
              p.dataid := readNode.ChildNodes[j].Attributes['dataid'];
              p.datatype := readNode.NodeName;
              p.datafile := readNode.ChildNodes[j].Attributes['datafile'];
              p.datadate := readNode.ChildNodes[j].Attributes['datadate'];
              ALst.Add(p);
            end;
            Break;
          end;
        end;
      end;
    except
      on e: Exception do
      begin
        MsgInfo('�������ļ�Ŀ¼��Ϣʧ�ܣ�������Ϣ��' + e.Message, 3);
        Result := False;
        Exit;
      end;
    end;
  finally
    xmlDocument.Active := False;
  end;
end;

procedure TForm1.Btn_25Click(Sender: TObject);
var
  ldate, lfile: string;
  cnt: Integer;
  filelst: TList;
  p: TFileIndexItem;
  i: Integer;
begin
//  CreateIndexXml(ExePath + 'DocTempFiles\');
////  DeleteIneffective(ExePath + 'DocTempFiles\');
////  SaveFileIndex(ExePath + 'DocTempFiles\', 'mb','342','9999','1.bbak');
//  LoadFileIndex(ExePath + 'DocTempFiles\', 'mb','342','9999',ldate,lfile);
//  ShowMessage(ldate + '-' + lfile);
//ClearFileIndex(ExePath + 'DocTempFiles\', 'mb','342',cnt);
//ShowMessage(IntToStr(cnt));
//
  filelst := TList.Create;
  try
    ListFileIndex(ExePath + 'DocTempFiles\','',filelst);
    for i := 0 to filelst.Count - 1 do
    begin
      p := filelst.Items[i];
      ShowMessage(p.dataid + #13#10 + P.datatype + #13#10 + p.datafile + #13#10 + p.datadate);
    end;
  finally
    cnt := filelst.Count;
    for i := cnt - 1 downto 0 do
    begin
      p := filelst.Items[i];
      filelst.Delete(i);
      DisPose(p);
    end;
    //�ͷ�����
    filelst.Free;
  end;          
end;

procedure TForm1.btn_27Click(Sender: TObject);
begin
  with Cds_4 do
  begin
    Close;
    CommandText := 'select blid, '+
      'to_char(czsj,''yyyy-mm-dd hh24:mi:ss.ff'') as czsj, ' +
      'czr, brzyh, czlx from emr_bllog';
    try
      Open;
    except

    end;
  end;
end;

procedure TForm1.btn_26Click(Sender: TObject);
var
  Ablid, Aczr, Abrzyh, Aczlx: string;
  Cds_Log: TClientDataSet;
begin
  Ablid := '105';
  Aczr := '9999';
  Abrzyh := '01';
  Aczlx := '01';
{*  01: �½�����     **
**  02: �޸Ĳ������� **
**  03: ɾ������     **
**  04: �������     **
**  05: ��ӡ����     *}
  Cds_Log := TClientDataSet.Create(nil);
  try
    with Cds_Log do
    begin
      Close;
      RemoteServer := DM.SockConn;
      ProviderName := 'dspDtl7';
      CommandText := 'insert into emr_bllog(blid,czsj,czr,brzyh,czlx) ' +
        'values(''' + Ablid + ''', CURRENT_TIMESTAMP,' +
        '''' + Aczr + ''',''' + Abrzyh + ''',''' + Aczlx + ''')';
      try
        Execute;
      except

      end;
    end;  
  finally
    Cds_Log.Free;
  end;
end;

end.



