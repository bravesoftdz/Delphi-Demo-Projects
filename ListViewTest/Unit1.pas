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
  columnToSort := Column.Index; //把要进行排序的列记下来，由Compare函数用
  if LastColumn = Column then //如果最后一次点击的列和本次点击的列相同
    nSortType := Abs(nSortType - 1) //把排序方式反过来
  else
    nSortType := 0; //否则就把排序方式设为零
//  Column.ImageIndex := nSortType + 1;
    //设置表头的图标,,这里已经把smallImages 与一个imagelist关联起来了
  LastColumn := Column; //记下最后一次点击是哪一列
  LstViw_1.CustomSort(nil, nSortType);
    //此函数中第一个参数如果是nil，就会触发OnCompare事件，在这个事件进行排序处理
end;

procedure TForm1.LstViw_1Compare(Sender: TObject; Item1, Item2: TListItem;
  Data: Integer; var Compare: Integer);
var
  ix: Integer; //把哪个子项传达给compareText函数
begin
  if columnToSort = 0 then
  begin
    Compare := StrToInt(Trim(Item1.Caption)) -
      StrToInt(Trim(Item2.Caption));
      //如果是第一列，也就是以caption以标准进行排序
    if Data <> 0 then
      Compare := - compare;
  end
  else
  begin
    ix := columnToSort - 1;
    Compare := CompareText(Item1.SubItems[ix], Item2.SubItems[ix]); //以某一个子项进行排序
    if columnToSort = 2 then
    begin
      Compare := CompareValue(Double(StrToDateTime(Item1.SubItems[ix])),
        Double(StrToDateTime(Item2.SubItems[ix])));
      if Data <> 0 then
        Compare := 1 - compare; //这一句控制了同时点击同一列时进行升序与倒序的变换
    end
    else
    begin
      if Data <> 0 then
        Compare := - compare;
    end;
  end;
  {if Data <> 0 then
    //这个Data参数，如果listView中的compare是由 CustomSort函数激活的，Data就是CustomSort中的第二个参数的值，否则就是0
    Compare := -compare; //这一句控制了同时点击同一列时进行升序与倒序的变换  }
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
