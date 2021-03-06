unit ObjUserRights;

interface

uses
  Dialogs,SysUtils,zBase,Classes, AdoDb,ZIntf,ObjCommon,ZDataset;

type
  // [R3初步设计时暂不考虑以单个操作员设置权限]，以下类暂时没通过调试
  {== 单个User直接设置权限 ==}
  TUserRights=class(TZFactory)
  public
    procedure InitClass;override;
  end;

  {==用户的角色列表处理==}
  TUserRolesList=class(TZProcFactory)
  public
    function Execute(AGlobal:IdbHelp; Params:TftParamList):Boolean;override;
  end;

  TUserRightsData=class(TZFactory)
  public
    function BeforeInsertRecord(AGlobal:IdbHelp):Boolean;override;
    procedure InitClass;override;
  end;



implementation

{ TRigths }

procedure TUserRights.InitClass;
var Str:string;
begin
  inherited;
  SelectSQL.Text:=' select TENANT_ID,MODU_ID,ROLE_ID,ROLE_TYPE,CHK from CA_RIGHTS where ROLE_TYPE=0 and TENANT_ID=''----'' and UID=:UID';
  Str:='insert into CA_RIGHTS(ROWS_ID,TENANT_ID,MODU_ID,ROLE_ID,ROLE_TYPE,CHK,COMM,TIME_STAMP) '
     + 'VALUES(:ROWS_ID,:TENANT_ID,:MODU_ID,:ROLE_ID,:ROLE_TYPE,:CHK,''00'','+GetTimeStamp(iDbType)+')';
  InsertSQL.Add(Str);
  Str:='update CA_RIGHTS set TENANT_ID=:TENANT_ID,MODU_ID=:MODU_ID,ROLE_ID=:ROLE_ID,ROLE_TYPE=:ROLE_TYPE,CHK=:CHK,'
  + 'COMM=' + GetCommStr(iDbType)+',TIME_STAMP='+GetTimeStamp(iDbType)
  + 'where TENANT_ID=:OLD_TENANT_ID and MODU_ID=:OLD_MODU_ID  and ROLE_TYPE=1 and MID=:OLD_MID';
  UpdateSQL.Add(Str);
  case iDbType of
  1: Str:= 'delete CA_RIGHTS where TENANT_ID=:OLD_TENANT_ID and ROLE_ID=:OLD_ROLE_ID  and ROLE_TYPE=OLD_ROLE_TYPE and MODU_ID=:OLD_MODU_ID ';
  0,3,4,5:
     Str:= 'delete from CA_RIGHTS where TENANT_ID=:OLD_TENANT_ID and ROLE_ID=:OLD_ROLE_ID  and ROLE_TYPE=OLD_ROLE_TYPE and MODU_ID=:OLD_MODU_ID ';
  end;
  DeleteSQL.Add(Str);
end;

{ TUserRolesList }

function TUserRolesList.Execute(AGlobal: IdbHelp; Params: TftParamList): Boolean;
var Str: String;
begin
  Result:=False;
  try
    Str:='update CA_USERS set ROLE_IDS=:ROLE_IDS,ROLE_NAMES=:ROLE_NAMES,COMM=''01'',TIME_STAMP='+GetTimeStamp(AGlobal.iDbType)+
         ' where TENANT_ID=:TENANT_ID and USER_ID=:USER_ID ';
    AGlobal.ExecSQL(Str,Params);
    result := true;
  except
    on E:Exception do
    begin
      Msg := E.Message;
    end;
  end;  
end;

{ TUserRightsData }

function TUserRightsData.BeforeInsertRecord(AGlobal: IdbHelp): Boolean;
var rs:TZQuery;
    Str:String;
begin
  rs := TZQuery.Create(nil);
  try
    rs.SQL.Text := ' select * from CA_RIGHT_FORDATA where TENANT_ID=:TENANT_ID and DATA_TYPE=:DATA_TYPE and USER_ID=:USER_ID and DATA_OBJECT=:DATA_OBJECT ';
    rs.ParamByName('USER_ID').AsString := FieldbyName('USER_ID').AsString;
    rs.ParamByName('TENANT_ID').AsInteger := FieldbyName('TENANT_ID').AsInteger;
    rs.ParamByName('DATA_TYPE').AsString := FieldbyName('DATA_TYPE').AsString;
    rs.ParamByName('DATA_OBJECT').AsString := FieldbyName('DATA_OBJECT').AsString;
    AGlobal.Open(rs);
    rs.First;
    while not rs.Eof do
      begin
        if copy(rs.FieldbyName('COMM').AsString,2,1)='2' then
        begin
          Str := 'delete from CA_RIGHT_FORDATA where TENANT_ID='+FieldbyName('TENANT_ID').AsString+' and ROWS_ID='''+rs.FieldbyName('ROWS_ID').AsString+''' ';
          AGlobal.ExecSQL(Str);
        end;
        rs.Next;
      end;
  finally
    rs.Free;
  end;
  Result := True;
end;

procedure TUserRightsData.InitClass;
var Str:string;
begin
  inherited;
  SelectSQL.Text:=' select ROWS_ID,TENANT_ID,DATA_TYPE,USER_ID,DATA_OBJECT from CA_RIGHT_FORDATA where TENANT_ID=:TENANT_ID and USER_ID=:USER_ID and COMM not in (''02'',''12'')';
  Str:='insert into CA_RIGHT_FORDATA(ROWS_ID,TENANT_ID,DATA_TYPE,USER_ID,DATA_OBJECT,COMM,TIME_STAMP) '
     + 'VALUES(:ROWS_ID,:TENANT_ID,:DATA_TYPE,:USER_ID,:DATA_OBJECT,''00'','+GetTimeStamp(iDbType)+')';
  InsertSQL.Add(Str);
  IsSQLUpdate := true;
  Str:='update CA_RIGHT_FORDATA set DATA_OBJECT=:DATA_OBJECT,'
  + 'COMM=' + GetCommStr(iDbType)+',TIME_STAMP='+GetTimeStamp(iDbType)
  + ' where TENANT_ID=:TENANT_ID and ROWS_ID=:OLD_ROWS_ID';
  UpdateSQL.Add(Str);

  Str:= 'update CA_RIGHT_FORDATA set COMM=''02'',TIME_STAMP='+GetTimeStamp(iDbType)+' where TENANT_ID=:TENANT_ID and ROWS_ID=:OLD_ROWS_ID ';
  DeleteSQL.Add(Str);
end;

initialization
  RegisterClass(TUserRights);
  RegisterClass(TUserRolesList);
  RegisterClass(TUserRightsData);

finalization
  UnRegisterClass(TUserRights);
  UnRegisterClass(TUserRolesList);
  UnRegisterClass(TUserRightsData);
  
end.
