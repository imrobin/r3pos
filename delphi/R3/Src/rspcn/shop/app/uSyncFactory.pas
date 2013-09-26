unit uSyncFactory;

interface

uses
  Windows, Messages, Forms, SysUtils, Classes, ZDataSet, ZdbFactory, ZBase,
  ObjCommon, ZLogFile, Dialogs, DB, uFnUtil, math, Registry, Nb30, WinSock;

const
  MSC_SET_MAX=WM_USER+1;
  MSC_SET_POSITION=WM_USER+2;
  MSC_SET_CAPTION=WM_USER+3;
  MSC_SET_CLOSE=WM_USER+4;

  MAX_HOSTNAME_LEN = 128;
  MAX_DOMAIN_NAME_LEN = 128;
  MAX_SCOPE_ID_LEN = 256;
  MAX_ADAPTER_NAME_LENGTH = 256;
  MAX_ADAPTER_DESCRIPTION_LENGTH = 128;
  MAX_ADAPTER_ADDRESS_LENGTH = 8;

type
  TIPAddressString = array[0..4 * 4 - 1] of Char;
  PIPAddrString = ^TIPAddrString;
  TIPAddrString = record
    Next: PIPAddrString;
    IPAddress: TIPAddressString;
    IPMask: TIPAddressString;
    Context: Integer;
  end;

  PIPAdapterInfo = ^TIPAdapterInfo;
  TIPAdapterInfo = record
    Next: PIPAdapterInfo;
    ComboIndex: Integer;
    AdapterName: array[0..MAX_ADAPTER_NAME_LENGTH + 3] of Char;
    Description: array[0..MAX_ADAPTER_DESCRIPTION_LENGTH + 3] of Char;
    AddressLength: Integer;
    Address: array[1..MAX_ADAPTER_ADDRESS_LENGTH] of Byte;
    Index: Integer;
    _Type: Integer;
    DHCPEnabled: Integer;
    CurrentIPAddress: PIPAddrString;
    IPAddressList: TIPAddrString;
    GatewayList: TIPAddrString;
    DHCPServer: TIPAddrString;
    HaveWINS: Bool;
    PrimaryWINSServer: TIPAddrString;
    SecondaryWINSServer: TIPAddrString;
    LeaseObtained: Integer;
    LeaseExpires: Integer;
  end;

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
  end;

  TSyncFactory=class
  protected
    _Start:Int64;
    LoginStart:Int64;
    FList:TList;
    FStoped: boolean;
    FProHandle:Hwnd;
    FProTitle:string;
    FSyncTimeStamp: int64;
    FinishIndex:integer;
    procedure SetTicket;
    function  GetTicket:Int64;
    procedure ClearSyncList;
    procedure ReadTimeStamp;
    function  GetFactoryName(node:PSynTableInfo):string;
    function  GetTableFields(tbName:string;alias:string=''):string;

    procedure SetSyncTimeStamp(const Value: int64);
    procedure SetStoped(const Value: boolean);
    procedure SetProHandle(const Value: Hwnd);
    procedure SetProTitle(const Value: string);
    procedure SetProCaption;
    procedure SetProMax(max:integer);
    procedure SetProPosition(position:integer);
  private
    ThreadLock:TRTLCriticalSection;
    CloseAccDate:integer;
    LoginSyncDate:integer;
    LastLoginSyncDate,LastLogoutSyncDate:integer;
    FLoginId: string;
    Ftimered: boolean;
    FtimerTerminted: boolean;
    function  CheckRemoteData(AppHandle:HWnd):integer;//0:未还原 1:文件还原 2:服务端还原
    procedure BackUpDBFile;
    procedure InitTenant;
    // 0:默认同步 1:注册同步 2:正常同步 3:恢复同步
    procedure InitSyncRelationList(SyncType:integer=0);
    procedure InitSyncBasicList(SyncType:integer=0);
    procedure SyncList;

    procedure SyncBizData(SyncFlag:integer=0;BeginDate:string='');
    procedure BeforeSyncBiz(DataSet:TZQuery;FieldName:string;SyncFlag:integer);
    procedure SyncStockOrder(SyncFlag:integer=0;BeginDate:string='');// 0:上传 1:下载
    procedure SyncSalesOrder(SyncFlag:integer=0;BeginDate:string='');
    procedure SyncChangeOrder(SyncFlag:integer=0;BeginDate:string='');
    procedure SyncRckDays(SyncFlag:integer=0;BeginDate:string='');
    procedure SyncStorage;
    procedure GetCloseAccDate;
    function  CheckNeedLoginSync:boolean;
    function  CheckNeedLoginSyncBizData:boolean;
    // 检测数据备份
    function  CheckBackUpDBFile(PHWnd:THandle):boolean;
    // 登陆日志
    procedure AddLoginLog;
    procedure AddLogoutLog;
    procedure SetLoginId(const Value: string);
    procedure Settimered(const Value: boolean);
    procedure SettimerTerminted(const Value: boolean);
    function Gettimered: boolean;
  public
    constructor Create;
    destructor  Destroy;override;
    // 单表同步
    procedure SyncSingleTable(n:PSynTableInfo;timeStampNoChg:integer=1;SaveCtrl:boolean=true);
    // 0:默认同步 1:注册同步 2:正常同步 3:恢复同步
    procedure SyncBasic(SyncType:integer=0);
    // 检测文件是否是有效的数据文件
    function  CheckValidDBFile(src:string):boolean;
    // 登录时同步
    procedure LoginSync(PHWnd:THandle);
    // 退出时同步
    procedure LogoutSync(PHWnd:THandle);
    // 数据恢复时同步
    procedure RecoverySync(PHWnd:THandle;BeginDate:string='');
    // 注册时同步
    procedure RegisterSync(PHWnd:THandle);
    // 灾难恢复时关账
    procedure RecoveryClose(CloseDate:string);
    // 数据库锁定
    function  DBLocked:boolean;
    function  SyncLockCheck(PHWnd:THandle):boolean;
    function  SyncLockDb:boolean;
    //同步心跳
    procedure TimerSync;
    procedure TimerSyncSales;
    procedure TimerSyncStock;
    procedure TimerSyncChange;
    procedure TimerSyncStroage;

    function  GetSynTimeStamp(tenantId,tbName:string;SHOP_ID:string='#'):int64;
    procedure SetSynTimeStamp(tenantId,tbName:string;TimeStamp:int64;SHOP_ID:string='#');
    property  SyncTimeStamp:int64 read FSyncTimeStamp write SetSyncTimeStamp;
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
     ufrmStocksCalc,ufrmSelectRecType,ufrmUnLockGuide,uCommand;

function GetAdaptersInfo(AI: PIPAdapterInfo; var BufLen: Integer): Integer; stdcall; external 'iphlpapi.dll' Name 'GetAdaptersInfo';

