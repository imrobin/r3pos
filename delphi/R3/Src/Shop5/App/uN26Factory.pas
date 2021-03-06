unit uN26Factory;

interface

uses
  SysUtils, Classes,windows,messages,ZLogFile,
  IdTCPConnection, IdTCPClient, IdHTTP, IdCookieManager, IdBaseComponent, IdComponent,
  xmldom, XMLIntf, msxml, ActiveX, ComObj, ZBase,
  msxmldom, XMLDoc, Forms, N26base64, HTTPApp, ZDataSet;
const
  WM_GET_PLAYLIST=WM_USER+3952;
type
  TN26Factory = class(TDataModule)
    IdHTTP1: TIdHTTP;
    IdCookieManager1: TIdCookieManager;
  private
    FN26PassWord: string;
    FN26UserName: string;
    FN26Url: string;
    FN26Token: string;
    FLogined: boolean;
    { Private declarations }
    procedure ReadParam;
    procedure SetN26PassWord(const Value: string);
    procedure SetN26Token(const Value: string);
    procedure SetN26Url(const Value: string);
    procedure SetN26UserName(const Value: string);
    procedure SetLogined(const Value: boolean);
    function FindElement(root:IXMLDOMNode;s:string):IXMLDOMNode;
    function FindNode(doc:IXMLDomDocument;tree:string;CheckExists:boolean=true):IXMLDOMNode;
    function EncodeLoginUrl: string;
    function getPlayerHandle: THandle;
  public
    { Public declarations }
    function Checked:integer;
    function coAutoLogin:boolean;
    function coLogin(username:string;password:string):boolean;
    function coPlayList:boolean;
    function EncodeUrl:string;
    property N26Url:string read FN26Url write SetN26Url;
    property N26UserName:string read FN26UserName write SetN26UserName;
    property N26PassWord:string read FN26PassWord write SetN26PassWord;
    property N26Token:string read FN26Token write SetN26Token;
    property Logined:boolean read FLogined write SetLogined;
    property PlayerHandle:THandle read getPlayerHandle;
  end;

var
  N26Factory: TN26Factory;

implementation
 uses EncDec,IniFiles,uGlobal,uCaFactory;
{$R *.dfm}

function md5(s:string):string;
begin
  result := HTTPEncode(md5Encode(s));
end;
function base64(s:string):string;
begin
  result := HTTPEncode(Base64EncodeStr(s));
end;

{ TN26Factory }

function TN26Factory.Checked: integer;
var
  F:TIniFile;
begin
  F := TIniFile.Create(ExtractFilePath(Application.ExeName)+'r3.cfg');
  try
    result := F.ReadInteger('soft','N26Version',0);
  finally
    try
      F.Free;
    except
    end;
  end;
end;

function TN26Factory.coAutoLogin: boolean;
var
  rs:TZQuery;
begin
  result := true;
  if Checked=0 then Exit;
  result := false;
  ReadParam;
  rs := TZQuery.Create(nil);
  try
    rs.SQL.Text := 'select XSM_CODE,XSM_PSWD from CA_SHOP_INFO where TENANT_ID=:TENANT_ID and SHOP_ID=:SHOP_ID';
    rs.ParambyName('TENANT_ID').asInteger := Global.TENANT_ID;
    rs.ParambyName('SHOP_ID').asString := Global.SHOP_ID;
    Factor.Open(rs);
    N26UserName := rs.Fields[0].asString;
    N26PassWord := DecStr(rs.Fields[1].asString,ENC_KEY);
    if N26UserName='' then Raise Exception.Create('没找到网上订货用户密码，无法直接登录.');
  finally
    rs.free;
  end;
  result := coLogin(N26UserName,N26PassWord);
end;

function TN26Factory.coLogin(username, password: string): boolean;
var
  doc:IXMLDomDocument;
  s:string;
begin
  result := true;
  if Checked=0 then Exit;
  ReadParam;
  result := false;
  if N26Url<>'' then
  begin
    try
      doc := CreateOleObject('Microsoft.XMLDOM')  as IXMLDomDocument;
      s := idHTTP1.Get(N26Url+'caLogin.do?username='+base64(username)+'&password='+base64(password));
      doc.loadXML(s);
      if FindNode(doc,'header\pub\recAck',true).text<>'0000' then Raise Exception.Create('请求登录失败,错误:'+FindNode(doc,'header\pub\msg',true).text);
      N26Token := FindNode(doc,'header\pub\token',true).text;
      N26UserName := username;
      N26Password := password;
      result := true;
    except
      on E:Exception do
         begin
           Raise;
         end;
    end;
  end
  else
    Raise Exception.Create('认证中心服务器地址没有配置，请联系客服人员!');
  Logined := result;
end;

function TN26Factory.coPlayList: boolean;
var
  doc:IXMLDomDocument;
  s,id,filename:string;
  playListResp,Play:IXMLDOMNode;
  F:TIniFile;
  rc,i:integer;
  list:TStringList;
