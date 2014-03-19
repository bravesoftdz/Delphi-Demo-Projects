-- Create table
create table EMR_BLMBFL
(
  FLBH varchar2(20) not null,
  FLMC varchar2(20) not null,
  SXYQ NUMBER default 0 not null
)
;
-- Add comments to the table 
comment on table EMR_BLMBFL
  is '病历模板分类';
-- Add comments to the columns 
comment on column EMR_BLMBFL.FLBH
  is '分类编号(主键)';
comment on column EMR_BLMBFL.FLMC
  is '分类名称(按卫生部要求)';
comment on column EMR_BLMBFL.SXYQ
  is '时限要求(小时)';
-- Create/Recreate primary, unique and foreign key constraints 
alter table EMR_BLMBFL
  add constraint P_EMR_BLMBFL primary key (FLBH);
  
-- Create table
create table EMR_BLMBLX
(
  LXBH varchar2(20) not null,
  LXMC varchar2(20) not null
)
;
-- Add comments to the table 
comment on table EMR_BLMBLX
  is '病历模板类型';
-- Add comments to the columns 
comment on column EMR_BLMBLX.LXBH
  is '类型编号(主键)';
comment on column EMR_BLMBLX.LXMC
  is '类型名称(全院、科室、个人、学习)';
-- Create/Recreate primary, unique and foreign key constraints 
alter table EMR_BLMBLX
  add constraint P_EMR_BLMBLX primary key (LXBH);  
    
-- Create table
create table EMR_BLMB
(
  MBID VARCHAR2(20) not null,
  SSFL VARCHAR2(20),
  SSLX VARCHAR2(20),
  MBMC VARCHAR2(100) not null,
  SYXB VARCHAR2(1) default '3',
  SYBZ VARCHAR2(20) default '*' not null,
  MBWJ BLOB not null,
  MS   VARCHAR2(1024),
  SSKS VARCHAR2(20) default '*' not null,
  CJR  VARCHAR2(20) not null,
  CJSJ date not null
)
;
-- Add comments to the table 
comment on table EMR_BLMB
  is '病历模板';
-- Add comments to the columns 
comment on column EMR_BLMB.MBID
  is '模板id(主键)';
comment on column EMR_BLMB.SSFL
  is '所属分类';
comment on column EMR_BLMB.SSLX
  is '所属类型';
comment on column EMR_BLMB.MBMC
  is '模板名称';
comment on column EMR_BLMB.SYXB
  is '适用性别';
comment on column EMR_BLMB.SYBZ
  is '适用病种';
comment on column EMR_BLMB.MBWJ
  is '模板文件';
comment on column EMR_BLMB.MS
  is '描述-注释';
comment on column EMR_BLMB.SSKS
  is '所属科室(全院*)-外链至科室字典';
comment on column EMR_BLMB.CJR
  is '创建人员-外链至工作人员字典';
comment on column EMR_BLMB.CJSJ
  is '创建时间';
-- Create/Recreate primary, unique and foreign key constraints 
alter table EMR_BLMB
  add constraint P_EMR_BLMB primary key (MBID);
alter table EMR_BLMB
  add constraint F_EMR_BLMBFL foreign key (SSFL)
  references EMR_BLMBFL (FLBH) on delete set null;
alter table EMR_BLMB
  add constraint F_EMR_BLMBLX foreign key (SSLX)
  references EMR_BLMBLX (LXBH) on delete set null;
  
-- Create table
create table EMR_MBSQ
(
  MBID VARCHAR2(20) not null,
  QXRY VARCHAR2(20) not null,
  YXSJ date not null
)
;
-- Add comments to the table 
comment on table EMR_MBSQ
  is '模板授权';
-- Add comments to the columns 
comment on column EMR_MBSQ.MBID
  is '模板id';
comment on column EMR_MBSQ.QXRY
  is '权限人员-外链到工作人员字典';
comment on column EMR_MBSQ.YXSJ
  is '有效时间';
-- Create/Recreate primary, unique and foreign key constraints 
alter table EMR_MBSQ
  add constraint P_EMR_MBSQ primary key (MBID, QXRY);

