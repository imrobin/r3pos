{-------------------------------------------------------------------------------
 RIM数据同步:
 (1)本单元上报同步使用时间戳，在新旧系统切换时需要对RIM_R3_NUM做相应的初始TIME_STAMP的值;
 (2)R3系统计量单位: Calc_UNIT，RIM的计量单位就是R3的管理单位;

 ------------------------------------------------------------------------------}

unit uSalesTotalFactory;

interface

uses                 
  SysUtils,windows, Variants, Classes, Dialogs,Forms, DB, zDataSet, zIntf, zBase,
  uBaseSyncFactory, uRimSyncFactory;

type
  TSalesTotalSyncFactory=class(TRimSyncFactory)
  private
    //上报日台帐
    function SendDaySaleTotal: integer;
  public
    function CallSyncData(GPlugIn: IPlugIn; InParamStr: string): integer; override; //调用上报
  end;
 
implementation

{ TSalesTotalSyncFactory }

function TSalesTotalSyncFactory.CallSyncData(GPlugIn: IPlugIn; InParamStr: string): integer;
var
  iRet: integer;
  ErrorFlag: Boolean;
begin
  result:=-1;
  PlugInID:='810';
  {------初始化参数------}
  PlugIntf:=GPlugIn;
  //1、返回数据库类型
  GetDBType;
  //2、还原ParamsList的参数对象
  Params.Decode(Params, InParamStr);
  GetSyncType;  //返回同步类型标记

  try
    DBLock(true);  //锁定数据库链接

    BeginLogReport; {------开始上报日志------}
    //返回R3的上报ShopList
    GetR3ReportShopList(R3ShopList);
    if R3ShopList.RecordCount=0 then
    begin
      Raise Exception.Create('<'+PlugInID+'>'+'[企业ID('+RimParam.TenID+')没有可上报门店(退出)！]');
    end;
    
    //按门店ID排序循环上报
    R3ShopList.First;
    while not R3ShopList.Eof do
    begin
      RimParam.CustID:='';
      try
        ErrorFlag:=False;
        RimParam.TenID  :=trim(R3ShopList.fieldbyName('TENANT_ID').AsString);   //R3企业ID (Field: TENANT_ID)
        RimParam.TenName:=trim(R3ShopList.fieldbyName('TENANT_NAME').AsString); //R3企业名称 (Field: TENANT_NAME)
        RimParam.ShopID :=trim(R3ShopList.fieldbyName('SHOP_ID').AsString);     //R3门店ID (Field: SHOP_ID)
        RimParam.ShopName:=trim(R3ShopList.fieldbyName('SHOP_NAME').AsString);  //R3门店名称 (Field: SHOP_NAME)
        RimParam.LICENSE_CODE:=trim(R3ShopList.fieldbyName('LICENSE_CODE').AsString);  //R3门店许可证号 (Field: LICENSE_CODE)
        SetRimORGAN_CUST_ID(RimParam.TenID, RimParam.ShopID, RimParam.ComID, RimParam.CustID);  //传入R3门店ID,返回RIM的烟草公司ComID,零售户CustID;

        if (RimParam.ComID<>'') and (RimParam.CustID<>'') then
        begin
          BeginLogShopReport; //开始门店日志           
          //开始上报日销售汇总：
          try
            iRet:=SendDaySaleTotal;
            AddBillMsg('日销售汇总',iRet);
          except
            on E:Exception do
            begin
              AddBillMsg('日销售汇总',-1,E.Message);
              ErrorFlag:=true;
            end;
          end;
          //写门店上报结果日志
          EndLogShopReport(true, ErrorFlag);
        end else
          EndLogShopReport(False); //对应不上门店 
      except
        on E:Exception do
        begin
          WriteLogFile(E.Message);
        end;
      end;
      R3ShopList.Next;
    end;
    result:=1;
  finally
    DBLock(False);
    WriteToReportLogFile('日销售汇总');  //调度才写日志
  end;
end;

function TSalesTotalSyncFactory.SendDaySaleTotal: integer;
var
  iRet,UpiRet: integer;  //返回ExeSQL影响多少行记录
  Session: string;       //session前缀
  Str, Short_ID: string; //门店后四位代码
  CndTab,         //条件表
  SalesTab,       //销售视图
  SaleDetail,     //销售明细表
  SALES_DATE,     //指定上报日期
  vSALES_DATE: string;     //销售日期[转成字符]
