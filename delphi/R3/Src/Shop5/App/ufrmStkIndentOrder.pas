unit ufrmStkIndentOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uframeOrderForm, DB, ActnList, Menus, StdCtrls, Buttons,
  cxTextEdit, cxControls, cxContainer, cxEdit, cxMaskEdit, cxButtonEdit,
  zrComboBoxList, Grids, DBGridEh, ExtCtrls, RzPanel, cxDropDownEdit,
  cxCalendar, zBase, cxSpinEdit, RzButton, cxListBox,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBSumLst;

type
  TfrmStkIndentOrder = class(TframeOrderForm)
    lblSTOCK_DATE: TLabel;
    lblCLIENT_ID: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    edtINDE_DATE: TcxDateEdit;
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
    Label13: TLabel;
    edtADVA_MNY: TcxTextEdit;
    Label14: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label6: TLabel;
    edtCHK_DATE: TcxTextEdit;
    edtCHK_USER_TEXT: TcxTextEdit;
    fndRECK_MNY: TcxTextEdit;
    fndMY_AMOUNT: TcxTextEdit;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Label11: TLabel;
    Label3: TLabel;
    edtDEPT_ID: TzrComboBoxList;
    Label19: TLabel;
    Label7: TLabel;
    edtRECV_MNY: TcxTextEdit;
    edtRECK_MNY: TcxTextEdit;
    Label4: TLabel;
    edtTAX_MONEY: TcxTextEdit;
    Label18: TLabel;
    RzBitBtn1: TRzBitBtn;
    Label12: TLabel;
    edtDEMA_GLIDE_NO: TcxButtonEdit;
    pnlFEE: TPanel;
    Label20: TLabel;
    Label21: TLabel;
    edtBOND_MNY: TcxTextEdit;
    DBSumList1: TDBSumList;
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
    procedure RzBitBtn1Click(Sender: TObject);
    procedure edtDEMA_GLIDE_NOPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure DBGridEh1Columns9UpdateData(Sender: TObject;
      var Text: String; var Value: Variant; var UseText, Handled: Boolean);
  private
    { Private declarations }
    //结算金额
    TotalFee:real;
    //默认发票类型
    DefInvFlag:integer;
    //普通税率
    InRate2:real;
    //增值税率
    InRate3:real;
    procedure ReadHeader;
    function CheckInput:boolean;override;
    function  CheckCanExport: boolean; override;
    procedure SetdbState(const Value: TDataSetState); override;
    function CheckRepeat(AObj:TRecord_;var pt:boolean):boolean;override;
    procedure AddRecord(AObj:TRecord_;UNIT_ID:string;Located:boolean=false;IsPresent:boolean=false);override;
  protected
    procedure WMFillData(var Message: TMessage); message WM_FILL_DATA;
    procedure DemaFrom(id:String);
  public
    { Public declarations }
    procedure CheckInvaid;override;
    procedure ShowInfo;
    procedure ShowOweInfo;
    function  Calc:real;
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
    procedure Open(id:string);override;
    procedure PrintBarcode;
  end;

implementation
uses uGlobal,uShopUtil,uDsUtil,uFnUtil,uShopGlobal,ufrmSupplierInfo, ufrmGoodsInfo, ufrmUsersInfo,ufrmStockOrderList,
     ufrmShopInfo, ufrmMain, ufrmTenantInfo, ufrmDemandOrder, ufrmFindOrder,
  ufrmBasic;
{$R *.dfm}

procedure TfrmStkIndentOrder.CancelOrder;
begin
  inherited;
  if dbState = dsInsert then
     NewOrder
  else
     Open(oid);
end;

procedure TfrmStkIndentOrder.DeleteOrder;
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
    Factor.AddBatch(cdsHeader,'TStkIndentOrder');
    Factor.AddBatch(cdsDetail,'TStkIndentData');
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
    oid := AObj.FieldbyName('INDE_ID').asString;
    gid := AObj.FieldbyName('GLIDE_NO').asString;
    cid := AObj.FieldbyName('SHOP_ID').AsString;
    dbState := dsBrowse;
    ShowOweInfo;
end;

procedure TfrmStkIndentOrder.EditOrder;
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

