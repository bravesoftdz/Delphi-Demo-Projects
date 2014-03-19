unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ShellAPI;

type
  TForm1 = class(TForm)
    img1: TImage;
    procedure img1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
var
  teminate: Boolean = True;

procedure TForm1.img1DblClick(Sender: TObject);
var
  Large, Small: HICON;
  nIcons, i: Integer;
begin
  if teminate then
  begin
    teminate := False;
  end
  else
    teminate := True;

  //%SystemRoot%\system32\SHELL32.dll
  img1.Canvas.Refresh;
  nIcons:=ExtractIconEx(PChar('SHELL32.dll'), -1, Large, Small, 1);
  for i := 0 to nIcons - 1 do
  begin
    ExtractIconEx(PChar('SHELL32.dll'), i, Large, Small, 1);
    DrawIcon(img1.Canvas.Handle, 0,0,Large);
    img1.Repaint;
    Application.ProcessMessages;
    Sleep(100);
    if teminate then
    begin
      img1.Canvas.Refresh;
      img1.Repaint;
      Exit;
    end;   

  end;
end;

end.
