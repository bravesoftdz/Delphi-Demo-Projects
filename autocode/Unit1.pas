unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Grids, DBGrids, IniFiles;

type
  TForm1 = class(TForm)
    qry1: TADOQuery;
    cbb1: TComboBox;
    btn_1: TButton;
    memo2: TMemo;
    class_name: TEdit;
    btn_Copy: TButton;
    AutoXML: TButton;
    label2: TLabel;
    btn_Clear: TButton;
    qry2: TADOQuery;
    DataSource1: TDataSource;
    dbgrd1: TDBGrid;
    package_Name: TEdit;
    Label1: TLabel;
    AutoClass: TGroupBox;
    AutoInaction: TButton;
    AutoInactionImpl: TButton;
    AutoApplogic: TButton;
    AutoApplogicImpl: TButton;
    AutoSdo: TButton;
    AutoSdoImpl: TButton;
    AutoJsp: TGroupBox;
    Header: TButton;
    AutoForm: TButton;
    AutoGrid: TButton;
    AutoBtn: TButton;
    SelectList: TListBox;
    AutoJs: TGroupBox;
    AutoJsHeader: TButton;
    AutoQuery: TButton;
    AutoQueryForm: TButton;
    cbb2: TComboBox;
    AutoAdd: TButton;
    AutoDel: TButton;
    AutoOutKey: TButton;
    AutoSave: TButton;
    procedure btn_1Click(Sender: TObject);
    procedure cbb1Change(Sender: TObject);
    procedure AutoFormClick(Sender: TObject);
    procedure AutoGridClick(Sender: TObject);
    procedure HeaderClick(Sender: TObject);
    procedure AutoBtnClick(Sender: TObject);
    procedure btn_CopyClick(Sender: TObject);
    procedure AutoXMLClick(Sender: TObject);
    procedure btn_ClearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure package_NameChange(Sender: TObject);
    procedure AutoInactionClick(Sender: TObject);
    procedure AutoInactionImplClick(Sender: TObject);
    procedure AutoApplogicClick(Sender: TObject);
    procedure AutoApplogicImplClick(Sender: TObject);
    procedure AutoSdoClick(Sender: TObject);
    procedure AutoSdoImplClick(Sender: TObject);
    procedure AutoJsHeaderClick(Sender: TObject);
    procedure AutoQueryClick(Sender: TObject);
    procedure dbgrd1DblClick(Sender: TObject);
    procedure SelectListDblClick(Sender: TObject);
    procedure AutoQueryFormClick(Sender: TObject);
    procedure cbb2Change(Sender: TObject);
    procedure AutoAddClick(Sender: TObject);
    procedure AutoDelClick(Sender: TObject);
    procedure AutoOutKeyClick(Sender: TObject);
    procedure AutoSaveClick(Sender: TObject);

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
  qry1.Close;
  qry1.SQL.Clear;
  qry1.SQL.Add('select comments from user_tab_comments where table_name not like ''BIN$%'' and comments is not null');
  qry1.Open;

  cbb1.Items.Clear;

  with qry1 do
  begin
    while not Eof do
    begin
      cbb1.Items.Add(FieldByName('comments').Text);
      cbb2.Items.Add(FieldByName('comments').Text);
      next;
    end;
  end;

end;

