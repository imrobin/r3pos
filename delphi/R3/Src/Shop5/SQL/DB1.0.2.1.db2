--������Ա�������ظ���¼<��һ��û��ִ����ϣ��ٴ���һ��>
delete from PUB_IC_INFO where not Exists(select * from PUB_CUSTOMER where TENANT_ID=PUB_IC_INFO.TENANT_ID and CUST_ID=PUB_IC_INFO.CLIENT_ID and CUST_CODE=PUB_IC_INFO.IC_CARDNO and UNION_ID=PUB_IC_INFO.UNION_ID);

--20110910�������ȫ���ر�
update SYS_SYNC_CTRL set TIME_STAMP=21772800 where TABLE_NAME='STK_STOCKORDER' and TIME_STAMP>21772800;
update SYS_SYNC_CTRL set TIME_STAMP=21772800 where TABLE_NAME='SAL_SALESORDER' and TIME_STAMP>21772800;
update SYS_SYNC_CTRL set TIME_STAMP=21772800 where TABLE_NAME='STO_CHANGEORDER' and TIME_STAMP>21772800;
update SYS_SYNC_CTRL set TIME_STAMP=21772800 where TABLE_NAME='STK_INDENTORDER' and TIME_STAMP>21772800;
update SYS_SYNC_CTRL set TIME_STAMP=21772800 where TABLE_NAME='SAL_INDENTORDER' and TIME_STAMP>21772800;
update SYS_SYNC_CTRL set TIME_STAMP=21772800 where TABLE_NAME='ACC_IOROORDER' and TIME_STAMP>21772800;
update SYS_SYNC_CTRL set TIME_STAMP=21772800 where TABLE_NAME='ACC_TRANSORDER' and TIME_STAMP>21772800;
update SYS_SYNC_CTRL set TIME_STAMP=21772800 where TABLE_NAME='ACC_RECVORDER' and TIME_STAMP>21772800;
update SYS_SYNC_CTRL set TIME_STAMP=21772800 where TABLE_NAME='ACC_PAYORDER' and TIME_STAMP>21772800;
update SYS_SYNC_CTRL set TIME_STAMP=21772800 where TABLE_NAME='ACC_CLOSE_FORDAY' and TIME_STAMP>21772800;
update SYS_SYNC_CTRL set TIME_STAMP=21772800 where TABLE_NAME='RCK_DAYS_CLOSE' and TIME_STAMP>21772800;
update SYS_SYNC_CTRL set TIME_STAMP=21772800 where TABLE_NAME='RCK_MONTH_CLOSE' and TIME_STAMP>21772800;
update SYS_SYNC_CTRL set TIME_STAMP=21772800 where TABLE_NAME='SAL_IC_GLIDE' and TIME_STAMP>21772800;
update SYS_SYNC_CTRL set TIME_STAMP=21772800 where TABLE_NAME='SAL_PRICEORDER' and TIME_STAMP>21772800;
update SYS_SYNC_CTRL set TIME_STAMP=21772800 where TABLE_NAME='STO_PRINTORDER' and TIME_STAMP>21772800;

--��������Ч�̵㵥
delete from STO_PRINTDATA where exists(select TENANT_ID,PRINT_DATE,SHOP_ID from STO_PRINTORDER where TENANT_ID=STO_PRINTDATA.TENANT_ID and SHOP_ID=STO_PRINTDATA.SHOP_ID and PRINT_DATE=STO_PRINTDATA.PRINT_DATE and CHK_DATE is null);
delete from STO_PRINTORDER where CHK_DATE is null;

--���Ӵ�ӡ��������ӡ��
alter table STK_STOCKORDER add PRINT_TIMES int;
alter table STK_STOCKORDER add PRINT_USER varchar(36);

alter table SAL_SALESORDER add PRINT_TIMES int;
alter table SAL_SALESORDER add PRINT_USER varchar(36);

alter table STO_CHANGEORDER add PRINT_TIMES int;
alter table STO_CHANGEORDER add PRINT_USER varchar(36);

alter table SAL_INDENTORDER add PRINT_TIMES int;
alter table SAL_INDENTORDER add PRINT_USER varchar(36);

alter table STK_INDENTORDER add PRINT_TIMES int NULL;
alter table STK_INDENTORDER add PRINT_USER varchar(36);

alter table STO_PRINTORDER add PRINT_TIMES int NULL;
alter table STO_PRINTORDER add PRINT_USER varchar(36);

alter table SAL_PRICEORDER add PRINT_TIMES int NULL;
alter table SAL_PRICEORDER add PRINT_USER varchar(36);

--ָ������
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('1','SQL','COMMAND_TYPE','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('2','EXE','COMMAND_TYPE','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('3','ACTION','COMMAND_TYPE','00',5497000);
--ָ��״̬
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('1','��ִ��','COMMAND_STATUS','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('2','��ִ��','COMMAND_STATUS','00',5497000);
 
--���������ָ��
CREATE TABLE SYS_COMMAND(
  ROWS_ID char(36) NOT NULL,
        --��ҵ����
	TENANT_ID int NOT NULL ,
        --�ŵ����
	SHOP_ID varchar (13) NOT NULL ,
        --ָ������
	COMMAND_TYPE varchar (1) NOT NULL ,
        --ָ��˵��{1 sql��� 2 exeִ���ļ�������·�� 3 �����ڵ�action��}
	COMMAND_TEXT varchar (3000) NOT NULL ,
        --ִ��״̬ 
	COMMAND_STATUS varchar (1) NOT NULL ,
	CONSTRAINT SYS_COMMAND PRIMARY KEY   
	(
		ROWS_ID
	) 
);

//���������ظ�����

alter table PUB_IC_INFO drop CONSTRAINT PK_PUB_IC_INFO; 

alter table PUB_IC_INFO add CONSTRAINT PK_PUB_IC_INFO PRIMARY KEY(TENANT_ID,UNION_ID,CLIENT_ID);
