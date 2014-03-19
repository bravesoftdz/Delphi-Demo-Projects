unit UserFunc_U;
                                                               
interface
Uses
  Windows, Classes, SysUtils, INIFiles, ScktComp, DBClient,DllFunc_u, Share_u, Dialogs
  , ZLib, DictIpt, Controls, Forms, StrUtils, DBGridEh, Graphics, ActnList,
  IMM, IdTCPClient, IdFTP, StdCtrls, DB, Variants, FlatComboBoxCode, ComboBoxCode,
  FlatSelEdit, Insur_u;
const
  StrInput: String='1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  ClrNOFocus: TColor = $00D8E9EC;
  ClrFocus: TColor= clWhite;
  Win_NOLen: Integer = 2;
type
  
  EDLLLoadError = class(Exception);
  TRowStatus = (rsBlank, rsInvaild, rsVaild, rsNOAmount, rslackAmount);
  TEditMode=(emAppend,emInsert);
  TPlugin =class
    PluginIntf: TPlugInIntf;
    Address: THandle;   //加载DLL句柄
    Call   : Pointer;   //存取ShowDllForm函数句柄
    Action: TAction;
  end;
  TGetCaption = function: TPlugInIntf;StdCall;  //得到菜单名函数
  TShowDllForm = function(aHandle: THandle): Boolean;StdCall; //显示窗口函数
  (*交换网络数据包*)
  function TransPacket(aSendStrm: TMemoryStream;
  var arecvStrm: TMemoryStream): Boolean;
  (*升级单个文件*)
  function UpgradeSigleFile(FileType: Integer;aFilePath,mkwjm,mkbbh: String): Boolean;
  (*升级文件*)
  procedure Upgrade(FileType: Integer;aFilePath: String; lblInfo: TLabel);
  (*升级系统DLL*)
  procedure DllUpgrade(FileType: Integer;aFilePath,ZxtDm: String; LblInfo: TLabel);
  (*升级非DLL文件*)
  procedure NODllUpgrade(FileType: Integer;aFilePath,LocalXml,ZxtDm: String; LblInfo: TLabel);
  (*检查系统文件*)
  function CheckSysUpgrade(FileType: Integer;aFilePath, ZxtDm: String): Boolean;
  (*得到系统名称*)
  function GetSubSysIntf: Boolean;
  (*导出XML字典*)
  function ExpXmlDict(Cds_Dict: TClientDataSet;Zxtdm,mkwjm,mkbbh,wjlxm,mkmc: String): Boolean;
  (*导出字典XML字典*)
  function ExpDictXmlDict(zxtdm,zdbm,zdmc: String; const blBuildSpell: Boolean= false): Boolean;
  {显示输入法}
  function ShowDictIpt(ADpt: TDictIpt;var Aedt_com: TWinControl;
    AFileName: String;var aCode: String; AScreen:TScreen;
    const AFilter: String=''): Boolean;

  procedure CopyArr(var Dest: Array of Char; Const Source: String;
    AFillChar: Char; Const DotStart: Integer=0; Const isDot: Boolean= false);

  procedure GetCellRectU(var ARect: TRect;Sender : TObject);//得到控件坐标
  procedure SetPositionU(ARect : TRect;Com : TWinControl);//设置控件坐标

  (*四舍五入差额*)
  function GetRejectSum(rSum: real; StrMode: String): real;
  (*从INI文件中得到系统信息*)
  function GetSysIntf(IniFile: String): TSysIntf;
  (*得到有部门限制的用户的系统工作部门*)
  function GetUserDept: Boolean;

  (*得到插件索引号*)
  function GetPluginIndex(aItemCode: String): Integer;
  (*得到药品包装换算数量*)
  function GetYpslFromBz(Cds: TClientDataSet): Integer;
  function GetSpeedChar(var index: Integer): String;
  function GetComXY(Com: TControl): TPoint;
  procedure SetComXy(var Com: TWinControl; Pi: TPoint);
  (*增加发票号码*)
  function IncRcpt_NO(StrOldRcpt_NO: String; Const StrWin_NOLen: Integer = 2): String;
  (*左补零*)
  function LeftPad(StrSource: String; iLen: Integer): String;
  (*打开数据集*)
  function OpenClientDataSet(Cds: TClientDataSet; StrSQL: WideString): Boolean;
  (*释放CDS资源*)
  procedure CloseCds;
  (*过滤字符串中的数字*)
  function GetChar(Str: String): String;
  (*关闭输入法*)
  procedure CloseIME(AHandle: THandle);
  (*打开输入法*)
  procedure OpenIme(imename:string);
  function GetRightStr(Str,SubStr: String): String;
  (*设置TClientDataSet处于编辑状态*)
  procedure SetClientDataSetStatus(Cds: TClientDataSet);
  function CdsUpdate(cdsArr: Array of TClientDataSet;
    TblArr: Array of String; var ErrStr: String): Boolean;
  function GetSQN(ILx: String; const iCnt: Integer = 1):String;
  function GetXH(ILx: String; var Strxtsj: String; const iCnt: Integer = 1; Const Strdwdm: String=''):String;
  function GetGhXh(ILx, StrHb, StrMzsjms, StrMzrq: String; var Strxtsj, StrHbxh, StrErr: String; const iCnt: Integer = 1):String;
  (*数组转换成数值*)
  function ArrToFloat(Arr: Array of Char;DotStart: Integer): real;overload;
  function ArrToFloat(Arr: String;DotStart: Integer):real;overload;
  (*拆分含“,“或“-”的字符串*)
  function SplitNumStr(var Str: String): Boolean;
  (*得到错误信息中的字段名*)
  function GetFieldName(Str: String): String;
  
  procedure CbxItemAdd(cbx_Item: TFlatComboBoxCode; cds: TClientDataSet;
    StrName,StrCode: String; const blCodeInput: Boolean= false);overload;
  procedure CbxItemAdd(cbx_Item: TComboBoxCode; cds: TClientDataSet;
    StrName,StrCode: String; const blCodeInput: Boolean= false);overload;
  function SetIDCardEdit(StrSfz: String): String;
  procedure AdjustDropDownForm(AControl : TControl; HostControl: TControl);
  

  function SetSrvrTime(StrSysDate: String): Boolean;
  function Get_Brzf(StrYbbz, StrGrdnh, Strzyh: String; var ErrStr: String; Const strybkbb: String='0'): TBrzfcx;
  function Get_Hzzf(Str: String): String;
  procedure ReadSrvrXml(StrDepot: String);
  function Get_Round(r: Real; Len: Integer): Real;
  function GenCrossTable(SouDataSet:TDataSet;ColField,RowField0,RowField1,RowField2,RowField,DataField:string):TDataSet;
  function CreateTmptab(const AFieldDefs:TFieldDefs):TDataSet;
  function Date_to_season(datetemp:string):string;
var            
  lbl_cwzs: TLabel;
  lbl_zcws: TLabel;
  lbl_cwzyr: TLabel;
  lbl_zybr: TLabel;
  lbl_gcbr: TLabel;
  stopSearch: Boolean;
  PluginList: TList;//插件列表
  ShowDllFrm: TShowDllForm; //显示窗口变量
implementation

uses dm_u;
function Date_to_season(datetemp:string):string;
var
  season,yf:Integer;
  temp:string;
