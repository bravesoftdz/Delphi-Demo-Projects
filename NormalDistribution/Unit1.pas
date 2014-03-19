unit Unit1;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Math;
type
  TfrmMain = class(TForm)
  imgAxis: TImage;
  btnRandG: TButton;
  GroupBox1: TGroupBox;
  Splitter1: TSplitter;
  grpControl: TGroupBox;
  chkLogFrequency: TCheckBox;
  chkDrawEdge: TCheckBox;
  chkDrawLines: TCheckBox;
  cboxCopyMode: TComboBox;
  procedure FormShow(Sender: TObject);
  procedure btnRandGClick(Sender: TObject);
  procedure FormCreate(Sender: TObject);
private
  { Private declarations }
  totalCount :Integer;
  sampleDatas :array[1..1000] of Integer;
  procedure DrawAxis;
  procedure GaussIt(const ASampleData:Extended);
  procedure ReDraw;
  procedure DrawEdge;//����
  procedure Log(const logName:string);
public
  { Public declarations }
end;
var
  frmMain: TfrmMain;
implementation
{$R *.dfm}
procedure TfrmMain.DrawAxis;
begin
  imgAxis.Canvas.Pen.Color :=clLime;
  imgAxis.Canvas.Pen.Mode :=pmXor;
  imgAxis.Canvas.MoveTo(imgAxis.Width div 2,imgAxis.Height);
  imgAxis.Canvas.LineTo(imgAxis.Width div 2,0);
  imgAxis.Canvas.MoveTo(0,imgAxis.Height -10);
  imgAxis.Canvas.LineTo(imgAxis.Width,imgAxis.Height -10);
end;

procedure TfrmMain.ReDraw;
var
  bmp :TBitmap;
  i :Integer;
begin//�����������������totalCount���»�ͼ
  bmp :=TBitmap.Create;
  try
    bmp.Width :=imgAxis.Width;
    bmp.Height:=imgAxis.Height;
    bmp.Canvas.Brush.Color :=clBlack;
    bmp.Canvas.FillRect(bmp.Canvas.ClipRect);
    bmp.Canvas.Pen.Color :=clRed;
    bmp.Canvas.Pen.Width :=1;
    //����Image�߶Ⱥ�1->1000������Ƶ�����û��ߵĸ߶�
    //Ӧ�ü����ͼ�����ܷ�ӳ����С�ֱ��ʣ�Ӧ�����ֵ�Ƶ����1�ı仯
    for i:=1 to 1000 do
    begin
      sampleDatas[i] :=(sampleDatas[i]*(bmp.Height-10)) *250 div totalCount;//Ƶ��->Ƶ��->ʵ��ͼ��߶�ֵ
      sampleDatas[i] :=bmp.Height-10 -sampleDatas[i];//�߶�ת��Ϊʵ������
      bmp.Canvas.MoveTo(i,bmp.Height-10);
      if chkDrawLines.Checked then
      bmp.Canvas.LineTo(i,sampleDatas[i]);
    end;
    //Log('height.txt');
    if cboxCopyMode.Items[cboxCopyMode.ItemIndex]='cmBlackness' then
      imgAxis.Canvas.CopyMode :=cmBlackness
    else if cboxCopyMode.Items[cboxCopyMode.ItemIndex]='cmDstInvert' then
      imgAxis.Canvas.CopyMode :=cmDstInvert
    else if cboxCopyMode.Items[cboxCopyMode.ItemIndex]='cmMergeCopy' then
      imgAxis.Canvas.CopyMode :=cmMergeCopy
    else if cboxCopyMode.Items[cboxCopyMode.ItemIndex]='cmMergePaint' then
      imgAxis.Canvas.CopyMode :=cmMergePaint
    else if cboxCopyMode.Items[cboxCopyMode.ItemIndex]='cmNotSrcCopy' then
      imgAxis.Canvas.CopyMode :=cmNotSrcCopy
    else if cboxCopyMode.Items[cboxCopyMode.ItemIndex]='cmNotSrcErase' then
      imgAxis.Canvas.CopyMode :=cmNotSrcErase
    else if cboxCopyMode.Items[cboxCopyMode.ItemIndex]='cmPatCopy' then
      imgAxis.Canvas.CopyMode :=cmPatCopy
    else if cboxCopyMode.Items[cboxCopyMode.ItemIndex]='cmPatInvert' then
      imgAxis.Canvas.CopyMode :=cmPatInvert
    else if cboxCopyMode.Items[cboxCopyMode.ItemIndex]='cmPatPaint' then
      imgAxis.Canvas.CopyMode :=cmPatPaint
    else if cboxCopyMode.Items[cboxCopyMode.ItemIndex]='cmSrcAnd' then
      imgAxis.Canvas.CopyMode :=cmSrcAnd
    else if cboxCopyMode.Items[cboxCopyMode.ItemIndex]='cmSrcCopy' then
      imgAxis.Canvas.CopyMode :=cmSrcCopy
    else if cboxCopyMode.Items[cboxCopyMode.ItemIndex]='cmSrcErase' then
      imgAxis.Canvas.CopyMode :=cmSrcErase
    else if cboxCopyMode.Items[cboxCopyMode.ItemIndex]='cmSrcInvert' then
      imgAxis.Canvas.CopyMode :=cmSrcInvert
    else if cboxCopyMode.Items[cboxCopyMode.ItemIndex]='cmSrcPaint' then
      imgAxis.Canvas.CopyMode :=cmSrcPaint
    else if cboxCopyMode.Items[cboxCopyMode.ItemIndex]='cmWhiteness' then
      imgAxis.Canvas.CopyMode :=cmWhiteness;
    imgAxis.Canvas.CopyRect(imgAxis.Canvas.ClipRect,bmp.Canvas,bmp.Canvas.ClipRect);
    //imgAxis.Canvas.Draw(0,0,bmp);//������ܿ���CopyMode
  finally
    bmp.Destroy;
  end;