function GetMacAddrInfo:string;
var
  AI, Work: PIPAdapterInfo;
  Size: Integer;
  Res: Integer;
  I: Integer;
  function MACToStr(ByteArr: PByte; Len: Integer): string;
  begin
    result := '';
    while (Len > 0) do
    begin
      result := result + IntToHex(ByteArr^, 2);
      ByteArr := Pointer(Integer(ByteArr) + SizeOf(Byte));
      Dec(Len);
    end;
  end;
begin
  Size := 5120;
  GetMem(AI, Size);
  Res := GetAdaptersInfo(AI, Size);
  if (Res <> ERROR_SUCCESS) then Exit;

  Work := AI;
  I := 1;
  repeat
    if result <> '' then result := result + ',';
    result := result + MACToStr(@Work^.Address, Work^.AddressLength);
    Inc(I);
    Work := Work^.Next;
  until (Work = nil);

  FreeMem(AI);
end;

function GetSystemInfo: string;
var Reg:TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey:=HKEY_LOCAL_MACHINE;
    if Reg.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion',false) then
    begin
      result:=Reg.ReadString('ProductName');
      Reg.CloseKey;
    end;
  finally
    Reg.Free;
  end;
end;

function GetComputerName: string;
var
  s: array [0..MAX_COMPUTERNAME_LENGTH] of Char;
  w:dword;
begin
  w := MAX_COMPUTERNAME_LENGTH+1;
  Windows.GetComputerName(s,w);
  result := string(s);
end;

function GetMacAddr(idx:integer=0): string;
var
  NCB: TNCB;
  ADAPTER: TADAPTERSTATUS;
  LANAENUM: TLANAENUM;
  intIdx: Integer;
  cRC: Char;
  strTemp: string;
begin
  result := '';
  ZeroMemory(@NCB, SizeOf(NCB));
  NCB.ncb_command := Chr(NCBENUM);
  cRC := NetBios(@NCB);
  NCB.ncb_buffer := @LANAENUM;
  NCB.ncb_length := SizeOf(LANAENUM);
  cRC := NetBios(@NCB);
  if Ord(cRC) <> 0 then Exit;
  ZeroMemory(@NCB, SizeOf(NCB));
  NCB.ncb_command := Chr(NCBRESET);
  NCB.ncb_lana_num := LANAENUM.lana[idx];
  cRC := NetBios(@NCB);
  if Ord(cRC) <> 0 then Exit;
  ZeroMemory(@NCB, SizeOf(NCB));
  NCB.ncb_command := Chr(NCBASTAT);
  NCB.ncb_lana_num := LANAENUM.lana[idx];
  StrPCopy(NCB.ncb_callname, '*');
  NCB.ncb_buffer := @ADAPTER;
  NCB.ncb_length := SizeOf(ADAPTER);
  cRC := NetBios(@NCB);
  strTemp := '';
  for intIdx := 0 to 5 do
      strTemp := strTemp + InttoHex(Integer(ADAPTER.adapter_address[intIdx]), 2);
  result := strTemp;
end;

function GetIpAddr:string;
var
  WSAData: TWSAData;
  HostEnt: PHostEnt;
  s: string;
  size: Cardinal;
begin
  result := '';
  s := GetComputerName;
  WSAStartup(2, WSAData);
  HostEnt := GetHostByName(PChar(s));
  if HostEnt <> nil then
  begin
    with HostEnt^ do result := Format('%d.%d.%d.%d', [Byte(h_addr^[0]), Byte(h_addr^[1]), Byte(h_addr^[2]), Byte(h_addr^[3])]);
  end;
  WSACleanup;
end;

constructor TSyncFactory.Create;
begin
  InitializeCriticalSection(ThreadLock);
  ftimered := false;
  timerTerminted := false;
  CloseAccDate := -1;
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

