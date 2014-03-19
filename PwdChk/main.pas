unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RegExpr, Math, StrUtils;

type
  Tmain_f = class(TForm)
    Edt_pwd: TEdit;
    Btn_pwdchk: TButton;
    Lb_1: TLabel;
    Edt_lmin: TEdit;
    Edt_lmax: TEdit;
    Lb_lmin: TLabel;
    Lb_lmax: TLabel;
    Lb_2: TLabel;
    Lb_3: TLabel;
    Lb_4: TLabel;
    Lb_5: TLabel;
    Lb_6: TLabel;
    Lb_7: TLabel;
    Lb_8: TLabel;
    Lb_9: TLabel;
    Lb_10: TLabel;
    Lb_11: TLabel;
    Lb_12: TLabel;
    Lb_13: TLabel;
    Lb_14: TLabel;
    Lb_15: TLabel;
    Lb_16: TLabel;
    Lb_17: TLabel;
    Edt_1: TEdit;
    Edt_2: TEdit;
    Edt_3: TEdit;
    Edt_4: TEdit;
    Edt_5: TEdit;
    Edt_6: TEdit;
    Edt_7: TEdit;
    Edt_8: TEdit;
    Edt_9: TEdit;
    Edt_10: TEdit;
    Edt_11: TEdit;
    Edt_12: TEdit;
    Edt_13: TEdit;
    Edt_14: TEdit;
    Edt_15: TEdit;
    Edt_16: TEdit;
    Edt_17: TEdit;
    procedure Btn_pwdchkClick(Sender: TObject);
  private
    Noc_Score: Integer; //字符长度得分
    Ul_Score: Integer;//大写字母数得分
    Ll_Score: Integer;//小写字母数得分
    Num_Score: Integer;//数字数得分
    Sybs_Score: Integer;//符号数得分
    Midch_Score: Integer;//中间字符得分
    Rq_Score: Integer;//需求项得分
    Lo_Score: Integer;//只有字母减分
    No_Score: Integer;//只有数字减分
    Rpt_Score: Integer;//重复字符减分
    Cul_Score: Integer;//重复大写字母减分
    Cll_Score: Integer;//重复小写字母减分
    Cn_Score: Integer;//重复数字减分
    Sl_Score: Integer;//顺序字母减分
    Sn_Score: Integer;//顺序数字减分
    Ssyb_Score: Integer;//顺序符号减分
    function PwdChk(pwd: string):Integer;
    function RegMatch(subject: string;regstr: string):Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  main_f: Tmain_f;

implementation

{$R *.dfm}

function Tmain_f.RegMatch(subject: string;regstr: string):Boolean;
var
  reg: TRegExpr;
begin
  try
    reg := TRegExpr.Create;
    reg.Expression := regstr;

    if reg.Exec(subject) then
      Result := True
    else
      Result := False;
  finally
    FreeAndNil(reg);
  end;
end;

function Tmain_f.PwdChk(pwd: string):Integer;
const
  sAlphas = 'abcdefghijklmnopqrstuvwxyz';
  sNumerics = '01234567890';
  sSymbols = ')!@#$%^&*()';
  nMultLength = 4;
  nMultNumber = 4;
  nMultSymbol = 6;
  nMultMidChar = 2;
  nMultRequirements = 2;
  nMultConsecAlphaUC = 2;
  nMultConsecAlphaLC = 2;
  nMultConsecNumber = 2;
  nReqCharType = 3;
  nMultAlphaUC = 3;
  nMultAlphaLC = 3;
  nMultSeqAlpha = 3;
  nMultSeqNumber = 3;
  nMultSeqSymbol = 3;
  nMinPwdLen = 8;
