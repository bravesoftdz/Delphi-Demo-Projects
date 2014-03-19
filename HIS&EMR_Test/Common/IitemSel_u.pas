unit IitemSel_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, base_u, Grids, DBGridEh, DB, DBClient, ExtCtrls, TFlatPanelUnit,
  FlatSelEdit, StrUtils, ComCtrls, StatusBarEx;

type
  TOpenDataSet=procedure() of Object;
  TIitemSel_f = class(Tbase_f)
    dbg_xm: TDBGridEh;
    cds_item: TClientDataSet;
    ds_item: TDataSource;
    stbr_item: TStatusBarEx;
    Shape1: TShape;
    procedure FormShow(Sender: TObject);
    procedure dbg_xmKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbg_xmDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure OnActivate(var msg: TWMActivate); message WM_ACTIVATE;
  protected
    procedure SetFilter(AStr: String);
  public
    blShow: Boolean;
    edt_bm: TFlatSelEdit;
    OpenDataSet: TOpenDataSet;
    BlOK: Boolean;
    INITFilter: String;
    StrInit: String;
    iType: Integer;  //1-¾«È· 2-Ä£ºý
    iMode: Integer;  //1-Öú´ÊÂë 2-´úÂë 3-»ìºÏ

    procedure ShowItem;
  end;

var
  IitemSel_f: TIitemSel_f;

implementation

uses  dm_u;

{$R *.dfm}

procedure TIitemSel_f.FormShow(Sender: TObject);
begin
  inherited;
  blShow:= true;
  if InitFilter='' then
    InitFilter:= '1=1';
  blOK:= false;
  SetFilter(StrInit);
end;

procedure TIitemSel_f.dbg_xmKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_ESCAPE:
    begin
      edt_bm.Text:= '';
      BlOK:= false;
      Close;
    end;
    VK_F5:
    begin
      OpenDataSet;
    end;
    VK_RETURN:
    begin
      dbg_xmDblClick(dbg_xm);
    end;
    Ord('A')..Ord('Z'),Ord('0')..Ord('9'),96..105,Ord('.'),190,110:
    begin
      if (Key>=96) and (Key<=105) then
        edt_bm.Text:= edt_bm.Text+Chr(Key-48)
      else if (Key=190) or (Key=110) then
        edt_bm.Text:= edt_bm.Text+'.'
      else
        edt_bm.Text:= edt_bm.Text+Chr(Key);
      SetFilter(edt_bm.Text);
    end;
    VK_BACK:
    begin
      if Length(edt_bm.Text)>0 then
        edt_bm.Text:= LeftStr(edt_bm.Text,Length(edt_bm.Text)-1);
      SetFilter(edt_bm.Text);
    end;
  else
    if ssCtrl in Shift then
    begin
      if Itype=1 then
        Itype:=2
      else
        Itype:=1;
      SetFilter(edt_bm.Text);
    end
    else if ssShift in Shift then
    begin
      if IMode=1 then
        Imode:= 2
      else if IMode=2 then
        iMode:= 3
      else
        Imode:= 1;
      SetFilter(edt_bm.Text);
    end;
  end;
end;

procedure TIitemSel_f.dbg_xmDblClick(Sender: TObject);
begin
  inherited;
  if Cds_Item.RecordCount= 0 then exit;
  blok:= true;
  Close;
end;

procedure TIitemSel_f.SetFilter(AStr: String);
begin
  case Itype of
    1:
    begin
      AStr:= ''''+AStr+'%''';
      stbr_item.Panels[0].Text:= '¾«È·';
    end;
    2:
    begin
      AStr:= '''%'+AStr+'%''';
      stbr_item.Panels[0].Text:= 'Ä£ºý';
    end;
  end;
  case iMode of
    1:
    begin
      AStr:= ' and [pydm] like'+AStr;
      stbr_item.Panels[1].Text:= 'Öú´ÊÂë¼ìË÷';
    end;
    2:
    begin
      AStr:= ' and [xmdm] like'+AStr;
      stbr_item.Panels[1].Text:= '´úÂë¼ìË÷';
    end;
    3:
    begin
      AStr:= ' and ([pydm] like'+AStr+' or [xmdm] like '+AStr+')';
      stbr_item.Panels[1].Text:= 'Öú´ÊÂë»ò´úÂë¼ìË÷';
    end;
  end;
  Cds_Item.Filter:= InitFilter+AStr;
end;

procedure TIitemSel_f.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  blShow:= false;
end;

procedure TIitemSel_f.ShowItem;
begin
  blShow:= true;
  Visible:= true;
  while (Visible) do Application.ProcessMessages;
  Visible:= false;
  blshow:= false;
end;

procedure TIitemSel_f.OnActivate(var msg: TWMActivate);
begin
  try
   if (msg.Active=WA_INACTIVE) then
   begin
     Close;
   end
   else if (msg.Active=WA_ACTIVE) then
     dbg_xm.SetFocus;
  except
  end;
end;

end.
