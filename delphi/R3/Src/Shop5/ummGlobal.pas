unit ummGlobal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uGlobal, IdBaseComponent, IdComponent, IdTCPConnection, msxml,
  IdTCPClient, IdHTTP, ZLogFile, ComObj, IdCookieManager, ZDataSet, ZBase, uShopGlobal,
  DB, ZAbstractRODataset, ZAbstractDataset, ummFactory;

type
  TmmGlobal = class(TShopGlobal)
    IdCookieManager1: TIdCookieManager;
    IdHTTP1: TIdHTTP;
    procedure DataModuleCreate(Sender: TObject);
  private
    Fxsm_password: string;
    Fxsm_username: string;
    Fxsm_challenge: string;
    FLogined: boolean;
    Fxsm_signature: string;
    procedure Setxsm_challenge(const Value: string);
    procedure Setxsm_password(const Value: string);
    procedure Setxsm_username(const Value: string);
    procedure SetLogined(const Value: boolean);
    procedure Setxsm_signature(const Value: string);
    function getFriends: boolean;
    { Private declarations }
  protected
    function CreateXML(xml:string):IXMLDomDocument;
    procedure SaveParams;
    function GetNetVersion: boolean;
    function GetONLVersion: boolean;
  public
    { Public declarations }
    mmFactory:TmmFactory;
    
    constructor Create;
    destructor Destroy;override;
    function getChallenge:boolean;
    function doLogin:boolean;
    function getSignature:boolean;
    procedure InitLoad;

    //���ҵĺ���
    function getAllfriends:boolean;
    //���ҵĺ�����
    function getBlackFriends:boolean;
    //�������ں�����
    function getBeBlackFriends:boolean;


    function getUrlPath:string;
    function coLogin(uid,pwd:string):boolean;
    function CheckRegister:boolean;
    function AutoRegister(isnew:boolean):boolean;
    function xsmLogin:boolean;

    property xsm_username:string read Fxsm_username write Setxsm_username;
    property xsm_password:string read Fxsm_password write Setxsm_password;
    property xsm_challenge:string read Fxsm_challenge write Setxsm_challenge;
    property xsm_signature:string read Fxsm_signature write Setxsm_signature;
    property Logined:boolean read FLogined write SetLogined;
    //�ж��Ƿ�������
    property NetVersion:boolean read GetNetVersion;
    //�ж��Ƿ������
    property ONLVersion:boolean read GetONLVersion;
  end;

var
  mmGlobal: TmmGlobal;

implementation
uses EncDec,uCaFactory,ummFactory,IniFiles;
{$R *.dfm}
var xsmc,xsmurl:string;
{ TmmGlobal }

function TmmGlobal.CheckRegister: boolean;
var
  rs:TZQuery;
begin
  rs := TZQuery.Create(nil);
  try
    rs.SQL.Text := 'select Value from SYS_DEFINE Where Define = ''TENANT_ID'' and TENANT_ID=0 ';
    LocalFactory.Open(rs);
    result := (rs.Fields[0].AsString <> '');
    if result then
       TENANT_ID := StrtoInt(rs.Fields[0].AsString); 
  finally
    rs.Free;
  end;
end;

function TmmGlobal.coLogin(uid, pwd: string): boolean;
begin
  Logined := false;
  result := GetChallenge;
  xsm_username := uid;
  xsm_password := pwd;
  result := doLogin;
  Logined := result;
end;

function TmmGlobal.AutoRegister(isnew:boolean): boolean;
var
  Tenant: TCaTenant;
  Login: TCaLogin;
  rs:TZQuery;
  Params:TftParamList;
