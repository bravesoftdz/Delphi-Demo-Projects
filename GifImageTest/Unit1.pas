unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GIFImage, ExtCtrls, StdCtrls, OleCtrls, SHDocVw;

type
  TForm1 = class(TForm)
    img1: TImage;
    lbl1: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormShow(Sender: TObject);
var
  gif: TGIFImage;
begin
  include(GIFImageDefaultDrawOptions, goDirectDraw);
  gif := TGIFImage.Create;
  gif.LoadFromFile('test.gif');

  try
    img1.Picture.Assign(GIF);
    img1.Height := gif.Height;
    img1.Width := gif.Width;
//    img1.Parent.DoubleBuffered:=True;
  finally
    GIF.Free;
  end;
end;

end.
