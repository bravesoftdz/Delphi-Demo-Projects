program Decrypt;

uses
  Forms,
  FormMain_f in 'FormMain_f.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
