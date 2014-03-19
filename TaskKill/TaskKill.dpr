program TaskKill;

uses
  Forms,
  Main_f in 'Main_f.pas' {Main};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