begin
  result := false;
  if Checked=0 then Exit;
  if not CaFactory.Audited then Exit;
  if not Logined then
     begin
       try
         if not coAutoLogin then Exit;
       except
         Exit;
       end;
     end;
  if not fileExists(ExtractFilePath(ParamStr(0))+'mmPlayer.exe') then Exit;
  if N26Url<>'' then
  begin
    try
      doc := CreateOleObject('Microsoft.XMLDOM')  as IXMLDomDocument;
      s := idHTTP1.Get(N26Url+'playList.do??token='+HTTPEncode(N26Token));
      doc.loadXML(s);
      if FindNode(doc,'header\pub\recAck',true).text<>'0000' then Raise Exception.Create('请求广告节目失败了,错误:'+FindNode(doc,'header\pub\msg',true).text);
      F := TIniFile.Create(ExtractFilePath(ParamStr(0))+'adv\playlist.ini');
      list := TStringList.Create;
      try
        playListResp := FindNode(doc,'body\playListResp');
        if playListResp<>nil then
        begin
          Play := playListResp.firstChild;
          f.ReadSections(list);
          for i:=0 to list.Count -1 do
            begin
              if (list[i]<>'adv') then
                 f.EraseSection(list[i]); 
            end;
          rc := 0;
          while Play<>nil do
             begin
               id := play.attributes.getNamedItem('id').nodeValue;
               if id<>'' then
                  begin
                    filename := ExtractFilePath(ParamStr(0))+'adv\'+id+'.'+play.attributes.getNamedItem('mediaType').nodeValue;
                    f.WriteString(id,'filename',filename);
                    f.WriteString(id,'title',play.attributes.getNamedItem('name').nodeValue);
                    f.WriteString(id,'url',play.attributes.getNamedItem('url').nodeValue);
                    if not fileExists(filename) then
                       begin
                         inc(rc);
                         f.WriteString(id,'ready','0');
                       end
                    else
                       begin
                         f.WriteString(id,'ready','1');
                       end;
                  end;
               Play := Play.nextSibling;
             end;
        end;
      finally
        list.Free;
        f.Free;
      end;
      result := (rc>0);
      if result then
         PostMessage(playerHandle,WM_GET_PLAYLIST,0,0);
    except
      on E:Exception do
         begin
           LogFile.AddLogFile(0,E.Message); 
         end;
    end;
  end;
end;

function TN26Factory.EncodeLoginUrl: string;
var
  rs:TZQuery;
begin
  ReadParam;
  rs := TZQuery.Create(nil);
  try
    rs.SQL.Text := 'select XSM_CODE,XSM_PSWD from CA_SHOP_INFO where TENANT_ID=:TENANT_ID and SHOP_ID=:SHOP_ID';
    rs.ParambyName('TENANT_ID').asInteger := Global.TENANT_ID;
    rs.ParambyName('SHOP_ID').asString := Global.SHOP_ID;
    Factor.Open(rs);
    N26UserName := rs.Fields[0].asString;
    N26PassWord := DecStr(rs.Fields[1].asString,ENC_KEY);
    if N26UserName='' then Raise Exception.Create('没找到网上订货用户密码，无法直接登录.');
  finally
    rs.free;
  end;
  result := '';
  if N26Url<>'' then
  begin
     result := N26Url+'caLogin.do?username='+base64(N26UserName)+'&password='+base64(N26PassWord);
  end;
end;

function TN26Factory.EncodeUrl: string;
begin
  result := N26Url+'loginByToken.do?token='+HTTPEncode(N26Token);
end;

function TN26Factory.FindElement(root: IXMLDOMNode;
  s: string): IXMLDOMNode;
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

function TN26Factory.FindNode(doc: IXMLDomDocument; tree: string;
  CheckExists: boolean): IXMLDOMNode;
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

function TN26Factory.getPlayerHandle: THandle;
var
  F:TIniFile;
begin
  F := TIniFile.Create(ExtractFilePath(ParamStr(0))+'mmPlayer.ini');
  try   
    result:=F.ReadInteger('config','Handle',0);
  finally
    F.Free;
  end;
end;

procedure TN26Factory.ReadParam;
var
  F:TIniFile;
  List:TStringList;
  Params:TftParamList;
  Msg:string;
begin
  if N26Url<>'' then Exit;
  F := TIniFile.Create(ExtractFilePath(ParamStr(0))+'db.cfg');
  List := TStringList.Create;
  try
    N26Url := f.ReadString('H_'+f.ReadString('db','srvrId','default'),'srvrPath','');
    if N26Url='' then N26Url := ''
       else
       begin
         List.CommaText := N26Url;
         N26Url := List.Values['rim'];
         if N26Url<>'' then
           begin
             if N26Url[Length(N26Url)]<>'/' then N26Url := N26Url+'/';
           end;
       end;
  finally
    List.free;
    try
      F.Free;
    except
    end;
  end;
end;

procedure TN26Factory.SetLogined(const Value: boolean);
begin
  FLogined := Value;
end;

procedure TN26Factory.SetN26PassWord(const Value: string);
begin
  FN26PassWord := Value;
end;

procedure TN26Factory.SetN26Token(const Value: string);
begin
  FN26Token := Value;
end;

procedure TN26Factory.SetN26Url(const Value: string);
begin
  FN26Url := Value;
end;

procedure TN26Factory.SetN26UserName(const Value: string);
begin
  FN26UserName := Value;
end;

initialization
  N26Factory := TN26Factory.Create(Application);
finalization
end.
