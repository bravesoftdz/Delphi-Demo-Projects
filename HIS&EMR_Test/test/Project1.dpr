program Project1;

uses
  SysUtils,
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  dm_u in '..\Common\dm_u.pas' {DM: TDataModule},
  Share_u in '..\ShareUnit\Share_u.pas',
  ShareMsg_u in '..\Common\ShareMsg_u.pas';

{$R *.res}

begin
  ExePath := ExtractFilePath(Application.ExeName);
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
