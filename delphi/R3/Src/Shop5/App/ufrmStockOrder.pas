unit ufrmStockOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uframeOrderForm, DB, ActnList, Menus, StdCtrls, Buttons,
  cxTextEdit, cxControls, cxContainer, cxEdit, cxMaskEdit, cxButtonEdit,
  zrComboBoxList, Grids, DBGridEh, ExtCtrls, RzPanel, cxDropDownEdit,
  cxCalendar, zBase, cxSpinEdit, RzButton, cxListBox,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TfrmStockOrder = class(TframeOrderForm)
    lblSTOCK_DATE: TLabel;
    lblCLIENT_ID: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    edtSTOCK_DATE: TcxDateEdit;
    edtREMARK: TcxTextEdit;
    edtGUIDE_USER: TzrComboBoxList;
    edtINVOICE_FLAG: TcxComboBox;
    actPrintBarcode: TAction;
    N1: TMenuItem;
    edtTAX_RATE: TcxSpinEdit;
    edtCLIENT_ID: TzrComboBoxList;
    Label40: TLabel;
    edtSHOP_ID: TzrComboBoxList;
    cdsHeader: TZQuery;
    cdsDetail: TZQuery;
    Label12: TLabel;
    Label14: TLabel;
    edtINDE_GLIDE_NO: TcxButtonEdit;
    Label19: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label6: TLabel;
    edtRECV_MNY: TcxTextEdit;
    edtRECK_MNY: TcxTextEdit;
    edtCHK_DATE: TcxTextEdit;
    edtCHK_USER_TEXT: TcxTextEdit;
    fndRECK_MNY: TcxTextEdit;
    fndMY_AMOUNT: TcxTextEdit;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Label4: TLabel;
    edtTAX_MONEY: TcxTextEdit;
    Label3: TLabel;
    edtDEPT_ID: TzrComboBoxList;
    Label13: TLabel;
    edtADVA_MNY: TcxTextEdit;
    Label11: TLabel;
    RzBitBtn1: TRzBitBtn;
    actDownIndeOrder: TAction;
    Btn_DownOrder: TRzBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure DBGridEh1Columns4UpdateData(Sender: TObject;
      var Text: String; var Value: Variant; var UseText, Handled: Boolean);
    procedure DBGridEh1Columns7UpdateData(Sender: TObject;
      var Text: String; var Value: Variant; var UseText, Handled: Boolean);
    procedure DBGridEh1Columns6UpdateData(Sender: TObject;
      var Text: String; var Value: Variant; var UseText, Handled: Boolean);
    procedure DBGridEh1Columns5UpdateData(Sender: TObject;
      var Text: String; var Value: Variant; var UseText, Handled: Boolean);
    procedure edtINVOICE_FLAGPropertiesChange(Sender: TObject);
    procedure edtCLIENT_IDSaveValue(Sender: TObject);
    procedure edtTableAfterPost(DataSet: TDataSet);
    procedure DBGridEh1Columns4EditButtonClick(Sender: TObject;
      var Handled: Boolean);
    procedure edtCLIENT_IDPropertiesChange(Sender: TObject);
    procedure actPrintBarcodeExecute(Sender: TObject);
    procedure fndGODS_IDSaveValue(Sender: TObject);
    procedure fndGODS_IDAddClick(Sender: TObject);
    procedure edtCLIENT_IDAddClick(Sender: TObject);
    procedure edtGUIDE_USERAddClick(Sender: TObject);
    procedure edtSHOP_IDSaveValue(Sender: TObject);
    procedure edtTableAfterScroll(DataSet: TDataSet);
    procedure DBGridEh1CellClick(Column: TColumnEh);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure edtFROM_IDPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure fndBATCH_NOAddClick(Sender: TObject);
  private
    //条码头
    FBarQry:TZQuery;
    //结算金额
    TotalFee:real;
    //默认发票类型
    DefInvFlag:integer;
    //普通税率
    InRate2:real;
    //增值税率
    InRate3:real;
    FDownOrderID: string; //下载订单ID
    FOrderStatus: string; //订单状态
    function CheckCanExport: boolean; override;
    //打印条码时创建入库不存在
    function GetPrintStockBarCode(GodsID,p_ID1,p_ID2,Unit_ID:string):string;
  protected
    procedure ReadHeader;
    function CheckInput:boolean;override;
    procedure WMFillData(var Message: TMessage); message WM_FILL_DATA;
    procedure IndeFrom(id:string);
    procedure SetdbState(const Value: TDataSetState); override;
    procedure BatchNoDropList; override;
    function  GetShopId:string;override;
  public
    { Public declarations }
    procedure ShowInfo;
    procedure ShowOweInfo;
    function  Calc:real;
    //输入跟踪号
//    function GodsToLocusNo(id:string):boolean;override;
    //输入批号
    function GodsToBatchNo(id:string):boolean;override;
    procedure InitPrice(GODS_ID,UNIT_ID:string);override;
    procedure AmountToCalc(Amount:Real);override;
    procedure PriceToCalc(APrice:Real);override;
    procedure AMoneyToCalc(AMoney:Real);override;
    procedure AgioToCalc(Agio:Real);override;
    procedure UnitToCalc(UNIT_ID:string);override;
    procedure PresentToCalc(Present:integer);override;
    procedure NewOrder;override;
    procedure EditOrder;override;
    procedure DeleteOrder;override;
    procedure SaveOrder;override;
    procedure CancelOrder;override;
    procedure AuditOrder;override;
    procedure AutoAudit;
    procedure Open(id:string);override;
    procedure PrintBarcode;
    //2011.04.12 晚 增加 到货确认填充 订单
    function  IndeOrderWriteToStock(AObj: TRecord_; vData: OleVariant): Boolean;
  end;

implementation
uses uGlobal,uShopUtil,uDsUtil,uFnUtil,uShopGlobal,ufrmSupplierInfo, ufrmGoodsInfo,ufrmTenantInfo,  
  ufrmUsersInfo,ufrmStkIndentOrder,ufrmStkRetuOrderList,ufrmMain,ufrmFindOrder,ufrmBarCodePrint,
  IniFiles,ufrmBatchNoInfo;
{$R *.dfm}

procedure TfrmStockOrder.CancelOrder;
begin
  inherited;
  //下载订单的设置控件为可用
  if (not edtCLIENT_ID.Enabled) and (FDownOrderID<>'') then
  begin
    edtCLIENT_ID.Enabled:=true;  //供应商选择
    edtSHOP_ID.Enabled:=true;    //入库门店
    edtInput.Enabled:=true;      //条形码
    DBGridEh1.ReadOnly:=false;     //明细Grid
  end;
    
  if dbState = dsInsert then
     NewOrder
  else
     Open(oid);
end;

procedure TfrmStockOrder.DeleteOrder;
begin
  inherited;
  Saved := false;
  if cdsHeader.IsEmpty then Raise Exception.Create('不能删除空单据');
  if IsAudit then Raise Exception.Create('已经审核的单据不能删除');
  if copy(cdsHeader.FieldByName('COMM').AsString,1,1)= '1' then Raise Exception.Create('已经同步的数据不能删除');
  if MessageBox(Handle,'是否真想删除当前单据?',pchar(Application.Title),MB_YESNO+MB_ICONQUESTION)<>6 then Exit;
  cdsHeader.Delete;
  cdsDetail.First;
  while not cdsDetail.Eof do cdsDetail.Delete;
  Factor.BeginBatch;
  try
    Factor.AddBatch(cdsHeader,'TStockOrder');
    Factor.AddBatch(cdsDetail,'TStockData');
    Factor.CommitBatch;
    Saved := true;
  except
    Factor.CancelBatch;
    cdsHeader.CancelUpdates;
    cdsDetail.CancelUpdates;
    Raise;
  end;
    AObj.ReadFromDataSet(cdsHeader);
    ReadFromObject(AObj,self);
    ReadHeader;

    ReadFrom(cdsDetail);
    IsAudit := (AObj.FieldbyName('CHK_DATE').AsString<>'');
    oid := AObj.FieldbyName('STOCK_ID').asString;
    gid := AObj.FieldbyName('GLIDE_NO').asString;
    cid := AObj.FieldbyName('SHOP_ID').AsString;
    dbState := dsBrowse;
    ShowOweInfo;
end;

procedure TfrmStockOrder.EditOrder;
begin
  inherited;
  if cdsHeader.IsEmpty then Raise Exception.Create('不能修改空单据');
  if IsAudit then Raise Exception.Create('已经审核的单据不能修改'); 
//  if copy(cdsHeader.FieldByName('COMM').AsString,1,1)= '1' then Raise Exception.Create('已经同步的数据不能修改');
  dbState := dsEdit;
  if Copy(Global.SHOP_ID,Length(Global.SHOP_ID)-3,Length(Global.SHOP_ID)) <> '0001' then
    begin
      SetEditStyle(dsBrowse,edtSHOP_ID.Style);
      edtSHOP_ID.Properties.ReadOnly := True;
    end;   
  if edtCLIENT_ID.CanFocus then edtCLIENT_ID.SetFocus;
end;

procedure TfrmStockOrder.FormCreate(Sender: TObject);
var
  F: TIniFile;
