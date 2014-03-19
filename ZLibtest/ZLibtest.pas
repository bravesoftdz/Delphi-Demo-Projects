unit ZLibtest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZLib, StdCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    Btn_Decompress: TButton;
    Memo1: TMemo;
    Memo2: TMemo;
    Btn_Compress: TButton;
    Stat_1: TStatusBar;
    procedure Btn_DecompressClick(Sender: TObject);
    procedure Btn_CompressClick(Sender: TObject);
    procedure Memo2DblClick(Sender: TObject);
    procedure Memo1DblClick(Sender: TObject);
  private
    function SplitString(const Source,ch:String):TStringList;
    function HexToInt(const S: String): DWORD;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function TForm1.SplitString(const Source,ch:String):TStringList;
var
  temp:String;
  i:Integer;
begin
  Result:=TStringList.Create;
  //如果是空自符串则返回空列表
  if Source=''then
    exit;
  temp:=Source;
  i:=pos(ch,Source);
  while i<>0 do
  begin
    Result.add(copy(temp,0,i-1));
    Delete(temp,1,i);
    i:=pos(ch,temp);
  end;
  Result.add(temp);
end;

function TForm1.HexToInt(const S: String): DWORD;
var
  I : Integer;
begin
  Result := 0;
  for I := 1 to Length(S) do
  begin
    case s[I] of
      '0'..'9': Result := Result * 16 + Ord(S[I]) - Ord('0');
      'A'..'F': Result := Result * 16 + Ord(S[I]) - Ord('A') + 10;
      'a'..'f': Result := Result * 16 + Ord(S[I]) - Ord('a') + 10;
    else
      Result := 0;
      Exit;
    end;
  end
end;

procedure TForm1.Btn_DecompressClick(Sender: TObject);
var
  strlist: TStringList;
  inarray : array[0..1024] of Byte;
  outpointer : Pointer;
  len,i,flag : Integer;
begin
  if Trim(Memo1.Lines.Text) = '' then
  begin
    ShowMessage('Source is null!');
    Exit;
  end;
  Memo2.Lines.Text := '';
  strlist := SplitString(Memo1.Lines.Text,' ');
  FillChar(inarray, 255, #0);

  for i := 0 to strlist.Count-1 do
  begin
    //ShowMessage(strlist.Strings[i] + ' ' + IntToStr(HexToInt(strlist.Strings[i])));
    inarray[i] := HexToInt(Trim(strlist.Strings[i]));
  end;

  flag := 0;

  DecompressBuf(Pointer(@inarray[0]),strlist.Count,flag,outpointer,len);
  Memo2.Lines.Text := Copy(string(outpointer),1,len);
  Memo1.Lines.Text := '';
end;

procedure TForm1.Btn_CompressClick(Sender: TObject);
var
  str: string;
  inarray : array[0..1024] of Byte;
  outarray : array[0..1024] of Byte;
  outpointer : PByte;
  len,i,flag : Integer;
begin
  if Trim(Memo1.Lines.Text) = '' then
  begin
    ShowMessage('Source is null!');
    Exit;
  end;
  Memo2.Lines.Text :='';
  str := Memo1.Lines.Text;
  FillChar(inarray, 1024, #0);
  FillChar(outarray, 1024, #0);

  for i:=0 to Length(str) do
  begin
    inarray[i]:=byte(str[i+1]);
  end;

  CompressBuf(Pointer(@inarray), 1024, Pointer(outpointer), len);

  Move(outpointer^,outarray[0],len);

  for i:=0 to len-1 do
  begin
    Memo2.Lines.Text := Memo2.Lines.Text + IntToHex(outarray[i],2) + ' ';
  end;
  Memo2.Lines.Text := Trim(Memo2.Lines.Text);
  Memo1.Lines.Text := '';
end;

procedure TForm1.Memo2DblClick(Sender: TObject);
begin
  Memo2.SelectAll;
  Memo2.CopyToClipboard;
  Memo2.Lines.Text := '';
end;

procedure TForm1.Memo1DblClick(Sender: TObject);
begin
  Memo1.Lines.Text := '';
  Memo1.PasteFromClipboard;
end;

end.