-- Create table
create table EMR_BL
(
  BLID   VARCHAR2(20) not null,
  ZYH    VARCHAR2(20) not null,
  BLMC   VARCHAR2(20) not null,
  SSFL   VARCHAR2(20) not null,
  WJMC   VARCHAR2(20) not null,
  WJNR   BLOB not null,
  CJYS   VARCHAR2(20) not null,
  CJSJ   DATE not null,
  ZHXGYS VARCHAR2(20),
  ZHXGSJ DATE,
  ZT     VARCHAR2(20) not null,
  QMYS   VARCHAR2(20),
  QMYSXM VARCHAR2(20),
  QMSJ   DATE,
  DYCS   NUMBER default 0 not null,
  ZHDYSJ DATE,
  BLWCQX DATE,
  XMLNR  XMLTYPE not null
)
;
-- Add comments to the table 
comment on table EMR_BL
  is '病历保存主表';
-- Add comments to the columns 
comment on column EMR_BL.BLID
  is '病历id(主键)';
comment on column EMR_BL.ZYH
  is '住院号';
comment on column EMR_BL.BLMC
  is '病历名称';
comment on column EMR_BL.SSFL
  is '所属分类';
comment on column EMR_BL.WJMC
  is '文件名称';
comment on column EMR_BL.WJNR
  is '文件内容';
comment on column EMR_BL.CJYS
  is '创建医生';
comment on column EMR_BL.CJSJ
  is '创建时间';
comment on column EMR_BL.ZHXGYS
  is '最后修改医生';
comment on column EMR_BL.ZHXGSJ
  is '最后修改时间';
comment on column EMR_BL.ZT
  is '状态';
comment on column EMR_BL.QMYS
  is '签名医生id';
comment on column EMR_BL.QMYSXM
  is '签名医生姓名';
comment on column EMR_BL.QMSJ
  is '签名时间';
comment on column EMR_BL.DYCS
  is '打印次数';
comment on column EMR_BL.ZHDYSJ
  is '最后打印时间';
comment on column EMR_BL.BLWCQX
  is '病历完成期限';
comment on column EMR_BL.XMLNR
  is 'XML内容';
-- Create/Recreate primary, unique and foreign key constraints 
alter table EMR_BL
  add constraint P_EMR_BL primary key (BLID);

-- Create table
create table EMR_JGHBL
(
  BLID    VARCHAR2(20) not null,
  BLNRXLH VARCHAR2(20) not null,
  JGLX    VARCHAR2(50) not null,
  JGZ     VARCHAR2(1024),
  FXLH    VARCHAR2(20) not null
)
;
-- Add comments to the table 
comment on table EMR_JGHBL
  is '结构化病历树表';
-- Add comments to the columns 
comment on column EMR_JGHBL.BLID
  is '病历ID';
comment on column EMR_JGHBL.BLNRXLH
  is '病历内容序列号';
comment on column EMR_JGHBL.JGLX
  is '结构类型(Section/text/Combox/ListBox/自由文本/…)';
comment on column EMR_JGHBL.JGZ
  is '结构值';
comment on column EMR_JGHBL.FXLH
  is '父序列号';
-- Create/Recreate primary, unique and foreign key constraints 
alter table EMR_JGHBL
  add constraint P_EMR_JGHBL primary key (BLID, BLNRXLH);

  
-- Create table
create table EMR_BLNRLB
(
  LBBH  VARCHAR2(20) not null,
  LBMC  VARCHAR2(100) not null,
  PLBBH VARCHAR2(20) default '0' not null
)
;
-- Add comments to the table 
comment on table EMR_BLNRLB
  is '病历内容类别(树表)';
-- Add comments to the columns 
comment on column EMR_BLNRLB.LBBH
  is '类别编号';
comment on column EMR_BLNRLB.LBMC
  is '类别名称';
comment on column EMR_BLNRLB.PLBBH
  is '父类别编号';
-- Create/Recreate primary, unique and foreign key constraints 
alter table EMR_BLNRLB
  add constraint P_EMR_BLNRLB primary key (LBBH);


-- Create table
create table EMR_NRPD
(
  NRBH VARCHAR2(20) not null,
  SSLB VARCHAR2(20) not null,
  NRGS VARCHAR2(1024) not null
)
;
-- Add comments to the table 
comment on table EMR_NRPD
  is '内容片断';
-- Add comments to the columns 
comment on column EMR_NRPD.NRBH
  is '编号';
comment on column EMR_NRPD.SSLB
  is '所属类别';
