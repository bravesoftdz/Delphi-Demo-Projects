unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Grids, DBGrids, IniFiles;

type
  TForm1 = class(TForm)
    qry1: TADOQuery;
    btn_1: TButton;
    memo2: TMemo;
    qry2: TADOQuery;
    DataSource1: TDataSource;
    dbgrd1: TDBGrid;
    Clear_btn: TButton;
    Copy_Btn: TButton;
    procedure btn_1Click(Sender: TObject);
    procedure dbgrd1DblClick(Sender: TObject);
    procedure Clear_btnClick(Sender: TObject);
    procedure Copy_BtnClick(Sender: TObject);
  private
    tablename,out_key: string;
    taborder:Integer;
    codefolder,classfolder,applogic,applogicimpl,sdo,sdoimpl,inaction,inactionimpl:string;
    function uppfirst(str: string): string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function TForm1.uppfirst(str: string): string;
var
  first: string;
begin

  first := Copy(str,1,1);

  first := UpperCase(first);

  Result := first + Copy(str,2,Length(str)-1);

end;

procedure TForm1.btn_1Click(Sender: TObject);
begin
  memo2.Lines.Clear;
  qry2.Close;
  qry2.SQL.Clear;
  qry2.SQL.Add('select view_name from user_views union select table_name from user_tab_comments');
  qry2.Open;
end;

procedure TForm1.dbgrd1DblClick(Sender: TObject);
var
  code,Pkey,datatype,temp:string;
  selstr:string;
begin

  tablename:= dbgrd1.Fields[0].AsString;

  qry1.Close;
  qry1.SQL.Clear;
  qry1.SQL.Add('select a.column_name,b.comments,a.nullable,a.data_type,a.data_length,'
                     +'(select au.constraint_type '
                      +'from user_cons_columns cu, user_constraints au '
                      +'where au.constraint_type = '+'''P'''
                            +' and cu.constraint_name = au.constraint_name'
                            +' and cu.table_name=a.table_name'
                            +' and cu.column_name=a.column_name'
                            +') as Pkey '
              +'from user_tab_columns a,user_col_comments b '
              +'where a.table_name=b.table_name'
                    +' and a.column_name=b.column_name'
                    +' and a.table_name = ''' + tablename + ''''
              +' order by column_id');
  qry1.Open;

  with qry1 do
  begin
    First;
    while not Eof do
    begin
      selstr:=selstr+Trim(FieldByName('column_name').AsString);
      next;
      if not Eof then
      begin
        selstr:=selstr+',';
      end;  
    end;
  end;
  selstr:=selstr+' from '+tablename+'"';
  memo2.Lines.Add('	<Command name="'+tablename+'" ');
  memo2.Lines.Add('		SQL="select '+selstr);
  memo2.Lines.Add('  		kind="Select">');

  with qry1 do
  begin
    First;
    while not Eof do
    begin

      code:=Trim(FieldByName('column_name').AsString);
      temp:= Trim(FieldByName('data_type').AsString);
      if temp='NUMBER' then
        datatype:= 'commonj.sdo.Decimal';
      if temp='VARCHAR2' then
        datatype:= 'commonj.sdo.String';
      if temp='DATE' then
        datatype:= 'commonj.sdo.Date';


      memo2.Lines.Add('		<ResultDescriptor columnName="'+code+'" tableName="'+tablename+'"');
      memo2.Lines.Add('			columnType="'+datatype+'" />');

      next;
    end;
  end;

  memo2.Lines.Add('	</Command>');
  memo2.Lines.Add('	<Table tableName="'+tablename+'" typeName="'+tablename+'">');

  with qry1 do
  begin
    First;
    while not Eof do
    begin
      code:=Trim(FieldByName('column_name').AsString);
      Pkey:='';
      if Trim(FieldByName('Pkey').AsString)='P' then
      begin
        Pkey:=' primaryKey="true"';
      end;

      memo2.Lines.Add('		<Column columnName="'+code+'"'+pkey+' propertyName="'+tablename+'_'+code+'"/>');

      next;
    end;
  end;

  memo2.Lines.Add('	</Table>');

end;

procedure TForm1.Clear_btnClick(Sender: TObject);
begin
  memo2.Clear;
end;

procedure TForm1.Copy_BtnClick(Sender: TObject);
begin
  memo2.SelectAll;
  memo2.CopyToClipboard;
end;

end.
