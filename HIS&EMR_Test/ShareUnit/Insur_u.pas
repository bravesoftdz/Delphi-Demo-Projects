unit Insur_u;

interface
Uses
  SysUtils;
Type
  TUserInfo = record            //�û���Ϣ��¼�ذ�
    case Detail: Boolean of
    true:
    (
      GRDNH: Array[0..13] of Char;               //�û����Ժ�
      ICKH: Array[0..8] of Char;                //IC����
      ICZT: Char;                               //IC��״̬
      XM: Array[0..19] of Char;                  //����
      XB: Array[0..1] of Char;                  //�Ա�
      CSRQ: Array[0..7] of Char;                //����
      MZ: Array[0..1] of Char;                  //����
      GZDW: Array[0..39] of Char;               //��λ
      SFZH: Array[0..17] of Char;               //���֤��
      GRZT: Array[0..1] of Char;                //����״̬
      ZFZT: Array[0..1] of Char;                //֧��״̬
      ZGZFXE: Array[0..7] of Char;              //���֧����
      KNYJE: Array[0..7] of Char;               //����ԭ���
      BCQCJE: Array[0..7] of Char;              //����Ȧ����
      DQKNYE: Array[0..7] of Char;              //��ǰ�������
      DWBM: Array[0..11] of Char;                //��λ����
      ZW: Array[0..9] of Char;                   //ְ��
      dqdm: Array[0..5] of Char;
      mxb1: Array[0..39] of char;
      mxbzzrq1: Array[0..7] of Char;
      mxb2: Array[0..39] of Char;
      mxbzzrq2: Array[0..7] of Char;

    );
    false:
    (
      MstInfo: Array[0..273] of Char;
    )
  end;
  TUserInfo_ex = record            //�û���Ϣ��¼�ذ�
    case Detail: Boolean of
    true:
    (
      GRDNH: Array[0..13] of Char;               //�û����Ժ�
      ICKH: Array[0..8] of Char;                //IC����
      ICZT: Char;                               //IC��״̬
      XM: Array[0..19] of Char;                  //����
      XB: Array[0..1] of Char;                  //�Ա�
      CSRQ: Array[0..7] of Char;                //����
      MZ: Array[0..1] of Char;                  //����
      GZDW: Array[0..39] of Char;               //��λ
      SFZH: Array[0..17] of Char;               //���֤��
      GRZT: Array[0..1] of Char;                //����״̬
      ZFZT: Array[0..1] of Char;                //֧��״̬
      ZGZFXE: Array[0..7] of Char;              //���֧����
      KNYJE: Array[0..7] of Char;               //����ԭ���
      BCQCJE: Array[0..7] of Char;              //����Ȧ����
      DQKNYE: Array[0..7] of Char;              //��ǰ�������
      DWBM: Array[0..11] of Char;                //��λ����
      ZW: Array[0..9] of Char;                   //ְ��
      dqdm: Array[0..5] of Char;
      mxb1: Array[0..39] of char;
      mxbzzrq1: Array[0..7] of Char;
      mxb2: Array[0..39] of Char;
      mxbzzrq2: Array[0..7] of Char;

    );
    false:
    (
      MstInfo: Array[0..273] of Char;
    )
  end;
  TUserInfo_sy = record            //�û���Ϣ��¼�ذ�
    case Detail: Boolean of
    true:
    (
      GRDNH: Array[0..13] of Char;               //�û����Ժ�
      ICKH: Array[0..8] of Char;                //IC����
      ICZT: Char;                               //IC��״̬
      XM: Array[0..19] of Char;                  //����
      XB: Array[0..1] of Char;                  //�Ա�
      CSRQ: Array[0..7] of Char;                //����
      MZ: Array[0..1] of Char;                  //����
      GZDW: Array[0..39] of Char;               //��λ
      SFZH: Array[0..17] of Char;               //���֤��
      GRZT: Array[0..1] of Char;                //����״̬
      ZFZT: Array[0..1] of Char;                //֧��״̬
      Djzt: Array[0..1] of Char;
      syjtzt: Array[0..1] of Char;
      wcbjyzf: Array[0..7] of Char;
      ywccs: Array[0..1] of Char;
      KNYJE: Array[0..7] of Char;               //����ԭ���
      BCQCJE: Array[0..7] of Char;              //����Ȧ����
      DQKNYE: Array[0..7] of Char;              //��ǰ�������
      DWBM: Array[0..11] of Char;                //��λ����
      dqdm: Array[0..5] of Char;
      poxm: Array[0..19] of char;
      posfz: Array[0..17] of Char;
      pocsny: Array[0..7] of Char;
      pozt: Array[0..1] of Char;

    );
    false:
    (
      MstInfo: Array[0..221] of Char;
    )
  end;
  TUserInfo_nh = record            //�û���Ϣ��¼�ذ�
    case Detail: Boolean of
    true:
    (
      GRDNH: Array[0..9] of Char;               //�û����Ժ�
      ICKH: Array[0..8] of Char;                //IC����
      ICZT: Char;                               //IC��״̬
      XM: Array[0..19] of Char;                  //����
      XB: Char;                  //�Ա�
      CSRQ: Array[0..7] of Char;                //����
      MZ: Array[0..1] of Char;                  //����
      xmc: Array[0..19] of Char;                //��
      xzmc: Array[0..19] of Char;               //����
      cmc: Array[0..19] of Char;                //��
      zmc: Array[0..19] of Char;                //��
      SFZH: Array[0..17] of Char;               //���֤��
      hsx: Char;
      DQZT: Char;                //��ǰ״̬
      ZFZT: Array[0..1] of Char;                //֧��״̬
      ZGZFXE: Array[0..7] of Char;              //���֧����
      KNYJE: Array[0..7] of Char;               //����ԭ���
      BCQCJE: Array[0..7] of Char;              //����Ȧ����
      DQKNYE: Array[0..7] of Char;              //��ǰ�������
      DWBM: Array[0..11] of Char;                //�������
      ylzh: Array[0..17] of Char                   //ְ��
    );
    false:
    (
      MstInfo: Array[0..214] of Char;
    )
  end;
  TOutpFeeMst = record          //������˷���ͷ
    case Detail: Boolean of
    true:
    (
       BC: Array[0..3] of Char;            //����
       GRDNH: Array[0..13] of Char;           //���˵��Ժ�
       SJH: Array[0..15] of Char;            //��Ʊ��
       SJJE: Array[0..10] of Char;         //��Ʊ���
       MZLB: Char;                          //�������
       CFZS: Array[0..1] of Char;                        //��������
       CF1WZ: Array[0..3] of Char;         //��һ�Ŵ���λ��
       CF2WZ: Array[0..3] of Char;         //�ڶ��Ŵ���λ��
       CF3WZ: Array[0..3] of Char;         //�����Ŵ���λ��
       CF4WZ: Array[0..3] of Char;         //�����Ŵ���λ��
       CF5WZ: Array[0..3] of Char;         //�����Ŵ���λ��
       CF6WZ: Array[0..3] of Char;         //�����Ŵ���λ��
       CF7WZ: Array[0..3] of Char;         //�����Ŵ���λ��
       CF8WZ: Array[0..3] of Char;         //�����Ŵ���λ��
       CF9WZ: Array[0..3] of Char;         //�����Ŵ���λ��
       CF10WZ: Array[0..3] of Char;         //�����Ŵ���λ��
       CF11WZ: Array[0..3] of Char;         //�����Ŵ���λ��
       CF12WZ: Array[0..3] of Char;         //�����Ŵ���λ��
       CF13WZ: Array[0..3] of Char;         //�����Ŵ���λ��
       CF14WZ: Array[0..3] of Char;         //�����Ŵ���λ��
       CF15WZ: Array[0..3] of Char;         //�����Ŵ���λ��
       CF16WZ: Array[0..3] of Char;         //�����Ŵ���λ��
       CF17WZ: Array[0..3] of Char;         //�����Ŵ���λ��
       CF18WZ: Array[0..3] of Char;         //�����Ŵ���λ��
    );
    false:
    (
       MstInfo: Array[0..119] of Char;
    );
  end;
  TOutpFeeDtl = record          //������˷�����ϸ
    case Detail: Boolean of
    true:
    (
      JZBH: Array[0..15] of Char;          //���ʱ��
      JZLB: Array[0..1] of Char;         //�������
      YSBH: Array[0..4] of Char;         //ҽʦ���
      JZJE: Array[0..9] of Char;        //���ʽ��
    );
    false:
    (
      MstInfo: Array[0..32] of Char;
    );
  end;
  TOutpFeeItem = record
    case Detail: Boolean of
    true:
    (
      YBXMBM: Array[0..12] of Char;      //����ҩƷ/��ĿĿ¼����
      YYXMBM: Array[0..9] of Char;         //ҽԺҩƷ/��ĿĿ¼����
      XMMC: Array[0..39] of Char;           //ҩƷ/��ĿĿ¼����
      XMGG: Array[0..15] of Char;           //���
      XMDW: Array[0..3] of Char;            //��λ
      JG: Array[0..9] of Char;               //����
      SL: Array[0..6] of Char;              //����
      CYJS: Array[0..1] of Char;          //�в�ҩ����
      CD: Char;                           //ҩƷ�������
      ZFLB: Char;                         //ҽ�Ʊ���֧�����
    );
    false:
    (
      MstInfo: Array[0..103] of Char;
    );
  end;
  (*����ذ�*)
  TOutpFeeRst = record
    case Detail: Boolean of
    true:
    (
      GRDNH: Array[0..13] of Char;           //���˵��Ժ�
      SJH: Array[0..15] of Char;           //��Ʊ��ˮ��
      JLJE: Array[0..9] of Char;            //������
      YLJE: Array[0..9] of Char;            //������
      ZFJE: Array[0..9] of Char;            //�Էѽ��
      DFFS: Char;                          //�渶��ʽ
      BNTCYZF: Array[0..10] of Char;  //����ͳ����֧�����
      YLZFY: Array[0..10] of Char;        //ҽ���ܷ���
      TCJJZF: Array[0..7] of Char;     //ͳ�����֧��
      GRZF: Array[0..9] of Char;     //�����Ը�
      DBBXJE: Array[0..10] of Char;    //�󲡾����������
      DBGRZF: Array[0..10] of Char;    //�󲡾����Ը����
      CDBJE: Array[0..10] of Char;         //���󲡽��
      GWYJB: Array[0..10] of Char;    //����ҽ�Ƹ����Ը�����Ա����
      GWYDB: Array[0..10] of Char;    //�󲡾��������Ը�����Ա����
      GWYCDB: Array[0..10] of Char;  //���󲡹���Ա����
      sfdffs: Char;
      syjjzf: Array[0..7] of Char;
      syjtts: Array[0..5] of Char;
      syjtzf: Array[0..7] of char;
      bccwcs: Array[0..1] of Char;
      KNYJE: Array[0..7] of Char;     //����ԭ���
      KZFJE: Array[0..7] of Char;       //IC֧�����
      DQKNJE: Array[0..7] of Char;   //��ǰ�������
      XJZFJE: Array[0..7] of Char;         //�ֽ�֧�����
    );
    false:
    (
      MstInfo: Array[0..223] of Char;
    );
  end;
  TEnrol=record    //��Ժ�Ǽ�
    case Detail: Boolean of
    true:
    (
      GRDNH: Array[0..6] of Char;            //�û����Ժ�
      BLH: Array[0..8] of Char;              //������
      ZYH: Array[0..8] of Char;          //סԺ��
      ZYLB: Char;                      //סԺ���
      BQDM: Array[0..9] of Char;           //����
      CH: Array[0..5] of Char;              //��λ��
      CWLX: Char;                          //��λ����
      CWFBZ: Array[0..4] of Char;           //��λ�ѱ�׼
      RYQK: Char;                      //��Ժʱ���
      MZYSBH: Array[0..4] of Char;         //����ҽʦ����
      MZKS: Array[0..9] of Char;           //�������
      CZYBH: Array[0..4] of Char;                //����Ա����
      RYSJ: Array[0..13] of Char;     //��Ժʱ��
      RYZD1: Array[0..29] of Char;         //��Ժ���1
      RYZD2: Array[0..29] of Char;         //��Ժ���2
      RYZD3: Array[0..29] of Char;         //��Ժ���3
    );
    false:
    (
      MstInfo: Array[0..172] of Char;
    );
  end;
  TEnrol_ex=record    //��Ժ�Ǽ�
    case Detail: Boolean of
    true:
    (
      GRDNH: Array[0..13] of Char;            //�û����Ժ�
      BLH: Array[0..8] of Char;              //������
      ZYH: Array[0..8] of Char;          //סԺ��
      ZYLB: Char;                      //סԺ���
      BQDM: Array[0..9] of Char;           //����
      CH: Array[0..5] of Char;              //��λ��
      CWLX: Char;                          //��λ����
      CWFBZ: Array[0..4] of Char;           //��λ�ѱ�׼
      RYQK: Char;                      //��Ժʱ���
      MZYSBH: Array[0..4] of Char;         //����ҽʦ����
      MZKS: Array[0..9] of Char;           //�������
      CZYBH: Array[0..4] of Char;                //����Ա����
      RYSJ: Array[0..13] of Char;     //��Ժʱ��
      RYZD1: Array[0..29] of Char;         //��Ժ���1
      RYZD2: Array[0..29] of Char;         //��Ժ���2
      RYZD3: Array[0..29] of Char;         //��Ժ���3
      BCLB:  Array[0..1] of Char;
      dbzbh: Array[0..9] of Char;
      posfz: Array[0..17] of char;
    );
    false:
    (
      MstInfo: Array[0..209] of Char;
    );
  end;
  TEnrol_NH=record    //��Ժ�Ǽ�_ũ��
    case Detail: Boolean of
    true:
    (
      GRDNH: Array[0..9] of Char;            //�û����Ժ�
      BLH: Array[0..8] of Char;              //������
      ZYH: Array[0..8] of Char;          //סԺ��
      ZYLB: Char;                      //סԺ���
      BQDM: Array[0..9] of Char;           //����
      CH: Array[0..5] of Char;              //��λ��
      CWLX: Char;                          //��λ����
      CWFBZ: Array[0..4] of Char;           //��λ�ѱ�׼
      RYQK: Char;                      //��Ժʱ���
      MZYSBH: Array[0..4] of Char;         //����ҽʦ����
      MZKS: Array[0..9] of Char;           //�������
      CZYBH: Array[0..4] of Char;                //����Ա����
      RYSJ: Array[0..13] of Char;     //��Ժʱ��
      RYZD1: Array[0..29] of Char;         //��Ժ���1
      RYZD2: Array[0..29] of Char;         //��Ժ���2
      RYZD3: Array[0..27] of Char;         //��Ժ���3
      TZXM:  Array[0..1] of Char;
      BCLB: Array[0..1] of Char;           //�������
    );
    false:
    (
      MstInfo: Array[0..177] of Char;
    );
  end;
  TDeptBed = record      //ת��ת��
    case Detail: Boolean of
    true:
    (
      GRDNH: Array[0..6] of Char;            //�û����Ժ�
      ZYH: Array[0..8] of Char;          //סԺ��
      BQ: Array[0..9] of Char;           //����
      CH: Array[0..5] of Char;              //��λ��
      CWLX: Char;                          //��λ����
      CWFBZ: Array[0..4] of Char;           //��λ�ѱ�׼
      YSBH: Array[0..4] of Char;              //����ҽʦ����
      CZYBH: Array[0..4] of Char;                //����Ա����
      ZKSJ: Array[0..13] of Char;          //ʱ��
    );
    false:
    (
      MstInfo: Array[0..61] of Char;
    );
  end;
  TDeptBed_XNH = record      //ת��ת��
    case Detail: Boolean of
    true:
    (
      GRDNH: Array[0..9] of Char;            //�û����Ժ�
      ZYH: Array[0..8] of Char;          //סԺ��
      BQ: Array[0..9] of Char;           //����
      CH: Array[0..5] of Char;              //��λ��
      CWLX: Char;                          //��λ����
      CWFBZ: Array[0..4] of Char;           //��λ�ѱ�׼
      YSBH: Array[0..4] of Char;              //����ҽʦ����
      CZYBH: Array[0..4] of Char;                //����Ա����
      ZKSJ: Array[0..13] of Char;          //ʱ��
    );
    false:
    (
      MstInfo: Array[0..64] of Char;
    );
  end;
  TInpFeeMst = record           //סԺ������
    case Detail: Boolean of
    true:
    (
      BC: Array[0..3] of Char;            //����
      GRDNH: Array[0..6] of Char;           //���˵��Ժ�
      ZYH: Array[0..8] of Char;         //סԺ��
      JZBH: Array[0..15] of Char;         //���ʱ��
      JZLB: Array[0..1] of Char;        //�������
      YSBH: Array[0..4] of Char;         //ҽʦ���
      HSBH: Array[0..4] of Char;          //��ʿ���
      CZYBH: Array[0..4] of Char;           //��������
      JZSJ: Array[0..13] of char;       //����ʱ��
      JZJE: Array[0..9] of Char;        //���ʽ��
    );
    false:
    (
      MstInfo: Array[0..76] of Char;
    );
  end;
  TInpFeeMst_ex = record           //סԺ������
    case Detail: Boolean of
    true:
    (
      BC: Array[0..3] of Char;            //����
      GRDNH: Array[0..13] of Char;           //���˵��Ժ�
      ZYH: Array[0..8] of Char;         //סԺ��
      JZBH: Array[0..15] of Char;         //���ʱ��
      JZLB: Array[0..1] of Char;        //�������
      YSBH: Array[0..4] of Char;         //ҽʦ���
      HSBH: Array[0..4] of Char;          //��ʿ���
      CZYBH: Array[0..4] of Char;           //��������
      JZSJ: Array[0..13] of char;       //����ʱ��
      JZJE: Array[0..9] of Char;        //���ʽ��
    );
    false:
    (
      MstInfo: Array[0..83] of Char;
    );
  end;
  TInpFeeMst_Xnh = record           //סԺ������
    case Detail: Boolean of
    true:
    (
      BC: Array[0..3] of Char;            //����
      GRDNH: Array[0..9] of Char;           //���˵��Ժ�
      ZYH: Array[0..8] of Char;         //סԺ��
      JZBH: Array[0..15] of Char;         //���ʱ��
      JZLB: Array[0..1] of Char;        //�������
      YSBH: Array[0..4] of Char;         //ҽʦ���
      HSBH: Array[0..4] of Char;          //��ʿ���
      CZYBH: Array[0..4] of Char;           //��������
      JZSJ: Array[0..13] of char;       //����ʱ��
      JZJE: Array[0..9] of Char;        //���ʽ��
    );
    false:
    (
      MstInfo: Array[0..79] of Char;
    );
  end;
  TInpFeeItem = record        //סԺ������ϸ
    case Detail: Boolean of
    true:
    (
      YBXMBM: Array[0..12] of Char;      //����ҩƷ/��ĿĿ¼����
      YYXMBM: Array[0..9] of Char;         //ҽԺҩƷ/��ĿĿ¼����
      XMMC: Array[0..39] of Char;           //ҩƷ/��ĿĿ¼����
      XMGG: Array[0..15] of Char;           //���
      XMDW: Array[0..3] of Char;            //��λ
      JG: Array[0..9] of Char;               //����
      SL: Array[0..6] of Char;              //����
      CYJS: Array[0..1] of Char;          //�в�ҩ����
      YF: Array[0..2] of Char;      //�÷�
      CD: Char;                           //ҩƷ�������
      ZFLB: Char;                         //ҽ�Ʊ���֧�����
    );
    false:
    (
      MstInfo: Array[0..106] of Char;
    );
  end;
  TInpFeeItem_ex = record        //סԺ������ϸ
    case Detail: Boolean of
    true:
    (
      YBXMBM: Array[0..12] of Char;      //����ҩƷ/��ĿĿ¼����
      YYXMBM: Array[0..9] of Char;         //ҽԺҩƷ/��ĿĿ¼����
      XMMC: Array[0..39] of Char;           //ҩƷ/��ĿĿ¼����
      XMGG: Array[0..15] of Char;           //���
      XMDW: Array[0..3] of Char;            //��λ
      JG: Array[0..9] of Char;               //����
      SL: Array[0..6] of Char;              //����
      CYJS: Array[0..1] of Char;          //�в�ҩ����
      YF: Array[0..2] of Char;      //�÷�
      CD: Char;                           //ҩƷ�������
      ZFLB: Char;                         //ҽ�Ʊ���֧�����
      TXXM: Char;
    );
    false:
    (
      MstInfo: Array[0..107] of Char;
    );
  end;
  TInpFeeRst=record                            //סԺ���˷���
  case Detail: Boolean of
    true:
    (
      GRDNH: Array[0..6] of Char;            //�û����Ժ�
      ZYH: Array[0..8] of Char;          //סԺ��
      JZBH: Array[0..15] of Char;         //���ʱ��
      JLJE: Array[0..9] of Char;            //������
      YLJE: Array[0..9] of Char;            //������
      ZFJE: Array[0..9] of Char;            //�Էѽ��
    );
    false:
    (
      MstInfo: Array[0..61] of Char;           
    )
  end;
  TInpFeeRst_ex=record                            //סԺ���˷���
  case Detail: Boolean of
    true:
    (
      GRDNH: Array[0..13] of Char;            //�û����Ժ�
      ZYH: Array[0..8] of Char;          //סԺ��
      JZBH: Array[0..15] of Char;         //���ʱ��
      JLJE: Array[0..9] of Char;            //������
      YLJE: Array[0..9] of Char;            //������
      ZFJE: Array[0..9] of Char;            //�Էѽ��
    );
    false:
    (
      MstInfo: Array[0..68] of Char;           
    )
  end;
  TInpFeeRst_XNH=record                            //��ũ��סԺ���˷���
  case Detail: Boolean of
    true:
    (
      GRDNH: Array[0..9] of Char;            //�û����Ժ�
      ZYH: Array[0..8] of Char;          //סԺ��
      JZBH: Array[0..15] of Char;         //���ʱ��
      JLJE: Array[0..9] of Char;            //������
      YLJE: Array[0..9] of Char;            //������
      ZFJE: Array[0..9] of Char;            //�Էѽ��
    );
    false:
    (
      MstInfo: Array[0..64] of Char;
    )
  end;
  TInpFeeDec = record                         //סԺ�˷�
  case Detail: Boolean of
    true:
    (
      GRDNH: Array[0..6] of Char;           //�û����Ժ�
      JZBH: Array[0..15] of Char;         //���ʱ��
      CZYBH: Array[0..4] of Char;           //����Ա����
      TFSJ: Array[0..13] of Char;       //����ʱ��
    );
    false:
    (
      MstInfo: Array[0..41] of Char;           
    )
  end;
  TInpFeeDec_XNH = record                         //סԺ�˷�
  case Detail: Boolean of
    true:
    (
      GRDNH: Array[0..9] of Char;           //�û����Ժ�
      JZBH: Array[0..15] of Char;         //���ʱ��
      CZYBH: Array[0..4] of Char;           //����Ա����
      TFSJ: Array[0..13] of Char;       //����ʱ��
    );
    false:
    (
      MstInfo: Array[0..45] of Char;           
    )
  end;
  TLeaveHos= record      //��Ժ����
  case Detail: Boolean of
    true:
    (
      GRDNH: Array[0..6] of Char;            //�û����Ժ�
      ZYH: Array[0..8] of Char;          //סԺ��
      JSLSH: Array[0..15] of Char;            //��ˮ��
      CYSJ: Array[0..13] of Char;
      JZSJ: Array[0..13] of Char;
      CZYBH: Array[0..4] of Char;
      CYZT: Char;
      CYZD1: Array[0..29] of Char;         //��Ժ���1
      CYZD2: Array[0..29] of Char;         //��Ժ���2
      CYZD3: Array[0..29] of Char;         //��Ժ���3
      CYLB: Char;
      YLFY: Array[0..10] of Char;
    );
    false:
    (
      MstInfo: Array[0..167] of Char;
    );
  end;
  TLeaveHos_ex= record      //��Ժ����
  case Detail: Boolean of
    true:
    (
      GRDNH: Array[0..13] of Char;            //�û����Ժ�
      ZYH: Array[0..8] of Char;          //סԺ��
      JSLSH: Array[0..15] of Char;            //��ˮ��
      CYSJ: Array[0..13] of Char;
      JZSJ: Array[0..13] of Char;
      CZYBH: Array[0..4] of Char;
      CYZT: Char;
      CYZD1: Array[0..29] of Char;         //��Ժ���1
      CYZD2: Array[0..29] of Char;         //��Ժ���2
      CYZD3: Array[0..29] of Char;         //��Ժ���3
      CYLB: Char;
      YLFY: Array[0..10] of Char;
      Bclb: Array[0..1] of Char;
    );
    false:
    (
      MstInfo: Array[0..176] of Char;
    );
  end;
  TLeaveHos_XNH= record      //��ũ�ϳ�Ժ����
  case Detail: Boolean of
    true:
    (
      GRDNH: Array[0..9] of Char;            //�û����Ժ�
      ZYH: Array[0..8] of Char;          //סԺ��
      JSLSH: Array[0..15] of Char;            //��ˮ��
      CYSJ: Array[0..13] of Char;
      JZSJ: Array[0..13] of Char;
      CZYBH: Array[0..4] of Char;
      CYZT: Char;

      CYZD1: Array[0..29] of Char;         //��Ժ���1
      CYZD2: Array[0..29] of Char;         //��Ժ���2
      CYZD3: Array[0..29] of Char;         //��Ժ���3
      CYLB: Char;
      YLFY: Array[0..10] of Char;
      BCLB: Array[0..1] of Char;            //�������
    );
    false:
    (
      MstInfo: Array[0..172] of Char;
    );
  end;
  TLeaveRst = record
    case Detail: Boolean of
    true:
    (
      GRDNH: Array[0..6] of Char;           //���˵��Ժ�
      ZYH: Array[0..8] of Char;          //סԺ��
      DFFS: Char;                          //�渶��ʽ
      BNZYCS: Array[0..1] of Char;        //����סԺ����
      BNTCYZF: Array[0..10] of Char;  //����ͳ����֧�����
      YLZFY: Array[0..10] of Char;        //ҽ���ܷ���
      ZFJE: Array[0..10] of Char;            //�Էѽ��
      YLJE: Array[0..9] of Char;            //������
      QFX: Array[0..9] of Char;           //����
      TCJJZF: Array[0..7] of Char;     //ͳ�����֧��
      GRZF: Array[0..9] of Char;     //�����Ը�
      DBBXJE: Array[0..10] of Char;    //�󲡾����������
      DBGRZF: Array[0..10] of Char;    //�󲡾����Ը����
      CDBJE: Array[0..10] of Char;         //���󲡽��
      GWYQFX: Array[0..10] of Char;     //���߹���Ա����
      GWYYLZF: Array[0..10] of Char;      //���๫��Ա����
      GWYGRZF: Array[0..10] of Char;    //����ҽ�Ƹ����Ը�����Ա����
      GWYDB: Array[0..10] of Char;    //�󲡾��������Ը�����Ա����
      GWYCDB: Array[0..10] of Char;  //���󲡹���Ա����
      KNYJE: Array[0..7] of Char;     //����ԭ���
      KZFJE: Array[0..7] of Char;       //IC֧�����
      DQKNJE: Array[0..7] of Char;   //��ǰ�������
      XJZFJE: Array[0..7] of Char;         //�ֽ�֧�����
    );
    false:
    (
      MstInfo: Array[0..209] of Char;
    );
  end;
  TLeaveRst_ex = record
    case Detail: Boolean of
    true:
    (
      GRDNH: Array[0..6] of Char;           //���˵��Ժ�
      ZYH: Array[0..8] of Char;          //סԺ��
      DFFS: Char;                          //�渶��ʽ
      BNZYCS: Array[0..1] of Char;        //����סԺ����
      BNTCYZF: Array[0..10] of Char;  //����ͳ����֧�����
      YLZFY: Array[0..10] of Char;        //ҽ���ܷ���
      ZFJE: Array[0..10] of Char;            //�Էѽ��
      YLJE: Array[0..9] of Char;            //������
      QFX: Array[0..9] of Char;           //����
      TCJJZF: Array[0..7] of Char;     //ͳ�����֧��
      GRZF: Array[0..9] of Char;     //�����Ը�
      DBBXJE: Array[0..10] of Char;    //�󲡾����������
      DBGRZF: Array[0..10] of Char;    //�󲡾����Ը����
      CDBJE: Array[0..10] of Char;         //���󲡽��
      GWYQFX: Array[0..10] of Char;     //���߹���Ա����
      GWYYLZF: Array[0..10] of Char;      //���๫��Ա����
      GWYGRZF: Array[0..10] of Char;    //����ҽ�Ƹ����Ը�����Ա����
      GWYDB: Array[0..10] of Char;    //�󲡾��������Ը�����Ա����
      GWYCDB: Array[0..10] of Char;  //���󲡹���Ա����
      TCJJZF_CW: Array[0..7] of Char;     //ͳ�����֧��
      GRZF_CW: Array[0..9] of Char;     //�����Ը�
      DBBXJE_CW: Array[0..10] of Char;    //�󲡾����������
      DBGRZF_CW: Array[0..10] of Char;    //�󲡾����Ը����
      GWYGRZF_CW: Array[0..10] of Char;    //����ҽ�Ƹ����Ը�����Ա����
      GWYDB_CW: Array[0..10] of Char;    //�󲡾��������Ը�����Ա����
      GWYCDB_CW: Array[0..10] of Char;  //���󲡹���Ա����
      KNYJE: Array[0..7] of Char;     //����ԭ���
      KZFJE: Array[0..7] of Char;       //IC֧�����
      DQKNJE: Array[0..7] of Char;   //��ǰ�������
      XJZFJE: Array[0..7] of Char;         //�ֽ�֧�����
    );
    false:
    (
      MstInfo: Array[0..282] of Char;
    );
  end;
  TLeaveRst_XNH = record
    case Detail: Boolean of
    true:
    (
      GRDNH: Array[0..9] of Char;           //���˵��Ժ�
      ZYH: Array[0..8] of Char;          //סԺ��
      DFFS: Char;                          //�渶��ʽ
      BNZYCS: Array[0..1] of Char;        //����סԺ����
      BNTCYZF: Array[0..10] of Char;  //����ͳ����֧�����
      YLZFY: Array[0..10] of Char;        //ҽ���ܷ���
      ZFJE: Array[0..10] of Char;            //�Էѽ��
      YLJE: Array[0..9] of Char;            //������
      QFX: Array[0..9] of Char;           //����
      TCJJZF: Array[0..7] of Char;     //ͳ�����֧��
      GRZF: Array[0..9] of Char;     //�����Ը�
      DBBXJE: Array[0..10] of Char;    //�󲡾����������
      DBGRZF: Array[0..10] of Char;    //�󲡾����Ը����
      CDBJE: Array[0..10] of Char;         //���󲡽��
      GWYQFX: Array[0..10] of Char;     //���߹���Ա����
      GWYYLZF: Array[0..10] of Char;      //���๫��Ա����
      GWYGRZF: Array[0..10] of Char;    //����ҽ�Ƹ����Ը�����Ա����
      GWYDB: Array[0..10] of Char;    //�󲡾��������Ը�����Ա����
      GWYCDB: Array[0..10] of Char;  //���󲡹���Ա����
      KNYJE: Array[0..7] of Char;     //����ԭ���
      KZFJE: Array[0..7] of Char;       //IC֧�����
      DQKNJE: Array[0..7] of Char;   //��ǰ�������
      XJZFJE: Array[0..7] of Char;         //�ֽ�֧�����
    );
    false:
    (
      MstInfo: Array[0..212] of Char;
    );
  end;
  TDueMst = record
  case Detail: Boolean of
    true:
    (
      grdnh: Array[0..6] of Char;           //���˵��Ժ�
      zyh: Array[0..8] of Char;          //סԺ��
    );
    false:
    (
      MstInfo: Array[0..15] of Char;
    );
  end;
  TDueMst_ex = record
  case Detail: Boolean of
    true:
    (
      grdnh: Array[0..13] of Char;           //���˵��Ժ�
      zyh: Array[0..8] of Char;          //סԺ��
      cysj: Array[0..13] of Char;
    );
    false:
    (
      MstInfo: Array[0..36] of Char;
    );
  end;
  TDueMst_XNH = record
  case Detail: Boolean of
    true:
    (
      grdnh: Array[0..9] of Char;           //���˵��Ժ�
      zyh: Array[0..8] of Char;          //סԺ��
    );
    false:
    (
      MstInfo: Array[0..18] of Char;
    );
  end;
  TDueRst = record
  case Detail: Boolean of
    true:
    (
      grzf: Array[0..10] of Char;           //����Ӧ��
      tczf: Array[0..10] of Char;          //ҽ��֧��
      qfx: Array[0..10] of Char;           //����
      jrdb: Array[0..10] of Char;          //�����
      gwybz: Array[0..10] of Char;         //����Ա����
    );
    false:
    (
      MstInfo: Array[0..54] of Char;
    );
  end;
  TDueRst_ex = record
  case Detail: Boolean of
    true:
    (
      grzf: Array[0..10] of Char;           //����Ӧ��
      tczf: Array[0..10] of Char;          //ҽ��֧��
      qfx: Array[0..10] of Char;           //����
      jrdb: Array[0..10] of Char;          //�����
      gwybz: Array[0..10] of Char;         //����Ա����
      syjjzf: Array[0..10] of Char;
      syjtts: Array[0..5] of Char;
      syjtzf: Array[0..10] of Char;
    );
    false:
    (
      MstInfo: Array[0..82] of Char;
    );
  end;
  TOutpTotal= record                         //����ҽ��������
    Case Detail: Boolean of
    true:
    (
      qsrq: Array[0..13] of Char;
      zzrq: Array[0..13] of Char;
      sjzs: Array[0..6] of Char;
      xjzf: Array[0..9] of Char;
      kzf: Array[0..9] of Char;
    );
    false:
    (
      MstInfo: Array[0..54] of Char;
    );
  end;
  TOutpTotalRst= record                         //����ҽ�������ʷ���
    Case Detail: Boolean of
    true:
    (
      sjzsce: Array[0..6] of Char;
      xjzfce: Array[0..9] of Char;
      kzfce: Array[0..9] of Char;
    );
    false:
    (
      MstInfo: Array[0..26] of Char;
    );
  end;
  TOutpList= record                         //����ҽ������ϸ��
    Case Detail: Boolean of
    true:
    (
      qsrq: Array[0..13] of Char;
      zzrq: Array[0..13] of Char;
    );
    false:
    (
      MstInfo: Array[0..27] of Char;
    );
  end;
  TInpList= record                         //סԺҽ������ϸ��
    Case Detail: Boolean of
    true:
    (
      qsrq: Array[0..13] of Char;
      zzrq: Array[0..13] of Char;
    );
    false:
    (
      MstInfo: Array[0..27] of Char;
    );
  end;
  TInpListNO= record                         //סԺҽ������ϸ��
    Case Detail: Boolean of
    true:
    (
      Zyh: Array[0..8] of Char;
      qsrq: Array[0..13] of Char;
      zzrq: Array[0..13] of Char;
    );
    false:
    (
      MstInfo: Array[0..36] of Char;
    );
  end;
  TDis0001_Xnh= record
    case Detail: Boolean of
    true:
    (
      BC: Array[0..3] of Char;            //����
      JYM: Array[0..3] of Char;           //������
      GRDNH: Array[0..9] of Char;         //���˵��Ժ�
      ZYH: Array[0..8] of Char;           //סԺ��
      RYZD1: Array[0..19] of Char;
      RYZD2: Array[0..19] of Char;
      RYZD3: Array[0..17] of Char;
      Tzxm: Array[0..1] of Char;
      BCLB: Array[0..1] of Char;
    );
    false:
    (
      MstInfo: Array[0..88] of Char;
    );
  end;
  TDis0001Rst_Xnh= record
    case Detail: Boolean of
    true:
    (
      BC: Array[0..3] of Char;            //����
      DBJE: Array[0..9] of Char;
      BZXJ: Array[0..9] of Char;
    );
    false:
    (
      MstInfo: Array[0..23] of Char;
    );
  end;
  TDisease= record
    case Detail: Boolean of
    true:
    (
      Grdnh: Array[0..6] of Char;            //����
      ZYH: Array[0..8] of Char;           //סԺ��
      RYZD1: Array[0..19] of Char;
      RYZD2: Array[0..19] of Char;
      RYZD3: Array[0..17] of Char;
      BCLB: Array[0..1] of Char;
      DBZBH: Array[0..9] of Char;
    );
    false:
    (
      MstInfo: Array[0..117] of Char;
    );
  end;
  TDisease_yb= record
    case Detail: Boolean of
    true:
    (
      Grdnh: Array[0..13] of Char;            //����
      ZYH: Array[0..8] of Char;           //סԺ��
      RYZD1: Array[0..29] of Char;
      RYZD2: Array[0..29] of Char;
      RYZD3: Array[0..29] of Char;
      BCLB: Array[0..1] of Char;
      DBZBH: Array[0..9] of Char;
    );
    false:
    (
      MstInfo: Array[0..124] of Char;
    );
  end;
  TBrzfcx= record
    grzf: Real;
    tczf: Real;
    qfx: Real;
    Jrdb: Real;
    gwybt: Real;
  end;
  {���û���Ϣ}
  THis_User_Info=function(hisid:PChar;pid:PChar;s_userinfo:PChar;ic_flag: Integer): Integer;Stdcall;
  {��ҽ��}
  THis_User_Info_Ays=function(hisid:PChar;pid:PChar;s_userinfo:PChar;ic_flag: Integer; area_code: PChar): Integer;Stdcall;
  {����}
  THis_User_Inusrance_Info=function(hisid:PChar;pid:PChar;s_userinfo:PChar;ic_flag: Integer; area_code: PChar;mate_flag: Integer): Integer;Stdcall;
  {����ͥ��Ϣ}
  THis_Family_Info= function(hisid:PChar;pid:PChar;s_userinfo:PChar;ic_flag: Integer): Integer;Stdcall;
  THis_Family_Info_LaqXnh= function(hisid:PChar;pid:PChar;s_userinfo:PChar;ic_flag: Integer): Integer;Stdcall;
  
  {�������}
  THis_Out_Tally=function (hisid:PChar;opman:PChar;Out_Tally_Info:PChar;Retun_Info:PChar): Integer;StdCall;
  {ʱ��ͬ��}
  THis_Synch_Time=function (hisid:PChar;Return_Info:PChar):Integer;StdCall;
  {��Ժ�Ǽ�}
  THis_Enrol=function (Hisid:Pchar;Enrol_Info: Pchar): Integer;StdCall;
  {��������}
  THis_Change_Sickbed=function (hisid:PChar;Change_Sickbed_Info:PChar): Integer;stdcall;
  {סԺ����}
  THis_BeinHos_Tally=function (hisid:PChar;BeginHos_Tally: PChar;Retun_Info: PChar): Integer;stdcall;
  {��Ժ����}
  THis_LeaveHos=function (hisid:PChar;LeaveHos_Info: PChar;Retun_Info: PChar;ic_flag: Integer): Integer;stdcall;
  {סԺ�˷�}
  THis_BeinHos_Refundment=function (hisid: PChar; BeinHos_Refundment_Info: PChar): Integer;stdcall;

  {������ö���ϸ��}
  THis_Out_Collate_List=function (hisid:PChar;Out_Collate_List_Info: PChar;Retun_Info: PChar): Integer;StdCall;
  {������ö�����}
  THis_Out_Collate_Total=function (hisid:PChar;Out_Collate_Total_Info: PChar;Retun_Info: PChar): Integer;StdCall;
  {סԺ���ö���ϸ��(��סԺ��)}
  THis_In_Collate_List_No=function (hisid: PChar; In_Collate_List_Info_No: PChar;Retun_Info: Pchar): Integer;stdcall;
  {סԺ���ö���ϸ��}
  THis_In_Collate_List=function (hisid: PChar; In_Collate_List_Info: Pchar;Retun_Info: Pchar): Integer;StdCall;
  {סԺ���ö�����}
  THis_In_Collate_Total=function (hisid: PChar; In_Collate_Total_Info: Pchar;Retun_Info: PChar): Integer;StdCall;
  {��Ժ���ö�����}
  THis_Leave_Collate_Total=function (hisid: PChar; Leave_Collate_Total_Info: PChar; Retun_Info: PChar): Integer;StdCall;
  (*����Ӧ֧����ѯ*)
  THis_Due=function (hisid: PChar; Due_Info: PChar; Retun_Info: PChar): Integer;StdCall;
  (*ͨ�ý���*)
  THis_Dis=function (hisid: PChar; Dis_Info: PChar; Return_Info: PChar): Integer;StdCall;
  THis_Disease= function(hisid: Pchar; Ch_Dis_Info: PChar): Integer; StdCall;
  THis_Inusrance_Enrol=function(hisid: Pchar; Enrol_Info: PChar): Integer; StdCall;
  function Get_InsurInfo(ErrCode: Integer): String;overload;
  function Get_InsurInfo(Code: String; AType: Integer): String;overload;
  //function His_BeinHos_Tally_LaqXnh(hisid:PChar;BeginHos_Tally: PChar;Retun_Info: PChar): Integer;stdcall;external 'ic.dll';
  //function His_Family_Info_LaqXnh(hisid:PChar;pid:PChar;s_userinfo:PChar;ic_flag: Integer): Integer;Stdcall;external 'IC.Dll';
  //function His_User_Info(hisid:PChar;pid:PChar;s_userinfo:PChar;ic_flag: Integer): Integer;Stdcall;external 'IC.Dll';

