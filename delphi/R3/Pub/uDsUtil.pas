unit uDsUtil;

interface
uses Classes,SysUtils,Db,ZBase,ZdbFactory,uFnUtil,ZDataSet;
type

 TdsFind=class
 public
   class function GetNameByID(DataSet:TDataSet;KeyField,NameField:string;KeyValue:string):string;
 end;
 TdsItems=class
 public
   class procedure ClearItems(Items:TStrings);
   class function  FindItems(Items:TStrings;KeyField:string;KeyValue:string):Integer;
   class procedure AddDataSetToItems(DataSet:TDataSet;Items:TStrings;NameField:String);
 end;

 TSequence=class
 public
   class function GetSequence(SEQU_ID,COMP_ID,FLAG_TEXT:string;nLen:Integer;Number:Integer=1):String;overload;
   class function GetSequence(AFactor:TdbFactory;SEQU_ID,COMP_ID,FLAG_TEXT:string;nLen:Integer):String;overload;
   {$IFDEF LIBV4.0}
   class function GetSequence(AFactor:TIdFactor;SEQU_ID,COMP_ID,FLAG_TEXT:string;nLen:Integer):String;overload;
   {$ENDIF}
   class function GetMaxID(FlagText:String;Factor:TdbFactory;FieldName,TableName:String;nLen:String;CondiStr:String=''):String;overload;
   {$IFDEF LIBV4.0}
   class function GetMaxID(FlagText:String;Factor:TIdFactor;FieldName,TableName:String;nLen:String;CondiStr:String=''):String;overload;
   {$ENDIF}
   class function GetIntegerID(Factor:TdbFactory;FieldName,TableName:String;CondiStr:String=''):Integer;
   class function NewId():string;
 end;

implementation
uses uGlobal;

{ TdsFind }

class function TdsFind.GetNameByID(DataSet: TDataSet; KeyField,
  NameField: string;KeyValue:string): string;
begin
  if DataSet.Filtered then DataSet.Filtered := false;
  if DataSet.Locate(KeyField,KeyValue,[]) then
     Result := DataSet.FieldbyName(NameField).AsString
  else
     Result := '';
end;

{ TdsItems }

class procedure TdsItems.AddDataSetToItems(DataSet: TDataSet;
  Items: TStrings;NameField:String);
var AObj:TRecord_;
begin
  ClearItems(Items);
  DataSet.First;
  while not DataSet.Eof do
    begin
      AObj := TRecord_.Create(DataSet);
      AObj.ReadFromDataSet(DataSet);
      Items.AddObject(DataSet.FieldbyName(NameField).AsString ,AObj);
      DataSet.Next;
    end;
end;

class procedure TdsItems.ClearItems(Items:TStrings);
var i:Integer;
begin
  for i:=0 to Items.Count -1 do
    begin
      if (Items.Objects[i]<>nil) and (TObject(Items.Objects[i]) is TRecord_) then
         Items.Objects[i].Free
      else
      if Items.Objects[i]<>nil then
         Dispose(Pointer(Items.Objects[i]));

      Items.Objects[i] := nil;
    end;
  Items.Clear;
end;

class function TdsItems.FindItems(Items: TStrings; KeyField,
  KeyValue: string): Integer;
var i:Integer;
begin
  Result := -1;
  for i:=0 to Items.Count -1 do
    begin
      if Items.Objects[i]=nil then Continue;
      if UpperCase(TRecord_(Items.Objects[i]).FieldByName(KeyField).AsString)=UpperCase(KeyValue) then
        begin
           Result := i;
           Exit;
        end;
    end;
end;

{ TSequence }

class function TSequence.GetIntegerID(Factor: TdbFactory; FieldName,
  TableName, CondiStr: String): Integer;
Var DataSet:TZQuery;
Begin
  DataSet:=TZQuery.Create(nil);
  try
    With DataSet Do
     Begin
        Close;
        SQL.Clear;
        SQL.Add('Select Max('+FieldName+') From '+TableName);
        if CondiStr<>'' then
           SQL.Text := SQL.Text +' where '+CondiStr;

        Factor.Open(DataSet);
        Result := DataSet.Fields[0].AsInteger +1;
     end;
  finally
    DataSet.Free;
  end;
end;

class function TSequence.GetMaxID(FlagText: String; Factor: TdbFactory;
  FieldName, TableName, nLen, CondiStr: String): String;
Var ss:String;
    TmpLen:Integer;
    DataSet:TZQuery;
