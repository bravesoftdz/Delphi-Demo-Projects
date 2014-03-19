unit fyxmfx_u;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGridEh, DB, DBClient;

type
  Tfyxmfx_fm = class(TFrame)
    cds_fyxm: TClientDataSet;
    ds_fyxm: TDataSource;
    dbg_fyfx: TDBGridEh;
  private
    { Private declarations }
  public
    rjelj: Real;
    procedure BuildItem(Cds:TClientDataSet; const xmmcF: String= 'sfxm'; const xmjeF: String='je';
      const xmblF: String='bl');
  end;

implementation

{$R *.dfm}

{ Tfyxmfx_fm }


{ Tfyxmfx_fm }

procedure Tfyxmfx_fm.BuildItem(Cds: TClientDataSet; const xmmcF, xmjeF,
  xmblF: String);
begin
  if not cds_fyxm.Active then
    cds_fyxm.Open;
  cds_fyxm.EmptyDataSet;
  rjelj:= 0;
  with cds do
  begin
    First;
    while not eof do
    begin
      Cds_fyxm.Append;
      Cds_fyxm.FieldByName('xmmc1').AsString:= FieldByName(xmmcf).AsString;
      Cds_fyxm.FieldByName('xmje1').AsString:= FieldByName(xmjef).AsString;
      Cds_fyxm.FieldByName('xmbl1').AsString:= FieldByName(xmblf).AsString;
      Cds_fyxm.Post;
      rjelj:= rjelj+FieldByName(xmjef).AsFloat;
      Next;
      if eof then
        break;
      Cds_fyxm.Edit;
      Cds_fyxm.FieldByName('xmmc2').AsString:= FieldByName(xmmcf).AsString;
      Cds_fyxm.FieldByName('xmje2').AsString:= FieldByName(xmjef).AsString;
      Cds_fyxm.FieldByName('xmbl2').AsString:= FieldByName(xmblf).AsString;
      Cds_fyxm.Post;
       rjelj:= rjelj+FieldByName(xmjef).AsFloat;
      next;
    end;
  end;
end;

end.