begin
  yf:=StrToInt(Copy(datetemp,6,2));
  if (yf>4) then
    season:=Round(StrToInt(Copy(datetemp,6,2))/4)+1
  else
    season:=1;
  Result:=IntToStr(season);
end;
function CreateTmptab(const AFieldDefs:TFieldDefs):TDataSet;
var
  TempTable:TClientDataSet;
begin
  TempTable:=nil;
  Result:=nil;
  if AFieldDefs<>nil then
  begin
    try
      TempTable:=TClientDataSet.Create(Application);
      TempTable.FieldDefs.Assign(AFieldDefs);
      TempTable.CreateDataSet;
      Result:=(TempTable as TDataSet);
    Except
      if TempTable<>nil then
        TempTable.Free;
        Result:=nil;
        raise;
    end
  end;
end;
{
SouDataset源数据集
ColField交叉表动态列字段
RowField交叉表行字段
RowField0,RowField1,RowField2分别是需要在左端显示的第一列，第二列，第三列，没有的话留空即可。
DataField数据字段
}
function GenCrossTable(SouDataSet:TDataSet;ColField,RowField0,RowField1,RowField2,RowField,DataField:string):TDataSet;
var
  Vdataset:TDataSet;
  tmpdataset:TDataSet;
  DataSource:tdatasource;
  tmpstrs:tstrings;
  rowval,rowval0,rowval1,rowval2,colval,dataval:string;
  i,j:integer;
  datatype:TFieldType;
  DataSize:integer;
begin
  result:=nil;
  if (ColField='') or(RowField='')or(DataField='') then
     showmessage('All Field not be NULL!')
  else
  begin
  if (ColField=RowField) or(ColField=DataField) or(RowField=DataField) then
    showmessage('All Field not be Equ!')
  else
  if (SouDataSet.FieldByName(ColField).DataType=ftString)
      or (SouDataSet.FieldByName(ColField).DataType<>ftWideString)
      or (SouDataSet.FieldByName(ColField).DataType<>ftFixedChar)
      or (SouDataSet.FieldByName(ColField).DataType<>ftMemo)
      or (SouDataSet.FieldByName(ColField).DataType<>ftFmtMemo) then
  begin
   try
     tmpstrs:=tstringlist.Create;
     Vdataset:=SouDataSet;
     Vdataset.First;
     for i:=0 to Vdataset.RecordCount-1 do
     begin
       if (varisnull(SouDataSet.FieldValues[colfield])=false) and (SouDataSet.FieldValues[colfield]<>'') then
         if tmpstrs.IndexOf(SouDataSet.FieldValues[colfield])=-1 then
         begin
           tmpstrs.Add(SouDataSet.FieldValues[colfield]);
         end;
         Vdataset.Next;
     end;
      //生成动态列标题
     tmpdataset:=TClientDataSet.Create(Application);
     //tmpdataset.FieldDefs.Add(rowfield,ftstring,50,False);
     if RowField0<>'' then  tmpdataset.FieldDefs.Add(rowfield0,ftstring,50,False);
     if RowField1<>'' then  tmpdataset.FieldDefs.Add(rowfield1,ftstring,50,False);
     if RowField2<>'' then  tmpdataset.FieldDefs.Add(rowfield2,ftstring,50,False);
     for i:=0 to tmpstrs.Count-1 do
     begin
       with tmpdataset.FieldDefs do
       begin
       Add(tmpstrs.Strings[i],ftFloat,0,False);
       end;
     end;
     tmpdataset.FieldDefs.Add('Sum',ftFloat,0,False);
     DataSource:=tdatasource.Create(Application);
     DataSource.DataSet:=tmpdataset;
     with DataSource do
     begin
       dataset:=Createtmptab(tmpdataset.FieldDefs);
       dataset.Open;
     end;
   //建立临时表
     Vdataset.First;
     for i:=0 to Vdataset.RecordCount-1 do
     begin
       rowval:=SouDataSet.fieldbyname(rowfield).AsString;
       if RowField0<>'' then  rowval0:=SouDataSet.fieldbyname(rowfield0).AsString;
       if RowField1<>'' then  rowval1:=SouDataSet.fieldbyname(rowfield1).AsString;
       if RowField2<>'' then  rowval2:=SouDataSet.fieldbyname(rowfield2).AsString;
       colval:=SouDataSet.fieldbyname(colfield).AsString;
       dataval:=SouDataSet.fieldbyname(datafield).AsString;
       if dataval='' then dataval:='0.00';
       if DataSource.DataSet.Locate(rowfield,rowval,[loPartialKey]) then
       begin
         DataSource.DataSet.Edit;
         DataSource.DataSet.FieldByName(colval).AsString:=dataval;
         DataSource.DataSet.FieldByName('Sum').AsFloat:=
         DataSource.DataSet.FieldByName('Sum').AsFloat+strtofloat(dataval);
         DataSource.DataSet.Post;
       end
       else
       begin
         DataSource.DataSet.Append;
         DataSource.DataSet.FieldByName(rowfield).AsString:=rowval;
         if RowField0<>'' then  DataSource.DataSet.FieldByName(rowfield0).AsString:=rowval0;
         if RowField1<>'' then  DataSource.DataSet.FieldByName(rowfield1).AsString:=rowval1;
         if RowField2<>'' then  DataSource.DataSet.FieldByName(rowfield2).AsString:=rowval2;

         if RowField2<>'' then
           for j:=3 to DataSource.DataSet.Fields.Count-1 do
           DataSource.DataSet.Fields[j].AsCurrency:=0
         else
         if RowField1<>'' then
           for j:=2 to DataSource.DataSet.Fields.Count-1 do
           DataSource.DataSet.Fields[j].AsCurrency:=0
         else
           for j:=1 to DataSource.DataSet.Fields.Count-1 do
           DataSource.DataSet.Fields[j].AsCurrency:=0;

         DataSource.DataSet.FieldByName(colval).AsString:=dataval;
         DataSource.DataSet.FieldByName('Sum').AsString:=dataval;
         DataSource.DataSet.Post;
       end;
       Vdataset.Next;
     end;
     result:=DataSource.DataSet;
     //生成交叉表数据集
     tmpstrs.Free;
   except

   end;
  end
  else
   showmessage('ColField Must be of Type String!') ;
 end;
end;
function UpgradeSigleFile(FileType: Integer;aFilePath,mkwjm,mkbbh: String): Boolean;
var
  FileInfo: TFileInfo;
  sendStrm,recvStrm,fileStrm: TMemoryStream;
  scktCmd: TSocketCommand;
  srvrPath: String;