comment on column EMR_NRPD.NRGS
  is '概述';
-- Create/Recreate primary, unique and foreign key constraints 
alter table EMR_NRPD
  add constraint P_EMR_NRPD primary key (NRBH);

-- Create table
create table EMR_NRPDXL
(
  NRBH  VARCHAR2(20) not null,
  NRXLH VARCHAR2(20) not null,
  ZLX   VARCHAR2(1) not null,
  YSID  VARCHAR2(20),
  YSZ   VARCHAR2(1024)
)
;
-- Add comments to the table 
comment on table EMR_NRPDXL
  is '内容片断序列';
-- Add comments to the columns 
comment on column EMR_NRPDXL.NRBH
  is '编号';
comment on column EMR_NRPDXL.NRXLH
  is '序列号';
comment on column EMR_NRPDXL.ZLX
  is '值类型-0自由文本/1元素';
comment on column EMR_NRPDXL.YSID
  is '元素id';
comment on column EMR_NRPDXL.YSZ
  is '值-如果是自由文本则存储自由文本';
-- Create/Recreate primary, unique and foreign key constraints 
alter table EMR_NRPDXL
  add constraint P_EMR_NRPDXL primary key (NRBH, NRXLH);

-- Create table
create table EMR_BLYS
(
  YSBH    VARCHAR2(20) not null,
  YSSM    VARCHAR2(100) not null,
  YSLBBH  VARCHAR2(20),
  YSQZ    VARCHAR2(1024),
  YSHZ    VARCHAR2(1024),
  LX      VARCHAR2(2) not null,
  SFXSBK  VARCHAR2(1) default '1',
  ZBKZ    VARCHAR2(2),
  YBKZ    VARCHAR2(2),
  SFYXSC  VARCHAR2(1) default '1',
  SFYXXG  VARCHAR2(1) default '1',
  MRZ     VARCHAR2(1024),
  YSJB    VARCHAR2(1) default '1' not null,
  XTYSDZ  VARCHAR2(50),
  SFBMLL  VARCHAR2(1) default '0',
  SFKJ    VARCHAR2(1) default '1',
  SFXML   VARCHAR2(1) default '1',
  SFBTX   VARCHAR2(1) default '1',
  WBKZDCD NUMBER,
  SZKZDZ  NUMBER,
  SZKZXZ  NUMBER,
  SZKJD   NUMBER,
  SZKDW   VARCHAR2(20),
  XZKBT   VARCHAR2(50),
  RQKGS   VARCHAR2(50),
  RQKQSSJ VARCHAR2(50),
  RQKZZSJ VARCHAR2(50)
)
;
-- Add comments to the table 
comment on table EMR_BLYS
  is '病历元素';
-- Add comments to the columns 
comment on column EMR_BLYS.YSBH
  is '元素编号(主键)';
comment on column EMR_BLYS.YSSM
  is '元素说明- 元素名称/概述/注释相关信息';
comment on column EMR_BLYS.YSLBBH
  is '所属类别编号(外键)';
comment on column EMR_BLYS.YSQZ
  is '前值';
comment on column EMR_BLYS.YSHZ
  is '后值';
comment on column EMR_BLYS.LX
  is '类型(外键)';
comment on column EMR_BLYS.SFXSBK
  is '是否显示边框';
comment on column EMR_BLYS.ZBKZ
  is '左边框值';
comment on column EMR_BLYS.YBKZ
  is '右边框值';
comment on column EMR_BLYS.SFYXSC
  is '是否允许删除';
comment on column EMR_BLYS.SFYXXG
  is '是否允许修改';
comment on column EMR_BLYS.MRZ
  is '默认值';
comment on column EMR_BLYS.YSJB
  is '元素级别-0系统/1自定义';
comment on column EMR_BLYS.XTYSDZ
  is '系统元素对照在系统元素视图中所对应的列名';
comment on column EMR_BLYS.SFBMLL
  is '是否保密浏览';
comment on column EMR_BLYS.SFKJ
  is '是否可见';
comment on column EMR_BLYS.SFXML
  is '是否在XML显示';
comment on column EMR_BLYS.SFBTX
  is '是否是必填项';
comment on column EMR_BLYS.WBKZDCD
  is '文本框最大长度';
comment on column EMR_BLYS.SZKZDZ
  is '数字框最大值';
