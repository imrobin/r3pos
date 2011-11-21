--添加商品缩放倍率
alter table PUB_GOODS_RELATION add ZOOM_RATE decimal(18, 3) NOT NULL DEFAULT 1;
--为应用服务器添加默认产品
alter table CA_SERVER_INFO add PROD_ID varchar(10);

--企业经营商品视图,自经营商品+连锁商品    
drop view VIW_GOODSINFO;                                          
CREATE view VIW_GOODSINFO
as
select 1 as RELATION_FLAG,B.RELATION_ID,C.RELATI_ID as TENANT_ID,A.GODS_ID,
       B.GODS_CODE as SECOND_CODE,B.SECOND_ID,B.COMM_ID,
       BARCODE,UNIT_ID,CALC_UNITS,SMALL_UNITS,BIG_UNITS,SMALLTO_CALC,BIGTO_CALC,
       coalesce(B.GODS_CODE,A.GODS_CODE) as GODS_CODE,GODS_TYPE,
       coalesce(B.GODS_NAME,A.GODS_NAME) as GODS_NAME,
       coalesce(B.GODS_SPELL,A.GODS_SPELL) as GODS_SPELL,
       coalesce(B.SORT_ID1,A.SORT_ID1) as SORT_ID1,
       coalesce(B.SORT_ID2,A.SORT_ID2) as SORT_ID2,
       coalesce(B.SORT_ID3,A.SORT_ID3) as SORT_ID3,
       coalesce(B.SORT_ID4,A.SORT_ID4) as SORT_ID4,
       coalesce(B.SORT_ID5,A.SORT_ID5) as SORT_ID5,
       coalesce(B.SORT_ID6,A.SORT_ID6) as SORT_ID6,
       coalesce(B.SORT_ID7,A.SORT_ID7) as SORT_ID7,
       coalesce(B.SORT_ID8,A.SORT_ID8) as SORT_ID8,
       coalesce(B.SORT_ID9,A.SORT_ID9) as SORT_ID9,
       coalesce(B.SORT_ID10,A.SORT_ID10) as SORT_ID10,
       coalesce(B.SORT_ID11,A.SORT_ID11) as SORT_ID11,
       coalesce(B.SORT_ID12,A.SORT_ID12) as SORT_ID12,
       coalesce(B.SORT_ID13,A.SORT_ID13) as SORT_ID13,
       coalesce(B.SORT_ID14,A.SORT_ID14) as SORT_ID14,
       coalesce(B.SORT_ID15,A.SORT_ID15) as SORT_ID15,
       coalesce(B.SORT_ID16,A.SORT_ID16) as SORT_ID16,
       coalesce(B.SORT_ID17,A.SORT_ID17) as SORT_ID17,
       coalesce(B.SORT_ID18,A.SORT_ID18) as SORT_ID18,
       coalesce(B.SORT_ID19,A.SORT_ID19) as SORT_ID19,
       coalesce(B.SORT_ID20,A.SORT_ID20) as SORT_ID20,
       coalesce(B.NEW_INPRICE,A.NEW_INPRICE) as NEW_INPRICE,
       coalesce(B.NEW_OUTPRICE,A.NEW_OUTPRICE) as NEW_OUTPRICE,
       coalesce(B.NEW_LOWPRICE,A.NEW_LOWPRICE) as NEW_LOWPRICE,
       coalesce(B.USING_BARTER,A.USING_BARTER) as USING_BARTER,
       coalesce(B.BARTER_INTEGRAL,A.BARTER_INTEGRAL) as BARTER_INTEGRAL,
       coalesce(B.USING_PRICE,A.USING_PRICE) as USING_PRICE,
       coalesce(B.HAS_INTEGRAL,A.HAS_INTEGRAL) as HAS_INTEGRAL,
       coalesce(B.USING_BATCH_NO,A.USING_BATCH_NO) as USING_BATCH_NO,
       coalesce(B.USING_LOCUS_NO,A.USING_LOCUS_NO) as USING_LOCUS_NO,
       REMARK,'#' as PRICE_ID,A.COMM,coalesce(B.ZOOM_RATE,1.000) as ZOOM_RATE,A.TIME_STAMP