begin
  result:= true;
  case FileType of
    1: SrvrPath:= 'Dll';
    2: SrvrPath:= 'Res';
    3: SrvrPath:= 'Rpt';
    4: SrvrPath:= 'Dict';
  end;

  with dm.IdFTP do
  begin
    try
    Connect(true);
    ChangeDir(xtxx.Sjml);
    ChangeDir(SrvrPath);
    try
      Get(mkwjm,aFilePath+mkwjm,true);
    except
      result:= false;
    end;
    finally
      DisConnect;
    end;
  end;
  {sendStrm:= TMemoryStream.Create;
  recvStrm:= TMemoryStream.Create;
  fileStrm:= TMemoryStream.Create;
  try
    FillChar(FileInfo.AllChar,Length(FileInfo.AllChar),0);
    CopyMemory(Addr(FileInfo.FileName),Addr(mkwjm[1]),
      Length(mkwjm));
    CopyMemory(Addr(fileInfo.FileVersion),Addr(mkbbh[1]),Length(mkbbh));
    fileInfo.FileFlag:= IntToStr(FileType)[1];
    sendStrm.Clear;
    recvStrm.Clear;
    sendStrm.WriteBuffer(STR9101,ScktCmdLen);
    sendStrm.WriteBuffer(fileInfo.AllChar,Length(fileInfo.AllChar));
    if TransPacket(sendStrm,recvStrm) then
    begin
      recvStrm.ReadBuffer(scktCmd,ScktCmdLen);
      if ScktCmd='9601' then
      begin
        sendStrm.Clear;
        sendstrm.CopyFrom(recvStrm,recvStrm.Size-4);
        UnComPressIt(sendStrm,fileStrm);
        filestrm.SaveToFile(aFilePath+mkwjm);
        result:= true;
      end
      else
        result:= false;
    end
    else
      result:= false;
  finally
    freeAndNil(sendStrm);
    freeAndNil(recvStrm);
    freeAndNil(fileStrm);
  end;}
end;
procedure Upgrade(FileType: Integer;aFilePath: String; lblInfo: TLabel);
var
  FileVer: String;
  FileList: TStringList;
  i: Integer;
  SrvrPath: String;
begin
  case FileType of
    1:
    begin
      try
        dm.IdFTP.ChangeDir(xtxx.Sjml);
        dm.IdFTP.ChangeDir('dll');
      except
      end;
    end;
    2:
    begin
      try
        dm.IdFTP.ChangeDir(xtxx.Sjml);
        dm.IdFTP.ChangeDir('Res');
      except
      end;
    end;
    3:
    begin
      try
        dm.IdFTP.ChangeDir(xtxx.Sjml);
        dm.IdFTP.ChangeDir('Rpt');
      except
      end;
    end;
    4:
    begin
      try
        dm.IdFTP.ChangeDir(xtxx.Sjml);
        dm.IdFTP.ChangeDir('dict');
      except
      end;
    end;
    6:
    begin
      try
        dm.IdFTP.ChangeDir(xtxx.Sjml);
        dm.IdFTP.ChangeDir('ini');
      except
      end;
    end;
    5,9:
    begin
      try
        dm.IdFTP.ChangeDir(xtxx.Sjml);
        dm.IdFTP.ChangeDir('sys');
      except
      end;
    end;
  end;
  try
    FileList:= TStringList.Create;
    dm.IdFTP.TransferType := ftASCII;
    dm.IdFTP.List(FileList);

    for i:= 0 to FileList.Count - 1 do
    begin
      FileList.Strings[i]:= GetRightStr(FileList.Strings[i],' ');
    end;
    dm.IdFTP.TransferType := ftBinary;
    with dm.Cds_Mst do
    begin
      dm.Cds_Mst.First;
      while not eof do
      begin
        case FileType of
          3,4:
          begin
            if not FileExists(aFilePath+FieldByName('mkwjm').AsString) then
              FileVer:= '0'
            else
              FIleVer:= FieldByName('mkbbh').AsString;
          end;
        else
          FileVer:= GetFileVersion(PChar(aFilePath+FieldByName('mkwjm').AsString));
        end;
        if FileList.IndexOf(FieldByName('mkwjm').AsString) >= 0 then
        begin
          lblInfo.Caption:= '正在下载'+FieldByName('mkwjm').AsString+'…';
          dm.IdFTP.Get(FieldByName('mkwjm').AsString,aFilePath+FieldByName('mkwjm').AsString,true);
        end;
        next;
      end;
    end;
  finally
    dm.IdFTP.ChangeDir('..');
    dm.IdFTP.ChangeDir('..');
    FreeAndNil(FileList);
  end;
end;
procedure DllUpgrade(FileType: Integer;aFilePath,ZxtDm: String; lblInfo: TLabel);
var
  DllFile: String;
begin

  with dm.Cds_Mst do
  begin
    Close;
    CommandText:= 'select mkwjm,mkbbh from xt_xt_wjbbl_View where wjlxm='+IntToStr(FileType)
      +' and zxtdm ='+Zxtdm;
    Open;
    if not DirectoryExists(aFilePath) then
    begin
      CreateDir(aFilePath);
      Upgrade(FileType,aFilePath, lblInfo);
      exit;
    end;
    (*检查文件版本*)
    First;
    while not eof do
    begin
      DllFile:= aFilePath+FieldByName('mkwjm').AsString;
      if FileExists(DllFile) and (CompareStr(GetFileVersion(PChar(DllFile)),
        FieldByName('mkbbh').AsString) = 0) then
        Delete
      else
        next;
    end;
    if RecordCount > 0 then
    begin
      Upgrade(FileType,aFilePath,lblInfo);
    end;
    dm.Cds_Mst.Close;
  end;
end;
procedure NODllUpgrade(FileType: Integer;aFilePath,LocalXml,ZxtDm: String; LblInfo: TLabel);
var
  DllFile: String;
  XmlFile: String;
begin

  xmlFile:= aFilePath+LocalXml;
  with dm.Cds_Mst do
  begin
    Close;
    CommandText:= 'select mkwjm,mkbbh from xt_xt_wjbbl_View where wjlxm='+IntToStr(FileType)
      +' and zxtdm ='+Zxtdm;
    Open;
    if not DirectoryExists(aFilePath) then
    begin
      CreateDir(aFilePath);
      SaveToFile(xmlFile,dfxml);
      Upgrade(FileType,aFilePath,lblInfo);
      exit;
    end;
    if not FileExists(XmlFile) then
    begin
      SaveToFile(xmlFile,dfxml);
      Upgrade(FileType,aFilePath,lblInfo);

      exit;
    end;
    try
      dm.Cds_Local.LoadFromFile(xmlFile);
    except
      Upgrade(FileType,aFilePath,lblInfo);
      exit;
    end;
    (*检查文件版本*)
    First;
    while not eof do
    begin
      if dm.Cds_Local.Locate('mkwjm',FieldByName('mkwjm').AsString,[]) then
      begin
        if (CompareStr(dm.Cds_Local.FieldByName('mkbbh').AsString,FieldByName('mkbbh').AsString)=0)
          and (FileExists(aFilePath+FieldByName('mkwjm').AsString)) then
          Delete
        else
          next;
      end
      else
        next;
    end;
    if RecordCount > 0 then
    begin
      Upgrade(FileType,aFilePath,lblInfo);
      dm.Cds_Mst.SaveToFile(xmlFile,dfxml);
    end;
    dm.Cds_Local.Close;
    dm.Cds_Mst.Close;
  end;
end;
function CheckSysUpgrade(FileType: Integer;aFilePath, ZxtDm: String): Boolean;
var
  DllFile: String;
  StrVer: String;
begin
  result:= false;  
  with dm.Cds_Mst do
  begin
    Close;
    CommandText:= 'select mkwjm,mkbbh from xt_xt_wjbbl_View where wjlxm='+IntToStr(FileType)
      +' and zxtdm ='+Zxtdm;
    Open;
    (*检查文件版本*)
    First;
    while not eof do
    begin
      DllFile:= aFilePath+FieldByName('mkwjm').AsString;
      StrVer:= GetFileVersion(DllFile);
      if FileExists(DllFile) and (CompareStr(StrVer,
        FieldByName('mkbbh').AsString) = 0) then
        Delete
      else
        next;
    end;
    if RecordCount> 0 then
      result:= true;
  end;
  
