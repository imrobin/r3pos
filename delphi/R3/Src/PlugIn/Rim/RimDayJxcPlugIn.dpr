{
  Create Date: 2011.04.13 Pm
  插件功能: Rsp平台上报卷烟供应链数据到 Rim

 }


library RimDayJxcPlugIn;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  DB,
  zDataSet,
  SysUtils,
  Variants,
  Classes,
  zBase,
  uBaseSyncFactory in '..\Pub\uBaseSyncFactory.pas',
  uRimSyncFactory in 'uRimSyncFactory.pas',
  uDayJxcFactory in 'uDayJxcFactory.pas';

{$R *.res}
 

//RSP装载插件时调用，传插件可访问的服务接口
function SetParams(PlugIn: IPlugIn):integer; stdcall;
begin
  GPlugIn := PlugIn;
end;

//插件中执行的所有操作都必须带 try except end 如果出错时，由此方法返回错信息
function GetLastError:Pchar; stdcall;
begin
  result := Pchar(GLastError);
end;

//返回当前插件说明
function GetPlugInDisplayName:Pchar; stdcall;
begin
  result := '上报每天进销存汇总插件';
end;

//为每个插件定义一个唯一标识号，范围1000-9999
function GetPlugInId:Integer; stdcall;
begin
  result := 810;  //RIM接口的插件
end;

//RSP调用插件时执行此方法
function DoExecute(Params:Pchar; var Data: oleVariant;dbResoler:integer):Integer; stdcall;
var
  SalesFactory: TSalesTotalSyncFactory;
begin
  result:=-1;
  GLastError:='';
  try
    try                                 
      SalesFactory:=TSalesTotalSyncFactory.Create;
      SalesFactory.dbResoler := dbResoler;
      SalesFactory.CallSyncData(GPlugIn,StrPas(Params));
      if not SalesFactory.HasError then //运行正常：
        result:=0
      else
        GLastError:='<810>'+SalesFactory.ErrorMsg;
    finally
      SalesFactory.Free;
    end;
  except
    on E:Exception do
      begin
        if GLastError='' then 
           GLastError := E.Message;
        result := 2001;
      end;
  end;
end;

//RSP调用插件自定义的管理界面,没有时直接返回0
function ShowPlugin:Integer; stdcall;
begin
  try
    //开始显示主界面窗体

    result := 0;
  except
    on E:Exception do
      begin
        GLastError := E.Message;
        result := 2002;
      end;
  end;
end;

exports
  SetParams,GetLastError,GetPlugInDisplayName,GetPlugInId,DoExecute,ShowPlugin;
begin

end.


