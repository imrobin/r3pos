--�����ŵ���Ȩ����
alter table CA_SHOP_INFO add RIGHT_TYPE char(1);
--�����ŵ꿪ͨ����
alter table CA_SHOP_INFO add CREA_DATE char(10);
--�����ŵ굽������
alter table CA_SHOP_INFO add CLSE_DATE char(10);
--�����ŵ����ʹ������
alter table CA_SHOP_INFO add USED_DATE varchar(19);
--��ʼ����Ȩ����
DELETE FROM PUB_PARAMS WHERE TYPE_CODE='RIGHT_TYPE';
INSERT INTO PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('1','���ڹر�','RIGHT_TYPE','00',5497000);
INSERT INTO PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('2','���ѽɷ�','RIGHT_TYPE','00',5497000);
INSERT INTO PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('3','�������','RIGHT_TYPE','00',5497000);