var
//  Noc_Score: Integer; //字符长度得分
//  Ul_Score: Integer;//大写字母数得分
//  Ll_Score: Integer;//小写字母数得分
//  Num_Score: Integer;//数字数得分
//  Sybs_Score: Integer;//符号数得分
//  Midch_Score: Integer;//中间字符得分
//  Rq_Score: Integer;//需求项得分
//  Lo_Score: Integer;//只有字母减分
//  No_Score: Integer;//只有数字减分
//  Rpt_Score: Integer;//重复字符减分
//  Cul_Score: Integer;//重复大写字母减分
//  Cll_Score: Integer;//重复小写字母减分
//  Cn_Score: Integer;//重复数字减分
//  Sl_Score: Integer;//顺序字母减分
//  Sn_Score: Integer;//顺序数字减分
//  Ssyb_Score: Integer;//顺序符号减分
  //以上为评分数据，已声明为全局变量，函数单独使用时取消注释
  i,j: Integer; //循环变量
  tmpchar: Char;
  pwdlen: Integer;//密码长度
  tmprslt: Integer;
  nTmpAlphaUC,nConsecAlphaUC,nConsecCharType,nAlphaUC,nTmpAlphaLC,
  nConsecAlphaLC,nAlphaLC,nMidChar,nTmpNumber,nConsecNumber,nNumber,
  nTmpSymbol,nConsecSymbol,nSymbol,nRepChar,nUnqChar,nSeqAlpha,nSeqChar,
  nSeqNumber,nSeqSymbol,nReqChar,nRequirements,nMinReqChars: Integer;
  bCharExists: Boolean;
  nRepInc: Double;
  sFwd,sRev: string;
