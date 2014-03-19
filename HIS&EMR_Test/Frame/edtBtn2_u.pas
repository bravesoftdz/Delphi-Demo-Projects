unit edtBtn2_u;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, XPButton;

type
  TedtBtn2_fm = class(TFrame)
    Btn_OK: TXPButton;
    Btn_cancel: TXPButton;
    procedure Btn_OKClick(Sender: TObject);
    procedure Btn_cancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    BlOK: Boolean;
  end;

implementation

{$R *.dfm}

procedure TedtBtn2_fm.Btn_OKClick(Sender: TObject);
begin
  BlOK:= true;
end;

procedure TedtBtn2_fm.Btn_cancelClick(Sender: TObject);
begin
  BlOK:= false;
end;

end.
