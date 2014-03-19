unit ReaderMain ;

interface

uses

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,

  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, ADODB, jpeg, CreateMain ;

const

  TableName = 'pic' ;

  PKey = 'count' ;

  Data = 'data' ;

  Title = '图片阅览器 放大倍数 ' ;

type

  TForm_main = class( TForm )

    dlgOpn: TOpenDialog ;

    img_main: TImage ;

    btn_opnaccess: TBitBtn ;

    ADS: TADODataSet ;

    btn_create: TButton;
    btn_up: TButton;
    btn_down: TButton;

    procedure btn_opnaccessClick( Sender: TObject ) ;

    procedure img_mainMouseDown(Sender: TObject; Button: TMouseButton;

      Shift: TShiftState; X, Y: Integer);

    procedure btn_createClick(Sender: TObject);

    procedure FormActivate(Sender: TObject);
    procedure btn_upClick(Sender: TObject);
    procedure btn_downClick(Sender: TObject);

  private

    connstr: string ;

    filecount: Integer ;

    filemax: Integer ;

    up: Integer ;

    filHight: Integer ;

    fileWidth: Integer ;

    procedure ShowImg ;

    { Private declarations }

  public

    { Public declarations }

  end;

var

  Form_main: TForm_main ;

implementation

{$R *.dfm}

procedure TForm_main.ShowImg ;

var

  jpegimg: TJPEGImage ;

  jpegstream: TMemoryStream ;

begin

  if ( connstr = '' )or( filecount <= 0 )or( filecount > filemax ) then

    Exit

  else begin

    ADS.Close;

    ADS.ConnectionString := connstr ;

    ADS.CommandText := 'SELECT * FROM ' +

      TableName +

      ' WHERE ' +

      PKey +

      '= ''' +

      IntToStr( filecount )+'''' ;

    ADS.Open ;

    jpegimg := TJPEGImage.Create ;

    jpegstream := TMemoryStream.Create ;

    try

      (TBlobField(ADS.FieldByName(Data))).SaveToStream(jpegstream);

      jpegstream.SetSize( Length( ADS.FieldByName( Data ).AsString ));

      jpegstream.Seek(0,0) ;

      jpegimg.LoadFromStream( jpegstream ) ;

      filHight := jpegimg.Height ;

      fileWidth := jpegimg.Width ;

      img_main.Width := Round( fileWidth * up / 10 ) ;

      img_main.Height := Round( filHight * up / 10 ) ;

      img_main.Picture.Assign( jpegimg ) ;

    finally

      jpegstream.Free ;

      jpegimg.Free ;

    end;

  end;

end;

procedure TForm_main.btn_opnaccessClick( Sender: TObject ) ;

begin

  if dlgOpn.Execute then

  begin

    if dlgOpn.FileName <> '' then

    begin

      connstr := 'Provider=Microsoft.Jet.OLEDB.4.0;' +

        'Data Source=' + dlgOpn.FileName + ';' +

        'Persist Security Info=False' ;

      filecount := 1 ;

      ADS.Close ;

      ADS.ConnectionString := connstr ;

      ADS.CommandText := 'SELECT COUNT(*) AS CNT FROM ' +

        TableName ;

      ADS.Open ;

      filemax := ADS.FieldByName( 'CNT' ).AsInteger ;

      ADS.Close;

      ShowImg;

    end ;

  end ;

end ;

procedure TForm_main.img_mainMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

begin

  if Button = mbLeft then

  begin

    if filecount = filemax then

    begin

      ShowMessage( '已经是最后一页了！' ) ;

      Exit ;

    end

    else begin

      filecount := filecount + 1 ;

      ShowImg ;

    end;

  end;

  if Button = mbRight then

  begin

    if filecount = 1 then

    begin

      ShowMessage( '已经是第一页了！' ) ;

      Exit ;

    end

    else begin

      filecount := filecount - 1 ;

      ShowImg ;

    end;

  end;

end;

procedure TForm_main.btn_createClick(Sender: TObject);

begin

  with TForm_Create.Create(Self) do

  begin

    ShowModal ;

    Free ;

  end;

end ;

procedure TForm_main.FormActivate(Sender: TObject);

begin

  up := 10 ;

  btn_opnaccessClick(nil);

end ;

procedure TForm_main.btn_upClick(Sender: TObject);
begin

    up := up + 1 ;

    Form_main.Caption := Title + FloatToStr( up / 10 ) ;

    img_main.Width := Round( fileWidth * up / 10 ) ;

    img_main.Height := Round( filHight * up / 10 ) ;

    img_main.Repaint ;

end;

procedure TForm_main.btn_downClick(Sender: TObject);
begin

  if up - 1 > 0 then

    begin

      up := up - 1 ;

      Form_main.Caption := Title + FloatToStr( up / 10 ) ;

      img_main.Width := Round( fileWidth * up / 10 ) ;

      img_main.Height := Round( filHight * up / 10 ) ;

      img_main.Repaint ;

    end;

end;

end .
