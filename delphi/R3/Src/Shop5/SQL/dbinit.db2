--db2
--%TBSPPATH% 是数据存储路径 

--创建数据库命令
--CREATE DATABASE R3DB ON 'F:' USING CODESET GBK TERRITORY CN COLLATE USING SYSTEM 
--CATALOG TABLESPACE  MANAGED BY SYSTEM USING ( 'F:\R3\R3DB\1' )  
--USER TABLESPACE  MANAGED BY SYSTEM USING ( 'F:\R3\R3DB\2' )  
--TEMPORARY TABLESPACE  MANAGED BY SYSTEM USING ( 'F:\R3\R3DB\3' ) 
--;

--创建缓冲池：
--基础表
CREATE BUFFERPOOL BPTB4K01  IMMEDIATE  SIZE 250 PAGESIZE 4  K ;
--单据表
CREATE BUFFERPOOL BPTB32K01 IMMEDIATE  SIZE 250 PAGESIZE 32 K ;
--台帐表
CREATE BUFFERPOOL BPTB32K02 IMMEDIATE  SIZE 250 PAGESIZE 32 K ;
--索引表
CREATE BUFFERPOOL BPIX32K01 IMMEDIATE  SIZE 250 PAGESIZE 32 K ;

--1、基础数据表空间
CREATE REGULAR TABLESPACE R3TB4K_BAS  PAGESIZE 4  K  MANAGED BY DATABASE  USING (%TBSPPATH1%) EXTENTSIZE 16 OVERHEAD 10.5 PREFETCHSIZE 16 TRANSFERRATE 0.14 BUFFERPOOL  BPTB4K01  DROPPED TABLE RECOVERY OFF;
--2、单据表空间
CREATE REGULAR TABLESPACE R3TB32K_BIZ PAGESIZE 32 K  MANAGED BY DATABASE  USING (%TBSPPATH2%) EXTENTSIZE 16 OVERHEAD 10.5 PREFETCHSIZE 16 TRANSFERRATE 0.14 BUFFERPOOL  BPTB32K01  DROPPED TABLE RECOVERY OFF;
--3、台帐表空间
CREATE REGULAR TABLESPACE R3TB32K_RCK PAGESIZE 32 K  MANAGED BY DATABASE  USING (%TBSPPATH3%) EXTENTSIZE 16 OVERHEAD 10.5 PREFETCHSIZE 16 TRANSFERRATE 0.14 BUFFERPOOL  BPTB32K02  DROPPED TABLE RECOVERY OFF;
--4、索引表空间
CREATE REGULAR TABLESPACE R3IX32K_DEF PAGESIZE 32 K  MANAGED BY DATABASE  USING (%TBSPPATH4%) EXTENTSIZE 16 OVERHEAD 10.5 PREFETCHSIZE 16 TRANSFERRATE 0.14 BUFFERPOOL  BPIX32K01  DROPPED TABLE RECOVERY OFF; 
