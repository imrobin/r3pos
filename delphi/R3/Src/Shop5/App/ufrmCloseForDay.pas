{   13200001	 0	交班结账  1	查看  2	结账  3	撤消  4	打印    }

unit ufrmCloseForDay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmBasic, ActnList, Menus, cxControls, cxContainer, cxEdit, ZIntf,
  cxTextEdit, StdCtrls, ExtCtrls, RzPanel, RzButton, DB, ZBase, ObjCommon,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, cxRadioGroup;

type
  TfrmCloseForDay = class(TfrmBasic)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    RzPanel4: TRzPanel;
    Label5: TLabel;
    fndCLSE_DATE: TcxTextEdit;
    RzPanel3: TRzPanel;
    labPAY_A: TLabel;
    labPAY_B: TLabel;
    labPAY_C: TLabel;
    labPAY_D: TLabel;
    edtPAY_A: TcxTextEdit;
    edtPAY_B: TcxTextEdit;
    edtPAY_C: TcxTextEdit;
    edtPAY_D: TcxTextEdit;
    lblCASH: TLabel;
    labPAY_E: TLabel;
    labPAY_F: TLabel;
    labPAY_G: TLabel;
    labPAY_H: TLabel;
    edtPAY_E: TcxTextEdit;
    edtPAY_F: TcxTextEdit;
    edtPAY_G: TcxTextEdit;
    edtPAY_H: TcxTextEdit;
    labPAY_I: TLabel;
    labPAY_J: TLabel;
    edtPAY_I: TcxTextEdit;
    edtPAY_J: TcxTextEdit;
    Btn_Close: TRzBitBtn;
    Btn_Save: TRzBitBtn;
    Label12: TLabel;
    fndCREA_USER: TcxTextEdit;
    Bevel1: TBevel;
    edtRECV_MNY: TcxTextEdit;
    Label1: TLabel;
    labMNY: TLabel;
    Label3: TLabel;
    edtHIS_MNY: TcxTextEdit;
    cdsTable: TZQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Btn_SaveClick(Sender: TObject);
    procedure Btn_CloseClick(Sender: TObject);
  private
    FprintDate: TDate;
    procedure SetprintDate(const Value: TDate);
    { Private declarations }
  public
    { Public declarations }
    DateArr:array of Integer;
    printFlag:integer;
    Balance:Double;    
    LastTime:integer;
    Is_Print: Boolean;
    MainRecord: TRecord_;
    function reckDate:TDate;
    function CheckStatus:boolean;
    //检查是否有离线数据，必须上传后才能结账
    procedure CheckOffData;
    procedure GetEverydayAcc(var Acc_Data:TZQuery;ThatDay:Integer);
    procedure GetLastDate;
    function  GetBalance:Boolean;
    procedure Open;
    procedure Save;
    procedure InitForm;
    procedure ShowFee;
    class function ShowClDy(Owner:TForm):Integer;
    class function ShowPrint(Owner:TForm;myPrintDate:TDate):Integer;
    property printDate:TDate read FprintDate write SetprintDate;
  end;


implementation
uses uGlobal,uShopGlobal,uFnUtil,uDsUtil,Math,uDevFactory,ufrmTicketPrint,uSyncFactory;

{$R *.dfm}

{ TfrmCloseForDay }

procedure TfrmCloseForDay.Open;
var rs: TZQuery;
    Str:string;
begin
  rs := TZQuery.Create(nil);
  try
    //获得当天各种支付方式的汇总
