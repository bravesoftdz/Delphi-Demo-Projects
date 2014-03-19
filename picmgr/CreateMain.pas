unit CreateMain ;

interface

uses

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,

  Dialogs, StdCtrls, DropFileListBox, DB, ADODB ;

const

  TableName = 'pic' ;

  PKey = 'count' ;

  Data = 'data' ;

type

  TForm_Create = class( TForm )

    DropFileListBox1: TDropFileListBox ;

    Button1: TButton ;

    ADS: TADODataSet ;

    dlgSv: TSaveDialog ;

    procedure Button1Click(Sender: TObject) ;

    procedure DropFileListBox1DropFiles(Sender: TObject;

      FileNames: TStringList) ;

    procedure DropFileListBox1DblClick(Sender: TObject) ;
    procedure DropFileListBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private

    connstr: string ;

    { Private declarations }

  public

    { Public declarations }

  end ;

var

  Form_Create: TForm_Create ;

implementation

{$R *.dfm}

{$R mdb.res}

procedure TForm_Create.Button1Click(Sender: TObject) ;

var

  res: TResourceStream ;

  resname: string ;

begin

  if dlgSv.Execute then

  begin

    if dlgSv.FileName <> '' then

    begin

      resname := 'newdb' ;

      res := TResourceStream.Create( HInstance , resname , pchar('mydbsrcfile') );

      res.savetofile( dlgSv.FileName ) ;

      res.free ;

      connstr := 'Provider=Microsoft.Jet.OLEDB.4.0;' +

        'Data Source=' + dlgSv.FileName + ';' +

        'Persist Security Info=False' ;

    end ;

  end ;



end ;

procedure TForm_Create.DropFileListBox1DropFiles(Sender: TObject;
  FileNames: TStringList);

begin

  DropFileListBox1.Items.AddStrings( FileNames ) ;

end ;

procedure TForm_Create.DropFileListBox1DblClick(Sender: TObject);

begin

  DropFileListBox1.DeleteSelected ;
 
end ;

procedure TForm_Create.DropFileListBox1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);

var

  i: Integer ;

begin

  if Key = VK_RETURN then

  begin

    if DropFileListBox1.Count > 0 then

    begin

      ADS.Close;

      ADS.ConnectionString := connstr ;

      ADS.CommandText := 'SELECT * FROM ' +

        TableName +

        ' WHERE 1=2' ;

      ADS.Open ;

      for i := 0 to DropFileListBox1.Count-1 do

      begin

        ADS.Append ;

        ADS.FieldByName( PKey ).AsString := IntToStr( i + 1 ) ;

        TBlobField( ADS.FieldByName( Data ) ).LoadFromFile( DropFileListBox1.Items.Strings[ i ] ) ;

        ADS.Post ;

      end ;

      ShowMessage( '图片录入完成！' ) ;

      Close;

    end

    else begin

      ShowMessage( '没有可供存储的文件！' ) ;

    end;


  end ;

end;

end .