procedure TSyncFactory.SetSyncTimeStamp(const Value: int64);
begin
  FSyncTimeStamp := Value;
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
  dataFactory.MoveToRemote;
  try
    r := dataFactory.remote.ExecSQL('update SYS_SYNC_CTRL set TIME_STAMP='+inttostr(TimeStamp)+' where TENANT_ID='+token.tenantId+' and SHOP_ID='''+SHOP_ID+''' and TABLE_NAME='''+tbName+''' and TIME_STAMP<'+inttostr(TimeStamp));
    if r=0 then
       begin
         rs.SQL.Text := 'select 1 from SYS_SYNC_CTRL where TENANT_ID=:TENANT_ID and SHOP_ID=:SHOP_ID and TABLE_NAME=:TABLE_NAME';
         rs.Params.ParamByName('TENANT_ID').AsInteger := strtoint(token.tenantId);
         rs.Params.ParamByName('SHOP_ID').AsString := SHOP_ID;
         rs.Params.ParamByName('TABLE_NAME').AsString := tbName;
         dataFactory.Open(rs);
         if rs.IsEmpty then
            dataFactory.remote.ExecSQL('insert into SYS_SYNC_CTRL(TENANT_ID,SHOP_ID,TABLE_NAME,TIME_STAMP) values ('+token.tenantId+','''+SHOP_ID+''','''+tbName+''','+inttostr(TimeStamp)+')');
       end;
  finally
    rs.Free;
    dataFactory.MoveToDefault;
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
  var ss:TZQuery;
  begin
    ss := TZQuery.Create(nil);
    try
      ss.Close;
      if not rs_l.IsEmpty then
         begin
           SetTicket;
           ss.SyncDelta := rs_l.SyncDelta;
           if not ss.IsEmpty then
              begin
                dataFactory.MoveToRemote;
                try
                  dataFactory.UpdateBatch(ss,ZClassName,Params);
                finally
                  dataFactory.MoveToDefault;
                end;
              end;

           rs_l.Delete;
           dataFactory.MoveToSqlite;
           try
             dataFactory.UpdateBatch(rs_l,ZClassName,Params);
           finally
             dataFactory.MoveToDefault;
           end;

           LogFile.AddLogFile(0,'上传<'+n^.tbName+'><'+n^.syncTenantId+' '+n^.syncShopId+'>保存时长:'+inttostr(GetTicket));
         end;
    finally
      ss.Free;
    end;
  end;

  procedure DownloadSingleTable(rs_r:TZQuery;ZClassName:string;n:PSynTableInfo;Params:TftParamList);
  var ss:TZQuery;
  begin
    ss := TZQuery.Create(nil);
    try
      ss.Close;
      if not rs_r.IsEmpty then
         begin
           SetTicket;
           ss.SyncDelta := rs_r.SyncDelta;
           if not ss.IsEmpty then
              begin
                dataFactory.MoveToSqlite;
                try
                  dataFactory.UpdateBatch(ss,ZClassName,Params);
                finally
                  dataFactory.MoveToDefault;
                end;
              end;
           LogFile.AddLogFile(0,'下载<'+n^.tbName+'><'+n^.syncTenantId+':'+n^.syncShopId+'>保存时长:'+inttostr(GetTicket));
         end;
    finally
      ss.Free;
    end;
  end;
var
  SFVersion:string;
  rs_l,rs_r:TZQuery;
  LCLVersion:boolean;
  MaxTimeStamp:int64;
  ZClassName:string;
  openSQL:string;
  Params:TftParamList;
begin
  if (n^.isSyncUp <> '1') and (n^.isSyncDown <> '1') then Exit;

  SFVersion := dllGlobal.GetSFVersion;
  LCLVersion := (SFVersion = '.LCL');

  if trim(n^.syncTenantId) = '' then n^.syncTenantId := token.tenantId;
  if trim(n^.syncShopId) = '' then n^.syncShopId := '#';

  ZClassName := GetFactoryName(n);
  SyncTimeStamp := GetSynTimeStamp(n^.syncTenantId,n^.tbName,n^.syncShopId);
  MaxTimeStamp := SyncTimeStamp;

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
    Params.ParamByName('TIME_STAMP').Value := SyncTimeStamp;
    Params.ParamByName('LAST_TIME_STAMP').Value := SyncTimeStamp;
    Params.ParamByName('TIME_STAMP_NOCHG').AsInteger := timeStampNoChg;
    Params.ParamByName('WHERE_STR').AsString := n^.whereStr;
    if trim(n^.tableFields) <> '' then
       Params.ParamByName('TABLE_FIELDS').AsString := n^.tableFields
    else
       Params.ParamByName('TABLE_FIELDS').AsString := GetTableFields(n^.tbName);

    if n^.isSyncUp = '1' then
       begin
         LogFile.AddLogFile(0,'开始上传<'+n^.tbName+'><'+n^.syncTenantId+':'+n^.syncShopId+'>上次时间:'+inttostr(SyncTimeStamp));
         Params.ParamByName('SYN_COMM').AsBoolean := true;
         SetTicket;
         dataFactory.MoveToSqlite;
         try
           if (trim(n^.selectSQL) = '') and (trim(n^.selectLocalSQL) = '') then
              dataFactory.Open(rs_l,ZClassName,Params)
           else
             begin
               if trim(n^.selectLocalSQL) <> '' then
                  openSQL := n^.selectLocalSQL
               else
                  openSQL := n^.selectSQL;
               rs_l.SQL.Text := openSQL;
               rs_l.Params := Params;
               dataFactory.Open(rs_l);
             end;
         finally
           dataFactory.MoveToDefault;
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
         LogFile.AddLogFile(0,'开始下载<'+n^.tbName+'><'+n^.syncTenantId+':'+n^.syncShopId+'>上次时间:'+inttostr(SyncTimeStamp));
         Params.ParamByName('SYN_COMM').AsBoolean := false;
         SetTicket;
         dataFactory.MoveToRemote;
         try
           if (trim(n^.selectSQL) = '') and (trim(n^.selectRemoteSQL) = '') then
              dataFactory.Open(rs_r,ZClassName,Params)
           else
             begin
               if trim(n^.selectRemoteSQL) <> '' then
                  openSQL := n^.selectRemoteSQL
               else
                  openSQL := n^.selectSQL;
               rs_r.SQL.Text := openSQL;
               rs_r.Params := Params;
               dataFactory.Open(rs_r);
             end;
         finally
           dataFactory.MoveToDefault;
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

    if SaveCtrl and (MaxTimeStamp > SyncTimeStamp) then
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
    0,1,2,3,4,10,20,21,22,23,29:
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
  n^.keyFields := 'RELATION_ID;RELATI_ID';
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
  var n:PSynTableInfo;
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

    new(n);
    n^.tbname := 'PUB_UNION_INFO';
    n^.keyFields := 'TENANT_ID;UNION_ID';
    n^.synFlag := 0;
    n^.keyFlag := 0;
    n^.tbtitle := '商盟档案';
    InitSyncBasicUpAndDown(n);
    FList.Add(n);

    new(n);
    n^.tbname := 'PUB_UNION_INDEX';
    n^.keyFields := 'TENANT_ID;UNION_ID;INDEX_ID';
    n^.keyFlag := 0;
    n^.synFlag := 0;
    n^.tbtitle := '商盟指标';
    InitSyncBasicUpAndDown(n);
    FList.Add(n);

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
      'where  TENANT_ID=:TENANT_ID and TIME_STAMP>:TIME_STAMP '+
      'order by TIME_STAMP asc';
    new(n);
    n^.tbname := 'PUB_BARCODE';
    n^.keyFields := 'ROWS_ID';
    n^.selectSQL := str;
    n^.synFlag := 3;
    n^.keyFlag := 0;
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
          '       and (b.TIME_STAMP>:TIME_STAMP or c.TIME_STAMP>:TIME_STAMP or s.TIME_STAMP>:TIME_STAMP) '+
          ') t order by TIME_STAMP asc';
        new(n);
        n^.tbname := 'PUB_BARCODE';
        n^.keyFields := 'ROWS_ID';
        n^.selectSQL := str;
        n^.synFlag := 3;
        n^.keyFlag := 0;
        n^.tbtitle := '条码表';
        n^.syncTenantId := cid;
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
    n^.tableFields := 'TENANT_ID,ACCOUNT_ID,SHOP_ID,ACCT_NAME,ACCT_SPELL,PAYM_ID,COMM,TIME_STAMP';
    n^.synFlag := 10;
    n^.keyFlag := 0;
    n^.tbtitle := '账户资料';
    InitSyncBasicUpAndDown(n);
    FList.Add(n);
  end;

  procedure InitList20;
  var n:PSynTableInfo;
      str_l,str_r:string;
  begin
    str_l :=
      'select  i.TENANT_ID,i.LOGIN_NAME,i.LICENSE_CODE,i.TENANT_NAME,i.TENANT_TYPE,i.SHORT_TENANT_NAME,i.TENANT_SPELL,i.LEGAL_REPR, '+
      '        i.LINKMAN,i.TELEPHONE,i.FAXES,i.HOMEPAGE,i.ADDRESS,i.QQ,i.MSN,i.POSTALCODE,i.REMARK,i.PASSWRD,i.REGION_ID,i.SRVR_ID, '+
      '        i.AUDIT_STATUS,i.PROD_ID,i.DB_ID,i.CREA_DATE,i.COMM,i.TIME_STAMP '+
      'from    CA_TENANT i '+
      'where   TENANT_ID=:TENANT_ID and TIME_STAMP>:TIME_STAMP '+
      'order by TIME_STAMP asc';

    str_r :=
      'select * from ( '+
      'select  i.TENANT_ID,i.LOGIN_NAME,i.LICENSE_CODE,i.TENANT_NAME,i.TENANT_TYPE,i.SHORT_TENANT_NAME,i.TENANT_SPELL,i.LEGAL_REPR, '+
      '        i.LINKMAN,i.TELEPHONE,i.FAXES,i.HOMEPAGE,i.ADDRESS,i.QQ,i.MSN,i.POSTALCODE,i.REMARK,i.PASSWRD,i.REGION_ID,i.SRVR_ID, '+
      '        i.AUDIT_STATUS,i.PROD_ID,i.DB_ID,i.CREA_DATE,i.COMM, '+
      '        case when i.TIME_STAMP > r.TIME_STAMP then i.TIME_STAMP else r.TIME_STAMP end TIME_STAMP '+
      'from    CA_TENANT i, '+
      '        ( '+
      '        select j.TENANT_ID as TENANT_ID,s.TIME_STAMP as TIME_STAMP from CA_RELATION j,CA_RELATIONS s where j.RELATION_ID=s.RELATION_ID and s.RELATI_ID=:TENANT_ID '+
      '        union all '+
      '        select TENANT_ID,TIME_STAMP from CA_RELATIONS s where s.RELATI_ID=:TENANT_ID '+
      '        union all '+
      '        select RELATI_ID as TENANT_ID,TIME_STAMP from CA_RELATIONS s where s.TENANT_ID=:TENANT_ID '+
      '        ) r '+
      'where   i.TENANT_ID=r.TENANT_ID and (i.TIME_STAMP>:TIME_STAMP or r.TIME_STAMP>:TIME_STAMP) '+
      'union all '+
      'select  i.TENANT_ID,i.LOGIN_NAME,i.LICENSE_CODE,i.TENANT_NAME,i.TENANT_TYPE,i.SHORT_TENANT_NAME,i.TENANT_SPELL,i.LEGAL_REPR, '+
      '        i.LINKMAN,i.TELEPHONE,i.FAXES,i.HOMEPAGE,i.ADDRESS,i.QQ,i.MSN,i.POSTALCODE,i.REMARK,i.PASSWRD,i.REGION_ID,i.SRVR_ID, '+
      '        i.AUDIT_STATUS,i.PROD_ID,i.DB_ID,i.CREA_DATE,i.COMM,i.TIME_STAMP '+
      'from    CA_TENANT i '+
      'where   TENANT_ID=:TENANT_ID and TIME_STAMP>:TIME_STAMP '+
      ') t order by TIME_STAMP asc';
    new(n);
    n^.tbname := 'CA_TENANT';
    n^.keyFields := 'TENANT_ID';
    n^.selectLocalSQL := str_l;
    n^.selectRemoteSQL := str_r;
    n^.synFlag := 20;
    n^.keyFlag := 0;
    n^.tbtitle := '企业资料';
    if SyncType = 1 then
       begin
         n^.isSyncDown := '1';
       end
    else if SyncType = 2 then
       begin
         n^.isSyncUp := '1';
         n^.isSyncDown := '1';
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
  RightsFactory.InitialRights;
end;

procedure TSyncFactory.LoginSync(PHWnd: THandle);
var
  flag:integer;
  firstLogin:boolean;
begin
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
        if not token.online then Exit;
        CommandPush.ExecuteCommand;
        hWnd := PHWnd;
        ShowForm;
        BringToFront;
        Update;
        Application.ProcessMessages;
        if token.tenantId = '' then
           begin
             firstLogin := true;
             TfrmSysDefine.AutoRegister;
             if token.tenantId = '' then Exit;
             flag := SyncFactory.CheckRemoteData(PHWnd);
             if flag = 0 then // 没有还原
                begin
                  RspSyncFactory.SyncAll;
                  RspSyncFactory.copyGoodsSort;
                  SyncFactory.InitTenant;
                  SyncFactory.SyncBasic(1);
                  TfrmSysDefine.SaveRegister;
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
             CheckBackUpDBFile(PHWnd);
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
                       SyncFactory.SyncBizData;
                       SyncFactory.SetSynTimeStamp(token.tenantId,'LOGOUT_SYNC',LastLoginSyncDate,'#');
                     end;
                end;
           end;
        SyncFactory.LoginSyncDate := token.lDate;
        SyncFactory.SetSynTimeStamp(token.tenantId,'LOGIN_SYNC',token.lDate,'#');
      finally
        if token.online then dataFactory.remote.DBLock(false);
        Free;
      end;
    end;
  finally
    timered := false;
  end;
end;

procedure TSyncFactory.LogoutSync(PHWnd: THandle);
begin
  timered := true;
  try
    if dllApplication.mode = 'demo' then Exit;
    if token.tenantId = '' then Exit;
    with TfrmSyncData.Create(nil) do
    begin
      try
        if token.online then dataFactory.remote.DBLock(true);
        AddLogoutLog;
        if not token.online then Exit;
        hWnd := PHWnd;
        ShowForm;
        BringToFront;
        Update;
        if not SyncFactory.SyncLockCheck(PHWnd) then Exit;
        SyncFactory.SyncBasic(2);
        if dllGlobal.GetSFVersion = '.LCL' then
           TfrmStocksCalc.Calc(Application.MainForm,now());
        SyncFactory.SyncBizData;
        SyncFactory.SetSynTimeStamp(token.tenantId,'LOGOUT_SYNC',token.lDate,'#');
        if RtcSyncFactory.GetToken then
           begin
             RtcSyncFactory.RtcLogout;
             RtcSyncFactory.SyncRtcData;
           end;
      finally
        if token.online then dataFactory.remote.DBLock(false);
        Free;
      end;
    end;
  finally
    timered := false;
  end;
end;

procedure TSyncFactory.RecoverySync(PHWnd:THandle;BeginDate:string='');
begin
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
        if token.online then dataFactory.remote.DBLock(false);
        Free;
      end;
    end;
  finally
    timered := false;
  end;
end;

procedure TSyncFactory.RegisterSync(PHWnd: THandle);
begin
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
        if token.online then dataFactory.remote.DBLock(false);
        Free;
      end;
    end;
  finally
    timered := false;
  end;
end;

procedure TSyncFactory.SyncStockOrder(SyncFlag:integer=0;BeginDate:string='');
var
  MaxTimeStamp:int64;
  Params:TftParamList;
  ls,rs_h,rs_d,cs_h,cs_d:TZQuery;
  tbName,orderFields,dataFields:string;
begin
  if (SyncFlag <> 0) and (dllGlobal.GetSFVersion <> '.LCL') then Exit;

  tbName := 'STK_STOCKORDER';
  SyncTimeStamp := GetSynTimeStamp(token.tenantId,tbName,token.shopId);
  MaxTimeStamp := SyncTimeStamp;

  LogFile.AddLogFile(0,'开始<'+tbName+'>上次时间:'+inttostr(SyncTimeStamp));

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
    Params.ParamByName('TIME_STAMP').Value := SyncTimeStamp;
    Params.ParamByName('KEY_FLAG').AsInteger := 0;
    Params.ParamByName('TIME_STAMP_NOCHG').AsInteger := 0;

    if SyncFlag = 0 then
       Params.ParamByName('SYN_COMM').AsBoolean := true
    else
       Params.ParamByName('SYN_COMM').AsBoolean := false;

    if (SyncFlag <> 0) and (BeginDate <> '') then
       Params.ParamByName('BEGIN_DATE').AsInteger := strtoint(BeginDate);

    SetTicket;
    if SyncFlag = 0 then
       dataFactory.MoveToSqlite
    else
       dataFactory.MoveToRemote;
    try
      dataFactory.Open(ls,'TSyncStockOrderListV60',Params);
    finally
      dataFactory.MoveToDefault;
    end;
    LogFile.AddLogFile(0,'上传<'+tbName+'>打开时长:'+inttostr(GetTicket)+'  记录数:'+inttostr(ls.RecordCount));
    BeforeSyncBiz(ls,'STOCK_DATE',SyncFlag);
    SetTicket;
    ls.First;
    while not ls.Eof do
    begin
      ProTitle := '<进货单>...共'+inttostr(ls.RecordCount)+'笔，当前第'+inttostr(ls.RecNo)+'笔';
      SetProPosition(100 div ls.RecordCount * ls.RecNo);

      // 小于关账日期的单据不下载
      if (SyncFlag <> 0) and (CloseAccDate > 0) and (ls.FieldByName('STOCK_DATE').AsInteger <= CloseAccDate) then
         begin
           ls.Next;
           Continue;
         end;

      rs_h.Close;
      rs_d.Close;
      cs_h.Close;
      cs_d.Close;

      Params.ParamByName('KEY_FIELDS').AsString := 'TENANT_ID;STOCK_ID';
      Params.ParamByName('STOCK_ID').AsString := ls.FieldbyName('STOCK_ID').AsString;

      if orderFields = '' then orderFields := GetTableFields('STK_STOCKORDER');
      if dataFields = ''  then dataFields  := GetTableFields('STK_STOCKDATA','a');

      if SyncFlag = 0 then
         dataFactory.MoveToSqlite
      else
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

      if SyncFlag = 0 then
         dataFactory.MoveToRemote
      else
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

      if StrtoInt64(rs_h.FieldByName('TIME_STAMP').AsString) > MaxTimeStamp then
         MaxTimeStamp := StrtoInt64(rs_h.FieldByName('TIME_STAMP').AsString);

      if SyncFlag = 0 then
      begin
        rs_h.Delete;
        dataFactory.MoveToSqlite;
        try
          dataFactory.UpdateBatch(rs_h,'TSyncStockOrderV60',Params);
        finally
          dataFactory.MoveToDefault;
        end;
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

procedure TSyncFactory.SyncSalesOrder(SyncFlag:integer=0;BeginDate:string='');
var
  MaxTimeStamp:int64;
  Params:TftParamList;
  ls,rs_h,rs_d,rs_s,cs_h,cs_d,cs_s:TZQuery;
  tbName,orderFields,dataFields,glideFields:string;
begin
  if (SyncFlag <> 0) and (dllGlobal.GetSFVersion <> '.LCL') then Exit;

  tbName := 'SAL_SALESORDER';
  SyncTimeStamp := GetSynTimeStamp(token.tenantId,tbName,token.shopId);
  MaxTimeStamp := SyncTimeStamp;

  LogFile.AddLogFile(0,'开始<'+tbName+'>上次时间:'+inttostr(SyncTimeStamp));

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
    Params.ParamByName('TIME_STAMP').Value := SyncTimeStamp;
    Params.ParamByName('KEY_FLAG').AsInteger := 0;
    Params.ParamByName('TIME_STAMP_NOCHG').AsInteger := 0;

    if SyncFlag = 0 then
       Params.ParamByName('SYN_COMM').AsBoolean := true
    else
       Params.ParamByName('SYN_COMM').AsBoolean := false;

    if (SyncFlag <> 0) and (BeginDate <> '') then
       Params.ParamByName('BEGIN_DATE').AsInteger := strtoint(BeginDate);

    SetTicket;
    if SyncFlag = 0 then
       dataFactory.MoveToSqlite
    else
       dataFactory.MoveToRemote;
    try
      dataFactory.Open(ls,'TSyncSalesOrderListV60',Params);
    finally
      dataFactory.MoveToDefault;
    end;
    LogFile.AddLogFile(0,'上传<'+tbName+'>打开时长:'+inttostr(GetTicket)+'  记录数:'+inttostr(ls.RecordCount));
    BeforeSyncBiz(ls,'SALES_DATE',SyncFlag);
    SetTicket;
    ls.First;
    while not ls.Eof do
    begin
      ProTitle := '<销售单>...共'+inttostr(ls.RecordCount)+'笔，当前第'+inttostr(ls.RecNo)+'笔';
      SetProPosition(100+(100 div ls.RecordCount * ls.RecNo));

      // 小于关账日期的单据不下载
      if (SyncFlag <> 0) and (CloseAccDate > 0) and (ls.FieldByName('SALES_DATE').AsInteger <= CloseAccDate) then
         begin
           ls.Next;
           Continue;
         end;

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

      if SyncFlag = 0 then
         dataFactory.MoveToSqlite
      else
         dataFactory.MoveToRemote;
      try
        dataFactory.BeginBatch;
        try
          Params.ParamByName('TABLE_FIELDS').AsString := orderFields;
          dataFactory.AddBatch(rs_h,'TSyncSalesOrderV60',Params);
          Params.ParamByName('TABLE_FIELDS').AsString := dataFields;
          dataFactory.AddBatch(rs_d,'TSyncSalesDataV60',Params);
          Params.ParamByName('TABLE_FIELDS').AsString := glideFields;
          dataFactory.AddBatch(rs_s,'TSyncSalesICDataV60',Params);
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
      cs_s.SyncDelta := rs_s.SyncDelta;

      if SyncFlag = 0 then
         dataFactory.MoveToRemote
      else
         dataFactory.MoveToSqlite;
      try
        dataFactory.BeginBatch;
        try
          dataFactory.AddBatch(cs_h,'TSyncSalesOrderV60',Params);
          dataFactory.AddBatch(cs_d,'TSyncSalesDataV60',Params);
          dataFactory.AddBatch(cs_s,'TSyncSalesICDataV60',Params);
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

      if SyncFlag = 0 then
      begin
        rs_h.Delete;
        dataFactory.MoveToSqlite;
        try
          dataFactory.BeginBatch;
          try
            dataFactory.AddBatch(rs_h,'TSyncSalesOrderV60',Params);
            if not rs_s.IsEmpty then
               begin
                 rs_s.Delete;
                 dataFactory.AddBatch(rs_s,'TSyncSalesICDataV60',Params);
               end;
            dataFactory.CommitBatch;
          except
            dataFactory.CancelBatch;
            Raise;
          end;
        finally
          dataFactory.MoveToDefault;
        end;
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
    rs_s.Free;
    cs_h.Free;
    cs_d.Free;
    cs_s.Free;
  end;
end;

procedure TSyncFactory.SyncChangeOrder(SyncFlag:integer=0;BeginDate:string='');
var
  MaxTimeStamp:int64;
  Params:TftParamList;
  ls,rs_h,rs_d,cs_h,cs_d:TZQuery;
  tbName,orderFields,dataFields:string;
begin
  if (SyncFlag <> 0) and (dllGlobal.GetSFVersion <> '.LCL') then Exit;

  tbName := 'STO_CHANGEORDER';
  SyncTimeStamp := GetSynTimeStamp(token.tenantId,tbName,token.shopId);
  MaxTimeStamp := SyncTimeStamp;

  LogFile.AddLogFile(0,'开始<'+tbName+'>上次时间:'+inttostr(SyncTimeStamp));

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
    Params.ParamByName('TIME_STAMP').Value := SyncTimeStamp;
    Params.ParamByName('KEY_FLAG').AsInteger := 0;
    Params.ParamByName('TIME_STAMP_NOCHG').AsInteger := 0;

    if SyncFlag = 0 then
       Params.ParamByName('SYN_COMM').AsBoolean := true
    else
       Params.ParamByName('SYN_COMM').AsBoolean := false;

    if (SyncFlag <> 0) and (BeginDate <> '') then
       Params.ParamByName('BEGIN_DATE').AsInteger := strtoint(BeginDate);

    SetTicket;
    if SyncFlag = 0 then
       dataFactory.MoveToSqlite
    else
       dataFactory.MoveToRemote;
    try
      dataFactory.Open(ls,'TSyncChangeOrderListV60',Params);
    finally
      dataFactory.MoveToDefault;
    end;
    LogFile.AddLogFile(0,'上传<'+tbName+'>打开时长:'+inttostr(GetTicket)+'  记录数:'+inttostr(ls.RecordCount));
    BeforeSyncBiz(ls,'CHANGE_DATE',SyncFlag);
    SetTicket;
    ls.First;
    while not ls.Eof do
    begin
      ProTitle := '<损益单>...共'+inttostr(ls.RecordCount)+'笔，当前第'+inttostr(ls.RecNo)+'笔';
      SetProPosition(200+(100 div ls.RecordCount * ls.RecNo));

      // 小于关账日期的单据不下载
      if (SyncFlag <> 0) and (CloseAccDate > 0) and (ls.FieldByName('CHANGE_DATE').AsInteger <= CloseAccDate) then
         begin
           ls.Next;
           Continue;
         end;

      rs_h.Close;
      rs_d.Close;
      cs_h.Close;
      cs_d.Close;

      Params.ParamByName('KEY_FIELDS').AsString := 'TENANT_ID;CHANGE_ID';
      Params.ParamByName('CHANGE_ID').AsString := ls.FieldbyName('CHANGE_ID').AsString;

      if orderFields = '' then orderFields := GetTableFields('STO_CHANGEORDER');
      if dataFields = ''  then dataFields  := GetTableFields('STO_CHANGEDATA','a');

      if SyncFlag = 0 then
         dataFactory.MoveToSqlite
      else
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

      if SyncFlag = 0 then
         dataFactory.MoveToRemote
      else
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

      if StrtoInt64(rs_h.FieldByName('TIME_STAMP').AsString) > MaxTimeStamp then
         MaxTimeStamp := StrtoInt64(rs_h.FieldByName('TIME_STAMP').AsString);

      if SyncFlag = 0 then
      begin
        rs_h.Delete;
        dataFactory.MoveToSqlite;
        try
          dataFactory.UpdateBatch(rs_h,'TSyncChangeOrderV60',Params);
        finally
          dataFactory.MoveToDefault;
        end;
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

procedure TSyncFactory.SyncRckDays(SyncFlag:integer=0;BeginDate:string='');
var
  MaxTimeStamp:int64;
  Params:TftParamList;
  ls,rs_h,rs_d,cs_h,cs_d:TZQuery;
  tbName,orderFields,dataFields:string;
begin
  if dllGlobal.GetSFVersion <> '.LCL' then Exit;

  tbName := 'RCK_DAYS_CLOSE';
  SyncTimeStamp := GetSynTimeStamp(token.tenantId,tbName,token.shopId);
  MaxTimeStamp := SyncTimeStamp; 

  LogFile.AddLogFile(0,'开始<'+tbName+'>上次时间:'+inttostr(SyncTimeStamp));

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
    Params.ParamByName('TIME_STAMP').Value := SyncTimeStamp;
    Params.ParamByName('KEY_FLAG').AsInteger := 0;
    Params.ParamByName('TIME_STAMP_NOCHG').AsInteger := 0;

    if SyncFlag = 0 then
       Params.ParamByName('SYN_COMM').AsBoolean := true
    else
       Params.ParamByName('SYN_COMM').AsBoolean := false;

    if (SyncFlag <> 0) and (BeginDate <> '') then
       Params.ParamByName('BEGIN_DATE').AsInteger := strtoint(BeginDate);

    SetTicket;
    if SyncFlag = 0 then
       dataFactory.MoveToSqlite
    else
       dataFactory.MoveToRemote;
    try
      dataFactory.Open(ls,'TSyncRckDaysCloseListV60',Params);
    finally
      dataFactory.MoveToDefault;
    end;
    LogFile.AddLogFile(0,'上传<'+tbName+'>打开时长:'+inttostr(GetTicket)+'  记录数:'+inttostr(ls.RecordCount));
    SetTicket;
    ls.First;
    while not ls.Eof do
    begin
      ProTitle := '<日台账>...共'+inttostr(ls.RecordCount)+'笔，当前第'+inttostr(ls.RecNo)+'笔';
      SetProPosition(300+(100 div ls.RecordCount * ls.RecNo));

      // 小于关账日期的数据不下载
      if (SyncFlag <> 0) and (CloseAccDate > 0) and (ls.FieldByName('CREA_DATE').AsInteger <= CloseAccDate) then
         begin
           ls.Next;
           Continue;
         end;

      rs_h.Close;
      rs_d.Close;

      Params.ParamByName('CREA_DATE').AsInteger := ls.FieldbyName('CREA_DATE').AsInteger;

      if orderFields = '' then orderFields := GetTableFields('RCK_DAYS_CLOSE');
      if dataFields = ''  then dataFields  := GetTableFields('RCK_STOCKS_DATA');

      if SyncFlag = 0 then
         dataFactory.MoveToSqlite
      else
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

      if SyncFlag = 0 then
         dataFactory.MoveToRemote
      else
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

      if StrtoInt64(rs_h.FieldByName('TIME_STAMP').AsString) > MaxTimeStamp then
         MaxTimeStamp := StrtoInt64(rs_h.FieldByName('TIME_STAMP').AsString);

      if SyncFlag = 0 then
      begin
        rs_h.Delete;
        dataFactory.MoveToSqlite;
        try
          dataFactory.UpdateBatch(rs_h,'TSyncRckDaysCloseV60',Params);
        finally
          dataFactory.MoveToDefault;
        end;
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
    SyncStockOrder(SyncFlag,BeginDate);
    SetProPosition(100);
    ProTitle := '<销售单>...';
    SyncSalesOrder(SyncFlag,BeginDate);
    SetProPosition(200);
    ProTitle := '<损益单>...';
    SyncChangeOrder(SyncFlag,BeginDate);
    SetProPosition(300);
    ProTitle := '<日台账>...';
    SyncRckDays(SyncFlag,BeginDate);
    SetProPosition(400);
    ProTitle := '<库存表>...';
    if SyncFlag=0 then SyncStorage;
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

procedure TSyncFactory.AddLoginLog;
var SQL,Flag,ConnectTo:string;
begin
  if token.tenantId = '' then Exit;
  LoginStart := GetTickCount;
  LoginId := TSequence.NewId;
  try
    if token.online then
       begin
         Flag := '1';
         ConnectTo := 'Remote';
         dataFactory.MoveToRemote;
       end
    else
       begin
         Flag := '2';
         ConnectTo := 'Local';
         dataFactory.MoveToSqlite;
       end;
    SQL :=
      'insert into CA_LOGIN_INFO(LOGIN_ID,TENANT_ID,SHOP_ID,USER_ID,IP_ADDR,COMPUTER_NAME,MAC_ADDR,SYSTEM_INFO,PRODUCT_ID,NETWORK_STATUS,CONNECT_TO,LOGIN_DATE,CONNECT_TIMES,COMM,TIME_STAMP) '+
      'values('''+LoginId+''','+token.tenantId+','''+token.shopId+''','''+token.userId+''','''+GetIPAddr+''','''+GetComputerName+''','''+GetMacAddr+''','''+GetSystemInfo+''',''R6'','''+Flag+''','''+ConnectTo+''','''+FormatDatetime('YYYY-MM-DD HH:NN:SS',now())+''',-1,''00'','+GetTimeStamp(dataFactory.iDbType)+')';
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
    dataFactory.ExecSQL('update CA_LOGIN_INFO set LOGOUT_DATE='''+FormatDatetime('YYYY-MM-DD HH:NN:SS',now())+''',CONNECT_TIMES='+inttostr((GetTickCount-LoginStart) div 60000)+',COMM='+GetCommStr(dataFactory.iDbType)+',TIME_STAMP='+GetTimeStamp(dataFactory.iDbType)+' where TENANT_ID='+token.tenantId+' and LOGIN_ID='''+LoginId+'''');
  finally
    dataFactory.MoveToDefault;
  end;
  LoginId := '';
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

function TSyncFactory.SyncLockCheck(PHWnd:THandle): boolean;
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
       if MessageBox(PHWnd,'系统检测到当前使用的电脑不是您常用的电脑，无法上传数据...'+#10#13+'是否立即解锁?','友情提醒',MB_YESNO+MB_ICONQUESTION) = 6 then
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
  sr: TSearchRec;
  FileAttrs: integer;
  NeedRecovery:boolean;
  recType,Folder,FileName:string;
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
                    FileName := sr.Name;
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

  if FileName <> '' then
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
                        MessageBox(AppHandle,pchar('数据恢复出错，原因：'+E.Message),'友情提示...',MB_OK+MB_ICONQUESTION);
                      end;
                 end;
               end;
          end;
     end;
end;

function TSyncFactory.CheckBackUpDBFile(PHWnd:THandle): boolean;
var rs:TZQuery;
begin
  if dllGlobal.GetSFVersion <> '.LCL' then Exit;
  if FileExists(ExtractFilePath(Application.ExeName)+'data\r3_bak.r6') then
     begin
       if not CheckValidDBFile(ExtractFilePath(Application.ExeName)+'data\r3_bak.r6') then
          begin
            DeleteFile(ExtractFilePath(Application.ExeName)+'data\r3_bak.r6');
            Exit;
          end;
       MessageBox(PHWnd,'系统检测到上次文件还原过程中异常中断，需对数据文件进行还原...','友情提示...',MB_OK+MB_ICONQUESTION);
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

function TSyncFactory.CheckValidDBFile(src:string): boolean;
var
  rs:TZQuery;
  sqlite:TdbFactory;
begin
  result := false;
  try
    sqlite := TdbFactory.Create;
    rs:=TZQuery.Create(nil);
    try
      sqlite.Initialize('provider=sqlite-3;databasename='+ExtractShortPathName(src));
      sqlite.connect;
      rs.SQL.Text := 'select VALUE from SYS_DEFINE where DEFINE = ''TENANT_ID'' and TENANT_ID=:TENANT_ID';
      rs.ParamByName('TENANT_ID').AsInteger := strtoint(token.tenantId);
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
  rs_l,rs_r:TZQuery;
  SyncTimeStamp:int64;
  Params:TftParamList;
begin
  if dllGlobal.GetSFVersion <> '.LCL' then Exit;
  new(n);
  n^.tbname := 'STO_STORAGE';
  n^.keyFields := 'TENANT_ID;SHOP_ID;GODS_ID;BATCH_NO;PROPERTY_01;PROPERTY_02';
  n^.whereStr :=  'TENANT_ID = :TENANT_ID and AMOUNT<>0';
  n^.synFlag := 1;
  n^.keyFlag := 1;
  n^.tbtitle := '当前库存';
  n^.isSyncUp := '1';
  rs_l := TZQuery.Create(nil);
  rs_r := TZQuery.Create(nil);
  Params := TftParamList.Create(nil);
  try
    dataFactory.remote.ExecSQL('update STO_STORAGE set AMOUNT=0,AMONEY=0 where TENANT_ID='+token.tenantId+'');
    SyncTimeStamp := GetSynTimeStamp(token.tenantId,n^.tbname,token.shopId);
    Params.ParamByName('TENANT_ID').AsInteger := strtoint(token.tenantId);
    Params.ParamByName('SHOP_ID').AsString := token.shopId;
    Params.ParamByName('KEY_FLAG').AsInteger := n^.keyFlag;
    Params.ParamByName('TABLE_NAME').AsString := n^.tbName;
    Params.ParamByName('KEY_FIELDS').AsString := n^.keyFields;
    Params.ParamByName('TIME_STAMP').Value := SyncTimeStamp;
    Params.ParamByName('LAST_TIME_STAMP').Value := SyncTimeStamp;
    Params.ParamByName('WHERE_STR').AsString := n^.whereStr;
    Params.ParamByName('TABLE_FIELDS').AsString := GetTableFields(n^.tbName);
    Params.ParamByName('SYN_COMM').AsBoolean := false;
    dataFactory.sqlite.Open(rs_l,'TSyncSingleTableV60',Params);
    rs_r.SyncDelta := rs_l.SyncDelta;
    dataFactory.remote.UpdateBatch(TZQuery(rs_r).Delta,'TSyncSingleTableV60',TftParamList.Encode(Params));
  finally
    dispose(n);
    Params.Free;
    rs_l.Free;
    rs_r.Free;
  end;
end;

procedure TSyncFactory.TimerSync;
begin
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
  db:TdbFactory;
  sql:string;
begin
  inherited;
  SyncFactory.timered := true;
  try
    if not SyncFactory.DBLocked then Exit;
    //在线状态心跳
    if SyncFactory.LoginId<>'' then
    begin
      if token.online then
         begin
           sql := 'update CA_LOGIN_INFO set LOGOUT_DATE='''+FormatDatetime('YYYY-MM-DD HH:NN:SS',now())+''',CONNECT_TIMES='+inttostr((GetTickCount-SyncFactory.LoginStart) div 60000)+',COMM='+GetCommStr(dataFactory.remote.iDbType)+',TIME_STAMP='+GetTimeStamp(dataFactory.remote.iDbType)+' where TENANT_ID='+token.tenantId+' and LOGIN_ID='''+SyncFactory.LoginId+'''';
           dataFactory.remote.ExecSQL(sql);
         end
      else
         begin
           sql := 'update CA_LOGIN_INFO set LOGOUT_DATE='''+FormatDatetime('YYYY-MM-DD HH:NN:SS',now())+''',CONNECT_TIMES='+inttostr((GetTickCount-SyncFactory.LoginStart) div 60000)+',COMM='+GetCommStr(dataFactory.sqlite.iDbType)+',TIME_STAMP='+GetTimeStamp(dataFactory.sqlite.iDbType)+' where TENANT_ID='+token.tenantId+' and LOGIN_ID='''+SyncFactory.LoginId+'''';
           dataFactory.sqlite.ExecSQL(sql);
         end;
    end;
    if not SyncFactory.timerTerminted then SyncFactory.TimerSyncSales;
    if not SyncFactory.timerTerminted then SyncFactory.TimerSyncStock;
    if not SyncFactory.timerTerminted then SyncFactory.TimerSyncChange;
    if not SyncFactory.timerTerminted then SyncFactory.TimerSyncStroage;
  finally
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
  ls,rs_h,rs_d,rs_s,cs_h,cs_d,cs_s:TZQuery;
  tbName,orderFields,dataFields,glideFields:string;
begin
  if (dllGlobal.GetSFVersion <> '.LCL') then Exit;

  tbName := 'SAL_SALESORDER';
  SyncTimeStamp := GetSynTimeStamp(token.tenantId,tbName,token.shopId);
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
    Params.ParamByName('TIME_STAMP').Value := SyncTimeStamp;
    Params.ParamByName('KEY_FLAG').AsInteger := 0;
    Params.ParamByName('TIME_STAMP_NOCHG').AsInteger := 0;
    Params.ParamByName('SYN_COMM').AsBoolean := true;

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
  ls,rs_h,rs_d,cs_h,cs_d:TZQuery;
  tbName,orderFields,dataFields:string;
begin
  if (dllGlobal.GetSFVersion <> '.LCL') then Exit;

  tbName := 'STO_CHANGEORDER';
  SyncTimeStamp := GetSynTimeStamp(token.tenantId,tbName,token.shopId);
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
    Params.ParamByName('TIME_STAMP').Value := SyncTimeStamp;
    Params.ParamByName('KEY_FLAG').AsInteger := 0;
    Params.ParamByName('TIME_STAMP_NOCHG').AsInteger := 0;
    Params.ParamByName('SYN_COMM').AsBoolean := true;

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
  ls,rs_h,rs_d,cs_h,cs_d:TZQuery;
  tbName,orderFields,dataFields:string;
begin
  if (dllGlobal.GetSFVersion <> '.LCL') then Exit;

  tbName := 'STK_STOCKORDER';
  SyncTimeStamp := GetSynTimeStamp(token.tenantId,tbName,token.shopId);
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
    Params.ParamByName('TIME_STAMP').Value := SyncTimeStamp;
    Params.ParamByName('KEY_FLAG').AsInteger := 0;
    Params.ParamByName('TIME_STAMP_NOCHG').AsInteger := 0;
    Params.ParamByName('SYN_COMM').AsBoolean := true;

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

procedure TSyncFactory.TimerSyncStroage;
var
  n:PSynTableInfo;
  rs_l,rs_r:TZQuery;
  SyncTimeStamp:int64;
  Params:TftParamList;
begin
  if dllGlobal.GetSFVersion <> '.LCL' then Exit;
  new(n);
  n^.tbname := 'STO_STORAGE';
  n^.keyFields := 'TENANT_ID;SHOP_ID;GODS_ID;BATCH_NO;PROPERTY_01;PROPERTY_02';
  n^.whereStr :=  'TENANT_ID = :TENANT_ID and AMOUNT<>0';
  n^.synFlag := 1;
  n^.keyFlag := 1;
  n^.tbtitle := '当前库存';
  n^.isSyncUp := '1';
  rs_l := TZQuery.Create(nil);
  rs_r := TZQuery.Create(nil);
  Params := TftParamList.Create(nil);
  try
    dataFactory.remote.ExecSQL('update STO_STORAGE set AMOUNT=0,AMONEY=0 where TENANT_ID='+token.tenantId+'');
    if timerTerminted then Exit;
    SyncTimeStamp := GetSynTimeStamp(token.tenantId,n^.tbname,token.shopId);
    if timerTerminted then Exit;
    Params.ParamByName('TENANT_ID').AsInteger := strtoint(token.tenantId);
    Params.ParamByName('SHOP_ID').AsString := token.shopId;
    Params.ParamByName('KEY_FLAG').AsInteger := n^.keyFlag;
    Params.ParamByName('TABLE_NAME').AsString := n^.tbName;
    Params.ParamByName('KEY_FIELDS').AsString := n^.keyFields;
    Params.ParamByName('TIME_STAMP').Value := SyncTimeStamp;
    Params.ParamByName('LAST_TIME_STAMP').Value := SyncTimeStamp;
    Params.ParamByName('WHERE_STR').AsString := n^.whereStr;
    Params.ParamByName('TABLE_FIELDS').AsString := GetTableFields(n^.tbName);
    Params.ParamByName('SYN_COMM').AsBoolean := false;
    dataFactory.sqlite.Open(rs_l,'TSyncSingleTableV60',Params);
    if timerTerminted then Exit;
    rs_r.SyncDelta := rs_l.SyncDelta;
    dataFactory.remote.UpdateBatch(TZQuery(rs_r).Delta,'TSyncSingleTableV60',TftParamList.Encode(Params));
  finally
    dispose(n);
    Params.Free;
    rs_l.Free;
    rs_r.Free;
  end;
end;

function TSyncFactory.Gettimered: boolean;
begin
//  EnterCriticalSection(ThreadLock);
  try
    result := Ftimered;
  finally
//    LeaveCriticalSection(ThreadLock);
  end;
end;

initialization
  SyncFactory := TSyncFactory.Create;
finalization
  if Assigned(SyncFactory) then FreeAndNil(SyncFactory);
end.
