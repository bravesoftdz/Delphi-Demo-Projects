unit edtBtn4_u;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, XPButton;

type
  TedtBtn4_fm = class(TFrame)
    Btn_SC: TXPButton;
    Btn_XZ: TXPButton;
    Btn_XG: TXPButton;
    Btn_gb: TXPButton;
    procedure Btn_SCClick(Sender: TObject);
    procedure Btn_XZClick(Sender: TObject);
    procedure Btn_XGClick(Sender: TObject);
  private
    procedure CtlBtn(Bl: Boolean);
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrame2 }

procedure TedtBtn4_fm.CtlBtn(Bl: Boolean);
begin
  if bl then
  begin
    Btn_xg.CaptionTitle:= '�޸�(&E)';
    Btn_xg.Tag:= 0;
    Btn_XZ.CaptionTitle:= '����(&N)';
    Btn_XZ.Tag:= 0;
    btn_xg.Font.Color:= clBlack;
    btn_xz.Font.Color:= clBlack;
    btn_SC.SetFocus;
  end
  else
  begin
    Btn_XZ.CaptionTitle:= '����(&S)';
    Btn_XZ.Tag:= 1;
    Btn_XG.CaptionTitle:= '�ָ�(&R)';
    Btn_XG.Tag:= 1;
    btn_xg.Font.Color:= clblue;
    btn_xz.Font.Color:= clblue;
  end;
end;

procedure TedtBtn4_fm.Btn_SCClick(Sender: TObject);
begin
  CtlBtn(false);
end;

procedure TedtBtn4_fm.Btn_XZClick(Sender: TObject);
begin
  if btn_XZ.Tag = 0 then
    CtlBtn(false)
  else
    CtlBtn(true);
end;

procedure TedtBtn4_fm.Btn_XGClick(Sender: TObject);
begin
  if btn_XG.Tag = 0 then
    CtlBtn(false)
  else
    CtlBtn(true);
end;

end.