end;

procedure TfrmMain.GaussIt(const ASampleData:Extended);
var
  x :Integer;
begin
  Inc(totalCount);
  //ShowMessage(FloatToStr(ASampleData));
  //����������ӳ�䵽1..1000��������500->1000������500->1
  //ASampleData>=8 ---1000
  // =0 ---500
  // <=-8 ---1
  x :=Round(ASampleData *1000);
  //ȷ����Χ
  if x>=4000 then x:=4000
  else if x<=-4000 then x:=-4000;

  x := (x + 4001) shr 3;
  Inc(sampleDatas[x]);//��¼������Ƶ���������ܴ�������Ƶ����
  //ShowMessage(IntToStr(x));
  //ShowMessage(IntToStr(sampleDatas[x]));
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  DoubleBuffered :=true;
  DrawAxis;
end;

procedure TfrmMain.btnRandGClick(Sender: TObject);
var
  i:Integer;
begin
  totalCount :=0;
  for i:=1 to 1000 do
    sampleDatas[i]:=0;
  for i:=1 to 100000 do//�ܼ�10000��
    GaussIt(RandG(0,1));//��׼��̬�ֲ�
  if chkLogFrequency.Checked then
    Log('afterBtn.txt');
  ReDraw;
  if chkDrawEdge.Checked then
    DrawEdge;
  DrawAxis;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  Left :=0;
  btnRandG.Click;
end;

procedure TfrmMain.Log(const logName:string);
var
  i:Integer;
  log:TStringList;
  str:string;
begin
  log :=TStringList.Create;
  try
    for i:=1 to 1000 do
    begin
      str :=Format('%.4d : %d��Ƶ����',[i,sampleDatas[i]]);
      log.Add(str);
    end;
    str :=Format('������%d',[totalCount]);
    log.Add(str);
    totalCount :=0;
    for i:=1 to 1000 do
    inc(totalCount,sampleDatas[i]);
    str :=Format('ʵ��������%d',[totalCount]);
    log.Add(str);
    log.SaveToFile(logName);
  finally
    log.Destroy;
  end;
end;

procedure TfrmMain.DrawEdge;//����
var
  i:Integer;
  points :array[1..1000] of TPoint;
begin
  for i:=1 to 1000 do
  begin
    points[i].x :=i;
    points[i].y :=sampleDatas[i];
  end;
  imgAxis.Canvas.Polyline(points);
end;

end.