begin
  result := false;
  Login := CaFactory.coLogin(xsm_username,CaFactory.DesEncode(xsm_username,CaFactory.pubpwd),3);
  result := login.RET='1';
  if not result then Exit;
  if not isnew then
     begin
       if Login.TENANT_ID<>Global.TENANT_ID then
          begin
            Raise Exception.Create('��ǰ��¼�˺Ÿ�ԭ�˺Ų�����ͬһ��ҵ,����ϵ�ͷ���Ա');
          end;
       //�����ŵ���Ϣ
       CaFactory.downloadShopInfo(Login.TENANT_ID,Login.SHOP_ID,xsm_username,xsm_password,1);
       Exit;
     end;
  //������ҵ��Ϣ
  Tenant := CaFactory.coGetList(IntToStr(Login.TENANT_ID));
  rs := TZQuery.Create(nil);
  Params := TftParamList.Create(nil);
  try
    Params.ParambyName('TENANT_ID').asInteger := Tenant.TENANT_ID;
    LocalFactory.Open(rs,'TTenant',Params);
    rs.Edit;
    rs.FieldByName('TENANT_ID').AsInteger := Tenant.TENANT_ID;
    rs.FieldByName('LOGIN_NAME').AsString := Tenant.LOGIN_NAME;
    rs.FieldByName('TENANT_NAME').AsString := Tenant.TENANT_NAME;
    rs.FieldByName('TENANT_TYPE').AsInteger := Tenant.TENANT_TYPE;
    rs.FieldByName('SHORT_TENANT_NAME').AsString := Tenant.SHORT_TENANT_NAME;
    rs.FieldByName('TENANT_SPELL').AsString := Tenant.TENANT_SPELL;
    rs.FieldByName('LEGAL_REPR').AsString := Tenant.LEGAL_REPR;
    rs.FieldByName('LINKMAN').AsString := Tenant.LINKMAN;
    rs.FieldByName('TELEPHONE').AsString := Tenant.TELEPHONE;
    rs.FieldByName('FAXES').AsString := Tenant.FAXES;
    rs.FieldByName('MSN').AsString := Tenant.MSN;
    rs.FieldByName('QQ').AsString := Tenant.QQ;
    rs.FieldByName('LICENSE_CODE').AsString := Tenant.LICENSE_CODE;
    rs.FieldByName('ADDRESS').AsString := Tenant.ADDRESS;
    rs.FieldByName('POSTALCODE').AsString := Tenant.POSTALCODE;
    rs.FieldByName('REMARK').AsString := Tenant.REMARK;
    rs.FieldByName('PASSWRD').AsString := EncStr(Tenant.PASSWRD,ENC_KEY);
    rs.FieldByName('REGION_ID').AsString := Tenant.REGION_ID;
    rs.FieldByName('SRVR_ID').AsString := Tenant.SRVR_ID;
    rs.FieldByName('PROD_ID').AsString := Tenant.PROD_ID;
    rs.FieldByName('XSM_CODE').AsString := xsm_username;
    rs.FieldByName('XSM_PSWD').AsString := EncStr(xsm_password,ENC_KEY);
    rs.FieldByName('AUDIT_STATUS').AsString := Tenant.AUDIT_STATUS;
    rs.Post;
    LocalFactory.UpdateBatch(rs,'TTenant',nil);
    Global.TENANT_ID := Tenant.TENANT_ID;
    Global.TENANT_NAME := Tenant.TENANT_NAME;
    Global.SHORT_TENANT_NAME := Tenant.SHORT_TENANT_NAME;
    Global.SHOP_ID := inttostr(Tenant.TENANT_ID)+'0001';
    Global.SHOP_NAME := Tenant.TENANT_NAME;
    Global.UserID := inttostr(Tenant.TENANT_ID)+'0001';
    Global.UserName := Tenant.SHORT_TENANT_NAME;
    Global.Roles := 'xsm';
    SaveParams;
    result := true;
  finally
    Params.Free;
    rs.free;
  end;
  //�����ŵ���Ϣ
  CaFactory.downloadShopInfo(Login.TENANT_ID,Login.SHOP_ID,xsm_username,xsm_password,1);
end;

function TmmGlobal.CreateXML(xml: string): IXMLDomDocument;
var
  ErrXml:string;
  w:integer;
begin
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
              if not result.loadXML(ErrXml) then Raise Exception.Create('loadxml������,xml='+xml);
            end;
       end
    else
       Raise Exception.Create('xml�ַ�������Ϊ��...');
  except
    on E:Exception do
       begin
         result := nil;
         LogFile.AddLogFile(0,e.Message);
       end;
  end;
end;