procedure TfrmStkIndentOrder.FormCreate(Sender: TObject);
begin
  inherited;
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
  DBSumList1.DataSet := DBGridEh1.DataSource.DataSet;
  if ShopGlobal.GetProdFlag = 'E' then
    begin
      Label40.Caption := '订货仓库';
    end;
    
  if not ShopGlobal.GetChkRight('14500001',2) then
     begin
       DBGridEh1.Columns[13].Free;
       DBGridEh1.Columns[12].Free;
       DBGridEh1.Columns[8].Free;
       DBGridEh1.Columns[7].Free;
     end;
end;

procedure TfrmStkIndentOrder.InitPrice(GODS_ID, UNIT_ID: string);
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

procedure TfrmStkIndentOrder.NewOrder;
var rs:TZQuery;
begin
  inherited;
  Open('');
  dbState := dsInsert;
  edtSHOP_ID.Properties.ReadOnly := False;
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
  AObj.FieldbyName('INDE_ID').asString := TSequence.NewId();
  oid := AObj.FieldbyName('INDE_ID').asString;
  gid := '..新增..';
  edtINDE_DATE.Date := Global.SysDate;
  edtGUIDE_USER.KeyValue := Global.UserID;
  edtGUIDE_USER.Text := Global.UserName;
  edtINVOICE_FLAG.ItemIndex := TdsItems.FindItems(edtINVOICE_FLAG.Properties.Items,'CODE_ID',InttoStr(DefInvFlag));
  edtINVOICE_FLAGPropertiesChange(nil);
  InitRecord;
  if edtCLIENT_ID.CanFocus and Visible then edtCLIENT_ID.SetFocus;
  TabSheet.Caption := '..新建..';
end;

procedure TfrmStkIndentOrder.Open(id: string);
var
  Params:TftParamList;
begin
  inherited;
  Params := TftParamList.Create(nil);
  try
    Params.ParamByName('TENANT_ID').asInteger := Global.TENANT_ID;
    Params.ParamByName('SHOP_ID').AsString := cid;
    Params.ParamByName('INDE_ID').asString := id;
    Factor.BeginBatch;
    try
      Factor.AddBatch(cdsHeader,'TStkIndentOrder',Params);
      Factor.AddBatch(cdsDetail,'TStkIndentData',Params);
      Factor.OpenBatch;
    except
      Factor.CancelBatch;
      Raise;
    end;
    dbState := dsBrowse;  //2011.04.02 提到ReadFromObject之前
    edtSHOP_ID.Properties.ReadOnly := False;
    AObj.ReadFromDataSet(cdsHeader);
    ReadFromObject(AObj,self);
    edtTAX_RATE.Value := AObj.FieldbyName('TAX_RATE').AsFloat*100;
    ReadHeader;

    ReadFrom(cdsDetail);
    IsAudit := (AObj.FieldbyName('CHK_DATE').AsString<>'');
    oid := AObj.FieldbyName('INDE_ID').asString;
    gid := AObj.FieldbyName('GLIDE_NO').asString;
    cid := AObj.FieldbyName('SHOP_ID').AsString;
    case AObj.FieldByName('STKBILL_STATUS').AsInteger of
    0:Label18.Caption := '状态:待入库';
    1:Label18.Caption := '状态:入库中';
    2:Label18.Caption := '状态:已入库';
    end;
    ShowOweInfo;
  finally
    Params.Free;
  end;
end;