from PUB_GOODSINFO A,PUB_GOODS_RELATION B,CA_RELATIONS C
where A.GODS_ID=B.GODS_ID and B.RELATION_ID=C.RELATION_ID and  
( (B.TENANT_ID=C.TENANT_ID  and C.RELATION_TYPE<>'1')
  or
  (B.TENANT_ID=C.RELATI_ID  and C.RELATION_TYPE='1')
)
and B.COMM not in ('02','12') and C.COMM not in ('02','12') and C.RELATION_STATUS='2'
union all
select 2 as RELATION_FLAG,0 as RELATION_ID,TENANT_ID,GODS_ID,
       GODS_CODE as SECOND_CODE,GODS_ID as SECOND_ID,GODS_ID as COMM_ID,
       BARCODE,UNIT_ID,CALC_UNITS,SMALL_UNITS,BIG_UNITS,SMALLTO_CALC,BIGTO_CALC,
       GODS_CODE,GODS_TYPE,GODS_NAME,GODS_SPELL,
       SORT_ID1,SORT_ID2,SORT_ID3,SORT_ID4,SORT_ID5,SORT_ID6,SORT_ID7,SORT_ID8,
       SORT_ID9,SORT_ID10,SORT_ID11,SORT_ID12,SORT_ID13,SORT_ID14,SORT_ID15,SORT_ID16,
       SORT_ID17,SORT_ID18,SORT_ID19,SORT_ID20,
       NEW_INPRICE,NEW_OUTPRICE,NEW_LOWPRICE,
       USING_BARTER,BARTER_INTEGRAL,
       USING_PRICE,HAS_INTEGRAL,USING_BATCH_NO,USING_LOCUS_NO,REMARK,'#' as PRICE_ID,COMM,1.000 as ZOOM_RATE,TIME_STAMP
from PUB_GOODSINFO;

--各商品在企业总部的价格<售价>，不分门店
drop view VIW_GOODSINFOEXT;                                          
CREATE view VIW_GOODSINFOEXT
as
select A.TENANT_ID,A.RELATION_ID,
       A.PRICE_ID,A.GODS_ID,A.GODS_CODE,A.SECOND_ID as SECOND_ID,A.GODS_NAME,A.GODS_SPELL,A.GODS_TYPE,
       A.SORT_ID1,A.SORT_ID2,A.SORT_ID3,A.SORT_ID4,A.SORT_ID5,A.SORT_ID6,A.SORT_ID7,A.SORT_ID8,
       A.SORT_ID9,A.SORT_ID10,A.SORT_ID11,A.SORT_ID12,A.SORT_ID13,A.SORT_ID14,A.SORT_ID15,A.SORT_ID16,
       A.SORT_ID17,A.SORT_ID18,A.SORT_ID19,A.SORT_ID20,
       A.BARCODE,A.UNIT_ID,A.CALC_UNITS,A.SMALL_UNITS,A.BIG_UNITS,A.SMALLTO_CALC,A.BIGTO_CALC,A.NEW_INPRICE,A.NEW_OUTPRICE as RTL_OUTPRICE,
       1 as POLICY_TYPE,
       case when coalesce(B.COMM,'02') not in ('02','12') then B.NEW_OUTPRICE else A.NEW_OUTPRICE end NEW_OUTPRICE,
       case when coalesce(B.COMM,'02') not in ('02','12') then coalesce(B.NEW_OUTPRICE1,B.NEW_OUTPRICE*A.SMALLTO_CALC) else A.NEW_OUTPRICE*A.SMALLTO_CALC end NEW_OUTPRICE1,
       case when coalesce(B.COMM,'02') not in ('02','12') then coalesce(B.NEW_OUTPRICE2,B.NEW_OUTPRICE*A.BIGTO_CALC) else A.NEW_OUTPRICE*A.BIGTO_CALC end NEW_OUTPRICE2,
       A.NEW_LOWPRICE,A.USING_BARTER,A.BARTER_INTEGRAL,
       A.USING_PRICE,A.HAS_INTEGRAL,A.USING_BATCH_NO,A.USING_LOCUS_NO,A.REMARK,A.COMM,A.ZOOM_RATE,A.TIME_STAMP
from VIW_GOODSINFO A left join PUB_GOODSPRICE B ON A.TENANT_ID=B.TENANT_ID and A.GODS_ID=B.GODS_ID and ltrim(rtrim(char(A.TENANT_ID)))||'0001'=B.SHOP_ID and A.PRICE_ID=B.PRICE_ID;

--每个门店都有记录，关联需加门店
--各商品价格
drop view VIW_GOODSPRICE;                                          
CREATE view VIW_GOODSPRICE
as
select A.TENANT_ID,A.RELATION_ID,C.SHOP_ID,
       A.PRICE_ID,A.GODS_ID,A.GODS_CODE,A.SECOND_ID as SECOND_ID,A.GODS_NAME,A.GODS_SPELL,A.GODS_TYPE,
       A.SORT_ID1,A.SORT_ID2,A.SORT_ID3,A.SORT_ID4,A.SORT_ID5,A.SORT_ID6,A.SORT_ID7,A.SORT_ID8,
       A.SORT_ID9,A.SORT_ID10,A.SORT_ID11,A.SORT_ID12,A.SORT_ID13,A.SORT_ID14,A.SORT_ID15,A.SORT_ID16,
       A.SORT_ID17,A.SORT_ID18,A.SORT_ID19,A.SORT_ID20,
       A.BARCODE,A.UNIT_ID,A.CALC_UNITS,A.SMALL_UNITS,A.BIG_UNITS,A.SMALLTO_CALC,A.BIGTO_CALC,A.NEW_INPRICE,A.RTL_OUTPRICE,
       case when coalesce(B.COMM,'02') not in ('02','12') then 2 else 1 end as POLICY_TYPE,
       case when coalesce(B.COMM,'02') not in ('02','12') then B.NEW_OUTPRICE else A.NEW_OUTPRICE end NEW_OUTPRICE,
       case when coalesce(B.COMM,'02') not in ('02','12') then coalesce(B.NEW_OUTPRICE1,B.NEW_OUTPRICE*A.SMALLTO_CALC) else A.NEW_OUTPRICE*A.SMALLTO_CALC end NEW_OUTPRICE1,
       case when coalesce(B.COMM,'02') not in ('02','12') then coalesce(B.NEW_OUTPRICE2,B.NEW_OUTPRICE*A.BIGTO_CALC) else A.NEW_OUTPRICE*A.BIGTO_CALC end NEW_OUTPRICE2,
       A.NEW_LOWPRICE,A.USING_BARTER,A.BARTER_INTEGRAL,
       A.USING_PRICE,A.HAS_INTEGRAL,A.USING_BATCH_NO,A.USING_LOCUS_NO,A.REMARK,A.COMM,A.ZOOM_RATE,A.TIME_STAMP
