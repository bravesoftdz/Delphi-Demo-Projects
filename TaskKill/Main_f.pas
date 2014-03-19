unit Main_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TlHelp32;

type
  TMain = class(TForm)
    Edt_TskNm: TEdit;
    Lb_TskNm: TLabel;
    Btn_Kill: TButton;
    procedure Btn_KillClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;

implementation

{$R *.dfm}


function KillTask(ExeFileName: string): Integer;
const
  PROCESS_TERMINATE = {post.content}01;
var
  ContinueLoop: boolean;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  Result := 0;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);

  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
    UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
    UpperCase(ExeFileName))) then
      Result := Integer(
                TerminateProcess(
                  OpenProcess(PROCESS_TERMINATE,
                  BOOL(0),
                  FProcessEntry32.th32ProcessID),
                  0
                  )
                );
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

//但是对于服务程序,它会提示"拒绝访问".其实只要程序拥有Debug权限即可
function EnablePrivilege(hToken: Cardinal; PrivName: string; bEnable: Boolean): Boolean;
var
  TP: TOKEN_PRIVILEGES;
  Dummy: Cardinal;
begin
  TP.PrivilegeCount := 1;
  LookupPrivilegeValue(nil, pchar(PrivName), TP.Privileges[0].Luid);
  if bEnable then
    TP.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED
  else TP.Privileges[0].Attributes := 0;
    AdjustTokenPrivileges(hToken, False, TP, SizeOf(TP), nil, Dummy);
  Result := GetLastError = ERROR_SUCCESS;
end;

function EnableDebugPrivilege: Boolean;
var
  hToken: Cardinal;
begin
  OpenProcessToken(GetCurrentProcess, TOKEN_ADJUST_PRIVILEGES, hToken);
  result:=EnablePrivilege(hToken, 'SeDebugPrivilege', True);
  CloseHandle(hToken);
end;


procedure TMain.Btn_KillClick(Sender: TObject);
begin
  KillTask(Edt_TskNm.Text);
end;

end.