procedure TfrmStkIndentOrder.SaveOrder;
var mny,amt,BondMny:real;
begin
  inherited;
  Saved := false;
  if edtINDE_DATE.EditValue = null then Raise Exception.Create('订货日期不能为空');
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
  AObj.FieldbyName('CREA_DATE').AsString := formatdatetime('YYYY-MM-DD HH:NN:SS',now());
  AObj.FieldByName('CREA_USER').AsString := Global.UserID;
  AObj.FieldbyName('TAX_RATE').AsFloat := edtTAX_RATE.Value / 100;
  if (ShopGlobal.GetParameter('STK_AUTO_CHK')<>'0') and ShopGlobal.GetChkRight('11100001',5) then
     begin
       AObj.FieldbyName('CHK_DATE').AsString := formatdatetime('YYYY-MM-DD',date());
       AObj.FieldbyName('CHK_USER').AsString := Global.UserID;
     end;
  Calc;
  Factor.BeginBatch;
  try
    cdsHeader.Edit;
    AObj.WriteToDataSet(cdsHeader);
    cdsHeader.Post;
    WriteTo(cdsDetail);
    mny := 0;
    amt := 0;
    //BondMny := 0;
    cdsDetail.First;
    while not cdsDetail.Eof do
       begin
         cdsDetail.Edit;
         cdsDetail.FieldByName('TENANT_ID').AsString := cdsHeader.FieldbyName('TENANT_ID').AsString;
         cdsDetail.FieldByName('SHOP_ID').AsString := cdsHeader.FieldbyName('SHOP_ID').AsString;
         cdsDetail.FieldByName('INDE_ID').AsString := cdsHeader.FieldbyName('INDE_ID').AsString;
         mny := mny + cdsDetail.FieldbyName('CALC_MONEY').asFloat;
         amt := amt + cdsDetail.FieldbyName('AMOUNT').asFloat;
         //BondMny := BondMny + cdsDetail.FieldByName('BOND_MNY').AsFloat;
         cdsDetail.Post;
         cdsDetail.Next;
       end;
    cdsHeader.Edit;
    cdsHeader.FieldbyName('INDE_MNY').asFloat := mny;
    cdsHeader.FieldbyName('INDE_AMT').asFloat := amt;
    //cdsHeader.FieldByName('BOND_MNY').AsFloat := BondMny;
    cdsHeader.Post;
    Factor.AddBatch(cdsHeader,'TStkIndentOrder');
    Factor.AddBatch(cdsDetail,'TStkIndentData');
    Factor.CommitBatch;
    Saved := true;
  except
    Factor.CancelBatch;
    cdsHeader.CancelUpdates;
    cdsDetail.CancelUpdates;
    Raise;
  end;
  Open(oid);
  dbState := dsBrowse;
end;

