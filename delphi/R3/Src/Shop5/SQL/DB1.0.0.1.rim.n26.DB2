--创建烟草公司视图(原接口库提供表)：
CREATE VIEW PUB_ORGAN 
as 
 select COMP_ID AS ORGAN_ID, COMP_CODE as ORGAN_CODE, comp_name as ORGAN_NAME from INTERFACE.T_EBP_COMPANY;

--创建RM_CUST视图(原接口库提供表)：
CREATE VIEW RM_CUST 
as 
 select CUST_ID, CUST_CODE, CUST_NAME, CUST_SHORT_NAME, '' as CUST_SHORT_ID, COMP_ID as COM_ID,   '' as REGIE_ID, 
        LICENSE_CODE,'1' as IS_CHG_PRI, 0 as SINGLE_SALE_LIMIT, 0 as SALE_LIMIT 
 from INTERFACE.T_EBP_CUSTOMER;

--创建卷烟对照视图：
CREATE VIEW RIM_GOODS_RELATION  
as  
select Comp_ID as TENANT_ID,GODS_ID,GODS_CODE,GODS_NAME,GODS_SNAME,SORT_ID2,SORT_ID7 as SORT_ID4,SORT_ID6,GODS_SPEC,
       CALC_UNIT,PACK_BARCODE,BOX_BARCODE,' ' as PACK_UNIT_ID,' ' as BOX_UNIT_ID,CAlC_AMT,PACK_INPRICE,PACK_OUTPRICE
from INTERFACE.T_EBP_PRODUCT;

--创建订单主表视图(原接口库提供表)：
CREATE VIEW SD_CO 
AS 
select ORDER_ID as CO_NUM, comp_id as COM_ID, CUST_ID, CRT_DATE, BORN_DATE, ARR_DATE, QTY_SUM, AMT_SUM, STATUS from INTERFACE.T_EBP_ORDER;

--创建订单明细表视图(原接口库提供表)：
CREATE VIEW SD_CO_LINE 
as 
select ORDER_ID as CO_NUM, 1 as LINE_NUM, GODS_ID as ITEM_ID, CALC_UNIT as UM_ID, QTY_NEED, QTY_VFY, 
       QTY_ORD, 0 as PRI, 0 as PRI3, QTY_AMT as AMT, 0 as RET_AMT, NOTE as NOTE 
from INTERFACE.T_EBP_ORDERDETAIL;


--创建RIM_PUB_ORGAN视图(R3引用:PUB_ORGAN)：
CREATE VIEW RIM_PUB_ORGAN as select ORGAN_ID, ORGAN_CODE, ORGAN_NAME from PUB_ORGAN; 
--创建RIM_RM_CUST视图(R3引用:RM_CUST)：
CREATE VIEW RIM_RM_CUST as select * from RM_CUST;
--创建RIM_PUB_ORGAN视图(R3引用:SD_CO)：
CREATE VIEW RIM_SD_CO AS select * from sd_co;
--创建RIM_PUB_ORGAN视图(R3引用:SD_CO_LINE)：
CREATE VIEW RIM_SD_CO_LINE as select * from sd_co_line;


