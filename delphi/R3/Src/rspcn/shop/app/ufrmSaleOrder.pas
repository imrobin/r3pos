unit ufrmSaleOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmOrderForm, RzButton, RzPanel, cxTextEdit, cxDropDownEdit,
  cxCalendar, cxControls, cxContainer, cxEdit, cxMaskEdit, cxButtonEdit,
  zrComboBoxList, Grids, DBGridEh, StdCtrls, RzLabel, ExtCtrls, RzBmpBtn,
  RzBorder, RzTabs, RzStatus, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZBase, Math, Menus, pngimage, RzBckgnd, jpeg, dllApi, objCommon,
  PrnDbgeh,ufrmDBGridPreview, ComCtrls, ToolWin, ImgList, FR_Class, MPlayer;

type
  TfrmSaleOrder = class(TfrmOrderForm)
    TabSheet2: TRzTabSheet;
    cdsHeader: TZQuery;
    cdsDetail: TZQuery;
    cdsICGlide: TZQuery;
    Label1: TLabel;
    RzPanel11: TRzPanel;
    RzPanel14: TRzPanel;
    zrComboBoxList1: TzrComboBoxList;
    cxComboBox1: TcxComboBox;
    DBGridEh2: TDBGridEh;
    dsList: TDataSource;
    cdsList: TZQuery;
    rowToolNav: TRzToolbar;
    RzToolButton1: TRzToolButton;
    RzToolButton2: TRzToolButton;
    RzToolButton3: TRzToolButton;
    RzSpacer1: TRzSpacer;
    RzPanel19: TRzPanel;
    MarqueeStatus: TRzMarqueeStatus;
    edtBK_CLIENT_ID: TRzPanel;
    RzPanel21: TRzPanel;
    RzLabel1: TRzLabel;
    edtCLIENT_ID: TzrComboBoxList;
    edtBK_SALES_DATE: TRzPanel;
    RzPanel20: TRzPanel;
    RzLabel2: TRzLabel;
    edtSALES_DATE: TcxDateEdit;
    Image2: TImage;
    edtREMARK: TcxTextEdit;
    edtBK_GUIDE_USER: TRzPanel;
    RzPanel4: TRzPanel;
    RzLabel3: TRzLabel;
    edtGUIDE_USER: TzrComboBoxList;
    edtBK_ACCT_MNY: TRzPanel;
    RzPanel7: TRzPanel;
    edtACCT_MNY: TcxTextEdit;
    edtAGIO_RATE: TcxTextEdit;
    RzPanel8: TRzPanel;
    RzLabel5: TRzLabel;
    RzLabel4: TRzLabel;
    edtBK_PAY_TOTAL: TRzPanel;
    RzPanel10: TRzPanel;
    payment: TRzLabel;
    edtPAY_TOTAL: TcxTextEdit;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    RzLabel6: TRzLabel;
    RzPanel3: TRzPanel;
    RzPanel6: TRzPanel;
    RzPanel9: TRzPanel;
    RzLabel17: TRzLabel;
    dateFlag: TcxComboBox;
    D1: TcxDateEdit;
    RzPanel23: TRzPanel;
    RzPanel22: TRzPanel;
    RzLabel16: TRzLabel;
    D2: TcxDateEdit;
    btnFind: TRzBmpButton;
    RzPanel5: TRzPanel;
    Image1: TImage;
    Image6: TImage;
    Image7: TImage;
    serachText: TEdit;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel9: TRzLabel;
    RzLabel12: TRzLabel;
    RzLabel11: TRzLabel;
    RzLabel10: TRzLabel;
    RzLabel13: TRzLabel;
    RzLabel14: TRzLabel;
    RzLabel15: TRzLabel;
    PrintDBGridEh1: TPrintDBGridEh;
    frfSalesOrder: TfrReport;
    RzToolButton4: TRzToolButton;
    btnSave: TRzBmpButton;
    btnNew: TRzBmpButton;
    btnImport: TRzBmpButton;
    N7: TMenuItem;
    RzPanel13: TRzPanel;
    godsAmount: TRzPanel;
    N8: TMenuItem;
    N9: TMenuItem;
    procedure edtTableAfterPost(DataSet: TDataSet);
    procedure DBGridEh1Columns1BeforeShowControl(Sender: TObject);
    procedure DBGridEh1Columns5UpdateData(Sender: TObject;
      var Text: String; var Value: Variant; var UseText, Handled: Boolean);
    procedure DBGridEh1Columns6UpdateData(Sender: TObject;
      var Text: String; var Value: Variant; var UseText, Handled: Boolean);
    procedure DBGridEh1Columns8UpdateData(Sender: TObject;
      var Text: String; var Value: Variant; var UseText, Handled: Boolean);
    procedure btnSaveClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure PageControlChange(Sender: TObject);
    procedure btnNavClick(Sender: TObject);
    procedure dateFlagPropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure DBGridEh2DblClick(Sender: TObject);
    procedure DBGridEh2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure RzToolButton2Click(Sender: TObject);
    procedure RzToolButton3Click(Sender: TObject);
    procedure RzToolButton1Click(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure edtInputKeyPress(Sender: TObject; var Key: Char);
    procedure serachTextEnter(Sender: TObject);
    procedure serachTextExit(Sender: TObject);
    procedure edtTableAfterDelete(DataSet: TDataSet);
    procedure serachTextChange(Sender: TObject);
    procedure cdsListBeforeOpen(DataSet: TDataSet);
    procedure serachTextKeyPress(Sender: TObject; var Key: Char);
    procedure edtCLIENT_IDSaveValue(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure paymentClick(Sender: TObject);
    procedure frfSalesOrderGetValue(const ParName: String;
      var ParValue: Variant);
    procedure frfSalesOrderUserFunction(const Name: String; p1, p2,
      p3: Variant; var Val: Variant);
    procedure edtACCT_MNYKeyPress(Sender: TObject; var Key: Char);
    procedure edtAGIO_RATEKeyPress(Sender: TObject; var Key: Char);
    procedure edtPAY_TOTALKeyPress(Sender: TObject; var Key: Char);
    procedure RzToolButton4Click(Sender: TObject);
    procedure edtAGIO_RATEExit(Sender: TObject);
    procedure edtCLIENT_IDAddClick(Sender: TObject);
    procedure RzBmpButton4Click(Sender: TObject);
    procedure btnImportClick(Sender: TObject);
    procedure DBGridEh1Columns10UpdateData(Sender: TObject;
      var Text: String; var Value: Variant; var UseText, Handled: Boolean);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure fndGODS_IDSaveValue(Sender: TObject);
    procedure toolDeleteClick(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure DBGridEh1CellClick(Column: TColumnEh);
    procedure N9Click(Sender: TObject);
  private
    AObj:TRecord_;
    //默认发票类型
    DefInvFlag:integer;
    //普通税率
    RtlRate2:Currency;
    //增值税率
    RtlRate3:Currency;
    //结算金额
    TotalFee:Currency;
    //结算数量
    TotalAmt:Currency;
    //换购积分
    TotalBarter:integer;

    agioLower:Currency;
    //进位法则
    CarryRule:integer;
    //保留小数位
    Deci:integer;

    searchTxt:string;
  protected
    procedure SetdbState(const Value: TDataSetState);override;
    procedure PresentToCalc(Present:integer);override;
    procedure SetinputFlag(const Value: integer);override;
    procedure getGodsInfo(godsId:string);
    function  CheckSaleLimit: Boolean;
    function  checkPayment:boolean;
    function  payCashMny(s:string):boolean;
    procedure DoShowPayment;
    procedure Calc;override; //2011.06.09判断是否限量
    procedure InitPrice(GODS_ID,UNIT_ID:string);override;
    procedure PriceToGods(id:string);override;
    function  GetCostPrice(GODS_ID, BATCH_NO: string): real;
    //重读所有商品价格
    procedure CalcPrice;
    function  getPaymentTitle(pay:string):string;

    //快捷键
    function  doShortCut(s:string):boolean;override;
    procedure DoIsPresent(s:string);
    procedure DoCustId(s:string);override;
    procedure DoGuideUser(s:string);
    procedure DoNewOrder;
    procedure DoHangUp;
    procedure DoPickUp;
    procedure DoPayDibs(s:string);
    procedure DoPayInput(s:string;flag:string);
    procedure DoSaveOrder;
    procedure DBGridPrint;

    procedure BarcodeInput(_Buf:string);override;

    procedure ShowCgtPic(GodsId:string);

    function  GetCustIntegral:integer;
    function  CheckPriceLimit(r:real):integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure showForm;override;

    procedure AddRecord(AObj:TRecord_;UNIT_ID:string);override;

    procedure NewOrder;override;
    procedure EditOrder;override;
    procedure DeleteOrder;override;
    procedure SaveOrder;override;
    procedure CancelOrder;override;
    procedure Open(id:string);override;

    procedure PrintTicket;
    procedure PrintOrder;override;
    procedure PreviewOrder;override;

    procedure OpenList;
  end;

implementation

uses utokenFactory,udllDsUtil,udllShopUtil,uFnUtil,udllGlobal,udataFactory,
     uCacheFactory,ufrmSaveDesigner,ufrmPayMent,ufrmOrderPreview,uDevFactory,
     ufrmCustomerDialog,uCodePrinterFactory,ufrmCodeScan,uZebraPrinterFactory,
     uPlayerFactory,ufrmHangUpFile,ufrmCloseForDay;

{$R *.dfm}

procedure TfrmSaleOrder.Calc;
var
  r:integer;
  mny:Currency;
  ago:Currency;
  prf:Currency;
  t:integer;
  amt:Currency;
  ps:TZQuery;
  orgFee:Currency;
begin
  ps := dllGlobal.GetZQueryFromName('PUB_PRICEGRADE');
  if ps.Locate('PRICE_ID',AObj.FieldByName('PRICE_ID').AsString,[]) then
     begin
       t := ps.FieldByName('INTE_TYPE').AsInteger;
       amt := ps.FieldByName('INTE_AMOUNT').AsFloat;
     end
  else
     begin
       t := 0;
       amt := 0;
     end;
  edtTable.DisableControls;
  r := edtTable.FieldByName('SEQNO').AsInteger;
  try
    orgFee := TotalFee;
    TotalFee := 0;
    TotalAmt := 0;
    TotalBarter := 0;
    prf := 0;
    mny := 0;
    ago := 0;
    edtTable.First;
    while not edtTable.Eof do
      begin
        TotalFee := TotalFee + edtTable.FieldByName('CALC_MONEY').AsFloat;
        TotalAmt := TotalAmt + edtTable.FieldByName('AMOUNT').AsFloat;
        if (edtTable.FieldByName('HAS_INTEGRAL').AsInteger =1 ) and (edtTable.FieldByName('IS_PRESENT').AsInteger=0) then
        begin
        prf := prf + edtTable.FieldByName('CALC_MONEY').AsFloat-(edtTable.FieldByName('COST_PRICE').AsFloat*edtTable.FieldByName('CALC_AMOUNT').AsFloat);
        mny := mny + edtTable.FieldByName('AMONEY').AsFloat;
        ago := ago + edtTable.FieldByName('AGIO_MONEY').AsFloat;
        end;
        if edtTable.FieldByName('IS_PRESENT').AsInteger = 2 then
           TotalBarter := TotalBarter + trunc(edtTable.FieldByName('CALC_AMOUNT').AsFloat*edtTable.FieldByName('BARTER_INTEGRAL').AsFloat);
        edtTable.Next;
      end;
  finally
    edtTable.Locate('SEQNO',r,[]);
    edtTable.EnableControls;
  end;
  if (dbState<>dsBrowse) then
  begin
    if (amt<>0) then
       begin
         case t of
         1:AObj.FieldByName('INTEGRAL').AsInteger := trunc(TotalFee / amt);
         2:AObj.FieldByName('INTEGRAL').AsInteger := trunc(prf / amt);
         3:AObj.FieldByName('INTEGRAL').AsInteger := trunc(TotalAmt / amt);
         end;
       end;
       
    AObj.FieldByName('SALE_AMT').AsFloat := TotalAmt;
    AObj.FieldByName('SALE_MNY').AsFloat := TotalFee;
    if orgFee<>TotalFee then
    begin
      AObj.FieldByName('PAY_DIBS').AsFloat := 0;
      AObj.FieldByName('CASH_MNY').AsFloat := TotalFee;
      AObj.FieldByName('PAY_ZERO').AsFloat := 0;
    end;
{
    AObj.FieldByName('PAY_A').AsFloat := 0;
    AObj.FieldByName('PAY_B').AsFloat := 0;
    AObj.FieldByName('PAY_C').AsFloat := 0;
    AObj.FieldByName('PAY_D').AsFloat := 0;
    AObj.FieldByName('PAY_E').AsFloat := 0;
    AObj.FieldByName('PAY_F').AsFloat := 0;
    AObj.FieldByName('PAY_G').AsFloat := 0;
    AObj.FieldByName('PAY_H').AsFloat := 0;
    AObj.FieldByName('PAY_I').AsFloat := 0;
    AObj.FieldByName('PAY_J').AsFloat := 0;
}
    edtACCT_MNY.Text := FormatFloat('#0.00',TotalFee);
    edtAGIO_RATE.Text := '100.0';
    DoShowPayment;
    AObj.FieldByName('BARTER_INTEGRAL').AsInteger := TotalBarter;
  end;
  if dllGlobal.GetDoubleScreen = '2' then
     begin
       if not edtTable.IsEmpty then
          begin
            PlayerFactory.ResetCustomer;
            PlayerFactory.ShowGodsInfo(edtTable.FieldByName('GODS_NAME').AsString,
                                       edtTable.FieldByName('APRICE').AsString,
                                       FloatToStr(TotalFee-AObj.FieldByName('PAY_DIBS').AsFloat));
          end;
     end;
end;

procedure TfrmSaleOrder.CancelOrder;
begin
  if dbState = dsBrowse then Exit;
  if dbState = dsInsert then
     NewOrder
  else
     Open(AObj.FieldByName('SALES_ID').AsString);
end;

function TfrmSaleOrder.CheckSaleLimit: Boolean;
var
  CurIdx: integer;
  GodsId, RelationId: string;
  SingleLimit,AllLimit: real;  //单品限量，本单限量
  RsGods,RsRelation,GodsQry,RelQry: TZQuery;
begin
  result:=false;
  edtTable.DisableControls;
  CurIdx:=edtTable.RecNo;  //保存当前序号
  GodsQry:=TZQuery.Create(nil);  //本单商品汇总
  RelQry:=TZQuery.Create(nil);   //本单供应链汇总
  try
    GodsQry.Close;
    GodsQry.FieldDefs.Add('GODS_ID',ftstring,36,true);
    GodsQry.FieldDefs.Add('GODS_NAME',ftstring,50,true);
    GodsQry.FieldDefs.Add('CalcSum',ftFloat,0,true);
    GodsQry.CreateDataSet;
    RelQry.Close;
    RelQry.FieldDefs.Add('RELATION_ID',ftInteger,0,true);
    RelQry.FieldDefs.Add('RELATION_NAME',ftstring,50,true);
    RelQry.FieldDefs.Add('CalcSum',ftFloat,0,true);
    RelQry.CreateDataSet;
    RsGods:=dllGlobal.GetZQueryFromName('PUB_GOODSINFO'); //商品档案
    RsRelation:=dllGlobal.GetZQueryFromName('CA_RELATIONS'); //供应链
    //开始循环[累计出本单单品和供应链汇总数据]：
    edtTable.First;
    while not edtTable.Eof do
      begin
        GodsId:=trim(edtTable.FieldByName('GODS_ID').AsString);
        //单项目累计
        if GodsQry.Locate('GODS_ID',GodsId,[]) then //定位则累计数量
           begin
             GodsQry.Edit;
             GodsQry.FieldByName('CalcSum').AsFloat:=GodsQry.FieldByName('CalcSum').AsFloat+edtTable.FieldByName('CALC_AMOUNT').AsFloat;
             GodsQry.Post;
           end
        else
           begin
             GodsQry.Append;
             GodsQry.FieldByName('GODS_ID').AsString:=GodsId;
             GodsQry.FieldByName('GODS_NAME').AsString:=trim(edtTable.FieldByName('GODS_NAME').AsString);
             GodsQry.FieldByName('CalcSum').AsFloat:=edtTable.FieldByName('CALC_AMOUNT').AsFloat;
             GodsQry.Post;
           end;

        if RsGods.Locate('GODS_ID',GodsId,[]) then
           begin
             RelationId:=trim(RsGods.FieldByName('RELATION_ID').AsString);
             //单项目累计
             if RelQry.Locate('RELATION_ID',RelationId,[]) then //定位则累计数量
                begin
                  RelQry.Edit;
                  RelQry.FieldByName('CalcSum').AsFloat:=RelQry.FieldByName('CalcSum').AsFloat+edtTable.FieldByName('CALC_AMOUNT').AsFloat;
                  RelQry.Post;
                end
             else
                begin
                  RelQry.Append;
                  RelQry.FieldByName('RELATION_ID').AsString:=RelationId;
                  if RsRelation.Locate('RELATION_ID',RelationId,[]) then
                     RelQry.FieldByName('RELATION_NAME').AsString:=trim(RsRelation.FieldByName('RELATION_NAME').AsString);
                  RelQry.FieldByName('CalcSum').AsFloat:=edtTable.FieldByName('CALC_AMOUNT').AsFloat;
                  RelQry.Post;
                end;
           end;

        edtTable.Next;
      end;

    //判断单品是否超过
    GodsQry.First;
    while not GodsQry.Eof do
      begin
        GodsId:=trim(GodsQry.FieldByName('GODS_ID').AsString);
        if RsGods.Locate('GODS_ID',GodsId,[]) then
           begin
             RelationId:=trim(RsGods.FieldByName('RELATION_ID').AsString);
             if RsRelation.Locate('RELATION_ID',RelationId,[]) then
                begin
                  SingleLimit:=RsRelation.FieldByName('SINGLE_LIMIT').AsFloat; //单品限量
                  if (SingleLimit>0) and (GodsQry.FieldByName('CalcSum').AsFloat>SingleLimit) then
                     Raise Exception.Create('商品〖'+GodsQry.FieldByName('GODS_NAME').AsString+'〗数量'+FloattoStr(GodsQry.FieldByName('CalcSum').AsFloat)+'超过限量值'+FloattoStr(SingleLimit)+'！');
                end;
           end;
        GodsQry.Next;
      end;

    //判断供应链本单限量：
    RelQry.First;
    while not RelQry.Eof do
      begin
        RelationId:=trim(RelQry.FieldByName('RELATION_ID').AsString);
        if RsRelation.Locate('RELATION_ID',RelationId,[]) then
           begin
             AllLimit:=RsRelation.FieldByName('SALE_LIMIT').AsFloat; //本单限量
             if (AllLimit>0) and (RelQry.FieldByName('CalcSum').AsFloat>AllLimit) then
                Raise Exception.Create('供应链〖'+RelQry.FieldByName('RELATION_NAME').AsString+'〗本单总量'+FloattoStr(RelQry.FieldByName('CalcSum').AsFloat)+' 超过限量值'+FloattoStr(AllLimit)+'！');
           end;
        RelQry.Next;
      end;
  finally
    edtTable.RecNo:=CurIdx;
    GodsQry.Free;
    RelQry.Free;
    edtTable.EnableControls;
  end;
end;

constructor TfrmSaleOrder.Create(AOwner: TComponent);
begin
  inherited;
  defUnit := 1;
  AObj := TRecord_.Create;
  //进位法则
  CarryRule := StrtoIntDef(dllGlobal.GetParameter('CARRYRULE'),0);
  //保留小数位
  Deci := StrtoIntDef(dllGlobal.GetParameter('POSDIGHT'),2);
end;

procedure TfrmSaleOrder.DeleteOrder;
begin
  if cdsHeader.IsEmpty then Raise Exception.Create('不能删除空单据');
  if copy(cdsHeader.FieldByName('COMM').AsString,1,1)= '1' then Raise Exception.Create('已经同步的数据不能删除');
  if MessageBox(Handle,'是否真想删除当前单据?',pchar(Application.Title),MB_YESNO+MB_ICONQUESTION)<>6 then Exit;
  cdsHeader.Delete;
  cdsDetail.First;
  while not cdsDetail.Eof do cdsDetail.Delete;
  cdsICGlide.First;
  while not cdsICGlide.Eof do cdsICGlide.Delete;
  dataFactory.BeginBatch;
  try
    dataFactory.AddBatch(cdsHeader,'TSalesOrderV60');
    dataFactory.AddBatch(cdsDetail,'TSalesDataV60');
    dataFactory.AddBatch(cdsICGlide,'TSalesICDataV60');
    dataFactory.CommitBatch;
  except
    dataFactory.CancelBatch;
    cdsHeader.CancelUpdates;
    cdsDetail.CancelUpdates;
    cdsICGlide.CancelUpdates;
    Raise;
  end;
  cdsList.Delete;
  AObj.ReadFromDataSet(cdsHeader);
  ReadFromObject(AObj,self);
  ReadFrom(cdsDetail);
  dbState := dsBrowse;
  if dllGlobal.GetDoubleScreen = '2' then
     PlayerFactory.ResetScreen;
end;

destructor TfrmSaleOrder.Destroy;
begin
  AObj.Free;
  inherited;
end;

procedure TfrmSaleOrder.EditOrder;
begin
  inherited;
  if cdsHeader.IsEmpty then Raise Exception.Create('不能修改空单据');
  dbState := dsEdit;
  if edtInput.CanFocus and Visible then
     edtInput.SetFocus
  else
  if edtCLIENT_ID.CanFocus and Visible then
     edtCLIENT_ID.SetFocus;
end;

procedure TfrmSaleOrder.NewOrder;
begin
  inherited;
  godsAmount.Caption := godsAmount.Hint;
  Open('');
  dbState := dsInsert;
  AObj.FieldByName('TENANT_ID').AsString := token.tenantId;
  AObj.FieldByName('SHOP_ID').AsString := token.shopId;

  AObj.FieldByName('DEPT_ID').AsString := dllGlobal.getMyDeptId;

  AObj.FieldByName('SALES_ID').AsString := TSequence.NewId();
  AObj.FieldByName('UNION_ID').AsString := '#';
  AObj.FieldByName('PRICE_ID').AsString := '#';
  edtCLIENT_ID.KeyValue := '';
  edtCLIENT_ID.Text := '普通客户';
  AObj.FieldByName('SALE_AMT').AsFloat := 0;
  AObj.FieldByName('SALE_MNY').AsFloat := 0;
  AObj.FieldByName('CASH_MNY').AsFloat := 0;
  AObj.FieldByName('PAY_DIBS').AsFloat := 0;
  AObj.FieldByName('PAY_ZERO').AsFloat := 0;
  AObj.FieldByName('PAY_A').AsFloat := 0;
  AObj.FieldByName('PAY_B').AsFloat := 0;
  AObj.FieldByName('PAY_C').AsFloat := 0;
  AObj.FieldByName('PAY_D').AsFloat := 0;
  AObj.FieldByName('PAY_E').AsFloat := 0;
  AObj.FieldByName('PAY_F').AsFloat := 0;
  AObj.FieldByName('PAY_G').AsFloat := 0;
  AObj.FieldByName('PAY_H').AsFloat := 0;
  AObj.FieldByName('PAY_I').AsFloat := 0;
  AObj.FieldByName('PAY_J').AsFloat := 0;
  
  edtSALES_DATE.Date := dllGlobal.SysDate;

  AObj.FieldByName('PLAN_DATE').AsString := formatdatetime('YYYYMMDD',dllGlobal.SysDate);

  edtGUIDE_USER.KeyValue := token.userId;
  edtGUIDE_USER.Text := token.username;

  AObj.FieldByName('INVOICE_FLAG').AsInteger := DefInvFlag;
  case DefInvFlag of
  1: AObj.FieldByName('TAX_RATE').AsFloat := 0;
  2: AObj.FieldByName('TAX_RATE').AsFloat := RtlRate2;
  3: AObj.FieldByName('TAX_RATE').AsFloat := RtlRate3;
  end;
  InitRecord;
  if edtInput.CanFocus and Visible then
     edtInput.SetFocus
  else
  if edtCLIENT_ID.CanFocus and Visible then
     edtCLIENT_ID.SetFocus;
end;

procedure TfrmSaleOrder.Open(id: string);
var Params:TftParamList;
begin
  inherited;
//  if id='' then dataFactory.MoveToSqlite else dataFactory.MoveToDefault;
  Params := TftParamList.Create(nil);
  try
    Params.ParamByName('TENANT_ID').AsInteger := StrtoInt(token.tenantId);
    Params.ParamByName('SALES_ID').AsString := id;
    Params.ParamByName('VIW_GOODSINFO').AsString := dllGlobal.GetViwGoodsInfo('TENANT_ID,GODS_ID,GODS_CODE,GODS_NAME,BARCODE',true);
    dataFactory.BeginBatch;
    try
      dataFactory.AddBatch(cdsHeader,'TSalesOrderV60',Params);
      dataFactory.AddBatch(cdsDetail,'TSalesDataV60',Params);
      dataFactory.AddBatch(cdsICGlide,'TSalesICDataV60',Params);
      dataFactory.OpenBatch;
    except
      dataFactory.CancelBatch;
      Raise;
    end;
    AObj.ReadFromDataSet(cdsHeader);
    dbState := dsBrowse; 
    ReadFromObject(AObj,self);
    ReadFrom(cdsDetail);
    Calc;
    if not cdsHeader.IsEmpty and (cdsHeader.FieldByName('CLIENT_ID').AsString='') then edtCLIENT_ID.Text := '普通客户';
    DoShowPayment;
  finally
    dataFactory.MoveToDefault;
    Params.Free;
  end;
end;

procedure TfrmSaleOrder.SaveOrder;
var
  ps:TZQuery;
  PriceName:string;
begin
  if dbState = dsBrowse then Exit;
  if dllGlobal.GetParameter('GUIDE_USER')='0' then
  begin
     if edtGUIDE_USER.AsString='' then
        Raise Exception.Create('请输入业务员再保存！');
  end;

  if edtSALES_DATE.EditValue = null then Raise Exception.Create('销售日期不能为空');

  CheckSaleLimit;

  ClearInvaid;
  if edtTable.IsEmpty then Raise Exception.Create('不能保存一张空单据...');
  CheckInvaid;
  WriteToObject(AObj,self);

  AObj.FieldByName('SALES_TYPE').AsInteger := 4;
  AObj.FieldByName('CREA_DATE').AsString := formatdatetime('YYYY-MM-DD HH:NN:SS',now());
  AObj.FieldByName('CREA_USER').AsString := token.userId;
  AObj.FieldByName('CHK_DATE').AsString := formatdatetime('YYYY-MM-DD',dllGlobal.SysDate);
  AObj.FieldByName('CHK_USER').AsString := token.userId;
  AObj.FieldByName('LOCUS_STATUS').AsString := '3';
  if not checkPayment then Exit;

  if (AObj.FieldByName('BARTER_INTEGRAL').AsFloat<>0) and (AObj.FieldByName('CLIENT_ID').AsString='') then Raise Exception.Create('不是会员消费，不能有积分兑换的商品.');

  dataFactory.BeginBatch;
  try
    cdsHeader.Edit;
    AObj.WriteToDataSet(cdsHeader);
    cdsHeader.Post;
    WriteTo(cdsDetail);
    cdsDetail.First;
    while not cdsDetail.Eof do
       begin
         cdsDetail.Edit;
         cdsDetail.FieldByName('TENANT_ID').AsInteger := cdsHeader.FieldByName('TENANT_ID').AsInteger;
         cdsDetail.FieldByName('SHOP_ID').AsString := cdsHeader.FieldByName('SHOP_ID').AsString;
         cdsDetail.FieldByName('SALES_ID').AsString := cdsHeader.FieldByName('SALES_ID').AsString;
         cdsDetail.Post;
         cdsDetail.Next;
       end;
    dataFactory.AddBatch(cdsHeader,'TSalesOrderV60');
    dataFactory.AddBatch(cdsDetail,'TSalesDataV60');
    dataFactory.AddBatch(cdsICGlide,'TSalesICDataV60');
    dataFactory.CommitBatch;
  except
    dataFactory.CancelBatch;
    cdsHeader.CancelUpdates;
    cdsDetail.CancelUpdates;
    cdsICGlide.CancelUpdates;
    Raise;
  end;
  dbState := dsBrowse;
  if DevFactory.SaveCodePrint then  
    case DevFactory.SaveCodePrintType of
      0: CodePrinterFactory.PrintCode(cdsDetail.Data,self.Handle);
      1: ZebraPrinterFactory.PrintCode(cdsDetail.Data,self.Handle,DevFactory.SaveCodePrintName);
    end;
  DevFactory.OpenCashBox(self.Font);
  if DevFactory.SavePrint then
     begin
       DevFactory.PrintSaleTicket(token.tenantId,AObj.FieldByName('SALES_ID').AsString,self.Font);
     end;
  if dllGlobal.GetDoubleScreen = '2' then
     begin
       PlayerFactory.TimerResetScreen;
       if AObj.FieldByName('CLIENT_ID').AsString <> '' then
          begin
            ps := dllGlobal.GetZQueryFromName('PUB_PRICEGRADE');
            if ps.Locate('PRICE_ID',AObj.FieldByName('PRICE_ID').AsString,[]) then
               begin
                 PriceName := ps.FieldByName('PRICE_NAME').AsString;
               end
            else
               begin
                 PriceName := '普通客户';
               end;
            PlayerFactory.SetCustomerInfo(AObj.FieldByName('CLIENT_CODE').AsString,
                                          AObj.FieldByName('CLIENT_ID_TEXT').AsString,
                                          PriceName,
                                          inttostr(AObj.FieldByName('INTEGRAL').AsInteger
                                                    + AObj.FieldByName('ACCU_INTEGRAL').AsInteger
                                                    - AObj.FieldByName('BARTER_INTEGRAL').AsInteger));
          end;
     end;
end;

procedure TfrmSaleOrder.edtTableAfterPost(DataSet: TDataSet);
begin
  inherited;
  if not edtTable.ControlsDisabled then Calc;
end;

procedure TfrmSaleOrder.showForm;
begin
  inherited;
  RtlRate2 := StrtoFloatDef(dllGlobal.GetParameter('RTL_RATE2'),0.05);
  RtlRate3 := StrtoFloatDef(dllGlobal.GetParameter('RTL_RATE3'),0.17);
  DefInvFlag := StrtoIntDef(dllGlobal.GetParameter('RTL_INV_FLAG'),1);
  edtCLIENT_ID.DataSet := dllGlobal.GetZQueryFromName('PUB_CUSTOMER');
  edtGUIDE_USER.DataSet := dllGlobal.GetZQueryFromName('CA_USERS');
  NewOrder;
  if dllGlobal.GetDoubleScreen = '2' then PlayerFactory.SetFocusHwnd(self.Handle);
end;

procedure TfrmSaleOrder.DBGridEh1Columns1BeforeShowControl(
  Sender: TObject);
begin
  inherited;
  fndGODS_ID.Text := edtTable.FieldByName('GODS_NAME').AsString;
  fndGODS_ID.KeyValue := edtTable.FieldByName('GODS_ID').AsString;
  fndGODS_ID.SaveStatus;
end;

procedure TfrmSaleOrder.DBGridEh1Columns5UpdateData(Sender: TObject;
  var Text: String; var Value: Variant; var UseText, Handled: Boolean);
var r:Currency;
begin
  if length(Text)>10 then
     begin
       Text := TColumnEh(Sender).Field.AsString;
       Value := TColumnEh(Sender).Field.AsFloat;
       Exit;
     end;

  if edtTable.FieldByName('GODS_ID').AsString = '' then
     begin
       Text := '';
       Value := null;
       FocusNextColumn;
       Exit;
     end;

  if PropertyEnabled then
     begin
       Text := TColumnEh(Sender).Field.AsString;
       Value := TColumnEh(Sender).Field.AsFloat;
     end
  else
     begin
        try
          if Text='' then
             r := 0
          else
             r := StrtoFloat(Text);
          if abs(r)>999999 then Raise Exception.Create('输入的数值过大，无效');
        except
          if length(Text)<10 then MessageBox(handle,'您输入的数量无效，请重新输入','友情提示..',MB_OK+MB_ICONINFORMATION);
          Text := TColumnEh(Sender).Field.AsString;
          Value := TColumnEh(Sender).Field.AsFloat;
          Exit;
        end;
        TColumnEh(Sender).Field.AsFloat := r;
        AMountToCalc(r);
     end;
end;

procedure TfrmSaleOrder.DBGridEh1Columns6UpdateData(Sender: TObject;
  var Text: String; var Value: Variant; var UseText, Handled: Boolean);
var
  limit:integer;
  r,op:Currency;
  allow:boolean;
  bs:TZQuery;
begin
  if length(Text)>10 then
     begin
       Text := TColumnEh(Sender).Field.AsString;
       Value := TColumnEh(Sender).Field.AsFloat;
       Exit;
     end;

  if edtTable.FieldByName('GODS_ID').AsString = '' then
     begin
       Text := '';
       Value := null;
       FocusNextColumn;
       Exit;
     end;

  if edtTable.FieldByName('IS_PRESENT').AsInteger = 1 then
     begin
       Value := TColumnEh(Sender).Field.AsFloat;
       Text := TColumnEh(Sender).Field.AsString;
       MessageBox(Handle,pchar('商品〖'+edtTable.FieldByName('GODS_NAME').AsString+'〗已经赠送，不允许修改单价！'),pchar(Application.Title),MB_OK+MB_ICONINFORMATION);
       Exit;
     end;

  //供应链限制改价：
  if dllGlobal.GetChangePrice(edtTable.FieldByName('GODS_ID').AsString) = '2' then
     begin
       Value := TColumnEh(Sender).Field.AsFloat;
       Text := TColumnEh(Sender).Field.AsString;
       MessageBox(Handle,pchar('商品〖'+edtTable.FieldByName('GODS_NAME').AsString+'〗统一定价，不允许修改单价！'),pchar(Application.Title),MB_OK+MB_ICONINFORMATION);
       Exit;
     end;

  //调价权限(调价权限)
  if not dllGlobal.GetChkRight('12400001',5) then
     allow := false
  else
     allow := true;

  if allow then
  begin
    try
      if Text='' then
         r := 0
      else
         r := StrtoFloat(Text);
      if abs(r)>999999 then Raise Exception.Create('输入的数值过大，无效');
    except
      if length(Text)<10 then  MessageBox(Handle,pchar('您输入的单价无效，请重新输入'),pchar(Application.Title),MB_OK+MB_ICONINFORMATION);
      Text := TColumnEh(Sender).Field.AsString;
      Value := TColumnEh(Sender).Field.AsFloat;
      Exit;
    end;

   //供应链限制改价：
   if dllGlobal.GetChangePrice(edtTable.FieldByName('GODS_ID').AsString) = '3' then
      begin
        limit := CheckPriceLimit(r);
        if limit > 0 then
           begin
             MessageBox(Handle,pchar('单价不能高于指导零售价，请重新输入'),pchar(Application.Title),MB_OK+MB_ICONINFORMATION);
             Text := TColumnEh(Sender).Field.AsString;
             Value := TColumnEh(Sender).Field.AsFloat;
             Exit;
           end;
        if limit < 0 then
           begin
             MessageBox(Handle,pchar('单价不能低于进价，请重新输入'),pchar(Application.Title),MB_OK+MB_ICONINFORMATION);
             Text := TColumnEh(Sender).Field.AsString;
             Value := TColumnEh(Sender).Field.AsFloat;
             Exit;
           end;
      end;

    op := TColumnEh(Sender).Field.AsFloat;
    TColumnEh(Sender).Field.AsFloat := r;
    PriceToCalc(r);
    if edtTable.FieldByName('AGIO_RATE').AsFloat < agioLower then
       begin
         edtTable.Edit;
         edtTable.FieldByName('APRICE').AsFloat := op;
         PriceToCalc(edtTable.FieldByName('APRICE').AsFloat);
         Text := TColumnEh(Sender).Field.AsString;
         Value := TColumnEh(Sender).Field.AsFloat;
         edtTable.Edit;
         MessageBox(Handle,pchar('调价最低不能低于'+FormatFloat('#0.000',agioLower)+'%折'),pchar(Application.Title),MB_OK+MB_ICONINFORMATION);
         Exit;
       end;
    bs := dllGlobal.GetZQueryFromName('PUB_GOODSINFO');
    if bs.Locate('GODS_ID',edtTable.FieldByName('GODS_ID').AsString,[]) and (edtTable.FieldByName('CALC_AMOUNT').AsCurrency<>0) then
       begin
         if RoundTo(edtTable.FieldByName('CALC_MONEY').AsCurrency/edtTable.FieldByName('CALC_AMOUNT').AsCurrency,-3)<bs.FieldByName('NEW_LOWPRICE').AsCurrency then
         begin
           edtTable.Edit;
           edtTable.FieldByName('APRICE').AsFloat := op;
           PriceToCalc(op);
           Text := TColumnEh(Sender).Field.AsString;
           Value := TColumnEh(Sender).Field.AsFloat;
           edtTable.Edit;
           MessageBox(Handle,pchar('调价最低不能低于'+FormatFloat('#0.000',bs.FieldByName('NEW_LOWPRICE').AsFloat)+'元'),pchar(Application.Title),MB_OK+MB_ICONINFORMATION);
           Exit;
         end;
       end;
    edtTable.Edit;
    edtTable.FieldByName('POLICY_TYPE').AsInteger := 4;
  end
  else
  begin
    Value := TColumnEh(Sender).Field.AsFloat;
    Text := TColumnEh(Sender).Field.AsString;
    MessageBox(Handle,pchar('你没有修改销售单价格的权限,请和管理员联系...'),pchar(Application.Title),MB_OK+MB_ICONINFORMATION);
  end;
end;

procedure TfrmSaleOrder.DBGridEh1Columns8UpdateData(Sender: TObject;
  var Text: String; var Value: Variant; var UseText, Handled: Boolean);
var
  bs:TZQuery;
  limit:integer;
  r,op:Currency;
  allow :boolean;
begin
  if length(Text)>10 then
     begin
       Text := TColumnEh(Sender).Field.AsString;
       Value := TColumnEh(Sender).Field.AsFloat;
       Exit;
     end;

  if edtTable.FieldByName('GODS_ID').AsString = '' then
     begin
       Text := '';
       Value := null;
       FocusNextColumn;
       Exit;
     end;

  if edtTable.FieldByName('IS_PRESENT').AsInteger = 1 then
     begin
       Value := TColumnEh(Sender).Field.AsFloat;
       Text := TColumnEh(Sender).Field.AsString;
       MessageBox(Handle,pchar('商品〖'+edtTable.FieldByName('GODS_NAME').AsString+'〗已经赠送，不允许修改单价！'),pchar(Application.Title),MB_OK+MB_ICONINFORMATION);
       Exit;
     end;

  //2011.06.08 Add 供应链限制改价：
  if dllGlobal.GetChangePrice(edtTable.FieldByName('GODS_ID').AsString) = '2' then
     begin
       Value := TColumnEh(Sender).Field.AsFloat;
       Text := TColumnEh(Sender).Field.AsString;
       MessageBox(Handle,pchar('商品〖'+edtTable.FieldByName('GODS_NAME').AsString+'〗统一定价，不允许修改折扣！'),pchar(Application.Title),MB_OK+MB_ICONINFORMATION);
       Exit;
     end;

  if not dllGlobal.GetChkRight('12400001',5) then
     allow := false
  else
     allow := true;

  if allow then
  begin
    try
      if Text='' then
         r := 0
      else
         r := StrtoFloat(Text);
      if abs(r)>100 then Raise Exception.Create('输入的数值过大，无效');
      edtTable.Edit;
    except
      on E:Exception do
         begin
            Text := TColumnEh(Sender).Field.AsString;
            Value := TColumnEh(Sender).Field.AsFloat;
            MessageBox(Handle,pchar('输入无效折扣率,错误：'+E.Message),pchar(Application.Title),MB_OK+MB_ICONINFORMATION);
            Exit;
         end;
    end;
    op := edtTable.FieldByName('APRICE').AsFloat;
    TColumnEh(Sender).Field.AsFloat := r;
    AgioToCalc(r);

    if edtTable.FieldByName('AGIO_RATE').AsFloat < agioLower then
       begin
         edtTable.Edit;
         edtTable.FieldByName('APRICE').AsFloat := op;
         PriceToCalc(edtTable.FieldByName('APRICE').AsFloat);
         Text := TColumnEh(Sender).Field.AsString;
         Value := TColumnEh(Sender).Field.AsFloat;
         edtTable.Edit;
         MessageBox(Handle,pchar('调价最低不能低于'+FormatFloat('#0.000',agioLower)+'%折'),pchar(Application.Title),MB_OK+MB_ICONINFORMATION);
         Exit;
       end;
    bs := dllGlobal.GetZQueryFromName('PUB_GOODSINFO');
    if bs.Locate('GODS_ID',edtTable.FieldByName('GODS_ID').AsString,[]) and (edtTable.FieldByName('CALC_AMOUNT').AsCurrency<>0) then
       begin
         if RoundTo(edtTable.FieldByName('CALC_MONEY').AsCurrency/edtTable.FieldByName('CALC_AMOUNT').AsCurrency,-3)<bs.FieldByName('NEW_LOWPRICE').AsCurrency then
         begin
           edtTable.Edit;
           edtTable.FieldByName('APRICE').AsFloat := op;
           PriceToCalc(op);
           Text := TColumnEh(Sender).Field.AsString;
           Value := TColumnEh(Sender).Field.AsFloat;
           edtTable.Edit;
           MessageBox(Handle,pchar('调价最低不能低于'+FormatFloat('#0.000',bs.FieldByName('NEW_LOWPRICE').AsFloat)+'元'),pchar(Application.Title),MB_OK+MB_ICONINFORMATION);
           Exit;
         end;
       end;

    if dllGlobal.GetChangePrice(edtTable.FieldByName('GODS_ID').AsString) = '3' then
       begin
         limit := CheckPriceLimit(edtTable.FieldByName('APRICE').AsFloat);
         if limit <> 0 then
            begin
              edtTable.Edit;
              edtTable.FieldByName('APRICE').AsFloat := op;
              PriceToCalc(edtTable.FieldByName('APRICE').AsFloat);
              Text := TColumnEh(Sender).Field.AsString;
              Value := TColumnEh(Sender).Field.AsFloat;
              if limit > 0 then
                 MessageBox(Handle,pchar('单价不能高于指导零售价，请重新输入'),pchar(Application.Title),MB_OK+MB_ICONINFORMATION);
              if limit < 0 then
                 MessageBox(Handle,pchar('单价不能低于进价，请重新输入'),pchar(Application.Title),MB_OK+MB_ICONINFORMATION);
              Exit;
            end;
       end;

    edtTable.Edit;
    edtTable.FieldByName('POLICY_TYPE').AsInteger := 4;
  end
  else
  begin
    Value := TColumnEh(Sender).Field.AsFloat;
    Text := TColumnEh(Sender).Field.AsString;
    MessageBox(Handle,pchar('你没有修改销售单价格的权限,请和管理员联系...'),pchar(Application.Title),MB_OK+MB_ICONINFORMATION);
  end;
end;

procedure TfrmSaleOrder.btnSaveClick(Sender: TObject);
begin
  inherited;
  case dbState of
  dsBrowse:begin
      NewOrder;
    end;
  else
    begin
      SaveOrder;
      if dllGlobal.GetChkRight('12400001',2) and (MessageBox(Handle,'是否继续新增销售单？',pchar(Application.Title),MB_YESNO+MB_ICONINFORMATION)=6) then
         NewOrder
      else
         Open(AObj.FieldByName('SALES_ID').AsString);
    end;
  end;
end;

function TfrmSaleOrder.GetCostPrice(GODS_ID,BATCH_NO: string): real;
var
  rs:TZQuery;
  bs:TZQuery;
begin
  Exit;
  rs:=TZQuery.Create(nil);
  try
    rs.SQL.Text :=
      'select AMONEY,AMOUNT from ('+
      'select sum(AMONEY) as AMONEY,sum(AMOUNT) as AMOUNT from STO_STORAGE where TENANT_ID=:TENANT_ID and SHOP_ID=:SHOP_ID and GODS_ID=:GODS_ID and BATCH_NO=:BATCH_NO ) j where round(AMOUNT,3)<>0';
    rs.ParamByName('TENANT_ID').AsString := token.tenantId;
    rs.ParamByName('SHOP_ID').AsString := token.shopId;
    rs.ParamByName('GODS_ID').AsString := GODS_ID;
    rs.ParamByName('BATCH_NO').AsString := BATCH_NO;
    dataFactory.Open(rs);
    if rs.IsEmpty then
       begin
         bs := dllGlobal.GetZQueryFromName('PUB_GOODSINFO');
         if bs.Locate('GODS_ID',GODS_ID,[]) then
            result := bs.FieldByName('NEW_INPRICE').AsFloat
         else
            Raise Exception.Create('没找到经营商品');
       end
    else
       result := rs.Fields[0].AsFloat/rs.Fields[1].AsFloat;
  finally
    rs.Free;
  end;
end;

procedure TfrmSaleOrder.InitPrice(GODS_ID, UNIT_ID: string);
var
  rs,bs:TZQuery;
  Params:TftParamList;
begin
  rs := TZQuery.Create(nil);
  bs := dllGlobal.GetZQueryFromName('PUB_GOODSINFO');
  if not bs.Locate('GODS_ID',GODS_ID,[]) then Raise Exception.Create('缓冲数据集中没找到当前商品...');
  Params := TftParamList.Create(nil);
  try
    Params.ParamByName('CarryRule').asInteger := CarryRule;
    Params.ParamByName('Deci').asInteger := Deci;
    Params.ParamByName('CLIENT_ID').AsString := edtCLIENT_ID.AsString;
    Params.ParamByName('TENANT_ID').AsString := token.tenantId;
    Params.ParamByName('SHOP_ID').AsString := token.shopId;
    Params.ParamByName('GODS_ID').AsString := GODS_ID;
    if AObj.FieldByName('PRICE_ID').AsString='' then
    Params.ParamByName('PRICE_ID').AsString := '#' else
    Params.ParamByName('PRICE_ID').AsString := AObj.FieldByName('PRICE_ID').AsString;
    Params.ParamByName('UNIT_ID').AsString := UNIT_ID;
    dataFactory.MoveToSqlite;
    try
      dataFactory.Open(rs,'TGetSalesPrice',Params);
    finally
      dataFactory.MoveToDefault;
    end;
    if not (edtTable.State in [dsEdit,dsInsert]) then edtTable.Edit;
    edtTable.FieldByName('APRICE').AsFloat := rs.FieldByName('V_APRICE').AsFloat;
    edtTable.FieldByName('ORG_PRICE').AsFloat := rs.FieldByName('V_ORG_PRICE').AsFloat;
    edtTable.FieldByName('COST_PRICE').AsFloat := bs.FieldByName('NEW_INPRICE').AsFloat;// GetCostPrice(GODS_ID,edtTable.FieldByName('BATCH_NO').AsString);
    edtTable.FieldByName('POLICY_TYPE').AsInteger := rs.FieldByName('V_POLICY_TYPE').AsInteger;
    edtTable.FieldByName('HAS_INTEGRAL').AsInteger := rs.FieldByName('V_HAS_INTEGRAL').AsInteger;
    //看是否换购商品
    if bs.FieldByName('USING_BARTER').AsInteger=3 then
       begin
         edtTable.FieldByName('IS_PRESENT').AsInteger := 2;
         edtTable.FieldByName('GODS_NAME').AsString := '【兑换】'+bs.FieldByName('GODS_NAME').AsString;
         edtTable.FieldByName('BARTER_INTEGRAL').AsInteger := bs.FieldByName('BARTER_INTEGRAL').AsInteger;
       end
    else
       begin
         edtTable.FieldByName('IS_PRESENT').AsInteger := 0;
         edtTable.FieldByName('BARTER_INTEGRAL').AsInteger := 0;
       end;
    case DefInvFlag of
    1: edtTable.FieldByName('TAX_RATE').AsFloat := 0;
    2: edtTable.FieldByName('TAX_RATE').AsFloat := RtlRate2;
    3: edtTable.FieldByName('TAX_RATE').AsFloat := RtlRate3;
    end;
  finally
    Params.Free;
    rs.Free;
  end;
  getGodsInfo(edtTable.FieldByName('GODS_ID').AsString);
end;

function TfrmSaleOrder.checkPayment:boolean;
var fee,allFee,payDibs,salMny:currency;
begin
  fee :=
    AObj.FieldByName('PAY_B').AsFloat+
    AObj.FieldByName('PAY_C').AsFloat+
    AObj.FieldByName('PAY_E').AsFloat+
    AObj.FieldByName('PAY_F').AsFloat+
    AObj.FieldByName('PAY_G').AsFloat+
    AObj.FieldByName('PAY_H').AsFloat+
    AObj.FieldByName('PAY_I').AsFloat+
    AObj.FieldByName('PAY_J').AsFloat;

  payDibs := AObj.FieldByName('PAY_DIBS').AsFloat;
  salMny := AObj.FieldByName('SALE_MNY').AsFloat;

  case InputFlag of
  13,14:
     begin
       if (TotalFee-payDibs)-fee=0 then
       edtInput.Text := '' else
       edtInput.Text := FormatFloat('#0.00',(TotalFee-payDibs)-fee);
     end
  else
     begin
{
       if dbState = dsInsert then
          allFee := fee
       else
          allFee := fee + AObj.FieldByName('PAY_A').AsFloat;
}
       allFee := fee;

       if abs(allFee)>abs(TotalFee-payDibs) then
          begin
            Raise Exception.Create('你已经超额支付了,请正确输入收款金额');
          end;
          
       if fee=0 then
          AObj.FieldByName('PAY_A').AsFloat := (TotalFee-payDibs)-AObj.FieldByName('PAY_D').AsFloat
       else
          AObj.FieldByName('PAY_A').AsFloat := (TotalFee-payDibs)-fee-AObj.FieldByName('PAY_D').AsFloat;

       if AObj.FieldByName('CASH_MNY').AsFloat=0 then AObj.FieldByName('CASH_MNY').AsFloat := AObj.FieldByName('PAY_A').AsFloat;

       AObj.FieldByName('PAY_ZERO').AsFloat := AObj.FieldByName('CASH_MNY').AsFloat-AObj.FieldByName('PAY_A').AsFloat;

       MarqueeStatus.Caption := '实收:'+FormatFloat('#0.00',AObj.FieldByName('CASH_MNY').AsFloat)+'  找零:'+FormatFloat('#0.0',AObj.FieldByName('PAY_ZERO').AsFloat);

       if dllGlobal.GetDoubleScreen = '2' then
          begin
            PlayerFactory.ShowOddChange(FloatToStr(TotalFee-payDibs),FloatToStr(AObj.FieldByName('CASH_MNY').AsFloat),FormatFloat('#0.0',AObj.FieldByName('PAY_ZERO').AsFloat));
          end;
     end;
  end;
  result := true;
end;

procedure TfrmSaleOrder.DoShowPayment;
var
  fee,payDibs,salMny:currency;
  s,payInfo:string;
  w:integer;
begin
  fee :=
    AObj.FieldByName('PAY_B').AsFloat+
    AObj.FieldByName('PAY_C').AsFloat+
    // AObj.FieldByName('PAY_D').AsFloat+
    AObj.FieldByName('PAY_E').AsFloat+
    AObj.FieldByName('PAY_F').AsFloat+
    AObj.FieldByName('PAY_G').AsFloat+
    AObj.FieldByName('PAY_H').AsFloat+
    AObj.FieldByName('PAY_I').AsFloat+
    AObj.FieldByName('PAY_J').AsFloat;
  payDibs := AObj.FieldByName('PAY_DIBS').AsFloat;
  salMny := AObj.FieldByName('SALE_MNY').AsFloat;
  case dbState of
  dsBrowse:begin
      edtPAY_TOTAL.Text := FormatFloat('#0.00',fee+AObj.FieldByName('PAY_A').AsFloat);
      edtACCT_MNY.Text := FormatFloat('#0.00',(TotalFee-payDibs));
      if TotalFee<>0 then
         edtAGIO_RATE.Text := FormatFloat('#0.0',(TotalFee-payDibs)*100/TotalFee)
      else
         edtAGIO_RATE.Text := '';
    end;
  else
    begin
      if (fee=0) and (fnNumber.CompareFloat(AObj.FieldByName('PAY_A').AsFloat,0)=0) then
         begin
           edtPAY_TOTAL.Text := FormatFloat('#0.00',(TotalFee-payDibs)-AObj.FieldByName('PAY_D').AsFloat);
         end
      else
         edtPAY_TOTAL.Text := FormatFloat('#0.00',fee+AObj.FieldByName('PAY_A').AsFloat);
      edtACCT_MNY.Text := FormatFloat('#0.00',(TotalFee-payDibs));
      if TotalFee<>0 then
         edtAGIO_RATE.Text := FormatFloat('#0.0',(TotalFee-payDibs)*100/TotalFee)
      else
         edtAGIO_RATE.Text := '';
      if inputFlag in [13,14] then
         edtInput.Text := FormatFloat('#0.00#',(TotalFee-payDibs)-(fee+AObj.FieldByName('PAY_A').AsFloat));
    end;
  end;
  s := '0000000000';
  w := 0;
  payInfo := '';
  payment.Caption := '本次收款';

  if fee=0 then
     AObj.FieldByName('PAY_A').AsFloat := (TotalFee-payDibs)-AObj.FieldByName('PAY_D').AsFloat
  else
     AObj.FieldByName('PAY_A').AsFloat := (TotalFee-payDibs)-fee-AObj.FieldByName('PAY_D').AsFloat;

  AObj.FieldByName('CASH_MNY').AsFloat := AObj.FieldByName('PAY_A').AsFloat;

  if AObj.FieldByName('PAY_A').AsFloat<>0 then
     begin
       s[1] := '1';
       payment.Caption := '现金收款';
       inc(w);
       payInfo := payInfo +'现金:'+FormatFloat('#0.0#',AObj.FieldByName('PAY_A').AsFloat)+ ' ';
     end;
  if AObj.FieldByName('PAY_B').AsFloat<>0 then
     begin
       s[2] := '1';
       payment.Caption := getPaymentTitle('B')+'收款';
       inc(w);
       payInfo := payInfo +getPaymentTitle('B')+':'+FormatFloat('#0.0#',AObj.FieldByName('PAY_B').AsFloat)+ ' ';
     end;
  if AObj.FieldByName('PAY_C').AsFloat<>0 then
     begin
       payment.Caption := getPaymentTitle('C')+'收款';
       inc(w);
       s[3] := '1';
       payInfo := payInfo +getPaymentTitle('C')+':'+FormatFloat('#0.0#',AObj.FieldByName('PAY_C').AsFloat)+ ' ';
     end;
  if AObj.FieldByName('PAY_D').AsFloat<>0 then
     begin
       payment.Caption := getPaymentTitle('D')+'欠款';
       inc(w);
       s[4] := '0';
       payInfo := payInfo +getPaymentTitle('D')+':'+FormatFloat('#0.0#',AObj.FieldByName('PAY_D').AsFloat)+ ' ';
     end;
  if AObj.FieldByName('PAY_E').AsFloat<>0 then
     begin
       payment.Caption := getPaymentTitle('E')+'收款';
       inc(w);
       s[5] := '1';
       payInfo := payInfo +getPaymentTitle('E')+':'+FormatFloat('#0.0#',AObj.FieldByName('PAY_E').AsFloat)+ ' ';
     end;
  if AObj.FieldByName('PAY_F').AsFloat<>0 then
     begin
       payment.Caption := getPaymentTitle('F')+'收款';
       inc(w);
       s[6] := '1';
       payInfo := payInfo +getPaymentTitle('F')+':'+FormatFloat('#0.0#',AObj.FieldByName('PAY_F').AsFloat)+ ' ';
     end;
  if AObj.FieldByName('PAY_G').AsFloat<>0 then
     begin
       payment.Caption := getPaymentTitle('G')+'收款';
       inc(w);
       s[7] := '1';
       payInfo := payInfo +getPaymentTitle('G')+':'+FormatFloat('#0.0#',AObj.FieldByName('PAY_G').AsFloat)+ ' ';
     end;
  if AObj.FieldByName('PAY_H').AsFloat<>0 then
     begin
       payment.Caption := getPaymentTitle('H')+'收款';
       inc(w);
       s[8] := '1';
       payInfo := payInfo +getPaymentTitle('H')+':'+FormatFloat('#0.0#',AObj.FieldByName('PAY_H').AsFloat)+ ' ';
     end;
  if AObj.FieldByName('PAY_I').AsFloat<>0 then
     begin
       payment.Caption := getPaymentTitle('I')+'收款';
       inc(w);
       s[9] := '1';
       payInfo := payInfo +getPaymentTitle('I')+':'+FormatFloat('#0.0#',AObj.FieldByName('PAY_I').AsFloat)+ ' ';
     end;
  if AObj.FieldByName('PAY_J').AsFloat<>0 then
     begin
       payment.Caption := getPaymentTitle('J')+'收款';
       inc(w);
       s[10] := '1';
       payInfo := payInfo +getPaymentTitle('J')+':'+FormatFloat('#0.0#',AObj.FieldByName('PAY_J').AsFloat)+ ' ';
     end;
  if w>1 then payment.Caption := '组合收款';
  if totalAmt<>0 then
     begin
        case inputFlag of
        13: MarqueeStatus.Caption := payInfo;
        else
           begin
            if TotalFee<>0 then
               MarqueeStatus.Caption := '合计:'+FormatFloat('#0.00',(TotalFee-payDibs))+'  折扣:'+FormatFloat('#0.0',(TotalFee-payDibs)*100/TotalFee)+'%'
            else
               MarqueeStatus.Caption := '';
           end;
        end;
     end;
end;

procedure TfrmSaleOrder.SetinputFlag(const Value: integer);
function getPayment:string;
var rs:TZQuery;
begin
  result := '';
  rs := dllGlobal.GetZQueryFromName('PUB_PAYMENT');
  rs.First;
  while not rs.Eof do
    begin
      if result <> '' then result := result+' ';
      result := result +rs.FieldByName('CODE_ID').AsString+'.'+rs.FieldByName('CODE_NAME').AsString;
      rs.Next;
    end;
end;
begin
  inherited;
  case Value of
  5:begin
      FInputFlag := value;
      lblInput.Caption := '销售类型';
      lblHint.Caption := '"1.正常销售、2.赠送商品、3.积分兑换" 请输入类型序号后按 Enter 键';
    end;
  6:begin
      FInputFlag := value;
      lblInput.Caption := '会员卡号';
      lblHint.Caption := '请输入完整的"会员卡号或手机号"后按 Enter 键';
    end;
  7:begin
      FInputFlag := value;
      lblInput.Caption := '导 购 员';
      lblHint.Caption := '请输入导购员员工编号后按 Enter 键';
    end;
  11:begin
      FInputFlag := value;
      lblInput.Caption := '应收金额';
      lblHint.Caption := '请直接输入结算金额或折扣率(如95折/95)后按 Enter 键';
    end;
  13:begin
      FInputFlag := value;
      lblInput.Caption := '输入金额';
      lblHint.Caption := '请输入支付金额后按"'+getPayment+'"';
    end;
  14:begin
      FInputFlag := value;
      lblInput.Caption := '实收现金';
      lblHint.Caption := '请输入实收现金后按 Enter 键或+键';
    end;
  end;
end;

procedure TfrmSaleOrder.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if PageControl.ActivePageIndex <> 0 then Exit;
  if Key = VK_F5 then
     begin
       if edtTable.FieldByName('IS_PRESENT').AsString = '0' then
          DoIsPresent('2')
       else
          DoIsPresent('1');
       //inputMode := 1;
       //inputFlag := 5;
       //edtInput.SetFocus;
     end;
  if Key = VK_F6 then
     begin
       inputMode := 1;
       inputFlag := 6;
       edtInput.SetFocus;
     end;
  if Key = VK_F7 then
     begin
       inputMode := 1;
       inputFlag := 7;
       edtInput.SetFocus;
     end;
  if Key = VK_F8 then
     begin
       DoNewOrder;
     end;
  if Key = VK_F9 then
     begin
       DoHangUp;
     end;
  if Key = VK_F10 then
     begin
       DoPickUp;
     end;
  if Key = VK_F11 then
     begin
       inputMode := 1;
       inputFlag := 11;
       edtInput.SetFocus;
     end;
  if Key = VK_HOME then
     begin
       DevFactory.OpenCashBox(self.Font);
     end;
end;

procedure TfrmSaleOrder.DoCustId(s:string);
var rs,bs:TZQuery;
begin
  inherited;
  rs := TZQuery.Create(nil);
  try
    rs.SQL.Text :=
      'select UNION_ID,CLIENT_ID,TENANT_ID from PUB_IC_INFO where TENANT_ID in ('+dllGlobal.GetUnionTenantInWhere+') and IC_CARDNO=:IC_CARDNO and IC_STATUS in (''0'',''1'') and COMM not in (''02'',''12'')';
    rs.ParamByName('IC_CARDNO').AsString := s;
    dllGlobal.OpenSqlite(rs);
    if rs.IsEmpty then
       begin
         if token.online and (dllApplication.mode<>'demo') then
            begin
              rs.Close;
              dllGlobal.OpenRemote(rs);
            end;
       end;
    if rs.IsEmpty then
       begin
         rs.Close;
         rs.SQL.Text :=
           'select ''#'' as UNION_ID,CUST_ID as CLIENT_ID,TENANT_ID from PUB_CUSTOMER where TENANT_ID='+token.tenantId+' and (MOVE_TELE='''+s+''' or ID_NUMBER='''+s+''') and COMM not in (''02'',''12'')';
         dllGlobal.OpenSqlite(rs);
         if rs.IsEmpty then
            begin
              if token.online and (dllApplication.mode<>'demo') then
                 begin
                   rs.Close;
                   dllGlobal.OpenRemote(rs);
                 end;
            end;
       end;
    if rs.IsEmpty then Raise Exception.Create('你输入的会员卡号无效.');
    if rs.RecordCount > 1 then
       begin
         rs.Locate('UNION_ID','#',[]); 
       end;
    if rs.FieldByName('TENANT_ID').AsString=token.tenantId then
       begin
         AObj.FieldByName('UNION_ID').AsString := '#';
         bs := dllGlobal.GetZQueryFromName('PUB_CUSTOMER');
         if bs.Locate('CLIENT_ID',rs.FieldByName('CLIENT_ID').AsString,[]) then
            begin
               AObj.FieldByName('CLIENT_ID').AsString := bs.FieldByName('CLIENT_ID').AsString;
               AObj.FieldByName('CLIENT_ID_TEXT').AsString := bs.FieldByName('CLIENT_NAME').AsString;
               AObj.FieldByName('CLIENT_CODE').AsString := bs.FieldByName('CLIENT_CODE').AsString;
               AObj.FieldByName('PRICE_ID').AsString := bs.FieldByName('PRICE_ID').AsString;
               if dllGlobal.GetDoubleScreen = '2' then
                  begin
                    AObj.FieldByName('ACCU_INTEGRAL').AsInteger := GetCustIntegral;
                  end;
            end;
       end
    else
       begin
         if not token.online then Raise Exception.Create('脱机状态不能使用商盟卡');  
         AObj.FieldByName('UNION_ID').AsString := rs.FieldByName('UNION_ID').AsString;
         AObj.FieldByName('PRICE_ID').AsString := rs.FieldByName('UNION_ID').AsString;
         AObj.FieldByName('CLIENT_ID').AsString := rs.FieldByName('CLIENT_ID').AsString;
         rs.Close;
         rs.SQL.Text := 'select CUST_NAME from PUB_CUSTOMER where TENANT_ID in ('+dllGlobal.GetUnionTenantInWhere+') and CUST_ID=:CUST_ID';
         rs.ParamByName('CUST_ID').AsString := AObj.FieldByName('CLIENT_ID').AsString;
         dllGlobal.OpenRemote(rs);
         AObj.FieldByName('CLIENT_ID_TEXT').AsString := rs.FieldByName('CUST_NAME').AsString;
       end;
    edtCLIENT_ID.KeyValue := AObj.FieldByName('CLIENT_ID').AsString;
    edtCLIENT_ID.Text := AObj.FieldByName('CLIENT_ID_TEXT').AsString;
    CalcPrice;
  finally
    rs.Free;
  end;
end;

procedure TfrmSaleOrder.DoGuideUser(s:string);
var rs:TZQuery;
begin
  rs := dllGlobal.GetZQueryFromName('CA_USERS');
  if rs.Locate('ACCOUNT',s,[]) then
     begin
       edtGUIDE_USER.KeyValue := rs.FieldByName('USER_ID').AsString;
       edtGUIDE_USER.Text := rs.FieldByName('USER_NAME').AsString;
     end;
end;

procedure TfrmSaleOrder.DoHangUp;
var
  s:string;
  mm:TMemoryStream;
begin
  inherited;
  if dbState = dsBrowse then Exit;
  if dbState = dsEdit then Raise Exception.Create('修改单据状态不能挂单...');
  if TotalAmt=0 then Raise Exception.Create('不能挂一张空单据...');
  WriteToObject(AObj,self);
  AObj.FieldByName('TENANT_ID').AsInteger := strtoInt(token.tenantId);
  AObj.FieldByName('SHOP_ID').AsString := token.shopId;
  AObj.FieldByName('SALES_TYPE').AsInteger := 4;
  AObj.FieldByName('CREA_DATE').AsString := formatdatetime('YYYY-MM-DD HH:NN:SS',now());
  AObj.FieldByName('CREA_USER').AsString := token.UserID;
  AObj.FieldByName('CHK_DATE').AsString := formatdatetime('YYYY-MM-DD',dllGlobal.SysDate);
  AObj.FieldByName('CHK_USER').AsString := token.userId;
  AObj.FieldByName('LOCUS_STATUS').AsString := '3';
  edtTable.DisableControls;
  try
    cdsHeader.Edit;
    AObj.WriteToDataSet(cdsHeader);
    cdsHeader.Post;
    s := formatDatetime('YYYYMMDD_HHNNSS',now());
    ForceDirectories(ExtractFilePath(ParamStr(0))+'temp\sales');
    mm := TMemoryStream.Create;
    try
      mm.Clear;
      cdsHeader.SaveToStream(mm);
      mm.Position := 0;
      mm.SaveToFile(ExtractFilePath(ParamStr(0))+'temp\sales\H'+s+'.dat');

      mm.Clear;
      edtTable.SaveToStream(mm);
      mm.Position := 0;
      mm.SaveToFile(ExtractFilePath(ParamStr(0))+'temp\sales\D'+s+'.dat');

      mm.Clear;
      edtProperty.SaveToStream(mm);
      mm.Position := 0;
      mm.SaveToFile(ExtractFilePath(ParamStr(0))+'temp\sales\P'+s+'.dat');
    finally
      mm.Free;
    end;
    edtTable.EnableControls;
  except
    edtTable.EnableControls;
    Raise;
  end;
  dbState := dsBrowse;
  if dllGlobal.GetDoubleScreen = '2' then
     PlayerFactory.ResetScreen;
  MessageBox(Handle,'挂单成功，取单请按F10键',pchar(Application.Title),MB_OK+MB_ICONINFORMATION);
  NewOrder;
end;

procedure TfrmSaleOrder.DoIsPresent(s:string);
begin
  if edtTable.FieldByName('GODS_ID').AsString = '' then Exit;
  if s='1' then
     PresentToCalc(0)
  else
  if s='2' then
     PresentToCalc(1)
  else
  if s='3' then
     PresentToCalc(2)
  else
     Raise Exception.Create('不支持的销售类型，请输入1-3之间的类型序号');
end;

procedure TfrmSaleOrder.DoNewOrder;
begin
  if MessageBox(Handle,'是否清除当前输入的所有商品?','友情提示..',MB_YESNO+MB_ICONQUESTION)=6 then
     NewOrder;
end;

procedure TfrmSaleOrder.DoPayDibs(s:string);
var
  mny:currency;
  IsAgio:boolean;
begin
  s := trim(s);
  IsAgio := (s[1]='/');
  if IsAgio then delete(s,1,1);
  s := trim(s);
  try
    mny := StrtoFloat(s);
  except
    Raise Exception.create('你输入的数值无效无效');
  end;
  if IsAgio then
     begin
       if abs(mny)>100 then Raise Exception.Create('输入的折扣率过大，请确认是否输入正确');
     end
  else
     begin
       if abs(mny)>totalfee then Raise Exception.Create('输入的金额过大，请确认是否输入正确');
     end;
  if not IsAgio then
     begin
       AObj.FieldByName('PAY_DIBS').AsFloat := totalFee-mny;
       edtACCT_MNY.Text := FormatFloat('#0.00',mny);
     end
  else
     begin
       AObj.FieldByName('PAY_DIBS').AsString := FormatFloat('#0.00',totalfee-(totalFee*mny/100));
       edtACCT_MNY.Text := FormatFloat('#0.00',totalfee-AObj.FieldByName('PAY_DIBS').AsFloat);
     end;
  if TotalFee<>0 then
     edtAGIO_RATE.Text := FormatFloat('#0.0',(TotalFee-AObj.FieldByName('PAY_DIBS').AsFloat)*100/TotalFee)
  else
     edtAGIO_RATE.Text := '';
  DoShowPayment;
end;

procedure TfrmSaleOrder.DoPickUp;
var
  s:string;
  h:TZQuery;
  mm:TMemoryStream;
  payDibs:real;
begin
  ClearInvaid;
  if not edtTable.IsEmpty and (MessageBox(Handle,'是否清空当前录入的所有商品？','友情提示',MB_YESNO+MB_ICONQUESTION)<>6) then Exit;
  with TfrmHangUpFile.Create(self) do
    begin
      try
        LoadFile('H','temp\sales\');
        if cdsTable.RecordCount = 0 then
           begin
             MessageBox(self.Handle,pchar('未检测到挂单记录..'),'友情提示..',MB_OK);
             Exit;
           end
        else if cdsTable.RecordCount = 1 then
           s := cdsTable.FieldByName('FILENAME').AsString
        else
           begin
             if ShowModal=MROK then
                begin
                  s := cdsTable.FieldByName('FILENAME').AsString
                end
             else
                Exit;
           end;
      finally
        Free;
      end;
    end;
  s := copy(s,2,255);
  NewOrder;
  mm := TMemoryStream.Create;
  h := TZQuery.Create(nil);
  try
    mm.LoadFromFile(ExtractFilePath(ParamStr(0))+'temp\sales\H'+s);
    H.LoadFromStream(mm);
    AObj.ReadFromDataSet(H,false); 
    mm.LoadFromFile(ExtractFilePath(ParamStr(0))+'temp\sales\D'+s);
    edtTable.LoadFromStream(mm);
    mm.LoadFromFile(ExtractFilePath(ParamStr(0))+'temp\sales\P'+s);
    edtProperty.LoadFromStream(mm);
  finally
    h.Free;
    mm.Free;
  end;
  edtTable.Last;
  RowId := edtTable.FieldByName('SEQNO').AsInteger;
  payDibs := AObj.FieldByName('PAY_DIBS').AsFloat;
  DeleteFile(ExtractFilePath(ParamStr(0))+'temp\sales\H'+s);
  DeleteFile(ExtractFilePath(ParamStr(0))+'temp\sales\D'+s);
  DeleteFile(ExtractFilePath(ParamStr(0))+'temp\sales\P'+s);
  Calc;
  if AObj.FieldByName('CLIENT_ID').AsString <> '' then
     begin
       edtCLIENT_ID.KeyValue := AObj.FieldByName('CLIENT_ID').AsString;
       edtCLIENT_ID.Text := AObj.FieldByName('CLIENT_ID_TEXT').AsString;
     end;
  if payDibs <> 0 then
     begin
       DoPayDibs(FloatToStr(TotalFee-payDibs));
     end;
end;

procedure TfrmSaleOrder.DoSaveOrder;
begin
  FInputFlag := 1;
  try
    SaveOrder;
  finally
    FInputFlag := 14;
  end;
  NewOrder;
end;

function TfrmSaleOrder.doShortCut(s: string): boolean;
begin
  result := inherited doShortCut(s);
  if result then Exit;
  result := true;
  case InputFlag of
  5:begin
      if s<>'' then DoIsPresent(s);
    end;
  6:begin
      if s<>'' then DoCustId(s);
    end;
  7:begin
      if s<>'' then DoGuideUser(s);
    end;
  11:begin
      if s<>'' then DoPayDibs(s);
    end;
  else
    result := false;
  end;
end;

procedure TfrmSaleOrder.DoPayInput(s:string;flag:string);
var
  r:currency;
  rs:TZQuery;
begin
  try
    r := strtoFloat(s);
  except
    Raise Exception.Create('你输入的支付金额不正确，请重新输入'); 
  end;
  rs := dllGlobal.GetZQueryFromName('PUB_PAYMENT');
  flag := uppercase(flag);
  if not rs.Locate('CODE_ID',flag,[]) then Raise Exception.Create('您输入的支付方式不正确,请重新输入');
  AObj.FieldByName('PAY_'+flag).AsFloat := r;
  DoShowPayment; 
end;

procedure TfrmSaleOrder.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if char(Key) = '*' then
     begin
       if edtInput.CanFocus then edtInput.SetFocus;
       if CheckNoData then raise Exception.Create('您还没有输入商品，不能做此操作。');
       if TfrmPayMent.payment(self,totalFee-AObj.FieldByName('PAY_DIBS').AsFloat,AObj) then
          begin
            inputFlag := 13;
            try
              DoShowPayment;
            finally
              edtInput.Text := '';
              if edtInput.CanFocus then edtInput.SetFocus;
              inputFlag := 0;
            end;
          end;
       Key := #0;
     end;
  if (char(Key) = '+') or (char(Key) = ' ') then
     begin
       key := #0;
       if edtInput.CanFocus then edtInput.SetFocus;
       if CheckNoData then raise Exception.Create('您还没有输入商品，不能做此操作。');
       if InputFlag=14 then
          begin
            try
              payCashMny(trim(edtInput.Text));
              DoSaveOrder;
              InputFlag := 1;
              edtInput.Text := '';
            finally
              edtInput.selectAll;
              edtInput.SetFocus;
            end;
          end
       else
          begin
            if dllGlobal.GetParameter('USING_PAYMENT')<>'1' then
               begin
                  try
                    inputMode := 1;
                    inputFlag := 14;
                    checkPayment;
                    payCashMny(trim(edtInput.Text));
                    DoSaveOrder;
                    edtInput.Text := '';
                  finally
                    InputFlag := 1;
                    edtInput.selectAll;
                    edtInput.SetFocus;
                  end;
               end
            else
               begin
                  inputMode := 1;
                  inputFlag := 14;
                  checkPayment;
                  edtInput.selectAll;
                  edtInput.SetFocus;
               end;
          end;
     end;
  if (Key = #27) and (PageControl.ActivePageIndex = 1) then
     begin
       PageControl.ActivePageIndex := 0;
       PageControlChange(nil);
     end;
end;

procedure TfrmSaleOrder.PresentToCalc(Present: integer);
var bs:TZQuery;
begin
  if Present in [0,1] then
     inherited
  else
  if Present in [2] then
     begin
       bs := dllGlobal.GetZQueryFromName('PUB_GOODSINFO');
       if not bs.Locate('GODS_ID',edtTable.FieldByName('GODS_ID').AsString,[]) then Raise Exception.Create('经营商品中没找到“'+edtTable.FieldByName('GODS_NAME').AsString+'”');
       if bs.FieldByName('USING_BARTER').AsInteger in [2,3] then
          begin
            edtTable.Edit;
            edtTable.FieldByName('GODS_NAME').AsString := '【兑换】'+bs.FieldByName('GODS_NAME').AsString;
            edtTable.FieldByName('IS_PRESENT').AsInteger := 2;
            edtTable.FieldByName('BARTER_INTEGRAL').AsInteger := bs.FieldByName('BARTER_INTEGRAL').AsInteger;
            if bs.FieldByName('USING_BARTER').AsInteger=2 then
               begin
                 edtTable.FieldByName('APRICE').AsFloat := 0;
                 PriceToCalc(0);
               end;
          end
       else
          begin
            MessageBox(Handle,'此商品没有启用积分换购，不能进行兑换','友情提示...',MB_OK+MB_ICONINFORMATION);
            Exit;
          end;
     end;
end;

procedure TfrmSaleOrder.CalcPrice;
var
  r:integer;
  rs:TZQuery;
begin
  if edtTable.State in [dsEdit,dsInsert] then edtTable.Post;
  r := edtTable.RecNo;
  rs := dllGlobal.GetZQueryFromName('PUB_GOODSINFO');
  edtTable.DisableControls;
  try
    edtTable.First;
    while not edtTable.Eof do
      begin
        if (edtTable.FieldByName('GODS_ID').AsString <> '') and (edtTable.FieldByName('BOM_ID').AsString = '') and (edtTable.FieldByName('POLICY_TYPE').AsInteger<>4) then
        begin
          if rs.Locate('GODS_ID',edtTable.FieldByName('GODS_ID').AsString,[]) then
             begin
               edtTable.Edit;
               edtTable.FieldByName('GODS_NAME').AsString := rs.FieldByName('GODS_NAME').AsString;
               edtTable.Post;
             end;
          InitPrice(edtTable.FieldByName('GODS_ID').AsString,edtTable.FieldByName('UNIT_ID').AsString);
          PriceToCalc(edtTable.FieldByName('APrice').AsFloat);
        end;
        edtTable.Next;
      end;
  finally
    if r>0 then edtTable.RecNo := r;
    edtTable.EnableControls;
  end;
  Calc;
end;

procedure TfrmSaleOrder.PageControlChange(Sender: TObject);
begin
  inherited;
  case PageControl.ActivePageIndex of
  0:begin
       btnNav.Caption := '历史单据';
       lblCaption.Caption := '销售单';
    end;
  1:begin
       btnNav.Caption := '返回';
       lblCaption.Caption := '销售单列表';
    end;
  end;
end;

procedure TfrmSaleOrder.btnNavClick(Sender: TObject);
begin
  inherited;
  case PageControl.ActivePageIndex of
  0:PageControl.ActivePageIndex := 1;
  1:PageControl.ActivePageIndex := 0;
  end;
  PageControlChange(nil);
end;

procedure TfrmSaleOrder.SetdbState(const Value: TDataSetState);
begin
  inherited;
  case Value of
  dsBrowse:begin
       btnNew.Caption := '新增';
     end;
  else
     begin
       btnNew.Caption := '清空';
     end;
  end;
end;

procedure TfrmSaleOrder.OpenList;
begin
  if D1.EditValue = null then
     begin
       if D1.CanFocus then D1.SetFocus;
       Raise Exception.Create('开始日期不能为空！');
     end;
  if D2.EditValue = null then
     begin
       if D2.CanFocus then D2.SetFocus;
       Raise Exception.Create('结束条件不能为空！');
     end;
  cdsList.Close;
  cdsList.SQL.Text :=
    ParseSQL(dataFactory.iDbType,
    'select A.SALES_ID,A.GLIDE_NO,A.SALES_DATE,isnull(B.CLIENT_NAME,''普通客户'') as CLIENT_NAME,A.SALE_MNY,A.SALE_MNY-A.PAY_DIBS as ACCT_MNY,PAY_A+PAY_B+PAY_C+PAY_E+PAY_F+PAY_G+PAY_H+PAY_I+PAY_J as RECV_MNY,C.USER_NAME as GUIDE_USER_TEXT,A.REMARK,A.CREA_DATE '+
    'from SAL_SALESORDER A '+
    'left outer join VIW_CUSTOMER B on A.TENANT_ID=B.TENANT_ID and A.CLIENT_ID=B.CLIENT_ID '+
    'left outer join VIW_USERS C on A.TENANT_ID=C.TENANT_ID and A.GUIDE_USER=C.USER_ID '+
    'where A.TENANT_ID=:TENANT_ID and A.SALES_DATE>=:D1 and A.SALES_DATE<=:D2 and A.SALES_TYPE=4 '
    );
  if trim(searchTxt)<>'' then
     cdsList.SQL.Text := 'select j.* from ('+cdsList.SQL.Text+') j where CLIENT_NAME like ''%'+trim(searchTxt)+'%'' or REMARK like ''%'+trim(searchTxt)+'%'' or GLIDE_NO like ''%'+trim(searchTxt)+'%''';
  cdsList.SQL.Text := cdsList.SQL.Text + ' order by SALES_DATE desc,GLIDE_NO desc';
  cdsList.ParamByName('TENANT_ID').AsInteger := StrtoInt(token.tenantId);
  cdsList.ParamByName('D1').AsInteger := StrtoInt(formatDatetime('YYYYMMDD',D1.Date));
  cdsList.ParamByName('D2').AsInteger := StrtoInt(formatDatetime('YYYYMMDD',D2.Date));
  dataFactory.Open(cdsList); 
end;

procedure TfrmSaleOrder.dateFlagPropertiesChange(Sender: TObject);
begin
  inherited;
  case dateFlag.ItemIndex of
  0:begin
      D1.Date := dllGlobal.SysDate;
      D2.Date := dllGlobal.SysDate;
    end;
  1:begin
      D1.Date := fnTime.fnStrtoDate(formatDatetime('YYYYMM01',dllGlobal.SysDate));
      D2.Date := dllGlobal.SysDate;
    end;
  2:begin
      D1.Date := fnTime.fnStrtoDate(formatDatetime('YYYY0101',dllGlobal.SysDate));
      D2.Date := dllGlobal.SysDate;
    end;
  else
    begin
      D1.Date := dllGlobal.SysDate;
      D2.Date := dllGlobal.SysDate;
    end;
  end;
end;

procedure TfrmSaleOrder.FormCreate(Sender: TObject);
begin
  inherited;
  dateFlag.ItemIndex := 0;
end;

procedure TfrmSaleOrder.btnFindClick(Sender: TObject);
begin
  inherited;
  OpenList;
end;

procedure TfrmSaleOrder.DBGridEh2DblClick(Sender: TObject);
begin
  inherited;
  if cdsList.IsEmpty then Exit;
  open(cdsList.FieldByName('SALES_ID').AsString);
  PageControl.ActivePageIndex := 0;
  PageControlChange(nil);
end;

procedure TfrmSaleOrder.DBGridEh2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var
  ARect:TRect;
  br:TBrush;
  pn:TPen;
begin
  rowToolNav.Visible := not cdsList.IsEmpty;
  br := TBrush.Create;
  br.Assign(DBGridEh2.Canvas.Brush);
  pn := TPen.Create;
  pn.Assign(DBGridEh2.Canvas.Pen);
  try
  if (Rect.Top = DBGridEh2.CellRect(DBGridEh2.Col, DBGridEh2.Row).Top) and (not
    (gdFocused in State) or not DBGridEh2.Focused or (Column.FieldName = 'TOOL_NAV')) then
  begin
    if Column.FieldName = 'TOOL_NAV' then
       begin
         ARect := Rect;
         rowToolNav.Visible := true;
         rowToolNav.SetBounds(ARect.Left+11,ARect.Top+11,ARect.Right-ARect.Left,ARect.Bottom-ARect.Top);
       end
    else
       begin
         DBGridEh2.Canvas.Font.Color := clBlack;
         DBGridEh2.Canvas.Brush.Color := clWhite;
       end;
  end;
  DBGridEh2.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  if Column.FieldName = 'SEQNO' then
    begin
      ARect := Rect;
      DBGridEh2.canvas.Brush.Color := DBGridEh2.FixedColor;
      DBGridEh2.canvas.FillRect(ARect);
      DrawText(DBGridEh2.Canvas.Handle,pchar(Inttostr(cdsList.RecNo)),length(Inttostr(cdsList.RecNo)),ARect,DT_NOCLIP or DT_SINGLELINE or DT_CENTER or DT_VCENTER);
    end;
  finally
    DBGridEh2.Canvas.Brush.Assign(br);
    DBGridEh2.Canvas.Pen.Assign(pn);
    br.Free;
    pn.Free;
  end;
end;

function TfrmSaleOrder.getPaymentTitle(pay: string): string;
var rs:TZQuery;
begin
  rs := dllGlobal.GetZQueryFromName('PUB_PAYMENT');
  if rs.Locate('CODE_ID',pay,[]) then
     result := rs.FieldByName('CODE_NAME').AsString
  else
     Raise Exception.Create('不支持的收款方式'); 
end;

procedure TfrmSaleOrder.RzToolButton2Click(Sender: TObject);
begin
  if cdsList.IsEmpty then Exit;
  open(cdsList.FieldByName('SALES_ID').AsString);
  EditOrder;
  PageControl.ActivePageIndex := 0;
  PageControlChange(nil);
end;

procedure TfrmSaleOrder.RzToolButton3Click(Sender: TObject);
begin
  inherited;
  if cdsList.IsEmpty then Exit;
  open(cdsList.FieldByName('SALES_ID').AsString);
  PageControl.ActivePageIndex := 0;
  PageControlChange(nil);

end;

procedure TfrmSaleOrder.RzToolButton1Click(Sender: TObject);
begin
  inherited;
  if cdsList.IsEmpty then Exit;
  open(cdsList.FieldByName('SALES_ID').AsString);
  DeleteOrder;
  NewOrder;
end;

procedure TfrmSaleOrder.btnNewClick(Sender: TObject);
begin
  if MessageBox(Handle,pchar('是否'+btnNew.Caption+'当前销售单？'),'友情提示..',MB_YESNO+MB_ICONQUESTION)<>6 then Exit;
  NewOrder;
end;

function TfrmSaleOrder.payCashMny(s:string): boolean;
var r:currency;
    fee,A:currency;
begin
  fee :=
    AObj.FieldByName('PAY_B').AsFloat+
    AObj.FieldByName('PAY_C').AsFloat+
    AObj.FieldByName('PAY_D').AsFloat+
    AObj.FieldByName('PAY_E').AsFloat+
    AObj.FieldByName('PAY_F').AsFloat+
    AObj.FieldByName('PAY_G').AsFloat+
    AObj.FieldByName('PAY_H').AsFloat+
    AObj.FieldByName('PAY_I').AsFloat+
    AObj.FieldByName('PAY_J').AsFloat;
  A := (AObj.FieldByName('SALE_MNY').AsFloat-AObj.FieldByName('PAY_DIBS').AsFloat)-fee;
  try
    r := strtoFloat(s);
  except
    Raise Exception.Create('你输入的实收现金不正确，请重新输入');
  end;

  AObj.FieldByName('CASH_MNY').AsFloat := r;

  if A<0 then
     begin
       if r>A then Raise Exception.Create('实退现金不能大于应退金额');
     end
  else
     begin
       if r<A then Raise Exception.Create('实收现金不能小于应收金额');
     end;
  AObj.FieldByName('CASH_MNY').AsFloat := r;
  FInputFlag :=1;
  try
    checkPayment;
  finally
    FInputFlag := 14;
  end;
end;

procedure TfrmSaleOrder.edtInputKeyPress(Sender: TObject; var Key: Char);
begin
  if (InputFlag = 14) and (Key=#13) then
  begin
    try
      payCashMny(trim(edtInput.Text));
      DoSaveOrder;
      InputFlag := 1;
      edtInput.Text := '';
    finally
      Key := #0;
      edtInput.selectAll;
      edtInput.SetFocus;
    end;
  end
  else
    inherited;
  if InputFlag = 13 then
  begin
    case Key of
    'A','B','C','D','E','F','G','H','I','J','a','b','c','d','e','f','g','h','i','j':begin
           try
             DoPayInput(trim(edtInput.Text),Key);
           finally
             edtInput.selectAll;
             Key := #0;
             edtInput.SetFocus;
           end;
         end;
    end;
  end;
end;

procedure TfrmSaleOrder.serachTextEnter(Sender: TObject);
begin
  inherited;
  serachText.Text := searchTxt;
  serachText.SelectAll;
end;

procedure TfrmSaleOrder.serachTextExit(Sender: TObject);
begin
  inherited;
  if searchTxt='' then serachText.Text := serachText.Hint;
end;

procedure TfrmSaleOrder.edtTableAfterDelete(DataSet: TDataSet);
begin
  inherited;
  if not edtTable.ControlsDisabled then Calc;
end;

procedure TfrmSaleOrder.serachTextChange(Sender: TObject);
begin
  inherited;
  if serachText.Focused then searchTxt := serachText.Text;
end;

procedure TfrmSaleOrder.cdsListBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  rowToolNav.Visible := false;
end;

procedure TfrmSaleOrder.serachTextKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key=#13 then
     OpenList;
end;

procedure TfrmSaleOrder.edtCLIENT_IDSaveValue(Sender: TObject);
var bs:TZQuery;
begin
  inherited;
  bs := dllGlobal.GetZQueryFromName('PUB_CUSTOMER');
  if bs.Locate('CLIENT_ID',edtCLIENT_ID.AsString,[]) then
     begin
        AObj.FieldByName('CLIENT_ID').AsString := bs.FieldByName('CLIENT_ID').AsString;
        AObj.FieldByName('CLIENT_CODE').AsString := bs.FieldByName('CLIENT_CODE').AsString;
        AObj.FieldByName('CLIENT_ID_TEXT').AsString := bs.FieldByName('CLIENT_NAME').AsString;
        AObj.FieldByName('PRICE_ID').AsString := bs.FieldByName('PRICE_ID').AsString;
        if dllGlobal.GetDoubleScreen = '2' then
           begin
             AObj.FieldByName('ACCU_INTEGRAL').AsInteger := GetCustIntegral;
           end;
        CalcPrice;
     end;
end;

procedure TfrmSaleOrder.btnPreviewClick(Sender: TObject);
begin
  inherited;
  case PageControl.ActivePageIndex of
    0:
      begin
        PreviewOrder;
      end;
    1:
      begin
        DBGridPrint;
        TfrmDBGridPreview.Preview(self,PrintDBGridEh1);
      end;
  end;
end;

procedure TfrmSaleOrder.btnPrintClick(Sender: TObject);
begin
  inherited;
  case PageControl.ActivePageIndex of
    0:
      begin
        if DevFactory.PrintFormat = 0 then
           PrintTicket
        else
           PrintOrder;
      end;
    1:
      begin
        DBGridPrint;
        TfrmDBGridPreview.Print(self,PrintDBGridEh1);
      end;
  end;
end;

procedure TfrmSaleOrder.DBGridPrint;
begin
  PrintDBGridEh1.DBGridEh := DBGridEh2;
  PrintDBGridEh1.PageHeader.CenterText.Text := '销售单列表';
  DBGridEh2.DBGridTitle := '销售单列表';
  DBGridEh2.DBGridHeader.Text := '日期:'+formatDatetime('YYYY-MM-DD',D1.Date)+'至'+formatDatetime('YYYY-MM-DD',D2.Date);
  DBGridEh2.DBGridFooter.Text := ' '+#13+' 操作员:'+token.UserName+'  导出时间:'+formatDatetime('YYYY-MM-DD HH:NN:SS',now());
  PrintDBGridEh1.AfterGridText.Text := #13+'打印人:'+token.UserName+'  打印时间:'+formatDatetime('YYYY-MM-DD HH:NN:SS',now());
  PrintDBGridEh1.SetSubstitutes(['%[whr]', '日期:'+formatDatetime('YYYY-MM-DD',D1.Date)+'至'+formatDatetime('YYYY-MM-DD',D2.Date)]);
end;

procedure TfrmSaleOrder.paymentClick(Sender: TObject);
begin
  inherited;
  if TfrmPayment.payment(self,totalFee-AObj.FieldByName('PAY_DIBS').AsFloat,AObj) then
     DoShowPayment;
end;

procedure TfrmSaleOrder.PrintTicket;
var tid,oid:string;
begin
  inherited;
  if dbState <> dsBrowse then Raise Exception.Create('请在历史单据中打印...');
  if AObj.FieldByName('SALES_ID').AsString = '' then Exit;
  tid := token.tenantId;
  oid := AObj.FieldByName('SALES_ID').AsString;
  DevFactory.PrintSaleTicket(tid,oid,self.Font);
end;

procedure TfrmSaleOrder.PrintOrder;
var tid,oid:string;
begin
  inherited;
  if dbState <> dsBrowse then Raise Exception.Create('请在历史单据中打印...');
  if AObj.FieldByName('SALES_ID').AsString = '' then Exit;
  tid := token.tenantId;
  oid := AObj.FieldByName('SALES_ID').AsString;
  TfrmOrderPreview.PrintReport(self,1,frfSalesOrder,tid,oid);
end;

procedure TfrmSaleOrder.PreviewOrder;
var
  r:integer;
  tid,oid:string;
begin
  inherited;
  if dbState <> dsBrowse then Raise Exception.Create('请在历史单据中预览...');
  if AObj.FieldByName('SALES_ID').AsString = '' then Exit;
  r := TfrmSaveDesigner.ShowDialog(self,'frfSalesOrder',nil);
  if r < 0 then Exit;
  GlobalIndex := r;
  tid := token.tenantId;
  oid := AObj.FieldByName('SALES_ID').AsString;
  TfrmOrderPreview.ShowReport(self,1,frfSalesOrder,tid,oid,'销售单');
end;

procedure TfrmSaleOrder.frfSalesOrderGetValue(const ParName: String;
  var ParValue: Variant);
begin
  inherited;
  if ParName='企业名称' then ParValue := token.tenantName;
  if ParName='打印人' then ParValue := token.username;
end;

procedure TfrmSaleOrder.frfSalesOrderUserFunction(const Name: String; p1,
  p2, p3: Variant; var Val: Variant);
var small:real;
begin
  inherited;
  if UPPERCASE(Name)='SMALLTOBIG' then
     begin
       small := frParser.Calc(p1);
       Val := FnNumber.SmallTOBig(small);
     end;
end;

procedure TfrmSaleOrder.BarcodeInput(_Buf: string);
begin
  inherited;

end;

procedure TfrmSaleOrder.edtACCT_MNYKeyPress(Sender: TObject; var Key: Char);
var r,fee:currency;
begin
  inherited;
  if (Key=#13) then
     begin
       if abs(StrtoFloatDef(edtACCT_MNY.Text,0))>TotalFee then edtACCT_MNY.Text := FloatToStr(TotalFee);
       r := StrtoFloatDef(edtACCT_MNY.Text,0);
       AObj.FieldByName('PAY_DIBS').AsFloat := TotalFee-r;
       if TotalFee<>0 then
          edtAGIO_RATE.Text := FormatFloat('#0.0',r*100/TotalFee)
       else
          edtAGIO_RATE.Text := '';
       fee :=
        AObj.FieldByName('PAY_B').AsFloat+
        AObj.FieldByName('PAY_C').AsFloat+
        AObj.FieldByName('PAY_D').AsFloat+
        AObj.FieldByName('PAY_E').AsFloat+
        AObj.FieldByName('PAY_F').AsFloat+
        AObj.FieldByName('PAY_G').AsFloat+
        AObj.FieldByName('PAY_H').AsFloat+
        AObj.FieldByName('PAY_I').AsFloat+
        AObj.FieldByName('PAY_J').AsFloat;
       if fee=0 then
          edtPAY_TOTAL.Text := FormatFloat('#0.00',r)
       else
          edtPAY_TOTAL.Text := FormatFloat('#0.00',fee+AObj.FieldByName('PAY_A').AsFloat);
       DoShowPayment;
     end;
end;

procedure TfrmSaleOrder.edtAGIO_RATEKeyPress(Sender: TObject;
  var Key: Char);
var r,fee:currency;
begin
  inherited;
  if (Key=#13) then
     begin
       r := StrtoFloatDef(edtAGIO_RATE.Text,0);
       AObj.FieldByName('PAY_DIBS').AsFloat := TotalFee-roundTo(TotalFee*r/100,-2);
       edtACCT_MNY.Text := FormatFloat('#0.00',TotalFee-AObj.FieldByName('PAY_DIBS').AsFloat);
       fee :=
        AObj.FieldByName('PAY_B').AsFloat+
        AObj.FieldByName('PAY_C').AsFloat+
        AObj.FieldByName('PAY_D').AsFloat+
        AObj.FieldByName('PAY_E').AsFloat+
        AObj.FieldByName('PAY_F').AsFloat+
        AObj.FieldByName('PAY_G').AsFloat+
        AObj.FieldByName('PAY_H').AsFloat+
        AObj.FieldByName('PAY_I').AsFloat+
        AObj.FieldByName('PAY_J').AsFloat;
       if fee=0 then
          edtPAY_TOTAL.Text := edtACCT_MNY.Text
       else
          edtPAY_TOTAL.Text := FormatFloat('#0.00',fee+AObj.FieldByName('PAY_A').AsFloat);
       DoShowPayment;
     end;
end;

procedure TfrmSaleOrder.edtAGIO_RATEExit(Sender: TObject);
var Key:Char;
begin
  inherited;
  Key := #13;
  edtAGIO_RATEKeyPress(nil,Key);
end;

procedure TfrmSaleOrder.edtPAY_TOTALKeyPress(Sender: TObject;
  var Key: Char);
var r:currency;
begin
  inherited;
  if Key=#13 then
     begin
       r := StrtoFloatDef(edtPAY_TOTAL.Text,0);
       AObj.FieldByName('PAY_A').AsFloat := r;
       AObj.FieldByName('PAY_B').AsFloat := 0;
       AObj.FieldByName('PAY_C').AsFloat := 0;
       // AObj.FieldByName('PAY_D').AsFloat := (totalFee-AObj.FieldByName('PAY_DIBS').AsFloat)-r;
       AObj.FieldByName('PAY_D').AsFloat := 0;
       AObj.FieldByName('PAY_E').AsFloat := 0;
       AObj.FieldByName('PAY_F').AsFloat := 0;
       AObj.FieldByName('PAY_G').AsFloat := 0;
       AObj.FieldByName('PAY_H').AsFloat := 0;
       AObj.FieldByName('PAY_I').AsFloat := 0;
       AObj.FieldByName('PAY_J').AsFloat := 0;
       payment.Caption := '现金收款';
     end;
end;

procedure TfrmSaleOrder.RzToolButton4Click(Sender: TObject);
var
   _obj,hdr:TRecord_;
   rs,edt:TZQuery;
begin
   inherited;
   Open(cdsList.FieldByName('SALES_ID').AsString);
   if (MessageBox(Handle,pchar('是否进行退货或换货操作？'),pchar(Application.Title),MB_YESNO+MB_ICONQUESTION)<>6) then Exit;
   _obj := TRecord_.Create;
   rs := TZQuery.Create(nil);
   hdr := TRecord_.Create;
   edt := TZQuery.Create(nil);
   try
     _obj.ReadFromDataSet(edtTable);
     AObj.CopyTo(hdr);
     rs.Data := edtProperty.Data;
     edt.Data := edtTable.Data;
     NewOrder;
     edtTable.First;
     while not edtTable.Eof do edtTable.Delete;
     AObj.FieldByName('CLIENT_ID').AsString := hdr.FieldByName('CLIENT_ID').AsString;
     AObj.FieldByName('CLIENT_ID_TEXT').AsString := hdr.FieldByName('CLIENT_ID_TEXT').AsString;
     AObj.FieldByName('CLIENT_CODE').AsString := hdr.FieldByName('CLIENT_CODE').AsString;
     AObj.FieldByName('UNION_ID').AsString := hdr.FieldByName('UNION_ID').AsString;
     AObj.FieldByName('PRICE_ID').AsString := hdr.FieldByName('PRICE_ID').AsString;
     AObj.FieldByName('PAY_DIBS').AsString := hdr.FieldByName('PAY_DIBS').AsString;
     edtCLIENT_ID.Text := AObj.FieldByName('CLIENT_ID_TEXT').AsString;
     edtCLIENT_ID.KeyValue := AObj.FieldByName('CLIENT_ID').AsString;
     edt.First;
     while not edt.Eof do
        begin
         edtTable.Append;
         _obj.Clear;
         _obj.ReadFromDataSet(edt); 
         _obj.WriteToDataSet(edtTable,false);
         inc(ROWID);
         edtTable.FieldByName('SEQNO').AsInteger := ROWID;
         edtTable.FieldByName('AMOUNT').AsFloat := - edt.FieldByName('AMOUNT').AsFloat;
         AmountToCalc(edtTable.FieldByName('AMOUNT').AsFloat);
         edtTable.Post;
         rs.Filtered := false;
         rs.Filter := 'SEQNO='+_obj.FieldByName('SEQNO').AsString;
         rs.Filtered := true;
         _obj.Clear;
         rs.First;
         while not rs.Eof do
           begin
             edtProperty.Append;
             _obj.ReadFromDataSet(rs);
             _obj.WriteToDataSet(edtProperty,false);
             edtProperty.FieldByName('AMOUNT').AsFloat := - edtProperty.FieldByName('AMOUNT').AsFloat;
             edtProperty.FieldByName('CALC_AMOUNT').AsFloat := - edtProperty.FieldByName('CALC_AMOUNT').AsFloat;
             edtProperty.Post;
             rs.Next;
           end;
        edt.Next;
     end;
     InitRecord;
     Calc;
     AObj.FieldByName('PAY_DIBS').AsFloat := -hdr.FieldByName('PAY_DIBS').AsFloat;
     DoShowPayment;
   finally
     rs.Free;
     _obj.Free;
     edt.Free;
     hdr.Free;
   end;
  PageControl.ActivePageIndex := 0;
  PageControlChange(nil);
end;

procedure TfrmSaleOrder.edtCLIENT_IDAddClick(Sender: TObject);
var SObj:TRecord_;
begin
  inherited;
  SObj := TRecord_.Create;
  try
    if TfrmCustomerDialog.ShowDialog(self,'',SObj) then
       begin
         edtCLIENT_ID.KeyValue := SObj.FieldByName('CUST_ID').AsString;
         edtCLIENT_ID.Text := SObj.FieldByName('CUST_NAME').AsString;
         AObj.FieldByName('PRICE_ID').AsString := SObj.FieldByName('PRICE_ID').AsString;
         AObj.FieldByName('CLIENT_ID').AsString := SObj.FieldByName('CUST_ID').AsString;
         AObj.FieldByName('CLIENT_CODE').AsString := SObj.FieldByName('CUST_CODE').AsString;
         AObj.FieldByName('CLIENT_ID_TEXT').AsString := SObj.FieldByName('CUST_NAME').AsString;
         CalcPrice;
       end;
  finally
    SObj.Free;
  end;
end;

procedure TfrmSaleOrder.RzBmpButton4Click(Sender: TObject);
begin
  inherited;
  CodeLisenter := false;
  try
    TfrmCodeScan.ShowDialog(self);
  finally
    CodeLisenter := true;
  end;
end;

procedure TfrmSaleOrder.btnImportClick(Sender: TObject);
begin
  inherited;
  ImportExcelClick(nil);
end;

procedure TfrmSaleOrder.PriceToGods(id: string);
var
  r:real;
  s:string;
  limit:integer;
  agio:currency;
  IsAgio:boolean;
begin
  if dbState = dsBrowse then Exit;
  if edtTable.FieldByName('GODS_ID').AsString='' then Raise Exception.Create('请选择商品后再执行此操作');
  if dllGlobal.GetChangePrice(edtTable.FieldByName('GODS_ID').AsString) = '2' then
     Raise Exception.Create('商品〖'+edtTable.FieldByName('GODS_NAME').AsString+'〗统一定价，不允许修改单价！');

  if dllGlobal.GetChangePrice(edtTable.FieldByName('GODS_ID').AsString) = '3' then
     begin
       s := trim(id);
       IsAgio := (s[1]='/');
       if not IsAgio then
          begin
            try
              r := StrToFloat(s);
            except
              Raise Exception.Create('输入的单价无效，请正确输入');
            end;
          end
       else
          begin
            delete(s,1,1);
            try
              agio := StrToFloat(s);
            except
              Raise Exception.Create('输入的折扣无效，请正确输入');
            end;
            if abs(agio)>100 then Raise Exception.Create('输入的折扣率过大，请确认是否输入正确');
            if agio < 10 then agio := agio * 10;
            if agio = 0 then
               agio := 1
            else
               agio := agio / 100;
            r := edtTable.FindField('ORG_PRICE').AsFloat * agio;
          end;
       limit := CheckPriceLimit(r);
       if limit > 0 then Raise Exception.Create('单价不能高于指导零售价，请重新输入');
       if limit < 0 then Raise Exception.Create('单价不能低于进价，请重新输入');
     end;

  inherited;
end;

procedure TfrmSaleOrder.DBGridEh1Columns10UpdateData(Sender: TObject;
  var Text: String; var Value: Variant; var UseText, Handled: Boolean);
begin
  inherited;
  if edtTable.FieldByName('GODS_ID').AsString = '' then
     begin
       Text := '';
       Value := null;
       Exit;
     end;
end;

procedure TfrmSaleOrder.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var CurPrice,OrgPrice:real;
begin
  inherited;
  try
    if not edtTable.Active then Exit;
    if edtTable.FieldByName('GODS_ID').AsString = '' then Exit;
    if Column.FieldName = 'APRICE' then
       begin
         if edtTable.FieldByName('IS_PRESENT').AsInteger = 0 then
            begin
              CurPrice := edtTable.FieldByName('APRICE').AsFloat;
              OrgPrice := edtTable.FieldByName('ORG_PRICE').AsFloat;
              if (FnNumber.CompareFloat(CurPrice, OrgPrice * 1.2) > 0)
                 or
                 (FnNumber.CompareFloat(CurPrice, OrgPrice * 0.8) < 0) then
                 begin
                   DBGridEh1.Canvas.Brush.Color := clRed;
                   DBGridEh1.Canvas.Font.Color := clwhite;
                   DBGridEh1.Canvas.Font.Style := [fsBold];
                 end;
              DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
            end;
       end;
  except
  end;
end;

procedure TfrmSaleOrder.AddRecord(AObj: TRecord_; UNIT_ID: string);
begin
  inherited;
  ShowCgtPic(AObj.FieldByName('GODS_ID').AsString);
end;

procedure TfrmSaleOrder.fndGODS_IDSaveValue(Sender: TObject);
begin
  inherited;
  ShowCgtPic(fndGODS_ID.AsString);
end;

procedure TfrmSaleOrder.ShowCgtPic(GodsId:string);
var
  bs,rs:TZQuery;
  UnitId:string;
begin
  if dllGlobal.GetDoubleScreen <> '2' then Exit;
  bs := dllGlobal.GetZQueryFromName('PUB_GOODSINFO');
  if bs.Locate('GODS_ID',GodsId,[]) then
     begin
       if bs.FieldByName('RELATION_ID').AsInteger = 1000006 then
          begin
            UnitId := bs.FieldByName('UNIT_ID').AsString;
            if UnitId = '' then UnitId := bs.FieldByName('CALC_UNITS').AsString;
            rs := TZQuery.Create(nil);
            try
              rs.SQL.Text := 'select BARCODE from PUB_BARCODE where GODS_ID=:GODS_ID and UNIT_ID=:UNIT_ID';
              rs.ParamByName('GODS_ID').AsString := GodsId;
              rs.ParamByName('UNIT_ID').AsString := UnitId;
              dllGlobal.OpenSqlite(rs);
              if not rs.IsEmpty then
                 begin
                   PlayerFactory.ShowCgtPic(rs.FieldByName('BARCODE').AsString);
                 end;
            finally
              rs.Free;
            end;
          end;
     end;
end;

procedure TfrmSaleOrder.toolDeleteClick(Sender: TObject);
begin
  inherited;
  if dllGlobal.GetDoubleScreen = '2' then PlayerFactory.ResetCgtPic;
end;

function TfrmSaleOrder.GetCustIntegral: integer;
var rs:TZQuery;
begin
  rs := TZQuery.Create(nil);
  try
    rs.SQL.Text := 'select INTEGRAL from PUB_IC_INFO where TENANT_ID=:TENANT_ID and CLIENT_ID=:CLIENT_ID and UNION_ID=:UNION_ID';
    rs.ParamByName('TENANT_ID').AsInteger := strtoint(token.tenantId);
    rs.ParamByName('CLIENT_ID').AsString := AObj.FieldByName('CLIENT_ID').AsString;
    rs.ParamByName('UNION_ID').AsString := '#';
    dataFactory.Open(rs);
    result := rs.FieldByName('INTEGRAL').AsInteger;
  finally
    rs.Free;
  end;
end;

procedure TfrmSaleOrder.N7Click(Sender: TObject);
begin
  inherited;
  DoIsPresent('3');
end;

procedure TfrmSaleOrder.getGodsInfo(godsId: string);
var
  rs:TZQuery;
  SourceScale:real;
begin
  rs := dllGlobal.GetZQueryFromName('PUB_GOODSINFO');
  if not rs.Locate('GODS_ID',edtTable.FieldByName('GODS_ID').AsString,[]) then Exit;
  if edtTable.FieldByName('UNIT_ID').AsString=rs.FieldByName('CALC_UNITS').AsString then
     begin
       SourceScale := 1;
     end
  else
  if edtTable.FieldByName('UNIT_ID').AsString=rs.FieldByName('BIG_UNITS').AsString then
     begin
       SourceScale := rs.FieldByName('BIGTO_CALC').AsFloat;
     end
  else
  if edtTable.FieldByName('UNIT_ID').AsString=rs.FieldByName('SMALL_UNITS').AsString then
     begin
       SourceScale := rs.FieldByName('SMALLTO_CALC').AsFloat;
     end
  else
     begin
       SourceScale := 1;
     end;
  rs := TZQuery.Create(nil);
  try
    rs.SQL.Text := 'select sum(amount) from STO_STORAGE where TENANT_ID=:TENANT_ID and GODS_ID=:GODS_ID';
    rs.ParamByName('TENANT_ID').AsInteger := strtoInt(token.tenantId);
    rs.ParamByName('GODS_ID').AsString := edtTable.FieldByName('GODS_ID').AsString;
    dataFactory.Open(rs);
    godsAmount.Caption := ' '+edtTable.FieldByName('GODS_NAME').AsString+' 库存:'+FormatFloat('#0.###',rs.Fields[0].AsFloat/SourceScale)+''+TdsFind.GetNameByID(dllGlobal.GetZQueryFromName('PUB_MEAUNITS'),'UNIT_ID','UNIT_NAME',edtTable.FieldByName('UNIT_ID').AsString);
  finally
    rs.Free;
  end;
end;

procedure TfrmSaleOrder.DBGridEh1CellClick(Column: TColumnEh);
begin
  inherited;
  getGodsInfo(edtTable.FieldByName('GODS_ID').AsString);
end;

function TfrmSaleOrder.CheckPriceLimit(r: real): integer;
var
  rs:TZQuery;
begin
  result := 0;
  rs := TZQuery.Create(nil);
  try
    rs.SQL.Text := 'select NEW_INPRICE,NEW_OUTPRICE,SMALLTO_CALC,BIGTO_CALC,CALC_UNITS,SMALL_UNITS,BIG_UNITS from VIW_GOODSINFO where TENANT_ID=:TENANT_ID and GODS_ID=:GODS_ID';
    rs.ParamByName('TENANT_ID').AsInteger := StrtoInt(token.tenantId);
    rs.ParamByName('GODS_ID').AsString := edtTable.FieldByName('GODS_ID').AsString;
    dllGlobal.OpenSqlite(rs);
    if not rs.IsEmpty then
       begin
         if (
              (edtTable.FieldByName('UNIT_ID').AsString=rs.FieldByName('SMALL_UNITS').AsString)
              and
              (FnNumber.CompareFloat(r, rs.FieldByName('NEW_OUTPRICE').AsFloat*rs.FieldByName('SMALLTO_CALC').AsFloat) > 0)
            ) or
            (
              (edtTable.FieldByName('UNIT_ID').AsString=rs.FieldByName('BIG_UNITS').AsString)
              and
              (FnNumber.CompareFloat(r, rs.FieldByName('NEW_OUTPRICE').AsFloat*rs.FieldByName('BIGTO_CALC').AsFloat) > 0)
            ) or
            (
              (edtTable.FieldByName('UNIT_ID').AsString=rs.FieldByName('CALC_UNITS').AsString)
              and
              (FnNumber.CompareFloat(r, rs.FieldByName('NEW_OUTPRICE').AsFloat) > 0)
            ) then
            begin
              result := 1;
            end;
         if (
              (edtTable.FieldByName('UNIT_ID').AsString=rs.FieldByName('SMALL_UNITS').AsString)
              and
              (FnNumber.CompareFloat(r, rs.FieldByName('NEW_INPRICE').AsFloat*rs.FieldByName('SMALLTO_CALC').AsFloat) < 0)
            ) or
            (
              (edtTable.FieldByName('UNIT_ID').AsString=rs.FieldByName('BIG_UNITS').AsString)
              and
              (FnNumber.CompareFloat(r, rs.FieldByName('NEW_INPRICE').AsFloat*rs.FieldByName('BIGTO_CALC').AsFloat) < 0)
            ) or
            (
              (edtTable.FieldByName('UNIT_ID').AsString=rs.FieldByName('CALC_UNITS').AsString)
              and
              (FnNumber.CompareFloat(r, rs.FieldByName('NEW_INPRICE').AsFloat) < 0)
            ) then
            begin
              result := -1;
            end;
       end;
  finally
    rs.Free;
  end;
end;

procedure TfrmSaleOrder.N9Click(Sender: TObject);
begin
  inherited;
  if dbState <> dsBrowse then
     begin
       ClearInvaid;
       if not edtTable.IsEmpty then if (MessageBox(Handle,'当前单据尚未结账，是否继续？','友情提示',MB_YESNO+MB_ICONQUESTION)<>6) then Exit;
     end;
  CodeLisenter := false;
  try
    TfrmCloseForDay.ShowClDy(self, self.Handle)
  finally
    CodeLisenter := true;
  end;
end;

initialization
  RegisterClass(TfrmSaleOrder);
finalization
  UnRegisterClass(TfrmSaleOrder);
end.