//优化，由检测函数统一读取    
{    rs.Close;
    rs.SQL.Text :=
    'select TENANT_ID,SHOP_ID,CREA_USER,SALES_DATE as CREA_DATE,'+
    'sum(PAY_A) as PAY_A,'+
    'sum(PAY_B) as PAY_B,'+
    'sum(PAY_C) as PAY_C,'+
    'sum(PAY_D) as PAY_D,'+
    'sum(PAY_E) as PAY_E,'+
    'sum(PAY_F) as PAY_F,'+
    'sum(PAY_G) as PAY_G,'+
    'sum(PAY_H) as PAY_H,'+
    'sum(PAY_I) as PAY_I,'+
    'sum(PAY_J) as PAY_J '+
    ' from SAL_SALESORDER A'+
    ' where SALES_TYPE = 4 and TENANT_ID=:TENANT_ID and SHOP_ID=:SHOP_ID and CREA_USER=:CREA_USER and SALES_DATE=:SALES_DATE '+
    ' group by TENANT_ID,SHOP_ID,CREA_USER,SALES_DATE';
    rs.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
    rs.ParamByName('SHOP_ID').AsString := Global.SHOP_ID;
    rs.ParamByName('CREA_USER').AsString := Global.UserID;
    rs.ParamByName('SALES_DATE').AsInteger := StrtoInt(FormatDateTime('YYYYMMDD',reckDate));
    Factor.Open(rs);
}
    Is_Print := cdsTable.Locate('CLSE_DATE;CLSE_TYPE',VarArrayOf([StrtoInt(FormatDateTime('YYYYMMDD',reckDate)),'1']),[]);
    if Is_Print then
       MainRecord.ReadFromDataSet(cdsTable)
    else
       MainRecord.ReadField(cdsTable);

    //获得储值卡充值金额
//    rs.Close;
//    rs.SQL.Text := 'select sum(PAY_A) as PAY_A from SAL_IC_GLIDE A where IC_GLIDE_TYPE=''1'' and TENANT_ID='+IntToStr(Global.TENANT_ID)+
//    ' and SHOP_ID='+QuotedStr(Global.SHOP_ID)+' and CREA_USER='+QuotedStr(Global.UserID)+' and CREA_DATE='+FormatDateTime('YYYYMMDD',reckDate)+' ';
//    Factor.Open(rs);
//    if rs.Fields[0].AsString<>'' then
//      Is_Print := True;
//    edtPAY_MNY.Text := rs.Fields[0].AsString;
//    if cdsTable.Locate('CLSE_DATE;CLSE_TYPE',VarArrayOf([StrtoInt(FormatDateTime('YYYYMMDD',reckDate)),'2']),[]) then
//       begin
//         edtPAY_MNY.Text := formatfloat('#0.00',cdsTable.FieldbyName('PAY_A').asFloat);
//         Is_Print := true;
//       end
//    else
//       begin
//         edtPAY_MNY.Text := formatfloat('#0.00',0);
//       end;

    //获得批发金额
    rs.Close;
    rs.SQL.Text := 'select sum(RECV_MNY) as RECV_MNY from VIW_RECVDATA A where PAYM_ID=''A'' and RECV_FLAG=''0'' and TENANT_ID='+IntToStr(Global.TENANT_ID)+
    ' and SHOP_ID='+QuotedStr(Global.SHOP_ID)+' and RECV_DATE='+FormatDateTime('YYYYMMDD',reckDate)+' and RECV_USER='+QuotedStr(Global.UserID)+' ';
    Factor.Open(rs);
    if rs.Fields[0].AsString<>'' then
      Is_Print := True;
    edtRECV_MNY.Text := rs.Fields[0].AsString;

    ShowFee;

    rs.Close;
    Str :=
    ' select isnull(BALANCE,0) as BALANCE from ACC_ACCOUNT_INFO where TENANT_ID=:TENANT_ID and SHOP_ID=:SHOP_ID and PAYM_ID=''A'' ';
    rs.SQL.Text := ParseSQL(Factor.iDbType,Str);
    rs.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
    rs.ParamByName('SHOP_ID').AsString := Global.SHOP_ID;
    Factor.Open(rs);
    labMNY.Caption := '店内现金:'+formatFloat('#0.0#',Balance+rs.FieldbyName('BALANCE').AsFloat);
    lblCASH.Caption :='当日现金:'+formatFloat('#0.0#',StrToFloatDef(edtPAY_A.Text,0.00)+StrToFloatDef(edtRECV_MNY.Text,0.00));
  finally
    rs.Free;
  end;