--////2011.04.07 PM ：创建对接中间表：INF_GOODS_RELATION （国家烟草供应链：1000006）
CREATE TABLE INF_GOODS_RELATION (
     --GUID号
	ROWS_ID char (36) NOT NULL ,
     --企业代码 
	TENANT_ID int NOT NULL ,
     --供应链
	RELATION_ID int NOT NULL ,
     --货品代码
	GODS_ID char (36) NOT NULL , 
     --行业内码<第三方系统内码>
	SECOND_ID varchar (36), 
     --货号<识别码>
	GODS_CODE varchar (36), 
     --品名+规格
	GODS_NAME varchar (50) ,
     --拼音码
	GODS_SPELL varchar (50) ,
     --分类1
	SORT_ID1 varchar (36),
     --分类2
	SORT_ID2 varchar (36),
     --分类3
	SORT_ID3 varchar (36),
     --分类4
	SORT_ID4 varchar (36),
     --分类5
	SORT_ID5 varchar (36),
     --分类6
	SORT_ID6 varchar (36),
     --颜色组
	SORT_ID7 varchar (36),
     --尺码组
	SORT_ID8 varchar (36),
     --自定义9
	SORT_ID9 varchar (36),
     --自定义10
	SORT_ID10 varchar (36),
     --自定义11
	SORT_ID11 varchar (36),
     --自定义12
	SORT_ID12 varchar (36),
     --自定义13
	SORT_ID13 varchar (36),
     --自定义14
	SORT_ID14 varchar (36),
     --自定义15
	SORT_ID15 varchar (36),
     --自定义16
	SORT_ID16 varchar (36),
     --自定义17
	SORT_ID17 varchar (36),
     --自定义18
	SORT_ID18 varchar (36),
     --自定义19
	SORT_ID19 varchar (36),
     --自定义20
	SORT_ID20 varchar (36),
     --标准进价
	NEW_INPRICE decimal(18, 3),
     --标准售价
	NEW_OUTPRICE decimal(18, 3),
     --最低售价
	NEW_LOWPRICE decimal(18, 3),
     --是否启用折扣率 1启用,2禁用
	USING_PRICE int ,
     --是否参考积分
	HAS_INTEGRAL int ,
     --是否使用批号管制
	USING_BATCH_NO int ,
     --是否管制积分换购
	USING_BARTER int ,
     --是否管制物流跟踪码
	USING_LOCUS_NO int ,
     --积分换购积分
	BARTER_INTEGRAL int ,
	   --条条码
  PACK_BARCODE varchar(30),
     --更新标记位(0:表示没有更新对应; 1:表示修改; 2: 表示插入)、
  UPDATE_FLAG int NOT NULL,
  CONSTRAINT PK_INF_G_RELATION  PRIMARY KEY (ROWS_ID)  --广西柳州（PK_INF_G_RELATION）创建
);

-- 表上创建索引
CREATE INDEX IX_INF_R_T_ID ON INF_GOODS_RELATION(TENANT_ID,RELATION_ID,GODS_ID);

--2011.04.11 PM：创建入库单中间表主表：
CREATE TABLE INF_INDEORDER (
        --企业ID(对应：Rim供应商:CLIENT_ID)
	TENANT_ID int NOT NULL ,
        --门店ID(对应：零售户代码:CUST_ID)
	SHOP_ID varchar (13) NOT NULL ,
        --订单单号
	INDE_ID varchar (50) NOT NULL ,
        --入库日期
	INDE_DATE varchar(10) NOT NULL ,
        --入库数量      
	INDE_AMT decimal(18, 6) ,
        --需求数量（下载订单导入）      
	NEED_AMT decimal(18, 6) ,
        --入库金额
	INDE_MNY decimal(18, 6) ,
	 --单据状态	
  STATUS varchar(4), 		
	CONSTRAINT PK_INF_INDEORDER PRIMARY KEY (INDE_ID)
);
--创建索引
CREATE INDEX IX_INF_ORDER_TID ON INF_INDEORDER(TENANT_ID);
CREATE INDEX IX_INF_ORDER_DATE ON INF_INDEORDER(INDE_DATE);

--2011.04.11 PM：创建入库单中间表明细表：
 CREATE TABLE INF_INDEDATA (
     --企业ID(对应：Rim供应商:CLIENT_ID)
 	TENANT_ID int NOT NULL , 
 	   --订单编号
  INDE_ID varchar (50) NOT NULL ,
     --商品编号(R3)  
  GODS_ID varchar (50) ,   
     --商品编号(第三方)
  SECOND_ID varchar (50) ,   
     --计量单位
  UNIT_ID char (36) ,         
     --需求数量
  NEED_AMT decimal(18, 6) ,    
     --审核数量
  CHK_AMT decimal(18, 6) ,   
     --订购数量 
  AMOUNT decimal(18, 6) ,    
     --折扣价格
  APRICE decimal(18, 6),     
     --三级批发价  
  PRI3 decimal(18, 6) ,      
     --折扣金额	
  AGIO_MONEY decimal(18, 6),  
     --含税金额, 金额=订购数量*折扣价格
  AMONEY decimal(18, 6),      
     --计量单位数据						
	CALC_AMOUNT decimal(18, 3)  
  );
--创建索引 
CREATE INDEX IX_INF_INDE_GID ON INF_INDEDATA(TENANT_ID,INDE_ID);
 
--2011.08.29 PM：订单中间主表增加预计到货日期：
alter table INF_INDEORDER Add ARR_DATE varchar(10);


