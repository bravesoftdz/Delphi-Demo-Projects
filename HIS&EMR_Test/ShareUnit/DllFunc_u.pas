unit DllFunc_u;

interface
Uses
  Windows, Classes, SysUtils, INIFiles, ZLIB, DBCLient, Printers;
Const
  DesDll = 'ProtectSoft.dll';
  CommonDll = 'Common.dll';
  (*加密解密*)
  function EncryStr(AStr, AKey: ShortString): ShortString;StdCall;external DesDll;
  function DecryStr(AStr, AKey: ShortString): ShortString;StdCall;external DesDll;
  function EncryStrHex(AStr, AKey: ShortString): ShortString;StdCall;external DesDll;
  function DecryStrHex(AStrHex, AKey: ShortString): ShortString;StdCall;external DesDll;

  (*压缩*)
  procedure CompressIt(var CompressedStream: TMemoryStream;
    const CompressionLevel: TCompressionLevel);StdCall;external CommonDll;
  (*解压流*)
  procedure UnCompressIt(const CompressedStream: TMemoryStream;
    var UnCompressedStream: TMemoryStream);StdCall;external CommonDll;
  (*得到拼音码*)
  function GetSpellCode(szText: PChar; iMode, iCount: Integer): PChar; stdcall;
    external CommonDll;
  (*获取本地IP地址*)
  function GetLocalIP: PChar;StdCall;external CommonDll;
  (*金额转换成中文大写*)
  function CurrToStr(CurrStr: Double): WideString;StdCall;
    external CommonDll;
  (*检查网络是否通畅*)
  function CheckOnline(ADestip: PChar): Boolean;StdCall;external CommonDll;
  (*得到指定扩展名列表*)
  function SearchFileExt(Const Dir,Ext: PChar; var FileList: TStringList;
    Const stopSearch: Boolean= false): Boolean;StdCall;external CommonDll;
  (*获取文件版本*)
  function GetFileVersion(FileName: ShortString): ShortString; StdCall;external CommonDll;
implementation

end.