begin
  inherited;
  FDownOrderID:='';
  CanAppend := true;
  fndMY_AMOUNT.Visible := ShopGlobal.GetChkRight('14500001',1); //是否有库存查询权限
  Label6.Visible := fndMY_AMOUNT.Visible;
  edtSHOP_ID.DataSet := Global.GetZQueryFromName('CA_SHOP_INFO');
  edtCLIENT_ID.DataSet := Global.GetZQueryFromName('PUB_CLIENTINFO');
  edtGUIDE_USER.DataSet := Global.GetZQueryFromName('CA_USERS');
  edtDEPT_ID.DataSet := Global.GetZQueryFromName('CA_DEPT_INFO');
  edtDEPT_ID.RangeField := 'DEPT_TYPE';
  edtDEPT_ID.RangeValue := '1';
  InRate2 := StrtoFloatDef(ShopGlobal.GetParameter('IN_RATE2'),0.05);
  InRate3 := StrtoFloatDef(ShopGlobal.GetParameter('IN_RATE3'),0.17);
  DefInvFlag := StrtoIntDef(ShopGlobal.GetParameter('IN_INV_FLAG'),1);

  if not ShopGlobal.GetChkRight('14500001',2) then
     begin
       DBGridEh1.Columns[12].Free;
       DBGridEh1.Columns[11].Free;
       DBGridEh1.Columns[7].Free;
       DBGridEh1.Columns[6].Free;
     end;
  if ShopGlobal.GetProdFlag = 'E' then
    begin
      Label40.Caption := '进货仓库';
    end;

  F := TIniFile.Create(ExtractFilePath(ParamStr(0))+'r3.cfg');
  try    if F.ReadInteger('soft','deskFlag',0)=1 then      Btn_DownOrder.Visible:=True    else      Btn_DownOrder.Visible:=False;  finally
    F.Free;
  end;

  //创建补条码的数据集
  FBarQry:=TZQuery.Create(self);
  FBarQry.FieldDefs.Add('ROWS_ID',ftstring,36,true);
  FBarQry.FieldDefs.Add('TENANT_ID',ftInteger,0,true);
  FBarQry.FieldDefs.Add('GODS_ID',ftstring,36,true);
  FBarQry.FieldDefs.Add('PROPERTY_01',ftstring,36,true);
  FBarQry.FieldDefs.Add('PROPERTY_02',ftstring,36,true);
  FBarQry.FieldDefs.Add('UNIT_ID',ftstring,36,true);
  FBarQry.FieldDefs.Add('BARCODE_TYPE',ftstring,1,true);
  FBarQry.FieldDefs.Add('BATCH_NO',ftstring,36,False);
  FBarQry.FieldDefs.Add('BARCODE',ftstring,30,true);
  FBarQry.CreateDataSet;
end;

procedure TfrmStockOrder.InitPrice(GODS_ID, UNIT_ID: string);
var
  rs:TZQuery;
  str,InLevel:string;
begin
  rs := Global.GetZQueryFromName('PUB_GOODSINFO');
  if not rs.Locate('GODS_ID',edtTable.FieldByName('GODS_ID').AsString,[]) then Raise Exception.Create('经营商品中没找到“'+edtTable.FieldbyName('GODS_NAME').AsString+'”');
  edtTable.Edit;
  if UNIT_ID=rs.FieldbyName('SMALL_UNITS').AsString then
  begin
     edtTable.FieldbyName('APRICE').AsFloat :=rs.FieldbyName('NEW_INPRICE1').AsFloat;
     edtTable.FieldbyName('ORG_PRICE').AsFloat :=rs.FieldbyName('NEW_OUTPRICE1').AsFloat;
  end
  else
  if UNIT_ID=rs.FieldbyName('BIG_UNITS').AsString then
  begin
     edtTable.FieldbyName('APRICE').AsFloat :=rs.FieldbyName('NEW_INPRICE2').AsFloat;
     edtTable.FieldbyName('ORG_PRICE').AsFloat :=rs.FieldbyName('NEW_OUTPRICE2').AsFloat;
  end
  else
  begin
     edtTable.FieldbyName('APRICE').AsFloat :=rs.FieldbyName('NEW_INPRICE').AsFloat;
     edtTable.FieldbyName('ORG_PRICE').AsFloat :=rs.FieldbyName('NEW_OUTPRICE').AsFloat;
  end;
  ShowInfo;
end;

procedure TfrmStockOrder.NewOrder;
var
  rs:TZQuery;
begin
  inherited;
  Open('');
  dbState := dsInsert;
  edtSHOP_ID.KeyValue := Global.SHOP_ID;
  edtSHOP_ID.Text := Global.SHOP_NAME;
  if Copy(Global.SHOP_ID,Length(Global.SHOP_ID)-3,Length(Global.SHOP_ID)) <> '0001' then
    begin
      SetEditStyle(dsBrowse,edtSHOP_ID.Style);
      edtSHOP_ID.Properties.ReadOnly := True;
    end;
  cid := edtSHOP_ID.KeyValue;
  rs := ShopGlobal.GetDeptInfo;
  edtDEPT_ID.KeyValue := rs.FieldbyName('DEPT_ID').AsString;
  edtDEPT_ID.Text := rs.FieldbyName('DEPT_NAME').AsString;
  
  AObj.FieldbyName('STOCK_ID').asString := TSequence.NewId();
  oid := AObj.FieldbyName('STOCK_ID').asString;
  gid := '..新增..';
  edtSTOCK_DATE.Date := Global.SysDate;
  edtGUIDE_USER.KeyValue := Global.UserID;
  edtGUIDE_USER.Text := Global.UserName;
  edtINVOICE_FLAG.ItemIndex := TdsItems.FindItems(edtINVOICE_FLAG.Properties.Items,'CODE_ID',InttoStr(DefInvFlag));
  edtINVOICE_FLAGPropertiesChange(nil);
  InitRecord;
  if edtCLIENT_ID.CanFocus and Visible then edtCLIENT_ID.SetFocus;
  TabSheet.Caption := '..新建..';
end;

procedure TfrmStockOrder.Open(id: string);
var
  Params:TftParamList;
begin
  inherited;
  Params := TftParamList.Create(nil);
  try
    Params.ParamByName('TENANT_ID').asInteger := Global.TENANT_ID;
    Params.ParamByName('SHOP_ID').AsString := cid;
    Params.ParamByName('STOCK_ID').asString := id;
    Factor.BeginBatch;
    try
      Factor.AddBatch(cdsHeader,'TStockOrder',Params);
      Factor.AddBatch(cdsDetail,'TStockData',Params);
      Factor.OpenBatch;
    except
      Factor.CancelBatch;
      Raise;
    end;
    edtSHOP_ID.Properties.ReadOnly := False;
    AObj.ReadFromDataSet(cdsHeader);
    dbState := dsBrowse;  //2011.04.02 提到ReadFromObject之前
    ReadFromObject(AObj,self);
    edtTAX_RATE.Value := AObj.FieldbyName('TAX_RATE').AsFloat*100;
    ReadHeader;

    ReadFrom(cdsDetail);
    IsAudit := (AObj.FieldbyName('CHK_DATE').AsString<>'');
    oid := AObj.FieldbyName('STOCK_ID').asString;
    gid := AObj.FieldbyName('GLIDE_NO').asString;
    cid := AObj.FieldbyName('SHOP_ID').AsString;
    ShowOweInfo;
  finally
    Params.Free;
  end;
end;

procedure TfrmStockOrder.SaveOrder;
var mny,amt:real;
begin
  inherited;
  Saved := false;
  if (not edtCLIENT_ID.Enabled) and (FDownOrderID<>'') and (FOrderStatus='0') then Raise Exception.Create('订货单<'+FDownOrderID+'>[状态:未确认] 不能保存！');
  if edtSTOCK_DATE.EditValue = null then Raise Exception.Create('入库日期不能为空');
  if edtCLIENT_ID.AsString = '' then Raise Exception.Create('供应商不能为空');
  if edtINVOICE_FLAG.ItemIndex = -1 then Raise Exception.Create('票据类型不能为空');
  if edtDEPT_ID.AsString = '' then Raise Exception.Create('所属部门不能为空');
  if edtSHOP_ID.AsString = '' then Raise Exception.Create(Label40.Caption+'不能为空');

  ClearInvaid;
  if edtTable.IsEmpty then Raise Exception.Create('不能保存一张空单据...');
  CheckInvaid;
  WriteToObject(AObj,self);
  AObj.FieldbyName('TENANT_ID').AsInteger := Global.TENANT_ID;
  AObj.FieldbyName('SHOP_ID').AsString := edtSHOP_ID.AsString;
  cid := edtSHOP_ID.asString;
  AObj.FieldByName('STOCK_TYPE').AsInteger := 1;
  AObj.FieldbyName('CREA_DATE').AsString := formatdatetime('YYYY-MM-DD HH:NN:SS',now());
  AObj.FieldByName('CREA_USER').AsString := Global.UserID;
  AObj.FieldbyName('TAX_RATE').AsFloat := edtTAX_RATE.Value / 100;
  //if (ShopGlobal.GetParameter('STK_AUTO_CHK')<>'0') and ShopGlobal.GetChkRight('11200001',5) then
  //   begin
  //     AObj.FieldbyName('CHK_DATE').AsString := formatdatetime('YYYY-MM-DD',date());
  //     AObj.FieldbyName('CHK_USER').AsString := Global.UserID;
  //   end;
  //下载订单:COMM_ID
  if (not edtCLIENT_ID.Enabled) and (not edtSHOP_ID.Enabled) and (DBGridEh1.ReadOnly) and (FDownOrderID<>'') then
    AObj.FieldByName('COMM_ID').AsString:=FDownOrderID
  else
    AObj.FieldByName('COMM_ID').AsString:='';
  Calc;
  Factor.BeginBatch;
  try
    cdsHeader.Edit;
    AObj.WriteToDataSet(cdsHeader);
    cdsHeader.Post;
    WriteTo(cdsDetail);
    mny := 0;
    amt := 0;
    cdsDetail.First;
    while not cdsDetail.Eof do
       begin
         cdsDetail.Edit;
         cdsDetail.FieldByName('TENANT_ID').AsString := cdsHeader.FieldbyName('TENANT_ID').AsString;
         cdsDetail.FieldByName('SHOP_ID').AsString := cdsHeader.FieldbyName('SHOP_ID').AsString;
         cdsDetail.FieldByName('STOCK_ID').AsString := cdsHeader.FieldbyName('STOCK_ID').AsString;
         cdsDetail.FieldByName('TAX_RATE').AsFloat := cdsHeader.FieldbyName('TAX_RATE').AsFloat;
         mny := mny + cdsDetail.FieldbyName('CALC_MONEY').asFloat;
         amt := amt + cdsDetail.FieldbyName('AMOUNT').asFloat;
         cdsDetail.Post;
         cdsDetail.Next;
       end;
    cdsHeader.Edit;
    cdsHeader.FieldbyName('STOCK_MNY').asFloat := mny;
    cdsHeader.FieldbyName('STOCK_AMT').asFloat := amt;
    cdsHeader.Post;
    Factor.AddBatch(cdsHeader,'TStockOrder');
    Factor.AddBatch(cdsDetail,'TStockData');

    Factor.CommitBatch;
    Saved := true;

    //导入订单则复位处理
    FDownOrderID:='';
    edtCLIENT_ID.Enabled:=true;  //供应商选择
    edtSHOP_ID.Enabled:=True;    //入库门店
    edtSHOP_ID.Enabled:=True;
    DBGridEh1.ReadOnly:=False;     //明细Grid
  except
    Factor.CancelBatch;
    cdsHeader.CancelUpdates;
    cdsDetail.CancelUpdates;
    Raise;
  end;
  Open(oid);
  dbState := dsBrowse;

  if (ShopGlobal.GetParameter('STK_AUTO_CHK')<>'0') and ShopGlobal.GetChkRight('11200001',5) then
     begin
       AutoAudit;
     end;