Begin
  DataSet:=TZQuery.Create(nil);
  try
    With DataSet Do
     Begin
        TmpLen:=Length(FlagText)+Length(nLen);
        Close;
        SQL.Clear;

        case Factor.iDbType of
        0,3:SQL.Add('Select Max('+FieldName+') From '+TableName+' Where '+FieldName+' Like '''+FlagText+'%'' and Len('+FieldName+')='+Inttostr(TmpLen));
        1:SQL.Add('Select Max('+FieldName+') From '+TableName+' Where '+FieldName+' Like '''+FlagText+'%'' and Length('+FieldName+')='+Inttostr(TmpLen));
        end;

        if CondiStr<>'' then
           SQL.Text := SQL.Text +' and '+CondiStr;

        Factor.Open(DataSet);
        If Fields[0].asString='' Then
           Result:=FlagText+FormatFloat(nLen,1) Else
         Begin
           TmpLen:=Length(FlagText);
           ss:=Fields[0].asString;
           System.Delete(ss,1,TmpLen);
           Result:=FlagText+FnString.IncCode(ss,Length(nLen));
         end;
     end;
    finally
    DataSet.Free;
  end;
end;


class function TSequence.GetSequence(SEQU_ID, COMP_ID, FLAG_TEXT: string;
  nLen: Integer;Number:Integer=1): String;
  function GetFormat:string;
    var i:Integer;
    begin
      Result := '';
      for i:=1 to nLen do
        Result := Result +'0';
    end;
var Temp:TZQuery;
    Str,flag:string;
    InTrans:Boolean;
