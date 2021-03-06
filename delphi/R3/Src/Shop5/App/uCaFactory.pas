unit uCaFactory;

interface
uses
  Windows, Messages, SysUtils, Classes,InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns,Des,WinInet, xmldom, XMLIntf,
  msxmldom, XMLDoc, MSHTML,ComObj, ActiveX,msxml,ZDataSet,DB,ZBase,Variants,ZLogFile,ZdbFactory,Forms,EncdDecd;
type
  TCaTenant=record
    TENANT_ID:integer;
    LOGIN_NAME:string;
    TENANT_NAME:string;
    TENANT_TYPE:integer;
    SHORT_TENANT_NAME:string;
    TENANT_SPELL:string;
    LICENSE_CODE:String;
    LEGAL_REPR:string;
    LINKMAN:string;
    TELEPHONE:string;
    FAXES:string;
    MSN:string;
    QQ:string;
    HOMEPAGE:string;
    ADDRESS:string;
    POSTALCODE:string;
    REMARK:string;
    PASSWRD:string;
    REGION_ID:string;
    SRVR_ID:string;
    PROD_ID:string;
    DB_ID:string;
    AUDIT_STATUS:string;
  end;
  
  TCaLogin=record
    TENANT_ID:integer;
    RET:string;
    SLL:string;
    HOST_NAME:string;
    SRVR_PORT:integer;
    DB_ID:integer;
    SRVR_PATH:string;
    SHOP_ID:string;
  end;
  
  TCaUpgrade=record
    UpGrade:integer;
    URL:string;
    Version:string;
  end;

  PServiceLine=^TServiceLine;
  TServiceLine=record
    RELATION_ID:integer;
    TENANT_ID:integer;
    RELATION_NAME:string;
    RELATION_SPELL:string;
    REMARK:string;
  end;

  PRelationInfo=^TRelationInfo;
  TRelationInfo=record
      //企业关系ID号
    RELATIONS_ID:string;
      //供应链ID号
    RELATION_ID:integer;
      //当前企业代码
    TENANT_ID:integer;
      //下级企业代码
    RELATI_ID:integer;
      //关系类型
    RELATION_TYPE:string;
      //结构树 000000 6位一级，最多支持5级 <在此不是一棵树，没有指企业供应链无法生成此代号>
    LEVEL_ID:string;
      //关系状态  1 申请 2 审核
    RELATION_STATUS:string;
      //创建日期
    CREA_DATE:string;
      //审核日期
    CHK_DATE:string;
      //通讯标志 00 新增 01修改 02 删除 第一位为0待同步,1已同步
    COMM:string;
      //更新时间 从2011-01-01开始的秒数
    TIME_STAMP:int64;
  end;

  rsp = class(TSOAPHeader)
  private
    FencryptType: integer;
    FrspSessionId: string;
    procedure SetencryptType(const Value: integer);
    procedure SetrspSessionId(const Value: string);
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property rspSessionId:string read FrspSessionId write SetrspSessionId;
    property encryptType:integer read FencryptType write SetencryptType;
  end;
  TRspFunction=function(xml:widestring;url:widestring;flag:integer):widestring;stdcall;
  TRspSetParams=function(_sslpwd:pansichar):boolean;stdcall;
  TCaFactory=class
  private
    FSSL: string;
    FURL: string;
    Fsslpwd: string;
    Fpubpwd: string;
    FSessionId: string;
    timeout,connectTimeOut:Integer;
    FAudited: boolean;
    FTimeStamp: int64;
    _Start:int64;
    FTenantType: integer;
    FRspFlag: integer;
    FDownModule: boolean;
    FConnected: boolean;
    FresVersion: string;
    FresDesktop: string;
    FeseFlag: integer;
    procedure SetSSL(const Value: string);
    procedure SetURL(const Value: string);
    procedure Setpubpwd(const Value: string);
    procedure Setsslpwd(const Value: string);
    procedure SetSessionId(const Value: string);
    procedure doAfterExecute(const MethodName: string;
      SOAPResponse: TStream);
    procedure SetAudited(const Value: boolean);
    procedure SetTimeStamp(const Value: int64);
    procedure SetTenantType(const Value: integer);
    procedure SetRspFlag(const Value: integer);
    procedure SetDownModule(const Value: boolean);
    function GetRspTimeStamp: int64;
    function GetTimeStamp: int64;
    procedure SetresDesktop(const Value: string);
    procedure SetresVersion(const Value: string);
    procedure SeteseFlag(const Value: integer);
  protected
    RspHandle:THandle;
    RspcoLogin:TRspFunction;
    RspcoRegister:TRspFunction;
    RspgetTenantInfo:TRspFunction;
    RspgetShopInfo:TRspFunction;
    RspcheckLicese:TRspFunction;
    RsplistModules:TRspFunction;
    RspcheckUpgrade:TRspFunction;
    RspcreateServiceLine:TRspFunction;
    RspqueryServiceLines:TRspFunction;
    RspapplyRelation:TRspFunction;
    RspdownloadTenants:TRspFunction;
    RspdownloadServiceLines:TRspFunction;
    RspdownloadRelations:TRspFunction;
    RspdownloadSort:TRspFunction;
    RspdownloadUnit:TRspFunction;
    RspdownloadGoods:TRspFunction;
    RspdownloadDeployGoods:TRspFunction;
    RspdownloadBarcode:TRspFunction;
    RspqueryUnion:TRspFunction;
    RspSetParams:TRspSetParams;
    function Encode(inxml:String;Key:string):String;
    function Decode(inxml:String;Key:string):String;
    procedure SetTicket;
    function GetTicket:Int64;
    procedure LoadRspFactory;
    procedure FreeRspFactory;
    function  CheckRspState:boolean;
    //ado模式认证
    function  coAdoLogin(Account:string;PassWrd:string;flag:integer=1):TCaLogin;
    function  coAdoCheckLicese:boolean;
    function  CheckAdoUpgrade(TENANT_ID,PROD_ID,CurVeraion:string):TCaUpgrade;
    function  downloadAdoCaModule(TenantId,flag:integer):boolean;
    function  coAdoGetList(TENANT_ID:string):TCaTenant;
    function  downloadAdoShopInfo(TenantId:integer;shopId,xsmCode,xsmPswd:string;flag:integer):boolean;
    function  coAdoRegister(Info:TCaTenant):TCaTenant;
    //rsp模式认证
    function  coRspLogin(Account:string;PassWrd:string;flag:integer=1):TCaLogin;
    function  coRspCheckLicese:boolean;
    function  CheckRspUpgrade(TENANT_ID,PROD_ID,CurVeraion:string):TCaUpgrade;
    function  downloadRspCaModule(TenantId,flag:integer):boolean;
    function  coRspGetList(TENANT_ID:string):TCaTenant;
    function  downloadRspShopInfo(TenantId:integer;shopId,xsmCode,xsmPswd:string;flag:integer):boolean;
    function  coRspRegister(Info:TCaTenant):TCaTenant;
    procedure WAdoParams;
  public
    auto:boolean;
    constructor Create;
    destructor Destroy;override;

    function DesEncode(inStr:string;Key:string):string;

    function CreateRio(_timeOut:integer=-1):THTTPRIO;
    function CheckInitSync: boolean;

    function GetHeader(rio:THTTPRIO):rsp;
    function SendHeader(rio:THTTPRIO;flag:integer=1):rsp;
    function CreateXML(xml:string):IXMLDomDocument;
    function CreateRspXML:IXMLDomDocument;
    function FindElement(root:IXMLDOMNode;s:string):IXMLDOMNode;
    function FindNode(doc:IXMLDomDocument;tree:string;CheckExists:boolean=true):IXMLDOMNode;
    function GetNodeValue(root:IXMLDOMNode;s:string):string;
    procedure CheckRecAck(doc:IXMLDomDocument);
    function CheckNetwork(addr:string=''):boolean;

    function GetSynTimeStamp(tbName:string;SHOP_ID:string='#'):int64;
    procedure SetSynTimeStamp(tbName:string;_TimeStamp:int64;SHOP_ID:string='#');

    //产品服务
    function CheckDebugSync:boolean;
    function CheckUpgrade(TENANT_ID,PROD_ID,CurVeraion:string):TCaUpgrade;
    //供应链服务
    function CreateServiceLine(var ServiceLine:TServiceLine):boolean;
    function queryServiceLines(tid:integer;List:TList):boolean;
    function applyRelation(supTenantId,serviceLineId,subTenantId,relationType:integer):TRelationInfo;
    //商盟服务
    function downloadUnion(tid:integer):boolean;
    //数据同步
    function downloadTenants(TenantId,flag:integer):boolean;
    function downloadServiceLines(TenantId,flag:integer):boolean;
    function downloadRelations(TenantId,flag:integer):boolean;
    function downloadSort(TenantId,flag:integer):boolean;
    function downloadUnit(TenantId,flag:integer):boolean;
    function downloadGoods(TenantId,flag:integer):boolean;
    function downloadDeployGoods(TenantId,flag:integer):boolean;
    function downloadBarcode(TenantId,flag:integer):boolean;
    //保存门店
    function downloadShopInfo(TenantId:integer;shopId,xsmCode,xsmPswd:string;flag:integer):boolean;
    function SyncAll(flag:integer):boolean;

    function downloadCaModule(TenantId,flag:integer):boolean;

    //企业服务
    function AutoCoLogo:boolean;
    function coLogin(Account:string;PassWrd:string;flag:integer=1):TCaLogin;
    function checkLicese:boolean;
    function coRegister(Info:TCaTenant):TCaTenant;
    function coGetList(TENANT_ID:string):TCaTenant;

    function SyncSystemTimeStamp:boolean;

    property SSL:string read FSSL write SetSSL;
    property URL:string read FURL write SetURL;
    //公共密码
    property pubpwd:string read Fpubpwd write Setpubpwd;
    //临时密码
    property sslpwd:string read Fsslpwd write Setsslpwd;
    //通讯会话
    property SessionId:string read FSessionId write SetSessionId;
    //认证审核通过
    property Audited:boolean read FAudited write SetAudited;
    //认证时的时间戳
    property TimeStamp:int64 read GetTimeStamp write SetTimeStamp;
    //取服务器上当前时间戳
    property RspTimeStamp:int64 read GetRspTimeStamp;
    //是否是零售商
    property TenantType:integer read FTenantType write SetTenantType;
    //0不是Rsp调用 1是
    property RspFlag:integer read FRspFlag write SetRspFlag;
    //是否下载菜单
    property DownModule:boolean read FDownModule write SetDownModule;
    //最新桌面版本号
    property resVersion:string read FresVersion write SetresVersion;
    property resDesktop:string read FresDesktop write SetresDesktop;
    //许可模式，0 默认 1按门店 2按硬件地址
    property eseFlag:integer read FeseFlag write SeteseFlag;
  end;
var CaFactory:TCaFactory;
implementation
uses ufrmLogo,EncDec,ZLibExGZ,uGlobal,CaTenantService,CaProductService,CaServiceLineService,RspDownloadService,PubMemberService,
     IniFiles,ObjCommon,uFnUtil;
{ TCaFactory }

function TCaFactory.CheckInitSync: boolean;
var
  timestamp:int64;
  cDate:Currency;
  CurDate:Currency;
begin
  result := true;
  if Global.debug then Exit;
  timestamp := GetSynTimeStamp('#','#');
  if timestamp=0 then Exit;
  cDate := trunc(timestamp/86400.0+40542.0);
  CurDate := date();
  CurDate := trunc(CurDate)-2;
  result := cDate<CurDate;
end;
procedure TCaFactory.doAfterExecute(const MethodName: string; SOAPResponse: TStream);
begin
  try
    InternetSetOption(nil, INTERNET_OPTION_CONNECT_TIMEOUT, Pointer(@connectTimeOut), SizeOf(connectTimeOut));
    InternetSetOption(nil, INTERNET_OPTION_SEND_TIMEOUT, Pointer(@timeout), SizeOf(timeout));
    InternetSetOption(nil, INTERNET_OPTION_RECEIVE_TIMEOUT, Pointer(@timeout), SizeOf(timeout));
  except
    on E:Exception do
       begin
         Raise;
       end;
  end;
end;
procedure TCaFactory.CheckRecAck(doc: IXMLDomDocument);
var
  node:IXMLDOMNode;
begin
  try
  if not Assigned(doc) then Raise Exception.Create('无效的XML文档...');
  node :=  doc.documentElement;
  if not Assigned(node) then Raise Exception.Create('无效的XML文档...');
  if node.nodeName<>'message' then Raise Exception.Create('无效的XML跟双方协议不相符...');
  node := FindElement(node,'header');
  if not Assigned(node) then Exception.Create('无效的XML跟双方协议不相符...');
  node := FindElement(node,'pub');
  if not Assigned(node) then Exception.Create('无效的XML跟双方协议不相符...');
  node := FindElement(node,'recAck');
  if not Assigned(node) then Exception.Create('无效的XML跟双方协议不相符...');
  if node.text<>'0000' then
     begin
       node := FindElement(node.parentNode,'msg');
       Raise Exception.Create(node.text);
     end
  else
     begin
       node := FindElement(node.parentNode,'timeStamp');
       if node<>nil then
          timeStamp := StrtoInt64(node.text);
     end;
  except
    on E:Exception do
      begin
        if doc<>nil then
           LogFile.AddLogFile(0,E.Message+' XML='+doc.xml)
        else
           LogFile.AddLogFile(0,E.Message+' XML=无');
        Raise;
      end;
  end;
end;

function TCaFactory.CheckNetwork(addr:string=''): boolean;
function GetHost:string;
var
  List:TStringList;
begin
  List:=TStringList.Create;
  try
    List.Delimiter := '/';
    if addr='' then List.DelimitedText := url else List.DelimitedText := addr;
    result := '';
    while List.Count>0 do
      begin
       if List[0]='' then List.Delete(0)
       else
       if uppercase(List[0])='HTTP:' then List.Delete(0)
       else
          begin
            result := List[0];
            Exit;
          end;
      end;
  finally
    List.Free;
  end;
end;
function InternetConnected: Boolean;
const
// local system uses a modem to connect to the Internet.
INTERNET_CONNECTION_MODEM = 1;
// local system uses a local area network to connect to the Internet.
INTERNET_CONNECTION_LAN = 2;
// local system uses a proxy server to connect to the Internet.
INTERNET_CONNECTION_PROXY = 4;
// local system's modem is busy with a non-Internet connection.
INTERNET_CONNECTION_MODEM_BUSY = 8;
var
dwConnectionTypes : DWORD;
begin
  dwConnectionTypes := INTERNET_CONNECTION_MODEM+ INTERNET_CONNECTION_LAN
  + INTERNET_CONNECTION_PROXY;
  Result := InternetGetConnectedState(@dwConnectionTypes, 0);
end;
function CheckIsNetworkAlive:boolean;
var
  flags : DWORD;
begin
  result := true;
//  result := IsNetworkAlive(flags);
end;
var
  F:TIniFile;
begin
  F := TIniFile.Create(ExtractFilePath(ParamStr(0))+'r3.cfg');
  try
    case F.ReadInteger('soft','network',0) of
    0:result := true;
    1:result := CheckIsNetworkAlive;
    2:result := InternetConnected;
    end;
  finally
    try
      F.Free;
    except
    end;
  end;
end;

function TCaFactory.coRspGetList(TENANT_ID: string): TCaTenant;
var
  inxml:string;
  doc:IXMLDomDocument;
  rio:THTTPRIO;
  caTenant:IXMLDOMNode;
  Node:IXMLDOMNode;
  code:string;
  h,r:rsp;
  OutXml:widestring;
begin
try
  doc := CreateRspXML;
  Node := doc.createElement('flag');
  Node.text := '3';
  FindNode(doc,'header\pub').appendChild(Node);
  
  Node := doc.createElement('caTenant');
  FindNode(doc,'body').appendChild(Node);

  Node := doc.createElement('tenantId');
  Node.text := TENANT_ID;
  FindNode(doc,'body\caTenant').appendChild(Node);

  inxml := '<?xml version="1.0" encoding="gb2312"?> '+doc.xml;

  if rspHandle>0 then
     doc := CreateXML(rspgetTenantInfo(inxml,URL,2))
  else
  begin
    rio := CreateRio(20000);
    h := SendHeader(rio,2);
    try
      try
        OutXml := GetCaTenantWebServiceImpl(true,URL+'CaTenantService?wsdl',rio).getTenantInfo(Encode(inxml,sslpwd));
        r := GetHeader(rio);
        try
          case r.encryptType of
          2:doc := CreateXML(Decode(OutXml,sslpwd) );
          1:doc := CreateXML(Decode(OutXml,Pubpwd) );
          else doc := CreateXML(Decode(OutXml,''));
          end;
        finally
          r.Free;
        end;
      except
        on E:Exception do
           begin
             if pos('Empty document',E.Message)>0 then
                begin
                  Raise Exception.Create('无法连接到RSP认证服务器，请检查网络是否正常.');
                end
             else
                Raise Exception.Create('连接RSP服务失败了，请关闭DEP服务试试...');
           end;
      end;
    finally
      h.Free;
    end;
  end;
    CheckRecAck(doc);
    caTenant := FindNode(doc,'body\caTenant');
    result.TENANT_ID := StrtoInt(GetNodeValue(caTenant,'tenantId'));
    result.LOGIN_NAME := GetNodeValue(caTenant,'loginName');
    result.TENANT_NAME := GetNodeValue(caTenant,'tenantName');
    result.SHORT_TENANT_NAME := GetNodeValue(caTenant,'shortTenantName');
    result.TENANT_SPELL := GetNodeValue(caTenant,'tenantSpell');
    result.TENANT_TYPE := StrtoInt(GetNodeValue(caTenant,'tenantType'));
    result.LICENSE_CODE := GetNodeValue(caTenant,'licenseCode');
    result.LEGAL_REPR := GetNodeValue(caTenant,'legalRepr');
    result.LINKMAN := GetNodeValue(caTenant,'linkman');
    result.TELEPHONE := GetNodeValue(caTenant,'telephone');
    result.FAXES := GetNodeValue(caTenant,'faxes');
    result.HOMEPAGE := GetNodeValue(caTenant,'homepage');
    result.ADDRESS := GetNodeValue(caTenant,'address');
    result.POSTALCODE := GetNodeValue(caTenant,'postalcode');
    result.PASSWRD := GetNodeValue(caTenant,'passwrd');
    result.QQ := GetNodeValue(caTenant,'qq');
    result.MSN := GetNodeValue(caTenant,'msn');
    result.REMARK := GetNodeValue(caTenant,'remark');
    result.REGION_ID := GetNodeValue(caTenant,'regionId');
    result.SRVR_ID := GetNodeValue(caTenant,'srvrId');
    result.PROD_ID := GetNodeValue(caTenant,'prodId');
    result.DB_ID := GetNodeValue(caTenant,'dbId');
    result.AUDIT_STATUS := GetNodeValue(caTenant,'auditStatus');
except
  on E:Exception do
  begin
    if doc<>nil then
       LogFile.AddLogFile(0,'读取<企业资料>失败xml='+doc.xml+';原因:'+E.Message)
    else
       LogFile.AddLogFile(0,'读取<企业资料>失败xml=无;原因:'+E.Message);
    Raise;
  end;
end;
end;

function TCaFactory.coRspLogin(Account, PassWrd: string;flag:integer=1): TCaLogin;
var
  inxml:string;
  doc:IXMLDomDocument;
  rio:THTTPRIO;
  caTenantLoginResp,ServerInfo:IXMLDOMNode;
  Node:IXMLDOMNode;
  code,hsname,srvrId,cstr,defSrvrId,defStr:string;
  h:rsp;
  f,r:TIniFile;
  finded,isSrvr:boolean;
