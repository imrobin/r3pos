unit uDLLFactory;

interface
uses
  Classes,SysUtils,windows,forms,urlParser,ZIntf,ZDataSet,ZBase,Variants;
type
  //1.��ʼ��Ӧ��
  //˵��������appId�����ƣ���ʼ���ɹ��󷵻�true
  TinitApp=function(appWnd:Thandle;_dbHelp:IdbDllHelp;token:pchar):boolean;stdcall;
  //2.��Ӧ��
  //˵������Ӧ����ָ����ģ��
  TopenApp=function(hWnd:Thandle;moduId:pchar):boolean;stdcall;
  //3.�ر�Ӧ��
  //˵�����ر�Ӧ���д򿪵�ģ��
  //����ֵ:false�����������رգ�true�رճɹ�
  TcloseApp=function(moduId:pchar):boolean;stdcall;
  //4.�ͷ���Դ
  TeraseApp=function():boolean;stdcall;
  //5.��ȡ����˵��
  TgetLastError=function():pchar;stdcall;
  //6.��ȡģ������
  TgetModuleName=function(moduId:pchar):Pchar;stdcall;
  //5.��ȡ����˵��
  Tresize=function():boolean;stdcall;

  TDLLPlugin=class
  private
    FDLLHandle: THandle;
    initApp:TinitApp;
    openApp:TopenApp;
    closeApp:TcloseApp;
    eraseApp:TeraseApp;
    getLastError:TgetLastError;
    getModuleName:TgetModuleName;
    resize:Tresize;
    FappId: string;
    procedure SetDLLHandle(const Value: THandle);
    procedure SetappId(const Value: string);
  public
    constructor Create(dllname:string);
    destructor Destroy; override;

    property DLLHandle:THandle read FDLLHandle write SetDLLHandle;
    property appId:string read FappId write SetappId;
  end;
  TDLLFactory=class(TComponent,IdbDllHelp)
  private
    FList:TList;
    FDataSets:TList;
  protected
    //��ʼ����  ��ʱ���� ��λ��
    procedure BeginTrans(TimeOut:integer=-1);stdcall;
    //�ύ����
    procedure CommitTrans;stdcall;
    //�ع�����
    procedure RollbackTrans;stdcall;
    //�Ƿ��Ѿ��������� True ��������
    function  InTransaction:boolean;stdcall;

    //�õ����ݿ����� 0:SQL Server ;1 Oracle ; 2 Sybase; 3 ACCESS; 4 DB2;  5 Sqlite
    function  iDbType:Integer;stdcall;

    //HRESULT ����ֵ˵�� =0��ʾִ�гɹ� ����Ϊ�������
    function OpenSQL(SQL:WideString;Params:WideString):OleVariant;OverLoad;stdcall;
    function OpenNS(NS:WideString;Params:WideString):OleVariant;OverLoad;stdcall;
    //�ύ���ݼ�
    function UpdateBatch(ds:OleVariant;NS:WideString;Params:WideString):boolean;OverLoad;stdcall;
    //����ִ��Ӱ���¼��
    function ExecSQL(const SQL:WideString):Integer;stdcall;
    procedure BeginBatch; stdcall;
    procedure AddBatch(ds:OleVariant;const ns: WideString; const Params: WideString); stdcall;
    function OpenBatch:OleVariant; stdcall;
    procedure CommitBatch; stdcall;
    procedure CancelBatch; stdcall;

    //ִ��Զ�̷�ʽ�����ؽ��
    function ExecProc(NS:String;Params:WideString):pchar;stdcall;

  public
    constructor Create;
    destructor Destroy; override;
    //��ȡ������Ϣ
    function getTokenInfo:boolean;
    //url �������� rspcn://appid/moduid
    function open(urltoken:TurlToken;hWnd:THandle):boolean;
    function close(urltoken:TurlToken):boolean;
    function getTitle(urltoken:TurlToken):string;

    function erase(idx:integer):boolean;
    function find(appId:string):integer;

    procedure resize;
    function getDBHelp:IdbDLLHelp;
  end;
var
  dllFactory:TDLLFactory;
implementation
uses udataFactory,utokenFactory;

{ TDLLFactory }

procedure TDLLFactory.AddBatch(ds: OleVariant; const ns,
  Params: WideString);
var
  rs:TZQuery;