function TmmGlobal.doLogin: boolean;
const
  dec='{1#2$3%4(5)6@7!poeeww$3%4(5)djjkkldss}';
function md5(s:string):string;
begin
  result := md5Encode(s+dec);
end;
var
  Doc:IXMLDomDocument;
  Root:IXMLDOMElement;    
  xml:string;
begin
  xsm_signature := IdHTTP1.Get(xsmc+'users/dologin/up?j_username='+xsm_username+'&j_password='+md5(md5(xsm_password)+xsm_challenge));
  xml := Utf8ToAnsi(xsm_signature);
  Doc := CreateXML(xml);
  xsm_signature := xml;
  if not Assigned(doc) then Raise Exception.Create('�����¼ʧ��...');
  Root :=  doc.DocumentElement;
  if not Assigned(Root) then Raise Exception.Create('Url��ַ������ЧXML�ĵ��������¼ʧ��...');
  if Root.attributes.getNamedItem('code')=nil then Raise Exception.Create('Url��ַ������ЧXML�ĵ��������¼ʧ��...');
  if Root.attributes.getNamedItem('code').text<>'0000' then Raise Exception.Create('�����������¼ʧ��,����:'+Root.attributes.getNamedItem('msg').text);
  result := true;
end;

function TmmGlobal.getChallenge: boolean;
var
  F:TIniFile;
  List:TStringList;
  Doc:IXMLDomDocument;
  Root:IXMLDOMElement;
  xml:string;
begin
  result := false;
  F := TIniFile.Create(ExtractFilePath(ParamStr(0))+'db.cfg');
  List := TStringList.Create;
  try
    xsmc := f.ReadString('H_'+f.ReadString('db','srvrId','default'),'srvrPath','');
    if xsmc='' then xsmc := ''
       else
       begin
         List.CommaText := xsmc;
         xsmc := List.Values['xsmc'];
         xsmurl := List.Values['xsm'];
       end;
    xml := IdHTTP1.Get(xsmc+'users/forlogin');
    xml := Utf8ToAnsi(xml);
    Doc := CreateXML(xml);
    if not Assigned(doc) then Raise Exception.Create('�����¼ʧ��...');
    Root :=  doc.DocumentElement;
    if not Assigned(Root) then Raise Exception.Create('Url��ַ������ЧXML�ĵ�������У����ʧ��...');
    if Root.attributes.getNamedItem('code')=nil then Raise Exception.Create('Url��ַ������ЧXML�ĵ�������У����ʧ��...');
    if Root.attributes.getNamedItem('code').text<>'0000' then Raise Exception.Create('����У����ʧ��,����:'+Root.attributes.getNamedItem('msg').text);
    xsm_challenge := Root.childNodes[0].text;
    result := true;
  finally
    List.free;
    try
      F.Free;
    except
    end;
  end;
end;

function TmmGlobal.getSignature: boolean;
var
  Doc:IXMLDomDocument;
  Root:IXMLDOMElement;    
  xml:string;
begin
  try
    xsm_signature := IdHTTP1.Get(xsmc+'users/gettoken');
    xml := Utf8ToAnsi(xsm_signature);
    Doc := CreateXML(xml);
    xsm_signature := xml;
    if not Assigned(doc) then Raise Exception.Create('��������ʧ��...');
    Root :=  doc.DocumentElement;
    if not Assigned(Root) then Raise Exception.Create('Url��ַ������ЧXML�ĵ�����������ʧ��...');
    if Root.attributes.getNamedItem('code')=nil then Raise Exception.Create('Url��ַ������ЧXML�ĵ�����������ʧ��...');
    if Root.attributes.getNamedItem('code').text<>'0000' then Raise Exception.Create('��������ʧ��,����:'+Root.attributes.getNamedItem('msg').text);
    result := true;
  except
    logined := false;
    Raise;
  end;
end;

procedure TmmGlobal.SetLogined(const Value: boolean);
begin
  FLogined := Value;
end;

procedure TmmGlobal.Setxsm_challenge(const Value: string);
begin
  Fxsm_challenge := Value;
  uShopGlobal.xsm_challenge := value;
end;

procedure TmmGlobal.Setxsm_password(const Value: string);
begin
  Fxsm_password := Value;
  uShopGlobal.xsm_password := value;