procedure TfrmStkIndentOrder.DBGridEh1Columns4UpdateData(Sender: TObject;
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

procedure TfrmStkIndentOrder.DBGridEh1Columns7UpdateData(Sender: TObject;
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

procedure TfrmStkIndentOrder.DBGridEh1Columns6UpdateData(Sender: TObject;
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

procedure TfrmStkIndentOrder.DBGridEh1Columns5UpdateData(Sender: TObject;
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

procedure TfrmStkIndentOrder.edtINVOICE_FLAGPropertiesChange(Sender: TObject);
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

procedure TfrmStkIndentOrder.edtCLIENT_IDSaveValue(Sender: TObject);
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

function TfrmStkIndentOrder.Calc:real;
var
  r:integer;
  TotalFee:real;
  TotalAmt:real;
begin
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
    edtTable.EnableControls;
  end;
//  edtCALC_MONEY.Text := formatFloat('#0.00',TotalFee);
  edtTAX_MONEY.Text := formatFloat('#0.00',(TotalFee/(1+AObj.FieldbyName('TAX_RATE').AsFloat))*AObj.FieldbyName('TAX_RATE').AsFloat);
end;

procedure TfrmStkIndentOrder.edtTableAfterPost(DataSet: TDataSet);
begin
  inherited;
  if not edtTable.ControlsDisabled then Calc;

end;

procedure TfrmStkIndentOrder.DBGridEh1Columns4EditButtonClick(Sender: TObject;
  var Handled: Boolean);
begin
  inherited;
  PostMessage(Handle,WM_DIALOG_PULL,PROPERTY_DIALOG,1);
end;

procedure TfrmStkIndentOrder.AuditOrder;
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
       if cdsHeader.FieldByName('CHK_USER').AsString<>Global.UserID then Raise Exception.Create('只有审核人才能对当前订货单执行弃审');
       if MessageBox(Handle,'确认弃审当前订货单？',pchar(Application.Title),MB_YESNO+MB_ICONQUESTION)<>6 then Exit;
     end
  else
     begin
//       if copy(cdsHeader.FieldByName('COMM').AsString,1,1)= '1' then Raise Exception.Create('已经同步的数据不能再审核');
       if MessageBox(Handle,'确认审核当前订货单？',pchar(Application.Title),MB_YESNO+MB_ICONQUESTION)<>6 then Exit;
     end;
  try
    Params := TftParamList.Create(nil);
    try
      Params.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
      Params.ParamByName('INDE_ID').asString := cdsHeader.FieldbyName('INDE_ID').AsString;
      Params.ParamByName('CHK_DATE').asString := FormatDatetime('YYYY-MM-DD',Global.SysDate);
      Params.ParamByName('CHK_USER').asString := Global.UserID;
      if not IsAudit then
         Msg := Factor.ExecProc('TStkIndentOrderAudit',Params)
      else
         Msg := Factor.ExecProc('TStkIndentOrderUnAudit',Params) ;
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

procedure TfrmStkIndentOrder.edtCLIENT_IDPropertiesChange(Sender: TObject);
begin
  inherited;
  if trim(edtCLIENT_ID.Text)<>'' then TabSheet.Caption := edtCLIENT_ID.Text;

end;

procedure TfrmStkIndentOrder.PrintBarcode;
{
procedure AddTo(DataSet:TDataSet;ID,P1,P2:string;amt:Integer);
function PubGetBarCode:string;
var rs:TADODataSet;
begin
  rs := TADODataSet.Create(nil);
  try
    rs.CommandText := 'select BARCODE from PUB_BARCODE where GODS_ID='''+ID+''' and PROPERTY_01='''+P1+''' and PROPERTY_02='''+P2+''' and BATCH_NO=''#''';
    Factor.Open(rs);
    result := rs.Fields[0].AsString;
  finally
    rs.Free;
  end;
end;
var
  rs:TADODataSet;
begin
  rs := Global.GetADODataSetFromName('BAS_GOODSINFO');
  if rs.Locate('GODS_ID',ID,[]) then
  begin
    DataSet.Append;
    DataSet.FieldByName('A').AsBoolean := true;
    DataSet.FieldByName('GODS_ID').AsString := rs.FieldByName('GODS_ID').AsString;;
    DataSet.FieldByName('BCODE').AsString := rs.FieldByName('BCODE').AsString;
    DataSet.FieldByName('GODS_NAME').AsString := rs.FieldByName('GODS_NAME').AsString;
    DataSet.FieldByName('GODS_CODE').AsString := rs.FieldByName('GODS_CODE').AsString;;
    DataSet.FieldByName('NEW_OUTPRICE').AsString := rs.FieldByName('NEW_OUTPRICE').AsString;
    DataSet.FieldByName('NEW_CUSTPRICE').AsString := rs.FieldByName('NEW_CUSTPRICE').AsString;
    DataSet.FieldByName('PROPERTY_01').AsString := P1;
    DataSet.FieldByName('PROPERTY_02').AsString := P2;
    //
    DataSet.FieldByName('BARCODE').AsString := PubGetBarCode;
    if (DataSet.FieldByName('BARCODE').AsString='') or fnString.IsCustBarCode(DataSet.FieldByName('BARCODE').AsString) then
       DataSet.FieldByName('BARCODE').AsString := GetBarCode(rs.FieldByName('BCODE').AsString,
         P1,P2);
    DataSet.FieldByName('AMOUNT').AsInteger := amt;
    DataSet.Post;
  end;
end;
var amt,i,RecNo:integer;
}
begin
  inherited;
  {
  RecNo := edtTable.RecNo;
  edtTable.DisableControls;
  try
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
                 edtProperty.Filtered := false;
                 edtProperty.Filter := 'SEQNO='+edtTable.FieldbyName('SEQNO').AsString;
                 edtProperty.Filtered := true;
                 edtProperty.First;
                 while not edtProperty.Eof do
                    begin
                      AddTo(adoPrint,edtProperty.FieldbyName('GODS_ID').AsString,edtProperty.FieldbyName('PROPERTY_01').AsString,edtProperty.FieldbyName('PROPERTY_02').AsString,trunc(edtProperty.FieldbyName('CALC_AMOUNT').AsFloat));
                      edtProperty.Next;
                    end;
               end
            else
               begin
                 AddTo(adoPrint,edtTable.FieldbyName('GODS_ID').AsString,'#','#',trunc(edtTable.FieldbyName('CALC_AMOUNT').AsFloat));
               end;
            edtTable.Next;
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
  }
end;

procedure TfrmStkIndentOrder.actPrintBarcodeExecute(Sender: TObject);
begin
  inherited;
  if IsNull then Raise Exception.Create('请输入商品后，再打印条码'); 
  PrintBarcode;
end;

procedure TfrmStkIndentOrder.fndGODS_IDSaveValue(Sender: TObject);
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

procedure TfrmStkIndentOrder.fndGODS_IDAddClick(Sender: TObject);
var r:TRecord_;
begin
  if not ShopGlobal.GetChkRight('32600001',2) then Exit;
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

procedure TfrmStkIndentOrder.edtCLIENT_IDAddClick(Sender: TObject);
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

procedure TfrmStkIndentOrder.edtGUIDE_USERAddClick(Sender: TObject);
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

procedure TfrmStkIndentOrder.ReadHeader;
begin
end;

procedure TfrmStkIndentOrder.ShowOweInfo;
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

procedure TfrmStkIndentOrder.ShowInfo;
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
    if not rs.IsEmpty then
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

procedure TfrmStkIndentOrder.edtSHOP_IDSaveValue(Sender: TObject);
begin
  inherited;
  cid := edtSHOP_ID.asString;
  ShowInfo;
end;

procedure TfrmStkIndentOrder.PresentToCalc(Present: integer);
begin
  inherited;
  ShowInfo;

end;

procedure TfrmStkIndentOrder.UnitToCalc(UNIT_ID: string);
begin
  inherited;
  ShowInfo;

end;

procedure TfrmStkIndentOrder.edtTableAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if not edtTable.ControlsDisabled then ShowInfo;

end;

procedure TfrmStkIndentOrder.DBGridEh1CellClick(Column: TColumnEh);
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
      ' where A.INDE_ID=B.INDE_ID and A.STOCK_TYPE=''1'' '+
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

procedure TfrmStkIndentOrder.AmountToCalc(Amount: Real);
begin
  inherited;
  edtTable.Edit;
  edtTable.FieldbyName('RTL_MONEY').AsFloat := edtTable.FieldbyName('AMOUNT').AsFloat*edtTable.FieldbyName('ORG_PRICE').AsFloat;
end;

procedure TfrmStkIndentOrder.AgioToCalc(Agio: Real);
begin
  inherited;
end;

procedure TfrmStkIndentOrder.AMoneyToCalc(AMoney: Real);
begin
  inherited;
end;

procedure TfrmStkIndentOrder.PriceToCalc(APrice: Real);
begin
  inherited;
end;

procedure TfrmStkIndentOrder.CheckInvaid;
begin
  if edtTable.State in [dsEdit,dsInsert] then edtTable.Post;
//  inherited;

end;

procedure TfrmStkIndentOrder.N3Click(Sender: TObject);
var frmStockOrderList:TfrmStockOrderList;
begin
  inherited;
  if dbState <> dsBrowse then Raise Exception.Create('请保存单据后再操作。');
  if not IsAudit then Raise Exception.Create('没有审核的单据不能入库..');
  if not frmMain.FindAction('actfrmStockOrderList').Enabled then Exit;
  frmMain.FindAction('actfrmStockOrderList').OnExecute(nil);
  frmStockOrderList := TfrmStockOrderList(frmMain.FindChildForm(TfrmStockOrderList));
  SendMessage(frmStockOrderList.Handle,WM_EXEC_ORDER,0,2);
  PostMessage(frmStockOrderList.CurOrder.Handle,WM_FILL_DATA,integer(self),0);
  inherited;
end;

procedure TfrmStkIndentOrder.N4Click(Sender: TObject);
var frmStockOrderList:TfrmStockOrderList;
begin
  inherited;
  if dbState <> dsBrowse then Raise Exception.Create('请保存单据后再操作。');
  if not IsAudit then Raise Exception.Create('没有审核的单据不能入库..');
  if not frmMain.FindAction('actfrmStockOrderList').Enabled then Exit;
  frmMain.FindAction('actfrmStockOrderList').OnExecute(nil);
  frmStockOrderList := TfrmStockOrderList(frmMain.FindChildForm(TfrmStockOrderList));
  SendMessage(frmStockOrderList.Handle,WM_EXEC_ORDER,0,2);
  PostMessage(frmStockOrderList.CurOrder.Handle,WM_FILL_DATA,integer(self),1);
  inherited;
end;

function TfrmStkIndentOrder.CheckInput: boolean;
begin
  result := not (pos(inttostr(InputFlag),'1248')>0);
end;

function TfrmStkIndentOrder.CheckCanExport: boolean;
begin
  result:=ShopGlobal.GetChkRight('11100001',7);
end;

procedure TfrmStkIndentOrder.SetdbState(const Value: TDataSetState);
begin
  inherited;
  FindColumn('FNSH_AMOUNT').Visible := (Value=dsBrowse);

end;

procedure TfrmStkIndentOrder.AddRecord(AObj: TRecord_; UNIT_ID: string;
  Located, IsPresent: boolean);
var
  Pt:integer;
  r:boolean;
begin
  if IsPresent then pt := 1 else pt := 0;
  if Located then
     begin
        if not gRepeat then
            begin
              r := edtTable.Locate('GODS_ID;IS_PRESENT',VarArrayOf([AObj.FieldbyName('GODS_ID').AsString,pt]),[]);
              if r then Exit;
            end;
        inc(RowID);
        if (edtTable.FieldbyName('GODS_ID').asString='') and (edtTable.FieldbyName('SEQNO').asString<>'') then
        edtTable.Edit else InitRecord;
        edtTable.FieldbyName('GODS_ID').AsString := AObj.FieldbyName('GODS_ID').AsString;
        edtTable.FieldbyName('GODS_NAME').AsString := AObj.FieldbyName('GODS_NAME').AsString;
        edtTable.FieldbyName('GODS_CODE').AsString := AObj.FieldbyName('GODS_CODE').AsString;
        edtTable.FieldByName('IS_PRESENT').asInteger := pt;
        if UNIT_ID='' then
           edtTable.FieldbyName('UNIT_ID').AsString := AObj.FieldbyName('UNIT_ID').AsString
        else
           edtTable.FieldbyName('UNIT_ID').AsString := UNIT_ID;
        edtTable.FieldbyName('BATCH_NO').AsString := '#';
     end;
  edtTable.Edit;
  edtTable.FieldbyName('BARCODE').AsString := EncodeBarcode;
  InitPrice(AObj.FieldbyName('GODS_ID').AsString,UNIT_ID);
end;

function TfrmStkIndentOrder.CheckRepeat(AObj: TRecord_;
  var pt: boolean): boolean;
var
  r,c:integer;
begin
  result := false;
  r := edtTable.FieldbyName('SEQNO').AsInteger;
  edtTable.DisableControls;
  try
    c := 0;
    edtTable.First;
    while not edtTable.Eof do
      begin
        if
           (edtTable.FieldbyName('GODS_ID').AsString = AObj.FieldbyName('GODS_ID').AsString)
           and
           (edtTable.FieldbyName('IS_PRESENT').AsString = AObj.FieldbyName('IS_PRESENT').AsString)
           and
           (edtTable.FieldbyName('SEQNO').AsInteger <> r)
        then
           begin
             inc(c);
             break;
           end;
        edtTable.Next;
      end;
    pt := false;
    if c>0 then
      begin
        if gRepeat and (MessageBox(Handle,pchar('"'+AObj.FieldbyName('GODS_NAME').asString+'('+AObj.FieldbyName('GODS_CODE').asString+')已经存在，是否继续添加赠品？'),'友情提示...',MB_YESNO+MB_ICONQUESTION)=6) then
           result := false else result := true;
      end;
  finally
    edtTable.Locate('SEQNO',r,[]);
    edtTable.EnableControls;
  end;
end;

procedure TfrmStkIndentOrder.RzBitBtn1Click(Sender: TObject);
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

procedure TfrmStkIndentOrder.WMFillData(var Message: TMessage);
var frmDemandOrder:TfrmDemandOrder;
    i:Integer;
begin
  if dbState <> dsInsert then Raise Exception.Create('不是在新增状态下不能完成操作!');
  frmDemandOrder := TfrmDemandOrder(Message.WParam);
  with TfrmDemandOrder(frmDemandOrder) do
  begin
    Self.edtSHOP_ID.KeyValue := edtSHOP_ID.KeyValue;
    Self.edtSHOP_ID.Text := edtSHOP_ID.Text;
    self.edtDEPT_ID.KeyValue := edtDEPT_ID.KeyValue;
    self.edtDEPT_ID.Text := edtDEPT_ID.Text;
    Self.edtINDE_DATE.Date := Global.SysDate;
    Self.edtREMARK.Text := edtREMARK.Text;
    Self.AObj.FieldByName('FIG_ID').AsString := AObj.FieldByName('DEMA_ID').AsString;
    Self.Locked := False;

    case Message.LParam of
    0:DemaFrom(AObj.FieldByName('DEMA_ID').AsString);
    1:begin
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
          InitPrice(edtTable.FieldbyName('GODS_ID').AsString,edtTable.FieldbyName('UNIT_ID').AsString);
          AmountToCalc(edtTable.FieldbyName('AMOUNT').AsCurrency);
          finally
            self.edtTable.EnableControls;
          end;
          self.Calc;
      end;
    end;
  end;

end;

procedure TfrmStkIndentOrder.DemaFrom(id: String);
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
      Params.ParamByName('DEMA_ID').asString := id;
      Factor.BeginBatch;
      try
        Factor.AddBatch(h,'TDemandOrderForDb',Params);
        Factor.AddBatch(d,'TDemandDataForDb',Params);
        Factor.OpenBatch;
        HObj.ReadFromDataSet(h);
        ReadFromObject(HObj,self);
        AObj.FieldbyName('FIG_ID').AsString := HObj.FieldbyName('DEMA_ID').AsString;
        edtDEMA_GLIDE_NO.Text := HObj.FieldbyName('GLIDE_NO').AsString;
        edtINDE_DATE.Date := Global.SysDate;
        edtCHK_DATE.Text := '';
        edtCHK_USER_TEXT.Text := '';

        ReadFrom(d);
        edtTable.First;
        while not edtTable.Eof do
        begin
          InitPrice(edtTable.FieldbyName('GODS_ID').AsString,edtTable.FieldbyName('UNIT_ID').AsString);
          AmountToCalc(edtTable.FieldbyName('AMOUNT').AsCurrency);
          edtTable.Next;
        end;
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

procedure TfrmStkIndentOrder.edtDEMA_GLIDE_NOPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  s:string;
  rs:TZQuery;
begin
  inherited;
  if not IsNull then Raise Exception.Create('已经输入商品了，不能导入补货单.');
  if dbState <> dsInsert then Raise Exception.Create('只有不是新增状态的单据不能导入补货单.');  
  s := TfrmFindOrder.FindDialog(self,5,edtSHOP_ID.asString,'');
  if s<>'' then
     begin
       rs := TZQuery.Create(nil);
       try
         rs.SQL.Text := ' select SHOP_ID from MKT_DEMANDORDER where TENANT_ID=:TENANT_ID and DEMA_ID=:DEMA_ID ';
         rs.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
         rs.ParamByName('DEMA_ID').AsString := s;
         Factor.Open(rs);
         if Copy(rs.FieldByName('SHOP_ID').AsString,length(rs.FieldByName('SHOP_ID').AsString)-3,length(rs.FieldByName('SHOP_ID').AsString)) <> '0001' then
            Raise Exception.Create('不是总店补货单,不能转为采购订单，请转调拨单!');
       finally
         rs.Free;
       end;
       DemaFrom(s);
     end;
end;

procedure TfrmStkIndentOrder.DBGridEh1Columns9UpdateData(Sender: TObject;
  var Text: String; var Value: Variant; var UseText, Handled: Boolean);
var
  r,SumMny:real;
  i:Integer;
  GodsId:String;
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
  //op := TColumnEh(Sender).Field.AsFloat;
  TColumnEh(Sender).Field.asFloat := r;
  edtTable.Post;
  edtTable.DisableControls;
  try
    i := DBGridEh1.Col;
    GodsId := edtTable.FieldByName('GODS_ID').AsString;
    edtTable.First;
    while not edtTable.Eof do
    begin
      SumMny := SumMny + edtTable.FieldByName('BOND_MNY').AsFloat;
      edtTable.Next;
    end;
    edtBOND_MNY.EditValue := SumMny;
    edtTable.Locate('GODS_ID',GodsId,[]);
    DBGridEh1.Col := i;
    DBGridEh1.SetFocus;
  finally
    edtTable.EnableControls;
  end;
  edtTable.Edit;
end;

end.
