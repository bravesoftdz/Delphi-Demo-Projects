program DBTool;

uses
  Forms,
  main_fm in 'main_fm.pas' {fmMain},
  SQLite3 in 'SQLite3.pas',
  sqlite3udf in 'sqlite3udf.pas',
  SQLiteTable3 in 'SQLiteTable3.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
