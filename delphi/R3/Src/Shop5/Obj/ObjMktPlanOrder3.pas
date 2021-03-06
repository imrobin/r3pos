unit ObjMktPlanOrder3;

interface
uses Dialogs,SysUtils,ZBase,Classes,ZIntf,ObjCommon,DB,ZDataSet;

type
  TMktPlanOrder3=class(TZFactory)
  private
    Locked:boolean;
  public
    function CheckTimeStamp(aGlobal:IdbHelp;s:string;comm:boolean=true):boolean;
    function BeforeUpdateRecord(AGlobal:IdbHelp): Boolean;override;
    //记录行集新增检测函数，返回值是True 测可以新增当前记录
    function BeforeInsertRecord(AGlobal:IdbHelp):Boolean;override;
    //记录行集修改检测函数，返回值是True 测可以修改当前记录
    function BeforeModifyRecord(AGlobal:IdbHelp):Boolean;override;
    //记录行集删除检测函数，返回值是True 测可以删除当前记录
    function BeforeDeleteRecord(AGlobal:IdbHelp):Boolean;override;
    function BeforeCommitRecord(AGlobal:IdbHelp):Boolean;override;
    procedure InitClass; override;
  end;
  TMktPlanData3=class(TZFactory)
  public
    function BeforeUpdateRecord(AGlobal:IdbHelp): Boolean;override;
    //记录行集新增检测函数，返回值是True 测可以新增当前记录
    function BeforeInsertRecord(AGlobal:IdbHelp):Boolean;override;
    //记录行集修改检测函数，返回值是True 测可以修改当前记录
    function BeforeModifyRecord(AGlobal:IdbHelp):Boolean;override;
    //记录行集删除检测函数，返回值是True 测可以删除当前记录
    function BeforeDeleteRecord(AGlobal:IdbHelp):Boolean;override;
    function BeforeCommitRecord(AGlobal:IdbHelp):Boolean;override;
    procedure InitClass; override;
  end;
  TMktPlanOrderGetPrior3=class(TZFactory)
  public
    procedure InitClass;override;
  end;
  TMktPlanOrderGetNext3=class(TZFactory)
  public
    procedure InitClass;override;
  end;
  TMktPlanOrderAudit3=class(TZProcFactory)
  public
    function Execute(AGlobal:IdbHelp;Params:TftParamList):Boolean;override;
  end;
  TMktPlanOrderUnAudit3=class(TZProcFactory)
  public
    function Execute(AGlobal:IdbHelp;Params:TftParamList):Boolean;override;
  end;
  
implementation

{ TMktPlanOrderUnAudit3 }

function TMktPlanOrderUnAudit3.Execute(AGlobal: IdbHelp;
  Params: TftParamList): Boolean;
var Str:string;
    n:Integer;
    rs:TZQuery;
