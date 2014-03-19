unit secion_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, TFlatPanelUnit, FlatSelEdit,
  DictIpt, dm_u, UserFunc_U, Share_u, ShareMsg_u, DBClient, DllFunc_u,
  ComCtrls, ImgList;

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
  TFrm_Section = class(TForm)
    Lb_1: TLabel;
    btn_ok: TBitBtn;
    btn_cancle: TBitBtn;
    Tview_Section: TTreeView;
    ImgLst_1: TImageList;
    procedure btn_okClick(Sender: TObject);
    procedure btn_cancleClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    function AddChildNode(ATree: TTreeView; ParentNode: TTreeNode): Boolean;
    function InitTree(ATree: TTreeView): Boolean;
    function GetWholeName(ANode: TTreeNode):string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Section: TFrm_Section;

implementation

{$R *.dfm}

function TFrm_Section.AddChildNode(ATree: TTreeView; ParentNode: TTreeNode): Boolean;
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

      CommandText := 'Select LBBH,LBMC,PLBBH from emr_blnrlb t where PLBBH = ''' +
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

function TFrm_Section.InitTree(ATree: TTreeView): Boolean;
var
  NodeData: TNodeData;
  NodeObj: TTreeNode;
  Cds_Tview: TClientDataSet;
begin
  ATree.Items.Clear;
  New(NodeData);
  NodeData^.ID := '0';
  
  NodeData^.Name := '数据节类别';
  NodeData^.ParentID := '-1';
  NodeData.IsElement := False;

  NodeObj := ATree.Items.AddFirst(nil,'数据节类别');
  NodeObj.Data := NodeData;
  NodeObj.ImageIndex := 2;
  NodeObj.SelectedIndex := 2;

  if AddChildNode(ATree, NodeObj) = False then
  begin
    MsgInfo('查询数据库生成类别树失败！', 3);
    Exit;
  end;
end;

function TFrm_Section.GetWholeName(ANode: TTreeNode):string;
var
  NowNode: TTreeNode;
  s: string;
begin
  s := '';
  NowNode := ANode;
  while NowNode <> Tview_Section.Items.GetFirstNode do
  begin
    if s = '' then
      s := TNodeData(NowNode.Data)^.Name
    else
      s := TNodeData(NowNode.Data)^.Name + '_' + s;

    NowNode := NowNode.Parent;
  end;
  Result := s;
end;

procedure TFrm_Section.btn_okClick(Sender: TObject);
begin
  if Tview_Section.Selected = nil then
  begin
    MsgInfo('所属分类不能为空！', 2);
    Tview_Section.SetFocus;
  end
  else
  begin
    DM.cds_dtl6.CommandText := GetWholeName(Tview_Section.Selected) + '_ID:' + TNodeData(Tview_Section.Selected.Data)^.ID;
    Close;
  end;
end;

procedure TFrm_Section.btn_cancleClick(Sender: TObject);
begin
  DM.cds_dtl6.CommandText := '';
  Close;
end;

procedure TFrm_Section.FormShow(Sender: TObject);
begin
  if Tview_Section.Items.GetFirstNode = nil then
    InitTree(Tview_Section);
  Frm_Section.BringToFront;
end;

end.