comment on column EMR_BLYS.SZKZXZ
  is '数字框最小值';
comment on column EMR_BLYS.SZKJD
  is '数字框精度';
comment on column EMR_BLYS.SZKDW
  is '数字框单位';
comment on column EMR_BLYS.XZKBT
  is '选择框标题';
comment on column EMR_BLYS.RQKGS
  is '日期框格式';
comment on column EMR_BLYS.RQKQSSJ
  is '日期框起始时间';
comment on column EMR_BLYS.RQKZZSJ
  is '日期框终止时间';
-- Create/Recreate primary, unique and foreign key constraints 
alter table EMR_BLYS
  add constraint P_EMR_BLYS primary key (YSBH);
alter table EMR_BLYS
  add constraint F_EMR_KJLX foreign key (LX)
  references EMR_KJLX (KJBM);
alter table EMR_BLYS
  add constraint F_EMR_YSLBBH foreign key (YSLBBH)
  references EMR_BLNRLB (LBBH) on delete set null;

-- Create table
create table EMR_BLYSXL
(
  YSBH  VARCHAR2(20) not null,
  YSXLH VARCHAR2(20) not null,
  KXZ   VARCHAR2(1024) not null
)
;
-- Add comments to the table 
comment on table EMR_BLYSXL
  is '病历元素类型';
-- Add comments to the columns 
comment on column EMR_BLYSXL.YSBH
  is '元素编号';
comment on column EMR_BLYSXL.YSXLH
  is '序列号';
comment on column EMR_BLYSXL.KXZ
  is '可选值';
-- Create/Recreate primary, unique and foreign key constraints 
alter table EMR_BLYSXL
  add constraint P_EMR_BLYSXL primary key (YSBH, YSXLH);
alter table EMR_BLYSXL
  add constraint F_EMR_BLYSBH foreign key (YSBH)
  references EMR_BLYS (YSBH) on delete cascade;

-- Create table
create table EMR_KJLX
(
  KJBM VARCHAR2(2) not null,
  KJLX VARCHAR2(20) not null
)
;
-- Add comments to the table 
comment on table EMR_KJLX
  is '控件类型表';
-- Add comments to the columns 
comment on column EMR_KJLX.KJBM
  is '控件编码';
comment on column EMR_KJLX.KJLX
  is '控件类型';
-- Create/Recreate primary, unique and foreign key constraints 
alter table EMR_KJLX
  add constraint P_EMR_KJLX primary key (KJBM);
  
insert into emr_kjlx (KJBM, KJLX)
values ('1', '单选框');

insert into emr_kjlx (KJBM, KJLX)
values ('2', '列表框');

insert into emr_kjlx (KJBM, KJLX)
values ('3', '文本框');

insert into emr_kjlx (KJBM, KJLX)
values ('4', '选择框');

insert into emr_kjlx (KJBM, KJLX)
values ('5', '数字框');

insert into emr_kjlx (KJBM, KJLX)
values ('6', '多选框');

insert into emr_kjlx (KJBM, KJLX)
values ('7', '多选列表框');

insert into emr_kjlx (KJBM, KJLX)
values ('8', '日期时间框');
  
-- Create sequence 
create sequence EMR_YSBM_IDENTITY
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20
order;

-- Create sequence 
create sequence EMR_MBID_IDENTITY
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20
order;

-- Create table
create table EMR_MBSYBZ
(
  MBID  VARCHAR2(20) not null,
  ICDBM VARCHAR2(10) not null
)
;
-- Add comments to the table 
comment on table EMR_MBSYBZ
  is '病历模板适用病种';
-- Add comments to the columns 
comment on column EMR_MBSYBZ.MBID
  is '模板ID';
comment on column EMR_MBSYBZ.ICDBM
  is '模板适用的病种的ICD编码';
-- Create/Recreate primary, unique and foreign key constraints 
alter table EMR_MBSYBZ
  add constraint P_EMR_MBSYBZ primary key (MBID, ICDBM);
alter table EMR_MBSYBZ
  add constraint F_EMR_BLMB foreign key (MBID)
  references EMR_BLMB (MBID) on delete cascade;
alter table EMR_MBSYBZ
  add constraint F_XT_ZD_JB foreign key (ICDBM)
  references XT_ZD_JB (ZDDM) on delete cascade;
