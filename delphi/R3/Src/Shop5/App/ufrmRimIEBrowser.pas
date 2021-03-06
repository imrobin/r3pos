unit ufrmRimIEBrowser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmIEWebForm, ImgList, ActnList, Menus, RzTabs, OleCtrls,
  SHDocVw, ExtCtrls, RzPanel,ZBase,ZLogFile,HTTPApp;

type
  TfrmRimIEBrowser = class(TfrmIEWebForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure IEBrowserDownloadComplete(Sender: TObject);
    procedure IEBrowserBeforeNavigate2(Sender: TObject;
      const pDisp: IDispatch; var URL, Flags, TargetFrameName, PostData,
      Headers: OleVariant; var Cancel: WordBool);
    procedure IEBrowserTitleChange(Sender: TObject;
      const Text: WideString);
  private
    FCurUrl: string;
    SaveHandle:integer;
    FLogined: boolean;
    procedure SetCurUrl(const Value: string);
    procedure SetLogined(const Value: boolean);
    { Private declarations }
    procedure DoAction(actionname:string);
    procedure LoadFormat;override;
    procedure SaveFormat;override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy;override;
    procedure ReadParam;
    procedure DoLogin(Hinted:boolean=false;checked:boolean=false);
    function EncodeChk:string;
    function CheckError:boolean;

    procedure OpenXsm(objectId:string);

    function OpenUrl(url:string;hHandle:integer;xsmed:boolean=false):boolean;
    property CurUrl:string read FCurUrl write SetCurUrl;
    property Logined:boolean read FLogined write SetLogined;
  end;
var
  frmRimIEBrowser:TfrmRimIEBrowser;
implementation
uses IniFiles,ufrmMain,uMsgBox,ufrmLogo,ufrmXsmLogin,encddecd,ufrmXsmIEBrowser,uShopGlobal,uCaFactory,EncDec,uAdvFactory, uGlobal;
{$R *.dfm}

{ TfrmRimIEBrowser }

function TfrmRimIEBrowser.EncodeChk: string;
begin
  result := 'comId='+Rim_ComId+'&custId='+Rim_CustId;
end;

function TfrmRimIEBrowser.OpenUrl(url: string;hHandle:integer;xsmed:boolean=false):boolean;
var
  p:string;
  e:string;
begin
  SaveHandle := PageHandle;
  try
    PageHandle := hHandle;
    WindowState := wsMaximized;
    BringToFront;
    if not CaFactory.Audited then
      begin
        ShowMsgBox('脱机状态不能进入此模块...','友情提示...',MB_OK+MB_ICONINFORMATION);
        Exit;
      end;
    if xsmed and not logined then frmXsmIEBrowser.SessionFail := true;
    if xsmed and frmXsmIEBrowser.SessionFail then
    with frmXsmIEBrowser do
     begin
       if TfrmXsmLogin.XsmRegister then
          begin
            if not XsmLogin(true) then
               OpenUrl(url,hHandle,xsmed);
          end
       else
          Exit;
     end;
    if xsmed and not Logined then
       begin
         DoLogin(true);
         if not Logined then Exit;
       end;
    frmLogo.Show;
    frmLogo.ShowTitle := '正在打开网页...';
    ReadParam;
    if pos('?',url)=0 then p := '?' else p := '&';
    e := EncStr(url,ENC_KEY);
    result := inherited Open(Rim_Url+url+p+EncodeChk);
  finally
    if not result then PageHandle := SaveHandle;
    frmLogo.Close;
  end;
end;

procedure TfrmRimIEBrowser.ReadParam;
var
  F:TIniFile;
  List:TStringList;
begin
  if Rim_Url<>'' then Exit;
  F := TIniFile.Create(ExtractFilePath(ParamStr(0))+'db.cfg');
  List := TStringList.Create;
  try
    Rim_Url := f.ReadString('H_'+f.ReadString('db','srvrId','default'),'srvrPath','');
    if Rim_Url='' then Rim_Url := ''
       else
       begin
         List.CommaText := Rim_Url;
         Rim_Url := List.Values['rim'];
         if Rim_Url<>'' then
           begin
             if Rim_Url[Length(Rim_Url)]<>'/' then Rim_Url := Rim_Url+'/';
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

procedure TfrmRimIEBrowser.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  inherited;

end;

constructor TfrmRimIEBrowser.Create(AOwner: TComponent);
begin
  inherited;
  FormStyle := fsMDIChild;
  frmRimIEBrowser := self;
  Logined := false;
  left := -9000;
end;

destructor TfrmRimIEBrowser.Destroy;
begin
  runed := false;
  inherited;
  frmRimIEBrowser := nil;
end;

procedure TfrmRimIEBrowser.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  inherited;

end;

procedure TfrmRimIEBrowser.FormKeyPress(Sender: TObject; var Key: Char);
begin
//  inherited;

end;

procedure TfrmRimIEBrowser.SetCurUrl(const Value: string);
begin
  FCurUrl := Value;
end;

procedure TfrmRimIEBrowser.IEBrowserDownloadComplete(Sender: TObject);
begin
  inherited;
//  AdvFactory.GetAllFile(IEBrowser,CurUrl); 
end;

procedure TfrmRimIEBrowser.DoLogin(Hinted:boolean=false;checked:boolean=false);
var
  Params:TftParamList;
  Msg:string;
  _Start:Int64;
begin
  Logined := false;
  try
    if (not CaFactory.Audited or (Factor.ConnMode=1)) and Global.debug then
       begin
         //调试模用指定的用户
       end
    else
       begin
         if checked and not Global.RemoteFactory.Connected then Exit;
         Params := TftParamList.Create(nil);
         try
           Params.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
           Params.ParamByName('SHOP_ID').AsString := Global.SHOP_ID;
           Msg := Global.RemoteFactory.ExecProc('TRimWsdlService',Params);
           Params.Decode(Params,Msg);
           Rim_ComId := Params.ParambyName('rimcid').AsString;
           Rim_CustId := Params.ParambyName('xsmuid').AsString;
           if Rim_CustId='' then Rim_CustId := Params.ParambyName('rimuid').AsString;
           if Rim_CustId='' then Raise Exception.Create('当前登录门店的许可证号无效，请输入修改正确的许可证号.');
         finally
           Params.Free;
         end;
      end;
    if not frmXsmIEBrowser.SessionFail then
       begin
         Runed := true;
         _Start := GetTickCount;
         frmXsmIEBrowser.GetSignature;
         IEBrowser.Navigate(rim_url+'xsmReg/reg.action?CTOKEN='+HTTPEncode(xsm_signature)+'&CUST_ID='+Rim_CustId);
         while not (IEBrowser.ReadyState in [READYSTATE_COMPLETE]) do
            begin
              if (GetTickCount-_Start)>20000 then break;
              Application.ProcessMessages;
            end;
         Logined := CheckError;
       end
    else
       begin
         if Hinted then ShowMsgBox(pchar('登录Rim失败了,错误:'+Caption),'友情提示..',MB_OK+MB_ICONERROR);
       end;
  except
    logined := false;
    frmLogo.Close;
    ShowMsgBox('登录RIM失败，请检查服务用网络是否正常.','友情提示...',MB_OK+MB_ICONINFORMATION);
  end;
end;

procedure TfrmRimIEBrowser.SetLogined(const Value: boolean);
begin
  FLogined := Value;
end;

procedure TfrmRimIEBrowser.OpenXsm(objectId: string);
var
  xml,sid:string;
  vList:TStringList;
begin
  if not Logined then Exit;
  vList := TStringList.Create;
  try
    vList.CommaText := objectId;
    if vList.Count<>2 then Raise Exception.Create('无效活动连接...'); 
    sid := DecodeString(vList[0]);
    xml := DecodeString(vList[1]);
    frmXsmIEBrowser.Caption := Caption;
    if not frmXsmIEBrowser.Open(sid,xml,PageHandle) then ShowMsgBox('无法打开活动详情','友情提示...',MB_OK+MB_ICONINFORMATION);
  finally
    vList.Free;
  end;
end;

procedure TfrmRimIEBrowser.IEBrowserBeforeNavigate2(Sender: TObject;
  const pDisp: IDispatch; var URL, Flags, TargetFrameName, PostData,
  Headers: OleVariant; var Cancel: WordBool);
var w:integer;
begin
 // inherited;
 w := pos('xsm=',url);
 if w>0 then
    begin
      Cancel := true;
      OpenXsm(copy(url,w+4,length(url)));
    end;
 w := pos('#=',url);
 if w>0 then
    begin
      Cancel := true;
      if copy(url,w+2,length(url))='000000000' then
         DoAction('actfrmOpenDesk');
    end
end;

function TfrmRimIEBrowser.CheckError: boolean;
begin
  result := (copy(htmlTitle,1,6)='<0000>');
  LogFile.AddLogFile(0,htmlTitle);
end;

procedure TfrmRimIEBrowser.IEBrowserTitleChange(Sender: TObject;
  const Text: WideString);
var s:string;
begin
  inherited;
  s := Text;
  if length(s)>=6 then
     begin
       if (s[1]='<') and (s[6]='>') then
          begin
            Logined := CheckError;
            LogFile.AddLogFile(0,IEBrowser.LocationURL);
          end;
     end;
end;

procedure TfrmRimIEBrowser.DoAction(actionname: string);
var
  i:integer;
begin
  for i:=0 to frmMain.actList.ActionCount-1 do
    begin
      if lowercase(frmMain.actList.Actions[i].Name)=lowercase(actionname) then
         begin
           TAction(frmMain.actList.Actions[i]).OnExecute(frmMain.actList.Actions[i]);
           Exit;
         end;
    end;
end;

procedure TfrmRimIEBrowser.LoadFormat;
begin
//  inherited;

end;

procedure TfrmRimIEBrowser.SaveFormat;
begin
//  inherited;

end;

end.
