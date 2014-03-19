'<?xml version="1.0" encoding="gb2312"?>
<baseFiles>
	<mb/>
	<bl/>
</baseFiles>'

type
  TFileIndexInfo = record
    dataid,
    datatype,
    datafile,
    datadate
      :string;
  end;
  TFileIndexItem = ^TFileIndexInfo;

function CreateIndexXml(Apath: string): Boolean;
function DeleteIneffective(Apath: string): Boolean;
function SaveFileIndex(const Apath, Adatatype, Adataid, Adatafile: string): Boolean;
function LoadFileIndex(const Apath, Adatatype, Adataid: string; var Adatadate, Adatafile: string): Boolean;
function ClearFileIndex(const Apath, Adatatype, Adataid: string; var Adelcount: Integer): Boolean;
function ListFileIndex(const Apath, Adatatype: string; var ALst: TList): Boolean;

procedure demo;
var
  ldate, lfile: string;
  cnt: Integer;
  filelst: TList;
  p: TFileIndexItem;
  i: Integer;
begin
//  CreateIndexXml(ExePath + 'DocTempFiles\');
////  DeleteIneffective(ExePath + 'DocTempFiles\');
////  SaveFileIndex(ExePath + 'DocTempFiles\', 'mb','342','1.bbak');
//  LoadFileIndex(ExePath + 'DocTempFiles\', 'mb','342',ldate,lfile);
//  ShowMessage(ldate + '-' + lfile);
//ClearFileIndex(ExePath + 'DocTempFiles\', 'mb','342',cnt);
//ShowMessage(IntToStr(cnt));
//
  filelst := TList.Create;
  try
    ListFileIndex(ExePath + 'DocTempFiles\','',filelst);
    for i := 0 to filelst.Count - 1 do
    begin
      p := filelst.Items[i];
      ShowMessage(p.dataid + #13#10 + P.datatype + #13#10 + p.datafile + #13#10 + p.datadate);
    end;
  finally
    cnt := filelst.Count;
    for i := cnt - 1 downto 0 do
    begin
      p := filelst.Items[i];
      filelst.Delete(i);
      DisPose(p);
    end;
    //释放链表
    filelst.Free;
  end;          
end;


function CreateIndexXml(Apath: string): Boolean;
var
  xmlDocument: IXMLDocument;
  rootnode: IXMLNode;
begin
  try
    try
      if FileExists(Apath + 'Index.xml') then
      begin
        Result := True;
        xmlDocument := NewXMLDocument;
        xmlDocument.Options := [doNodeAutoIndent];
        xmlDocument.Active := True;
        xmlDocument := LoadXMLDocument(Apath + 'Index.xml');

        if xmlDocument.ChildNodes.Count <> 2 then
        begin
          raise Exception.Create('XML节点数小于2！');
        end;

        if xmlDocument.ChildNodes[1].NodeName <> 'baseFiles' then
        begin
          raise Exception.Create('XML根节点不是baseFiles！');
        end;

        if not xmlDocument.ChildNodes[1].HasChildNodes then
        begin
          raise Exception.Create('XML根节点无子节点！');
        end;

        if ((xmlDocument.ChildNodes[1].ChildNodes[0].NodeName <> 'bl') and
          (xmlDocument.ChildNodes[1].ChildNodes[0].NodeName <> 'mb')) or
          ((xmlDocument.ChildNodes[1].ChildNodes[1].NodeName <> 'bl') and
          (xmlDocument.ChildNodes[1].ChildNodes[1].NodeName <> 'mb')) then
        begin
          raise Exception.Create('XML根节点的子节点错误！');
        end;
      end
      else
      begin
        xmlDocument := NewXMLDocument;
        xmlDocument.Options := [doNodeAutoIndent];
        xmlDocument.Active := True;
        xmlDocument.Version := '1.0';
        xmlDocument.Encoding := 'gb2312';
        rootnode := xmlDocument.AddChild('baseFiles');
        rootnode.AddChild('mb');
        rootnode.AddChild('bl');
        xmlDocument.SaveToFile(Apath + 'Index.xml');
        Result := True;
      end;
    except
      on e: Exception do
      begin
        xmlDocument.Active := False;
        DeleteFile(Apath + 'Index.xml');
        if CreateIndexXml(Apath) then
        begin
          Result := True;
          Exit;
        end
        else
        begin
          MsgInfo('初始化本地文件目录失败！错误信息：' + e.Message, 3);
          Result := False;
          Exit;
        end;
      end;
    end;
  finally
    xmlDocument.Active := False;
  end;
end;

function DeleteIneffective(Apath: string): Boolean;
var
  xmlDocument: IXMLDocument;
  rootNode, readNode: IXMLNode;
  i, j: Integer;
  fileNames: TStringList;
  seacher: TSearchRec;
  cnt: Integer;
begin
  Result := True;
  try
    try
      fileNames := TStringList.Create;
      xmlDocument := NewXMLDocument;
      xmlDocument.Options := [doNodeAutoIndent];
      xmlDocument.Active := True;
      xmlDocument := LoadXMLDocument(Apath + 'Index.xml');

      if xmlDocument.ChildNodes.Count < 2 then
      begin
        MsgInfo('初始化本地文件目录失败！错误信息：目录文件结构错误！', 3);
        Result := False;
        Exit;
      end;

      rootnode := xmlDocument.ChildNodes[1];

      if not rootNode.HasChildNodes then
      begin
        MsgInfo('初始化本地文件目录失败！错误信息：目录文件结构错误！', 3);
        Result := False;
        Exit;
      end;

      for i := 0 to rootnode.ChildNodes.Count - 1 do
      begin
        readNode := rootnode.ChildNodes[i];
        cnt := readNode.ChildNodes.Count;
        for j := cnt - 1 downto 0 do
        begin
          if (readNode.ChildNodes[j].Attributes['datafile'] <> '') and
            (not FileExists(Apath + readNode.ChildNodes[j].Attributes['datafile'])) then
          begin
            readNode.ChildNodes.Delete(j);
          end
          else
          begin
            fileNames.Add(readNode.ChildNodes[j].Attributes['datafile']);
          end;
        end;
      end;

      if FindFirst(Apath + '*.bbak', faAnyFile, seacher) = 0 then
      begin
        repeat
          if fileNames.IndexOf(seacher.Name) = -1 then
          begin
            DeleteFile(Apath + seacher.Name);
          end;
        until FindNext(seacher) <> 0;
      end;
      FindClose(seacher);

      xmlDocument.SaveToFile(Apath + 'Index.xml');
    except
      on e: Exception do
      begin
        MsgInfo('初始化本地文件目录失败！错误信息：' + e.Message, 3);
        Result := False;
        Exit;
      end;
    end;
  finally
    xmlDocument.Active := False;
    fileNames.Free;
  end;
end;

function SaveFileIndex(const Apath, Adatatype, Adataid, Adatafile: string): Boolean;
var
  xmlDocument: IXMLDocument;
  rootNode, readNode, writeNode: IXMLNode;
  i, j: Integer;
  hasSaved: Boolean;
begin
  Result := True;
  try
    try
      xmlDocument := NewXMLDocument;
      xmlDocument.Options := [doNodeAutoIndent];
      xmlDocument.Active := True;
      xmlDocument := LoadXMLDocument(Apath + 'Index.xml');
      hasSaved := False;
      if xmlDocument.ChildNodes.Count < 2 then
      begin
        Result := False;
        Exit;
      end;

      rootnode := xmlDocument.ChildNodes[1];

      if not rootNode.HasChildNodes then
      begin
        Result := False;
        Exit;
      end;

      for i := 0 to rootnode.ChildNodes.Count - 1 do
      begin
        if rootNode.ChildNodes[i].NodeName = Adatatype then
        begin
          readNode := rootnode.ChildNodes[i];
          for j := 0 to readNode.ChildNodes.Count - 1 do
          begin
            if readNode.ChildNodes[j].Attributes['dataid'] = Adataid then
            begin
              DeleteFile(Apath + readNode.ChildNodes[j].Attributes['datafile']);
              readNode.ChildNodes[j].Attributes['datadate'] := GetDateTimeStr(Now, 0);
              readNode.ChildNodes[j].Attributes['datafile'] := Adatafile;
              hasSaved := True;
              Break;
            end;
          end;

          if not hasSaved then
          begin
            writeNode := readNode.AddChild(Adatatype + 'File');
            writeNode.Attributes['dataid'] := Adataid;
            writeNode.Attributes['datadate'] := GetDateTimeStr(Now, 0);
            writeNode.Attributes['datafile'] := Adatafile;
            hasSaved := True;
          end;
          xmlDocument.SaveToFile(Apath + 'Index.xml');
          Exit;
        end;
      end;   
    except
      on e: Exception do
      begin
        MsgInfo('保存本地文件目录信息失败！错误信息：' + e.Message, 3);
        Result := False;
        Exit;
      end;
    end;
  finally
    xmlDocument.Active := False;
  end;
end;

function LoadFileIndex(const Apath, Adatatype, Adataid: string; var Adatadate, Adatafile: string): Boolean;
var
  xmlDocument: IXMLDocument;
  rootNode, readNode: IXMLNode;
  i, j: Integer;
begin
  Result := True;
  try
    try
      Adatadate := '';
      Adatafile := '';
      xmlDocument := NewXMLDocument;
      xmlDocument.Options := [doNodeAutoIndent];
      xmlDocument.Active := True;
      xmlDocument := LoadXMLDocument(Apath + 'Index.xml');

      if xmlDocument.ChildNodes.Count < 2 then
      begin
        Result := False;
        Exit;
      end;

      rootnode := xmlDocument.ChildNodes[1];

      if not rootNode.HasChildNodes then
      begin
        Result := False;
        Exit;
      end;

      for i := 0 to rootnode.ChildNodes.Count - 1 do
      begin
        if rootNode.ChildNodes[i].NodeName = Adatatype then
        begin
          readNode := rootnode.ChildNodes[i];
          for j := 0 to readNode.ChildNodes.Count - 1 do
          begin
            if readNode.ChildNodes[j].Attributes['dataid'] = Adataid then
            begin
              Adatadate := readNode.ChildNodes[j].Attributes['datadate'];
              Adatafile := readNode.ChildNodes[j].Attributes['datafile'];
              Exit;
            end;
          end;
        end;
      end;
    except
      on e: Exception do
      begin
        MsgInfo('提取本地文件目录信息失败！错误信息：' + e.Message, 3);
        Result := False;
        Exit;
      end;
    end;
  finally
    xmlDocument.Active := False;
  end;
end;

function ClearFileIndex(const Apath, Adatatype, Adataid: string; var Adelcount: Integer): Boolean;
var
  xmlDocument: IXMLDocument;
  rootNode, readNode: IXMLNode;
  i, j: Integer;
  cnt: Integre;
begin
  Result := True;
  try
    try
      Adelcount := 0;
      xmlDocument := NewXMLDocument;
      xmlDocument.Options := [doNodeAutoIndent];
      xmlDocument.Active := True;
      xmlDocument := LoadXMLDocument(Apath + 'Index.xml');

      if xmlDocument.ChildNodes.Count < 2 then
      begin
        Result := False;
        Exit;
      end;

      rootnode := xmlDocument.ChildNodes[1];

      if not rootNode.HasChildNodes then
      begin
        Result := False;
        Exit;
      end;

      for i := 0 to rootnode.ChildNodes.Count - 1 do
      begin
        if rootNode.ChildNodes[i].NodeName = Adatatype then
        begin
          readNode := rootnode.ChildNodes[i];
          cnt := readNode.ChildNodes.Count;
          for j := cnt - 1 downto 0 do
          begin
            if readNode.ChildNodes[j].Attributes['dataid'] = Adataid then
            begin
              DeleteFile(Apath + readNode.ChildNodes[j].Attributes['datafile']);
              readNode.ChildNodes.Delete(j);
              Inc(Adelcount);
            end;
          end;
          xmlDocument.SaveToFile(Apath + 'Index.xml');
          Exit;
        end;
      end;
    except
      on e: Exception do
      begin
        MsgInfo('清理本地文件目录信息失败！错误信息：' + e.Message, 3);
        Result := False;
        Exit;
      end;
    end;
  finally
    xmlDocument.Active := False;
  end;
end;

function ListFileIndex(const Apath, Adatatype: string; var ALst: TList): Boolean;
var
  xmlDocument: IXMLDocument;
  rootNode, readNode: IXMLNode;
  i, j: Integer;
  p: TFileIndexItem;
begin
  Result := True;
  try
    try
      xmlDocument := NewXMLDocument;
      xmlDocument.Options := [doNodeAutoIndent];
      xmlDocument.Active := True;
      xmlDocument := LoadXMLDocument(Apath + 'Index.xml');

      if xmlDocument.ChildNodes.Count < 2 then
      begin
        Result := False;
        Exit;
      end;

      rootnode := xmlDocument.ChildNodes[1];

      if not rootNode.HasChildNodes then
      begin
        Result := False;
        Exit;
      end;

      if Adatatype = '' then
      begin
        for i := 0 to rootnode.ChildNodes.Count - 1 do
        begin
          readNode := rootnode.ChildNodes[i];
          for j := 0 to readNode.ChildNodes.Count - 1 do
          begin
            New(p);
            p.dataid := readNode.ChildNodes[j].Attributes['dataid'];
            p.datatype := readNode.NodeName;
            p.datafile := readNode.ChildNodes[j].Attributes['datafile'];
            p.datadate := readNode.ChildNodes[j].Attributes['datadate'];
            ALst.Add(p);
          end;
        end;
      end
      else
      begin
        for i := 0 to rootnode.ChildNodes.Count - 1 do
        begin
          if readNode.NodeName = Adatatype then
          begin
            readNode := rootnode.ChildNodes[i];
            for j := 0 to readNode.ChildNodes.Count - 1 do
            begin
              New(p);
              p.dataid := readNode.ChildNodes[j].Attributes['dataid'];
              p.datatype := readNode.NodeName;
              p.datafile := readNode.ChildNodes[j].Attributes['datafile'];
              p.datadate := readNode.ChildNodes[j].Attributes['datadate'];
              ALst.Add(p);
            end;
            Break;
          end;
        end;
      end;
    except
      on e: Exception do
      begin
        MsgInfo('清理本地文件目录信息失败！错误信息：' + e.Message, 3);
        Result := False;
        Exit;
      end;
    end;
  finally
    xmlDocument.Active := False;
  end;
end;