var
  ICHandle: THandle;
  iRst: Integer;
  //HisID: String;
  ICDLl: String;
  IDCard: Array[0..17] of Char;
  His_Family_Info: THis_Family_Info;                  //����ͥ��Ϣ
  //His_Family_Info_LaqXnh: THis_Family_Info;
  //His_BeinHos_tally_LaqXnh: THis_BeinHos_tally;
  //His_BeinHos_Refundment_LaqXnh: THis_BeinHos_Refundment;
  His_User_Info: THis_User_Info;                      //���û���Ϣ
  His_User_Info_Ays: THis_User_Info_Ays;                      //���û���Ϣ
  His_User_Inusrance_Info: THis_User_Inusrance_Info;  //����
  His_Out_Tally: THis_Out_Tally;                      //�������
  His_Synch_Time: THis_Synch_Time;                    //ʱ��ͬ��
  His_Enrol: THis_Enrol;                              //��Ժ�Ǽ�
  His_Change_Sickbed: THis_Change_Sickbed;            //��������
  His_BeinHos_Tally: THis_BeinHos_Tally;              //סԺ����
  His_LeaveHos: THis_LeaveHos;                        //��Ժ����
  His_BeinHos_Refundment: THis_BeinHos_Refundment;    //סԺ�˷�
  His_Out_Collate_List: THis_Out_Collate_List;        //������ö���ϸ��
  His_Out_Collate_Total: THis_Out_Collate_Total;      //������ö�����
  His_In_Collate_List_No: THis_In_Collate_List_No;   //סԺ���ö���ϸ��(��סԺ��)
  His_In_Collate_List: THis_In_Collate_List;         //סԺ���ö���ϸ��
  His_In_Collate_Total: THis_In_Collate_Total;       //סԺ���ö�����
  His_Leave_Collate_Total: THis_Leave_Collate_Total; //��Ժ���ö�����
  His_Due: THis_Due;                                 //����Ӧ֧����ѯ
  His_Inusrance_Enrol: THis_Inusrance_Enrol;         //��������
  His_Dis: THis_Dis;                                 //ͨ�ý���
  His_Disease: THis_Disease;