begin
  try
    Str := 'update MKT_PLANORDER set CHK_DATE=null,CHK_USER=null,COMM=' + GetCommStr(AGlobal.iDbType) +',TIME_STAMP='+GetTimeStamp(AGlobal.iDbType)+
           ' where TENANT_ID='+Params.FindParam('TENANT_ID').asString +' and PLAN_ID='''+Params.FindParam('PLAN_ID').asString+''' and CHK_DATE IS NOT NULL';
    n := AGlobal.ExecSQL(Str);
    if n=0 then
       Raise Exception.Create('没找到已审核单据，是否被另一用户删除或反审核。')
    else
    if n>1 then
       Raise Exception.Create('删除指令会影响多行，可能数据库中数据误。');
    MSG := '反审核单据成功。';
    Result := True;
  except
    on E:Exception do
       begin
         Result := False;
         Msg := '反审核错误:'+E.Message;
       end;
  end;
end;

{ TMktPlanOrder3 }

function TMktPlanOrder3.BeforeCommitRecord(AGlobal: IdbHelp): Boolean;
begin

end;

function TMktPlanOrder3.BeforeDeleteRecord(AGlobal: IdbHelp): Boolean;
var
  rs:TZQuery;
begin
  if not CheckTimeStamp(AGlobal,FieldbyName('TIME_STAMP').AsString,true) then Raise Exception.Create('当前单据已经被另一用户修改，你不能再保存。');
  if (FieldbyName('BOND_MNY').AsOldFloat <> 0) then  //删除时检测
     begin
       rs := TZQuery.Create(nil);
       try
         rs.SQL.Text := 'select PAYM_MNY from ACC_PAYABLE_INFO where TENANT_ID=:TENANT_ID and STOCK_ID=:PLAN_ID and ABLE_TYPE=''8''';
         rs.ParamByName('TENANT_ID').AsInteger := FieldByName('TENANT_ID').AsOldInteger;
         rs.ParamByName('PLAN_ID').AsString := FieldByName('PLAN_ID').AsOldString;
         AGlobal.Open(rs);
         if (rs.Fields[0].AsFloat <>0) then Raise Exception.Create('已经收款的单不能修改...');
         AGlobal.ExecSQL('delete from ACC_PAYABLE_INFO where TENANT_ID='+FieldbyName('TENANT_ID').AsOldString+' and STOCK_ID='''+FieldbyName('PLAN_ID').AsOldString+''' and ABLE_TYPE=''8''');
       finally
         rs.Free;
       end;
     end;
  result := true;
end;

function TMktPlanOrder3.BeforeInsertRecord(AGlobal: IdbHelp): Boolean;
var rs:TZQuery;
begin
  if (Params.FindParam('SyncFlag')=nil) or (Params.FindParam('SyncFlag').asInteger=0) then
     begin
     if (FieldbyName('GLIDE_NO').AsString='') or (Pos('新增',FieldbyName('GLIDE_NO').AsString)>0) then
        FieldbyName('GLIDE_NO').AsString := trimright(FieldbyName('TENANT_ID').AsString+'0001',4)+GetSequence(AGlobal,'GNO_D_'+FieldbyName('TENANT_ID').AsString+'0001',FieldbyName('TENANT_ID').AsString,formatDatetime('YYMMDD',now()),5);
     end;

  rs := TZQuery.Create(nil);
  try
    rs.SQL.Text := 'select count(*) as Record_Sum from MKT_PLANORDER where COMM not in (''02'',''12'') and CLIENT_ID=:CLIENT_ID and PLAN_TYPE=''3'' and TENANT_ID=:TENANT_ID and KPI_YEAR=:KPI_YEAR ';
    rs.ParamByName('CLIENT_ID').AsString := FieldByName('CLIENT_ID').AsString;
    rs.ParamByName('TENANT_ID').AsInteger := FieldByName('TENANT_ID').AsInteger;
    rs.ParamByName('KPI_YEAR').AsInteger := FieldByName('KPI_YEAR').AsInteger;
    aGlobal.Open(rs);

    if rs.FieldByName('Record_Sum').AsInteger > 0 then
       Raise Exception.Create('跟供应商在"'+FieldbyName('KPI_YEAR').AsString+'"年度已经签约了..');
  finally
    rs.Free;
  end;

  //生成固定保证金，应付款
  if (FieldbyName('BOND_MNY').AsFloat <> 0) then
  begin
     AGlobal.ExecSQL(
         'insert into ACC_PAYABLE_INFO(ABLE_ID,TENANT_ID,SHOP_ID,DEPT_ID,CLIENT_ID,ACCT_INFO,ABLE_TYPE,ACCT_MNY,PAYM_MNY,REVE_MNY,RECK_MNY,ABLE_DATE,STOCK_ID,CREA_DATE,CREA_USER,COMM,TIME_STAMP) '
       + 'VALUES('''+newid(FieldbyName('SHOP_ID').AsString)+''',:TENANT_ID,:SHOP_ID,:DEPT_ID,:CLIENT_ID,'''+'固定保证金【合同号'+FieldbyName('GLIDE_NO').AsString+'】'+''',''8'',:BOND_MNY,0,0,:BOND_MNY,:PLAN_DATE,:PLAN_ID,:CREA_DATE,:CREA_USER,''00'','+GetTimeStamp(iDbType)+')'
    ,self);
  end;

end;

function TMktPlanOrder3.BeforeModifyRecord(AGlobal: IdbHelp): Boolean;
var rs:TZQuery;
begin
  if not CheckTimeStamp(AGlobal,FieldbyName('TIME_STAMP').AsString,false) then Raise Exception.Create('当前单据已经被另一用户修改，你不能再保存。');
  rs := TZQuery.Create(nil);
  try
    rs.SQL.Text := 'select count(*) as Record_Sum from MKT_PLANORDER where COMM not in (''02'',''12'') and CLIENT_ID=:CLIENT_ID and PLAN_TYPE=''3'' and TENANT_ID=:TENANT_ID and KPI_YEAR=:KPI_YEAR and PLAN_ID<>:PLAN_ID ';
    rs.ParamByName('CLIENT_ID').AsString := FieldByName('CLIENT_ID').AsString;
    rs.ParamByName('PLAN_ID').AsString := FieldByName('PLAN_ID').AsOldString;
    rs.ParamByName('TENANT_ID').AsInteger := FieldByName('TENANT_ID').AsInteger;
    rs.ParamByName('KPI_YEAR').AsInteger := FieldByName('KPI_YEAR').AsInteger;
    aGlobal.Open(rs);

    if rs.FieldByName('Record_Sum').AsInteger > 0 then
       Raise Exception.Create('跟供应商在"'+FieldbyName('KPI_YEAR').AsString+'"年度已经签约了..');
  finally
    rs.Free;
  end;     
  //修改时处理应付账款
  AGlobal.ExecSQL('update ACC_PAYABLE_INFO set ACCT_MNY=:BOND_MNY,RECK_MNY=:BOND_MNY - PAYM_MNY - REVE_MNY,SHOP_ID=:SHOP_ID,DEPT_ID=:DEPT_ID,CLIENT_ID=:CLIENT_ID,ABLE_DATE=:PLAN_DATE,STOCK_ID=:PLAN_ID '+
    'where TENANT_ID=:OLD_TENANT_ID and STOCK_ID=:OLD_PLAN_ID and ABLE_TYPE=''8''',self);
