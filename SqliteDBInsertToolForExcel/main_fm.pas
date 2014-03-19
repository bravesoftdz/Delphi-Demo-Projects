unit main_fm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB, Grids, DBGrids, DB, SQLite3, sqlite3udf, SQLiteTable3,
  StrUtils;

type
  TfmMain = class(TForm)
    editExcelPath: TEdit;
    Label2: TLabel;
    datasourceMain: TDataSource;
    gridMain: TDBGrid;
    cbbTables: TComboBox;
    btnGetTables: TButton;
    queryTables: TADOQuery;
    btnSetExcel: TButton;
    dlgopenExcelPath: TOpenDialog;
    conMain: TADOConnection;
    cbbSheets: TComboBox;
    Label1: TLabel;
    btnRefreshSheets: TButton;
    btnShowExcel: TButton;
    datasetMain: TADODataSet;
    btnInsertData: TButton;
    editDBPath: TEdit;
    btnSetDB: TButton;
    dlgopenDBPath: TOpenDialog;
    Label3: TLabel;
    Label4: TLabel;
    procedure btnGetTablesClick(Sender: TObject);
    procedure btnSetExcelClick(Sender: TObject);
    procedure btnRefreshSheetsClick(Sender: TObject);
    procedure btnShowExcelClick(Sender: TObject);
    procedure gridMainDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnSetDBClick(Sender: TObject);
    procedure btnInsertDataClick(Sender: TObject);
    procedure gridMainTitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;
  DBSqlite3: TSQLiteDatabase;
  boolFirstTime: Boolean;
implementation

{$R *.dfm}

procedure TfmMain.btnGetTablesClick(Sender: TObject);
var
  tablenames: TSQLIteTable;
begin
  cbbTables.Clear;
  tablenames := DBSqlite3.GetTable('SELECT tbl_name FROM sqlite_master WHERE type=''table''');
  try
    while not tablenames.EOF do
    begin
      cbbTables.Items.Add(tablenames.FieldAsString(tablenames.FieldIndex['tbl_name']));
      tablenames.Next;
    end;
  except
    on e: Exception do
    begin
      ShowMessage(e.Message);
    end;
  end;
end;

procedure TfmMain.btnSetExcelClick(Sender: TObject);
var
  ConnStr: String;
begin

  if dlgopenExcelPath.Execute then
  begin
    editExcelPath.Text := dlgopenExcelPath.FileName;
  end;

  if editExcelPath.Text = '' then Exit;

  ConnStr := ConnStr + 'Provider=Microsoft.ACE.OLEDB.12.0;Password="";';
  //'Provider=Microsoft.Jet.OLEDB.4.0;';
  ConnStr := ConnStr + 'Data Source=' + editExcelPath.Text + ';';
  ConnStr := ConnStr + 'Extended Properties=''Excel 12.0;IMEX=1;HDR=YES'';Persist Security Info=True;';
  //'Extended Properties=Excel 8.0;Persist Security Info=False;';

  try
    conMain.ConnectionString := ConnStr;
    conMain.LoginPrompt := False;
    conMain.Connected := True;
    ShowMessage('Set Excel Success!');
  except
    on e: Exception do
    begin
      editExcelPath.Text := '';
      ShowMessage(e.Message);
    end;
  end;

end;

procedure TfmMain.btnRefreshSheetsClick(Sender: TObject);
var
  i: Integer;
  tables: TStringList;
begin
  if conMain.Connected then
  begin
    tables := TStringList.Create;
    conMain.GetTableNames(tables,False);
    cbbSheets.Clear;
    for i := 0 to tables.Count - 1 do
    begin
      cbbSheets.Items.Add(tables[i]);
    end;  
  end;  
end;

procedure TfmMain.btnShowExcelClick(Sender: TObject);
begin
  if not conMain.Connected then Exit;
  if cbbSheets.Text = '' then Exit;

  with datasetMain do
  begin
    Close;
    Connection := conMain;
    CommandText := 'select * from [' + cbbSheets.Text + ']';
    boolFirstTime := True;
    Open;
  end;  