end;

procedure TfrmStockOrder.DBGridEh1Columns4UpdateData(Sender: TObject;
  var Text: String; var Value: Variant; var UseText, Handled: Boolean);
var r:Real;
begin
  if edtTable.FieldbyName('GODS_ID').AsString = '' then
     begin
       Text := '';
       Value := null;
       FocusNextColumn;
       Exit;
     end;
  if PropertyEnabled then
     begin
       Text := TColumnEh(Sender).Field.AsString;
       Value := TColumnEh(Sender).Field.asFloat;
     end
  else
     begin
        try
          if Text='' then
             r := 0
          else
             r := StrtoFloat(Text);
        except
          Text := TColumnEh(Sender).Field.AsString;
          Value := TColumnEh(Sender).Field.asFloat;
          Raise Exception.Create('输入无效数值型');
        end;
        if abs(r)>999999999 then Raise Exception.Create('输入的数值过大，无效');
        TColumnEh(Sender).Field.asFloat := r;
        AMountToCalc(r);
     end;
end;

procedure TfrmStockOrder.DBGridEh1Columns7UpdateData(Sender: TObject;
  var Text: String; var Value: Variant; var UseText, Handled: Boolean);
var r:integer;
begin
  try
    if Text='' then
       r := 0
    else
       r := StrtoInt(Text);
    if abs(r)>1 then Raise Exception.Create('输入的数值过大，无效');
    
  except
    Text := '';
    Value := null;
    Raise Exception.Create('输入无效数值'+Text);
  end;
  TColumnEh(Sender).Field.asFloat := r;
  PresentToCalc(r);
end;

procedure TfrmStockOrder.DBGridEh1Columns6UpdateData(Sender: TObject;
  var Text: String; var Value: Variant; var UseText, Handled: Boolean);
var r:real;
begin
  try
    if Text='' then
       r := 0
    else
       r := StrtoFloat(Text);
  except
    Text := TColumnEh(Sender).Field.AsString;
    Value := TColumnEh(Sender).Field.asFloat;
    Raise Exception.Create('输入无效数值型');
  end;
  if abs(r)>999999999 then Raise Exception.Create('输入的数值过大，无效');
  TColumnEh(Sender).Field.asFloat := r;
  AMoneyToCalc(r);
end;

procedure TfrmStockOrder.DBGridEh1Columns5UpdateData(Sender: TObject;
  var Text: String; var Value: Variant; var UseText, Handled: Boolean);
var r:real;
begin
  try
    if Text='' then
       r := 0
    else
       r := StrtoFloat(Text);
  except
    Text := TColumnEh(Sender).Field.AsString;
    Value := TColumnEh(Sender).Field.asFloat;
    Raise Exception.Create('输入无效数值型');
  end;
  if abs(r)>999999999 then Raise Exception.Create('输入的数值过大，无效');
  TColumnEh(Sender).Field.asFloat := r;
  PriceToCalc(r);
end;

procedure TfrmStockOrder.edtINVOICE_FLAGPropertiesChange(Sender: TObject);
begin
  inherited;
  if Locked then Exit;
  if dbState=dsBrowse then Exit;
  if edtINVOICE_FLAG.ItemIndex < 0 then Exit;
  case TRecord_(edtINVOICE_FLAG.Properties.Items.Objects[edtINVOICE_FLAG.ItemIndex]).FieldByName('CODE_ID').AsInteger of
  1:AObj.FieldbyName('TAX_RATE').AsFloat := 0;
  2:AObj.FieldbyName('TAX_RATE').AsFloat := InRate2;
  3:AObj.FieldbyName('TAX_RATE').AsFloat := InRate3;
  end;
  edtTAX_RATE.Value := AObj.FieldbyName('TAX_RATE').AsFloat*100;
//  edtTAX_RATE.Visible := (TRecord_(edtINVOICE_FLAG.Properties.Items.Objects[edtINVOICE_FLAG.ItemIndex]).FieldByName('CODE_ID').AsInteger<>1);
  Calc;
end;

procedure TfrmStockOrder.edtCLIENT_IDSaveValue(Sender: TObject);
var
  rs:TZQuery;
begin
  inherited;
  if (edtCLIENT_ID.AsString='') and edtCLIENT_ID.Focused and ShopGlobal.GetChkRight('33100001',2) then
     begin
       if MessageBox(Handle,'没找到你想查找的供应商是否新增一个？',pchar(Application.Title),MB_YESNO+MB_ICONQUESTION)<>6 then Exit;
       edtCLIENT_ID.OnAddClick(nil);
       Exit;
     end;
   rs := Global.GetZQueryFromName('PUB_CLIENTINFO');
   if not rs.Locate('CLIENT_ID',edtCLIENT_ID.AsString,[]) then Raise Exception.Create('选择的供应商没找到,异常错误.');
   Locked := true;
   try
     if rs.FieldbyName('INVOICE_FLAG').AsInteger > 0 then
        begin
          AObj.FieldbyName('TAX_RATE').AsFloat := rs.FieldbyName('TAX_RATE').AsFloat;
          edtINVOICE_FLAG.ItemIndex := TdsItems.FindItems(edtINVOICE_FLAG.Properties.Items,'CODE_ID',rs.FieldbyName('INVOICE_FLAG').AsString);
          edtTAX_RATE.Value := AObj.FieldbyName('TAX_RATE').AsFloat*100;
        end;
     Calc;
   finally
     Locked := false;
   end;
  ShowOweInfo;
end;

function TfrmStockOrder.Calc:real;
var
  r:integer;
  TotalFee:real;
  TotalAmt:real;
  Controls:boolean;
begin
  Controls := edtTable.ControlsDisabled;
  edtTable.DisableControls;
  try
    r := edtTable.FieldbyName('SEQNO').AsInteger;
    TotalFee := 0;
    edtTable.First;
    while not edtTable.Eof do
      begin
        TotalFee := TotalFee + edtTable.FieldbyName('CALC_MONEY').AsFloat;
        TotalAmt := TotalAmt + edtTable.FieldbyName('AMOUNT').AsFloat;
        edtTable.Next;
      end;
    result := TotalFee;
  finally
    edtTable.Locate('SEQNO',r,[]); 
    if not Controls then edtTable.EnableControls;
  end;
//  edtCALC_MONEY.Text := formatFloat('#0.00',TotalFee);
  edtTAX_MONEY.Text := formatFloat('#0.00',(TotalFee/(1+AObj.FieldbyName('TAX_RATE').AsFloat))*AObj.FieldbyName('TAX_RATE').AsFloat);
  if dbState <> dsBrowse then
     begin
       edtRECK_MNY.Text := formatFloat('#0.0##',TotalFee-StrtoFloatDef(edtRECV_MNY.Text,0));
     end;
end;

procedure TfrmStockOrder.edtTableAfterPost(DataSet: TDataSet);
begin
  inherited;
  if not edtTable.ControlsDisabled then Calc;

end;

procedure TfrmStockOrder.DBGridEh1Columns4EditButtonClick(Sender: TObject;
  var Handled: Boolean);
begin
  inherited;
  PostMessage(Handle,WM_DIALOG_PULL,PROPERTY_DIALOG,1);
end;

procedure TfrmStockOrder.AuditOrder;
var
  Msg :string;
  Params:TftParamList;
begin
  inherited;
  if cdsHeader.IsEmpty then Raise Exception.Create('不能审核空单据');
  if dbState <> dsBrowse then SaveOrder;
  if IsAudit then
     begin
//       if copy(cdsHeader.FieldByName('COMM').AsString,1,1)= '1' then Raise Exception.Create('已经同步的数据不能弃审');
       if cdsHeader.FieldByName('CHK_USER').AsString<>Global.UserID then Raise Exception.Create('只有审核人才能对当前进货单执行弃审');
       if MessageBox(Handle,'确认弃审当前进货单？',pchar(Application.Title),MB_YESNO+MB_ICONQUESTION)<>6 then Exit;
     end
  else
     begin