from VIW_GOODSINFOEXT A inner join CA_SHOP_INFO C on A.TENANT_ID=C.TENANT_ID
left join PUB_GOODSPRICE B ON C.SHOP_ID=B.SHOP_ID and A.TENANT_ID=B.TENANT_ID and A.GODS_ID=B.GODS_ID and A.PRICE_ID=B.PRICE_ID;

--每个门店都有记录，关联需加门店
drop view VIW_GOODSPRICEEXT;                                          
CREATE view VIW_GOODSPRICEEXT
as
    SELECT 
      j1.TENANT_ID as TENANT_ID,j1.SHOP_ID,j1.RELATION_ID, 
      j1.GODS_ID as GODS_ID,GODS_CODE,j1.GODS_TYPE,BARCODE,GODS_SPELL,GODS_NAME,UNIT_ID,CALC_UNITS,SMALL_UNITS,BIG_UNITS,SMALLTO_CALC,BIGTO_CALC,
       case when J2.NEW_INPRICE is null then J1.NEW_INPRICE else J2.NEW_INPRICE end as NEW_INPRICE,
       case when J2.NEW_INPRICE is null then J1.NEW_INPRICE*J1.SMALLTO_CALC else J2.NEW_INPRICE1 end as NEW_INPRICE1,
       case when J2.NEW_INPRICE is null then J1.NEW_INPRICE*J1.BIGTO_CALC else J2.NEW_INPRICE2 end as NEW_INPRICE2,
       NEW_OUTPRICE,
       NEW_OUTPRICE1,
       NEW_OUTPRICE2,
       NEW_LOWPRICE,
       J1.RTL_OUTPRICE as RTL_OUTPRICE,
       SORT_ID1,SORT_ID2,SORT_ID3,SORT_ID4,SORT_ID5,SORT_ID6,SORT_ID7,SORT_ID8,
       SORT_ID9,SORT_ID10,SORT_ID11,SORT_ID12,SORT_ID13,SORT_ID14,SORT_ID15,SORT_ID16,
       SORT_ID17,SORT_ID18,SORT_ID19,SORT_ID20,
       USING_BARTER,BARTER_INTEGRAL,
       USING_PRICE,HAS_INTEGRAL,USING_BATCH_NO,USING_LOCUS_NO,REMARK,j1.COMM as COMM,j1.ZOOM_RATE,j1.TIME_STAMP as TIME_STAMP
    FROM 
      VIW_GOODSPRICE j1 LEFT JOIN 
      PUB_GOODSINFOEXT j2 ON j1.TENANT_ID = j2.TENANT_ID AND j1.GODS_ID = j2.GODS_ID; 
            
--每个门店都有记录，关联需加门店
drop view VIW_GOODSPRICE_SORTEXT;                                          
CREATE view VIW_GOODSPRICE_SORTEXT
as
    SELECT 
      j1.*,j2.LEVEL_ID,j2.SORT_NAME
    FROM 
      VIW_GOODSPRICEEXT j1 LEFT JOIN 
      VIW_GOODSSORT j2 ON j1.TENANT_ID = j2.TENANT_ID AND j1.SORT_ID1 = j2.SORT_ID and j1.RELATION_ID=j2.RELATION_ID; 
      
--商品分类视图不分门店
drop view VIW_GOODSINFO_SORTEXT;                                          
CREATE view VIW_GOODSINFO_SORTEXT
as
    SELECT 
      j1.*,j2.LEVEL_ID,j2.SORT_NAME
    FROM 
      VIW_GOODSINFO j1 LEFT JOIN 
      VIW_GOODSSORT j2 ON j1.TENANT_ID = j2.TENANT_ID AND j1.SORT_ID1 = j2.SORT_ID and j1.RELATION_ID=j2.RELATION_ID; 

