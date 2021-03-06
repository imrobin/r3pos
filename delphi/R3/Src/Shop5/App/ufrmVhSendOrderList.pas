unit ufrmVhSendOrderList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uframeContractToolForm, DB, ZAbstractRODataset, ZBase,
  ZAbstractDataset, ZDataset, Menus, ActnList, ComCtrls, ToolWin, StdCtrls,
  RzLabel, jpeg, ExtCtrls, Grids, DBGridEh, RzTabs, RzPanel, RzButton,
  cxButtonEdit, zrComboBoxList, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, FR_Class;

type
  TfrmVhSendOrderList = class(TframeContractToolForm)
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    Label40: TLabel;
    Label3: TLabel;
    D1: TcxDateEdit;
    D2: TcxDateEdit;
    fndCLIENT_ID: TzrComboBoxList;
    fndSHOP_ID: TzrComboBoxList;
    fndDEPT_ID: TzrComboBoxList;
    Label9: TLabel;
    btnOk: TRzBitBtn;
    fndSEND_USER: TzrComboBoxList;
    frfVhSendOrder: TfrReport;
    ToolButton15: TToolButton;
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure cdsListAfterScroll(DataSet: TDataSet);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actPreviewExecute(Sender: TObject);
    procedure actFindExecute(Sender: TObject);
    procedure actInfoExecute(Sender: TObject);
    procedure actPriorExecute(Sender: TObject);
    procedure actNextExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function CheckCanExport: boolean; override;
  public
    { Public declarations }
    IsEnd: boolean;
    MaxId:string;
    function PrintSQL(tenantid,id:string):string;
    function GetFormClass:TFormClass;override;
    function EncodeSQL(id:string):string;
    procedure Open(Id:string);
  end;

implementation
uses uDsUtil, uFnUtil,uGlobal,uShopUtil,uXDictFactory,ufrmFastReport, uShopGlobal,
   uMsgBox,ufrmVhSendOrder, uframeMDForm, uframeContractForm;
{$R *.dfm}

procedure TfrmVhSendOrderList.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var ARect:TRect;
begin
  inherited;
  if Column.FieldName = 'SEQNO' then
    begin
      ARect := Rect;
      DBGridEh1.canvas.Brush.Color := $0000F2F2;
      DBGridEh1.canvas.FillRect(ARect);
      DrawText(DBGridEh1.Canvas.Handle,pchar(Inttostr(cdsList.RecNo)),length(Inttostr(cdsList.RecNo)),ARect,DT_NOCLIP or DT_SINGLELINE or DT_CENTER or DT_VCENTER);
    end;
end;

procedure TfrmVhSendOrderList.cdsListAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if IsEnd or not cdsList.Eof then Exit;
  if cdsList.ControlsDisabled then Exit;
  Open(MaxId);
end;

procedure TfrmVhSendOrderList.DBGridEh1DblClick(Sender: TObject);
begin
  inherited;
  actInfo.OnExecute(nil);
end;

function TfrmVhSendOrderList.CheckCanExport: boolean;
begin
  //result:=ShopGlobal.GetChkRight('100002297',7);
end;

