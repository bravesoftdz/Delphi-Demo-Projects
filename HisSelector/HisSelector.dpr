program HisSelector;

uses
  Forms,
  SelectorForm in 'SelectorForm.pas' {FormMain};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
