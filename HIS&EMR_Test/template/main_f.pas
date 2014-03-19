unit main_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, NsoOfficeLib_TLB, ComCtrls, ExtCtrls,
  TFlatPanelUnit, FlatSelEdit, Buttons, ShareMsg_u, Share_u, dm_u, DllFunc_u,
  DB, DBClient, Menus, ImgList, prop_f, DictIpt, UserFunc_U, secion_f;
  
type
  TNodeInfo = record
    ID,      //代码
    Name,    //名称
    ParentID  //上级代码
      :string;
    IsElement: Boolean;
  end;
  TNodeData = ^TNodeInfo;

type
  TFrm_main = class(TForm)
    Grp_blmbbj: TGroupBox;
    NsoCtrl_blmbbj: TNsoControl;
    Cds_Load: TClientDataSet;
    Grp_mbs: TGroupBox;
    Tview_mbs: TTreeView;
    PupMenu_1: TPopupMenu;
    Mitem_New: TMenuItem;
    Mitem_Edit: TMenuItem;
    ImgLst_1: TImageList;
    Mitem_Prop: TMenuItem;
    Mitem_Inherit: TMenuItem;
    Tmr_save: TTimer;
    pgc_Select: TPageControl;
    ts_zdyys: TTabSheet;
    Lb_zdyys: TLabel;
    Fsdt_zdyys: TFlatSelEdit;
    Tview_zdyys: TTreeView;
    ts_nrpd: TTabSheet;
    Lb_nrpd: TLabel;
    Fsdt_nrpd: TFlatSelEdit;
    Tview_nrpd: TTreeView;
    PupMenu_2: TPopupMenu;
    Mitem_FreshElement: TMenuItem;
    Mitem_FreshContent: TMenuItem;
    Btn_1: TButton;
    DictIpt1: TDictIpt;
    Mitem_Del: TMenuItem;
    Mitem_R1: TMenuItem;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormShow(Sender: TObject);
    procedure Mitem_NewClick(Sender: TObject);
    procedure Mitem_EditClick(Sender: TObject);
    procedure PupMenu_1Popup(Sender: TObject);
    procedure Mitem_PropClick(Sender: TObject);
    procedure Mitem_InheritClick(Sender: TObject);
    procedure Tmr_saveTimer(Sender: TObject);
    procedure NsoCtrl_blmbbjNsoToolbarAddinEvent(Sender: TObject;
      nID: Integer; const sRev1, sRev2: WideString);
    procedure Mitem_FreshElementClick(Sender: TObject);
    procedure Mitem_FreshContentClick(Sender: TObject);
    procedure PupMenu_2Popup(Sender: TObject);
    procedure Fsdt_zdyysClick(Sender: TObject);
    procedure Fsdt_zdyysDownClick(Sender: TObject);
    procedure Fsdt_zdyysKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Btn_1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Mitem_DelClick(Sender: TObject);
    procedure Mitem_R1Click(Sender: TObject);
    procedure Fsdt_nrpdClick(Sender: TObject);
    procedure Fsdt_nrpdDownClick(Sender: TObject);
    procedure Fsdt_nrpdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    TemplateID: string;
    function IntToStrCount(AInt, ACount: Integer): string;
    function GetExistsFileName(APath: string): string;
    function GetDateTimeStr(ADateTime: TDateTime; kind: Integer): string;
    procedure InitMbs;
    function GetKsByYhbs(bs: string): string;
    function IsMyMbOrNot(mbID: string): Boolean;
    function LoadMbFileByID(Lfilename, mbID: string): Boolean;
    procedure ShowButtons;
    procedure NsoShowBar;
    function AddChildNode(ATree: TTreeView; ParentNode: TTreeNode): Boolean;
    procedure RefreshTree(ATree: TTreeView);
    procedure DisposeChildTreePointers(ParentNode: TTreeNode);
    function AddChildElement(ATree: TTreeView; ParentNode: TTreeNode): Boolean;
    function SelectOldNode(ATree: TTreeView; ID: string; IsElement: Boolean;
      ParentNode: TTreeNode): Boolean;
    function GetDocErrByCode(ACode: Integer): string;
    procedure ClearFormProp;
    //编辑器工具栏按钮事件
    procedure ProtectTableCell;
    procedure DeProtectTableCell;
    procedure SaveToDB;
    procedure InsertSection;
    procedure DeleteSection;
    procedure InsertSelectContent;
    procedure InsertSelectElement;
//    procedure InsertSelectThing;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_main: TFrm_main;

implementation

{$R *.dfm}

procedure TFrm_main.ProtectTableCell;
var
  tbName,tbCell: string;
begin
  tbName := NsoCtrl_blmbbj.GetTableNameByCurrentCursor;
  tbCell := NsoCtrl_blmbbj.GetTableCellNameByCurrentCursor;
  if (tbName <> '') and (tbCell <> '') then
    NsoCtrl_blmbbj.ProtectTableByCell(tbName, tbCell, True)
  else
    MsgInfo('请确认光标所在位置为表格的单元格中！', 3);
end;

procedure TFrm_main.DeProtectTableCell;
var
  tbName,tbCell: string;
begin
  tbName := NsoCtrl_blmbbj.GetTableNameByCurrentCursor;
  tbCell := NsoCtrl_blmbbj.GetTableCellNameByCurrentCursor;
  if (tbName <> '') and (tbCell <> '') then
    NsoCtrl_blmbbj.ProtectTableByCell(tbName, tbCell, True)
  else
    MsgInfo('请确认光标所在位置为表格的单元格中！', 3);
end;

procedure TFrm_main.SaveToDB;
var
  Lfilename: string;
  Lfilenow: string;
  Cds_Sv: TClientDataSet;
  Lerrcode: Integer;