begin
  //初始化返回值
  Result := 0;
  //初始化中间变量
  i := 0;
  j := 0;
  tmpchar := #0;

  nTmpAlphaUC := 0;
  nConsecAlphaUC := 0;
  nConsecCharType := 0;
  nAlphaUC := 0;
  nTmpAlphaLC := 0;
  nConsecAlphaLC := 0;
  nAlphaLC := 0;
  nMidChar := 0;
  nTmpNumber := 0;
  nConsecNumber := 0;
  nNumber := 0;
  nTmpSymbol := 0;
  nConsecSymbol := 0;
  nSymbol := 0;
  nRepChar := 0;
  nUnqChar := 0;
  nSeqAlpha := 0;
  nSeqChar := 0;
  nSeqNumber := 0;
  nSeqSymbol := 0;
  nReqChar := 0;
  nRequirements := 0;
  nMinReqChars := 0;

  //初始化分数
  Noc_Score := 0;
  Ul_Score := 0;
  Ll_Score := 0;
  Num_Score := 0;
  Sybs_Score := 0;
  Midch_Score := 0;
  Rq_Score := 0;
  Lo_Score := 0;
  No_Score := 0;
  Rpt_Score := 0;
  Cul_Score := 0;
  Cll_Score := 0;
  Cn_Score := 0;
  Sl_Score := 0;
  Sn_Score := 0;
  Ssyb_Score := 0;

  pwdlen := Length(pwd);

  //从js转来的算法
  for i := 1 to pwdlen do
  begin
    tmpchar := pwd[i];

    if RegMatch(string(tmpchar),'[A-Z]') then //匹配大写字母
    begin
      if nTmpAlphaUC <> 0 then
      begin
        if (nTmpAlphaUC + 1) = i then
        begin
          nConsecAlphaUC := nConsecAlphaUC + 1;
	  nConsecCharType := nConsecCharType + 1;
        end;
      end;
      nTmpAlphaUC := i;
      nAlphaUC := nAlphaUC + 1;
    end
    else
    if RegMatch(string(tmpchar),'[a-z]') then //匹配小写字母
    begin
      if nTmpAlphaLC <> 0 then
      begin
        if (nTmpAlphaLC + 1) = i then
        begin
          nConsecAlphaLC := nConsecAlphaLC + 1;
          nConsecCharType := nConsecCharType + 1;
        end;
      end;
      nTmpAlphaLC := i;
      nAlphaLC := nAlphaLC + 1;
    end
    else
    if RegMatch(string(tmpchar),'[0-9]') then //匹配数字
    begin
      if (i > 1) and (i < pwdlen) then
        nMidChar := nMidChar + 1;
      if nTmpNumber <> 0 then
      begin
        if (nTmpNumber + 1) = i then
        begin
          nConsecNumber := nConsecNumber + 1;
          nConsecCharType := nConsecCharType + 1;
        end;
      end;
      nTmpNumber := i;
      nNumber := nNumber + 1;
    end
    else
    if RegMatch(string(tmpchar),'[^a-zA-Z0-9_]') then //匹配符号
    begin
      if (i > 1) and (i < pwdlen) then
        nMidChar := nMidChar + 1;
      if nTmpSymbol <> 0 then
      begin
        if (nTmpSymbol + 1) = i then
        begin
          nConsecSymbol := nConsecSymbol + 1;
          nConsecCharType := nConsecCharType + 1;
        end;
      end;
      nTmpSymbol := i;
      nSymbol := nSymbol + 1;
    end;

    bCharExists := false;
    for j := 0 to pwdlen do
    begin
      if (pwd[i] = pwd[j]) and (i <> j) then
      begin
        bCharExists := true;
        nRepInc := nRepInc + Abs(pwdlen/(j-i));
      end;
    end;
    if bCharExists then
    begin
      nRepChar := nRepChar + 1;
      nUnqChar := pwdlen - nRepChar;

      if nUnqChar = 0 then
        nRepInc := Ceil(nRepInc)
      else
        nRepInc := Ceil(nRepInc/nUnqChar);
    end;
  end;

  for i := 1 to 23 do
  begin
    sFwd := Copy(sAlphas,i,i + 3);
    sRev := ReverseString(sFwd);
    if (Pos(sFwd,LowerCase(pwd)) <> 0) or (Pos(sRev,LowerCase(pwd)) <> 0) then
    begin
      nSeqAlpha := nSeqAlpha + 1;
      nSeqChar := nSeqChar + 1;
    end;
  end;

  for i := 1 to 8 do
  begin
    sFwd := Copy(sNumerics,i,i + 3);
    sRev := ReverseString(sFwd);
    if (Pos(sFwd,pwd) <> 0) or (Pos(sRev,pwd) <> 0) then
    begin
      nSeqNumber := nSeqNumber + 1;
      nSeqChar := nSeqChar + 1;
    end;
  end;

  for i := 1 to 8 do
  begin
    sFwd := Copy(sSymbols,i,i + 3);
    sRev := ReverseString(sFwd);
    if (Pos(sFwd,pwd) <> 0) or (Pos(sRev,pwd) <> 0) then
    begin
      nSeqSymbol := nSeqSymbol + 1;
      nSeqChar := nSeqChar + 1;
    end;
  end;

  //密码长度得分
  Noc_Score := pwdlen * nMultLength;

  if (nAlphaUC > 0) and (nAlphaUC < pwdlen) then
  begin
    //大写字母个数得分
    Ul_Score := (pwdlen - nAlphaUC) * 2;
  end;

  if (nAlphaLC > 0) and (nAlphaLC < pwdlen) then
  begin
    //小写字母个数得分
    Ll_Score := (pwdlen - nAlphaLC) * 2;
  end;

  if (nNumber > 0) and (nNumber < pwdlen) then
  begin
    //数字个数得分
    Num_Score := nNumber * nMultNumber;
  end;

  if nSymbol > 0 then
  begin
    //符号个数得分
    Sybs_Score := nSymbol * nMultSymbol;
  end;

  if nMidChar > 0 then
  begin
    //中间字符个数得分
    Midch_Score := nMidChar * nMultMidChar;
  end;

  if ((nAlphaLC > 0) or (nAlphaUC > 0)) and (nSymbol = 0) and (nNumber = 0) then
  begin
    //只有字母减分
    Lo_Score := pwdlen;
  end;

  if (nAlphaLC = 0) and (nAlphaUC = 0) and (nSymbol = 0) and (nNumber > 0) then
  begin
    //只有数字减分
    No_Score := pwdlen;
  end;

  if nRepChar > 0 then
  begin
    // Same character exists more than once
    //重复字符减分
    Rpt_Score := Trunc(nRepInc);
  end;

  if nConsecAlphaUC > 0 then
  begin
    // Consecutive Uppercase Letters exist
    //重复大写字母减分
    Cul_Score := nConsecAlphaUC * nMultConsecAlphaUC;
  end;
  
  if nConsecAlphaLC > 0 then
  begin
    // Consecutive Lowercase Letters exist
    //重复小写字母减分
    Cll_Score := nConsecAlphaLC * nMultConsecAlphaLC;
  end;

  if nConsecNumber > 0 then
  begin
    // Consecutive Numbers exist
    //重复数字减分
    Cn_Score := nConsecNumber * nMultConsecNumber;
  end;

  if nSeqAlpha > 0 then
  begin
    // Sequential alpha strings exist (3 characters or more)
    //顺序字母减分
    Sl_Score := nSeqAlpha * nMultSeqAlpha;
  end;
  
  if nSeqNumber > 0 then
  begin
    // Sequential numeric strings exist (3 characters or more)
    //顺序数字减分
    Sn_Score := nSeqNumber * nMultSeqNumber;
  end;

  if nSeqSymbol > 0 then
  begin
    // Sequential symbol strings exist (3 characters or more)
    //顺序符号减分
    Ssyb_Score := nSeqSymbol * nMultSeqSymbol;
  end;

  if pwdlen >= nMinPwdLen then
    nReqChar := nReqChar + 1;
  if nAlphaUC >= 1 then
    nReqChar := nReqChar + 1;
  if nAlphaLC >= 1 then
    nReqChar := nReqChar + 1;
  if nNumber >= 1 then
    nReqChar := nReqChar + 1;
  if nSymbol >= 1 then
    nReqChar := nReqChar + 1;

  nRequirements := nReqChar;
  if pwdlen >= nMinPwdLen then
    nMinReqChars := 3
  else
    nMinReqChars := 4;

  if nRequirements > nMinReqChars then
  begin
    // One or more required characters exist
    //需求符合分数
    Rq_Score := nRequirements * 2;
  end;

  tmprslt := Noc_Score + Ul_Score + Ll_Score + Num_Score + Sybs_Score +
            Midch_Score + Rq_Score - Lo_Score - No_Score - Rpt_Score -
            Cul_Score - Cll_Score - Cn_Score - Sl_Score - Sn_Score - Ssyb_Score;
  if tmprslt < 0 then
    Result := 0
  else
  if tmprslt > 100 then
    Result := 100
  else
    Result := tmprslt;
