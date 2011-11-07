--品牌类型
update PUB_PARAMS set CODE_NAME='品牌类型' where CODE_ID='10' and TYPE_CODE='SORT_TYPE';
delete from PUB_GOODSSORT where SORT_TYPE=11 and SORT_ID in ('32FD7EE2-5F01-4131-B46F-2A8A81B9C60F','FE684BAA-F8F9-40EB-BFE5-716A143E53E3','5D8D7AF6-2DE3-4866-85C7-925E07F66096','C988E384-AB8D-4F5E-95F4-554D4689396C');

--聊天表结构

--好友分组
CREATE TABLE MQQ_GROUPING(
  --企业代码<0为公共资料>
	TENANT_ID int NOT NULL ,
    --分组代码
	S_GROUP_ID varchar(50) NOT NULL,
    --分组所属的用户号
	G_USER_ID varchar(50) NOT NULL,
    --显示名称
	I_SHOW_NAME varchar(50) NOT NULL,
    --分组名称
	I_GROUP_NAME varchar(50) NOT NULL,
	SEQ_NO int,
  CONSTRAINT PK_MQQ_GROUPING PRIMARY KEY (TENANT_ID,G_USER_ID,S_GROUP_ID)
);

--我的好友
CREATE TABLE MQQ_FRIENDS(
  --企业代码<0为公共资料>
	TENANT_ID int NOT NULL ,
    --好友所属的用户号
	F_USER_ID varchar(50) NOT NULL,
    --好友代码
	FRIEND_ID varchar(50) NOT NULL,
    --好友名称
	FRIEND_NAME varchar(50) NOT NULL,
	  --是否加入黑名单 1是未加入，0是加入
	IS_BE_BLACK varchar(1) NOT NULL,
    --分组代码
	S_GROUP_ID varchar(50) NOT NULL,
    --备注
	NOTE varchar(200),
	  --显示名称 好友名+ ' '+备注
	U_SHOW_NAME varchar(255) NOT NULL,
	  --是否在线
	IS_ONLINE varchar(1) NOT NULL,
	  --实体ID，预留调用业务功能用
	REF_ID varchar(1) NOT NULL,
    --用户类型
	USER_TYPE varchar(20) NOT NULL,
	SEQ_NO int,
  CONSTRAINT PK_MQQ_FRIENDS PRIMARY KEY (TENANT_ID,F_USER_ID,S_GROUP_ID,FRIEND_ID)
);
