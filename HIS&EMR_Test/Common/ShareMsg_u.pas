unit ShareMsg_u;

interface
uses
  Forms, Windows, SysUtils;
Const
  StrFieldNull: String ='〖%s〗不能为空';
  StrDptEnter: String = 'F9、空格键或鼠标左键单击按钮调出%s输入法,F8或CTRL+N调出%s窗口,F5或CTRL+D下载%s输入法';
  StrDptEnter1: String = 'F9、空格键或鼠标左键单击按钮调出%s输入法';
  StrDptEnter2: String = 'F9、空格键或鼠标左键单击按钮调出%s输入法,F5或CTRL+D下载%s输入法';
  StrDptEnter2_1: String = 'F9、空格键或鼠标左键单击按钮调出%s输入法,F8或CTRL+N调出%s窗口';
  StrSaveYes: String ='%s%s成功';
  StrSaveNO: String = '%s%s失败';
  StrDelInfo: String = '确定要删除《%s》吗？';
  function MsgSaveInfo(StrInfo: String; Const blYes: Boolean= true): Integer;
  function MsgCheckNull(StrInfo: String): Integer;
  function MsgDelInfo(StrInfo: String): Integer;
  function MsgDelSaveInfo(StrInfo: String; Const blYes: Boolean= true): Integer;
  function MsgInfo(StrInfo: String; Const miType : Integer): Integer;
  function MsgYesNO(StrInfo: String; Const bldefNO: Boolean= true): Integer;
implementation
function MsgSaveInfo(StrInfo: String; Const blYes: Boolean): Integer;
begin
  if blYes then
    result:= Application.MessageBox(PChar(format(StrSaveYes,[StrInfo,'保存'])),'提示信息',MB_ICONInformation+MB_OK)
  else
    result:= Application.MessageBox(PChar(format(StrSaveNo,[StrInfo,'保存'])),'警告信息',MB_ICONWarning+MB_OK);

end;
function MsgCheckNull(StrInfo: String): Integer;
begin
  result:= Application.MessageBox(PChar(format(StrFieldNull,[StrInfo])),'提示信息',MB_ICONInformation+MB_OK);
end;
function MsgDelInfo(StrInfo: String): Integer;
begin
  result:= Application.MessageBox(PChar(format(StrDelInfo,[StrInfo])),'提示信息',MB_ICONInformation+MB_YESNO+MB_DefButton2);
end;
function MsgDelSaveInfo(StrInfo: String; Const blYes: Boolean): Integer;
begin
  if blYes then
    result:= Application.MessageBox(PChar(format(StrSaveYes,[StrInfo,'删除'])),'提示信息',MB_ICONInformation+MB_OK)
  else
    result:= Application.MessageBox(PChar(format(StrSaveNo,[StrInfo,'删除'])),'警告信息',MB_ICONWarning+MB_OK);

end;
function MsgInfo(StrInfo: String; Const miType : Integer): Integer;
begin
  case miType of
    1: result:= Application.MessageBox(PChar(StrInfo),'提示信息',MB_ICONInformation+MB_OK);
    2: result:= Application.MessageBox(PChar(StrInfo),'警告信息',MB_ICONWarning+MB_OK);
    3: result:= Application.MessageBox(PChar(StrInfo),'错误信息',MB_ICONError+MB_OK);
  end;
end;
function MsgYesNO(StrInfo: String; Const bldefNO: Boolean= true): Integer;
begin
  if blDefNO then
    result:= Application.MessageBox(PChar(StrInfo),'警告信息',MB_ICONWarning+MB_YesNO+MB_DefButton2)
  else
    result:= Application.MessageBox(PChar(StrInfo),'警告信息',MB_ICONWarning+MB_YesNO+MB_DefButton1)
end;
end.
