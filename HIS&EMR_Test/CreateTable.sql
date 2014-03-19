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
  is '����ģ�����';
-- Add comments to the columns 
comment on column EMR_BLMBFL.FLBH
  is '������(����)';
comment on column EMR_BLMBFL.FLMC
  is '��������(��������Ҫ��)';
comment on column EMR_BLMBFL.SXYQ
  is 'ʱ��Ҫ��(Сʱ)';
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
  is '����ģ������';
-- Add comments to the columns 
comment on column EMR_BLMBLX.LXBH
  is '���ͱ��(����)';
comment on column EMR_BLMBLX.LXMC
  is '��������(ȫԺ�����ҡ����ˡ�ѧϰ)';
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
  is '����ģ��';
-- Add comments to the columns 
comment on column EMR_BLMB.MBID
  is 'ģ��id(����)';
comment on column EMR_BLMB.SSFL
  is '��������';
comment on column EMR_BLMB.SSLX
  is '��������';
comment on column EMR_BLMB.MBMC
  is 'ģ������';
comment on column EMR_BLMB.SYXB
  is '�����Ա�';
comment on column EMR_BLMB.SYBZ
  is '���ò���';
comment on column EMR_BLMB.MBWJ
  is 'ģ���ļ�';
comment on column EMR_BLMB.MS
  is '����-ע��';
comment on column EMR_BLMB.SSKS
  is '��������(ȫԺ*)-�����������ֵ�';
comment on column EMR_BLMB.CJR
  is '������Ա-������������Ա�ֵ�';
comment on column EMR_BLMB.CJSJ
  is '����ʱ��';
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
  is 'ģ����Ȩ';
-- Add comments to the columns 
comment on column EMR_MBSQ.MBID
  is 'ģ��id';
comment on column EMR_MBSQ.QXRY
  is 'Ȩ����Ա-������������Ա�ֵ�';
comment on column EMR_MBSQ.YXSJ
  is '��Чʱ��';
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
  is '������������';
-- Add comments to the columns 
comment on column EMR_BL.BLID
  is '����id(����)';
comment on column EMR_BL.ZYH
  is 'סԺ��';
comment on column EMR_BL.BLMC
  is '��������';
comment on column EMR_BL.SSFL
  is '��������';
comment on column EMR_BL.WJMC
  is '�ļ�����';
comment on column EMR_BL.WJNR
  is '�ļ�����';
comment on column EMR_BL.CJYS
  is '����ҽ��';
comment on column EMR_BL.CJSJ
  is '����ʱ��';
comment on column EMR_BL.ZHXGYS
  is '����޸�ҽ��';
comment on column EMR_BL.ZHXGSJ
  is '����޸�ʱ��';
comment on column EMR_BL.ZT
  is '״̬';
comment on column EMR_BL.QMYS
  is 'ǩ��ҽ��id';
comment on column EMR_BL.QMYSXM
  is 'ǩ��ҽ������';
comment on column EMR_BL.QMSJ
  is 'ǩ��ʱ��';
comment on column EMR_BL.DYCS
  is '��ӡ����';
comment on column EMR_BL.ZHDYSJ
  is '����ӡʱ��';
comment on column EMR_BL.BLWCQX
  is '�����������';
comment on column EMR_BL.XMLNR
  is 'XML����';
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
  is '�ṹ����������';
-- Add comments to the columns 
comment on column EMR_JGHBL.BLID
  is '����ID';
comment on column EMR_JGHBL.BLNRXLH
  is '�����������к�';
comment on column EMR_JGHBL.JGLX
  is '�ṹ����(Section/text/Combox/ListBox/�����ı�/��)';
comment on column EMR_JGHBL.JGZ
  is '�ṹֵ';
comment on column EMR_JGHBL.FXLH
  is '�����к�';
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
  is '�����������(����)';
-- Add comments to the columns 
comment on column EMR_BLNRLB.LBBH
  is '�����';
comment on column EMR_BLNRLB.LBMC
  is '�������';
comment on column EMR_BLNRLB.PLBBH
  is '�������';
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
  is '����Ƭ��';
-- Add comments to the columns 
comment on column EMR_NRPD.NRBH
  is '���';
comment on column EMR_NRPD.SSLB
  is '�������';
comment on column EMR_NRPD.NRGS
  is '����';
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
  is '����Ƭ������';
-- Add comments to the columns 
comment on column EMR_NRPDXL.NRBH
  is '���';
comment on column EMR_NRPDXL.NRXLH
  is '���к�';
comment on column EMR_NRPDXL.ZLX
  is 'ֵ����-0�����ı�/1Ԫ��';
comment on column EMR_NRPDXL.YSID
  is 'Ԫ��id';
comment on column EMR_NRPDXL.YSZ
  is 'ֵ-����������ı���洢�����ı�';
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
  is '����Ԫ��';
