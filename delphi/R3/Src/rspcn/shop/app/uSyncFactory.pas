unit uSyncFactory;

interface

uses
  Windows, Messages, Forms, SysUtils, Classes, ZDataSet, ZdbFactory, ZBase,
  ObjCommon, ZLogFile, Dialogs, DB, uFnUtil, math, Registry, Nb30, WinSock,
  ActiveX, RzStatus;

const
  MSC_SET_MAX=WM_USER+1;
  MSC_SET_POSITION=WM_USER+2;
  MSC_SET_CAPTION=WM_USER+3;
  MSC_SET_CLOSE=WM_USER+4;

  MAX_SYNC_RECORD_COUNT = 500;
  MAX_SYNC_ORDER_COUNT  = 100;

type
  PSynTableInfo=^TSynTableInfo;
  TSynTableInfo=record
    tbName:string;//表名
    tbTitle:string;//说明
    keyFields:string;//关键字段
    tableFields:string;//同步字段
    selectLocalSQL:string;//本地openSQL，用于上传下载SQL不一致的情况
    selectRemoteSQL:string;//服务端openSQL，用于上传下载SQL不一致的情况
    selectSQL:string;//默认openSQL
    whereStr:string;//where条件
    synFlag:integer;
    keyFlag:integer; //0是按表结构关键字 1是按业务关键字
    syncTenantId:string;//时间戳控制TENANT_ID
    syncShopId:string;//时间戳控制SHOP_ID
    isSyncUp:string;//是否上传
    isSyncDown:string;//是否下载
    isUpdComm:string;//上传后是否更新本地comm
  end;

  TSyncFactory=class
  protected
    _Start:Int64;
    LoginStart:Int64;
    FList:TList;
    FStoped: boolean;
    FProHandle:Hwnd;
    FProTitle:string;
    FinishIndex:integer;
    procedure SetTicket;
    function  GetTicket:Int64;
    procedure ClearSyncList;
    procedure ReadTimeStamp;
    function  GetFactoryName(node:PSynTableInfo):string;
    function  GetTableFields(tbName:string;alias:string=''):string;
    procedure SetStoped(const Value: boolean);
    procedure SetProHandle(const Value: Hwnd);
    procedure SetProTitle(const Value: string);
    procedure SetProCaption;
    procedure SetProMax(max:integer);
    procedure SetProPosition(position:integer);
  private
    ThreadLock:TRTLCriticalSection;
    CloseAccDate:integer; // 数据恢复关账日期
    LoginSyncDate:integer; // 登录同步日期
    LastLoginSyncDate,LastLogoutSyncDate:integer; // 上次登录/退出同步日期
    RckBeginDate:integer; // 日帐上传控制，只上传>=RckBeginDate之的日帐
    FLoginId: string;
    Ftimered: boolean;
    FtimerTerminted: boolean;
    function  CheckRemoteData(AppHandle:HWnd):integer;//0:未还原 1:文件还原 2:服务端还原
    procedure BackUpDBFile;
    procedure InitTenant;
    procedure InitGodsInfo;
    // 0:默认同步 1:注册同步 2:正常同步 3:恢复同步
    procedure InitSyncRelationList(SyncType:integer=0);
    procedure InitSyncBasicList(SyncType:integer=0);
    procedure SyncList;

    procedure SyncBizData(SyncFlag:integer=0;BeginDate:string='');// 0:上传 1:下载
    procedure BeforeSyncBiz(DataSet:TZQuery;FieldName:string;SyncFlag:integer);
    procedure UploadStockOrder;
    procedure UploadSalesOrder;
    procedure UploadChangeOrder;
    procedure UploadRckDays;

    // 数据恢复时批量下载
    procedure CreateBatch(var rs: TZQuery; src: TZQuery; FieldName: string; FieldType: TFieldType);
    procedure DownloadSalesOrder(BeginDate:string='');
    procedure DownloadStockOrder(BeginDate:string='');
    procedure DownloadChangeOrder(BeginDate:string='');
    procedure DownloadRckDays(BeginDate:string='');

    procedure SyncStorage;
    procedure GetCloseAccDate;
    procedure GetRckBeginDate;
    function  CheckNeedLoginSync:boolean;
    function  CheckNeedLoginSyncBizData:boolean;
    // 下载合理库存
    procedure SyncUpperAmount;
    // 检测数据备份
    function  CheckBackUpDBFile(PHWnd:THandle):boolean;
    // 登陆日志
    function  GetLoginTimeStamp(iDbType:integer):string;
    procedure AddLoginLog(info:string='');
    procedure AddLogoutLog;

    procedure SetLoginId(const Value: string);
    procedure Settimered(const Value: boolean);
    procedure SettimerTerminted(const Value: boolean);
    function  Gettimered: boolean;
  public
    constructor Create;
    destructor  Destroy;override;
    // 数据同步日志
    procedure AddSyncLog(info:string);
    // 单表同步
    procedure SyncSingleTable(n:PSynTableInfo;timeStampNoChg:integer=1;SaveCtrl:boolean=true);
    // 0:默认同步 1:注册同步 2:正常同步 3:恢复同步
    procedure SyncBasic(SyncType:integer=0);
    // 检测文件是否是有效的数据文件
    function  CheckValidDBFile(src:string):boolean;
    // 等待定时任务结束
    procedure WaitForSync;
    // 登录时同步
    procedure LoginSync(PHWnd:THandle);
    // 退出时同步
    procedure LogoutSync(PHWnd:THandle);
    // 数据恢复时同步
    procedure RecoverySync(PHWnd:THandle;BeginDate:string='');
    // 注册时同步
    procedure RegisterSync(PHWnd:THandle);
    // 连锁版交班结账时候同步
    procedure CloseForDaySync(PHWnd:THandle);
    // 灾难恢复时关账
    procedure RecoveryClose(CloseDate:string);
    // 数据库锁定
    function  DBLocked:boolean;
    function  SyncLockCheck(PHWnd:THandle;tip:string=''):boolean;
    function  SyncLockDb:boolean;
    //同步心跳
    procedure TimerSync;
    procedure TimerSyncSales;
    procedure TimerSyncStock;
    procedure TimerSyncChange;
    procedure TimerSyncStorage;
    procedure TimerSyncMessage;

    function  GetSynTimeStamp(tenantId,tbName:string;SHOP_ID:string='#'):int64;
    procedure SetSynTimeStamp(tenantId,tbName:string;TimeStamp:int64;SHOP_ID:string='#');
    property  Stoped:boolean read FStoped write SetStoped;
    property  ProHandle:Hwnd read FProHandle write SetProHandle;
    property  ProTitle:string read FProTitle write SetProTitle;
    property  LoginId:string read FLoginId write SetLoginId;

    property  timered:boolean read Gettimered write Settimered;
    property  timerTerminted:boolean read FtimerTerminted write SettimerTerminted;
  end;

  TTimeSyncThread=class(TThread)
  protected
    procedure Execute; override;
  public
    constructor Create(CreateSuspended: Boolean);
    destructor Destroy; override;
  end;

var SyncFactory:TSyncFactory;

implementation

uses udllDsUtil,udllGlobal,uTokenFactory,udataFactory,IniFiles,ufrmSyncData,
     uRspSyncFactory,uRightsFactory,dllApi,ufrmSysDefine,uRtcSyncFactory,
     ufrmStocksCalc,ufrmSelectRecType,ufrmUnLockGuide,uCommand,ufrmHintMsg,
     uPlayerFactory,udllShopUtil,uXsmFactory;

constructor TSyncFactory.Create;
begin
  InitializeCriticalSection(ThreadLock);
  Ftimered := false;
  timerTerminted := false;
  CloseAccDate := -1;
  RckBeginDate := -1;
  LoginSyncDate := 0;
  LastLoginSyncDate := 0;
  LastLogoutSyncDate := 0;
  FList := TList.Create;
end;

destructor TSyncFactory.Destroy;
var i:integer;
begin
  for i:=0 to FList.Count -1 do Dispose(FList[i]);
  FList.Free;
  ftimered := false;
  DeleteCriticalSection(ThreadLock);
  inherited;
end;

function TSyncFactory.GetFactoryName(node: PSynTableInfo): string;
begin
  result := 'TSyncSingleTableV60';
end;

function TSyncFactory.GetTicket:int64;
begin
  result := GetTickCount - _Start;
end;

procedure TSyncFactory.SetTicket;
begin
  _Start := GetTickCount;
end;

procedure TSyncFactory.ReadTimeStamp;
var Params:TftParamList;
begin
  if token.tenantId='' then Exit;
  Params := TftParamList.Create(nil);
  try
    Params.ParamByName('TENANT_ID').AsInteger := strtoint(token.tenantId);
    if dataFactory.iDbType <> 5 then
      begin
        dataFactory.sqlite.ExecProc('TGetSyncTimeStamp',Params);
      end;
    dataFactory.ExecProc('TGetSyncTimeStamp',Params);
  finally
    Params.Free;
  end;
end;

function TSyncFactory.GetSynTimeStamp(tenantId,tbName:string;SHOP_ID:string='#'):int64;
var rs:TZQuery;
begin
  if SHOP_ID='' then SHOP_ID:='#';
  rs := TZQuery.Create(nil);
  try
    rs.SQL.Text := 'select TIME_STAMP from SYS_SYNC_CTRL where TENANT_ID=:TENANT_ID and SHOP_ID=:SHOP_ID and TABLE_NAME=:TABLE_NAME';
    rs.ParambyName('TENANT_ID').AsInteger := strtoint(tenantId);
    rs.ParamByName('SHOP_ID').AsString := SHOP_ID;
    rs.ParamByName('TABLE_NAME').AsString := tbName;
    dataFactory.sqlite.Open(rs);
    if rs.IsEmpty then result := 0 else result := rs.Fields[0].Value;
  finally
    rs.Free;
  end;
end;

procedure TSyncFactory.SetSynTimeStamp(tenantId,tbName:string;TimeStamp:int64;SHOP_ID:string='#');
var
  r:integer;
  rs:TZQuery;