procedure TForm1.cbb1Change(Sender: TObject);
begin

  qry1.Close;
  qry1.SQL.Clear;
  qry1.SQL.Add('select table_name from user_tab_comments where table_name not like ''BIN$%'''+' and comments ='''+cbb1.Text+'''');
  qry1.Open;

  tablename:=qry1.FieldByName('table_name').Text;

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
                    +' and a.table_name = '''+tablename+''''
              +' order by column_id');

  qry1.Open;
  taborder:=1;

end;

procedure TForm1.AutoFormClick(Sender: TObject);
var
  i:Integer;
  code,name1,nul,temp,datatype,hide:string;
  leng:Integer;
begin

  i:=1;
  memo2.Lines.Add('       <tr style="">');
  memo2.Lines.Add('            <td>');

  memo2.Lines.Add('                <div dojoType="unieap.layout.TitlePane"');
  memo2.Lines.Add('                    title="'+cbb1.Text+'" style=" width: 100%;height: 240;">');

  memo2.Lines.Add('                    <form id="'+tablename+'form"');
  memo2.Lines.Add('                        dojoType="unieap.form.Form">');
  memo2.Lines.Add('                        <table');
  memo2.Lines.Add('                            style="position: relative; TABLE-LAYOUT: fixed; width: 100%; "');
  memo2.Lines.Add('                            cellspacing="0" class="TitlePanepadding">');
  memo2.Lines.Add('                            <colgroup>');
  memo2.Lines.Add('                                <col style="width: 10%"></col>');
  memo2.Lines.Add('                                <col style="width: 15%"></col>');
  memo2.Lines.Add('                                <col style="width: 10%"></col>');
  memo2.Lines.Add('                                <col style="width: 15%"></col>');
  memo2.Lines.Add('                                <col style="width: 10%"></col>');
  memo2.Lines.Add('                                <col style="width: 15%"></col>');
  memo2.Lines.Add('                                <col style="width: 10%"></col>');
  memo2.Lines.Add('                                <col style="width: 15%"></col>');
  memo2.Lines.Add('                            </colgroup>');
  memo2.Lines.Add('                            <tr style="">');
  with qry1 do
  begin
    First;
    while not Eof do
    begin

      code:=Trim(FieldByName('column_name').AsString);
      name1:=Trim(FieldByName('comments').AsString);
      nul:='';
      Leng:=FieldByName('data_length').AsInteger;

      if Trim(FieldByName('nullable').AsString)='N' then
      begin
        nul:='required="true" ';
      end;

      code:=Trim(qry1.FieldByName('column_name').AsString);

      if (code='BRA001') or (code='BRA002') or (code='PRSENO') then
        hide:='; display: none'
      else
        hide:='';

      qry2.Close;
      qry2.SQL.Clear;
      qry2.SQL.Add('select count(*) from AA10 where AAA100='''+code+'''');
      qry2.Open;

      if (qry2.FieldByName('count(*)').AsInteger>0) or (copy(code,1,6)='BRD020') then
      begin
        datatype:= 'unieap.form.ComboBox" store=""';
      end else
      begin
        temp:= Trim(FieldByName('data_type').AsString);
        if temp='NUMBER' then
          datatype:= 'unieap.form.ValidationTextBox"';
        if temp='VARCHAR2' then
          datatype:= 'unieap.form.ValidationTextBox"';
        if temp='DATE' then
          datatype:= 'unieap.form.DateTextBox"';
      end;



      memo2.Lines.Add('                                <td>');
      memo2.Lines.Add('                                    <label');
      memo2.Lines.Add('                                        style="height: 22px; width: 98%' + hide + '" for="'+tablename+'_'+code+'">');
      memo2.Lines.Add('                                        '+name1);
      memo2.Lines.Add('                                    </label>');
      memo2.Lines.Add('                                </td>');
      memo2.Lines.Add('                                <td>');
      memo2.Lines.Add('                                    <input');
      memo2.Lines.Add('                                        dojoType="'+datatype);
      memo2.Lines.Add('                                        style="height: 22px; width: 95%' + hide + '" id="'+code+'"');
      memo2.Lines.Add('                                        '+nul+'name="'+tablename+'_'+code+'" binding="'+code+'"');
      memo2.Lines.Add('                                        tabindex="'+inttostr(taborder)+'" maxlength="'+inttostr(leng)+'">');
      memo2.Lines.Add('                                    </input>');
      memo2.Lines.Add('                                </td>');

      if i mod 4 = 0 then
      begin
        memo2.Lines.Add('                            </tr>');
        memo2.Lines.Add('                            <tr style="">');
      end;

      i:=1+i;
      taborder:=taborder+1;
      next;
    end;
  end;
  if (i mod 4 )<> 1 then
  begin
    memo2.Lines.Add('                            </tr>');
  end;
  memo2.Lines.Add('                        </table>');
  memo2.Lines.Add('                    </form>');
  memo2.Lines.Add('                </div>');
  memo2.Lines.Add('            </td>');
  memo2.Lines.Add('        </tr>');

end;

procedure TForm1.AutoGridClick(Sender: TObject);
var
  code,name1,nul,datatype:string;
begin

  memo2.Lines.Add('<tr style="">');
  memo2.Lines.Add('    <td>');
  memo2.Lines.Add('        <div dojoType="unieap.layout.TitlePane"');
  memo2.Lines.Add('            title="'+cbb1.Text+'" style=" width: 100%;height:250px">');
  memo2.Lines.Add('            <div dojoType="unieap.widget.Grid"');
  memo2.Lines.Add('                style="height: 100%; position: relative; width: 100%;"');
  memo2.Lines.Add('                type="ONESELECT" id="'+tablename+'grid">');
  memo2.Lines.Add('                <header>');
  with qry1 do
  begin
    First;
    while not Eof do
    begin

      code:=Trim(FieldByName('column_name').AsString);
      name1:=Trim(FieldByName('comments').AsString);
      nul:='';
      datatype:='';

      if Trim(FieldByName('data_type').AsString)='DATE' then
      begin
        datatype:=' formatter="dateformat(yyyy-MM-dd)"';
      end;  

      if (code<>'BRA001') and (code<>'BRA002') and (code<>'PRSENO') then
      begin

        memo2.Lines.Add('                    <column name="'+name1+'"'+datatype);
        memo2.Lines.Add('                        binding="'+code+'" width="15">');
        memo2.Lines.Add('                    </column>');

      end;

      next;
    end;
  end;

  memo2.Lines.Add('                </header>');
  memo2.Lines.Add('            </div>');
  memo2.Lines.Add('        </div>');
  memo2.Lines.Add('    </td>');
  memo2.Lines.Add('</tr>');
end;

procedure TForm1.HeaderClick(Sender: TObject);
begin
  memo2.Lines.Add('<%@ page language="java" pageEncoding="UTF-8"%>');
  memo2.Lines.Add('<%@ page contentType="text/html;charset=UTF-8"%>');
  memo2.Lines.Add('<html>');
  memo2.Lines.Add('    <head>');

  memo2.Lines.Add('        <title>'+cbb1.Text+'</title>');

  memo2.Lines.Add('        <%@ include file="config.jsp"%>');
  memo2.Lines.Add('        <script type="text/javascript" src="SCADomain/scaDomain.js"></script>');
  memo2.Lines.Add('        <script type="text/javascript" src="napple/systool/Si_charUtil.js" charset="utf-8"></script>');
  memo2.Lines.Add('        <script type="text/javascript" src="' + class_name.Text + '.js"></script>');
  memo2.Lines.Add('        <script type="text/javascript" src="Timer.js"></script>');

  memo2.Lines.Add('    </head>');
  memo2.Lines.Add('    <body class="unieap">');

  memo2.Lines.Add('        <table');
  memo2.Lines.Add('            style="position: relative; width: 100%; TABLE-LAYOUT: fixed"');
  memo2.Lines.Add('            cellspacing="0">');
  memo2.Lines.Add('            <colgroup>');
  memo2.Lines.Add('            <col style=""></col>');
  memo2.Lines.Add('            </colgroup>');

  taborder := 1;

end;

procedure TForm1.AutoBtnClick(Sender: TObject);
begin

  memo2.Lines.Add('<tr style="">');
  memo2.Lines.Add('    <td>');
  memo2.Lines.Add('');
  memo2.Lines.Add('        <table');
  memo2.Lines.Add('            style="height: 40px; width: 100%; TABLE-LAYOUT: fixed"');
  memo2.Lines.Add('            cellspacing="0">');
  memo2.Lines.Add('            <colgroup>');
  memo2.Lines.Add('                <col style="width: 12%"></col>');
  memo2.Lines.Add('                <col style="width: 12%"></col>');
  memo2.Lines.Add('                <col style="width: 12%"></col>');
  memo2.Lines.Add('                <col style="width: 12%"></col>');
  memo2.Lines.Add('                <col style="width: 12%"></col>');
  memo2.Lines.Add('                <col style="width: 12%"></col>');
  memo2.Lines.Add('                <col style="width: 12%"></col>');
  memo2.Lines.Add('                <col style="width: 12%"></col>');
  memo2.Lines.Add('            </colgroup>');
  memo2.Lines.Add('            <tr style="" align="right">');
  memo2.Lines.Add('');
  memo2.Lines.Add('                <td></td>');
  memo2.Lines.Add('                <td></td>');
  memo2.Lines.Add('                <td></td>');
  memo2.Lines.Add('                <td >');
  memo2.Lines.Add('                    <input id="reset" class="dijitButtonNode_add"');
  memo2.Lines.Add('                        dojoType="unieap.form.Button" accesskey="r"');
  memo2.Lines.Add('                        style="height: 22px; width: 98%" label="清屏(R)">');
  memo2.Lines.Add('                    </input>');
  memo2.Lines.Add('                </td>');
  memo2.Lines.Add('                <td >');
  memo2.Lines.Add('                    <input id="query" class="dijitButtonNode_add"');
  memo2.Lines.Add('                        dojoType="unieap.form.Button" accesskey="q"');
  memo2.Lines.Add('                        style="height: 22px; width: 98%" label="查询(Q)">');
  memo2.Lines.Add('                    </input>');
  memo2.Lines.Add('                </td>');
  memo2.Lines.Add('                <td >');
  memo2.Lines.Add('                    <input id="add" class="dijitButtonNode_add"');
  memo2.Lines.Add('                        dojoType="unieap.form.Button" accesskey="a"');
  memo2.Lines.Add('                        style="height: 22px; width: 98%" label="新增(A)">');
  memo2.Lines.Add('                    </input>');
  memo2.Lines.Add('                </td>');
  memo2.Lines.Add('                <td >');
  memo2.Lines.Add('                    <input id="del" class="dijitButtonNode_add"');
  memo2.Lines.Add('                        dojoType="unieap.form.Button" accesskey="d"');
  memo2.Lines.Add('                        style="height: 22px; width: 98%" label="删除(D)">');
  memo2.Lines.Add('                    </input>');
  memo2.Lines.Add('                </td>');
  memo2.Lines.Add('                <td >');
  memo2.Lines.Add('                    <input id="save" class="dijitButtonNode_add"');
  memo2.Lines.Add('                        dojoType="unieap.form.Button" accesskey="s"');
  memo2.Lines.Add('                        style="height: 22px; width: 98%" label="保存(S)">');
  memo2.Lines.Add('                    </input>');
  memo2.Lines.Add('                </td>');
  memo2.Lines.Add('');
  memo2.Lines.Add('            </tr>');
  memo2.Lines.Add('        </table>');
  memo2.Lines.Add('    </td>');
  memo2.Lines.Add('</tr>');
  memo2.Lines.Add('');
  memo2.Lines.Add('</table>');
  memo2.Lines.Add('	<div style="width:300" dojoType="dijit.Dialog" id="dialog0" title="信息正在提交，请稍后...">');
  memo2.Lines.Add('		 <br>');
  memo2.Lines.Add('   			<div style="width:100%"  indeterminate="true" id="Bar" dojoType="dijit.ProgressBar"></div>');
  memo2.Lines.Add('         <br>');
  memo2.Lines.Add('    </div>');
  memo2.Lines.Add('');
  memo2.Lines.Add('</body>');
  memo2.Lines.Add('</html>');

end;

procedure TForm1.btn_CopyClick(Sender: TObject);
begin
  memo2.SelectAll;
  memo2.CopyToClipboard;
end;

procedure TForm1.AutoXMLClick(Sender: TObject);
var
  code,Pkey,datatype,temp:string;
  selstr:string;
begin

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

procedure TForm1.btn_ClearClick(Sender: TObject);
begin
  memo2.Lines.Clear;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  ini:TIniFile;
begin

  ini := TIniFile.Create(ExtractFilePath(ParamStr(0))+'Preference.ini');

  package_Name.Text := ini.ReadString('Preference ','PackageName','');

//  ini.WriteInteger('记录段 ','记录项 ',112);

    codefolder := ExtractFilePath(ParamStr(0)) + 'CodeFolder\';
    classfolder := codefolder + package_Name.Text + '\';
    applogic := classfolder + 'atom\applogic\';
    applogicimpl := applogic + 'impl\';
    sdo := classfolder + 'atom\sdo\';
    sdoimpl := sdo + 'impl\';
    inaction := classfolder + 'inaction\';
    inaction := inaction + 'infomanagement\';
    inactionimpl := inaction + 'impl\';

    if DirectoryExists(codefolder)=False then
    begin

      CreateDirectory(PChar(codefolder),nil);

    end;

    if DirectoryExists(classfolder)=False then
    begin

      CreateDirectory(PChar(classfolder),nil);

    end;

    if DirectoryExists(classfolder + 'atom\')=False then
    begin

      CreateDirectory(PChar(classfolder + 'atom\'),nil);

    end;

    if DirectoryExists(applogic)=False then
    begin

      CreateDirectory(PChar(applogic),nil);

    end;

    if DirectoryExists(applogicimpl)=False then
    begin

      CreateDirectory(PChar(applogicimpl),nil);

    end;

    if DirectoryExists(sdo)=False then
    begin

      CreateDirectory(PChar(sdo),nil);

    end;

    if DirectoryExists(sdoimpl)=False then
    begin

      CreateDirectory(PChar(sdoimpl),nil);

    end;

    if DirectoryExists(classfolder + 'inaction\')=False then
    begin

      CreateDirectory(PChar(classfolder + 'inaction\'),nil);

    end;

    if DirectoryExists(inaction)=False then
    begin

      CreateDirectory(PChar(inaction),nil);

    end;

    if DirectoryExists(inactionimpl)=False then
    begin

      CreateDirectory(PChar(inactionimpl),nil);

    end;

end;

procedure TForm1.package_NameChange(Sender: TObject);
var
  ini:TIniFile;
begin

  ini := TIniFile.Create(ExtractFilePath(ParamStr(0))+'Preference.ini');

//  package_Name.Text := ini.ReadString('Preference ', 'PackageName', 'sanitation');

  ini.WriteString('Preference','PackageName',package_Name.Text);

end;

procedure TForm1.AutoInactionClick(Sender: TObject);
begin

  DeleteFile(inaction + uppfirst(class_name.Text) + 'Inaction.java');

  memo2.Lines.Clear;
  
  memo2.Lines.Add('package app.simis.' + package_Name.Text + '.inaction.infomanagement;');
  memo2.Lines.Add('import sys.entrance.helper.ClientCommand;');
  memo2.Lines.Add('import sys.entrance.helper.DataStores;');
  memo2.Lines.Add('public interface ' + uppfirst(class_name.Text) + 'Inaction {');
  memo2.Lines.Add('	ClientCommand save' + uppfirst(class_name.Text) + '(ClientCommand clientCommand, DataStores datastores)  throws Exception;');
  memo2.Lines.Add('	ClientCommand query' + uppfirst(class_name.Text) + '(ClientCommand clientCommand, DataStores datastores)  throws Exception;');

  if cbb2.Text <> '' then
    memo2.Lines.Add('	ClientCommand query' + out_key + uppfirst(class_name.Text) + '(ClientCommand clientCommand, DataStores datastores)  throws Exception;');

  memo2.Lines.Add('}');

  memo2.Lines.SaveToFile(inaction + uppfirst(class_name.Text) + 'Inaction.java');

end;

procedure TForm1.AutoInactionImplClick(Sender: TObject);
begin

  DeleteFile(inactionimpl + uppfirst(class_name.Text) + 'InactionImpl.java');

  memo2.Lines.Clear;

  memo2.Lines.Add('package app.simis.' + package_Name.Text + '.inaction.infomanagement.impl;');
  memo2.Lines.Add('import org.osoa.sca.annotations.Reference;');
  memo2.Lines.Add('import app.simis.' + package_Name.Text + '.atom.applogic.impl.' + uppfirst(class_name.Text) + 'ApplogicImpl;');
  memo2.Lines.Add('import app.simis.' + package_Name.Text + '.inaction.infomanagement.' + uppfirst(class_name.Text) + 'Inaction;');
  memo2.Lines.Add('import sys.entrance.helper.ClientCommand;');
  memo2.Lines.Add('import sys.entrance.helper.DataStores;');
  memo2.Lines.Add('public class ' + uppfirst(class_name.Text) + 'InactionImpl implements ' + uppfirst(class_name.Text) + 'Inaction {');
  memo2.Lines.Add('	@Reference');
  memo2.Lines.Add('	protected ' + uppfirst(class_name.Text) + 'ApplogicImpl ' + uppfirst(class_name.Text) + 'ApplogicImpl =');
  memo2.Lines.Add('		new ' + uppfirst(class_name.Text) + 'ApplogicImpl();');

  memo2.Lines.Add('	public ClientCommand save' + uppfirst(class_name.Text) + '(ClientCommand clientCommand,');
  memo2.Lines.Add('			DataStores datastores) throws Exception {');
  memo2.Lines.Add('		clientCommand = ' + uppfirst(class_name.Text) + 'ApplogicImpl.save' + uppfirst(class_name.Text) + '(clientCommand,datastores);');
  memo2.Lines.Add('		return clientCommand;');
  memo2.Lines.Add('	}');


  memo2.Lines.Add('	public ClientCommand query' + uppfirst(class_name.Text) + '(ClientCommand clientCommand,');
  memo2.Lines.Add('			DataStores datastores) throws Exception {');
  memo2.Lines.Add('		String selectCondition = (String) clientCommand.getLsParam();');
  memo2.Lines.Add('		datastores = ' + uppfirst(class_name.Text) + 'ApplogicImpl.query' + uppfirst(class_name.Text) + '(selectCondition);');
  memo2.Lines.Add('	      if (datastores != null) {');
  memo2.Lines.Add('	            clientCommand = clientCommand.transDs2List(datastores);');
  memo2.Lines.Add('	            clientCommand.setSuccessFlag("1");');
  memo2.Lines.Add('	        }');
  memo2.Lines.Add('	        else {');
  memo2.Lines.Add('	            clientCommand.setSuccessFlag("0");');
  memo2.Lines.Add('	        }');
  memo2.Lines.Add('		return clientCommand;');
  memo2.Lines.Add('	}');

  if cbb2.Text <> '' then
  begin
    memo2.Lines.Add('	public ClientCommand query' + out_key + uppfirst(class_name.Text) + '(ClientCommand clientCommand,');
    memo2.Lines.Add('			DataStores datastores) throws Exception {');
    memo2.Lines.Add('		String selectCondition = (String) clientCommand.getLsParam();');
    memo2.Lines.Add('		datastores = ' + uppfirst(class_name.Text) + 'ApplogicImpl.query' + out_key + uppfirst(class_name.Text) + '(selectCondition);');
    memo2.Lines.Add('	      if (datastores != null) {');
    memo2.Lines.Add('	            clientCommand = clientCommand.transDs2List(datastores);');
    memo2.Lines.Add('	            clientCommand.setSuccessFlag("1");');
    memo2.Lines.Add('	        }');
    memo2.Lines.Add('	        else {');
    memo2.Lines.Add('	            clientCommand.setSuccessFlag("0");');
    memo2.Lines.Add('	        }');
    memo2.Lines.Add('		return clientCommand;');
    memo2.Lines.Add('	}');
  end;  

  memo2.Lines.Add('}');
  
  memo2.Lines.SaveToFile(inactionimpl + uppfirst(class_name.Text) + 'InactionImpl.java');

end;

procedure TForm1.AutoApplogicClick(Sender: TObject);
begin

  DeleteFile(applogic + uppfirst(class_name.Text) + 'Applogic.java');

  memo2.Lines.Clear;

  memo2.Lines.Add('package app.simis.' + package_Name.Text + '.atom.applogic;');
  memo2.Lines.Add('import sys.entrance.helper.ClientCommand;');
  memo2.Lines.Add('import sys.entrance.helper.DataStores;');
  memo2.Lines.Add('public interface ' + uppfirst(class_name.Text) + 'Applogic {');
  memo2.Lines.Add('	DataStores query' + uppfirst(class_name.Text) + '(String selectCondition) throws Exception;');
  memo2.Lines.Add('	ClientCommand save' + uppfirst(class_name.Text) + '(ClientCommand clientCommand, DataStores datastore) throws Exception;');

  if cbb2.Text <> '' then
    memo2.Lines.Add('	DataStores query' + out_key + uppfirst(class_name.Text) + '(String selectCondition) throws Exception;');

  memo2.Lines.Add('}');

  memo2.Lines.SaveToFile(applogic + uppfirst(class_name.Text) + 'Applogic.java');

end;

procedure TForm1.AutoApplogicImplClick(Sender: TObject);
begin

  DeleteFile(applogicimpl + uppfirst(class_name.Text) + 'ApplogicImpl.java');

  memo2.Lines.Clear;

  memo2.Lines.Add('package app.simis.' + package_Name.Text + '.atom.applogic.impl;');
  memo2.Lines.Add('import org.osoa.sca.annotations.Reference;');
  memo2.Lines.Add('import sys.entrance.helper.ClientCommand;');
  memo2.Lines.Add('import sys.entrance.helper.DataStores;');
  memo2.Lines.Add('import app.simis.' + package_Name.Text + '.atom.applogic.' + uppfirst(class_name.Text) + 'Applogic;');
  memo2.Lines.Add('import app.simis.' + package_Name.Text + '.atom.sdo.impl.' + tablename + 'SDOImpl;');
  memo2.Lines.Add('public class ' + uppfirst(class_name.Text) + 'ApplogicImpl implements ' + uppfirst(class_name.Text) + 'Applogic {');
  memo2.Lines.Add('	@Reference');
  memo2.Lines.Add('	protected ' + tablename + 'SDOImpl ' + tablename + 'SDOImpl = new ' + tablename + 'SDOImpl();');

  memo2.Lines.Add('	public ClientCommand save' + uppfirst(class_name.Text) + '(ClientCommand clientCommand, DataStores datastore)');
  memo2.Lines.Add('			throws Exception {');
  memo2.Lines.Add('		return ' + tablename + 'SDOImpl.save' + uppfirst(class_name.Text) + '(clientCommand,datastore);');
  memo2.Lines.Add('	}');

  memo2.Lines.Add('	public DataStores query' + uppfirst(class_name.Text) + '(String selectCondition)');
  memo2.Lines.Add('			throws Exception {');
  memo2.Lines.Add('		DataStores dataStores = ' + tablename + 'SDOImpl.query' + uppfirst(class_name.Text) + '(selectCondition);');
  memo2.Lines.Add('		return dataStores;');
  memo2.Lines.Add('	}');

  if cbb2.Text <> '' then
  begin
    memo2.Lines.Add('	public DataStores query' + out_key + uppfirst(class_name.Text) + '(String selectCondition)');
    memo2.Lines.Add('			throws Exception {');
    memo2.Lines.Add('		DataStores dataStores = ' + tablename + 'SDOImpl.query' + out_key + uppfirst(class_name.Text) + '(selectCondition);');
    memo2.Lines.Add('		return dataStores;');
    memo2.Lines.Add('	}');
  end;  

  memo2.Lines.Add('}');

  memo2.Lines.SaveToFile(applogicimpl + uppfirst(class_name.Text) + 'ApplogicImpl.java');

end;

procedure TForm1.AutoSdoClick(Sender: TObject);
begin

  DeleteFile(sdo + tablename + 'SDO.java');

  memo2.Clear;

  memo2.Lines.Add('package app.simis.' + package_Name.Text + '.atom.sdo;');
  memo2.Lines.Add('import sys.entrance.helper.ClientCommand;');
  memo2.Lines.Add('import sys.entrance.helper.DataStores;');
  memo2.Lines.Add('public interface ' + tablename + 'SDO {');
  memo2.Lines.Add('	DataStores query' + uppfirst(class_name.Text) + '(String selectCondition) throws Exception;');
  memo2.Lines.Add('	ClientCommand save' + uppfirst(class_name.Text) + '(ClientCommand clientCommand, DataStores datastore) throws Exception;');

  if cbb2.Text <> '' then
    memo2.Lines.Add('	DataStores query' + out_key + uppfirst(class_name.Text) + '(String selectCondition) throws Exception;');

  memo2.Lines.Add('}');

  memo2.Lines.SaveToFile(sdo + tablename + 'SDO.java');

end;

procedure TForm1.AutoSdoImplClick(Sender: TObject);
var
  code:string;
begin

  DeleteFile(sdoimpl + tablename + 'SDOImpl.java');

  memo2.Lines.Clear;

  memo2.Lines.Add('package app.simis.' + package_Name.Text + '.atom.sdo.impl;');
  memo2.Lines.Add('import java.util.Date;');
  memo2.Lines.Add('import sys.core.sdo.commonclass.CommitResult;');
  memo2.Lines.Add('import sys.core.sdo.commonclass.DataObjectInterfaceImpl;');
  memo2.Lines.Add('import sys.core.sdo.commonclass.DateTool;');
  memo2.Lines.Add('import sys.core.sdo.commonclass.Jdbc4Sdo;');
  memo2.Lines.Add('import sys.core.sdo.implementclass.SysSDO;');
  memo2.Lines.Add('import sys.entrance.helper.ClientCommand;');
  memo2.Lines.Add('import sys.entrance.helper.DataStores;');
  memo2.Lines.Add('import app.simis.' + package_Name.Text + '.atom.sdo.' + tablename + 'SDO;');

  memo2.Lines.Add('public class ' + tablename + 'SDOImpl implements ' + tablename + 'SDO {');

  memo2.Lines.Add('public String getDataSetName() {');
  memo2.Lines.Add('    return "' + tablename + '";');
  memo2.Lines.Add('}');

  memo2.Lines.Add('public DataStores query' + uppfirst(class_name.Text) + '(String selectCondition) throws Exception{');
  memo2.Lines.Add('    DataStores datastore = SysSDO.getStore3(getDataSetName(), selectCondition);');
  memo2.Lines.Add('    return datastore;');
  memo2.Lines.Add('}');

  if cbb2.Text <> '' then
  begin
    memo2.Lines.Add('	public DataStores query' + out_key + uppfirst(class_name.Text) + '(String selectCondition)');
    memo2.Lines.Add('			throws Exception {');
    memo2.Lines.Add('		DataStores datastore = SysSDO.getStore3("' + out_key + '", selectCondition);');
    memo2.Lines.Add('		return datastore;');
    memo2.Lines.Add('	}');
  end;  
 
  memo2.Lines.Add('public ClientCommand save' + uppfirst(class_name.Text) + '(ClientCommand clientCommand, DataStores datastore) throws Exception{');
  memo2.Lines.Add('    int rowCounts = datastore.getRowCount();');
  memo2.Lines.Add('    Date sysdateValue = (Date) Jdbc4Sdo.getInstance().executeQuery("select sysdate from dual").get(0)[0];');
  memo2.Lines.Add('	    String sysdateStr = DateTool.getInstance().dateToString(sysdateValue, "yyyy-MM-dd");');
  memo2.Lines.Add('	   for (int i = 0; i < rowCounts; i++){');
  memo2.Lines.Add('	        datastore.moveTo(i+1);');

  with qry1 do
  begin
    First;
    while not Eof do
    begin
      code:=Trim(FieldByName('column_name').AsString);

      if (Trim(FieldByName('data_type').AsString)='DATE') and (code <> 'BRA001') then
      begin
          memo2.Lines.Add('	        Object ' + code + ' = datastore.getRow().get("' + code + '");');
          memo2.Lines.Add('	        if (' + code + ' != null){');
          memo2.Lines.Add('	            String dateStr = DateTool.getInstance().dateToString(Long.valueOf(' + code + '.toString()));');
          memo2.Lines.Add('	            datastore.setMaps("' + code + '", dateStr, i);');
          memo2.Lines.Add('	            }');
      end;
      next;
    end;
  end;

  memo2.Lines.Add('    	}');
  memo2.Lines.Add('    	clientCommand = DataObjectInterfaceImpl.saveDataStore( clientCommand,  datastore);');
  memo2.Lines.Add('    	return clientCommand;');
  memo2.Lines.Add('    }');

  memo2.Lines.Add('}');

  memo2.Lines.SaveToFile(sdoimpl + tablename + 'SDOImpl.java');

end;

procedure TForm1.AutoJsHeaderClick(Sender: TObject);
var
  code,coname,covalue,tempstr:string;
begin
  memo2.Lines.Add('var ' + tablename + 'ds= new unieap.ds.DataStore();');
  memo2.Lines.Add('var ls_col="",ls_col2="";');
  memo2.Lines.Add('var columnCounts = new Array();');
  memo2.Lines.Add('var tempPrseno = "";');
  memo2.Lines.Add('dojo.addOnLoad(init);');
  memo2.Lines.Add('');
  memo2.Lines.Add('function init()');
  memo2.Lines.Add('{');

  if SelectList.Count>0 then
    memo2.Lines.Add('        unieap.byId("' + SelectList.Items[0] + '").setDisabled(true);');

  memo2.Lines.Add('    dojo.connect(unieap.byId("reset"),"onClick",reset);');
  memo2.Lines.Add('    dojo.connect(unieap.byId("query"),"onClick",query1);');
  memo2.Lines.Add('    dojo.connect(unieap.byId("add"),"onClick",add1);');
  memo2.Lines.Add('    dojo.connect(unieap.byId("save"),"onClick",save1);');
  memo2.Lines.Add('    dojo.connect(unieap.byId("del"),"onClick",del1);');

  memo2.Lines.Add('    dojo.connect(unieap.byId("' + SelectList.Items[1] + '"),"onChange",getWbPyCode);');

  memo2.Lines.Add('    dojo.connect(unieap.byId("' + tablename + 'grid"), "onSelected", this, afterSelected);');

  memo2.Lines.Add('    unieap.byId("' + tablename + 'grid").setDataStore(' + tablename + 'ds);');

  memo2.Lines.Add('    ls_col = unieap.byId("' + tablename + 'form").getColumnBinding();');
  memo2.Lines.Add('    columnCounts = ls_col.split(",");');

  memo2.Lines.Add('    ls_col2 = unieap.byId("' + tablename + 'form").getColumnBinding_ls();');
  memo2.Lines.Add('    var ' + tablename + 'rs = ' + tablename + 'ds.getRowSet();');

  qry1.First;
    while not qry1.Eof do
    begin
      code:=Trim(qry1.FieldByName('column_name').AsString);

      qry2.Close;
      qry2.SQL.Clear;
      qry2.SQL.Add('select count(*) from AA10 where AAA100='''+code+'''');
      qry2.Open;

      if (qry2.FieldByName('count(*)').AsInteger>0) or (copy(code,1,6)='BRD020') then
      begin
        memo2.Lines.Add('   var '+code+' = [');
        qry2.Close;
        qry2.SQL.Clear;
        if Copy(code,1,6)='BRD020' then
        begin
          qry2.SQL.Add('select AAA103,AAA102 FROM AA10 where AAA100 = ''BRD020''');
        end
        else begin
          qry2.SQL.Add('select AAA103,AAA102 FROM AA10 where AAA100 = '''+code+'''');
        end;
        qry2.Open;

        qry2.First;
        while not qry2.Eof do
        begin
          coname:=qry2.FieldByName('AAA103').AsString;
          covalue:=qry2.FieldByName('AAA102').AsString;
          tempstr:='				{CODENAME:"'+coname+'",CODEVALUE:"'+covalue+'"}';
          qry2.Next;
          if not qry2.Eof then
            tempstr:=tempstr+',';
            
          memo2.Lines.Add(tempstr);

        end;

        memo2.Lines.Add('				];');
        memo2.Lines.Add('');
        memo2.Lines.Add('		unieap.byId("'+code+'").setDataStore(new unieap.ds.DataStore("'+code+'",'+code+'));');
      end;

      qry1.next;
      
    end;
    
  memo2.Lines.Add('    //alert("InitSuccess!");');
  memo2.Lines.Add('}');
  memo2.Lines.Add('');

  memo2.Lines.Add('	function afterSelected(){');
  memo2.Lines.Add('	    unieap.byId("' + tablename + 'form").bindGrid(unieap.byId("' + tablename + 'grid"));');
  memo2.Lines.Add('	}');

  memo2.Lines.Add('	function reset() {');
  memo2.Lines.Add('		tempPrseno = "";');
  memo2.Lines.Add('		' + tablename + 'ds = new unieap.ds.DataStore();');
  memo2.Lines.Add('		unieap.byId("' + tablename + 'grid").setDataStore(' + tablename + 'ds);');
  memo2.Lines.Add('		unieap.byId("' + tablename + 'form").clearForm();');
  memo2.Lines.Add('		unieap.byId("' + tablename + 'Queryform").clearForm();');

  memo2.Lines.Add('       	unieap.byId("save").setDisabled(false);');
  memo2.Lines.Add('      	unieap.byId("add").setDisabled(false);');
  memo2.Lines.Add('       	unieap.byId("query").setDisabled(false);');

  memo2.Lines.Add('		unieap.byId("' + SelectList.Items[0] + '_q").focus();');

  memo2.Lines.Add('	}');

end;

procedure TForm1.AutoQueryClick(Sender: TObject);
var
  i: Integer;
  tempcode: string;
begin

  memo2.Lines.Add('function query1(){');
  memo2.Lines.Add('    var selectCondition = null;');
  memo2.Lines.Add('    var sel_list = new Array();');
  memo2.Lines.Add('    var name_list = new Array();');
  memo2.Lines.Add('    var ands = " and ";');

  for i:=0 to SelectList.Count-1 do
  begin
    tempcode := SelectList.Items[i] + '_q';

    memo2.Lines.Add('    if (unieap.byId("' + tempcode + '").getValue("' + tempcode + '") == null){');
    memo2.Lines.Add('        name_list[' + IntToStr(i) + '] = "nil";');
    memo2.Lines.Add('    }');
    memo2.Lines.Add('    else{');
    memo2.Lines.Add('        name_list[' + IntToStr(i) + '] = unieap.byId("' + tempcode + '").getValue("' + tempcode + '");');
    memo2.Lines.Add('        sel_list[' + IntToStr(i) + '] = "' + SelectList.Items[i] + ' = ''" + name_list[' + IntToStr(i) + '] + "''";');
    memo2.Lines.Add('    }');

  end;

  memo2.Lines.Add('    for (var inci=0;inci<' + IntToStr(SelectList.Count) + ';inci++)');
  memo2.Lines.Add('    {');
  memo2.Lines.Add('    	if (name_list[inci] != "nil")');
  memo2.Lines.Add('    	{');
  memo2.Lines.Add('    		if (selectCondition == null)');
  memo2.Lines.Add('    		{');
  memo2.Lines.Add('    			selectCondition = sel_list[inci];');
  memo2.Lines.Add('    		}');
  memo2.Lines.Add('    		else');
  memo2.Lines.Add('    		{');
  memo2.Lines.Add('    			selectCondition = selectCondition + ands + sel_list[inci];');
  memo2.Lines.Add('    		}');
  memo2.Lines.Add('    	}');
  memo2.Lines.Add('    }');

  memo2.Lines.Add('    if (selectCondition == null) {');
  memo2.Lines.Add('        messagebox("至少需要录入一个查询条件！",111);');
  memo2.Lines.Add('        return ;');
  memo2.Lines.Add('    }');
  memo2.Lines.Add('    else');
  memo2.Lines.Add('    {');
  memo2.Lines.Add('        //alert(selectCondition);   //输出拼接字串');
  memo2.Lines.Add('    }');
  memo2.Lines.Add('');
  memo2.Lines.Add('    var Http = new util.math.Calculator();');
  memo2.Lines.Add('    Http.setBZE401("query' + class_name.Text + '");');
  memo2.Lines.Add('    Http.setDsName("' + tablename + '");');
  memo2.Lines.Add('    Http.setlsParam(selectCondition);');
  memo2.Lines.Add('    Http.setCallBackFunction("queryCallBack");');
  memo2.Lines.Add('    Http.post();');
    memo2.Lines.Add('    dijit.byId(''dialog0'').show();');
  memo2.Lines.Add('}');
  memo2.Lines.Add('');
  memo2.Lines.Add('function queryCallBack(responseBeans)');
  memo2.Lines.Add('{');
  memo2.Lines.Add('    dijit.byId(''dialog0'').hide();');
  memo2.Lines.Add('    //unieap.debug(responseBeans,true);');
  memo2.Lines.Add('    var flag = responseBeans.successFlag;');
  memo2.Lines.Add('    if (flag == "1") {');
  memo2.Lines.Add('        var list = responseBeans.list;');
  memo2.Lines.Add('        var list_name = responseBeans.list_name;');
  memo2.Lines.Add('        ' + tablename + 'ds = new unieap.ds.DataStore();');
  memo2.Lines.Add('');
  memo2.Lines.Add('        for(var p=0 ;p<list.list.length / columnCounts.length; p++){');
  memo2.Lines.Add('            ' + tablename + 'ds.getRowSet().addRow();');
  memo2.Lines.Add('            for(var j=0;j < columnCounts.length; j++){');
  memo2.Lines.Add('                if(list.list[j + columnCounts.length * p]&&typeof(list.list[j + columnCounts.length * p])!="undefined"&&list.list[j + columnCounts.length * p]!="null"){');
  memo2.Lines.Add('                    ' + tablename + 'ds.getRowSet().getRow(p).setItemValue(list_name.list[j],list.list[j + columnCounts.length * p]) ;');
  memo2.Lines.Add('                    ' + tablename + 'ds.getRowSet().getRow(p).setItemValue("identifier", "3");');
  memo2.Lines.Add('                }');
  memo2.Lines.Add('            }');
  memo2.Lines.Add('        }');
  memo2.Lines.Add('        unieap.byId("' + tablename + 'form").bindData(' + tablename + 'ds.getRowSet().getRow(0));');
  memo2.Lines.Add('        unieap.byId("' + tablename + 'grid").setDataStore(' + tablename + 'ds);');
  memo2.Lines.Add('        unieap.byId("' + tablename + 'grid").rowSelect(0);');
  memo2.Lines.Add('    }');
  memo2.Lines.Add('    else {');
  memo2.Lines.Add('        messagebox("查询失败，无此记录",111);');
  memo2.Lines.Add('    }');
  memo2.Lines.Add('    //alert("QuerySuccess!");');
  memo2.Lines.Add('}');
end;

procedure TForm1.dbgrd1DblClick(Sender: TObject);
begin

  SelectList.Items.Add(dbgrd1.Fields[0].AsString);

end;

procedure TForm1.SelectListDblClick(Sender: TObject);
begin

  SelectList.DeleteSelected;

end;

procedure TForm1.AutoQueryFormClick(Sender: TObject);
var
  i,j:Integer;
  code,name1,nul,temp,datatype,hide:string;
  leng:Integer;
  query:Boolean;
begin

  i:=1;
  memo2.Lines.Add('       <tr style="">');
  memo2.Lines.Add('            <td>');

  memo2.Lines.Add('                <div dojoType="unieap.layout.TitlePane"');
  memo2.Lines.Add('                    title="'+cbb1.Text+'" style=" width: 100%;height: 60;">');

  memo2.Lines.Add('                    <form id="'+tablename+'Queryform"');
  memo2.Lines.Add('                        dojoType="unieap.form.Form">');
  memo2.Lines.Add('                        <table');
  memo2.Lines.Add('                            style="position: relative; TABLE-LAYOUT: fixed; width: 100%; "');
  memo2.Lines.Add('                            cellspacing="0" class="TitlePanepadding">');
  memo2.Lines.Add('                            <colgroup>');
  memo2.Lines.Add('                                <col style="width: 10%"></col>');
  memo2.Lines.Add('                                <col style="width: 15%"></col>');
  memo2.Lines.Add('                                <col style="width: 10%"></col>');
  memo2.Lines.Add('                                <col style="width: 15%"></col>');
  memo2.Lines.Add('                                <col style="width: 10%"></col>');
  memo2.Lines.Add('                                <col style="width: 15%"></col>');
  memo2.Lines.Add('                                <col style="width: 10%"></col>');
  memo2.Lines.Add('                                <col style="width: 15%"></col>');
  memo2.Lines.Add('                            </colgroup>');
  memo2.Lines.Add('                            <tr style="">');
  with qry1 do
  begin
    First;
    while not Eof do
    begin

      code:=Trim(FieldByName('column_name').AsString);
      name1:=Trim(FieldByName('comments').AsString);

      Leng:=FieldByName('data_length').AsInteger;

      qry2.Close;
      qry2.SQL.Clear;
      qry2.SQL.Add('select count(*) from AA10 where AAA100='''+code+'''');
      qry2.Open;

      if (qry2.FieldByName('count(*)').AsInteger>0) or (copy(code,1,6)='BRD020') then
      begin
        datatype:= 'unieap.form.ComboBox" store=""';
      end else
      begin
        temp:= Trim(FieldByName('data_type').AsString);
        if temp='NUMBER' then
          datatype:= 'unieap.form.ValidationTextBox"';
        if temp='VARCHAR2' then
          datatype:= 'unieap.form.ValidationTextBox"';
        if temp='DATE' then
          datatype:= 'unieap.form.DateTextBox"';
      end;

      query := False;

      for j:=0 to SelectList.Count-1 do
      begin
        if code = SelectList.Items[j] then
        begin
          query := True;
          Break;
        end;
      end;

      if query = True then
      begin
        code := code +'_q';

        memo2.Lines.Add('                                <td>');
        memo2.Lines.Add('                                    <label');
        memo2.Lines.Add('                                        style="height: 22px; width: 98%' + hide + '" for="'+tablename+'_'+code+'">');
        memo2.Lines.Add('                                        '+name1);
        memo2.Lines.Add('                                    </label>');
        memo2.Lines.Add('                                </td>');
        memo2.Lines.Add('                                <td>');
        memo2.Lines.Add('                                    <input');
        memo2.Lines.Add('                                        dojoType="'+datatype);
        memo2.Lines.Add('                                        style="height: 22px; width: 95%' + hide + '" id="'+code+'"');
        memo2.Lines.Add('                                        '+nul+'name="'+tablename+'_'+code+'" binding="'+code+'"');
        memo2.Lines.Add('                                        tabindex="'+inttostr(taborder)+'" maxlength="'+inttostr(leng)+'">');
        memo2.Lines.Add('                                    </input>');
        memo2.Lines.Add('                                </td>');

        if i mod 4 = 0 then
        begin
          memo2.Lines.Add('                            </tr>');
          memo2.Lines.Add('                            <tr style="">');
        end;

        i:=1+i;
        taborder:=taborder+1;
      end;

      next;
    end;
  end;
  if (i mod 4 )<> 1 then
  begin
    memo2.Lines.Add('                            </tr>');
  end;  
  memo2.Lines.Add('                        </table>');
  memo2.Lines.Add('                    </form>');
  memo2.Lines.Add('                </div>');
  memo2.Lines.Add('            </td>');
  memo2.Lines.Add('        </tr>');

end;

procedure TForm1.cbb2Change(Sender: TObject);
begin
  qry2.Close;
  qry2.SQL.Clear;
  qry2.SQL.Add('select table_name from user_tab_comments where table_name not like ''BIN$%'''+' and comments ='''+cbb2.Text+'''');
  qry2.Open;

  out_key:=qry2.FieldByName('table_name').Text;
end;

procedure TForm1.AutoAddClick(Sender: TObject);
begin
  memo2.Lines.Add('	function add1() {');
  memo2.Lines.Add('		get' + tablename + 'Prseno();');
  memo2.Lines.Add('       	unieap.byId("save").setDisabled(true);');
  memo2.Lines.Add('      	unieap.byId("add").setDisabled(true);');
  memo2.Lines.Add('       	unieap.byId("query").setDisabled(true);');
  memo2.Lines.Add('	 	var index2 = ' + tablename + 'ds.getRowSet().addRow().getIndex();');
  memo2.Lines.Add('	 	rowcount = ' + tablename + 'ds.getRowSet().getRowCount();');
  memo2.Lines.Add('	 	for (var i1=0;i1<rowcount;i1++){');
  memo2.Lines.Add('        	' + tablename + 'ds.getRowSet().getRow(i1).setRowSelected(false);');
  memo2.Lines.Add('        	}');
  memo2.Lines.Add('	 	unieap.byId("' + tablename + 'form").bindData(' + tablename + 'ds.getRowSet().getRow(index2));');
  memo2.Lines.Add('	 	' + tablename + 'ds.getRowSet().getRow(index2).setRowSelected(true);');
  memo2.Lines.Add('	 	unieap.byId("' + tablename + 'grid").setDataStore(' + tablename + 'ds);');
  if SelectList.Count>1 then
    memo2.Lines.Add('	 	unieap.byId("' + SelectList.Items[1] + '").focus();');
  memo2.Lines.Add('	 	' + tablename + 'ds.getRowSet().getRow(index2).setItemValue("identifier","1");');
  memo2.Lines.Add('	 	}');

  memo2.Lines.Add('	function get' + tablename + 'Prseno() {');
  memo2.Lines.Add('		var Http = new util.math.Calculator();');
  memo2.Lines.Add('        Http.setBZE401("queryPrseno");');
  memo2.Lines.Add('        Http.setDsName("' + tablename + '");');
  memo2.Lines.Add('        Http.setlsParam("' + tablename + '");');
  memo2.Lines.Add('        Http.setCallBackFunction("get' + tablename + 'PrsenoCallBack");');
  memo2.Lines.Add('        Http.post();');
  memo2.Lines.Add('    dijit.byId(''dialog0'').show();');
  memo2.Lines.Add('	}');

  memo2.Lines.Add('	 function get' + tablename + 'PrsenoCallBack(responseBeans) {');
  memo2.Lines.Add('    dijit.byId(''dialog0'').hide();');
  memo2.Lines.Add('    	var prsenoValue = responseBeans.lsParam;');
  memo2.Lines.Add('    	unieap.byId("PRSENO").setValue(prsenoValue);');
  memo2.Lines.Add('    	unieap.byId("' + SelectList.Items[0] + '").setValue(prsenoValue);');
  memo2.Lines.Add('	 }');


end;

procedure TForm1.AutoDelClick(Sender: TObject);
begin
  memo2.Lines.Add('     function del1(){');
  memo2.Lines.Add('    	if (' + tablename + 'ds.getRowSet().getRowCount() > 0) {');
  memo2.Lines.Add('	    	var rowIndex = unieap.byId("' + tablename + 'grid").getRowSet().getSelectedRowIndexs();');
  memo2.Lines.Add('	    	var rowCountPress = ' + tablename + 'ds.getRowSet().getSelectedCount();');
  memo2.Lines.Add('		    if(rowIndex == -1 || rowCountPress==0)');
  memo2.Lines.Add('		    {');
  memo2.Lines.Add('		    	messagebox("请选择需要删除的数据！",111);');
  memo2.Lines.Add('			    return ;');
  memo2.Lines.Add('		  	}');
  memo2.Lines.Add('		  	else');
  memo2.Lines.Add('		 	{');
  memo2.Lines.Add('		  		  messagebox("您确认删除该条数据吗？",421,processRet);');
  memo2.Lines.Add('		  	}');
  memo2.Lines.Add('    	}');
  memo2.Lines.Add('    	else {');
  memo2.Lines.Add('    		messagebox("没有需要删除的数据",111);');
  memo2.Lines.Add('    	}');
  memo2.Lines.Add('	}');
  memo2.Lines.Add('	function processRet(returnvalue)');
  memo2.Lines.Add('	{');
  memo2.Lines.Add('		if(returnvalue==1){');
  memo2.Lines.Add('			var rowIndex = unieap.byId("' + tablename + 'grid").getRowSet().getSelectedRowIndexs();');
  memo2.Lines.Add('			var rowCount = ' + tablename + 'ds.getRowSet().getRowCount();');
  memo2.Lines.Add('');
  memo2.Lines.Add('			if (' + tablename + 'ds.getRowSet().getRow(rowIndex).getItemValue("identifier") != "1") {');
  memo2.Lines.Add('				if (tempPrseno != "") {');
  memo2.Lines.Add('					tempPrseno += ",";');
  memo2.Lines.Add('				}');
  memo2.Lines.Add('				tempPrseno += unieap.byId("PRSENO").getValue("PRSENO");');
  memo2.Lines.Add('			}');
  memo2.Lines.Add('');
  memo2.Lines.Add('           unieap.byId("' + tablename + 'grid").deleteRow(rowIndex[0]);');
  memo2.Lines.Add('');
  memo2.Lines.Add('           unieap.byId("save").setDisabled(false);');
  memo2.Lines.Add('           unieap.byId("add").setDisabled(false);');
  memo2.Lines.Add('           unieap.byId("query").setDisabled(false);');
  memo2.Lines.Add('           if (rowCount-1>0)');
  memo2.Lines.Add('              {');
  memo2.Lines.Add('	           unieap.byId("' + tablename + 'grid").rowSelect(0);');
  memo2.Lines.Add('              }');
  memo2.Lines.Add('         }');
  memo2.Lines.Add('	}');
end;

procedure TForm1.AutoOutKeyClick(Sender: TObject);
begin
  memo2.Lines.Add('    function getWbPyCode() {');
  memo2.Lines.Add('		if (' + tablename + 'ds.getRowSet().getRowCount() > 0) {');
  memo2.Lines.Add('			var rowIndex = unieap.byId("' + tablename + 'grid").getRowSet().getSelectedRowIndexs();');
  memo2.Lines.Add('');
  memo2.Lines.Add('	    	if (' + tablename + 'ds.getRowSet().getRow(rowIndex).getItemValue("identifier") == "1" ||');
  memo2.Lines.Add('	    		' + tablename + 'ds.getRowSet().getRow(rowIndex).getItemValue("identifier") == "3") {');
  memo2.Lines.Add('');
  memo2.Lines.Add('				var ' + SelectList.Items[1] + ' = unieap.byId("' + SelectList.Items[1] + '").getValue("' + SelectList.Items[1] + '");');
  memo2.Lines.Add('				var selectCondition = null;	// 子SQL查询条件');
  memo2.Lines.Add('');
  memo2.Lines.Add('				if (' + SelectList.Items[1] + ' != null) {');
  memo2.Lines.Add('					selectCondition = "' + SelectList.Items[1] + ' = ''" + ' + SelectList.Items[1] + ' + "''";');
  memo2.Lines.Add('					var Http = new util.math.Calculator();');
  memo2.Lines.Add('			        //set业务编号');
  memo2.Lines.Add('			        Http.setBZE401("query' + out_key + class_name.Text + '");');
  memo2.Lines.Add('			        Http.setDsName("' + out_key + '");');
  memo2.Lines.Add('			        Http.setlsParam(selectCondition);');
  memo2.Lines.Add('			        Http.setCallBackFunction("getWbPyCodeCallBack");');
  memo2.Lines.Add('			        //提交请求');
  memo2.Lines.Add('			        Http.post();');
  memo2.Lines.Add('    dijit.byId(''dialog0'').show();');
  memo2.Lines.Add('				}');
  memo2.Lines.Add('	    	}');
  memo2.Lines.Add('		}');
  memo2.Lines.Add('    }');
  memo2.Lines.Add('');
  memo2.Lines.Add('    function getWbPyCodeCallBack(responseBeans) {');
  memo2.Lines.Add('    dijit.byId(''dialog0'').hide();');
  memo2.Lines.Add('	   	var flag = responseBeans.successFlag;');
  memo2.Lines.Add('		if (flag == "0") {');
  memo2.Lines.Add('			messagebox("请先完成基本信息登记，之后再执行本操作！",111);');
  memo2.Lines.Add('		    var rowIndex = unieap.byId("' + tablename + 'grid").getRowSet().getSelectedRowIndexs();');
  memo2.Lines.Add('		    ' + tablename + 'ds.getRowSet().getRow(rowIndex).setItemValue("' + SelectList.Items[1] + '", "");');
  memo2.Lines.Add('			unieap.byId("' + SelectList.Items[1] + '").focus();');
  memo2.Lines.Add('');
  memo2.Lines.Add('	       	unieap.byId("save").setDisabled(true);');
  memo2.Lines.Add('	      	unieap.byId("add").setDisabled(true);');
  memo2.Lines.Add('	       	unieap.byId("query").setDisabled(true);');
  memo2.Lines.Add('		}');
  memo2.Lines.Add('		else {');
  memo2.Lines.Add('	       	unieap.byId("save").setDisabled(false);');
  memo2.Lines.Add('	      	unieap.byId("add").setDisabled(false);');
  memo2.Lines.Add('	       	unieap.byId("query").setDisabled(false);');
  memo2.Lines.Add('		}');
  memo2.Lines.Add('	}');
end;

procedure TForm1.AutoSaveClick(Sender: TObject);
begin
  memo2.Lines.Add('	 function save1() {');
  memo2.Lines.Add('');
  memo2.Lines.Add('			var ' + tablename + 'dsCounts = ' + tablename + 'ds.getRowSet().getRowCount();');
  memo2.Lines.Add('			var aaa = Request["uid"];	// 建档人编号');
  memo2.Lines.Add('			var bbb = Request["orgid"];	// 建档机构编号');
  memo2.Lines.Add('			var ccc = Request["orgname"];	// 建档机构名称');
  memo2.Lines.Add('			aaa = "brainsoft";');
  memo2.Lines.Add('			bbb = "brainsoft";');
  memo2.Lines.Add('			ccc = "brainsoft";');
  memo2.Lines.Add('			for (var i = 0; i < ' + tablename + 'dsCounts; i++) {');
  memo2.Lines.Add('');


//  memo2.Lines.Add('				if (' + tablename + 'ds.getRowSet().getRow(i).getItemValue("HC101") == null || '+ tablename + 'ds.getRowSet().getRow(i).getItemValue("HC101") == "") {');







  memo2.Lines.Add('					messagebox("数据不完整，请将必填项补充完整后再执行保存",111);');
  memo2.Lines.Add('					return ;');
  memo2.Lines.Add('				}');
  memo2.Lines.Add('');
  memo2.Lines.Add('				' + tablename + 'ds.getRowSet().getRow(i).setItemValue("BRA002", aaa);');
  memo2.Lines.Add('				' + tablename + 'ds.getRowSet().getRow(i).setItemValue("HB002", ccc);');
  memo2.Lines.Add('				' + tablename + 'ds.getRowSet().getRow(i).setItemValue("HB001", bbb);');
  memo2.Lines.Add('');
  memo2.Lines.Add('');
  memo2.Lines.Add('			}');
  memo2.Lines.Add('');
  memo2.Lines.Add('');
  memo2.Lines.Add('');
  memo2.Lines.Add('');
  memo2.Lines.Add('	        var Http = new util.math.Calculator();');
  memo2.Lines.Add('	        //set业务编号');
  memo2.Lines.Add('	        Http.setBZE401("save' + class_name.Text + '");');
  memo2.Lines.Add('	        Http.setDsName("' + tablename + '");');
  memo2.Lines.Add('	        Http.setlsParam(ls_col);');
  memo2.Lines.Add('	        Http.setDeletePrseno(tempPrseno);');
  memo2.Lines.Add('	        Http.setDataStore(' + tablename + 'ds);');
  memo2.Lines.Add('	        Http.setCallBackFunction("excute_response");');
  memo2.Lines.Add('	        //提交请求');
  memo2.Lines.Add('	        Http.post();');
  memo2.Lines.Add('    dijit.byId(''dialog0'').show();');
  memo2.Lines.Add('	 }');
  memo2.Lines.Add('');
  memo2.Lines.Add('    function excute_response(responseBeans){');
  memo2.Lines.Add('    dijit.byId(''dialog0'').hide();');
  memo2.Lines.Add('    	var flag = responseBeans.successFlag;');
  memo2.Lines.Add('');
  memo2.Lines.Add('    	if (flag == "1") {');
  memo2.Lines.Add('    		messagebox("保存成功",111);');
  memo2.Lines.Add('    		tempPrseno = "";');
  memo2.Lines.Add('    		var dsRowCounts = ' + tablename + 'ds.getRowSet().getRowCount();');
  memo2.Lines.Add('    		for (var p = 0; p < dsRowCounts; p++) {');
  memo2.Lines.Add('    			' + tablename + 'ds.getRowSet().getRow(p).setItemValue("identifier", "3");');
  memo2.Lines.Add('    		}');
  memo2.Lines.Add('    	}');
  memo2.Lines.Add('    	else {');
  memo2.Lines.Add('    		messagebox("保存失败",111);');
  memo2.Lines.Add('    	}');
  memo2.Lines.Add('');
  memo2.Lines.Add('        unieap.byId("' + SelectList.Items[0] + '_q").focus();');
  memo2.Lines.Add('');
  memo2.Lines.Add('    }');
end;

end.
