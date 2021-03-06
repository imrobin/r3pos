unit ufrmXsmIEBrowser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmIEWebForm, ActnList, Menus, OleCtrls, SHDocVw, ExtCtrls,
  RzPanel, RzTabs, ImgList,LCContrllerLib, ZDataSet, StdCtrls, msxml, ActiveX, ComObj,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  IdCookieManager;
const
  WM_XSM_CALL=WM_USER+1058;
  WM_DESKTOP_REQUEST=WM_USER+11;
  WM_XSM_ERROR=WM_USER+1059;
type
  TLC_Config=procedure(callMsgId:integer;errMsgId:integer;errMsgHwnd:integer);stdcall;
  TLC_Create=function(szName:pchar;hwnd:integer):integer;stdcall;
  TLC_Close=function(szName:pchar):integer;stdcall;
  TLC_Send=function(szName:pchar;szMethod:pchar;para1:pchar):integer;stdcall;
  TLC_Send2=function(szName:pchar;szMethod:pchar;para1:pchar;para2:pchar):integer;stdcall;
  TLC_Send3=function(szName:pchar;szMethod:pchar;para1:pchar;para2:pchar;para3:pchar):integer;stdcall;
  TLC_FreeMsgMem=function(wparam:integer;lparam:integer):integer;stdcall;
  TLC_FreeLibrary=procedure();


  TfrmXsmIEBrowser = class(TfrmIEWebForm)
    IdHTTP1: TIdHTTP;
    IdCookieManager1: TIdCookieManager;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure IEBrowserTitleChange(Sender: TObject;
      const Text: WideString);
  private
    XsmTitle:string;
    FLogined: boolean;
    Fready: boolean;
    LoginError:string;
    FSessionFail: boolean;
    FCurid: string;
    Ffinish: boolean;
    Fconfirm: boolean;
    SaveHandle:THandle;
    FConnectTimeOut: integer;
    FCommandTimeOut: integer;


    DLLHandle:THandle;
    DLLLC_Config:TLC_Config;
    DLLLC_Create:TLC_Create;
    DLLLC_Close:TLC_Close;
    DLLLC_Send:TLC_Send;
    DLLLC_Send2:TLC_Send2;
    DLLLC_Send3:TLC_Send3;
    DLLLC_FreeMsgMem:TLC_FreeMsgMem;
    DLLLC_FreeLibrary:TLC_FreeLibrary;

    SenceId:string;
    FSenceReady: boolean;
    Fmmc: boolean;
    Ferror: boolean;
    FOpening: boolean;

    { Private declarations }
    procedure DoFuncCall(ASender: TObject; const szMethodName: WideString;
                                                   const szPara: WideString);
    procedure DoFuncCall2(ASender: TObject; const szMethodName: WideString;
                                                   const szPara1: WideString;
                                                   const szPara2: WideString);
    procedure DoFuncCall3(ASender: TObject; const szMethodName: WideString;
                                                   const szPara1: WideString;
                                                   const szPara2: WideString;
                                                   const szPara3: WideString);

    //接收组件返回的消息
    procedure DoMsg(var Message: TMessage);
    procedure XSM_CALL_FUNC(var Message: TMessage); message WM_XSM_CALL;
    procedure XSM_CALL_ERROR(var Message: TMessage); message WM_XSM_ERROR;

    function  getUrlPath:string;
    procedure SetLogined(const Value: boolean);
    procedure Setready(const Value: boolean);
    procedure SetSessionFail(const Value: boolean);
    procedure Setfinish(const Value: boolean);
    procedure Setconfirm(const Value: boolean);
    procedure DoMsgFilter(var Msg: TMsg; var Handled: Boolean);
    procedure SetCommandTimeOut(const Value: integer);
    procedure SetConnectTimeOut(const Value: integer);
    procedure LoadFormat;override;
    procedure SaveFormat;override;

    //新商盟登录
    function CreateXML(xml:string):IXMLDomDocument;
    function FindElement(root:IXMLDOMNode;s:string):IXMLDOMNode;

    function GetChallenge:boolean;
    function DoForLogin(checked:boolean=false):boolean;
    procedure SetSenceReady(const Value: boolean);
    procedure Setmmc(const Value: boolean);
    function CheckInited:boolean;
    procedure Seterror(const Value: boolean);
    procedure SetOpening(const Value: boolean);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy;override;
    procedure Connect;
    function GetSignature:boolean;
    function EncodeXml(objectId:string):string;
    procedure FreeLcControl;

    procedure Send(const szMethodName: string;const szPara: string);
    procedure Send2(const szMethodName: string;const szPara1: string;const szPara2: string);
    procedure Send3(const szMethodName: string;const szPara1: string;const szPara2: string;const szPara3: string);

    function WaitRun(WaitOutTime:integer=20000):boolean;
    procedure DoRefresh;
    procedure DoInit(Wait:boolean=false);
    procedure ReadInfo(checked:boolean=false);
    function DoLogin(Hinted:boolean=false):boolean;
    function XsmLogin(checked:boolean=false):boolean;
    procedure ClearResource;
    function Open(sid,oid:string;hHandle:THandle):boolean;
    property Logined:boolean read FLogined write SetLogined;
    property ready:boolean read Fready write Setready;
    property SessionFail:boolean read FSessionFail write SetSessionFail;
    property finish:boolean read Ffinish write Setfinish;
    property confirm:boolean read Fconfirm write Setconfirm;
    property ConnectTimeOut:integer read FConnectTimeOut write SetConnectTimeOut;
    property CommandTimeOut:integer read FCommandTimeOut write SetCommandTimeOut;
    property SenceReady:boolean read FSenceReady write SetSenceReady;
    property mmc:boolean read Fmmc write Setmmc;
    property error:boolean read Ferror write Seterror;
    property Opening:boolean read FOpening write SetOpening;
  end;