begin
  if SHOP_ID='' then SHOP_ID:='#';

  r := dataFactory.sqlite.ExecSQL('update SYS_SYNC_CTRL set TIME_STAMP='+inttostr(TimeStamp)+' where TENANT_ID='+tenantId+' and SHOP_ID='''+SHOP_ID+''' and TABLE_NAME='''+tbName+'''');
  if r=0 then
     dataFactory.sqlite.ExecSQL('insert into SYS_SYNC_CTRL(TENANT_ID,SHOP_ID,TABLE_NAME,TIME_STAMP) values('+tenantId+','''+SHOP_ID+''','''+tbName+''','+inttostr(TimeStamp)+')');

  //更新服务端时间戳
  rs := TZQuery.Create(nil);
  try
    r := dataFactory.remote.ExecSQL('update SYS_SYNC_CTRL set TIME_STAMP='+inttostr(TimeStamp)+' where TENANT_ID='+token.tenantId+' and SHOP_ID='''+SHOP_ID+''' and TABLE_NAME='''+tbName+''' and TIME_STAMP<'+inttostr(TimeStamp));
    if r=0 then
       begin
         rs.SQL.Text := 'select 1 from SYS_SYNC_CTRL where TENANT_ID=:TENANT_ID and SHOP_ID=:SHOP_ID and TABLE_NAME=:TABLE_NAME';
         rs.Params.ParamByName('TENANT_ID').AsInteger := strtoint(token.tenantId);
         rs.Params.ParamByName('SHOP_ID').AsString := SHOP_ID;
         rs.Params.ParamByName('TABLE_NAME').AsString := tbName;
         try
           TZQuery(rs).Data := dbHelp.OpenSQL(TZQuery(rs).SQL.Text,TftParamList.Encode(TZQuery(rs).Params));
         except
           Raise Exception.Create(StrPas(dbHelp.getLastError));
         end;
         if rs.IsEmpty then
            dataFactory.remote.ExecSQL('insert into SYS_SYNC_CTRL(TENANT_ID,SHOP_ID,TABLE_NAME,TIME_STAMP) values ('+token.tenantId+','''+SHOP_ID+''','''+tbName+''','+inttostr(TimeStamp)+')');
       end;
  finally
    rs.Free;
  end;
end;

function TSyncFactory.GetTableFields(tbName:string;alias:string=''):string;
var
  ls:TZQuery;
  i:integer;
  selectFields:string;
begin
  ls := TZQuery.Create(nil);
  try
    ls.SQL.Text := 'select * from '+tbName+' limit 1';
    dataFactory.sqlite.Open(ls);
    for i:=0 to ls.FieldList.Count - 1 do
      begin
        if selectFields<>'' then selectFields := selectFields + ',';
        if alias = '' then
           selectFields := selectFields + ls.FieldList.Fields[i].FieldName
        else
           selectFields := selectFields + alias + '.' + ls.FieldList.Fields[i].FieldName
      end;
    result := selectFields;
  finally
    ls.Free;
  end;
end;

procedure TSyncFactory.SyncSingleTable(n:PSynTableInfo;timeStampNoChg:integer=1;SaveCtrl:boolean=true);
  procedure UploadSingleTable(rs_l:TZQuery;ZClassName:string;n:PSynTableInfo;Params:TftParamList);
  var
    i:integer;
    ss:TZQuery;
    tmpObj:TRecord_;
  begin
    ss := TZQuery.Create(nil);
    try
      if rs_l.IsEmpty then Exit;

      SetTicket;

      if rs_l.RecordCount <= MAX_SYNC_RECORD_COUNT then
         begin
           ss.SyncDelta := rs_l.SyncDelta;
           if not ss.IsEmpty then
              begin
                try
                  dataFactory.remote.UpdateBatch(TZQuery(ss).Delta,ZClassName,TftParamList.Encode(Params));
                except
                  Raise Exception.Create(StrPas(dbHelp.getLastError));
                end;
              end;
         end
      else //分包处理
         begin
           i := 0;
           rs_l.First;
           tmpObj := TRecord_.Create;
           try
             ss.FieldDefs.Assign(rs_l.FieldDefs);
             ss.CreateDataSet;
             while not rs_l.Eof do
               begin
                 ss.Append;
                 tmpObj.ReadFromDataSet(rs_l);
                 tmpObj.WriteToDataSet(ss);
                 inc(i);
                 rs_l.Next;
                 if (i >= MAX_SYNC_RECORD_COUNT) or (rs_l.Eof) then
                    begin
                      try
                        dataFactory.remote.UpdateBatch(TZQuery(ss).Delta,ZClassName,TftParamList.Encode(Params));
                      except
                        Raise Exception.Create(StrPas(dbHelp.getLastError));
                      end;
                      LogFile.AddLogFile(0,'上传<'+n^.tbName+'><'+n^.syncTenantId+' '+n^.syncShopId+'>本次提交记录数:'+inttostr(ss.RecordCount));
                      i := 0;
                      ss.EmptyDataSet;
                    end;
               end;
           finally
             tmpObj.Free;
           end;
        end;

      if n^.isUpdComm <> '0' then
         begin
           rs_l.Delete;
           dataFactory.sqlite.UpdateBatch(rs_l,ZClassName,Params);
         end;

      LogFile.AddLogFile(0,'上传<'+n^.tbName+'><'+n^.syncTenantId+' '+n^.syncShopId+'>保存时长:'+inttostr(GetTicket));
    finally
      ss.Free;
    end;
  end;

  procedure DownloadSingleTable(rs_r:TZQuery;ZClassName:string;n:PSynTableInfo;Params:TftParamList);
  var
    i:integer;
    ss:TZQuery;
    tmpObj:TRecord_;
  begin
    ss := TZQuery.Create(nil);
    try
      if rs_r.IsEmpty then Exit;

      SetTicket;

      if rs_r.RecordCount <= MAX_SYNC_RECORD_COUNT then
         begin
           ss.SyncDelta := rs_r.SyncDelta;
           if not ss.IsEmpty then
              dataFactory.sqlite.UpdateBatch(ss,ZClassName,Params);
         end
     else //分包处理
         begin
           i := 0;
           rs_r.First;
           tmpObj := TRecord_.Create;
           try
             ss.FieldDefs.Assign(rs_r.FieldDefs);
             ss.CreateDataSet;
             while not rs_r.Eof do
               begin
                 ss.Append;
                 tmpObj.ReadFromDataSet(rs_r);
                 tmpObj.WriteToDataSet(ss);
                 inc(i);
                 rs_r.Next;
                 if (i >= MAX_SYNC_RECORD_COUNT) or (rs_r.Eof) then
                    begin
                      dataFactory.sqlite.UpdateBatch(ss,ZClassName,Params);
                      LogFile.AddLogFile(0,'下载<'+n^.tbName+'><'+n^.syncTenantId+' '+n^.syncShopId+'>本次提交记录数:'+inttostr(ss.RecordCount));
                      i := 0;
                      ss.EmptyDataSet;
                    end;
               end;
           finally
             tmpObj.Free;
           end;
        end;

      LogFile.AddLogFile(0,'下载<'+n^.tbName+'><'+n^.syncTenantId+':'+n^.syncShopId+'>保存时长:'+inttostr(GetTicket));
    finally
      ss.Free;
    end;
  end;
var
  SFVersion:string;
  rs_l,rs_r:TZQuery;
  LCLVersion:boolean;
  ZClassName:string;
  openSQL:string;
  Params:TftParamList;
  MaxTimeStamp,LastTimeStamp:int64;
begin
  if (n^.isSyncUp <> '1') and (n^.isSyncDown <> '1') then Exit;

  SFVersion := dllGlobal.GetSFVersion;
  LCLVersion := (SFVersion = '.LCL');

  if trim(n^.syncTenantId) = '' then n^.syncTenantId := token.tenantId;
  if trim(n^.syncShopId) = '' then n^.syncShopId := '#';

  ZClassName := GetFactoryName(n);
  LastTimeStamp := GetSynTimeStamp(n^.syncTenantId,n^.tbName,n^.syncShopId);
  MaxTimeStamp := LastTimeStamp;

  rs_l := TZQuery.Create(nil);
  rs_r := TZQuery.Create(nil);
  Params := TftParamList.Create(nil);
  try
    rs_l.Close;
    rs_r.Close;

    Params.ParamByName('TENANT_ID').AsInteger := strtoint(token.tenantId);
    Params.ParamByName('SHOP_ID').AsString := token.shopId;
    Params.ParamByName('KEY_FLAG').AsInteger := n^.keyFlag;
    Params.ParamByName('TABLE_NAME').AsString := n^.tbName;
    Params.ParamByName('KEY_FIELDS').AsString := n^.keyFields;
    Params.ParamByName('TIME_STAMP').Value := LastTimeStamp;
    Params.ParamByName('LAST_TIME_STAMP').Value := LastTimeStamp;
    Params.ParamByName('TIME_STAMP_NOCHG').AsInteger := timeStampNoChg;
    Params.ParamByName('WHERE_STR').AsString := n^.whereStr;
    if trim(n^.tableFields) <> '' then
       Params.ParamByName('TABLE_FIELDS').AsString := n^.tableFields
    else
       Params.ParamByName('TABLE_FIELDS').AsString := GetTableFields(n^.tbName);

    if n^.isSyncUp = '1' then
       begin
         LogFile.AddLogFile(0,'开始上传<'+n^.tbName+'><'+n^.syncTenantId+':'+n^.syncShopId+'>上次时间:'+inttostr(LastTimeStamp));
         Params.ParamByName('SYN_COMM').AsBoolean := true;
         Params.ParamByName('Transed').AsBoolean := false;
         SetTicket;

         if (trim(n^.selectSQL) = '') and (trim(n^.selectLocalSQL) = '') then
            dataFactory.sqlite.Open(rs_l,ZClassName,Params)
         else
           begin
             if trim(n^.selectLocalSQL) <> '' then
                openSQL := n^.selectLocalSQL
             else
                openSQL := n^.selectSQL;
             rs_l.SQL.Text := openSQL;
             rs_l.Params := Params;
             dataFactory.sqlite.Open(rs_l);
           end;

         LogFile.AddLogFile(0,'上传<'+n^.tbName+'><'+n^.syncTenantId+':'+n^.syncShopId+'>打开时长:'+inttostr(GetTicket)+'  记录数:'+inttostr(rs_l.RecordCount));

         if not rs_l.IsEmpty then
            begin
              rs_l.Last;
              if StrtoInt64(rs_l.FieldByName('TIME_STAMP').AsString) > MaxTimeStamp then
                 MaxTimeStamp := StrtoInt64(rs_l.FieldByName('TIME_STAMP').AsString);
            end;
       end;

    if n^.isSyncDown = '1' then
       begin
         LogFile.AddLogFile(0,'开始下载<'+n^.tbName+'><'+n^.syncTenantId+':'+n^.syncShopId+'>上次时间:'+inttostr(LastTimeStamp));
         Params.ParamByName('SYN_COMM').AsBoolean := false;
         Params.ParamByName('Transed').AsBoolean := true;
         SetTicket;

         if (trim(n^.selectSQL) = '') and (trim(n^.selectRemoteSQL) = '') then
           begin
             try
               TZQuery(rs_r).Data := dbHelp.OpenNS(ZClassName,TftParamList.Encode(Params));
             except
               Raise Exception.Create(StrPas(dbHelp.getLastError));
             end;
           end
         else
           begin
             if trim(n^.selectRemoteSQL) <> '' then
                openSQL := n^.selectRemoteSQL
             else
                openSQL := n^.selectSQL;
             rs_r.SQL.Text := openSQL;
             rs_r.Params := Params;
             try
               TZQuery(rs_r).Data := dbHelp.OpenSQL(TZQuery(rs_r).SQL.Text,TftParamList.Encode(TZQuery(rs_r).Params));
             except
               Raise Exception.Create(StrPas(dbHelp.getLastError));
             end;
           end;

         LogFile.AddLogFile(0,'下载<'+n^.tbName+'><'+n^.syncTenantId+':'+n^.syncShopId+'>打开时长:'+inttostr(GetTicket)+'  记录数:'+inttostr(rs_r.RecordCount));

         if not rs_r.IsEmpty then
            begin
              rs_r.Last;
              if StrtoInt64(rs_r.FieldByName('TIME_STAMP').AsString) > MaxTimeStamp then
                 MaxTimeStamp := StrtoInt64(rs_r.FieldByName('TIME_STAMP').AsString);
            end;
       end;

     if LCLVersion then
        begin
          if n^.isSyncUp = '1' then
             begin
               UploadSingleTable(rs_l,ZClassName,n,Params);
               SetProPosition(FinishIndex * 100 + 50);
             end;
          if n^.isSyncDown = '1' then
             begin
               DownloadSingleTable(rs_r,ZClassName,n,Params);
               SetProPosition(FinishIndex * 100 + 100);
             end;
        end
     else
        begin
          if n^.isSyncDown = '1' then
             begin
               DownloadSingleTable(rs_r,ZClassName,n,Params);
               SetProPosition(FinishIndex * 100 + 50);
             end;
          if n^.isSyncUp = '1' then
             begin
               UploadSingleTable(rs_l,ZClassName,n,Params);
               SetProPosition(FinishIndex * 100 + 100);
             end;
        end;

    if SaveCtrl and (MaxTimeStamp > LastTimeStamp) then
       SetSynTimeStamp(n^.syncTenantId,n^.tbName,MaxTimeStamp,n^.syncShopId);
  finally
    Params.Free;
    rs_l.Free;
    rs_r.Free;
  end;
end;

procedure TSyncFactory.SetStoped(const Value: boolean);
begin
  FStoped := Value;
end;

procedure TSyncFactory.SyncList;
var i:integer;
begin
  SetProMax(FList.Count * 100);
  FinishIndex := 0;
  SetProPosition(0);
  for i:=0 to FList.Count -1 do
  begin
    case PSynTableInfo(FList[i])^.synFlag of
    0,1,2,3,4,10,20,21,22,23,29,33:
      begin
        ProTitle := '<'+PSynTableInfo(FList[i])^.tbtitle+'>...';
        SyncSingleTable(FList[i]);
        inc(FinishIndex);
        SetProPosition(FinishIndex * 100);
      end;
    end;
  end;
end;

procedure TSyncFactory.SyncBasic(SyncType:integer=0);
begin
  try
    InitSyncRelationList(SyncType);
    SyncList;
    dllGlobal.Refresh('CA_RELATIONS');

    InitSyncBasicList(SyncType);
    SyncList;

    SyncUpperAmount;
  finally
    ReadTimeStamp;
  end
end;

procedure TSyncFactory.ClearSyncList;
var i:integer;
begin
  for i:=0 to FList.Count -1 do Dispose(FList[i]);
  FList.Clear;
end;

procedure TSyncFactory.InitSyncRelationList(SyncType:integer=0);
var n:PSynTableInfo;
begin
  ClearSyncList;

  new(n);
  n^.tbname := 'CA_RELATIONS';
  n^.keyFields := 'RELATION_ID;TENANT_ID;RELATI_ID';
  n^.whereStr := '(TENANT_ID = :TENANT_ID or RELATI_ID = :TENANT_ID) and TIME_STAMP > :TIME_STAMP';
  n^.synFlag := 1;
  n^.keyFlag := 1;
  n^.tbtitle := '供应关系';
  if dllGlobal.AuthMode = 1 then n^.isSyncUp := '1';
  n^.isSyncDown := '1';
  FList.Add(n);

  new(n);
  n^.tbname := 'CA_RELATION';
  n^.keyFields := 'TENANT_ID;RELATION_ID';
  n^.selectRemoteSQL :=
    ' select * from ( '+
    ' select i.RELATION_ID,i.TENANT_ID,i.RELATION_NAME,i.RELATION_SPELL,i.REMARK,i.CREA_DATE,i.COMM, '+
    ' case when i.TIME_STAMP > r.TIME_STAMP then i.TIME_STAMP else r.TIME_STAMP end TIME_STAMP '+
    ' from CA_RELATION i,'+
    ' ( '+
    '  select j.TENANT_ID,s.TIME_STAMP from CA_RELATION j,CA_RELATIONS s '+
    '  where j.RELATION_ID=s.RELATION_ID and s.RELATI_ID=:TENANT_ID '+
    ' ) r where i.TENANT_ID=r.TENANT_ID and (i.TIME_STAMP>:TIME_STAMP or r.TIME_STAMP>:TIME_STAMP) '+
    ' union all '+
    ' select i.RELATION_ID,i.TENANT_ID,i.RELATION_NAME,i.RELATION_SPELL,i.REMARK,i.CREA_DATE,i.COMM,i.TIME_STAMP '+
    ' from CA_RELATION i where TENANT_ID=:TENANT_ID and TIME_STAMP>:TIME_STAMP '+
    ' ) t order by TIME_STAMP asc ';
  n^.synFlag := 2;
  n^.keyFlag := 0;
  n^.tbtitle := '供应链';
  if dllGlobal.AuthMode = 1 then n^.isSyncUp := '1';
  n^.isSyncDown := '1';
  n^.isUpdComm := '0';
  FList.Add(n);
end;

// 0:默认同步 1:注册同步 2:正常同步 3:恢复同步
procedure TSyncFactory.InitSyncBasicList(SyncType:integer=0);
  procedure InitSyncBasicUpAndDown(var n:PSynTableInfo);
  begin
    if SyncType = 1 then
       begin
         n^.isSyncDown := '1';
       end
    else if SyncType = 2 then
       begin
         if dllGlobal.GetSFVersion = '.LCL' then
            n^.isSyncUp := '1'
         else
            n^.isSyncDown := '1'
       end
    else if SyncType = 3 then
       begin
         n^.isSyncDown := '1';
       end
    else
       begin
         n^.isSyncUp := '1';
         n^.isSyncDown := '1';
       end
  end;

  procedure InitSyncRelationUpAndDown(var n:PSynTableInfo;tenantId:string);
  begin
    if SyncType = 1 then
       begin
         n^.isSyncDown := '1';
       end
    else if SyncType = 2 then
       begin
         if dllGlobal.GetSFVersion = '.LCL' then
            begin
              if tenantId = token.tenantId then
                 n^.isSyncUp := '1'
              else
                 n^.isSyncDown := '1'
            end
         else
            begin
              n^.isSyncDown := '1'
            end;
       end
    else if SyncType = 3 then
       begin
         n^.isSyncDown := '1';
       end
    else
       begin
         n^.isSyncUp := '1';
         n^.isSyncDown := '1';
       end
  end;

  procedure InitList0;
  var
    rs:TZQuery;
    n:PSynTableInfo;
  begin
    new(n);
    n^.tbname := 'CA_SHOP_INFO';
    n^.keyFields := 'TENANT_ID;SHOP_ID';
    n^.synFlag := 0;
    n^.keyFlag := 0;
    n^.tbtitle := '门店资料';
    InitSyncBasicUpAndDown(n);
    FList.Add(n);

    new(n);
    n^.tbname := 'CA_DEPT_INFO';
    n^.keyFields := 'TENANT_ID;DEPT_ID';
    n^.synFlag := 0;
    n^.keyFlag := 0;
    n^.tbtitle := '部门资料';
    InitSyncBasicUpAndDown(n);
    FList.Add(n);

    new(n);
    n^.tbname := 'CA_DUTY_INFO';
    n^.keyFields := 'TENANT_ID;DUTY_ID';
    n^.synFlag := 0;
    n^.keyFlag := 0;
    n^.tbtitle := '职务资料';
    InitSyncBasicUpAndDown(n);
    FList.Add(n);

    new(n);
    n^.tbname := 'CA_ROLE_INFO';
    n^.keyFields := 'TENANT_ID;ROLE_ID';
    n^.synFlag := 0;
    n^.keyFlag := 0;
    n^.tbtitle := '角色资料';
    InitSyncBasicUpAndDown(n);
    FList.Add(n);

    new(n);
    n^.tbname := 'CA_USERS';
    n^.keyFields := 'TENANT_ID;USER_ID';
    n^.synFlag := 0;
    n^.keyFlag := 0;
    n^.tbtitle := '用户资料';
    InitSyncBasicUpAndDown(n);
    FList.Add(n);

    new(n);
    n^.tbname := 'CA_RIGHTS';
    n^.keyFields := 'TENANT_ID;MODU_ID;ROLE_ID;ROLE_TYPE';
    n^.synFlag := 0;
    n^.keyFlag := 1;
    n^.tbtitle := '操作权限';
    InitSyncBasicUpAndDown(n);
    FList.Add(n);

    new(n);
    n^.tbname := 'PUB_PRICEGRADE';
    n^.keyFields := 'TENANT_ID;PRICE_ID';
    n^.synFlag := 0;
    n^.keyFlag := 0;
    n^.tbtitle := '客户等级';
    InitSyncBasicUpAndDown(n);
    FList.Add(n);

    rs := dllGlobal.GetZQueryFromName('CA_RELATIONS');
    if rs.Locate('RELATION_ID',1000006,[]) then
       begin
         new(n);
         n^.tbname := 'PUB_PRICEGRADE';
         n^.keyFields := 'TENANT_ID;PRICE_ID';
         n^.synFlag := 0;
         n^.keyFlag := 0;
         n^.tbtitle := '客户等级';
         n^.whereStr := 'TENANT_ID='+rs.FieldByName('P_TENANT_ID').AsString+' and TIME_STAMP>:TIME_STAMP';
         n^.syncTenantId := rs.FieldByName('P_TENANT_ID').AsString;
         n^.isSyncDown := '1';
         FList.Add(n);

         new(n);
         n^.tbname := 'PUB_UNION_INFO';
         n^.keyFields := 'TENANT_ID;UNION_ID';
         n^.synFlag := 0;
         n^.keyFlag := 0;
         n^.tbtitle := '商盟档案';
         n^.whereStr := 'UNION_ID in (select PRICE_ID from PUB_PRICEGRADE where TENANT_ID='+rs.FieldByName('P_TENANT_ID').AsString+') and TIME_STAMP>:TIME_STAMP';
         n^.syncTenantId := rs.FieldByName('P_TENANT_ID').AsString;
         n^.isSyncDown := '1';
         FList.Add(n);

         if dllGlobal.GetSFVersion = '.LCL' then
            begin
              new(n);
              n^.tbname := 'PUB_UNION_INDEX';
              n^.keyFields := 'TENANT_ID;UNION_ID;INDEX_ID';
              n^.keyFlag := 0;
              n^.synFlag := 0;
              n^.tbtitle := '商盟指标';
              n^.whereStr := 'UNION_ID in (select PRICE_ID from PUB_PRICEGRADE where TENANT_ID='+rs.FieldByName('P_TENANT_ID').AsString+') and TIME_STAMP>:TIME_STAMP';
              n^.syncTenantId := rs.FieldByName('P_TENANT_ID').AsString;
              n^.isSyncDown := '1';
              FList.Add(n);
            end;
      end;

    new(n);
    n^.tbname := 'PUB_CLIENTINFO';
    n^.keyFields := 'TENANT_ID;CLIENT_ID';
    n^.synFlag := 0;
    n^.keyFlag := 0;
    n^.tbtitle := '客户档案';
    InitSyncBasicUpAndDown(n);
    FList.Add(n);

    new(n);
    n^.tbname := 'PUB_CUSTOMER';
    n^.keyFields := 'TENANT_ID;CUST_ID';
    n^.synFlag := 0;
    n^.keyFlag := 0;
    n^.tbtitle := '会员档案';
    InitSyncBasicUpAndDown(n);
    FList.Add(n);

    new(n);
    n^.tbname := 'PUB_CUSTOMER_EXT';
    n^.keyFields := 'TENANT_ID;UNION_ID;CUST_ID;INDEX_ID';
    n^.synFlag := 0;
    n^.keyFlag := 1;
    n^.tbtitle := '会员档案';
    InitSyncBasicUpAndDown(n);
    FList.Add(n);

    new(n);
    n^.tbname := 'PUB_GOODSINFOEXT';
    n^.keyFields := 'TENANT_ID;GODS_ID';
    n^.synFlag := 0;
    n^.keyFlag := 0;
    n^.tbtitle := '最新进价';
    InitSyncBasicUpAndDown(n);
    FList.Add(n);

    new(n);
    n^.tbname := 'CA_LOGIN_INFO';
    n^.keyFields := 'TENANT_ID;LOGIN_ID';
    n^.synFlag := 0;
    n^.keyFlag := 0;
    n^.tbtitle := '登录日志';
    if SyncType in [0,2] then n^.isSyncUp := '1';
    FList.Add(n);
  end;

  procedure InitList00;
  var n:PSynTableInfo;
  begin
    new(n);
    n^.tbname := 'PUB_GOODSPRICE';
    n^.keyFields := 'TENANT_ID;GODS_ID;SHOP_ID;PRICE_ID';
    if token.shopId = (token.tenantId + '0001') then
       n^.whereStr := 'TENANT_ID=:TENANT_ID and SHOP_ID=:SHOP_ID and TIME_STAMP>:TIME_STAMP'
    else
       n^.whereStr := 'TENANT_ID=:TENANT_ID and (SHOP_ID=:SHOP_ID or SHOP_ID='''+token.tenantId+'0001'') and TIME_STAMP>:TIME_STAMP';
    n^.synFlag := 0;
    n^.keyFlag := 0;
    n^.syncShopId := token.shopId;
    n^.tbtitle := '最新售价';
    InitSyncBasicUpAndDown(n);
    FList.Add(n);
  end;

  procedure InitList2(whereStr,syncTenantId:string);
  var n:PSynTableInfo;
  begin
    new(n);
    n^.tbname := 'PUB_CODE_INFO';
    n^.keyFields := 'TENANT_ID;CODE_ID;CODE_TYPE';
    n^.whereStr := whereStr;
    n^.synFlag := 2;
    n^.keyFlag := 0;
    n^.syncTenantId := syncTenantId;
    n^.tbtitle := '其他编码';
    InitSyncRelationUpAndDown(n,syncTenantId);
    FList.Add(n);

    new(n);
    n^.tbname := 'PUB_GOODSSORT';
    n^.keyFields := 'TENANT_ID;SORT_ID;SORT_TYPE';
    n^.whereStr := whereStr;
    n^.synFlag := 2;
    n^.keyFlag := 0;
    n^.syncTenantId := syncTenantId;
    n^.tbtitle := '货品分类';
    InitSyncRelationUpAndDown(n,syncTenantId);
    FList.Add(n);

    new(n);
    n^.tbname := 'PUB_COLOR_INFO';
    n^.keyFields := 'TENANT_ID;COLOR_ID';
    n^.whereStr := whereStr;
    n^.synFlag := 2;
    n^.keyFlag := 0;
    n^.syncTenantId := syncTenantId;
    n^.tbtitle := '颜色档案';
    InitSyncRelationUpAndDown(n,syncTenantId);
    FList.Add(n);

    new(n);
    n^.tbname := 'PUB_SIZE_INFO';
    n^.keyFields := 'TENANT_ID;SIZE_ID';
    n^.whereStr := whereStr;
    n^.synFlag := 2;
    n^.keyFlag := 0;
    n^.syncTenantId := syncTenantId;
    n^.tbtitle := '尺码档案';
    InitSyncRelationUpAndDown(n,syncTenantId);
    FList.Add(n);

    new(n);
    n^.tbname := 'PUB_MEAUNITS';
    n^.keyFields := 'TENANT_ID;UNIT_ID';
    n^.whereStr := whereStr;
    n^.synFlag := 2;
    n^.keyFlag := 0;
    n^.syncTenantId := syncTenantId;
    n^.tbtitle := '计量单位';
    InitSyncRelationUpAndDown(n,syncTenantId);
    // 上传非烟供应链单位
    if (syncTenantId = FY_TENANT_ID) and (dllGlobal.GetSFVersion = '.LCL') then
       begin
         n^.isSyncUp := '1';
       end;
    FList.Add(n);
  end;

  procedure InitList3;
  var rs:TZQuery;
      n:PSynTableInfo;
      str,relationType,pid,cid:string;
  begin
    str :=
      'select b.ROWS_ID,b.TENANT_ID,b.GODS_ID,b.PROPERTY_01,b.PROPERTY_02,b.UNIT_ID,b.BARCODE_TYPE,b.BATCH_NO,b.BARCODE,b.COMM,b.TIME_STAMP '+
      'from   PUB_BARCODE b '+
      'where  TENANT_ID=:TENANT_ID and TIME_STAMP>:TIME_STAMP and BARCODE_TYPE in (''0'',''1'',''2'') '+
      'order by TIME_STAMP asc';
    new(n);
    n^.tbname := 'PUB_BARCODE';
    n^.keyFields := 'TENANT_ID;GODS_ID;PROPERTY_01;PROPERTY_02;BARCODE_TYPE';
    n^.selectSQL := str;
    n^.synFlag := 3;
    n^.keyFlag := 1;
    n^.tbtitle := '条码表';
    InitSyncBasicUpAndDown(n);
    FList.Add(n);

    rs := dllGlobal.GetZQueryFromName('CA_RELATIONS');
    rs.First;
    while not rs.Eof do
      begin
        relationType := rs.FieldByName('RELATION_TYPE').AsString;

        cid := rs.FieldByName('TENANT_ID').AsString;

        if relationType = '1' then
           pid := token.tenantId
        else
           pid := rs.FieldByName('P_TENANT_ID').AsString;

        str :=
          'select * from ( '+
          'select b.ROWS_ID,b.TENANT_ID,b.GODS_ID,b.PROPERTY_01,b.PROPERTY_02,b.UNIT_ID,b.BARCODE_TYPE,b.BATCH_NO,b.BARCODE,b.COMM, '+
          '       case '+
          '         when b.TIME_STAMP >= c.TIME_STAMP and b.TIME_STAMP >= s.TIME_STAMP then b.TIME_STAMP '+
          '         when c.TIME_STAMP >= b.TIME_STAMP and c.TIME_STAMP >= s.TIME_STAMP then c.TIME_STAMP '+
          '         when s.TIME_STAMP >= b.TIME_STAMP and s.TIME_STAMP >= c.TIME_STAMP then s.TIME_STAMP '+
          '         else b.TIME_STAMP '+
          '       end TIME_STAMP '+
          'from   PUB_BARCODE b,PUB_GOODS_RELATION c,CA_RELATIONS s '+
          'where  b.TENANT_ID = '+ cid +
          '       and c.TENANT_ID = ' + pid +
          '       and c.RELATION_ID = ' + rs.FieldByName('RELATION_ID').AsString +
          '       and b.GODS_ID = c.GODS_ID '+
          '       and s.RELATION_ID = c.RELATION_ID '+
          '       and s.RELATI_ID = ' + token.tenantId +
          '       and b.BARCODE_TYPE in (''0'',''1'',''2'') '+
          '       and (b.TIME_STAMP>:TIME_STAMP or c.TIME_STAMP>:TIME_STAMP or s.TIME_STAMP>:TIME_STAMP) '+
          ') t order by TIME_STAMP asc';
        new(n);
        n^.tbname := 'PUB_BARCODE';
        n^.keyFields := 'TENANT_ID;GODS_ID;PROPERTY_01;PROPERTY_02;BARCODE_TYPE';
        n^.selectSQL := str;
        n^.synFlag := 3;
        n^.keyFlag := 1;
        n^.tbtitle := '条码表';
        n^.syncTenantId := cid;
        n^.isUpdComm := '0';
        if SyncType = 1 then
           begin
             n^.isSyncDown := '1';
           end
        else if SyncType = 2 then
           begin
             if rs.FieldByName('RELATION_ID').AsInteger = 1000006 then //卷烟供应链只下载
                n^.isSyncDown := '1'
             else if rs.FieldByName('RELATION_ID').AsInteger = 1000008 then //非烟供应链
                begin
                  if dllGlobal.GetSFVersion = '.LCL' then
                     n^.isSyncUp := '1'
                  else
                     n^.isSyncDown := '1';
                end
             else
                begin
                  n^.isSyncUp := '1';
                  n^.isSyncDown := '1';
                end;
           end
        else if SyncType = 3 then
           begin
             n^.isSyncDown := '1';
           end
        else
           begin
             n^.isSyncUp := '1';
             n^.isSyncDown := '1';
           end;
        FList.Add(n);

        rs.Next;
      end;
  end;

  procedure InitList4;
  var n:PSynTableInfo;
  begin
    new(n);
    n^.tbname := 'PUB_IC_INFO';
    n^.keyFields := 'TENANT_ID;UNION_ID;CLIENT_ID';
    // 数据恢复时恢复所有字段，普通同步时只同步基础字段
    if (SyncType = 0) or (SyncType = 2) then
       n^.tableFields := 'CLIENT_ID,TENANT_ID,UNION_ID,IC_CARDNO,CREA_DATE,END_DATE,CREA_USER,IC_INFO,IC_STATUS,IC_TYPE,PASSWRD,USING_DATE,COMM,TIME_STAMP';
    n^.synFlag := 4;
    n^.keyFlag := 1;
    n^.tbtitle := 'IC档案';
    InitSyncBasicUpAndDown(n);
    FList.Add(n);
  end;

  procedure InitList10;
  var n:PSynTableInfo;
  begin
    new(n);
    n^.tbname := 'ACC_ACCOUNT_INFO';
    n^.keyFields := 'TENANT_ID;ACCOUNT_ID';
    // 数据恢复时恢复所有字段，普通同步时只同步基础字段
    if (SyncType = 0) or (SyncType = 2) then
       n^.tableFields := 'TENANT_ID,ACCOUNT_ID,SHOP_ID,ACCT_NAME,ACCT_SPELL,PAYM_ID,COMM,TIME_STAMP';
    n^.synFlag := 10;
    n^.keyFlag := 0;
    n^.tbtitle := '账户资料';
    InitSyncBasicUpAndDown(n);
    FList.Add(n);
  end;

  procedure InitList20;
  var str:string;
      n:PSynTableInfo;
  begin
    str :=
      'select  i.TENANT_ID,i.LOGIN_NAME,i.LICENSE_CODE,i.TENANT_NAME,i.TENANT_TYPE,i.SHORT_TENANT_NAME,i.TENANT_SPELL,i.LEGAL_REPR, '+
      '        i.LINKMAN,i.TELEPHONE,i.FAXES,i.HOMEPAGE,i.ADDRESS,i.QQ,i.MSN,i.POSTALCODE,i.REMARK,i.PASSWRD,i.REGION_ID,i.AUDIT_STATUS,i.CREA_DATE, '+
      '        i.COMM,i.TIME_STAMP '+
      'from    CA_TENANT i '+
      'where   TENANT_ID=:TENANT_ID and TIME_STAMP>:TIME_STAMP '+
      'order by TIME_STAMP asc';
    new(n);
    n^.tbname := 'CA_TENANT';
    n^.keyFields := 'TENANT_ID';
    n^.selectSQL := str;
    n^.synFlag := 20;
    n^.keyFlag := 0;
    n^.tbtitle := '企业资料';
    InitSyncBasicUpAndDown(n);
    FList.Add(n);

    str :=
      'select * from ( '+
      'select  i.TENANT_ID,i.LOGIN_NAME,i.LICENSE_CODE,i.TENANT_NAME,i.TENANT_TYPE,i.SHORT_TENANT_NAME,i.TENANT_SPELL,i.LEGAL_REPR, '+
      '        i.LINKMAN,i.TELEPHONE,i.FAXES,i.HOMEPAGE,i.ADDRESS,i.QQ,i.MSN,i.POSTALCODE,i.REMARK,i.PASSWRD,i.REGION_ID,i.AUDIT_STATUS,i.CREA_DATE, '+
      '        i.COMM,case when i.TIME_STAMP > r.TIME_STAMP then i.TIME_STAMP else r.TIME_STAMP end TIME_STAMP '+
      'from    CA_TENANT i, '+
      '        ( '+
      '        select j.TENANT_ID as TENANT_ID,s.TIME_STAMP as TIME_STAMP from CA_RELATION j,CA_RELATIONS s where j.RELATION_ID=s.RELATION_ID and s.RELATI_ID=:TENANT_ID '+
      '        union all '+
      '        select TENANT_ID,TIME_STAMP from CA_RELATIONS s where s.RELATI_ID=:TENANT_ID '+
      '        union all '+
      '        select RELATI_ID as TENANT_ID,TIME_STAMP from CA_RELATIONS s where s.TENANT_ID=:TENANT_ID '+
      '        ) r '+
      'where   i.TENANT_ID=r.TENANT_ID and (i.TIME_STAMP>:TIME_STAMP or r.TIME_STAMP>:TIME_STAMP) '+
      ') t order by TIME_STAMP asc';
    new(n);
    n^.tbname := 'CA_TENANT';
    n^.keyFields := 'TENANT_ID';
    n^.selectSQL := str;
    n^.synFlag := 20;
    n^.keyFlag := 0;
    n^.tbtitle := '企业资料';
    n^.syncTenantId := '999999999';
    n^.isSyncDown := '1';
    FList.Add(n);
  end;

  procedure InitList21(whereStr,syncTenantId:string);
  var n:PSynTableInfo;
  begin
    new(n);
    n^.tbname := 'PUB_GOODS_RELATION';
    n^.keyFields := 'TENANT_ID;GODS_ID;RELATION_ID';
    n^.whereStr := whereStr;
    n^.synFlag := 21;
    n^.keyFlag := 1;
    n^.syncTenantId := syncTenantId;
    n^.tbtitle := '供应链商品';
    InitSyncRelationUpAndDown(n,syncTenantId);
    FList.Add(n);
  end;

  procedure InitList22;
  var rs:TZQuery;
      n:PSynTableInfo;
      str,relationType,pid,cid:string;
  begin
    str :=
      'select b.GODS_ID,b.TENANT_ID,b.GODS_CODE,b.GODS_NAME,b.GODS_SPELL,b.GODS_TYPE,b.SORT_ID1, '+
      '       b.SORT_ID2,b.SORT_ID3,b.SORT_ID4,b.SORT_ID5,b.SORT_ID6,b.SORT_ID7,b.SORT_ID8,b.SORT_ID9, '+
      '       b.SORT_ID10,b.SORT_ID11,b.SORT_ID12,b.SORT_ID13,b.SORT_ID14,b.SORT_ID15,b.SORT_ID16,b.SORT_ID17, '+
      '       b.SORT_ID18,b.SORT_ID19,b.SORT_ID20,b.BARCODE,b.UNIT_ID,b.CALC_UNITS,b.SMALL_UNITS,b.BIG_UNITS, '+
      '       b.SMALLTO_CALC,b.BIGTO_CALC,b.NEW_INPRICE,b.NEW_OUTPRICE,b.NEW_LOWPRICE,b.USING_PRICE,b.HAS_INTEGRAL, '+
      '       b.USING_BATCH_NO,b.USING_BARTER,b.USING_LOCUS_NO,b.BARTER_INTEGRAL,b.REMARK,b.COMM,b.TIME_STAMP, '+
      '       b.SHORT_GODS_NAME,b.CREA_DATE '+
      'from   PUB_GOODSINFO b where TENANT_ID=:TENANT_ID and TIME_STAMP>:TIME_STAMP '+
      'order by TIME_STAMP asc ';
    new(n);
    n^.tbname := 'PUB_GOODSINFO';
    n^.keyFields := 'TENANT_ID;GODS_ID';
    n^.selectSQL := str;
    n^.synFlag := 22;
    n^.keyFlag := 0;
    n^.tbtitle := '商品档案';
    InitSyncBasicUpAndDown(n);
    FList.Add(n);

    rs := dllGlobal.GetZQueryFromName('CA_RELATIONS');
    rs.First;
    while not rs.Eof do
      begin
        relationType := rs.FieldByName('RELATION_TYPE').AsString;

        cid := rs.FieldByName('TENANT_ID').AsString;

        if relationType = '1' then
           pid := token.tenantId
        else
           pid := rs.FieldByName('P_TENANT_ID').AsString;

        str :=
          'select * from ('+
          'select b.GODS_ID,b.TENANT_ID,b.GODS_CODE,b.GODS_NAME,b.GODS_SPELL,b.GODS_TYPE,b.SORT_ID1, '+
          '       b.SORT_ID2,b.SORT_ID3,b.SORT_ID4,b.SORT_ID5,b.SORT_ID6,b.SORT_ID7,b.SORT_ID8,b.SORT_ID9, '+
          '       b.SORT_ID10,b.SORT_ID11,b.SORT_ID12,b.SORT_ID13,b.SORT_ID14,b.SORT_ID15,b.SORT_ID16,b.SORT_ID17, '+
          '       b.SORT_ID18,b.SORT_ID19,b.SORT_ID20,b.BARCODE,b.UNIT_ID,b.CALC_UNITS,b.SMALL_UNITS,b.BIG_UNITS, '+
          '       b.SMALLTO_CALC,b.BIGTO_CALC,b.NEW_INPRICE,b.NEW_OUTPRICE,b.NEW_LOWPRICE,b.USING_PRICE,b.HAS_INTEGRAL, '+
          '       b.USING_BATCH_NO,b.USING_BARTER,b.USING_LOCUS_NO,b.BARTER_INTEGRAL,b.REMARK,b.COMM, '+
          '       case '+
          '         when b.TIME_STAMP >= c.TIME_STAMP and b.TIME_STAMP >= s.TIME_STAMP then b.TIME_STAMP '+
          '         when c.TIME_STAMP >= b.TIME_STAMP and c.TIME_STAMP >= s.TIME_STAMP then c.TIME_STAMP '+
          '         when s.TIME_STAMP >= b.TIME_STAMP and s.TIME_STAMP >= c.TIME_STAMP then s.TIME_STAMP '+
          '         else b.TIME_STAMP '+
          '       end TIME_STAMP, '+
          '       b.SHORT_GODS_NAME,b.CREA_DATE '+
          'from   PUB_GOODSINFO b,PUB_GOODS_RELATION c,CA_RELATIONS s '+
          'where  b.TENANT_ID = '+ cid +
          '       and c.TENANT_ID = ' + pid +
          '       and c.RELATION_ID = ' + rs.FieldByName('RELATION_ID').AsString +
          '       and b.GODS_ID = c.GODS_ID '+
          '       and s.RELATION_ID = c.RELATION_ID '+
          '       and s.RELATI_ID = ' + token.tenantId +
          '       and (b.TIME_STAMP>:TIME_STAMP or c.TIME_STAMP>:TIME_STAMP or s.TIME_STAMP>:TIME_STAMP) '+
          ') t order by TIME_STAMP asc';
        new(n);
        n^.tbname := 'PUB_GOODSINFO';
        n^.keyFields := 'TENANT_ID;GODS_ID';
        n^.selectSQL := str;
        n^.synFlag := 22;
        n^.keyFlag := 0;
        n^.tbtitle := '商品档案';
        n^.syncTenantId := cid;
        n^.isUpdComm := '0';
        if SyncType = 1 then
           begin
             n^.isSyncDown := '1';
           end
        else if SyncType = 2 then
           begin
             if rs.FieldByName('RELATION_ID').AsInteger = 1000006 then //卷烟供应链只下载
                n^.isSyncDown := '1'
             else if rs.FieldByName('RELATION_ID').AsInteger = 1000008 then //非烟供应链
                begin
                  if dllGlobal.GetSFVersion = '.LCL' then
                     n^.isSyncUp := '1'
                  else
                     n^.isSyncDown := '1';
                end
             else
                begin
                  n^.isSyncUp := '1';
                  n^.isSyncDown := '1';
                end;
           end
        else if SyncType = 3 then
           begin
             n^.isSyncDown := '1';
           end
        else
           begin
             n^.isSyncUp := '1';
             n^.isSyncDown := '1';
           end;
        FList.Add(n);

        rs.Next;
      end;
  end;

  procedure InitList23;
  var n:PSynTableInfo;
  begin
    new(n);
    n^.tbname := 'SYS_SEQUENCE';
    n^.keyFields := 'TENANT_ID;SEQU_ID';
    n^.synFlag := 23;
    n^.keyFlag := 0;
    n^.tbtitle := '序列号控制表';
    InitSyncBasicUpAndDown(n);
    FList.Add(n);
  end;

  procedure InitList29;
  var n:PSynTableInfo;
  begin
    new(n);
    n^.tbname := 'SYS_DEFINE';
    n^.keyFields := 'TENANT_ID;DEFINE';
    n^.synFlag := 29;
    n^.keyFlag := 0;
    n^.tbtitle := '参数定义表';
    InitSyncBasicUpAndDown(n);
    FList.Add(n);
  end;

  procedure InitList33;
  var n:PSynTableInfo;
  begin
    if dllGlobal.GetSFVersion <> '.LCL' then Exit;

    new(n);
    n^.tbname := 'MSC_MESSAGE';
    n^.keyFields := 'TENANT_ID;MSG_ID';
    n^.synFlag := 33;
    n^.keyFlag := 0;
    n^.tbtitle := '消息内容';
    if SyncType in [0,2] then
       begin
         n^.isSyncUp := '1';
         n^.isSyncDown := '1';
       end;
    FList.Add(n);

    new(n);
    n^.tbname := 'MSC_MESSAGE_LIST';
    n^.keyFields := 'TENANT_ID;MSG_ID;SHOP_ID';
    n^.whereStr :=  'TENANT_ID=:TENANT_ID and SHOP_ID=:SHOP_ID and TIME_STAMP>:TIME_STAMP';
    n^.syncShopId := token.shopId;
    n^.synFlag := 33;
    n^.keyFlag := 0;
    n^.tbtitle := '消息列表';
    if SyncType in [0,2] then
       begin
         n^.isSyncUp := '1';
         n^.isSyncDown := '1';
       end;
    FList.Add(n);
  end;
var
  str:string;
  rs:TZQuery;
begin
  ClearSyncList;

  InitList0;

  InitList00;

  InitList2('TENANT_ID=:TENANT_ID and TIME_STAMP>:TIME_STAMP',token.tenantId);
  rs := dllGlobal.GetZQueryFromName('CA_RELATIONS');
  rs.First;
  while not rs.Eof do
  begin
    InitList2('TENANT_ID='+rs.FieldByName('TENANT_ID').AsString+' and TIME_STAMP>:TIME_STAMP ',rs.FieldByName('TENANT_ID').AsString);
    rs.Next;
  end;

  InitList3;

  InitList4;

  InitList10;

  InitList20;

  InitList21('TENANT_ID=:TENANT_ID and TIME_STAMP>:TIME_STAMP',token.tenantId);
  rs := dllGlobal.GetZQueryFromName('CA_RELATIONS');
  rs.First;
  while not rs.Eof do
  begin
    str := 'TENANT_ID='+rs.FieldByName('P_TENANT_ID').AsString+' and TIME_STAMP>:TIME_STAMP';
    InitList21(str,rs.FieldByName('P_TENANT_ID').AsString);
    rs.Next;
  end;

  InitList22;

  InitList23;

  InitList29;

  InitList33;
end;

function TSyncFactory.CheckNeedLoginSync: boolean;
var timestamp:int64;
begin
  result := true;
  if LoginSyncDate = 0 then
     timestamp := GetSynTimeStamp(token.tenantId,'LOGIN_SYNC','#')
  else
     timestamp := LoginSyncDate;

  if token.lDate <> timestamp then
     result := true
  else
     result := false; 
end;

function TSyncFactory.CheckNeedLoginSyncBizData: boolean;
begin
  result := false;
  LastLoginSyncDate  := GetSynTimeStamp(token.tenantId,'LOGIN_SYNC','#');
  LastLogoutSyncDate := GetSynTimeStamp(token.tenantId,'LOGOUT_SYNC','#');
  if LastLoginSyncDate  = 0 then Exit;
  if LastLogoutSyncDate = 0 then Exit;
  if LastLoginSyncDate  = token.lDate then Exit;
  if LastLogoutSyncDate = token.lDate then Exit;
  if LastLogoutSyncDate < LastLoginSyncDate then result := true;
end;

procedure TSyncFactory.InitTenant;
var Params:TftParamList;
begin
  Params := TftParamList.Create(nil);
  try
    Params.ParamByName('TENANT_ID').AsInteger := strtoint(token.tenantId);
    dataFactory.ExecProc('TTenantInitV60',Params);
  finally
    Params.Free;
  end;
  // RightsFactory.InitialRights;
end;

procedure TSyncFactory.LoginSync(PHWnd: THandle);
var
  flag:integer;
  firstLogin:boolean;
begin
  timerTerminted := true;
  WaitForSync;
  timered := true;
  try
    firstLogin := false;
    if dllApplication.mode = 'demo' then Exit;
    with TfrmSyncData.Create(nil) do
    begin
      try
        if token.online then dataFactory.remote.DBLock(true);
        ReadTimeStamp;
        AddLoginLog;
        if token.tenantId <> '' then PlayerFactory.OpenPlayer;
        if not token.online then Exit;
        CommandPush.ExecuteCommand;
        hWnd := PHWnd;
        ShowForm;
        BringToFront;
        Update;
        Application.ProcessMessages;
        CheckBackUpDBFile(PHWnd);
        if token.tenantId = '' then
           begin
             firstLogin := true;
             TfrmSysDefine.AutoRegister;
             if token.tenantId = '' then Exit;
             AddLoginLog('FirstLogin');
             PlayerFactory.OpenPlayer;
             flag := SyncFactory.CheckRemoteData(PHWnd);
             if flag = 0 then // 没有还原
                begin
                  RspSyncFactory.SyncAll;
                  SyncFactory.InitTenant;
                  SyncFactory.SyncBasic(1);
                  TfrmSysDefine.SaveRegister;
                  SyncFactory.InitGodsInfo;
                  RspSyncFactory.copyGoodsSort;
                end
             else if flag = 1 then // 文件还原
                begin

                end
             else if flag = 2 then // 远程数据还原
                begin
                  TfrmSysDefine.SaveRegister;
                end;
           end
        else
           begin
             if not CheckNeedLoginSync then Exit;
             if not SyncLockCheck(PHWnd) then Exit;
             SyncFactory.BackUpDBFile;
             RspSyncFactory.SyncAll;
             RspSyncFactory.copyGoodsSort;
             SyncFactory.SyncBasic(2);
             if CheckNeedLoginSyncBizData then
                begin
                  if MessageBox(PHWnd,'系统检测到上次退出未进行数据同步，是否立即执行?','友情提醒',MB_YESNO+MB_ICONQUESTION) = 6 then
                     begin
                       if dllGlobal.GetSFVersion = '.LCL' then
                          TfrmStocksCalc.Calc(Application.MainForm);
                       SyncFactory.SyncBizData;
                       SyncFactory.SetSynTimeStamp(token.tenantId,'LOGOUT_SYNC',LastLoginSyncDate,'#');
                     end;
                end;
             if XsmFactory.getXsmMessage and Assigned(MsgFactory) then
                begin
                  MsgFactory.Load;
                  MsgFactory.GetUnRead;
                  MsgFactory.ShowHintMsg;
                end;
           end;
        SyncFactory.LoginSyncDate := token.lDate;
        SyncFactory.SetSynTimeStamp(token.tenantId,'LOGIN_SYNC',token.lDate,'#');
      finally
        Free;
        if token.online then dataFactory.remote.DBLock(false);
      end;
    end;
  finally
    timered := false;
    timerTerminted := false;
  end;
end;

procedure TSyncFactory.LogoutSync(PHWnd: THandle);
begin
  timerTerminted := true;
  WaitForSync;
  timered := true;
  try
    PlayerFactory.ClosePlayer;
    if dllApplication.mode = 'demo' then Exit;
    if token.tenantId = '' then Exit;
    with TfrmSyncData.Create(nil) do
    begin
      try
        if token.online then dataFactory.remote.DBLock(true);
        AddLogoutLog;
        if not token.online then Exit;
        CommandPush.ExecuteCommand;
        hWnd := PHWnd;
        ShowForm;
        BringToFront;
        Update;
        if not SyncFactory.SyncLockCheck(PHWnd) then Exit;
        SyncFactory.SyncBasic(2);
        if dllGlobal.GetSFVersion = '.LCL' then
           TfrmStocksCalc.Calc(Application.MainForm);
        SyncFactory.SyncBizData;
        SyncFactory.SetSynTimeStamp(token.tenantId,'LOGOUT_SYNC',token.lDate,'#');
        if RtcSyncFactory.GetToken then
           begin
             RtcSyncFactory.RtcLogout;
             RtcSyncFactory.SyncRtcData;
           end;
      finally
        Free;
        if token.online then dataFactory.remote.DBLock(false);
      end;
    end;
  finally
    timered := false;
    timerTerminted := false;
  end;
end;

procedure TSyncFactory.RecoverySync(PHWnd:THandle;BeginDate:string='');
begin
  timerTerminted := true;
  timered := true;
  try
    if dllApplication.mode = 'demo' then Exit;
    if token.tenantId = '' then Exit;
    if not token.online then Exit;
    with TfrmSyncData.Create(nil) do
    begin
      try
        if token.online then dataFactory.remote.DBLock(true);
        hWnd := PHWnd;
        ShowForm;
        BringToFront;
        Update;
        SyncFactory.SyncBasic(3);
        SyncFactory.SyncBizData(1,BeginDate);
      finally
        Free;
        if token.online then dataFactory.remote.DBLock(false);
      end;
    end;
  finally
    timered := false;
    timerTerminted := false;
  end;
end;

procedure TSyncFactory.RegisterSync(PHWnd: THandle);
begin
  timerTerminted := true;
  timered := true;
  try
    if dllApplication.mode = 'demo' then Exit;
    if token.tenantId = '' then Exit;
    with TfrmSyncData.Create(nil) do
    begin
      try
        if token.online then dataFactory.remote.DBLock(true);
        hWnd := PHWnd;
        ShowForm;
        BringToFront;
        Update;
        RspSyncFactory.SyncAll;
        RspSyncFactory.copyGoodsSort;
        SyncFactory.InitTenant;
        SyncFactory.SyncBasic(1);
        SyncFactory.LoginSyncDate := token.lDate;
        SyncFactory.SetSynTimeStamp(token.tenantId,'LOGIN_SYNC',token.lDate,'#');
      finally
        Free;
        if token.online then dataFactory.remote.DBLock(false);
      end;
    end;
  finally
    timered := false;
    timerTerminted := false;
  end;
end;

procedure TSyncFactory.UploadStockOrder;
var
  Params:TftParamList;
  ls,rs_h,rs_d,cs_h,cs_d:TZQuery;
  MaxTimeStamp,LastTimeStamp:int64;
  tbName,orderFields,dataFields:string;
begin
  tbName := 'STK_STOCKORDER';
  LastTimeStamp := GetSynTimeStamp(token.tenantId,tbName,token.shopId);
  MaxTimeStamp := LastTimeStamp;

  LogFile.AddLogFile(0,'开始<'+tbName+'>上次时间:'+inttostr(LastTimeStamp));

  ls := TZQuery.Create(nil);
  rs_h := TZQuery.Create(nil);
  rs_d := TZQuery.Create(nil);
  cs_h := TZQuery.Create(nil);
  cs_d := TZQuery.Create(nil);
  Params := TftParamList.Create(nil);
  try
    Params.ParamByName('TENANT_ID').AsInteger := strtoint(token.tenantId);
    Params.ParamByName('SHOP_ID').AsString := token.shopId;
    Params.ParamByName('TABLE_NAME').AsString := tbName;
    Params.ParamByName('TIME_STAMP').Value := LastTimeStamp;
    Params.ParamByName('KEY_FLAG').AsInteger := 0;
    Params.ParamByName('TIME_STAMP_NOCHG').AsInteger := 0;
    Params.ParamByName('SYN_COMM').AsBoolean := true;

    if dllGlobal.GetSFVersion = '.LCL' then
       Params.ParamByName('UPDATE_STORAGE').AsBoolean := false
    else
       Params.ParamByName('UPDATE_STORAGE').AsBoolean := true;

    SetTicket;

    dataFactory.MoveToSqlite;
    try
      dataFactory.Open(ls,'TSyncStockOrderListV60',Params);
    finally
      dataFactory.MoveToDefault;
    end;

    LogFile.AddLogFile(0,'上传<'+tbName+'>打开时长:'+inttostr(GetTicket)+'  记录数:'+inttostr(ls.RecordCount));
    BeforeSyncBiz(ls,'STOCK_DATE',0);
    SetTicket;

    ls.First;
    while not ls.Eof do
    begin
      ProTitle := '<进货单>...共'+inttostr(ls.RecordCount)+'笔，当前第'+inttostr(ls.RecNo)+'笔';
      SetProPosition(Trunc(100 / ls.RecordCount * ls.RecNo));

      rs_h.Close;
      rs_d.Close;
      cs_h.Close;
      cs_d.Close;

      Params.ParamByName('KEY_FIELDS').AsString := 'TENANT_ID;STOCK_ID';
      Params.ParamByName('STOCK_ID').AsString := ls.FieldbyName('STOCK_ID').AsString;

      if orderFields = '' then orderFields := GetTableFields('STK_STOCKORDER');
      if dataFields = ''  then dataFields  := GetTableFields('STK_STOCKDATA','a');

      dataFactory.MoveToSqlite;
      try
        dataFactory.BeginBatch;
        try
          Params.ParamByName('TABLE_FIELDS').AsString := orderFields;
          dataFactory.AddBatch(rs_h,'TSyncStockOrderV60',Params);
          Params.ParamByName('TABLE_FIELDS').AsString := dataFields;
          dataFactory.AddBatch(rs_d,'TSyncStockDataV60',Params);
          dataFactory.OpenBatch;
        except
          dataFactory.CancelBatch;
          Raise;
        end;
      finally
        dataFactory.MoveToDefault;
      end;

      cs_h.SyncDelta := rs_h.SyncDelta;
      cs_d.SyncDelta := rs_d.SyncDelta;

      dataFactory.MoveToRemote;
      try
        dataFactory.BeginBatch;
        try
          dataFactory.AddBatch(cs_h,'TSyncStockOrderV60',Params);
          dataFactory.AddBatch(cs_d,'TSyncStockDataV60',Params);
          dataFactory.CommitBatch;
        except
          dataFactory.CancelBatch;
          Raise;
        end;
      finally
        dataFactory.MoveToDefault;
      end;

      if StrtoInt64(rs_h.FieldByName('TIME_STAMP').AsString) > MaxTimeStamp then
         MaxTimeStamp := StrtoInt64(rs_h.FieldByName('TIME_STAMP').AsString);

      rs_h.Delete;
      dataFactory.MoveToSqlite;
      try
        dataFactory.UpdateBatch(rs_h,'TSyncStockOrderV60',Params);
      finally
        dataFactory.MoveToDefault;
      end;

      ls.Next;
    end;

    if not ls.IsEmpty then SetSynTimeStamp(token.tenantId,tbName,MaxTimeStamp,token.shopId);

    LogFile.AddLogFile(0,'上传<'+tbName+'>保存时长:'+inttostr(GetTicket));
  finally
    Params.Free;
    ls.Free;
    rs_h.Free;
    rs_d.Free;
    cs_h.Free;
    cs_d.Free;
  end;
end;

procedure TSyncFactory.UploadSalesOrder;
var
  Params:TftParamList;
  MaxTimeStamp,LastTimeStamp:int64;
  ls,rs_h,rs_d,cs_h,cs_d:TZQuery;
  tbName,orderFields,dataFields,glideFields:string;
begin
  tbName := 'SAL_SALESORDER';
  LastTimeStamp := GetSynTimeStamp(token.tenantId,tbName,token.shopId);
  MaxTimeStamp := LastTimeStamp;

  LogFile.AddLogFile(0,'开始<'+tbName+'>上次时间:'+inttostr(LastTimeStamp));

  ls := TZQuery.Create(nil);
  rs_h := TZQuery.Create(nil);
  rs_d := TZQuery.Create(nil);
  cs_h := TZQuery.Create(nil);
  cs_d := TZQuery.Create(nil);
  Params := TftParamList.Create(nil);
  try
    Params.ParamByName('TENANT_ID').AsInteger := strtoint(token.tenantId);
    Params.ParamByName('SHOP_ID').AsString := token.shopId;
    Params.ParamByName('TABLE_NAME').AsString := tbName;
    Params.ParamByName('TIME_STAMP').Value := LastTimeStamp;
    Params.ParamByName('KEY_FLAG').AsInteger := 0;
    Params.ParamByName('TIME_STAMP_NOCHG').AsInteger := 0;
    Params.ParamByName('SYN_COMM').AsBoolean := true;

    if dllGlobal.GetSFVersion = '.LCL' then
       Params.ParamByName('UPDATE_STORAGE').AsBoolean := false
    else
       Params.ParamByName('UPDATE_STORAGE').AsBoolean := true;

    SetTicket;

    dataFactory.MoveToSqlite;
    try
      dataFactory.Open(ls,'TSyncSalesOrderListV60',Params);
    finally
      dataFactory.MoveToDefault;
    end;

    LogFile.AddLogFile(0,'上传<'+tbName+'>打开时长:'+inttostr(GetTicket)+'  记录数:'+inttostr(ls.RecordCount));
    BeforeSyncBiz(ls,'SALES_DATE',0);
    SetTicket;

    ls.First;
    while not ls.Eof do
    begin
      ProTitle := '<销售单>...共'+inttostr(ls.RecordCount)+'笔，当前第'+inttostr(ls.RecNo)+'笔';
      SetProPosition(100 + Trunc(100 / ls.RecordCount * ls.RecNo));

      rs_h.Close;
      rs_d.Close;
      cs_h.Close;
      cs_d.Close;

      Params.ParamByName('KEY_FIELDS').AsString := 'TENANT_ID;SALES_ID';
      Params.ParamByName('SALES_ID').AsString := ls.FieldbyName('SALES_ID').AsString;

      if orderFields = '' then orderFields := GetTableFields('SAL_SALESORDER');
      if dataFields = ''  then dataFields  := GetTableFields('SAL_SALESDATA');

      dataFactory.MoveToSqlite;
      try
        dataFactory.BeginBatch;
        try
          Params.ParamByName('TABLE_FIELDS').AsString := orderFields;
          dataFactory.AddBatch(rs_h,'TSyncSalesOrderV60',Params);
          Params.ParamByName('TABLE_FIELDS').AsString := dataFields;
          dataFactory.AddBatch(rs_d,'TSyncSalesDataV60',Params);
          dataFactory.OpenBatch;
        except
          dataFactory.CancelBatch;
          Raise;
        end;
      finally
        dataFactory.MoveToDefault;
      end;

      cs_h.SyncDelta := rs_h.SyncDelta;
      cs_d.SyncDelta := rs_d.SyncDelta;

      dataFactory.MoveToRemote;
      try
        dataFactory.BeginBatch;
        try
          dataFactory.AddBatch(cs_h,'TSyncSalesOrderV60',Params);
          dataFactory.AddBatch(cs_d,'TSyncSalesDataV60',Params);
          dataFactory.CommitBatch;
        except
          dataFactory.CancelBatch;
          Raise;
        end;
      finally
        dataFactory.MoveToDefault;
      end;

      if StrtoInt64(rs_h.FieldByName('TIME_STAMP').AsString) > MaxTimeStamp then
         MaxTimeStamp := StrtoInt64(rs_h.FieldByName('TIME_STAMP').AsString);

      rs_h.Delete;
      dataFactory.MoveToSqlite;
      try
        dataFactory.UpdateBatch(rs_h,'TSyncSalesOrderV60',Params)
      finally
        dataFactory.MoveToDefault;
      end;

      ls.Next;
    end;

    if not ls.IsEmpty then SetSynTimeStamp(token.tenantId,tbName,MaxTimeStamp,token.shopId);

    LogFile.AddLogFile(0,'上传<'+tbName+'>保存时长:'+inttostr(GetTicket));
  finally
    Params.Free;
    ls.Free;
    rs_h.Free;
    rs_d.Free;
    cs_h.Free;
    cs_d.Free;
  end;
end;

procedure TSyncFactory.UploadChangeOrder;
var
  Params:TftParamList;
  ls,rs_h,rs_d,cs_h,cs_d:TZQuery;
  MaxTimeStamp,LastTimeStamp:int64;
  tbName,orderFields,dataFields:string;
begin
  tbName := 'STO_CHANGEORDER';
  LastTimeStamp := GetSynTimeStamp(token.tenantId,tbName,token.shopId);
  MaxTimeStamp := LastTimeStamp;

  LogFile.AddLogFile(0,'开始<'+tbName+'>上次时间:'+inttostr(LastTimeStamp));

  ls := TZQuery.Create(nil);
  rs_h := TZQuery.Create(nil);
  rs_d := TZQuery.Create(nil);
  cs_h := TZQuery.Create(nil);
  cs_d := TZQuery.Create(nil);
  Params := TftParamList.Create(nil);
  try
    Params.ParamByName('TENANT_ID').AsInteger := strtoint(token.tenantId);
    Params.ParamByName('SHOP_ID').AsString := token.shopId;
    Params.ParamByName('TABLE_NAME').AsString := tbName;
    Params.ParamByName('TIME_STAMP').Value := LastTimeStamp;
    Params.ParamByName('KEY_FLAG').AsInteger := 0;
    Params.ParamByName('TIME_STAMP_NOCHG').AsInteger := 0;
    Params.ParamByName('SYN_COMM').AsBoolean := true;

    if dllGlobal.GetSFVersion = '.LCL' then
       Params.ParamByName('UPDATE_STORAGE').AsBoolean := false
    else
       Params.ParamByName('UPDATE_STORAGE').AsBoolean := true;

    SetTicket;

    dataFactory.MoveToSqlite;
    try
      dataFactory.Open(ls,'TSyncChangeOrderListV60',Params);
    finally
      dataFactory.MoveToDefault;
    end;

    LogFile.AddLogFile(0,'上传<'+tbName+'>打开时长:'+inttostr(GetTicket)+'  记录数:'+inttostr(ls.RecordCount));
    BeforeSyncBiz(ls,'CHANGE_DATE',0);
    SetTicket;

    ls.First;
    while not ls.Eof do
    begin
      ProTitle := '<损益单>...共'+inttostr(ls.RecordCount)+'笔，当前第'+inttostr(ls.RecNo)+'笔';
      SetProPosition(200 + Trunc(100 / ls.RecordCount * ls.RecNo));

      rs_h.Close;
      rs_d.Close;
      cs_h.Close;
      cs_d.Close;

      Params.ParamByName('KEY_FIELDS').AsString := 'TENANT_ID;CHANGE_ID';
      Params.ParamByName('CHANGE_ID').AsString := ls.FieldbyName('CHANGE_ID').AsString;

      if orderFields = '' then orderFields := GetTableFields('STO_CHANGEORDER');
      if dataFields = ''  then dataFields  := GetTableFields('STO_CHANGEDATA','a');

      dataFactory.MoveToSqlite;
      try
        dataFactory.BeginBatch;
        try
          Params.ParamByName('TABLE_FIELDS').AsString := orderFields;
          dataFactory.AddBatch(rs_h,'TSyncChangeOrderV60',Params);
          Params.ParamByName('TABLE_FIELDS').AsString := dataFields;
          dataFactory.AddBatch(rs_d,'TSyncChangeDataV60',Params);
          dataFactory.OpenBatch;
        except
          dataFactory.CancelBatch;
          Raise;
        end;
      finally
        dataFactory.MoveToDefault;
      end;

      cs_h.SyncDelta := rs_h.SyncDelta;
      cs_d.SyncDelta := rs_d.SyncDelta;

      dataFactory.MoveToRemote;
      try
        dataFactory.BeginBatch;
        try
          dataFactory.AddBatch(cs_h,'TSyncChangeOrderV60',Params);
          dataFactory.AddBatch(cs_d,'TSyncChangeDataV60',Params);
          dataFactory.CommitBatch;
        except
          dataFactory.CancelBatch;
          Raise;
        end;
      finally
        dataFactory.MoveToDefault;
      end;

      if StrtoInt64(rs_h.FieldByName('TIME_STAMP').AsString) > MaxTimeStamp then
         MaxTimeStamp := StrtoInt64(rs_h.FieldByName('TIME_STAMP').AsString);

      rs_h.Delete;
      dataFactory.MoveToSqlite;
      try
        dataFactory.UpdateBatch(rs_h,'TSyncChangeOrderV60',Params);
      finally
        dataFactory.MoveToDefault;
      end;

      ls.Next;
    end;

    if not ls.IsEmpty then SetSynTimeStamp(token.tenantId,tbName,MaxTimeStamp,token.shopId);

    LogFile.AddLogFile(0,'上传<'+tbName+'>保存时长:'+inttostr(GetTicket));
  finally
    Params.Free;
    ls.Free;
    rs_h.Free;
    rs_d.Free;
    cs_h.Free;
    cs_d.Free;
  end;
end;

procedure TSyncFactory.UploadRckDays;
var
  Params:TftParamList;
  ls,rs_h,rs_d,cs_h,cs_d:TZQuery;
  MaxTimeStamp,LastTimeStamp:int64;
  updateVersion,insertVersion:string;
  tbName,orderFields,dataFields:string;
begin
  tbName := 'RCK_DAYS_CLOSE';
  LastTimeStamp := GetSynTimeStamp(token.tenantId,tbName,token.shopId);
  MaxTimeStamp := LastTimeStamp; 

  LogFile.AddLogFile(0,'开始<'+tbName+'>上次时间:'+inttostr(LastTimeStamp));

  ls := TZQuery.Create(nil);
  rs_h := TZQuery.Create(nil);
  rs_d := TZQuery.Create(nil);
  cs_h := TZQuery.Create(nil);
  cs_d := TZQuery.Create(nil);
  Params := TftParamList.Create(nil);
  try
    Params.ParamByName('TENANT_ID').AsInteger := strtoint(token.tenantId);
    Params.ParamByName('SHOP_ID').AsString := token.shopId;
    Params.ParamByName('TABLE_NAME').AsString := tbName;
    Params.ParamByName('TIME_STAMP').Value := LastTimeStamp;
    Params.ParamByName('KEY_FLAG').AsInteger := 0;
    Params.ParamByName('TIME_STAMP_NOCHG').AsInteger := 0;
    Params.ParamByName('SYN_COMM').AsBoolean := true;

    SetTicket;

    dataFactory.MoveToSqlite;
    try
      dataFactory.Open(ls,'TSyncRckDaysCloseListV60',Params);
    finally
      dataFactory.MoveToDefault;
    end;

    LogFile.AddLogFile(0,'上传<'+tbName+'>打开时长:'+inttostr(GetTicket)+'  记录数:'+inttostr(ls.RecordCount));

    if not ls.IsEmpty then
       begin
         GetRckBeginDate;
         updateVersion := 'update SYS_DEFINE set VALUE=''V6'' where TENANT_ID='+token.tenantId+' and DEFINE=''APPVERSION'' ';
         insertVersion := 'insert into SYS_DEFINE (TENANT_ID,DEFINE,VALUE,VALUE_TYPE,COMM,TIME_STAMP) values ('+token.tenantId+',''APPVERSION'',''V6'',0,''10'','+GetTimeStamp(dataFactory.remote.iDbType)+') ';
         if dataFactory.remote.ExecSQL(updateVersion) <= 0 then
            dataFactory.remote.ExecSQL(insertVersion);
       end;

    SetTicket;

    ls.First;
    while not ls.Eof do
    begin
      ProTitle := '<日台账>...共'+inttostr(ls.RecordCount)+'笔，当前第'+inttostr(ls.RecNo)+'笔';
      SetProPosition(300 + Trunc(100 / ls.RecordCount * ls.RecNo));

      // 小于开始日期的数据不上传
      if (RckBeginDate > 0) and (ls.FieldByName('CREA_DATE').AsInteger < RckBeginDate) then
         begin
           ls.Next;
           Continue;
         end;

      rs_h.Close;
      rs_d.Close;

      Params.ParamByName('CREA_DATE').AsInteger := ls.FieldbyName('CREA_DATE').AsInteger;

      if orderFields = '' then orderFields := GetTableFields('RCK_DAYS_CLOSE');
      if dataFields = ''  then dataFields  := GetTableFields('RCK_STOCKS_DATA');

      dataFactory.MoveToSqlite;
      try
        dataFactory.BeginBatch;
        try
          Params.ParamByName('TABLE_FIELDS').AsString := orderFields;
          dataFactory.AddBatch(rs_h,'TSyncRckDaysCloseV60',Params);
          Params.ParamByName('TABLE_FIELDS').AsString := dataFields;
          dataFactory.AddBatch(rs_d,'TSyncRckStocksDataV60',Params);
          dataFactory.OpenBatch;
        except
          dataFactory.CancelBatch;
          Raise;
        end;
      finally
        dataFactory.MoveToDefault;
      end;

      cs_h.SyncDelta := rs_h.SyncDelta;
      cs_d.SyncDelta := rs_d.SyncDelta;

      dataFactory.MoveToRemote;
      try
        dataFactory.BeginBatch;
        try
          Params.ParamByName('KEY_FIELDS').AsString := 'TENANT_ID;SHOP_ID;CREA_DATE';
          dataFactory.AddBatch(cs_h,'TSyncRckDaysCloseV60',Params);
          Params.ParamByName('KEY_FIELDS').AsString := 'TENANT_ID;SHOP_ID;BILL_DATE';
          dataFactory.AddBatch(cs_d,'TSyncRckStocksDataV60',Params);
          dataFactory.CommitBatch;
        except
          dataFactory.CancelBatch;
          Raise;
        end;
      finally
        dataFactory.MoveToDefault;
      end;

      if StrtoInt64(rs_h.FieldByName('TIME_STAMP').AsString) > MaxTimeStamp then
         MaxTimeStamp := StrtoInt64(rs_h.FieldByName('TIME_STAMP').AsString);

      rs_h.Delete;
      dataFactory.MoveToSqlite;
      try
        dataFactory.UpdateBatch(rs_h,'TSyncRckDaysCloseV60',Params);
      finally
        dataFactory.MoveToDefault;
      end;

      ls.Next;
    end;

    if not ls.IsEmpty then SetSynTimeStamp(token.tenantId,tbName,MaxTimeStamp,token.shopId);

    LogFile.AddLogFile(0,'上传<'+tbName+'>保存时长:'+inttostr(GetTicket));
  finally
    Params.Free;
    ls.Free;
    rs_h.Free;
    rs_d.Free;
    cs_h.Free;
    cs_d.Free;
  end;
end;

procedure TSyncFactory.SyncBizData(SyncFlag:integer=0;BeginDate:string='');
begin
  try
    SetProMax(400);
    ProTitle := '正在准备数据...';
    GetCloseAccDate;

    ProTitle := '<进货单>...';
    if SyncFlag = 0 then
       UploadStockOrder
    else
       DownloadStockOrder(BeginDate);
    SetProPosition(100);

    ProTitle := '<销售单>...';
    if SyncFlag = 0 then
       UploadSalesOrder
    else
       DownloadSalesOrder(BeginDate);
    SetProPosition(200);

    ProTitle := '<损益单>...';
    if SyncFlag = 0 then
       UploadChangeOrder
    else
       DownloadChangeOrder(BeginDate);
    SetProPosition(300);

    ProTitle := '<日台账>...';
    if SyncFlag = 0 then
       UploadRckDays
    else
       DownloadRckDays(BeginDate);
    SetProPosition(400);

    ProTitle := '<库存表>...';
    if SyncFlag=0 then
       begin
         SyncStorage;
         AddSyncLog('UploadBiz');
       end;
  finally
    ReadTimeStamp;
  end
end;

procedure TSyncFactory.BeforeSyncBiz(DataSet:TZQuery;FieldName:string;SyncFlag:integer);
var
  rDate:integer;
  isUpdate:boolean;
  Params:TftParamList;
begin
  rDate := 99999999;
  isUpdate := false;
  DataSet.First;
  while not DataSet.Eof do
  begin
    if DataSet.FieldByName(FieldName).AsInteger < rDate then
       begin
         rDate := DataSet.FieldByName(FieldName).AsInteger;
         isUpdate := true;
       end;
    DataSet.Next;
  end;
  if isUpdate then
     begin
       Params := TftParamList.Create(nil);
       try
         Params.ParamByName('TENANT_ID').AsInteger := strtoint(token.tenantId);
         Params.ParamByName('CLSE_DATE').AsInteger := rDate;
         Params.ParamByName('MOTH_DATE').AsString := FormatDatetime('YYYY-MM-DD',FnTime.fnStrtoDate(inttostr(rDate)));
         if SyncFlag = 0 then
            dataFactory.remote.ExecProc('TSyncDeleteRckCloseV60',TftParamList.Encode(Params))
         else
            dataFactory.sqlite.ExecProc('TSyncDeleteRckCloseV60',Params);
       finally
         Params.Free;
       end;
    end;
end;

procedure TSyncFactory.RecoveryClose(CloseDate: string);
var str:string;
begin
  if dataFactory.sqlite.ExecSQL('update SYS_DEFINE set VALUE='''+CloseDate+''' where TENANT_ID='+token.tenantId+' and DEFINE = ''SYS_BEGIN_DATE'' ')=0 then
    begin
      str := ' insert into SYS_DEFINE (TENANT_ID,DEFINE,VALUE,VALUE_TYPE,COMM,TIME_STAMP) values ('+token.tenantId+',''SYS_BEGIN_DATE'','''+CloseDate+''',0,''00'',0)';
      dataFactory.sqlite.ExecSQL(str);
    end;
  CloseAccDate := strtoint(CloseDate);
end;

procedure TSyncFactory.GetCloseAccDate;
var rs:TZQuery;
begin
  if CloseAccDate >= 0 then Exit;
  rs := TZQuery.Create(nil);
  try
    rs.SQL.Text := 'select VALUE from SYS_DEFINE where TENANT_ID=:TENANT_ID and DEFINE=:DEFINE';
    rs.ParamByName('TENANT_ID').AsInteger := strtoint(token.tenantId);
    rs.ParamByName('DEFINE').AsString := 'SYS_BEGIN_DATE';
    dataFactory.sqlite.Open(rs);
    if rs.IsEmpty then
       CloseAccDate := 0
    else
       CloseAccDate := rs.Fields[0].AsInteger;
  finally
    rs.Free;
  end;
end;

procedure TSyncFactory.GetRckBeginDate;
var rs:TZQuery;
begin
  if RckBeginDate >= 0 then Exit;
  rs := TZQuery.Create(nil);
  try
    rs.SQL.Text := 'select VALUE from SYS_DEFINE where TENANT_ID=0 and DEFINE=''RCK_BEGIN_DATE'' ';
    rs.Data := dataFactory.remote.OpenSQL(rs.SQL.Text,TftParamList.Encode(rs.Params));
    if rs.IsEmpty then
       RckBeginDate := 0
    else
       RckBeginDate := rs.Fields[0].AsInteger;
  finally
    rs.Free;
  end;
end;

procedure TSyncFactory.SetProTitle(const Value: string);
begin
  FProTitle := Value;
  SetProCaption;
end;

procedure TSyncFactory.SetProHandle(const Value: Hwnd);
begin
  FProHandle := Value;
end;

procedure TSyncFactory.SetProCaption;
begin
  GlobalProTitle := ProTitle;
  PostMessage(ProHandle, MSC_SET_CAPTION, 0, 0);
  Application.ProcessMessages;
end;

procedure TSyncFactory.SetProMax(max: integer);
begin
  PostMessage(ProHandle, MSC_SET_MAX, max, 0);
  Application.ProcessMessages;
end;

procedure TSyncFactory.SetProPosition(position: integer);
begin
  PostMessage(ProHandle, MSC_SET_POSITION, position, 0);
  Application.ProcessMessages;
end;

function TSyncFactory.GetLoginTimeStamp(iDbType:integer):string;
begin
  case iDbType of
    0:result := 'convert(bigint,(convert(float,getdate())-40542.0)*86400)';
    1:result := '86400*floor(sysdate - to_date(''20110101'',''yyyymmdd''))+(sysdate - trunc(sysdate))*24*60*60';
    4:result := '86400*(DAYS(CURRENT DATE)-DAYS(DATE(''2011-01-01'')))+MIDNIGHT_SECONDS(CURRENT TIMESTAMP)';
    5:result := GetTimeStamp(iDbType);
    else result := GetTimeStamp(iDbType);
  end;
end;

procedure TSyncFactory.AddLoginLog(info:string);
  function GetProductInfo:string;
  var dllVersionInfo: TRzVersionInfo;
  begin
    dllVersionInfo := TRzVersionInfo.Create(nil);
    try
      try
        dllVersionInfo.FilePath := ExtractFilePath(ParamStr(0))+'shop.dll';
        result := 'R6<'+dllVersionInfo.FileVersion+'>';
      except
        result := 'R6';
      end;
    finally
      dllVersionInfo.Free;
    end;
  end;

  function GetConnStr:string;
  var
    F:TIniFile;
    srvrId:string;
    vList:TStringList;
  begin
    F := TIniFile.Create(ExtractShortPathName(ExtractFilePath(Application.ExeName))+'db.cfg');
    try
      srvrId := F.ReadString('db','srvrId','');
      result := F.ReadString('db','Connstr','');
    finally
      F.Free;
    end;
    vList := TStringList.Create;
    try
      vList.Delimiter := ';';
      vList.QuoteChar := '"';
      vList.DelimitedText := result;
      result := vList.Values['hostname']+':'+vList.Values['port']+'<'+vList.Values['dbid']+'>'+'<'+srvrId+'>';
    finally
      vList.Free;
    end;
  end;
var
  SQL,Flag,ConnectTo:string;
begin
  if token.tenantId = '' then Exit;
  LoginStart := GetTickCount;
  LoginId := TSequence.NewId;
  try
    if token.online then
       begin
         Flag := '1';
         ConnectTo := GetConnStr;
         dataFactory.MoveToRemote;
       end
    else
       begin
         Flag := '2';
         ConnectTo := 'Local';
         dataFactory.MoveToSqlite;
       end;
    SQL :=
      'insert into CA_LOGIN_INFO (LOGIN_ID,TENANT_ID,SHOP_ID,USER_ID,IP_ADDR,COMPUTER_NAME,MAC_ADDR,SYSTEM_INFO,PRODUCT_ID,NETWORK_STATUS,CONNECT_TO,LOGIN_DATE,CONNECT_TIMES,COMM,TIME_STAMP) '+
      'values('''+LoginId+''','+token.tenantId+','''+token.shopId+''','''+token.userId+''','''+GetIPAddr+''','''+GetComputerName+''','''+GetMacAddr+''','''+info+''','''+GetProductInfo+''','''+Flag+''','''+ConnectTo+''','''+FormatDatetime('YYYY-MM-DD HH:NN:SS',now())+''',-1,''00'','+GetLoginTimeStamp(dataFactory.iDbType)+')';
    dataFactory.ExecSQL(SQL);
  finally
    dataFactory.MoveToDefault;
  end;
end;

procedure TSyncFactory.AddLogoutLog;
begin
  if LoginId='' then Exit;
  if token.online then dataFactory.MoveToRemote else dataFactory.MoveToSqlite;
  try
    dataFactory.ExecSQL('update CA_LOGIN_INFO set LOGOUT_DATE='''+FormatDatetime('YYYY-MM-DD HH:NN:SS',now())+''',CONNECT_TIMES='+inttostr((GetTickCount-LoginStart) div 60000)+',COMM='+GetCommStr(dataFactory.iDbType)+',TIME_STAMP='+GetLoginTimeStamp(dataFactory.iDbType)+' where TENANT_ID='+token.tenantId+' and LOGIN_ID='''+LoginId+'''');
  finally
    dataFactory.MoveToDefault;
  end;
end;

procedure TSyncFactory.AddSyncLog(info:string);
var str:string;
begin
  if LoginId='' then Exit;
  if token.online then dataFactory.MoveToRemote else dataFactory.MoveToSqlite;
  try
    str := 'update CA_LOGIN_INFO set SYSTEM_INFO=ifnull(SYSTEM_INFO,'''')'+GetStrJoin(dataFactory.iDbType)+'''_'+info+''' where TENANT_ID='+token.tenantId+' and LOGIN_ID='''+LoginId+'''';
    dataFactory.ExecSQL(ParseSQL(dataFactory.iDbType, str));
  finally
    dataFactory.MoveToDefault;
  end;
end;

procedure TSyncFactory.SetLoginId(const Value: string);
begin
  FLoginId := Value;
end;

function TSyncFactory.DBLocked: boolean;
var
  i:integer;
  rs:TZQuery;
  rid:string;
  LocalList:TStringList;
begin
  result := true;
  if (dllGlobal.GetSFVersion = '.ONL') or (dllGlobal.GetSFVersion = '.NET') then Exit;
  rs := TZQuery.Create(nil);
  try
    rs.SQL.Text := 'select VALUE from SYS_DEFINE where DEFINE='''+'DBKEY_'+token.shopId+''' and TENANT_ID='+token.tenantId;
    try
      rs.Data := dataFactory.remote.OpenSQL(rs.SQL.Text,TftParamList.Encode(rs.Params));
    except
      Raise Exception.Create(StrPas(dataFactory.remote.getLastError));
    end;
    rid := rs.Fields[0].AsString;
    if rid <> '' then
       begin
         result := false;
         LocalList := TStringList.Create;
         try
           LocalList.DelimitedText := GetMacAddrInfo;
           LocalList.Delimiter := ',';
           for i := 0 to LocalList.Count - 1 do
             begin
               if pos(','+LocalList[i]+',', ','+rid+',') > 0 then
                  begin
                    result := true;
                    break;
                  end;
             end;
         finally
           LocalList.Free;
         end;
         if (not result) and (GetComputerName = rid) then
            begin
              result := true;
            end;
       end
    else
       begin
         result := false;
       end;
  finally
    rs.Free;
  end;
end;

function TSyncFactory.SyncLockCheck(PHWnd:THandle;tip:string): boolean;
var
  i:integer;
  rs:TZQuery;
  rid:string;
  LocalList:TStringList;
begin
  result := true;
  if (dllGlobal.GetSFVersion = '.ONL') or (dllGlobal.GetSFVersion = '.NET') then Exit;
  rs := TZQuery.Create(nil);
  try
    rs.SQL.Text := 'select VALUE from SYS_DEFINE where DEFINE='''+'DBKEY_'+token.shopId+''' and TENANT_ID='+token.tenantId;
    try
      rs.Data := dataFactory.remote.OpenSQL(rs.SQL.Text,TftParamList.Encode(rs.Params));
    except
      Raise Exception.Create(StrPas(dataFactory.remote.getLastError));
    end;
    rid := rs.Fields[0].AsString;
    if rid <> '' then
       begin
         result := false;
         LocalList := TStringList.Create;
         try
           LocalList.DelimitedText := GetMacAddrInfo;
           LocalList.Delimiter := ',';
           for i := 0 to LocalList.Count - 1 do
             begin
               if pos(','+LocalList[i]+',', ','+rid+',') > 0 then
                  begin
                    result := true;
                    break;
                  end;
             end;
         finally
           LocalList.Free;
         end;
         if (not result) and (GetComputerName = rid) then
            begin
              result := true;
            end;
       end
    else
       begin
         result := true;
         SyncLockDb;
       end;
  finally
    rs.Free;
  end;

  if not result then
     begin
       if tip = '' then tip := '无法上传数据...';
       if MessageBox(PHWnd,pchar('系统检测到当前使用的电脑不是您常用的电脑，'+tip+#10#13+'是否立即解锁?'),'友情提醒',MB_YESNO+MB_ICONQUESTION) = 6 then
          begin
            result := TfrmUnLockGuide.ShowDialog(Application.MainForm);
            if result then SyncLockDb;
          end
       else result := false;
     end;
end;

function TSyncFactory.SyncLockDb: boolean;
var
  rs:TZQuery;
  MacAddr:string;
  Params:TftParamList;
begin
  result := true;
  if not token.online then Exit;
  if (dllGlobal.GetSFVersion = '.ONL') or (dllGlobal.GetSFVersion = '.NET') then Exit;
  rs := TZQuery.Create(nil);
  try
    rs.Close;
    rs.SQL.Text := 'select VALUE from SYS_DEFINE where DEFINE='''+'DBKEY_'+token.shopId+''' and TENANT_ID='+token.tenantId;
    try
      rs.Data := dataFactory.remote.OpenSQL(rs.SQL.Text,TftParamList.Encode(rs.Params));
    except
      Raise Exception.Create(StrPas(dataFactory.remote.getLastError));
    end;
    if rs.Fields[0].AsString<>'' then Exit;
  finally
    rs.Free;
  end;
  MacAddr := GetMacAddrInfo;
  if MacAddr = '' then MacAddr := GetComputerName;
  if Length(MacAddr) > 100 then SetLength(MacAddr, 100);
  Params:=TftParamList.Create(nil);
  try
    Params.ParamByName('TENANT_ID').AsInteger:=strtoint(token.tenantId);
    Params.ParamByName('DBKEY').AsString:='DBKEY_'+token.shopId;
    Params.ParamByName('NEWID').AsString:=MacAddr;
    dataFactory.remote.ExecProc('TDoLockDBKey',TftParamList.Encode(Params));
  finally
    Params.Free;
  end;
end;

procedure TSyncFactory.BackUpDBFile;
var
  sr: TSearchRec;
  FileAttrs: Integer;
  delTime,Folder,FileName: string;
begin
  if dllGlobal.GetSFVersion <> '.LCL' then Exit;

  ProTitle := '正在备份数据文件，请稍候...';
  try
    delTime := FormatDateTime('YYYYMMDD',now()-7);
    Folder := ExtractFilePath(Application.ExeName)+'backup\'+token.tenantId;
    FileName := Folder+'\r3_'+FormatDateTime('YYYYMMDD',now())+'.db';
    ForceDirectories(ExtractFileDir(FileName));
    CopyFile(pchar(ExtractFilePath(Application.ExeName)+'data\r3.db'),pchar(FileName),false);

    // 删除历史备份文件
    FileAttrs := 0;
    FileAttrs := FileAttrs + faAnyFile;
    if FindFirst(Folder+'\*.db', FileAttrs, sr) = 0 then
    begin
      repeat
        try
          if (sr.Attr and FileAttrs) = sr.Attr then
          begin
            if (Copy(sr.Name,1,3) = 'r3_') and (Length(sr.Name) = 14) then
               begin
                 if (Copy(sr.Name,4,8) <= delTime) then
                    begin
                      DeleteFile(Folder+'\'+sr.Name);
                    end;
               end;
          end;
        except

        end;
      until FindNext(sr) <> 0;
      FindClose(sr);
    end;
  except

  end;
end;

function TSyncFactory.CheckRemoteData(AppHandle:HWnd):integer;
var
  rs:TZQuery;
  NeedRecovery:boolean;
  recType:string;
  // Folder,FileName
  // sr: TSearchRec;
  // FileAttrs: integer;
begin
  result := 0;
  if dllGlobal.GetSFVersion <> '.LCL' then Exit;
  rs := TZQuery.Create(nil);
  dataFactory.MoveToRemote;
  try
    rs.SQL.Text := 'select 1 from STO_STORAGE where TENANT_ID=:TENANT_ID and SHOP_ID=:SHOP_ID';
    rs.ParamByName('TENANT_ID').AsInteger := strtoint(token.tenantId);
    rs.ParamByName('SHOP_ID').AsString := token.shopId;
    dataFactory.Open(rs);
    NeedRecovery := not rs.IsEmpty;
  finally
    dataFactory.MoveToDefault;
    rs.Free;
  end;

  if not NeedRecovery then Exit;

  //远程数据还原
  if MessageBox(AppHandle,pchar('系统检测到服务端存在备份的数据，是否立即还原？'),'友情提示',MB_YESNO+MB_ICONQUESTION) = 6 then
     begin
       recType := TfrmSelectRecType.ShowDialog(Application.MainForm);
       if recType <> '' then
          begin
            try
              TfrmSysDefine.DBRemoteRecovery(recType,AppHandle);
              result := 2;
            except
              on E:Exception do
                 begin
                   result := -1;
                   MessageBox(AppHandle,pchar('数据恢复出错，原因：'+E.Message),'友情提示...',MB_OK+MB_ICONQUESTION);
                   Raise;
                 end;
            end;
          end;
     end;

{
  // 检测文件恢复
  try
    Folder := ExtractFilePath(Application.ExeName)+'backup\'+token.tenantId;
    FileAttrs := 0;
    FileAttrs := FileAttrs + faAnyFile;
    if FindFirst(Folder+'\*.db', FileAttrs, sr) = 0 then
       begin
         repeat
           try
             if (sr.Attr and FileAttrs) = sr.Attr then
             begin
               if (Copy(sr.Name,1,3) = 'r3_') and (Length(sr.Name) = 14) then
                  begin
                    if (FileName = '') or (Copy(sr.Name,4,8) > Copy(FileName,4,8)) then
                       begin
                         FileName := sr.Name;
                       end;
                  end;
             end;
           except

           end;
         until FindNext(sr) <> 0;
         FindClose(sr);
       end;
  except

  end;

  if (FileName <> '') and (CheckValidDBFile(Folder+'\'+FileName)) then
     begin
       //本地文件还原
       if MessageBox(AppHandle,pchar('系统检测到本地存在数据备份文件，是否立即还原？'),'友情提示',MB_YESNO+MB_ICONQUESTION) = 6 then
          begin
            try
              TfrmSysDefine.DBFileRecovery(Folder+'\'+FileName,AppHandle);
              result := 1;
            except
              on E:Exception do
                 begin
                   MessageBox(AppHandle,pchar(E.Message),'友情提示...',MB_OK+MB_ICONQUESTION);
                 end;
            end;
          end;
     end
  else
     begin
     end;
}
end;

function TSyncFactory.CheckBackUpDBFile(PHWnd:THandle): boolean;
begin
  if dllGlobal.GetSFVersion <> '.LCL' then Exit;
  if FileExists(ExtractFilePath(Application.ExeName)+'data\r3_bak.r6') then
     begin
       if not CheckValidDBFile(ExtractFilePath(Application.ExeName)+'data\r3_bak.r6') then
          begin
            DeleteFile(ExtractFilePath(Application.ExeName)+'data\r3_bak.r6');
            Exit;
          end;
       MessageBox(PHWnd,'系统检测到上次数据恢复过程中异常中断，需对数据文件进行还原...','友情提示...',MB_OK+MB_ICONQUESTION);
       dataFactory.sqlite.DisConnect;
       if CopyFile(pchar(ExtractFilePath(Application.ExeName)+'data\r3_bak.r6'),pchar(ExtractFilePath(Application.ExeName)+'data\r3.db'),false) then
          begin
            dataFactory.sqlite.Connect;
            DeleteFile(ExtractFilePath(Application.ExeName)+'data\r3_bak.r6');
            MessageBox(PHWnd,'数据文件还原成功...','友情提示..',MB_OK);
          end
       else
          begin
            Raise Exception.Create('数据文件恢复失败...');
          end;
      end;
end;

function TSyncFactory.CheckValidDBFile(src: string): boolean;
var
  rs:TZQuery;
  sqlite:TdbFactory;
begin
  result := false;
  try
    sqlite := TdbFactory.Create;
    rs := TZQuery.Create(nil);
    try
      sqlite.Initialize('provider=sqlite-3;databasename='+ExtractShortPathName(src));
      sqlite.connect;
      rs.SQL.Text := 'select VALUE from SYS_DEFINE where DEFINE = ''TENANT_ID'' and TENANT_ID=0';
      sqlite.Open(rs);
      if rs.Fields[0].AsString = token.tenantId then
         result := true
      else
         result := false;
    finally
      rs.Free;
      sqlite.Free;
    end;
  except
    result := false;
  end;
end;

procedure TSyncFactory.SyncStorage;
var
  n:PSynTableInfo;
begin
  if dllGlobal.GetSFVersion <> '.LCL' then Exit;
  new(n);
  n^.tbname := 'STO_STORAGE';
  n^.keyFields := 'TENANT_ID;SHOP_ID;GODS_ID;BATCH_NO;PROPERTY_01;PROPERTY_02';
  n^.synFlag := 1;
  n^.keyFlag := 1;
  n^.tbtitle := '当前库存';
  n^.isSyncUp := '1';
  try
    if GetSynTimeStamp(token.tenantId,'STO_STORAGE','#') <= 5497000 then
       begin
         dataFactory.remote.ExecSQL('update STO_STORAGE set AMOUNT=0,AMONEY=0 where TENANT_ID='+token.tenantId+' and SHOP_ID='''+token.shopId+'''');
       end;
    SyncSingleTable(n);
  finally
    dispose(n);
  end;
end;

procedure TSyncFactory.TimerSync;
begin
  if dllApplication.mode = 'demo' then Exit;
  if not timered then TTimeSyncThread.Create(false);
end;

procedure TSyncFactory.Settimered(const Value: boolean);
begin
  if Value then
     EnterCriticalSection(ThreadLock)
  else
     LeaveCriticalSection(ThreadLock);
  Ftimered := Value;
end;

{ TTimeSyncThread }

constructor TTimeSyncThread.Create(CreateSuspended: Boolean);
begin
  inherited Create(CreateSuspended);
  FreeOnTerminate := true;
end;

destructor TTimeSyncThread.Destroy;
begin
  inherited;
end;

procedure TTimeSyncThread.Execute;
var
  sql:string;
begin
  inherited;
  SyncFactory.timered := true;
  CoInitialize(nil);
  try
    try
    if not SyncFactory.DBLocked then Exit;
    //在线状态心跳
    if SyncFactory.LoginId<>'' then
    begin
      if token.online then
         begin
           sql := 'update CA_LOGIN_INFO set LOGOUT_DATE='''+FormatDatetime('YYYY-MM-DD HH:NN:SS',now())+''',CONNECT_TIMES='+inttostr((GetTickCount-SyncFactory.LoginStart) div 60000)+',COMM='+GetCommStr(dataFactory.remote.iDbType)+',TIME_STAMP='+SyncFactory.GetLoginTimeStamp(dataFactory.remote.iDbType)+' where TENANT_ID='+token.tenantId+' and LOGIN_ID='''+SyncFactory.LoginId+'''';
           dataFactory.remote.ExecSQL(sql);
         end
      else
         begin
           sql := 'update CA_LOGIN_INFO set LOGOUT_DATE='''+FormatDatetime('YYYY-MM-DD HH:NN:SS',now())+''',CONNECT_TIMES='+inttostr((GetTickCount-SyncFactory.LoginStart) div 60000)+',COMM='+GetCommStr(dataFactory.sqlite.iDbType)+',TIME_STAMP='+SyncFactory.GetLoginTimeStamp(dataFactory.sqlite.iDbType)+' where TENANT_ID='+token.tenantId+' and LOGIN_ID='''+SyncFactory.LoginId+'''';
           dataFactory.sqlite.ExecSQL(sql);
         end;
    end;

    if not token.online then Exit;

    if SyncFactory.timerTerminted then Exit;
    SyncFactory.TimerSyncSales;
    if SyncFactory.timerTerminted then Exit;
    SyncFactory.TimerSyncStock;
    if SyncFactory.timerTerminted then Exit;
    SyncFactory.TimerSyncChange;
    if SyncFactory.timerTerminted then Exit;
    SyncFactory.TimerSyncStorage;
    if SyncFactory.timerTerminted then Exit;
    SyncFactory.TimerSyncMessage;
    except
    end;
  finally
    CoUninitialize;
    SyncFactory.timered := false;
  end;
end;

procedure TSyncFactory.SettimerTerminted(const Value: boolean);
begin
  FtimerTerminted := Value;
end;

procedure TSyncFactory.TimerSyncSales;
var
  Params:TftParamList;
  LastTimeStamp:int64;
  ls,rs_h,rs_d,rs_s,cs_h,cs_d,cs_s:TZQuery;
  tbName,orderFields,dataFields,glideFields:string;
begin
  if (dllGlobal.GetSFVersion <> '.LCL') then Exit;

  tbName := 'SAL_SALESORDER';
  LastTimeStamp := GetSynTimeStamp(token.tenantId,tbName,token.shopId);
  if timerTerminted then Exit;

  ls := TZQuery.Create(nil);
  rs_h := TZQuery.Create(nil);
  rs_d := TZQuery.Create(nil);
  rs_s := TZQuery.Create(nil);
  cs_h := TZQuery.Create(nil);
  cs_d := TZQuery.Create(nil);
  cs_s := TZQuery.Create(nil);
  Params := TftParamList.Create(nil);
  try
    Params.ParamByName('TENANT_ID').AsInteger := strtoint(token.tenantId);
    Params.ParamByName('SHOP_ID').AsString := token.shopId;
    Params.ParamByName('TABLE_NAME').AsString := tbName;
    Params.ParamByName('TIME_STAMP').Value := LastTimeStamp;
    Params.ParamByName('KEY_FLAG').AsInteger := 0;
    Params.ParamByName('TIME_STAMP_NOCHG').AsInteger := 0;
    Params.ParamByName('SYN_COMM').AsBoolean := true;

    //更新库存控制
    if dllGlobal.GetSFVersion = '.LCL' then
       Params.ParamByName('UPDATE_STORAGE').AsBoolean := false
    else
       Params.ParamByName('UPDATE_STORAGE').AsBoolean := true;

    dataFactory.sqlite.Open(ls,'TSyncSalesOrderListV60',Params);

    if ls.RecordCount>0 then LogFile.AddLogFile(0,'上传定时同步<'+tbName+'>  记录数:'+inttostr(ls.RecordCount));

    if timerTerminted then Exit;

    BeforeSyncBiz(ls,'SALES_DATE',0);
    ls.First;
    while not ls.Eof do
    begin
      if timerTerminted then Exit;
      rs_h.Close;
      rs_d.Close;
      rs_s.Close;
      cs_h.Close;
      cs_d.Close;
      cs_s.Close;

      Params.ParamByName('KEY_FIELDS').AsString := 'TENANT_ID;SALES_ID';
      Params.ParamByName('SALES_ID').AsString := ls.FieldbyName('SALES_ID').AsString;

      if orderFields = '' then orderFields := GetTableFields('SAL_SALESORDER');
      if dataFields = ''  then dataFields  := GetTableFields('SAL_SALESDATA');
      if glideFields = '' then glideFields := GetTableFields('SAL_IC_GLIDE');

      dataFactory.sqlite.BeginBatch;
      try
        Params.ParamByName('TABLE_FIELDS').AsString := orderFields;
        dataFactory.sqlite.AddBatch(rs_h,'TSyncSalesOrderV60',Params);
        Params.ParamByName('TABLE_FIELDS').AsString := dataFields;
        dataFactory.sqlite.AddBatch(rs_d,'TSyncSalesDataV60',Params);
        Params.ParamByName('TABLE_FIELDS').AsString := glideFields;
        dataFactory.sqlite.AddBatch(rs_s,'TSyncSalesICDataV60',Params);
        dataFactory.sqlite.OpenBatch;
      except
        dataFactory.sqlite.CancelBatch;
        Raise;
      end;

      if timerTerminted then Exit;

      cs_h.SyncDelta := rs_h.SyncDelta;
      cs_d.SyncDelta := rs_d.SyncDelta;
      cs_s.SyncDelta := rs_s.SyncDelta;

      dataFactory.remote.BeginBatch;
      try
        dataFactory.remote.AddBatch(TZQuery(cs_h).Delta,'TSyncSalesOrderV60',TftParamList.Encode(Params));
        dataFactory.remote.AddBatch(TZQuery(cs_d).Delta,'TSyncSalesDataV60',TftParamList.Encode(Params));
        dataFactory.remote.AddBatch(TZQuery(cs_s).Delta,'TSyncSalesICDataV60',TftParamList.Encode(Params));
        dataFactory.remote.CommitBatch;
      except
        dataFactory.remote.CancelBatch;
        Raise;
      end;

      rs_h.Delete;
      dataFactory.sqlite.BeginBatch;
      try
        dataFactory.sqlite.AddBatch(rs_h,'TSyncSalesOrderV60',Params);
        if not rs_s.IsEmpty then
           begin
             rs_s.Delete;
             dataFactory.sqlite.AddBatch(rs_s,'TSyncSalesICDataV60',Params);
           end;
        dataFactory.sqlite.CommitBatch;
      except
        dataFactory.sqlite.CancelBatch;
        Raise;
      end;

      ls.Next;
    end;
  finally
    Params.Free;
    ls.Free;
    rs_h.Free;
    rs_d.Free;
    rs_s.Free;
    cs_h.Free;
    cs_d.Free;
    cs_s.Free;
  end;
end;

procedure TSyncFactory.TimerSyncChange;
var
  Params:TftParamList;
  LastTimeStamp:int64;
  ls,rs_h,rs_d,cs_h,cs_d:TZQuery;
  tbName,orderFields,dataFields:string;
begin
  if (dllGlobal.GetSFVersion <> '.LCL') then Exit;

  tbName := 'STO_CHANGEORDER';
  LastTimeStamp := GetSynTimeStamp(token.tenantId,tbName,token.shopId);
  if timerTerminted then Exit;

  ls := TZQuery.Create(nil);
  rs_h := TZQuery.Create(nil);
  rs_d := TZQuery.Create(nil);
  cs_h := TZQuery.Create(nil);
  cs_d := TZQuery.Create(nil);
  Params := TftParamList.Create(nil);
  try
    Params.ParamByName('TENANT_ID').AsInteger := strtoint(token.tenantId);
    Params.ParamByName('SHOP_ID').AsString := token.shopId;
    Params.ParamByName('TABLE_NAME').AsString := tbName;
    Params.ParamByName('TIME_STAMP').Value := LastTimeStamp;
    Params.ParamByName('KEY_FLAG').AsInteger := 0;
    Params.ParamByName('TIME_STAMP_NOCHG').AsInteger := 0;
    Params.ParamByName('SYN_COMM').AsBoolean := true;
    //更新库存控制
    if dllGlobal.GetSFVersion = '.LCL' then
       Params.ParamByName('UPDATE_STORAGE').AsBoolean := false
    else
       Params.ParamByName('UPDATE_STORAGE').AsBoolean := true;

    dataFactory.sqlite.Open(ls,'TSyncChangeOrderListV60',Params);

    if timerTerminted then Exit;

    if ls.RecordCount>0 then LogFile.AddLogFile(0,'上传定时同步<'+tbName+'> 记录数:'+inttostr(ls.RecordCount));

    BeforeSyncBiz(ls,'CHANGE_DATE',0);
    ls.First;
    while not ls.Eof do
    begin
      if timerTerminted then Exit;
      rs_h.Close;
      rs_d.Close;
      cs_h.Close;
      cs_d.Close;

      Params.ParamByName('KEY_FIELDS').AsString := 'TENANT_ID;CHANGE_ID';
      Params.ParamByName('CHANGE_ID').AsString := ls.FieldbyName('CHANGE_ID').AsString;

      if orderFields = '' then orderFields := GetTableFields('STO_CHANGEORDER');
      if dataFields = ''  then dataFields  := GetTableFields('STO_CHANGEDATA','a');

      dataFactory.sqlite.BeginBatch;
      try
        Params.ParamByName('TABLE_FIELDS').AsString := orderFields;
        dataFactory.sqlite.AddBatch(rs_h,'TSyncChangeOrderV60',Params);
        Params.ParamByName('TABLE_FIELDS').AsString := dataFields;
        dataFactory.sqlite.AddBatch(rs_d,'TSyncChangeDataV60',Params);
        dataFactory.sqlite.OpenBatch;
      except
        dataFactory.sqlite.CancelBatch;
        Raise;
      end;
      if timerTerminted then Exit;

      cs_h.SyncDelta := rs_h.SyncDelta;
      cs_d.SyncDelta := rs_d.SyncDelta;

      dataFactory.remote.BeginBatch;
      try
        dataFactory.remote.AddBatch(TZQuery(cs_h).Delta,'TSyncChangeOrderV60',TftParamList.Encode(Params));
        dataFactory.remote.AddBatch(TZQuery(cs_d).Delta,'TSyncChangeDataV60',TftParamList.Encode(Params));
        dataFactory.remote.CommitBatch;
      except
        dataFactory.remote.CancelBatch;
        Raise;
      end;

      rs_h.Delete;
      dataFactory.UpdateBatch(rs_h,'TSyncChangeOrderV60',Params);

      ls.Next;
    end;
  finally
    Params.Free;
    ls.Free;
    rs_h.Free;
    rs_d.Free;
    cs_h.Free;
    cs_d.Free;
  end;
end;

procedure TSyncFactory.TimerSyncStock;
var
  Params:TftParamList;
  LastTimeStamp:int64;
  ls,rs_h,rs_d,cs_h,cs_d:TZQuery;
  tbName,orderFields,dataFields:string;
begin
  if (dllGlobal.GetSFVersion <> '.LCL') then Exit;

  tbName := 'STK_STOCKORDER';
  LastTimeStamp := GetSynTimeStamp(token.tenantId,tbName,token.shopId);
  if timerTerminted then Exit;

  ls := TZQuery.Create(nil);
  rs_h := TZQuery.Create(nil);
  rs_d := TZQuery.Create(nil);
  cs_h := TZQuery.Create(nil);
  cs_d := TZQuery.Create(nil);
  Params := TftParamList.Create(nil);
  try
    Params.ParamByName('TENANT_ID').AsInteger := strtoint(token.tenantId);
    Params.ParamByName('SHOP_ID').AsString := token.shopId;
    Params.ParamByName('TABLE_NAME').AsString := tbName;
    Params.ParamByName('TIME_STAMP').Value := LastTimeStamp;
    Params.ParamByName('KEY_FLAG').AsInteger := 0;
    Params.ParamByName('TIME_STAMP_NOCHG').AsInteger := 0;
    Params.ParamByName('SYN_COMM').AsBoolean := true;
    //更新库存控制
    if dllGlobal.GetSFVersion = '.LCL' then
       Params.ParamByName('UPDATE_STORAGE').AsBoolean := false
    else
       Params.ParamByName('UPDATE_STORAGE').AsBoolean := true;

    dataFactory.sqlite.Open(ls,'TSyncStockOrderListV60',Params);

    if ls.RecordCount>0 then LogFile.AddLogFile(0,'上传定时同步<'+tbName+'>  记录数:'+inttostr(ls.RecordCount));

    if timerTerminted then Exit;

    BeforeSyncBiz(ls,'STOCK_DATE',0);
    ls.First;
    while not ls.Eof do
    begin
      if timerTerminted then Exit;
      rs_h.Close;
      rs_d.Close;
      cs_h.Close;
      cs_d.Close;

      Params.ParamByName('KEY_FIELDS').AsString := 'TENANT_ID;STOCK_ID';
      Params.ParamByName('STOCK_ID').AsString := ls.FieldbyName('STOCK_ID').AsString;

      if orderFields = '' then orderFields := GetTableFields('STK_STOCKORDER');
      if dataFields = ''  then dataFields  := GetTableFields('STK_STOCKDATA','a');

      dataFactory.sqlite.BeginBatch;
      try
        Params.ParamByName('TABLE_FIELDS').AsString := orderFields;
        dataFactory.sqlite.AddBatch(rs_h,'TSyncStockOrderV60',Params);
        Params.ParamByName('TABLE_FIELDS').AsString := dataFields;
        dataFactory.sqlite.AddBatch(rs_d,'TSyncStockDataV60',Params);
        dataFactory.sqlite.OpenBatch;
      except
        dataFactory.sqlite.CancelBatch;
        Raise;
      end;

      if timerTerminted then Exit;

      cs_h.SyncDelta := rs_h.SyncDelta;
      cs_d.SyncDelta := rs_d.SyncDelta;

      dataFactory.remote.BeginBatch;
      try
        dataFactory.remote.AddBatch(TZQuery(cs_h).Delta,'TSyncStockOrderV60',TftParamList.Encode(Params));
        dataFactory.remote.AddBatch(TZQuery(cs_d).Delta,'TSyncStockDataV60',TftParamList.Encode(Params));
        dataFactory.remote.CommitBatch;
      except
        dataFactory.remote.CancelBatch;
        Raise;
      end;

      rs_h.Delete;
      dataFactory.sqlite.UpdateBatch(rs_h,'TSyncStockOrderV60',Params);

      ls.Next;
    end;
  finally
    Params.Free;
    ls.Free;
    rs_h.Free;
    rs_d.Free;
    cs_h.Free;
    cs_d.Free;
  end;
end;

procedure TSyncFactory.TimerSyncStorage;
var
  i:integer;
  tmpObj:TRecord_;
  ZClassName:string;
  rs_l,rs_r:TZQuery;
  LastTimeStamp:int64;
  Params:TftParamList;
begin
  if dllGlobal.GetSFVersion <> '.LCL' then Exit;

  if timerTerminted then Exit;

  tmpObj := TRecord_.Create;
  rs_l := TZQuery.Create(nil);
  rs_r := TZQuery.Create(nil);
  Params := TftParamList.Create(nil);
  try
    ZClassName := 'TSyncSingleTableV60';
    LastTimeStamp := GetSynTimeStamp(token.tenantId,'STO_STORAGE','#');

    if timerTerminted then Exit;

    rs_l.Close;
    rs_r.Close;

    Params.ParamByName('TENANT_ID').AsInteger := strtoint(token.tenantId);
    Params.ParamByName('SHOP_ID').AsString := token.shopId;
    Params.ParamByName('KEY_FLAG').AsInteger := 1;
    Params.ParamByName('TABLE_NAME').AsString := 'STO_STORAGE';
    Params.ParamByName('KEY_FIELDS').AsString := 'TENANT_ID;SHOP_ID;GODS_ID;BATCH_NO;PROPERTY_01;PROPERTY_02';
    Params.ParamByName('TIME_STAMP').Value := LastTimeStamp;
    Params.ParamByName('LAST_TIME_STAMP').Value := LastTimeStamp;
    Params.ParamByName('TIME_STAMP_NOCHG').AsInteger := 1;
    Params.ParamByName('SYN_COMM').AsBoolean := true;
    Params.ParamByName('Transed').AsBoolean := false;
    Params.ParamByName('TABLE_FIELDS').AsString := GetTableFields('STO_STORAGE');

    dataFactory.sqlite.Open(rs_l,ZClassName,Params);

    if timerTerminted then Exit;

    if LastTimeStamp <= 5497000 then
       begin
         dataFactory.remote.ExecSQL('update STO_STORAGE set AMOUNT=0,AMONEY=0 where TENANT_ID='+token.tenantId+' and SHOP_ID='''+token.shopId+'''');
       end;

    if timerTerminted then Exit;

    if rs_l.IsEmpty then Exit;

    if rs_l.RecordCount <= MAX_SYNC_RECORD_COUNT then
       begin
         rs_r.SyncDelta := rs_l.SyncDelta;
         dataFactory.remote.UpdateBatch(TZQuery(rs_r).Delta,ZClassName,TftParamList.Encode(Params));
       end
    else
       begin
         i := 0;
         rs_l.First;
         rs_r.FieldDefs.Assign(rs_l.FieldDefs);
         rs_r.CreateDataSet;
         while not rs_l.Eof do
           begin
             if timerTerminted then Exit;

             rs_r.Append;
             tmpObj.ReadFromDataSet(rs_l);
             tmpObj.WriteToDataSet(rs_r);
             inc(i);
             rs_l.Next;
             if (i >= MAX_SYNC_RECORD_COUNT) or (rs_l.Eof) then
                begin
                  dataFactory.remote.UpdateBatch(TZQuery(rs_r).Delta,ZClassName,TftParamList.Encode(Params));
                  i := 0;
                  rs_r.EmptyDataSet;
                end;
           end;
      end;
  finally
    tmpObj.Free;
    Params.Free;
    rs_l.Free;
    rs_r.Free;
  end;
end;

function TSyncFactory.Gettimered: boolean;
begin
  result := Ftimered;
end;

procedure TSyncFactory.TimerSyncMessage;
var n1,n2:PSynTableInfo;
begin
  if not token.online then Exit;
  if dllGlobal.GetSFVersion <> '.LCL' then Exit;

  new(n1);
  n1^.tbname := 'MSC_MESSAGE';
  n1^.keyFields := 'TENANT_ID;MSG_ID';
  n1^.whereStr :=  'TENANT_ID=:TENANT_ID and TIME_STAMP>:TIME_STAMP and END_DATE>='+QuotedStr(FormatDateTime('YYYY-MM-DD',Date()));
  n1^.synFlag := 33;
  n1^.keyFlag := 0;
  n1^.tbtitle := '消息内容';
  n1^.isSyncDown := '1';

  new(n2);
  n2^.tbname := 'MSC_MESSAGE_LIST';
  n2^.keyFields := 'TENANT_ID;MSG_ID;SHOP_ID';
  n2^.whereStr :=  'TENANT_ID=:TENANT_ID and SHOP_ID=:SHOP_ID and TIME_STAMP>:TIME_STAMP and MSG_READ_STATUS=1';
  n2^.syncShopId := token.shopId;
  n2^.synFlag := 33;
  n2^.keyFlag := 0;
  n2^.tbtitle := '消息列表';
  n2^.isSyncDown := '1';

  try
    SyncSingleTable(n1);
    if timerTerminted then Exit;
    SyncSingleTable(n2);
  finally
    dispose(n1);
    dispose(n2);
  end;

  MsgFactory.Load;
  MsgFactory.GetUnRead;
end;

procedure TSyncFactory.SyncUpperAmount;
var
  F:TIniFile;
  rs,ss:TZQuery;
  Params:TftParamList;
  MaxTimeStamp,LastTimeStamp:int64;
  rimComId,rimCustId,ZClassName,LicenseCode:string;
begin
  F := TIniFile.Create(ExtractFilePath(Application.ExeName)+'r3.cfg');
  try
    if F.ReadString('soft','SYNC_UPPER_AMOUNT','0') = '0' then Exit;
  finally
    F.Free;
  end;

  ss := dllGlobal.GetZQueryFromName('CA_SHOP_INFO');
  LicenseCode := ss.FieldByName('LICENSE_CODE').AsString;
  rs := TZQuery.Create(nil);
  ss := TZQuery.Create(nil);
  Params := TftParamList.Create(nil);
  try
    rs.SQL.Text := 'select COM_ID,CUST_ID from RM_CUST a where a.LICENSE_CODE=:LICENSE_CODE';
    rs.ParamByName('LICENSE_CODE').AsString := LicenseCode;
    try
      TZQuery(rs).Data := dbHelp.OpenSQL(TZQuery(rs).SQL.Text,TftParamList.Encode(TZQuery(rs).Params));
    except
      Raise Exception.Create(StrPas(dataFactory.remote.getLastError));
    end;
    if rs.IsEmpty then Exit;
    rimComId := rs.FieldByName('COM_ID').AsString;
    rimCustId := rs.FieldByName('CUST_ID').AsString;
  finally
    rs.Free;
  end;

  ZClassName := 'TSyncSingleTableV60';
  LastTimeStamp := GetSynTimeStamp('999999999','PUB_GOODSINFOEXT');
  MaxTimeStamp := LastTimeStamp;

  LogFile.AddLogFile(0,'开始下载<PUB_GOODSINFO_合理库存>上次时间:'+inttostr(LastTimeStamp));

  SetTicket;
  rs := TZQuery.Create(nil);
  try
    rs.SQL.Text :=
      ' select a.TENANT_ID,a.GODS_ID,b.WHSE_UP*(case when a.SMALLTO_CALC is null then 1 else a.SMALLTO_CALC end) as UPPER_AMOUNT,''10'' as COMM,b.TIME_STAMP '+
      ' from   VIW_GOODSINFO a,RIM_CUST_ITEM_WHSE_QTY b '+
      ' where  a.TENANT_ID=:TENANT_ID '+
      '        and b.COM_ID=:COM_ID and b.CUST_ID=:CUST_ID '+
      '        and a.SECOND_ID=b.ITEM_ID '+
      '        and b.TIME_STAMP>:TIME_STAMP '+
      ' order by b.TIME_STAMP asc ';
    rs.ParamByName('TENANT_ID').AsInteger:=StrtoInt(token.tenantId);
    rs.ParamByName('COM_ID').AsString:=rimComId;
    rs.ParamByName('CUST_ID').AsString:=rimCustId;
    rs.ParamByName('TIME_STAMP').Value:=LastTimeStamp;
    try
      TZQuery(rs).Data := dbHelp.OpenSQL(TZQuery(rs).SQL.Text,TftParamList.Encode(TZQuery(rs).Params));
    except
      Raise Exception.Create(StrPas(dataFactory.remote.getLastError));
    end;

    LogFile.AddLogFile(0,'下载<PUB_GOODSINFO_合理库存>打开时长:'+inttostr(GetTicket)+'  记录数:'+inttostr(rs.RecordCount));

    if not rs.IsEmpty then
       begin
         rs.Last;
         if StrtoInt64(rs.FieldByName('TIME_STAMP').AsString) > MaxTimeStamp then
            MaxTimeStamp := StrtoInt64(rs.FieldByName('TIME_STAMP').AsString);

         SetTicket;
         ss.SyncDelta := rs.SyncDelta;
         Params.ParamByName('TENANT_ID').AsInteger := strtoint(token.tenantId);
         Params.ParamByName('SHOP_ID').AsString := token.shopId;
         Params.ParamByName('KEY_FLAG').AsInteger := 1;
         Params.ParamByName('TABLE_NAME').AsString := 'PUB_GOODSINFOEXT';
         Params.ParamByName('KEY_FIELDS').AsString := 'TENANT_ID;GODS_ID';
         Params.ParamByName('TIME_STAMP').Value := LastTimeStamp;
         Params.ParamByName('TIME_STAMP_NOCHG').AsInteger := 1;
         Params.ParamByName('SYN_COMM').AsBoolean := false;
         Params.ParamByName('Transed').AsBoolean := true;
         dataFactory.UpdateBatch(ss,ZClassName,Params);

         LogFile.AddLogFile(0,'下载<PUB_GOODSINFO_合理库存>保存时长:'+inttostr(GetTicket));

         if MaxTimeStamp > LastTimeStamp then
            SetSynTimeStamp('999999999','PUB_GOODSINFOEXT',MaxTimeStamp);
       end;
  finally
    Params.Free;
    ss.Free;
    rs.Free;
  end;
end;

procedure TSyncFactory.CloseForDaySync(PHWnd: THandle);
begin
  timerTerminted := true;
  WaitForSync;
  timered := true;
  try
    if dllApplication.mode = 'demo' then Exit;
    if token.tenantId = '' then Exit;
    with TfrmSyncData.Create(nil) do
    begin
      try
        if token.online then dataFactory.remote.DBLock(true);
        if not token.online then Exit;
        hWnd := PHWnd;
        ShowForm;
        BringToFront;
        Update;
        SyncFactory.SyncBasic(2);
        SyncFactory.SyncBizData;
      finally
        Free;
        if token.online then dataFactory.remote.DBLock(false);
      end;
    end;
  finally
    timered := false;
    timerTerminted := false;
  end;
end;

procedure TSyncFactory.WaitForSync;
var _Start:int64;
begin
  _Start := GetTickCount;
  while timered do
    begin
      Application.ProcessMessages;
      if (GetTickCount-_Start) > 1000*10 then Raise Exception.Create('同步等待超时，请稍后重试...');
    end;
end;

procedure TSyncFactory.InitGodsInfo;
var
  i:integer;
  rs:TZQuery;
  FileName,str1,str2:string;
  SQLList:TStringList;
  BatchSQLFactor,SqlliteFactor:TBatchSQLFactory;
begin
  FileName := ExtractFilePath(Application.ExeName)+'InitGods.dat';

  if not FileExists(FileName) then Exit;

  rs := TZQuery.Create(nil);
  dataFactory.MoveToSqlite;
  try
    rs.SQL.Text := 'select count(1) from PUB_GOODSINFO where TENANT_ID=:TENANT_ID';
    rs.ParamByName('TENANT_ID').AsInteger := strtoint(token.tenantId);
    dataFactory.Open(rs);
    if rs.Fields[0].AsInteger > 0 then Exit;
  finally
    dataFactory.MoveToDefault;
    rs.Free;
  end;

  rs := TZQuery.Create(nil);
  dataFactory.MoveToRemote;
  try
    rs.SQL.Text := 'select count(1) from PUB_GOODSINFO where TENANT_ID=:TENANT_ID';
    rs.ParamByName('TENANT_ID').AsInteger := strtoint(token.tenantId);
    dataFactory.Open(rs);
    if rs.Fields[0].AsInteger > 0 then Exit;
  finally
    dataFactory.MoveToDefault;
    rs.Free;
  end;

  SQLList := TStringList.Create;
  BatchSQLFactor := TBatchSQLFactory.Create;
  SqlliteFactor := TBatchSQLFactory.Create;
  try
    SQLList.LoadFromFile(FileName);
    SQLList.Delimiter := ';';
    for i := 0 to SQLList.Count - 1 do
      begin
        str1 := trim(SQLList.Strings[i]);
        str2 := trim(SQLList.Strings[i]);
        if str1 <> '' then
           begin
             str1 := stringreplace(str1,':TENANT_ID',token.tenantId,[rfReplaceAll]);
             str1 := stringreplace(str1,':SHOP_ID',''''+token.shopId+'''',[rfReplaceAll]);
             str1 := stringreplace(str1,':TIME_STAMP',GetTimeStamp(dataFactory.iDbType),[rfReplaceAll]);
             BatchSQLFactor.AppendSQL(ParseSQL(dataFactory.iDbType, str1));
           end;
        if str2 <> '' then
           begin
             str2 := stringreplace(str2,':TENANT_ID',token.tenantId,[rfReplaceAll]);
             str2 := stringreplace(str2,':SHOP_ID',''''+token.shopId+'''',[rfReplaceAll]);
             str2 := stringreplace(str2,':TIME_STAMP',GetTimeStamp(dataFactory.sqlite.iDbType),[rfReplaceAll]);
             SqlliteFactor.AppendSQL(ParseSQL(dataFactory.sqlite.iDbType, str2));
           end;
      end;
    BatchSQLFactor.DoExecSQLComand(dataFactory);
    if dataFactory.iDbType <> 5 then
       begin
         dataFactory.MoveToSqlite;
         try
           SqlliteFactor.DoExecSQLComand(dataFactory);
         finally
           dataFactory.MoveToDefault;
         end;
       end;
  finally
    SQLList.Free;
    BatchSQLFactor.Free;
    SqlliteFactor.Free;
  end;
end;

procedure TSyncFactory.CreateBatch(var rs: TZQuery; src: TZQuery; FieldName: string; FieldType: TFieldType);
var
  i:integer;
  ids:string;
begin
  rs.FieldDefs.Clear;
  rs.FieldDefs.Add('TENANT_ID', ftInteger);
  rs.FieldDefs.Add('IDS', ftString, 10000);
  rs.CreateDataSet;
  i := 0;
  ids := '';
  src.First;
  while not src.Eof do
    begin
      if ids <> '' then ids := ids + ',';
      ids := ids + src.FieldByName(FieldName).AsString;
      inc(i);
      src.Next;
      if (i >= MAX_SYNC_ORDER_COUNT) or (src.Eof) then
         begin
           rs.Append;
           rs.FieldByName('TENANT_ID').AsInteger := strtoint(token.tenantId);
           if FieldType = ftString then
              begin
                ids := stringreplace(ids,',',''',''',[rfReplaceAll]);
                ids := '''' + ids + '''';
              end;
           rs.FieldByName('IDS').AsString := ids;
           rs.Post;
           i := 0;
           ids := '';
         end;
    end;
end;

procedure TSyncFactory.DownloadSalesOrder(BeginDate: string);
var
  Params:TftParamList;
  MaxTimeStamp,LastTimeStamp:int64;
  bl,ls,rs_h,rs_d,cs_h,cs_d:TZQuery;
  tbName,orderFields,dataFields,glideFields:string;
begin
  if dllGlobal.GetSFVersion <> '.LCL' then Exit;

  tbName := 'SAL_SALESORDER';
  LastTimeStamp := GetSynTimeStamp(token.tenantId,tbName,token.shopId);
  MaxTimeStamp := LastTimeStamp;

  LogFile.AddLogFile(0,'开始<'+tbName+'>批量下载 上次时间:'+inttostr(LastTimeStamp));

  bl := TZQuery.Create(nil);
  ls := TZQuery.Create(nil);
  rs_h := TZQuery.Create(nil);
  rs_d := TZQuery.Create(nil);
  cs_h := TZQuery.Create(nil);
  cs_d := TZQuery.Create(nil);
  Params := TftParamList.Create(nil);
  try
    Params.ParamByName('TENANT_ID').AsInteger := strtoint(token.tenantId);
    Params.ParamByName('SHOP_ID').AsString := token.shopId;
    Params.ParamByName('TABLE_NAME').AsString := tbName;
    Params.ParamByName('TIME_STAMP').Value := LastTimeStamp;
    Params.ParamByName('KEY_FLAG').AsInteger := 0;
    Params.ParamByName('TIME_STAMP_NOCHG').AsInteger := 0;
    Params.ParamByName('SYN_COMM').AsBoolean := false;

    if BeginDate <> '' then
       begin
         Params.ParamByName('BEGIN_DATE').AsInteger := strtoint(BeginDate);
         Params.ParamByName('SYS_BEGIN_DATE').AsInteger := CloseAccDate;
       end;

    if BeginDate = '' then
       begin
         Params.ParamByName('UPDATE_STORAGE').AsBoolean := true;
         Params.ParamByName('UPDATE_INTEGRAL').AsBoolean := false;
       end
    else
       begin
         Params.ParamByName('UPDATE_STORAGE').AsBoolean := false;
         Params.ParamByName('UPDATE_INTEGRAL').AsBoolean := false;
       end;

    SetTicket;

    dataFactory.MoveToRemote;
    try
      dataFactory.Open(ls,'TSyncSalesOrderListV60',Params);
    finally
      dataFactory.MoveToDefault;
    end;

    LogFile.AddLogFile(0,'批量下载<'+tbName+'>打开时长:'+inttostr(GetTicket)+'  记录数:'+inttostr(ls.RecordCount));
    BeforeSyncBiz(ls,'SALES_DATE',1);
    CreateBatch(bl, ls, 'SALES_ID', ftString);
    SetTicket;

    bl.First;
    while not bl.Eof do
    begin
      ProTitle := '<销售单>...共'+inttostr(bl.RecordCount)+'笔，当前第'+inttostr(bl.RecNo)+'笔';
      SetProPosition(100 + Trunc(100 / bl.RecordCount * bl.RecNo));

      rs_h.Close;
      rs_d.Close;
      cs_h.Close;
      cs_d.Close;

      Params.ParamByName('KEY_FIELDS').AsString := 'TENANT_ID;SALES_ID';
      Params.ParamByName('IDS').AsString := bl.FieldbyName('IDS').AsString;

      if orderFields = '' then orderFields := GetTableFields('SAL_SALESORDER');
      if dataFields = ''  then dataFields  := GetTableFields('SAL_SALESDATA');

      dataFactory.MoveToRemote;
      try
        dataFactory.BeginBatch;
        try
          Params.ParamByName('TABLE_FIELDS').AsString := orderFields;
          dataFactory.AddBatch(rs_h,'TSyncSalesOrderV60',Params);
          Params.ParamByName('TABLE_FIELDS').AsString := dataFields;
          dataFactory.AddBatch(rs_d,'TSyncSalesDataV60',Params);
          dataFactory.OpenBatch;
        except
          dataFactory.CancelBatch;
          Raise;
        end;
      finally
        dataFactory.MoveToDefault;
      end;

      cs_h.SyncDelta := rs_h.SyncDelta;
      cs_d.SyncDelta := rs_d.SyncDelta;

      dataFactory.MoveToSqlite;
      try
        dataFactory.BeginBatch;
        try
          dataFactory.AddBatch(cs_h,'TSyncSalesOrderV60',Params);
          dataFactory.AddBatch(cs_d,'TSyncSalesDataV60',Params);
          dataFactory.CommitBatch;
        except
          dataFactory.CancelBatch;
          Raise;
        end;
      finally
        dataFactory.MoveToDefault;
      end;

      rs_h.Last;
      if StrtoInt64(rs_h.FieldByName('TIME_STAMP').AsString) > MaxTimeStamp then
         MaxTimeStamp := StrtoInt64(rs_h.FieldByName('TIME_STAMP').AsString);

      bl.Next;
    end;

    if not ls.IsEmpty then SetSynTimeStamp(token.tenantId,tbName,MaxTimeStamp,token.shopId);

    LogFile.AddLogFile(0,'批量下载<'+tbName+'>保存时长:'+inttostr(GetTicket));
  finally
    Params.Free;
    bl.Free;
    ls.Free;
    rs_h.Free;
    rs_d.Free;
    cs_h.Free;
    cs_d.Free;
  end;
end;

procedure TSyncFactory.DownloadStockOrder(BeginDate: string);
var
  Params:TftParamList;
  bl,ls,rs_h,rs_d,cs_h,cs_d:TZQuery;
  MaxTimeStamp,LastTimeStamp:int64;
  tbName,orderFields,dataFields:string;
begin
  if dllGlobal.GetSFVersion <> '.LCL' then Exit;

  tbName := 'STK_STOCKORDER';
  LastTimeStamp := GetSynTimeStamp(token.tenantId,tbName,token.shopId);
  MaxTimeStamp := LastTimeStamp;

  LogFile.AddLogFile(0,'开始<'+tbName+'>批量下载 上次时间:'+inttostr(LastTimeStamp));

  bl := TZQuery.Create(nil);
  ls := TZQuery.Create(nil);
  rs_h := TZQuery.Create(nil);
  rs_d := TZQuery.Create(nil);
  cs_h := TZQuery.Create(nil);
  cs_d := TZQuery.Create(nil);
  Params := TftParamList.Create(nil);
  try
    Params.ParamByName('TENANT_ID').AsInteger := strtoint(token.tenantId);
    Params.ParamByName('SHOP_ID').AsString := token.shopId;
    Params.ParamByName('TABLE_NAME').AsString := tbName;
    Params.ParamByName('TIME_STAMP').Value := LastTimeStamp;
    Params.ParamByName('KEY_FLAG').AsInteger := 0;
    Params.ParamByName('TIME_STAMP_NOCHG').AsInteger := 0;
    Params.ParamByName('SYN_COMM').AsBoolean := false;

    if BeginDate <> '' then
       begin
         Params.ParamByName('BEGIN_DATE').AsInteger := strtoint(BeginDate);
         Params.ParamByName('SYS_BEGIN_DATE').AsInteger := CloseAccDate;
       end;

    if BeginDate = '' then
       Params.ParamByName('UPDATE_STORAGE').AsBoolean := true
    else
       Params.ParamByName('UPDATE_STORAGE').AsBoolean := false;

    SetTicket;

    dataFactory.MoveToRemote;
    try
      dataFactory.Open(ls,'TSyncStockOrderListV60',Params);
    finally
      dataFactory.MoveToDefault;
    end;

    LogFile.AddLogFile(0,'批量下载<'+tbName+'>打开时长:'+inttostr(GetTicket)+'  记录数:'+inttostr(ls.RecordCount));
    BeforeSyncBiz(ls,'STOCK_DATE',1);
    CreateBatch(bl, ls, 'STOCK_ID', ftString);
    SetTicket;

    bl.First;
    while not bl.Eof do
    begin
      ProTitle := '<进货单>...共'+inttostr(bl.RecordCount)+'笔，当前第'+inttostr(bl.RecNo)+'笔';
      SetProPosition(Trunc(100 / bl.RecordCount * bl.RecNo));

      rs_h.Close;
      rs_d.Close;
      cs_h.Close;
      cs_d.Close;

      Params.ParamByName('KEY_FIELDS').AsString := 'TENANT_ID;STOCK_ID';
      Params.ParamByName('IDS').AsString := bl.FieldbyName('IDS').AsString;

      if orderFields = '' then orderFields := GetTableFields('STK_STOCKORDER');
      if dataFields = ''  then dataFields  := GetTableFields('STK_STOCKDATA','a');

      dataFactory.MoveToRemote;
      try
        dataFactory.BeginBatch;
        try
          Params.ParamByName('TABLE_FIELDS').AsString := orderFields;
          dataFactory.AddBatch(rs_h,'TSyncStockOrderV60',Params);
          Params.ParamByName('TABLE_FIELDS').AsString := dataFields;
          dataFactory.AddBatch(rs_d,'TSyncStockDataV60',Params);
          dataFactory.OpenBatch;
        except
          dataFactory.CancelBatch;
          Raise;
        end;
      finally
        dataFactory.MoveToDefault;
      end;

      cs_h.SyncDelta := rs_h.SyncDelta;
      cs_d.SyncDelta := rs_d.SyncDelta;

      dataFactory.MoveToSqlite;
      try
        dataFactory.BeginBatch;
        try
          dataFactory.AddBatch(cs_h,'TSyncStockOrderV60',Params);
          dataFactory.AddBatch(cs_d,'TSyncStockDataV60',Params);
          dataFactory.CommitBatch;
        except
          dataFactory.CancelBatch;
          Raise;
        end;
      finally
        dataFactory.MoveToDefault;
      end;

      rs_h.Last;
      if StrtoInt64(rs_h.FieldByName('TIME_STAMP').AsString) > MaxTimeStamp then
         MaxTimeStamp := StrtoInt64(rs_h.FieldByName('TIME_STAMP').AsString);

      bl.Next;
    end;

    if not ls.IsEmpty then SetSynTimeStamp(token.tenantId,tbName,MaxTimeStamp,token.shopId);

    LogFile.AddLogFile(0,'批量下载<'+tbName+'>保存时长:'+inttostr(GetTicket));
  finally
    Params.Free;
    bl.Free;
    ls.Free;
    rs_h.Free;
    rs_d.Free;
    cs_h.Free;
    cs_d.Free;
  end;
end;

procedure TSyncFactory.DownloadChangeOrder(BeginDate: string);
var
  Params:TftParamList;
  bl,ls,rs_h,rs_d,cs_h,cs_d:TZQuery;
  MaxTimeStamp,LastTimeStamp:int64;
  tbName,orderFields,dataFields:string;
begin
  if dllGlobal.GetSFVersion <> '.LCL' then Exit;

  tbName := 'STO_CHANGEORDER';
  LastTimeStamp := GetSynTimeStamp(token.tenantId,tbName,token.shopId);
  MaxTimeStamp := LastTimeStamp;

  LogFile.AddLogFile(0,'开始<'+tbName+'>批量下载 上次时间:'+inttostr(LastTimeStamp));

  bl := TZQuery.Create(nil);
  ls := TZQuery.Create(nil);
  rs_h := TZQuery.Create(nil);
  rs_d := TZQuery.Create(nil);
  cs_h := TZQuery.Create(nil);
  cs_d := TZQuery.Create(nil);
  Params := TftParamList.Create(nil);
  try
    Params.ParamByName('TENANT_ID').AsInteger := strtoint(token.tenantId);
    Params.ParamByName('SHOP_ID').AsString := token.shopId;
    Params.ParamByName('TABLE_NAME').AsString := tbName;
    Params.ParamByName('TIME_STAMP').Value := LastTimeStamp;
    Params.ParamByName('KEY_FLAG').AsInteger := 0;
    Params.ParamByName('TIME_STAMP_NOCHG').AsInteger := 0;
    Params.ParamByName('SYN_COMM').AsBoolean := false;

    if BeginDate <> '' then
       begin
         Params.ParamByName('BEGIN_DATE').AsInteger := strtoint(BeginDate);
         Params.ParamByName('SYS_BEGIN_DATE').AsInteger := CloseAccDate;
       end;

    if BeginDate = '' then
       Params.ParamByName('UPDATE_STORAGE').AsBoolean := true
    else
       Params.ParamByName('UPDATE_STORAGE').AsBoolean := false;

    SetTicket;

    dataFactory.MoveToRemote;
    try
      dataFactory.Open(ls,'TSyncChangeOrderListV60',Params);
    finally
      dataFactory.MoveToDefault;
    end;

    LogFile.AddLogFile(0,'批量下载<'+tbName+'>打开时长:'+inttostr(GetTicket)+'  记录数:'+inttostr(ls.RecordCount));
    BeforeSyncBiz(ls,'CHANGE_DATE',1);
    CreateBatch(bl, ls, 'CHANGE_ID', ftString);
    SetTicket;

    bl.First;
    while not bl.Eof do
    begin
      ProTitle := '<损益单>...共'+inttostr(bl.RecordCount)+'笔，当前第'+inttostr(bl.RecNo)+'笔';
      SetProPosition(200 + Trunc(100 / bl.RecordCount * bl.RecNo));

      rs_h.Close;
      rs_d.Close;
      cs_h.Close;
      cs_d.Close;

      Params.ParamByName('KEY_FIELDS').AsString := 'TENANT_ID;CHANGE_ID';
      Params.ParamByName('IDS').AsString := bl.FieldbyName('IDS').AsString;

      if orderFields = '' then orderFields := GetTableFields('STO_CHANGEORDER');
      if dataFields = ''  then dataFields  := GetTableFields('STO_CHANGEDATA','a');

      dataFactory.MoveToRemote;
      try
        dataFactory.BeginBatch;
        try
          Params.ParamByName('TABLE_FIELDS').AsString := orderFields;
          dataFactory.AddBatch(rs_h,'TSyncChangeOrderV60',Params);
          Params.ParamByName('TABLE_FIELDS').AsString := dataFields;
          dataFactory.AddBatch(rs_d,'TSyncChangeDataV60',Params);
          dataFactory.OpenBatch;
        except
          dataFactory.CancelBatch;
          Raise;
        end;
      finally
        dataFactory.MoveToDefault;
      end;

      cs_h.SyncDelta := rs_h.SyncDelta;
      cs_d.SyncDelta := rs_d.SyncDelta;

      dataFactory.MoveToSqlite;
      try
        dataFactory.BeginBatch;
        try
          dataFactory.AddBatch(cs_h,'TSyncChangeOrderV60',Params);
          dataFactory.AddBatch(cs_d,'TSyncChangeDataV60',Params);
          dataFactory.CommitBatch;
        except
          dataFactory.CancelBatch;
          Raise;
        end;
      finally
        dataFactory.MoveToDefault;
      end;

      rs_h.Last;
      if StrtoInt64(rs_h.FieldByName('TIME_STAMP').AsString) > MaxTimeStamp then
         MaxTimeStamp := StrtoInt64(rs_h.FieldByName('TIME_STAMP').AsString);

      bl.Next;
    end;

    if not ls.IsEmpty then SetSynTimeStamp(token.tenantId,tbName,MaxTimeStamp,token.shopId);

    LogFile.AddLogFile(0,'批量下载<'+tbName+'>保存时长:'+inttostr(GetTicket));
  finally
    Params.Free;
    bl.Free;
    ls.Free;
    rs_h.Free;
    rs_d.Free;
    cs_h.Free;
    cs_d.Free;
  end;
end;

procedure TSyncFactory.DownloadRckDays(BeginDate: string);
var
  Params:TftParamList;
  bl,ls,rs_h,rs_d,cs_h,cs_d:TZQuery;
  MaxTimeStamp,LastTimeStamp:int64;
  updateVersion,insertVersion:string;
  tbName,orderFields,dataFields:string;
begin
  if dllGlobal.GetSFVersion <> '.LCL' then Exit;

  tbName := 'RCK_DAYS_CLOSE';
  LastTimeStamp := GetSynTimeStamp(token.tenantId,tbName,token.shopId);
  MaxTimeStamp := LastTimeStamp; 

  LogFile.AddLogFile(0,'开始<'+tbName+'>批量下载 上次时间:'+inttostr(LastTimeStamp));

  bl := TZQuery.Create(nil);
  ls := TZQuery.Create(nil);
  rs_h := TZQuery.Create(nil);
  rs_d := TZQuery.Create(nil);
  cs_h := TZQuery.Create(nil);
  cs_d := TZQuery.Create(nil);
  Params := TftParamList.Create(nil);
  try
    Params.ParamByName('TENANT_ID').AsInteger := strtoint(token.tenantId);
    Params.ParamByName('SHOP_ID').AsString := token.shopId;
    Params.ParamByName('TABLE_NAME').AsString := tbName;
    Params.ParamByName('TIME_STAMP').Value := LastTimeStamp;
    Params.ParamByName('KEY_FLAG').AsInteger := 0;
    Params.ParamByName('TIME_STAMP_NOCHG').AsInteger := 0;
    Params.ParamByName('SYN_COMM').AsBoolean := false;

    if BeginDate <> '' then
       begin
         Params.ParamByName('BEGIN_DATE').AsInteger := strtoint(BeginDate);
         Params.ParamByName('SYS_BEGIN_DATE').AsInteger := CloseAccDate;
       end;

    SetTicket;

    dataFactory.MoveToRemote;
    try
      dataFactory.Open(ls,'TSyncRckDaysCloseListV60',Params);
    finally
      dataFactory.MoveToDefault;
    end;

    LogFile.AddLogFile(0,'批量下载<'+tbName+'>打开时长:'+inttostr(GetTicket)+'  记录数:'+inttostr(ls.RecordCount));
    CreateBatch(bl, ls, 'CREA_DATE', ftInteger);
    SetTicket;

    bl.First;
    while not bl.Eof do
    begin
      ProTitle := '<日台账>...共'+inttostr(bl.RecordCount)+'笔，当前第'+inttostr(bl.RecNo)+'笔';
      SetProPosition(300 + Trunc(100 / bl.RecordCount * bl.RecNo));

      rs_h.Close;
      rs_d.Close;

      Params.ParamByName('IDS').AsString := bl.FieldbyName('IDS').AsString;

      if orderFields = '' then orderFields := GetTableFields('RCK_DAYS_CLOSE');
      if dataFields = ''  then dataFields  := GetTableFields('RCK_STOCKS_DATA');

      dataFactory.MoveToRemote;
      try
        dataFactory.BeginBatch;
        try
          Params.ParamByName('TABLE_FIELDS').AsString := orderFields;
          dataFactory.AddBatch(rs_h,'TSyncRckDaysCloseV60',Params);
          Params.ParamByName('TABLE_FIELDS').AsString := dataFields;
          dataFactory.AddBatch(rs_d,'TSyncRckStocksDataV60',Params);
          dataFactory.OpenBatch;
        except
          dataFactory.CancelBatch;
          Raise;
        end;
      finally
        dataFactory.MoveToDefault;
      end;

      cs_h.SyncDelta := rs_h.SyncDelta;
      cs_d.SyncDelta := rs_d.SyncDelta;

      dataFactory.MoveToSqlite;
      try
        dataFactory.BeginBatch;
        try
          Params.ParamByName('KEY_FIELDS').AsString := 'TENANT_ID;SHOP_ID;CREA_DATE';
          dataFactory.AddBatch(cs_h,'TSyncRckDaysCloseV60',Params);
          Params.ParamByName('KEY_FIELDS').AsString := 'TENANT_ID;SHOP_ID;BILL_DATE';
          dataFactory.AddBatch(cs_d,'TSyncRckStocksDataV60',Params);
          dataFactory.CommitBatch;
        except
          dataFactory.CancelBatch;
          Raise;
        end;
      finally
        dataFactory.MoveToDefault;
      end;

      rs_h.Last;
      if StrtoInt64(rs_h.FieldByName('TIME_STAMP').AsString) > MaxTimeStamp then
         MaxTimeStamp := StrtoInt64(rs_h.FieldByName('TIME_STAMP').AsString);

      bl.Next;
    end;

    if not ls.IsEmpty then SetSynTimeStamp(token.tenantId,tbName,MaxTimeStamp,token.shopId);

    LogFile.AddLogFile(0,'批量下载<'+tbName+'>保存时长:'+inttostr(GetTicket));
  finally
    Params.Free;
    bl.Free;
    ls.Free;
    rs_h.Free;
    rs_d.Free;
    cs_h.Free;
    cs_d.Free;
  end;
end;

initialization
  SyncFactory := TSyncFactory.Create;
finalization
  if Assigned(SyncFactory) then FreeAndNil(SyncFactory);
end.
