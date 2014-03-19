program DelphiCodeTrans;

uses
  Forms,
  FormMain_f in 'FormMain_f.pas' {FormMain};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
