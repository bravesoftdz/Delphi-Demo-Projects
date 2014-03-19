unit Unit1;

interface 

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, StdCtrls;

type 
  TForm1 = class(TForm)
    BtnGoPause: TButton;
    lst1: TListBox;
    lst2: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnGoPauseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  public
  end;

  TThreadQuery = class(TThread)
  private
    LstBox: TListBox;
  protected
    i: integer;
    procedure Execute; override;
  public
    constructor Create(Lst: TListBox; num: Integer); virtual;
  end;

var 
  Form1: TForm1;
  Q1,
  Q2: TThreadQuery;

implementation 

{$R *.DFM} 

{ TThreadQuery类的实现 } 

{ 连接数据查询组件和数据感知组件} 

procedure TThreadQuery.Execute;{ 执行线程的方法 } 
var
  j: Integer;
begin
  try
    j := 0;
    while j < 100 do
    begin
      LstBox.Items.Add(IntToStr(i));
      Inc(i);
      Inc(j);
      Sleep(100);
    end;
  except
    ShowMessage('Query Error'); { 线程异常 }
  end;
end; 

constructor TThreadQuery.Create(Lst: TListBox; num: Integer);
begin
  LstBox := Lst;
  i := num;
  inherited Create(True);
  FreeOnTerminate := False;
end; 

procedure TForm1.FormCreate(Sender: TObject); 
begin 
  Q1 := TThreadQuery.Create(lst1,100);
  Q2 := TThreadQuery.Create(lst2,200);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  Q1.Terminate;
  Q1.Destroy;
  Q2.Terminate;
  Q2.Destroy;
end;

procedure TForm1.BtnGoPauseClick(Sender: TObject); 
begin 
  if Q1.Suspended then Q1.Resume else Q1.Suspend;
  if Q2.Suspended then Q2.Resume else Q2.Suspend;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Q1.Terminate;
  Q2.Terminate;
end;

end.
