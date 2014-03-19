unit DllFunc_u;

interface
Uses
  Windows, Classes, SysUtils, INIFiles, ZLIB, DBCLient, Printers;
Const
  DesDll = 'ProtectSoft.dll';
  CommonDll = 'Common.dll';
  (*���ܽ���*)
  function EncryStr(AStr, AKey: ShortString): ShortString;StdCall;external DesDll;
  function DecryStr(AStr, AKey: ShortString): ShortString;StdCall;external DesDll;
  function EncryStrHex(AStr, AKey: ShortString): ShortString;StdCall;external DesDll;
  function DecryStrHex(AStrHex, AKey: ShortString): ShortString;StdCall;external DesDll;

  (*ѹ��*)
  procedure CompressIt(var CompressedStream: TMemoryStream;
    const CompressionLevel: TCompressionLevel);StdCall;external CommonDll;
  (*��ѹ��*)
  procedure UnCompressIt(const CompressedStream: TMemoryStream;
    var UnCompressedStream: TMemoryStream);StdCall;external CommonDll;
  (*�õ�ƴ����*)
  function GetSpellCode(szText: PChar; iMode, iCount: Integer): PChar; stdcall;
    external CommonDll;
  (*��ȡ����IP��ַ*)
  function GetLocalIP: PChar;StdCall;external CommonDll;
  (*���ת�������Ĵ�д*)
  function CurrToStr(CurrStr: Double): WideString;StdCall;
    external CommonDll;
  (*��������Ƿ�ͨ��*)
  function CheckOnline(ADestip: PChar): Boolean;StdCall;external CommonDll;
  (*�õ�ָ����չ���б�*)
  function SearchFileExt(Const Dir,Ext: PChar; var FileList: TStringList;
    Const stopSearch: Boolean= false): Boolean;StdCall;external CommonDll;
  (*��ȡ�ļ��汾*)
  function GetFileVersion(FileName: ShortString): ShortString; StdCall;external CommonDll;
implementation

end.