//       if copy(cdsHeader.FieldByName('COMM').AsString,1,1)= '1' then Raise Exception.Create('已经同步的数据不能再审核');
       if MessageBox(Handle,'确认审核当前进货单？',pchar(Application.Title),MB_YESNO+MB_ICONQUESTION)<>6 then Exit;
     end;
  try
    Params := TftParamList.Create(nil);
    try
      Params.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
      Params.ParamByName('STOCK_ID').asString := cdsHeader.FieldbyName('STOCK_ID').AsString;
      Params.ParamByName('CHK_DATE').asString := FormatDatetime('YYYY-MM-DD',Global.SysDate);
      Params.ParamByName('CHK_USER').asString := Global.UserID;
      if not IsAudit then
         Msg := Factor.ExecProc('TStockOrderAudit',Params)
      else
         Msg := Factor.ExecProc('TStockOrderUnAudit',Params) ;
    finally
       Params.free;
    end;
    MessageBox(Handle,Pchar(Msg),Pchar(Application.Title),MB_OK+MB_ICONINFORMATION);
{    IsAudit := not IsAudit;
    if IsAudit then
       begin
         edtCHK_DATE.Text := FormatDatetime('YYYY-MM-DD',Global.SysDate);
         edtCHK_USER_TEXT.Text := Global.UserName;
         AObj.FieldByName('CHK_DATE').AsString := FormatDatetime('YYYY-MM-DD',Global.SysDate);
         AObj.FieldByName('CHK_USER').AsString := Global.UserID;
       end
    else
       begin
         edtCHK_DATE.Text := '';
         edtCHK_USER_TEXT.Text := '';
         AObj.FieldByName('CHK_DATE').AsString := '';
         AObj.FieldByName('CHK_USER').AsString := '';
       end;
    cdsHeader.Edit;
    cdsHeader.FieldByName('CHK_DATE').AsString := AObj.FieldByName('CHK_DATE').AsString;
    cdsHeader.FieldByName('CHK_USER').AsString := AObj.FieldByName('CHK_USER').AsString;
    cdsHeader.Post;
    cdsHeader.CommitUpdates;
}
  except
    on E:Exception do
       begin
         Raise Exception.Create(E.Message);
       end;
  end;
  Open(oid);
end;

procedure TfrmStockOrder.edtCLIENT_IDPropertiesChange(Sender: TObject);
begin
  inherited;
  if trim(edtCLIENT_ID.Text)<>'' then TabSheet.Caption := edtCLIENT_ID.Text;

end;

procedure TfrmStockOrder.PrintBarcode;
procedure AddTo(DataSet:TDataSet;ID,P1,P2,UnitID:string;amt:Integer);
function PubGetBarCode:string;
var rs:TZQuery;
begin
  rs := Global.GetZQueryFromName('PUB_BARCODE');
  if rs.Locate('GODS_ID,PROPERTY_01,PROPERTY_02',VarArrayOf([ID,P1,P2]),[]) then
    Result := rs.FieldbyName('BARCODE').AsString
  else
  begin
    //2013.01.19补生成有入库但是没有条码
    Result := GetPrintStockBarCode(ID,P1,P2,UnitID);
  end;
end;
var
  rs:TZQuery;
begin
  rs := Global.GetZQueryFromName('PUB_GOODSINFO');
  if rs.Locate('GODS_ID',ID,[]) then
  begin
    DataSet.Append;
    DataSet.FieldByName('A').AsBoolean := true;
    DataSet.FieldByName('GODS_ID').AsString := rs.FieldByName('GODS_ID').AsString;
    DataSet.FieldByName('GODS_NAME').AsString := rs.FieldByName('GODS_NAME').AsString;
    DataSet.FieldByName('GODS_CODE').AsString := rs.FieldByName('GODS_CODE').AsString;;
    DataSet.FieldByName('NEW_OUTPRICE').AsString := rs.FieldByName('NEW_OUTPRICE').AsString;
    DataSet.FieldByName('NEW_OUTPRICE1').AsString := rs.FieldByName('NEW_OUTPRICE1').AsString;
    DataSet.FieldByName('NEW_OUTPRICE2').AsString := rs.FieldByName('NEW_OUTPRICE2').AsString;
    DataSet.FieldByName('NEW_LOWPRICE').AsString := rs.FieldByName('NEW_LOWPRICE').AsString;

    DataSet.FieldByName('PROPERTY_01').AsString := P1;
    DataSet.FieldByName('PROPERTY_02').AsString := P2;
    if (p1='#') and (p2='#') then
      DataSet.FieldByName('BARCODE').AsString := rs.FieldByName('BARCODE').AsString
    else
      DataSet.FieldByName('BARCODE').AsString := PubGetBarCode;

    {if (DataSet.FieldByName('BARCODE').AsString='') then  // or fnString.IsCustBarCode(DataSet.FieldByName('BARCODE').AsString)
       DataSet.FieldByName('BARCODE').AsString := rs.FieldByName('BARCODE').AsString;}
    DataSet.FieldByName('AMOUNT').AsInteger := amt;
    DataSet.Post;
  end;
end;
var
  UNIT_ID:string; //单位ID
  amt,i,RecNo:integer;
  BarTable:TZQuery;
begin
  inherited;

  RecNo := edtTable.RecNo;
  edtTable.DisableControls;
  try
    //清除记录
    FBarQry.First;
    while not FBarQry.Eof do
    begin
      FBarQry.Delete; 
    end;

    with TfrmBarCodePrint.Create(self) do
    begin
      try
        adoPrint.Close;
        adoPrint.CreateDataSet;
        edtTable.First;
        while not edtTable.Eof do
        begin
            if PropertyEnabled then
               begin
                 UNIT_ID:=trim(edtTable.FieldbyName('UNIT_ID').AsString);
                 edtProperty.Filtered := false;
                 edtProperty.Filter := 'SEQNO='+edtTable.FieldbyName('SEQNO').AsString;
                 edtProperty.Filtered := true;
                 edtProperty.First;
                 while not edtProperty.Eof do
                    begin
                      AddTo(adoPrint,
                            edtProperty.FieldbyName('GODS_ID').AsString,
                            edtProperty.FieldbyName('PROPERTY_01').AsString,
                            edtProperty.FieldbyName('PROPERTY_02').AsString,
                            UNIT_ID,
                            trunc(edtProperty.FieldbyName('CALC_AMOUNT').AsFloat));
                      edtProperty.Next;
                    end;
               end
            else
               begin
                 AddTo(adoPrint,
                       edtTable.FieldbyName('GODS_ID').AsString,
                       '#','#',
                       UNIT_ID,
                       trunc(edtTable.FieldbyName('CALC_AMOUNT').AsFloat));
               end;
            edtTable.Next;
          end;
          //保存补条码的记录
          if FBarQry.RecordCount>0 then
          begin
            if Factor.UpdateBatch(FBarQry,'TEXT_BARCODEForStock') then
            begin
              BarTable:=Global.GetZQueryFromName('PUB_BARCODE');
              BarTable.Append;
              BarTable.FieldByName('GODS_ID').AsString:=FBarQry.FieldByName('GODS_ID').AsString;
              BarTable.FieldByName('BARCODE').AsString:=FBarQry.FieldByName('BARCODE').AsString;
              BarTable.FieldByName('PROPERTY_01').AsString:=FBarQry.FieldByName('PROPERTY_01').AsString;
              BarTable.FieldByName('PROPERTY_02').AsString:=FBarQry.FieldByName('PROPERTY_02').AsString;
              BarTable.FieldByName('BATCH_NO').AsString:=FBarQry.FieldByName('BATCH_NO').AsString;
              BarTable.FieldByName('UNIT_ID').AsString:=FBarQry.FieldByName('UNIT_ID').AsString;
              BarTable.FieldByName('BARCODE_TYPE').AsString:=FBarQry.FieldByName('BARCODE_TYPE').AsString;
              BarTable.Post;
            end;
          end;
        ShowModal;
      finally
        free;
      end;
    end;
  finally
    if RecNo>0 then edtTable.RecNo := RecNo;
    edtTable.EnableControls;
  end;

end;

procedure TfrmStockOrder.actPrintBarcodeExecute(Sender: TObject);
begin
  inherited;
  if IsNull then Raise Exception.Create('请输入商品后，再打印条码'); 
  PrintBarcode;
end;

procedure TfrmStockOrder.fndGODS_IDSaveValue(Sender: TObject);
begin
  if (fndGODS_ID.AsString='') and fndGODS_ID.Focused and ShopGlobal.GetChkRight('32600001',2) then
     begin
       if MessageBox(Handle,'没找到你想查找的商品是否新增一个？',pchar(Application.Title),MB_YESNO+MB_ICONQUESTION)<>6 then Exit;
       fndStr := fndGODS_ID.Text;
       fndGODS_ID.OnAddClick(nil);
       Exit;
     end;
  inherited;
end;

