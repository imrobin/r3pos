alter table RCK_C_GOODS_DAYS add SALES_STYLE varchar (36);
--ȫ��ʼ�����ŵ�����
update RCK_C_GOODS_DAYS set SALES_STYLE='6BD82B9E-3678-4F33-89ED-B8C26B6589BD';

drop table SAL_INVOICE_BOOK;
--��Ʊ������
CREATE TABLE SAL_INVOICE_BOOK (
        --��ҵ����
	TENANT_ID int NOT NULL ,
        --��ˮID��
	INVH_ID char (36) NOT NULL ,
        --�����ŵ�
	SHOP_ID varchar (13) NOT NULL ,
        --���ò���
	DEPT_ID varchar (12) NOT NULL ,
        --��Ʊ����
	INVOICE_FLAG varchar (1) ,
        --������
	CREA_USER varchar(36) NOT NULL ,
        --��������
	CREA_DATE int NOT NULL ,
        --��ע
	REMARK varchar (100) ,
        --��Ʊ����
	INVH_NO varchar (50) NOT NULL ,
        --��ǰƱ��
	CURRENT_NO int ,
        --��Ʊ��ʼ��
	BEGIN_NO int NOT NULL ,
        --��Ʊ��ֹ��
	ENDED_NO int NOT NULL ,
        --�ϼ�����
	TOTAL_AMT int ,
        --��Ʊ����
	USING_AMT int ,
        --��������
	CANCEL_AMT int ,
        --��������
	BALANCE int ,
        --ͨѶ��־
	COMM varchar (2) NOT NULL DEFAULT '00',
        --ʱ��� 
  TIME_STAMP bigint NOT NULL,
	CONSTRAINT PK_SAL_INV_BOOK PRIMARY KEY   
	(
		TENANT_ID,INVH_ID
	) 
);

CREATE INDEX IX_IVBK_TENANT_ID ON SAL_INVOICE_BOOK(TENANT_ID);
CREATE INDEX IX_IVBK_TIME_STAMP ON SAL_INVOICE_BOOK(TENANT_ID,TIME_STAMP);
CREATE INDEX IX_IVBK_CREA_DATE ON SAL_INVOICE_BOOK(CREA_DATE);
CREATE INDEX IX_IVBK_SHOP_ID ON SAL_INVOICE_BOOK(TENANT_ID,SHOP_ID);


