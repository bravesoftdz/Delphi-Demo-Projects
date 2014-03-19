unit ShareMsg_u;

interface
uses
  Forms, Windows, SysUtils;
Const
  StrFieldNull: String ='��%s������Ϊ��';
  StrDptEnter: String = 'F9���ո����������������ť����%s���뷨,F8��CTRL+N����%s����,F5��CTRL+D����%s���뷨';
  StrDptEnter1: String = 'F9���ո����������������ť����%s���뷨';
  StrDptEnter2: String = 'F9���ո����������������ť����%s���뷨,F5��CTRL+D����%s���뷨';
  StrDptEnter2_1: String = 'F9���ո����������������ť����%s���뷨,F8��CTRL+N����%s����';
  StrSaveYes: String ='%s%s�ɹ�';
  StrSaveNO: String = '%s%sʧ��';
  StrDelInfo: String = 'ȷ��Ҫɾ����%s����';
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
    result:= Application.MessageBox(PChar(format(StrSaveYes,[StrInfo,'����'])),'��ʾ��Ϣ',MB_ICONInformation+MB_OK)
  else
    result:= Application.MessageBox(PChar(format(StrSaveNo,[StrInfo,'����'])),'������Ϣ',MB_ICONWarning+MB_OK);

end;
function MsgCheckNull(StrInfo: String): Integer;
begin
  result:= Application.MessageBox(PChar(format(StrFieldNull,[StrInfo])),'��ʾ��Ϣ',MB_ICONInformation+MB_OK);
end;
function MsgDelInfo(StrInfo: String): Integer;
begin
  result:= Application.MessageBox(PChar(format(StrDelInfo,[StrInfo])),'��ʾ��Ϣ',MB_ICONInformation+MB_YESNO+MB_DefButton2);
end;
function MsgDelSaveInfo(StrInfo: String; Const blYes: Boolean): Integer;
begin
  if blYes then
    result:= Application.MessageBox(PChar(format(StrSaveYes,[StrInfo,'ɾ��'])),'��ʾ��Ϣ',MB_ICONInformation+MB_OK)
  else
    result:= Application.MessageBox(PChar(format(StrSaveNo,[StrInfo,'ɾ��'])),'������Ϣ',MB_ICONWarning+MB_OK);

end;
function MsgInfo(StrInfo: String; Const miType : Integer): Integer;
begin
  case miType of
    1: result:= Application.MessageBox(PChar(StrInfo),'��ʾ��Ϣ',MB_ICONInformation+MB_OK);
    2: result:= Application.MessageBox(PChar(StrInfo),'������Ϣ',MB_ICONWarning+MB_OK);
    3: result:= Application.MessageBox(PChar(StrInfo),'������Ϣ',MB_ICONError+MB_OK);
  end;
end;
function MsgYesNO(StrInfo: String; Const bldefNO: Boolean= true): Integer;
begin
  if blDefNO then
    result:= Application.MessageBox(PChar(StrInfo),'������Ϣ',MB_ICONWarning+MB_YesNO+MB_DefButton2)
  else
    result:= Application.MessageBox(PChar(StrInfo),'������Ϣ',MB_ICONWarning+MB_YesNO+MB_DefButton1)
end;
end.