end;

procedure TfrmCloseForDay.FormCreate(Sender: TObject);
begin
  inherited;
  MainRecord := TRecord_.Create;
  InitForm;
end;

procedure TfrmCloseForDay.FormDestroy(Sender: TObject);
begin
  inherited;
  MainRecord.Free;
end;

procedure TfrmCloseForDay.InitForm;
var Tmp:TZQuery;
begin
  Tmp := Global.GetZQueryFromName('PUB_PAYMENT');
  Tmp.First;
  while not Tmp.Eof do
    begin
      if Tmp.FieldByName('CODE_ID').AsString = 'A' then
        begin
          labPAY_A.Caption := Tmp.FieldByName('CODE_NAME').AsString;
          if Length(labPAY_A.Caption) <= 4 then labPAY_A.Caption := labPAY_A.Caption + '支付';
        end;
      if Tmp.FieldByName('CODE_ID').AsString = 'B' then
        begin
          labPAY_B.Caption := Tmp.FieldByName('CODE_NAME').AsString;
          if Length(labPAY_B.Caption) <= 4 then labPAY_B.Caption := labPAY_B.Caption + '支付';
        end;
      if Tmp.FieldByName('CODE_ID').AsString = 'C' then
        begin
          labPAY_C.Caption := Tmp.FieldByName('CODE_NAME').AsString;
          if Length(labPAY_C.Caption) <= 4 then labPAY_C.Caption := labPAY_C.Caption + '支付';
        end;
      if Tmp.FieldByName('CODE_ID').AsString = 'D' then
        begin
          labPAY_D.Caption := Tmp.FieldByName('CODE_NAME').AsString;
          if Length(labPAY_D.Caption) <= 4 then labPAY_D.Caption := labPAY_D.Caption + '支付';
        end;
      if Tmp.FieldByName('CODE_ID').AsString = 'E' then
        begin
          labPAY_E.Caption := Tmp.FieldByName('CODE_NAME').AsString;
          if Length(labPAY_E.Caption) <= 4 then labPAY_E.Caption := labPAY_E.Caption + '支付';
        end;
      if Tmp.FieldByName('CODE_ID').AsString = 'F' then
        begin
          labPAY_F.Caption := Tmp.FieldByName('CODE_NAME').AsString;
          if Length(labPAY_F.Caption) <= 4 then labPAY_F.Caption := labPAY_F.Caption + '支付';
        end;
      if Tmp.FieldByName('CODE_ID').AsString = 'G' then
        begin
          labPAY_G.Caption := Tmp.FieldByName('CODE_NAME').AsString;
          if Length(labPAY_G.Caption) <= 4 then labPAY_G.Caption := labPAY_G.Caption + '支付';
        end;
      if Tmp.FieldByName('CODE_ID').AsString = 'H' then
        begin
          labPAY_H.Caption := Tmp.FieldByName('CODE_NAME').AsString;
          if Length(labPAY_H.Caption) <= 4 then labPAY_H.Caption := labPAY_H.Caption + '支付';
        end;
      if Tmp.FieldByName('CODE_ID').AsString = 'I' then
        begin
          labPAY_I.Caption := Tmp.FieldByName('CODE_NAME').AsString;
          if Length(labPAY_I.Caption) <= 4 then labPAY_I.Caption := labPAY_I.Caption + '支付';
        end;
      if Tmp.FieldByName('CODE_ID').AsString = 'J' then
        begin
          labPAY_J.Caption := Tmp.FieldByName('CODE_NAME').AsString;
          if Length(labPAY_J.Caption) <= 4 then labPAY_J.Caption := labPAY_J.Caption + '支付';
        end;
      Tmp.Next;
    end;
end;