begin
  if dataFactory.dbFlag=0 then dataFactory.MoveToRemote;
  rs := TZQuery.Create(nil);
  rs.Delta := ds;
  if Params<>'' then
     TftParamList.Decode(rs.Params,Params);
  FDataSets.Add(rs);
  dataFactory.AddBatch(rs,ns,TftParamList(rs.Params));
end;

procedure TDLLFactory.BeginBatch;
var
  i:integer;
begin
  if dataFactory.dbFlag=0 then dataFactory.MoveToRemote;
  dataFactory.BeginBatch;
  for i:=0 to FDataSets.Count-1 do
    begin
      TObject(FDataSets[i]).Free;
    end;
  FDataSets.Clear;
end;

procedure TDLLFactory.BeginTrans(TimeOut: integer);
begin
  if dataFactory.dbFlag=0 then dataFactory.MoveToRemote;
  dataFactory.BeginTrans(TimeOut);
end;

procedure TDLLFactory.CancelBatch;
var
  i:integer;
begin
  if dataFactory.dbFlag=0 then dataFactory.MoveToRemote;
  for i:=0 to FDataSets.Count-1 do
    begin
      TObject(FDataSets[i]).Free;
    end;
  FDataSets.Clear;
  dataFactory.CancelBatch;
end;

function TDLLFactory.close(urltoken:TurlToken): boolean;
var
  idx:integer;
  app:TDLLPlugin;
begin
  idx := find(urltoken.appId);
  if idx<0 then
     begin
      exit;
     end
  else
     app := TDLLPlugin(flist[idx]);
  app.closeApp(Pchar(urlToken.moduname));
end;

procedure TDLLFactory.CommitBatch;
var
  i:integer;
begin
  if dataFactory.dbFlag=0 then dataFactory.MoveToRemote;
  dataFactory.CommitBatch;
  for i:=0 to FDataSets.Count-1 do
    begin
      TObject(FDataSets[i]).Free;
    end;
  FDataSets.Clear;
end;

procedure TDLLFactory.CommitTrans;
begin
  if dataFactory.dbFlag=0 then dataFactory.MoveToRemote;
  dataFactory.CommitTrans;
end;

constructor TDLLFactory.Create;
begin
  FList:=TList.Create;
  FDataSets:=TList.Create;
end;

destructor TDLLFactory.Destroy;
var i:integer;
begin
  for i:=0 to FList.Count-1 do
    begin
      TObject(FList[i]).Free;
    end;
  FList.Free;
  for i:=0 to FDataSets.Count-1 do
    begin
      TObject(FDataSets[i]).Free;
    end;
  FDataSets.Free;
  inherited;
end;

function TDLLFactory.erase(idx: integer): boolean;
begin
  TObject(Flist[idx]).Free;
  flist.Delete(idx); 
end;

function TDLLFactory.ExecSQL(const SQL: WideString): Integer;
begin
  if dataFactory.dbFlag=0 then dataFactory.MoveToRemote;
  result := dataFactory.ExecSQL(SQL); 
end;

function TDLLFactory.find(appId: string): integer;
var i:integer;
begin
  result := -1;
  for i:=0 to flist.Count-1 do
    begin
      if lowercase(TDLLPlugin(flist[i]).appId)=lowercase(appId) then
         begin
           result := i;
           exit;
         end;
    end;
end;

function TDLLFactory.getTitle(urltoken: TurlToken): string;
var
  idx:integer;
  app:TDLLPlugin;
  buf:Pchar;
begin
  idx := find(urltoken.appId);
  if idx<0 then
     begin
       Exit;
     end
  else
     app := TDLLPlugin(flist[idx]);
  buf := app.getModuleName(pchar(urlToken.moduname));
  if buf<>nil then
     result := strPas(buf) else result := 'δ֪...';
end;

function TDLLFactory.iDbType: Integer;
begin
  if dataFactory.dbFlag=0 then dataFactory.MoveToRemote;
  result := dataFactory.iDbType;
end;

function TDLLFactory.InTransaction: boolean;
begin
  if dataFactory.dbFlag=0 then dataFactory.MoveToRemote;
  result := dataFactory.InTransaction;
end;

function TDLLFactory.open(urltoken:TurlToken;hWnd:THandle): boolean;
var
  idx:integer;
  app:TDLLPlugin;