begin
try
  Audited := false;
  doc := CreateRspXML;
  Node := doc.createElement('flag');
  Node.text := inttostr(flag);
  FindNode(doc,'header\pub').appendChild(Node);

  Node := doc.createElement('caTenant');
  FindNode(doc,'body').appendChild(Node);

  Node := doc.createElement('loginName');
  Node.text := Account;
  FindNode(doc,'body\caTenant').appendChild(Node);

  Node := doc.createElement('passwrd');
  Node.text := PassWrd;
  FindNode(doc,'body\caTenant').appendChild(Node);

  inxml := '<?xml version="1.0" encoding="gb2312"?> '+doc.xml;

  if rspHandle>0 then
     doc := CreateXML(RspcoLogin(inxml,URL,1))
  else
  begin
    rio := CreateRio(20000);
    h := SendHeader(rio,1);
    try
      try
        doc := CreateXML(Decode(
                        GetCaTenantWebServiceImpl(true,URL+'CaTenantService?wsdl',rio).login(Encode(inxml,pubpwd))
                        ,pubpwd
                     )
               );
      except
        on E:Exception do
           begin
             if pos('Empty document',E.Message)>0 then
                begin
                  Raise Exception.Create('无法连接到RSP认证服务器，请检查网络是否正常.');
                end
             else
                begin
                  LogFile.AddLogFile(0,'认证<企业登录>失败;原始错误:'+E.Message);
                  Raise Exception.Create('连接RSP服务失败了，请关闭DEP服务试试...');
                end;
           end;
      end;
      GetHeader(rio).free;
    finally
      h.Free;
    end;
  end;
    CheckRecAck(doc);
    SyncSystemTimeStamp;
    caTenantLoginResp := FindNode(doc,'body\caTenantLoginResp');
    code := GetNodeValue(caTenantLoginResp,'code');
    result.RET := code;
    if StrtoIntDef(code,0) in [1,5] then //认证成功
       begin
         Auto := (flag<>1);
         result.TENANT_ID := StrtoInt(GetNodeValue(caTenantLoginResp,'tenantId'));
         sslpwd := encddecd.DecodeString(GetNodeValue(caTenantLoginResp,'keyStr'));
         result.SLL := sslpwd;
         if RspHandle>0 then
            begin
              RspSetParams(pansichar(sslpwd));
            end;
         if code = '1' then
            begin
              f := TIniFile.Create(ExtractFilePath(ParamStr(0))+'db.cfg');
              r := TIniFile.Create(ExtractFilePath(ParamStr(0))+'r3.cfg');
              try
                 srvrId := f.readString('db','srvrId','');
                 result.DB_ID := StrtoInt(GetNodeValue(caTenantLoginResp,'dbId'));
                 defSrvrId := GetNodeValue(caTenantLoginResp,'srvrId');
                 if flag=3 then result.SHOP_ID := GetNodeValue(caTenantLoginResp,'shopId');
                 if result.SHOP_ID='' then result.SHOP_ID := inttostr(result.TENANT_ID)+'0001';
                 resVersion := GetNodeValue(caTenantLoginResp,'resVersion');
                 resDesktop := GetNodeValue(caTenantLoginResp,'resDesktop');
                 f.WriteString('db','dbid',inttostr(result.DB_ID));
                 if StrtointDef(GetNodeValue(caTenantLoginResp,'databasePort'),0)=0 then
                    hsname := GetNodeValue(caTenantLoginResp,'dbHostName')
                 else
                    hsname := GetNodeValue(caTenantLoginResp,'dbHostName')+':'+GetNodeValue(caTenantLoginResp,'databasePort');
                 if rspflag=1 then
                 begin
                   f.WriteString('db'+inttostr(result.DB_ID),'hostname',hsname);
                   f.WriteString('db'+inttostr(result.DB_ID),'databasename',GetNodeValue(caTenantLoginResp,'databaseName'));
                   f.WriteString('db'+inttostr(result.DB_ID),'uid',GetNodeValue(caTenantLoginResp,'dbUserName'));
                   f.WriteString('db'+inttostr(result.DB_ID),'password',EncStr(GetNodeValue(caTenantLoginResp,'dbPassword'),ENC_KEY));
                   f.WriteString('db'+inttostr(result.DB_ID),'dbid',inttostr(result.DB_ID));
                   case StrtoInt(GetNodeValue(caTenantLoginResp,'databaseType')) of
                   0:begin
                       f.WriteString('db'+inttostr(result.DB_ID),'provider','mssql');
                       cstr := 'provider=mssql;hostname='+hsname+';databasename='+GetNodeValue(caTenantLoginResp,'databaseName')+';uid='+GetNodeValue(caTenantLoginResp,'dbUserName')+';password='+GetNodeValue(caTenantLoginResp,'dbPassword');
                     end;
                   1:begin
                       f.WriteString('db'+inttostr(result.DB_ID),'provider','oracle');
                       cstr := 'provider=oracle-9i;hostname='+hsname+';databasename='+GetNodeValue(caTenantLoginResp,'databaseName')+';uid='+GetNodeValue(caTenantLoginResp,'dbUserName')+';password='+GetNodeValue(caTenantLoginResp,'dbPassword');
                     end;
                   2:begin
                       f.WriteString('db'+inttostr(result.DB_ID),'provider','sybase');
                       cstr := 'provider=sybase;hostname='+hsname+';databasename='+GetNodeValue(caTenantLoginResp,'databaseName')+';uid='+GetNodeValue(caTenantLoginResp,'dbUserName')+';password='+GetNodeValue(caTenantLoginResp,'dbPassword');
                     end;
                   3:begin
                       f.WriteString('db'+inttostr(result.DB_ID),'provider','access');
                       cstr := 'provider=ado;"databasename=Provider=IBMDADB2;Persist Security Info=True;Data Source='+GetNodeValue(caTenantLoginResp,'databaseName')+';Location='+hsname+'";uid='+GetNodeValue(caTenantLoginResp,'dbUserName')+';password='+GetNodeValue(caTenantLoginResp,'dbPassword');
                     end;
                   4:begin
                       f.WriteString('db'+inttostr(result.DB_ID),'provider','db2');
                       cstr := 'provider=ado;"databasename=Provider=IBMDADB2;Persist Security Info=True;Data Source='+GetNodeValue(caTenantLoginResp,'databaseName')+';Location='+hsname+'";uid='+GetNodeValue(caTenantLoginResp,'dbUserName')+';password='+GetNodeValue(caTenantLoginResp,'dbPassword');
                     end;
                   5:begin
                       f.WriteString('db'+inttostr(result.DB_ID),'provider','sqlite');
                       cstr := 'provider=sqlite-3;hostname='+hsname+';databasename='+GetNodeValue(caTenantLoginResp,'databaseName')+';uid='+GetNodeValue(caTenantLoginResp,'dbUserName')+';password='+GetNodeValue(caTenantLoginResp,'dbPassword');
                     end;
                   end;
                   f.WriteString('db'+inttostr(result.DB_ID),'connstr',EncStr(cstr,ENC_KEY));
                 end;
                 Audited := true;
                 finded := false;
                 if not Global.Debug and (RspFlag=0) then
                   begin
                     r.WriteString('soft','SFVersion','.'+GetNodeValue(caTenantLoginResp,'prodFlag'));
                     r.WriteString('soft','CLVersion','.'+GetNodeValue(caTenantLoginResp,'industry'));
                     r.WriteString('soft','ProductID',GetNodeValue(caTenantLoginResp,'prodId'));
                     r.WriteString('soft','name',GetNodeValue(caTenantLoginResp,'prodName'));
                     ServerInfo := FindNode(doc,'body\caTenantLoginResp\servers');
                     ServerInfo := ServerInfo.firstChild;
                     isSrvr := false;
                     while ServerInfo<>nil do
                       begin
                         f.WriteString('H_'+GetNodeValue(ServerInfo,'srvrId'),'srvrName',GetNodeValue(ServerInfo,'srvrName'));
                         f.WriteString('H_'+GetNodeValue(ServerInfo,'srvrId'),'hostName',GetNodeValue(ServerInfo,'hostName'));
                         f.WriteString('H_'+GetNodeValue(ServerInfo,'srvrId'),'srvrPort',GetNodeValue(ServerInfo,'srvrPort'));
                         f.WriteString('H_'+GetNodeValue(ServerInfo,'srvrId'),'srvrPath',GetNodeValue(ServerInfo,'srvrPath'));
                         case strtoint(GetNodeValue(ServerInfo,'srvrStatus')) of
                         1: f.WriteString('H_'+GetNodeValue(ServerInfo,'srvrId'),'srvrStatus','正常');
                         2: f.WriteString('H_'+GetNodeValue(ServerInfo,'srvrId'),'srvrStatus','爆满');
                         9: begin
                              f.EraseSection(GetNodeValue(ServerInfo,'srvrId'));
                              ServerInfo := ServerInfo.nextSibling;
                              continue;
                            end;
                         else
                            f.WriteString('H_'+GetNodeValue(ServerInfo,'srvrId'),'srvrStatus','正常');
                         end;
                         if srvrId=GetNodeValue(ServerInfo,'srvrId') then isSrvr := true;
                         if not finded then
                            begin
                              if srvrId=GetNodeValue(ServerInfo,'srvrId') then
                                 begin
                                   if GetNodeValue(ServerInfo,'hostName')='localhost' then
                                      f.WriteString('db','Connstr','')
                                   else
                                      f.WriteString('db','Connstr','connmode=2;hostname='+GetNodeValue(ServerInfo,'hostName')+';port='+GetNodeValue(ServerInfo,'srvrPort')+';dbid='+inttostr(result.DB_ID));
                                   finded := true;
                                 end;
                            end;
                         if defSrvrId=GetNodeValue(ServerInfo,'srvrId') then
                            begin
                              if GetNodeValue(ServerInfo,'hostName')='localhost' then
                              defStr := '' else
                              defStr := 'connmode=2;hostname='+GetNodeValue(ServerInfo,'hostName')+';port='+GetNodeValue(ServerInfo,'srvrPort')+';dbid='+inttostr(result.DB_ID);
                            end;
                         ServerInfo := ServerInfo.nextSibling;
                       end;
                     if not finded or not isSrvr then //一直没找到设置，默认第一个
                       begin
                         ServerInfo := FindNode(doc,'body\caTenantLoginResp\servers');
                         ServerInfo := ServerInfo.firstChild;
                         if ServerInfo<>nil then
                            begin
                              f.WriteString('db','srvrId',defSrvrId);
                              f.WriteString('db','Connstr',defStr);
                            end;
                      end;
                   end;
              finally
                try
                  f.Free;
                  r.Free;
                except
                end;
              end;
            end;
       end
    else
       Raise Exception.Create(GetNodeValue(caTenantLoginResp,'desc'));

except
  on E:Exception do
  begin
    if doc<>nil then
       LogFile.AddLogFile(0,'认证<企业登录>失败xml='+doc.xml+';原因:'+E.Message)
    else
       LogFile.AddLogFile(0,'认证<企业登录>失败xml=无;原因:'+E.Message);
    Raise;
  end;
end;
end;

function TCaFactory.coRspRegister(Info: TCaTenant): TCaTenant;
var
  inxml:string;
  doc:IXMLDomDocument;
  rio:THTTPRIO;
  caTenantRegisterResp:IXMLDOMNode;
  Node:IXMLDOMNode;
  code:string;
  h:rsp;
begin
try
  doc := CreateRspXML;
  Node := doc.createElement('flag');
  Node.text := '1';
  FindNode(doc,'header\pub').appendChild(Node);
  
  Node := doc.createElement('caTenant');
  FindNode(doc,'body').appendChild(Node);

  Node := doc.createElement('loginName');
  Node.text := Info.LOGIN_NAME;
  FindNode(doc,'body\caTenant').appendChild(Node);

  Node := doc.createElement('tenantName');
  Node.text := Info.TENANT_NAME;
  FindNode(doc,'body\caTenant').appendChild(Node);

  Node := doc.createElement('shortTenantName');
  Node.text := Info.SHORT_TENANT_NAME;
  FindNode(doc,'body\caTenant').appendChild(Node);

  Node := doc.createElement('licenseCode');
  Node.text := Info.LICENSE_CODE;
  FindNode(doc,'body\caTenant').appendChild(Node);

  Node := doc.createElement('tenantSpell');
  Node.text := Info.TENANT_SPELL;
  FindNode(doc,'body\caTenant').appendChild(Node);

  Node := doc.createElement('tenantType');
  Node.text := '3';
  FindNode(doc,'body\caTenant').appendChild(Node);

  Node := doc.createElement('passwrd');
  Node.text := Info.PASSWRD;
  FindNode(doc,'body\caTenant').appendChild(Node);

  Node := doc.createElement('legalRepr');
  Node.text := Info.LEGAL_REPR;
  FindNode(doc,'body\caTenant').appendChild(Node);

  Node := doc.createElement('linkman');
  Node.text := Info.LINKMAN;
  FindNode(doc,'body\caTenant').appendChild(Node);

  Node := doc.createElement('telephone');
  Node.text := Info.TELEPHONE;
  FindNode(doc,'body\caTenant').appendChild(Node);

  Node := doc.createElement('faxes');
  Node.text := Info.FAXES;
  FindNode(doc,'body\caTenant').appendChild(Node);

  Node := doc.createElement('homepage');
  Node.text := Info.HOMEPAGE;
  FindNode(doc,'body\caTenant').appendChild(Node);

  Node := doc.createElement('address');
  Node.text := Info.ADDRESS;
  FindNode(doc,'body\caTenant').appendChild(Node);

  Node := doc.createElement('postalcode');
  Node.text := Info.POSTALCODE;
  FindNode(doc,'body\caTenant').appendChild(Node);

  Node := doc.createElement('qq');
  Node.text := Info.QQ;
  FindNode(doc,'body\caTenant').appendChild(Node);

  Node := doc.createElement('msn');
  Node.text := Info.MSN;
  FindNode(doc,'body\caTenant').appendChild(Node);

  Node := doc.createElement('remark');
  Node.text := Info.REMARK;
  FindNode(doc,'body\caTenant').appendChild(Node);

  Node := doc.createElement('regionId');
  Node.text := Info.REGION_ID;
  FindNode(doc,'body\caTenant').appendChild(Node);

  Node := doc.createElement('prodId');
  Node.text := ProductId;
  FindNode(doc,'body\caTenant').appendChild(Node);

  inxml := '<?xml version="1.0" encoding="gb2312"?> '+doc.xml;

  if rspHandle>0 then
     doc := CreateXML(rspcoregister(inxml,URL,1))
  else
  begin
    rio := CreateRio(20000);
    h := SendHeader(rio,1);
    try
      try
        doc := CreateXML(
                     Decode(
                        GetCaTenantWebServiceImpl(true,URL+'CaTenantService?wsdl',rio).register(Encode(inxml,pubpwd))
                        ,pubpwd
                     )
               );
      except
        on E:Exception do
           begin
             if pos('Empty document',E.Message)>0 then
                begin
                  Raise Exception.Create('无法连接到RSP认证服务器，请检查网络是否正常.');
                end
             else
                Raise Exception.Create('连接RSP服务失败了，请关闭DEP服务试试...');
           end;
      end;
    GetHeader(rio).free;
    finally
      h.Free;
    end;
  end;
    CheckRecAck(doc);
    caTenantRegisterResp := FindNode(doc,'body\caTenantRegisterResp');
    code := GetNodeValue(caTenantRegisterResp,'code');
    if StrtoIntDef(code,0) in [1] then //注册成功
       begin
         result.TENANT_ID := StrtoInt(GetNodeValue(caTenantRegisterResp,'tenantId'));
       end
    else
       Raise Exception.Create(GetNodeValue(caTenantRegisterResp,'desc'));
except
  on E:Exception do
  begin
    if doc<>nil then
       LogFile.AddLogFile(0,'认证<企业注册>失败xml='+doc.xml+';原因:'+E.Message)
    else
       LogFile.AddLogFile(0,'认证<企业注册>失败xml=无;原因:'+E.Message);
    Raise;
  end;
end;
end;

constructor TCaFactory.Create;
var
  f:TIniFile;
  s:string;
begin
  auto := false;
  LoadRspFactory;
  connectTimeOut := 20000;
  DownModule := true;
  f := TIniFile.Create(ExtractFilePath(ParamStr(0))+'r3.cfg');
  try
    s := f.ReadString('soft','rsp','');
    eseFlag := f.ReadInteger('soft','eseFlag',0);
    if (s<>'') and (s[1]='#') then
       begin
         delete(s,1,1);
         url := DecStr(s,ENC_KEY);
       end
    else
       url := s;
    pubpwd := 'SaRi0+jf';
  finally
    try
      F.Free;
    except
    end;
  end;
  RspFlag := 0;
  timeout:= 2000000;
end;

function TCaFactory.CreateRio(_timeOut:integer=-1): THTTPRIO;
begin
  result := THTTPRIO.Create(nil);
  result.HTTPWebNode.ConnectTimeout := ConnectTimeOut;
  result.HTTPWebNode.ReceiveTimeout := _timeOut;
  result.HTTPWebNode.SendTimeout := _timeOut;
  timeOut := _timeOut;
  if _timeOut>0 then
     result.OnAfterExecute := doAfterExecute
  else
     result.OnAfterExecute := nil;
end;

function TCaFactory.CreateXML(xml: string): IXMLDomDocument;
var
  ErrXml:string;
  w:integer;
begin
  if copy(xml,1,6)='<Err>:' then
     begin
       if pos('Empty document',xml)>0 then
          begin
            Raise Exception.Create('无法连接到RSP认证服务器，请检查网络是否正常.');
          end
       else
           Raise Exception.Create('连接RSP服务失败了，请关闭DEP服务试试...');
     end;
  if Global.debug then LogFile.AddLogFile(0,xml);
  result := CreateOleObject('Microsoft.XMLDOM')  as IXMLDomDocument;
  try
    if xml<>'' then
       begin
         if not result.loadXML(xml) then
            begin
              ErrXml :=xml;
              w := pos('?>',ErrXml);
              delete(ErrXml,1,w+1);
              if not result.loadXML(ErrXml) then Raise Exception.Create('loadxml出错了,xml='+xml);
            end;
       end
    else
       Raise Exception.Create('xml字符串不能为空...');
  except
    result := nil;
    Raise;
  end;
end;

function TCaFactory.Decode(inxml: string;Key:string): string;
var
  gzip:string;
  DecStr:string;
begin
  DecStr := encddecd.DecodeString(inxml);
  if Key='' then
  gzip := DecStr else
  gzip := DecryStr(DecStr,Key);
  GZDecompressString(result,gzip);
end;

destructor TCaFactory.Destroy;
begin
  FreeRspFactory;
  inherited;
end;

function TCaFactory.Encode(inxml: String;Key:string): String;
var
  gzip:String;
  EncStr:String;
begin
  GZCompressString(gzip,inxml);
  if Key='' then
  EncStr := gzip else
  EncStr := EncryStr(gzip,Key);
  result := encddecd.EncodeString(EncStr);
end;

procedure TCaFactory.Setpubpwd(const Value: string);
begin
  Fpubpwd := Value;
end;

procedure TCaFactory.SetSSL(const Value: string);
begin
  FSSL := Value;
end;

procedure TCaFactory.Setsslpwd(const Value: string);
begin
  Fsslpwd := Value;
end;

procedure TCaFactory.SetURL(const Value: string);
begin
  FURL := Value;
end;

function TCaFactory.FindElement(root:IXMLDOMNode;s: string): IXMLDOMNode;
var
  i:integer;
begin
  result := root.firstChild;
  while result<>nil do
    begin
      if result.nodeName=s then exit;
      result := result.nextSibling;
    end;
  result := nil;
end;

function TCaFactory.FindNode(doc: IXMLDomDocument;
  tree: string;CheckExists:boolean=true): IXMLDOMNode;
var
  s:TStringList;
  i:integer;
begin
  s := TStringList.Create;
  try
    s.Delimiter := '\';
    s.DelimitedText := tree;
    result := doc.documentElement;
    for i:=0 to s.Count -1 do
      begin
        if result <>nil then
           result := FindElement(result,s[i]);
      end;
    if CheckExists and (result = nil) then Raise Exception.Create('在文档中没找到结点'+tree);
  finally
    s.Free;
  end;
end;

function TCaFactory.GetNodeValue(root: IXMLDOMNode; s: string): string;
var
  node:IXMLDOMNode;
begin
  node := FindElement(root,s);
  if node=nil then Raise Exception.Create('XML读取出错，原因：'+s+'结点属性没找到.');
  result := Node.text;
end;

function TCaFactory.GetHeader(rio: THTTPRIO): rsp;
begin
  result := rsp(rio.SOAPHeaders.Get(rsp));
  SessionId := result.rspSessionId;
end;

function TCaFactory.SendHeader(rio: THTTPRIO;flag:integer=1):rsp;
begin
  result := rsp.Create;
  result.rspSessionId := SessionId;
  result.encryptType := flag;
  rio.SOAPHeaders.Send(result);
end;

function TCaFactory.CreateRspXML: IXMLDomDocument;
var
  Node:IXMLDOMElement;
begin
  result := CreateOleObject('Microsoft.XMLDOM')  as IXMLDomDocument;
  try
    Node := Result.createElement('message');
    result.documentElement := Node;
    Node.appendChild(Result.createElement('header'));
    FindElement(Node,'header').appendChild(Result.createElement('pub'));
    Node.appendChild(Result.createElement('body'));
  except
    result := nil;
    Raise;
  end;
end;

procedure TCaFactory.SetSessionId(const Value: string);
begin
  FSessionId := Value;
end;

function TCaFactory.CheckRspUpgrade(TENANT_ID, PROD_ID,CurVeraion: string): TCaUpgrade;
var
  inxml:string;
  doc:IXMLDomDocument;
  rio:THTTPRIO;
  caProductCheckUpgradeResp:IXMLDOMNode;
  Node:IXMLDOMNode;
  code:string;
  h,r:rsp;
  OutXml:WideString;
  RioImpl:CaProductWebServiceImpl;
  F:TIniFile;
begin
try
  doc := CreateRspXML;
  Node := doc.createElement('flag');
  Node.text := '1';
  FindNode(doc,'header\pub').appendChild(Node);

  Node := doc.createElement('caProductCheckUpgradeReq');
  FindNode(doc,'body').appendChild(Node);

  Node := doc.createElement('tenantId');
  Node.text := TENANT_ID;
  FindNode(doc,'body\caProductCheckUpgradeReq').appendChild(Node);

  Node := doc.createElement('prodId');
  Node.text := PROD_ID;
  FindNode(doc,'body\caProductCheckUpgradeReq').appendChild(Node);

  Node := doc.createElement('curVersion');
  Node.text := CurVeraion;
  FindNode(doc,'body\caProductCheckUpgradeReq').appendChild(Node);

  inxml := '<?xml version="1.0" encoding="gb2312"?> '+doc.xml;
  if rspHandle>0 then
     doc := CreateXML(rspcheckUpgrade(inxml,URL,1))
  else
  begin
    rio := CreateRio(20000);
    h := SendHeader(rio,1);
    try
      try
        RioImpl := GetCaProductWebServiceImpl(true,URL+'CaProductService?wsdl',rio);
        OutXml := RioImpl.checkUpgrade(Encode(inxml,pubpwd));
        r := GetHeader(rio);
        try
          case r.encryptType of
          2:doc := CreateXML(Decode(OutXml,sslpwd) );
          1:doc := CreateXML(Decode(OutXml,Pubpwd) );
          else doc := CreateXML(Decode(OutXml,''));
          end;
        finally
          r.Free;
        end;
      except
        on E:Exception do
           begin
             if pos('Empty document',E.Message)>0 then
                begin
                  Raise Exception.Create('无法连接到RSP认证服务器，请检查网络是否正常.');
                end
             else
                Raise Exception.Create('连接RSP服务失败了，请关闭DEP服务试试...');
           end;
      end;
    finally
      h.Free;
    end;
  end;
    CheckRecAck(doc);
    caProductCheckUpgradeResp := FindNode(doc,'body\caProductCheckUpgradeResp');
    result.UpGrade := StrtoInt(GetNodeValue(caProductCheckUpgradeResp,'upgradeType'));
    result.URL := GetNodeValue(caProductCheckUpgradeResp,'pkgDownloadUrl');
    result.Version := GetNodeValue(caProductCheckUpgradeResp,'newVersion');
  //写安装目录到临时文件夹
  F := TIniFile.Create(FnSystem.GetWinTmp+'r3.inst');
  try
    if RspFlag=1 then
       F.WriteString('rsp','path',ExtractFileDir(ParamStr(0)))
    else
       F.WriteString('r3','path',ExtractFileDir(ParamStr(0)));
  finally
    try
      F.Free;
    except
    end;
  end;
except
  if doc<>nil then
     LogFile.AddLogFile(0,'升级<版本检测>xml='+doc.xml)
  else
     LogFile.AddLogFile(0,'升级<版本检测>xml=无');
  Raise;
end;
end;

procedure TCaFactory.SetAudited(const Value: boolean);
begin
  FAudited := Value;
end;

function TCaFactory.CreateServiceLine(var ServiceLine:TServiceLine):boolean;
var
  inxml:string;
  doc:IXMLDomDocument;
  rio:THTTPRIO;
  caServiceLineCreateResp:IXMLDOMNode;
  Node:IXMLDOMNode;
  code:string;
  h,r:rsp;
  OutXml:WideString;
begin
try
  AutoCoLogo;
  doc := CreateRspXML;
  Node := doc.createElement('flag');
  Node.text := '1';
  FindNode(doc,'header\pub').appendChild(Node);

  Node := doc.createElement('caServiceLineCreateReq');
  FindNode(doc,'body').appendChild(Node);

  Node := doc.createElement('tenantId');
  Node.text := inttostr(ServiceLine.TENANT_ID);
  FindNode(doc,'body\caServiceLineCreateReq').appendChild(Node);

  Node := doc.createElement('serviceLineName');
  Node.text := ServiceLine.RELATION_NAME;
  FindNode(doc,'body\caServiceLineCreateReq').appendChild(Node);

  Node := doc.createElement('serviceLineSpell');
  Node.text := ServiceLine.RELATION_SPELL;
  FindNode(doc,'body\caServiceLineCreateReq').appendChild(Node);

  Node := doc.createElement('remark');
  Node.text := ServiceLine.REMARK;
  FindNode(doc,'body\caServiceLineCreateReq').appendChild(Node);

  inxml := '<?xml version="1.0" encoding="gb2312"?> '+doc.xml;

  if rspHandle>0 then
     doc := CreateXML(rspcreateServiceLine(inxml,URL,2))
  else
  begin
    rio := CreateRio(20000);
    h := SendHeader(rio,2);
    try
      try
        OutXml := GetCaServiceLineWebServiceImpl(true,URL+'CaServiceLineService?wsdl',rio).createServiceLine(Encode(inxml,sslpwd));
        r := GetHeader(rio);
        try
          case r.encryptType of
          2:doc := CreateXML(Decode(OutXml,sslpwd) );
          1:doc := CreateXML(Decode(OutXml,Pubpwd) );
          else doc := CreateXML(Decode(OutXml,''));
          end;
        finally
          r.Free;
        end;
      except
        on E:Exception do
           begin
             if pos('Empty document',E.Message)>0 then
                begin
                  Raise Exception.Create('无法连接到RSP认证服务器，请检查网络是否正常.');
                end
             else
                Raise Exception.Create('连接RSP服务失败了，请关闭DEP服务试试...');
           end;
      end;
    finally
      h.Free;
    end;
    end;
    CheckRecAck(doc);
    caServiceLineCreateResp := FindNode(doc,'body\caServiceLineCreateResp');
    code := GetNodeValue(caServiceLineCreateResp,'code');
    result := (code='1');
    if result then
       begin
         ServiceLine.RELATION_ID := StrtoInt(GetNodeValue(caServiceLineCreateResp,'serviceLineId'));
       end
    else
       Raise Exception.Create(GetNodeValue(caServiceLineCreateResp,'desc'));
except
  if doc<>nil then
     LogFile.AddLogFile(0,'读取<供应链资料>xml='+doc.xml)
  else
     LogFile.AddLogFile(0,'读取<供应链资料>xml=无');
  Raise;
end;
end;

function TCaFactory.queryServiceLines(tid:integer;List: TList): boolean;
var
  inxml:string;
  doc:IXMLDomDocument;
  rio:THTTPRIO;
  caServiceLineQueryResp:IXMLDOMNode;
  Node:IXMLDOMNode;
  line:PServiceLine;
  h,r:rsp;
  i:integer;
  OutXml:WideString;
begin
try
  AutoCoLogo;
  doc := CreateRspXML;
  Node := doc.createElement('flag');
  Node.text := '1';
  FindNode(doc,'header\pub').appendChild(Node);

  Node := doc.createElement('caServiceLineQueryReq');
  FindNode(doc,'body').appendChild(Node);

  Node := doc.createElement('tenantId');
  Node.text := inttostr(tid);
  FindNode(doc,'body\caServiceLineQueryReq').appendChild(Node);

  inxml := '<?xml version="1.0" encoding="gb2312"?> '+doc.xml;

  if rspHandle>0 then
     doc := CreateXML(rspqueryServiceLines(inxml,URL,2))
  else
  begin
    rio := CreateRio(20000);
    h := SendHeader(rio,2);
    try
      try
        OutXml := GetCaServiceLineWebServiceImpl(true,URL+'CaServiceLineService?wsdl',rio).queryServiceLines(Encode(inxml,sslpwd));
        r := GetHeader(rio);
        try
          case r.encryptType of
          2:doc := CreateXML(Decode(OutXml,sslpwd) );
          1:doc := CreateXML(Decode(OutXml,Pubpwd) );
          else doc := CreateXML(Decode(OutXml,''));
          end;
        finally
          r.Free;
        end;
      except
        on E:Exception do
           begin
             if pos('Empty document',E.Message)>0 then
                begin
                  Raise Exception.Create('无法连接到RSP认证服务器，请检查网络是否正常.');
                end
             else
                Raise Exception.Create('连接RSP服务失败了，请关闭DEP服务试试...');
           end;
      end;
    finally
      h.Free;
    end;
    end;
    CheckRecAck(doc);
    Node := FindNode(doc,'body');
    caServiceLineQueryResp := Node.firstChild;
    while caServiceLineQueryResp<>nil do
       begin
         new(line);
         line^.RELATION_ID := StrtoInt(GetNodeValue(caServiceLineQueryResp,'serviceLineId'));
         line^.RELATION_NAME := GetNodeValue(caServiceLineQueryResp,'serviceLineName');
         line^.RELATION_SPELL := GetNodeValue(caServiceLineQueryResp,'serviceLineSpell');
         line^.REMARK := GetNodeValue(caServiceLineQueryResp,'remark');
         List.Add(line);
         caServiceLineQueryResp := caServiceLineQueryResp.nextSibling;
       end;
