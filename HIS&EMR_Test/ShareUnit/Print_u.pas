unit Print_u;
 (*
 Beginprint 与 EndPrint必须成对使用.

 示范程序
  Beginprint 与 EndPrint必须成对使用

  dc:=beginprint(2100,2970);   //开始打印并定义纸纸大小, 单位毫米/10
  if dc<>0 then
  begin
    SendPrintData(10,10,'大家好！！！','',0);
    endprint(dc)
  end;
  注：不支持激光打印机
  *)
interface
uses
  SysUtils, Classes, Windows, Graphics, Printers, WinSpool,DBClient, shareMsg_u{, Forms};
  function beginprint(w,h:integer):HDC;
  procedure endprint(H:HDC);
  //传递横坐标值、纵坐标值、打印数据、字体、字体大小
  procedure SendPrintData(X,Y: integer;const Text: WideString;FontName: WideString='宋体';FontSize: integer=14);
var
  printcanvas:tcanvas; //画布变量
  devicemode:Thandle;
  pdevmode:Pdevicemode;
  PH:Thandle;
  a,b,c:array[0..100]of char;
  DC:HDC;
  CTitle: array[0..31] of Char;
  DocInfo: TDocInfo;
  inprint:boolean;
  function PrintBill(CdsData:TClientDataSet; Width,Height: Integer;
    PrinterOrientation: TPrinterOrientation; const blMsg: Boolean=true;
    const blRepeat: Boolean=true):integer;stdcall;export; //打印票据
  
implementation
function beginprint(w,h:integer):HDC;
begin
  if inprint then
  begin
    result:=0;
    exit;
  end;
  printer.getprinter(a,b,c,devicemode);
  openprinter(a,ph,nil);
  DeviceMode := GlobalAlloc(GHND,
        DocumentProperties(0, ph, a, pdevmode^,
        pdevmode^, 0));
  pdevmode:=globallock(devicemode);
  DocumentProperties(0, ph, a, pdevmode^,
        pdevmode^, dm_out_buffer);
  pdevmode^.dmpapersize:=256;
  pdevmode^.dmpaperlength:=h;
  pdevmode^.dmpaperwidth:=w;
  pdevmode^.dmfields:=dm_papersize or dm_paperwidth or dm_paperlength;
  DocumentProperties(0, ph, a, pdevmode^,
        pdevmode^, dm_in_buffer or dm_out_buffer);
  dc:=createdc(nil,a,nil,pdevmode);
  FillChar(DocInfo, SizeOf(DocInfo), 0);
  with DocInfo do
  begin
    cbSize := SizeOf(DocInfo);
    lpszDocName := CTitle;
    lpszOutput := nil;
  end;
  startdoc(dc,docinfo);
  startpage(dc);
  inprint:=true;
  result:=dc;
  printcanvas:=tcanvas.create;
  printcanvas.handle:=dc;
  setmapmode(dc,MM_LOMETRIC);
  setwindoworgex(dc,0,-90,nil);
end;
procedure endprint(H:HDC);
begin
  if inprint and (dc=h) then
  begin
    printcanvas.handle:=0;
    endpage(dc);
    enddoc(dc);
    deletedc(dc);
    closeprinter(ph);
    globalunlock(devicemode);
    globalfree(devicemode);
    printcanvas.free;
    inprint:=false;
  end;
end;
procedure SendPrintData(X,Y: integer;const Text: WideString;FontName: WideString='宋体';FontSize: integer=14);
begin
  with printcanvas do
  begin
    if trim(FontName)<>'' then
      font.Name := trim(FontName);
    if FontSize<>0 then
      Font.Size := FontSize;

    TextOut(X,Y,Text);
  end;
end;
function PrintBill(CdsData:TClientDataSet; Width,Height: Integer;
  PrinterOrientation: TPrinterOrientation; const blMsg: Boolean;
    const blRepeat: Boolean):integer; //打印票据
var
  DC:HDC;
  BT_X,BT_Y,SJ_X,SJ_Y:integer;
  StrBt,StrSj:string;
  OldOrientation: TPrinterOrientation;
begin
  OldOrientation := printer.Orientation;
  try
    printer.Orientation := PrinterOrientation;  //poPortrait纵向; poLandscape横向
  except
    printer.Orientation := poPortrait;
  end;
  try
    while 1=1 do
    begin
      with cdsData do //查询打印数据
      begin

        if blMsg then
          MsgInfo('请准备好打印纸,开始打印……',1);
          //Application.MessageBox(,'提示信息',MB_ICONINFORMATION+MB_OK);
        first;
        DC:= BeginPrint(Width,Height);
        while not eof do
        begin
          with PrintCanvas do
          begin
            BT_X:= fieldbyname('BT_X').AsInteger;
            BT_Y:= -fieldbyname('BT_Y').AsInteger;
            StrBT:= fieldbyname('BT').AsString;
            SJ_X:= fieldbyname('SJ_X').asinteger;
            SJ_Y:= -fieldbyname('SJ_Y').asinteger;
            StrSJ:= fieldbyname('SJ').asstring;
            Font.Size:= FieldByName('ztdx').AsInteger;
            Font.Name:= FieldByName('zt').AsString;
            if (BT_X<>0) or (BT_Y<>0) then textout(BT_X,BT_Y,StrBT);
            if (SJ_X<>0) or (SJ_Y<>0) then textout(SJ_X,SJ_Y,StrSJ);
          end;
          next;
        end;
        if blRepeat then
        begin
          if MsgYesNO('打印是否正确，重打发票吗？')= ID_NO then
            break;
        end
        else
          Break;
      end;
    end;
    if DC<>0 then EndPrint(DC);
    result:=0;
    printer.Orientation := OldOrientation;
  except
    result :=1;
  end;
end;
end.
