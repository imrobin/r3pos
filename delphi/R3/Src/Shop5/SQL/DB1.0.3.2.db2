drop view VIW_GOODSPRICE_SORTEXT;
CREATE VIEW VIW_GOODSPRICE_SORTEXT
as
SELECT
j1.*,j2.LEVEL_ID,j2.SORT_NAME
FROM
VIW_GOODSPRICEEXT j1 LEFT JOIN
VIW_GOODSSORT j2 ON j1.TENANT_ID = j2.TENANT_ID AND j1.SORT_ID1 = j2.SORT_ID and j1.RELATION_ID=j2.RELATION_ID
where j2.SORT_TYPE=1;

drop view VIW_GOODSINFO_SORTEXT;
CREATE VIEW VIW_GOODSINFO_SORTEXT
as
SELECT
j1.*,j2.LEVEL_ID,j2.SORT_NAME
FROM
VIW_GOODSINFO j1 LEFT JOIN
VIW_GOODSSORT j2 ON j1.TENANT_ID = j2.TENANT_ID AND j1.SORT_ID1 = j2.SORT_ID and j1.RELATION_ID=j2.RELATION_ID
where j2.SORT_TYPE=1