implementation
function Get_InsurInfo(ErrCode: Integer): String;
begin
  Result:= IntToStr(ErrCode);
end;
function Get_InsurInfo(Code: String; AType: Integer): String;
begin
  {1-��״̬ 2-����״̬ 3-֧��״̬}
  case AType of
    1:
    case StrToIntdef(Code,0) of
      0: result:= '����';
      1: result:= '��ʧ';
      2: result:= 'ע��';
      3: result:= 'ֹ��';
      4: result:= 'δ����';
      5: result:= '��';
    end;
    2:
    case StrToIntdef(Code,1) of
      1: result:= '��ְ';
      2: result:= '����';
      3: result:= '����';
      4: result:= '����';
    end;
    3:
    case StrToIntdef(Code,0) of
      0: result:= '����';
      1: result:= 'ͳ����������';
      2: result:= '�����˻�������';
      3: result:= 'ȫ��';
      4: result:= 'IC���Ƿ�';
    end;
    4:
    case StrToIntdef(Code,1) of
      1: result:= 'һ��ũ��';
      2: result:= '�屣��';
      3: result:= 'ƶ����';
      4: result:= '������';
      5: result:= '������';
      9: result:= '������';
    end;
    5:
    case StrToIntdef(Code,1) of
      1: result:= '��';
      2: result:= 'Ů';
      9: result:= '����';
    end;
  end;
end;

initialization
  ICDLl:= 'IC.Dll';
  //HisID:= 'Y003';
end.