var
  frmXsmIEBrowser:TfrmXsmIEBrowser;
implementation
uses uCaFactory,ufrmMain,uCtrlUtil,IniFiles,uShopGlobal,EncDec,ufrmLogo,ZLogFile,ufrmXsmLogin,
  ufrmDesk, uGlobal,uMsgBox, ObjCommon,ufrmHintMsg, uMMClient;
{$R *.dfm}

{ TfrmXsmIEBrowser }

constructor TfrmXsmIEBrowser.Create(AOwner: TComponent);
var
  F:TIniFile;
begin
  inherited;
  mmc := false;
  Opening := false;
  SessionFail := true;
  F := TIniFile.Create(ExtractFilePath(ParamStr(0))+'r3.cfg');
  try
    ConnectTimeOut := F.ReadInteger('xsm','connectTimeout',60000);
    CommandTimeOut := F.ReadInteger('xsm','commandTimeout',30000);
  finally
    try
      F.Free;
    except
    end;
  end;
  FormStyle := fsMDIChild;
  left := -9000;
  try
    DLLHandle := LoadLibrary(Pchar(ExtractFilePath(ParamStr(0))+'LCControlDll.dll'));
    if DLLHandle=0 then Raise Exception.Create('没找到LCControlDll.dll');
    @DLLLC_Config := GetProcAddress(DLLHandle, 'LC_Config');
    if @DLLLC_Config=nil then Raise Exception.Create('LC_Config方法没有实现');
    @DLLLC_Create := GetProcAddress(DLLHandle, 'LC_Create');
    if @DLLLC_Create=nil then Raise Exception.Create('LC_Create方法没有实现');
    @DLLLC_Close := GetProcAddress(DLLHandle, 'LC_Close');
    if @DLLLC_Close=nil then Raise Exception.Create('LC_Close方法没有实现');
    @DLLLC_Send := GetProcAddress(DLLHandle, 'LC_Send');
    if @DLLLC_Send=nil then Raise Exception.Create('LC_Send方法没有实现');
    @DLLLC_Send2 := GetProcAddress(DLLHandle, 'LC_Send2');
    if @DLLLC_Send2=nil then Raise Exception.Create('LC_Send2方法没有实现');
    @DLLLC_Send3 := GetProcAddress(DLLHandle, 'LC_Send3');
    if @DLLLC_Send3=nil then Raise Exception.Create('LC_Send3方法没有实现');
    @DLLLC_FreeMsgMem := GetProcAddress(DLLHandle, 'LC_FreeMsgMem');
    if @DLLLC_FreeMsgMem=nil then Raise Exception.Create('LC_FreeMsgMem方法没有实现');
    @DLLLC_FreeLibrary := GetProcAddress(DLLHandle, 'LC_FreeLibrary');
    if @DLLLC_FreeLibrary=nil then Raise Exception.Create('LC_FreeLibrary方法没有实现');
    Connect;
    SenceReady := false;
    SenceId := 'GWGC';
  except
    ShowMsgBox('系统没有检测到"新商盟接口组件",请检查软件是否正确安装?','友情提示...',MB_OK+MB_ICONWARNING);
  end;
  Set8087CW(Longword($133f));
end;

destructor TfrmXsmIEBrowser.Destroy;
begin
  runed := false;
  FreeLcControl;
  IEBrowser.Free;
  inherited;
  frmXsmIEBrowser := nil;
