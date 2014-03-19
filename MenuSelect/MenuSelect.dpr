program MenuSelect;

uses
  Forms,
  main in 'main.pas' {main_f};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tmain_f, main_f);
  Application.Run;
end.
