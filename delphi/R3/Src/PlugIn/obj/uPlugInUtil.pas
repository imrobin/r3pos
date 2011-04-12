{------------------------------------------------------------------------------
  插件共用函数单元

  
 ------------------------------------------------------------------------------}
unit uPlugInUtil;

interface

uses
  DB,
  zDataSet,
  SysUtils,
  Variants,
  Classes,
  zBase;
  
type
  IPlugIn = Interface(IUnknown)
    ['{34E06C0E-34E5-4BB8-A10F-3F1ECB983AD8}']
    
    //设置当前插件参数,指定连锁ID号
    function SetParams(DbID:integer):integer; stdcall;
    //读取执行出错信息说明
    function GetLastError:Pchar; stdcall;

    //开始事务, 超时设置 单位秒
    function BeginTrans(TimeOut:integer=-1):integer; stdcall;
    //提交事务
    function CommitTrans:integer; stdcall;
    //回滚事务
    function RollbackTrans:integer; stdcall;

    //得到数据库类型 0:SQL Server ;1 Oracle ; 2 Sybase; 3 ACCESS; 4 DB2;  5 Sqlite
    function iDbType(var dbType:integer):integer; stdcall;

    //HRESULT 返回值说明 =0表示执行成功 否则为错误代码
    function Open(SQL:Pchar;var Data:OleVariant):integer;stdcall;
    //提交数据集
    function UpdateBatch(Delta:OleVariant;ZClassName:Pchar):integer;stdcall;
    //返回执行影响记录数
    function ExecSQL(SQL:Pchar;var iRet:integer):integer;stdcall;

    //锁定连接
    function DbLock(Locked:boolean):integer;stdcall;
    //日志服务
    function WriteLogFile(s:Pchar):integer;stdcall;
   end;

//共用变量定义
var
  GPlugIn:IPlugIn;
  GLastError:string;
 

//插件常用函数
function NewId(id:string=''): string; //获取GUID
function OpenData(PlugIntf: IPlugIn; Qry: TZQuery; SQL: string): Boolean; //查询数据（加日志）

implementation


function NewId(id:string=''): string;
var
  g:TGuid;
begin
  if CreateGUID(g)=S_OK then
  begin
     result :=trim(GuidToString(g));
     result :=Copy(result,2,length(result)-2);  //去掉"{}"
  end else
     result :=id+'_'+formatDatetime('YYYYMMDDHHNNSS',now());
end;

function OpenData(PlugIntf: IPlugIn; Qry: TZQuery; SQL: string): Boolean;
var
  ReRun: integer;
  vData: OleVariant;
begin
  result:=False;
  try
    ReRun:=PlugIntf.Open(Pchar(SQL),vData);
    if (ReRun=0) and (VarIsArray(vData)) then
    begin
      Qry.Close;
      Qry.Data:=vData;
      Result:=Qry.Active;
    end;
    if ReRun<>0 then
      Exception.Create(StrPas(GPlugIn.GetLastError));
  except
    on E:Exception do
    begin
      GLastError := E.Message;
      PlugIntf.WriteLogFile(Pchar('PlugIntf.Open:('+Qry.Name+') 出错：'+E.Message));
    end;
  end;
end;  


end.