end;

procedure TfmMain.gridMainDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if boolFirstTime then
  begin
//    boolFirstTime := False;
    Column.Width := 120;
  end;
end;

procedure TfmMain.btnSetDBClick(Sender: TObject);
begin

  if dlgopenDBPath.Execute then
  begin
    editDBPath.Text := dlgopenDBPath.FileName;
  end;

  if editDBPath.Text = '' then Exit;

  try
    DBSqlite3 := TSQLiteDatabase.Create(dlgopenDBPath.FileName);
    ShowMessage('Set DB Success!');
  except
    on e: Exception do
    begin
      editExcelPath.Text := '';
      ShowMessage(e.Message);
    end;
  end;
end;

procedure TfmMain.btnInsertDataClick(Sender: TObject);
var
  i, j: Integer;
  imgfile: TFileStream;
  fieldStr:WideString;// string;
  valueStr:WideString;// string;
  modelSqlStr:WideString;// string;
  updateSqlStr:WideString;// string;
  strFieldName:WideString;// string;
  hasBlob: Boolean;
begin
  if not datasetMain.Active then Exit;
  if cbbTables.Text = '' then Exit;
  if cbbSheets.Text = '' then Exit;

  datasetMain.First;
  DBSqlite3.BeginTransaction;
  try
    while not datasetMain.Eof do
    begin
      hasBlob := False;
      for i := 0 to datasetMain.FieldCount - 1 do
      begin
        strFieldName := datasetMain.Fields[i].DisplayName;
        if Pos('(p)', strFieldName) > 0 then
        begin
//          fieldStr := fieldStr + strFieldName + ', ';
//          valueStr := valueStr + '?, ';
          imgfile := TFileStream.Create(datasetMain.FieldByName(strFieldName).AsString, fmOpenRead);
          strFieldName := LeftStr(strFieldName, Length(strFieldName) - 3);
          updateSqlStr := Format('UPDATE ' + cbbTables.Text + ' set ' + strFieldName +
                          ' = ? WHERE ' + datasetMain.Fields[0].DisplayName + ' = %s', [
                          QuotedStr(datasetMain.Fields[0].AsString)]);
//          ShowMessage(updateSqlStr);
          hasBlob := True;
        end
        else
        begin
          if i = datasetMain.FieldCount - 1 then
          begin
            fieldStr := fieldStr + strFieldName;
            valueStr := valueStr + Format('%s', [QuotedStr(datasetMain.FieldByName(strFieldName).AsString)]);
          end
          else
          begin
            fieldStr := fieldStr + strFieldName + ', ';
            valueStr := valueStr + Format('%s, ', [QuotedStr(datasetMain.FieldByName(strFieldName).AsString)]);
          end;
        end;
      end;

      while RightStr(fieldStr,2) = ', ' do
      begin
        j := Length(fieldStr) - 2;
        fieldStr := LeftStr(fieldStr, j);
      end;  

      while RightStr(valueStr,2) = ', ' do
      begin
        j := Length(valueStr) - 2;
        valueStr := LeftStr(valueStr, j);
      end;

      modelSqlStr := 'INSERT INTO ' + cbbTables.Text + '(' + fieldStr + ') VALUES(' + valueStr + ')';
//      ShowMessage(modelSqlStr);

      DBSqlite3.ExecSQL(modelSqlStr);
      if hasBlob then
        DBSqlite3.UpdateBlob(updateSqlStr, imgfile);
      imgfile.Free;
      fieldStr := '';
      valueStr := '';
      datasetMain.Next;
    end;

    DBSqlite3.Commit;
    ShowMessage('Insert Success!');
  except
    on e: Exception do
    begin
      DBSqlite3.Rollback;
      ShowMessage(e.Message);
    end;
  end;
  
end;

procedure TfmMain.gridMainTitleClick(Column: TColumn);
begin
  boolFirstTime := False;
end;

end.