class function TfrmCloseForDay.ShowClDy(Owner: TForm): Integer;
begin
  with TfrmCloseForDay.Create(Owner) do
    begin
      try
        printFlag := 0;
        GetLastDate;
        GetBalance;
        if true then
          begin
            Open;
            if CheckStatus then  //打印当天已经结账汇总
            begin
              Btn_Save.Caption := '打印小票(&P)';
              Btn_Save.Tag := 1;
            end;
            case ShowModal of
              mrOk : Result := 1;
              mrIgnore : Result := 2;
            else
              Result := 0;
            end;
          end
        else
          Result := 2;

      finally
        Free;
      end;
    end;
end;

procedure TfrmCloseForDay.ShowFee;
 procedure ShowInfo(N:Integer;Money:Currency);
  begin
    case N of
      1:begin
          edtPAY_A.Text := FormatFloat('#0.0##',Money);
        end;
      2:begin
          edtPAY_B.Text := FormatFloat('#0.0##',Money);
        end;
      3:begin
          edtPAY_C.Text := FormatFloat('#0.0##',Money);
        end;
      4:begin
          edtPAY_D.Text := FormatFloat('#0.0##',Money);
        end;
      5:begin
          edtPAY_E.Text := FormatFloat('#0.0##',Money);
        end;
      6:begin
          edtPAY_F.Text := FormatFloat('#0.0##',Money);
        end;
      7:begin
          edtPAY_G.Text := FormatFloat('#0.0##',Money);
        end;
      8:begin
          edtPAY_H.Text := FormatFloat('#0.0##',Money);
        end;
      9:begin
          edtPAY_I.Text := FormatFloat('#0.0##',Money);
        end;
     10:begin
          edtPAY_J.Text := FormatFloat('#0.0##',Money);
        end;
    end;
  end;
var row: Integer;
begin
  row := -1;
  if MainRecord.FieldByName('PAY_A').AsFloat <> 0 then
    begin
      ShowInfo(1,MainRecord.FieldByName('PAY_A').AsFloat);
      Inc(row);
    end;
  if MainRecord.FieldByName('PAY_B').AsFloat <> 0 then
    begin
      ShowInfo(2,MainRecord.FieldByName('PAY_B').AsFloat);
      Inc(row);
    end;
  if MainRecord.FieldByName('PAY_C').AsFloat <> 0 then
    begin
      ShowInfo(3,MainRecord.FieldByName('PAY_C').AsFloat);
      Inc(row);
    end;
  if MainRecord.FieldByName('PAY_D').AsFloat <> 0 then
    begin
      ShowInfo(4,MainRecord.FieldByName('PAY_D').AsFloat);
      Inc(row);
    end;
  if MainRecord.FieldByName('PAY_E').AsFloat <> 0 then
    begin
      ShowInfo(5,MainRecord.FieldByName('PAY_E').AsFloat);
      Inc(row);
    end;
  if MainRecord.FieldByName('PAY_F').AsFloat <> 0 then
    begin
      ShowInfo(6,MainRecord.FieldByName('PAY_F').AsFloat);
      Inc(row);
    end;
  if MainRecord.FieldByName('PAY_G').AsFloat <> 0 then
    begin
      ShowInfo(7,MainRecord.FieldByName('PAY_G').AsFloat);
      Inc(row);
    end;
  if MainRecord.FieldByName('PAY_H').AsFloat <> 0 then
    begin
      ShowInfo(8,MainRecord.FieldByName('PAY_H').AsFloat);
      Inc(row);
    end;
  if MainRecord.FieldByName('PAY_I').AsFloat <> 0 then
    begin
      ShowInfo(9,MainRecord.FieldByName('PAY_I').AsFloat);
      Inc(row);
    end;
  if MainRecord.FieldByName('PAY_J').AsFloat <> 0 then
    begin
      ShowInfo(10,MainRecord.FieldByName('PAY_J').AsFloat);
      Inc(row);
    end;
  if row > 5 then
    begin
      Height := Height+(row-5)*25;
      Bevel1.Height := Bevel1.Height+(row-5)*25;
    end;