procedure TfrmStockOrder.fndGODS_IDAddClick(Sender: TObject);
var r:TRecord_;
begin
  //if not ShopGlobal.GetChkRight('200036') then Exit;
  r := TRecord_.Create;
  try
    if TfrmGoodsInfo.AddDialog(self,r,fndStr) then
       begin
         AddRecord(r,r.FieldbyName('CALC_UNITS').AsString,true);
         if (edtTable.FindField('AMOUNT')<>nil) and (edtTable.FindField('AMOUNT').AsFloat=0) then
           begin
             if not PropertyEnabled then
                begin
                  edtTable.FieldbyName('AMOUNT').AsFloat := 1;
                  AMountToCalc(1);
                  //edtTable.FieldByName('NEW_OUTAMONEY').AsString:=formatfloat('#0.000',edtTable.FieldbyName('NEW_OUTPRICE').AsFloat*edtTable.FieldbyName('CALC_AMOUNT').AsFloat);
                end
             else
                PostMessage(Handle,WM_DIALOG_PULL,PROPERTY_DIALOG,0);
           end;
       end;
    DBGridEh1.SetFocus;
  finally
    r.Free;
  end;
  
end;

procedure TfrmStockOrder.edtCLIENT_IDAddClick(Sender: TObject);
var r:TRecord_;
begin
  inherited;
  r := TRecord_.Create;
  try
    if TfrmSupplierInfo.AddDialog(self,r) then
       begin
         edtCLIENT_ID.KeyValue := r.FieldbyName('CLIENT_ID').AsString;
         edtCLIENT_ID.Text := r.FieldbyName('CLIENT_NAME').AsString;
         edtCLIENT_ID.OnSaveValue(nil);
       end;
  finally
    r.Free;
  end;

end;

procedure TfrmStockOrder.edtGUIDE_USERAddClick(Sender: TObject);
var
  r:TRecord_;
begin
  inherited;

  r := TRecord_.Create;
  try
    if TfrmUsersInfo.AddDialog(self,r) then
       begin
         edtGUIDE_USER.KeyValue := r.FieldbyName('USER_ID').AsString;
         edtGUIDE_USER.Text := r.FieldbyName('USER_NAME').AsString;
       end;
  finally
    r.Free;
  end;
  
end;

procedure TfrmStockOrder.ReadHeader;
begin
end;

procedure TfrmStockOrder.ShowOweInfo;
var
  rs:TZQuery;
begin
  rs := TZQuery.Create(nil);
  try
    rs.Close;
    rs.SQL.Text := 'select sum(RECK_MNY),sum(case when STOCK_ID='''+oid+''' then RECK_MNY else 0 end),sum(case when STOCK_ID='''+oid+''' then PAYM_MNY else 0 end) from ACC_PAYABLE_INFO where TENANT_ID=:TENANT_ID and CLIENT_ID=:CLIENT_ID';
    rs.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
    rs.ParamByName('CLIENT_ID').AsString := edtCLIENT_ID.AsString;
    Factor.Open(rs);
    if rs.Fields[0].AsString<>'' then
       fndRECK_MNY.Text := formatFloat('#0.00',rs.Fields[0].AsFloat)
    else
       fndRECK_MNY.Text := formatFloat('#0.00',0);
    if rs.Fields[1].asString<>'' then
       edtRECK_MNY.Text := formatFloat('#0.0##',rs.Fields[1].AsFloat)
    else
       edtRECK_MNY.Text := formatFloat('#0.0##',0);
    if rs.Fields[2].asString<>'' then
       edtRECV_MNY.Text := formatFloat('#0.0##',rs.Fields[2].AsFloat)
    else
       edtRECV_MNY.Text := formatFloat('#0.0##',0);
  finally
    rs.Free;
  end;
end;

procedure TfrmStockOrder.ShowInfo;
var
  rs,bs:TZQuery;
begin
  if not fndMY_AMOUNT.Visible then Exit;
  fndMY_AMOUNT.Text := '';
  if edtTable.FieldByName('GODS_ID').AsString = '' then Exit;
  bs := Global.GetZQueryFromName('PUB_GOODSINFO'); 
  if not bs.Locate('GODS_ID',edtTable.FieldByName('GODS_ID').AsString,[]) then Raise Exception.Create('经营商品中没找到“'+edtTable.FieldbyName('GODS_NAME').AsString+'”');
  rs := TZQuery.Create(nil);
  try
    rs.SQL.Text := 'select sum(AMOUNT) as AMOUNT from STO_STORAGE A where A.GODS_ID=:GODS_ID and SHOP_ID=:SHOP_ID and TENANT_ID=:TENANT_ID and A.BATCH_NO=:BATCH_NO';
    rs.ParamByName('GODS_ID').AsString := edtTable.FieldByName('GODS_ID').AsString;
    rs.ParamByName('SHOP_ID').AsString := edtSHOP_ID.AsString;
    rs.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
    rs.ParamByName('BATCH_NO').AsString := edtTable.FieldByName('BATCH_NO').AsString;
    Factor.Open(rs);
    if rs.FieldbyName('AMOUNT').asString<>'' then
       begin
         if (edtTable.FieldbyName('UNIT_ID').AsString = bs.FieldbyName('BIG_UNITS').AsString) and (bs.FieldbyName('BIGTO_CALC').AsFloat<>0) then
            fndMY_AMOUNT.Text := FormatFloat('#0.00',rs.FieldbyName('AMOUNT').AsFloat/bs.FieldbyName('BIGTO_CALC').AsFloat)
         else
         if (edtTable.FieldbyName('UNIT_ID').AsString = bs.FieldbyName('SMALL_UNITS').AsString) and (bs.FieldbyName('SMALLTO_CALC').AsFloat<>0) then
            fndMY_AMOUNT.Text := FormatFloat('#0.00',rs.FieldbyName('AMOUNT').AsFloat/bs.FieldbyName('SMALLTO_CALC').AsFloat)
         else
            fndMY_AMOUNT.Text := rs.FieldbyName('AMOUNT').AsString;
       end
    else
       fndMY_AMOUNT.Text := '0';
  finally
    rs.Free;
  end;
end;

procedure TfrmStockOrder.edtSHOP_IDSaveValue(Sender: TObject);
begin
  inherited;
  ShowInfo;
end;

procedure TfrmStockOrder.PresentToCalc(Present: integer);
begin
  inherited;
  ShowInfo;

end;

procedure TfrmStockOrder.UnitToCalc(UNIT_ID: string);
begin
  inherited;
  ShowInfo;

end;

procedure TfrmStockOrder.edtTableAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if not edtTable.ControlsDisabled then ShowInfo;

end;

procedure TfrmStockOrder.DBGridEh1CellClick(Column: TColumnEh);
//var  AdoGradePrice:TADODataSet;
//     str:string;
//     Rect:TRect;
begin
  inherited;
{  if dbState=dsBrowse then exit;
  if not edtTable.Active then exit;
  if edtTable.FieldByName('GODS_ID').AsString='' then exit;
  if  (UpperCase(Trim(Column.FieldName)) = 'APRICE')  then
  begin
    cxlGradePrice.Items.Clear;
    AdoGradePrice:=TADODataSet.Create(nil);
    try
      AdoGradePrice.Close;
      str:='select top 1 APRICE from STK_STOCKORDER A,STK_STOCKDATA B '+
      ' where A.STOCK_ID=B.STOCK_ID and A.STOCK_TYPE=''1'' '+
      ' AND B.GODS_ID='+QuotedStr(edtTable.FieldByName('GODS_ID').AsString)+
      ' AND A.COMP_ID='+QuotedStr(Global.CompanyID)+
      ' AND B.UNIT_ID='+QuotedStr(edtTable.FieldByName('UNIT_ID').AsString);
      if edtCLIENT_ID.AsString<>'' then str:=str+' AND A.CLIENT_ID='+QuotedStr(edtCLIENT_ID.AsString);
      str:=str+' order by  A.STOCK_DATE DESC,A.GLIDE_NO DESC';
      AdoGradePrice.CommandText:=str;
      Factor.Open(AdoGradePrice);
      if not AdoGradePrice.IsEmpty then
        cxlGradePrice.Items.Add('最新进价:'+FloatToStr(strtoFloatdef(AdoGradePrice.Fields[0].AsString,0)));
      AdoGradePrice.Close;
      AdoGradePrice.CommandText:=' select A.CALC_UNITS,A.BIG_UNITS,A.SMALL_UNITS, isnull(B.NEW_INPRICE,0) as NEW_INPRICE,  '+
      ' case when isnull(B.PRICE_FLAG,''1'')=''1'' then A.NEW_OUTPRICE else B.NEW_OUTPRICE end as NEW_OUTPRICE,   '+
      ' case when isnull(B.PRICE_FLAG,''1'')=''1'' then A.NEW_OUTPRICE1 else B.NEW_OUTPRICE1 end as NEW_OUTPRICE1,  '+
      ' case when isnull(B.PRICE_FLAG,''1'')=''1'' then A.NEW_OUTPRICE2 else B.NEW_OUTPRICE2 end as NEW_OUTPRICE2  '+
      ' from PUB_GOODSINFO A   left outer join   '+
      ' (select GODS_ID,NEW_INPRICE,NEW_OUTPRICE,NEW_OUTPRICE1,NEW_OUTPRICE2,PRICE_FLAG '+
      ' from BAS_GOODSINFO where COMP_ID='+QuotedStr(Global.CompanyID)+' and GODS_FLAG=''1'') B on A.GODS_ID=B.GODS_ID '+
      ' where A.GODS_ID= '+QuotedStr(edtTable.FieldByName('GODS_ID').AsString)+
      ' union all '+
      ' select CALC_UNITS,BIG_UNITS,SMALL_UNITS,NEW_INPRICE,NEW_OUTPRICE,NEW_OUTPRICE1,NEW_OUTPRICE2'+
      ' from BAS_GOODSINFO where COMP_ID='+QuotedStr(Global.CompanyID)+' and GODS_ID='+QuotedStr(edtTable.FieldByName('GODS_ID').AsString)+' and GODS_FLAG=''2''';
      Factor.Open(AdoGradePrice);
      if not AdoGradePrice.IsEmpty then
      begin
        cxlGradePrice.Items.Add('参考进价:'+FloatToStr(StrToFloatdef(AdoGradePrice.FieldByName('NEW_INPRICE').AsString,0)));
        if edtTable.FieldByName('UNIT_ID').AsString=AdoGradePrice.FieldByName('CALC_UNITS').AsString then
          cxlGradePrice.Items.Add('零售价:'+FloatToStr(StrToFloatdef(AdoGradePrice.FieldByName('NEW_OUTPRICE').AsString,0)));
        if edtTable.FieldByName('UNIT_ID').AsString=AdoGradePrice.FieldByName('BIG_UNITS').AsString then
          cxlGradePrice.Items.Add('零售价:'+FloatToStr(StrToFloatdef(AdoGradePrice.FieldByName('NEW_OUTPRICE2').AsString,0)));
        if edtTable.FieldByName('UNIT_ID').AsString=AdoGradePrice.FieldByName('SMALL_UNITS').AsString then
          cxlGradePrice.Items.Add('零售价:'+FloatToStr(StrToFloatdef(AdoGradePrice.FieldByName('NEW_OUTPRICE1').AsString,0)));
      end;
      if cxlGradePrice.Items.Count>1 then
      begin
        Rect :=DBGridEh1.CellRect(DbGridEh1.Col,DbGridEh1.Row);
        cxlGradePrice.Left := DBGridEh1.Left + Rect.Left;
        cxlGradePrice.Top := DBGridEh1.Top + Rect.Top +16;
        cxlGradePrice.Visible := True;
      end;
    finally
      AdoGradePrice.Free;
    end;
  end
  else       cxlGradePrice.Visible := False;
}
end;

