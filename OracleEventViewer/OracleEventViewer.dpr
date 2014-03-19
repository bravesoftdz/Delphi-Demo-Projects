program OracleEventViewer;

uses
  Forms,
  eventviewer_f in 'eventviewer_f.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