begin
  if not getTokenInfo then Exit;
  idx := find(urltoken.appId);
  if idx<0 then
     begin
       app := TDLLPlugin.Create(urltoken.path);
       app.appId := urltoken.appId;
       flist.Add(app);
     end
  else
     app := TDLLPlugin(flist[idx]);
  result := app.openApp(hWnd,pchar(urlToken.moduname));
  if not result then MessageBox(application.MainForm.Handle,app.getLastError,'����..',MB_OK+MB_ICONERROR);
end;

function TDLLFactory.OpenSQL(SQL, Params: WideString): OleVariant;
var
  rs:TZQuery;
begin
  if dataFactory.dbFlag=0 then dataFactory.MoveToRemote;
  rs := TZQuery.Create(nil);
  try
    rs.SQL.Text := SQL;
    TftParamList.Decode(rs.Params,Params);
    dataFactory.Open(rs);
    result := rs.Data;
  finally
    rs.Free;
  end;
end;

function TDLLFactory.OpenBatch: OleVariant;
var
  i:integer;
begin
  if dataFactory.dbFlag=0 then dataFactory.MoveToRemote;
  dataFactory.OpenBatch;
  result:=VarArrayCreate([0,FList.Count-1],varVariant);
  for i:=0 to FDataSets.Count-1 do
    begin
      result[i] := TZQuery(FDataSets[i]).Data;
      TObject(FDataSets[i]).Free;
    end;
  FDataSets.Clear;
end;

function TDLLFactory.OpenNS(NS, Params: WideString): OleVariant;
var
  rs:TZQuery;
begin
  if dataFactory.dbFlag=0 then dataFactory.MoveToRemote;
  rs := TZQuery.Create(nil);
  try
    TftParamList.Decode(rs.Params,Params);
    dataFactory.Open(rs,ns,TftParamList(rs.Params));
    result := rs.Data;
  finally
    rs.Free;
  end;
end;

procedure TDLLFactory.RollbackTrans;
begin
  if dataFactory.dbFlag=0 then dataFactory.MoveToRemote;
  dataFactory.RollbackTrans;
end;

function TDLLFactory.UpdateBatch(ds: OleVariant; NS,
  Params: WideString): boolean;
var
  rs:TZQuery;
begin
  if dataFactory.dbFlag=0 then dataFactory.MoveToRemote;
  rs := TZQuery.Create(nil);
  try
    rs.Delta := ds;
    TftParamList.Decode(rs.Params,Params);
    dataFactory.UpdateBatch(rs,ns,TftParamList(rs.Params));  
  finally
    rs.Free;
  end;
end;

function TDLLFactory.getDBHelp: IdbDLLHelp;
begin
  if GetInterface(IdbDLLHelp,result) then
     result._AddRef
  else
     Raise Exception.Create('��ȡdll�ӿ�ʧ��');
end;

function TDLLFactory.ExecProc(NS: String; Params: WideString): pchar;
var
  prms:TftParamList;
begin
  if dataFactory.dbFlag=0 then dataFactory.MoveToRemote;
  prms := TftParamList.Create;
  try
    TftParamList.Decode(prms,Params);
    result := Pchar( dataFactory.ExecProc(NS,prms));
  finally
    prms.Free;
  end;
end;

procedure TDLLFactory.resize;
var
  i:integer;
begin
  for i:=0 to FList.Count -1 do
    begin
      TDLLPlugin(FList[i]).resize;
    end;
end;

function TDLLFactory.getTokenInfo: boolean;
var tenantId:integer;
function CheckRegister:boolean;
var
  rs:TZQuery;
begin
  dataFactory.MoveToSqlite;
  rs := TZQuery.Create(nil);
  try
    rs.SQL.Text := 'select VALUE from SYS_DEFINE where TENANT_ID=0 and DEFINE=''TENANT_ID''';
    dataFactory.Open(rs);
    result := (rs.Fields[0].AsString<>'');
    if result then tenantId := rs.Fields[0].asInteger;
  finally
    rs.Free;
  end;
end;
var
  rs:TZQuery;