end;

procedure TfrmCloseForDay.FormShow(Sender: TObject);
begin
  inherited;
  fndCREA_USER.Text := Global.UserName;
  fndCLSE_DATE.Text := FormatDateTime('YYYY-MM-DD',reckDate());

end;

procedure TfrmCloseForDay.Save;
var i:Integer;
    rs,sv: TZQuery;
    AObj:TRecord_;
begin
    rs := cdsTable;
    sv := TZQuery.Create(nil);
    AObj := TRecord_.Create;
    try
//      GetEverydayAcc(rs,StrToInt(FormatDateTime('YYYYMMDD',reckDate)));
//      if not rs.IsEmpty then  //当天没数据可以补0了
        begin
          //把未结账日期值 赋给 动态数组
          SetLength(DateArr,rs.RecordCount+1);
          i:=0;
          sv.Delta := rs.Delta;
          rs.First;
          while not rs.Eof do
            begin
              sv.Append;
              AObj.ReadFromDataSet(rs);
              AObj.WriteToDataSet(sv,false);
              sv.Post;
              DateArr[i]:=rs.FieldbyName('CLSE_DATE').AsInteger;
              Inc(i);
              rs.Next;
            end;
          if not sv.Locate('CLSE_DATE',strtoint(formatDatetime('YYYYMMDD',reckDate)),[]) then //如果当前没有数据补结0记录
             begin
              DateArr[i]:=strtoint(formatDatetime('YYYYMMDD',reckDate));
              sv.Append;
              sv.FieldByName('TENANT_ID').AsInteger := Global.TENANT_ID;
              sv.FieldByName('CLSE_DATE').AsInteger := strtoint(formatDatetime('YYYYMMDD',reckDate));
              sv.FieldByName('SHOP_ID').AsString := Global.SHOP_ID;
              sv.FieldbyName('CREA_USER').AsString := Global.UserID; 
              sv.FieldbyName('CLSE_MNY').AsFloat := 0;
              sv.FieldbyName('CLSE_TYPE').AsString := '1'; 
              sv.FieldbyName('PAY_A').AsFloat := 0;
              sv.FieldbyName('PAY_B').AsFloat := 0;
              sv.FieldbyName('PAY_C').AsFloat := 0;
              sv.FieldbyName('PAY_D').AsFloat := 0;
              sv.FieldbyName('PAY_E').AsFloat := 0;
              sv.FieldbyName('PAY_F').AsFloat := 0;
              sv.FieldbyName('PAY_G').AsFloat := 0;
              sv.FieldbyName('PAY_H').AsFloat := 0;
              sv.FieldbyName('PAY_I').AsFloat := 0;
              sv.FieldbyName('PAY_J').AsFloat := 0;
              sv.Post;
             end;
          Factor.UpdateBatch(sv,'TCloseForDay');
        end;
    finally
      AObj.Free;
      sv.Free;
//      rs.Free;
    end;

end;

procedure TfrmCloseForDay.Btn_SaveClick(Sender: TObject);
function CheckUpdateStatus:boolean;
begin
  result := (Global.LocalFactory.ExecProc('TGetLastUpdateStatus')='1'); 
