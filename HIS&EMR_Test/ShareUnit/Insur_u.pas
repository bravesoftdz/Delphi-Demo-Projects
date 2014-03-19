unit Insur_u;

interface
Uses
  SysUtils;
Type
  TUserInfo = record            //用户信息记录回包
    case Detail: Boolean of
    true:
    (
      GRDNH: Array[0..13] of Char;               //用户电脑号
      ICKH: Array[0..8] of Char;                //IC卡号
      ICZT: Char;                               //IC卡状态
      XM: Array[0..19] of Char;                  //姓名
      XB: Array[0..1] of Char;                  //性别
      CSRQ: Array[0..7] of Char;                //生日
      MZ: Array[0..1] of Char;                  //民族
      GZDW: Array[0..39] of Char;               //单位
      SFZH: Array[0..17] of Char;               //身份证号
      GRZT: Array[0..1] of Char;                //个人状态
      ZFZT: Array[0..1] of Char;                //支付状态
      ZGZFXE: Array[0..7] of Char;              //最高支付额
      KNYJE: Array[0..7] of Char;               //卡内原金额
      BCQCJE: Array[0..7] of Char;              //本次圈存金额
      DQKNYE: Array[0..7] of Char;              //当前卡内余额
      DWBM: Array[0..11] of Char;                //单位编码
      ZW: Array[0..9] of Char;                   //职务
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
  TUserInfo_ex = record            //用户信息记录回包
    case Detail: Boolean of
    true:
    (
      GRDNH: Array[0..13] of Char;               //用户电脑号
      ICKH: Array[0..8] of Char;                //IC卡号
      ICZT: Char;                               //IC卡状态
      XM: Array[0..19] of Char;                  //姓名
      XB: Array[0..1] of Char;                  //性别
      CSRQ: Array[0..7] of Char;                //生日
      MZ: Array[0..1] of Char;                  //民族
      GZDW: Array[0..39] of Char;               //单位
      SFZH: Array[0..17] of Char;               //身份证号
      GRZT: Array[0..1] of Char;                //个人状态
      ZFZT: Array[0..1] of Char;                //支付状态
      ZGZFXE: Array[0..7] of Char;              //最高支付额
      KNYJE: Array[0..7] of Char;               //卡内原金额
      BCQCJE: Array[0..7] of Char;              //本次圈存金额
      DQKNYE: Array[0..7] of Char;              //当前卡内余额
      DWBM: Array[0..11] of Char;                //单位编码
      ZW: Array[0..9] of Char;                   //职务
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
  TUserInfo_sy = record            //用户信息记录回包
    case Detail: Boolean of
    true:
    (
      GRDNH: Array[0..13] of Char;               //用户电脑号
      ICKH: Array[0..8] of Char;                //IC卡号
      ICZT: Char;                               //IC卡状态
      XM: Array[0..19] of Char;                  //姓名
      XB: Array[0..1] of Char;                  //性别
      CSRQ: Array[0..7] of Char;                //生日
      MZ: Array[0..1] of Char;                  //民族
      GZDW: Array[0..39] of Char;               //单位
      SFZH: Array[0..17] of Char;               //身份证号
      GRZT: Array[0..1] of Char;                //个人状态
      ZFZT: Array[0..1] of Char;                //支付状态
      Djzt: Array[0..1] of Char;
      syjtzt: Array[0..1] of Char;
      wcbjyzf: Array[0..7] of Char;
      ywccs: Array[0..1] of Char;
      KNYJE: Array[0..7] of Char;               //卡内原金额
      BCQCJE: Array[0..7] of Char;              //本次圈存金额
      DQKNYE: Array[0..7] of Char;              //当前卡内余额
      DWBM: Array[0..11] of Char;                //单位编码
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
  TUserInfo_nh = record            //用户信息记录回包
    case Detail: Boolean of
    true:
    (
      GRDNH: Array[0..9] of Char;               //用户电脑号
      ICKH: Array[0..8] of Char;                //IC卡号
      ICZT: Char;                               //IC卡状态
      XM: Array[0..19] of Char;                  //姓名
      XB: Char;                  //性别
      CSRQ: Array[0..7] of Char;                //生日
      MZ: Array[0..1] of Char;                  //民族
      xmc: Array[0..19] of Char;                //县
      xzmc: Array[0..19] of Char;               //乡镇
      cmc: Array[0..19] of Char;                //村
      zmc: Array[0..19] of Char;                //组
      SFZH: Array[0..17] of Char;               //身份证号
      hsx: Char;
      DQZT: Char;                //当前状态
      ZFZT: Array[0..1] of Char;                //支付状态
      ZGZFXE: Array[0..7] of Char;              //最高支付额
      KNYJE: Array[0..7] of Char;               //卡内原金额
      BCQCJE: Array[0..7] of Char;              //本次圈存金额
      DQKNYE: Array[0..7] of Char;              //当前卡内余额
      DWBM: Array[0..11] of Char;                //村组编码
      ylzh: Array[0..17] of Char                   //职务
    );
    false:
    (
      MstInfo: Array[0..214] of Char;
    )
  end;
  TOutpFeeMst = record          //门诊记账发包头
    case Detail: Boolean of
    true:
    (
       BC: Array[0..3] of Char;            //包长
       GRDNH: Array[0..13] of Char;           //个人电脑号
       SJH: Array[0..15] of Char;            //发票号
       SJJE: Array[0..10] of Char;         //发票金额
       MZLB: Char;                          //门诊类别
       CFZS: Array[0..1] of Char;                        //处方张数
       CF1WZ: Array[0..3] of Char;         //第一张处方位置
       CF2WZ: Array[0..3] of Char;         //第二张处方位置
       CF3WZ: Array[0..3] of Char;         //第三张处方位置
       CF4WZ: Array[0..3] of Char;         //第三张处方位置
       CF5WZ: Array[0..3] of Char;         //第三张处方位置
       CF6WZ: Array[0..3] of Char;         //第三张处方位置
       CF7WZ: Array[0..3] of Char;         //第三张处方位置
       CF8WZ: Array[0..3] of Char;         //第三张处方位置
       CF9WZ: Array[0..3] of Char;         //第三张处方位置
       CF10WZ: Array[0..3] of Char;         //第三张处方位置
       CF11WZ: Array[0..3] of Char;         //第三张处方位置
       CF12WZ: Array[0..3] of Char;         //第三张处方位置
       CF13WZ: Array[0..3] of Char;         //第三张处方位置
       CF14WZ: Array[0..3] of Char;         //第三张处方位置
       CF15WZ: Array[0..3] of Char;         //第三张处方位置
       CF16WZ: Array[0..3] of Char;         //第三张处方位置
       CF17WZ: Array[0..3] of Char;         //第三张处方位置
       CF18WZ: Array[0..3] of Char;         //第三张处方位置
    );
    false:
    (
       MstInfo: Array[0..119] of Char;
    );
  end;
  TOutpFeeDtl = record          //门诊记账发包明细
    case Detail: Boolean of
    true:
    (
      JZBH: Array[0..15] of Char;          //记帐编号
      JZLB: Array[0..1] of Char;         //记账类别
      YSBH: Array[0..4] of Char;         //医师编号
      JZJE: Array[0..9] of Char;        //记帐金额
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
      YBXMBM: Array[0..12] of Char;      //国家药品/项目目录编码
      YYXMBM: Array[0..9] of Char;         //医院药品/项目目录编码
      XMMC: Array[0..39] of Char;           //药品/项目目录名称
      XMGG: Array[0..15] of Char;           //规格
      XMDW: Array[0..3] of Char;            //单位
      JG: Array[0..9] of Char;               //单价
      SL: Array[0..6] of Char;              //数量
      CYJS: Array[0..1] of Char;          //中草药剂数
      CD: Char;                           //药品产地类别
      ZFLB: Char;                         //医疗保险支付类别
    );
    false:
    (
      MstInfo: Array[0..103] of Char;
    );
  end;
  (*门诊回包*)
  TOutpFeeRst = record
    case Detail: Boolean of
    true:
    (
      GRDNH: Array[0..13] of Char;           //个人电脑号
      SJH: Array[0..15] of Char;           //发票流水号
      JLJE: Array[0..9] of Char;            //甲类金额
      YLJE: Array[0..9] of Char;            //乙类金额
      ZFJE: Array[0..9] of Char;            //自费金额
      DFFS: Char;                          //垫付方式
      BNTCYZF: Array[0..10] of Char;  //本年统筹已支付金额
      YLZFY: Array[0..10] of Char;        //医疗总费用
      TCJJZF: Array[0..7] of Char;     //统筹基金支付
      GRZF: Array[0..9] of Char;     //个人自付
      DBBXJE: Array[0..10] of Char;    //大病救助报销金额
      DBGRZF: Array[0..10] of Char;    //大病救助自付金额
      CDBJE: Array[0..10] of Char;         //超大病金额
      GWYJB: Array[0..10] of Char;    //基本医疗个人自付公务员补助
      GWYDB: Array[0..10] of Char;    //大病救助个人自付公务员补助
      GWYCDB: Array[0..10] of Char;  //超大病公务员补助
      sfdffs: Char;
      syjjzf: Array[0..7] of Char;
      syjtts: Array[0..5] of Char;
      syjtzf: Array[0..7] of char;
      bccwcs: Array[0..1] of Char;
      KNYJE: Array[0..7] of Char;     //卡内原金额
      KZFJE: Array[0..7] of Char;       //IC支付金额
      DQKNJE: Array[0..7] of Char;   //当前卡内余额
      XJZFJE: Array[0..7] of Char;         //现金支付金额
    );
    false:
    (
      MstInfo: Array[0..223] of Char;
    );
  end;
  TEnrol=record    //入院登记
    case Detail: Boolean of
    true:
    (
      GRDNH: Array[0..6] of Char;            //用户电脑号
      BLH: Array[0..8] of Char;              //病历号
      ZYH: Array[0..8] of Char;          //住院号
      ZYLB: Char;                      //住院类别
      BQDM: Array[0..9] of Char;           //病区
      CH: Array[0..5] of Char;              //床位号
      CWLX: Char;                          //床位类型
      CWFBZ: Array[0..4] of Char;           //床位费标准
      RYQK: Char;                      //入院时情况
      MZYSBH: Array[0..4] of Char;         //门诊医师编码
      MZKS: Array[0..9] of Char;           //门诊科室
      CZYBH: Array[0..4] of Char;                //操作员工号
      RYSJ: Array[0..13] of Char;     //入院时间
      RYZD1: Array[0..29] of Char;         //入院诊断1
      RYZD2: Array[0..29] of Char;         //入院诊断2
      RYZD3: Array[0..29] of Char;         //入院诊断3
    );
    false:
    (
      MstInfo: Array[0..172] of Char;
    );
  end;
  TEnrol_ex=record    //入院登记
    case Detail: Boolean of
    true:
    (
      GRDNH: Array[0..13] of Char;            //用户电脑号
      BLH: Array[0..8] of Char;              //病历号
      ZYH: Array[0..8] of Char;          //住院号
      ZYLB: Char;                      //住院类别
      BQDM: Array[0..9] of Char;           //病区
      CH: Array[0..5] of Char;              //床位号
      CWLX: Char;                          //床位类型
      CWFBZ: Array[0..4] of Char;           //床位费标准
      RYQK: Char;                      //入院时情况
      MZYSBH: Array[0..4] of Char;         //门诊医师编码
      MZKS: Array[0..9] of Char;           //门诊科室
      CZYBH: Array[0..4] of Char;                //操作员工号
      RYSJ: Array[0..13] of Char;     //入院时间
      RYZD1: Array[0..29] of Char;         //入院诊断1
      RYZD2: Array[0..29] of Char;         //入院诊断2
      RYZD3: Array[0..29] of Char;         //入院诊断3
      BCLB:  Array[0..1] of Char;
      dbzbh: Array[0..9] of Char;
      posfz: Array[0..17] of char;
    );
    false:
    (
      MstInfo: Array[0..209] of Char;
    );
  end;
  TEnrol_NH=record    //入院登记_农合
    case Detail: Boolean of
    true:
    (
      GRDNH: Array[0..9] of Char;            //用户电脑号
      BLH: Array[0..8] of Char;              //病历号
      ZYH: Array[0..8] of Char;          //住院号
      ZYLB: Char;                      //住院类别
      BQDM: Array[0..9] of Char;           //病区
      CH: Array[0..5] of Char;              //床位号
      CWLX: Char;                          //床位类型
      CWFBZ: Array[0..4] of Char;           //床位费标准
      RYQK: Char;                      //入院时情况
      MZYSBH: Array[0..4] of Char;         //门诊医师编码
      MZKS: Array[0..9] of Char;           //门诊科室
      CZYBH: Array[0..4] of Char;                //操作员工号
      RYSJ: Array[0..13] of Char;     //入院时间
      RYZD1: Array[0..29] of Char;         //入院诊断1
      RYZD2: Array[0..29] of Char;         //入院诊断2
      RYZD3: Array[0..27] of Char;         //入院诊断3
      TZXM:  Array[0..1] of Char;
      BCLB: Array[0..1] of Char;           //补偿类别
    );
    false:
    (
      MstInfo: Array[0..177] of Char;
    );
  end;
  TDeptBed = record      //转床转科
    case Detail: Boolean of
    true:
    (
      GRDNH: Array[0..6] of Char;            //用户电脑号
      ZYH: Array[0..8] of Char;          //住院号
      BQ: Array[0..9] of Char;           //病区
      CH: Array[0..5] of Char;              //床位号
      CWLX: Char;                          //床位类型
      CWFBZ: Array[0..4] of Char;           //床位费标准
      YSBH: Array[0..4] of Char;              //门诊医师编码
      CZYBH: Array[0..4] of Char;                //操作员工号
      ZKSJ: Array[0..13] of Char;          //时间
    );
    false:
    (
      MstInfo: Array[0..61] of Char;
    );
  end;
  TDeptBed_XNH = record      //转床转科
    case Detail: Boolean of
    true:
    (
      GRDNH: Array[0..9] of Char;            //用户电脑号
      ZYH: Array[0..8] of Char;          //住院号
      BQ: Array[0..9] of Char;           //病区
      CH: Array[0..5] of Char;              //床位号
      CWLX: Char;                          //床位类型
      CWFBZ: Array[0..4] of Char;           //床位费标准
      YSBH: Array[0..4] of Char;              //门诊医师编码
      CZYBH: Array[0..4] of Char;                //操作员工号
      ZKSJ: Array[0..13] of Char;          //时间
    );
    false:
    (
      MstInfo: Array[0..64] of Char;
    );
  end;
  TInpFeeMst = record           //住院记账主
    case Detail: Boolean of
    true:
    (
      BC: Array[0..3] of Char;            //包长
      GRDNH: Array[0..6] of Char;           //个人电脑号
      ZYH: Array[0..8] of Char;         //住院号
      JZBH: Array[0..15] of Char;         //记帐编号
      JZLB: Array[0..1] of Char;        //记账类别
      YSBH: Array[0..4] of Char;         //医师编号
      HSBH: Array[0..4] of Char;          //护士编号
      CZYBH: Array[0..4] of Char;           //操作工号
      JZSJ: Array[0..13] of char;       //记帐时间
      JZJE: Array[0..9] of Char;        //记帐金额
    );
    false:
    (
      MstInfo: Array[0..76] of Char;
    );
  end;
  TInpFeeMst_ex = record           //住院记账主
    case Detail: Boolean of
    true:
    (
      BC: Array[0..3] of Char;            //包长
      GRDNH: Array[0..13] of Char;           //个人电脑号
      ZYH: Array[0..8] of Char;         //住院号
      JZBH: Array[0..15] of Char;         //记帐编号
      JZLB: Array[0..1] of Char;        //记账类别
      YSBH: Array[0..4] of Char;         //医师编号
      HSBH: Array[0..4] of Char;          //护士编号
      CZYBH: Array[0..4] of Char;           //操作工号
      JZSJ: Array[0..13] of char;       //记帐时间
      JZJE: Array[0..9] of Char;        //记帐金额
    );
    false:
    (
      MstInfo: Array[0..83] of Char;
    );
  end;
  TInpFeeMst_Xnh = record           //住院记账主
    case Detail: Boolean of
    true:
    (
      BC: Array[0..3] of Char;            //包长
      GRDNH: Array[0..9] of Char;           //个人电脑号
      ZYH: Array[0..8] of Char;         //住院号
      JZBH: Array[0..15] of Char;         //记帐编号
      JZLB: Array[0..1] of Char;        //记账类别
      YSBH: Array[0..4] of Char;         //医师编号
      HSBH: Array[0..4] of Char;          //护士编号
      CZYBH: Array[0..4] of Char;           //操作工号
      JZSJ: Array[0..13] of char;       //记帐时间
      JZJE: Array[0..9] of Char;        //记帐金额
    );
    false:
    (
      MstInfo: Array[0..79] of Char;
    );
  end;
  TInpFeeItem = record        //住院记账明细
    case Detail: Boolean of
    true:
    (
      YBXMBM: Array[0..12] of Char;      //国家药品/项目目录编码
      YYXMBM: Array[0..9] of Char;         //医院药品/项目目录编码
      XMMC: Array[0..39] of Char;           //药品/项目目录名称
      XMGG: Array[0..15] of Char;           //规格
      XMDW: Array[0..3] of Char;            //单位
      JG: Array[0..9] of Char;               //单价
      SL: Array[0..6] of Char;              //数量
      CYJS: Array[0..1] of Char;          //中草药剂数
      YF: Array[0..2] of Char;      //用法
      CD: Char;                           //药品产地类别
      ZFLB: Char;                         //医疗保险支付类别
    );
    false:
    (
      MstInfo: Array[0..106] of Char;
    );
  end;
  TInpFeeItem_ex = record        //住院记账明细
    case Detail: Boolean of
    true:
    (
      YBXMBM: Array[0..12] of Char;      //国家药品/项目目录编码
      YYXMBM: Array[0..9] of Char;         //医院药品/项目目录编码
      XMMC: Array[0..39] of Char;           //药品/项目目录名称
      XMGG: Array[0..15] of Char;           //规格
      XMDW: Array[0..3] of Char;            //单位
      JG: Array[0..9] of Char;               //单价
      SL: Array[0..6] of Char;              //数量
      CYJS: Array[0..1] of Char;          //中草药剂数
      YF: Array[0..2] of Char;      //用法
      CD: Char;                           //药品产地类别
      ZFLB: Char;                         //医疗保险支付类别
      TXXM: Char;
    );
    false:
    (
      MstInfo: Array[0..107] of Char;
    );
  end;
  TInpFeeRst=record                            //住院记账返回
  case Detail: Boolean of
    true:
    (
      GRDNH: Array[0..6] of Char;            //用户电脑号
      ZYH: Array[0..8] of Char;          //住院号
      JZBH: Array[0..15] of Char;         //记帐编号
      JLJE: Array[0..9] of Char;            //甲类金额
      YLJE: Array[0..9] of Char;            //乙类金额
      ZFJE: Array[0..9] of Char;            //自费金额
    );
    false:
    (
      MstInfo: Array[0..61] of Char;           
    )
  end;
  TInpFeeRst_ex=record                            //住院记账返回
  case Detail: Boolean of
    true:
    (
      GRDNH: Array[0..13] of Char;            //用户电脑号
      ZYH: Array[0..8] of Char;          //住院号
      JZBH: Array[0..15] of Char;         //记帐编号
      JLJE: Array[0..9] of Char;            //甲类金额
      YLJE: Array[0..9] of Char;            //乙类金额
      ZFJE: Array[0..9] of Char;            //自费金额
    );
    false:
    (
      MstInfo: Array[0..68] of Char;           
    )
  end;
  TInpFeeRst_XNH=record                            //新农合住院记账返回
  case Detail: Boolean of
    true:
    (
      GRDNH: Array[0..9] of Char;            //用户电脑号
      ZYH: Array[0..8] of Char;          //住院号
      JZBH: Array[0..15] of Char;         //记帐编号
      JLJE: Array[0..9] of Char;            //甲类金额
      YLJE: Array[0..9] of Char;            //乙类金额
      ZFJE: Array[0..9] of Char;            //自费金额
    );
    false:
    (
      MstInfo: Array[0..64] of Char;
    )
  end;
  TInpFeeDec = record                         //住院退费
  case Detail: Boolean of
    true:
    (
      GRDNH: Array[0..6] of Char;           //用户电脑号
      JZBH: Array[0..15] of Char;         //记帐编号
      CZYBH: Array[0..4] of Char;           //操作员工号
      TFSJ: Array[0..13] of Char;       //撤消时间
    );
    false:
    (
      MstInfo: Array[0..41] of Char;           
    )
  end;
  TInpFeeDec_XNH = record                         //住院退费
  case Detail: Boolean of
    true:
    (
      GRDNH: Array[0..9] of Char;           //用户电脑号
      JZBH: Array[0..15] of Char;         //记帐编号
      CZYBH: Array[0..4] of Char;           //操作员工号
      TFSJ: Array[0..13] of Char;       //撤消时间
    );
    false:
    (
      MstInfo: Array[0..45] of Char;           
    )
  end;
  TLeaveHos= record      //出院结算
  case Detail: Boolean of
    true:
    (
      GRDNH: Array[0..6] of Char;            //用户电脑号
      ZYH: Array[0..8] of Char;          //住院号
      JSLSH: Array[0..15] of Char;            //流水号
      CYSJ: Array[0..13] of Char;
      JZSJ: Array[0..13] of Char;
      CZYBH: Array[0..4] of Char;
      CYZT: Char;
      CYZD1: Array[0..29] of Char;         //入院诊断1
      CYZD2: Array[0..29] of Char;         //入院诊断2
      CYZD3: Array[0..29] of Char;         //入院诊断3
      CYLB: Char;
      YLFY: Array[0..10] of Char;
    );
    false:
    (
      MstInfo: Array[0..167] of Char;
    );
  end;
  TLeaveHos_ex= record      //出院结算
  case Detail: Boolean of
    true:
    (
      GRDNH: Array[0..13] of Char;            //用户电脑号
      ZYH: Array[0..8] of Char;          //住院号
      JSLSH: Array[0..15] of Char;            //流水号
      CYSJ: Array[0..13] of Char;
      JZSJ: Array[0..13] of Char;
      CZYBH: Array[0..4] of Char;
      CYZT: Char;
      CYZD1: Array[0..29] of Char;         //入院诊断1
      CYZD2: Array[0..29] of Char;         //入院诊断2
      CYZD3: Array[0..29] of Char;         //入院诊断3
      CYLB: Char;
      YLFY: Array[0..10] of Char;
      Bclb: Array[0..1] of Char;
    );
    false:
    (
      MstInfo: Array[0..176] of Char;
    );
  end;
  TLeaveHos_XNH= record      //新农合出院结算
  case Detail: Boolean of
    true:
    (
      GRDNH: Array[0..9] of Char;            //用户电脑号
      ZYH: Array[0..8] of Char;          //住院号
      JSLSH: Array[0..15] of Char;            //流水号
      CYSJ: Array[0..13] of Char;
      JZSJ: Array[0..13] of Char;
      CZYBH: Array[0..4] of Char;
      CYZT: Char;

      CYZD1: Array[0..29] of Char;         //入院诊断1
      CYZD2: Array[0..29] of Char;         //入院诊断2
      CYZD3: Array[0..29] of Char;         //入院诊断3
      CYLB: Char;
      YLFY: Array[0..10] of Char;
      BCLB: Array[0..1] of Char;            //补偿类别
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
      GRDNH: Array[0..6] of Char;           //个人电脑号
      ZYH: Array[0..8] of Char;          //住院号
      DFFS: Char;                          //垫付方式
      BNZYCS: Array[0..1] of Char;        //本年住院次数
      BNTCYZF: Array[0..10] of Char;  //本年统筹已支付金额
      YLZFY: Array[0..10] of Char;        //医疗总费用
      ZFJE: Array[0..10] of Char;            //自费金额
      YLJE: Array[0..9] of Char;            //乙类金额
      QFX: Array[0..9] of Char;           //起付线
      TCJJZF: Array[0..7] of Char;     //统筹基金支付
      GRZF: Array[0..9] of Char;     //个人自付
      DBBXJE: Array[0..10] of Char;    //大病救助报销金额
      DBGRZF: Array[0..10] of Char;    //大病救助自付金额
      CDBJE: Array[0..10] of Char;         //超大病金额
      GWYQFX: Array[0..10] of Char;     //起付线公务员补助
      GWYYLZF: Array[0..10] of Char;      //乙类公务员补助
      GWYGRZF: Array[0..10] of Char;    //基本医疗个人自付公务员补助
      GWYDB: Array[0..10] of Char;    //大病救助个人自付公务员补助
      GWYCDB: Array[0..10] of Char;  //超大病公务员补助
      KNYJE: Array[0..7] of Char;     //卡内原金额
      KZFJE: Array[0..7] of Char;       //IC支付金额
      DQKNJE: Array[0..7] of Char;   //当前卡内余额
      XJZFJE: Array[0..7] of Char;         //现金支付金额
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
      GRDNH: Array[0..6] of Char;           //个人电脑号
      ZYH: Array[0..8] of Char;          //住院号
      DFFS: Char;                          //垫付方式
      BNZYCS: Array[0..1] of Char;        //本年住院次数
      BNTCYZF: Array[0..10] of Char;  //本年统筹已支付金额
      YLZFY: Array[0..10] of Char;        //医疗总费用
      ZFJE: Array[0..10] of Char;            //自费金额
      YLJE: Array[0..9] of Char;            //乙类金额
      QFX: Array[0..9] of Char;           //起付线
      TCJJZF: Array[0..7] of Char;     //统筹基金支付
      GRZF: Array[0..9] of Char;     //个人自付
      DBBXJE: Array[0..10] of Char;    //大病救助报销金额
      DBGRZF: Array[0..10] of Char;    //大病救助自付金额
      CDBJE: Array[0..10] of Char;         //超大病金额
      GWYQFX: Array[0..10] of Char;     //起付线公务员补助
      GWYYLZF: Array[0..10] of Char;      //乙类公务员补助
      GWYGRZF: Array[0..10] of Char;    //基本医疗个人自付公务员补助
      GWYDB: Array[0..10] of Char;    //大病救助个人自付公务员补助
      GWYCDB: Array[0..10] of Char;  //超大病公务员补助
      TCJJZF_CW: Array[0..7] of Char;     //统筹基金支付
      GRZF_CW: Array[0..9] of Char;     //个人自付
      DBBXJE_CW: Array[0..10] of Char;    //大病救助报销金额
      DBGRZF_CW: Array[0..10] of Char;    //大病救助自付金额
      GWYGRZF_CW: Array[0..10] of Char;    //基本医疗个人自付公务员补助
      GWYDB_CW: Array[0..10] of Char;    //大病救助个人自付公务员补助
      GWYCDB_CW: Array[0..10] of Char;  //超大病公务员补助
      KNYJE: Array[0..7] of Char;     //卡内原金额
      KZFJE: Array[0..7] of Char;       //IC支付金额
      DQKNJE: Array[0..7] of Char;   //当前卡内余额
      XJZFJE: Array[0..7] of Char;         //现金支付金额
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
      GRDNH: Array[0..9] of Char;           //个人电脑号
      ZYH: Array[0..8] of Char;          //住院号
      DFFS: Char;                          //垫付方式
      BNZYCS: Array[0..1] of Char;        //本年住院次数
      BNTCYZF: Array[0..10] of Char;  //本年统筹已支付金额
      YLZFY: Array[0..10] of Char;        //医疗总费用
      ZFJE: Array[0..10] of Char;            //自费金额
      YLJE: Array[0..9] of Char;            //乙类金额
      QFX: Array[0..9] of Char;           //起付线
      TCJJZF: Array[0..7] of Char;     //统筹基金支付
      GRZF: Array[0..9] of Char;     //个人自付
      DBBXJE: Array[0..10] of Char;    //大病救助报销金额
      DBGRZF: Array[0..10] of Char;    //大病救助自付金额
      CDBJE: Array[0..10] of Char;         //超大病金额
      GWYQFX: Array[0..10] of Char;     //起付线公务员补助
      GWYYLZF: Array[0..10] of Char;      //乙类公务员补助
      GWYGRZF: Array[0..10] of Char;    //基本医疗个人自付公务员补助
      GWYDB: Array[0..10] of Char;    //大病救助个人自付公务员补助
      GWYCDB: Array[0..10] of Char;  //超大病公务员补助
      KNYJE: Array[0..7] of Char;     //卡内原金额
      KZFJE: Array[0..7] of Char;       //IC支付金额
      DQKNJE: Array[0..7] of Char;   //当前卡内余额
      XJZFJE: Array[0..7] of Char;         //现金支付金额
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
      grdnh: Array[0..6] of Char;           //个人电脑号
      zyh: Array[0..8] of Char;          //住院号
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
      grdnh: Array[0..13] of Char;           //个人电脑号
      zyh: Array[0..8] of Char;          //住院号
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
      grdnh: Array[0..9] of Char;           //个人电脑号
      zyh: Array[0..8] of Char;          //住院号
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
      grzf: Array[0..10] of Char;           //个人应付
      tczf: Array[0..10] of Char;          //医保支付
      qfx: Array[0..10] of Char;           //起付线
      jrdb: Array[0..10] of Char;          //进入大病
      gwybz: Array[0..10] of Char;         //公务员补贴
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
      grzf: Array[0..10] of Char;           //个人应付
      tczf: Array[0..10] of Char;          //医保支付
      qfx: Array[0..10] of Char;           //起付线
      jrdb: Array[0..10] of Char;          //进入大病
      gwybz: Array[0..10] of Char;         //公务员补贴
      syjjzf: Array[0..10] of Char;
      syjtts: Array[0..5] of Char;
      syjtzf: Array[0..10] of Char;
    );
    false:
    (
      MstInfo: Array[0..82] of Char;
    );
  end;
  TOutpTotal= record                         //门诊医保对总帐
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
  TOutpTotalRst= record                         //门诊医保对总帐返回
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
  TOutpList= record                         //门诊医保对明细帐
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
  TInpList= record                         //住院医保对明细帐
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
  TInpListNO= record                         //住院医保对明细帐
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
      BC: Array[0..3] of Char;            //包长
      JYM: Array[0..3] of Char;           //交易码
      GRDNH: Array[0..9] of Char;         //个人电脑号
      ZYH: Array[0..8] of Char;           //住院号
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
      BC: Array[0..3] of Char;            //包长
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
      Grdnh: Array[0..6] of Char;            //包长
      ZYH: Array[0..8] of Char;           //住院号
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
      Grdnh: Array[0..13] of Char;            //包长
      ZYH: Array[0..8] of Char;           //住院号
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
  {读用户信息}
  THis_User_Info=function(hisid:PChar;pid:PChar;s_userinfo:PChar;ic_flag: Integer): Integer;Stdcall;
  {市医保}
  THis_User_Info_Ays=function(hisid:PChar;pid:PChar;s_userinfo:PChar;ic_flag: Integer; area_code: PChar): Integer;Stdcall;
  {生育}
  THis_User_Inusrance_Info=function(hisid:PChar;pid:PChar;s_userinfo:PChar;ic_flag: Integer; area_code: PChar;mate_flag: Integer): Integer;Stdcall;
  {读家庭信息}
  THis_Family_Info= function(hisid:PChar;pid:PChar;s_userinfo:PChar;ic_flag: Integer): Integer;Stdcall;
  THis_Family_Info_LaqXnh= function(hisid:PChar;pid:PChar;s_userinfo:PChar;ic_flag: Integer): Integer;Stdcall;
  
  {门诊记帐}
  THis_Out_Tally=function (hisid:PChar;opman:PChar;Out_Tally_Info:PChar;Retun_Info:PChar): Integer;StdCall;
  {时间同步}
  THis_Synch_Time=function (hisid:PChar;Return_Info:PChar):Integer;StdCall;
  {入院登记}
  THis_Enrol=function (Hisid:Pchar;Enrol_Info: Pchar): Integer;StdCall;
  {换床换科}
  THis_Change_Sickbed=function (hisid:PChar;Change_Sickbed_Info:PChar): Integer;stdcall;
  {住院记帐}
  THis_BeinHos_Tally=function (hisid:PChar;BeginHos_Tally: PChar;Retun_Info: PChar): Integer;stdcall;
  {出院结算}
  THis_LeaveHos=function (hisid:PChar;LeaveHos_Info: PChar;Retun_Info: PChar;ic_flag: Integer): Integer;stdcall;
  {住院退费}
  THis_BeinHos_Refundment=function (hisid: PChar; BeinHos_Refundment_Info: PChar): Integer;stdcall;

  {门诊费用对明细帐}
  THis_Out_Collate_List=function (hisid:PChar;Out_Collate_List_Info: PChar;Retun_Info: PChar): Integer;StdCall;
  {门诊费用对总帐}
  THis_Out_Collate_Total=function (hisid:PChar;Out_Collate_Total_Info: PChar;Retun_Info: PChar): Integer;StdCall;
  {住院费用对明细帐(按住院号)}
  THis_In_Collate_List_No=function (hisid: PChar; In_Collate_List_Info_No: PChar;Retun_Info: Pchar): Integer;stdcall;
  {住院费用对明细帐}
  THis_In_Collate_List=function (hisid: PChar; In_Collate_List_Info: Pchar;Retun_Info: Pchar): Integer;StdCall;
  {住院费用对总帐}
  THis_In_Collate_Total=function (hisid: PChar; In_Collate_Total_Info: Pchar;Retun_Info: PChar): Integer;StdCall;
  {出院费用对总帐}
  THis_Leave_Collate_Total=function (hisid: PChar; Leave_Collate_Total_Info: PChar; Retun_Info: PChar): Integer;StdCall;
  (*个人应支付查询*)
  THis_Due=function (hisid: PChar; Due_Info: PChar; Retun_Info: PChar): Integer;StdCall;
  (*通用交易*)
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
  His_Family_Info: THis_Family_Info;                  //读家庭信息
  //His_Family_Info_LaqXnh: THis_Family_Info;
  //His_BeinHos_tally_LaqXnh: THis_BeinHos_tally;
  //His_BeinHos_Refundment_LaqXnh: THis_BeinHos_Refundment;
  His_User_Info: THis_User_Info;                      //读用户信息
  His_User_Info_Ays: THis_User_Info_Ays;                      //读用户信息
  His_User_Inusrance_Info: THis_User_Inusrance_Info;  //生育
  His_Out_Tally: THis_Out_Tally;                      //门诊记帐
  His_Synch_Time: THis_Synch_Time;                    //时间同步
  His_Enrol: THis_Enrol;                              //入院登记
  His_Change_Sickbed: THis_Change_Sickbed;            //换床换科
  His_BeinHos_Tally: THis_BeinHos_Tally;              //住院记帐
  His_LeaveHos: THis_LeaveHos;                        //出院结算
  His_BeinHos_Refundment: THis_BeinHos_Refundment;    //住院退费
  His_Out_Collate_List: THis_Out_Collate_List;        //门诊费用对明细帐
  His_Out_Collate_Total: THis_Out_Collate_Total;      //门诊费用对总帐
  His_In_Collate_List_No: THis_In_Collate_List_No;   //住院费用对明细帐(按住院号)
  His_In_Collate_List: THis_In_Collate_List;         //住院费用对明细帐
  His_In_Collate_Total: THis_In_Collate_Total;       //住院费用对总帐
  His_Leave_Collate_Total: THis_Leave_Collate_Total; //出院费用对总帐
  His_Due: THis_Due;                                 //个人应支付查询
  His_Inusrance_Enrol: THis_Inusrance_Enrol;         //生育备案
  His_Dis: THis_Dis;                                 //通用交易
  His_Disease: THis_Disease;
implementation
function Get_InsurInfo(ErrCode: Integer): String;
begin
  Result:= IntToStr(ErrCode);
end;
function Get_InsurInfo(Code: String; AType: Integer): String;
begin
  {1-卡状态 2-个人状态 3-支付状态}
  case AType of
    1:
    case StrToIntdef(Code,0) of
      0: result:= '正常';
      1: result:= '挂失';
      2: result:= '注销';
      3: result:= '止付';
      4: result:= '未发卡';
      5: result:= '错卡';
    end;
    2:
    case StrToIntdef(Code,1) of
      1: result:= '在职';
      2: result:= '退休';
      3: result:= '二乙';
      4: result:= '离休';
    end;
    3:
    case StrToIntdef(Code,0) of
      0: result:= '正常';
      1: result:= '统筹基金黑名单';
      2: result:= '个人账户黑名单';
      3: result:= '全黑';
      4: result:= 'IC卡非法';
    end;
    4:
    case StrToIntdef(Code,1) of
      1: result:= '一般农户';
      2: result:= '五保户';
      3: result:= '贫困户';
      4: result:= '特困户';
      5: result:= '军烈属';
      9: result:= '其他户';
    end;
    5:
    case StrToIntdef(Code,1) of
      1: result:= '男';
      2: result:= '女';
      9: result:= '其他';
    end;
  end;
end;

initialization
  ICDLl:= 'IC.Dll';
  //HisID:= 'Y003';
end.