end;

procedure Tmain_f.Btn_pwdchkClick(Sender: TObject);
var
  nScore: Integer;
begin

  //确定长度限制
  if (Length(Edt_pwd.Text) > StrToInt(Trim(Edt_lmax.Text))) or
     (Length(Edt_pwd.Text) < StrToInt(Trim(Edt_lmin.Text))) then
  begin
    ShowMessage('密码不在长度范围限制内！' + #13 +
                '密码长度应不小于' + Edt_lmax.Text + '个字符，且不大于' +
                Edt_lmax.Text + '个字符。');
    Exit;
  end;

  //排除回车换行-暂时未发现Delphi文本框录入回车换行符号的方法
  if (Pos(#13#10,Edt_pwd.Text) <> 0) and (Pos(#13,Edt_pwd.Text) <> 0) then
  begin
    ShowMessage('密码中不能存在回车和换行！');
    Exit;
  end;

  Edt_1.Text := IntToStr(PwdChk(Edt_pwd.Text));
  Edt_2.Text := IntToStr(Noc_Score);
  Edt_3.Text := IntToStr(Ul_Score);
  Edt_4.Text := IntToStr(Ll_Score);
  Edt_5.Text := IntToStr(Num_Score);
  Edt_6.Text := IntToStr(Sybs_Score);
  Edt_7.Text := IntToStr(Midch_Score);
  Edt_8.Text := IntToStr(Rq_Score);
  Edt_9.Text := IntToStr(Lo_Score);
  Edt_10.Text := IntToStr(No_Score);
  Edt_11.Text := IntToStr(Rpt_Score);
  Edt_12.Text := IntToStr(Cul_Score);
  Edt_13.Text := IntToStr(Cll_Score);
  Edt_14.Text := IntToStr(Cn_Score);
  Edt_15.Text := IntToStr(Sl_Score);
  Edt_16.Text := IntToStr(Sn_Score);
  Edt_17.Text := IntToStr(Ssyb_Score);

  nScore := StrToInt(Edt_1.Text);

  if (nScore >= 0) and (nScore < 20) then
    ShowMessage('Very Weak')
  else if (nScore >= 20) and (nScore < 40) then
    ShowMessage('Weak')
  else if (nScore >= 40) and (nScore < 60) then
    ShowMessage('Good')
  else if (nScore >= 60) and (nScore < 80) then
    ShowMessage('Strong')
  else if (nScore >= 80) and (nScore <= 100) then
  ShowMessage('Very Strong');

end;

end.
