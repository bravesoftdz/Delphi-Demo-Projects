unit Popup_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, base_u, ExtCtrls, TFlatPanelUnit,StatusBarEx;

type
  TPopup_f = class(Tbase_f)
    pnl_border1: TFlatPanel;
    pnl_border2: TPanel;
    pnl_title: TPanel;
    bvl_title: TBevel;
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    Stbr_Info: TStatusBarEx;
  end;

var
  Popup_f: TPopup_f;

implementation

{$R *.dfm}

procedure TPopup_f.FormActivate(Sender: TObject);
begin
  pnl_title.Color:= clNavy;
  if Assigned(stbr_Info) then
    stbr_Info.Panels[0].Alignment:= taRightJustify;
end;

procedure TPopup_f.FormDeactivate(Sender: TObject);
begin
  pnl_title.Color:= clMedGray;
end;

procedure TPopup_f.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(stbr_Info) then
  begin
    stbr_Info.Panels[0].Text:= '';
    stbr_Info.Panels[0].Alignment:= taLeftJustify;
  end;
end;

end.