end;

function TMktPlanOrder3.BeforeUpdateRecord(AGlobal: IdbHelp): Boolean;
begin

end;

function TMktPlanOrder3.CheckTimeStamp(aGlobal: IdbHelp; s: string;
  comm: boolean): boolean;
var
  rs:TZQuery;
begin
  rs := TZQuery.Create(nil);
  try
    rs.SQL.Text := 'select TIME_STAMP,COMM from MKT_PLANORDER where PLAN_ID='''+FieldbyName('PLAN_ID').AsString+''' and TENANT_ID='+FieldbyName('TENANT_ID').AsString+'';
    aGlobal.Open(rs);
    result := (rs.Fields[0].AsString = s);
    if comm and result and
    (
       (copy(rs.Fields[1].asString,1,1)='1')
       or
       (copy(rs.Fields[1].asString,2,1)<>'0')
    )
    then Raise Exception.Create('已经同步的数据不能删除..');
  finally
    rs.Free;
  end;
end;

procedure TMktPlanOrder3.InitClass;
var
  Str: string;
begin
  inherited;
  Locked := false;
  SelectSQL.Text :=
     'select A.TENANT_ID,A.PLAN_ID,A.PLAN_TYPE,A.GLIDE_NO,A.FILES_NO,A.KPI_YEAR,A.PLAN_DATE,A.BEGIN_DATE,A.END_DATE,A.CLIENT_ID,'+
     'B.CLIENT_NAME,A.DEPT_ID,A.SHOP_ID,H.SHOP_NAME as SHOP_ID_TEXT,F.DEPT_NAME as DEPT_ID_TEXT,A.PLAN_USER,D.USER_NAME as PLAN_USER_TEXT,'+
     'A.CHK_DATE,A.CHK_USER,C.USER_NAME as CHK_USER_TEXT,A.PLAN_AMT,A.PLAN_MNY,A.BOND_MNY,'+
     'A.BUDG_MNY,A.REMARK,A.CREA_DATE,A.CREA_USER,E.USER_NAME as CREA_USER_TEXT,A.COMM,A.TIME_STAMP '+
     ' from MKT_PLANORDER A left join VIW_CLIENTINFO B on A.TENANT_ID=B.TENANT_ID and A.CLIENT_ID=B.CLIENT_ID '+
     ' left join VIW_USERS C on A.TENANT_ID=C.TENANT_ID and A.CHK_USER=C.USER_ID '+
     ' left join VIW_USERS D on A.TENANT_ID=D.TENANT_ID and A.PLAN_USER=D.USER_ID '+
     ' left join VIW_USERS E on A.TENANT_ID=E.TENANT_ID and A.CREA_USER=E.USER_ID '+
     ' left join CA_DEPT_INFO F on A.TENANT_ID=F.TENANT_ID and A.DEPT_ID=F.DEPT_ID '+
     ' left join CA_SHOP_INFO H on A.TENANT_ID=H.TENANT_ID and A.SHOP_ID=H.SHOP_ID '+
     ' where A.TENANT_ID=:TENANT_ID and A.PLAN_ID=:PLAN_ID order by A.PLAN_ID ';
  IsSQLUpdate := True;
  Str := 'insert into MKT_PLANORDER(TENANT_ID,PLAN_ID,PLAN_TYPE,GLIDE_NO,FILES_NO,KPI_YEAR,PLAN_DATE,BEGIN_DATE,END_DATE,CLIENT_ID,DEPT_ID,SHOP_ID,PLAN_USER,CHK_DATE,CHK_USER,PLAN_AMT,PLAN_MNY,BOND_MNY,BUDG_MNY,REMARK,CREA_DATE,CREA_USER,COMM,TIME_STAMP) '
    + 'VALUES(:TENANT_ID,:PLAN_ID,:PLAN_TYPE,:GLIDE_NO,:FILES_NO,:KPI_YEAR,:PLAN_DATE,:BEGIN_DATE,:END_DATE,:CLIENT_ID,:DEPT_ID,:SHOP_ID,:PLAN_USER,:CHK_DATE,:CHK_USER,:PLAN_AMT,:PLAN_MNY,:BOND_MNY,:BUDG_MNY,:REMARK,:CREA_DATE,:CREA_USER,''00'','+GetTimeStamp(iDbType)+')';
  InsertSQL.Text := Str;
  Str := 'update MKT_PLANORDER set TENANT_ID=:TENANT_ID,PLAN_ID=:PLAN_ID,PLAN_TYPE=:PLAN_TYPE,GLIDE_NO=:GLIDE_NO,FILES_NO=:FILES_NO,KPI_YEAR=:KPI_YEAR,PLAN_DATE=:PLAN_DATE,BEGIN_DATE=:BEGIN_DATE,END_DATE=:END_DATE,'+
      'CLIENT_ID=:CLIENT_ID,DEPT_ID=:DEPT_ID,SHOP_ID=:SHOP_ID,PLAN_USER=:PLAN_USER,CHK_DATE=:CHK_DATE,CHK_USER=:CHK_USER,PLAN_AMT=:PLAN_AMT,PLAN_MNY=:PLAN_MNY,BOND_MNY=:BOND_MNY,BUDG_MNY=:BUDG_MNY,REMARK=:REMARK,CREA_DATE=:CREA_DATE,CREA_USER=:CREA_USER,'
    + 'COMM=' + GetCommStr(iDbType) + ','
    + 'TIME_STAMP='+GetTimeStamp(iDbType)+' '
    + 'where TENANT_ID=:OLD_TENANT_ID and PLAN_ID=:OLD_PLAN_ID';
  UpdateSQL.Text := Str;
  Str := ' delete from MKT_PLANORDER where TENANT_ID=:OLD_TENANT_ID and PLAN_ID=:OLD_PLAN_ID ';
  DeleteSQL.Text := Str;
end;

{ TMktPlanData3 }

function TMktPlanData3.BeforeCommitRecord(AGlobal: IdbHelp): Boolean;
begin

end;

function TMktPlanData3.BeforeDeleteRecord(AGlobal: IdbHelp): Boolean;
begin
  Result := True;
end;

function TMktPlanData3.BeforeInsertRecord(AGlobal: IdbHelp): Boolean;
begin
  Result := True;
end;

function TMktPlanData3.BeforeModifyRecord(AGlobal: IdbHelp): Boolean;
begin
  result := BeforeDeleteRecord(AGlobal);
  result := BeforeInsertRecord(AGlobal);
end;

function TMktPlanData3.BeforeUpdateRecord(AGlobal: IdbHelp): Boolean;
begin

end;

procedure TMktPlanData3.InitClass;
var
  Str: string;
begin
  inherited;
  SelectSQL.Text :=
     'select A.TENANT_ID,A.SEQNO,A.PLAN_ID,A.KPI_ID,A.SHOP_ID,B.KPI_NAME as KPI_ID_TEXT,B.UNIT_NAME,A.AMOUNT,A.AMONEY,A.BOND_MNY,A.REMARK,A.BUDG_MNY '+
     ' from MKT_PLANDATA A left join MKT_KPI_INDEX B on A.TENANT_ID=B.TENANT_ID and A.KPI_ID=B.KPI_ID where A.TENANT_ID=:TENANT_ID and A.PLAN_ID=:PLAN_ID order by A.SEQNO ';
  IsSQLUpdate := True;
  Str := 'insert into MKT_PLANDATA(TENANT_ID,SEQNO,PLAN_ID,KPI_ID,SHOP_ID,AMOUNT,AMONEY,BOND_MNY,BUDG_MNY,REMARK) '
    + 'VALUES(:TENANT_ID,:SEQNO,:PLAN_ID,:KPI_ID,:SHOP_ID,:AMOUNT,:AMONEY,:BOND_MNY,:BUDG_MNY,:REMARK)';
  InsertSQL.Text := Str;                                                          
  Str := 'update MKT_PLANDATA set TENANT_ID=:TENANT_ID,SEQNO=:SEQNO,PLAN_ID=:PLAN_ID,KPI_ID=:KPI_ID,SHOP_ID=:SHOP_ID,AMOUNT=:AMOUNT,AMONEY=:AMONEY,BOND_MNY=:BOND_MNY,REMARK=:REMARK,BUDG_MNY=:BUDG_MNY '
    + 'where TENANT_ID=:OLD_TENANT_ID and PLAN_ID=:OLD_PLAN_ID and SEQNO=:OLD_SEQNO';
  UpdateSQL.Text := Str;
  Str := 'delete from MKT_PLANDATA where TENANT_ID=:OLD_TENANT_ID and PLAN_ID=:OLD_PLAN_ID and SEQNO=:OLD_SEQNO';
  DeleteSQL.Text := Str;
end;

{ TMktPlanOrderGetPrior3 }

procedure TMktPlanOrderGetPrior3.InitClass;
begin
  inherited;
  case iDbType of
  0,3:SelectSQL.Text := 'select top 1 PLAN_ID from MKT_PLANORDER where TENANT_ID=:TENANT_ID and PLAN_TYPE =:PLAN_TYPE and CREA_USER=:CREA_USER and GLIDE_NO<:GLIDE_NO order by GLIDE_NO DESC';
  1:SelectSQL.Text := 'select * from (select PLAN_ID from MKT_PLANORDER where TENANT_ID=:TENANT_ID and PLAN_TYPE =:PLAN_TYPE and CREA_USER=:CREA_USER and GLIDE_NO<:GLIDE_NO order by GLIDE_NO DESC ) where ROWNUM=1';
  4:SelectSQL.Text := 'select * from (select PLAN_ID from MKT_PLANORDER where TENANT_ID=:TENANT_ID and PLAN_TYPE =:PLAN_TYPE and CREA_USER=:CREA_USER and GLIDE_NO<:GLIDE_NO order by GLIDE_NO DESC ) tp fetch first 1 rows only';
  5:SelectSQL.Text := 'select PLAN_ID from MKT_PLANORDER where TENANT_ID=:TENANT_ID and PLAN_TYPE =:PLAN_TYPE and CREA_USER=:CREA_USER and GLIDE_NO<:GLIDE_NO order by GLIDE_NO DESC limit 1';
  end;
end;

{ TMktPlanOrderGetNext3 }

procedure TMktPlanOrderGetNext3.InitClass;
begin
  inherited;
  case iDbType of
  0,3:SelectSQL.Text := 'select top 1 PLAN_ID from MKT_PLANORDER where TENANT_ID=:TENANT_ID and PLAN_TYPE =:PLAN_TYPE and CREA_USER=:CREA_USER and GLIDE_NO>:GLIDE_NO order by GLIDE_NO';
  1:SelectSQL.Text := 'select * from (select PLAN_ID from MKT_PLANORDER where TENANT_ID=:TENANT_ID and PLAN_TYPE =:PLAN_TYPE and CREA_USER=:CREA_USER and GLIDE_NO>:GLIDE_NO order by GLIDE_NO) where ROWNUM=1';
  4:SelectSQL.Text := 'select * from (select PLAN_ID from MKT_PLANORDER where TENANT_ID=:TENANT_ID and PLAN_TYPE =:PLAN_TYPE and CREA_USER=:CREA_USER and GLIDE_NO>:GLIDE_NO order by GLIDE_NO) tp fetch first 1 rows only';
  5:SelectSQL.Text := 'select PLAN_ID from MKT_PLANORDER where TENANT_ID=:TENANT_ID and PLAN_TYPE =:PLAN_TYPE and CREA_USER=:CREA_USER and GLIDE_NO>:GLIDE_NO order by GLIDE_NO limit 1';
  end;
end;

{ TMktPlanOrderAudit3 }

function TMktPlanOrderAudit3.Execute(AGlobal: IdbHelp;
  Params: TftParamList): Boolean;
var Str:string;
    n:Integer;
    Temp:TZQuery;
begin
  try

    Str := 'update MKT_PLANORDER set CHK_DATE='''+Params.FindParam('CHK_DATE').asString+''',CHK_USER='''+Params.FindParam('CHK_USER').asString+''',COMM=' + GetCommStr(AGlobal.iDbType) +
           ',TIME_STAMP='+GetTimeStamp(AGlobal.iDbType)+' where TENANT_ID='+Params.FindParam('TENANT_ID').asString +' and PLAN_ID='''+Params.FindParam('PLAN_ID').asString+''' and CHK_DATE IS NULL';
    n := AGlobal.ExecSQL(Str);
    if n=0 then
       Raise Exception.Create('没找到待审核单据，是否被另一用户删除或已审核。')
    else
    if n>1 then
       Raise Exception.Create('删除指令会影响多行，可能数据库中数据误。');
    Result := true;
    Msg := '审核单据成功';
  except
    on E:Exception do
      begin
        Result := false;
        Msg := '审核错误'+E.Message;
      end;
  end;
end;

initialization
  RegisterClass(TMktPlanOrder3);
  RegisterClass(TMktPlanData3);
  RegisterClass(TMktPlanOrderGetPrior3);
  RegisterClass(TMktPlanOrderGetNext3);
  RegisterClass(TMktPlanOrderAudit3);
  RegisterClass(TMktPlanOrderUnAudit3);
  
finalization
  UnRegisterClass(TMktPlanOrder3);
  UnRegisterClass(TMktPlanData3);
  UnRegisterClass(TMktPlanOrderGetPrior3);
  UnRegisterClass(TMktPlanOrderGetNext3);
  UnRegisterClass(TMktPlanOrderAudit3);
  UnRegisterClass(TMktPlanOrderUnAudit3);
end.
