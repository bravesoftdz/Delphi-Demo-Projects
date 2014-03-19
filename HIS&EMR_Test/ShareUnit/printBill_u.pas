unit printBill_u;

interface
uses
  SysUtils, Classes, Windows, Graphics, Printers, WinSpool,DBClient, shareMsg_u;
  function Printzjd(kdlsh:integer;dyrq:TDateTime;dydjlx:integer):integer;      //打印征集\拨付单
// 用默认打印机打印，W，H 纸宽，纸高 返回0 错误
  function beginprint(w,h:integer):HDC;
//结束打印
  procedure endprint(H:HDC);
//画布变量
var
  printcanvas:tcanvas;
implementation

uses dm_u, Share_u;
var devicemode:Thandle;
    pdevmode:Pdevicemode;
    PH:Thandle;
    a,b,c:array[0..100]of char;
    DC:HDC;
    CTitle: array[0..31] of Char;
    DocInfo: TDocInfo;
    inprint:boolean;
function beginprint(w,h:integer):HDC;
begin
  if inprint then begin result:=0;exit end;
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

function Printzjd(kdlsh:integer;dyrq:TDateTime;dydjlx:integer):integer;      //打印征集\拨付单
var
    DC:HDC;
    w,h:integer;
    x,y,x1,y1,x2,y2,data_size,xmm_size:integer;
    xmdata,xmm,data_font,xmm_font:string;
    CDSdy,CDSdy1,CDSdy2 :TClientdataset;
begin
    with dm.Cds_Com_SQN do
    begin
        close;
        datarequest('XT_DY_TSDZZDX');        //托收单纸张大小
        fetchparams;
        if (dydjlx = 1) or (dydjlx=5) then params.ParamByName('djlx').Asinteger := 1;
        if dydjlx = 2 then params.ParamByName('djlx').Asinteger := 2;
        if dydjlx = 3 then params.ParamByName('djlx').Asinteger := 3;
        if (dydjlx = 4) or (dydjlx=6) then params.ParamByName('djlx').Asinteger := 4;
        execute;
        w:=params.parambyname('tsdzk').asinteger;
        h:=params.parambyname('tsdzc').asinteger;
    end;
    //dydjlx  1打印托收单  2打印单位拨付单   3打印医院拨付单
    with dm.Cds_Com_SQN do
    begin
        close;
        if (dydjlx = 1) or (dydjlx = 5) then
        begin
            datarequest('XT_DY_TSD');       //打印托收单
            fetchparams;
            params.ParamByName('kdlsh').asinteger := kdlsh;
            params.ParamByName('dyrq').asdate := dyrq;
            if dydjlx = 1 then
              params.ParamByName('dylx').AsString := '1'
            else
              params.ParamByName('dylx').AsString := '2';
            Params.ParamByName('czrm').Asstring:= yhxx.yhbs;
        end;
        if dydjlx = 2 then
        begin
            datarequest('xt_dy_bfd_dw');       //打印单位拨付单
            fetchparams;
            params.ParamByName('kdlsh').asinteger := kdlsh;
            Params.ParamByName('czrm').Asstring:=yhxx.yhbs;
        end;
        if dydjlx = 3 then
        begin
            datarequest('xt_dy_bfd_yy');       //打印医院拨付单
            fetchparams;
            params.ParamByName('kdlsh').asinteger := kdlsh;
            Params.ParamByName('czrm').Asstring:=yhxx.yhbs;
        end;
        if (dydjlx = 4) or (dydjlx=6)  then
        begin
            datarequest('XT_DY_TSDDZ');       //部分开单
            fetchparams;
            params.ParamByName('kdlsh').asinteger := kdlsh;
            params.ParamByName('dyrq').asdate := dyrq;
            if dydjlx=4 then
              Params.ParamByName('dylx').Asstring:='1'
            else
              Params.ParamByName('dylx').Asstring:='2';
            Params.ParamByName('czrm').Asstring:=yhxx.yhbs;
        end;
        open;
        If Params.ParamByName('errnum').Asinteger<>0 Then
        Begin
            MsgInfo(Pchar(Params.Parambyname('errstr').Asstring),2);
            Exit
        End;
        if recordcount = 0 then
        begin
            result:=2;      //没有定义打印格式
            exit;
        end;
        MsgInfo('请准备好打印机,开始打印!',2);
        DC:=beginprint(w,h);
        //if DC = 0 then exit;
        first;
        while not eof do
        begin
            with PrintCanvas do
            begin
                data_font := fieldbyname('xt_xmzzt').asstring;
                data_size := fieldbyname('xt_xmzzh').asinteger;
                font.name:=data_font;
                font.size:=data_size;
                xmdata:=fieldbyname('xt_xmvalues').asstring;
                x:=fieldbyname('xt_xmzzb_x').asinteger;
                y:=-fieldbyname('xt_xmzzb_y').asinteger;
                if (x<>0) or (y<>0) then textout(x,y,xmdata);
                if fieldbyname('xt_xmlx').asstring = '直线' then
                begin
                    x1:=fieldbyname('xt_xmqszb_x').asinteger;
                    y1:=-fieldbyname('xt_xmqszb_y').asinteger;
                    x2:=fieldbyname('xt_xmzzzb_x').asinteger;
                    y2:=-fieldbyname('xt_xmzzzb_y').asinteger;
                    if (x1<>0) or (y1<>0) then moveto(x1,y1);
                    if (x2<>0) or (y2<>0) then lineto(x2,y2);
                end else
                begin
                    xmm_font := fieldbyname('xt_xmmzt').asstring;
                    xmm_size := fieldbyname('xt_xmmzh').asinteger;
                    font.name:=xmm_font;
                    font.size:=xmm_size;
                    xmm:=fieldbyname('xt_xmmc').asstring;
                    x1:=fieldbyname('xt_xmqszb_x').asinteger;
                    y1:=-fieldbyname('xt_xmqszb_y').asinteger;
                    if (x1<>0) or (y1<>0) then textout(x1,y1,xmm);
                end;
            end;
            next;
        end;
        if DC<>0 then endprint(DC);
        {With dm.Cds_Com_SQN Do
        Begin
            Close;
            datarequest('SP_SCPJLSB');       //删除托收单
            fetchparams;
            params.ParamByName('tsddypc').asinteger := Dmayyb.CDSdy.Params.ParamByName('tsddypc').asinteger;
            params.ParamByName('czrm').Asstring := czrm;
            Execute;
        End;}
        result:=0;
    end;
//返回值 0成功 1异常错误 2没有定义打印格式 3没有定义纸张大小

end;
initialization
  inprint:=false;
end.