begin
  InTrans := Factor.InTransaction;
  Temp := TZQuery.Create(nil);
  try
     if not InTrans then Factor.BeginTrans(10);
     try
       case Factor.iDbType of
       0:Temp.SQL.Text := 'select FLAG_TEXT,SEQU_NO from SYS_SEQUENCE with (UPDLOCK) where COMP_ID='''+COMP_ID+''' and SEQU_ID='''+SEQU_ID+''' ';
       1:Temp.SQL.Text := 'select FLAG_TEXT,SEQU_NO from SYS_SEQUENCE where COMP_ID='''+COMP_ID+''' and SEQU_ID='''+SEQU_ID+''' FOR UPDATE';
       3:begin
          Factor.ExecSQL('update SYS_SEQUENCE set SEQU_NO=SEQU_NO+1 where COMP_ID='''+COMP_ID+''' and SEQU_ID='''+SEQU_ID+'''');
          Temp.SQL.Text := 'select FLAG_TEXT,SEQU_NO from SYS_SEQUENCE where COMP_ID='''+COMP_ID+''' and SEQU_ID='''+SEQU_ID+''' ';
         end;
       end;
       Factor.Open(Temp);
       if Temp.IsEmpty then
          begin
            Result := FLAG_TEXT+FormatFloat(GetFormat,1);
            Str := 'insert into SYS_SEQUENCE(COMP_ID,SEQU_ID,FLAG_TEXT,SEQU_NO,COMM) values('''+COMP_ID+''','''+SEQU_ID+''','''+FLAG_TEXT+''','+Inttostr(Number)+',''00'')';
          end
       else
       if (Temp.FieldbyName('FLAG_TEXT').AsString<FLAG_TEXT) then
          begin
            Result := FLAG_TEXT+FormatFloat(GetFormat,1);
            Str := 'update SYS_SEQUENCE set FLAG_TEXT='''+FLAG_TEXT+''',SEQU_NO='+Inttostr(Number)+' where COMP_ID='''+COMP_ID+''' and SEQU_ID='''+SEQU_ID+'''';
          end
       else
          begin
            if Temp.FieldbyName('FLAG_TEXT').AsString=FLAG_TEXT then
               flag := FLAG_TEXT
            else
               flag := Temp.FieldbyName('FLAG_TEXT').AsString;
            if Factor.iDbType = 3 then
               begin
                 Result := flag+FormatFloat(GetFormat,Temp.FieldbyName('SEQU_NO').AsInteger);
                 Number := 0;
               end
            else
               Result := flag+FormatFloat(GetFormat,Temp.FieldbyName('SEQU_NO').AsInteger+1);
            Str := 'update SYS_SEQUENCE set FLAG_TEXT='''+flag+''',SEQU_NO='+Inttostr(Temp.FieldbyName('SEQU_NO').AsInteger+Number)+' where COMP_ID='''+COMP_ID+''' and SEQU_ID='''+SEQU_ID+'''';
          end;
       Factor.ExecSQL(Str);
       if not InTrans then Factor.CommitTrans;
    except
       if not InTrans then Factor.RollbackTrans;
       Raise;
    end;
  finally
     Temp.Free;
  end;
end;

class function TSequence.GetSequence(AFactor: TdbFactory; SEQU_ID, COMP_ID,
  FLAG_TEXT: string; nLen: Integer): String;
  function GetFormat:string;
    var i:Integer;
    begin
      Result := '';
      for i:=1 to nLen do
        Result := Result +'0';
    end;
var Temp:TZQuery;
    Str,flag:string;
    n:integer;
begin
  Temp := TZQuery.Create(nil);
  try
     AFactor.BeginTrans(10);
     try
       case AFactor.iDbType of
       0: Temp.SQL.Text := 'select FLAG_TEXT,SEQU_NO from SYS_SEQUENCE with (UPDLOCK) where COMP_ID='''+COMP_ID+''' and SEQU_ID='''+SEQU_ID+''' ';
       1: Temp.SQL.Text := 'select FLAG_TEXT,SEQU_NO from SYS_SEQUENCE where COMP_ID='''+COMP_ID+''' and SEQU_ID='''+SEQU_ID+''' FOR UPDATE';
       3:begin
          AFactor.ExecSQL('update SYS_SEQUENCE set SEQU_NO=SEQU_NO+1 where COMP_ID='''+COMP_ID+''' and SEQU_ID='''+SEQU_ID+'''');
          Temp.SQL.Text := 'select FLAG_TEXT,SEQU_NO from SYS_SEQUENCE where COMP_ID='''+COMP_ID+''' and SEQU_ID='''+SEQU_ID+''' ';
         end;
       end;
       AFactor.Open(Temp);
       if Temp.IsEmpty then
          begin
            Result := FLAG_TEXT+FormatFloat(GetFormat,1);
            Str := 'insert into SYS_SEQUENCE(COMP_ID,SEQU_ID,FLAG_TEXT,SEQU_NO,COMM) values('''+COMP_ID+''','''+SEQU_ID+''','''+FLAG_TEXT+''',1,''00'')';
          end
       else
       if (Temp.FieldbyName('FLAG_TEXT').AsString<FLAG_TEXT) then
          begin
            Result := FLAG_TEXT+FormatFloat(GetFormat,1);
            Str := 'update SYS_SEQUENCE set FLAG_TEXT='''+FLAG_TEXT+''',SEQU_NO=1 where COMP_ID='''+COMP_ID+''' and SEQU_ID='''+SEQU_ID+'''';
          end
       else
          begin
            if Temp.FieldbyName('FLAG_TEXT').AsString=FLAG_TEXT then
               flag := FLAG_TEXT
            else
               flag := Temp.FieldbyName('FLAG_TEXT').AsString;
            n := 1;
            if AFactor.iDbType = 3 then
               begin
                 Result := flag+FormatFloat(GetFormat,Temp.FieldbyName('SEQU_NO').AsInteger);
                 n := 0;
               end
            else
               Result := flag+FormatFloat(GetFormat,Temp.FieldbyName('SEQU_NO').AsInteger+1);
            Str := 'update SYS_SEQUENCE set FLAG_TEXT='''+flag+''',SEQU_NO='+Inttostr(Temp.FieldbyName('SEQU_NO').AsInteger+n)+' where COMP_ID='''+COMP_ID+''' and SEQU_ID='''+SEQU_ID+'''';
          end;
       AFactor.ExecSQL(Str);
       AFactor.CommitTrans;
    except
       AFactor.RollbackTrans;
       Raise;
    end;
  finally
     Temp.Free;
  end;
end;

{$IFDEF LIBV4.0}
class function TSequence.GetMaxID(FlagText: String; Factor: TIdFactor;
  FieldName, TableName, nLen, CondiStr: String): String;
Var ss:String;
    TmpLen:Integer;
    DataSet:TZQuery;
Begin
  DataSet:=TZQuery.Create(nil);
  try
    With DataSet Do
     Begin
        TmpLen:=Length(FlagText)+Length(nLen);
        Close;
        SQL.Clear;

        case Factor.iDbType of
        0,3:SQL.Add('Select Max('+FieldName+') From '+TableName+' Where '+FieldName+' Like '''+FlagText+'%'' and Len('+FieldName+')='+Inttostr(TmpLen));
        1:SQL.Add('Select Max('+FieldName+') From '+TableName+' Where '+FieldName+' Like '''+FlagText+'%'' and Length('+FieldName+')='+Inttostr(TmpLen));
        end;

        if CondiStr<>'' then
           SQL.Text := SQL.Text +' and '+CondiStr;

        Factor.Open(DataSet);
        If Fields[0].asString='' Then
           Result:=FlagText+FormatFloat(nLen,1) Else
         Begin
           TmpLen:=Length(FlagText);
           ss:=Fields[0].asString;
           System.Delete(ss,1,TmpLen);
           Result:=FlagText+FnString.IncCode(ss,Length(nLen));
         end;
     end;
    finally
    DataSet.Free;
  end;