end;
function GetSubSysIntf: Boolean;
begin
  result:= true;
  with dm.Cds_Mst do
  begin
    Close;
    CommandText:= 'select Zxtmc,Zxtlx from Xt_xt_Zxtmd where zxtdm='+xtxx.Zxtdm;
    Open;
    if RecordCount = 0 then
    begin
      result:= false;
      exit;
    end;
    xtxx.Zxtmc:= Copy(FieldByName('Zxtmc').AsString,1,30);
    xtxx.Zxtlx:= FieldByName('zxtlx').AsInteger;
    Close;
  end;
end;
function TransPacket(aSendStrm: TMemoryStream;
  var arecvStrm: TMemoryStream): Boolean;
var
  sndSckt: TWinSocketStream;
  BytesRead: Integer;
  ReceiveBuffer: Array[0..4095] of Char;
begin
  result:= true;
  try
    dm.CltSckt.Open;
    sndSckt:= TWinSocketStream.Create(dm.CltSckt.Socket,6000);
    Try
        sndSckt.CopyFrom(aSendStrm, 0);
        if sndSckt.WaitForData(6000) then
        Repeat
          BytesRead:= sndSckt.Read(ReceiveBuffer,SizeOf(ReceiveBuffer));
          if BytesRead = 0 then
            dm.CltSckt.Close
          else
            aRecvStrm.WriteBuffer(ReceiveBuffer,BytesRead);
        until not sndSckt.WaitForData(2000);
        aRecvStrm.Position:=0;
    Finally
      dm.CltSckt.Close;
      sndSckt.Free;
    End;
  except
    result:= false;
  end;

end;
function ExpXmlDict(Cds_Dict: TClientDataSet;Zxtdm,mkwjm,mkbbh,wjlxm,mkmc: String): Boolean;
var
  fileStrm: TMemoryStream;
  SendStrm: TMemoryStream;
  RecvStrm: TMemoryStream;
  FileInfo: TFileInfo;
  scktCmd: TSocketCommand;
begin
  result:= true;
  with dm.Cds_Com do
  begin
    Close;
    DataRequest('XT_DCZD');
    FetchParams;
    Params.ParamByName('iZxtdm').AsString:= zxtdm;
    Params.ParamByName('imkwjm').AsString:= mkwjm;
    Params.ParamByName('imkbbh').AsString:= mkbbh;
    Params.ParamByName('iWjlxm').AsString:= wjlxm;
    Params.ParamByName('iMkmc').AsString:= mkmc;
    Params.ParamByName('iPym').AsString:= GetSpellCode(PChar(mkmc),4,10);
    Execute;
    if Params.ParamByName('oErrCode').AsInteger <> 0 then
    begin
      result:= false;
      exit;
    end;
  end;
  try
    fileStrm:= TMemoryStream.Create;
    dm.IdFTP.Connect(true);
    dm.IdFTP.ChangeDir(xtxx.Sjml);
    dm.IdFTP.ChangeDir('Dict');
    try
      cds_Dict.SaveToStream(fileStrm,dfxml);
      dm.IdFTP.Put(fileStrm,mkwjm);
    except
      result:= false;
    end;
  finally
    dm.IdFTP.ChangeDir('..');
    dm.IdFTP.ChangeDir('..');
    dm.IdFTP.Disconnect;
    FreeAndNil(fileStrm);
  end;
  {fileStrm:= TMemoryStream.Create;
  SendStrm:= TMemoryStream.Create;
  RecvStrm:= TMemoryStream.Create;
  FillChar(FileInfo.AllChar,SizeOf(FileInfo.AllChar),0);
  CopyMemory(Addr(FileInfo.FileName),Addr(mkwjm[1]),Length(Mkwjm));
  try
    SendStrm.WriteBuffer('9102',4);
    SendStrm.WriteBuffer(FileInfo.AllChar,Length(FileInfo.AllChar));
    Cds_Dict.SaveToStream(fileStrm,dfxml);

    CompressIt(fileStrm,clMax);
    fileStrm.Position:= 0;
    SendStrm.CopyFrom(fileStrm,fileStrm.Size);
    TransPacket(SendStrm,RecvStrm);
    recvStrm.ReadBuffer(scktCmd,ScktCmdLen);
    if ScktCmd<>'9701' then
      result:= false;
  finally
    freeAndNil(SendStrm);
    freeAndNil(RecvStrm);
    freeAndNil(fileStrm);
  end;}

end;
function ExpDictXmlDict(zxtdm,zdbm,zdmc: String; const blBuildSpell: Boolean): Boolean;
var
  StrCode,StrName,StrInput_Code: String;
  iInput_code: Integer;
  AutoExport: SmallInt;
  StrQtzd: String;
