unit Share_u;

interface
uses
  Windows, INIFiles, SysUtils, StrUtils;
Const
  AssistangMsg = 'HisUpgradeAssistantMsg';
  (*插件升级网络命令*)
  STR9101 = '9101';  //申请升级DLL
  STR9601 = '9601';  //需要更新
  STR9602 = '9602';  //不需要更新
  STR9603 = '9603';  //文件不存在
  ScktCmdLen = 4;    //命令长度
  PassKey: ShortString = 'zhw76035136';
type
  TPatient_Info = record
    Bed_NO: String[4];
    Patient_ID: String[10];
    Visit_NO: String[2];
    Pat_Status: String[1];
  end;
  (*插件信息*)
  TPlugInIntf = record
    Caption: String[60];        //菜单名称
    SysCode: Integer;           //子系统代码
    MenuCode: String[5];        //菜单代码
    ParentCode: String[5];     //父菜单代码
    ParentCaption: String[20]; //父菜单名称
    ItemCode: String[8];       //所有系统功能模块统一编号
    SpeedIndex: Integer;       //快捷方式索引号
  end;
  TSetPatsNS= procedure(blxxk: Boolean) of Object;
  TEdtStatus=(esNone,esInsert,esEdit,esDelete);  //数据编辑状态
  TFrmStatus=(fsNone,fsEdit,fsQuery,fsInsert,fsDelete);            //窗体编辑状态
  TSocketCommand = Array[0..3] of Char;
  (*文件版本数据类型*)
  TFileVersionArray= Array[0..22] of Char;
  (*文件名称数据类型*)
  TFileNameArray=  Array[0..29] of Char;
  (*用户信息*)
  TUserIntf = record
    yhbs: String[5];   //用户标识
    yhdm: String[10];  //用户代码
    yhxm: String[8];   //用户姓名
    yhzt: Integer;
    yhmm: String[20];  //用户密码
    yhbm: String[8];   //用户部门
  end;
  (*系统信息*)
  TSysIntf = record
    zjIP: String[23];    //应用服务器IP
    SjIP: String[23];    //升级服务器IP
    sjyh: String[20];    //升级服务器用户
    sjmm: String[32];    //升级服务器密码
    Sjml: String[20];    //升级服务器目录
    Zxtdm: String[16];      //子系统代码
    Zxtmc: String[30];   //子系统名称
    DllPath: String[30]; //动态链接库路径
    ResPath: String[30]; //资源文件路径
    DictPath: String[30];//字典文件路径
    RptPath: String[30]; //报表文件路径
    Zxtlx: Integer;      //子系统类型
    Zxtbm: String[8];   //子系统当前工作部门代码
    Units: String[40];  //医院名称
    bmmc: String[20];   //子系统当前工作部门名称
    Preview: Integer;   //是否预览(1--预览)
    AutoShowDpt: Integer;
    NWKBZ: String[1];   //内外科标志
  end;
  (*传送文件信息*)
  TFileInfo= record
  case detail: Boolean of
    false:
    (
      FileName: TFileNameArray;
      FileVersion: TFileVersionArray;
      FileFlag: Char;        //预留
    );
    true:
    (
      AllChar: Array[0..53] of Char;
    )
  end;

var

  Yhxx: TUserIntf;  //用户信息
  xtxx: TSysIntf;   //系统信息
  ExePath: String;//执行文件路径
  AssistantHandle: DWord;
  EdtStatus: TEdtStatus;
  (*药品管理*)
  ImportPrice: Integer;    //入库价价格方式
  ExportPrice: Integer;
  negativestock: Integer; //支持负库存
  LevelCurrency: Integer; //同级流通
  storageLevel: Integer; //库房级别
  StorageType: Integer;  //库房性质 1-药库 2-门诊药房 3中心药房
  CheckStorage: String[1]; //库房盘点标志
  LastChkDate: String[10]; //最后盘点时间
  cwbrxx: TPatient_Info;  //医嘱病人信息
  blctk: Boolean;
  SetPatsNS: TSetPatsNS;
  HisID:String;
  EmrID: String;
implementation
initialization
  AssistantHandle:= RegisterWindowMessage(AssistangMsg);
end.
