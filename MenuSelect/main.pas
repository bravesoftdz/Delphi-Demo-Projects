unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ToolWin, ComCtrls, AppEvnts, ImgList;

type
  Tmain_f = class(TForm)
    Menu_1: TMainMenu;
    Mitem_A: TMenuItem;
    Mitem_A1: TMenuItem;
    Mitem_A2: TMenuItem;
    Mitem_A3: TMenuItem;
    Mitem_B: TMenuItem;
    Mitem_B1: TMenuItem;
    Mitem_B2: TMenuItem;
    Mitem_B3: TMenuItem;
    Mitem_C: TMenuItem;
    Mitem_C2: TMenuItem;
    Mitem_C1: TMenuItem;
    Mitem_C3: TMenuItem;
    Mitem_D: TMenuItem;
    Mitem_D1: TMenuItem;
    Mitem_D2: TMenuItem;
    Mitem_D3: TMenuItem;
    PupMenu_1: TPopupMenu;
    Mitem_select: TMenuItem;
    Edt_1: TEdit;
    Stat_1: TStatusBar;
    procedure Edt_1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Mitem_A1Click(Sender: TObject);
    procedure Mitem_A2Click(Sender: TObject);
    procedure Mitem_A3Click(Sender: TObject);
    procedure Mitem_B1Click(Sender: TObject);
    procedure Mitem_B2Click(Sender: TObject);
    procedure Mitem_B3Click(Sender: TObject);
    procedure Mitem_C1Click(Sender: TObject);
    procedure Mitem_C2Click(Sender: TObject);
    procedure Mitem_C3Click(Sender: TObject);
    procedure Mitem_D1Click(Sender: TObject);
    procedure Mitem_D2Click(Sender: TObject);
    procedure Mitem_D3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  main_f: Tmain_f;

implementation

{$R *.dfm}

procedure Tmain_f.Edt_1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Arect: TRect;
  i,j,k:integer;
  item: TMenuItem;
  ResultList:TStringList;
begin
  if Key = VK_RETURN then
  begin
    PupMenu_1.Items.Clear;

    for i := 0 to Menu_1.Items.count-1 do
    begin
      for j := 0 to Menu_1.Items[i].count-1 do
      begin
        ResultList := TStringList.Create;
        try
          ResultList.Delimiter := ' ';
          ResultList.DelimitedText := Edt_1.Text;

          for k:= 0 to ResultList.Count-1 do
          begin
            if Trim(ResultList.Strings[k]) = '' then
              Continue;

            if Pos(Trim(ResultList.Strings[k]),Menu_1.Items[i].Items[j].Caption) <> 0 then
            begin
              item := TMenuItem.Create(PupMenu_1);
              item.Caption := Menu_1.Items[i].Items[j].Caption;
              item.OnClick := Menu_1.Items[i].Items[j].OnClick;
              PupMenu_1.Items.Add(item);
            end;

          end;
        finally
          FreeAndNil(ResultList);
        end;

      end;
    end;
    GetWindowRect(Edt_1.Handle,Arect);
    PupMenu_1.Popup(Arect.TopLeft.X,Arect.BottomRight.Y);
    Edt_1.SetFocus;
  end;

end;

procedure Tmain_f.Mitem_A1Click(Sender: TObject);
begin
  ShowMessage('A1');
end;

procedure Tmain_f.Mitem_A2Click(Sender: TObject);
begin
  ShowMessage('A2');
end;

procedure Tmain_f.Mitem_A3Click(Sender: TObject);
begin
  ShowMessage('A3');
end;

procedure Tmain_f.Mitem_B1Click(Sender: TObject);
begin
  ShowMessage('B1');
end;

procedure Tmain_f.Mitem_B2Click(Sender: TObject);
begin
  ShowMessage('B2');
end;

procedure Tmain_f.Mitem_B3Click(Sender: TObject);
begin
  ShowMessage('B3');
end;

procedure Tmain_f.Mitem_C1Click(Sender: TObject);
begin
  ShowMessage('C1');
end;

procedure Tmain_f.Mitem_C2Click(Sender: TObject);
begin
  ShowMessage('C2');
end;

procedure Tmain_f.Mitem_C3Click(Sender: TObject);
begin
  ShowMessage('C3');
end;

procedure Tmain_f.Mitem_D1Click(Sender: TObject);
begin
  ShowMessage('D1');
end;

procedure Tmain_f.Mitem_D2Click(Sender: TObject);
begin
  ShowMessage('D2');
end;

procedure Tmain_f.Mitem_D3Click(Sender: TObject);
begin
  ShowMessage('D3');
end;

end.