begin
  with TINIFile.Create(exePath+'Brain.ini') do
  begin
    AutoExport:= readInteger('软件','autoexport',0);
    Free;
  end;
  with dm.Cds_Exp do
  begin
    Close;
    CommandText:= 'select zdm,ssrm,lxcd from xt_xt_zdmsb where zdbs='
      +'(select zdbs from xt_xt_zdzwd where zdbm='''+UpperCase(zdbm)+''')'
      +' and SSRM in (''1'',''2'',''3'',''4'')'+' order by SSRM';
    Open;
    if not Locate('SSRM','1',[]) then
    begin
      result:= false;
      exit;
    end;
    StrInput_Code:= FieldBYName('zdm').AsString;
    iInput_code:= FieldByName('lxcd').AsInteger;
    if not Locate('SSRM','2',[]) then
    begin
      result:= false;
      exit;
    end;
    StrCode:= FieldBYName('zdm').AsString;
    if not Locate('SSRM','3',[]) then
    begin
      result:= false;
      exit;
    end;
    StrName:= FieldByName('zdm').AsString;
    Filter:='[ssrm]=''4''';
    Filtered:= true;
    StrQtzd:= '';
    if RecordCount > 0 then
    begin
      First;
      while not eof do
      begin
        StrQtzd:= StrQtzd+','+FieldByName('zdm').AsString;
        next;
      end;
    end;
    filter:= '';
    filtered:= false;
    if RecordCount < 3 then
    begin
      result:= false;
      exit;
    end;
    if AutoExport = 1 then
    begin
      if Application.MessageBox('需要导出数据字典吗？','提示信息',MB_ICONInformation+MB_YESNO+MB_DEFBUTTON1)=ID_NO then
      begin
        result:= false;
        exit;
      end;
    end;

    Close;
    CommandText:= 'select '+StrCode+' as Code,'+StrName+' as Name,'+StrInput_Code
      +' as Input_Code'+StrQtzd+' from '+ZDBM +' order by '+StrInput_Code;
    Open;
    if blBuildSpell then
    begin
      Filtered:= true;
      Filter:= '[input_code] is null ';
      First;
      while not eof do
      begin
        Edit;
        FieldByName('Input_code').AsString:= GetSpellCode(PChar(FieldByname('name').AsString),4,iInput_code);
        Next;
      end;
    end;
    Filtered:= false;
    Filter:= '';
    SaveToFile(ExePath+'Dict\'+zdbm+'.xml');
    result:= ExpXMLDict(dm.Cds_Exp,zxtdm,zdbm+'.xml','','4',zdmc);
    Close;

  end;
end;
function ShowDictIpt(ADpt: TDictIpt;var Aedt_com: TWinControl;
    AFileName: String;var aCode: String; AScreen:TScreen;
    const AFilter: String=''): Boolean;
begin
  result:= true;
  if AFileName<>'' then
  begin
    if not FileExists(AFileName) then
    begin
      result:= false;
      exit;
    end;
  end;
  with ADpt do
  begin
    Filter:= AFilter;
    EdtCom:= AEdt_Com;
    TxtFileName:= AFileName;
    Show(true,Ascreen.Height - ADpt.FormHeight-30,AScreen.Width-Adpt.FormWidth);
    if isESCQuit then
    begin
      TFlatSelEdit(AEdt_Com).Text:= '';
      result:= false;
      exit;
    end;
    aCode:= Code;
  end;
end;
procedure CopyArr(var Dest: array of Char; const Source: String;
  AFillChar: Char; const DotStart: Integer; const isDot: Boolean);
var
  i: Integer;
  iDec: Integer;
  ASource: String;
  ADot: Integer;
  RZero: Integer;
begin
  ASource:= Trim(Source);
  if DotStart > 0 then
  begin
    ASource:= Trim(Format('%12.'+IntToStr(DotStart)+'f',[StrToFloat(Source)]));
    if not isDot then
    begin
      Delete(ASource,Pos('.',ASource),1);
    end;
  end;
  iDec:= High(Dest)-Length(ASource)+1;

  RZero:= 0;
  if DotStart>0 then
  begin
    for i := 1 to Length(ASource) do
      if ASource[i] = '0' then
        Inc(RZero)
      else
        Break;
  end;
  if RZero> 0 then
  begin
    ASource:= RightStr(ASource,Length(ASource)-RZero);
    Inc(IDec,RZero);
  end;
  if (ASource='') and (DotStart> 0) then
  begin
    ASource:= '0';
    Dec(iDec);
  end;
  if DotStart=0 then
  begin
    FillChar(Dest,High(Dest)+1,Ord(AFillChar));
    if Length(ASource)>High(Dest)+1 then
    begin
      if ByteType(ASource,High(Dest)+1)=mbLeadByte then
      begin
        for i:= 0 to High(Dest)-1 do
          Dest[i]:= ASource[i+1];
      end
      else
      begin
        for i:= 0 to High(Dest) do
          Dest[i]:= ASource[i+1];
      end;
    end
    else
    begin
      for i:= 0 to Length(ASource)-1 do
        Dest[i]:= ASource[i+1];
    end;
  end
  else
  begin
    FillChar(Dest,iDec,Ord(AFillChar));
    for i:= 0 to Length(ASource)-1 do
      Dest[i+iDec]:= ASource[i+1];
  end;
end;
procedure GetCellRectU(var ARect: TRect;Sender : TObject);//得到控件坐标
var
  ACol, ARow : Longint;
begin
  ACol := (Sender as TDBGridEh).Col;
  ARow := (Sender as TDBGridEh).Row;
  ARect := (Sender as TDBGridEh).CellRect(ACol,ARow);
  OffsetRect(ARect,(Sender as TDBGridEh).Left-1 ,(Sender as TDBGridEh).Top-1);
end;
procedure SetPositionU(ARect : TRect;Com : TWinControl);//设置控件坐标
var
  W1, H1 : Longint;
begin
  //SetVisible(Com);
  W1 := ARect.Right - ARect.Left;
  H1 := ARect.Bottom - ARect.Top;
  TWinControl(Com).Top := ARect.Top+2;
  TWinControl(Com).Left := ARect.Left+2;
  TWinControl(Com).Width := w1;
  TWinControl(Com).Height := h1;
  TWinControl(Com).BringToFront;
  TWinControl(Com).Visible := true;
  TWinControl(Com).SetFocus;

end;

function GetSysIntf(IniFile: String): TSysIntf;
begin
  with TINIFIle.Create(IniFile) do
  begin
    result.zjIP:= readString('服务器','ServerIP','');
    result.SjIP:= readString('服务器','UpgradeIP','');
    result.sjyh:= readString('服务器','Upgradeuser','');
    result.sjml:= ReadString('服务器','UpgradePath','');
    result.sjmm:= DecryStrHex(readString('服务器','Upgradepass',''),PassKey);
    result.Zxtdm:= readString('系统','SubSysID','0');
    result.DllPath:= readString('系统','PlugInPath' ,'');
    result.ResPath:= readString('系统','ResourcePath','');
    result.DictPath:= readString('系统','DictPath','');
    result.RptPath:= readString('系统','ReportPath','');
    result.Zxtdm:= DecryStrHex(result.Zxtdm,PassKey);
    result.Zxtbm:= readString('软件','WorkUnit','');
    result.Preview:= readInteger('软件','Preview',1);
    result.AutoShowDpt:= readInteger('软件','autoshowdpt',0);
    Free;
  end;
end;
function GetUserDept: Boolean;
begin
  result:= true;
  with dm.Cds_Mst do
  begin
    case xtxx.Zxtlx of
      1..3:  //药品管理系统
      begin
        Close;
        CommandText:= 'select zdm from xt_zd_gzyfz where rybh in ('
          +'select rybh from xt_zd_gzry where bxtyh='''+yhxx.yhdm+''')';
        Open;
        if not Locate('zdm',xtxx.Zxtbm,[]) then
        begin
          result:= false;
          exit;
        end;
        Close;
        CommandText:= 'select kfxz,dwmc,Pdbz,to_char(Zhpdj,''yyyy-mm-dd'') as pdsj,'
         +'yxfkc,Tjdbz'
         +' from Yp_zd_kcdw where dwdm='''
          +xtxx.Zxtbm+'''';
        Open;
        if RecordCount = 0 then
        begin
          result:= false;
          exit;
        end;
        xtxx.bmmc:= FieldByName('dwmc').AsString;
        LevelCurrency:= FieldByName('tjdbz').AsInteger;
        negativestock:= FieldByName('yxfkc').AsInteger;
        CheckStorage:= FieldByName('Pdbz').AsString[1];
        LastChkDate:= FieldByName('pdsj').AsString;
        if FieldByName('kfxz').AsString='药库库房' then
        begin
          StorageLevel:= 1;
          StorageType:= 1;
          
        end
        else if FieldBYName('kfxz').AsString='门诊药房' then
        begin
          StorageLevel:= 2;
          StorageType:= 2;
        end
        else if FieldByName('kfxz').AsString='中心药房' then
        begin
          StorageLevel:= 2;
          StorageType:= 3;
        end;
      end;
    else
      xtxx.Zxtbm:= yhxx.yhbm;
      case StrToInt(xtxx.Zxtdm) of
        9: //护士工作站
        begin
          Close;
          CommandText:= 'select a.yhbm,b.ksmc,b.lckssx,b.nwkbz from xt_xt_yhjl a,xt_zd_ks b where a.yhbm=b.ksdm and yhbs='''+yhxx.yhbs+'''';
          Open;
          if FieldByName('lckssx').AsString <> '2' then
          begin
            result:= false;
            exit;
          end;
          xtxx.bmmc:= FieldByName('ksmc').AsString;
          //xtxx.NWKBZ:= FieldByName('nwkbz').AsString;
        end;
        10:   //医生工作站
        begin
          Close;
          CommandText:= 'select a.yhbm,b.ksmc,b.lckssx,b.mzbz from xt_xt_yhjl a,xt_zd_ks b where a.yhbm=b.ksdm and yhbs='''+yhxx.yhbs+'''';
          Open;
          if (FieldByName('lckssx').AsString <> '0') or
            ((FieldByName('mzbz').AsString <>'1') and (FieldByName('mzbz').AsString<>'2')) then
          begin
            result:= false;
            exit;
          end;
          xtxx.bmmc:= FieldByName('ksmc').AsString;
        end;
        12:  //手术室计价
        begin
          Close;
          CommandText:= 'select a.yhbm,b.ksmc,b.lckssx,b.mzbz,b.nwkbz from xt_xt_yhjl a,xt_zd_ks b where a.yhbm=b.ksdm and yhbs='''+yhxx.yhbs+'''';
          Open;
          if (FieldByName('NWKBZ').AsString <> '2') then
          begin
            result:= false;
            exit;
          end;
          xtxx.bmmc:= FieldByName('ksmc').AsString;
          //xtxx.NWKBZ:= FieldByName('nwkbz').AsString;
        end;
      end;
    end;
    Close;
  end;
end;
function GetPluginIndex(aItemCode: String): Integer;
var
  i: Integer;
begin
  result:= 0;
  for i:= 0 to PluginList.Count - 1 do
  begin
    if TPlugin(PluginList.Items[i]).PluginIntf.ItemCode=aItemCode then
    begin
      result:= i+1;
      break;
    end;
  end;
end;
function GetYpslFromBz(Cds: TClientDataSet): Integer;
var
  Bzsl: Integer;
begin
  Bzsl:= 1;
  with Cds do
  begin
    if FieldByName('nhbz1').AsInteger > 0 then
      Bzsl:= FieldByName('nhbz1').AsInteger;
    if FieldByName('nhbz2').AsInteger > 0 then
      Bzsl:= Bzsl*FieldByName('nhbz2').AsInteger;
  end;
  result:= bzsl;

end;
function GetSpeedChar(var index: Integer): String;
begin
  if index > Length(StrInput) then
    result:= ''
  else
    result:= StrInput[Index];
  inc(index);
end;
function GetComXY(Com: TControl): TPoint;
var
  P1: TPoint;
begin
  P1.X:= Com.Left+Com.Width;
  P1.Y:= COm.Top+Com.Height;
  result:= P1;
end;
procedure SetComXy(var Com: TWinControl; Pi: TPoint);
begin
  with Com do
    SetBounds(pi.X-Width-4,pi.Y-Height-4,Width,Height);
end;
function GetRejectSum(rSum: real; StrMode: String): real;
var
  r1, r2: Real;
begin
  r1:= StrToFloat(FormatFloat('0.00',rSum));
  r2:= StrToFloat(FormatFloat(StrMode,rSum+0.001));
  result:= r2-r1;
end;
function IncRcpt_NO(StrOldRcpt_NO: String; Const StrWin_NOLen: Integer): String;
var
  Strtmp: String;
begin
  Strtmp:= RightStr(StrOldRcpt_NO,Length(StrOldRcpt_NO)-StrWin_NOLen);
  Strtmp:= IntToStr(StrToIntDef(StrTmp,0)+1);
  result:= LeftStr(StrOldRcpt_NO,StrWin_NOLen)+LeftPad(StrTmp,Length(StrOldRcpt_NO)-StrWin_NOLen);
end;
function LeftPad(StrSource: String; iLen: Integer): String;
var
  i: Integer;
begin
  result:= StrSource;
  for i:= 1 to iLen-Length(StrSource) do
    result:= '0'+result;
end;
function OpenClientDataSet(Cds: TClientDataSet; StrSQL: WideString): Boolean;
begin
  result:= true;
  try
    with Cds do
    begin
      Close;
      CommandText:= StrSQL;
      Open;
    end;
  except
    result:= false;
  end;
end;
procedure CloseCds;
var
  i: Integer;
begin
  for i:= 0 to dm.ComponentCount - 1 do
  begin
    if dm.Components[i] is TClientDataSet then
    with TClientDataSet(dm.Components[i]) do
    begin
      Close;
      Filtered:= false;
      Filter:= '';
      AfterScroll:= nil;
      AfterPost:= nil;
      AfterEdit:= nil;
      AfterDelete:= nil;
      BeforeScroll:= nil;
      BeforePost:= nil;
      BeforeDelete:= nil;
      BeforeEdit:= nil;
      //OnReconcileError:= nil;
      IndexName:= '';
    end;
  end;
end;
function GetChar(Str: String): String;
var
  i: Integer;
begin
  result:= '';
  for i:= 1 to Length(Str) do
    if (Str[i]>='0') and (Str[i]<='9') then
      Continue
    else
    begin
      result:= RightStr(Str,Length(Str)-i+1);
      break;
    end;
end;
procedure CloseIME(AHandle: THandle);
var
  myhkl:hkl;
begin
  myhkl:=GetKeyBoardLayOut(0);

  if ImmIsIME(myhkl) then
  //判断是否在中文状态,若是则关闭它
  immsimulateHotkey(AHandle,
  IME_CHotKey_IME_NonIME_Toggle);
end;
procedure OpenIme(imename:string);
var
  I:integer;             
  myhkl:hkl;
begin
  if ImeName<>'' then
  begin
    if Screen.Imes.Count<>0 then
    begin
      I:=screen.Imes.indexof(imename);
      if I>=0 then
        myhkl:=hkl(screen.Imes.objects[i]);
      activatekeyboardlayout(myhkl,
      KLF_ACTIVATE);//设置相应的输入法
    end;
  end; 
end;
function GetRightStr(Str,SubStr: String): String;
var
  i: Integer;
begin
  result:= '';
  for i:= Length(Str) downto 1 do
  begin
    if Str[i]=substr then
      break;
    result:= Str[i]+result;
  end;
end;
procedure SetClientDataSetStatus(Cds: TClientDataSet);
begin
  with cds do
  begin
    if (State <> dsEdit) or (State <> dsInsert) then
      Edit;
  end;
end;
function CdsUpdate(cdsArr: Array of TClientDataSet;
    TblArr: Array of String; var ErrStr: String): Boolean;
var
  OleData: Array of OleVariant;
  OleTable: Array of OleVariant;
  v1,v2: OleVariant;
  iOle, iErr: Integer;
  i: Integer;
begin
  result:= true;
  iOle:= 1;
  for i:= Low(cdsArr) to High(cdsArr) do
  begin
    if cdsArr[i].ChangeCount > 0 then
    begin
      SetLength(OleData,iOle);
      SetLength(OleTable,iOle);
      OleData[iOle-1]:= cdsArr[i].Delta;
      OleTable[iOle-1]:= tblArr[i];
      inc(iOle);
    end;
  end;
  if iOle = 1 then exit;
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
    4:
    begin
      v1:= VarArrayCreate([0,2],varVariant);
      v2:= VarArrayCreate([0,2],varVariant);
    end;
    5:
    begin
      v1:= VarArrayCreate([0,3],varVariant);
      v2:= VarArrayCreate([0,3],varVariant);
    end;
    6:
    begin
      v1:= VarArrayCreate([0,4],varVariant);
      v2:= VarArrayCreate([0,4],varVariant);
    end;
    7:
    begin
      v1:= VarArrayCreate([0,5],varVariant);
      v2:= VarArrayCreate([0,5],varVariant);
    end;
  end;
  for iErr:= Low(OleData) to High(OleData) do
  begin
    v1[iErr]:= OleData[iErr];
    v2[iErr]:= OleTable[iErr];
  end;
  dm.SockConn.AppServer.Updates(v1,v2,0,iErr,errStr);
  if iErr=0 then
  begin
    for i:= Low(CdsArr) to High(CdsArr) do
    begin
      if CdsArr[i].ChangeCount > 0 then
      begin
        cdsArr[i].MergeChangeLog;
        cdsArr[i].Refresh;
      end;
    end;
  end
  else
    result:= false;

end;
function GetSQN(ILx: String; const iCnt: Integer):String;
begin
  with dm.Cds_Com_SQN do
  begin
    Close;
    DataRequest('XT_XT_GETSQN');
    FetchParams;
    Params.ParamByName('ILx').AsString:= ILx;
    Params.ParamByName('ICnt').AsInteger:= iCnt;
    Execute;
    result:= Params.ParamByName('ISQN').AsString;
  end;
end;
function GetXH(ILx: String; var Strxtsj: String; const iCnt: Integer = 1; Const Strdwdm: String=''):String;
begin
  with dm.Cds_Com_SQN do
  begin
    Close;
    DataRequest('xt_getxh');
    FetchParams;
    Params.ParamByName('ILx').AsString:= ILx;
    Params.ParamByName('Isl').AsInteger:= iCnt;
    Params.ParamByName('IDwdm').AsString:= Strdwdm;
    Execute;
    result:= Params.ParamByName('Ixh').AsString;
    StrXtsj:= Params.ParamByName('IXtsj').AsString;
  end;
end;
function GetGhXh(ILx, StrHb, StrMzsjms, StrMzrq: String; var Strxtsj, StrHbxh, StrErr: String; const iCnt: Integer = 1):String;
begin
  with dm.Cds_Com_SQN do
  begin
    Close;
    DataRequest('xt_getxh');
    FetchParams;
    Params.ParamByName('ILx').AsString:= ILx;
    Params.ParamByName('Isl').AsInteger:= iCnt;
    Params.ParamByName('IDwdm').AsString:= StrHb;
    Params.ParamByName('IMzsjms').AsString:= StrMzsjms;
    Params.ParamByName('Ighrq').AsString:= StrMzrq;
    Execute;
    result:= Params.ParamByName('Ixh').AsString;
    StrXtsj:= Params.ParamByName('IXtsj').AsString;
    StrHbxh:= Params.ParamByName('Ihbxh').AsString;
    StrErr:= Params.ParamByName('ErrStr').AsString;
  end;
end;
function ArrToFloat(Arr: Array of Char;DotStart: Integer): real;
var
  i, iLen: Integer;
  tmpStr: String;
begin
  TmpStr:= Arr;
  iLen:= High(Arr) - Low(Arr) + 1;
  TmpStr:= trim(TmpStr);
  for i:= 1 to iLen do
    tmpStr:= '0'+tmpStr;
  Insert('.',tmpStr,Length(tmpStr)-DotStart+1);
  result:= StrToFloat(TmpStr);
end;
function ArrToFloat(Arr: String;DotStart: Integer):real;
var
  i, iLen: Integer;
  tmpStr: String;
begin
  TmpStr:= Arr;
  iLen:= Length(TmpStr);
  TmpStr:= trim(TmpStr);
  if tmpStr[1]<>'-' then
  for i:= 1 to iLen do
    tmpStr:= '0'+tmpStr;
  Insert('.',tmpStr,Length(tmpStr)-DotStart+1);
  result:= StrToFloat(TmpStr);
end;
function SplitNumStr(var Str: String): Boolean;
Const
    StrPos : String ='0123456789,-';
var
  i, iPos: Integer;
  Str1,Str2, Str3, Str4: String;
begin
  Result:= true;
  for i:= 1 to Length(Str) do
  begin
    if Pos(Str[i],StrPos)=0 then
    begin
      break;
      result:= false;
      exit;
    end;
  end;
  Str1:= Str;
  Str2:= '';
  Str:= '';
  while Length(Str1) > 0 do
  begin
    iPos:= Pos(',',Str1);
    if iPos = 1 then
    begin
      result:= false;
      Break;
      exit;
    end;
    if iPos > 0 then
    begin
      Str2:= LeftStr(Str1,iPos);
      Delete(Str1,1,iPos);
    end
    else
    begin
      Str2:= Str1+',';
      Str1:= '';
    end;
    iPos:= Pos('-',Str2);
    if  iPos = 0 then
      Str:= Str+Str2
    else
    begin
      Str3:= LeftStr(Str2,iPos-1);
      Str4:= RightStr(Str2,Length(Str2)-iPos);
      Str4:= LeftStr(Str4,Length(Str4)-1);
      if (Str3='') or (Str4='') then
      begin
        Str:= '';
        result:= false;
        Break;
        exit;
      end;
      if StrToInt(Str3)>= StrToInt(Str4) then
        Break;
      i:= StrToInt(Str3);
      while i <= StrToInt(Str4) do
      begin
        Str:= Str+IntToStr(i)+',';
        Inc(i);
      end;
    end;
  end;
end;
function GetFieldName(Str: String): String;
var
  Strtmp: String;
begin
  StrTmp:= '';
  StrTmp:= RightStr(Str,length(Str)-Pos('''',Str));
  StrTmp:= LeftStr(StrTmp,Pos('''',StrTmp)-1);
  result:= StrTmp;
end;
procedure CbxItemAdd(cbx_Item: TFlatComboBoxCode; cds: TClientDataSet;
  StrName,StrCode: String; const blCodeInput: Boolean);
var
  i: Integer;
begin
  with cds do
  begin
    First;
    i:= 1;
    while not eof do
    begin
      if not blCodeInput then
        cbx_item.ItemInput.Add(GetSpeedChar(i))
      else
        cbx_item.ItemInput.Add(FieldByName(StrCode).AsString);
      cbx_item.ItemCodes.Add(FieldByName(StrCode).AsString);
      cbx_item.Items.Add(FieldByName(StrName).AsString);

      next;
    end;
  end;
end;
procedure CbxItemAdd(cbx_Item: TComboBoxCode; cds: TClientDataSet;
  StrName,StrCode: String; const blCodeInput: Boolean);
var
  i: Integer;
begin
  with cds do
  begin
    First;
    i:= 1;
    while not eof do
    begin
      if not blCodeInput then
        cbx_item.ItemInput.Add(GetSpeedChar(i))
      else
        cbx_item.ItemInput.Add(FieldByName(StrCode).AsString);
      cbx_item.ItemCodes.Add(FieldByName(StrCode).AsString);
      cbx_item.Items.Add(FieldByName(StrName).AsString);

      next;
    end;
  end;
end;
function SetIDCardEdit(StrSfz: String): String;
begin
  Result:= Copy(StrSfz,1,6)+'-'+Copy(StrSfz,7,8)+'-'+Copy(StrSfz,15,8);
end;
procedure AdjustDropDownForm(AControl : TControl; HostControl: TControl);
var
   WorkArea: TRect;
   HostP, PDelpta: TPoint;
begin                          //设置下拉窗口位置。
{$IFDEF CIL}
   SystemParametersInfo(SPI_GETWORKAREA,0,@WorkArea,0);
{$ELSE}
   SystemParametersInfo(SPI_GETWORKAREA,0,@WorkArea,0);
{$ENDIF}

  // WorkArea:=HostControl.Parent.ClientRect;
  // HostP := HostControl.ClientToParent(Point(0,0));
   HostP := HostControl.ClientToScreen(Point(0,0));
   PDelpta := AControl.ClientToScreen(Point(0,0));

   AControl.Left := HostP.x-2;
   AControl.Top := HostP.y + HostControl.Height-3;

   if (AControl.Width > WorkArea.Right - WorkArea.Left) then
     AControl.Width := WorkArea.Right - WorkArea.Left;

   if (AControl.Left + AControl.Width > WorkArea.Right) then
     AControl.Left := WorkArea.Right - AControl.Width;
   if (AControl.Left < WorkArea.Left) then
     AControl.Left := WorkArea.Left;


   if (AControl.Top + AControl.Height > WorkArea.Bottom) then
   begin
     if (HostP.y - WorkArea.Top > WorkArea.Bottom - HostP.y - HostControl.Height)
     then
       AControl.Top := HostP.y - AControl.Height;
   end;

   if (AControl.Top < WorkArea.Top) then
   begin
     AControl.Height := AControl.Height - (WorkArea.Top - AControl.Top);
     AControl.Top := WorkArea.Top;
   end;

   if (AControl.Top + AControl.Height > WorkArea.Bottom) then
   begin
     AControl.Height := WorkArea.Bottom - AControl.Top;
   end;

end;

function SetSrvrTime(StrSysdate: String): Boolean;
var
  st: SystemTime;
  strsj: String;
begin
  strsj:= formatDateTime('yyyymmddhhmmss',StrToDateTime(StrSysdate));
  try
    result:= true;
    St.wYear:= StrToInt(Copy(strsj,1,4));
    St.wMonth:= StrToInt(Copy(strsj,5,2));
    St.wDay:= StrToInt(Copy(strsj,7,2));
    St.wHour:= STrToInt(Copy(strsj,9,2));
    St.wMinute:= STrToInt(Copy(strsj,11,2));
    St.wSecond:= STrToInt(Copy(strsj,13,2));
    St.wMilliseconds:= 0;
    SetLocalTime(St);
  except
    result:= false;
  end
end;
function Get_Brzf(StrYbbz, StrGrdnh, Strzyh: String; var ErrStr: String; Const strybkbb: String='0'): TBrzfcx;
var
  DueMst_Xnh: TDueMst_XNH;
  DueMst: TDueMst;
  DueMst_ex: TDueMst_ex;
  DueRst: TDueRst;
  iRst: Integer;
begin
  with Result do
  begin
    grzf:= 0;
    tczf:= 0;
    qfx:= 0;
    Jrdb:= 0;
    gwybt:= 0;
  end;
  if StrYbbz='1' then
  begin
    if StrYbkbb='0' then
    begin
      with dueMst do
      begin
        CopyArr(grdnh,StrGrDnh,' ');
        CopyArr(zyh,Strzyh,' ');
      end;
      iRst:= His_Due(PChar(HisID),Addr(DueMst.MstInfo[0]),Addr(DueRst.MstInfo[0]));
    end
    else
    begin
      with dueMst_ex do
      begin
        CopyArr(grdnh,StrGrDnh,' ');
        CopyArr(zyh,Strzyh,' ');
        CopyArr(cysj,FormatDateTime('yyyymmddhhmmss',Now),' ');
      end;
      iRst:= His_Due(PChar(HisID),Addr(DueMst_ex.MstInfo[0]),Addr(DueRst.MstInfo[0]));
    end;
  end
  else
  begin
    with dueMst_Xnh do
    begin
      CopyArr(grdnh,StrGrDnh,' ');
      CopyArr(zyh,StrZyh,' ');
    end;
    iRst:= His_Due(PChar(HisID),Addr(DueMst_Xnh.MstInfo[0]),Addr(DueRst.MstInfo[0]));
  end;
  if iRst=1 then
  begin
    ErrStr:= '';
    with Result do
    begin
      grzf:= ArrToFloat(DueRst.grzf,4);
      tczf:= ArrToFloat(DueRst.tczf,4);
      qfx:= ArrToFloat(DueRst.qfx,4);
      Jrdb:= ArrToFloat(DueRst.jrdb,4);
      gwybt:= ArrToFloat(DueRst.gwybz,4);
    end;
  end
  else
    ErrStr:= Get_InsurInfo(iRst);
end;
function Get_Hzzf(Str: String): String;
var
  i: Integer;
  AStr: String;
begin
  AStr:= Str;
  Result:= '';
  while length(AStr)>0 do
  begin
    if ByteType(AStr,1)= mbSingleByte then
    begin
      Result:= Result+LeftStr(AStr,1);
      AStr:= Copy(AStr,2,Length(AStr)-1);
    end
    else
    begin
      Result:= Result+'A'+LeftStr(AStr,2);
      AStr:= Copy(AStr,3,Length(AStr)-2);
    end;
  end;
end;
procedure ReadSrvrXml(StrDepot: String);
begin
  if (xtxx.Zxtdm='8') or (xtxx.Zxtdm='9') or (xtxx.Zxtdm='12') then
  begin
    with dm.Cds_Com do
    begin
      Close;
      DataRequest('xt_fy_cxjb_mc');
      FetchParams;
      Params.ParamByName('Ilx').AsString:= '2';
      Params.ParamByName('Ikf').AsString:= StrDepot;
      Open;
      SaveToFile(exepath+'Dict\yfypzd.xml',dfxml);
    end;
  end;
end;
function Get_Round(r: Real; Len: Integer): Real;
var
  Str: String;
  StrZs: String;
  Strxs: String;
begin
  Str:= formatFloat('0.00000000',r);
  StrXs:= RightStr(Str,8);
  StrZs:= LeftStr(Str,Length(Str)-9);
  case Len of
    0:
      if Copy(Strxs,1,1)>='5' then
        result:= StrToFloat(StrZs)+1
      else
        result:= StrToFloat(StrZs);
    1:
      if Copy(Strxs,2,1)>='5' then
        result:= StrToFloat(StrZs+'.'+LeftStr(Strxs,1))+0.1
      else
        result:= StrToFloat(StrZs+'.'+LeftStr(Strxs,1));
    2:
      if Copy(Strxs,3,1)>='5' then
        result:= StrToFloat(StrZs+'.'+LeftStr(Strxs,2))+0.01
      else
        result:= StrToFloat(StrZs+'.'+LeftStr(Strxs,2));
    3:
      if Copy(Strxs,4,1)>='5' then
        result:= StrToFloat(StrZs+'.'+LeftStr(Strxs,3))+0.001
      else
        result:= StrToFloat(StrZs+'.'+LeftStr(Strxs,3));
    4:
      if Copy(Strxs,5,1)>='5' then
        result:= StrToFloat(StrZs+'.'+LeftStr(Strxs,4))+0.0001
      else
        result:= StrToFloat(StrZs+'.'+LeftStr(Strxs,4));
  end;
end;
initialization
  stopSearch:= false;
  PlugInList:= TList.Create;
finalization
  FreeAndNil(PlugInList);
end.