end;

procedure TmmGlobal.Setxsm_signature(const Value: string);
begin
  Fxsm_signature := Value;
  uShopGlobal.xsm_signature := value;
end;

procedure TmmGlobal.Setxsm_username(const Value: string);
begin
  Fxsm_username := Value;
  uShopGlobal.xsm_username := value;
end;

procedure TmmGlobal.SaveParams;
begin
  if LocalFactory.ExecSQL('update SYS_DEFINE set VALUE='''+inttostr(TENANT_ID)+''' where TENANT_ID=0 and DEFINE=''TENANT_ID''')=0 then
     LocalFactory.ExecSQL('insert into SYS_DEFINE (TENANT_ID,DEFINE,VALUE,VALUE_TYPE,COMM,TIME_STAMP) values(0,''TENANT_ID'','''+inttostr(TENANT_ID)+''',0,''00'',5497000)');
  if LocalFactory.ExecSQL('update SYS_DEFINE set VALUE='''+inttostr(TENANT_ID)+''' where TENANT_ID='+inttostr(TENANT_ID)+' and DEFINE=''TENANT_ID''')=0 then
     LocalFactory.ExecSQL('insert into SYS_DEFINE (TENANT_ID,DEFINE,VALUE,VALUE_TYPE,COMM,TIME_STAMP) values('+inttostr(TENANT_ID)+',''TENANT_ID'','''+inttostr(TENANT_ID)+''',0,''00'',5497000)');
end;

procedure TmmGlobal.InitLoad;
var
  F:TIniFile;
begin
  inherited;
  F := TIniFile.Create(ExtractFilePath(ParamStr(0))+'r3.cfg');
  try
    SFVersion := F.ReadString('soft','SFVersion','.NET');
    CLVersion := F.ReadString('soft','CLVersion','.MKT');
    ProductID := F.ReadString('soft','ProductID','R3_RYC');
  finally
    try
      F.Free;
    except
    end;
  end;
end;

function TmmGlobal.GetNetVersion: boolean;
begin
  result := (SFVersion='.NET') and not Debug;
end;

function TmmGlobal.GetONLVersion: boolean;
begin
  result := (SFVersion='.ONL') or Debug;
end;

function TmmGlobal.xsmLogin: boolean;
var
  Temp:TZQuery;
begin
  result:= false;
  Temp := TZQuery.Create(nil);
  try
    Temp.Close;
    Temp.SQL.Text := 'select XSM_CODE,XSM_PSWD from CA_SHOP_INFO where COMM not in (''02'',''12'') and TENANT_ID='+IntToStr(TENANT_ID)+' and SHOP_ID='''+SHOP_ID+'''';
    Global.LocalFactory.Open(Temp);
    if Temp.Fields[0].asString<>'' then
       begin
         coLogin(Temp.Fields[0].AsString,DecStr(Temp.Fields[0].AsString,ENC_KEY));
         result := true;
       end
    else
       Raise Exception.Create('��ǰ��¼�ŵ�û���������˺�...');
  finally
    Temp.Free;
  end;
end;

procedure TmmGlobal.DataModuleCreate(Sender: TObject);
begin
  inherited;
  Logined := false;
end;

function TmmGlobal.getFriends: boolean;
begin

end;

function TmmGlobal.getUrlPath: string;
var
  vList:TStringList;
begin
  vList := TStringList.Create;
  try
    vList.Delimiter := '/';
    vList.DelimitedText := xsmurl;
    vList.Delete(vList.Count-1);
    result := vList.DelimitedText;
  finally
    vList.Free;
  end;
end;

constructor TmmGlobal.Create;
begin
  inherited;
  mmFactory := TmmFactory.Create;
  mmFactory.idHttp := IdHTTP1;
end;

destructor TmmGlobal.Destroy;
begin
  mmFactory.free;
  inherited;
end;

function TmmGlobal.getAllfriends: boolean;
var
  url:string;
begin
  url := getUrlPath+'';
end;

function TmmGlobal.getBeBlackFriends: boolean;
begin

end;

function TmmGlobal.getBlackFriends: boolean;
begin

end;

end.