procedure TfrmStockOrder.AmountToCalc(Amount: Real);
begin
  inherited;
  edtTable.Edit;
  edtTable.FieldbyName('RTL_MONEY').AsFloat := edtTable.FieldbyName('AMOUNT').AsFloat*edtTable.FieldbyName('ORG_PRICE').AsFloat;
end;

procedure TfrmStockOrder.AgioToCalc(Agio: Real);
begin
  inherited;
end;

procedure TfrmStockOrder.AMoneyToCalc(AMoney: Real);
begin
  inherited;
end;

procedure TfrmStockOrder.PriceToCalc(APrice: Real);
begin
  inherited;
end;

{function TfrmStockOrder.GodsToLocusNo(id: string): boolean;
var
  rs,bs:TZQuery;
  AObj:TRecord_;
  pt,sq:integer;
  r:boolean;
begin
  if edtTable.FieldByName('GODS_ID').AsString = '' then
     begin
       result := true;
       MessageBox(Handle,pchar('请输入商品后再输入跟踪号.'),'友情提示...',MB_OK+MB_ICONINFORMATION);
       Exit;
     end;
  if id = '' then Raise Exception.Create('输入的批号无效'); 
  result := false;
  rs := TZQuery.Create(nil);
  AObj := TRecord_.Create;
  bs := Global.GetZQueryFromName('PUB_GOODSINFO'); 
  try
    if not bs.Locate('GODS_ID',edtTable.FieldByName('GODS_ID').AsString,[]) then Raise Exception.Create('在经营品牌中没找到.');
    if bs.FieldbyName('USING_LOCUS_NO').asInteger<>1 then Raise Exception.Create('当前商品没有启用物流跟踪码...');
     AObj.ReadFromDataSet(edtTable,false);
     pt := AObj.FieldbyName('IS_PRESENT').AsInteger;
     if (edtTable.FieldbyName('LOCUS_NO').AsString='') then
         begin
           r := false;
         end
     else
         begin
           AObj.FieldbyName('LOCUS_NO').NewValue := id;
           r := edtTable.Locate('GODS_ID;BATCH_NO;UNIT_ID;IS_PRESENT;LOCUS_NO,BOM_ID',VarArrayOf([AObj.FieldbyName('GODS_ID').AsString,AObj.FieldbyName('BATCH_NO').AsString,AObj.FieldbyName('UNIT_ID').AsString,pt,AObj.FieldbyName('LOCUS_NO').NewValue,null]),[]);
         end;
     if not r then
     begin
        if AObj.FieldbyName('GODS_ID').AsString='' then Raise Exception.Create('请输入商品后再输入物流跟踪码...');
        if (edtTable.FieldbyName('LOCUS_NO').AsString<>'') then
        begin
          if (edtTable.FieldbyName('GODS_ID').asString='') and (edtTable.FieldbyName('SEQNO').asString<>'') then
          edtTable.Edit else InitRecord;
          sq := edtTable.FieldbyName('SEQNO').asInteger;
          AObj.WriteToDataSet(edtTable);
          edtTable.FieldbyName('SEQNO').asInteger := sq;
        end
        else
          edtTable.Edit;
        edtTable.FieldbyName('LOCUS_NO').AsString := id;
     end else Raise Exception.Create('当前物流跟踪号已经存在，不能重复输入,跟踪号为:'+id);
     result := false;
  finally
    AObj.Free;
    rs.Free;
  end;
end;
}
function TfrmStockOrder.GodsToBatchNo(id: string): boolean;
var bs:TZQuery;
begin
  result := false;
  if edtTable.FieldByName('GODS_ID').AsString = '' then
     begin
       result := true;
       MessageBox(Handle,pchar('请输入商品后再输入批号.'),'友情提示...',MB_OK+MB_ICONINFORMATION);
       Exit;
     end;
  if id = '' then Raise Exception.Create('输入的批号无效');
  bs := Global.GetZQueryFromName('PUB_GOODSINFO'); 
  if not bs.Locate('GODS_ID',edtTable.FieldByName('GODS_ID').AsString,[]) then Raise Exception.Create('在经营品牌中没找到.');
//  if bs.FieldbyName('USING_BATCH_NO').asInteger<>1 then Raise Exception.Create('当前商品没有启用批号管制...');
//  fndBATCH_NOAddClick(nil);
  if (edtTable.FieldbyName('BATCH_NO').asString='#') or (edtTable.FieldbyName('BATCH_NO').asString='') then
  begin
    edtTable.Edit;
    edtTable.FieldbyName('BATCH_NO').asString := id;
  end
  else
  begin
  end;
  result := true;

end;

function TfrmStockOrder.CheckInput: boolean;
begin
  result := not (pos(inttostr(InputFlag),'124')>0);
end;

procedure TfrmStockOrder.WMFillData(var Message: TMessage);
var
  frmStkIndentOrder:TfrmStkIndentOrder;
  i:integer;
begin
  if dbState <> dsInsert then Raise Exception.Create('不是在新增状态不能完成操作');
  frmStkIndentOrder := TfrmStkIndentOrder(Message.WParam);
  with TfrmStkIndentOrder(frmStkIndentOrder) do
    begin
      self.edtCLIENT_ID.KeyValue := edtCLIENT_ID.KeyValue;
      self.edtCLIENT_ID.Text := edtCLIENT_ID.Text;
      self.edtSHOP_ID.KeyValue := edtSHOP_ID.KeyValue;
      self.edtSHOP_ID.Text := edtSHOP_ID.Text;
      self.edtGUIDE_USER.KeyValue := edtGUIDE_USER.KeyValue;
      self.edtGUIDE_USER.Text := edtGUIDE_USER.Text;
      self.edtDEPT_ID.KeyValue := edtDEPT_ID.KeyValue;
      self.edtDEPT_ID.Text := edtDEPT_ID.Text;
      self.AObj.FieldbyName('FROM_ID').AsString := AObj.FieldbyName('INDE_ID').AsString;
      self.AObj.FieldbyName('TAX_RATE').AsString := AObj.FieldbyName('TAX_RATE').AsString;
      self.edtINDE_GLIDE_NO.Text := AObj.FieldbyName('GLIDE_NO').AsString;
      self.edtADVA_MNY.Text := edtADVA_MNY.Text;
      self.edtREMARK.Text := edtREMARK.Text;
      self.Locked := true;
      try
        self.edtINVOICE_FLAG.ItemIndex := edtINVOICE_FLAG.ItemIndex;
        self.edtTAX_RATE.Value := edtTAX_RATE.Value;
      finally
        self.Locked := false;
      end;
      case Message.LParam of
      0:IndeFrom(AObj.FieldbyName('INDE_ID').AsString);
      1:
        begin
          self.edtTable.DisableControls;
          try
          self.edtProperty.Close;
          self.edtTable.Close;
          self.edtProperty.CreateDataSet;
          self.edtTable.CreateDataSet;
          self.RowID := 0;
          self.edtTable.Append;
          for i:=0 to self.edtTable.Fields.Count -1 do
            begin
               if edtTable.FindField(self.edtTable.Fields[i].FieldName)<>nil then
                  self.edtTable.Fields[i].Value := edtTable.FieldbyName(self.edtTable.Fields[i].FieldName).Value;
            end;
          inc(self.RowID);
          self.edtTable.FieldbyName('SEQNO').AsInteger := self.RowID;
          self.edtTable.FieldbyName('BARCODE').AsString := self.EnCodeBarcode;
          self.edtTable.Post;

          edtProperty.Filtered := false;
          edtProperty.Filter := 'SEQNO='+edtTable.FieldbyName('SEQNO').AsString;
          edtProperty.Filtered := true;

          edtProperty.First;
          while not edtProperty.Eof do
            begin
              self.edtProperty.Append;
              for i:=0 to self.edtProperty.Fields.Count -1 do
                self.edtProperty.Fields[i].Value := edtProperty.FieldbyName(self.edtProperty.Fields[i].FieldName).Value;
              self.edtProperty.FieldByName('SEQNO').AsInteger := self.edtTable.FieldbyName('SEQNO').AsInteger;
              self.edtProperty.Post;

              edtProperty.Next;
            end;
          finally
            self.edtTable.EnableControls;
          end;
          self.Calc;
        end;
      end;
    end;
  inherited;
