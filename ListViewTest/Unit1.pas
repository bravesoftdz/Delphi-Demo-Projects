unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    Btn_1: TButton;
    LstViw_1: TListView;
    procedure Btn_1Click(Sender: TObject);
    procedure LstViw_1ColumnClick(Sender: TObject; Column: TListColumn);
    procedure LstViw_1Compare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure LstViw_1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure LstViw_1DragDrop(Sender, Source: TObject; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

var
  i: Integer = 100;
  columnToSort: Integer;
  LastColumn: TListColumn;
  nSortType: Integer;

procedure TForm1.Btn_1Click(Sender: TObject);
begin
//  while i > 80 do
//  begin
    with LstViw_1.Items.Add do
    begin
      Caption := IntToStr(i);
      SubItems.Add('name ' + DateTimeToStr(Now));
      SubItems.Add(DateTimeToStr(Now));
    end;
    Dec(i);
//  end;
end;

function CompareValue(s1, s2: real): integer;
begin
  if s1 > s2 then
    result := 1
  else
    result := 0;
end;

procedure TForm1.LstViw_1ColumnClick(Sender: TObject; Column: TListColumn);
begin
  columnToSort := Column.Index; //��Ҫ����������м���������Compare������
  if LastColumn = Column then //������һ�ε�����кͱ��ε��������ͬ
    nSortType := Abs(nSortType - 1) //������ʽ������
  else
    nSortType := 0; //����Ͱ�����ʽ��Ϊ��
//  Column.ImageIndex := nSortType + 1;
    //���ñ�ͷ��ͼ��,,�����Ѿ���smallImages ��һ��imagelist����������
  LastColumn := Column; //�������һ�ε������һ��
  LstViw_1.CustomSort(nil, nSortType);
    //�˺����е�һ�����������nil���ͻᴥ��OnCompare�¼���������¼�����������
end;

procedure TForm1.LstViw_1Compare(Sender: TObject; Item1, Item2: TListItem;
  Data: Integer; var Compare: Integer);
var
  ix: Integer; //���ĸ�������compareText����
begin
  if columnToSort = 0 then
  begin
    Compare := StrToInt(Trim(Item1.Caption)) -
      StrToInt(Trim(Item2.Caption));
      //����ǵ�һ�У�Ҳ������caption�Ա�׼��������
    if Data <> 0 then
      Compare := - compare;
  end
  else
  begin
    ix := columnToSort - 1;
    Compare := CompareText(Item1.SubItems[ix], Item2.SubItems[ix]); //��ĳһ�������������
    if columnToSort = 2 then
    begin
      Compare := CompareValue(Double(StrToDateTime(Item1.SubItems[ix])),
        Double(StrToDateTime(Item2.SubItems[ix])));
      if Data <> 0 then
        Compare := 1 - compare; //��һ�������ͬʱ���ͬһ��ʱ���������뵹��ı任
    end
    else
    begin
      if Data <> 0 then
        Compare := - compare;
    end;
  end;
  {if Data <> 0 then
    //���Data���������listView�е�compare���� CustomSort��������ģ�Data����CustomSort�еĵڶ���������ֵ���������0
    Compare := -compare; //��һ�������ͬʱ���ͬһ��ʱ���������뵹��ı任  }
end;

procedure TForm1.LstViw_1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := True;
end;

procedure TForm1.LstViw_1DragDrop(Sender, Source: TObject; X, Y: Integer);
var
  DragItem,
  item,
  item1,
  item2: TListItem;
  index: Integer;
begin
  item := LstViw_1.GetItemAt(x,y);
  if item = nil then Exit;

  DragItem := LstViw_1.Selected;
  index := LstViw_1.DropTarget.Index;

  if index > DragItem.Index then
  begin
    item1 := LstViw_1.Items.Insert(index + 1);
//    item2 := LstViw_1.Items.Insert(DragItem.Index);
  end
  else
  begin
    item1 := LstViw_1.Items.Insert(index);
//    item2 := LstViw_1.Items.Insert(DragItem.Index);
  end;

  item1.Assign(DragItem);
//  item2.Assign(item);
  DragItem.Delete;
//  item.Delete;
  LstViw_1.Refresh;
end;

end.
