program PicMgr;

uses
  Forms,
  ReaderMain in 'ReaderMain.pas' {Form_main},
  CreateMain in 'CreateMain.pas' {Form_Create};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm_main, Form_main);
  Application.Run;
end.