end;
var i:Integer;
begin
  inherited;
  if Btn_Save.Tag = 0 then
    begin
      if (ShopGlobal.NetVersion or ShopGlobal.ONLVersion) and (ShopGlobal.offline) then Raise Exception.Create('连锁版不允许离线结账!');
      if (ShopGlobal.NetVersion) then
         begin
           if not SyncFactory.CheckDBVersion then Raise Exception.Create('当前数据库版本跟服务器不一致，请先升级程序后再同步...');
           SyncFactory.SyncForDay;//改为只上报销售  SyncFactory.SyncAll; //连锁版结账前都必须同步脱机数据...
         end;
      CheckOffData;
      if not ShopGlobal.GetChkRight('13200001',2) then Raise Exception.Create('您没有结账权限,请联系管理员!');
      if not Is_Print and (MessageBox(Handle,'你今天没有营业数据是否继续结账？','友情提示...',MB_YESNO+MB_ICONQUESTION)<>6) then Exit;
      if MessageBox(Handle,pchar('结账后【'+fndCLSE_DATE.Text+'】你将不能进行销售开单了，是否确认继续结账？'),'友情提示...',MB_YESNO+MB_ICONQUESTION)<>6 then Exit;
      Save;
      Btn_Save.Caption := '打印小票(&P)';
      Btn_Save.Tag := 1;
      if Is_Print then
      begin
        if not ShopGlobal.GetChkRight('13200001',5) then  Raise Exception.Create('您没有打印权限,请联系管理员!');
        if DevFactory.CloseDayPrinted then
          begin
//            if MessageBox(Handle,Pchar('是否打印小票!'),Pchar(Caption),MB_YESNO+MB_ICONQUESTION)=6 then
//              begin
                for i:=low(DateArr) to High(DateArr) do
                   begin
                      if DateArr[i]>0 then
                      TfrmTicketPrint.ShowTicketPrint(Self,1,IntToStr(DateArr[i]));
                   end;
//              end;
          end;
      end;
      ModalResult := mrOk;
    end
  else if Btn_Save.Tag = 1 then
    begin
      if not ShopGlobal.GetChkRight('13200001',5) then  Raise Exception.Create('您没有打印权限,请联系管理员!');
      if MessageBox(Handle,Pchar('是否打印小票!'),Pchar(Caption),MB_YESNO+MB_ICONQUESTION)=6 then
         TfrmTicketPrint.ShowTicketPrint(Self,1,FormatDateTime('YYYYMMDD',reckDate));
      ModalResult := mrOk;
    end;

end;

procedure TfrmCloseForDay.Btn_CloseClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrIgnore;
end;

procedure TfrmCloseForDay.GetEverydayAcc(var Acc_Data: TZQuery;ThatDay:Integer);
var Str:String;
begin
  Str :=
  'select TENANT_ID,SHOP_ID,CREA_USER,SALES_DATE as CLSE_DATE,''1'' as CLSE_TYPE,'+
  'sum(PAY_A+PAY_B+PAY_C+PAY_E+PAY_F+PAY_G+PAY_H+PAY_I+PAY_J) as CLSE_MNY,'+
  'sum(PAY_A) as PAY_A,'+
  'sum(PAY_B) as PAY_B,'+
  'sum(PAY_C) as PAY_C,'+
  'sum(PAY_D) as PAY_D,'+
  'sum(PAY_E) as PAY_E,'+
  'sum(PAY_F) as PAY_F,'+
  'sum(PAY_G) as PAY_G,'+
  'sum(PAY_H) as PAY_H,'+
  'sum(PAY_I) as PAY_I,'+
  'sum(PAY_J) as PAY_J '+
  ' from SAL_SALESORDER A'+
  ' where SALES_TYPE = 4 and TENANT_ID=:TENANT_ID and SHOP_ID=:SHOP_ID and CREA_USER=:CREA_USER and SALES_DATE>:LAST_SALES_DATE and SALES_DATE<=:SALES_DATE group by TENANT_ID,SHOP_ID,CREA_USER,SALES_DATE';
  Str :=
  'select A.* from ('+Str+') A where CLSE_DATE=:SALES_DATE or not exists('+
  'select * from ACC_CLOSE_FORDAY where TENANT_ID=A.TENANT_ID and SHOP_ID=A.SHOP_ID and CREA_USER=A.CREA_USER and CLSE_DATE=A.CLSE_DATE'+
  ')';
  Acc_Data.Close;
  Acc_Data.SQL.Text := Str;
  Acc_Data.Params.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
  Acc_Data.Params.ParamByName('SHOP_ID').AsString := Global.SHOP_ID;
  Acc_Data.Params.ParamByName('CREA_USER').AsString := Global.UserID;
  Acc_Data.Params.ParamByName('SALES_DATE').AsInteger := ThatDay;
  if LastTime=ThatDay then
     Acc_Data.Params.ParamByName('LAST_SALES_DATE').AsInteger := LastTime-1
  else
     Acc_Data.Params.ParamByName('LAST_SALES_DATE').AsInteger := LastTime;
  Factor.Open(Acc_Data);
