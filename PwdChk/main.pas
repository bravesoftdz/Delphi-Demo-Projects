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
    Noc_Score: Integer; //�ַ����ȵ÷�
    Ul_Score: Integer;//��д��ĸ���÷�
    Ll_Score: Integer;//Сд��ĸ���÷�
    Num_Score: Integer;//�������÷�
    Sybs_Score: Integer;//�������÷�
    Midch_Score: Integer;//�м��ַ��÷�
    Rq_Score: Integer;//������÷�
    Lo_Score: Integer;//ֻ����ĸ����
    No_Score: Integer;//ֻ�����ּ���
    Rpt_Score: Integer;//�ظ��ַ�����
    Cul_Score: Integer;//�ظ���д��ĸ����
    Cll_Score: Integer;//�ظ�Сд��ĸ����
    Cn_Score: Integer;//�ظ����ּ���
    Sl_Score: Integer;//˳����ĸ����
    Sn_Score: Integer;//˳�����ּ���
    Ssyb_Score: Integer;//˳����ż���
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
//  Noc_Score: Integer; //�ַ����ȵ÷�
//  Ul_Score: Integer;//��д��ĸ���÷�
//  Ll_Score: Integer;//Сд��ĸ���÷�
//  Num_Score: Integer;//�������÷�
//  Sybs_Score: Integer;//�������÷�
//  Midch_Score: Integer;//�м��ַ��÷�
//  Rq_Score: Integer;//������÷�
//  Lo_Score: Integer;//ֻ����ĸ����
//  No_Score: Integer;//ֻ�����ּ���
//  Rpt_Score: Integer;//�ظ��ַ�����
//  Cul_Score: Integer;//�ظ���д��ĸ����
//  Cll_Score: Integer;//�ظ�Сд��ĸ����
//  Cn_Score: Integer;//�ظ����ּ���
//  Sl_Score: Integer;//˳����ĸ����
//  Sn_Score: Integer;//˳�����ּ���
//  Ssyb_Score: Integer;//˳����ż���
  //����Ϊ�������ݣ�������Ϊȫ�ֱ�������������ʹ��ʱȡ��ע��
  i,j: Integer; //ѭ������
  tmpchar: Char;
  pwdlen: Integer;//���볤��
  tmprslt: Integer;
  nTmpAlphaUC,nConsecAlphaUC,nConsecCharType,nAlphaUC,nTmpAlphaLC,
  nConsecAlphaLC,nAlphaLC,nMidChar,nTmpNumber,nConsecNumber,nNumber,
  nTmpSymbol,nConsecSymbol,nSymbol,nRepChar,nUnqChar,nSeqAlpha,nSeqChar,
  nSeqNumber,nSeqSymbol,nReqChar,nRequirements,nMinReqChars: Integer;
  bCharExists: Boolean;
  nRepInc: Double;
  sFwd,sRev: string;
begin
  //��ʼ������ֵ
  Result := 0;
  //��ʼ���м����
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

  //��ʼ������
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

  //��jsת�����㷨
  for i := 1 to pwdlen do
  begin
    tmpchar := pwd[i];

    if RegMatch(string(tmpchar),'[A-Z]') then //ƥ���д��ĸ
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
    if RegMatch(string(tmpchar),'[a-z]') then //ƥ��Сд��ĸ
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
    if RegMatch(string(tmpchar),'[0-9]') then //ƥ������
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
    if RegMatch(string(tmpchar),'[^a-zA-Z0-9_]') then //ƥ�����
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

  //���볤�ȵ÷�
  Noc_Score := pwdlen * nMultLength;

  if (nAlphaUC > 0) and (nAlphaUC < pwdlen) then
  begin
    //��д��ĸ�����÷�
    Ul_Score := (pwdlen - nAlphaUC) * 2;
  end;

  if (nAlphaLC > 0) and (nAlphaLC < pwdlen) then
  begin
    //Сд��ĸ�����÷�
    Ll_Score := (pwdlen - nAlphaLC) * 2;
  end;

  if (nNumber > 0) and (nNumber < pwdlen) then
  begin
    //���ָ����÷�
    Num_Score := nNumber * nMultNumber;
  end;

  if nSymbol > 0 then
  begin
    //���Ÿ����÷�
    Sybs_Score := nSymbol * nMultSymbol;
  end;

  if nMidChar > 0 then
  begin
    //�м��ַ������÷�
    Midch_Score := nMidChar * nMultMidChar;
  end;

  if ((nAlphaLC > 0) or (nAlphaUC > 0)) and (nSymbol = 0) and (nNumber = 0) then
  begin
    //ֻ����ĸ����
    Lo_Score := pwdlen;
  end;

  if (nAlphaLC = 0) and (nAlphaUC = 0) and (nSymbol = 0) and (nNumber > 0) then
  begin
    //ֻ�����ּ���
    No_Score := pwdlen;
  end;

  if nRepChar > 0 then
  begin
    // Same character exists more than once
    //�ظ��ַ�����
    Rpt_Score := Trunc(nRepInc);
  end;

  if nConsecAlphaUC > 0 then
  begin
    // Consecutive Uppercase Letters exist
    //�ظ���д��ĸ����
    Cul_Score := nConsecAlphaUC * nMultConsecAlphaUC;
  end;
  
  if nConsecAlphaLC > 0 then
  begin
    // Consecutive Lowercase Letters exist
    //�ظ�Сд��ĸ����
    Cll_Score := nConsecAlphaLC * nMultConsecAlphaLC;
  end;

  if nConsecNumber > 0 then
  begin
    // Consecutive Numbers exist
    //�ظ����ּ���
    Cn_Score := nConsecNumber * nMultConsecNumber;
  end;

  if nSeqAlpha > 0 then
  begin
    // Sequential alpha strings exist (3 characters or more)
    //˳����ĸ����
    Sl_Score := nSeqAlpha * nMultSeqAlpha;
  end;
  
  if nSeqNumber > 0 then
  begin
    // Sequential numeric strings exist (3 characters or more)
    //˳�����ּ���
    Sn_Score := nSeqNumber * nMultSeqNumber;
  end;

  if nSeqSymbol > 0 then
  begin
    // Sequential symbol strings exist (3 characters or more)
    //˳����ż���
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
    //������Ϸ���
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

  //ȷ����������
  if (Length(Edt_pwd.Text) > StrToInt(Trim(Edt_lmax.Text))) or
     (Length(Edt_pwd.Text) < StrToInt(Trim(Edt_lmin.Text))) then
  begin
    ShowMessage('���벻�ڳ��ȷ�Χ�����ڣ�' + #13 +
                '���볤��Ӧ��С��' + Edt_lmax.Text + '���ַ����Ҳ�����' +
                Edt_lmax.Text + '���ַ���');
    Exit;
  end;

  //�ų��س�����-��ʱδ����Delphi�ı���¼��س����з��ŵķ���
  if (Pos(#13#10,Edt_pwd.Text) <> 0) and (Pos(#13,Edt_pwd.Text) <> 0) then
  begin
    ShowMessage('�����в��ܴ��ڻس��ͻ��У�');
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