begin
  if (token.tenantId='') and CheckRegister then
     begin
       rs := TZQuery.Create(nil);
       try
        rs.Close;
        rs.SQL.Text := 'select USER_ID,USER_NAME,PASS_WRD,ROLE_IDS,A.SHOP_ID,B.SHOP_NAME,A.ACCOUNT,A.TENANT_ID,C.TENANT_NAME from VIW_USERS A,CA_SHOP_INFO B,CA_TENANT C '+
          'where A.TENANT_ID=C.TENANT_ID and A.SHOP_ID=B.SHOP_ID and A.TENANT_ID=B.TENANT_ID and A.COMM not in (''02'',''12'') and A.TENANT_ID=:TENANT_ID and A.ACCOUNT=:ACCOUNT';
        rs.ParamByName('TENANT_ID').AsInteger := tenantId;
        rs.ParamByName('ACCOUNT').AsString := token.account;
        dataFactory.Open(rs);
        if rs.IsEmpty then Raise Exception.Create('��ȡ�û���Ϣʧ�ܣ������µ�¼...'); 
        token.userId := rs.FieldbyName('USER_ID').AsString;
        token.account := rs.FieldbyName('ACCOUNT').AsString;
        token.tenantId := rs.FieldbyName('TENANT_ID').AsString;
        token.tenantName := rs.FieldbyName('TENANT_NAME').AsString;
        token.shopId := rs.FieldbyName('SHOP_ID').AsString;
        token.shopName := rs.FieldbyName('SHOP_NAME').AsString;
        token.username := rs.FieldbyName('USER_NAME').AsString;
        rs.Close;
        rs.SQL.Text := 'select XSM_CODE,XSM_PSWD,ADDRESS,LICENSE_CODE,LINKMAN,TELEPHONE from CA_SHOP_INFO where TENANT_ID=:TENANT_ID and SHOP_ID=:SHOP_ID';
        rs.ParamByName('TENANT_ID').AsInteger := StrtoInt(token.tenantId);
        rs.ParamByName('SHOP_ID').AsString := token.shopId;
        dataFactory.Open(rs);
        token.address := rs.FieldbyName('ADDRESS').AsString;
        token.xsmCode := rs.FieldbyName('XSM_CODE').AsString;
        token.xsmPWD := rs.FieldbyName('XSM_PSWD').AsString;
        token.licenseCode := rs.FieldbyName('LICENSE_CODE').AsString;
        token.legal := rs.FieldbyName('LINKMAN').AsString;
        token.mobile := rs.FieldbyName('TELEPHONE').AsString;
        token.Logined := true;
        token.online := true;
      finally
        rs.Free;
      end;
     end;
  result := true;
end;

{ TDLLPlugin }

constructor TDLLPlugin.Create(dllname:string);
begin
  dllHandle := LoadLibrary(Pchar(extractFilePath(application.exename)+dllname));
  if dllHandle=0 then Raise Exception.Create('��Ч����ļ�'+dllname);
  try
    @initApp := GetProcAddress(dllHandle, 'initApp');
    if @initApp=nil then Raise Exception.Create('initApp����û��ʵ��');
    @openApp := GetProcAddress(dllHandle, 'openApp');
    if @openApp=nil then Raise Exception.Create('openApp����û��ʵ��');
    @closeApp := GetProcAddress(dllHandle, 'closeApp');
    if @closeApp=nil then Raise Exception.Create('closeApp����û��ʵ��');
    @eraseApp := GetProcAddress(dllHandle, 'eraseApp');
    if @eraseApp=nil then Raise Exception.Create('eraseApp����û��ʵ��');
    @getLastError := GetProcAddress(dllHandle, 'getLastError');
    if @getLastError=nil then Raise Exception.Create('getLastError����û��ʵ��');
    @getModuleName := GetProcAddress(dllHandle, 'getModuleName');
    if @getModuleName=nil then Raise Exception.Create('getModuleName����û��ʵ��');
    @resize := GetProcAddress(dllHandle, 'resize');
    if @resize=nil then Raise Exception.Create('resize����û��ʵ��');
    if not initApp(Application.Handle,dllFactory.getDBHelp,pchar(token.encode)) then Raise Exception.Create('��ʼ��'+dllname+'Ӧ��ʧ��');
  except
    freeLibrary(dllHandle);
    dllHandle := 0;
    raise;
  end;
end;

destructor TDLLPlugin.Destroy;
begin
  if dllHandle>0 then
     begin
       eraseApp;
       FreeLibrary(dllHandle);
     end;
  inherited;
end;

procedure TDLLPlugin.SetappId(const Value: string);
begin
  FappId := Value;
end;

procedure TDLLPlugin.SetDLLHandle(const Value: THandle);
begin
  FDLLHandle := Value;
end;

end.