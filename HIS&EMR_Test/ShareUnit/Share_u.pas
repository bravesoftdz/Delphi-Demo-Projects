unit Share_u;

interface
uses
  Windows, INIFiles, SysUtils, StrUtils;
Const
  AssistangMsg = 'HisUpgradeAssistantMsg';
  (*���������������*)
  STR9101 = '9101';  //��������DLL
  STR9601 = '9601';  //��Ҫ����
  STR9602 = '9602';  //����Ҫ����
  STR9603 = '9603';  //�ļ�������
  ScktCmdLen = 4;    //�����
  PassKey: ShortString = 'zhw76035136';
type
  TPatient_Info = record
    Bed_NO: String[4];
    Patient_ID: String[10];
    Visit_NO: String[2];
    Pat_Status: String[1];
  end;
  (*�����Ϣ*)
  TPlugInIntf = record
    Caption: String[60];        //�˵�����
    SysCode: Integer;           //��ϵͳ����
    MenuCode: String[5];        //�˵�����
    ParentCode: String[5];     //���˵�����
    ParentCaption: String[20]; //���˵�����
    ItemCode: String[8];       //����ϵͳ����ģ��ͳһ���
    SpeedIndex: Integer;       //��ݷ�ʽ������
  end;
  TSetPatsNS= procedure(blxxk: Boolean) of Object;
  TEdtStatus=(esNone,esInsert,esEdit,esDelete);  //���ݱ༭״̬
  TFrmStatus=(fsNone,fsEdit,fsQuery,fsInsert,fsDelete);            //����༭״̬
  TSocketCommand = Array[0..3] of Char;
  (*�ļ��汾��������*)
  TFileVersionArray= Array[0..22] of Char;
  (*�ļ�������������*)
  TFileNameArray=  Array[0..29] of Char;
  (*�û���Ϣ*)
  TUserIntf = record
    yhbs: String[5];   //�û���ʶ
    yhdm: String[10];  //�û�����
    yhxm: String[8];   //�û�����
    yhzt: Integer;
    yhmm: String[20];  //�û�����
    yhbm: String[8];   //�û�����
  end;
  (*ϵͳ��Ϣ*)
  TSysIntf = record
    zjIP: String[23];    //Ӧ�÷�����IP
    SjIP: String[23];    //����������IP
    sjyh: String[20];    //�����������û�
    sjmm: String[32];    //��������������
    Sjml: String[20];    //����������Ŀ¼
    Zxtdm: String[16];      //��ϵͳ����
    Zxtmc: String[30];   //��ϵͳ����
    DllPath: String[30]; //��̬���ӿ�·��
    ResPath: String[30]; //��Դ�ļ�·��
    DictPath: String[30];//�ֵ��ļ�·��
    RptPath: String[30]; //�����ļ�·��
    Zxtlx: Integer;      //��ϵͳ����
    Zxtbm: String[8];   //��ϵͳ��ǰ�������Ŵ���
    Units: String[40];  //ҽԺ����
    bmmc: String[20];   //��ϵͳ��ǰ������������
    Preview: Integer;   //�Ƿ�Ԥ��(1--Ԥ��)
    AutoShowDpt: Integer;
    NWKBZ: String[1];   //����Ʊ�־
  end;
  (*�����ļ���Ϣ*)
  TFileInfo= record
  case detail: Boolean of
    false:
    (
      FileName: TFileNameArray;
      FileVersion: TFileVersionArray;
      FileFlag: Char;        //Ԥ��
    );
    true:
    (
      AllChar: Array[0..53] of Char;
    )
  end;

var

  Yhxx: TUserIntf;  //�û���Ϣ
  xtxx: TSysIntf;   //ϵͳ��Ϣ
  ExePath: String;//ִ���ļ�·��
  AssistantHandle: DWord;
  EdtStatus: TEdtStatus;
  (*ҩƷ����*)
  ImportPrice: Integer;    //���ۼ۸�ʽ
  ExportPrice: Integer;
  negativestock: Integer; //֧�ָ����
  LevelCurrency: Integer; //ͬ����ͨ
  storageLevel: Integer; //�ⷿ����
  StorageType: Integer;  //�ⷿ���� 1-ҩ�� 2-����ҩ�� 3����ҩ��
  CheckStorage: String[1]; //�ⷿ�̵��־
  LastChkDate: String[10]; //����̵�ʱ��
  cwbrxx: TPatient_Info;  //ҽ��������Ϣ
  blctk: Boolean;
  SetPatsNS: TSetPatsNS;
  HisID:String;
  EmrID: String;
implementation
initialization
  AssistantHandle:= RegisterWindowMessage(AssistangMsg);
end.
