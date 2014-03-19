unit Rcpt_Item_U;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBClient, Grids, DBGridEh;

type
  TRCPT_Item_fm = class(TFrame)
    DBGridEh1: TDBGridEh;
    Cds_Jtb: TClientDataSet;
    ds_Jtb: TDataSource;
  private
    { Private declarations }
  public
    rjelj: real;
    procedure BuildItem(Cds:TClientDataSet; const xmmcF: String= 'sfxm'; const xmjeF: String='je');
  end;

implementation

{$R *.dfm}

{ TFrame1 }



{ TFrame1 }

procedure TRCPT_Item_fm.BuildItem(Cds: TClientDataSet; const xmmcF,
  xmjeF: String);
begin
  if not cds_Jtb.Active then
    cds_Jtb.Open;
  Cds_Jtb.EmptyDataSet;
  rjelj:= 0;
  with Cds do
  begin
    First;
    while not eof do
    begin
      Cds_Jtb.Append;
      Cds_Jtb.FieldByName('xm1').AsString:= FieldByName(xmmcF).AsString;
      Cds_Jtb.FieldByName('je1').AsString:= FieldByName(xmjeF).AsString;
      Cds_Jtb.Post;
      rjelj:= rjelj+FieldByName(xmjef).AsFloat;
      Next;
      if eof then
        break;
      Cds_Jtb.Edit;
      Cds_Jtb.FieldByName('xm2').AsString:= FieldByName(xmmcF).AsString;
      Cds_Jtb.FieldByName('je2').AsString:= FieldByName(xmjeF).AsString;
      Cds_Jtb.Post;
      rjelj:= rjelj+FieldByName(xmjef).AsFloat;
      Next;
      if eof then
        break;
      Cds_Jtb.Edit;
      Cds_Jtb.FieldByName('xm3').AsString:= FieldByName(xmmcF).AsString;
      Cds_Jtb.FieldByName('je3').AsString:= FieldByName(xmjeF).AsString;
      Cds_Jtb.Post;
      rjelj:= rjelj+FieldByName(xmjef).AsFloat;
      Next;
    end;
  end;
end;

end.
