unit ufrmSalInvoiceList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uframeToolForm, ActnList, Menus, ComCtrls, ToolWin, StdCtrls,
  RzLabel, jpeg, ExtCtrls, RzTabs, RzPanel, cxTextEdit, Grids, DBGridEh,
  cxRadioGroup, cxButtonEdit, zrComboBoxList, RzButton, cxControls,
  cxContainer, cxEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, DB, ZBase,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, FR_Class;

type
  TfrmSalInvoiceList = class(TframeToolForm)
    RzPanel1: TRzPanel;
    RzPanel6: TRzPanel;
    Label3: TLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    Label2: TLabel;
    Label8: TLabel;
    P1_D1: TcxDateEdit;
    P1_D2: TcxDateEdit;
    btnOk: TRzBitBtn;
    fndP1_SHOP_ID: TzrComboBoxList;
    fndSTATUS: TcxRadioGroup;
    fndP1_CUST_ID: TzrComboBoxList;
    fndP1_DEPT_ID: TzrComboBoxList;
    Panel1: TPanel;
    RzLabel5: TRzLabel;
    Label1: TLabel;
    fndSALES_ID: TcxTextEdit;
    DBGridEh1: TDBGridEh;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    DsSalesList: TDataSource;
    CdsSalesList: TZQuery;
    TabSheet2: TRzTabSheet;
    RzPanel7: TRzPanel;
    RzPanel8: TRzPanel;
    RzLabel4: TRzLabel;
    RzLabel1: TRzLabel;
    Label4: TLabel;
    Label17: TLabel;
    Label7: TLabel;
    Label40: TLabel;
    Label9: TLabel;
    D1: TcxDateEdit;
    D2: TcxDateEdit;
    RzBitBtn1: TRzBitBtn;
    fndINVOICE_STATUS: TcxRadioGroup;
    fndCREA_USER: TzrComboBoxList;
    fndCLIENT_ID: TzrComboBoxList;
    fndINVOICE_FLAG: TcxComboBox;
    fndSHOP_ID: TzrComboBoxList;
    fndDEPT_ID: TzrComboBoxList;
    Panel2: TPanel;
    DBGridEh2: TDBGridEh;
    RzLabel6: TRzLabel;
    fndINVOICE_NO: TcxTextEdit;
    DataSource2: TDataSource;
    cdsList: TZQuery;
    Label6: TLabel;
    fndSALES_STYLE: TzrComboBoxList;
    fndOrderType: TcxRadioGroup;
    Label10: TLabel;
    frfSalinvoice: TfrReport;
    procedure actNewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actPreviewExecute(Sender: TObject);
    procedure actFindExecute(Sender: TObject);
    procedure actInfoExecute(Sender: TObject);
    procedure actAuditExecute(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure cdsListAfterScroll(DataSet: TDataSet);
    procedure CdsSalesListAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RzPageChange(Sender: TObject);
    procedure frfSalinvoiceGetValue(const ParName: String;
      var ParValue: Variant);
    procedure frfSalinvoiceUserFunction(const Name: String; p1, p2,
      p3: Variant; var Val: Variant);
  private
    { Private declarations }
    procedure ChangeButton;
    function  CheckCanExport: boolean; override;
    procedure SavePrint(id:string);
  public
    { Public declarations }
    IsEnd1,IsEnd2: boolean;
    MaxId1,MaxId2:string;
    procedure InitGrid;
    procedure AddRecord(AObj:TRecord_);
    function FindColumn(FieldName:string):TColumnEh;
    function EncodeSQL1(id:string):string;
    function EncodeSQL2(id:string):string;
    procedure Open1(Id:string);
    procedure Open2(Id:string);
    function PrintSQL2(tenantid,id:string):string;
  end;

implementation
uses uGlobal,uShopUtil,uFnUtil,uDsUtil,uCtrlUtil,uShopGlobal,ufrmSalInvoice,ufrmFastReport,
  uframeMDForm, uframeDialogForm, ufrmBasic;
{$R *.dfm}

procedure TfrmSalInvoiceList.actNewExecute(Sender: TObject);
var Client_Id,InvoiceFlag:String;
    IsExist:Boolean;
    SumMny:Real;
    R:Integer;
begin
  inherited;
  case RzPage.ActivePageIndex of
  0: begin
    if not ShopGlobal.GetChkRight('100002314',2) then Raise Exception.Create('你没有开票的权限,请和管理员联系.');
    if CdsSalesList.State in [dsInsert,dsEdit] then CdsSalesList.Post;
    CdsSalesList.DisableControls;
    try
      CdsSalesList.Filtered := False;
      CdsSalesList.Filter := ' SetFlag=''1'' ';
      CdsSalesList.Filtered := True;
      IsExist := False;
      SumMny := 0;
      if (RzPage.ActivePage=TabSheet1) and (CdsSalesList.Active) and (CdsSalesList.RecordCount>0) then
      begin
         IsExist := True;
         CdsSalesList.First;

         while not CdsSalesList.Eof do
         begin
           if Client_Id = '' then Client_Id := CdsSalesList.FieldByName('CLIENT_ID').AsString;
           if (Client_Id<>'') and (Client_Id<>CdsSalesList.FieldByName('CLIENT_ID').AsString) then
              Raise Exception.Create('请选择相同客户的销售单进行开票...');

           if InvoiceFlag = '' then InvoiceFlag := CdsSalesList.FieldByName('INVOICE_FLAG').AsString;
           if (InvoiceFlag<>'') and (InvoiceFlag<>CdsSalesList.FieldByName('INVOICE_FLAG').AsString) then
              Raise Exception.Create('请选择相同发票类型的销售单进行开票...');

           if CdsSalesList.FieldByName('INVOICE_NO').AsString <> '' then
              Raise Exception.Create('销售单号"'+CdsSalesList.FieldByName('GLIDE_NO').AsString+'"已经开票...');
           SumMny := SumMny + CdsSalesList.FieldByName('AMONEY').AsFloat;
           CdsSalesList.Next;
         end;
      end;
      if not IsExist then Raise Exception.Create('请选择要开票的销售单...');
      if SumMny = 0 then Raise Exception.Create('所选择的销售单的金额为0');

      with TfrmSalInvoice.Create(self) do
        begin
          try
            ClientId := Client_Id;
            InvoiceId := InvoiceFlag;
            InvoiceMny := SumMny;
            IvioType := '1';
            Append;
            OnSave := AddRecord;
            //开票选择第一分页 [开票查询] 时执行
            R := 0;
            CdsSalesList.First;
            while not CdsSalesList.Eof do
            begin
              inc(R);
              cdsDetail.Append;
              cdsDetail.FieldByName('SEQNO').AsInteger := R;
              cdsDetail.FieldByName('FROM_ID').AsString := CdsSalesList.FieldByName('SALES_ID').AsString;
              cdsDetail.FieldByName('GODS_ID').AsString := CdsSalesList.FieldByName('GODS_ID').AsString;
              cdsDetail.FieldByName('GODS_NAME').AsString := CdsSalesList.FieldByName('GODS_NAME').AsString;
              cdsDetail.FieldByName('UNIT_NAME').AsString := CdsSalesList.FieldByName('UNIT_NAME').AsString;
              cdsDetail.FieldByName('AMOUNT').AsFloat := CdsSalesList.FieldByName('AMOUNT').AsFloat;
              cdsDetail.FieldByName('APRICE').AsFloat := CdsSalesList.FieldByName('APRICE').AsFloat;
              cdsDetail.FieldByName('FROM_TYPE').AsString := CdsSalesList.FieldByName('ORDERTYPE').AsString;
              cdsDetail.Post;
              CdsSalesList.Next;
            end;
            RowID := R;
            //开票选择第一分页 [开票查询] 时执行
            CdsSalesList.Filtered := False;
            CdsSalesList.EnableControls;
            if ShowModal=mrOk then
            begin
              //对勾选列表清除
              CdsSalesList.Filtered := False;
              CdsSalesList.Filter := ' SetFlag=''1'' ';
              CdsSalesList.Filtered := True;
              CdsSalesList.First;
              while not CdsSalesList.Eof do CdsSalesList.Delete;
              CdsSalesList.Filtered := False;
            end;
          finally
            free;
          end;
          //actPrintExecute(Sender);
        end;
    finally
      CdsSalesList.Filtered := False;
      CdsSalesList.EnableControls;
    end;
  end;
  1: begin
      InvoiceFlag := ShopGlobal.GetParameter('RTL_INV_FLAG');
      with TfrmSalInvoice.Create(self) do
      begin
        try
          ClientId := '';
          if InvoiceFlag <> '' then
             InvoiceId := InvoiceFlag
          else
             InvoiceId := '1';
          InvoiceMny := 0;
          IvioType := '1';
          Append;
          OnSave := AddRecord;
          cdsDetail.Append;
          cdsDetail.FieldByName('SEQNO').AsInteger := 1;
          cdsDetail.FieldByName('FROM_ID').AsString := '#';
          cdsDetail.FieldByName('GODS_ID').AsString := '#';
          cdsDetail.FieldByName('GODS_NAME').AsString := '#';
          cdsDetail.FieldByName('UNIT_NAME').AsString := '#';
          cdsDetail.FieldByName('AMOUNT').AsFloat := 0;
          cdsDetail.FieldByName('APRICE').AsFloat := 0;
          cdsDetail.FieldByName('FROM_TYPE').AsString := '0';
          cdsDetail.Post;
          RowID := 1;
          if ShowModal=mrok then
             begin
             end;
        finally
          free;
        end;
      end;
  end;
  end;
end;

procedure TfrmSalInvoiceList.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if cdsList.IsEmpty then Exit;
  if not ShopGlobal.GetChkRight('100002314',4) then Raise Exception.Create('你没有删除发票的权限,请和管理员联系.');
  if cdsList.FieldByName('CREA_USER').AsString <> Global.UserID then
  begin
    if not ShopGlobal.GetChkRight('100002314',4) then
      Raise Exception.Create('你没有删除"'+cdsList.FieldByName('CREA_USER_TEXT').AsString+'"发票的权限!');
  end;

  if MessageBox(Handle,'确认删除当前选中的发票吗？','友情提示',MB_YESNO+MB_ICONQUESTION)<>6 then Exit;
  with TfrmSalInvoice.Create(self) do
    begin
      try
        Open(cdsList.FieldByName('INVD_ID').AsString);
        DeleteOrder;
        cdsList.Delete;
        if cdsList.IsEmpty then cdsDetail.Close;
        MessageBox(Handle,'删除发票成功...','友情提示...',MB_OK+MB_ICONINFORMATION);
      finally
        free;
      end;
    end;
end;

procedure TfrmSalInvoiceList.actEditExecute(Sender: TObject);
begin
  inherited;
  if cdsList.IsEmpty then Exit;
  if not ShopGlobal.GetChkRight('100002314',3) then Raise Exception.Create('你没有修改发票的权限,请和管理员联系.');
  if cdsList.FieldByName('CREA_USER').AsString <> Global.UserID then
    begin
      if not ShopGlobal.GetChkRight('100002314',3) then
        Raise Exception.Create('你没有修改"'+cdsList.FieldByName('CREA_USER_TEXT').AsString+'"发票的权限!');
    end;

  if cdsList.FieldByName('INVOICE_STATUS').AsString = '2' then Raise Exception.Create('此发票已经作废,不能执行修改操作.');
  with TfrmSalInvoice.Create(self) do
    begin
      try
        Edit(cdsList.FieldByName('INVD_ID').AsString);
        //OrderType := CdsSalesList.FieldByName('').AsInteger;
        OnSave := AddRecord;
        ShowModal;
      finally
        free;
      end;
    end;
end;

procedure TfrmSalInvoiceList.actPrintExecute(Sender: TObject);
begin
  inherited;
  if not ShopGlobal.GetChkRight('100002314',6) then Raise Exception.Create('你没有打印发票的权限,请和管理员联系.');
  if cdsList.IsEmpty then Exit;
  with TfrmFastReport.Create(Self) do
    begin
      try
         PrintReport(PrintSQL2(inttostr(Global.TENANT_ID),cdsList.FieldbyName('INVD_ID').AsString),frfSalinvoice);
      finally
         free;
      end;
    end;
end;

procedure TfrmSalInvoiceList.actPreviewExecute(Sender: TObject);
begin
  inherited;
  if not ShopGlobal.GetChkRight('100002314',6) then Raise Exception.Create('你没有打印发票的权限,请和管理员联系.');
  if cdsList.IsEmpty then Exit;
  with TfrmFastReport.Create(Self) do
    begin
      try
         ShowReport(PrintSQL2(inttostr(Global.TENANT_ID),cdsList.FieldbyName('INVD_ID').AsString),frfSalinvoice);
      finally
         free;
      end;
    end;
end;

procedure TfrmSalInvoiceList.actFindExecute(Sender: TObject);
begin
  inherited;
  case RzPage.ActivePageIndex of
    0:Open1('');
    1:Open2('');
  end;
end;

procedure TfrmSalInvoiceList.actInfoExecute(Sender: TObject);
begin
  inherited;
    if cdsList.IsEmpty then Exit;
    with TfrmSalInvoice.Create(self) do
      begin
        try
          //cid := cdsList.FieldbyName('SHOP_ID').AsString;
          Open(cdsList.FieldByName('INVD_ID').AsString);
          ShowModal;
        finally
          free;
        end;
      end;
end;

procedure TfrmSalInvoiceList.actAuditExecute(Sender: TObject);
var
  Msg :string;
  Params:TftParamList;
  rs:TZQuery;
begin
  inherited;
  if cdsList.IsEmpty then Raise Exception.Create('请选择要作废的发票');
  if not ShopGlobal.GetChkRight('100002314',5) then Raise Exception.Create('你没有作废发票的权限,请和管理员联系.');
  if cdsList.FieldByName('INVOICE_STATUS').AsString='1' then
     begin
       //if copy(cdsList.FieldByName('COMM').AsString,1,1)= '1' then Raise Exception.Create('已经同步的数据不能作废');
       //if cdsList.FieldByName('CREA_USER').AsString<>Global.UserID then Raise Exception.Create('只有审核人才能对当前销售单执行弃审');
       if MessageBox(Handle,'确认作废当前发票？',pchar(Application.Title),MB_YESNO+MB_ICONQUESTION)<>6 then Exit;
     end
  else
     begin
       //if copy(cdsList.FieldByName('COMM').AsString,1,1)= '1' then Raise Exception.Create('已经同步的数据不能再审核');
       if MessageBox(Handle,'确认还原作废发票？',pchar(Application.Title),MB_YESNO+MB_ICONQUESTION)<>6 then Exit;
     end;
  try
    Params := TftParamList.Create;
    rs := TZQuery.Create(nil);
    try
      Params.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
      Params.ParamByName('INVD_ID').AsString := cdsList.FieldByName('INVD_ID').AsString;
      Factor.Open(rs,'TInvoiceOrder',Params);

      if cdsList.FieldByName('INVOICE_STATUS').AsString='1' then
         begin
            rs.Edit;
            rs.FieldByName('INVOICE_STATUS').AsString := '2';
            rs.Post;
            Factor.UpdateBatch(rs,'TInvoiceOrder');
            MessageBox(Handle,Pchar('作废发票成功'),Pchar(Application.Title),MB_OK+MB_ICONINFORMATION);
         end
      else
         begin
            rs.Edit;
            rs.FieldByName('INVOICE_STATUS').AsString := '1';
            rs.Post;
            Factor.UpdateBatch(rs,'TInvoiceOrder');
            MessageBox(Handle,Pchar('还原发票成功'),Pchar(Application.Title),MB_OK+MB_ICONINFORMATION);
         end;
    finally
      rs.Free;
      Params.Free;
    end;

  except
    on E:Exception do
       begin
         Raise Exception.Create(E.Message);
       end;
  end;
  ChangeButton;
end;

procedure TfrmSalInvoiceList.AddRecord(AObj: TRecord_);
begin
  //若不是List分页则同步刷新
  case RzPage.ActivePageIndex of
   0:  
   begin
   end;
   1:
   begin
      if cdsList.Locate('INVD_ID',AObj.FieldbyName('INVD_ID').AsString,[]) then
        begin
          cdsList.Edit;
          AObj.WriteToDataSet(cdsList,false);
          cdsList.Post;
        end
      else
        begin
          cdsList.Append;
          AObj.WriteToDataSet(cdsList,False);
          cdsList.Post;
        end;
    end;
  end;
  if (AObj.FieldByName('INVH_ID').AsString <> '') and (MessageBox(Handle,'是否立即打印发票?','友情提示',mb_yesno)=6) then SavePrint(AObj.FieldbyName('INVH_ID').AsString);
end;

procedure TfrmSalInvoiceList.ChangeButton;
begin
  if cdsList.Active and (cdsList.FieldByName('INVOICE_STATUS').AsString = '1') then actAudit.Caption := '作废' else actAudit.Caption := '还原';
  if RzPage.ActivePageIndex = 0 then actNew.Caption := '开票' else actNew.Caption := '登记';
//  if rzPage.ActivePageIndex = 0 then
     begin
       actDelete.Enabled := rzPage.ActivePageIndex > 0;
       actEdit.Enabled := rzPage.ActivePageIndex > 0;
       actSave.Enabled := rzPage.ActivePageIndex > 0;
       actCancel.Enabled := false;
       actInfo.Enabled := rzPage.ActivePageIndex > 0;
       actAudit.Enabled := rzPage.ActivePageIndex > 0;
     end;
end;

function TfrmSalInvoiceList.CheckCanExport: boolean;
begin

end;

function TfrmSalInvoiceList.EncodeSQL1(id: string): string;
var
  strSql,strWhere,StrField: string;
  Column:TColumnEh;
begin
  if P1_D1.EditValue = null then Raise Exception.Create('销售日期条件不能为空');
  if P1_D2.EditValue = null then Raise Exception.Create('销售日期条件不能为空');
  if P1_D1.Date > P1_D2.Date then Raise Exception.Create('销售查询开始日期不能大于结束日期');
  
  case fndOrderType.ItemIndex of
    1,2:begin
      strWhere := strWhere + ' where A.TENANT_ID=:TENANT_ID and A.SALES_DATE>=:D1 and A.SALES_DATE<=:D2 ';

      //分批取数据的条件:
      if trim(id)<>'' then
        strWhere:=strWhere+' and A.SALES_ID > '+QuotedStr(id);
      //门店条件:
      if fndP1_SHOP_ID.AsString <> '' then
         strWhere := strWhere + ' and A.SHOP_ID=:SHOP_ID ';
      //部门条件:
      if fndP1_DEPT_ID.AsString <> '' then
         strWhere := strWhere + ' and A.DEPT_ID=:DEPT_ID ';
      //客户条件:
      if fndP1_CUST_ID.AsString <> '' then
         strWhere := strWhere + ' and A.CLIENT_ID=:CLIENT_ID ';
      if trim(fndSALES_ID.Text) <> '' then
         strWhere := strWhere + ' and A.GLIDE_NO like ''%'+trim(fndSALES_ID.Text)+''' ';
      if fndSALES_STYLE.AsString <> '' then
         strWhere := strWhere + ' and A.SALES_STYLE=:SALES_STYLE '; 
      if fndOrderType.ItemIndex = 1 then
      begin
         strWhere := strWhere + ' and A.SALES_TYPE=1 ';
         StrField := '1 as ORDERTYPE,';
      end
      else
      begin
         strWhere := strWhere + ' and A.SALES_TYPE=3 ';
         StrField := '2 as ORDERTYPE,';
      end;

      case fndSTATUS.ItemIndex of
       0:begin
           Column := FindColumn('SetFlag');
           if Column <> nil then Column.Visible := True;
         end;
       1:begin
           strWhere := strWhere + ' and not exists (select * from SAL_INVOICE_LIST K,SAL_INVOICE_INFO L where K.TENANT_ID=L.TENANT_ID and K.INVD_ID=L.INVD_ID and L.INVOICE_STATUS=''1'' and A.TENANT_ID=K.TENANT_ID and A.SALES_ID=K.FROM_ID and A.GODS_ID=K.GODS_ID ) ';
           Column := FindColumn('SetFlag');
           if Column <> nil then Column.Visible := True;
         end;
       2:begin
           strWhere := strWhere + ' and exists (select * from SAL_INVOICE_LIST K,SAL_INVOICE_INFO L where K.TENANT_ID=L.TENANT_ID and K.INVD_ID=L.INVD_ID and L.INVOICE_STATUS=''1'' and A.TENANT_ID=K.TENANT_ID and A.SALES_ID=K.FROM_ID and A.GODS_ID=K.GODS_ID ) ';
           Column := FindColumn('SetFlag');
           if Column <> nil then Column.Visible := False;
         end;
      end;
{
      strSql:=
      'select 0 as SetFlag,'+StrField+'A.TENANT_ID,A.SALES_ID,A.GLIDE_NO,A.SALES_DATE,A.REMARK,A.CLIENT_ID,D.CLIENT_NAME,A.SHOP_ID,A.CREA_DATE,'+
      'E.SHOP_NAME as SHOP_ID_TEXT,A.SALE_AMT as AMOUNT,A.SALE_MNY as AMONEY,B.CREA_USER_TEXT,A.INVOICE_FLAG,B.INVOICE_NO,B.INVOICE_MNY '+
      ' from SAL_SALESORDER A left join ( '+
      ' select M.TENANT_ID,M.CLIENT_ID,M.INVD_ID,N.SALES_ID,H.USER_NAME as CREA_USER_TEXT,M.INVOICE_FLAG,M.INVOICE_NO,M.INVOICE_MNY,M.INVOICE_STATUS '+
      ' from SAL_INVOICE_INFO M inner join SAL_INVOICE_LIST N on M.TENANT_ID=N.TENANT_ID and M.INVD_ID=N.INVD_ID '+
      ' left join VIW_USERS H on M.TENANT_ID=H.TENANT_ID and M.CREA_USER=H.USER_ID where M.INVOICE_STATUS=''1'' '+
      ' ) B on A.TENANT_ID=B.TENANT_ID and A.SALES_ID=B.SALES_ID and A.CLIENT_ID=B.CLIENT_ID '+
      ' left join VIW_CUSTOMER D on A.TENANT_ID=D.TENANT_ID and A.CLIENT_ID=D.CLIENT_ID '+
      ' left join CA_SHOP_INFO E on A.TENANT_ID=E.TENANT_ID and A.SHOP_ID=E.SHOP_ID '+strWhere+ShopGlobal.GetDataRight('A.SHOP_ID',1)+ShopGlobal.GetDataRight('A.DEPT_ID',2)+' ';
}
      strSql:=
      'select 0 as SetFlag,'+StrField+'A.TENANT_ID,A.SALES_ID,A.GLIDE_NO,A.SALES_DATE,A.REMARK,A.CLIENT_ID,C.CLIENT_NAME,'+
      'A.SHOP_ID,E.GODS_NAME,A.CREA_DATE,D.SHOP_NAME as SHOP_ID_TEXT,A.AMOUNT,A.APRICE,A.AMONEY,B.CREA_USER_TEXT,A.INVOICE_FLAG,'+
      'B.INVOICE_NO,F.UNIT_NAME,A.GODS_ID,B.INVOICE_MNY from ( '+
      'select X.TENANT_ID,X.SALES_ID,X.GLIDE_NO,X.SALES_DATE,X.REMARK,X.SALES_TYPE,X.CLIENT_ID,X.SHOP_ID,X.DEPT_ID,'+
      'X.CREA_DATE,X.INVOICE_FLAG,Y.GODS_ID,Y.UNIT_ID,Y.AMOUNT,Y.APRICE,Y.AMONEY '+
      ' from SAL_SALESORDER X inner join SAL_SALESDATA Y on X.TENANT_ID=Y.TENANT_ID and X.SALES_ID=Y.SALES_ID '+
      ') A left join ( '+
      'select M.TENANT_ID,M.CLIENT_ID,M.INVD_ID,N.FROM_ID,N.GODS_ID,H.USER_NAME as CREA_USER_TEXT,M.INVOICE_FLAG,'+
      'M.INVOICE_NO,M.INVOICE_MNY,M.INVOICE_STATUS '+
      ' from SAL_INVOICE_INFO M inner join SAL_INVOICE_LIST N on M.TENANT_ID=N.TENANT_ID and M.INVD_ID=N.INVD_ID '+
      ' left join VIW_USERS H on M.TENANT_ID=H.TENANT_ID and M.CREA_USER=H.USER_ID where M.INVOICE_STATUS=''1'' '+
      ' ) B on A.TENANT_ID=B.TENANT_ID and A.SALES_ID=B.FROM_ID and A.GODS_ID=B.GODS_ID '+
      ' left join VIW_CUSTOMER C on A.TENANT_ID=C.TENANT_ID and A.CLIENT_ID=C.CLIENT_ID '+
      ' left join CA_SHOP_INFO D on A.TENANT_ID=D.TENANT_ID and A.SHOP_ID=D.SHOP_ID '+
      ' left join VIW_GOODSINFO E on A.TENANT_ID=E.TENANT_ID and A.GODS_ID=E.GODS_ID '+
      ' left join VIW_MEAUNITS F on A.TENANT_ID=F.TENANT_ID and A.UNIT_ID=F.UNIT_ID'+strWhere+ShopGlobal.GetDataRight('A.SHOP_ID',1)+ShopGlobal.GetDataRight('A.DEPT_ID',2)+' ';

      case Factor.iDbType of
      0:result := 'select top 600 * from ('+strSql+') jp order by CLIENT_ID,SALES_ID';
      1:result := 'select * from ('+strSql+' order by CLIENT_ID,SALES_ID) where ROWNUM<=600';
      4:result :=
           'select * from ('+
           'select * from ('+strSql+') j order by CLIENT_ID,SALES_ID) tp fetch first 600  rows only';

      5:result := 'select * from ('+strSql+') j order by CLIENT_ID,SALES_ID limit 600';
      else
        result := 'select * from ('+strSql+') j order by CLIENT_ID,SALES_ID';
      end;
    end;
    0:begin
      strWhere := strWhere + ' where A.TENANT_ID=:TENANT_ID and A.INDE_DATE>=:D1 and A.INDE_DATE<=:D2 ';

      //分批取数据的条件:
      if trim(id)<>'' then
        strWhere:=strWhere+' and A.INDE_ID > '+QuotedStr(id);
      //门店条件:
      if fndP1_SHOP_ID.AsString <> '' then
         strWhere := strWhere + ' and A.SHOP_ID=:SHOP_ID ';
      //部门条件:
      if fndP1_DEPT_ID.AsString <> '' then
         strWhere := strWhere + ' and A.DEPT_ID=:DEPT_ID ';
      //客户条件:
      if fndP1_CUST_ID.AsString <> '' then
         strWhere := strWhere + ' and A.CLIENT_ID=:CLIENT_ID ';
      if trim(fndSALES_ID.Text) <> '' then
         strWhere := strWhere + ' and A.GLIDE_NO like ''%'+trim(fndSALES_ID.Text)+''' ';
      if fndSALES_STYLE.AsString <> '' then
         strWhere := strWhere + ' and A.SALES_STYLE=:SALES_STYLE ';

      case fndSTATUS.ItemIndex of
       0:begin
           Column := FindColumn('SetFlag');
           if Column <> nil then Column.Visible := True;
         end;
       1:begin
           strWhere := strWhere + ' and not exists (select * from SAL_INVOICE_LIST K,SAL_INVOICE_INFO L where K.TENANT_ID=L.TENANT_ID and K.INVD_ID=L.INVD_ID and L.INVOICE_STATUS=''1'' and A.TENANT_ID=K.TENANT_ID and A.INDE_ID=K.FROM_ID and A.GODS_ID=K.GODS_ID ) ';
           Column := FindColumn('SetFlag');
           if Column <> nil then Column.Visible := True;
         end;
       2:begin
           strWhere := strWhere + ' and exists (select * from SAL_INVOICE_LIST K,SAL_INVOICE_INFO L where K.TENANT_ID=L.TENANT_ID and K.INVD_ID=L.INVD_ID and L.INVOICE_STATUS=''1'' and A.TENANT_ID=K.TENANT_ID and A.INDE_ID=K.FROM_ID and A.GODS_ID=K.GODS_ID ) ';
           Column := FindColumn('SetFlag');
           if Column <> nil then Column.Visible := False;
         end;
      end;

      strSql:=
      'select 0 as SetFlag,3 as ORDERTYPE,A.TENANT_ID,A.INDE_ID as SALES_ID,A.GLIDE_NO,A.INDE_DATE as SALES_DATE,A.REMARK,A.CLIENT_ID,'+
      'C.CLIENT_NAME,A.SHOP_ID,E.GODS_NAME,A.CREA_DATE,D.SHOP_NAME as SHOP_ID_TEXT,A.AMOUNT,A.APRICE,A.AMONEY,'+
      'B.CREA_USER_TEXT,A.INVOICE_FLAG,B.INVOICE_NO,F.UNIT_NAME,A.GODS_ID,B.INVOICE_MNY from ( '+
      ' select X.TENANT_ID,X.INDE_ID,X.GLIDE_NO,X.INDE_DATE,X.REMARK,X.CLIENT_ID,X.SHOP_ID,'+
      'X.CREA_DATE,X.INVOICE_FLAG,Y.GODS_ID,Y.UNIT_ID,Y.AMOUNT,Y.APRICE,Y.AMONEY '+
      ' from SAL_INDENTORDER X inner join SAL_INDENTDATA Y on X.TENANT_ID=Y.TENANT_ID and X.INDE_ID=Y.INDE_ID '+
      ') A left join ( '+
      'select M.TENANT_ID,M.CLIENT_ID,M.INVD_ID,N.FROM_ID,N.GODS_ID,H.USER_NAME as CREA_USER_TEXT,M.INVOICE_FLAG,M.INVOICE_NO,M.INVOICE_MNY,M.INVOICE_STATUS '+
      ' from SAL_INVOICE_INFO M inner join SAL_INVOICE_LIST N on M.TENANT_ID=N.TENANT_ID and M.INVD_ID=N.INVD_ID '+
      ' left join VIW_USERS H on M.TENANT_ID=H.TENANT_ID and M.CREA_USER=H.USER_ID where M.INVOICE_STATUS=''1'' '+
      ' ) B on A.TENANT_ID=B.TENANT_ID and A.INDE_ID=B.FROM_ID and A.GODS_ID=B.GODS_ID '+
      ' left join VIW_CUSTOMER C on A.TENANT_ID=C.TENANT_ID and A.CLIENT_ID=C.CLIENT_ID '+
      ' left join CA_SHOP_INFO D on A.TENANT_ID=D.TENANT_ID and A.SHOP_ID=D.SHOP_ID '+
      ' left join VIW_GOODSINFO E on A.TENANT_ID=E.TENANT_ID and A.GODS_ID=E.GODS_ID '+
      ' left join VIW_MEAUNITS F on A.TENANT_ID=F.TENANT_ID and A.UNIT_ID=F.UNIT_ID '+strWhere+ShopGlobal.GetDataRight('A.SHOP_ID',1)+ShopGlobal.GetDataRight('A.DEPT_ID',2)+' ';

      case Factor.iDbType of
      0:result := 'select top 600 * from ('+strSql+') jp order by CLIENT_ID,SALES_ID';
      1:result := 'select * from ('+strSql+' order by CLIENT_ID,SALES_ID) where ROWNUM<=600';
      4:result :=
           'select * from ('+
           'select * from ('+strSql+') j order by CLIENT_ID,SALES_ID) tp fetch first 600  rows only';

      5:result := 'select * from ('+strSql+') j order by CLIENT_ID,SALES_ID limit 600';
      else
        result := 'select * from ('+strSql+') j order by CLIENT_ID,SALES_ID';
      end;
    end;
  end;
end;

function TfrmSalInvoiceList.EncodeSQL2(id: string): string;
var
  strSql,strWhere: string;
begin
  if D1.EditValue = null then Raise Exception.Create('开票日期条件不能为空');
  if D2.EditValue = null then Raise Exception.Create('开票日期条件不能为空');
  if D1.Date > D2.Date then Raise Exception.Create('开票查询开始日期不能大于结束日期');
  strWhere := strWhere + ' where A.TENANT_ID=:TENANT_ID and A.IVIO_TYPE=''1'' and A.CREA_DATE>=:D1 and A.CREA_DATE<=:D2 ';

  //分批取数据的条件:
  if trim(id)<>'' then
    strWhere:=strWhere+' A.INVD_ID > '+QuotedStr(id);
  //门店条件:
  if fndSHOP_ID.AsString <> '' then
     strWhere := strWhere + ' and A.SHOP_ID=:SHOP_ID ';
  //部门条件:
  if fndDEPT_ID.AsString <> '' then
     strWhere := strWhere + ' and A.DEPT_ID=:DEPT_ID ';
  //客户条件:
  if fndCLIENT_ID.AsString <> '' then
     strWhere := strWhere + ' and A.CLIENT_ID=:CLIENT_ID ';
  case fndINVOICE_STATUS.ItemIndex of
    1:strWhere := strWhere + ' and A.INVOICE_STATUS=''1'' ';
    2:strWhere := strWhere + ' and A.INVOICE_STATUS=''2'' ';
  end;
  if fndINVOICE_FLAG.ItemIndex>0 then
     strWhere := strWhere + ' and A.INVOICE_FLAG='''+TRecord_(fndINVOICE_FLAG.Properties.Items.Objects[fndINVOICE_FLAG.ItemIndex]).FieldbyName('CODE_ID').asString+''' ';
  if fndCREA_USER.AsString <> '' then
     strWhere := strWhere + ' and A.CREA_USER='''+fndCREA_USER.AsString+'''';
  if trim(fndINVOICE_NO.Text) <> '' then
     strWhere := strWhere +' and A.INVOICE_NO = '+trim(fndINVOICE_NO.Text)+' ';

  strSql:=
  'select A.TENANT_ID,A.INVD_ID,A.INVH_ID,C.SHOP_NAME as SHOP_ID_TEXT,D.DEPT_NAME as DEPT_ID_TEXT,A.CREA_USER,E.USER_NAME as CREA_USER_TEXT,'+
  'A.CREA_DATE,A.CLIENT_ID,B.CLIENT_NAME as CLIENT_ID_TEXT,A.INVO_NAME,A.REMARK,A.INVOICE_FLAG,A.INVOICE_NO,A.INVOICE_STATUS,A.INVOICE_MNY '+
  ' from SAL_INVOICE_INFO A left join VIW_CUSTOMER B on A.TENANT_ID=B.TENANT_ID and A.CLIENT_ID=B.CLIENT_ID '+
  ' left join CA_SHOP_INFO C on A.TENANT_ID=C.TENANT_ID and A.SHOP_ID=C.SHOP_ID '+
  ' left join CA_DEPT_INFO D on A.TENANT_ID=D.TENANT_ID and A.DEPT_ID=D.DEPT_ID '+
  ' left join VIW_USERS E on A.TENANT_ID=E.TENANT_ID and A.CREA_USER=E.USER_ID '+
  ' '+strWhere+ShopGlobal.GetDataRight('A.SHOP_ID',1)+ShopGlobal.GetDataRight('A.DEPT_ID',2)+' ';

  case Factor.iDbType of
  0:result := 'select top 600 * from ('+strSql+') jp order by INVD_ID';
  1:result := 'select * from ('+strSql+' order by INVD_ID) where ROWNUM<=600';
  4:result :=
       'select * from ('+
       'select * from ('+strSql+') j order by INVD_ID) tp fetch first 600  rows only';

  5:result := 'select * from ('+strSql+') j order by INVD_ID limit 600';
  else
    result := 'select * from ('+strSql+') j order by INVD_ID';
  end;
end;

function TfrmSalInvoiceList.FindColumn(FieldName: string): TColumnEh;
var i:integer;
begin
  result := nil;
  for i:=0 to DBGridEh1.Columns.Count -1 do
    begin
      if DBGridEh1.Columns[i].FieldName = FieldName then
         begin
           result := DBGridEh1.Columns[i];
           break;
         end;
    end;
end;

procedure TfrmSalInvoiceList.InitGrid;
begin

end;

procedure TfrmSalInvoiceList.Open1(Id: string);
var
  rs:TZQuery;
  sm:TMemoryStream;
begin
  if not Visible then Exit;
  if Id='' then cdsList.close;
  rs := TZQuery.Create(nil);
  sm := TMemoryStream.Create;
  CdsSalesList.DisableControls;
  try
    rs.SQL.Text := EncodeSQL1(Id);
    rs.Params.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
    rs.Params.ParamByName('D1').AsInteger := strtoint(formatdatetime('YYYYMMDD',P1_D1.Date));
    rs.Params.ParamByName('D2').AsInteger := strtoint(formatdatetime('YYYYMMDD',P1_D2.Date));
    if rs.Params.FindParam('CLIENT_ID')<>nil then rs.Params.FindParam('CLIENT_ID').AsString := fndP1_CUST_ID.AsString;
    if rs.Params.FindParam('SHOP_ID')<>nil then rs.Params.FindParam('SHOP_ID').AsString := fndP1_SHOP_ID.AsString;
    if rs.Params.FindParam('DEPT_ID')<>nil then rs.Params.FindParam('DEPT_ID').AsString := fndP1_DEPT_ID.AsString;
    if rs.Params.FindParam('SALES_STYLE')<>nil then rs.Params.FindParam('SALES_STYLE').AsString := fndSALES_STYLE.AsString; 
    Factor.Open(rs);
    rs.Last;
    MaxId1 := rs.FieldbyName('SALES_ID').AsString;
    if Id='' then
    begin
       rs.SaveToStream(sm);
       CdsSalesList.LoadFromStream(sm);
       CdsSalesList.IndexFieldNames := 'GLIDE_NO';
    end
    else
    begin
       rs.SaveToStream(sm);
       CdsSalesList.AddFromStream(sm);
    end;
    if rs.RecordCount <600 then IsEnd1 := True else IsEnd1 := false;
  finally
    CdsSalesList.EnableControls;
    sm.Free;
    rs.Free;
  end;
end;

procedure TfrmSalInvoiceList.Open2(Id: string);
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
    rs.SQL.Text := EncodeSQL2(Id);
    rs.Params.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
    rs.Params.ParamByName('D1').AsInteger := strtoint(formatdatetime('YYYYMMDD',D1.Date));
    rs.Params.ParamByName('D2').AsInteger := strtoint(formatdatetime('YYYYMMDD',D2.Date));
    if rs.Params.FindParam('CLIENT_ID')<>nil then rs.Params.FindParam('CLIENT_ID').AsString := fndCLIENT_ID.AsString;
    if rs.Params.FindParam('SHOP_ID')<>nil then rs.Params.FindParam('SHOP_ID').AsString := fndSHOP_ID.AsString;
    if rs.Params.FindParam('DEPT_ID')<>nil then rs.Params.FindParam('DEPT_ID').AsString := fndDEPT_ID.AsString;
    Factor.Open(rs);
    rs.Last;
    MaxId2 := rs.FieldbyName('INVD_ID').AsString;
    if Id='' then
    begin
       rs.SaveToStream(sm);
       cdsList.LoadFromStream(sm);
       cdsList.IndexFieldNames := 'INVOICE_NO';
    end
    else
    begin
       rs.SaveToStream(sm);
       cdsList.AddFromStream(sm);
    end;
    if rs.RecordCount <600 then IsEnd2 := True else IsEnd2 := false;
  finally
    cdsList.EnableControls;
    sm.Free;
    rs.Free;
  end;
end;

function TfrmSalInvoiceList.PrintSQL2(tenantid, id: string): string;
begin
  result :=
  'select G.INVH_NO,A.INVOICE_NO,A.CREA_DATE,C.SHOP_NAME as SHOP_ID_TEXT,D.DEPT_NAME as DEPT_ID_TEXT,A.REMARK,'+
  'E.USER_NAME as CREA_USER_TEXT,F.CODE_NAME as INVOICE_FLAG_TEXT,H.CLIENT_NAME as CLIENT_ID_TEXT,B.GODS_NAME,B.SEQNO,B.UNIT_NAME,'+
  'B.AMOUNT,B.APRICE,B.NOTAX_MNY+B.TAX_MNY as AMONEY,B.NOTAX_MNY,B.TAX_MNY,A.INVOICE_MNY,A.INVO_NAME,A.ADDR_NAME '+
  ' from SAL_INVOICE_INFO A inner join SAL_INVOICE_LIST B on A.TENANT_ID=B.TENANT_ID and A.INVD_ID=B.INVD_ID '+
  ' left join CA_SHOP_INFO C on A.TENANT_ID=C.TENANT_ID and A.SHOP_ID=C.SHOP_ID '+
  ' left join CA_DEPT_INFO D on A.TENANT_ID=D.TENANT_ID and A.DEPT_ID=D.DEPT_ID '+
  ' left join VIW_USERS E on A.TENANT_ID=E.TENANT_ID and A.CREA_USER=E.USER_ID '+
  ' left join PUB_PARAMS F on A.INVOICE_FLAG=F.CODE_ID '+
  ' left join SAL_INVOICE_BOOK G on A.TENANT_ID=G.TENANT_ID and A.INVH_ID=G.INVH_ID'+
  ' left join VIW_CUSTOMER H on A.TENANT_ID=H.TENANT_ID and A.CLIENT_ID=H.CLIENT_ID '+
  ' where A.TENANT_ID='+tenantid+' and A.INVD_ID='+QuotedStr(id)+' and F.TYPE_CODE=''INVOICE_FLAG'' order by SEQNO' ;
end;

procedure TfrmSalInvoiceList.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var ARect:TRect;
begin
  inherited;
  if (Rect.Top = DBGridEh1.CellRect(DBGridEh1.Col, DBGridEh1.Row).Top) and (not
    (gdFocused in State) or not DBGridEh1.Focused) then
  begin
    DBGridEh1.Canvas.Brush.Color := clAqua;
  end;
  DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  if Column.FieldName = 'SEQNO' then
  begin
    ARect := Rect;
    DbGridEh1.canvas.FillRect(ARect);
    DrawText(DbGridEh1.Canvas.Handle,pchar(Inttostr(CdsSalesList.RecNo)),length(Inttostr(CdsSalesList.RecNo)),ARect,DT_NOCLIP or DT_SINGLELINE or DT_CENTER or DT_VCENTER);
  end;
end;

procedure TfrmSalInvoiceList.DBGridEh2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var ARect:TRect;
begin
  if (Rect.Top = DBGridEh2.CellRect(DBGridEh2.Col, DBGridEh2.Row).Top) and (not
    (gdFocused in State) or not DBGridEh2.Focused) then
  begin
    DBGridEh2.Canvas.Brush.Color := clAqua;
  end;
  DBGridEh2.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  if Column.FieldName = 'SEQ_NO' then
    begin
      ARect := Rect;
      DbGridEh2.canvas.FillRect(ARect);
      DrawText(DbGridEh2.Canvas.Handle,pchar(Inttostr(cdsList.RecNo)),length(Inttostr(cdsList.RecNo)),ARect,DT_NOCLIP or DT_SINGLELINE or DT_CENTER or DT_VCENTER);
    end;
end;

procedure TfrmSalInvoiceList.cdsListAfterScroll(DataSet: TDataSet);
begin
  inherited;
  ChangeButton;
  if IsEnd2 or not DataSet.Eof then Exit;
  if cdsList.ControlsDisabled then Exit;
  Open2(MaxId2);
end;

procedure TfrmSalInvoiceList.CdsSalesListAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if IsEnd1 or not DataSet.Eof then Exit;
  if CdsSalesList.ControlsDisabled then Exit;
  Open1(MaxId1);
end;

procedure TfrmSalInvoiceList.FormCreate(Sender: TObject);
begin
  inherited;
  TDbGridEhSort.InitForm(self);

  D1.Date := fnTime.fnStrtoDate(FormatDateTime('YYYY-MM-01', date));
  D2.Date := fnTime.fnStrtoDate(FormatDateTime('YYYY-MM-DD', date));
  fndSHOP_ID.DataSet := Global.GetZQueryFromName('CA_SHOP_INFO');
  fndSHOP_ID.KeyValue := Global.SHOP_ID;
  fndSHOP_ID.Text := Global.SHOP_NAME;
  fndCLIENT_ID.DataSet := Global.GetZQueryFromName('PUB_CUSTOMER');
  fndDEPT_ID.DataSet := Global.GetZQueryFromName('CA_DEPT_INFO');
  fndCREA_USER.DataSet := Global.GetZQueryFromName('CA_USERS');
  fndSALES_STYLE.DataSet := Global.GetZQueryFromName('PUB_SALE_STYLE');

  //第一分页销售开票查询:
  P1_D1.Date := fnTime.fnStrtoDate(FormatDateTime('YYYY-MM-01', date));
  P1_D2.Date := fnTime.fnStrtoDate(FormatDateTime('YYYY-MM-DD', date));
  fndP1_SHOP_ID.DataSet := Global.GetZQueryFromName('CA_SHOP_INFO');
  fndP1_SHOP_ID.KeyValue := Global.SHOP_ID;
  fndP1_SHOP_ID.Text := Global.SHOP_NAME;
  {if Copy(Global.SHOP_ID,Length(Global.SHOP_ID)-3,Length(Global.SHOP_ID)) <> '0001' then
  begin
    SetEditStyle(dsBrowse,fndSHOP_ID.Style);
    fndSHOP_ID.Properties.ReadOnly := True;

    SetEditStyle(dsBrowse,fndP1_SHOP_ID.Style);
    fndP1_SHOP_ID.Properties.ReadOnly := True;
  end;}
  //2011.11.10 引入门店权限及部门权限，把原有的控制注释
  fndP1_CUST_ID.DataSet := Global.GetZQueryFromName('PUB_CUSTOMER');
  fndP1_DEPT_ID.DataSet := Global.GetZQueryFromName('CA_DEPT_INFO');
  RzPage.ActivePageIndex := 0;

  if ShopGlobal.GetProdFlag = 'E' then
    begin
      Label3.Caption := '仓库名称';
      Label40.Caption := '开票仓库';
    end;
  ChangeButton;
  fndINVOICE_FLAG.Properties.Items.Insert(0,'全部');
end;

procedure TfrmSalInvoiceList.FormShow(Sender: TObject);
begin
  inherited;
  Open1('');
  if P1_D1.CanFocus then P1_D1.SetFocus;
end;

procedure TfrmSalInvoiceList.RzPageChange(Sender: TObject);
begin
  inherited;
  actFind.OnExecute(nil);
  ChangeButton;
end;

procedure TfrmSalInvoiceList.frfSalinvoiceGetValue(const ParName: String;
  var ParValue: Variant);
begin
  inherited;
  if ParName='企业名称' then ParValue := ShopGlobal.TENANT_NAME;
  if ParName='企业简称' then ParValue := ShopGlobal.SHORT_TENANT_NAME;

end;

procedure TfrmSalInvoiceList.frfSalinvoiceUserFunction(const Name: String;
  p1, p2, p3: Variant; var Val: Variant);
var small:real;
begin
  inherited;
  if UPPERCASE(Name)='SMALLTOBIG' then
     begin
       small := frParser.Calc(p1);
       Val := FnNumber.SmallTOBig(small);
     end;
end;

procedure TfrmSalInvoiceList.SavePrint(id: string);
begin
  with TfrmFastReport.Create(Self) do
    begin
      try
         PrintReport(PrintSQL2(inttostr(Global.TENANT_ID),id),frfSalinvoice);
      finally
         free;
      end;
    end;
end;

end.
