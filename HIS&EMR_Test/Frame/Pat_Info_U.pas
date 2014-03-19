unit Pat_Info_U;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBClient, Grids, DBGridEh;

type
  TPat_Info_fm = class(TFrame)
    DBGridEh1: TDBGridEh;
    Cds_Jtb: TClientDataSet;
    ds_Jtb: TDataSource;
    Cds_Jtbxm1: TStringField;
    Cds_Jtbbrid1: TStringField;
    Cds_Jtbxm2: TStringField;
    Cds_Jtbbrid2: TStringField;
    Cds_Jtbxm3: TStringField;
    Cds_Jtbbrid3: TStringField;
  private
    { Private declarations }
  public
    sumAcct: Double;
    procedure BuildItem(Cds:TClientDataSet; const xmmcF: String= 'sfxm'; const xmjeF: String='je');
  end;

implementation

{$R *.dfm}

{ TFrame1 } 

{ TFrame1 }

procedure TPat_Info_fm.BuildItem(Cds: TClientDataSet; const xmmcF,
  xmjeF: String);
begin
  cds_jtb.Open;
  Cds_Jtb.EmptyDataSet;
  with Cds do
  begin
    First;
    Cds_Jtb.EmptyDataSet;
    while not eof do
    begin
      Cds_Jtb.Append;
      Cds_Jtb.FieldByName('xm1').AsString:= FieldByName(xmmcF).AsString;
      Cds_Jtb.FieldByName('brid1').AsString:= FieldByName(xmjeF).AsString;
      Cds_Jtb.Post;
      Next;
      if eof then
        break;
      Cds_Jtb.Edit;
      Cds_Jtb.FieldByName('xm2').AsString:= FieldByName(xmmcF).AsString;
      Cds_Jtb.FieldByName('brid2').AsString:= FieldByName(xmjeF).AsString;
      Cds_Jtb.Post;
      Next;
      if eof then
        break;
      Cds_Jtb.Edit;
      Cds_Jtb.FieldByName('xm3').AsString:= FieldByName(xmmcF).AsString;
      Cds_Jtb.FieldByName('brid3').AsString:= FieldByName(xmjeF).AsString;
      Cds_Jtb.Post;
      Next;
    end;
  end;
end; 
end.