end;

procedure TfrmStockOrder.N3Click(Sender: TObject);
var frmStkRetuOrderList:TfrmStkRetuOrderList;
begin
  inherited;
  if dbState <> dsBrowse then Raise Exception.Create('请保存单据后再操作。');
  if not frmMain.FindAction('actfrmStkRetuOrderList').Enabled then Exit;
  if not IsAudit then Raise Exception.Create('没有审核的单据不能退货..');
  frmMain.FindAction('actfrmStkRetuOrderList').OnExecute(nil);
  frmStkRetuOrderList := TfrmStkRetuOrderList(frmMain.FindChildForm(TfrmStkRetuOrderList));
  SendMessage(frmStkRetuOrderList.Handle,WM_EXEC_ORDER,0,2);
  PostMessage(frmStkRetuOrderList.CurOrder.Handle,WM_FILL_DATA,integer(self),0);
  inherited;
end;

procedure TfrmStockOrder.N4Click(Sender: TObject);
var frmStkRetuOrderList:TfrmStkRetuOrderList;
begin
  inherited;
  if dbState <> dsBrowse then Raise Exception.Create('请保存单据后再操作。');
  if not frmMain.FindAction('actfrmStkRetuOrderList').Enabled then Exit;
  if not IsAudit then Raise Exception.Create('没有审核的单据不能退货..');
  frmMain.FindAction('actfrmStkRetuOrderList').OnExecute(nil);
  frmStkRetuOrderList := TfrmStkRetuOrderList(frmMain.FindChildForm(TfrmStkRetuOrderList));
  SendMessage(frmStkRetuOrderList.Handle,WM_EXEC_ORDER,0,2);
  PostMessage(frmStkRetuOrderList.CurOrder.Handle,WM_FILL_DATA,integer(self),1);
  inherited;
end;

procedure TfrmStockOrder.edtFROM_IDPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  s:string;
begin
  inherited;
  if not IsNull then Raise Exception.Create('已经输入商品了，不能导入订单.');
  if dbState <> dsInsert then Raise Exception.Create('只有不是新增状态的单据不能导入订单.');  
  s := TfrmFindOrder.FindDialog(self,1,edtCLIENT_ID.asString,edtSHOP_ID.asString);
  if s<>'' then
     begin
       IndeFrom(s);
     end;
end;

function TfrmStockOrder.CheckCanExport: boolean;
begin
  result:=ShopGlobal.GetChkRight('11200001',7);
end;

function TfrmStockOrder.IndeOrderWriteToStock(AObj: TRecord_; vData: OleVariant): Boolean;
var
  i: integer;
  Rs, RsGods, RsUnit: TZQuery;
  TenantID,ShopID,CurName,Remark: string;
begin
  result:=False;
  //根据传入的AObj填充主表字段；
  FDownOrderID:=trim(AObj.fieldbyName('INDE_ID').AsString);
  FOrderStatus:=trim(AObj.fieldbyName('STATUS').AsString);
  if (FOrderStatus='05') or(FOrderStatus='06') then FOrderStatus:='1' else FOrderStatus:='0';
  TenantID:=trim(Aobj.FieldbyName('TENANT_ID').AsString); //企业ID

  ShopID:=trim(Aobj.FieldbyName('SHOP_ID').AsString);     //门店ID
  //读取(供应商)企业ID:
  edtCLIENT_ID.KeyValue:=Aobj.FieldbyName('CLIENT_ID').AsString;
  edtCLIENT_ID.Text:=Aobj.FieldbyName('CLIENT_NAME').AsString; ;
  //读取门店ID
  edtSHOP_ID.KeyValue:=Global.SHOP_ID;
  edtSHOP_ID.Text:=Global.SHOP_NAME;
  //2011.09.08修改为取系统时间:
  edtSTOCK_DATE.Date:=Global.SysDate;  //订单日期
  //edtSTOCK_DATE.Date:=fnTime.fnStrtoDate(AObj.fieldbyName('INDE_DATE').AsString); //订单日期
  DBGridEh1.ReadOnly:=true;     //明细Grid
  fndGODS_ID.Visible := false;
  //edtTable.DisableControls;
  try
    Rs:=TZQuery.Create(nil);
    Rs.Data:=vData;
    //Rs.SQL.Text:='select INDE_ID,GODS_ID,SECOND_ID,UNIT_ID,NEED_AMT,CHK_AMT,AMOUNT,APRICE,PRI3,AGIO_MONEY,AMONEY,CALC_AMOUNT from INF_INDEDATA where TENANT_ID='+inttostr(Global.TENANT_ID)+' and INDE_ID='''+FDownOrderID+''' ';
    //Global.RemoteFactory.Open(Rs);

    RsGods := Global.GetZQueryFromName('PUB_GOODSINFO');
    RsUnit := Global.GetZQueryFromName('PUB_MEAUNITS');
    edtTable.Close;
    edtTable.CreateDataSet;
    edtTable.IndexFieldNames:='SEQNO';
    edtTable.SortedFields:='SEQNO';
    Rs.First;
    while not Rs.Eof do
    begin
      edtTable.Append;
      edtTable.FieldbyName('SEQNO').AsInteger := Rs.RecNo;
      edtTable.FieldbyName('GODS_ID').AsString := Rs.FieldbyName('GODS_ID').AsString;
      if RsGods.Locate('GODS_ID',Rs.FieldbyName('GODS_ID').AsString,[]) then
      begin
        edtTable.FieldbyName('GODS_NAME').AsString := RsGods.FieldbyName('GODS_NAME').AsString;
        edtTable.FieldbyName('GODS_CODE').AsString := RsGods.FieldbyName('GODS_CODE').AsString;
        edtTable.FieldbyName('BARCODE').AsString := RsGods.FieldbyName('BARCODE').AsString;        
        //零售价: ORG_PRICE
        if trim(Rs.FieldByName('UNIT_ID').AsString)=trim(RsGods.FieldByName('SMALL_UNITS').AsString) then //小件单位
          edtTable.FieldbyName('ORG_PRICE').AsFloat:=RsGods.FieldbyName('NEW_OUTPRICE1').AsFloat
        else if trim(Rs.FieldByName('UNIT_ID').AsString)=trim(RsGods.FieldByName('BIG_UNITS').AsString) then     //大件单位
          edtTable.FieldbyName('ORG_PRICE').AsFloat:=RsGods.FieldbyName('NEW_OUTPRICE2').AsFloat
        else
          edtTable.FieldbyName('ORG_PRICE').AsFloat := RsGods.FieldbyName('NEW_OUTPRICE').AsFloat;
      end else
      begin
        edtTable.Close;
        edtTable.CreateDataSet;
        edtCLIENT_ID.KeyValue := null;
        edtCLIENT_ID.Text := '';
        Raise Exception.Create('系统检测到没有对照到的商品！');
      end;
      //单位换算:
      edtTable.FieldbyName('UNIT_ID').AsString := Rs.FieldbyName('UNIT_ID').AsString;
      UnitToCalc(edtTable.FieldbyName('UNIT_ID').AsString);

      edtTable.FieldbyName('AMOUNT').AsFloat := Rs.FieldbyName('AMOUNT').AsFloat;   //数量
      edtTable.FieldbyName('AMONEY').AsFloat := Rs.FieldbyName('AMONEY').AsFloat;   //金额
      edtTable.FieldbyName('AGIO_MONEY').AsFloat := Rs.FieldbyName('AGIO_MONEY').AsFloat;  //折扣（让利）金额
      if Rs.FieldbyName('AMOUNT').AsFloat<>0 then
        edtTable.FieldbyName('APRICE').AsString := formatFloat('#0.000', Rs.FieldbyName('AMONEY').AsFloat / Rs.FieldbyName('AMOUNT').AsFloat);

      AMountToCalc(edtTable.FieldbyName('AMOUNT').AsFloat);
      Remark:='<订单号:'+FDownOrderID+'><订货日期:'+AObj.fieldbyName('INDE_DATE').AsString+'>  ';
      if Rs.FieldbyName('NEED_AMT').AsFloat<>0 then
        Remark :=Remark + '需求量:'+Rs.FieldbyName('NEED_AMT').AsString;
      if Rs.FieldbyName('CHK_AMT').AsFloat<>0 then
        Remark :=Remark + '审核量:'+Rs.FieldbyName('CHK_AMT').AsString;
      edtTable.FieldbyName('REMARK').AsString :=Remark;
      edtREMARK.Text:=Remark;  

      //处理不为空字段:
      edtTable.FieldbyName('BATCH_NO').AsString:='#';
      edtTable.FieldbyName('IS_PRESENT').AsInteger:=0;
            
      edtTable.Post;
      Rs.Next;
    end;
    rowid := rs.RecordCount;
  finally
    edtTable.First;
//    edtTable.EnableControls;
    Rs.Free;
  end;
  //控制控件不可修改属性:
  edtCLIENT_ID.Enabled:=False;  //供应商选择
  edtSHOP_ID.Enabled:=False;    //入库门店
  edtInput.Enabled:=False;      //条形码
  DBGridEh1.ReadOnly:=true;     //明细Grid

  {for i:=0 to DBGridEh1.PopupMenu.Items.Count-1 do
  begin
    CurName:=trim(LowerCase(DBGridEh1.PopupMenu.Items[i].Name));
    if CurName='mnubatchno' then Continue;
      DBGridEh1.PopupMenu.Items[i].Enabled:=False;
  end;}
  result:=true;