-- Add comments to the columns 
comment on column EMR_BLYS.YSBH
  is 'Ԫ�ر��(����)';
comment on column EMR_BLYS.YSSM
  is 'Ԫ��˵��- Ԫ������/����/ע�������Ϣ';
comment on column EMR_BLYS.YSLBBH
  is '���������(���)';
comment on column EMR_BLYS.YSQZ
  is 'ǰֵ';
comment on column EMR_BLYS.YSHZ
  is '��ֵ';
comment on column EMR_BLYS.LX
  is '����(���)';
comment on column EMR_BLYS.SFXSBK
  is '�Ƿ���ʾ�߿�';
comment on column EMR_BLYS.ZBKZ
  is '��߿�ֵ';
comment on column EMR_BLYS.YBKZ
  is '�ұ߿�ֵ';
comment on column EMR_BLYS.SFYXSC
  is '�Ƿ�����ɾ��';
comment on column EMR_BLYS.SFYXXG
  is '�Ƿ������޸�';
comment on column EMR_BLYS.MRZ
  is 'Ĭ��ֵ';
comment on column EMR_BLYS.YSJB
  is 'Ԫ�ؼ���-0ϵͳ/1�Զ���';
comment on column EMR_BLYS.XTYSDZ
  is 'ϵͳԪ�ض�����ϵͳԪ����ͼ������Ӧ������';
comment on column EMR_BLYS.SFBMLL
  is '�Ƿ������';
comment on column EMR_BLYS.SFKJ
  is '�Ƿ�ɼ�';
comment on column EMR_BLYS.SFXML
  is '�Ƿ���XML��ʾ';
comment on column EMR_BLYS.SFBTX
  is '�Ƿ��Ǳ�����';
comment on column EMR_BLYS.WBKZDCD
  is '�ı�����󳤶�';
comment on column EMR_BLYS.SZKZDZ
  is '���ֿ����ֵ';
comment on column EMR_BLYS.SZKZXZ
  is '���ֿ���Сֵ';
comment on column EMR_BLYS.SZKJD
  is '���ֿ򾫶�';
comment on column EMR_BLYS.SZKDW
  is '���ֿ�λ';
comment on column EMR_BLYS.XZKBT
  is 'ѡ������';
comment on column EMR_BLYS.RQKGS
  is '���ڿ��ʽ';
comment on column EMR_BLYS.RQKQSSJ
  is '���ڿ���ʼʱ��';
comment on column EMR_BLYS.RQKZZSJ
  is '���ڿ���ֹʱ��';
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
  is '����Ԫ������';
-- Add comments to the columns 
comment on column EMR_BLYSXL.YSBH
  is 'Ԫ�ر��';
comment on column EMR_BLYSXL.YSXLH
  is '���к�';
comment on column EMR_BLYSXL.KXZ
  is '��ѡֵ';
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
  is '�ؼ����ͱ�';
-- Add comments to the columns 
comment on column EMR_KJLX.KJBM
  is '�ؼ�����';
comment on column EMR_KJLX.KJLX
  is '�ؼ�����';
-- Create/Recreate primary, unique and foreign key constraints 
alter table EMR_KJLX
  add constraint P_EMR_KJLX primary key (KJBM);
  
insert into emr_kjlx (KJBM, KJLX)
values ('1', '��ѡ��');

insert into emr_kjlx (KJBM, KJLX)
values ('2', '�б��');

insert into emr_kjlx (KJBM, KJLX)
values ('3', '�ı���');

insert into emr_kjlx (KJBM, KJLX)
values ('4', 'ѡ���');

insert into emr_kjlx (KJBM, KJLX)
values ('5', '���ֿ�');

insert into emr_kjlx (KJBM, KJLX)
values ('6', '��ѡ��');

insert into emr_kjlx (KJBM, KJLX)
values ('7', '��ѡ�б��');

insert into emr_kjlx (KJBM, KJLX)
values ('8', '����ʱ���');
  
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
  is '����ģ�����ò���';
-- Add comments to the columns 
comment on column EMR_MBSYBZ.MBID
  is 'ģ��ID';
comment on column EMR_MBSYBZ.ICDBM
  is 'ģ�����õĲ��ֵ�ICD����';
-- Create/Recreate primary, unique and foreign key constraints 
alter table EMR_MBSYBZ
  add constraint P_EMR_MBSYBZ primary key (MBID, ICDBM);
alter table EMR_MBSYBZ
  add constraint F_EMR_BLMB foreign key (MBID)
  references EMR_BLMB (MBID) on delete cascade;
alter table EMR_MBSYBZ
  add constraint F_XT_ZD_JB foreign key (ICDBM)
  references XT_ZD_JB (ZDDM) on delete cascade;