except
  if doc<>nil then
     LogFile.AddLogFile(0,'读取<供应链列表>xml='+doc.xml)
  else
     LogFile.AddLogFile(0,'读取<供应链列表>xml=无');
  Raise;
end;
end;

function TCaFactory.applyRelation(supTenantId, serviceLineId, subTenantId,
  relationType: integer): TRelationInfo;
var
  inxml:string;
  doc:IXMLDomDocument;
  rio:THTTPRIO;
  caRelationApplyResp:IXMLDOMNode;
  Node:IXMLDOMNode;
  line:PServiceLine;
  h,r:rsp;
  i:integer;
  code:string;
  OutXml:WideString;
begin
try
  AutoCoLogo;
  doc := CreateRspXML;
  Node := doc.createElement('flag');
  Node.text := '1';
  FindNode(doc,'header\pub').appendChild(Node);

  Node := doc.createElement('caRelationApplyReq');
  FindNode(doc,'body').appendChild(Node);

  Node := doc.createElement('supTenantId');
  Node.text := inttostr(supTenantId);
  FindNode(doc,'body\caRelationApplyReq').appendChild(Node);

  Node := doc.createElement('serviceLineId');
  Node.text := inttostr(serviceLineId);
  FindNode(doc,'body\caRelationApplyReq').appendChild(Node);

  Node := doc.createElement('subTenantId');
  Node.text := inttostr(subTenantId);
  FindNode(doc,'body\caRelationApplyReq').appendChild(Node);

  Node := doc.createElement('relationType');
  Node.text := inttostr(relationType);
  FindNode(doc,'body\caRelationApplyReq').appendChild(Node);

  inxml := '<?xml version="1.0" encoding="gb2312"?> '+doc.xml;

  if rspHandle>0 then
     doc := CreateXML(rspapplyRelation(inxml,URL,2))
  else
  begin
    rio := CreateRio(20000);
    h := SendHeader(rio,2);
    try
      try
        OutXml :=  GetCaServiceLineWebServiceImpl(true,URL+'CaServiceLineService?wsdl',rio).applyRelation(Encode(inxml,sslpwd));
        r := GetHeader(rio);
        try
          case r.encryptType of
          2:doc := CreateXML(Decode(OutXml,sslpwd) );
          1:doc := CreateXML(Decode(OutXml,Pubpwd) );
          else doc := CreateXML(Decode(OutXml,''));
          end;
        finally
          r.Free;
        end;
      except
        on E:Exception do
           begin
             if pos('Empty document',E.Message)>0 then
                begin
                  Raise Exception.Create('无法连接到RSP认证服务器，请检查网络是否正常.');
                end
             else
                Raise Exception.Create('连接RSP服务失败了，请关闭DEP服务试试...');
           end;
      end;
    finally
      h.Free;
    end;
  end;
    CheckRecAck(doc);
    caRelationApplyResp := FindNode(doc,'body\caRelationApplyResp');
    code := GetNodeValue(caRelationApplyResp,'code');
    if StrtoIntDef(code,0) in [1] then //注册成功
       begin
         result.RELATIONS_ID := GetNodeValue(caRelationApplyResp,'relationsId');
         result.RELATION_ID := StrtoInt(GetNodeValue(caRelationApplyResp,'serviceLineId'));
         result.TENANT_ID := StrtoInt(GetNodeValue(caRelationApplyResp,'supTenantId'));
         result.RELATI_ID := StrtoInt(GetNodeValue(caRelationApplyResp,'subTenantId'));
         result.RELATION_TYPE := GetNodeValue(caRelationApplyResp,'relationType');
         result.LEVEL_ID := GetNodeValue(caRelationApplyResp,'levelId');
         result.RELATION_STATUS := GetNodeValue(caRelationApplyResp,'relationStatus');
         result.CREA_DATE := GetNodeValue(caRelationApplyResp,'creaDate');
         result.CHK_DATE := GetNodeValue(caRelationApplyResp,'chkDate');
         result.COMM := GetNodeValue(caRelationApplyResp,'comm');
         result.TIME_STAMP := StrtoInt(GetNodeValue(caRelationApplyResp,'timeStamp'));
       end
    else
       Raise Exception.Create(GetNodeValue(caRelationApplyResp,'desc'));

except
  if doc<>nil then
     LogFile.AddLogFile(0,'申请<供应链申请>xml='+doc.xml)
  else
     LogFile.AddLogFile(0,'申请<供应链申请>xml=无');
  Raise;
end;
end;

function TCaFactory.SyncAll(flag:integer): boolean;
begin
  frmLogo.Show;
  try
    AutoCoLogo;
    if not Audited then Exit;
    frmLogo.ProgressBar1.Max := 11;
    frmLogo.Label1.Caption := '下载企业关系...';
    frmLogo.Label1.Update;
    frmLogo.BringToFront;
    downloadRelations(Global.TENANT_ID,flag);
    frmLogo.Position := 1;
    frmLogo.Label1.Caption := '下载供应链...';
    frmLogo.Label1.Update;
    frmLogo.BringToFront;
    downloadServiceLines(Global.TENANT_ID,flag);
    frmLogo.Position := 2;
    frmLogo.Label1.Caption := '下载企业资料...';
    frmLogo.Label1.Update;
    frmLogo.BringToFront;
    downloadTenants(Global.TENANT_ID,flag);
    if TenantType <> 3 then //零售商不需要下载
    begin
    frmLogo.Position := 3;
    frmLogo.Label1.Caption := '下载商品分类...';
    frmLogo.Label1.Update;
    frmLogo.BringToFront;
    downloadSort(Global.TENANT_ID,flag);
    frmLogo.Position := 4;
    frmLogo.Label1.Caption := '下载计量单位...';
    frmLogo.Label1.Update;
    frmLogo.BringToFront;
    downloadUnit(Global.TENANT_ID,flag);
    frmLogo.Position := 5;
    frmLogo.Label1.Caption := '下载商品资料...';
    frmLogo.Label1.Update;
    frmLogo.BringToFront;
    downloadGoods(Global.TENANT_ID,flag);
    frmLogo.Position := 6;
    frmLogo.Label1.Caption := '下载供应链商品...';
    frmLogo.Label1.Update;
    frmLogo.BringToFront;
    downloadDeployGoods(Global.TENANT_ID,flag);
    frmLogo.Position := 7;
    frmLogo.Label1.Caption := '下载条码信息...';
    frmLogo.Label1.Update;
    frmLogo.BringToFront;
    downloadBarcode(Global.TENANT_ID,flag);
    end;
    frmLogo.Position := 8;
    frmLogo.Label1.Caption := '下载商盟信息...';
    frmLogo.Label1.Update;
    frmLogo.BringToFront;
    downloadUnion(Global.TENANT_ID);
    frmLogo.Position := 9;
    frmLogo.Position := 10;
    frmLogo.Label1.Caption := '下载功能模块...';
    frmLogo.Label1.Update;
    frmLogo.BringToFront;
    downloadCaModule(Global.TENANT_ID,flag);
    frmLogo.Position := 11;
    SetSynTimeStamp('#',TimeStamp,'#');
  finally
    frmLogo.Close;
  end;
end;

function TCaFactory.downloadRelations(TenantId, flag: integer): boolean;
var
  inxml:string;
  doc:IXMLDomDocument;
  rio:THTTPRIO;
  caRelationDownloadResp:IXMLDOMNode;
  Node:IXMLDOMNode;
  line:PServiceLine;
  h,r:rsp;
  i:integer;
  rs:TZQuery;
  Params:TftParamList;
  OutXml:WideString;
begin
  if not CheckRspState then
     begin
       result := true;
       Exit;
     end;
try
  SetTicket;
  doc := CreateRspXML;
  Node := doc.createElement('flag');
  Node.text := inttostr(flag);
  FindNode(doc,'header\pub').appendChild(Node);

  Node := doc.createElement('timeStamp');
  Node.text := inttostr(GetSynTimeStamp('CA_RELATIONS','#'));
  FindNode(doc,'header\pub').appendChild(Node);
  LogFile.AddLogFile(0,'开始下载<供应关系>上次同步时间:'+Node.text+' 本次同步时间:'+inttostr(TimeStamp));

  Node := doc.createElement('downloadReq');
  FindNode(doc,'body').appendChild(Node);

  Node := doc.createElement('tenantId');
  Node.text := inttostr(TenantId);
  FindNode(doc,'body\downloadReq').appendChild(Node);

  inxml := '<?xml version="1.0" encoding="gb2312"?> '+doc.xml;

  if rspHandle>0 then
     doc := CreateXML(rspdownloadRelations(inxml,URL,2))
  else
  begin
    rio := CreateRio(120000);
    h := SendHeader(rio,2);
    try
      try
        OutXml := GetRspDownloadWebServiceImpl(true,URL+'RspDownloadService?wsdl',rio).downloadRelations(Encode(inxml,sslpwd));
        r := GetHeader(rio);
        try
          case r.encryptType of
          2:doc := CreateXML(Decode(OutXml,sslpwd) );
          1:doc := CreateXML(Decode(OutXml,Pubpwd) );
          else doc := CreateXML(Decode(OutXml,''));
          end;
        finally
          r.Free;
        end;
      except
        on E:Exception do
           begin
             if pos('Empty document',E.Message)>0 then
                begin
                  Raise Exception.Create('无法连接到RSP认证服务器，请检查网络是否正常.');
                end
             else
                Raise Exception.Create('连接RSP服务失败了，请关闭DEP服务试试...');
           end;
      end;
    finally
      h.Free;
    end;
    end;
    CheckRecAck(doc);
    Node := FindNode(doc,'body');
    LogFile.AddLogFile(0,'下载<供应关系>打开时长:'+inttostr(GetTicket));
    SetTicket;
    rs := TZQuery.Create(nil);
    try
      rs.Close;
      rs.FieldDefs.Add('RELATIONS_ID',ftstring,36,true);
      rs.FieldDefs.Add('RELATION_ID',ftInteger,0,true);
      rs.FieldDefs.Add('TENANT_ID',ftInteger,0,true);
      rs.FieldDefs.Add('RELATI_ID',ftInteger,0,true);
      rs.FieldDefs.Add('RELATION_TYPE',ftstring,1,true);
      rs.FieldDefs.Add('LEVEL_ID',ftstring,50,true);
      rs.FieldDefs.Add('RELATION_STATUS',ftstring,1,true);
      rs.FieldDefs.Add('CREA_DATE',ftstring,10,true);
      rs.FieldDefs.Add('CHK_DATE',ftstring,10,true);
      rs.FieldDefs.Add('COMM',ftstring,2,true);
      rs.FieldDefs.Add('TIME_STAMP',ftLargeInt,0,true);
      rs.CreateDataSet;
      caRelationDownloadResp := Node.firstChild;
      while caRelationDownloadResp<>nil do
         begin
           rs.Append;
           rs.FieldByName('RELATIONS_ID').AsString := GetNodeValue(caRelationDownloadResp,'relationsId');
           rs.FieldByName('RELATION_ID').AsInteger := StrtoInt(GetNodeValue(caRelationDownloadResp,'serviceLineId'));
           rs.FieldByName('TENANT_ID').AsInteger := StrtoInt(GetNodeValue(caRelationDownloadResp,'supTenantId'));
           rs.FieldByName('RELATI_ID').AsInteger := StrtoInt(GetNodeValue(caRelationDownloadResp,'subTenantId'));
           rs.FieldByName('RELATION_TYPE').AsString := GetNodeValue(caRelationDownloadResp,'relationType');
           rs.FieldByName('LEVEL_ID').AsString := GetNodeValue(caRelationDownloadResp,'levelId');
           rs.FieldByName('RELATION_STATUS').AsString := GetNodeValue(caRelationDownloadResp,'relationStatus');
           rs.FieldByName('CREA_DATE').AsString := GetNodeValue(caRelationDownloadResp,'creaDate');
           rs.FieldByName('CHK_DATE').AsString := GetNodeValue(caRelationDownloadResp,'chkDate');
           rs.FieldByName('COMM').AsString := GetNodeValue(caRelationDownloadResp,'comm');
           TLargeintField(rs.FieldByName('TIME_STAMP')).Value := StrtoInt64(GetNodeValue(caRelationDownloadResp,'timeStamp'));
           rs.Post;
           caRelationDownloadResp := caRelationDownloadResp.nextSibling;
         end;
      if not rs.IsEmpty then
      begin
        Params := TftParamList.Create(nil);
        try
          Params.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
          Params.ParamByName('TABLE_NAME').AsString := 'CA_RELATIONS';
          Params.ParamByName('KEY_FIELDS').AsString := 'TENANT_ID;RELATION_ID;RELATI_ID';
          Params.ParamByName('KEY_FLAG').AsInteger := 1;
          Params.ParamByName('COMM_LOCK').AsString := '1';
          Params.ParamByName('TIME_STAMP').Value := TimeStamp;
          Params.ParamByName('SYN_TIME_STAMP').Value := TimeStamp;
          Params.ParamByName('TIME_STAMP_NOCHG').AsInteger := 0;
          Factor.UpdateBatch(rs,'TSyncSingleTable',Params);
          SetSynTimeStamp('CA_RELATIONS',timeStamp,'#');
        finally
          Params.free;
        end;
      end;
      LogFile.AddLogFile(0,'保存<供应关系>执行时长:'+inttostr(GetTicket)+' 记录数:'+inttostr(rs.RecordCount));
    finally
      rs.Free;
    end;
except
  on E:Exception do
  begin
    if doc<>nil then
       LogFile.AddLogFile(0,'下载<供应关系>xml='+doc.xml+';原因:'+E.Message)
    else
       LogFile.AddLogFile(0,'下载<供应关系>xml=无;原因:'+E.Message);
    Raise;
  end;
end;
end;

function TCaFactory.GetSynTimeStamp(tbName, SHOP_ID: string): int64;
var
  rs:TZQuery;
begin
  if SHOP_ID='' then SHOP_ID:='#';
  rs := TZQuery.Create(nil);
  try
    rs.SQL.Text := 'select TIME_STAMP from SYS_SYNC_CTRL where TENANT_ID=:TENANT_ID and SHOP_ID=:SHOP_ID and TABLE_NAME=:TABLE_NAME';
    rs.ParambyName('TENANT_ID').AsInteger := Global.TENANT_ID;
    rs.ParamByName('SHOP_ID').AsString := SHOP_ID;
    rs.ParamByName('TABLE_NAME').AsString := 'RSP_'+tbName;
    Global.LocalFactory.Open(rs);
    if rs.IsEmpty then result := 0 else result := rs.Fields[0].Value;
  finally
    rs.Free;
  end;
end;

procedure TCaFactory.SetSynTimeStamp(tbName: string; _TimeStamp: int64;
  SHOP_ID: string);
var
  r:integer;
