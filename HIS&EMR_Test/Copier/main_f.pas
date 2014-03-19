unit main_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Btn_go: TButton;
    Btn_cache: TButton;
    procedure Btn_goClick(Sender: TObject);
    procedure Btn_cacheClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function GetNsoPath: string;
var
   p, p1 : PChar;
   tmpstr: string;
begin
  Result := '';
  {$IFDEF WIN32}
    p := GetEnvironmentStrings;
    p1 := p;
  {$ELSE}
    p := GetDOSEnvironment;
  {$ENDIF}

   while p^ <> #0 do
   begin
     tmpstr := Trim(StrPas(p));
     if UpperCase(Copy(tmpstr,1,6)) = 'OOPATH' then
     begin
       tmpstr := Copy(tmpstr, Pos('=',tmpstr) + 1, Length(tmpstr) - Pos('=',tmpstr));
       tmpstr := Trim(tmpstr);
       if UpperCase(Copy(tmpstr, Length(tmpstr) - 6, 7)) = 'PROGRAM' then
         tmpstr := Copy(tmpstr, 1, Length(tmpstr) - 7);
       Result := tmpstr;
       Exit;
     end;
     Inc(p, lstrlen(p) + 1);
   end;
end;

function GetNsoCachePath: string;
var
   p, p1 : PChar;
   tmpstr: string;
begin
  Result := '';
  {$IFDEF WIN32}
    p := GetEnvironmentStrings;
    p1 := p;
  {$ELSE}
    p := GetDOSEnvironment;
  {$ENDIF}

   while p^ <> #0 do
   begin
     tmpstr := Trim(StrPas(p));
     if UpperCase(Copy(tmpstr,1,11)) = 'USERPROFILE' then
     begin
       tmpstr := Copy(tmpstr, Pos('=',tmpstr) + 1, Length(tmpstr) - Pos('=',tmpstr));
       tmpstr := Trim(tmpstr);
       if (Copy(tmpstr, Length(tmpstr) - 1, 1) <> '\') and
         (Copy(tmpstr, Length(tmpstr) - 1, 1) <> '/') then
         tmpstr := tmpstr + '\';
       tmpstr := tmpstr + 'Local Settings\Temp\NeoShine_Med3';
       Result := tmpstr;
       Exit;
     end;
     Inc(p, lstrlen(p) + 1);
   end;
end;

procedure TForm1.Btn_goClick(Sender: TObject);
var
  path, spath: string;
  sr: TSearchRec;
begin
  path := GetNsoPath + 'Basis\share\config\soffice.cfg\modules\swriter\toolbar\';
  spath := GetCurrentDir + '\';
  if FindFirst(spath + '*.xml', faAnyFile, sr) = 0 then
  begin
    repeat
      if CopyFile(PChar(spath + sr.Name), PChar(path + sr.Name), False) = False then
        ShowMessage('Copy ' + sr.Name + ' Failed!');
    until FindNext(sr) <> 0;
  end;
  FindClose(sr);
  ShowMessage('Copy Completely!');
  //%userprofile%'Local Settings\Temp\NeoShine_Med3'
end;

procedure TForm1.Btn_cacheClick(Sender: TObject);
var
  tmpstr: string;
begin
  tmpstr := GetNsoCachePath;
  if not DirectoryExists(tmpstr) then
    if not CreateDir(tmpstr) then
    begin
      ShowMessage('Create Dir Error!');
      Exit;
    end;
  ShowMessage('Create Dir Completely!');

end;

end.
