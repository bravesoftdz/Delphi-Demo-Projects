unit eventviewer_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ADODB, ComCtrls,  IniFiles,
  AppEvnts, ExtCtrls;

type
  TForm1 = class(TForm)
    Dsource_1: TDataSource;
    ADOQry_1: TADOQuery;
    Mem_1: TMemo;
    Grp1: TGroupBox;
    Lb_1: TLabel;
    Edt_srv: TEdit;
    Lb_2: TLabel;
    Edt_act: TEdit;
    Lb_3: TLabel;
    Edt_pwd: TEdit;
    Lb_4: TLabel;
    CBox_usr: TComboBox;
    Lb_5: TLabel;
    CBox_prs: TComboBox;
    Btn_Refresh: TButton;
    ADOQry_2: TADOQuery;
    EDBGrd_1: TDBGrid;
    tmr1: TTimer;
    procedure Btn_RefreshClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Mem_1DblClick(Sender: TObject);
    procedure Edt_srvExit(Sender: TObject);
    procedure Edt_actExit(Sender: TObject);
    procedure Edt_pwdExit(Sender: TObject);
    procedure CBox_usrChange(Sender: TObject);
    procedure CBox_prsChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Btn_RefreshClick(Sender: TObject);
var
  tempstr: string;
begin
  if (Trim(Edt_srv.Text) = '') or (Trim(Edt_act.Text) = '') or (Trim(Edt_pwd.Text) = '') then
  begin
    MessageBox(0,' ˝æ›ø‚¡¨Ω”–≈œ¢≤ªÕÍ’˚£°','≥ˆ¥Ì',1);
    Exit;
  end;

  if Trim(CBox_usr.Text) <> '' then
  begin
    if Trim(CBox_prs.Text) <> '' then
    begin
      tempstr := ' where parsing_schema_name=''' + Trim(CBox_usr.Text) +
                      ''' and module=''' + Trim(CBox_prs.Text) + ''' ';
    end
    else begin
      tempstr := ' where parsing_schema_name=''' + Trim(CBox_usr.Text) +
                      ''' ';
    end;
  end
  else begin
    if Trim(CBox_prs.Text) <> '' then
    begin
      tempstr := ' where module=''' + Trim(CBox_prs.Text) + ''' ';
    end
    else begin
      tempstr := ' ';
    end;
  end;
  with ADOQry_1 do
  begin
    Close;
    ConnectionString := 'Provider=MSDAORA.1;' +
                        'Password=' + Trim(Edt_pwd.Text) + ';' +
                        'User ID=' + Trim(Edt_act.Text) + ';' +
                        'Data Source=' + Trim(Edt_srv.Text) + ';' +
                        'Persist Security Info=True';
    SQL.Text := 'select sql_text,to_char(sql_fulltext) as sql_full,parsing_schema_name,module,last_active_time from v$sqlarea' + tempstr + 'order by last_active_time desc';
    Open;
  end;
  if ADOQry_1.RecordCount = 0 then
  begin
    MessageBox(0,'≤È—Ø∑µªÿΩ·π˚Œ™ø’£°','¥ÌŒÛ',1);
    Exit;
  end;  
  if (CBox_usr.Items.Count = 0) or (CBox_prs.Items.Count = 0) then
  begin
    CBox_usr.Items.Clear;
    CBox_prs.Items.Clear;
    with ADOQry_2 do
    begin
      Close;
      ConnectionString := 'Provider=MSDAORA.1;' +
                          'Password=' + Trim(Edt_pwd.Text) + ';' +
                          'User ID=' + Trim(Edt_act.Text) + ';' +
                          'Data Source=' + Trim(Edt_srv.Text) + ';' +
                          'Persist Security Info=True';
      SQL.Text := 'select distinct parsing_schema_name from v$sqlarea where parsing_schema_name is not null';
      Open;

      First;
      while not Eof do
      begin
        CBox_usr.Items.Add(FieldByName('parsing_schema_name').AsString);
        Next;
      end;
    end;

    with ADOQry_2 do
    begin
      Close;
      ConnectionString := 'Provider=MSDAORA.1;' +
                          'Password=' + Trim(Edt_pwd.Text) + ';' +
                          'User ID=' + Trim(Edt_act.Text) + ';' +
                          'Data Source=' + Trim(Edt_srv.Text) + ';' +
                          'Persist Security Info=True';
      SQL.Text := 'select distinct module from v$sqlarea where module is not null';
      Open;

      First;
      while not Eof do
      begin
        CBox_prs.Items.Add(FieldByName('module').AsString);
        Next;
      end;
    end;

  end;   

  EDBGrd_1.SetFocus;
  Mem_1.Lines.Text := EDBGrd_1.Fields[0].Text;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create('save.ini');
  try
    Edt_srv.Text := ini.ReadString('option','srv','');
    Edt_act.Text := ini.ReadString('option','act','');
    Edt_pwd.Text := ini.ReadString('option','pwd','');
    CBox_usr.Text := ini.ReadString('option','usr','');
    CBox_prs.Text := ini.ReadString('option','prs','');
  except
    MessageBox(0,'∂¡≈‰÷√œÓ ß∞‹£°','¥ÌŒÛ',1);
  end;
end;

procedure TForm1.Mem_1DblClick(Sender: TObject);
begin
  Mem_1.SelectAll;
  Mem_1.CopyToClipboard;
end;

procedure TForm1.Edt_srvExit(Sender: TObject);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create('save.ini');
  try
    ini.WriteString('option','srv',Trim(Edt_srv.Text));
  except
    MessageBox(0,'–¥≈‰÷√œÓ ß∞‹£°','¥ÌŒÛ',1);
  end;
end;

procedure TForm1.Edt_actExit(Sender: TObject);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create('save.ini');
  try
    ini.WriteString('option','act',Trim(Edt_act.Text));
  except
    MessageBox(0,'–¥≈‰÷√œÓ ß∞‹£°','¥ÌŒÛ',1);
  end;
end;

procedure TForm1.Edt_pwdExit(Sender: TObject);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create('save.ini');
  try
    ini.WriteString('option','pwd',Trim(Edt_pwd.Text));
  except
    MessageBox(0,'–¥≈‰÷√œÓ ß∞‹£°','¥ÌŒÛ',1);
  end;
end;

procedure TForm1.CBox_usrChange(Sender: TObject);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create('save.ini');
  try
    ini.WriteString('option','usr',Trim(CBox_usr.Text));
  except
    MessageBox(0,'–¥≈‰÷√œÓ ß∞‹£°','¥ÌŒÛ',1);
  end;
end;

procedure TForm1.CBox_prsChange(Sender: TObject);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create('save.ini');
  try
    ini.WriteString('option','prs',Trim(CBox_prs.Text));
  except
    MessageBox(0,'–¥≈‰÷√œÓ ß∞‹£°','¥ÌŒÛ',1);
  end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  if (Edt_srv.Text <> '') and (Edt_act.Text <> '') and (Edt_pwd.Text <> '') then
    Btn_RefreshClick(Sender);
end;

procedure TForm1.tmr1Timer(Sender: TObject);
begin
  if (ADOQry_1.Active = True) and (GetFocus = EDBGrd_1.Handle) then
    Mem_1.Lines.Text := ADOQry_1.FieldByName('sql_full').AsString;
end;

end.
