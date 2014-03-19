program emr_bjblmb;

uses
  SysUtils,
  Forms,
  main_f in 'main_f.pas' {Frm_main},
  ShareMsg_u in '..\Common\ShareMsg_u.pas',
  base_u in '..\Common\base_u.pas' {base_f},
  dm_u in '..\Common\dm_u.pas' {DM: TDataModule},
  PlugIn_u in '..\Common\PlugIn_u.pas' {PlugIn_f},
  Popup_u in '..\Common\Popup_u.pas' {Popup_f},
  UserFunc_U in '..\ShareUnit\UserFunc_U.pas',
  DllFunc_u in '..\ShareUnit\DllFunc_u.pas',
  Insur_u in '..\ShareUnit\Insur_u.pas',
  Share_u in '..\ShareUnit\Share_u.pas',
  prop_f in 'prop_f.pas' {Frm_Prop};

{$R *.res}

begin
  ExePath := ExtractFilePath(Application.ExeName);
  Yhxx.yhbs := '9999';

  Application.Initialize;
  Application.CreateForm(TFrm_main, Frm_main);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