end;

class function TSequence.GetSequence(AFactor: TIdFactor; SEQU_ID, COMP_ID,
  FLAG_TEXT: string; nLen: Integer): String;
  function GetFormat:string;
    var i:Integer;
    begin
      Result := '';
      for i:=1 to nLen do
        Result := Result +'0';
    end;
var Temp:TZQuery;
    Str,flag:string;
    n:integer;
begin
  Temp := TZQuery.Create(nil);
  try
     AFactor.BeginTrans(10);
     try
       case AFactor.iDbType of
       0: Temp.SQL.Text := 'select FLAG_TEXT,SEQU_NO from SYS_SEQUENCE with (UPDLOCK) where COMP_ID='''+COMP_ID+''' and SEQU_ID='''+SEQU_ID+''' ';
       1: Temp.SQL.Text := 'select FLAG_TEXT,SEQU_NO from SYS_SEQUENCE where COMP_ID='''+COMP_ID+''' and SEQU_ID='''+SEQU_ID+''' FOR UPDATE';
       3:begin
          AFactor.ExecSQL('update SYS_SEQUENCE set SEQU_NO=SEQU_NO+1 where COMP_ID='''+COMP_ID+''' and SEQU_ID='''+SEQU_ID+'''');
          Temp.SQL.Text := 'select FLAG_TEXT,SEQU_NO from SYS_SEQUENCE where COMP_ID='''+COMP_ID+''' and SEQU_ID='''+SEQU_ID+''' ';
         end;
      end;
       AFactor.Open(Temp);
       if Temp.IsEmpty then
          begin
            Result := FLAG_TEXT+FormatFloat(GetFormat,1);
            Str := 'insert into SYS_SEQUENCE(COMP_ID,SEQU_ID,FLAG_TEXT,SEQU_NO,COMM) values('''+COMP_ID+''','''+SEQU_ID+''','''+FLAG_TEXT+''',1,''00'')';
          end
       else
       if (Temp.FieldbyName('FLAG_TEXT').AsString<FLAG_TEXT) then
          begin
            Result := FLAG_TEXT+FormatFloat(GetFormat,1);
            Str := 'update SYS_SEQUENCE set FLAG_TEXT='''+FLAG_TEXT+''',SEQU_NO=1 where COMP_ID='''+COMP_ID+''' and SEQU_ID='''+SEQU_ID+'''';
          end
       else
          begin
            if Temp.FieldbyName('FLAG_TEXT').AsString=FLAG_TEXT then
               flag := FLAG_TEXT
            else
               flag := Temp.FieldbyName('FLAG_TEXT').AsString;
            n := 1;
            if AFactor.iDbType = 3 then
               begin
                 Result := flag+FormatFloat(GetFormat,Temp.FieldbyName('SEQU_NO').AsInteger);
                 n := 0;
               end
            else
               Result := flag+FormatFloat(GetFormat,Temp.FieldbyName('SEQU_NO').AsInteger+1);
            Str := 'update SYS_SEQUENCE set FLAG_TEXT='''+flag+''',SEQU_NO='+Inttostr(Temp.FieldbyName('SEQU_NO').AsInteger+n)+' where COMP_ID='''+COMP_ID+''' and SEQU_ID='''+SEQU_ID+'''';
          end;
       AFactor.ExecSQL(Str);
       AFactor.CommitTrans;
    except
       AFactor.RollbackTrans;
       Raise;
    end;
  finally
     Temp.Free;
  end;
end;
{$ENDIF}

class function TSequence.NewId: string;
var
  g:TGuid;
begin
  if CreateGUID(g)=S_OK then
     result := GuidToString(g)
  else
     result := inttostr(Global.SHOP_ID)+formatDatetime('YYYYMMDDHHNNSS',now());
end;

end.
