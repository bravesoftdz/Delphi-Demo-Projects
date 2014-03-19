program PwdChk;

uses
  Forms,
  main in 'main.pas' {main_f},
  RegExpr in 'RegExpr.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tmain_f, main_f);
  Application.Run;
end.