end;

procedure TfrmXsmIEBrowser.DoFuncCall3(ASender: TObject;
  const szMethodName, szPara1, szPara2, szPara3: WideString);
var
  Msg:PMsgInfo;
  Doc:IXMLDomDocument;
  Node:IXMLDOMNode;
begin
  runed := false;
  if szMethodName='MsgNotify' then //接收消息
     begin
       Doc := CreateXml(szPara3);
       if Doc=nil then Exit;
       Node := Doc.documentElement;
       if Node=nil then Exit;
       try
          Msg := MsgFactory.FindMsg(FindElement(Node,'id').text);
          if Msg=nil then
          begin
            new(Msg);
            Msg^.SenceId := szPara1;
            Msg^.Action := szPara2;
            Msg^.ID := FindElement(Node,'id').text;
            Msg^.Title := FindElement(Node,'title').text;
            Msg^.Contents := FindElement(Node,'content').text;
            Msg^.SndDate := FindElement(Node,'sendDate').text;
            Msg^.Msg_Class := 0;
            Msg^.sFlag := 100;
            MsgFactory.Add(Msg);
            MsgFactory.MsgRead[Msg] := False;
            MsgFactory.Opened := true;
          end
       except
          on E:Exception do
             LogFile.AddLogFile(0,'处理消息出错了'+e.Message);
       end;
     end;
  LogFile.AddLogFile(0,'FuncCall3:方法='+szMethodName+' 参数1='+szPara1+' 参数2='+szPara2+' 参数3='+szPara3);
end;

function TfrmXsmIEBrowser.DoLogin(Hinted:boolean=false):boolean;
var
  _Start:Int64;
  SaveLog:Boolean;
begin
  result := false;
  if not CheckInited then DoInit(true);
  if not ready then
     begin
       if ShowMsgBox('系统正在装载新商盟环境,是否继续？','友情提示...',MB_YESNO+MB_ICONQUESTION)<>6 then
       begin
         PageHandle := 0;
         PostMessage(frmMain.Handle,WM_DESKTOP_REQUEST,0,0);
       end;
       Exit;
     end;
  SaveLog := frmLogo.Visible;
  if not SaveLog then frmLogo.Show;
  frmLogo.ShowTitle := '正在登录新商盟...';
  try
    if not GetSignature then Exit;
//  修改成带场景的    
//    Send('login',xsm_signature);
    Send2('login',xsm_signature,SenceId);
    if not WaitRun(ConnectTimeOut) then Logined := false;
    result := Logined;
    if Hinted and not result then
       begin
         if LoginError='' then LoginError := '未错误类型...';
         LoginError := '登录新商盟失败了，错误:'+LoginError;
         ShowMsgBox(pchar(LoginError),'友情提示...',MB_OK+MB_ICONINFORMATION);
       end;
  finally
    if not SaveLog then frmLogo.Close;
  end;
end;

procedure TfrmXsmIEBrowser.SetLogined(const Value: boolean);
begin
  FLogined := Value;
  SessionFail := false;
end;

procedure TfrmXsmIEBrowser.DoFuncCall(ASender: TObject; const szMethodName,
  szPara: WideString);
var Action:TAction;
begin
  if szMethodName='ready' then
     begin
       ready := true;
       if SessionFail then Exit;
       Send2('login',xsm_signature,SenceId);
     end;
  if szMethodName='loginReady' then
     ready := true;
  if szMethodName='loginStatus' then
     begin
       Logined := (szPara='success');
       if szPara='getUrlconfigFail' then
          LoginError := '无效Url,代码:'+szPara
       else
       if szPara='serviceFail' then
          LoginError := '无效服务,代码:'+szPara
       else
       if szPara='approveFail' then
          LoginError := '登录新商盟的用户或密码无效，请重新设置....'
       else
       if szPara='getInforFail' then
          LoginError := '无效信息,代码:'+szPara
       else
          LoginError := '返回未知错误...';
       SenceReady := Logined;
       if not Logined then
         begin
           PageHandle := 0;
           PostMessage(frmMain.Handle,WM_DESKTOP_REQUEST,0,0);
         end;
     end;
  if szMethodName='sessionFail' then
     begin
       DoRefresh;
       Logined := false;
       SessionFail := true;
       PostMessage(frmMain.Handle,WM_DESKTOP_REQUEST,0,0);
       LoginError := 'Session失效了，请重新点击...';
     end;
  if szMethodName='windowClose' then
     begin
       PageHandle := 0;
       PostMessage(frmMain.Handle,WM_DESKTOP_REQUEST,0,0);
     end;
  if szMethodName='finish' then
     begin
       finish := (szPara = 'finish') or (szPara = 'ready');
       confirm := (szPara = 'refuse');
     end;
  if szMethodName='kickOut' then
     begin
       Logined := false;
       ready := false;
       DoRefresh;
       PostMessage(frmMain.Handle,WM_DESKTOP_REQUEST,0,0);
     end;
  if szMethodName='loginReady' then
     Logined := true;
  LogFile.AddLogFile(0,'FuncCall:方法='+szMethodName+' 参数1='+szPara);
  runed := false;
