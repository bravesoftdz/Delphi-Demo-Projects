unit edtBtn5_u;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, XPButton;

type
  TedtBtn5_f = class(TFrame)
    Btn_Bc: TXPButton;
    Btn_Xz: TXPButton;
    Btn_FQ: TXPButton;
    Btn_FF: TXPButton;
    Btn_Gb: TXPButton;
    procedure Btn_FFClick(Sender: TObject);
    procedure Btn_XzClick(Sender: TObject);
    procedure Btn_BcClick(Sender: TObject);
    procedure Btn_FQClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure CtlBtn(Bl: Boolean);
  end;

implementation

{$R *.dfm}

{ TedtBtn5_f }

procedure TedtBtn5_f.CtlBtn(Bl: Boolean);
begin
  Btn_Xz.Enable:= bl;
  Btn_FF.Enable:= bl;
  Btn_Bc.Enable:= not bl;
  Btn_Fq.Enable:= not bl;
end;

procedure TedtBtn5_f.Btn_FFClick(Sender: TObject);
begin
  CtlBtn(false);
end;

procedure TedtBtn5_f.Btn_XzClick(Sender: TObject);
begin
  CtlBtn(false);
end;

procedure TedtBtn5_f.Btn_BcClick(Sender: TObject);
begin
  CtlBtn(true);
end;

procedure TedtBtn5_f.Btn_FQClick(Sender: TObject);
begin
  CtlBtn(true);
end;

end.