begin
  //
  Lfilename := GetExistsFileName(ExePath + 'DocTempFiles/');
  Lerrcode := NsoCtrl_blmbbj.SaveAs(Lfilename);
  if Lerrcode <> wdSuccess then
  begin
    MsgInfo('保存模板到临时文件失败！' + #13#10 +
      '错误信息：' + GetDocErrByCode(Lerrcode), 3);
    Exit;
  end;
  Sleep(3000);

  Lfilenow := GetExistsFileName(ExePath + 'DocTempFiles/');
  Lerrcode := NsoCtrl_blmbbj.SaveAs(Lfilenow);
  if Lerrcode <> wdSuccess then
  begin
    MsgInfo('取消模板临时文件占用失败！' + #13#10 +
      '错误信息：' + GetDocErrByCode(Lerrcode), 3);
    Exit;
  end;

  NsoCtrl_blmbbj.RemoveFileFromSofficeBin(Lfilename);

  Sleep(3000);

  Cds_Sv := TClientDataSet.Create(nil);
  try
    with Cds_Sv do
    begin
      RemoteServer := DM.SockConn;
      ProviderName := 'dspDtl4';
      CommandText := 'select mbid, mbwj from emr_blmb ' +
        'where mbid = ''' + TemplateID + '''';

      try
        Open;
      except
        on e: Exception do
        begin
          MsgInfo('打开数据集保存模板失败！' + e.Message, 3);
          Exit;
        end;
      end;

      if RecordCount <> 1 then
      begin
        MsgInfo('未找到匹配的模板信息！保存失败！', 3);
        Exit;
      end;

      Edit;
      TMemoField(FieldByName('mbwj')).LoadFromFile(Lfilename);
      Post;

      Lerrcode := 0;
      try
        Lerrcode := ApplyUpdates(0);
      except
        on e: Exception do
        begin
          MsgInfo('打开数据集保存模板失败！' + e.Message, 3);
          Exit;
        end;
      end;

      if Lerrcode > 0 then
      begin
        MsgInfo('打开数据集保存模板失败！', 3);
        Exit;
      end;

      MsgInfo('保存模板成功！', 1);
    end;
  finally
    Cds_Sv.Free;
  end;
end;

procedure TFrm_main.InsertSection;
var
  sectionName, sectionTip: string;
begin
  if not Assigned(Frm_Section) then
    Frm_Section := TFrm_Section.Create(Self);
  Frm_Section.ShowModal;

  sectionTip := DM.cds_dtl6.CommandText;
  if sectionTip = '' then
  begin

  end
  else
  begin
    NsoCtrl_blmbbj.SetFocus2;
    sectionName := NsoCtrl_blmbbj.InsertSectionAtCurrentCursor(
      NsoCtrl_blmbbj.CreateRandomStructName,' ');
    NsoCtrl_blmbbj.SetSectionProp(sectionName, 'Edge', 'True');
    NsoCtrl_blmbbj.SetSectionProp(sectionName,'HelpTip',sectionTip);
  end;
end;

procedure TFrm_main.DeleteSection;
var
  sectionName: string;
begin
  sectionName := NsoCtrl_blmbbj.GetCurrentSectionName;
  if sectionName = '' then
  begin
    MsgInfo('请确定选中了一个节！', 2);
  end
  else
  begin
    if MsgYesNO('是否确定要删除所选节？', False) = mrYes then
    begin
      NsoCtrl_blmbbj.DeleteSection(sectionName);
    end;
  end;
end;

procedure TFrm_main.InsertSelectContent;
var
  MainSectionID: string;
  MainSectionEnd: Cardinal;
  ElementID: string;
  ElementName: string;
  ControlID: string;
  MainSectionTip: string;
  Cds_nr: TClientDataSet;
  Cds_emr_nrpdxl: TClientDataSet;
  Cds_PreviewYs: TClientDataSet;
  Cds_PreViewYsxl: TClientDataSet;
  ComboType: Integer;

  YSSM: string;
  YSQZ: string;
  YSHZ: string;
  LX: string;
  SFXSBK: string;
  ZBKZ: string;
  YBKZ: string;
  SFYXSC: string;
  SFYXXG: string;
  MRZ: string;
  YSJB: string;
  XTYSDZ: string;
  SFBMLL: string;
  SFKJ: string;
  SFXML: string;
  SFBTX: string;
  WBKZDCD: string;
  SZKZDZ: string;
  SZKZXZ: string;
  SZKJD: string;
  SZKDW: string;
  XZKBT: string;
  RQKGS: string;
  RQKQSSJ: string;
  RQKZZSJ: string;
begin
  Cds_nr := TClientDataSet.Create(nil);
  try
    with Cds_nr do
    begin
      RemoteServer := DM.SockConn;
      ProviderName := 'dspDtl3';
      Close;
      CommandText := 'select * from emr_nrpd where ' +
        'nrbh = ''' + TNodeData(Tview_nrpd.Selected.Data)^.ID + '''';

      try
        Open;
      except
        on e: Exception do
        begin
          MsgInfo('取内容片段数据集失败！插入内容片段[ ' +
            TNodeData(Tview_nrpd.Selected.Data)^.Name + ' ]失败!' +
            e.Message, 3);
          Exit;
        end;
      end;

      if RecordCount <> 1 then
      begin
        MsgInfo('取内容片段数据集失败！插入内容片段[ ' +
          TNodeData(Tview_nrpd.Selected.Data)^.Name + ' ]失败', 3);
        Exit;
      end
      else
      begin
        MainSectionTip := FieldByName('nrgs').AsString + '_SctID:' +
          FieldByName('nrbh').AsString;
      end;
      Close;
    end;
  finally
    Cds_nr.Free;
  end;

  Cds_emr_nrpdxl := TClientDataSet.Create(nil);
  try
    with Cds_emr_nrpdxl do
    begin
      RemoteServer := DM.SockConn;
      ProviderName := 'dspDtl3';
      Close;
      CommandText := 'select * from emr_nrpdxl where ' +
        'nrbh = ''' + TNodeData(Tview_nrpd.Selected.Data)^.ID + ''' order by nrxlh';

      try
        Open;
      except
        on e: Exception do
        begin
          MsgInfo('取内容片段序列数据集失败！插入内容片段[ ' +
            TNodeData(Tview_nrpd.Selected.Data)^.Name + ' ]失败!' +
            e.Message, 3);
          Exit;
        end;
      end;

      if RecordCount = 0 then
      begin
        MsgInfo('取内容片段序列数据集失败！插入内容片段[ ' +
          TNodeData(Tview_nrpd.Selected.Data)^.Name + ' ]失败', 3);
        Exit;
      end;
    end;

    MainSectionID :=
      NsoCtrl_blmbbj.InsertSectionAtCurrentCursor(
        NsoCtrl_blmbbj.CreateRandomStructName,
        ' ');

    if MainSectionID = '' then
    begin
      MsgInfo('插入主数据节失败！预览失败！', 3);
      Exit;
    end;
  
    if NsoCtrl_blmbbj.SetSectionProp(MainSectionID,'Edge','True') = False then
    begin
      MsgInfo('设置主数据节显示边框失败！', 2);
    end;

    if NsoCtrl_blmbbj.SetSectionProp(MainSectionID,'HelpTip', MainSectionTip) = False then
    begin
      MsgInfo('设置主数据节显示标题提示失败！', 2);
    end;

    with Cds_emr_nrpdxl do
    begin
      while not Eof do
      begin
        if FieldByName('ZLX').AsString = '0' then
        begin
          MainSectionEnd := NsoCtrl_blmbbj.GetSectionEnd(MainSectionID);

          if MainSectionEnd = -1 then
          begin
            MsgInfo('取内容片段数据节末端出错，预览失败！', 3);
            Exit;
          end;

          NsoCtrl_blmbbj.JumpToOnePostion(MainSectionEnd);
          NsoCtrl_blmbbj.InsertTextAtCurrentCursor(FieldByName('YSZ').AsString);
        end
        else
        if FieldByName('ZLX').AsString = '1' then
        begin
          MainSectionEnd := NsoCtrl_blmbbj.GetSectionEnd(MainSectionID);
          if MainSectionEnd = -1 then
          begin
            MsgInfo('取内容片段数据节末端出错，预览失败！', 3);
            Exit;
          end;
          NsoCtrl_blmbbj.JumpToOnePostion(MainSectionEnd);

          ElementName :=
            NsoCtrl_blmbbj.InsertSectionAtCurrentCursor(
              NsoCtrl_blmbbj.CreateRandomStructName,
              ' ');
          if ElementName = '' then
          begin
            MsgInfo('插入元素数据节出错，预览失败！', 3);
            Exit;
          end;

          if NsoCtrl_blmbbj.SetSectionProp(ElementName,'Edge','True') = False then
          begin
            MsgInfo('设置元素数据节边框出错！', 2);
          end;

          ElementID := FieldByName('YSID').AsString;
          if ElementID = '' then
          begin
            MsgInfo('取序列中元素失败，预览失败！', 3);
            Exit;
          end;

          Cds_PreviewYs := TClientDataSet.Create(nil);
          try
            Cds_PreviewYs.RemoteServer := DM.SockConn;
            Cds_PreviewYs.ProviderName := 'dspDtl6';
            Cds_PreviewYs.Close;
            Cds_PreviewYs.CommandText :=
              'select YSBH,YSSM,YSLBBH,YSQZ,YSHZ,LX,SFXSBK,' +
              'ZBKZ,YBKZ,SFYXSC,SFYXXG,MRZ,YSJB,XTYSDZ,SFBMLL,' +
              'SFKJ,SFXML,SFBTX,WBKZDCD,SZKZDZ,SZKZXZ,SZKJD,' +
              'SZKDW,XZKBT,RQKGS,RQKQSSJ,RQKZZSJ from emr_blys ' +
              'where ysbh = ''' + ElementID + '''';
            try
              Cds_PreviewYs.Open;
            except
              on e: Exception do
              begin
                MsgInfo('取内容片段序列中元素失败，预览失败！', 3);
                Exit;
              end;
            end;

            YSSM := Cds_PreviewYs.FieldByName('YSSM').AsString;
            YSQZ := Cds_PreviewYs.FieldByName('YSQZ').AsString;
            YSHZ := Cds_PreviewYs.FieldByName('YSHZ').AsString;
            LX := Cds_PreviewYs.FieldByName('LX').AsString;
            SFXSBK := Cds_PreviewYs.FieldByName('SFXSBK').AsString;
            ZBKZ := Cds_PreviewYs.FieldByName('ZBKZ').AsString;
            YBKZ := Cds_PreviewYs.FieldByName('YBKZ').AsString;
            SFYXSC := Cds_PreviewYs.FieldByName('SFYXSC').AsString;
            SFYXXG := Cds_PreviewYs.FieldByName('SFYXXG').AsString;
            MRZ := Cds_PreviewYs.FieldByName('MRZ').AsString;
            YSJB := Cds_PreviewYs.FieldByName('YSJB').AsString;
            XTYSDZ := Cds_PreviewYs.FieldByName('XTYSDZ').AsString;
            SFBMLL := Cds_PreviewYs.FieldByName('SFBMLL').AsString;
            SFKJ := Cds_PreviewYs.FieldByName('SFKJ').AsString;
            SFXML := Cds_PreviewYs.FieldByName('SFXML').AsString;
            SFBTX := Cds_PreviewYs.FieldByName('SFBTX').AsString;
            WBKZDCD := Cds_PreviewYs.FieldByName('WBKZDCD').AsString;
            SZKZDZ := Cds_PreviewYs.FieldByName('SZKZDZ').AsString;
            SZKZXZ := Cds_PreviewYs.FieldByName('SZKZXZ').AsString;
            SZKJD := Cds_PreviewYs.FieldByName('SZKJD').AsString;
            SZKDW := Cds_PreviewYs.FieldByName('SZKDW').AsString;
            XZKBT := Cds_PreviewYs.FieldByName('XZKBT').AsString;
            RQKGS := Cds_PreviewYs.FieldByName('RQKGS').AsString;
            RQKQSSJ := Cds_PreviewYs.FieldByName('RQKQSSJ').AsString;
            RQKZZSJ := Cds_PreviewYs.FieldByName('RQKZZSJ').AsString;
          finally
            Cds_PreviewYs.Free;
          end;

          if NsoCtrl_blmbbj.SetSectionProp(ElementName,'HelpTip',
            YSSM + '_ElmtID:' + ElementID) = False then
          begin
            MsgInfo('设置元素数据节提示出错！', 2);
          end;

          if YSQZ <> '' then
          begin
            MainSectionEnd := NsoCtrl_blmbbj.GetSectionEnd(ElementName);

            if MainSectionEnd = -1 then
            begin
              MsgInfo('取元素数据节末端出错，预览失败！', 3);
              Exit;
            end;

            NsoCtrl_blmbbj.JumpToOnePostion(MainSectionEnd);
            NsoCtrl_blmbbj.SetSectionText(ElementName,YSQZ);
          end;

          if YSJB = '0' then
          begin
            MainSectionEnd := NsoCtrl_blmbbj.GetSectionEnd(ElementName);

            if MainSectionEnd = -1 then
            begin
              MsgInfo('取元素数据节末端出错，预览失败！', 3);
              Exit;
            end;

            NsoCtrl_blmbbj.JumpToOnePostion(MainSectionEnd);
            ControlID :=
              NsoCtrl_blmbbj.InsertNewControlAtCurrentCursor(
                NsoCtrl_blmbbj.CreateRandomStructName,
                MRZ,
                3);
            if ControlID = '' then
            begin
              MsgInfo('添加系统元素控件出错，预览失败！', 3);
              Exit;
            end;
            if NsoCtrl_blmbbj.SetNewControlProp(ControlID,'Edge','True') = False then
            begin
              MsgInfo('设置系统元素边框出错！', 2);
            end;
            if MRZ <> '' then
            begin
              if NsoCtrl_blmbbj.SetNewControlProp(ControlID,'HelpTip','系统元素') = False then
              begin
                MsgInfo('设置系统元素提示出错！', 2);
              end;
            end;
          end
          else
          if YSJB = '1' then
          begin
            MainSectionEnd := NsoCtrl_blmbbj.GetSectionEnd(ElementName);

            if MainSectionEnd = -1 then
            begin
              MsgInfo('取元素数据节末端出错，预览失败！', 3);
              Exit;
            end;

            NsoCtrl_blmbbj.JumpToOnePostion(MainSectionEnd);
            if MRZ = '' then
              MRZ := ' ';

            ControlID :=
              NsoCtrl_blmbbj.InsertNewControlAtCurrentCursor(
                NsoCtrl_blmbbj.CreateRandomStructName,
                MRZ,
                StrToInt(LX));

            if ControlID = '' then
            begin
              MsgInfo('自定义元素添加控件失败，预览失败！', 3);
              Exit;
            end;

            if NsoCtrl_blmbbj.SetNewControlProp(ControlID,'HelpTip','自定义元素') = False then
            begin
              MsgInfo('自定义元素设置控件提示失败！', 2);
            end;

            if SFXSBK = '0' then
            begin
              if NsoCtrl_blmbbj.SetNewControlProp(ControlID,'Edge','False') = False then
              begin
                MsgInfo('自定义元素设置控件边框失败！', 2);
              end;
            end
            else
            if SFXSBK = '1' then
            begin
              if NsoCtrl_blmbbj.SetNewControlProp(ControlID,'Edge','True') = False then
              begin
                MsgInfo('自定义元素设置控件边框失败！', 2);
              end;
            end;

            if (MRZ <> '') and (MRZ <> ' ') then
            begin
              if NsoCtrl_blmbbj.SetNewControlProp(ControlID,'PlaceHolder',MRZ) = False then
              begin
                MsgInfo('自定义元素设置控件默认值失败！', 2);
              end;
            end;

            if ZBKZ <> '' then
            begin
              if NsoCtrl_blmbbj.SetNewControlProp(ControlID,'EdgeStyle',ZBKZ) = False then
              begin
                MsgInfo('自定义元素设置控件左边框失败！', 2);
              end;
            end;

            if YBKZ <> '' then
            begin
              if NsoCtrl_blmbbj.SetNewControlProp(ControlID,'EdgeStyle2',YBKZ) = False then
              begin
                MsgInfo('自定义元素设置控件右边框失败！', 2);
              end;
            end;

            if SFYXSC = '0' then
            begin
              if NsoCtrl_blmbbj.SetNewControlProp(ControlID,'DelFlag','True') = False then
              begin
                MsgInfo('自定义元素设置控件可否删除失败！', 2);
              end;
            end
            else
            if SFYXSC = '1' then
            begin
              if NsoCtrl_blmbbj.SetNewControlProp(ControlID,'DelFlag','False') = False then
              begin
                MsgInfo('自定义元素设置控件可否删除失败！', 2);
              end;
            end;

            if SFYXXG = '0' then
            begin
              if NsoCtrl_blmbbj.SetNewControlProp(ControlID,'EditProtect','True') = False then
              begin
                MsgInfo('自定义元素设置控件可否修改失败！', 2);
              end;
            end
            else
            if SFYXXG = '1' then
            begin
              if NsoCtrl_blmbbj.SetNewControlProp(ControlID,'EditProtect','False') = False then
              begin
                MsgInfo('自定义元素设置控件可否修改失败！', 2);
              end;
            end;

            if SFBMLL = '0' then
            begin
              if NsoCtrl_blmbbj.SetNewControlProp(ControlID,'ViewSecret','False') = False then
              begin
                MsgInfo('自定义元素设置控件保密浏览模式失败！', 2);
              end;
            end
            else
            if SFBMLL = '1' then
            begin
              if NsoCtrl_blmbbj.SetNewControlProp(ControlID,'ViewSecret','True') = False then
              begin
                MsgInfo('自定义元素设置控件保密浏览模式失败！', 2);
              end;
            end;

            if SFXML = '0' then
            begin
              if NsoCtrl_blmbbj.SetNewControlProp(ControlID,'IsNotRecordInXML','True') = False then
              begin
                MsgInfo('自定义元素设置控件保密浏览模式失败！', 2);
              end;
            end
            else
            if SFXML = '1' then
            begin
              if NsoCtrl_blmbbj.SetNewControlProp(ControlID,'IsNotRecordInXML','False') = False then
              begin
                MsgInfo('自定义元素设置控件保密浏览模式失败！', 2);
              end;
            end;

            if SFBTX = '0' then
            begin
              if NsoCtrl_blmbbj.SetNewControlProp(ControlID,'MustFillContent','False') = False then
              begin
                MsgInfo('自定义元素设置控件保密浏览模式失败！', 2);
              end;
            end
            else
            if SFBTX = '1' then
            begin
              if NsoCtrl_blmbbj.SetNewControlProp(ControlID,'MustFillContent','True') = False then
              begin
                MsgInfo('自定义元素设置控件保密浏览模式失败！', 2);
              end;
            end;

            if (LX = '1') or (LX = '2') or (LX = '6') or (LX = '7') then
            begin
              if LX = '1' then
                ComboType := 1
              else
              if LX = '2' then
                ComboType := 2
              else
              if LX = '6' then
                ComboType := 3
              else
              if LX = '7' then
                ComboType := 4;

              Cds_PreViewYsxl := TClientDataSet.Create(nil);
              try
                Cds_PreViewYsxl.RemoteServer := DM.SockConn;
                Cds_PreViewYsxl.ProviderName := 'dspDtl6';
                Cds_PreViewYsxl.Close;
                Cds_PreViewYsxl.CommandText := 'select YSBH,YSXLH,KXZ from emr_blysxl where ' +
                  'YSBH = ''' + ElementID + '''';
                try
                  Cds_PreViewYsxl.Open;
                except
                  on e: Exception do
                  begin
                    MsgInfo('取序列中元素失败，预览失败！', 3);
                    Exit;
                  end;
                end;
                Cds_PreViewYsxl.First;

                if NsoCtrl_blmbbj.DeleteAllCompoundBoxCodeAndValue(ControlID,ComboType) = False then
                begin
                  MsgInfo('自定义元素控件清理选项失败，预览失败！', 3);
                  Exit;
                end;

                while not Cds_PreViewYsxl.Eof do
                begin
                  if NsoCtrl_blmbbj.SetCompoundBoxCodeAndValue(
                       ControlID,
                       Cds_PreViewYsxl.FieldByName('KXZ').AsString,
                       Cds_PreViewYsxl.FieldByName('YSXLH').AsString,
                       ComboType) = False then
                  begin
                    MsgInfo('自定义元素控件添加可选项失败，预览失败！', 3);
                    Exit;
                  end;
                  Cds_PreViewYsxl.Next;
                end;
              finally
                Cds_PreViewYsxl.Free;
              end;
            end
            else
            if LX = '3' then
            begin
              if WBKZDCD <> '' then
              begin
                try
                  if NsoCtrl_blmbbj.SetTextBoxMaxLen(ControlID,StrToInt(WBKZDCD)) = False then
                  begin
                    MsgInfo('自定义元素控件设置文本框最大长度失败！', 2);
                  end;
                except
                end;
              end;  
            end
            else
            if LX = '4' then
            begin
              if XZKBT <> '' then
              begin
                if NsoCtrl_blmbbj.SetCheckboxCaption(ControlID,XZKBT) = False then
                begin
                  MsgInfo('自定义元素控件设置选择框标题失败！', 2);
                end;
              end;
            end
            else
            if LX = '5' then
            begin
              if SZKZDZ <> '' then
              begin
                try
                  if NsoCtrl_blmbbj.SetNumboxMaxValue(ControlID,StrToInt(SZKZDZ)) = False then
                  begin
                    MsgInfo('自定义元素控件设置数字框最大值失败！', 2);
                  end;
                except
                end;
              end;
              if SZKZXZ <> '' then
              begin
                try
                  if NsoCtrl_blmbbj.SetNumboxMinValue(ControlID,StrToInt(SZKZXZ)) = False then
                  begin
                    MsgInfo('自定义元素控件设置数字框最小值失败！', 2);
                  end;
                except
                end;
              end;
              if SZKJD <> '' then
              begin
                try
                  if NsoCtrl_blmbbj.SetNumboxPrecision(ControlID,StrToInt(SZKJD)) = False then
                  begin
                    MsgInfo('自定义元素控件设置数字框精度失败！', 2);
                  end;
                except
                end;
              end;
              if SZKDW <> '' then
              begin
                if NsoCtrl_blmbbj.SetNumboxUnit(ControlID,SZKDW) = False then
                begin
                  MsgInfo('自定义元素控件设置数字框单位失败！', 2);
                end;
              end;
            end
            else
            if LX = '8' then
            begin
              if RQKGS <> '' then
              begin
                try
                  if NsoCtrl_blmbbj.SetDateTimeFormat(ControlID,StrToInt(RQKGS)) = False then
                  begin
                    MsgInfo('自定义元素控件设置日期时间框显示格式失败！', 2);
                  end;
                except
                end;
              end;

              if RQKQSSJ <> '' then
              begin
                if NsoCtrl_blmbbj.SetStartDateTime(ControlID,RQKQSSJ) = False then
                begin
                  MsgInfo('自定义元素控件设置日期时间框起始时间限制失败！', 2);
                end;
              end;

              if RQKZZSJ <> '' then
              begin
                if NsoCtrl_blmbbj.SetEndDateTime(ControlID,RQKZZSJ) = False then
                begin
                  MsgInfo('自定义元素控件设置日期时间框终止时间限制失败！', 2);
                end;
              end;
            end;
          end;

          if YSHZ <> '' then
          begin
            MainSectionEnd := NsoCtrl_blmbbj.GetSectionEnd(ElementName);

            if MainSectionEnd = -1 then
            begin
              MsgInfo('取元素数据节末端出错，预览失败！', 3);
              Exit;
            end;

            NsoCtrl_blmbbj.JumpToOnePostion(MainSectionEnd);
            NsoCtrl_blmbbj.InsertTextAtCurrentCursor(YSHZ);
          end;
        end
        else
        begin
          MsgInfo('片段序列值类型错误，无法预览！', 3);
          Exit;
        end;
        Next;
      end;
    end;
  finally
    Cds_emr_nrpdxl.Free;
  end;
//  NsoCtrl_preview.BrowseTemplet(1, 1);
end;

procedure TFrm_main.InsertSelectElement;
var
  MainSectionID: string;
  MainSectionEnd: Cardinal;
  ElementID: string;
  ElementName: string;
  ControlID: string;
  MainSectionTip: string;
  Cds_nr: TClientDataSet;
  Cds_emr_nrpdxl: TClientDataSet;
  Cds_PreviewYs: TClientDataSet;
  Cds_PreViewYsxl: TClientDataSet;
  ComboType: Integer;

  YSSM: string;
  YSQZ: string;
  YSHZ: string;
  LX: string;
  SFXSBK: string;
  ZBKZ: string;
  YBKZ: string;
  SFYXSC: string;
  SFYXXG: string;
  MRZ: string;
  YSJB: string;
  XTYSDZ: string;
  SFBMLL: string;
  SFKJ: string;
  SFXML: string;
  SFBTX: string;
  WBKZDCD: string;
  SZKZDZ: string;
  SZKZXZ: string;
  SZKJD: string;
  SZKDW: string;
  XZKBT: string;
  RQKGS: string;
  RQKQSSJ: string;
  RQKZZSJ: string;
begin
  ElementName :=
    NsoCtrl_blmbbj.InsertSectionAtCurrentCursor(
      NsoCtrl_blmbbj.CreateRandomStructName,
      ' ');

  if ElementName = '' then
  begin
    MsgInfo('插入元素数据节出错，预览失败！', 3);
    Exit;
  end;

  if NsoCtrl_blmbbj.SetSectionProp(ElementName,'Edge','True') = False then
  begin
    MsgInfo('设置元素数据节边框出错！', 2);
  end;

  ElementID := FieldByName('YSID').AsString;
  if ElementID = '' then
  begin
    MsgInfo('取序列中元素失败，预览失败！', 3);
    Exit;
  end;

  Cds_PreviewYs := TClientDataSet.Create(nil);
  try
    Cds_PreviewYs.RemoteServer := DM.SockConn;
    Cds_PreviewYs.ProviderName := 'dspDtl6';
    Cds_PreviewYs.Close;
    Cds_PreviewYs.CommandText :=
      'select YSBH,YSSM,YSLBBH,YSQZ,YSHZ,LX,SFXSBK,' +
      'ZBKZ,YBKZ,SFYXSC,SFYXXG,MRZ,YSJB,XTYSDZ,SFBMLL,' +
      'SFKJ,SFXML,SFBTX,WBKZDCD,SZKZDZ,SZKZXZ,SZKJD,' +
      'SZKDW,XZKBT,RQKGS,RQKQSSJ,RQKZZSJ from emr_blys ' +
      'where ysbh = ''' + ElementID + '''';
      
    try
      Cds_PreviewYs.Open;
    except
      on e: Exception do
      begin
        MsgInfo('取内容片段序列中元素失败，预览失败！', 3);
        Exit;
      end;
    end;

    YSSM := Cds_PreviewYs.FieldByName('YSSM').AsString;
    YSQZ := Cds_PreviewYs.FieldByName('YSQZ').AsString;
    YSHZ := Cds_PreviewYs.FieldByName('YSHZ').AsString;
    LX := Cds_PreviewYs.FieldByName('LX').AsString;
    SFXSBK := Cds_PreviewYs.FieldByName('SFXSBK').AsString;
    ZBKZ := Cds_PreviewYs.FieldByName('ZBKZ').AsString;
    YBKZ := Cds_PreviewYs.FieldByName('YBKZ').AsString;
    SFYXSC := Cds_PreviewYs.FieldByName('SFYXSC').AsString;
    SFYXXG := Cds_PreviewYs.FieldByName('SFYXXG').AsString;
    MRZ := Cds_PreviewYs.FieldByName('MRZ').AsString;
    YSJB := Cds_PreviewYs.FieldByName('YSJB').AsString;
    XTYSDZ := Cds_PreviewYs.FieldByName('XTYSDZ').AsString;
    SFBMLL := Cds_PreviewYs.FieldByName('SFBMLL').AsString;
    SFKJ := Cds_PreviewYs.FieldByName('SFKJ').AsString;
    SFXML := Cds_PreviewYs.FieldByName('SFXML').AsString;
    SFBTX := Cds_PreviewYs.FieldByName('SFBTX').AsString;
    WBKZDCD := Cds_PreviewYs.FieldByName('WBKZDCD').AsString;
    SZKZDZ := Cds_PreviewYs.FieldByName('SZKZDZ').AsString;
    SZKZXZ := Cds_PreviewYs.FieldByName('SZKZXZ').AsString;
    SZKJD := Cds_PreviewYs.FieldByName('SZKJD').AsString;
    SZKDW := Cds_PreviewYs.FieldByName('SZKDW').AsString;
    XZKBT := Cds_PreviewYs.FieldByName('XZKBT').AsString;
    RQKGS := Cds_PreviewYs.FieldByName('RQKGS').AsString;
    RQKQSSJ := Cds_PreviewYs.FieldByName('RQKQSSJ').AsString;
    RQKZZSJ := Cds_PreviewYs.FieldByName('RQKZZSJ').AsString;
  finally
    Cds_PreviewYs.Free;
  end;

  if NsoCtrl_blmbbj.SetSectionProp(ElementName,'HelpTip',
    YSSM + '_ElmtID:' + ElementID) = False then
  begin
    MsgInfo('设置元素数据节提示出错！', 2);
  end;

  if YSQZ <> '' then
  begin
    MainSectionEnd := NsoCtrl_blmbbj.GetSectionEnd(ElementName);

    if MainSectionEnd = -1 then
    begin
      MsgInfo('取元素数据节末端出错，预览失败！', 3);
      Exit;
    end;

    NsoCtrl_blmbbj.JumpToOnePostion(MainSectionEnd);
    NsoCtrl_blmbbj.SetSectionText(ElementName,YSQZ);
  end;

  if YSJB = '0' then
  begin
    MainSectionEnd := NsoCtrl_blmbbj.GetSectionEnd(ElementName);

    if MainSectionEnd = -1 then
    begin
      MsgInfo('取元素数据节末端出错，预览失败！', 3);
      Exit;
    end;

    NsoCtrl_blmbbj.JumpToOnePostion(MainSectionEnd);
    ControlID :=
      NsoCtrl_blmbbj.InsertNewControlAtCurrentCursor(
        NsoCtrl_blmbbj.CreateRandomStructName,
        MRZ,
        3);
    if ControlID = '' then
    begin
      MsgInfo('添加系统元素控件出错，预览失败！', 3);
      Exit;
    end;
    if NsoCtrl_blmbbj.SetNewControlProp(ControlID,'Edge','True') = False then
    begin
      MsgInfo('设置系统元素边框出错！', 2);
    end;
    if MRZ <> '' then
    begin
      if NsoCtrl_blmbbj.SetNewControlProp(ControlID,'HelpTip','系统元素') = False then
      begin
        MsgInfo('设置系统元素提示出错！', 2);
      end;
    end;
  end
  else
  if YSJB = '1' then
  begin
    MainSectionEnd := NsoCtrl_blmbbj.GetSectionEnd(ElementName);

    if MainSectionEnd = -1 then
    begin
      MsgInfo('取元素数据节末端出错，预览失败！', 3);
      Exit;
    end;

    NsoCtrl_blmbbj.JumpToOnePostion(MainSectionEnd);
    if MRZ = '' then
      MRZ := ' ';

    ControlID :=
      NsoCtrl_blmbbj.InsertNewControlAtCurrentCursor(
        NsoCtrl_blmbbj.CreateRandomStructName,
        MRZ,
        StrToInt(LX));

    if ControlID = '' then
    begin
      MsgInfo('自定义元素添加控件失败，预览失败！', 3);
      Exit;
    end;

    if NsoCtrl_blmbbj.SetNewControlProp(ControlID,'HelpTip','自定义元素') = False then
    begin
      MsgInfo('自定义元素设置控件提示失败！', 2);
    end;

    if SFXSBK = '0' then
    begin
      if NsoCtrl_blmbbj.SetNewControlProp(ControlID,'Edge','False') = False then
      begin
        MsgInfo('自定义元素设置控件边框失败！', 2);
      end;
    end
    else
    if SFXSBK = '1' then
    begin
      if NsoCtrl_blmbbj.SetNewControlProp(ControlID,'Edge','True') = False then
      begin
        MsgInfo('自定义元素设置控件边框失败！', 2);
      end;
    end;

    if (MRZ <> '') and (MRZ <> ' ') then
    begin
      if NsoCtrl_blmbbj.SetNewControlProp(ControlID,'PlaceHolder',MRZ) = False then
      begin
        MsgInfo('自定义元素设置控件默认值失败！', 2);
      end;
    end;

    if ZBKZ <> '' then
    begin
      if NsoCtrl_blmbbj.SetNewControlProp(ControlID,'EdgeStyle',ZBKZ) = False then
      begin
        MsgInfo('自定义元素设置控件左边框失败！', 2);
      end;
    end;

    if YBKZ <> '' then
    begin
      if NsoCtrl_blmbbj.SetNewControlProp(ControlID,'EdgeStyle2',YBKZ) = False then
      begin
        MsgInfo('自定义元素设置控件右边框失败！', 2);
      end;
    end;

    if SFYXSC = '0' then
    begin
      if NsoCtrl_blmbbj.SetNewControlProp(ControlID,'DelFlag','True') = False then
      begin
        MsgInfo('自定义元素设置控件可否删除失败！', 2);
      end;
    end
    else
    if SFYXSC = '1' then
    begin
      if NsoCtrl_blmbbj.SetNewControlProp(ControlID,'DelFlag','False') = False then
      begin
        MsgInfo('自定义元素设置控件可否删除失败！', 2);
      end;
    end;

    if SFYXXG = '0' then
    begin
      if NsoCtrl_blmbbj.SetNewControlProp(ControlID,'EditProtect','True') = False then
      begin
        MsgInfo('自定义元素设置控件可否修改失败！', 2);
      end;
    end
    else
    if SFYXXG = '1' then
    begin
      if NsoCtrl_blmbbj.SetNewControlProp(ControlID,'EditProtect','False') = False then
      begin
        MsgInfo('自定义元素设置控件可否修改失败！', 2);
      end;
    end;

    if SFBMLL = '0' then
    begin
      if NsoCtrl_blmbbj.SetNewControlProp(ControlID,'ViewSecret','False') = False then
      begin
        MsgInfo('自定义元素设置控件保密浏览模式失败！', 2);
      end;
    end
    else
    if SFBMLL = '1' then
    begin
      if NsoCtrl_blmbbj.SetNewControlProp(ControlID,'ViewSecret','True') = False then
      begin
        MsgInfo('自定义元素设置控件保密浏览模式失败！', 2);
      end;
    end;

    if SFXML = '0' then
    begin
      if NsoCtrl_blmbbj.SetNewControlProp(ControlID,'IsNotRecordInXML','True') = False then
      begin
        MsgInfo('自定义元素设置控件保密浏览模式失败！', 2);
      end;
    end
    else
    if SFXML = '1' then
    begin
      if NsoCtrl_blmbbj.SetNewControlProp(ControlID,'IsNotRecordInXML','False') = False then
      begin
        MsgInfo('自定义元素设置控件保密浏览模式失败！', 2);
      end;
    end;

    if SFBTX = '0' then
    begin
      if NsoCtrl_blmbbj.SetNewControlProp(ControlID,'MustFillContent','False') = False then
      begin
        MsgInfo('自定义元素设置控件保密浏览模式失败！', 2);
      end;
    end
    else
    if SFBTX = '1' then
    begin
      if NsoCtrl_blmbbj.SetNewControlProp(ControlID,'MustFillContent','True') = False then
      begin
        MsgInfo('自定义元素设置控件保密浏览模式失败！', 2);
      end;
    end;

    if (LX = '1') or (LX = '2') or (LX = '6') or (LX = '7') then
    begin
      if LX = '1' then
        ComboType := 1
      else
      if LX = '2' then
        ComboType := 2
      else
      if LX = '6' then
        ComboType := 3
      else
      if LX = '7' then
        ComboType := 4;

      Cds_PreViewYsxl := TClientDataSet.Create(nil);
      try
        Cds_PreViewYsxl.RemoteServer := DM.SockConn;
        Cds_PreViewYsxl.ProviderName := 'dspDtl6';
        Cds_PreViewYsxl.Close;
        Cds_PreViewYsxl.CommandText := 'select YSBH,YSXLH,KXZ from emr_blysxl where ' +
          'YSBH = ''' + ElementID + '''';

        try
          Cds_PreViewYsxl.Open;
        except
          on e: Exception do
          begin
            MsgInfo('取序列中元素失败，预览失败！', 3);
            Exit;
          end;
        end;
        Cds_PreViewYsxl.First;

        if NsoCtrl_blmbbj.DeleteAllCompoundBoxCodeAndValue(ControlID,ComboType) = False then
        begin
          MsgInfo('自定义元素控件清理选项失败，预览失败！', 3);
          Exit;
        end;

        while not Cds_PreViewYsxl.Eof do
        begin
          if NsoCtrl_blmbbj.SetCompoundBoxCodeAndValue(
               ControlID,
               Cds_PreViewYsxl.FieldByName('KXZ').AsString,
               Cds_PreViewYsxl.FieldByName('YSXLH').AsString,
               ComboType) = False then
          begin
            MsgInfo('自定义元素控件添加可选项失败，预览失败！', 3);
            Exit;
          end;
          Cds_PreViewYsxl.Next;
        end;
      finally
        Cds_PreViewYsxl.Free;
      end;
    end
    else
    if LX = '3' then
    begin
      if WBKZDCD <> '' then
      begin
        try
          if NsoCtrl_blmbbj.SetTextBoxMaxLen(ControlID,StrToInt(WBKZDCD)) = False then
          begin
            MsgInfo('自定义元素控件设置文本框最大长度失败！', 2);
          end;
        except
        end;
      end;
    end
    else
    if LX = '4' then
    begin
      if XZKBT <> '' then
      begin
        if NsoCtrl_blmbbj.SetCheckboxCaption(ControlID,XZKBT) = False then
        begin
          MsgInfo('自定义元素控件设置选择框标题失败！', 2);
        end;
      end;
    end
    else
    if LX = '5' then
    begin
      if SZKZDZ <> '' then
      begin
        try
          if NsoCtrl_blmbbj.SetNumboxMaxValue(ControlID,StrToInt(SZKZDZ)) = False then
          begin
            MsgInfo('自定义元素控件设置数字框最大值失败！', 2);
          end;
        except
        end;
      end;
      if SZKZXZ <> '' then
      begin
        try
          if NsoCtrl_blmbbj.SetNumboxMinValue(ControlID,StrToInt(SZKZXZ)) = False then
          begin
            MsgInfo('自定义元素控件设置数字框最小值失败！', 2);
          end;
        except
        end;
      end;
      if SZKJD <> '' then
      begin
        try
          if NsoCtrl_blmbbj.SetNumboxPrecision(ControlID,StrToInt(SZKJD)) = False then
          begin
            MsgInfo('自定义元素控件设置数字框精度失败！', 2);
          end;
        except
        end;
      end;
      if SZKDW <> '' then
      begin
        if NsoCtrl_blmbbj.SetNumboxUnit(ControlID,SZKDW) = False then
        begin
          MsgInfo('自定义元素控件设置数字框单位失败！', 2);
        end;
      end;
    end
    else
    if LX = '8' then
    begin
      if RQKGS <> '' then
      begin
        try
          if NsoCtrl_blmbbj.SetDateTimeFormat(ControlID,StrToInt(RQKGS)) = False then
          begin
            MsgInfo('自定义元素控件设置日期时间框显示格式失败！', 2);
          end;
        except
        end;
      end;

      if RQKQSSJ <> '' then
      begin
        if NsoCtrl_blmbbj.SetStartDateTime(ControlID,RQKQSSJ) = False then
        begin
          MsgInfo('自定义元素控件设置日期时间框起始时间限制失败！', 2);
        end;
      end;

      if RQKZZSJ <> '' then
      begin
        if NsoCtrl_blmbbj.SetEndDateTime(ControlID,RQKZZSJ) = False then
        begin
          MsgInfo('自定义元素控件设置日期时间框终止时间限制失败！', 2);
        end;
      end;
    end;
  end;

  if YSHZ <> '' then
  begin
    MainSectionEnd := NsoCtrl_blmbbj.GetSectionEnd(ElementName);

    if MainSectionEnd = -1 then
    begin
      MsgInfo('取元素数据节末端出错，预览失败！', 3);
      Exit;
    end;

    NsoCtrl_blmbbj.JumpToOnePostion(MainSectionEnd);
    NsoCtrl_blmbbj.InsertTextAtCurrentCursor(YSHZ);
  end;
end;

function TFrm_main.GetDocErrByCode(ACode: Integer): string;
begin
  case ACode of
    0:Result := '文档打开等操作成功执行';
    1:Result := '文件名称错误';
    2:Result := '文件不存在';
    3:Result := '过滤器出错';
    4:Result := '服务出错，';
    5:Result := '打开的文件是只读';
    6:Result := '文本文档';
    7:Result := '表单文档';
    8:Result := '获得临时文件夹错误';
    9:Result := '保存到临时文件夹错误';
    10:Result := '操作失败';
    11:Result := '新建文档';
    12:Result := '参数错误';
    13:Result := '文件不存在';
    14:Result := '文件存在';
    18:Result := '新建文档，而且已经作过修改';
    19:Result := '文档作了修改';
  else
    Result := '其它情况';
  end;
end;

procedure TFrm_main.NsoShowBar;
begin
  NsoCtrl_blmbbj.SetSpecificToolBarVisible('textobjectbar',True);
  NsoCtrl_blmbbj.SetSpecificToolBarVisible('insertbar',True);
  NsoCtrl_blmbbj.AddGlobalDocumentListener;
  NsoCtrl_blmbbj.SetGlobalDocumentListener(False,False,True,False);
  NsoCtrl_blmbbj.SetStatusBarVisible(True);
  NsoCtrl_blmbbj.SetSpecificToolBarVisible('扩展工具栏1',True);
end;

procedure TFrm_main.ClearFormProp;
begin
  if Assigned(Frm_Prop) then
  begin
    Frm_Prop.Fdt_mbmc.Text := '';
    Frm_Prop.CBox_sslx.ItemIndex := -1;
    Frm_Prop.Fsdt_ssfl.Text := '';
    Frm_Prop.Fsdt_ssfl.Caption := '';
    Frm_Prop.CBox_syxb.ItemIndex := -1;
    Frm_Prop.Fsdt_sybz.Text := '';
    Frm_Prop.Fsdt_sybz.Caption := '';
    Frm_Prop.Lst_sybz.Clear;
    Frm_Prop.Fmmo_ms.Clear;
    DM.cds_dtl5.CommandText := '';
  end;
end;  

function TFrm_main.AddChildNode(ATree: TTreeView; ParentNode: TTreeNode): Boolean;
var
  NodeData: TNodeData;
  NodeObj: TTreeNode;
  Cds_Tview: TClientDataSet;
begin
  Result := True;
  Cds_Tview := TClientDataSet.Create(nil);
  try
    with Cds_Tview do
    begin
      Close;
      RemoteServer := DM.SockConn;
      ProviderName := 'dspDtl5';

      if ATree.Name = 'Tview_zdyys' then
        CommandText := 'Select LBBH,LBMC,PLBBH from emr_blyslb t where PLBBH = ''' +
          TNodeData(ParentNode.Data)^.ID + ''' order by to_number(lbbh)'
      else
      if ATree.Name = 'Tview_nrpd' then
        CommandText := 'Select LBBH,LBMC,PLBBH from EMR_BLNRLB t where PLBBH = ''' +
          TNodeData(ParentNode.Data)^.ID + ''' order by to_number(lbbh)';

      try
        Open;
      except
        on e: Exception do
        begin
          Result := False;
          Exit;
        end;
      end;

      First;
      
      while not eof do
      begin
        New(NodeData);

        NodeData^.ID := FieldByName('LBBH').AsString;
        NodeData^.Name := FieldByName('LBMC').AsString;
        NodeData^.ParentID := FieldByName('PLBBH').AsString;

        NodeData^.IsElement := False;
        NodeObj := ATree.Items.AddChild(ParentNode,NodeData^.Name);
        NodeObj.Data := NodeData;
        NodeObj.ImageIndex := 2;
        NodeObj.SelectedIndex := 2;

        if AddChildNode(ATree, NodeObj) = False then
        begin
          Result := False;
          Exit;
        end;  
        Next;
      end;
    end;
  finally
    Cds_Tview.Free;
  end;
end;  

function TFrm_main.AddChildElement(ATree: TTreeView; ParentNode: TTreeNode): Boolean;
var
  NodeData: TNodeData;
  NodeObj: TTreeNode;
  Cds_Tview: TClientDataSet;
  i: Integer;
begin
  Result := True;
  for i := 0 to ParentNode.Count - 1 do
  begin
    if TNodeData(ParentNode.Item[i].Data)^.IsElement = False then
    begin
      Cds_Tview := TClientDataSet.Create(nil);
      try
        with Cds_Tview do
        begin
          Close;
          RemoteServer := DM.SockConn;
          ProviderName := 'dspDtl6';

          if ATree.Name = 'Tview_zdyys' then
            CommandText := 'Select YSBH,YSSM,YSLBBH from emr_blys where YSLBBH = ''' +
              TNodeData(ParentNode.Item[i].Data)^.ID + ''''
          else
          if ATree.Name = 'Tview_nrpd' then
            CommandText := 'Select NRBH,NRGS,SSLB from EMR_NRPD where SSLB = ''' +
              TNodeData(ParentNode.Item[i].Data)^.ID + '''';

          try
            Open;
          except
            on e: Exception do
            begin
              Result := False;
              Exit;
            end;
          end;

          First;

          while not eof do
          begin
            New(NodeData);

            if ATree.Name = 'Tview_zdyys' then
            begin
              NodeData^.ID := FieldByName('YSBH').AsString;
              NodeData^.Name := FieldByName('YSSM').AsString;
              NodeData^.ParentID := FieldByName('YSLBBH').AsString;
            end
            else
            begin
              NodeData^.ID := FieldByName('NRBH').AsString;
              NodeData^.Name := FieldByName('NRGS').AsString;
              NodeData^.ParentID := FieldByName('SSLB').AsString;
            end;

            NodeData^.IsElement := True;
            NodeObj := ATree.Items.AddChild(ParentNode.Item[i], NodeData^.Name);
            NodeObj.Data := NodeData;
            NodeObj.ImageIndex := 1;
            NodeObj.SelectedIndex := 1;
            Next;
          end;
        end;
      finally
        Cds_Tview.Free;
      end;
    end;
    if AddChildElement(ATree, ParentNode.Item[i]) = False then
    begin
      Result := False;
      Exit;
    end;
  end;
end;

procedure TFrm_main.DisposeChildTreePointers(ParentNode: TTreeNode);
var
  i: Integer;
begin
  if ParentNode = nil then
    Exit;
  for i := 0 to ParentNode.Count - 1 do
  begin
    Dispose(TNodeData(ParentNode.Item[i].Data));
    DisposeChildTreePointers(ParentNode.Item[i]);
  end;
end;

function TFrm_main.SelectOldNode(ATree: TTreeView; ID: string; IsElement: Boolean;
  ParentNode: TTreeNode): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to ParentNode.Count - 1 do
  begin
    if (TNodeData(ParentNode.Item[i].Data)^.IsElement = IsElement) and
      (TNodeData(ParentNode.Item[i].Data)^.ID = ID) then
    begin
      ATree.Select(ParentNode.Item[i]);
      Result := True;
      Exit;
    end;

    if SelectOldNode(ATree, ID, IsElement, ParentNode.Item[i]) = True then
    begin
      Result := True;
      Exit;
    end;
  end;
end;

procedure TFrm_main.RefreshTree(ATree: TTreeView);
var
  NodeData: TNodeData;
  NodeObj: TTreeNode;
  OldSelectID: string;
  OldSelectIsElemengt: Boolean;
  Cds_Tview: TClientDataSet;
begin
  Fsdt_zdyys.Caption := '';
  Fsdt_zdyys.Text := '';
  Fsdt_nrpd.Caption := '';
  Fsdt_nrpd.Text := '';
  OldSelectID := '';
  if ATree.Selected <> nil then
  begin
    OldSelectID := TNodeData(ATree.Selected.Data)^.ID;
    OldSelectIsElemengt := TNodeData(ATree.Selected.Data)^.IsElement;
  end;

  //释放内存
  if ATree.Items.GetFirstNode <> nil then
    Dispose(ATree.Items.GetFirstNode.Data);
  DisposeChildTreePointers(ATree.Items.GetFirstNode);

  ATree.Items.Clear;
  New(NodeData);
  NodeData^.ID := '0';
  
  if ATree.Name = 'Tview_zdyys' then
    NodeData^.Name := '病历元素'
  else
  if ATree.Name = 'Tview_nrpd' then
    NodeData^.Name := '内容片段';
  
  NodeData^.ParentID := '-1';
  NodeData.IsElement := False;

  if ATree.Name = 'Tview_zdyys' then
    NodeObj := ATree.Items.AddFirst(nil,'病历元素')
  else
  if ATree.Name = 'Tview_nrpd' then
    NodeObj := ATree.Items.AddFirst(nil,'内容片段');

  NodeObj.Data := NodeData;
  NodeObj.ImageIndex := 2;
  NodeObj.SelectedIndex := 2;
  
  if AddChildNode(ATree, NodeObj) = False then
  begin
    MsgInfo('查询数据库生成类别树失败！', 3);
    Exit;
  end;

  Cds_Tview := TClientDataSet.Create(nil);
  try
    with Cds_Tview do
    begin
      Close;
      RemoteServer := DM.SockConn;
      ProviderName := 'dspDtl5';

      if ATree.Name = 'Tview_zdyys' then
        CommandText := 'Select YSBH,YSSM,YSLBBH from emr_blys where YSLBBH = ''' +
          TNodeData(ATree.Items.GetFirstNode.Data)^.ID + ''''
      else
      if ATree.Name = 'Tview_nrpd' then
        CommandText := 'Select NRBH,NRGS,SSLB from EMR_NRPD where SSLB = ''' +
          TNodeData(ATree.Items.GetFirstNode.Data)^.ID + '''';

      try
        Open;
      except
        on e: Exception do
        begin
          MsgInfo('向类别树添加元素失败！', 3);
          Exit;
        end;
      end;
      First;
      while not Eof do
      begin
        New(NodeData);

        if ATree.Name = 'Tview_zdyys' then
        begin
          NodeData^.ID := FieldByName('YSBH').AsString;
          NodeData^.Name := FieldByName('YSSM').AsString;
          NodeData^.ParentID := FieldByName('YSLBBH').AsString;
        end
        else
        begin
          NodeData^.ID := FieldByName('NRBH').AsString;
          NodeData^.Name := FieldByName('NRGS').AsString;
          NodeData^.ParentID := FieldByName('SSLB').AsString;
        end;

        NodeData^.IsElement := True;

        NodeObj := ATree.Items.AddChild(ATree.Items.GetFirstNode,NodeData^.Name);
        NodeObj.Data := NodeData;
        NodeObj.ImageIndex := 1;
        NodeObj.SelectedIndex := 1;

        Next;
      end;
    end;
  finally
    Cds_Tview.Free;
  end;

  if AddChildElement(ATree, ATree.Items.GetFirstNode) = False then
  begin
    MsgInfo('向类别树添加元素失败！', 3);
    Exit;
  end;

  if OldSelectID <> '' then
    SelectOldNode(ATree, OldSelectID, OldSelectIsElemengt, ATree.Items.GetFirstNode);
end;

procedure TFrm_main.ShowButtons;
var
  i, j: Integer;
  s: string;
begin
  j := 0;
  for i := 1 to 100 do
  begin
    if NsoCtrl_blmbbj.IsToolbarItemOn(IntToStr(i)) = true then
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

function TFrm_main.GetKsByYhbs(bs: string): string;
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

function TFrm_main.IsMyMbOrNot(mbID: string): Boolean;
var
  Cds_sq: TClientDataSet;
begin
  Cds_sq := TClientDataSet.Create(nil);
  try
    with Cds_sq do
    begin
      RemoteServer := DM.SockConn;
      ProviderName := 'dspDtl7';
      CommandText := 'select CJR from emr_blmb where MBID = ''' + mbID + '''';

      try
        Open;
      except
        on e: Exception do
        begin
          MsgInfo('取模板信息失败！' + e.Message, 3);
          Result := False;
          Exit;
        end;
      end;

      if RecordCount = 0 then
      begin
        MsgInfo('取模板信息失败！', 3);
        Result := False;
        Exit;
      end;

      if FieldByName('CJR').AsString = Yhxx.yhbs then
        Result := True
      else
        Result := False;
    end;
  finally
    Cds_sq.Free;
  end;
end;

function TFrm_main.LoadMbFileByID(Lfilename, mbID: string): Boolean;
var
  Cds_sq: TClientDataSet;
begin
  Cds_sq := TClientDataSet.Create(nil);
  try
    with Cds_sq do
    begin
      RemoteServer := DM.SockConn;
      ProviderName := 'dspDtl7';
      CommandText := 'select mbwj from emr_blmb where mbwj is not null and ' +
        'MBID = ''' + mbID + '''';

      try
        Open;
      except
        on e: Exception do
        begin
          MsgInfo('取模板信息失败！' + e.Message, 3);
          Result := False;
          Exit;
        end;
      end;

      if RecordCount = 0 then
      begin
        Result := False;
        Exit;
      end;

      if TMemoField(FieldByName('mbwj')).BlobSize <> 0 then
      begin
        TMemoField(FieldByName('mbwj')).SaveToFile(Lfilename);
        Result := True
      end
      else
        Result := False;
    end;
  finally
    Cds_sq.Free;
  end;

end;  

function TFrm_main.IntToStrCount(AInt, ACount: Integer): string;
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

function TFrm_main.GetDateTimeStr(ADateTime: TDateTime; kind: Integer): string;
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

function TFrm_main.GetExistsFileName(APath: string): string;
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

procedure TFrm_main.InitMbs;
var
  NodeData: TNodeData;
  FirstNode,NodeObj,ChildNodeObj,MbNodeObj: TTreeNode;
  strMblx: array[1..4] of string;
  i: Integer;
  Cds_mbfl: TClientDataSet;
  Cds_mb: TClientDataSet;
  OldNodeID: string;
  OldIsElement: Boolean;
begin
  //保存现场
  OldNodeID := '';
  if (Tview_mbs.Selected <> nil) and (Tview_mbs.Selected.Data <> nil) then
  begin
    OldNodeID := TNodeData(Tview_mbs.Selected.Data)^.ID;
    OldIsElement := TNodeData(Tview_mbs.Selected.Data)^.IsElement;
  end;

  //释放指针
  if Tview_mbs.Items.GetFirstNode <> nil then
    Dispose(Tview_mbs.Items.GetFirstNode.Data);
  DisposeChildTreePointers(Tview_mbs.Items.GetFirstNode);

  Tview_mbs.Items.Clear;
  New(NodeData);
  NodeData^.ID := '0';
  NodeData^.Name := '病历模板';
  NodeData^.ParentID := '-1';
  NodeData.IsElement := False;
  FirstNode := Tview_mbs.Items.AddFirst(nil,'病历模板');
  FirstNode.Data := NodeData;
  FirstNode.ImageIndex := 2;
  FirstNode.SelectedIndex := 2;

  strMblx[1] := '全院';
  strMblx[2] := '科室';
  strMblx[3] := '个人';
  strMblx[4] := '授权';
  for i := 1 to 4 do
  begin
    New(NodeData);
    NodeData^.ID := '0' + IntToStr(i) ;
    NodeData^.Name := strMblx[i];
    NodeData^.ParentID := '0';
    NodeData.IsElement := False;
    NodeObj := Tview_mbs.Items.AddChild(FirstNode,strMblx[i]);
    NodeObj.Data := NodeData;
    NodeObj.ImageIndex := 2;
    NodeObj.SelectedIndex := 2;
    Cds_mbfl := TClientDataSet.Create(nil);
    try
      with Cds_mbfl do
      begin
        RemoteServer := DM.SockConn;
        ProviderName := 'dspDtl6';
        Close;
        CommandText := 'select * from emr_blmbfl';
        try
          Open;
        except
          on e: Exception do
          begin
            MsgInfo('由数据集创建模板名称树失败！程序即将退出！' + #13#10 +
              e.Message, 3);
            Frm_main.Close;
          end;
        end;
        First;
        while not Eof do
        begin
          New(NodeData);
          NodeData^.ID := TNodeData(NodeObj.Data)^.ID + FieldByName('FLBH').AsString;
          NodeData^.Name := FieldByName('FLMC').AsString;
          NodeData^.ParentID := TNodeData(NodeObj.Data)^.ID;
          NodeData.IsElement := False;
          ChildNodeObj := Tview_mbs.Items.AddChild(NodeObj,FieldByName('FLMC').AsString);
          ChildNodeObj.Data := NodeData;
          ChildNodeObj.ImageIndex := 2;
          ChildNodeObj.SelectedIndex := 2;

          if i = 3 then
          begin
            Cds_mb := TClientDataSet.Create(nil);
            try
              Cds_mb.RemoteServer := DM.SockConn;
              Cds_mb.ProviderName := 'dspDtl5';
              Cds_mb.Close;
              Cds_mb.CommandText := 'select MBID,SSFL,SSLX,MBMC,SYBZ,MS,SSKS,CJR,CJSJ ' +
                'from emr_blmb where CJR = ''' + Yhxx.yhbs +
                ''' and SSLX||SSFL = ''' + TNodeData(ChildNodeObj.Data)^.ID + '''';
              try
                Cds_mb.Open;
              except
                on e: Exception do
                begin
                  MsgInfo('由数据集创建模板名称树失败！程序即将退出！' + #13#10 +
                    e.Message, 3);
                  Frm_main.Close;
                end;
              end;
              Cds_mb.First;
              while not Cds_mb.Eof do
              begin
                New(NodeData);
                NodeData^.ID := Cds_mb.FieldByName('MBID').AsString;
                NodeData^.Name := Cds_mb.FieldByName('MBMC').AsString;
                NodeData^.ParentID := TNodeData(ChildNodeObj.Data)^.ID;
                NodeData.IsElement := True;
                MbNodeObj := Tview_mbs.Items.AddChild(ChildNodeObj,Cds_mb.FieldByName('MBMC').AsString);
                MbNodeObj.Data := NodeData;
                MbNodeObj.ImageIndex := 1;
                MbNodeObj.SelectedIndex := 1;
                Cds_mb.Next;
              end;
            finally
              Cds_mb.Free;
            end;
          end
          else
          if i = 4 then
          begin
            Cds_mb := TClientDataSet.Create(nil);
            try
              Cds_mb.RemoteServer := DM.SockConn;
              Cds_mb.ProviderName := 'dspDtl5';
              Cds_mb.Close;
              Cds_mb.CommandText := 'select MBID,SSFL,SSLX,MBMC,SYBZ,MS,SSKS,CJR,CJSJ ' +
                'from emr_blmb t where SFWC = ''1'' and ' +
                '(select count(*) from emr_mbsq x where x.MBID = t.MBID and ' +
                  'x.yxsj > to_date(''' + GetDateTimeStr(Now, 0) + ''',''yyyy-mm-dd hh24:mi:ss'')) > 0 and ' +
                't.SSFL = ''' + Copy(TNodeData(ChildNodeObj.Data)^.ID,3,Length(TNodeData(ChildNodeObj.Data)^.ID) - 2) + '''';
              try
                Cds_mb.Open;
              except
                on e: Exception do
                begin
                  MsgInfo('由数据集创建模板名称树失败！程序即将退出！' + #13#10 +
                    e.Message, 3);
                  Frm_main.Close;
                end;
              end;
              Cds_mb.First;
              while not Cds_mb.Eof do
              begin
                New(NodeData);
                NodeData^.ID := Cds_mb.FieldByName('MBID').AsString;
                NodeData^.Name := Cds_mb.FieldByName('MBMC').AsString;
                NodeData^.ParentID := TNodeData(ChildNodeObj.Data)^.ID;
                NodeData.IsElement := True;
                MbNodeObj := Tview_mbs.Items.AddChild(ChildNodeObj,Cds_mb.FieldByName('MBMC').AsString);
                MbNodeObj.Data := NodeData;
                MbNodeObj.ImageIndex := 1;
                MbNodeObj.SelectedIndex := 1;
                Cds_mb.Next;
              end;
            finally
              Cds_mb.Free;
            end;
          end
          else
          begin
            Cds_mb := TClientDataSet.Create(nil);
            try
              Cds_mb.RemoteServer := DM.SockConn;
              Cds_mb.ProviderName := 'dspDtl5';
              Cds_mb.Close;
              Cds_mb.CommandText := 'select MBID,SSFL,SSLX,MBMC,SYBZ,MS,SSKS,CJR,CJSJ ' +
                'from emr_blmb where CJR = ''' + Yhxx.yhbs + ''' and ' +
                'SSLX||SSFL = ''' + TNodeData(ChildNodeObj.Data)^.ID + ''' union ' +
                'select MBID,SSFL,SSLX,MBMC,SYBZ,MS,SSKS,CJR,CJSJ ' +
                'from emr_blmb where SFWC = ''1'' and SSLX||SSFL = ''' + TNodeData(ChildNodeObj.Data)^.ID + '''';
              try
                Cds_mb.Open;
              except
                on e: Exception do
                begin
                  MsgInfo('由数据集创建模板名称树失败！程序即将退出！' + #13#10 +
                    e.Message, 3);
                  Frm_main.Close;
                end;
              end;
              Cds_mb.First;
              while not Cds_mb.Eof do
              begin
                New(NodeData);
                NodeData^.ID := Cds_mb.FieldByName('MBID').AsString;
                NodeData^.Name := Cds_mb.FieldByName('MBMC').AsString;
                NodeData^.ParentID := TNodeData(ChildNodeObj.Data)^.ID;
                NodeData.IsElement := True;
                MbNodeObj := Tview_mbs.Items.AddChild(ChildNodeObj,Cds_mb.FieldByName('MBMC').AsString);
                MbNodeObj.Data := NodeData;
                MbNodeObj.ImageIndex := 1;
                MbNodeObj.SelectedIndex := 1;
                Cds_mb.Next;
              end;
            finally
              Cds_mb.Free;
            end;
          end;
          Next;
        end;
      end;  
    finally
      Cds_mbfl.Free;
    end;
  end;    

  if OldNodeID <> '' then
    SelectOldNode(Tview_mbs, OldNodeID, OldIsElement, Tview_mbs.Items.GetFirstNode);
end;

procedure TFrm_main.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  if Grp_mbs.Visible = True then
  begin
    //模板框
    Grp_mbs.Left := 10;
    Grp_mbs.Top := 5;
    Grp_mbs.Height := Frm_main.Height - 45;
    Grp_mbs.Width := 250;

    //模板树
//    Lb_mbs.Left := 14;
//    Lb_mbs.Top := 25;
//    Lb_mbs.Height := 30;
//    Lb_mbs.Width := 221;
//    Fsdt_mbs.Left := 24;
//    Fsdt_mbs.Top := 65;
//    Fsdt_mbs.Height := 20;
//    Fsdt_mbs.Width := 201;
    Tview_mbs.Left := 10;
    Tview_mbs.Top := 15;
    Tview_mbs.Height := Grp_mbs.Height - 25;
    Tview_mbs.Width := 228;

    pgc_Select.Visible := False
  end
  else
  begin
    //预定义框
    pgc_Select.Left := 10;
    pgc_Select.Top := 5;
    pgc_Select.Height := Frm_main.Height - 45;
    pgc_Select.Width := 250;

    //自定义元素
    Lb_zdyys.Left := 10;
    Lb_zdyys.Top := 10;
    Lb_zdyys.Height := 30;
    Lb_zdyys.Width := 221;
    Fsdt_zdyys.Left := 20;
    Fsdt_zdyys.Top := 50;
    Fsdt_zdyys.Height := 20;
    Fsdt_zdyys.Width := 201;
    Tview_zdyys.Left := 5;
    Tview_zdyys.Top := 85;
    Tview_zdyys.Height := pgc_Select.Height - 120;
    Tview_zdyys.Width := 230;

    //系统元素
//    Lb_xtys.Left := 10;
//    Lb_xtys.Top := 10;
//    Lb_xtys.Height := 30;
//    Lb_xtys.Width := 221;
//    Fsdt_xtys.Left := 20;
//    Fsdt_xtys.Top := 50;
//    Fsdt_xtys.Height := 20;
//    Fsdt_xtys.Width := 201;
//    Tview_xtys.Left := 5;
//    Tview_xtys.Top := 85;
//    Tview_xtys.Height := pgc_Select.Height - 120;
//    Tview_xtys.Width := 230;

    //内容片断
    Lb_nrpd.Left := 10;
    Lb_nrpd.Top := 10;
    Lb_nrpd.Height := 30;
    Lb_nrpd.Width := 221;
    Fsdt_nrpd.Left := 20;
    Fsdt_nrpd.Top := 50;
    Fsdt_nrpd.Height := 20;
    Fsdt_nrpd.Width := 201;
    Tview_nrpd.Left := 5;
    Tview_nrpd.Top := 85;
    Tview_nrpd.Height := pgc_Select.Height - 120;
    Tview_nrpd.Width := 230;
    pgc_Select.Visible := True;
  end;

  //编辑器框
  Grp_blmbbj.Left := 270;
  Grp_blmbbj.Top := 5;
  Grp_blmbbj.Height := Frm_main.Height - 45;
  Grp_blmbbj.Width := Frm_main.Width - 285;
  NsoCtrl_blmbbj.Left := 10;
  NsoCtrl_blmbbj.Top := 15;
  NsoCtrl_blmbbj.Height := Grp_blmbbj.Height - 25;
  NsoCtrl_blmbbj.Width := Grp_blmbbj.Width - 20;
end;

procedure TFrm_main.FormShow(Sender: TObject);
var
  sr: TSearchRec;
  Path: string;
begin
  NsoCtrl_blmbbj.KillSofficeBin;

  Path := ExePath + 'DocTempFiles/';

  if DirectoryExists(Path) = False then
  begin
    if CreateDir(Path) = False then
    begin
      MsgInfo('文档临时文件夹不存在且创建失败，程序将退出！', 3);
      Frm_main.Close;
      Exit;
    end;
  end
  else
  begin
    if FindFirst(Path + '*.*', faAnyFile, sr) = 0 then
    begin
      repeat
        if (Pos('.odt#', sr.Name) <> 0) or (Pos('.odt', sr.Name) <> 0) then
        begin
          if DeleteFile(Path + sr.Name) = False then
          begin
//            MsgInfo('清理临时文件' + Path + sr.Name + '失败！' + #13#10 +
//              '请确保只打开了一个模板编辑模块，且没有挂起的模板编辑器！', 3);
//            Frm_main.Close;
//            Exit;
          end;
        end;
      until FindNext(sr) <> 0;
    end;
    FindClose(sr);
  end;

  Grp_mbs.Visible := True;
  pgc_Select.Visible := False;
  InitMbs;

//  MsgInfo(FileName, 1);
end;

procedure TFrm_main.Mitem_NewClick(Sender: TObject);
var
  sslx: string;
begin
  if not Assigned(Frm_Prop) then
    Frm_Prop := TFrm_Prop.Create(Self);
  ClearFormProp;
  Frm_Prop.Edt_mbid.Text := '';
  sslx := Copy(TNodeData(Tview_mbs.Selected.Data)^.ID, 1, 2);
  if sslx <> '04' then
  begin
    Frm_Prop.CBox_sslx.ItemIndex := StrToInt(sslx) - 1;
    Frm_Prop.Fsdt_ssfl.Text := TNodeData(Tview_mbs.Selected.Data)^.Name;
    Frm_Prop.Fsdt_ssfl.Caption := Copy(TNodeData(Tview_mbs.Selected.Data)^.ID, 3,
      Length(TNodeData(Tview_mbs.Selected.Data)^.ID) - 2);
  end
  else
  begin
    Exit;
  end;
  Frm_Prop.ShowModal;

//  ShowMessage(DM.cds_dtl5.CommandText);
  if DM.cds_dtl5.CommandText <> '' then
  begin
    TemplateID := DM.cds_dtl5.CommandText;
    Grp_mbs.Visible := False;
    pgc_Select.Visible := True;
    if Tview_zdyys.Items.GetFirstNode = nil then
      RefreshTree(Tview_zdyys);
    if Tview_nrpd.Items.GetFirstNode = nil then
      RefreshTree(Tview_nrpd);
    NsoCtrl_blmbbj.CreateNew('swriter');
    NsoShowBar;
  end
  else
  begin
    TemplateID := '';
  end;
end;

procedure TFrm_main.Mitem_EditClick(Sender: TObject);
var
  mbID, filename: string;
  errcode: Integer;
begin
  if not Assigned(Frm_Prop) then
    Frm_Prop := TFrm_Prop.Create(Self);
  ClearFormProp;
  Frm_Prop.Fdt_mbmc.Text := TNodeData(Tview_mbs.Selected.Data)^.Name;
  Frm_Prop.Edt_mbid.Text := TNodeData(Tview_mbs.Selected.Data)^.ID;
  Frm_Prop.Fsdt_ssfl.Caption := Copy(TNodeData(Tview_mbs.Selected.Parent.Data)^.ID, 3,
    Length(TNodeData(Tview_mbs.Selected.Parent.Data)^.ID) - 2);
  Frm_Prop.Fsdt_ssfl.Text := TNodeData(Tview_mbs.Selected.Parent.Data)^.Name;
  Frm_Prop.CBox_sslx.ItemIndex := StrToInt(Copy(TNodeData(Tview_mbs.Selected.Parent.Data)^.ID, 1, 2)) - 1;
  Frm_Prop.ShowModal;

//  ShowMessage(DM.cds_dtl5.CommandText);

  mbID := DM.cds_dtl5.CommandText;

  if mbID <> '' then
  begin
    TemplateID := mbID;
    filename := GetExistsFileName(ExePath + 'DocTempFiles\');
    if LoadMbFileByID(filename, mbID) = False then
    begin
      if MsgYesNO('从数据库取模板文件失败，是否打开空白文档进行编辑？', False) = mrYes then
      begin
        Grp_mbs.Visible := False;
        pgc_Select.Visible := True;
        if Tview_zdyys.Items.GetFirstNode = nil then
          RefreshTree(Tview_zdyys);
        if Tview_nrpd.Items.GetFirstNode = nil then
          RefreshTree(Tview_nrpd);
        NsoCtrl_blmbbj.CreateNew('swriter');
        NsoShowBar;
      end;
    end
    else
    begin
      errcode := NsoCtrl_blmbbj.OpenDocument(filename, 2);
      if errcode <> wdSuccess then
      begin
        MsgInfo('编辑器打开模板文件失败！' + #13#10 +
          '错误信息：' + GetDocErrByCode(errcode), 3);
        NsoCtrl_blmbbj.Close;
        NsoCtrl_blmbbj.DeleteOfficeAppData;
      end
      else
      begin
        Grp_mbs.Visible := False;
        pgc_Select.Visible := True;
        if Tview_zdyys.Items.GetFirstNode = nil then
          RefreshTree(Tview_zdyys);
        if Tview_nrpd.Items.GetFirstNode = nil then
          RefreshTree(Tview_nrpd);
        NsoShowBar;
      end;
    end;
  end
  else
    TemplateID := '';
end;

procedure TFrm_main.PupMenu_1Popup(Sender: TObject);
var
  sslx: string;
begin
  if Grp_mbs.Visible = False then
  begin
    Exit;
  end;

  if Tview_mbs.Selected = nil then
  begin
    Exit;
  end;

  if TNodeData(Tview_mbs.Selected.Data)^.IsElement = True then
  begin
    sslx := Copy(TNodeData(Tview_mbs.Selected.Data)^.ParentID, 1, 2);

    if (sslx = '01') or (sslx = '02') then
    begin
      if IsMyMbOrNot(TNodeData(Tview_mbs.Selected.Data)^.ID) = True then
      begin
        Mitem_New.Visible := False;
        Mitem_Edit.Visible := True;
        Mitem_Prop.Visible := True;
        Mitem_Inherit.Visible := True;
        Mitem_Del.Visible := True;
      end
      else
      begin
        Mitem_New.Visible := False;
        Mitem_Edit.Visible := False;
        Mitem_Prop.Visible := False;
        Mitem_Inherit.Visible := True;
        Mitem_Del.Visible := False;
      end;  
    end
    else
    if sslx = '03' then
    begin
      Mitem_New.Visible := False;
      Mitem_Edit.Visible := True;
      Mitem_Prop.Visible := True;
      Mitem_Inherit.Visible := True;
      Mitem_Del.Visible := True;
    end
    else
    if sslx = '04' then
    begin
      Mitem_New.Visible := False;
      Mitem_Edit.Visible := False;
      Mitem_Prop.Visible := False;
      Mitem_Inherit.Visible := True;
      Mitem_Del.Visible := False;
    end;    
  end
  else
  begin
    if Length(TNodeData(Tview_mbs.Selected.Data)^.ID) < 4 then
      Mitem_New.Enabled := False
    else
    if Copy(TNodeData(Tview_mbs.Selected.Data)^.ID, 1, 2) = '04' then
      Mitem_New.Enabled := False
    else
      Mitem_New.Enabled := True;

    Mitem_New.Visible := True;
    Mitem_Edit.Visible := False;
    Mitem_Prop.Visible := False;
    Mitem_Inherit.Visible := False;
    Mitem_Del.Visible := False;
  end;  
end;

procedure TFrm_main.Mitem_PropClick(Sender: TObject);
var
  mbID: string;
  filename: string;
begin
  if not Assigned(Frm_Prop) then
    Frm_Prop := TFrm_Prop.Create(Self);
  ClearFormProp;
  Frm_Prop.Fdt_mbmc.Text := TNodeData(Tview_mbs.Selected.Data)^.Name;
  Frm_Prop.Edt_mbid.Text := TNodeData(Tview_mbs.Selected.Data)^.ID;
  Frm_Prop.Fsdt_ssfl.Caption := Copy(TNodeData(Tview_mbs.Selected.Parent.Data)^.ID, 3,
    Length(TNodeData(Tview_mbs.Selected.Parent.Data)^.ID) - 2);
  Frm_Prop.Fsdt_ssfl.Text := TNodeData(Tview_mbs.Selected.Parent.Data)^.Name;
  Frm_Prop.CBox_sslx.ItemIndex := StrToInt(Copy(TNodeData(Tview_mbs.Selected.Parent.Data)^.ID, 1, 2)) - 1;
  Frm_Prop.ShowModal;

end;

procedure TFrm_main.Mitem_InheritClick(Sender: TObject);
var
  mbID, filename: string;
  errcode: Integer;
begin
  if not Assigned(Frm_Prop) then
    Frm_Prop := TFrm_Prop.Create(Self);
  ClearFormProp;
  Frm_Prop.Fdt_mbmc.Text := TNodeData(Tview_mbs.Selected.Data)^.Name;
  Frm_Prop.Edt_mbid.Text := '';
  Frm_Prop.Fsdt_ssfl.Caption := Copy(TNodeData(Tview_mbs.Selected.Parent.Data)^.ID, 3,
    Length(TNodeData(Tview_mbs.Selected.Parent.Data)^.ID) - 2);
  Frm_Prop.Fsdt_ssfl.Text := TNodeData(Tview_mbs.Selected.Parent.Data)^.Name;
  Frm_Prop.CBox_sslx.ItemIndex := StrToInt(Copy(TNodeData(Tview_mbs.Selected.Parent.Data)^.ID, 1, 2)) - 1;
  Frm_Prop.ShowModal;

//  ShowMessage(DM.cds_dtl5.CommandText);

  mbID := TNodeData(Tview_mbs.Selected.Data)^.ID;

  if mbID <> '' then
  begin
    filename := GetExistsFileName(ExePath + 'DocTempFiles\');
    if LoadMbFileByID(filename, mbID) = False then
    begin
      if MsgYesNO('从数据库取模板文件失败，是否打开空白文档进行编辑？', False) = mrYes then
      begin
        Grp_mbs.Visible := False;
        pgc_Select.Visible := True;
        if Tview_zdyys.Items.GetFirstNode = nil then
          RefreshTree(Tview_zdyys);
        if Tview_nrpd.Items.GetFirstNode = nil then
          RefreshTree(Tview_nrpd);
        NsoCtrl_blmbbj.CreateNew('swriter');
        NsoShowBar;
      end;
    end
    else
    begin
      errcode := NsoCtrl_blmbbj.OpenDocument(filename, 2);
      if errcode <> wdSuccess then
      begin
        MsgInfo('编辑器打开模板文件失败！' + #13#10 +
          '错误信息：' + GetDocErrByCode(errcode), 3);
        NsoCtrl_blmbbj.Close;
        NsoCtrl_blmbbj.DeleteOfficeAppData;
      end
      else
      begin
        Grp_mbs.Visible := False;
        pgc_Select.Visible := True;
        if Tview_zdyys.Items.GetFirstNode = nil then
          RefreshTree(Tview_zdyys);
        if Tview_nrpd.Items.GetFirstNode = nil then
          RefreshTree(Tview_nrpd);
        NsoShowBar;
      end;
    end;
  end
  else
    TemplateID := '';
end;

procedure TFrm_main.Tmr_saveTimer(Sender: TObject);
begin
//
end;

procedure TFrm_main.Mitem_FreshElementClick(Sender: TObject);
begin
  RefreshTree(Tview_zdyys);
end;

procedure TFrm_main.Mitem_FreshContentClick(Sender: TObject);
begin
  RefreshTree(Tview_nrpd);
end;

procedure TFrm_main.PupMenu_2Popup(Sender: TObject);
begin
  if Tview_zdyys.Focused then
  begin
    Mitem_FreshElement.Visible := True;
    Mitem_FreshContent.Visible := False;
  end
  else
  if Tview_nrpd.Focused then
  begin
    Mitem_FreshElement.Visible := False;
    Mitem_FreshContent.Visible := True;
  end;
end;

procedure TFrm_main.Fsdt_zdyysClick(Sender: TObject);
var
  ysid: string;
begin
  if not ShowDictIpt(DictIpt1, TWinControl(Fsdt_zdyys), ExePath + 'Dict\emr_blys_lb.xml', ysid, Screen) then
    Exit;
  Fsdt_zdyys.Caption := ysid;
  Fsdt_zdyys.SetFocus;
end;

procedure TFrm_main.Fsdt_zdyysDownClick(Sender: TObject);
var
  Cds_Down: TClientDataSet;
begin
  Cds_Down := TClientDataSet.Create(nil);
  try
    with Cds_Down do
    begin
      RemoteServer := DM.SockConn;
      ProviderName := 'dspDtl6';
      CommandText := 'select * from ' +
        '(select ''元素-''||ysbh as Code,YSSM as Name,''          '' as Input_Code ' +
        'from emr_blys union ' +
        'select ''类别-''||lbbh as Code,lbmc as Name,''          '' as Input_Code ' +
        'from emr_blyslb where lbbh <> ''0'') order by Name';
      try
        Open;
      except
        on e: Exception do
        begin
          MsgInfo('元素字典刷新失败！' + e.Message, 3);
          Exit;
        end;
      end;
      First;
      while not Eof do
      begin
        Edit;
        FieldByName('Input_Code').AsString :=
          GetSpellCode(PChar(FieldByName('Name').AsString),2,8);
        Next;
      end;
      SaveToFile(ExePath + 'Dict\emr_blys_lb.xml', dfXML);
    end;
    MsgInfo('元素字典刷新成功！', 2);
  finally
    Cds_Down.Free;
  end;
end;

procedure TFrm_main.Fsdt_zdyysKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  NowNode: TTreeNode;
begin
  if Key = VK_RETURN then
  begin
    if Fsdt_zdyys.Caption = '' then
    begin
      MsgInfo('查询元素不能为空！', 2);
      Fsdt_zdyys.SetFocus;
      Exit;
    end
    else
    begin
      NowNode := Tview_zdyys.Items.GetFirstNode;
      while NowNode <> nil do
      begin
        if (TNodeData(NowNode.Data)^.IsElement = True) and
          (Copy(Fsdt_zdyys.Caption, 6, Length(Fsdt_zdyys.Caption) - 5) =
            TNodeData(NowNode.Data)^.ID) and
          (Copy(Fsdt_zdyys.Caption, 1, 5) = '元素-') then
        begin
          Tview_zdyys.Select(NowNode);
        end;

        if (TNodeData(NowNode.Data)^.IsElement = False) and
          (Copy(Fsdt_zdyys.Caption, 6, Length(Fsdt_zdyys.Caption) - 5) =
            TNodeData(NowNode.Data)^.ID) and
          (Copy(Fsdt_zdyys.Caption, 1, 5) = '类别-') then
        begin
          Tview_zdyys.Select(NowNode);
        end;

        NowNode := NowNode.GetNext;
      end;  
    end;
  end;
end;

procedure TFrm_main.Btn_1Click(Sender: TObject);
begin
  if Btn_1.Caption = '1' then
  begin
    pgc_Select.Visible := True;
    Grp_mbs.Visible := False;
    Btn_1.Caption := '2';
  end
  else
  begin
    pgc_Select.Visible := False;
    Grp_mbs.Visible := True;
    Btn_1.Caption := '1';
  end;
end;

procedure TFrm_main.FormClose(Sender: TObject; var Action: TCloseAction);
var
  sr: TSearchRec;
  Path: string;
begin
  DictIpt1.Free;
  NsoCtrl_blmbbj.Close;
  NsoCtrl_blmbbj.DeleteOfficeAppData;
  NsoCtrl_blmbbj.RemoveAllListener;

  Path := ExePath + 'DocTempFiles/';

  if FindFirst(Path + '*.*', faAnyFile, sr) = 0 then
  begin
    repeat
      if (Pos('.odt#', sr.Name) <> 0) or (Pos('.odt', sr.Name) <> 0) then
      begin
        if DeleteFile(Path + sr.Name) = False then
        begin
//            MsgInfo('清理临时文件' + Path + sr.Name + '失败！' + #13#10 +
//              '请确保只打开了一个模板编辑模块，且没有挂起的模板编辑器！', 3);
//            Frm_main.Close;
//            Exit;
        end;
      end;
    until FindNext(sr) <> 0;
  end;
  FindClose(sr);
end;

procedure TFrm_main.Mitem_DelClick(Sender: TObject);
var
  Cds_Del: TClientDataSet;
  SelectedNode: TTreeNode;
begin
  if Tview_mbs.Selected = nil then
  begin
    MsgInfo('选中项为空！', 2);
    Exit;
  end;

  if not Assigned(Tview_mbs.Selected.Data) then
  begin
    MsgInfo('选中项为空！', 2);
    Exit;
  end;

  TemplateID := '';

  if MsgYesNO('真的要删除模板[ ' + TNodeData(Tview_mbs.Selected.Data)^.Name + ' ]吗？')
    = mrYes then
  begin
    SelectedNode := Tview_mbs.Selected;
    Cds_Del := TClientDataSet.Create(nil);
    try
      with Cds_Del do
      begin
        RemoteServer := DM.SockConn;
        ProviderName := 'dspDtl4';
        CommandText := 'delete from emr_blmb where MBID = ''' +
          TNodeData(SelectedNode.Data)^.ID + '''';

        try
          Execute;
          MsgInfo('模板[' + TNodeData(SelectedNode.Data)^.Name + ']已删除！', 2);

          if SelectedNode.GetPrev <> nil then
            Tview_mbs.Select(SelectedNode.GetPrev)
          else
          if SelectedNode.GetNext <> nil then
            Tview_mbs.Select(SelectedNode.GetNext);

          SelectedNode.Delete;
        except
          on e: Exception do
          begin
            MsgInfo('删除病历模板失败！' + #13#10 +
              '错误信息：' + e.Message, 3);
            Exit;
          end;  
        end;
      end;  
    finally
      Cds_Del.Free;
    end;
  end;
end;

procedure TFrm_main.Mitem_R1Click(Sender: TObject);
begin
  InitMbs;
end;

procedure TFrm_main.NsoCtrl_blmbbjNsoToolbarAddinEvent(Sender: TObject;
  nID: Integer; const sRev1, sRev2: WideString);
begin
  case nID of
  1:ProtectTableCell;
  2:DeProtectTableCell;
  3:SaveToDB;
  4:InsertSection;
  5:DeleteSection;
  6:InsertSelectContent;
  end;
end;

procedure TFrm_main.Fsdt_nrpdClick(Sender: TObject);
var
  nrid: string;
begin
  if not ShowDictIpt(DictIpt1, TWinControl(Fsdt_nrpd), ExePath + 'Dict\emr_nrpd_lb.xml', nrid, Screen) then
    Exit;
  Fsdt_nrpd.Caption := nrid;
  Fsdt_nrpd.SetFocus;
end;

procedure TFrm_main.Fsdt_nrpdDownClick(Sender: TObject);
var
  Cds_Down: TClientDataSet;
begin
  Cds_Down := TClientDataSet.Create(nil);
  try
    with Cds_Down do
    begin
      RemoteServer := DM.SockConn;
      ProviderName := 'dspDtl6';
      CommandText := 'select * from ' +
        '(select ''片段-''||nrbh as Code,nrgs as Name,''          '' as Input_Code ' +
        'from emr_nrpd union ' +
        'select ''类别-''||lbbh as Code,lbmc as Name,''          '' as Input_Code ' +
        'from emr_blnrlb where lbbh <> ''0'') order by Name';
      try
        Open;
      except
        on e: Exception do
        begin
          MsgInfo('内容片段字典刷新失败！' + e.Message, 3);
          Exit;
        end;
      end;
      First;
      while not Eof do
      begin
        Edit;
        FieldByName('Input_Code').AsString :=
          GetSpellCode(PChar(FieldByName('Name').AsString),2,8);
        Next;
      end;
      SaveToFile(ExePath + 'Dict\emr_nrpd_lb.xml', dfXML);
    end;
    MsgInfo('内容片段字典刷新成功！', 2);
  finally
    Cds_Down.Free;
  end;
end;

procedure TFrm_main.Fsdt_nrpdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  NowNode: TTreeNode;
begin
  if Key = VK_RETURN then
  begin
    if Fsdt_nrpd.Caption = '' then
    begin
      MsgInfo('查询内容片段不能为空！', 2);
      Fsdt_nrpd.SetFocus;
      Exit;
    end
    else
    begin
      NowNode := Tview_nrpd.Items.GetFirstNode;
      while NowNode <> nil do
      begin
        if (TNodeData(NowNode.Data)^.IsElement = True) and
          (Copy(Fsdt_nrpd.Caption, 6, Length(Fsdt_nrpd.Caption) - 5) =
            TNodeData(NowNode.Data)^.ID) and
          (Copy(Fsdt_nrpd.Caption, 1, 5) = '片段-') then
        begin
          Tview_nrpd.Select(NowNode);
        end;

        if (TNodeData(NowNode.Data)^.IsElement = False) and
          (Copy(Fsdt_nrpd.Caption, 6, Length(Fsdt_nrpd.Caption) - 5) =
            TNodeData(NowNode.Data)^.ID) and
          (Copy(Fsdt_nrpd.Caption, 1, 5) = '类别-') then
        begin
          Tview_nrpd.Select(NowNode);
        end;

        NowNode := NowNode.GetNext;
      end;
    end;
  end;
end;

end.