end;

procedure TfrmXsmIEBrowser.DoFuncCall2(ASender: TObject;
  const szMethodName, szPara1, szPara2: WideString);
var s:string;
begin
  if szMethodName='loginStatus' then
     begin
       Logined := (szPara1='success');
       if szPara1='getUrlconfigFail' then
          LoginError := '无效Url,代码:'+szPara1
       else
       if szPara1='serviceFail' then
          LoginError := '无效服务,代码:'+szPara1
       else
       if szPara1='approveFail' then
          LoginError := '登录新商盟的用户或密码无效，请重新设置....'
       else
       if szPara1='getInforFail' then
          LoginError := '无效信息,代码:'+szPara1
       else
          LoginError := '返回未知错误...';
       xsm_signature := szPara2;
     end;
  if szMethodName='error' then
     begin
        frmDesk.Waited := false;
        error := true;
        if (szPara1='9901') or (szPara1='9001') then
           ShowMsgBox('<新商盟>网络连接异常请重新尝试','友情提示...',MB_OK+MB_ICONWARNING)
        else
        if (szPara1='9902') then
           begin
             xsmTitle := 'error';
             ShowMsgBox('<新商盟>请关闭IE版的新商盟再重试','友情提示...',MB_OK+MB_ICONWARNING);
           end
        else
           begin
             if szPara1='9904' then
                begin
                   Logined := false;
                   ready := false;
                   DoRefresh;
                   PostMessage(frmMain.Handle,WM_DESKTOP_REQUEST,0,0);
                end;
             ShowMsgBox('<新商盟>其他错误异常请重新尝试','友情提示...',MB_OK+MB_ICONWARNING);
           end;
     end;
  runed := false;
  LogFile.AddLogFile(0,'FuncCall2:方法='+szMethodName+' 参数1='+szPara1+' 参数2='+szPara2);
end;

procedure TfrmXsmIEBrowser.Connect;
var r:integer;
begin

  DLLLC_Config(WM_XSM_CALL,WM_XSM_ERROR,Handle);

  r := DLLLC_Close('_R3_XSM');
  if r>1 then
     begin
       LogFile.AddLogFile(0,'初始化新商盟DLLLC_Create失败，失败代码:'+inttostr(r));
       FreeLcControl;
       Exit;
     end;
  r := DLLLC_Close('_XSM_R3');
  if r>1 then
     begin
       LogFile.AddLogFile(0,'初始化新商盟DLLLC_Create失败，失败代码:'+inttostr(r));
       FreeLcControl;
       Exit;
     end;
  r := DLLLC_Close('xinshangmeng.com:xsmapp');
  if r>1 then
     begin
       LogFile.AddLogFile(0,'初始化新商盟DLLLC_Create失败，失败代码:'+inttostr(r));
       FreeLcControl;
       Exit;
     end;
  r := DLLLC_Create('_XSM_R3',Handle);
  if r>2 then
     begin
       LogFile.AddLogFile(0,'初始化新商盟DLLLC_Create失败，失败代码:'+inttostr(r));
       FreeLcControl;
       Exit;
     end;
end;

procedure TfrmXsmIEBrowser.Send(const szMethodName, szPara:String);
var r:integer;
begin
  runed := true;
  r := DLLLC_Send('_R3_XSM',pchar(szMethodName),Pchar(szPara));
  LogFile.AddLogFile(0,'发送<'+szMethodName+'>p1='+szPara+'，代码:'+inttostr(r))
end;

procedure TfrmXsmIEBrowser.Send2(const szMethodName, szPara1,
  szPara2: string);
var r:integer;
begin
  runed := true;
  r := DLLLC_Send2('_R3_XSM',pchar(szMethodName),Pchar(szPara1),Pchar(szPara2));
  LogFile.AddLogFile(0,'发送<'+szMethodName+'>p1='+szPara1+',p2='+szPara2+'，代码:'+inttostr(r));
end;

procedure TfrmXsmIEBrowser.Send3(const szMethodName, szPara1, szPara2,
  szPara3: string);