--����ȯ����
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('1','��ȯ','VOUCHER_TYPE','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('2','�ֽ�ȯ','VOUCHER_TYPE','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('3','����ȯ','VOUCHER_TYPE','00',5497000);

insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('1','���','VOUCHER_STATUS','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('2','����','VOUCHER_STATUS','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('3','����','VOUCHER_STATUS','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('4','����','VOUCHER_STATUS','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('5','����','VOUCHER_STATUS','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('6','����','VOUCHER_STATUS','00',5497000);

--����ȯ���
CREATE TABLE SAL_VOUCHERORDER (
        --��ҵ����
	TENANT_ID int NOT NULL ,
        --��ⵥ��
	VOUCHER_ID char (36) NOT NULL ,
        --����ŵ�
	SHOP_ID varchar (13) NOT NULL ,
        --��ⲿ��
	DEPT_ID varchar (12) NOT NULL ,
        --����ȯ����
	VOUCHER_TYPE varchar (1) NOT NULL ,
        --�������
	INTO_DATE int NOT NULL ,
        --������
	INTO_USER varchar (36) ,
	
        --����ʱ��
	CREA_DATE varchar (30) ,
        --������Ա
	CREA_USER varchar (36) ,
        --��ע
	REMARK varchar (100) ,
        --ͨѶ��־
	COMM varchar (2) NOT NULL DEFAULT '00',
        --ʱ��� 
  TIME_STAMP bigint NOT NULL,
	CONSTRAINT PK_SAL_VCHORDER PRIMARY KEY   
	(
		TENANT_ID,VOUCHER_ID
	) 
);

CREATE INDEX IX_VCHR_TENANT_ID ON SAL_VOUCHERORDER(TENANT_ID);
CREATE INDEX IX_VCHR_TIME_STAMP ON SAL_VOUCHERORDER(TENANT_ID,TIME_STAMP);
CREATE INDEX IX_VCHR_INTO_DATE ON SAL_VOUCHERORDER(INTO_DATE);

--����ȯ����
CREATE TABLE SAL_VOUCHERDATA (
        --��ҵ����
	TENANT_ID int NOT NULL ,
        --��ⵥ��
	VOUCHER_ID char (36) NOT NULL ,
        --��α��
	BARCODE varchar (50) NOT NULL ,
        --����ȯ����
	VOUCHER_TYPE varchar (1) ,
        --��ֵ
	VOUCHER_PRC int NOT NULL ,
        --״̬
	VOUCHER_STATUS char (1) NOT NULL ,
        --��Ч��
	VAILD_DATE int NOT NULL ,
        --����ȯʱ����˭����
	CLIENT_ID varchar (36) NOT NULL ,
        --ͨѶ��־
	COMM varchar (2) NOT NULL DEFAULT '00',
        --ʱ��� 
  TIME_STAMP bigint NOT NULL,
	CONSTRAINT PK_SAL_VOUCHERDATA PRIMARY KEY   
	(
		TENANT_ID,BARCODE
	) 
);

CREATE INDEX IX_VCHD_TENANT_ID ON SAL_VOUCHERDATA(TENANT_ID);
CREATE INDEX IX_VCHD_TIME_STAMP ON SAL_VOUCHERDATA(TENANT_ID,TIME_STAMP);
CREATE INDEX IX_VCHD_VOUCHER_ID ON SAL_VOUCHERDATA(TENANT_ID,VOUCHER_ID);

--����ȯ����
CREATE TABLE SAL_VHLEADORDER (
        --��ҵ����
	TENANT_ID int NOT NULL ,
        --���õ���
	VHLEAD_ID char (36) NOT NULL ,
        --�����ŵ�
	SHOP_ID varchar (13) NOT NULL ,
        --���ò���
	DEPT_ID varchar (12) NOT NULL ,
        --��������
	LEAD_DATE int NOT NULL ,
        --������
	LEAD_USER varchar (36) ,
	
        --����ʱ��
	CREA_DATE varchar (30) ,
        --������Ա
	CREA_USER varchar (36) ,
        --��ע
	REMARK varchar (100) ,
        --ͨѶ��־
	COMM varchar (2) NOT NULL DEFAULT '00',
        --ʱ��� 
  TIME_STAMP bigint NOT NULL,
	CONSTRAINT PK_SAL_VHLDORDER PRIMARY KEY   
	(
		TENANT_ID,VHLEAD_ID
	) 
);

CREATE INDEX IX_VHLD_TENANT_ID ON SAL_VHLEADORDER(TENANT_ID);
CREATE INDEX IX_VHLD_TIME_STAMP ON SAL_VHLEADORDER(TENANT_ID,TIME_STAMP);
CREATE INDEX IX_VHLD_LEAD_DATE ON SAL_VHLEADORDER(LEAD_DATE);

--����ȯ����
CREATE TABLE SAL_VHLEADDATA (
        --��ҵ����
	TENANT_ID int NOT NULL ,
        --���õ���
	VHLEAD_ID char (36) NOT NULL ,
        --��α��
	BARCODE varchar (50) NOT NULL ,
        --��ֵ
	VOUCHER_PRC int NOT NULL ,
	CONSTRAINT PK_SAL_VHLEADDATA PRIMARY KEY   
	(
		TENANT_ID,VHLEAD_ID,BARCODE
	) 
);

CREATE INDEX IX_VHDD_TENANT_ID ON SAL_VHLEADDATA(TENANT_ID);
CREATE INDEX IX_VHDD_VHLEAD_ID ON SAL_VHLEADDATA(TENANT_ID,VHLEAD_ID);


--����ȯ����
CREATE TABLE SAL_VHSENDORDER (
        --��ҵ����
	TENANT_ID int NOT NULL ,
        --���ŵ���
	VHSEND_ID char (36) NOT NULL ,
        --�����ŵ�
	SHOP_ID varchar (13) NOT NULL ,
        --���Ų���
	DEPT_ID varchar (12) NOT NULL ,
        --�ͻ�
	CLIENT_ID varchar (36) NOT NULL ,
        --��������
	SEND_DATE int NOT NULL ,
        --������
	SEND_USER varchar (36) ,
        --��ֵ���
	VOUCHER_TTL decimal(18, 3) ,
        --ʵ�ս��
	VOUCHER_MNY decimal(18, 3) ,
	
        --����ʱ��
	CREA_DATE varchar (30) ,
        --������Ա
	CREA_USER varchar (36) ,
        --��ע
	REMARK varchar (100) ,
        --ͨѶ��־
	COMM varchar (2) NOT NULL DEFAULT '00',
        --ʱ��� 
  TIME_STAMP bigint NOT NULL,
	CONSTRAINT PK_SAL_VHSDORDER PRIMARY KEY   
	(
		TENANT_ID,VHSEND_ID
	) 
);

CREATE INDEX IX_VHSD_TENANT_ID ON SAL_VHSENDORDER(TENANT_ID);
CREATE INDEX IX_VHSD_TIME_STAMP ON SAL_VHSENDORDER(TENANT_ID,TIME_STAMP);
CREATE INDEX IX_VHSD_SEND_DATE ON SAL_VHSENDORDER(SEND_DATE);

--����ȯ����
CREATE TABLE SAL_VHSENDDATA (
        --��ҵ����
	TENANT_ID int NOT NULL ,
        --���ŵ���
	VHSEND_ID char (36) NOT NULL ,
        --��α��
	BARCODE varchar (50) NOT NULL ,
        --��ֵ
	VOUCHER_PRC int NOT NULL ,
        --����ȯ����
	VOUCHER_TYPE varchar (1) ,
        --ʵ�ս��
	VOUCHER_MNY decimal(18, 3) ,
        --�ۿ���
	AGIO_RATE decimal(18, 3) ,
        --�ۿ۶�
	AGIO_MONEY decimal(18, 3) ,
	CONSTRAINT PK_SAL_VSDDDATA PRIMARY KEY   
	(
		TENANT_ID,VHSEND_ID,BARCODE
	) 
);

CREATE INDEX IX_VSDD_TENANT_ID ON SAL_VHSENDDATA(TENANT_ID);
CREATE INDEX IX_VSDD_VHSEND_ID ON SAL_VHSENDDATA(TENANT_ID,VHSEND_ID);

--֧����ˮ
CREATE TABLE SAL_VHPAY_GLIDE (
        --��ҵ����
	TENANT_ID int NOT NULL ,
        --֧����ˮ
	VHPAY_ID char (36) NOT NULL ,
        --��α��
	BARCODE varchar (50) NOT NULL ,
        --֧���ŵ�
	SHOP_ID varchar (13) NOT NULL ,
        --֧������
	DEPT_ID varchar (12) NOT NULL ,
        --�ͻ�
	CLIENT_ID varchar (36) NOT NULL ,
        --֧������
	VHPAY_DATE int NOT NULL ,
        --����Ա
	VHPAY_USER varchar (36) ,
        --��ֵ
	VOUCHER_PRC int NOT NULL ,
        --����ȯ����
	VOUCHER_TYPE varchar (1) ,
        --֧�����
	VHPAY_MNY decimal(18, 3) ,
        --�ۿ���
	AGIO_RATE decimal(18, 3) ,
        --�ۿ۶�
	AGIO_MONEY decimal(18, 3) ,
	
        --��������
	FROM_ID varchar (36) NOT NULL ,

        --����ʱ��
	CREA_DATE varchar (30) ,
        --������Ա
	CREA_USER varchar (36) ,
        --��ע
	REMARK varchar (100) ,
        --ͨѶ��־
	COMM varchar (2) NOT NULL DEFAULT '00',
        --ʱ��� 
  TIME_STAMP bigint NOT NULL,
	CONSTRAINT PK_VHPY_GLIDE PRIMARY KEY   
	(
		TENANT_ID,VHPAY_ID
	) 
);

CREATE INDEX IX_VHPY_TENANT_ID ON SAL_VHPAY_GLIDE(TENANT_ID);
CREATE INDEX IX_VHPY_TIME_STAMP ON SAL_VHPAY_GLIDE(TENANT_ID,TIME_STAMP);
CREATE INDEX IX_VHPY_VHPAY_DATE ON SAL_VHPAY_GLIDE(TENANT_ID,VHPAY_DATE);

--������
CREATE TABLE MKT_ATTHORDER (
        --��ҵ����
	TENANT_ID int NOT NULL ,
        --�ŵ����
	SHOP_ID varchar (13) NOT NULL ,
        --����
	ATTH_ID char (36) NOT NULL ,
        --���뵥��
	REQU_ID char (36) ,
        --��������
	DEPT_ID varchar (12) NOT NULL ,
        --��������
	REQU_TYPE char (36) NOT NULL ,
        --��ˮ��
	GLIDE_NO varchar (20) NOT NULL ,
        --�����
	REQU_DATE int NOT NULL ,
        --������
	CLIENT_ID varchar (36) NOT NULL ,
        --���
	REQU_USER varchar (36) ,
        --�������
	CHK_DATE varchar (10) ,
        --�����Ա
	CHK_USER varchar (36) ,
        --�������
	KPI_MNY decimal(18, 3) ,
        --�г�����
	BUDG_MNY decimal(18, 3) ,
        --�۸�֧��
	AGIO_MNY decimal(18, 3) ,
        --�������
	OTHR_MNY decimal(18, 3) ,
        --��ע
	REMARK varchar (100) ,
        --����ʱ��
	CREA_DATE varchar (30) ,
        --������Ա
	CREA_USER varchar (36) ,
        --ͨѶ��־
	COMM varchar (2) NOT NULL DEFAULT '00',
        --ʱ��� ��ǰϵͳ����*86400000
  TIME_STAMP bigint NOT NULL,
	CONSTRAINT PK_MKT_ATTHORDER PRIMARY KEY 
	(
		TENANT_ID,
		ATTH_ID
	) 
);

CREATE INDEX IX_MATH_TENANT_ID ON MKT_ATTHORDER(TENANT_ID);
CREATE INDEX IX_MATH_TIME_STAMP ON MKT_ATTHORDER(TENANT_ID,TIME_STAMP);
CREATE INDEX IX_MATH_REQU_DATE ON MKT_ATTHORDER(REQU_DATE);

drop table MKT_REQUSHARE;
--��������ϸ
CREATE TABLE MKT_ATTHDATA (
        --��ҵ����
	TENANT_ID int NOT NULL ,
        --�ŵ����
	SHOP_ID varchar (13) NOT NULL ,
        --���
	SEQNO int NOT NULL ,
        --����
	ATTH_ID char (36) NOT NULL ,
        --��Ʒ
	GODS_ID char (36) NOT NULL ,
	      --����
	UNIT_ID char (36) NOT NULL ,
        --��������
	AMOUNT decimal(18, 3) ,
        --��������
	CALC_AMOUNT decimal(18, 3) ,
        --�������
	KPI_MNY decimal(18, 3) ,
        --�г�����
	BUDG_MNY decimal(18, 3) ,
        --�۸�֧��
	AGIO_MNY decimal(18, 3) ,
        --�������
	OTHR_MNY decimal(18, 3) ,
        --ժҪ
	REMARK varchar (100) ,
	CONSTRAINT PK_MKT_ATTHDATA PRIMARY KEY  
	(
		TENANT_ID,
		ATTH_ID,
		SEQNO
	)
);

CREATE INDEX IX_DATH_TENANT_ID ON MKT_ATTHDATA(TENANT_ID);
CREATE INDEX IX_DATH_ATTH_ID ON MKT_ATTHDATA(TENANT_ID,ATTH_ID);
CREATE INDEX IX_DATH_GODS_ID ON MKT_ATTHDATA(TENANT_ID,GODS_ID);

--��ͬ����
delete from PUB_PARAMS where TYPE_CODE='PLAN_TYPE';
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('1','������ͬ','PLAN_TYPE','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('2','���Ŀ��','PLAN_TYPE','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('3','�ɹ���ͬ','PLAN_TYPE','00',5497000);


--���ӱ�֤��
alter table SAL_INDENTDATA add BOND_MNY decimal(18, 3);
alter table STK_INDENTDATA add BOND_MNY decimal(18, 3);
alter table SAL_INDENTDATA add BOND_RET decimal(18, 3);
alter table STK_INDENTDATA add BOND_RET decimal(18, 3);

--��Ʊ����
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('1','���Ʊ','IVIO_TYPE','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('2','���Ʊ','IVIO_TYPE','00',5497000);

--��Ʊ����
alter table SAL_INVOICE_INFO add IVIO_TYPE char(1);
update SAL_INVOICE_INFO set IVIO_TYPE='1';

--��Ʊ��ϸ
drop table SAL_INVOICE_LIST;
CREATE TABLE SAL_INVOICE_LIST (
        --��ҵ����
	TENANT_ID int NOT NULL ,
        --��Ʊ��ˮID��
	INVD_ID char (36) NOT NULL ,
        --��������
	SEQNO int NOT NULL,
        --��������(0�� 1���۵� 2 �˻���(��) 3������(��) 4������ 5 �˻���(��) 6 ������(��))
	FROM_TYPE char (36) NOT NULL ,
        --��������
	FROM_ID char (36) ,
        --��Ʒ����
	GODS_ID varchar(36),
        --��Ʒ����
	GODS_NAME varchar(50),
        --��λ
	UNIT_NAME varchar(10),
        --����
	AMOUNT decimal(18, 3),
        --����
	APRICE decimal(18, 3),
        --δ˰���
	NOTAX_MNY decimal(18, 3),
        --˰��
	TAX_MNY decimal(18, 3),
	CONSTRAINT PK_SAL_INV_LIST PRIMARY KEY   
	(
		TENANT_ID,INVD_ID,SEQNO
	)
);
CREATE INDEX IX_IVLT_SALES_ID ON SAL_INVOICE_LIST(TENANT_ID,FROM_ID);
CREATE INDEX IX_IVLT_INVD_ID ON SAL_INVOICE_LIST(TENANT_ID,INVD_ID);

--����ƾ֤
CREATE TABLE ACC_FVCHORDER (
  --��ҵ����
  TENANT_ID int   NOT NULL,
  --�ŵ����
  SHOP_ID varchar(13)   NOT NULL,
  --��������
  DEPT_ID varchar(12)   NOT NULL,
  --ƾ֤���
  FVCH_ID char(36)   NOT NULL,
  --ƾ֤����
  FVCH_DATE int   NOT NULL,
  --��������
  FVCH_ATTACH int   NOT NULL,
  --�Ƶ���
  CREA_USER varchar(36)   NOT NULL,
  --�����־ 0 ���� 1�޸� 2 �������
  FVCH_FLAG char(1)  ,
  --ƾ֤����
  FVCH_CODE varchar(10)  ,
  --�����ƾ֤���
  FVCH_IMPORT_ID varchar(10)  ,
  --ͨѶ��־
	COMM varchar (2) NOT NULL DEFAULT '00',
  --ʱ���
  TIME_STAMP bigint   NOT NULL,
  --����
  CONSTRAINT PK_ACC_FVCHORDER PRIMARY KEY 
  ( 
  	TENANT_ID,
  	FVCH_ID 
  )
);

CREATE INDEX IX_FVCH_TENANT_ID ON ACC_FVCHORDER (TENANT_ID);
CREATE INDEX IX_FVCH_TIME_STAMP ON ACC_FVCHORDER (TENANT_ID, TIME_STAMP);
CREATE INDEX IX_FVCH_SHOP_ID ON ACC_FVCHORDER (TENANT_ID,SHOP_ID);
CREATE INDEX IX_FVCH_FVCH_DATE ON ACC_FVCHORDER (TENANT_ID,FVCH_DATE);

--ƾ֤��¼
CREATE TABLE ACC_FVCHDATA (
  --��ҵ����
  TENANT_ID int  NOT NULL,
  --�ŵ����
  SHOP_ID varchar(13)   NOT NULL,
  --ƾ֤����
  FVCH_ID char(36)   NOT NULL,
  --ƾ֤��¼���
  FVCH_DID char(36)   NOT NULL,
  --���
	SEQNO int NOT NULL ,
  --��Ŀ����
  SUBJECT_NO varchar(10)   NOT NULL,
  --ժҪ
  SUMMARY varchar(100)   NOT NULL,
        --���
	AMONEY decimal(18, 3),
        --����
	AMOUNT decimal(18, 3),
        --����
	APRICE decimal(18, 3),
  --���˷���  1�跽 2����
  SUBJECT_TYPE char(1)   NOT NULL,
  --ҵ������
  OPER_DATE int   NOT NULL,
  CONSTRAINT PK_ACC_FVCHDATA PRIMARY KEY 
  ( 
		TENANT_ID,
		FVCH_DID
  )
);
CREATE INDEX IX_FVCD_TENANT_ID ON ACC_FVCHDATA (TENANT_ID);
CREATE INDEX IX_FVCD_FVCH_ID ON ACC_FVCHDATA (TENANT_ID,FVCH_ID);

--ƾ֤��ϸ
CREATE TABLE ACC_FVCHDETAIL (
  --��ҵ����
  TENANT_ID int  NOT NULL,
  --�ŵ����
  SHOP_ID varchar(13)   NOT NULL,
  --��ϸID
  FVCH_TID char(36)   NOT NULL,
  --ƾ֤����
  FVCH_ID char(36)   NOT NULL,
  --ƾ֤��¼���
  FVCH_DID char(36)   NOT NULL,
  --���
	SEQNO int NOT NULL ,
  --��Ա���->����ϵͳ
  SUBJ_USER char(36) ,
  --���ű��->����ϵͳ
  SUBJ_DEPT char(36) ,
  --�ŵ���->����ϵͳ
  SUBJ_SHOP char(36) ,
  --������λ->����ϵͳ
  SUBJ_CLIENT char(36) ,
  --ר��1->����ϵͳ
  SUBJ_OTHR1 char(36) ,
  --ר��2->����ϵͳ
  SUBJ_OTHR2 char(36) ,
  --ר��3->����ϵͳ
  SUBJ_OTHR3 char(36) ,
  --ר��4->����ϵͳ
  SUBJ_OTHR4 char(36) ,
  --ר��5->����ϵͳ
  SUBJ_OTHR5 char(36) ,
  --ժҪ
  SUMMARY varchar(100)   NOT NULL,
        --���
	AMONEY decimal(18, 3),
        --����
	AMOUNT decimal(18, 3),
        --����
	APRICE decimal(18, 3),
  --ҵ������
  OPER_DATE int   NOT NULL,
  CONSTRAINT PK_ACC_FVCHDETAIL PRIMARY KEY 
  ( 
		TENANT_ID,
		FVCH_TID
  )
);
CREATE INDEX IX_FVCL_TENANT_ID ON ACC_FVCHDETAIL (TENANT_ID);
CREATE INDEX IX_FVCL_FVCH_ID ON ACC_FVCHDETAIL (TENANT_ID,FVCH_ID);

--��������
CREATE TABLE ACC_FVCHGLIDE (
  --��ҵ����
  TENANT_ID int  NOT NULL,
  --��ID
  FVCH_GLID char(36)   NOT NULL,
  --ƾ֤����
  FVCH_ID char(36)   NOT NULL,
  --�������� 01�ɹ����� 02�ɹ����� 03�ɹ��˻� 04 ���۶��� 05 ���۳��� 06�����˻� 07���õ� 08 ���浥 09�տ 10 ���  11 ���۵��� 12�ɿ 13 �������� 14����֧�� 15 ��ȡ�
  FVCH_GTYPE char(2)   NOT NULL,
  --��������
  FVCH_GID char(36)   NOT NULL,
  CONSTRAINT PK_ACC_FVCHGLIDE PRIMARY KEY 
  ( 
		TENANT_ID,
		FVCH_GLID
  ) 
);
CREATE INDEX IX_FVCG_FVCH_ID ON ACC_FVCHGLIDE(TENANT_ID,FVCH_ID);


--ƾ֤ģ��
CREATE TABLE ACC_FVCHFRAME (
  --��ҵ����
  TENANT_ID int NOT NULL,
  --�������� 01�ɹ����� 02�ɹ����� 03�ɹ��˻� 04 ���۶��� 05 ���۳��� 06�����˻� 07���õ� 08 ���浥 09�տ 10 ���  11 ���۵��� 12�ɿ 13 �������� 14����֧�� 15 ��ȡ�
  FVCH_GTYPE char(2)   NOT NULL,
  --���
	SEQNO int NOT NULL ,
  --��Ŀ����
  SUBJECT_NO varchar(10)   NOT NULL,
  --ժҪ
  SUMMARY varchar(100)   NOT NULL,
        --���<ȡ���ֶ�>
	AMONEY varchar(20),
        --����<ȡ���ֶ�>
	AMOUNT varchar(20),
        --����<ȡ���ֶ�>
	APRICE varchar(20),
  --ȡ������
  SWHERE varchar(255) NOT NULL,
  --��¼��ϸ 100000000 ��λȡ��0��������ϸ��1��������ϸ(1��Ա 2���� 3�ŵ�<�ֿ�> 4������λ �����ֱ�Ϊר��1-5)
  DATAFLAG varchar(8)   NOT NULL,
  --���˷���  1�跽 2����
  SUBJECT_TYPE char(1) NOT NULL,
  CONSTRAINT PK_ACC_FVCHFRAME PRIMARY KEY 
  ( 
		TENANT_ID,
		FVCH_GTYPE,
    SEQNO
  )
);
CREATE INDEX IX_FVCF_TENANT_ID ON ACC_FVCHFRAME (TENANT_ID);
CREATE INDEX IX_FVCF_FVCH_GTYPE ON ACC_FVCHFRAME (TENANT_ID,FVCH_GTYPE);

alter table MKT_BUDGORDER add REQU_TYPE char (1);
alter table MKT_REQUORDER add BUDG_VRF decimal(18, 3);

--�ο�������������
CREATE TABLE MKT_KPI_MODIFY (
  --��ҵ����
  TENANT_ID int  NOT NULL,
  --��ID
  MODIFY_ID char(36)   NOT NULL,
  --���
	KPI_YEAR int NOT NULL ,
  --��ID
  SALES_ID char(36)   NOT NULL,
  --ƾ֤����
  SEQNO int   NOT NULL,
  --ƾ֤����
  GODS_ID char(36)  NOT NULL,
  --��������
  MODI_AMOUNT decimal(18, 3) ,
  --�������
  MODI_MONEY decimal(18, 3) ,
  CONSTRAINT PK_MKT_KPI_MODIFY PRIMARY KEY 
  ( 
		TENANT_ID,
		MODIFY_ID
  ) 
);
CREATE INDEX IX_KPIM_KPI_YEAR ON MKT_KPI_MODIFY(TENANT_ID,KPI_YEAR);
CREATE INDEX IX_KPIM_SEQNO ON MKT_KPI_MODIFY(TENANT_ID,SALES_ID,SEQNO);

 insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('SALES_STYLE','���۷�ʽ','INDEX_TYPE1','00',5497000); 