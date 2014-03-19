unit OraErr_u;

interface
uses
  Windows, Classes, SysUtils, INIFiles, ScktComp, DBClient,DllFunc_u, Share_u, Dialogs
  , ZLib, DictIpt, Controls, Forms, StrUtils, DBGridEh, Graphics, ActnList,
  IMM, IdTCPClient, IdFTP, StdCtrls, DB, Variants, FlatComboBoxCode, ComboBoxCode,
  FlatSelEdit;
//type
  (*猎取ORACLE错误信息*)
  function GetOraErrMsg(Str: String): String;
implementation
function GetOraErrMsg(Str: String): String;
var
  iErrCode: Integer;
  Strtmp: String;
begin
  StrTmp:= LeftStr(Str,Pos(':',Str)-1);
  iErrCode:= Abs(StrToInt(RightStr(StrTmp,6)));
  if iErrCode>=20000 then
  begin
    StrTmp:= Str;
    Delete(StrTmp,1,10);
    StrTmp:= LeftStr(StrTmp,Pos('ORA',StrTmp)-1);
    result:= StrTmp;
  end
  else
  begin
    case ierrCode of
      1: result:= '数据库中已经有相同数据，请联系管理员';
      1400: result:= '无法将空值写入数据库，请联系管理员';
    else
      Result:= Str;
    end;
  end;
  //result:= StrTmp;

end;
end.