var r:integer;
begin
  runed := true;
  r := DLLLC_Send3('_R3_XSM',pchar(szMethodName),Pchar(szPara1),Pchar(szPara2),Pchar(szPara3));
  LogFile.AddLogFile(0,'发送<'+szMethodName+'>p1='+szPara1+',p2='+szPara2+',p3='+szPara3+'，代码:'+inttostr(r));
end;

procedure TfrmXsmIEBrowser.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  inherited;
//  FormStyle := fsNormal;
end;

function TfrmXsmIEBrowser.Open(sid, oid: string;hHandle:THandle):boolean;
var Hinted:boolean;
begin
  if DLLHandle=0 then Raise Exception.Create('系统装载LCControl.dll组件失败，新商盟相关模块将不能使用，请重启系统再重试');
  Hinted := Runed or Opening;
  if Hinted then
     begin
       ShowMsgBox('新商盟正在执行中,请稍候再试...','友情提示...',MB_OK+MB_ICONINFORMATION);
       if Runed or Opening then frmLogo.Show;
       Exit;
     end;
  SaveHandle := PageHandle;
  Opening := true;
  try
  PageHandle := hHandle;
  WindowState := wsMaximized;
  BringToFront;
  result := false;
  if not CheckInited then DoInit(true);
  if not CaFactory.Audited then
     begin
       ShowMsgBox('脱机状态不能进入此模块...','友情提示...',MB_OK+MB_ICONINFORMATION);
       Exit;
     end;
  if not ready then
     begin
       if ShowMsgBox('系统正在装载新商盟环境,是否继续？','友情提示...',MB_YESNO+MB_ICONQUESTION)<>6 then
       begin
         PageHandle := 0;
         SaveHandle := 0;
         PostMessage(frmMain.Handle,WM_DESKTOP_REQUEST,0,0);
       end;
       Exit;
     end;
  if SessionFail then XsmLogin(false);
  if SessionFail then
     begin
       PageHandle := 0;
       SaveHandle := 0;
       PostMessage(frmMain.Handle,WM_DESKTOP_REQUEST,0,0);
       Exit;
     end;
{
  if SessionFail then
     begin
       if TfrmXsmLogin.XsmRegister(true) then
          begin
            if not XsmLogin(false) then
               Open(sid,oid,hHandle);
          end
       else
          Exit;
     end;
}
  if not Logined then
     begin
        if not DoLogin(True) then
           begin
             PageHandle := 0;
             SaveHandle := 0;
             PostMessage(frmMain.Handle,WM_DESKTOP_REQUEST,0,0);
             Exit;
           end;
     end;
  frmLogo.ShowTitle := '正在打开新商盟...';
  finish := false;
  confirm := false;
  if oid='' then
     Send('getScene',sid)
  else
     Send2('getModule',sid,EncodeXml(oid));
  if not WaitRun(commandTimeout) then Exit;
  if SessionFail then //失效了，自动重新请求
     begin
       PageHandle := 0;
       SaveHandle := 0;
       PostMessage(frmMain.Handle,WM_DESKTOP_REQUEST,0,0);
       Exit;
     end;
  if confirm then
     begin
       ShowMsgBox('当前模块正在操作状态，请完成操作后再切换模块?','友情提示...',MB_OK+MB_ICONQUESTION);
       Exit;
     end;
//  if confirm then
//     begin
//       if ShowMsgBox('当前窗体正在编辑状态，是否取消操作?','友情提示...',MB_YESNO+MB_ICONQUESTION)=6 then
//          begin
//            Send3('getModule',sid,EncodeXml(oid),'force');
//            if not WaitRun(commandTimeout) then Exit;
//          end;
//     end;
    result := true;
  finally
    if not result then PageHandle := SaveHandle;
    frmLogo.Close;
    Opening := false;
  end;
end;

procedure TfrmXsmIEBrowser.Setready(const Value: boolean);
begin
  Fready := Value;
end;

procedure TfrmXsmIEBrowser.DoInit(Wait:boolean=false);
var
  _Start,W:Int64;
  F:TIniFile;
  List:TStringList;