end;

procedure TfrmStockOrder.IndeFrom(id: string);
var
  h,d:TZQuery;
  Params:TftParamList;
  HObj:TRecord_;
begin
   h := TZQuery.Create(nil);
   d := TZQuery.Create(nil);
   Params := TftParamList.Create(nil);
   HObj := TRecord_.Create;
   try
      Params.ParamByName('TENANT_ID').asInteger := Global.TENANT_ID;
      Params.ParamByName('INDE_ID').asString := id;
      Factor.BeginBatch;
      try
        Factor.AddBatch(h,'TStkIndentOrder',Params);
        Factor.AddBatch(d,'TStkIndentDataForStock',Params);
        Factor.OpenBatch;
        HObj.ReadFromDataSet(h);
        ReadFromObject(HObj,self);
        AObj.FieldbyName('FROM_ID').AsString := HObj.FieldbyName('INDE_ID').AsString;
        edtINDE_GLIDE_NO.Text := HObj.FieldbyName('GLIDE_NO').AsString;
        edtSTOCK_DATE.Date := Global.SysDate;
        AObj.FieldbyName('TAX_RATE').AsFloat := HObj.FieldbyName('TAX_RATE').AsFloat;
        edtTAX_RATE.Value := HObj.FieldbyName('TAX_RATE').AsFloat*100;
        edtCHK_DATE.Text := '';
        edtCHK_USER_TEXT.Text := '';
        //if h.FieldByName('STKBILL_STATUS').AsInteger=0 then
        //   AObj.FieldByName('ADVA_MNY').AsFloat := HObj.FieldByName('ADVA_MNY').AsFloat
        //else
        //   AObj.FieldByName('ADVA_MNY').AsFloat := 0;
        ReadFrom(d);
        Calc;
      except
        Factor.CancelBatch;
        Raise;
      end;
   finally
     HObj.Free;
     Params.Free;
     h.Free;
     d.Free;
   end;
end;

procedure TfrmStockOrder.SetdbState(const Value: TDataSetState);
begin
  inherited;
  if cdsHeader.Active and (Value=dsBrowse) then
  begin
    if AObj.FieldbyName('LOCUS_STATUS').AsString='3' then
       lblState.Caption := lblState.Caption + ' / 已收货'
    else
       lblState.Caption := lblState.Caption + ' / 未收货';
  end;
end;

procedure TfrmStockOrder.RzBitBtn1Click(Sender: TObject);
var Flag:Integer;
begin
  inherited;
  if not edtCLIENT_ID.DataSet.Locate('CLIENT_ID',edtCLIENT_ID.AsString,[]) then Exit;
  Flag := edtCLIENT_ID.DataSet.FieldByName('FLAG').AsInteger;
  case Flag of
    0:begin
      TfrmSupplierInfo.ShowDialog(Self,edtCLIENT_ID.AsString);
    end;
    1:begin
      TfrmTenantInfo.ShowDialog(Self,StrToInt(edtCLIENT_ID.AsString));
    end;
    3:begin
      TfrmTenantInfo.ShowDialog(Self,StrToInt(edtCLIENT_ID.AsString));
    end;
  end;
end;

procedure TfrmStockOrder.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var
  CurPrice,SalePrice: real;
  GODS_ID: string;
begin
  inherited;
  try
    if not edtTable.Active then exit;
    SalePrice:=0;
    if Column.FieldName = 'APRICE' then
    begin
      GODS_ID:=trim(edtTable.FieldByName('GODS_ID').AsString);
      CurPrice:=edtTable.FieldByName('APRICE').AsFloat;
      SalePrice:=edtTable.FieldByName('ORG_PRICE').AsFloat;
      if GODS_ID<>'' then
      begin
        if (CurPrice>SalePrice) or (CurPrice<SalePrice*0.3) then //大于零售价 或小于 零售价的30%
        begin
          DBGridEh1.Canvas.Brush.Color := clRed;
          DBGridEh1.Canvas.Font.Color := clwhite;
          DBGridEh1.Canvas.Font.Style:=[fsBold];
        end;
        DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end;
    end;
  except
  end;
end;

procedure TfrmStockOrder.BatchNoDropList;
begin
  if GBATCH_NO<>edtTable.FieldbyName('GODS_ID').asString then
  begin
    cdsBatchNo.Close;
    cdsBatchNo.SQL.Text := 'select BATCH_NO from PUB_BATCH_NO where TENANT_ID=:TENANT_ID and GODS_ID in (:GODS_ID,''#'') order by BATCH_NO';
    cdsBatchNo.ParambyName('TENANT_ID').asInteger := Global.TENANT_ID;
    cdsBatchNo.ParambyName('GODS_ID').asString := edtTable.FieldbyName('GODS_ID').asString;
    Factor.Open(cdsBatchNo);
  end;
  fndBATCH_NO.Text := edtTable.FieldbyName('BATCH_NO').AsString;
  fndBATCH_NO.KeyValue := edtTable.FieldbyName('BATCH_NO').AsString;
  fndBATCH_NO.SaveStatus;
end;

procedure TfrmStockOrder.fndBATCH_NOAddClick(Sender: TObject);
var obj:TRecord_;
begin
  inherited;
  obj := TRecord_.Create;
  try
  if TfrmBatchNoInfo.AddDialog(self,obj,edtTable.FieldbyName('GODS_ID').asString) then
     begin
       edtTable.Edit;
       edtTable.FieldbyName('BATCH_NO').asString := obj.FieldbyName('BATCH_NO').asString;
       fndBATCH_NO.KeyValue := edtTable.FieldbyName('BATCH_NO').asString;
       fndBATCH_NO.Text := edtTable.FieldbyName('BATCH_NO').asString;
     end;
  finally
     obj.free;
  end;
end;

function TfrmStockOrder.GetShopId: string;
begin
  result := edtSHOP_ID.asString;
end;

procedure TfrmStockOrder.AutoAudit;
var
  Msg :string;
  Params:TftParamList;
begin
  inherited;
  if cdsHeader.IsEmpty then Raise Exception.Create('不能审核空单据');
  try
    Params := TftParamList.Create(nil);
    try
      Params.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
      Params.ParamByName('STOCK_ID').asString := cdsHeader.FieldbyName('STOCK_ID').AsString;
      Params.ParamByName('CHK_DATE').asString := FormatDatetime('YYYY-MM-DD',Global.SysDate);
      Params.ParamByName('CHK_USER').asString := Global.UserID;
      if not IsAudit then
         Msg := Factor.ExecProc('TStockOrderAudit',Params)
      else
         Msg := Factor.ExecProc('TStockOrderUnAudit',Params) ;
    finally
       Params.free;
    end;
  except
    on E:Exception do
       begin
         Raise Exception.Create(E.Message);
       end;
  end;
  Open(oid);
end;

function TfrmStockOrder.GetPrintStockBarCode(GodsID,p_ID1,p_ID2,Unit_ID: string): string;
var
  tmp:TZQuery;
  vGods_Code:string;
  vBarCode,NewCode:string;
  Size_BAR_FLAG:string;
  Color_BAR_FLAG:string;
  CreateBarcode:string;
begin
  result:='';
  Size_BAR_FLAG:='#';
  Color_BAR_FLAG:='#';
  //商品GODS_CODE,BarCode
  tmp:=ShopGlobal.GetZQueryFromName('PUB_GOODSINFO');
  if tmp.Locate('GODS_ID',GodsID,[]) then
  begin
    vGods_Code:=tmp.FieldByName('GODS_CODE').AsString;
    vBarCode:=tmp.FieldByName('BARCODE').AsString;
  end;

  //尺码
  tmp:=ShopGlobal.GetZQueryFromName('PUB_SIZE_RELATION');
  if tmp.Locate('SIZE_ID',p_ID1,[]) then
    Size_BAR_FLAG:=tmp.FieldByName('BARCODE_FLAG').AsString;
  //颜色
  tmp:=ShopGlobal.GetZQueryFromName('PUB_COLOR_RELATION');
  if tmp.Locate('COLOR_ID',p_ID2,[]) then
    Color_BAR_FLAG:=tmp.FieldByName('BARCODE_FLAG').AsString;

  if (length(vBarCode)>0) and (vBarCode[1]='8') then
    CreateBarcode := copy(vBarCode,2,6)
  else if (length(vGods_Code)=6) and fnString.IsNumberChar(vGods_Code) then
    CreateBarcode := vGods_Code
  else
    CreateBarcode := TSequence.GetSequence('BARCODE_ID',InttoStr(ShopGlobal.TENANT_ID),'',6);
  //生成条码
  NewCode:=GetBarCode(CreateBarcode,Size_BAR_FLAG,Color_BAR_FLAG);
  if NewCode<>'' then
  begin
    FBarQry.Append;
    FBarQry.FieldByName('ROWS_ID').AsString:=TSequence.NewId;
    FBarQry.FieldByName('TENANT_ID').AsInteger:=ShopGlobal.TENANT_ID;
    FBarQry.FieldByName('GODS_ID').AsString:=GodsID;
    FBarQry.FieldByName('PROPERTY_01').AsString:=p_ID1;
    FBarQry.FieldByName('PROPERTY_02').AsString:=p_ID2;
    FBarQry.FieldByName('UNIT_ID').AsString:=Unit_ID;
    FBarQry.FieldByName('BARCODE_TYPE').AsString:='3';    
    FBarQry.FieldByName('BATCH_NO').AsString:='#';
    FBarQry.FieldByName('BARCODE').AsString:=NewCode;
    FBarQry.Post;
    result:=NewCode;
  end;
end;

end.
