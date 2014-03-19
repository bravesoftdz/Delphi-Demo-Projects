unit SelectorForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ADODB, StdCtrls;

type
  TFormMain = class(TForm)
    qry1: TADOQuery;
    DataSource1: TDataSource;
    edit2: TEdit;
    grp1: TGroupBox;
    rb1: TRadioButton;
    rb2: TRadioButton;
    cbb1: TComboBox;
    dbgrd1: TDBGrid;
    procedure cbb1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure rb1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rb2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbb1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edit2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

procedure TFormMain.cbb1Change(Sender: TObject);
begin

  if cbb1.Text <> '' then
  begin

    if cbb1.Text = 'HIS字典表' then
    begin
      qry1.Close;

      qry1.SQL.Clear;

      qry1.SQL.Add('select * from dict');

      edit2.Text := '';

      qry1.Open;

    end;

    if cbb1.Text = 'HIS打印模板' then
    begin
      qry1.Close;

      qry1.SQL.Clear;

      qry1.SQL.Add('select * from fr3');

      edit2.Text := '';

      qry1.Open;

    end;

  end;

end;

procedure TFormMain.FormActivate(Sender: TObject);
begin

  cbb1.Items.Clear;

  cbb1.Items.Add('HIS字典表');

  cbb1.Items.Add('HIS打印模板');

  rb1.SetFocus;

end;

procedure TFormMain.rb1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if Key = VK_RETURN then

    cbb1.SetFocus;

end;

procedure TFormMain.rb2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if Key = VK_RETURN then

    cbb1.SetFocus;
    
end;

procedure TFormMain.cbb1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if Key = VK_RETURN then

    edit2.SetFocus;

end;

procedure TFormMain.edit2Change(Sender: TObject);
begin

  if (cbb1.Text <> '') and (edit2.Text <> '') then
  begin

    if cbb1.Text = 'HIS字典表' then
    begin

      if rb1.Checked = True then
      begin

        qry1.Close;

        qry1.SQL.Clear;

        qry1.SQL.Add('select * from dict where chname like ''%' + edit2.Text +'%''' );

        qry1.Open;

      end;

      if rb2.Checked = True then
      begin

        qry1.Close;

        qry1.SQL.Clear;

        qry1.SQL.Add('select * from dict where enname like ''%' + edit2.Text +'%''' );

        qry1.Open;

      end;

    end;

    if cbb1.Text = 'HIS打印模板' then
    begin

      if rb1.Checked = True then
      begin

        qry1.Close;

        qry1.SQL.Clear;

        qry1.SQL.Add('select * from fr3 where chname like ''%' + edit2.Text +'%''' );

        qry1.Open;

      end;

      if rb2.Checked = True then
      begin

        qry1.Close;

        qry1.SQL.Clear;

        qry1.SQL.Add('select * from fr3 where enname like ''%' + edit2.Text +'%''' );

        qry1.Open;

      end;

    end;

  end;

end;

end.
