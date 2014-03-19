unit PlugIn_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, base_u, share_u;

type
  TPlugIn_f = class(Tbase_f)
  private
    function GetCaption: TPlugInIntf;virtual;abstract;
    function ShowDllForm(aHandle: THandle): Boolean;virtual;abstract;
  public
    { Public declarations }
  end;
implementation

{$R *.dfm}

end.
