unit FormMain_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFormMain = class(TForm)
    Memo1: TMemo;
    btn1: TButton;
    Memo2: TMemo;
    btn2: TButton;
    btn3: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

function AnsiToUnicode(Ansi: string):string;
var
  s:string;
  i:integer;
  j,k:string[2];
  a:array [1..1000] of char;
begin
  s:='';
  StringToWideChar(Ansi,@(a[1]),500);
  i:=1;
  while ((a[i]<>#0) or (a[i+1]<>#0)) do
  begin
    j:=IntToHex(Integer(a[i]),2);
    k:=IntToHex(Integer(a[i+1]),2);
    s:=s+k+j;
    i:=i+2;
  end;
  Result:=s;
end;

function ReadHex(AString:string):integer;
begin
  Result:=StrToInt('$'+AString)
end;

function UnicodeToAnsi(Unicode: string):string;
var
  s:string;
  i:integer;
  j,k:string[2];
begin
  i:=1;
  s:='';
  while i<Length(Unicode) do
  begin
    j:=Copy(Unicode,i+2,2);
    k:=Copy(Unicode,i,2);
    i:=i+4;
    s:=s+Char(ReadHex(j))+Char(ReadHex(k));
  end;

  if s<>'' then
    s:=WideCharToString(PWideChar(s+#0#0#0#0))
  else
  s:='';
  Result:=s;
end;

function CodeToHex(Code: string):string;
var
  strreturn:string;
  i:integer;
  strlist: TStringList;
begin
  strlist := TStringList.Create;
  ExtractStrings(['#'],[' '],PChar(Code),strlist);
  i := 0;
  while i < strlist.Count do
  begin
    strreturn := strreturn + IntToHex(StrToInt(strlist.Strings[i]),4);
    i := i + 1;
  end;
  Result := strreturn;
end;


procedure TFormMain.btn1Click(Sender: TObject);
begin
  Memo2.Lines.Text := UnicodeToAnsi(Memo1.Lines.Text);
end;

procedure TFormMain.btn2Click(Sender: TObject);
begin
  Memo2.Lines.Text := AnsiToUnicode(Memo1.Lines.Text);
end;

procedure TFormMain.btn3Click(Sender: TObject);
begin
  Memo2.Lines.Text := UnicodeToAnsi(CodeToHex(Memo1.Lines.Text));
end;

end.