function TfrmVhSendOrderList.EncodeSQL(id: string): string;
var w:string;
begin
  w := ' where A.TENANT_ID=:TENANT_ID and A.SEND_DATE>=:D1 and A.SEND_DATE<=:D2 ';

  if fndDEPT_ID.AsString <> '' then
     w := w +' and A.DEPT_ID=:DEPT_ID ';
  if fndSHOP_ID.AsString <> '' then
     w := w +' and A.SHOP_ID=:SHOP_ID ';
  if fndSEND_USER.AsString <> '' then
     w := w + ' and A.SEND_USER=:SEND_USER ';
  if fndCLIENT_ID.AsString <> '' then
     w := w + ' and A.CLIENT_ID=:CLIENT_ID ';

  if id<>'' then
     w := w +' and A.VHSEND_ID>'''+id+'''';
  result :=
     'select A.TENANT_ID,A.VHSEND_ID,A.SEND_DATE,A.SHOP_ID,C.SHOP_NAME as SHOP_ID_TEXT,E.USER_NAME as SEND_USER_TEXT,A.VOUCHER_MNY,'+
     'B.DEPT_NAME as DEPT_ID_TEXT,D.USER_NAME as CREA_USER_TEXT,F.CLIENT_NAME as CLIENT_ID_TEXT,A.CREA_DATE,A.REMARK '+
     ' from SAL_VHSENDORDER A left join CA_DEPT_INFO B on A.TENANT_ID=B.TENANT_ID and A.DEPT_ID=B.DEPT_ID '+
     ' left join CA_SHOP_INFO C on A.TENANT_ID=C.TENANT_ID and A.SHOP_ID=C.SHOP_ID '+
     ' left join VIW_USERS D on A.TENANT_ID=D.TENANT_ID and A.CREA_USER=D.USER_ID '+
     ' left join VIW_USERS E on A.TENANT_ID=E.TENANT_ID and A.SEND_USER=E.USER_ID '+
     ' left join VIW_CUSTOMER F on A.TENANT_ID=F.TENANT_ID and A.CLIENT_ID=F.CLIENT_ID '+w+ShopGlobal.GetDataRight('A.SHOP_ID',1)+ShopGlobal.GetDataRight('A.DEPT_ID',2)+' ';
  case Factor.iDbType of
  0:result := 'select top 600 * from ('+result+') jp order by VHSEND_ID';
  1:result :=
       'select * from ('+
       'select * from ('+result+') j order by VHSEND_ID) where ROWNUM<=600';
  4:result :=
       'select * from ('+
       'select * from ('+result+') j order by VHSEND_ID) tp fetch first 600 rows only';
  5:result := 'select * from ('+result+') j order by VHSEND_ID limit 600';
  else
    result := 'select * from ('+result+') j order by VHSEND_ID';
  end;
end;

function TfrmVhSendOrderList.GetFormClass: TFormClass;
begin
  Result := TfrmVhSendOrder;
end;

procedure TfrmVhSendOrderList.Open(Id: string);
var
  rs:TZQuery;
  sm:TMemoryStream;
begin
  if not Visible then Exit;
  if Id='' then cdsList.close;
  rs := TZQuery.Create(nil);
  sm := TMemoryStream.Create;
  cdsList.DisableControls;
  try
    rs.SQL.Text := EncodeSQL(Id);
    rs.Params.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
    rs.Params.ParamByName('D1').AsInteger := strtoint(formatdatetime('YYYYMMDD',D1.Date));
    rs.Params.ParamByName('D2').AsInteger := strtoint(formatdatetime('YYYYMMDD',D2.Date));;
    if rs.Params.FindParam('SEND_USER')<>nil then rs.Params.FindParam('SEND_USER').AsString := fndSEND_USER.AsString;
    if rs.Params.FindParam('DEPT_ID')<>nil then rs.Params.FindParam('DEPT_ID').AsString := fndDEPT_ID.AsString;
    if rs.Params.FindParam('SHOP_ID')<>nil then rs.Params.FindParam('SHOP_ID').AsString := fndSHOP_ID.AsString;
    if rs.Params.FindParam('CLIENT_ID')<>nil then rs.Params.FindParam('CLIENT_ID').AsString := fndCLIENT_ID.AsString;
    Factor.Open(rs);
    rs.Last;
    MaxId := rs.FieldbyName('VHSEND_ID').AsString;
    if Id='' then
    begin
       rs.SaveToStream(sm);
       cdsList.LoadFromStream(sm);  
       cdsList.IndexFieldNames := 'VHSEND_ID';
    end
    else
    begin
       rs.SaveToStream(sm);
       cdsList.AddFromStream(sm);
    end;
    if rs.RecordCount <600 then IsEnd := True else IsEnd := false;
  finally
    cdsList.EnableControls;
    sm.Free;
    rs.Free;
  end;
end;

function TfrmVhSendOrderList.PrintSQL(tenantid, id: string): string;
begin

end;

procedure TfrmVhSendOrderList.actNewExecute(Sender: TObject);
begin
  if not ShopGlobal.GetChkRight('100002446',2) then Raise Exception.Create('你没有发放礼券的权限,请和管理员联系.');
  inherited;
end;

procedure TfrmVhSendOrderList.actDeleteExecute(Sender: TObject);
begin
  if not ShopGlobal.GetChkRight('100002446',4) then Raise Exception.Create('你没有删除发放礼券单的权限,请和管理员联系.');
  if (CurContract=nil) then
     begin
       if cdsList.IsEmpty then Exit;
       OpenForm(cdsList.FieldbyName('VHSEND_ID').AsString,cdsList.FieldbyName('SHOP_ID').AsString);
     end;
  if CurContract=nil then Raise Exception.Create('"发放礼券单档案"打开异常!');

  if (TfrmVhSendOrder(CurContract).cdsHeader.FieldByName('CREA_USER').AsString<>'')
  and (TfrmVhSendOrder(CurContract).cdsHeader.FieldByName('CREA_USER').AsString <> Global.UserID) then
    begin
      if not ShopGlobal.GetChkRight('100002446',5) then
        Raise Exception.Create('你没有删除"'+TdsFind.GetNameByID(Global.GetZQueryFromName('CA_USERS'),'USER_ID','USER_NAME',TfrmVhSendOrder(CurContract).cdsHeader.FieldByName('CREA_USER').AsString)+'"录入领用礼券单的权限!');
    end;
  inherited;
  if (CurContract<>nil) then
     begin
       if not CurContract.saved then Exit;
       if ShopGlobal.GetChkRight('100002446',2) and (MessageBox(Handle,'删除当前发放礼券单成功,是否继续新增发放礼券单？',pchar(Application.Title),MB_YESNO+MB_ICONINFORMATION)=6) then
          CurContract.NewOrder
       else
          if rzPage.PageCount>2 then CurContract.Close;
     end;
end;

procedure TfrmVhSendOrderList.actEditExecute(Sender: TObject);
begin
  if not ShopGlobal.GetChkRight('100002446',3) then Raise Exception.Create('你没有修改发放礼券单的权限,请和管理员联系.');
  if (CurContract=nil) then
     begin
       if cdsList.IsEmpty then Exit;
       OpenForm(cdsList.FieldbyName('VHSEND_ID').AsString,cdsList.FieldbyName('SHOP_ID').AsString);
     end;
  if CurContract=nil then Raise Exception.Create('"发放礼券单"打开异常!');

  if (TfrmVhSendOrder(CurContract).cdsHeader.FieldByName('CREA_USER').AsString<>'')
  and (TfrmVhSendOrder(CurContract).cdsHeader.FieldByName('CREA_USER').AsString <> Global.UserID) then
    begin
      if not ShopGlobal.GetChkRight('100002446',5) then
        Raise Exception.Create('你没有修改"'+TdsFind.GetNameByID(Global.GetZQueryFromName('CA_USERS'),'USER_ID','USER_NAME',TfrmVhSendOrder(CurContract).cdsHeader.FieldByName('CREA_USER').AsString)+'"录入发放礼券单的权限!');
    end;
  inherited;
end;

procedure TfrmVhSendOrderList.actSaveExecute(Sender: TObject);
begin
  inherited;
  if (CurContract<>nil) then
     begin
       if not CurContract.saved then Exit;
       {if ShopGlobal.GetChkRight('100002446',6) then
          begin       ShopGlobal.GetChkRight('100002446',2) and
            actPrint.OnExecute(nil);
          end;}
       if  (MessageBox(Handle,'是否继续新增发放礼券单？',pchar(Application.Title),MB_YESNO+MB_ICONINFORMATION)=6) then
          CurContract.NewOrder
       else
          if rzPage.PageCount>2 then CurContract.Close;
     end;
end;

procedure TfrmVhSendOrderList.actPrintExecute(Sender: TObject);
begin
  inherited;
  Exit;
  if not ShopGlobal.GetChkRight('100002446',6) then Raise Exception.Create('你没有打印发放礼券单的权限,请和管理员联系.');
  with TfrmFastReport.Create(Self) do
    begin
      try
        if CurContract<>nil then
           begin
             if CurContract.oid = '' then Exit;
             if CurContract.dbState <> dsBrowse then Raise Exception.Create('请保存后再打印...');
             //BeforePrint := PrintBefore;
             //AfterPrint := PrintAfter;
             PrintReport(PrintSQL(inttostr(Global.TENANT_ID),CurContract.oid),frfVhSendOrder);
           end
        else
           begin
             if cdsList.IsEmpty then Exit;
             //BeforePrint := PrintBefore;
             //AfterPrint := PrintAfter;
             PrintReport(PrintSQL(cdsList.FieldbyName('TENANT_ID').AsString,cdsList.FieldbyName('VHSEND_ID').AsString),frfVhSendOrder);
           end;
      finally
         free;
      end;
    end;
end;

procedure TfrmVhSendOrderList.actPreviewExecute(Sender: TObject);
begin
  inherited;
  Exit;
  if not ShopGlobal.GetChkRight('100002446',6) then Raise Exception.Create('你没有打印领用礼券单的权限,请和管理员联系.');
  with TfrmFastReport.Create(Self) do
    begin
      try
        if CurContract<>nil then
           begin
             if CurContract.oid = '' then Exit;
             if CurContract.dbState <> dsBrowse then Raise Exception.Create('请保存后再打印...');
             //BeforePrint := PrintBefore;
             //AfterPrint := PrintAfter;
             ShowReport(PrintSQL(inttostr(Global.TENANT_ID),CurContract.oid),frfVhSendOrder,nil,true);
           end
        else
           begin
             if cdsList.IsEmpty then Exit;
             //BeforePrint := PrintBefore;
             //AfterPrint := PrintAfter;
             ShowReport(PrintSQL(cdsList.FieldbyName('TENANT_ID').AsString,cdsList.FieldbyName('VHSEND_ID').AsString),frfVhSendOrder,nil,true);
           end;
      finally
         free;
      end;
    end;
end;

procedure TfrmVhSendOrderList.actFindExecute(Sender: TObject);
begin
  inherited;
  Open('');
end;

procedure TfrmVhSendOrderList.actInfoExecute(Sender: TObject);
begin
  inherited;
    if (CurContract=nil) then
     begin
       if cdsList.IsEmpty then Exit;
       OpenForm(cdsList.FieldbyName('VHSEND_ID').AsString,cdsList.FieldbyName('SHOP_ID').AsString);
     end;
end;

procedure TfrmVhSendOrderList.actPriorExecute(Sender: TObject);
var
  Temp:TZQuery;
  Params:TftParamList;
begin
  inherited;
  if CurContract <> nil then
     begin
        Params := TftParamList.Create(nil);
        try
          Params.ParamByName('TENANT_ID').asInteger := Global.TENANT_ID;
          Params.ParamByName('SHOP_ID').asString := CurContract.cid;
          Params.ParamByName('CREA_USER').asString := Global.UserID;
          if (CurContract.oid = '') or (CurContract.gid='..新增..') then
             Params.ParamByName('VHSEND_ID').asString := '9999999999999999'
          else
             Params.ParamByName('VHSEND_ID').asString := CurContract.oid;
          Temp := TZQuery.Create(nil);
          try
             Factor.Open(Temp,'TVhSendOrderGetPrior',Params);
             if Temp.Fields[0].asString<>'' then
                CurContract.Open(Temp.Fields[0].asString);
          finally
             Temp.Free;
          end;
        finally
          Params.Free;
        end;
     end
  else
     begin
        cdsList.Prior;
     end;
end;

procedure TfrmVhSendOrderList.actNextExecute(Sender: TObject);
var
  Temp:TZQuery;
  Params:TftParamList;
begin
  inherited;
  if CurContract <> nil then
     begin
        Params := TftParamList.Create(nil);
        try
          Params.ParamByName('TENANT_ID').asInteger := Global.TENANT_ID;
          Params.ParamByName('SHOP_ID').asString := CurContract.cid;
          Params.ParamByName('CREA_USER').asString := Global.UserID;
          if CurContract.oid = '' then
             Params.ParamByName('VHSEND_ID').asString := '00000000000000'
          else
             Params.ParamByName('VHSEND_ID').asString := CurContract.oid;
          Temp := TZQuery.Create(nil);
          try
             Factor.Open(Temp,'TVhSendOrderGetNext',Params);
             if Temp.Fields[0].asString<>'' then
                CurContract.Open(Temp.Fields[0].asString);
          finally
             Temp.Free;
          end;
        finally
          Params.Free;
        end;
     end
  else
     begin
        cdsList.Next;
     end;
end;

procedure TfrmVhSendOrderList.FormCreate(Sender: TObject);
begin
  inherited;
  fndDEPT_ID.DataSet := Global.GetZQueryFromName('CA_DEPT_INFO');
  //fndDEPT_ID.RangeField := 'DEPT_TYPE';
  //fndDEPT_ID.RangeValue := '1';
  fndSHOP_ID.DataSet := Global.GetZQueryFromName('CA_SHOP_INFO');
  fndSEND_USER.DataSet := Global.GetZQueryFromName('CA_USERS');
  fndCLIENT_ID.DataSet := Global.GetZQueryFromName('PUB_CUSTOMER');
  D1.Date := date();
  D2.Date := date();
  if ShopGlobal.GetProdFlag = 'E' then
    begin
      Label40.Caption := '领用仓库';
    end;
end;

procedure TfrmVhSendOrderList.FormShow(Sender: TObject);
begin
  inherited;
  Open('');
  //进入窗体默认新增加判断是否新增权限:
  if (ShopGlobal.GetChkRight('100002446',2)) and (rzPage.ActivePageIndex = 0) and (rzPage.PageCount=1) then
  actNew.OnExecute(nil); 
end;

end.
