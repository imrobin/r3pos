unit ufrmPosInOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmOrderForm, RzButton, RzPanel, cxTextEdit, cxDropDownEdit,
  cxCalendar, cxControls, cxContainer, cxEdit, cxMaskEdit, cxButtonEdit,
  zrComboBoxList, Grids, DBGridEh, StdCtrls, RzLabel, ExtCtrls, RzBmpBtn,
  RzBorder, RzTabs, RzStatus, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZBase, Math, Menus, pngimage, RzBckgnd, jpeg, PrnDbgeh,ufrmDBGridPreview,
  ComCtrls, ToolWin, ImgList, FR_Class, BaseGrid, AdvGrid, IniFiles,
  MPlayer;

type
  TfrmPosInOrder = class(TfrmOrderForm)
    TabSheet2: TRzTabSheet;
    cdsHeader: TZQuery;
    cdsDetail: TZQuery;
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
    edtBK_CLIENT_ID: TRzPanel;
    RzPanel21: TRzPanel;
    RzLabel6: TRzLabel;
    edtCLIENT_ID: TzrComboBoxList;
    edtBK_SALES_DATE: TRzPanel;
    RzPanel20: TRzPanel;
    RzLabel7: TRzLabel;
    edtSTOCK_DATE: TcxDateEdit;
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
    RzPanel5: TRzPanel;
    Image1: TImage;
    Image3: TImage;
    Image4: TImage;
    serachText: TEdit;
    btnFind: TRzBmpButton;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel12: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel13: TRzLabel;
    RzLabel14: TRzLabel;
    RzLabel15: TRzLabel;
    RzPanel19: TRzPanel;
    Image5: TImage;
    MarqueeStatus: TRzMarqueeStatus;
    Image6: TImage;
    Image7: TImage;
    PrintDBGridEh1: TPrintDBGridEh;
    frfStockOrder: TfrReport;
    RzPanel4: TRzPanel;
    RzPanel16: TRzPanel;
    GodsRzPageControl: TRzPageControl;
    GodsGrid_1: TRzTabSheet;
    GodsGrid_2: TRzTabSheet;
    GodsGrid_3: TRzTabSheet;
    GodsStringGrid: TAdvStringGrid;
    DelGodsShortCust: TPopupMenu;
    DeleteShortCut: TMenuItem;
    edtBK_ACCT_MNY: TRzPanel;
    RzLabel9: TRzLabel;
    RzPanel7: TRzPanel;
    RzLabel10: TRzLabel;
    edtACCT_MNY: TcxTextEdit;
    edtAGIO_RATE: TcxTextEdit;
    RzPanel8: TRzPanel;
    RzLabel11: TRzLabel;
    btnSave: TRzBmpButton;
    RzToolButton4: TRzToolButton;
    btnHangup: TRzBmpButton;
    btnPickUp: TRzBmpButton;
    RzBmpButton6: TRzBmpButton;
    btnNew: TRzBmpButton;
    RzPanel10: TRzPanel;
    godsAmount: TRzPanel;
    procedure edtTableAfterPost(DataSet: TDataSet);
    procedure DBGridEh1Columns1BeforeShowControl(Sender: TObject);
    procedure DBGridEh1Columns5UpdateData(Sender: TObject;
      var Text: String; var Value: Variant; var UseText, Handled: Boolean);
    procedure DBGridEh1Columns6UpdateData(Sender: TObject;
      var Text: String; var Value: Variant; var UseText, Handled: Boolean);
    procedure btnSaveClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
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
    procedure DBGridEh1Columns8UpdateData(Sender: TObject;
      var Text: String; var Value: Variant; var UseText, Handled: Boolean);
    procedure edtInputKeyPress(Sender: TObject; var Key: Char);
    procedure edtPAY_TOTALPropertiesChange(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure serachTextEnter(Sender: TObject);
    procedure serachTextExit(Sender: TObject);
    procedure edtTableAfterDelete(DataSet: TDataSet);
    procedure serachTextChange(Sender: TObject);
    procedure DBGridEh1CellClick(Column: TColumnEh);
    procedure cdsListBeforeOpen(DataSet: TDataSet);
    procedure serachTextKeyPress(Sender: TObject; var Key: Char);
    procedure btnPreviewClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure frfStockOrderGetValue(const ParName: String;
      var ParValue: Variant);
    procedure frfStockOrderUserFunction(const Name: String; p1, p2,
      p3: Variant; var Val: Variant);
    procedure edtACCT_MNYKeyPress(Sender: TObject; var Key: Char);
    procedure edtAGIO_RATEKeyPress(Sender: TObject; var Key: Char);
    procedure DeleteShortCutClick(Sender: TObject);
    procedure GodsStringGridClickCell(Sender: TObject; ARow,
      ACol: Integer);
    procedure GodsStringGridDblClickCell(Sender: TObject; ARow,
      ACol: Integer);
    procedure GodsStringGridGetAlignment(Sender: TObject; ARow,
      ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure GodsStringGridGetCellBorder(Sender: TObject; ARow,
      ACol: Integer; APen: TPen; var Borders: TCellBorders);
    procedure GodsRzPageControlChange(Sender: TObject);
    procedure helpClick(Sender: TObject);
    procedure RzBmpButton1Click(Sender: TObject);
    procedure RzBmpButton2Click(Sender: TObject);
    procedure RzToolButton4Click(Sender: TObject);
    procedure edtAGIO_RATEExit(Sender: TObject);
    procedure edtCLIENT_IDAddClick(Sender: TObject);
    procedure RzBmpButton6Click(Sender: TObject);
    procedure btnHangupClick(Sender: TObject);
    procedure btnPickUpClick(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure edtCLIENT_IDDblClick(Sender: TObject);
  private
    AObj:TRecord_;
    //默认发票类型
    DefInvFlag:integer;
    //普通税率
    InRate2:Currency;
    //增值税率
    InRate3:Currency;
    //结算金额
    TotalFee:Currency;
    //结算数量
    TotalAmt:Currency;

    searchTxt:string;
    GodsArray:Array[0..7] of Array[0..3] of string;
    procedure DBGridPrint;
  protected
    procedure SetdbState(const Value: TDataSetState);override;
    procedure SetinputFlag(const Value: integer);override;
    procedure getGodsInfo(godsId:string);
    function  checkPayment:boolean;
    procedure DoShowPayment;
    procedure Calc;override; //2011.06.09判断是否限量
    procedure InitPrice(GODS_ID,UNIT_ID:string);override;
    function  getPaymentTitle(pay:string):string;

    //快捷键
    function  doShortCut(s:string):boolean;override;
    procedure DoIsPresent(s:string);
    procedure DoCustId(s:string);override;
    procedure DoGuideUser(s:string);
    procedure DoNewOrder;
    procedure DoSaveOrder;
    procedure DoHangUp;
    procedure DoPickUp;
    procedure DoPayZero(s:string);
    procedure DoPayInput(s:string;flag:string);

    procedure BarcodeInput(_Buf:string);override;

    procedure AdjustGodsStringGrid;
    procedure InitGodsStringGrid;
    procedure SaveGodsStringGrid;
    procedure LoadGodsStringGrid;
    procedure ClearGodsStringGrid;
    procedure CheckGodsStringGrid;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure showForm;override;
    procedure ajustPostion;override;

    procedure NewOrder;override;
    procedure EditOrder;override;
    procedure DeleteOrder;override;
    procedure SaveOrder;override;
    procedure CancelOrder;override;
    procedure Open(id:string);override;

    procedure PrintOrder;override;
    procedure PreviewOrder;override;

    procedure OpenList;
  end;

var frmPosInOrder: TfrmPosInOrder;

implementation

uses utokenFactory,udllDsUtil,udllShopUtil,uFnUtil,udllGlobal,udataFactory,uCacheFactory,
     ufrmSaveDesigner,ufrmPayMent,ufrmOrderPreview,ufrmSelectGoods,ufrmSupplierDialog,
     ufrmHangUpFile;

{$R *.dfm}

{ TfrmSaleOrder }

procedure TfrmPosInOrder.Calc;
var
  r:integer;
  Controls:boolean;
  orgFee:Currency;
begin
  Controls := edtTable.ControlsDisabled;
  edtTable.DisableControls;
  try
    r := edtTable.FieldByName('SEQNO').AsInteger;
    orgFee := TotalFee;
    TotalFee := 0;
    edtTable.First;
    while not edtTable.Eof do
      begin
        TotalFee := TotalFee + edtTable.FieldByName('CALC_MONEY').AsFloat;
        TotalAmt := TotalAmt + edtTable.FieldByName('AMOUNT').AsFloat;
        edtTable.Next;
      end;
  finally
    edtTable.Locate('SEQNO',r,[]); 
    if not Controls then edtTable.EnableControls;
  end;
  if (dbState<>dsBrowse) then
  begin
    AObj.FieldByName('STOCK_AMT').AsFloat := TotalAmt;
    AObj.FieldByName('STOCK_MNY').AsFloat := TotalFee;
    if orgFee<>TotalFee then
       AObj.FieldByName('PAY_ZERO').AsFloat := 0;

    edtACCT_MNY.Text := FormatFloat('#0.00',TotalFee);
    edtAGIO_RATE.Text := '100.0';
    DoShowPayment;
  end;
end;

procedure TfrmPosInOrder.CancelOrder;
begin
  if dbState = dsBrowse then Exit;
  if dbState = dsInsert then
     NewOrder
  else
     Open(AObj.FieldByName('STOCK_ID').AsString);
end;

constructor TfrmPosInOrder.Create(AOwner: TComponent);
begin
  inherited;
  AObj := TRecord_.Create;
end;

procedure TfrmPosInOrder.DeleteOrder;
begin
  if cdsHeader.IsEmpty then Raise Exception.Create('不能删除空单据');
  if copy(cdsHeader.FieldByName('COMM').AsString,1,1)= '1' then Raise Exception.Create('已经同步的数据不能删除');
  if MessageBox(Handle,'是否真想删除当前单据?',pchar(Application.Title),MB_YESNO+MB_ICONQUESTION)<>6 then Exit;
  cdsHeader.Delete;
  cdsDetail.First;
  while not cdsDetail.Eof do cdsDetail.Delete;
  dataFactory.BeginBatch;
  try
    dataFactory.AddBatch(cdsHeader,'TStockOrderV60');
    dataFactory.AddBatch(cdsDetail,'TStockDataV60');
    dataFactory.CommitBatch;
  except
    dataFactory.CancelBatch;
    cdsHeader.CancelUpdates;
    cdsDetail.CancelUpdates;
    Raise;
  end;
  cdsList.Delete;
  AObj.ReadFromDataSet(cdsHeader);
  ReadFromObject(AObj,self);
  ReadFrom(cdsDetail);
  dbState := dsBrowse;
end;

destructor TfrmPosInOrder.Destroy;
begin
  AObj.Free;
  inherited;
end;

procedure TfrmPosInOrder.EditOrder;
begin
  inherited;
  if cdsHeader.IsEmpty then Raise Exception.Create('不能修改空单据');
  if cdsHeader.FieldByName('FROM_ID').AsString<>'' then Raise Exception.Create('当前版本不能处理从进货订单入库的单据。');  
  if cdsHeader.FieldByName('FIG_ID').AsString<>'' then Raise Exception.Create('当前版本不能处理从配货单生成的单据。');  
  dbState := dsEdit;
  if edtInput.CanFocus and Visible then
     edtInput.SetFocus
  else
  if edtCLIENT_ID.CanFocus and Visible then
     edtCLIENT_ID.SetFocus;
end;

procedure TfrmPosInOrder.NewOrder;
begin
  inherited;
  godsAmount.Caption := godsAmount.Hint;
  Open('');
  dbState := dsInsert;
  AObj.FieldByName('TENANT_ID').AsString := token.tenantId;
  AObj.FieldByName('SHOP_ID').AsString := token.shopId;

  AObj.FieldByName('DEPT_ID').AsString := dllGlobal.getMyDeptId;

  AObj.FieldByName('STOCK_ID').AsString := TSequence.NewId();
  edtCLIENT_ID.KeyValue := token.tenantId;
  edtCLIENT_ID.Text := token.tenantName;

  AObj.FieldByName('STOCK_AMT').AsFloat := 0;
  AObj.FieldByName('STOCK_MNY').AsFloat := 0;
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

  edtSTOCK_DATE.Date := dllGlobal.SysDate;

  AObj.FieldByName('GUIDE_USER').AsString := token.userId;

  AObj.FieldByName('INVOICE_FLAG').AsInteger := DefInvFlag;
  case DefInvFlag of
  1: AObj.FieldByName('TAX_RATE').AsFloat := 0;
  2: AObj.FieldByName('TAX_RATE').AsFloat := InRate2;
  3: AObj.FieldByName('TAX_RATE').AsFloat := InRate3;
  end;
  InitRecord;
  if edtInput.CanFocus and Visible then
     edtInput.SetFocus
  else
  if edtCLIENT_ID.CanFocus and Visible then
     edtCLIENT_ID.SetFocus;
end;

procedure TfrmPosInOrder.Open(id: string);
var
  Params:TftParamList;
begin
  inherited;
//  if id='' then dataFactory.MoveToSqlite else dataFactory.MoveToDefault;
  Params := TftParamList.Create(nil);
  try
    Params.ParamByName('TENANT_ID').AsInteger := StrtoInt(token.tenantId);
    Params.ParamByName('STOCK_ID').AsString := id;
    Params.ParamByName('VIW_GOODSINFO').AsString := dllGlobal.GetViwGoodsInfo('TENANT_ID,GODS_ID,GODS_CODE,GODS_NAME,BARCODE',true);
    dataFactory.BeginBatch;
    try
      dataFactory.AddBatch(cdsHeader,'TStockOrderV60',Params);
      dataFactory.AddBatch(cdsDetail,'TStockDataV60',Params);
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
  finally
    dataFactory.MoveToDefault;
    Params.Free;
  end;
end;

procedure TfrmPosInOrder.SaveOrder;
begin
  if dbState = dsBrowse then Exit;

  if edtSTOCK_DATE.EditValue = null then Raise Exception.Create('进货日期不能为空');
  if edtCLIENT_ID.AsString = '' then Raise Exception.Create('供应商不能为空');

  ClearInvaid;
  if edtTable.IsEmpty then Raise Exception.Create('不能保存一张空单据...');
  CheckInvaid;
  WriteToObject(AObj,self);

  AObj.FieldByName('STOCK_TYPE').AsInteger := 1;
  AObj.FieldByName('CREA_DATE').AsString := formatdatetime('YYYY-MM-DD HH:NN:SS',now());
  AObj.FieldByName('CREA_USER').AsString := token.userId;
  AObj.FieldByName('CHK_DATE').AsString := formatdatetime('YYYY-MM-DD',dllGlobal.SysDate);
  AObj.FieldByName('CHK_USER').AsString := token.userId;
  AObj.FieldByName('LOCUS_STATUS').AsString := '3';
  if not checkPayment then Exit;
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
         cdsDetail.FieldByName('STOCK_ID').AsString := cdsHeader.FieldByName('STOCK_ID').AsString;
         cdsDetail.Post;
         cdsDetail.Next;
       end;
    dataFactory.AddBatch(cdsHeader,'TStockOrderV60');
    dataFactory.AddBatch(cdsDetail,'TStockDataV60');
    dataFactory.CommitBatch;
  except
    dataFactory.CancelBatch;
    cdsHeader.CancelUpdates;
    cdsDetail.CancelUpdates;
    Raise;
  end;
  dbState := dsBrowse;
end;

procedure TfrmPosInOrder.edtTableAfterPost(DataSet: TDataSet);
begin
  inherited;
  if not edtTable.ControlsDisabled then Calc;
end;

procedure TfrmPosInOrder.showForm;
begin
  inherited;
  InRate2 := StrtoFloatDef(dllGlobal.GetParameter('IN_RATE2'),0.05);
  InRate3 := StrtoFloatDef(dllGlobal.GetParameter('IN_RATE3'),0.17);
  DefInvFlag := StrtoIntDef(dllGlobal.GetParameter('IN_INV_FLAG'),1);
  edtCLIENT_ID.DataSet := dllGlobal.GetZQueryFromName('PUB_CLIENTINFO');
  NewOrder;
  InitGodsStringGrid;
end;

procedure TfrmPosInOrder.DBGridEh1Columns1BeforeShowControl(
  Sender: TObject);
begin
  inherited;
  fndGODS_ID.Text := edtTable.FieldByName('GODS_NAME').AsString;
  fndGODS_ID.KeyValue := edtTable.FieldByName('GODS_ID').AsString;
  fndGODS_ID.SaveStatus;
end;

procedure TfrmPosInOrder.DBGridEh1Columns5UpdateData(Sender: TObject;
  var Text: String; var Value: Variant; var UseText, Handled: Boolean);
var r:Real;
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

procedure TfrmPosInOrder.DBGridEh1Columns6UpdateData(Sender: TObject;
  var Text: String; var Value: Variant; var UseText, Handled: Boolean);
var r:real;
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

  try
    if Text='' then
       r := 0
    else
       r := StrtoFloat(Text);
    if abs(r)>999999 then Raise Exception.Create('输入的数值过大，无效');
  except
    if length(Text)<10 then MessageBox(handle,'您输入的单价无效，请重新输入','友情提示..',MB_OK+MB_ICONINFORMATION);
    Text := TColumnEh(Sender).Field.AsString;
    Value := TColumnEh(Sender).Field.AsFloat;
    Exit;
  end;
  TColumnEh(Sender).Field.AsFloat := r;
  PriceToCalc(r);
end;

procedure TfrmPosInOrder.btnSaveClick(Sender: TObject);
begin
  inherited;
  case dbState of
  dsBrowse:begin
      NewOrder;
    end;
  else
    begin
      SaveOrder;
      // if dllGlobal.GetChkRight('12400001',2) and (MessageBox(Handle,'是否继续新增进货单？',pchar(Application.Title),MB_YESNO+MB_ICONINFORMATION)=6) then
         NewOrder
      // else
      // Open(AObj.FieldByName('SALES_ID').AsString);
    end;
  end;
end;

procedure TfrmPosInOrder.InitPrice(GODS_ID, UNIT_ID: string);
begin
  if edtTable.State = dsBrowse then edtTable.Edit;
  edtTable.FieldByName('APRICE').AsFloat :=dllGlobal.GetNewInPrice(GODS_ID,UNIT_ID);
  edtTable.FieldByName('ORG_PRICE').AsFloat :=dllGlobal.GetNewOutPrice(GODS_ID,UNIT_ID);
  case DefInvFlag of
  1: edtTable.FieldByName('TAX_RATE').AsFloat := 0;
  2: edtTable.FieldByName('TAX_RATE').AsFloat := InRate2;
  3: edtTable.FieldByName('TAX_RATE').AsFloat := InRate3;
  end;
  getGodsInfo(edtTable.FieldByName('GODS_ID').AsString);
end;

procedure TfrmPosInOrder.SetinputFlag(const Value: integer);
function getPayment:string;
var
  rs:TZQuery;
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
      lblInput.Caption := '进货类型';
      lblHint.Caption := '"1.正常进货、2.赠送商品" 请输入类型序号后按 Enter 键';
    end;
  6:begin
      FInputFlag := value;
      lblInput.Caption := '供 应 商';
      lblHint.Caption := '请输入完整的"供应商编码或手机号"后按 Enter 键';
    end;
  7:begin
      FInputFlag := value;
      lblInput.Caption := '收 货 员';
      lblHint.Caption := '请输入收货员员工编号后按 Enter 键';
    end;
  11:begin
      FInputFlag := value;
      lblInput.Caption := '应付金额';
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

procedure TfrmPosInOrder.FormKeyDown(Sender: TObject; var Key: Word;
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
end;

procedure TfrmPosInOrder.DoCustId(s:string);
var
  rs:TZQuery;
begin
  rs := TZQuery.Create(nil);
  try
    rs.Close;
    rs.SQL.Text :=
      'select CLIENT_ID,CLIENT_NAME from VIW_CLIENTINFO where TENANT_ID='+token.tenantId+' and (TELEPHONE2='''+s+''' or CLIENT_CODE='''+s+''') and COMM not in (''02'',''12'')';
    dllGlobal.OpenSqlite(rs);
    if rs.IsEmpty then Raise Exception.Create('你输入的供应商编号无效');  
    edtCLIENT_ID.KeyValue := rs.FieldByName('CLIENT_ID').AsString;
    edtCLIENT_ID.Text := rs.FieldByName('CLIENT_NAME').AsString;
  finally
    rs.free;
  end;
end;

procedure TfrmPosInOrder.DoGuideUser(s:string);
var
  rs:TZQuery;
begin
  rs := dllGlobal.GetZQueryFromName('CA_USERS');
  if rs.Locate('ACCOUNT',s,[]) then
     begin
       AObj.FieldByName('GUIDE_USER').AsString := rs.FieldByName('USER_ID').AsString;
     end;
end;

procedure TfrmPosInOrder.DoIsPresent(s:string);
begin
  if edtTable.FieldByName('GODS_ID').AsString = '' then Exit;
  if s='1' then
     PresentToCalc(0)
  else
  if s='2' then
     PresentToCalc(1)
  else
     Raise Exception.Create('不支持的销售类型，请输入1-3之间的类型序号');
end;

procedure TfrmPosInOrder.DoNewOrder;
begin
  if MessageBox(Handle,'是否清除当前输入的所有商品?','友情提示..',MB_YESNO+MB_ICONQUESTION)=6 then
     NewOrder;
end;

procedure TfrmPosInOrder.DoSaveOrder;
begin
  SaveOrder;
  NewOrder;
end;

function TfrmPosInOrder.doShortCut(s: string): boolean;
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
      if s<>'' then DoPayZero(s);
    end;
  else
    result := false;
  end;
end;

procedure TfrmPosInOrder.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if char(Key) = '*' then
     begin
       if edtInput.CanFocus then edtInput.SetFocus;
       if CheckNoData then raise Exception.Create('您还没有输入商品，不能做此操作。');
       if TfrmPayMent.payment(self,totalFee-AObj.FieldByName('PAY_ZERO').AsFloat,AObj) then
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
        try
          if CheckNoData then raise Exception.Create('您还没有输入商品，不能做此操作。');
          DoSaveOrder;
          edtInput.Text := '';
        finally
          InputFlag := 1;
          edtInput.selectAll;
          edtInput.SetFocus;
        end;
     end;
  if (Key = #27) and (PageControl.ActivePageIndex = 1) then
     begin
       PageControl.ActivePageIndex := 0;
       PageControlChange(nil);
     end;
end;

procedure TfrmPosInOrder.btnNavClick(Sender: TObject);
begin
  inherited;
  case PageControl.ActivePageIndex of
  0:PageControl.ActivePageIndex := 1;
  1:PageControl.ActivePageIndex := 0;
  end;
  PageControlChange(nil);
end;

procedure TfrmPosInOrder.SetdbState(const Value: TDataSetState);
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

procedure TfrmPosInOrder.OpenList;
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
  cdsList.SQL.Text := 'select A.STOCK_ID,A.GLIDE_NO,A.STOCK_DATE,B.CLIENT_NAME,A.STOCK_MNY,A.STOCK_MNY-A.PAY_ZERO as ACCT_MNY,PAY_A+PAY_B+PAY_C+PAY_E+PAY_F+PAY_G+PAY_H+PAY_I+PAY_J as RECV_MNY,C.USER_NAME as GUIDE_USER_TEXT,A.REMARK,A.COMM_ID,A.CREA_DATE '+
    'from STK_STOCKORDER A '+
    'left outer join VIW_CLIENTINFO B on A.TENANT_ID=B.TENANT_ID and A.CLIENT_ID=B.CLIENT_ID '+
    'left outer join VIW_USERS C on A.TENANT_ID=C.TENANT_ID and A.GUIDE_USER=C.USER_ID '+
    'where A.TENANT_ID=:TENANT_ID and A.STOCK_DATE>=:D1 and A.STOCK_DATE<=:D2 and A.STOCK_TYPE in (1,3) ';
  if trim(searchTxt)<>'' then
     cdsList.SQL.Text := 'select j.* from ('+cdsList.SQL.Text+') j where CLIENT_NAME like ''%'+trim(searchTxt)+'%'' or REMARK like ''%'+trim(searchTxt)+'%'' or GLIDE_NO like ''%'+trim(searchTxt)+'%''';
  cdsList.SQL.Text := cdsList.SQL.Text + ' order by STOCK_DATE desc,GLIDE_NO desc';
  cdsList.ParamByName('TENANT_ID').AsInteger := StrtoInt(token.tenantId);
  cdsList.ParamByName('D1').AsInteger := StrtoInt(formatDatetime('YYYYMMDD',D1.Date));
  cdsList.ParamByName('D2').AsInteger := StrtoInt(formatDatetime('YYYYMMDD',D2.Date));
  dataFactory.Open(cdsList); 
end;

procedure TfrmPosInOrder.dateFlagPropertiesChange(Sender: TObject);
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

procedure TfrmPosInOrder.FormCreate(Sender: TObject);
begin
  inherited;
  dateFlag.ItemIndex := 0;
end;

procedure TfrmPosInOrder.btnFindClick(Sender: TObject);
begin
  inherited;
  OpenList;
end;

procedure TfrmPosInOrder.DBGridEh2DblClick(Sender: TObject);
begin
  inherited;
  if cdsList.IsEmpty then Exit;
  open(cdsList.FieldByName('STOCK_ID').AsString);
  PageControl.ActivePageIndex := 0;
  PageControlChange(nil);
end;

procedure TfrmPosInOrder.DBGridEh2DrawColumnCell(Sender: TObject;
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

procedure TfrmPosInOrder.RzToolButton2Click(Sender: TObject);
begin
  if cdsList.IsEmpty then Exit;
  if cdsList.FieldByName('COMM_ID').AsString <> '' then Raise Exception.Create('卷烟订单不允许修改...');
  open(cdsList.FieldByName('STOCK_ID').AsString);
  EditOrder;
  PageControl.ActivePageIndex := 0;
  PageControlChange(nil);
end;

procedure TfrmPosInOrder.RzToolButton3Click(Sender: TObject);
begin
  inherited;
  if cdsList.IsEmpty then Exit;
  open(cdsList.FieldByName('STOCK_ID').AsString);
  PageControl.ActivePageIndex := 0;
  PageControlChange(nil);
end;

procedure TfrmPosInOrder.RzToolButton1Click(Sender: TObject);
begin
  inherited;
  if cdsList.IsEmpty then Exit;
  open(cdsList.FieldByName('STOCK_ID').AsString);
  DeleteOrder;
  NewOrder;
end;

procedure TfrmPosInOrder.btnNewClick(Sender: TObject);
begin
  if MessageBox(Handle,pchar('是否'+btnNew.Caption+'当前销售单？'),'友情提示..',MB_YESNO+MB_ICONQUESTION)<>6 then Exit;
  NewOrder;
end;

procedure TfrmPosInOrder.DBGridEh1Columns8UpdateData(Sender: TObject;
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
    Value := TColumnEh(Sender).Field.AsFloat;
    Raise Exception.Create('输入无效数值型');
  end;
  if abs(r)>100 then Raise Exception.Create('输入的数值过大，无效');
  TColumnEh(Sender).Field.AsFloat := r;
  AgioToCalc(r);
end;

function TfrmPosInOrder.checkPayment: boolean;
var fee,allFee,payZero,stockMny:currency;
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
  payZero := AObj.FieldByName('PAY_ZERO').AsFloat;
  stockMny := AObj.FieldByName('STOCK_MNY').AsFloat;
  case InputFlag of
  13,14:begin
       if (TotalFee-payZero)-fee=0 then
       edtInput.Text := '' else
       edtInput.Text := FormatFloat('#0.00',(TotalFee-payZero)-fee);
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

        if abs(allFee)>abs(TotalFee-payZero) then
           begin
             Raise Exception.Create('你已经超额支付了,请正确输入付款金额');
           end;

        if fee=0 then
           AObj.FieldByName('PAY_A').AsFloat := (TotalFee-payZero)-AObj.FieldByName('PAY_D').AsFloat
        else
           AObj.FieldByName('PAY_A').AsFloat := (TotalFee-payZero)-fee-AObj.FieldByName('PAY_D').AsFloat;
     end;
  end;
  result := true;
end;

procedure TfrmPosInOrder.DoShowPayment;
var
  fee,payZero,salMny:currency;
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
  payZero := AObj.FieldByName('PAY_ZERO').AsFloat;
  salMny := AObj.FieldByName('STOCK_MNY').AsFloat;
  case dbState of
  dsBrowse:begin
      edtACCT_MNY.Text := FormatFloat('#0.00',(TotalFee-payZero));
      if TotalFee<>0 then
         edtAGIO_RATE.Text := FormatFloat('#0.0',(TotalFee-payZero)*100/TotalFee)
      else
         edtAGIO_RATE.Text := '';
    end;
  else
    begin
      edtACCT_MNY.Text := FormatFloat('#0.00',(TotalFee-payZero));
      if TotalFee<>0 then
         edtAGIO_RATE.Text := FormatFloat('#0.0',(TotalFee-payZero)*100/TotalFee)
      else
         edtAGIO_RATE.Text := '';
      if inputFlag in [13,14] then
         edtInput.Text := FormatFloat('#0.00#',(TotalFee-payZero)-(fee+AObj.FieldByName('PAY_A').AsFloat));
    end;
  end;
  s := '0000000000';
  w := 0;
  payInfo := '';
//  payment.Caption := '本次付款';
  if AObj.FieldByName('PAY_A').AsFloat<>0 then
     begin
       s[1] := '1';
//       payment.Caption := '现金付款';
       inc(w);
       payInfo := payInfo +'现金:'+FormatFloat('#0.0#',AObj.FieldByName('PAY_A').AsFloat)+ ' ';
     end;
  if AObj.FieldByName('PAY_B').AsFloat<>0 then
     begin
       s[2] := '1';
//       payment.Caption := getPaymentTitle('B')+'付款';
       inc(w);
       payInfo := payInfo +getPaymentTitle('B')+':'+FormatFloat('#0.0#',AObj.FieldByName('PAY_B').AsFloat)+ ' ';
     end;
  if AObj.FieldByName('PAY_C').AsFloat<>0 then
     begin
//       payment.Caption := getPaymentTitle('C')+'付款';
       inc(w);
       s[3] := '1';
       payInfo := payInfo +getPaymentTitle('C')+':'+FormatFloat('#0.0#',AObj.FieldByName('PAY_C').AsFloat)+ ' ';
     end;
  if AObj.FieldByName('PAY_D').AsFloat<>0 then
     begin
//       payment.Caption := getPaymentTitle('D')+'欠款';
       inc(w);
       s[4] := '0';
       payInfo := payInfo +getPaymentTitle('D')+':'+FormatFloat('#0.0#',AObj.FieldByName('PAY_D').AsFloat)+ ' ';
     end;
  if AObj.FieldByName('PAY_E').AsFloat<>0 then
     begin
//       payment.Caption := getPaymentTitle('E')+'付款';
       inc(w);
       s[5] := '1';
       payInfo := payInfo +getPaymentTitle('E')+':'+FormatFloat('#0.0#',AObj.FieldByName('PAY_E').AsFloat)+ ' ';
     end;
  if AObj.FieldByName('PAY_F').AsFloat<>0 then
     begin
//       payment.Caption := getPaymentTitle('F')+'付款';
       inc(w);
       s[6] := '1';
       payInfo := payInfo +getPaymentTitle('F')+':'+FormatFloat('#0.0#',AObj.FieldByName('PAY_F').AsFloat)+ ' ';
     end;
  if AObj.FieldByName('PAY_G').AsFloat<>0 then
     begin
//       payment.Caption := getPaymentTitle('G')+'付款';
       inc(w);
       s[7] := '1';
       payInfo := payInfo +getPaymentTitle('G')+':'+FormatFloat('#0.0#',AObj.FieldByName('PAY_G').AsFloat)+ ' ';
     end;
  if AObj.FieldByName('PAY_H').AsFloat<>0 then
     begin
//       payment.Caption := getPaymentTitle('H')+'付款';
       inc(w);
       s[8] := '1';
       payInfo := payInfo +getPaymentTitle('H')+':'+FormatFloat('#0.0#',AObj.FieldByName('PAY_H').AsFloat)+ ' ';
     end;
  if AObj.FieldByName('PAY_I').AsFloat<>0 then
     begin
//       payment.Caption := getPaymentTitle('I')+'付款';
       inc(w);
       s[9] := '1';
       payInfo := payInfo +getPaymentTitle('I')+':'+FormatFloat('#0.0#',AObj.FieldByName('PAY_I').AsFloat)+ ' ';
     end;
  if AObj.FieldByName('PAY_J').AsFloat<>0 then
     begin
//       payment.Caption := getPaymentTitle('J')+'付款';
       inc(w);
       s[10] := '1';
       payInfo := payInfo +getPaymentTitle('J')+':'+FormatFloat('#0.0#',AObj.FieldByName('PAY_J').AsFloat)+ ' ';
     end;
//  if w>1 then payment.Caption := '组合付款';
  case inputFlag of
  13: MarqueeStatus.Caption := payInfo;
  else
     begin
      if TotalFee<>0 then
         MarqueeStatus.Caption := '应收:'+FormatFloat('#0.00',(TotalFee-payZero))+'  折扣:'+FormatFloat('#0.0',(TotalFee-payZero)*100/TotalFee)+'%'
      else
         MarqueeStatus.Caption := '';
     end;
  end;
end;

procedure TfrmPosInOrder.DoHangUp;
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
  AObj.FieldByName('STOCK_TYPE').AsInteger := 1;
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
    ForceDirectories(ExtractFilePath(ParamStr(0))+'temp\stock');
    mm := TMemoryStream.Create;
    try
      mm.Clear;
      cdsHeader.SaveToStream(mm);
      mm.Position := 0;
      mm.SaveToFile(ExtractFilePath(ParamStr(0))+'temp\stock\H'+s+'.dat');

      mm.Clear;
      edtTable.SaveToStream(mm);
      mm.Position := 0;
      mm.SaveToFile(ExtractFilePath(ParamStr(0))+'temp\stock\D'+s+'.dat');

      mm.Clear;
      edtProperty.SaveToStream(mm);
      mm.Position := 0;
      mm.SaveToFile(ExtractFilePath(ParamStr(0))+'temp\stock\P'+s+'.dat');
    finally
      mm.Free;
    end;
    edtTable.EnableControls;
  except
    edtTable.EnableControls;
    Raise;
  end;
  dbState := dsBrowse;
  MessageBox(Handle,'挂单成功，取单请按F10键',pchar(Application.Title),MB_OK+MB_ICONINFORMATION);
  NewOrder;
end;

procedure TfrmPosInOrder.DoPayInput(s, flag: string);
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

procedure TfrmPosInOrder.DoPayZero(s: string);
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
       AObj.FieldByName('PAY_ZERO').AsFloat := totalFee-mny;
       edtACCT_MNY.Text := FormatFloat('#0.00',mny);
     end
  else
     begin
       AObj.FieldByName('PAY_ZERO').AsString := FormatFloat('#0.00',totalfee-(totalFee*mny/100));
       edtACCT_MNY.Text := FormatFloat('#0.00',totalfee-AObj.FieldByName('PAY_ZERO').AsFloat);
     end;
  if TotalFee<>0 then
     edtAGIO_RATE.Text := FormatFloat('#0.0',(TotalFee-AObj.FieldByName('PAY_ZERO').AsFloat)*100/TotalFee)
  else
     edtAGIO_RATE.Text := '';
  DoShowPayment;
end;

procedure TfrmPosInOrder.DoPickUp;
var
  s:string;
  h:TZQuery;
  mm:TMemoryStream;
  PayZero:real;
begin
  ClearInvaid;
  if not edtTable.IsEmpty and (MessageBox(Handle,'是否清空当前录入的所有商品？','友情提示',MB_YESNO+MB_ICONQUESTION)<>6) then Exit;
  with TfrmHangUpFile.Create(self) do
    begin
      try
        LoadFile('H','temp\stock\');
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
    mm.LoadFromFile(ExtractFilePath(ParamStr(0))+'temp\stock\H'+s);
    H.LoadFromStream(mm);
    AObj.ReadFromDataSet(H,false); 
    mm.LoadFromFile(ExtractFilePath(ParamStr(0))+'temp\stock\D'+s);
    edtTable.LoadFromStream(mm);
    mm.LoadFromFile(ExtractFilePath(ParamStr(0))+'temp\stock\P'+s);
    edtProperty.LoadFromStream(mm);
  finally
    h.Free;
    mm.Free;
  end;
  edtTable.Last;
  RowId := edtTable.FieldByName('SEQNO').AsInteger;
  PayZero := AObj.FieldByName('PAY_ZERO').AsFloat;
  DeleteFile(ExtractFilePath(ParamStr(0))+'temp\stock\H'+s);
  DeleteFile(ExtractFilePath(ParamStr(0))+'temp\stock\D'+s);
  DeleteFile(ExtractFilePath(ParamStr(0))+'temp\stock\P'+s);
  Calc;
  if AObj.FieldByName('CLIENT_ID').AsString <> '' then
     begin
       edtCLIENT_ID.KeyValue := AObj.FieldByName('CLIENT_ID').AsString;
       edtCLIENT_ID.Text := AObj.FieldByName('CLIENT_ID_TEXT').AsString;
     end;
  if PayZero <> 0 then
     begin
       DoPayZero(FloatToStr(TotalFee-PayZero));
     end;
end;

function TfrmPosInOrder.getPaymentTitle(pay: string): string;
var rs:TZQuery;
begin
  rs := dllGlobal.GetZQueryFromName('PUB_PAYMENT');
  if rs.Locate('CODE_ID',pay,[]) then
     result := rs.FieldByName('CODE_NAME').AsString
  else
     Raise Exception.Create('不支持的收款方式'); 
end;

procedure TfrmPosInOrder.edtInputKeyPress(Sender: TObject; var Key: Char);
begin
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

procedure TfrmPosInOrder.edtPAY_TOTALPropertiesChange(Sender: TObject);
//var r:currency;
begin
  inherited;
{  if edtPAY_TOTAL.Focused then
     begin
       r := StrtoFloatDef(edtPAY_TOTAL.Text,0);
       AObj.FieldByName('PAY_A').AsFloat := r;
       AObj.FieldByName('PAY_B').AsFloat := 0;
       AObj.FieldByName('PAY_C').AsFloat := 0;
       AObj.FieldByName('PAY_D').AsFloat := (totalFee-AObj.FieldByName('PAY_ZERO').AsFloat)-r;
       AObj.FieldByName('PAY_E').AsFloat := 0;
       AObj.FieldByName('PAY_F').AsFloat := 0;
       AObj.FieldByName('PAY_G').AsFloat := 0;
       AObj.FieldByName('PAY_H').AsFloat := 0;
       AObj.FieldByName('PAY_I').AsFloat := 0;
       AObj.FieldByName('PAY_J').AsFloat := 0;
       payment.Caption := '现金收款';
     end;   }
end;

procedure TfrmPosInOrder.PageControlChange(Sender: TObject);
begin
  inherited;
  case PageControl.ActivePageIndex of
  0:begin
       btnNav.Caption := '历史单据';
       lblCaption.Caption := '商品入库';
    end;
  1:begin
       btnNav.Caption := '返回';
       lblCaption.Caption := '进货单列表';
    end;
  end;
end;

procedure TfrmPosInOrder.serachTextEnter(Sender: TObject);
begin
  inherited;
  serachText.Text := searchTxt;
  serachText.SelectAll;
end;

procedure TfrmPosInOrder.serachTextExit(Sender: TObject);
begin
  inherited;
  if searchTxt='' then serachText.Text := serachText.Hint;
end;

procedure TfrmPosInOrder.edtTableAfterDelete(DataSet: TDataSet);
begin
  inherited;
  if not edtTable.ControlsDisabled then Calc;
end;

procedure TfrmPosInOrder.serachTextChange(Sender: TObject);
begin
  inherited;
  if serachText.Focused then searchTxt := serachText.Text;
end;

procedure TfrmPosInOrder.getGodsInfo(godsId: string);
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

procedure TfrmPosInOrder.DBGridEh1CellClick(Column: TColumnEh);
begin
  inherited;
  getGodsInfo(edtTable.FieldByName('GODS_ID').AsString);
end;

procedure TfrmPosInOrder.cdsListBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  rowToolNav.Visible := false;
end;

procedure TfrmPosInOrder.serachTextKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key=#13 then
     OpenList;
end;

procedure TfrmPosInOrder.btnPreviewClick(Sender: TObject);
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

procedure TfrmPosInOrder.btnPrintClick(Sender: TObject);
begin
  inherited;
  case PageControl.ActivePageIndex of
    0:
      begin
        PrintOrder;
      end;
    1:
      begin
        DBGridPrint;
        TfrmDBGridPreview.Print(self,PrintDBGridEh1);
      end;
  end;
end;

procedure TfrmPosInOrder.DBGridPrint;
begin
  inherited;
  PrintDBGridEh1.DBGridEh := DBGridEh2;
  PrintDBGridEh1.PageHeader.CenterText.Text := '进货单列表';
  DBGridEh2.DBGridTitle := '进货单列表';
  DBGridEh2.DBGridHeader.Text := '日期:'+formatDatetime('YYYY-MM-DD',D1.Date)+'至'+formatDatetime('YYYY-MM-DD',D2.Date);
  DBGridEh2.DBGridFooter.Text := ' '+#13+' 操作员:'+token.UserName+'  导出时间:'+formatDatetime('YYYY-MM-DD HH:NN:SS',now());
  PrintDBGridEh1.AfterGridText.Text := #13+'打印人:'+token.UserName+'  打印时间:'+formatDatetime('YYYY-MM-DD HH:NN:SS',now());
  PrintDBGridEh1.SetSubstitutes(['%[whr]', '日期:'+formatDatetime('YYYY-MM-DD',D1.Date)+'至'+formatDatetime('YYYY-MM-DD',D2.Date)]);
end;

procedure TfrmPosInOrder.PrintOrder;
var tid,oid:string;
begin
  inherited;
  if dbState <> dsBrowse then Raise Exception.Create('请在历史单据中打印...');
  if AObj.FieldByName('STOCK_ID').AsString = '' then Exit;
  tid := token.tenantId;
  oid := AObj.FieldByName('STOCK_ID').AsString;
  TfrmOrderPreview.PrintReport(self,0,frfStockOrder,tid,oid);
end;

procedure TfrmPosInOrder.PreviewOrder;
var
  r:integer;
  tid,oid:string;
begin
  inherited;
  if dbState <> dsBrowse then Raise Exception.Create('请在历史单据中预览...');
  if AObj.FieldByName('STOCK_ID').AsString = '' then Exit;
  r := TfrmSaveDesigner.ShowDialog(self,'frfStockOrder',nil);
  if r < 0 then Exit;
  GlobalIndex := r;
  tid := token.tenantId;
  oid := AObj.FieldByName('STOCK_ID').AsString;
  TfrmOrderPreview.ShowReport(self,0,frfStockOrder,tid,oid,'进货单');
end;

procedure TfrmPosInOrder.frfStockOrderGetValue(const ParName: String;
  var ParValue: Variant);
begin
  inherited;
  if ParName='企业名称' then ParValue := token.tenantName;
  if ParName='打印人' then ParValue := token.username;
end;

procedure TfrmPosInOrder.frfStockOrderUserFunction(const Name: String; p1,
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

procedure TfrmPosInOrder.BarcodeInput(_Buf: string);
begin
  inherited;

end;

procedure TfrmPosInOrder.edtACCT_MNYKeyPress(Sender: TObject; var Key: Char);
var r,fee:currency;
begin
  inherited;
  if Key=#13 then
     begin
       if abs(StrtoFloatDef(edtACCT_MNY.Text,0))>TotalFee then edtACCT_MNY.Text := FloatToStr(TotalFee);
       r := StrtoFloatDef(edtACCT_MNY.Text,0);
       AObj.FieldByName('PAY_ZERO').AsFloat := TotalFee-r;
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
//       if fee=0 then
//          edtPAY_TOTAL.Text := FormatFloat('#0.00',r)
//       else
//          edtPAY_TOTAL.Text := FormatFloat('#0.00',fee+AObj.FieldByName('PAY_A').AsFloat);
       DoShowPayment;
     end;
end;

procedure TfrmPosInOrder.edtAGIO_RATEKeyPress(Sender: TObject;
  var Key: Char);
var r,fee:currency;
begin
  inherited;
  if Key=#13 then
     begin
       r := StrtoFloatDef(edtAGIO_RATE.Text,0);
       AObj.FieldByName('PAY_ZERO').AsFloat := TotalFee-roundTo(TotalFee*r/100,-2);
       edtACCT_MNY.Text := FormatFloat('#0.00',TotalFee-AObj.FieldByName('PAY_ZERO').AsFloat);
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
//       if fee=0 then
//          edtPAY_TOTAL.Text := FormatFloat('#0.00',r)
//       else
//          edtPAY_TOTAL.Text := FormatFloat('#0.00',fee+AObj.FieldByName('PAY_A').AsFloat);
       DoShowPayment;
     end;
end;

procedure TfrmPosInOrder.edtAGIO_RATEExit(Sender: TObject);
var Key:Char;
begin
  inherited;
  Key := #13;
  edtAGIO_RATEKeyPress(nil,Key);
end;

procedure TfrmPosInOrder.CheckGodsStringGrid;
var r,c:integer;
begin
 for r:=0 to GodsStringGrid.RowCount - 1 do
   begin
     for c:=0 to GodsStringGrid.ColCount - 1 do
       begin
         if (r mod 2 = 0) and (GodsArray[r,c] = '') then
            begin
              GodsStringGrid.Cells[c,r] := '+';
              GodsStringGrid.FontSizes[c,r] := 30;
              GodsStringGrid.FontColors[c,r] := clSilver;
              Exit;
            end;
       end;
   end;
end;

procedure TfrmPosInOrder.ClearGodsStringGrid;
var r,c:integer;
begin
 for r:=0 to GodsStringGrid.RowCount - 1 do
   begin
     for c:=0 to GodsStringGrid.ColCount - 1 do
       begin
          GodsArray[r,c] := '';
          GodsStringGrid.Cells[c,r] := '';
       end;
   end;
end;

procedure TfrmPosInOrder.AdjustGodsStringGrid;
begin
  GodsStringGrid.RowHeights[0] := (GodsStringGrid.Height - 1) * 70 div 400;
  GodsStringGrid.RowHeights[2] := (GodsStringGrid.Height - 1) * 70 div 400;
  GodsStringGrid.RowHeights[4] := (GodsStringGrid.Height - 1) * 70 div 400;
  GodsStringGrid.RowHeights[6] := (GodsStringGrid.Height - 1) * 70 div 400;

  GodsStringGrid.RowHeights[1] := (GodsStringGrid.Height - 1) * 30 div 400;
  GodsStringGrid.RowHeights[3] := (GodsStringGrid.Height - 1) * 30 div 400;
  GodsStringGrid.RowHeights[5] := (GodsStringGrid.Height - 1) * 30 div 400;
  GodsStringGrid.RowHeights[7] := (GodsStringGrid.Height - 1) * 30 div 400;

  GodsStringGrid.ColWidths[0] := (GodsStringGrid.Width - 2) div 4;
  GodsStringGrid.ColWidths[1] := (GodsStringGrid.Width - 2) div 4;
  GodsStringGrid.ColWidths[2] := (GodsStringGrid.Width - 2) div 4;
  GodsStringGrid.ColWidths[3] := (GodsStringGrid.Width - 1) div 4;
end;

procedure TfrmPosInOrder.InitGodsStringGrid;
var i,j:integer;
begin
  AdjustGodsStringGrid;
  GodsStringGrid.GridLineWidth := 0;
  GodsStringGrid.VAlignment := vtaCenter;

  for i:=0 to GodsStringGrid.RowCount-1 do
  begin
    if i mod 2 = 1 then
       begin
         GodsStringGrid.FontColors[0,i] := clRed;
         GodsStringGrid.FontColors[1,i] := clRed;
         GodsStringGrid.FontColors[2,i] := clRed;
         GodsStringGrid.FontColors[3,i] := clRed;
       end
    else
       begin
         GodsStringGrid.FontColors[0,i] := $002F2F2F;
         GodsStringGrid.FontColors[1,i] := $002F2F2F;
         GodsStringGrid.FontColors[2,i] := $002F2F2F;
         GodsStringGrid.FontColors[3,i] := $002F2F2F;
       end;
  end;

  for i:=0 to GodsStringGrid.RowCount-1 do
    begin
      for j:=0 to GodsStringGrid.ColCount-1 do
        begin
          GodsStringGrid.Colors[j,i] := $00EFEFEF;
          GodsStringGrid.FontNames[j,i] := '微软雅黑';
          GodsStringGrid.Alignments[j,i] := taCenter;
        end;
    end;
  LoadGodsStringGrid;
  CheckGodsStringGrid;
end;

procedure TfrmPosInOrder.LoadGodsStringGrid;
  procedure FillCell(GodsId:string);
  var
    r,c:integer;
    gs,us:TZQuery;
  begin
    gs := dllGlobal.GetZQueryFromName('PUB_GOODSINFO');
    us := dllGlobal.GetZQueryFromName('PUB_MEAUNITS');
    if not gs.Locate('GODS_ID',GodsId,[]) then Exit;
    for r:=0 to GodsStringGrid.RowCount - 1 do
      begin
        for c:=0 to GodsStringGrid.ColCount - 1 do
          begin
            if (r mod 2 = 0) and (GodsArray[r,c] = '') then
               begin
                 GodsArray[r,c] := GodsId;
                 GodsStringGrid.FontSizes[c,r] := 10;
                 GodsStringGrid.FontColors[c,r] := $002F2F2F;
                 GodsStringGrid.Cells[c,r] := gs.FieldByName('GODS_NAME').AsString;
                 GodsStringGrid.Cells[c,r+1] := gs.FieldByName('NEW_INPRICE').AsString+'元';
                 if us.Locate('UNIT_ID',gs.FieldByName('CALC_UNITS').AsString,[]) then
                    begin
                      GodsStringGrid.Cells[c,r+1] := GodsStringGrid.Cells[c,r+1] +'/'+ us.FieldByName('UNIT_NAME').AsString;
                    end;
                 Exit;
               end
          end;
      end;
  end;
var
  F:TIniFile;
  Section:string;
  i:integer;
  GodsList:TStrings;
begin
  inherited;
  ClearGodsStringGrid;
  Section := 'GODS_SHORTCUT_'+inttostr(GodsRzPageControl.ActivePageIndex);
  GodsList := TStringList.Create;
  F := TIniFile.Create(ExtractFilePath(Application.ExeName)+'temp\GodsShortCut.ini');
  try
    F.ReadSection(Section,GodsList);
    for i:=0 to GodsList.Count - 1 do
      begin
        FillCell(F.ReadString(Section,GodsList[i],''));
      end;
  finally
    try
      F.Free;
      GodsList.Free;
    except
    end;
  end;
end;

procedure TfrmPosInOrder.SaveGodsStringGrid;
var
  F:TIniFile;
  c,r,idx:integer;
  Section:string;
begin
  inherited;
  idx := 1;
  Section := 'GODS_SHORTCUT_'+inttostr(GodsRzPageControl.ActivePageIndex);
  F := TIniFile.Create(ExtractFilePath(Application.ExeName)+'temp\GodsShortCut.ini');
  try
    F.EraseSection(Section);
    for r:=0 to GodsStringGrid.RowCount - 1 do
      begin
        for c:=0 to GodsStringGrid.ColCount - 1 do
          begin
            if (r mod 2 = 0) and (trim(GodsArray[r,c]) <> '') then
               begin
                 F.WriteString(Section,'GODS_'+inttostr(idx),GodsArray[r,c]);
                 inc(idx);
               end; 
          end;
      end;
  finally
    try
      F.Free;
    except
    end;
  end;
end;

procedure TfrmPosInOrder.DeleteShortCutClick(Sender: TObject);
var row,col:integer;
begin
  inherited;
  row := GodsStringGrid.Row;
  col := GodsStringGrid.Col;
  if (col < 0) or (col > GodsStringGrid.ColCount - 1) then Exit;
  if (row < 0) or (row > GodsStringGrid.RowCount - 1) then Exit;
  if row mod 2 = 1 then row := row - 1;
  if GodsArray[row,col] = '' then Exit;
  GodsArray[row,col] := '';
  SaveGodsStringGrid;
  LoadGodsStringGrid;
  CheckGodsStringGrid;
end;

procedure TfrmPosInOrder.GodsStringGridClickCell(Sender: TObject; ARow,ACol: Integer);
var
  gs,us:TZQuery;
  col,row:integer;
begin
  inherited;
  gs := dllGlobal.GetZQueryFromName('PUB_GOODSINFO');
  us := dllGlobal.GetZQueryFromName('PUB_MEAUNITS');
  col := ACol;
  row := ARow;
  if ARow mod 2 = 1 then row := row - 1;
  if (GodsStringGrid.Cells[col,row] = '+') and (GodsArray[row,col] = '') then
     begin
       with TfrmSelectGoods.Create(self) do
         begin
           try
             if ShowModal=MROK then
                begin
                  GodsArray[row,col] := cdsList.FieldByName('GODS_ID').AsString;
                  GodsStringGrid.FontSizes[col,row] := 10;
                  GodsStringGrid.FontColors[col,row] := $002F2F2F;
                  GodsStringGrid.Cells[col,row] := cdsList.FieldByName('GODS_NAME').AsString;
                  GodsStringGrid.Cells[col,row+1] := cdsList.FieldByName('NEW_INPRICE').AsString+'元';
                  if gs.Locate('GODS_ID',cdsList.FieldByName('GODS_ID').AsString,[]) then
                     begin
                       if us.Locate('UNIT_ID',gs.FieldByName('CALC_UNITS').AsString,[]) then
                          begin
                            GodsStringGrid.Cells[col,row+1] := GodsStringGrid.Cells[col,row+1] +'/'+ us.FieldByName('UNIT_NAME').AsString;
                          end;
                     end;
                  SaveGodsStringGrid;
                  CheckGodsStringGrid;
                end;
             finally
               Free;
             end;
         end
     end
end;

procedure TfrmPosInOrder.GodsStringGridDblClickCell(Sender: TObject; ARow,ACol: Integer);
var
  gs:TZQuery;
  col,row:integer;
  AObj_:TRecord_;
begin
  inherited;
  if (dbState=dsBrowse) then
  begin
    if AObj.FieldByName('STOCK_AMT').AsFloat<0 then
    begin
      MessageBox(Handle,'当前单据已经是退货状态，不能再添加商品！','友情提示...',MB_OK+MB_ICONQUESTION);
      Exit;
    end;
    if MessageBox(Handle,'已做单据不能添加商品，是否启用编辑并添加商品？','友情提示...',MB_YESNO+MB_ICONQUESTION)=6 then
      EditOrder
    else
      Exit;
  end;
  gs := dllGlobal.GetZQueryFromName('PUB_GOODSINFO');
  col := ACol;
  row := ARow;
  if ARow mod 2 = 1 then row := row - 1;
  if GodsArray[row,col] <> '' then
     begin
       AObj_:=TRecord_.Create;
       try
         if gs.Locate('GODS_ID',GodsArray[row,col],[]) then
            begin
              AObj_.ReadFromDataSet(gs);
              AddRecord(AObj_,gs.FieldByName('CALC_UNITS').AsString);
              WriteAmount(gs.FieldByName('CALC_UNITS').AsString,'#','#',1,true);
            end;
       finally
         AObj_.Free;
       end;
     end;
end;

procedure TfrmPosInOrder.GodsStringGridGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  inherited;
  VAlign := vtaCenter;
end;

procedure TfrmPosInOrder.GodsStringGridGetCellBorder(Sender: TObject; ARow,
  ACol: Integer; APen: TPen; var Borders: TCellBorders);
begin
  inherited;
  APen.Width := 1;
  APen.Color := clSilver;
  Borders := [cbBottom,cbRight];
  if ARow = GodsStringGrid.RowCount - 1 then Borders := Borders - [cbBottom];
  if ACol = GodsStringGrid.ColCount - 1 then Borders := Borders - [cbRight];
  if ARow mod 2 = 0 then
     begin
       Borders := Borders - [cbBottom];
     end;
end;

procedure TfrmPosInOrder.GodsRzPageControlChange(Sender: TObject);
begin
  inherited;
  LoadGodsStringGrid;
  CheckGodsStringGrid;
end;

procedure TfrmPosInOrder.helpClick(Sender: TObject);
begin
  inherited;
  AdjustGodsStringGrid;
end;

procedure TfrmPosInOrder.ajustPostion;
begin
  inherited;
  AdjustGodsStringGrid;
end;

procedure TfrmPosInOrder.RzBmpButton1Click(Sender: TObject);
begin
  inherited;
  DoHangUp;
end;

procedure TfrmPosInOrder.RzBmpButton2Click(Sender: TObject);
begin
  inherited;
  DoPickUp;
end;

procedure TfrmPosInOrder.RzToolButton4Click(Sender: TObject);
var
   _obj,hdr:TRecord_;
   rs,edt:TZQuery;
begin
   inherited;
   Open(cdsList.FieldByName('STOCK_ID').AsString);
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
     AObj.FieldByName('PAY_ZERO').AsString := hdr.FieldByName('PAY_ZERO').AsString;
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
     AObj.FieldByName('PAY_ZERO').AsFloat := -hdr.FieldByName('PAY_ZERO').AsFloat;
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

procedure TfrmPosInOrder.edtCLIENT_IDAddClick(Sender: TObject);
var SObj:TRecord_;
begin
  inherited;
  SObj := TRecord_.Create;
  try
    if TfrmSupplierDialog.ShowDialog(self,'',SObj) then
       begin
         edtCLIENT_ID.KeyValue := SObj.FieldByName('CLIENT_ID').AsString;
         edtCLIENT_ID.Text := SObj.FieldByName('CLIENT_NAME').AsString;
         AObj.FieldByName('CLIENT_ID').AsString := SObj.FieldByName('CLIENT_ID').AsString;
       end;
  finally
    SObj.Free;
  end;
end;

procedure TfrmPosInOrder.RzBmpButton6Click(Sender: TObject);
begin
  inherited;
  ImportExcelClick(nil);
end;

procedure TfrmPosInOrder.btnHangupClick(Sender: TObject);
begin
  inherited;
  DoHangUp;
end;

procedure TfrmPosInOrder.btnPickUpClick(Sender: TObject);
begin
  inherited;
  DoPickUp;
end;

procedure TfrmPosInOrder.DBGridEh1DrawColumnCell(Sender: TObject;
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
              if (FnNumber.CompareFloat(CurPrice, OrgPrice) > 0)
                 or
                 (FnNumber.CompareFloat(CurPrice, OrgPrice * 0.3) < 0) then
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

procedure TfrmPosInOrder.edtCLIENT_IDDblClick(Sender: TObject);
var
  rs:TZQuery;
  SObj:TRecord_;
begin
  inherited;
  if edtCLIENT_ID.AsString = '' then Exit;
  rs := dllGlobal.GetZQueryFromName('PUB_CLIENTINFO');
  if rs.Locate('CLIENT_ID', edtCLIENT_ID.AsString, []) then
     begin
       if rs.FieldByName('FLAG').AsString = '0' then
          begin
            SObj := TRecord_.Create;
            try
              if TfrmSupplierDialog.ShowDialog(self, edtCLIENT_ID.AsString, SObj) then
                 begin
                   edtCLIENT_ID.KeyValue := SObj.FieldByName('CLIENT_ID').AsString;
                   edtCLIENT_ID.Text := SObj.FieldByName('CLIENT_NAME').AsString;
                   AObj.FieldByName('CLIENT_ID').AsString := SObj.FieldByName('CLIENT_ID').AsString;
                 end;
            finally
              SObj.Free;
            end;
          end;
     end;
end;

initialization
  RegisterClass(TfrmPosInOrder);
finalization
  UnRegisterClass(TfrmPosInOrder);
end.