begin
  result := -1;
  iRet:=0;
  UpiRet:=0;
  Short_ID:=Copy(RimParam.ShopID,Length(RimParam.ShopID)-3,4);

  //返回销售汇总上次最大时间戳和当前时间戳:
  MaxStmp:=GetMaxNUM('10',RimParam.ComID,RimParam.CustID,RimParam.ShopID);
  //创建日台帐临时[INF_RECKDAY]:
  case DbType of
   1:
    begin
      Session:='';
      vSALES_DATE:='to_char(A.SALES_DATE)';    //台账日期 转成 varchar
      if ExecSQL(PChar('truncate table INF_SALESUM'),iRet)<>0 then Raise Exception.Create('清除临时表INF_SALESUM错误:'+GetLastError);
    end;
   4:
    begin              
      Session:='session.';
      vSALES_DATE:='ltrim(rtrim(char(A.SALES_DATE)))';   //台账日期 转成 varchar
      Str:=
        'DECLARE GLOBAL TEMPORARY TABLE session.INF_SALESUM( '+
             ' TENANT_ID INTEGER NOT NULL,'+     //R3企业ID
             ' SHOP_ID VARCHAR(20) NOT NULL,'+   //R3门店ID
             ' SHORT_SHOP_ID VARCHAR(4) NOT NULL,'+  //R3门店ID后四位
             ' COM_ID VARCHAR(30) NOT NULL,'+    //RIM烟草公司ID
             ' CUST_ID VARCHAR(30) NOT NULL,'+   //RIM零售户ID
             ' ITEM_ID VARCHAR(30) NOT NULL,'+   //RIM商品ID
             ' GODS_ID CHAR(36) NOT NULL,'+      //R3商品ID
             ' SALES_DATE  VARCHAR(8) NOT NULL,'+  //销售日期
             ' UNIT_ID CHAR(36) NOT NULL,'+       //单位ID
             ' QTY_ORD DECIMAL (18,6),'+         //台账销售数量
             ' AMT DECIMAL (18,6),'+             //台账销售金额
             ' CO_NUM VARCHAR(30) NOT NULL '+    //单据号[台账日期 + 零售户ID+ R3_门店ID后4位]
             ') ON COMMIT PRESERVE ROWS NOT LOGGED WITH REPLACE ';
      if ExecSQL(PChar(Str),iRet)<>0 then Raise Exception.Create('创建临时表INF_SALESUM错误:'+GetLastError);
    end;
  end;

  //第一步: 大于时间戳的台帐插入临时表:
  //条件表: 根据传入条件及指定日期返回对应门店及日期需要上报条件:
  CndTab:='select distinct TENANT_ID,SHOP_ID,SALES_DATE from SAL_SALESORDER where TENANT_ID='+RimParam.TenID+' and SHOP_ID='''+RimParam.ShopID+''' ';
  SALES_DATE:='';
  if Params.findParam('SALES_DATE')<>nil then SALES_DATE:=Params.findParam('SALES_DATE').AsString;
  if SALES_DATE='' then
    CndTab:=CndTab+' and TIME_STAMP>'+MaxStmp+' '
  else
    CndTab:=CndTab+' and ((TIME_STAMP>'+MaxStmp+')or(SALES_DATE='+SALES_DATE+'))'; //前台传入日期
                   
  SalesTab:=
    'select M.TENANT_ID,M.SHOP_ID,S.GODS_ID,M.SALES_DATE,sum(S.CALC_AMOUNT) as CALC_AMOUNT,sum(S.CALC_MONEY) as CALC_MONEY '+
    ' from SAL_SALESORDER M,SAL_SALESDATA S,('+CndTab+') C '+
    ' where M.TENANT_ID=S.TENANT_ID and M.SALES_ID=S.SALES_ID and M.TENANT_ID=C.TENANT_ID and M.SHOP_ID=C.SHOP_ID and '+
    ' M.SALES_DATE=C.SALES_DATE and M.SALES_TYPE in (1,3,4) and M.COMM not in (''02'',''12'') and M.TENANT_ID='+RimParam.TenID+' and M.SHOP_ID='''+RimParam.ShopID+''' '+
    ' group by M.TENANT_ID,M.SHOP_ID,M.SALES_DATE,S.GODS_ID';

  if ExecSQL(PChar('delete from '+Session+'INF_SALESUM'),iRet)<>0 then Raise Exception.Create('删除中间表出错:'+GetLastError);
  Str:='insert into '+Session+'INF_SALESUM(TENANT_ID,SHOP_ID,SHORT_SHOP_ID,COM_ID,CUST_ID,ITEM_ID,GODS_ID,UNIT_ID,SALES_DATE,QTY_ORD,AMT,CO_NUM) '+
    'select A.TENANT_ID,A.SHOP_ID,'''+Short_ID+''' as SHORT_SHOP_ID,'''+RimParam.ComID+''' as COM_ID,'''+RimParam.CustID+''' as CUST_ID,B.SECOND_ID,A.GODS_ID,B.UNIT_ID,'+vSALES_DATE+' as SALES_DATE,'+
    ' (case when '+GetDefaultUnitCalc+'<>0 then cast(A.CALC_AMOUNT as decimal(18,3))/('+GetDefaultUnitCalc+') else A.CALC_AMOUNT end) as SALE_AMT,A.CALC_MONEY,('+vSALES_DATE+' || ''_'' || '''+RimParam.CustID+''' ||''_'' || '''+Short_ID+''') as CO_NUM '+
    ' from ('+SalesTab+')A,VIW_GOODSINFO B '+
    ' where A.TENANT_ID=B.TENANT_ID and A.GODS_ID=B.GODS_ID and B.TENANT_ID='+RimParam.TenID+' and B.RELATION_ID='+InttoStr(NT_RELATION_ID);
  if ExecSQL(PChar(Str),iRet)<>0 then Raise Exception.Create('插入日销售汇总中间表出错:'+GetLastError);
  if iRet=0 then
  begin
    result:=0; //返回没有可上报数据
    Exit; //没有上报数据时则退出;  //Raise Exception.Create('没有可上报销售数据'); //若插入没有记录，退出循环
  end;
  
  //第三步: 每一次执行作为一个事务提交
  //1、删除销售历史数据(先删除表体在删除表头):
  Str:='delete from RIM_RETAIL_CO_LINE A '+
       ' where exists(select B.CO_NUM from RIM_RETAIL_CO B,'+Session+'INF_SALESUM C '+
                    ' where B.COM_ID=C.COM_ID and B.CUST_ID=C.CUST_ID and B.PUH_DATE=C.SALES_DATE and B.COM_ID='''+RimParam.ComID+'''and B.TERM_ID='''+Short_ID+''' and B.CUST_ID='''+RimParam.CustID+''' and A.CO_NUM=B.CO_NUM)';
  if ExecSQL(PChar(Str),iRet)<>0 then Raise Exception.Create('删除历史日销售表体出错：'+GetLastError);
  Str:='delete from RIM_RETAIL_CO A where exists(select 1 from '+Session+'INF_SALESUM B where A.COM_ID=B.COM_ID and A.CUST_ID=B.CUST_ID and A.PUH_DATE=B.SALES_DATE) and A.COM_ID='''+RimParam.ComID+''' and A.TERM_ID='''+Short_ID+''' and A.CUST_ID='''+RimParam.CustID+''' ';
  if ExecSQL(PChar(Str),iRet)<>0 then Raise Exception.Create('删除历史日销售表头出错：'+GetLastError);

  BeginTrans;
  try
    //2、插入日销售台账(先插表头在插入表体):
    Str:='insert into RIM_RETAIL_CO(CO_NUM,CUST_ID,COM_ID,TERM_ID,PUH_DATE,STATUS,PUH_TIME,UPD_DATE,UPD_TIME,QTY_SUM,AMT_SUM) '+
         'select CO_NUM,CUST_ID,COM_ID,SHORT_SHOP_ID,SALES_DATE,''01'' as STATUS,'''+TimetoStr(time())+''','''+FormatDatetime('YYYYMMDD',Date())+''','''+TimetoStr(time())+''',sum(QTY_ORD) as QTY_SUM,sum(AMT) as AMT_SUM '+
         ' from '+Session+'INF_SALESUM group by COM_ID,CUST_ID,SHORT_SHOP_ID,CO_NUM,SALES_DATE';
    if ExecSQL(PChar(Str),UpiRet)<>0 then Raise Exception.Create('插入日销售表头[RIM_RETAIL_CO]出错:'+GetLastError);

    Str:='insert into RIM_RETAIL_CO_LINE(CO_NUM,ITEM_ID,QTY_ORD,AMT,UM_ID,PRICE) '+
         'select CO_NUM,ITEM_ID,QTY_ORD,AMT,'+GetR3ToRimUnit_ID(DbType,'UNIT_ID')+' as UNIT_ID,'+
         '(case when QTY_ORD<>0 then cast(AMT as decimal(18,3))/cast(QTY_ORD as decimal(18,3)) else cast(AMT as decimal(18,3)) end) as PRICE from '+Session+'INF_SALESUM ';
    if ExecSQL(PChar(Str),iRet)<>0 then Raise Exception.Create('插入日销售表体[RIM_RETAIL_CO_LINE]出错:'+GetLastError);

    //3、更新上报时间戳:
    Str:='update RIM_R3_NUM set MAX_NUM='''+UpMaxStmp+''',UPDATE_TIME='''+UpdateTime+''' where COM_ID='''+RimParam.ComID+''' and CUST_ID='''+RimParam.CustID+''' and TYPE=''10'' and TERM_ID='''+RimParam.ShopID+''' ';
    if ExecSQL(PChar(Str),iRet)<>0 then Raise Exception.Create('更新上报时间戳出错:'+GetLastError);

    CommitTrans;
    result:=UpiRet;
  except
    on E:Exception do
    begin
      RollbackTrans;
      WriteToRIM_BAL_LOG(RimParam.LICENSE_CODE,RimParam.CustID,'10','上报日销售错误！','02'); //写日志
      Raise;
    end;
  end;

  //执行成功写日志:
  WriteToRIM_BAL_LOG(RimParam.LICENSE_CODE,RimParam.CustID,'10','上报日销售成功！','01');
end;

end.