begin
  if SHOP_ID='' then SHOP_ID:='#';
  r := Global.LocalFactory.ExecSQL('update SYS_SYNC_CTRL set TIME_STAMP='+inttostr(_TimeStamp)+' where TENANT_ID='+inttostr(Global.TENANT_ID)+' and SHOP_ID='''+SHOP_ID+''' and TABLE_NAME='''+'RSP_'+tbName+'''');
  if r=0 then
     Global.LocalFactory.ExecSQL('insert into SYS_SYNC_CTRL(TENANT_ID,SHOP_ID,TABLE_NAME,TIME_STAMP) values('+inttostr(Global.TENANT_ID)+','''+SHOP_ID+''','''+'RSP_'+tbName+''','+inttostr(_TimeStamp)+')');
  if Global.RemoteFactory.Connected then
  begin
  r := Global.RemoteFactory.ExecSQL('update SYS_SYNC_CTRL set TIME_STAMP='+inttostr(_TimeStamp)+' where TENANT_ID='+inttostr(Global.TENANT_ID)+' and SHOP_ID='''+SHOP_ID+''' and TABLE_NAME='''+'RSP_'+tbName+'''');
  if r=0 then
     Global.RemoteFactory.ExecSQL('insert into SYS_SYNC_CTRL(TENANT_ID,SHOP_ID,TABLE_NAME,TIME_STAMP) values('+inttostr(Global.TENANT_ID)+','''+SHOP_ID+''','''+'RSP_'+tbName+''','+inttostr(_TimeStamp)+')');
  end;
end;

function TCaFactory.downloadServiceLines(TenantId, flag: integer): boolean;
var
  inxml:string;
  doc:IXMLDomDocument;
  rio:THTTPRIO;
  caServiceLineDownloadResp:IXMLDOMNode;
  Node:IXMLDOMNode;
  line:PServiceLine;
  h,r:rsp;
  i:integer;
  rs:TZQuery;
  Params:TftParamList;
  OutXml:WideString;
begin
  if not CheckRspState then
     begin
       result := true;
       Exit;
     end;
try
  SetTicket;
  doc := CreateRspXML;
  Node := doc.createElement('flag');
  Node.text := inttostr(flag);
  FindNode(doc,'header\pub').appendChild(Node);

  Node := doc.createElement('timeStamp');
  Node.text := inttostr(GetSynTimeStamp('CA_RELATION','#'));
  FindNode(doc,'header\pub').appendChild(Node);
  LogFile.AddLogFile(0,'开始下载<供应链>上次同步时间:'+Node.text+' 本次同步时间:'+inttostr(TimeStamp));

  Node := doc.createElement('downloadReq');
  FindNode(doc,'body').appendChild(Node);

  Node := doc.createElement('tenantId');
  Node.text := inttostr(TenantId);
  FindNode(doc,'body\downloadReq').appendChild(Node);

  inxml := '<?xml version="1.0" encoding="gb2312"?> '+doc.xml;

  if rspHandle>0 then
     doc := CreateXML(rspdownloadServiceLines(inxml,URL,2))
  else
  begin
    rio := CreateRio(120000);
    h := SendHeader(rio,2);
    try
      try
        OutXml := GetRspDownloadWebServiceImpl(true,URL+'RspDownloadService?wsdl',rio).downloadServiceLines(Encode(inxml,sslpwd));
        r := GetHeader(rio);
        try
          case r.encryptType of
          2:doc := CreateXML(Decode(OutXml,sslpwd) );
          1:doc := CreateXML(Decode(OutXml,Pubpwd) );
          else doc := CreateXML(Decode(OutXml,''));
          end;
        finally
          r.Free;
        end;
      except
        on E:Exception do
           begin
             if pos('Empty document',E.Message)>0 then
                begin
                  Raise Exception.Create('无法连接到RSP认证服务器，请检查网络是否正常.');
                end
             else
                Raise Exception.Create('连接RSP服务失败了，请关闭DEP服务试试...');
           end;
      end;
    finally
      h.Free;
    end;
    end;
    CheckRecAck(doc);
    Node := FindNode(doc,'body');
    LogFile.AddLogFile(0,'下载<供应链>打开时长:'+inttostr(GetTicket));
    SetTicket;
    rs := TZQuery.Create(nil);
    try
      rs.Close;
      rs.FieldDefs.Add('RELATION_ID',ftInteger,0,true);
      rs.FieldDefs.Add('TENANT_ID',ftInteger,0,true);
      rs.FieldDefs.Add('RELATION_NAME',ftstring,50,true);
      rs.FieldDefs.Add('RELATION_SPELL',ftstring,50,true);
      rs.FieldDefs.Add('REMARK',ftstring,255,true);
      rs.FieldDefs.Add('CREA_DATE',ftstring,10,true);
      rs.FieldDefs.Add('COMM',ftstring,2,true);
      rs.FieldDefs.Add('TIME_STAMP',ftLargeInt,0,true);
      rs.CreateDataSet;
      caServiceLineDownloadResp := Node.firstChild;
      while caServiceLineDownloadResp<>nil do
         begin
           rs.Append;
           rs.FieldByName('RELATION_ID').AsInteger := StrtoInt(GetNodeValue(caServiceLineDownloadResp,'serviceLineId'));
           rs.FieldByName('TENANT_ID').AsInteger := StrtoInt(GetNodeValue(caServiceLineDownloadResp,'tenantId'));
           rs.FieldByName('RELATION_NAME').AsString := GetNodeValue(caServiceLineDownloadResp,'serviceLineName');
           rs.FieldByName('RELATION_SPELL').AsString := GetNodeValue(caServiceLineDownloadResp,'serviceLineSpell');
           rs.FieldByName('REMARK').AsString := GetNodeValue(caServiceLineDownloadResp,'remark');
           rs.FieldByName('CREA_DATE').AsString := GetNodeValue(caServiceLineDownloadResp,'creaDate');
           rs.FieldByName('COMM').AsString := GetNodeValue(caServiceLineDownloadResp,'comm');
           TLargeintField(rs.FieldByName('TIME_STAMP')).Value := StrtoInt64(GetNodeValue(caServiceLineDownloadResp,'timeStamp'));
           rs.Post;
           caServiceLineDownloadResp := caServiceLineDownloadResp.nextSibling;
         end;
      if not rs.IsEmpty then
      begin
        Params := TftParamList.Create(nil);
        try
          Params.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
          Params.ParamByName('TABLE_NAME').AsString := 'CA_RELATION';
          Params.ParamByName('KEY_FIELDS').AsString := 'RELATION_ID';
          Params.ParamByName('COMM_LOCK').AsString := '1';
          Params.ParamByName('TIME_STAMP').Value := TimeStamp;
          Params.ParamByName('SYN_TIME_STAMP').Value := TimeStamp;
          Params.ParamByName('TIME_STAMP_NOCHG').AsInteger := 0;
          Factor.UpdateBatch(rs,'TSyncSingleTable',Params);
          SetSynTimeStamp('CA_RELATION',timeStamp,'#');
        finally
          Params.free;
        end;
      end;
      LogFile.AddLogFile(0,'保存<供应链>执行时长:'+inttostr(GetTicket)+' 记录数:'+inttostr(rs.RecordCount));
    finally
      rs.Free;
    end;
except
  on E:Exception do
  begin
    if doc<>nil then
       LogFile.AddLogFile(0,'下载<供应链>xml='+doc.xml+';原因:'+E.Message)
    else
       LogFile.AddLogFile(0,'下载<供应链>xml=无;原因:'+E.Message);
    Raise;
  end;
end;
end;

function TCaFactory.downloadTenants(TenantId, flag: integer): boolean;
var
  inxml:string;
  doc:IXMLDomDocument;
  rio:THTTPRIO;
  caTenantDownloadResp:IXMLDOMNode;
  Node:IXMLDOMNode;
  line:PServiceLine;
  h,r:rsp;
  i:integer;
  rs:TZQuery;
  Params:TftParamList;
  OutXml:WideString;
begin
  if not CheckRspState then
     begin
       result := true;
       Exit;
     end;
try
  SetTicket;
  doc := CreateRspXML;
  Node := doc.createElement('flag');
  Node.text := inttostr(flag);
  FindNode(doc,'header\pub').appendChild(Node);

  Node := doc.createElement('timeStamp');
  Node.text := inttostr(GetSynTimeStamp('CA_TENANT','#'));
  FindNode(doc,'header\pub').appendChild(Node);
  LogFile.AddLogFile(0,'开始下载<企业资料>上次同步时间:'+Node.text+' 本次同步时间:'+inttostr(TimeStamp));

  Node := doc.createElement('downloadReq');
  FindNode(doc,'body').appendChild(Node);

  Node := doc.createElement('tenantId');
  Node.text := inttostr(TenantId);
  FindNode(doc,'body\downloadReq').appendChild(Node);

  inxml := '<?xml version="1.0" encoding="gb2312"?> '+doc.xml;

  if rspHandle>0 then
     doc := CreateXML(rspdownloadTenants(inxml,URL,2))
  else
  begin
    rio := CreateRio(120000);
    h := SendHeader(rio,2);
    try
      try
        OutXml := GetRspDownloadWebServiceImpl(true,URL+'RspDownloadService?wsdl',rio).downloadTenants(Encode(inxml,sslpwd));
        r := GetHeader(rio);
        try
          case r.encryptType of
          2:doc := CreateXML(Decode(OutXml,sslpwd) );
          1:doc := CreateXML(Decode(OutXml,Pubpwd) );
          else doc := CreateXML(Decode(OutXml,''));
          end;
        finally
          r.Free;
        end;
      except
        on E:Exception do
           begin
             if pos('Empty document',E.Message)>0 then
                begin
                  Raise Exception.Create('无法连接到RSP认证服务器，请检查网络是否正常.');
                end
             else
                Raise Exception.Create('连接RSP服务失败了，请关闭DEP服务试试...');
           end;
      end;
    finally
      h.Free;
    end;
    end;
    CheckRecAck(doc);
    Node := FindNode(doc,'body');
    LogFile.AddLogFile(0,'下载<企业资料>打开时长:'+inttostr(GetTicket));
    SetTicket;
    rs := TZQuery.Create(nil);
    try
      rs.Close;
      rs.FieldDefs.Add('TENANT_ID',ftInteger,0,true);
      rs.FieldDefs.Add('LOGIN_NAME',ftstring,50,true);
      rs.FieldDefs.Add('LICENSE_CODE',ftstring,50,true);
      rs.FieldDefs.Add('TENANT_NAME',ftstring,50,true);
      rs.FieldDefs.Add('TENANT_TYPE',ftstring,1,true);
      rs.FieldDefs.Add('SHORT_TENANT_NAME',ftstring,50,true);
      rs.FieldDefs.Add('TENANT_SPELL',ftstring,50,true);
      rs.FieldDefs.Add('LEGAL_REPR',ftstring,20,true);
      rs.FieldDefs.Add('LINKMAN',ftstring,20,true);
      rs.FieldDefs.Add('TELEPHONE',ftstring,30,true);
      rs.FieldDefs.Add('FAXES',ftstring,30,true);
      rs.FieldDefs.Add('HOMEPAGE',ftstring,50,true);
      rs.FieldDefs.Add('ADDRESS',ftstring,50,true);
      rs.FieldDefs.Add('QQ',ftstring,50,true);
      rs.FieldDefs.Add('MSN',ftstring,50,true);
      rs.FieldDefs.Add('POSTALCODE',ftstring,6,true);
      rs.FieldDefs.Add('REMARK',ftstring,100,true);
      rs.FieldDefs.Add('PASSWRD',ftstring,100,true);
      rs.FieldDefs.Add('REGION_ID',ftstring,10,true);
      rs.FieldDefs.Add('SRVR_ID',ftstring,10,true);
      rs.FieldDefs.Add('AUDIT_STATUS',ftstring,1,true);
      rs.FieldDefs.Add('PROD_ID',ftstring,10,true);
      rs.FieldDefs.Add('DB_ID',ftInteger,0,true);
      rs.FieldDefs.Add('CREA_DATE',ftstring,10,true);
      rs.FieldDefs.Add('COMM',ftstring,2,true);
      rs.FieldDefs.Add('TIME_STAMP',ftLargeInt,0,true);
      rs.CreateDataSet;
      caTenantDownloadResp := Node.firstChild;
      while caTenantDownloadResp<>nil do
         begin
           rs.Append;
           rs.FieldByName('TENANT_ID').AsInteger := StrtoInt(GetNodeValue(caTenantDownloadResp,'tenantId'));
           rs.FieldByName('LOGIN_NAME').AsString := GetNodeValue(caTenantDownloadResp,'loginName');
           rs.FieldByName('LICENSE_CODE').AsString := GetNodeValue(caTenantDownloadResp,'licenseCode');
           rs.FieldByName('TENANT_NAME').AsString := GetNodeValue(caTenantDownloadResp,'tenantName');
           rs.FieldByName('TENANT_TYPE').AsString := GetNodeValue(caTenantDownloadResp,'tenantType');
           rs.FieldByName('SHORT_TENANT_NAME').AsString := GetNodeValue(caTenantDownloadResp,'shortTenantName');
           rs.FieldByName('TENANT_SPELL').AsString := GetNodeValue(caTenantDownloadResp,'tenantSpell');
           rs.FieldByName('LEGAL_REPR').AsString := GetNodeValue(caTenantDownloadResp,'legalRepr');
           rs.FieldByName('LINKMAN').AsString := GetNodeValue(caTenantDownloadResp,'linkman');
           rs.FieldByName('TELEPHONE').AsString := GetNodeValue(caTenantDownloadResp,'telephone');
           rs.FieldByName('FAXES').AsString := GetNodeValue(caTenantDownloadResp,'faxes');
           rs.FieldByName('HOMEPAGE').AsString := GetNodeValue(caTenantDownloadResp,'homepage');
           rs.FieldByName('ADDRESS').AsString := GetNodeValue(caTenantDownloadResp,'address');
           rs.FieldByName('QQ').AsString := GetNodeValue(caTenantDownloadResp,'qq');
           rs.FieldByName('MSN').AsString := GetNodeValue(caTenantDownloadResp,'msn');
           rs.FieldByName('POSTALCODE').AsString := GetNodeValue(caTenantDownloadResp,'postalcode');
           rs.FieldByName('REMARK').AsString := GetNodeValue(caTenantDownloadResp,'remark');
           rs.FieldByName('PASSWRD').AsString := EncStr(GetNodeValue(caTenantDownloadResp,'passwrd'),ENC_KEY);
           rs.FieldByName('REGION_ID').AsString := GetNodeValue(caTenantDownloadResp,'regionId');
           rs.FieldByName('SRVR_ID').AsString := GetNodeValue(caTenantDownloadResp,'passwrd');
           rs.FieldByName('AUDIT_STATUS').AsString := GetNodeValue(caTenantDownloadResp,'auditStatus');
           rs.FieldByName('PROD_ID').AsString := GetNodeValue(caTenantDownloadResp,'prodId');
           rs.FieldByName('DB_ID').AsString := GetNodeValue(caTenantDownloadResp,'dbId');
           rs.FieldByName('CREA_DATE').AsString := GetNodeValue(caTenantDownloadResp,'creaDate');
           rs.FieldByName('COMM').AsString := GetNodeValue(caTenantDownloadResp,'comm');
           TLargeintField(rs.FieldByName('TIME_STAMP')).Value := StrtoInt64(GetNodeValue(caTenantDownloadResp,'timeStamp'));
           rs.Post;
           caTenantDownloadResp := caTenantDownloadResp.nextSibling;
         end;
      if not rs.IsEmpty then
      begin
        Params := TftParamList.Create(nil);
        try
          Params.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
          Params.ParamByName('TABLE_NAME').AsString := 'CA_TENANT';
          Params.ParamByName('KEY_FIELDS').AsString := 'TENANT_ID';
          Params.ParamByName('COMM_LOCK').AsString := '1';
          Params.ParamByName('TIME_STAMP').Value := TimeStamp;
          Params.ParamByName('SYN_TIME_STAMP').Value := TimeStamp;
          Params.ParamByName('TIME_STAMP_NOCHG').AsInteger := 0;
          Factor.UpdateBatch(rs,'TSyncSingleTable',Params);
          SetSynTimeStamp('CA_TENANT',timeStamp,'#');
        finally
          Params.free;
        end;
      end;
      LogFile.AddLogFile(0,'保存<企业资料>打开时长:'+inttostr(GetTicket)+'  记录数:'+inttostr(rs.RecordCount));
    finally
      rs.Free;
    end;
except
  on E:Exception do
  begin
    if doc<>nil then
       LogFile.AddLogFile(0,'下载<企业资料>xml='+doc.xml+';原因:'+E.Message)
    else
       LogFile.AddLogFile(0,'下载<企业资料>xml=无;原因:'+E.Message);
    Raise;
  end;
end;
end;

function TCaFactory.downloadSort(TenantId, flag: integer): boolean;
var
  inxml:string;
  doc:IXMLDomDocument;
  rio:THTTPRIO;
  pubGoodsSortDownloadResp:IXMLDOMNode;
  Node:IXMLDOMNode;
  line:PServiceLine;
  h,r:rsp;
  i:integer;
  rs:TZQuery;
  Params:TftParamList;
  OutXml:WideString;
begin
  if not CheckRspState then
     begin
       result := true;
       Exit;
     end;
try
  SetTicket;
  doc := CreateRspXML;
  Node := doc.createElement('flag');
  Node.text := inttostr(flag);
  FindNode(doc,'header\pub').appendChild(Node);

  Node := doc.createElement('timeStamp');
  Node.text := inttostr(GetSynTimeStamp('PUB_GOODSSORT','#'));
  FindNode(doc,'header\pub').appendChild(Node);
  LogFile.AddLogFile(0,'开始下载<商品分类>上次同步时间:'+Node.text+' 本次同步时间:'+inttostr(TimeStamp));

  Node := doc.createElement('downloadReq');
  FindNode(doc,'body').appendChild(Node);

  Node := doc.createElement('tenantId');
  Node.text := inttostr(TenantId);
  FindNode(doc,'body\downloadReq').appendChild(Node);

  inxml := '<?xml version="1.0" encoding="gb2312"?> '+doc.xml;

  if rspHandle>0 then
     doc := CreateXML(rspdownloadSort(inxml,URL,2))
  else
  begin
    rio := CreateRio(120000);
    h := SendHeader(rio,2);
    try
      try
        OutXml := GetRspDownloadWebServiceImpl(true,URL+'RspDownloadService?wsdl',rio).downloadSort(Encode(inxml,sslpwd));
        r := GetHeader(rio);
        try
          case r.encryptType of
          2:doc := CreateXML(Decode(OutXml,sslpwd) );
          1:doc := CreateXML(Decode(OutXml,Pubpwd) );
          else doc := CreateXML(Decode(OutXml,''));
          end;
        finally
          r.Free;
        end;
      except
        on E:Exception do
           begin
             if pos('Empty document',E.Message)>0 then
                begin
                  Raise Exception.Create('无法连接到RSP认证服务器，请检查网络是否正常.');
                end
             else
                Raise Exception.Create('连接RSP服务失败了，请关闭DEP服务试试...');
           end;
      end;
    finally
      h.Free;
    end;
    end;
    CheckRecAck(doc);
    Node := FindNode(doc,'body');
    LogFile.AddLogFile(0,'下载<商品分类>打开时长:'+inttostr(GetTicket));
    SetTicket;
    rs := TZQuery.Create(nil);
    try
      rs.Close;
      rs.FieldDefs.Add('SORT_ID',ftstring,36,true);
      rs.FieldDefs.Add('TENANT_ID',ftInteger,0,true);
      rs.FieldDefs.Add('LEVEL_ID',ftstring,20,true);
      rs.FieldDefs.Add('SORT_NAME',ftstring,30,true);
      rs.FieldDefs.Add('SORT_TYPE',ftInteger,0,true);
      rs.FieldDefs.Add('SORT_SPELL',ftstring,30,true);
      rs.FieldDefs.Add('SEQ_NO',ftInteger,0,true);
      rs.FieldDefs.Add('COMM',ftstring,2,true);
      rs.FieldDefs.Add('TIME_STAMP',ftLargeInt,0,true);
      rs.CreateDataSet;
      pubGoodsSortDownloadResp := Node.firstChild;
      while pubGoodsSortDownloadResp<>nil do
         begin
           rs.Append;
           rs.FieldByName('SORT_ID').AsString := GetNodeValue(pubGoodsSortDownloadResp,'sortId');
           rs.FieldByName('TENANT_ID').AsInteger := StrtoInt(GetNodeValue(pubGoodsSortDownloadResp,'tenantId'));
           rs.FieldByName('LEVEL_ID').AsString := GetNodeValue(pubGoodsSortDownloadResp,'levelId');
           rs.FieldByName('SORT_NAME').AsString := GetNodeValue(pubGoodsSortDownloadResp,'sortName');
           rs.FieldByName('SORT_TYPE').AsInteger := StrtoInt(GetNodeValue(pubGoodsSortDownloadResp,'sortType'));
           rs.FieldByName('SORT_SPELL').AsString := GetNodeValue(pubGoodsSortDownloadResp,'sortSpell');
           if GetNodeValue(pubGoodsSortDownloadResp,'seqNo')='' then
           rs.FieldByName('SEQ_NO').AsInteger := 0 else
           rs.FieldByName('SEQ_NO').AsInteger := StrtoInt(GetNodeValue(pubGoodsSortDownloadResp,'seqNo'));
           rs.FieldByName('COMM').AsString := GetNodeValue(pubGoodsSortDownloadResp,'comm');
           TLargeintField(rs.FieldByName('TIME_STAMP')).Value := StrtoInt64(GetNodeValue(pubGoodsSortDownloadResp,'timeStamp'));
           rs.Post;
           pubGoodsSortDownloadResp := pubGoodsSortDownloadResp.nextSibling;
         end;
      if not rs.IsEmpty then
      begin
        Params := TftParamList.Create(nil);
        try
          Params.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
          Params.ParamByName('TABLE_NAME').AsString := 'PUB_GOODSSORT';
          Params.ParamByName('KEY_FIELDS').AsString := 'TENANT_ID;SORT_ID;SORT_TYPE';
          Params.ParamByName('COMM_LOCK').AsString := '1';
          Params.ParamByName('TIME_STAMP').Value := TimeStamp;
          Params.ParamByName('SYN_TIME_STAMP').Value := TimeStamp;
          Params.ParamByName('TIME_STAMP_NOCHG').AsInteger := 0;
          Factor.UpdateBatch(rs,'TSyncSingleTable',Params);
          SetSynTimeStamp('PUB_GOODSSORT',timeStamp,'#');
        finally
          Params.free;
        end;
      end;
      LogFile.AddLogFile(0,'保存<商品分类>执行时长:'+inttostr(GetTicket)+' 记录数:'+inttostr(rs.RecordCount));
    finally
      rs.Free;
    end;
except
  on E:Exception do
  begin
    if doc<>nil then
       LogFile.AddLogFile(0,'下载<商品分类>xml='+doc.xml+';原因:'+E.Message)
    else
       LogFile.AddLogFile(0,'下载<商品分类>xml=无;原因:'+E.Message);
    Raise;
  end;
end;
end;

function TCaFactory.downloadGoods(TenantId, flag: integer): boolean;
var
  inxml:string;
  doc:IXMLDomDocument;
  rio:THTTPRIO;
  pubGoodsDownloadResp:IXMLDOMNode;
  Node:IXMLDOMNode;
  line:PServiceLine;
  h,r:rsp;
  i:integer;
  rs:TZQuery;
  Params:TftParamList;
  OutXml:WideString;
begin
  if not CheckRspState then
     begin
       result := true;
       Exit;
     end;
try
  SetTicket;
  doc := CreateRspXML;
  Node := doc.createElement('flag');
  Node.text := inttostr(flag);
  FindNode(doc,'header\pub').appendChild(Node);

  Node := doc.createElement('timeStamp');
  Node.text := inttostr(GetSynTimeStamp('PUB_GOODSINFO','#'));
  FindNode(doc,'header\pub').appendChild(Node);
  LogFile.AddLogFile(0,'开始下载<商品资料>上次同步时间:'+Node.text+' 本次同步时间:'+inttostr(TimeStamp));

  Node := doc.createElement('downloadReq');
  FindNode(doc,'body').appendChild(Node);

  Node := doc.createElement('tenantId');
  Node.text := inttostr(TenantId);
  FindNode(doc,'body\downloadReq').appendChild(Node);

  inxml := '<?xml version="1.0" encoding="gb2312"?> '+doc.xml;

  if rspHandle>0 then
     doc := CreateXML(rspdownloadGoods(inxml,URL,2))
  else
  begin
    rio := CreateRio(120000);
    h := SendHeader(rio,2);
    try
      try
        OutXml := GetRspDownloadWebServiceImpl(true,URL+'RspDownloadService?wsdl',rio).downloadGoods(Encode(inxml,sslpwd));
        r := GetHeader(rio);
        try
          case r.encryptType of
          2:doc := CreateXML(Decode(OutXml,sslpwd) );
          1:doc := CreateXML(Decode(OutXml,Pubpwd) );
          else doc := CreateXML(Decode(OutXml,''));
          end;
        finally
          r.Free;
        end;
      except
        on E:Exception do
           begin
             if pos('Empty document',E.Message)>0 then
                begin
                  Raise Exception.Create('无法连接到RSP认证服务器，请检查网络是否正常.');
                end
             else
                Raise Exception.Create('连接RSP服务失败了，请关闭DEP服务试试...');
           end;
      end;
    finally
      h.Free;
    end;
    end;
    CheckRecAck(doc);
    Node := FindNode(doc,'body');
    LogFile.AddLogFile(0,'下载<商品资料>打开时长:'+inttostr(GetTicket));
    SetTicket;
    rs := TZQuery.Create(nil);
    try
      rs.Close;
      rs.FieldDefs.Add('GODS_ID',ftstring,36,true);
      rs.FieldDefs.Add('TENANT_ID',ftInteger,0,true);
      rs.FieldDefs.Add('GODS_CODE',ftstring,20,true);
      rs.FieldDefs.Add('GODS_NAME',ftstring,50,true);
      rs.FieldDefs.Add('GODS_SPELL',ftstring,50,true);
      rs.FieldDefs.Add('GODS_TYPE',ftInteger,0,true);
      rs.FieldDefs.Add('SORT_ID1',ftstring,36,true);
      rs.FieldDefs.Add('SORT_ID2',ftstring,36,true);
      rs.FieldDefs.Add('SORT_ID3',ftstring,36,true);
      rs.FieldDefs.Add('SORT_ID4',ftstring,36,true);
      rs.FieldDefs.Add('SORT_ID5',ftstring,36,true);
      rs.FieldDefs.Add('SORT_ID6',ftstring,36,true);
      rs.FieldDefs.Add('SORT_ID7',ftstring,36,true);
      rs.FieldDefs.Add('SORT_ID8',ftstring,36,true);
      rs.FieldDefs.Add('SORT_ID9',ftstring,36,true);
      rs.FieldDefs.Add('SORT_ID10',ftstring,36,true);
      rs.FieldDefs.Add('SORT_ID11',ftstring,36,true);
      rs.FieldDefs.Add('SORT_ID12',ftstring,36,true);
      rs.FieldDefs.Add('SORT_ID13',ftstring,36,true);
      rs.FieldDefs.Add('SORT_ID14',ftstring,36,true);
      rs.FieldDefs.Add('SORT_ID15',ftstring,36,true);
      rs.FieldDefs.Add('SORT_ID16',ftstring,36,true);
      rs.FieldDefs.Add('SORT_ID17',ftstring,36,true);
      rs.FieldDefs.Add('SORT_ID18',ftstring,36,true);
      rs.FieldDefs.Add('SORT_ID19',ftstring,36,true);
      rs.FieldDefs.Add('SORT_ID20',ftstring,36,true);
      rs.FieldDefs.Add('BARCODE',ftstring,30,true);
      rs.FieldDefs.Add('UNIT_ID',ftstring,36,true);
      rs.FieldDefs.Add('CALC_UNITS',ftstring,36,true);
      rs.FieldDefs.Add('SMALL_UNITS',ftstring,36,true);
      rs.FieldDefs.Add('BIG_UNITS',ftstring,36,true);
      rs.FieldDefs.Add('SMALLTO_CALC',ftFloat,0,true);
      rs.FieldDefs.Add('BIGTO_CALC',ftFloat,0,true);
      rs.FieldDefs.Add('NEW_INPRICE',ftFloat,0,true);
      rs.FieldDefs.Add('NEW_OUTPRICE',ftFloat,0,true);
      rs.FieldDefs.Add('NEW_LOWPRICE',ftFloat,0,true);
      rs.FieldDefs.Add('USING_PRICE',ftInteger,0,true);
      rs.FieldDefs.Add('HAS_INTEGRAL',ftInteger,0,true);
      rs.FieldDefs.Add('USING_BATCH_NO',ftInteger,0,true);
      rs.FieldDefs.Add('USING_BARTER',ftInteger,0,true);
      rs.FieldDefs.Add('USING_LOCUS_NO',ftInteger,0,true);
      rs.FieldDefs.Add('BARTER_INTEGRAL',ftInteger,0,true);
      rs.FieldDefs.Add('REMARK',ftstring,2000,true);
      rs.FieldDefs.Add('COMM',ftstring,2,true);
      rs.FieldDefs.Add('TIME_STAMP',ftLargeInt,0,true);
      rs.CreateDataSet;
      pubGoodsDownloadResp := Node.firstChild;
      while pubGoodsDownloadResp<>nil do
         begin
           rs.Append;
           rs.FieldByName('GODS_ID').AsString := GetNodeValue(pubGoodsDownloadResp,'godsId');
           rs.FieldByName('TENANT_ID').AsInteger := StrtoInt(GetNodeValue(pubGoodsDownloadResp,'tenantId'));
           rs.FieldByName('GODS_CODE').AsString := GetNodeValue(pubGoodsDownloadResp,'godsCode');
           rs.FieldByName('GODS_NAME').AsString := GetNodeValue(pubGoodsDownloadResp,'godsName');
           rs.FieldByName('GODS_SPELL').AsString := GetNodeValue(pubGoodsDownloadResp,'godsSpell');
           rs.FieldByName('GODS_TYPE').AsInteger := StrtoInt(GetNodeValue(pubGoodsDownloadResp,'godsType'));
           rs.FieldByName('SORT_ID1').AsString := GetNodeValue(pubGoodsDownloadResp,'sortId1');
           rs.FieldByName('SORT_ID2').AsString := GetNodeValue(pubGoodsDownloadResp,'sortId2');
           rs.FieldByName('SORT_ID3').AsString := GetNodeValue(pubGoodsDownloadResp,'sortId3');
           rs.FieldByName('SORT_ID4').AsString := GetNodeValue(pubGoodsDownloadResp,'sortId4');
           rs.FieldByName('SORT_ID5').AsString := GetNodeValue(pubGoodsDownloadResp,'sortId5');
           rs.FieldByName('SORT_ID6').AsString := GetNodeValue(pubGoodsDownloadResp,'sortId6');
           rs.FieldByName('SORT_ID7').AsString := GetNodeValue(pubGoodsDownloadResp,'sortId7');
           rs.FieldByName('SORT_ID8').AsString := GetNodeValue(pubGoodsDownloadResp,'sortId8');
           rs.FieldByName('SORT_ID9').AsString := GetNodeValue(pubGoodsDownloadResp,'sortId9');
           rs.FieldByName('SORT_ID10').AsString := GetNodeValue(pubGoodsDownloadResp,'sortId10');
           rs.FieldByName('SORT_ID11').AsString := GetNodeValue(pubGoodsDownloadResp,'sortId11');
           rs.FieldByName('SORT_ID12').AsString := GetNodeValue(pubGoodsDownloadResp,'sortId12');
           rs.FieldByName('SORT_ID13').AsString := GetNodeValue(pubGoodsDownloadResp,'sortId13');
           rs.FieldByName('SORT_ID14').AsString := GetNodeValue(pubGoodsDownloadResp,'sortId14');
           rs.FieldByName('SORT_ID15').AsString := GetNodeValue(pubGoodsDownloadResp,'sortId15');
           rs.FieldByName('SORT_ID16').AsString := GetNodeValue(pubGoodsDownloadResp,'sortId16');
           rs.FieldByName('SORT_ID17').AsString := GetNodeValue(pubGoodsDownloadResp,'sortId17');
           rs.FieldByName('SORT_ID18').AsString := GetNodeValue(pubGoodsDownloadResp,'sortId18');
           rs.FieldByName('SORT_ID19').AsString := GetNodeValue(pubGoodsDownloadResp,'sortId19');
           rs.FieldByName('SORT_ID20').AsString := GetNodeValue(pubGoodsDownloadResp,'sortId20');
           rs.FieldByName('BARCODE').AsString := GetNodeValue(pubGoodsDownloadResp,'barcode');
           rs.FieldByName('UNIT_ID').AsString := GetNodeValue(pubGoodsDownloadResp,'unitId');
           rs.FieldByName('CALC_UNITS').AsString := GetNodeValue(pubGoodsDownloadResp,'calcUnits');
           rs.FieldByName('SMALL_UNITS').AsString := GetNodeValue(pubGoodsDownloadResp,'smallUnits');
           rs.FieldByName('BIG_UNITS').AsString := GetNodeValue(pubGoodsDownloadResp,'bigUnits');
           rs.FieldByName('SMALLTO_CALC').AsFloat := StrtoFloatDef(GetNodeValue(pubGoodsDownloadResp,'smalltoCalc'),0);
           rs.FieldByName('BIGTO_CALC').AsFloat := StrtoFloatDef(GetNodeValue(pubGoodsDownloadResp,'bigtoCalc'),0);
           rs.FieldByName('NEW_INPRICE').AsFloat := StrtoFloatDef(GetNodeValue(pubGoodsDownloadResp,'newInprice'),0);
           rs.FieldByName('NEW_OUTPRICE').AsFloat := StrtoFloatDef(GetNodeValue(pubGoodsDownloadResp,'newOutprice'),0);
           rs.FieldByName('NEW_LOWPRICE').AsFloat := StrtoFloatDef(GetNodeValue(pubGoodsDownloadResp,'newLowprice'),0);
           rs.FieldByName('USING_PRICE').AsInteger := StrtoInt(GetNodeValue(pubGoodsDownloadResp,'usingPrice'));
           rs.FieldByName('HAS_INTEGRAL').AsInteger := StrtoInt(GetNodeValue(pubGoodsDownloadResp,'hasIntegral'));
           rs.FieldByName('USING_BATCH_NO').AsInteger := StrtoInt(GetNodeValue(pubGoodsDownloadResp,'usingBatchNo'));
           rs.FieldByName('USING_BARTER').AsInteger := StrtoInt(GetNodeValue(pubGoodsDownloadResp,'usingBarter'));
           rs.FieldByName('USING_LOCUS_NO').AsInteger := StrtoInt(GetNodeValue(pubGoodsDownloadResp,'usingLocusNo'));
           rs.FieldByName('BARTER_INTEGRAL').AsInteger := StrtoInt(GetNodeValue(pubGoodsDownloadResp,'barterIntegral'));
           rs.FieldByName('REMARK').AsString := GetNodeValue(pubGoodsDownloadResp,'remark');
           rs.FieldByName('COMM').AsString := GetNodeValue(pubGoodsDownloadResp,'comm');
           TLargeintField(rs.FieldByName('TIME_STAMP')).Value := StrtoInt64(GetNodeValue(pubGoodsDownloadResp,'timeStamp'));
           rs.Post;
           pubGoodsDownloadResp := pubGoodsDownloadResp.nextSibling;
         end;
      if not rs.IsEmpty then
      begin
        Params := TftParamList.Create(nil);
        try
          Params.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
          Params.ParamByName('TABLE_NAME').AsString := 'PUB_GOODSINFO';
          Params.ParamByName('KEY_FIELDS').AsString := 'TENANT_ID;GODS_ID';
          Params.ParamByName('COMM_LOCK').AsString := '1';
          Params.ParamByName('TIME_STAMP').Value := TimeStamp;
          Params.ParamByName('SYN_TIME_STAMP').Value := TimeStamp;
          Params.ParamByName('TIME_STAMP_NOCHG').AsInteger := 0;
          Factor.UpdateBatch(rs,'TSyncSingleTable',Params);
          SetSynTimeStamp('PUB_GOODSINFO',timeStamp,'#');
        finally
          Params.free;
        end;
      end;
      LogFile.AddLogFile(0,'保存<商品资料>执行时长:'+inttostr(GetTicket)+' 记录数:'+inttostr(rs.RecordCount));
    finally
      rs.Free;
    end;
except
  on E:Exception do
  begin
    if doc<>nil then
       LogFile.AddLogFile(0,'下载<商品资料>xml='+doc.xml+';原因:'+E.Message)
    else
       LogFile.AddLogFile(0,'下载<商品资料>xml=无;原因:'+E.Message);
    Raise;
  end;
end;
end;

function TCaFactory.downloadUnit(TenantId, flag: integer): boolean;
var
  inxml:string;
  doc:IXMLDomDocument;
  rio:THTTPRIO;
  pubGoodsUnitDownloadResp:IXMLDOMNode;
  Node:IXMLDOMNode;
  line:PServiceLine;
  h,r:rsp;
  i:integer;
  rs:TZQuery;
  Params:TftParamList;
  OutXml:WideString;
begin
  if not CheckRspState then
     begin
       result := true;
       Exit;
     end;
try
  SetTicket;
  doc := CreateRspXML;
  Node := doc.createElement('flag');
  Node.text := inttostr(flag);
  FindNode(doc,'header\pub').appendChild(Node);

  Node := doc.createElement('timeStamp');
  Node.text := inttostr(GetSynTimeStamp('PUB_MEAUNITS','#'));
  FindNode(doc,'header\pub').appendChild(Node);
  LogFile.AddLogFile(0,'开始下载<商品单位>上次同步时间:'+Node.text+' 本次同步时间:'+inttostr(TimeStamp));

  Node := doc.createElement('downloadReq');
  FindNode(doc,'body').appendChild(Node);

  Node := doc.createElement('tenantId');
  Node.text := inttostr(TenantId);
  FindNode(doc,'body\downloadReq').appendChild(Node);

  inxml := '<?xml version="1.0" encoding="gb2312"?> '+doc.xml;

  if rspHandle>0 then
     doc := CreateXML(rspdownloadUnit(inxml,URL,2))
  else
  begin
    rio := CreateRio(120000);
    h := SendHeader(rio,2);
    try
      try
        OutXml := GetRspDownloadWebServiceImpl(true,URL+'RspDownloadService?wsdl',rio).downloadUnit(Encode(inxml,sslpwd));
        r := GetHeader(rio);
        try
          case r.encryptType of
          2:doc := CreateXML(Decode(OutXml,sslpwd) );
          1:doc := CreateXML(Decode(OutXml,Pubpwd) );
          else doc := CreateXML(Decode(OutXml,''));
          end;
        finally
          r.Free;
        end;
      except
        on E:Exception do
           begin
             if pos('Empty document',E.Message)>0 then
                begin
                  Raise Exception.Create('无法连接到RSP认证服务器，请检查网络是否正常.');
                end
             else
                Raise Exception.Create('连接RSP服务失败了，请关闭DEP服务试试...');
           end;
      end;
    finally
      h.Free;
    end;
    end;
    CheckRecAck(doc);
    Node := FindNode(doc,'body');
    LogFile.AddLogFile(0,'下载<计量单位>打开时长:'+inttostr(GetTicket));
    SetTicket;
    rs := TZQuery.Create(nil);
    try
      rs.Close;
      rs.FieldDefs.Add('UNIT_ID',ftstring,36,true);
      rs.FieldDefs.Add('TENANT_ID',ftInteger,0,true);
      rs.FieldDefs.Add('UNIT_NAME',ftstring,30,true);
      rs.FieldDefs.Add('UNIT_SPELL',ftstring,30,true);
      rs.FieldDefs.Add('SEQ_NO',ftInteger,0,true);
      rs.FieldDefs.Add('COMM',ftstring,2,true);
      rs.FieldDefs.Add('TIME_STAMP',ftLargeInt,0,true);
      rs.CreateDataSet;
      pubGoodsUnitDownloadResp := Node.firstChild;
      while pubGoodsUnitDownloadResp<>nil do
         begin
           rs.Append;
           rs.FieldByName('UNIT_ID').AsString := GetNodeValue(pubGoodsUnitDownloadResp,'unitId');
           rs.FieldByName('TENANT_ID').AsInteger := StrtoInt(GetNodeValue(pubGoodsUnitDownloadResp,'tenantId'));
           rs.FieldByName('UNIT_NAME').AsString := GetNodeValue(pubGoodsUnitDownloadResp,'unitName');
           rs.FieldByName('UNIT_SPELL').AsString := GetNodeValue(pubGoodsUnitDownloadResp,'unitSpell');
           if GetNodeValue(pubGoodsUnitDownloadResp,'seqNo')='' then
           rs.FieldByName('SEQ_NO').AsInteger := 0 else
           rs.FieldByName('SEQ_NO').AsInteger := StrtoInt(GetNodeValue(pubGoodsUnitDownloadResp,'seqNo'));
           rs.FieldByName('COMM').AsString := GetNodeValue(pubGoodsUnitDownloadResp,'comm');
           TLargeintField(rs.FieldByName('TIME_STAMP')).Value := StrtoInt64(GetNodeValue(pubGoodsUnitDownloadResp,'timeStamp'));
           rs.Post;
           pubGoodsUnitDownloadResp := pubGoodsUnitDownloadResp.nextSibling;
         end;
      if not rs.IsEmpty then
      begin
        Params := TftParamList.Create(nil);
        try
          Params.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
          Params.ParamByName('TABLE_NAME').AsString := 'PUB_MEAUNITS';
          Params.ParamByName('KEY_FIELDS').AsString := 'TENANT_ID;UNIT_ID';
          Params.ParamByName('COMM_LOCK').AsString := '1';
          Params.ParamByName('TIME_STAMP').Value := TimeStamp;
          Params.ParamByName('SYN_TIME_STAMP').Value := TimeStamp;
          Params.ParamByName('TIME_STAMP_NOCHG').AsInteger := 0;
          Factor.UpdateBatch(rs,'TSyncSingleTable',Params);
          SetSynTimeStamp('PUB_MEAUNITS',timeStamp,'#');
        finally
          Params.free;
        end;
      end;
      LogFile.AddLogFile(0,'保存<计量单位>执行时长:'+inttostr(GetTicket)+' 记录数:'+inttostr(rs.RecordCount));
    finally
      rs.Free;
    end;
except
  on E:Exception do
  begin
    if doc<>nil then
       LogFile.AddLogFile(0,'下载<商品单位>失败xml='+doc.xml+';原因:'+E.Message)
    else
       LogFile.AddLogFile(0,'下载<商品单位>失败xml=无;原因:'+E.Message);
    Raise;
  end;
end;
end;

function TCaFactory.downloadDeployGoods(TenantId, flag: integer): boolean;
var
  inxml:string;
  doc:IXMLDomDocument;
  rio:THTTPRIO;
  pubDeployGoodsDownloadResp:IXMLDOMNode;
  Node:IXMLDOMNode;
  line:PServiceLine;
  h,r:rsp;
  i:integer;
  rs:TZQuery;
  Params:TftParamList;
  OutXml:WideString;
begin
  if not CheckRspState then
     begin
       result := true;
       Exit;
     end;
try
  SetTicket;
  doc := CreateRspXML;
  Node := doc.createElement('flag');
  Node.text := inttostr(flag);
  FindNode(doc,'header\pub').appendChild(Node);

  Node := doc.createElement('timeStamp');
  Node.text := inttostr(GetSynTimeStamp('PUB_GOODS_RELATION','#'));
  FindNode(doc,'header\pub').appendChild(Node);
  LogFile.AddLogFile(0,'开始下载<供应链商品>上次同步时间:'+Node.text+' 本次同步时间:'+inttostr(TimeStamp));

  Node := doc.createElement('downloadReq');
  FindNode(doc,'body').appendChild(Node);

  Node := doc.createElement('tenantId');
  Node.text := inttostr(TenantId);
  FindNode(doc,'body\downloadReq').appendChild(Node);

  inxml := '<?xml version="1.0" encoding="gb2312"?> '+doc.xml;

  if rspHandle>0 then
     doc := CreateXML(rspdownloadDeployGoods(inxml,URL,2))
  else
  begin
    rio := CreateRio(120000);
    h := SendHeader(rio,2);
    try
      try
        OutXml := GetRspDownloadWebServiceImpl(true,URL+'RspDownloadService?wsdl',rio).downloadDeployGoods(Encode(inxml,sslpwd));
        r := GetHeader(rio);
        try
          case r.encryptType of
          2:doc := CreateXML(Decode(OutXml,sslpwd) );
          1:doc := CreateXML(Decode(OutXml,Pubpwd) );
          else doc := CreateXML(Decode(OutXml,''));
          end;
        finally
          r.Free;
        end;
      except
        on E:Exception do
           begin
             if pos('Empty document',E.Message)>0 then
                begin
                  Raise Exception.Create('无法连接到RSP认证服务器，请检查网络是否正常.');
                end
             else
                Raise Exception.Create('连接RSP服务失败了，请关闭DEP服务试试...');
           end;
      end;
    finally
      h.Free;
    end;
    end;
    CheckRecAck(doc);
    Node := FindNode(doc,'body');
    LogFile.AddLogFile(0,'下载<供应链商品>打开时长:'+inttostr(GetTicket));
    SetTicket;
    rs := TZQuery.Create(nil);
    try
      rs.Close;
      rs.FieldDefs.Add('ROWS_ID',ftstring,36,true);
      rs.FieldDefs.Add('RELATION_ID',ftInteger,0,true);
      rs.FieldDefs.Add('GODS_ID',ftstring,36,true);
      rs.FieldDefs.Add('SECOND_ID',ftstring,36,true);
      rs.FieldDefs.Add('TENANT_ID',ftInteger,0,true);
      rs.FieldDefs.Add('GODS_CODE',ftstring,20,true);
      rs.FieldDefs.Add('GODS_NAME',ftstring,50,true);
      rs.FieldDefs.Add('GODS_SPELL',ftstring,50,true);
      rs.FieldDefs.Add('SORT_ID1',ftstring,36,true);
      rs.FieldDefs.Add('SORT_ID2',ftstring,36,true);
      rs.FieldDefs.Add('SORT_ID3',ftstring,36,true);
      rs.FieldDefs.Add('SORT_ID4',ftstring,36,true);
      rs.FieldDefs.Add('SORT_ID5',ftstring,36,true);
      rs.FieldDefs.Add('SORT_ID6',ftstring,36,true);
      rs.FieldDefs.Add('SORT_ID7',ftstring,36,true);
      rs.FieldDefs.Add('SORT_ID8',ftstring,36,true);
      rs.FieldDefs.Add('SORT_ID9',ftstring,36,true);
      rs.FieldDefs.Add('SORT_ID10',ftstring,36,true);
      rs.FieldDefs.Add('SORT_ID11',ftstring,36,true);
      rs.FieldDefs.Add('SORT_ID12',ftstring,36,true);
      rs.FieldDefs.Add('SORT_ID13',ftstring,36,true);
      rs.FieldDefs.Add('SORT_ID14',ftstring,36,true);
      rs.FieldDefs.Add('SORT_ID15',ftstring,36,true);
      rs.FieldDefs.Add('SORT_ID16',ftstring,36,true);
      rs.FieldDefs.Add('SORT_ID17',ftstring,36,true);
      rs.FieldDefs.Add('SORT_ID18',ftstring,36,true);
      rs.FieldDefs.Add('SORT_ID19',ftstring,36,true);
      rs.FieldDefs.Add('SORT_ID20',ftstring,36,true);
      rs.FieldDefs.Add('NEW_INPRICE',ftFloat,0,true);
      rs.FieldDefs.Add('NEW_OUTPRICE',ftFloat,0,true);
      rs.FieldDefs.Add('NEW_LOWPRICE',ftFloat,0,true);
      rs.FieldDefs.Add('USING_PRICE',ftInteger,0,true);
      rs.FieldDefs.Add('HAS_INTEGRAL',ftInteger,0,true);
      rs.FieldDefs.Add('USING_BATCH_NO',ftInteger,0,true);
      rs.FieldDefs.Add('USING_BARTER',ftInteger,0,true);
      rs.FieldDefs.Add('USING_LOCUS_NO',ftInteger,0,true);
      rs.FieldDefs.Add('BARTER_INTEGRAL',ftInteger,0,true);
      rs.FieldDefs.Add('COMM',ftstring,2,true);
      rs.FieldDefs.Add('TIME_STAMP',ftLargeInt,0,true);
      rs.CreateDataSet;
      pubDeployGoodsDownloadResp := Node.firstChild;
      while pubDeployGoodsDownloadResp<>nil do
         begin
           rs.Append;
           rs.FieldByName('ROWS_ID').AsString := GetNodeValue(pubDeployGoodsDownloadResp,'rowsId');
           rs.FieldByName('RELATION_ID').AsInteger := StrtoInt(GetNodeValue(pubDeployGoodsDownloadResp,'relationId'));
           rs.FieldByName('SECOND_ID').AsString := GetNodeValue(pubDeployGoodsDownloadResp,'secondId');
           rs.FieldByName('GODS_ID').AsString := GetNodeValue(pubDeployGoodsDownloadResp,'godsId');
           rs.FieldByName('TENANT_ID').AsInteger := StrtoInt(GetNodeValue(pubDeployGoodsDownloadResp,'tenantId'));
           rs.FieldByName('GODS_CODE').AsString := GetNodeValue(pubDeployGoodsDownloadResp,'godsCode');
           if rs.FieldByName('GODS_CODE').AsString='' then rs.FieldByName('GODS_CODE').Value := null;
           rs.FieldByName('GODS_NAME').AsString := GetNodeValue(pubDeployGoodsDownloadResp,'godsName');
           if rs.FieldByName('GODS_NAME').AsString='' then rs.FieldByName('GODS_NAME').Value := null;
           rs.FieldByName('GODS_SPELL').AsString := GetNodeValue(pubDeployGoodsDownloadResp,'godsSpell');
           if rs.FieldByName('GODS_SPELL').AsString='' then rs.FieldByName('GODS_SPELL').Value := null;
           rs.FieldByName('SORT_ID1').AsString := GetNodeValue(pubDeployGoodsDownloadResp,'sortId1');
           if rs.FieldByName('SORT_ID1').AsString='' then rs.FieldByName('SORT_ID1').Value := null;
           rs.FieldByName('SORT_ID2').AsString := GetNodeValue(pubDeployGoodsDownloadResp,'sortId2');
           if rs.FieldByName('SORT_ID2').AsString='' then rs.FieldByName('SORT_ID2').Value := null;
           rs.FieldByName('SORT_ID3').AsString := GetNodeValue(pubDeployGoodsDownloadResp,'sortId3');
           if rs.FieldByName('SORT_ID3').AsString='' then rs.FieldByName('SORT_ID3').Value := null;
           rs.FieldByName('SORT_ID4').AsString := GetNodeValue(pubDeployGoodsDownloadResp,'sortId4');
           if rs.FieldByName('SORT_ID4').AsString='' then rs.FieldByName('SORT_ID4').Value := null;
           rs.FieldByName('SORT_ID5').AsString := GetNodeValue(pubDeployGoodsDownloadResp,'sortId5');
           if rs.FieldByName('SORT_ID5').AsString='' then rs.FieldByName('SORT_ID5').Value := null;
           rs.FieldByName('SORT_ID6').AsString := GetNodeValue(pubDeployGoodsDownloadResp,'sortId6');
           if rs.FieldByName('SORT_ID6').AsString='' then rs.FieldByName('SORT_ID6').Value := null;
           rs.FieldByName('SORT_ID7').AsString := GetNodeValue(pubDeployGoodsDownloadResp,'sortId7');
           if rs.FieldByName('SORT_ID7').AsString='' then rs.FieldByName('SORT_ID7').Value := null;
           rs.FieldByName('SORT_ID8').AsString := GetNodeValue(pubDeployGoodsDownloadResp,'sortId8');
           if rs.FieldByName('SORT_ID8').AsString='' then rs.FieldByName('SORT_ID8').Value := null;
           rs.FieldByName('SORT_ID9').AsString := GetNodeValue(pubDeployGoodsDownloadResp,'sortId9');
           if rs.FieldByName('SORT_ID9').AsString='' then rs.FieldByName('SORT_ID9').Value := null;
           rs.FieldByName('SORT_ID10').AsString := GetNodeValue(pubDeployGoodsDownloadResp,'sortId10');
           if rs.FieldByName('SORT_ID10').AsString='' then rs.FieldByName('SORT_ID10').Value := null;
           rs.FieldByName('SORT_ID11').AsString := GetNodeValue(pubDeployGoodsDownloadResp,'sortId11');
           if rs.FieldByName('SORT_ID11').AsString='' then rs.FieldByName('SORT_ID11').Value := null;
           rs.FieldByName('SORT_ID12').AsString := GetNodeValue(pubDeployGoodsDownloadResp,'sortId12');
           if rs.FieldByName('SORT_ID12').AsString='' then rs.FieldByName('SORT_ID12').Value := null;
           rs.FieldByName('SORT_ID13').AsString := GetNodeValue(pubDeployGoodsDownloadResp,'sortId13');
           if rs.FieldByName('SORT_ID13').AsString='' then rs.FieldByName('SORT_ID13').Value := null;
           rs.FieldByName('SORT_ID14').AsString := GetNodeValue(pubDeployGoodsDownloadResp,'sortId14');
           if rs.FieldByName('SORT_ID14').AsString='' then rs.FieldByName('SORT_ID14').Value := null;
           rs.FieldByName('SORT_ID15').AsString := GetNodeValue(pubDeployGoodsDownloadResp,'sortId15');
           if rs.FieldByName('SORT_ID15').AsString='' then rs.FieldByName('SORT_ID15').Value := null;
           rs.FieldByName('SORT_ID16').AsString := GetNodeValue(pubDeployGoodsDownloadResp,'sortId16');
           if rs.FieldByName('SORT_ID16').AsString='' then rs.FieldByName('SORT_ID16').Value := null;
           rs.FieldByName('SORT_ID17').AsString := GetNodeValue(pubDeployGoodsDownloadResp,'sortId17');
           if rs.FieldByName('SORT_ID17').AsString='' then rs.FieldByName('SORT_ID17').Value := null;
           rs.FieldByName('SORT_ID18').AsString := GetNodeValue(pubDeployGoodsDownloadResp,'sortId18');
           if rs.FieldByName('SORT_ID18').AsString='' then rs.FieldByName('SORT_ID18').Value := null;
           rs.FieldByName('SORT_ID19').AsString := GetNodeValue(pubDeployGoodsDownloadResp,'sortId19');
           if rs.FieldByName('SORT_ID19').AsString='' then rs.FieldByName('SORT_ID19').Value := null;
           rs.FieldByName('SORT_ID20').AsString := GetNodeValue(pubDeployGoodsDownloadResp,'sortId20');
           if rs.FieldByName('SORT_ID20').AsString='' then rs.FieldByName('SORT_ID20').Value := null;
           if GetNodeValue(pubDeployGoodsDownloadResp,'newInprice')='' then
              rs.FieldByName('NEW_INPRICE').Value := null
           else
              rs.FieldByName('NEW_INPRICE').AsFloat := StrtoFloatDef(GetNodeValue(pubDeployGoodsDownloadResp,'newInprice'),0);
           if GetNodeValue(pubDeployGoodsDownloadResp,'newOutprice')='' then
              rs.FieldByName('NEW_OUTPRICE').Value := null
           else
              rs.FieldByName('NEW_OUTPRICE').AsFloat := StrtoFloatDef(GetNodeValue(pubDeployGoodsDownloadResp,'newOutprice'),0);
           if GetNodeValue(pubDeployGoodsDownloadResp,'newLowprice')='' then
              rs.FieldByName('NEW_LOWPRICE').Value := null
           else
              rs.FieldByName('NEW_LOWPRICE').AsFloat := StrtoFloatDef(GetNodeValue(pubDeployGoodsDownloadResp,'newLowprice'),0);
           if GetNodeValue(pubDeployGoodsDownloadResp,'usingPrice')='' then
              rs.FieldByName('USING_PRICE').Value := null
           else
              rs.FieldByName('USING_PRICE').AsInteger := StrtoInt(GetNodeValue(pubDeployGoodsDownloadResp,'usingPrice'));
           if GetNodeValue(pubDeployGoodsDownloadResp,'hasIntegral')='' then
              rs.FieldByName('HAS_INTEGRAL').Value := null
           else
              rs.FieldByName('HAS_INTEGRAL').AsInteger := StrtoInt(GetNodeValue(pubDeployGoodsDownloadResp,'hasIntegral'));
           if GetNodeValue(pubDeployGoodsDownloadResp,'usingBatchNo')='' then
              rs.FieldByName('USING_BATCH_NO').Value := null
           else
              rs.FieldByName('USING_BATCH_NO').AsInteger := StrtoInt(GetNodeValue(pubDeployGoodsDownloadResp,'usingBatchNo'));
           if GetNodeValue(pubDeployGoodsDownloadResp,'usingBarter')='' then
              rs.FieldByName('USING_BARTER').Value := null
           else
              rs.FieldByName('USING_BARTER').AsInteger := StrtoInt(GetNodeValue(pubDeployGoodsDownloadResp,'usingBarter'));
           if GetNodeValue(pubDeployGoodsDownloadResp,'usingLocusNo')='' then
              rs.FieldByName('USING_LOCUS_NO').Value := null
           else
              rs.FieldByName('USING_LOCUS_NO').AsInteger := StrtoInt(GetNodeValue(pubDeployGoodsDownloadResp,'usingLocusNo'));
           if GetNodeValue(pubDeployGoodsDownloadResp,'barterIntegral')='' then
              rs.FieldByName('BARTER_INTEGRAL').Value := null
           else
              rs.FieldByName('BARTER_INTEGRAL').AsInteger := StrtoInt(GetNodeValue(pubDeployGoodsDownloadResp,'barterIntegral'));
           rs.FieldByName('COMM').AsString := GetNodeValue(pubDeployGoodsDownloadResp,'comm');
           TLargeintField(rs.FieldByName('TIME_STAMP')).Value := StrtoInt64(GetNodeValue(pubDeployGoodsDownloadResp,'timeStamp'));
           rs.Post;
           pubDeployGoodsDownloadResp := pubDeployGoodsDownloadResp.nextSibling;
         end;
      if not rs.IsEmpty then
      begin
        Params := TftParamList.Create(nil);
        try
          Params.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
          Params.ParamByName('TABLE_NAME').AsString := 'PUB_GOODS_RELATION';
          Params.ParamByName('KEY_FIELDS').AsString := 'TENANT_ID;GODS_ID;RELATION_ID';
          Params.ParamByName('KEY_FLAG').AsInteger := 1;
          Params.ParamByName('COMM_LOCK').AsString := '1';
          Params.ParamByName('TIME_STAMP').Value := TimeStamp;
          Params.ParamByName('SYN_TIME_STAMP').Value := TimeStamp;
          Params.ParamByName('TIME_STAMP_NOCHG').AsInteger := 0;
          Factor.UpdateBatch(rs,'TSyncSingleTable',Params);
          SetSynTimeStamp('PUB_GOODS_RELATION',timeStamp,'#');
        finally
          Params.free;
        end;
      end;
      LogFile.AddLogFile(0,'保存<供应链商品>执行时长:'+inttostr(GetTicket)+' 记录数:'+inttostr(rs.RecordCount));
    finally
      rs.Free;
    end;
except
  on E:Exception do
  begin
    if doc<>nil then
       LogFile.AddLogFile(0,'下载<商品分类>xml='+doc.xml+';原因:'+E.Message)
    else
       LogFile.AddLogFile(0,'下载<商品分类>xml=无;原因:'+E.Message);
    Raise;
  end;
end;
end;

function TCaFactory.downloadBarcode(TenantId, flag: integer): boolean;
var
  inxml:string;
  doc:IXMLDomDocument;
  rio:THTTPRIO;
  pubBarcodeDownloadResp:IXMLDOMNode;
  Node:IXMLDOMNode;
  line:PServiceLine;
  h,r:rsp;
  i:integer;
  rs:TZQuery;
  Params:TftParamList;
  OutXml:WideString;
begin
  if not CheckRspState then
     begin
       result := true;
       Exit;
     end;
try
  SetTicket;
  doc := CreateRspXML;
  Node := doc.createElement('flag');
  Node.text := inttostr(flag);
  FindNode(doc,'header\pub').appendChild(Node);

  Node := doc.createElement('timeStamp');
  Node.text := inttostr(GetSynTimeStamp('PUB_BARCODE','#'));
  FindNode(doc,'header\pub').appendChild(Node);
  LogFile.AddLogFile(0,'开始下载<商品条码>上次同步时间:'+Node.text+' 本次同步时间:'+inttostr(TimeStamp));

  Node := doc.createElement('downloadReq');
  FindNode(doc,'body').appendChild(Node);

  Node := doc.createElement('tenantId');
  Node.text := inttostr(TenantId);
  FindNode(doc,'body\downloadReq').appendChild(Node);

  inxml := '<?xml version="1.0" encoding="gb2312"?> '+doc.xml;

  if rspHandle>0 then
     doc := CreateXML(rspdownloadBarcode(inxml,URL,2))
  else
  begin
    rio := CreateRio(120000);
    h := SendHeader(rio,2);
    try
      try
        OutXml := GetRspDownloadWebServiceImpl(true,URL+'RspDownloadService?wsdl',rio).downloadBarcode(Encode(inxml,sslpwd));
        r := GetHeader(rio);
        try
          case r.encryptType of
          2:doc := CreateXML(Decode(OutXml,sslpwd) );
          1:doc := CreateXML(Decode(OutXml,Pubpwd) );
          else doc := CreateXML(Decode(OutXml,''));
          end;
        finally
          r.Free;
        end;
      except
        on E:Exception do
           begin
             if pos('Empty document',E.Message)>0 then
                begin
                  Raise Exception.Create('无法连接到RSP认证服务器，请检查网络是否正常.');
                end
             else
                Raise Exception.Create('连接RSP服务失败了，请关闭DEP服务试试...');
           end;
      end;
    finally
      h.Free;
    end;
    end;
    CheckRecAck(doc);
    Node := FindNode(doc,'body');
    LogFile.AddLogFile(0,'下载<商品条码>打开时长:'+inttostr(GetTicket));
    SetTicket;
    rs := TZQuery.Create(nil);
    try
      rs.Close;
      rs.FieldDefs.Add('ROWS_ID',ftstring,36,true);
      rs.FieldDefs.Add('GODS_ID',ftstring,36,true);
      rs.FieldDefs.Add('TENANT_ID',ftInteger,0,true);
      rs.FieldDefs.Add('PROPERTY_01',ftstring,36,true);
      rs.FieldDefs.Add('PROPERTY_02',ftstring,36,true);
      rs.FieldDefs.Add('UNIT_ID',ftstring,36,true);
      rs.FieldDefs.Add('BARCODE_TYPE',ftstring,1,true);
      rs.FieldDefs.Add('BATCH_NO',ftstring,36,true);
      rs.FieldDefs.Add('BARCODE',ftstring,30,true);
      rs.FieldDefs.Add('COMM',ftstring,2,true);
      rs.FieldDefs.Add('TIME_STAMP',ftLargeInt,0,true);
      rs.CreateDataSet;
      pubBarcodeDownloadResp := Node.firstChild;
      while pubBarcodeDownloadResp<>nil do
         begin
           rs.Append;
           rs.FieldByName('ROWS_ID').AsString := GetNodeValue(pubBarcodeDownloadResp,'rowsId');
           rs.FieldByName('GODS_ID').AsString := GetNodeValue(pubBarcodeDownloadResp,'godsId');
           rs.FieldByName('TENANT_ID').AsInteger := StrtoInt(GetNodeValue(pubBarcodeDownloadResp,'tenantId'));
           rs.FieldByName('PROPERTY_01').AsString := GetNodeValue(pubBarcodeDownloadResp,'property01');
           rs.FieldByName('PROPERTY_02').AsString := GetNodeValue(pubBarcodeDownloadResp,'property02');
           rs.FieldByName('UNIT_ID').AsString := GetNodeValue(pubBarcodeDownloadResp,'unitId');
           rs.FieldByName('BARCODE_TYPE').AsInteger := StrtoInt(GetNodeValue(pubBarcodeDownloadResp,'barcodeType'));
           rs.FieldByName('BATCH_NO').AsString := GetNodeValue(pubBarcodeDownloadResp,'batchNo');
           rs.FieldByName('BARCODE').AsString := GetNodeValue(pubBarcodeDownloadResp,'barcode');
           rs.FieldByName('COMM').AsString := GetNodeValue(pubBarcodeDownloadResp,'comm');
           TLargeintField(rs.FieldByName('TIME_STAMP')).Value := StrtoInt64(GetNodeValue(pubBarcodeDownloadResp,'timeStamp'));
           rs.Post;
           pubBarcodeDownloadResp := pubBarcodeDownloadResp.nextSibling;
         end;
      if not rs.IsEmpty then
      begin
        Params := TftParamList.Create(nil);
        try
          Params.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
          Params.ParamByName('TABLE_NAME').AsString := 'PUB_BARCODE';
          Params.ParamByName('KEY_FIELDS').AsString := 'TENANT_ID;GODS_ID;UNIT_ID;PROPERTY_01;PROPERTY_02;BARCODE_TYPE';
          Params.ParamByName('KEY_FLAG').AsInteger := 1;
          Params.ParamByName('COMM_LOCK').AsString := '1';
          Params.ParamByName('TIME_STAMP').Value := TimeStamp;
          Params.ParamByName('SYN_TIME_STAMP').Value := TimeStamp;
          Params.ParamByName('TIME_STAMP_NOCHG').AsInteger := 0;
          Factor.UpdateBatch(rs,'TSyncPubBarcode',Params);
          SetSynTimeStamp('PUB_BARCODE',timeStamp,'#');
        finally
          Params.free;
        end;
      end;
      LogFile.AddLogFile(0,'保存<下载条码>执行时长:'+inttostr(GetTicket)+' 记录数:'+inttostr(rs.RecordCount));
    finally
      rs.Free;
    end;
except
  on E:Exception do
  begin
    if doc<>nil then
       LogFile.AddLogFile(0,'下载<商品条码>xml='+doc.xml+';原因:'+E.Message)
    else
       LogFile.AddLogFile(0,'下载<商品条码>xml=无;原因:'+E.Message);
    Raise;
  end;
end;
end;

function TCaFactory.AutoCoLogo: boolean;
var
  Temp:TZQuery;
  SaveAudited:boolean;
  SaveFactor:TdbFactory;
begin
  if CheckRspState then
     begin
        SaveAudited := Audited;
        result:= false;
        Temp := TZQuery.Create(nil);
        try
          Temp.Close;
          Temp.SQL.Text := 'select LOGIN_NAME,PASSWRD,TENANT_TYPE from CA_TENANT where COMM not in (''02'',''12'') and TENANT_ID='+IntToStr(Global.TENANT_ID);
          Global.LocalFactory.Open(Temp);
          if auto then
             coLogin(Temp.Fields[0].AsString,DesEncode(Temp.Fields[0].AsString,pubpwd),3)
          else
             coLogin(Temp.Fields[0].AsString,DecStr(Temp.Fields[1].AsString,ENC_KEY),1);
          TenantType := temp.FieldbyName('TENANT_TYPE').AsInteger;
          result := true;
        finally
          Audited := (Audited or SaveAudited);
          Temp.Free;
        end;
     end
  else
     begin
        if not Global.RemoteFactory.Connected then
           begin
             Global.MoveToRemate;
             SaveFactor := Factor;
             try
               try
                 Global.Connect;
               except
                 Raise Exception.Create('连接远程数据库失败,无法完成数据同步...');
               end;
             finally
               Factor := SaveFactor;
             end;
           end;
        FTimeStamp := rspTimeStamp;
     end;
end;

procedure TCaFactory.SetTimeStamp(const Value: int64);
begin
  FTimeStamp := Value;
end;

function TCaFactory.GetTicket: Int64;
begin
  result := GetTickCount-_Start;
end;

procedure TCaFactory.SetTicket;
begin
  _Start := GetTickCount;
end;

procedure TCaFactory.SetTenantType(const Value: integer);
begin
  FTenantType := Value;
end;

procedure TCaFactory.SetRspFlag(const Value: integer);
begin
  FRspFlag := Value;
end;

function TCaFactory.downloadUnion(tid: integer): boolean;
function GetParant:string;
var
  rs:TZQuery;
begin
  rs := TZQuery.Create(nil);
  try
    rs.SQL.Text := 'select TENANT_ID from CA_RELATIONS where RELATION_ID=1000006 and RELATI_ID='+inttostr(tid);
    Factor.Open(rs);
    result := rs.Fields[0].AsString;
  finally
    rs.Free;
  end;
end;
var
  inxml:string;
  doc:IXMLDomDocument;
  rio:THTTPRIO;
  pubUnionQueryResp,IndexResp,UnionIndex:IXMLDOMNode;
  Node:IXMLDOMNode;
  line:PServiceLine;
  h,r:rsp;
  i:integer;
  rs,idx,prc:TZQuery;
  Params:TftParamList;
  OutXml:WideString;
begin
  if not CheckRspState then
     begin
       result := true;
       Exit;
     end;
try
  SetTicket;
  doc := CreateRspXML;
  Node := doc.createElement('flag');
  Node.text := inttostr(1);
  FindNode(doc,'header\pub').appendChild(Node);

  Node := doc.createElement('timeStamp');
  Node.text := inttostr(GetSynTimeStamp('PUB_UNION_INFO','#'));
  FindNode(doc,'header\pub').appendChild(Node);

  LogFile.AddLogFile(0,'开始下载<商盟资料>上次同步时间:'+Node.text+' 本次同步时间:'+inttostr(TimeStamp));

  Node := doc.createElement('pubUnionQueryReq');
  FindNode(doc,'body').appendChild(Node);

  Node := doc.createElement('tenantId');
  Node.text := inttostr(tid);
  FindNode(doc,'body\pubUnionQueryReq').appendChild(Node);

  Node := doc.createElement('supTenantId');
  Node.text := GetParant;
  FindNode(doc,'body\pubUnionQueryReq').appendChild(Node);

  inxml := '<?xml version="1.0" encoding="gb2312"?> '+doc.xml;

  if rspHandle>0 then
     doc := CreateXML(rspqueryUnion(inxml,URL,2))
  else
  begin
    rio := CreateRio(120000);
    h := SendHeader(rio,2);
    try
      try
        OutXml := GetPubMemberWebServiceImpl(true,URL+'PubMemberService?wsdl',rio).queryUnion(Encode(inxml,sslpwd));
        r := GetHeader(rio);
        try
          case r.encryptType of
          2:doc := CreateXML(Decode(OutXml,sslpwd) );
          1:doc := CreateXML(Decode(OutXml,Pubpwd) );
          else doc := CreateXML(Decode(OutXml,''));
          end;
        finally
          r.Free;
        end;
      except
        on E:Exception do
           begin
             if pos('Empty document',E.Message)>0 then
                begin
                  Raise Exception.Create('无法连接到RSP认证服务器，请检查网络是否正常.');
                end
             else
                Raise Exception.Create('连接RSP服务失败了，请关闭DEP服务试试...');
           end;
      end;
    finally
      h.Free;
    end;
    end;
    CheckRecAck(doc);
    Node := FindNode(doc,'body');
    LogFile.AddLogFile(0,'下载<商盟资料>打开时长:'+inttostr(GetTicket));
    SetTicket;
    rs := TZQuery.Create(nil);
    idx := TZQuery.Create(nil);
    prc := TZQuery.Create(nil);
    try
      rs.Close;
      rs.FieldDefs.Add('TENANT_ID',ftInteger,0,true);
      rs.FieldDefs.Add('UNION_ID',ftstring,36,true);
      rs.FieldDefs.Add('UNION_NAME',ftstring,50,true);
      rs.FieldDefs.Add('UNION_SPELL',ftstring,50,true);
      rs.FieldDefs.Add('INDEX_FLAG',ftstring,1,true);
      rs.FieldDefs.Add('COMM',ftstring,2,true);
      rs.FieldDefs.Add('TIME_STAMP',ftLargeInt,0,true);
      rs.CreateDataSet;
      idx.Close;
      idx.FieldDefs.Add('TENANT_ID',ftInteger,0,true);
      idx.FieldDefs.Add('UNION_ID',ftstring,36,true);
      idx.FieldDefs.Add('INDEX_ID',ftstring,36,true);
      idx.FieldDefs.Add('INDEX_NAME',ftstring,50,true);
      idx.FieldDefs.Add('INDEX_SPELL',ftstring,50,true);
      idx.FieldDefs.Add('INDEX_TYPE',ftstring,1,true);
      idx.FieldDefs.Add('INDEX_OPTION',ftstring,255,true);
      idx.FieldDefs.Add('INDEX_ISNULL',ftstring,1,true);
      idx.FieldDefs.Add('COMM',ftstring,2,true);
      idx.FieldDefs.Add('TIME_STAMP',ftLargeInt,0,true);
      idx.CreateDataSet;
      prc.Close;
      prc.FieldDefs.Add('TENANT_ID',ftInteger,0,true);
      prc.FieldDefs.Add('PRICE_ID',ftstring,36,true);
      prc.FieldDefs.Add('PRICE_NAME',ftstring,30,true);
      prc.FieldDefs.Add('PRICE_SPELL',ftstring,30,true);
      prc.FieldDefs.Add('PRICE_TYPE',ftstring,1,true);
      prc.FieldDefs.Add('INTEGRAL',ftfloat,0,true);
      prc.FieldDefs.Add('INTE_TYPE',ftInteger,0,true);
      prc.FieldDefs.Add('INTE_AMOUNT',ftfloat,0,true);
      prc.FieldDefs.Add('MINIMUM_PERCENT',ftfloat,0,true);
      prc.FieldDefs.Add('AGIO_TYPE',ftInteger,0,true);
      prc.FieldDefs.Add('AGIO_PERCENT',ftfloat,0,true);
      prc.FieldDefs.Add('AGIO_SORTS',ftstring,255,true);
      prc.FieldDefs.Add('SEQ_NO',ftInteger,0,true);
      prc.FieldDefs.Add('COMM',ftstring,2,true);
      prc.FieldDefs.Add('TIME_STAMP',ftLargeInt,0,true);
      prc.CreateDataSet;
      pubUnionQueryResp := Node.firstChild;
      while pubUnionQueryResp<>nil do
         begin
           rs.Append;
           rs.FieldByName('TENANT_ID').AsInteger := StrtoInt(GetNodeValue(pubUnionQueryResp,'tenantId'));
           rs.FieldByName('UNION_ID').AsString := GetNodeValue(pubUnionQueryResp,'unionId');
           rs.FieldByName('UNION_NAME').AsString := GetNodeValue(pubUnionQueryResp,'unionName');
           rs.FieldByName('UNION_SPELL').AsString := GetNodeValue(pubUnionQueryResp,'unionSpell');
           rs.FieldByName('INDEX_FLAG').AsString := GetNodeValue(pubUnionQueryResp,'indexFlag');
           rs.FieldByName('COMM').AsString := GetNodeValue(pubUnionQueryResp,'comm');
           TLargeintField(rs.FieldByName('TIME_STAMP')).Value := StrtoInt64(GetNodeValue(pubUnionQueryResp,'timeStamp'));
           rs.Post;
           IndexResp :=  pubUnionQueryResp.firstChild;
           while IndexResp<>nil do
             begin
               if indexResp.nodeName='indexs' then
                  begin
                     UnionIndex := indexResp.firstChild;
                     while UnionIndex<>nil do
                     begin
                       idx.Append;
                       idx.FieldByName('TENANT_ID').AsInteger := StrtoInt(GetNodeValue(UnionIndex,'tenantId'));
                       idx.FieldByName('UNION_ID').AsString := GetNodeValue(UnionIndex,'unionId');
                       idx.FieldByName('INDEX_ID').AsString := GetNodeValue(UnionIndex,'indexId');
                       idx.FieldByName('INDEX_NAME').AsString := GetNodeValue(UnionIndex,'indexName');
                       idx.FieldByName('INDEX_SPELL').AsString := GetNodeValue(UnionIndex,'indexSpell');
                       idx.FieldByName('INDEX_TYPE').AsString := GetNodeValue(UnionIndex,'indexType');
                       idx.FieldByName('INDEX_OPTION').AsString := GetNodeValue(UnionIndex,'indexOption');
                       idx.FieldByName('INDEX_ISNULL').AsString := GetNodeValue(UnionIndex,'indexIsnull');
                       idx.FieldByName('COMM').AsString := GetNodeValue(UnionIndex,'comm');
                       TLargeintField(idx.FieldByName('TIME_STAMP')).Value := StrtoInt64(GetNodeValue(UnionIndex,'timeStamp'));
                       UnionIndex := UnionIndex.nextSibling;
                     end;
                  end
               else
               if indexResp.nodeName='pubPricegrade' then
                  begin
                     prc.Append;
                     prc.FieldByName('TENANT_ID').AsInteger := Global.TENANT_ID;
                     prc.FieldByName('PRICE_ID').AsString := GetNodeValue(indexResp,'priceId');
                     prc.FieldByName('PRICE_NAME').AsString := GetNodeValue(indexResp,'priceName');
                     prc.FieldByName('PRICE_SPELL').AsString := GetNodeValue(indexResp,'priceSpell');
                     prc.FieldByName('PRICE_TYPE').AsString := '2';
                     prc.FieldByName('INTEGRAL').AsFloat := StrtoFloatDef(GetNodeValue(indexResp,'integral'),0);
                     prc.FieldByName('INTE_TYPE').AsInteger := StrtoIntDef(GetNodeValue(indexResp,'inteType'),0);
                     prc.FieldByName('INTE_AMOUNT').AsFloat := StrtoFloatDef(GetNodeValue(indexResp,'inteAmount'),0);
                     prc.FieldByName('MINIMUM_PERCENT').AsFloat := StrtoFloatDef(GetNodeValue(indexResp,'minimumPercent'),0);
                     prc.FieldByName('AGIO_TYPE').AsInteger := StrtoIntDef(GetNodeValue(indexResp,'agioType'),0);
                     prc.FieldByName('AGIO_PERCENT').AsFloat := StrtoIntDef(GetNodeValue(indexResp,'agioPercent'),100);
                     prc.FieldByName('AGIO_SORTS').AsString := GetNodeValue(indexResp,'agioSorts');
                     prc.FieldByName('SEQ_NO').AsInteger := 0;
                     prc.FieldByName('COMM').AsString := GetNodeValue(indexResp,'comm');
                     TLargeintField(prc.FieldByName('TIME_STAMP')).Value := StrtoInt64(GetNodeValue(indexResp,'timeStamp'));
                  end;
               IndexResp := IndexResp.nextSibling;
             end;
           pubUnionQueryResp := pubUnionQueryResp.nextSibling;
         end;
      if not rs.IsEmpty or not idx.IsEmpty or not prc.IsEmpty then
      begin
        Params := TftParamList.Create(nil);
        try
          Factor.BeginBatch;
          try
            Params.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
            Params.ParamByName('TABLE_NAME').AsString := 'PUB_UNION_INFO';
            Params.ParamByName('KEY_FIELDS').AsString := 'TENANT_ID;UNION_ID';
            Params.ParamByName('COMM_LOCK').AsString := '1';
            Params.ParamByName('TIME_STAMP').Value := TimeStamp;
            Params.ParamByName('SYN_TIME_STAMP').Value := TimeStamp;
            Params.ParamByName('TIME_STAMP_NOCHG').AsInteger := 0;
            Params.ParamByName('KEY_FLAG').AsString := '1';
            Factor.AddBatch(rs,'TSyncSingleTable',Params);
            Params.ParamByName('TABLE_NAME').AsString := 'PUB_UNION_INDEX';
            Params.ParamByName('KEY_FIELDS').AsString := 'TENANT_ID;UNION_ID;INDEX_ID';
            Factor.AddBatch(idx,'TSyncSingleTable',Params);
            Params.ParamByName('TABLE_NAME').AsString := 'PUB_PRICEGRADE';
            Params.ParamByName('KEY_FIELDS').AsString := 'TENANT_ID;PRICE_ID';
            Params.ParamByName('KEY_FLAG').AsString := '2';
            Factor.AddBatch(prc,'TSyncSingleTable',Params);
            Factor.CommitBatch;
          except
            Factor.CancelBatch;
            Raise;
          end;
          SetSynTimeStamp('PUB_UNION_INFO',timeStamp,'#');
        finally
          Params.free;
        end;
      end;
      LogFile.AddLogFile(0,'保存<商盟资料>打开时长:'+inttostr(GetTicket)+'  记录数:'+inttostr(rs.RecordCount));
    finally
      prc.Free;
      idx.Free;
      rs.Free;
    end;
except
  on E:Exception do
  begin
    if doc<>nil then
       LogFile.AddLogFile(0,'下载<商盟资料>xml='+doc.xml+';原因:'+E.Message)
    else
       LogFile.AddLogFile(0,'下载<商盟资料>xml=无;原因:'+E.Message);
    Raise;
  end;
end;
end;

function TCaFactory.downloadRspCaModule(TenantId, flag: integer): boolean;
var
  inxml:string;
  doc:IXMLDomDocument;
  rio:THTTPRIO;
  listModulesResp:IXMLDOMNode;
  Node:IXMLDOMNode;
  h,r:rsp;
  i:integer;
  rs:TZQuery;
  Params:TftParamList;
  OutXml:WideString;
  RioImpl:CaProductWebServiceImpl;
begin
try
  SetTicket;
  doc := CreateRspXML;
  Node := doc.createElement('flag');
  Node.text := inttostr(flag);
  FindNode(doc,'header\pub').appendChild(Node);

  Node := doc.createElement('timeStamp');
  Node.text := inttostr(GetSynTimeStamp('CA_MODULE',ProductId));
  FindNode(doc,'header\pub').appendChild(Node);
  LogFile.AddLogFile(0,'开始下载<功能模块>上次同步时间:'+Node.text+' 本次同步时间:'+inttostr(TimeStamp));

  Node := doc.createElement('listModulesReq');
  FindNode(doc,'body').appendChild(Node);

  Node := doc.createElement('tenantId');
  Node.text := inttostr(TenantId);
  FindNode(doc,'body\listModulesReq').appendChild(Node);

  inxml := '<?xml version="1.0" encoding="gb2312"?> '+doc.xml;

  if rspHandle>0 then
     doc := CreateXML(rsplistModules(inxml,URL,1))
  else
  begin
    rio := CreateRio(120000);
    h := SendHeader(rio,1);
    try
      try
        RioImpl := GetCaProductWebServiceImpl(true,URL+'CaProductService?wsdl',rio);
        OutXml := RioImpl.listModules(Encode(inxml,pubpwd));
        r := GetHeader(rio);
        try
          case r.encryptType of
          2:doc := CreateXML(Decode(OutXml,sslpwd) );
          1:doc := CreateXML(Decode(OutXml,Pubpwd) );
          else doc := CreateXML(Decode(OutXml,''));
          end;
        finally
          r.Free;
        end;
      except
        on E:Exception do
           begin
             if pos('Empty document',E.Message)>0 then
                begin
                  Raise Exception.Create('无法连接到RSP认证服务器，请检查网络是否正常.');
                end
             else
                Raise Exception.Create('连接RSP服务失败了，请关闭DEP服务试试...');
           end;
      end;
    finally
      h.Free;
    end;
    end;
    CheckRecAck(doc);
    Node := FindNode(doc,'body');
    LogFile.AddLogFile(0,'下载<功能模块>打开时长:'+inttostr(GetTicket));
    SetTicket;
    rs := TZQuery.Create(nil);
    try
      rs.Close;
      rs.FieldDefs.Add('PROD_ID',ftstring,10,true);
      rs.FieldDefs.Add('MODU_ID',ftstring,20,true);
      rs.FieldDefs.Add('SEQNO',ftInteger,0,true);
      rs.FieldDefs.Add('MODU_NAME',ftstring,50,true);
      rs.FieldDefs.Add('LEVEL_ID',ftstring,21,true);
      rs.FieldDefs.Add('MODU_TYPE',ftInteger,0,true);
      rs.FieldDefs.Add('ACTION_NAME',ftstring,50,true);
      rs.FieldDefs.Add('ACTION_URL',ftstring,255,true);
      rs.FieldDefs.Add('COMM',ftstring,2,true);
      rs.FieldDefs.Add('TIME_STAMP',ftLargeInt,0,true);
      rs.CreateDataSet;
      listModulesResp := Node.firstChild;
      while listModulesResp<>nil do
         begin
           rs.Append;
           rs.FieldByName('PROD_ID').AsString := GetNodeValue(listModulesResp,'prodId');
           rs.FieldByName('MODU_ID').AsString := GetNodeValue(listModulesResp,'moduId');
           if GetNodeValue(listModulesResp,'seqno')='' then
           rs.FieldByName('SEQNO').AsInteger := 0 else
           rs.FieldByName('SEQNO').AsInteger := StrtoInt(GetNodeValue(listModulesResp,'seqno'));
           rs.FieldByName('MODU_NAME').AsString := GetNodeValue(listModulesResp,'moduName');
           rs.FieldByName('LEVEL_ID').AsString := GetNodeValue(listModulesResp,'levelId');
           rs.FieldByName('MODU_TYPE').AsInteger := StrtoInt(GetNodeValue(listModulesResp,'moduType'));
           rs.FieldByName('ACTION_NAME').AsString := GetNodeValue(listModulesResp,'actionName');
           rs.FieldByName('ACTION_URL').AsString := GetNodeValue(listModulesResp,'actionUrl');
           rs.FieldByName('COMM').AsString := GetNodeValue(listModulesResp,'comm');
           TLargeintField(rs.FieldByName('TIME_STAMP')).Value := timeStamp;
           rs.Post;
           listModulesResp := listModulesResp.nextSibling;
         end;
      if not rs.IsEmpty then
      begin
        Params := TftParamList.Create(nil);
        try
          Params.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
          Params.ParamByName('TABLE_NAME').AsString := 'CA_MODULE';
          Params.ParamByName('KEY_FIELDS').AsString := 'PROD_ID;MODU_ID';
          Params.ParamByName('PROD_ID').AsString := rs.FieldByName('PROD_ID').AsString;
          Params.ParamByName('COMM_LOCK').AsString := '1';
          Params.ParamByName('TIME_STAMP').Value := TimeStamp;
          Params.ParamByName('SYN_TIME_STAMP').Value := TimeStamp;
          Params.ParamByName('TIME_STAMP_NOCHG').AsInteger := 1;
          Factor.UpdateBatch(rs,'TSyncCaModule',Params);
          SetSynTimeStamp('CA_MODULE',timeStamp,ProductId);
        finally
          Params.free;
        end;
      end;
      LogFile.AddLogFile(0,'保存<功能模块>执行时长:'+inttostr(GetTicket)+' 记录数:'+inttostr(rs.RecordCount));
    finally
      rs.Free;
    end;
except
  on E:Exception do
  begin
    if doc<>nil then
       LogFile.AddLogFile(0,'下载<功能模块>失败xml='+doc.xml+';原因:'+E.Message)
    else
       LogFile.AddLogFile(0,'下载<功能模块>失败xml=无;原因:'+E.Message);
    Raise;
  end;
end;
end;

function TCaFactory.DesEncode(inStr, Key: string): string;
var
  EncStr:string;
begin
  EncStr := EncryStr(inStr+'{1#2$3%4(5)6@7!poeeww$3%4(5)djjkkldss}',Key);
  result := encddecd.EncodeString(EncStr);
end;

procedure TCaFactory.SetDownModule(const Value: boolean);
begin
  FDownModule := Value;
end;

procedure TCaFactory.LoadRspFactory;
begin
  RspHandle := LoadLibrary(Pchar(ExtractFilePath(ParamStr(0))+'rspFactory.dll'));
  if RspHandle=0 then Exit;
  @RspcoLogin := GetProcAddress(RspHandle, 'coLogin');
  if @RspcoLogin=nil then Raise Exception.Create('无效Rsp插件包，没有实现coLogin方法'); 
  @RspcoRegister := GetProcAddress(RspHandle, 'coRegister');
  if @RspcoRegister=nil then Raise Exception.Create('无效Rsp插件包，没有实现coRegister方法');
  @RspgetTenantInfo := GetProcAddress(RspHandle, 'getTenantInfo');
  if @RspgetTenantInfo=nil then Raise Exception.Create('无效Rsp插件包，没有实现getTenantInfo方法');
  @RspgetShopInfo := GetProcAddress(RspHandle, 'getShopInfo');
  if @RspgetShopInfo=nil then Raise Exception.Create('无效Rsp插件包，没有实现getShopInfo方法');
  @RspcheckLicese := GetProcAddress(RspHandle, 'checkLicese');
  if @RspcheckLicese=nil then Raise Exception.Create('无效Rsp插件包，没有实现checkLicese方法');
  @RsplistModules := GetProcAddress(RspHandle, 'listModules');
  if @RsplistModules=nil then Raise Exception.Create('无效Rsp插件包，没有实现listModules方法');
  @RspcheckUpgrade := GetProcAddress(RspHandle, 'checkUpgrade');
  if @RspcheckUpgrade=nil then Raise Exception.Create('无效Rsp插件包，没有实现checkUpgrade方法');
  @RspcreateServiceLine := GetProcAddress(RspHandle, 'createServiceLine');
  if @RspcreateServiceLine=nil then Raise Exception.Create('无效Rsp插件包，没有实现createServiceLine方法');
  @RspqueryServiceLines := GetProcAddress(RspHandle, 'queryServiceLines');
  if @RspqueryServiceLines=nil then Raise Exception.Create('无效Rsp插件包，没有实现queryServiceLines方法');
  @RspapplyRelation := GetProcAddress(RspHandle, 'applyRelation');
  if @RspapplyRelation=nil then Raise Exception.Create('无效Rsp插件包，没有实现applyRelation方法');
  @RspdownloadTenants := GetProcAddress(RspHandle, 'downloadTenants');
  if @RspdownloadTenants=nil then Raise Exception.Create('无效Rsp插件包，没有实现downloadTenants方法');
  @RspdownloadServiceLines := GetProcAddress(RspHandle, 'downloadServiceLines');
  if @RspdownloadServiceLines=nil then Raise Exception.Create('无效Rsp插件包，没有实现downloadServiceLines方法');
  @RspdownloadRelations := GetProcAddress(RspHandle, 'downloadRelations');
  if @RspdownloadRelations=nil then Raise Exception.Create('无效Rsp插件包，没有实现downloadRelations方法');
  @RspdownloadSort := GetProcAddress(RspHandle, 'downloadSort');
  if @RspdownloadSort=nil then Raise Exception.Create('无效Rsp插件包，没有实现downloadSort方法');
  @RspdownloadUnit := GetProcAddress(RspHandle, 'downloadUnit');
  if @RspdownloadUnit=nil then Raise Exception.Create('无效Rsp插件包，没有实现downloadUnit方法');
  @RspdownloadGoods := GetProcAddress(RspHandle, 'downloadGoods');
  if @RspdownloadGoods=nil then Raise Exception.Create('无效Rsp插件包，没有实现downloadGoods方法');
  @RspdownloadDeployGoods := GetProcAddress(RspHandle, 'downloadDeployGoods');
  if @RspdownloadDeployGoods=nil then Raise Exception.Create('无效Rsp插件包，没有实现downloadDeployGoods方法');
  @RspdownloadBarcode := GetProcAddress(RspHandle, 'downloadBarcode');
  if @RspdownloadBarcode=nil then Raise Exception.Create('无效Rsp插件包，没有实现downloadBarcode方法');
  @RspqueryUnion := GetProcAddress(RspHandle, 'queryUnion');
  if @RspqueryUnion=nil then Raise Exception.Create('无效Rsp插件包，没有实现queryUnion方法');
  @RspSetParams := GetProcAddress(RspHandle, 'SetParams');
  if @RspSetParams=nil then Raise Exception.Create('无效Rsp插件包，没有实现SetParams方法');
end;

procedure TCaFactory.FreeRspFactory;
begin
  FreeLibrary(RspHandle);
end;

function TCaFactory.GetRspTimeStamp: int64;
var
  rs:TZQuery;
begin
  rs := TZQuery.Create(nil);
  try
    rs.SQL.Text := 'select '+ObjCommon.GetTimeStamp(Global.RemoteFactory.iDbType)+' from CA_TENANT where TENANT_ID='+inttostr(Global.TENANT_ID);
    Global.RemoteFactory.Open(rs);
    result := StrtoInt64(rs.Fields[0].asString); 
  finally
    rs.Free;
  end;
end;

function TCaFactory.downloadRspShopInfo(TenantId: integer; shopId,xsmCode,xsmPswd: string;
  flag: integer): boolean;
var
  rs:TZQuery;
  Params:TftParamList;
  inxml:string;
  doc:IXMLDomDocument;
  rio:THTTPRIO;
  caShopInfo:IXMLDOMNode;
  Node:IXMLDOMNode;
  code:string;
  h,r:rsp;
  OutXml:widestring;
begin
try
  doc := CreateRspXML;
  Node := doc.createElement('flag');
  Node.text := '1';
  FindNode(doc,'header\pub').appendChild(Node);

  Node := doc.createElement('caShopInfo');
  FindNode(doc,'body').appendChild(Node);

  Node := doc.createElement('tenantId');
  Node.text := inttostr(TenantId);
  FindNode(doc,'body\caShopInfo').appendChild(Node);
  Node := doc.createElement('shopId');
  Node.text := shopId;
  FindNode(doc,'body\caShopInfo').appendChild(Node);

  inxml := '<?xml version="1.0" encoding="gb2312"?> '+doc.xml;

  if rspHandle>0 then
     doc := CreateXML(rspgetShopInfo(inxml,URL,2))
  else
  begin
    rio := CreateRio(20000);
    h := SendHeader(rio,2);
    try
      try
        OutXml := GetCaTenantWebServiceImpl(true,URL+'CaTenantService?wsdl',rio).getShopInfo(Encode(inxml,sslpwd));
        r := GetHeader(rio);
        try
          case r.encryptType of
          2:doc := CreateXML(Decode(OutXml,sslpwd) );
          1:doc := CreateXML(Decode(OutXml,Pubpwd) );
          else doc := CreateXML(Decode(OutXml,''));
          end;
        finally
          r.Free;
        end;
      except
        on E:Exception do
           begin
             if pos('Empty document',E.Message)>0 then
                begin
                  Raise Exception.Create('无法连接到RSP认证服务器，请检查网络是否正常.');
                end
             else
                Raise Exception.Create('连接RSP服务失败了，请关闭DEP服务试试...');
           end;
      end;
    finally
      h.Free;
    end;
  end;
  CheckRecAck(doc);
  caShopInfo := FindNode(doc,'body\caShopInfo',false);
  if caShopInfo=nil then Exit;
  rs := TZQuery.Create(nil);
  Params := TftParamList.Create;
  try
    Params.ParamByName('TENANT_ID').AsInteger := TenantId;
    Params.ParamByName('SHOP_ID').AsString := shopId;
    Global.LocalFactory.Open(rs,'TShop',Params);
    if not rs.IsEmpty then
    begin
      if rs.FieldByName('SHOP_ID').asString=shopId then
      begin
        rs.Edit;
        rs.FieldByName('XSM_CODE').asString := xsmCode;
        rs.FieldByName('XSM_PSWD').asString := EncStr(xsmPswd,ENC_KEY);
        rs.Post;
        Global.LocalFactory.UpdateBatch(rs,'TShop',Params);
      end;
    end
    else
    begin
      rs.Edit;
      rs.FieldByName('TENANT_ID').AsInteger := StrtoInt(GetNodeValue(caShopInfo,'tenantId'));
      rs.FieldByName('SHOP_ID').asString := GetNodeValue(caShopInfo,'shopId');
      rs.FieldByName('SHOP_NAME').asString := GetNodeValue(caShopInfo,'shopName');
      rs.FieldByName('SHOP_SPELL').asString := GetNodeValue(caShopInfo,'shopSpell');
      rs.FieldByName('LICENSE_CODE').asString := GetNodeValue(caShopInfo,'licenseCode');
      rs.FieldByName('LINKMAN').asString := GetNodeValue(caShopInfo,'linkman');
      rs.FieldByName('TELEPHONE').asString := GetNodeValue(caShopInfo,'telephone');
      rs.FieldByName('FAXES').asString := GetNodeValue(caShopInfo,'faxes');
      rs.FieldByName('ADDRESS').asString := GetNodeValue(caShopInfo,'address');
      rs.FieldByName('POSTALCODE').asString := GetNodeValue(caShopInfo,'postalcode');
      if rs.FieldByName('SHOP_ID').asString=shopId then
         begin
           rs.FieldByName('XSM_CODE').asString := xsmCode;
           rs.FieldByName('XSM_PSWD').asString := EncStr(xsmPswd,ENC_KEY);
         end
      else
         rs.FieldByName('XSM_CODE').asString := GetNodeValue(caShopInfo,'xsmCode');
      rs.FieldByName('REGION_ID').asString := GetNodeValue(caShopInfo,'regionId');
      rs.FieldByName('SHOP_TYPE').asString := GetNodeValue(caShopInfo,'shopType');
      rs.FieldByName('SEQ_NO').AsInteger := StrtoInt(GetNodeValue(caShopInfo,'seqNo'));
      rs.Post;
      Global.LocalFactory.UpdateBatch(rs,'TShop',Params);
      if (Global.LocalFactory<>uGlobal.Factor) and Factor.Connected then
         begin
            uGlobal.Factor.Open(rs,'TShop',Params);
            if not rs.IsEmpty then
            begin
              if rs.FieldByName('SHOP_ID').asString=shopId then
              begin
                rs.Edit;
                rs.FieldByName('XSM_CODE').asString := xsmCode;
                rs.FieldByName('XSM_PSWD').asString := EncStr(xsmPswd,ENC_KEY);
                rs.Post;
                uGlobal.Factor.UpdateBatch(rs,'TShop',Params);
              end;
            end
            else
            begin
              rs.Edit;
              rs.FieldByName('TENANT_ID').AsInteger := StrtoInt(GetNodeValue(caShopInfo,'tenantId'));
              rs.FieldByName('SHOP_ID').asString := GetNodeValue(caShopInfo,'shopId');
              rs.FieldByName('SHOP_NAME').asString := GetNodeValue(caShopInfo,'shopName');
              rs.FieldByName('SHOP_SPELL').asString := GetNodeValue(caShopInfo,'shopSpell');
              rs.FieldByName('LICENSE_CODE').asString := GetNodeValue(caShopInfo,'licenseCode');
              rs.FieldByName('LINKMAN').asString := GetNodeValue(caShopInfo,'linkman');
              rs.FieldByName('TELEPHONE').asString := GetNodeValue(caShopInfo,'telephone');
              rs.FieldByName('FAXES').asString := GetNodeValue(caShopInfo,'faxes');
              rs.FieldByName('ADDRESS').asString := GetNodeValue(caShopInfo,'address');
              rs.FieldByName('POSTALCODE').asString := GetNodeValue(caShopInfo,'postalcode');
              if rs.FieldByName('SHOP_ID').asString=shopId then
                 begin
                   rs.FieldByName('XSM_CODE').asString := xsmCode;
                   rs.FieldByName('XSM_PSWD').asString := EncStr(xsmPswd,ENC_KEY);
                 end
              else
                 rs.FieldByName('XSM_CODE').asString := GetNodeValue(caShopInfo,'xsmCode');
              rs.FieldByName('REGION_ID').asString := GetNodeValue(caShopInfo,'regionId');
              rs.FieldByName('SHOP_TYPE').asString := GetNodeValue(caShopInfo,'shopType');
              rs.FieldByName('SEQ_NO').AsInteger := StrtoInt(GetNodeValue(caShopInfo,'seqNo'));
              rs.Post;
              uGlobal.Factor.UpdateBatch(rs,'TShop',Params);
         end;
      end;
      Global.SHOP_ID := rs.FieldByName('SHOP_ID').asString;
      Global.SHOP_NAME := rs.FieldByName('SHOP_NAME').asString;
    end;
  finally
    Params.Free;
    rs.Free;
  end;
except
  on E:Exception do
  begin
    if doc<>nil then
       LogFile.AddLogFile(0,'读取<门店资料>失败xml='+doc.xml+';原因:'+E.Message)
    else
       LogFile.AddLogFile(0,'读取<门店资料>失败xml=无;原因:'+E.Message);
    Raise;
  end;
end;
end;

function TCaFactory.SyncSystemTimeStamp: boolean;
var
  Params:TftParamList;
begin
  Params := TftParamList.Create(nil);
  try
    Params.ParamByName('TIME_STAMP').Value := timeStamp;
    if Global.RemoteFactory.Connected then
       Global.RemoteFactory.ExecProc('TSyncSystemTimeStamp',Params);
    Global.LocalFactory.ExecProc('TSyncSystemTimeStamp',Params);
  finally
    Params.Free;
  end;
end;

function TCaFactory.CheckDebugSync: boolean;
var
  F:TIniFile;
begin
  F := TIniFile.Create(ExtractFilePath(ParamStr(0))+'r3.cfg');
  try
    result := (F.ReadString('r3','compiler','runing')<>'runing')
              or
              (Global.RemoteFactory.Connected and (Global.RemoteFactory.iDbType in [3,5]));
  finally
    F.Free;
  end;
end;

function TCaFactory.GetTimeStamp: int64;
begin
  result := FTimeStamp;
end;

function TCaFactory.CheckRspState: boolean;
var
  F:TIniFile;
begin
  F := TIniFile.Create(ExtractFilePath(Application.ExeName)+'r3.cfg');
  try
    result := (F.ReadInteger('soft','rspStatus',0)=0);
  finally
    try
      F.Free;
    except
    end;
  end;
end;

function TCaFactory.coAdoLogin(Account, PassWrd: string;
  flag: integer): TCaLogin;
var
  f,r:TIniFile;
  rs:TZQuery;
  srvrId,defsrvrId,hsname,cstr,defStr:string;
  finded,isSrvr:boolean;
  Params:TftParamList;
  tid:integer;
  rsp:boolean;
begin
try
  Audited := false;
  if not Global.RemoteFactory.Connected then //连接
     begin
       rsp := false;
       F := TIniFile.Create(ExtractFilePath(ParamStr(0))+'r3.cfg');
       try
         Global.RemoteFactory.Initialize(F.ReadString('soft','ado',''));
         try
           Global.RemoteFactory.Connect;
         except
           //ado连接失败时，尝试平台认证
           result := coRspLogin(Account,PassWrd,flag);
           rsp := true;
         end;
       finally
         try
           F.Free;
         except
         end;
       end;
       if rsp and (StrtoIntDef(result.RET,0) in [1,5]) then
          begin
            WAdoParams;
          end;
       if rsp then Exit;
     end;
  Params := TftParamList.Create;
  rs := TZQuery.Create(nil);
  try
    Params.ParamByName('loginName').AsString := Account;
    Params.ParamByName('PassWrd').AsString := PassWrd;
    Params.ParamByName('flag').AsInteger := flag;
    Global.RemoteFactory.Open(rs,'TcoLogin',Params);
    Global.RemoteFactory.DisConnect;
    result.RET := rs.FieldbyName('code').AsString;
    result.TENANT_ID := rs.FieldbyName('tenantId').AsInteger;
    tid := Global.TENANT_ID;
    try
      Global.TENANT_ID := result.TENANT_ID;
      FTimeStamp := RspTimeStamp;
    finally
      Global.TENANT_ID := tid;
    end;
    Auto := (flag<>1);
    SyncSystemTimeStamp;
    if StrtoIntDef(result.RET,0) in [1,5] then //认证成功
       begin
         if result.RET = '1' then
            begin
              f := TIniFile.Create(ExtractFilePath(ParamStr(0))+'db.cfg');
              r := TIniFile.Create(ExtractFilePath(ParamStr(0))+'r3.cfg');
              try
                 srvrId := f.readString('db','srvrId','');
                 defSrvrId := rs.FieldbyName('srvrId').AsString;
                 if flag=3 then
                    result.SHOP_ID := rs.FieldbyName('shopId').AsString;
                 if result.SHOP_ID='' then result.SHOP_ID := inttostr(result.TENANT_ID)+'0001';
                 result.DB_ID := rs.FieldbyName('dbId').AsInteger;
                 f.WriteString('db','dbid',inttostr(result.DB_ID));
                 r.WriteString('soft','SFVersion','.'+rs.FieldbyName('prodFlag').asString);
                 r.WriteString('soft','CLVersion','.'+rs.FieldbyName('industry').asString);
                 r.WriteString('soft','ProductID',rs.FieldbyName('prodId').asString);
                 r.WriteString('soft','name',rs.FieldbyName('prodName').asString);
                 Audited := true;
                 finded := false;
                 if not Global.Debug then
                   begin
                     isSrvr := false;
                     rs.First;
                     while not rs.Eof do
                       begin
                         f.WriteString('H_'+rs.FieldbyName('srvrId').asString,'srvrName',rs.FieldbyName('srvrName').asString);
                         f.WriteString('H_'+rs.FieldbyName('srvrId').asString,'hostName',rs.FieldbyName('hostName').asString);
                         f.WriteString('H_'+rs.FieldbyName('srvrId').asString,'srvrPort',rs.FieldbyName('srvrPort').asString);
                         f.WriteString('H_'+rs.FieldbyName('srvrId').asString,'srvrPath',rs.FieldbyName('srvrPath').asString);
                         case rs.FieldbyName('srvrStatus').asInteger of
                         1: f.WriteString('H_'+rs.FieldbyName('srvrId').asString,'srvrStatus','正常');
                         2: f.WriteString('H_'+rs.FieldbyName('srvrId').asString,'srvrStatus','爆满');
                         9: begin
                              f.EraseSection(rs.FieldbyName('srvrId').asString);
                              rs.Next;
                              continue;
                            end;
                         else
                            f.WriteString('H_'+rs.FieldbyName('srvrId').asString,'srvrStatus','正常');
                         end;
                         if srvrId=rs.FieldbyName('srvrId').asString then isSrvr := true;
                         if not finded then
                            begin
                              if srvrId=rs.FieldbyName('srvrId').asString then
                                 begin
                                   if rs.FieldbyName('hostName').asString='localhost' then
                                      f.WriteString('db','Connstr','')
                                   else
                                      f.WriteString('db','Connstr','connmode=2;hostname='+rs.FieldbyName('hostName').asString+';port='+rs.FieldbyName('srvrPort').asString+';dbid='+inttostr(result.DB_ID));
                                   finded := true;
                                 end;
                            end;
                         if defSrvrId=rs.FieldbyName('srvrId').AsString then
                            begin
                              if rs.FieldbyName('hostName').asString='localhost' then
                              defStr := '' else
                              defStr := 'connmode=2;hostname='+rs.FieldbyName('hostName').asString+';port='+rs.FieldbyName('srvrPort').asString+';dbid='+inttostr(result.DB_ID);
                            end;
                         rs.Next;
                       end;
                     if not finded or not isSrvr then //一直没找到设置，默认第一个
                       begin
                         f.WriteString('db','srvrId',defSrvrId);
                         f.WriteString('db','Connstr',defStr);
                      end;
                   end;
              finally
                try
                  f.Free;
                  r.Free;
                except
                end;
              end;
            end;
       end;
  finally
    rs.Free;
    Params.Free;
  end;

except
  on E:Exception do
  begin
    LogFile.AddLogFile(0,'认证<企业登录>失败xml=无;原因:'+E.Message);
    Raise;
  end;
end;
end;

function TCaFactory.coLogin(Account, PassWrd: string;
  flag: integer): TCaLogin;
begin
  //如果演示版直接不认证
  if CheckDebugSync then
     begin
       result.RET := '1';
       result.TENANT_ID := Global.TENANT_ID;
       Audited := true;
       Exit;
     end;
  if CheckRspState then
     result := coRspLogin(Account,PassWrd,flag)
  else
     result := coAdoLogin(Account,PassWrd,flag);
end;

function TCaFactory.CheckAdoUpgrade(TENANT_ID, PROD_ID,
  CurVeraion: string): TCaUpgrade;
var
  Params,prms:TftParamList;
  F:TIniFile;
begin
try
  Params := TftParamList.Create(nil);
  prms := TftParamList.Create(nil);
  try
    Params.ParamByName('tenantId').AsInteger := StrtoInt(TENANT_ID);
    Params.ParamByName('prodId').AsString := PROD_ID;
    Params.ParamByName('curVeraion').AsString := CurVeraion;
    TftParamList.Decode(prms,Global.RemoteFactory.ExecProc('TcheckUprade',Params));
    Global.RemoteFactory.DisConnect;
    result.UpGrade := prms.ParambyName('upgradeType').AsInteger;
    result.URL := prms.ParambyName('pkgDownloadUrl').AsString;
    result.Version := prms.ParambyName('newVersion').AsString;
  finally
    prms.Free;
    Params.Free;
  end;
  //写安装目录到临时文件夹
  F := TIniFile.Create(FnSystem.GetWinTmp+'r3.inst');
  try
    if RspFlag=1 then
       F.WriteString('rsp','path',ExtractFileDir(ParamStr(0)))
    else
       F.WriteString('r3','path',ExtractFileDir(ParamStr(0)));
  finally
    try
      F.Free;
    except
    end;
  end;
except
  on E:Exception do
     begin
       LogFile.AddLogFile(0,'升级<版本检测>失败，原因:'+E.Message);
       Raise;
     end;
end;
end;

function TCaFactory.CheckUpgrade(TENANT_ID, PROD_ID,
  CurVeraion: string): TCaUpgrade;
begin
//如果演示版直接不认证
if CheckDebugSync then
   begin
     result.UpGrade := 3;
     Exit;
   end;
  if CheckRspState then
     result := CheckRspUpgrade(TENANT_ID,PROD_ID,CurVeraion)
  else
     result := CheckAdoUpgrade(TENANT_ID,PROD_ID,CurVeraion);
end;

function TCaFactory.downloadAdoCaModule(TenantId, flag: integer): boolean;
var
  rs,temp:TZQuery;
  Params:TftParamList;

begin
try
  Params := TftParamList.Create(nil);
  rs := TZQuery.Create(nil);
  temp := TZQuery.Create(nil);
  try
    Params.ParamByName('tenantId').AsInteger := TenantId;
    Params.ParamByName('flag').AsInteger := flag;
    Params.ParamByName('prodId').AsString := ProductId;
    Params.ParamByName('timeStamp').Value := GetSynTimeStamp('CA_MODULE',ProductId);
    Global.RemoteFactory.Open(temp,'TdownloadCaModule',Params); 

      rs.Close;
      rs.FieldDefs.Add('PROD_ID',ftstring,10,true);
      rs.FieldDefs.Add('MODU_ID',ftstring,20,true);
      rs.FieldDefs.Add('SEQNO',ftInteger,0,true);
      rs.FieldDefs.Add('MODU_NAME',ftstring,50,true);
      rs.FieldDefs.Add('LEVEL_ID',ftstring,21,true);
      rs.FieldDefs.Add('MODU_TYPE',ftInteger,0,true);
      rs.FieldDefs.Add('ACTION_NAME',ftstring,50,true);
      rs.FieldDefs.Add('ACTION_URL',ftstring,255,true);
      rs.FieldDefs.Add('COMM',ftstring,2,true);
      rs.FieldDefs.Add('TIME_STAMP',ftLargeInt,0,true);
      rs.CreateDataSet;
      temp.First;
      while not temp.Eof do
         begin
           rs.Append;
           rs.FieldByName('PROD_ID').AsString := temp.FieldbyName('PROD_ID').AsString;
           rs.FieldByName('MODU_ID').AsString := temp.FieldbyName('MODU_ID').AsString;
           rs.FieldByName('SEQNO').AsInteger := temp.FieldbyName('SEQNO').AsInteger;
           rs.FieldByName('MODU_NAME').AsString := temp.FieldbyName('MODU_NAME').AsString;
           rs.FieldByName('LEVEL_ID').AsString := temp.FieldbyName('LEVEL_ID').AsString;
           rs.FieldByName('MODU_TYPE').AsInteger := temp.FieldbyName('MODU_TYPE').AsInteger;
           rs.FieldByName('ACTION_NAME').AsString := temp.FieldbyName('ACTION_NAME').AsString;
           rs.FieldByName('ACTION_URL').AsString := temp.FieldbyName('ACTION_URL').AsString;
           rs.FieldByName('COMM').AsString := temp.FieldbyName('COMM').AsString;
           TLargeintField(rs.FieldByName('TIME_STAMP')).Value := timeStamp;
           rs.Post;
           temp.Next;
         end;
      if not temp.IsEmpty then
      begin
        Params.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
        Params.ParamByName('TABLE_NAME').AsString := 'CA_MODULE';
        Params.ParamByName('KEY_FIELDS').AsString := 'PROD_ID;MODU_ID';
        Params.ParamByName('PROD_ID').AsString := rs.FieldByName('PROD_ID').AsString;
        Params.ParamByName('COMM_LOCK').AsString := '1';
        Params.ParamByName('TIME_STAMP').Value := TimeStamp;
        Params.ParamByName('SYN_TIME_STAMP').Value := TimeStamp;
        Params.ParamByName('TIME_STAMP_NOCHG').AsInteger := 1;
        Factor.UpdateBatch(rs,'TSyncCaModule',Params);
        SetSynTimeStamp('CA_MODULE',timeStamp,ProductId);
      end;
  finally
    rs.Free;
    temp.Free;
    Params.Free;
  end;
except
  on E:Exception do
  begin
    LogFile.AddLogFile(0,'下载<功能模块>失败;原因:'+E.Message);
    Raise;
  end;
end;
end;

function TCaFactory.downloadCaModule(TenantId, flag: integer): boolean;
begin
  if not Audited then
     begin
       result := true;
       Exit;
     end;
  if not DownModule then Exit;
  if CheckRspState then
     result := downloadRspCaModule(TenantId,flag)
  else
     result := downloadAdoCaModule(TenantId,flag);
end;

function TCaFactory.coAdoGetList(TENANT_ID: string): TCaTenant;
var
  rs:TZQuery;
  Params:TftParamList;
begin
try
  Params := TftParamList.Create(nil);
  rs := TZQuery.Create(nil);
  try
    Params.ParamByName('tenantId').AsInteger := StrtoInt(TENANT_ID);
    Global.RemoteFactory.Open(rs,'TcoGetTenant',Params);
    if rs.IsEmpty then Raise Exception.Create('企业资料没有找到,企业号：'+TENANT_ID); 
    result.TENANT_ID := rs.FieldbyName('TENANT_ID').AsInteger;
    result.LOGIN_NAME := rs.FieldbyName('LOGIN_NAME').AsString;
    result.TENANT_NAME := rs.FieldbyName('TENANT_NAME').AsString;
    result.SHORT_TENANT_NAME := rs.FieldbyName('SHORT_TENANT_NAME').AsString;
    result.TENANT_SPELL := rs.FieldbyName('TENANT_SPELL').AsString;
    result.TENANT_TYPE := rs.FieldbyName('TENANT_TYPE').AsInteger;
    result.LICENSE_CODE := rs.FieldbyName('LICENSE_CODE').AsString;
    result.LEGAL_REPR := rs.FieldbyName('LEGAL_REPR').AsString;
    result.LINKMAN := rs.FieldbyName('LINKMAN').AsString;
    result.TELEPHONE := rs.FieldbyName('TELEPHONE').AsString;
    result.FAXES := rs.FieldbyName('FAXES').AsString;
    result.HOMEPAGE := rs.FieldbyName('HOMEPAGE').AsString;
    result.ADDRESS := rs.FieldbyName('ADDRESS').AsString;
    result.POSTALCODE := rs.FieldbyName('POSTALCODE').AsString;
    result.PASSWRD := rs.FieldbyName('PASSWRD').AsString;
    result.QQ := rs.FieldbyName('QQ').AsString;
    result.MSN := rs.FieldbyName('MSN').AsString;
    result.REMARK := rs.FieldbyName('REMARK').AsString;
    result.REGION_ID := rs.FieldbyName('REGION_ID').AsString;
    result.SRVR_ID := rs.FieldbyName('SRVR_ID').AsString;
    result.PROD_ID := rs.FieldbyName('PROD_ID').AsString;
    result.DB_ID := rs.FieldbyName('DB_ID').AsString;
    result.AUDIT_STATUS := rs.FieldbyName('AUDIT_STATUS').AsString;
  finally
    rs.Free;
    Params.Free;
  end;
except
  on E:Exception do
  begin
    LogFile.AddLogFile(0,'读取<企业资料>失败;原因:'+E.Message);
    Raise;
  end;
end;
end;

function TCaFactory.coGetList(TENANT_ID: string): TCaTenant;
begin
  if CheckRspState then
     result := coRspGetList(TENANT_ID)
  else
     result := coAdoGetList(TENANT_ID);
end;

function TCaFactory.downloadAdoShopInfo(TenantId: integer; shopId, xsmCode,
  xsmPswd: string; flag: integer): boolean;
var
  rs,temp:TZQuery;
  Params:TftParamList;
begin
try
  rs := TZQuery.Create(nil);
  temp := TZQuery.Create(nil);
  Params := TftParamList.Create;
  try
    Params.ParamByName('TENANT_ID').AsInteger := TenantId;
    Params.ParamByName('SHOP_ID').AsString := shopId;
    Global.RemoteFactory.Open(temp,'TcoGetShop',Params);
    if temp.IsEmpty then Raise Exception.Create('门店档案没找到,原因:'+shopId);
    
    Global.LocalFactory.Open(rs,'TShop',Params);
    if not rs.IsEmpty then
    begin
      if rs.FieldByName('SHOP_ID').asString=shopId then
      begin
        rs.Edit;
        rs.FieldByName('XSM_CODE').asString := xsmCode;
        rs.FieldByName('XSM_PSWD').asString := EncStr(xsmPswd,ENC_KEY);
        rs.Post;
        Global.LocalFactory.UpdateBatch(rs,'TShop',Params);
      end;
    end
    else
    begin
      rs.Edit;
      rs.FieldByName('TENANT_ID').AsInteger := temp.FieldByName('TENANT_ID').AsInteger;
      rs.FieldByName('SHOP_ID').asString := temp.FieldByName('SHOP_ID').asString;
      rs.FieldByName('SHOP_NAME').asString := temp.FieldByName('SHOP_NAME').asString;
      rs.FieldByName('SHOP_SPELL').asString := temp.FieldByName('SHOP_SPELL').asString;
      rs.FieldByName('LICENSE_CODE').asString := temp.FieldByName('LICENSE_CODE').asString;
      rs.FieldByName('LINKMAN').asString := temp.FieldByName('LINKMAN').asString;
      rs.FieldByName('TELEPHONE').asString := temp.FieldByName('TELEPHONE').asString;
      rs.FieldByName('FAXES').asString := temp.FieldByName('FAXES').asString;
      rs.FieldByName('ADDRESS').asString := temp.FieldByName('ADDRESS').asString;
      rs.FieldByName('POSTALCODE').asString := temp.FieldByName('POSTALCODE').asString;
      if rs.FieldByName('SHOP_ID').asString=shopId then
         begin
           rs.FieldByName('XSM_CODE').asString := xsmCode;
           rs.FieldByName('XSM_PSWD').asString := EncStr(xsmPswd,ENC_KEY);
         end
      else
         rs.FieldByName('XSM_CODE').asString := temp.FieldByName('XSM_CODE').asString;
      rs.FieldByName('REGION_ID').asString := temp.FieldByName('REGION_ID').asString;
      rs.FieldByName('SHOP_TYPE').asString := temp.FieldByName('SHOP_TYPE').asString;
      rs.FieldByName('SEQ_NO').AsInteger := temp.FieldByName('SEQ_NO').AsInteger;
      rs.Post;
      Global.LocalFactory.UpdateBatch(rs,'TShop',Params);
      Global.SHOP_ID := rs.FieldByName('SHOP_ID').asString;
      Global.SHOP_NAME := rs.FieldByName('SHOP_NAME').asString;
    end;
  finally
    Params.Free;
    temp.Free;
    rs.Free;
  end;
except
  on E:Exception do
  begin
    LogFile.AddLogFile(0,'读取<门店资料>失败;原因:'+E.Message);
    Raise;
  end;
end;
end;

function TCaFactory.downloadShopInfo(TenantId: integer; shopId, xsmCode,
  xsmPswd: string; flag: integer): boolean;
begin
  if CheckRspState then
     result := downloadRspShopInfo(TenantId,shopId,xsmCode,xsmPswd,flag)
  else
     result := downloadAdoShopInfo(TenantId,shopId,xsmCode,xsmPswd,flag);
end;

function TCaFactory.coAdoRegister(Info: TCaTenant): TCaTenant;
begin
  Raise Exception.Create('您所安装的版本不支持客户端注册，需开通服务请联系客服人员！'); 
end;

function TCaFactory.coRegister(Info: TCaTenant): TCaTenant;
begin
  if CheckRspState then
     result := coRspRegister(Info)
  else
     result := coAdoRegister(Info);
end;

procedure TCaFactory.WAdoParams;
var
  r3,db:TIniFile;
begin
  r3 := TIniFile.Create(ExtractFilePath(ParamStr(0))+'r3.cfg');
  db := TIniFile.Create(ExtractFilePath(ParamStr(0))+'db.cfg');
  try
    if r3.ReadInteger('soft','rspStatus',0)=1 then
       r3.WriteString('soft','ado',db.ReadString('db','connstr',''));  
  finally
    db.Free;
    r3.Free;
  end;
end;

procedure TCaFactory.SetresDesktop(const Value: string);
begin
  FresDesktop := Value;
end;

procedure TCaFactory.SetresVersion(const Value: string);
begin
  FresVersion := Value;
end;

procedure TCaFactory.SeteseFlag(const Value: integer);
begin
  FeseFlag := Value;
end;

function TCaFactory.checkLicese: boolean;
begin
  if CheckRspState then
     result := coRspcheckLicese
  else
     result := true;// coAdocheckLicese;
end;

function TCaFactory.coAdoCheckLicese: boolean;
var
  rs,temp:TZQuery;
  Params:TftParamList;
  clseDate,rightType:string;
begin
try
  result := true;
  rs := TZQuery.Create(nil);
  temp := TZQuery.Create(nil);
  Params := TftParamList.Create;
  try
    Params.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
    Params.ParamByName('SHOP_ID').AsString := Global.SHOP_ID;
    Params.ParamByName('SHOP_NAME').AsString := Global.SHOP_NAME;
    Global.RemoteFactory.Open(temp,'TcoCheckLicese',Params);
    Global.RemoteFactory.DisConnect;
    clseDate := temp.FieldbyName('CLOSE_DATE').AsString;
    rightType := temp.FieldbyName('RIGHT_TYPE').AsString;
    result := true;
    if clseDate='' then
       begin
         MessageBox(Application.MainForm.Handle,pchar('当前门店终端还没有获得授权,请联系软件提供商'+#13+#13+'网址:www.rspcn.com  QQ:30355701'),'友情提示...',MB_OK+MB_ICONINFORMATION);
         Exit;
       end;
    Factor.ExecSQL('update CA_SHOP_INFO set RIGHT_TYPE='''+rightType+''',CLSE_DATE='''+clseDate+''' where TENANT_ID='+inttostr(Global.TENANT_ID)+' and SHOP_ID='''+Global.SHOP_ID+'''');
    case StrtoIntDef(rightType,1) of
    1:begin
        if clseDate>=formatDatetime('YYYY-MM-DD',date()) then
           begin
             MessageBox(Application.MainForm.Handle,pchar('当前登录门店的服务年限已到期，'+#13+'相关服务条款及缴费明细请查看官方网站.'+#13+#13+'网址:www.rspcn.com  QQ:30355701'),'友情提示...',MB_OK+MB_ICONINFORMATION);
             result := false;
           end
        else
        if clseDate>=formatDatetime('YYYY-MM-DD',date()-15) then
           MessageBox(Application.MainForm.Handle,pchar('当前登录门店的服务年限将于'+clseDate+'到期，'+#13+'相关服务条款及缴费明细请查看官方网站.'+#13+#13+'网址:www.rspcn.com  QQ:30355701'),'友情提示...',MB_OK+MB_ICONINFORMATION);
      end;
    2:begin
        if clseDate>=formatDatetime('YYYY-MM-DD',date()) then
           MessageBox(Application.MainForm.Handle,pchar('当前登录门店的服务年限已到期，'+#13+'相关服务条款及缴费明细请查看官方网站.'+#13+#13+'网址:www.rspcn.com  QQ:30355701'),'友情提示...',MB_OK+MB_ICONINFORMATION)
        else
        if clseDate>=formatDatetime('YYYY-MM-DD',date()-15) then
           MessageBox(Application.MainForm.Handle,pchar('当前登录门店的服务年限将于'+clseDate+'到期，'+#13+'相关服务条款及缴费明细请查看官方网站.'+#13+#13+'网址:www.rspcn.com  QQ:30355701'),'友情提示...',MB_OK+MB_ICONINFORMATION);
      end;
    end;
  finally
    Params.Free;
    temp.Free;
    rs.Free;
  end;
except
  on E:Exception do
  begin
    result := true;
  end;
end;
end;

function TCaFactory.coRspCheckLicese: boolean;
var
  rs:TZQuery;
  Params:TftParamList;
  inxml:string;
  doc:IXMLDomDocument;
  rio:THTTPRIO;
  caShopInfo:IXMLDOMNode;
  Node:IXMLDOMNode;
  code,clseDate,rightType:string;
  h,r:rsp;
  OutXml:widestring;
begin
try
  result := true;
  doc := CreateRspXML;
  Node := doc.createElement('Flag');
  Node.text := '1';
  FindNode(doc,'header\pub').appendChild(Node);

  Node := doc.createElement('caShopInfo');
  FindNode(doc,'body').appendChild(Node);

  Node := doc.createElement('tenantId');
  Node.text := inttostr(Global.TENANT_ID);
  FindNode(doc,'body\caShopInfo').appendChild(Node);
  Node := doc.createElement('shopId');
  Node.text := Global.SHOP_ID;
  FindNode(doc,'body\caShopInfo').appendChild(Node);
  Node := doc.createElement('shopName');
  Node.text := Global.SHOP_NAME;
  FindNode(doc,'body\caShopInfo').appendChild(Node);
  Node := doc.createElement('regionId');
  rs := Global.GetZQueryFromName('CA_SHOP_INFO');
  if rs.Locate('SHOP_ID',Global.SHOP_ID,[]) then
     Node.text := rs.FieldbyName('REGION_ID').AsString
  else
     begin
        rs := Global.GetZQueryFromName('CA_TENANT');
        if rs.Locate('TENANT_ID',Global.TENANT_ID,[]) then
           Node.text := rs.FieldbyName('REGION_ID').AsString
     end;
  FindNode(doc,'body\caShopInfo').appendChild(Node);

  inxml := '<?xml version="1.0" encoding="gb2312"?> '+doc.xml;

  if rspHandle>0 then
     doc := CreateXML(rspcheckLicese(inxml,URL,1))
  else
  begin
    rio := CreateRio(20000);
    h := SendHeader(rio,1);
    try
      try
        OutXml := GetCaTenantWebServiceImpl(true,URL+'CaTenantService?wsdl',rio).checkLicese(Encode(inxml,Pubpwd));
        r := GetHeader(rio);
        try
          case r.encryptType of
          2:doc := CreateXML(Decode(OutXml,sslpwd) );
          1:doc := CreateXML(Decode(OutXml,Pubpwd) );
          else doc := CreateXML(Decode(OutXml,''));
          end;
        finally
          r.Free;
        end;
      except
        on E:Exception do
           begin
             if pos('Empty document',E.Message)>0 then
                begin
                  Raise Exception.Create('无法连接到RSP认证服务器，请检查网络是否正常.');
                end
             else
                Raise Exception.Create('连接RSP服务失败了，请关闭DEP服务试试...');
           end;
      end;
    finally
      h.Free;
    end;
  end;
  CheckRecAck(doc);
  caShopInfo := FindNode(doc,'body\caShopInfo',false);
  if caShopInfo=nil then Exit;
  clseDate := GetNodeValue(caShopInfo,'clseDate');
  rightType := GetNodeValue(caShopInfo,'rightType');
  result := true;
  if clseDate='' then
     begin
       MessageBox(Application.MainForm.Handle,pchar('当前门店终端还没有获得授权,请联系软件提供商'+#13+#13+'网址:www.rspcn.com  QQ:30355701'),'友情提示...',MB_OK+MB_ICONINFORMATION);
       Exit;
     end;
  Factor.ExecSQL('update CA_SHOP_INFO set RIGHT_TYPE='''+rightType+''',CLSE_DATE='''+clseDate+''' where TENANT_ID='+inttostr(Global.TENANT_ID)+' and SHOP_ID='''+Global.SHOP_ID+'''');
  case StrtoIntDef(GetNodeValue(caShopInfo,'rightType'),1) of
  1:begin
      if clseDate<=formatDatetime('YYYY-MM-DD',date()) then
         begin
           MessageBox(Application.MainForm.Handle,pchar('当前登录门店的服务年限已到期，'+#13+'相关服务条款及缴费明细请查看官方网站.'+#13+#13+'网址:www.rspcn.com  QQ:30355701'),'友情提示...',MB_OK+MB_ICONINFORMATION);
           result := false;
         end
      else
      if clseDate<=formatDatetime('YYYY-MM-DD',date()+15) then
         MessageBox(Application.MainForm.Handle,pchar('当前登录门店的服务年限将于'+clseDate+'到期，'+#13+'相关服务条款及缴费明细请查看官方网站.'+#13+#13+'网址:www.rspcn.com  QQ:30355701'),'友情提示...',MB_OK+MB_ICONINFORMATION);
    end;
  2:begin
      if clseDate<=formatDatetime('YYYY-MM-DD',date()) then
         MessageBox(Application.MainForm.Handle,pchar('当前登录门店的服务年限已到期，'+#13+'相关服务条款及缴费明细请查看官方网站.'+#13+#13+'网址:www.rspcn.com  QQ:30355701'),'友情提示...',MB_OK+MB_ICONINFORMATION)
      else
      if clseDate<=formatDatetime('YYYY-MM-DD',date()+15) then
         MessageBox(Application.MainForm.Handle,pchar('当前登录门店的服务年限将于'+clseDate+'到期，'+#13+'相关服务条款及缴费明细请查看官方网站.'+#13+#13+'网址:www.rspcn.com  QQ:30355701'),'友情提示...',MB_OK+MB_ICONINFORMATION);
    end;
  end;
except
  on E:Exception do
  begin
     result := true;
  end;
end;
end;

{ rsp }

constructor rsp.Create;
begin
  inherited;

end;

destructor rsp.Destroy;
begin

  inherited;
end;

procedure rsp.SetencryptType(const Value: integer);
begin
  FencryptType := Value;
end;

procedure rsp.SetrspSessionId(const Value: string);
begin
  FrspSessionId := Value;
end;

initialization
  CaFactory := TCaFactory.Create;
  InvRegistry.RegisterInterface(TypeInfo(CaTenantWebServiceImpl), 'http://www.rspcn.com.cn/rsp', 'gb2312');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(CaTenantWebServiceImpl), 'http://www.rspcn.com.cn/rsp#%operationName%');
  InvRegistry.RegisterHeaderClass(TypeInfo(CaTenantWebServiceImpl), rsp, 'rsp', 'http://www.rspcn.com.cn/rsp');
  InvRegistry.RegisterHeaderClass(TypeInfo(CaServiceLineWebServiceImpl), rsp, 'rsp', 'http://www.rspcn.com.cn/rsp');
  InvRegistry.RegisterHeaderClass(TypeInfo(PubMemberWebServiceImpl), rsp, 'rsp', 'http://www.rspcn.com.cn/rsp');
  InvRegistry.RegisterHeaderClass(TypeInfo(RspDownloadWebServiceImpl), rsp, 'rsp', 'http://www.rspcn.com.cn/rsp');
  InvRegistry.RegisterHeaderClass(TypeInfo(CaProductWebServiceImpl), rsp, 'rsp', 'http://www.rspcn.com.cn/rsp');
  RemClassRegistry.RegisterXSClass(rsp, 'http://www.rspcn.com.cn/rsp', 'rsp');
finalization
  CaFactory.Free;
end.