begin
  ready := false;
  Runed := true;
  Logined := false;
  error := false;
  SessionFail := true;
  F := TIniFile.Create(ExtractFilePath(ParamStr(0))+'db.cfg');
  List := TStringList.Create;
  try
    xsm_url := f.ReadString('H_'+f.ReadString('db','srvrId','default'),'srvrPath','');
    if xsm_url='' then xsm_url := ExtractFilePath(ParamStr(0))+'xsm\xsm.html'
       else
       begin
         List.CommaText := xsm_url;
         xsm_url := List.Values['xsm'];
       end;
    Left := -9000;
    IEBrowser.Navigate(xsm_url);
  finally
    List.free;
    try
      F.Free;
    except
    end;
  end;
  if Wait then
     begin
        frmLogo.ShowTitle := '正在初始化新商盟环境...';
        if not WaitRun(commandTimeout) then Exit;
        frmDesk.Waited := false;
        try
        _Start := GetTickCount;
        frmLogo.Show;
        frmLogo.Position := 0;
        while not ready and not error do
           begin
             Application.ProcessMessages;
             W := (GetTickCount-_Start);
             frmLogo.Position := (W div 500);
             if W>ConnectTimeOut then
                begin
                  ready := false;
                  Exit;
                end;
           end;
        frmLogo.Position := 100;
        finally
          frmDesk.Waited := false;
        end;
     end;
end;

function TfrmXsmIEBrowser.WaitRun(WaitOutTime:integer=20000):boolean;
var
  _Start,W:Int64;
  s:boolean;
begin
  _Start := GetTickCount;
  result := true;
  _Start := GetTickCount;
  s := frmLogo.Visible;
  // XSM有进度了，不需要我加了
  if not s then frmLogo.Show;
  frmLogo.Position := 1;
  frmDesk.Waited := false;
  try
  while Runed do
     begin
       Application.ProcessMessages;
       W := (GetTickCount-_Start);
       frmLogo.Position := (W div 500);
       if (GetTickCount-_Start)>WaitOutTime then
          begin
            Runed := false;
            result := false;
            LoginError := '请求超时了....';
          end;
     end;
  finally
    frmDesk.Waited := false;
    if not s then frmLogo.Close;
    Runed := false;
  end;
end;

procedure TfrmXsmIEBrowser.ClearResource;
begin
  Send('getModule','clear');
  WaitRun(commandTimeout);
end;

procedure TfrmXsmIEBrowser.SetSessionFail(const Value: boolean);
begin
  FSessionFail := Value;
end;

procedure TfrmXsmIEBrowser.ReadInfo(checked:boolean=false);
var
  cdsUnion:TZQuery;
