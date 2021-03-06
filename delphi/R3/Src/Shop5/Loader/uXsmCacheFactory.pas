unit uXsmCacheFactory;

interface

uses
  Windows, Messages, SysUtils, Variants, ActiveX, Classes, Graphics, Controls, Forms,
  Dialogs, msxml, ZLogFile, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, OleCtrls, SHDocVw, uGlobal, ComObj, ComCtrls, IniFiles,
  ToolWin, RzBmpBtn, ExtCtrls, RzBckgnd, RzPanel, Menus, RzButton,
  ActnList, StdCtrls, RzLabel, RzPrgres, UrlMon, RzEdit;

const
  WM_LOADER_REQUEST = WM_USER+10;
    
type

    TDownLoadMonitor = class( TInterfacedObject, IBindStatusCallback )
     private
     protected
        function OnStartBinding( dwReserved: DWORD; pib: IBinding ): HResult; stdcall;
        function GetPriority( out nPriority ): HResult; stdcall;
        function OnLowResource( reserved: DWORD ): HResult; stdcall;
        function OnProgress( ulProgress, ulProgressMax, ulStatusCode: ULONG;
             szStatusText: LPCWSTR): HResult; stdcall;
        function OnDataAvailable(grfBSCF: DWORD; dwSize: DWORD; formatetc: PFormatEtc;
             stgmed: PStgMedium): HResult; stdcall;
        function OnStopBinding( hresult: HResult; szError: LPCWSTR ): HResult; stdcall;
        function GetBindInfo( out grfBINDF: DWORD; var bindinfo: TBindInfo ): HResult; stdcall;
        function OnObjectAvailable( const iid: TGUID; punk: IUnknown ): HResult; stdcall;
    end;


  TXsmCacheFactory = class(TForm)
    IdHTTP1: TIdHTTP;
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    RzPanel3: TRzPanel;
    btnCancel: TRzBitBtn;
    Bevel1: TBevel;
    RzProgressBar1: TRzProgressBar;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    ActionList1: TActionList;
    edtInfomation: TRzMemo;
    procedure FormCreate(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actStopExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

    { Private declarations }
    BindStatus:IBindStatusCallback;
    StartDateTime:TDateTime;
    Complete:Integer;  // 判断是否加载完成
    UrlAddr,xsmrt,code1,code2: String;
    FLoadNum: Integer;
    FStoped: boolean;
    function createXml(Xml:String):IXMLDOMDocument;
    procedure WM_LOADER(var Message:TMessage); Message WM_LOADER_REQUEST;
    procedure Loader(Url:String);
    procedure LoadVersionXml(Url:String);
    procedure LoadVersionChildXml(Nodes:IXMLDOMNodeList;Str,ParentNodeName:String);
    procedure Load_GWGCorCs_Xml(Url:String);
    procedure Load_GWGCorCs_ChildXml(Nodes:IXMLDOMNodeList;Str,ParentNodeName:String);
    function GetVersionPath(IsCom:Boolean=True):String;
    function GetHttp(Url:String):Boolean;
    procedure LoadFiles;
    procedure ReadIni;
    procedure SetStoped(const Value: boolean);
  public
    { Public declarations }
    //分别对应 顶级、省级、市级 的购物广场、超市
    GWGC_Ver,CS_Ver,Parent_GWGC_Ver,Parent_CS_Ver,Com_GWGC_Ver,Com_CS_Ver:String;
    property LoadNum:Integer read FLoadNum;
    property Stoped:boolean read FStoped write SetStoped;
  end;

var
  XsmCacheFactory: TXsmCacheFactory;

implementation

{$R *.dfm}

function TDownLoadMonitor.GetBindInfo( out grfBINDF: DWORD; var bindinfo: TBindInfo ): HResult;
begin
     result := S_OK;
end;

function TDownLoadMonitor.GetPriority( out nPriority ): HResult;
begin
     Result := S_OK;
end;

function TDownLoadMonitor.OnDataAvailable(grfBSCF, dwSize: DWORD;
  formatetc: PFormatEtc; stgmed: PStgMedium): HResult;
begin
     Result := S_OK;
end;

function TDownLoadMonitor.OnLowResource( reserved: DWORD ): HResult;
begin
     Result := S_OK;
end;

function TDownLoadMonitor.OnObjectAvailable( const iid: TGUID; punk: IInterface ): HResult;
begin
     Result := S_OK;
end;

function TDownLoadMonitor.OnProgress( ulProgress, ulProgressMax, ulStatusCode: ULONG; szStatusText: LPCWSTR ): HResult;
begin
    Application.ProcessMessages;
    if XsmCacheFactory.Stoped then
         Result := E_ABORT
    else
         Result := S_OK;
end;

function TDownLoadMonitor.OnStartBinding( dwReserved: DWORD; pib: IBinding ): HResult;
begin
     Result := S_OK;
end;

function TDownLoadMonitor.OnStopBinding( hresult: HResult; szError: LPCWSTR ): HResult;
begin
     Result := S_OK;
end;

{ TXsmCacheFactory }

function TXsmCacheFactory.createXml(Xml: String): IXMLDOMDocument;
var
  ErrXml:string;
  w:integer;
begin
  result := CreateOleObject('Microsoft.XMLDOM')  as IXMLDomDocument;
  try
    if xml<>'' then
       begin
         if not result.loadXML(xml) then
            begin
              ErrXml :=xml;
              w := pos('?>',ErrXml);
              delete(ErrXml,1,w+1);
              if not result.loadXML(ErrXml) then Raise Exception.Create('loadxml出错了!');
            end;
       end
    else begin
      Raise Exception.Create('xml字符串不能为空...');
    end;
  except
    on E:Exception do
       begin
         result := nil;
         edtInfomation.Lines.Add(E.Message);
       end;
  end;
end;

procedure TXsmCacheFactory.Loader(Url: String);
var
  _Start:Int64;
begin
  try
    edtInfomation.Lines.Add('<加载>'+Url);
    UrlDownloadToFile(nil, PChar(Url), PChar(ExtractFilePath(ParamStr(0))+'temp\aa.dd'), 0, BindStatus);
    {Exit;
    _Start :=  GetTickCount;
    //上面语句要删除
    Complete := 0;
    StartDateTime := Now();
    WebBrowser1.Navigate(Url);
    //while WebBrowser1.ReadyState = READYSTATE_COMPLETE do
      //Application.ProcessMessages;
    while (Complete < 6) and not Stoped do  //速度很慢
      begin
         if (GetTickCount-_Start)>20000 then break;
         Application.ProcessMessages
      end; 
    LogFile.AddLogFile(0,'<成功>:'+Url);}
  except
    //LogFile.AddLogFile(0,'<失败>:'+Url);
//    Raise;
  end;
  //Inc(FLoadNum);
end;

procedure TXsmCacheFactory.Load_GWGCorCs_ChildXml(Nodes: IXMLDOMNodeList; Str,
  ParentNodeName: String);
var Root:IXMLDOMElement;
    ChildUrl:String;
    i:Integer;
begin
  for i := 0 to Nodes.length - 1 do
    begin
      if Stoped then Exit;
      if not (Nodes.item[i].nodeType = NODE_ELEMENT) then Continue;
      Root := Nodes.item[i] as IXMLDOMElement;
      ChildUrl := xsmrt+Str+VarToStr(Root.getAttribute('id'));
      Loader(ChildUrl);
    end;
end;

procedure TXsmCacheFactory.Load_GWGCorCs_Xml(Url:String);
var
  Doc:IXMLDomDocument;
  Root:IXMLDOMElement;
  Nodes:IXMLDOMNodeList;
  i,sum:Integer;
  xml,GWGCUrl,MapDir:string;
begin
  edtInfomation.Lines.Add('<开始>'+Url);

  xml := IdHTTP1.Get(Url);
  xml := Utf8ToAnsi(xml);
  Doc := CreateXML(xml);
  if not Assigned(doc) then Raise Exception.Create('请求令牌失败...');
  Root :=  doc.DocumentElement;
  if not Assigned(Root) then Raise Exception.Create('Url地址返回无效XML文档，请求令牌失败...');
  MapDir := Root.getAttribute('dir');
  Nodes := Root.childNodes;
  sum := Nodes.length;
  RzProgressBar1.Percent := 0;
  for i := 0 to sum - 1 do
    begin
      if Stoped then Exit;
      if not (Nodes.item[i].nodeType = NODE_ELEMENT) then Continue;
      if (Nodes.item[i].nodeName = 'background') or (Nodes.item[i].nodeName = 'ItemDefinitions') then
      begin
        if Nodes.item[i].hasChildNodes then
        begin
          Root := Nodes.item[i] as IXMLDOMElement;
          Load_GWGCorCs_ChildXml(Nodes.item[i].childNodes,MapDir,Nodes.item[i].nodeName);
        end else
        begin
          Root := Nodes.item[i] as IXMLDOMElement;
          GWGCUrl := xsmrt+MapDir+VarToStr(Root.getAttribute('file'));
          Loader(GWGCUrl);
        end;
      end;
      RzProgressBar1.Percent := i*100 div sum;
    end;
  //if Root.attributes.getNamedItem('Versionfiles')=nil then Raise Exception.Create('Url地址返回无效XML文档，请求令牌失败...');
  //if Root.attributes.getNamedItem('id').text<>'0000' then Raise Exception.Create('请求令牌失败,错误:'+Root.attributes.getNamedItem('msg').text);
  //result := true;
  RzProgressBar1.Percent := 100;
  edtInfomation.Lines.Add('<完成>'+Url);

end;

procedure TXsmCacheFactory.LoadVersionChildXml(Nodes: IXMLDOMNodeList; Str,
  ParentNodeName: String);
var Root:IXMLDOMElement;
    ChildUrl,AttributeValue:String;
    i:Integer;
begin
  for i := 0 to Nodes.length - 1 do
    begin
      if Stoped then Exit;
      if not (Nodes.item[i].nodeType = NODE_ELEMENT) then Continue;
      Root := Nodes.item[i] as IXMLDOMElement;
      AttributeValue := UpperCase(VarToStr(Root.getAttribute('id')));
      if (AttributeValue = UpperCase('CS.XML')) or (AttributeValue = UpperCase('GWGC.XML')) then
      begin
        ChildUrl := xsmrt+Str+'/'+VarToStr(Root.getAttribute('id'))+'?v='+VarToStr(Root.getAttribute('v'));
        if UpperCase(Str+'/'+VarToStr(Root.getAttribute('id'))) = UpperCase('resource/map/GWGC.xml') then
          GWGC_Ver := ChildUrl;
        if UpperCase(Str+'/'+VarToStr(Root.getAttribute('id'))) = UpperCase('resource/map/CS.xml') then
          CS_Ver := ChildUrl;

        if (code1 <> '') and (code2 <> '') then
        begin
          if UpperCase(Str+'/'+VarToStr(Root.getAttribute('id')))=UpperCase('resource/map/'+code1+'/GWGC.xml') then
            Parent_GWGC_Ver := ChildUrl;
          if UpperCase(Str+'/'+VarToStr(Root.getAttribute('id')))=UpperCase('resource/map/'+code1+'/CS.xml') then
            Parent_CS_Ver := ChildUrl;
          if UpperCase(Str+'/'+VarToStr(Root.getAttribute('id')))=UpperCase('resource/map/'+code1+'/'+code2+'/GWGC.xml') then
            Com_GWGC_Ver := ChildUrl;
          if UpperCase(Str+'/'+VarToStr(Root.getAttribute('id')))=UpperCase('resource/map/'+code1+'/'+code2+'/CS.xml') then
            Com_CS_Ver := ChildUrl;
        end;
        //Load_GWGCorCs_Xml(ChildUrl);
        Loader(ChildUrl);
      end else
      begin
        ChildUrl := xsmrt+Str+'/'+VarToStr(Root.getAttribute('id'))+'?v='+VarToStr(Root.getAttribute('v'));
        Loader(ChildUrl);
      end;
    end;
end;

procedure TXsmCacheFactory.LoadVersionXml(Url:String);
var
  Doc:IXMLDomDocument;
  Root:IXMLDOMElement;
  Nodes:IXMLDOMNodeList;
  Node:IXMLDOMNode;
  Attr:IXMLDOMAttribute;
  i,sum:Integer;
  xml,Str_url:string;
begin
  edtInfomation.Lines.Add('<开始>'+Url);
  try
    xml := IdHTTP1.Get(Url);
    xml := Utf8ToAnsi(xml);
    Doc := CreateXML(xml);
    if not Assigned(doc) then Raise Exception.Create('请求令牌失败...');
    Root :=  doc.DocumentElement;
    if not Assigned(Root) then Raise Exception.Create('Url地址返回无效XML文档，请求令牌失败...');
    Nodes := Root.childNodes;
    sum := Nodes.length;
    RzProgressBar1.Percent := 0;
    for i := 0 to sum - 1 do
      begin
        if Stoped then Exit;
        if not (Nodes.item[i].nodeType = NODE_ELEMENT) then Continue;
        if Nodes.item[i].nodeName = 'f' then
        begin
          Root := Nodes.item[i] as IXMLDOMElement;
          Str_url := xsmrt+VarToStr(Root.getAttribute('id')+'?v='+VarToStr(Root.getAttribute('v')));
          Loader(Str_url);
        end;
        if Nodes.item[i].hasChildNodes then
        begin
          Root := Nodes.item[i] as IXMLDOMElement;
          LoadVersionChildXml(Nodes.item[i].childNodes,VarToStr(Root.getAttribute('id')),Nodes.item[i].nodeName);
        end;
        RzProgressBar1.Percent := (i*100 div sum);
      end;
    //if Root.attributes.getNamedItem('Versionfiles')=nil then Raise Exception.Create('Url地址返回无效XML文档，请求令牌失败...');
    //if Root.attributes.getNamedItem('id').text<>'0000' then Raise Exception.Create('请求令牌失败,错误:'+Root.attributes.getNamedItem('msg').text);
    //result := true;
    RzProgressBar1.Percent := 100;
    edtInfomation.Lines.Add('<完成>'+Url);
  except
    on Ex:Exception do
    begin
      edtInfomation.Lines.Add('<失败>'+Url);
      LogFile.AddLogFile(0,edtInfomation.Text);
      Raise;
    end;
  end;
end;

procedure TXsmCacheFactory.FormCreate(Sender: TObject);
begin
  FLoadNum := 0;
  Stoped := false;
  BindStatus := TDownLoadMonitor.Create()
end;

procedure TXsmCacheFactory.actCancelExecute(Sender: TObject);
begin
  Stoped := true;
  Close;
end;

procedure TXsmCacheFactory.actStopExecute(Sender: TObject);
begin
  RzLabel3.Caption := '已经停止加载图片';
end;

procedure TXsmCacheFactory.WM_LOADER(var Message: TMessage);
begin
  ReadIni;
  RzLabel3.Caption := '正在您的计算机中加载图片，请稍等...';
  RzLabel1.Visible := True;
  LoadFiles;
end;

procedure TXsmCacheFactory.FormShow(Sender: TObject);
begin
  RzLabel1.Visible := False;
end;

procedure TXsmCacheFactory.ReadIni;
var F: TIniFile;
begin
  F := TIniFile.Create(ExtractFilePath(ParamStr(0))+'db.cfg');
  try
    xsmrt := F.ReadString('xsm','xsmrt','');
    code1 := F.ReadString('xsm','code1','');
    code2 := F.ReadString('xsm','code2','');
  finally
    try
      F.Free;
    except
    end;
  end;
end;

function TXsmCacheFactory.GetVersionPath(IsCom:Boolean=True): String;
begin
  if IsCom then
  begin
    if code1 = '11000001' then
      Result := 'resouce/version/' + code2 + '/VersionFiles.xml'
    else
      Result := 'resouce/version/' + code1 + '/' + code2 + '/VersionFiles.xml';
  end
  else
  begin
    if code1 = '11000001' then
      Result := ''
    else
      Result := 'resouce/version/' + code1 + '/VersionFiles.xml';
  end;
end;

procedure TXsmCacheFactory.LoadFiles;
var Load_String:String;
    i,j:Integer;
begin
  if xsmrt = '' then Exit;

    Load_String := xsmrt+'VersionFiles.xml?v='+IntToStr(gettickcount);
    if GetHttp(Load_String) then
    begin
      RzLabel1.Caption := '正在加载主"VersionFiles.xml"文件...';
      LoadVersionXml(Load_String);
    end;
    if Stoped then Exit;
    if GetHttp(GWGC_Ver) then
    begin
      RzLabel1.Caption := '正在加载"GWGC.xml"文件...';
      Load_GWGCorCs_Xml(GWGC_Ver);
    end;
    for i := 0 to 1 do
    begin
      case i of
        0:begin
          if Com_GWGC_Ver <> '' then
          begin
            if GetHttp(Com_GWGC_Ver) then
            begin
              Load_GWGCorCs_Xml(Com_GWGC_Ver);
              Break;
            end;
          end;
        end;
        1:begin
          if Parent_GWGC_Ver <> '' then
          begin
            if GetHttp(Parent_GWGC_Ver) then
              Load_GWGCorCs_Xml(Parent_GWGC_Ver);
          end;
        end;
      end;
    end;

    if Stoped then Exit;
    if GetHttp(GWGC_Ver) then
    begin
      RzLabel1.Caption := '正在加载"CS.xml"文件...';
      Load_GWGCorCs_Xml(GWGC_Ver);
    end;
    for i := 0 to 1 do
    begin
      case i of
        0:begin
          if Com_GWGC_Ver <> '' then
          begin
            if GetHttp(Com_GWGC_Ver) then
            begin
              Load_GWGCorCs_Xml(Com_GWGC_Ver);
              Break;
            end;
          end;
        end;
        1:begin
          if Parent_GWGC_Ver <> '' then
          begin
            if GetHttp(Parent_GWGC_Ver) then
              Load_GWGCorCs_Xml(Parent_GWGC_Ver);
          end;
        end;
      end;
    end;

///////////////// 以上是加载主"VersionFiles"文件 ///////////////////////////////
//////////////  下面开始加载地市"VersionFiles"文件 //////////////////////////

    if Stoped then Exit;
    Parent_GWGC_Ver := '';
    Parent_CS_Ver := '';
    Com_GWGC_Ver := '';
    Com_CS_Ver := '';
    for i := 0 to 1 do
    begin
      case i of
        0:begin
          Load_String := xsmrt+GetVersionPath(True);
          if GetHttp(Load_String) then
          begin
            RzLabel1.Caption := '正在加载分地市"VersionFiles.xml"文件...';
            LoadVersionXml(Load_String);
            break;
          end;
        end;
        1:begin
          Load_String := GetVersionPath(False);
          if Load_String = '' then Exit else Load_String := xsmrt + Load_String;
          if GetHttp(Load_String) then
          begin
            RzLabel1.Caption := '正在加载省级"VersionFiles.xml"文件...';
            LoadVersionXml(Load_String);
          end;
        end;
      end;
    end;

    if Stoped then Exit;
    RzLabel1.Caption := '正在加载"GWGC.xml"文件...';
    for j := 0 to 1 do
    begin
      case j of
        0:begin
          if Com_GWGC_Ver <> '' then
          begin
            if GetHttp(Com_GWGC_Ver) then
            begin
              Load_GWGCorCs_Xml(Com_GWGC_Ver);
              Break;
            end;
          end;
        end;
        1:begin
          if Parent_GWGC_Ver <> '' then
          begin
            if GetHttp(Parent_GWGC_Ver) then
              Load_GWGCorCs_Xml(Parent_GWGC_Ver);
          end;
        end;
      end;
    end;

    if Stoped then Exit;
    RzLabel1.Caption := '正在加载"CS.xml"文件...';
    for j := 0 to 1 do
    begin
      case j of
        0:begin
          if Com_GWGC_Ver <> '' then
          begin
            if GetHttp(Com_GWGC_Ver) then
            begin
              Load_GWGCorCs_Xml(Com_GWGC_Ver);
              Break;
            end;
          end;
        end;
        1:begin
          if Parent_GWGC_Ver <> '' then
          begin
            if GetHttp(Parent_GWGC_Ver) then
              Load_GWGCorCs_Xml(Parent_GWGC_Ver);
          end;
        end;
      end;
    end;

  LogFile.AddLogFile(0,edtInfomation.Text);
  Close;
end;

procedure TXsmCacheFactory.SetStoped(const Value: boolean);
begin
  FStoped := Value;
end;

function TXsmCacheFactory.GetHttp(Url: String): Boolean;
var
  Doc:IXMLDomDocument;
  Root:IXMLDOMElement;
  xml:string;
begin
  try
    xml := IdHTTP1.Get(Url);
    xml := Utf8ToAnsi(xml);
    Doc := CreateXML(xml);
    if not Assigned(doc) then Raise Exception.Create(Url+'请求令牌失败...');
    Root :=  doc.DocumentElement;
    if not Assigned(Root) then Raise Exception.Create('Url地址返回无效XML文档，请求令牌失败...');

    Result := True;
  except
    on Ex:Exception do
    begin
      if Pos('404',Ex.Message) > 0 then
        Result := False
      else
      begin
        edtInfomation.Lines.Add(Ex.Message);
        LogFile.AddLogFile(0,edtInfomation.Text);
        Raise;
      end;
    end;
  end;
end;

end.