end;

procedure TfrmCloseForDay.GetLastDate;
var rs:TZQuery;
begin
  try
    rs := TZQuery.Create(nil);
    rs.Close;
    rs.SQL.Text := 'select Max(END_DATE) from RCK_MONTH_CLOSE where TENANT_ID=:TENANT_ID';
    rs.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
    Factor.Open(rs);
    if rs.Fields[0].AsString='' then       //获得当前收银员最近的结账日期
    LastTime := 0 else
    LastTime := strtoint(formatDatetime('YYYYMMDD',fnTime.fnStrtoDate(rs.Fields[0].asString)));
  finally
    rs.Free;
  end;
end;

function TfrmCloseForDay.GetBalance: Boolean;
var toDay:integer;
begin
  toDay := StrToInt(FormatDateTime('YYYYMMDD',reckDate));
  GetEverydayAcc(cdsTable,toDay); //合并操作，当它只是打开一次即可
  result := cdsTable.IsEmpty;
  Balance := 0;
  cdsTable.First;
  while not cdsTable.Eof do
    begin
      if cdsTable.FieldByName('CLSE_DATE').AsInteger < toDay then
         Balance := Balance + cdsTable.FieldByName('PAY_A').AsFloat;
      cdsTable.Next;
    end;
  edtHIS_MNY.Text := formatfloat('#0.00',Balance);
  result := true;
end;

procedure TfrmCloseForDay.CheckOffData;
begin

end;

function TfrmCloseForDay.CheckStatus: boolean;
var
  rs:TZQuery;
begin
  rs := TZQuery.Create(nil);
  try
    rs.SQL.Text := 'select CLSE_DATE from ACC_CLOSE_FORDAY where TENANT_ID=:TENANT_ID and SHOP_ID=:SHOP_ID and CLSE_DATE=:CLSE_DATE and CREA_USER=:CREA_USER';
    rs.Params.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
    rs.Params.ParamByName('SHOP_ID').asString := Global.SHOP_ID;
    rs.Params.ParamByName('CLSE_DATE').AsInteger := StrtoInt(formatDatetime('YYYYMMDD',reckDate));
    rs.Params.ParamByName('CREA_USER').asString := Global.UserId;
    Factor.Open(rs);
    result := not rs.IsEmpty;
  finally
    rs.free;
  end;
end;

function TfrmCloseForDay.reckDate: TDate;
begin
  if printFlag=0 then
     begin
      if Global.SysDate = (date()-1) then
         result := Global.SysDate
      else
         result := Date();
     end
  else
     result := printDate;
end;

procedure TfrmCloseForDay.SetprintDate(const Value: TDate);
begin
  FprintDate := Value;
end;

class function TfrmCloseForDay.ShowPrint(Owner: TForm;myPrintDate:TDate): Integer;
begin
  with TfrmCloseForDay.Create(Owner) do
    begin
      try
        printFlag := 1;
        printDate := myPrintDate;
        GetLastDate;
        GetBalance;
        if true then
          begin
            Open;
            if CheckStatus then  //打印当天已经结账汇总
            begin
              Btn_Save.Caption := '打印小票(&P)';
              Btn_Save.Tag := 1;
            end;
            case ShowModal of
              mrOk : Result := 1;
              mrIgnore : Result := 2;
            else
              Result := 0;
            end;
          end
        else
          Result := 2;

      finally
        Free;
      end;
    end;
end;

end.