begin
  if checked and not Factor.Connected then Exit;
  cdsUnion := TZQuery.Create(nil);
  try
    cdsUnion.Close;
    cdsUnion.SQL.Text := 'select XSM_CODE,XSM_PSWD from CA_SHOP_INFO where TENANT_ID='+IntToStr(Global.TENANT_ID)+' and SHOP_ID='''+Global.SHOP_ID+'''';
    Factor.Open(cdsUnion);
    xsm_username := cdsUnion.Fields[0].AsString;
    xsm_password := DecStr(cdsUnion.Fields[1].AsString,ENC_KEY);
  finally
    cdsUnion.Free;
  end;
end;

procedure TfrmXsmIEBrowser.Setfinish(const Value: boolean);
begin
  Ffinish := Value;
end;

procedure TfrmXsmIEBrowser.Setconfirm(const Value: boolean);
begin
  Fconfirm := Value;
end;

procedure TfrmXsmIEBrowser.DoMsgFilter(var Msg: TMsg;
  var Handled: Boolean);
begin
//  if Msg.message =
end;

procedure TfrmXsmIEBrowser.FormKeyPress(Sender: TObject; var Key: Char);
begin
//  inherited;

end;

procedure TfrmXsmIEBrowser.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  inherited;

end;

function TfrmXsmIEBrowser.EncodeXml(objectId: string): string;
begin
  result := objectId;
  result := stringreplace(result,'&nbsp;',' ',[rfReplaceAll]);//'<onClick><action object_id="'+objectId+'" method="POST" isPopUp="true" name="'+Caption+'"/></onClick>';
  result := stringreplace(result,'&quot;','"',[rfReplaceAll]);//'<onClick><action object_id="'+objectId+'" method="POST" isPopUp="true" name="'+Caption+'"/></onClick>';
end;

procedure TfrmXsmIEBrowser.SetCommandTimeOut(const Value: integer);
begin
  FCommandTimeOut := Value;
end;

procedure TfrmXsmIEBrowser.SetConnectTimeOut(const Value: integer);
begin
  FConnectTimeOut := Value;
end;

procedure TfrmXsmIEBrowser.LoadFormat;
begin
//  inherited;

end;

procedure TfrmXsmIEBrowser.SaveFormat;
begin
//  inherited;

end;

function TfrmXsmIEBrowser.GetChallenge: boolean;
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
    xsm_center := f.ReadString('H_'+f.ReadString('db','srvrId','default'),'srvrPath','');
    if xsm_center='' then xsm_center := '' 
       else
       begin
         List.CommaText := xsm_center;
         xsm_center := List.Values['xsmc'];
       end;
    xml := IdHTTP1.Get(xsm_center+'users/forlogin');
    xml := Utf8ToAnsi(xml);
    Doc := CreateXML(xml);
    if not Assigned(doc) then Raise Exception.Create('请求登录失败...');
    Root :=  doc.DocumentElement;
    if not Assigned(Root) then Raise Exception.Create('Url地址返回无效XML文档，请求校验码失败...');
    if Root.attributes.getNamedItem('code')=nil then Raise Exception.Create('Url地址返回无效XML文档，请求校验码失败...');
    if Root.attributes.getNamedItem('code').text<>'0000' then Raise Exception.Create('请求校验码失败,错误:'+Root.attributes.getNamedItem('msg').text);
    xsm_challenge := Root.selectSingleNode('challenge').text;
    result := true;
  finally
    List.free;
    try
      F.Free;
    except
    end;
  end;
end;

function TfrmXsmIEBrowser.DoForLogin(checked:boolean=false): boolean;
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
  F:TIniFile;
begin
  xsm_signature := IdHTTP1.Get(xsm_center+'users/dologin/up?j_username='+xsm_username+'&j_password='+md5(md5(xsm_password)+xsm_challenge));
  xml := Utf8ToAnsi(xsm_signature);
  Doc := CreateXML(xml);
  xsm_signature := xml;
  if not Assigned(doc) then Raise Exception.Create('请求登录失败...');
  Root :=  doc.DocumentElement;
  if not Assigned(Root) then Raise Exception.Create('Url地址返回无效XML文档，请求登录失败...');
  if Root.attributes.getNamedItem('code')=nil then Raise Exception.Create('Url地址返回无效XML文档，请求登录失败...');
  if Root.attributes.getNamedItem('code').text<>'0000' then Raise Exception.Create(Root.attributes.getNamedItem('msg').text);
  F := TIniFile.Create(ExtractFilePath(ParamStr(0))+'db.cfg');
  try
    F.WriteString('xsm','xsmrt',getUrlPath);
    F.WriteString('xsm','code1',Root.selectSingleNode('parentComId').text);
    F.WriteString('xsm','code2',Root.selectSingleNode('comId').text);
  finally
    try
      F.Free;
    except
    end;
  end;
  result := true;
  if result then Factor.ExecSQL('update CA_SHOP_INFO set XSM_CODE='''+xsm_username+''',XSM_PSWD='''+EncStr(xsm_password,ENC_KEY)+''',COMM='+GetCommStr(Factor.idbType)+',TIME_STAMP='+GetTimeStamp(Factor.idbType)+' where TENANT_ID='+inttostr(Global.TENANT_ID)+' and SHOP_ID='''+Global.SHOP_ID+'''');
end;

function TfrmXsmIEBrowser.CreateXML(xml: string): IXMLDomDocument;
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
              if not result.loadXML(ErrXml) then Raise Exception.Create('loadxml出错了,xml='+xml);
            end;
       end
    else
       Raise Exception.Create('xml字符串不能为空...');
  except
    on E:Exception do
       begin
         result := nil;
         LogFile.AddLogFile(0,e.Message);
       end;
  end;
end;

function TfrmXsmIEBrowser.XsmLogin(checked:boolean=false): boolean;
begin
  try
    if mmc then
       begin
         result := MMClient.sessionFail;
         if result then
            begin
              xsm_username := MMClient.MMLogin.xsmUserName;
              xsm_Password := MMClient.MMLogin.xsmPassword;
              xsm_Challenge := MMClient.MMLogin.xsmChallenge;
              xsm_Signature := MMClient.MMLogin.xsmSignature;
              SessionFail := false;
            end;
         Exit;
       end;
    if not checked then ReadInfo(checked);
    SessionFail := true;
    frmLogo.ShowTitle := '正在登录新商盟...';
    try
      result := GetChallenge;
      if not result then Exit;
      result := DoForLogin(checked);
      SessionFail := not result;
    finally
      frmLogo.Close;
    end;
  except
    on E:Exception do
       begin
         SessionFail := true;
         Logined := false;
         result := false;
         ShowMsgBox(Pchar(E.Message),'友情提示..',MB_OK+MB_ICONINFORMATION);
       end;
  end;
end;

function TfrmXsmIEBrowser.GetSignature: boolean;
var
  Doc:IXMLDomDocument;
  Root:IXMLDOMElement;    
  xml:string;
begin
  if mmc then 
     begin
       xsm_signature := MMClient.getSignature;
       result := true;
       Exit;
     end;
  try
    xsm_signature := IdHTTP1.Get(xsm_center+'users/gettoken');
    xml := Utf8ToAnsi(xsm_signature);
    Doc := CreateXML(xml);
    xsm_signature := xml;
    if not Assigned(doc) then Raise Exception.Create('请求令牌失败...');
    Root :=  doc.DocumentElement;
    if not Assigned(Root) then Raise Exception.Create('Url地址返回无效XML文档，请求令牌失败...');
    if Root.attributes.getNamedItem('code')=nil then Raise Exception.Create('Url地址返回无效XML文档，请求令牌失败...');
    if Root.attributes.getNamedItem('code').text<>'0000' then Raise Exception.Create('请求令牌失败,错误:'+Root.attributes.getNamedItem('msg').text);
    result := true;
  except
    SessionFail := true;
    Raise;
  end;
end;

procedure TfrmXsmIEBrowser.XSM_CALL_FUNC(var Message: TMessage);
begin
  DoMsg(Message);
end;

procedure TfrmXsmIEBrowser.XSM_CALL_ERROR(var Message: TMessage);
begin
  DoMsg(Message);
end;

procedure TfrmXsmIEBrowser.DoMsg(var Message: TMessage);
type
  PLParam1=^TLParam1;
  TLParam1=record
     LocName:Pchar;
     szMethodName:Pchar;
     szPara1:Pchar;
    end;
  PLParam2=^TLParam2;
  TLParam2=record
     LocName:Pchar;
     szMethodName:Pchar;
     szPara1:Pchar;
     szPara2:Pchar;
    end;
  PLParam3=^TLParam3;
  TLParam3=record
     LocName:Pchar;
     szMethodName:Pchar;
     szPara1:Pchar;
     szPara2:Pchar;
     szPara3:Pchar;
    end;
var
  w:integer;
  pBuf1:PLParam1;
  pBuf2:PLParam2;
  pBuf3:PLParam3;
begin
  try
    w := Message.WParam;
    case Message.WParam-2 of
    1:begin
        pBuf1:=PLParam1(Message.LParam);
        DoFuncCall(nil,StrPas(pBuf1^.szMethodName),StrPas(pBuf1^.szPara1));
      end;
    2:begin
        pBuf2:=PLParam2(Message.LParam);
        DoFuncCall2(nil,StrPas(pBuf2^.szMethodName),StrPas(pBuf2^.szPara1),StrPas(pBuf2^.szPara2));
      end;
    3:begin
        pBuf3:=PLParam3(Message.LParam);
        DoFuncCall3(nil,StrPas(pBuf3^.szMethodName),StrPas(pBuf3^.szPara1),StrPas(pBuf3^.szPara2),StrPas(pBuf3^.szPara3));
      end;
    end;
  finally
    DLLLC_FreeMsgMem(Message.WParam,Message.LParam);
  end;
end;

procedure TfrmXsmIEBrowser.SetSenceReady(const Value: boolean);
begin
  FSenceReady := Value;
end;

function TfrmXsmIEBrowser.FindElement(root: IXMLDOMNode;
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
procedure TfrmXsmIEBrowser.FreeLcControl;
begin
  try
    if DLLHandle >0 then
       begin
         DLLLC_FreeLibrary();
         FreeLibrary(DLLHandle);
         DLLHandle := 0;
       end;
  except
    on E:Exception do
       begin
         DLLHandle := 0;
         LogFile.AddLogFile(0,'释放新商盟组件->'+E.Message);
       end;
  end;
end;

procedure TfrmXsmIEBrowser.Setmmc(const Value: boolean);
begin
  Fmmc := Value;
end;

procedure TfrmXsmIEBrowser.IEBrowserTitleChange(Sender: TObject;
  const Text: WideString);
begin
  inherited;
  XsmTitle := Text;
end;

function TfrmXsmIEBrowser.CheckInited: boolean;
begin
  result := (pos('新商盟',xsmTitle)>0);
end;

procedure TfrmXsmIEBrowser.DoRefresh;
begin
  ready := false;
  Runed := true;
  Logined := false;
  IEBrowser.Refresh;
end;

procedure TfrmXsmIEBrowser.Seterror(const Value: boolean);
begin
  Ferror := Value;
end;

procedure TfrmXsmIEBrowser.SetOpening(const Value: boolean);
begin
  FOpening := Value;
end;

function TfrmXsmIEBrowser.getUrlPath: string;
var
  vList:TStringList;
begin
  vList := TStringList.Create;
  try
    vList.Delimiter := '/';
    vList.DelimitedText := xsm_url;
    vList.Delete(vList.Count-1);
    result := vList.DelimitedText+'/';
  finally
    vList.Free;
  end;
end;

end.
