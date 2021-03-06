unit uframeOrderForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmBasic, ActnList, Menus, ExtCtrls, RzPanel, Grids, DBGridEh,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit,
  zrComboBoxList, DB, StdCtrls, ZBase, Math, Buttons, RzTabs,
  cxDropDownEdit, ZAbstractRODataset, ZAbstractDataset, ZDataset;

const

  WM_DIALOG_PULL=WM_USER+1;
  //状态改变
  WM_STATUS_CHANGE=WM_USER+2;
  //单据操作
  WM_EXEC_ORDER=WM_USER+3;

  WM_INIT_RECORD=WM_USER+4;
  WM_NEXT_RECORD=WM_USER+5;
  WM_PRIOR_RECORD=WM_USER+6;
  WM_JOIN_DATA=WM_USER+8;
  //填充数据
  WM_FILL_DATA=WM_USER+7;
  //尺码，颜色编辑框
  PROPERTY_DIALOG=1;
  //批号、有效期输入框
  BATCH_NO_DIALOG=2;
  //添加商品对话框
  ADD_GOODS_DIALOG=3;
  //查询商品对话框
  FIND_GOODS_DIALOG=4;
type

  TframeOrderForm = class(TfrmBasic)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    RzPanel3: TRzPanel;
    DBGridEh1: TDBGridEh;
    fndGODS_ID: TzrComboBoxList;
    pnlBarCode: TRzPanel;
    lblInput: TLabel;
    lblHint: TLabel;
    edtInput: TcxTextEdit;
    dsTable: TDataSource;
    stbHint: TRzPanel;
    RzPanel4: TRzPanel;
    Shape1: TShape;
    lblCaption: TLabel;
    Image1: TImage;
    lblState: TLabel;
    PopupMenu1: TPopupMenu;
    rzHelp: TRzPanel;
    fndUNIT_ID: TcxComboBox;
    mnuDeleteGods: TMenuItem;
    mnuGodsProperty: TMenuItem;
    actCopyToNew: TMenuItem;
    munInsertRow: TMenuItem;
    munAppendRow: TMenuItem;
    munDivRow0: TMenuItem;
    edtTable: TZQuery;
    edtProperty: TZQuery;
    munDivRow1: TMenuItem;
    actLocusNo: TAction;
    actBatchNo: TAction;
    actUnitConvert: TAction;
    actIsPressent: TAction;
    mnuBatchNo: TMenuItem;
    munUnitConvert: TMenuItem;
    mnuIsPressent: TMenuItem;
    Excel1: TMenuItem;
    GodsCompare: TMenuItem;
    fndBATCH_NO: TzrComboBoxList;
    cdsBatchNo: TZQuery;
    fndLOCATION_ID: TzrComboBoxList;
    cdsLocationInfo: TZQuery;
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1DrawFooterCell(Sender: TObject; DataCol,
      Row: Integer; Column: TColumnEh; Rect: TRect; State: TGridDrawState);
    procedure DBGridEh1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure fndGODS_IDEnter(Sender: TObject);
    procedure fndGODS_IDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fndGODS_IDKeyPress(Sender: TObject; var Key: Char);
    procedure fndGODS_IDSaveValue(Sender: TObject);
    procedure DBGridEh1DrawFouseRect(Sender: TObject);
    procedure fndGODS_IDAddClick(Sender: TObject);
    procedure edtInputKeyPress(Sender: TObject; var Key: Char);
    procedure fndGODS_IDFindClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtTableBeforePost(DataSet: TDataSet);
    procedure edtTableAfterOpen(DataSet: TDataSet);
    procedure DBGridEh1Columns1BeforeShowControl(Sender: TObject);
    procedure edtTableNewRecord(DataSet: TDataSet);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtInputKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtInputExit(Sender: TObject);
    procedure fndGODS_IDExit(Sender: TObject);
    procedure DBGridEh1Columns3BeforeShowControl(Sender: TObject);
    procedure fndUNIT_IDExit(Sender: TObject);
    procedure fndUNIT_IDEnter(Sender: TObject);
    procedure fndUNIT_IDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fndUNIT_IDKeyPress(Sender: TObject; var Key: Char);
    procedure fndUNIT_IDPropertiesChange(Sender: TObject);
    procedure edtTableAfterScroll(DataSet: TDataSet);
    procedure mnuDeleteGodsClick(Sender: TObject);
    procedure mnuGodsPropertyClick(Sender: TObject);
    procedure actCopyToNewClick(Sender: TObject);
    procedure uf(Sender: TObject);
    procedure munAppendRowClick(Sender: TObject);
    procedure actLocusNoExecute(Sender: TObject);
    procedure actBatchNoExecute(Sender: TObject);
    procedure actUnitConvertExecute(Sender: TObject);
    procedure actIsPressentExecute(Sender: TObject);
    procedure actIntegralExecute(Sender: TObject);
    procedure edtInputEnter(Sender: TObject);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure Excel1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);    
    procedure GodsCompareClick(Sender: TObject);
    procedure fndBATCH_NOEnter(Sender: TObject);
    procedure fndBATCH_NOExit(Sender: TObject);
    procedure fndBATCH_NOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fndBATCH_NOKeyPress(Sender: TObject; var Key: Char);
    procedure fndBATCH_NOSaveValue(Sender: TObject);
    procedure fndBATCH_NOClearValue(Sender: TObject);
    procedure fndLOCATION_IDClearValue(Sender: TObject);
    procedure fndLOCATION_IDEnter(Sender: TObject);
    procedure fndLOCATION_IDExit(Sender: TObject);
    procedure fndLOCATION_IDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fndLOCATION_IDKeyPress(Sender: TObject; var Key: Char);
  private
    FdbState: TDataSetState;
    FgRepeat: boolean;
    FList:TStringList;
    // 散装条码参数
    BulkiFlag:string;
    BulkId:integer;
    Bulk1Flag:integer;
    Bulk2Flag:integer;
    Bulk1Len:integer;
    Bulk2Len:integer;
    Bulk1Dec:integer;
    Bulk2Dec:integer;
    FIsAudit: boolean;
    FTabSheet: TrzTabSheet;
    Foid: string;
    FModifyed: boolean;
    Fcid: string;
    FSaved: boolean;
    FInputFlag: integer;
    Fgid: string;
    FbasInfo: TDataSet;
    // end
    FCanAppend: boolean;
    FInputMode: integer;
    FisZero: boolean;
    FIsDefault: boolean;
    Frs: TZQuery;
    //end;
    procedure InitGrid;
    procedure IsPresentUpdateData(Sender: TObject;
      var Text: String; var Value: Variant; var UseText, Handled: Boolean);
    procedure SetgRepeat(const Value: boolean);
    procedure WMDialogPull(var Message: TMessage); message WM_DIALOG_PULL;
    procedure WMInitRecord(var Message: TMessage); message WM_INIT_RECORD;
    procedure WMNextRecord(var Message: TMessage); message WM_NEXT_RECORD;
    procedure WMPriorRecord(var Message: TMessage); message WM_PRIOR_RECORD;
    procedure OpenDialogProperty;
    procedure OpenDialogGoods;
    procedure AddFromDialog(AObj:TRecord_);
    procedure SetTabSheet(const Value: TrzTabSheet);
    function GetIsNull: boolean;
    procedure Setoid(const Value: string);
    function GetModifyed: boolean;
    procedure SetModifyed(const Value: boolean);
    procedure Setcid(const Value: string);
    function Getcid: string;
    procedure SetSaved(const Value: boolean);
    procedure Setgid(const Value: string);
    procedure SetbasInfo(const Value: TDataSet);
    function GetHasPrice: boolean;
    procedure SetCanAppend(const Value: boolean);
    procedure SetInputMode(const Value: integer);
    procedure SetisZero(const Value: boolean);
    procedure SetIsDefault(const Value: boolean);
    procedure Setrs(const Value: TZQuery);
    function GetbasInfo: TDataSet;
    { Private declarations }
  protected
    // 最近输的货品
    vgds,vP1,vP2,vBtNo:string;

    procedure GodsInfoFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure BarcodeFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure GodsDropFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure SetdbState(const Value: TDataSetState); virtual;
    procedure SetIsAudit(const Value: boolean);virtual;
    procedure SetInputFlag(const Value: integer);virtual;
    function DecodeBarcode(BarCode: string):integer;
    function GetToolHandle:THandle;
    function CheckRepeat(AObj:TRecord_;var pt:boolean):boolean;virtual;
    procedure DBGridEh1BatchNoBeforeShowControl(Sender: TObject);
    procedure DBGridEh1LocationIdBeforeShowControl(Sender: TObject);
    procedure BatchNoDropList;virtual;
    procedure LocationIdDropList;virtual;
    function GetShopId:string;virtual;
    function GetDefLocation:string;virtual;
  public
    { Public declarations }
    //SEQNO控制号
    RowID:integer;

    //Excel导入中各继承模块字段名 (2011.06.22)
    FieldsString,FormatString:String;

    Locked:boolean;
    AObj:TRecord_;
    //重复条码控制
    fndStr:string;
    BarCodeInfo:TZQuery;

    GBATCH_NO,GLOCATION_ID:string;//当前数据打开的批号对应的商品
    function EnCodeBarcode:string;
    function GetCostPrice(SHOP_ID,GODS_ID,BATCH_NO:string):real;

    //判断当前记录是否有颜色尺管制
    function PropertyEnabled:boolean;
    function IsKeyPress:boolean;virtual;
    procedure WriteNoAmount(UNIT_ID,PROPERTY_01,PROPERTY_02:string;Amt:real;Appended:boolean=false);virtual;
    procedure WriteAmount(UNIT_ID,PROPERTY_01,PROPERTY_02:string;Amt:real;Appended:boolean=false);virtual;
    procedure BulkAmount(UNIT_ID:string;Amt,Pri,mny:real;Appended:boolean=false);virtual;
    procedure AmountToCalc(Amount:Real);virtual;
    procedure PriceToCalc(APrice:Real);virtual;
    procedure AMoneyToCalc(AMoney:Real);virtual;
    procedure BulkToCalc(AMoney:Real);virtual;
    procedure AgioToCalc(Agio:Real);virtual;
    procedure PresentToCalc(Present:integer);virtual;
    procedure UnitToCalc(UNIT_ID:string);virtual;
    procedure InitPrice(GODS_ID,UNIT_ID:string);virtual;
    procedure InitRecord;virtual;
    procedure ConvertUnit;virtual;
    procedure ConvertPresent;virtual;
    function GetDetail:TDataSet;virtual;

    procedure CheckLowerPrice(aprc:Currency);
    function CheckInput:boolean;virtual;
    //输入会员号
    procedure WriteInfo(id:string);virtual;
    //整单折扣
    procedure AgioInfo(id:string);virtual;
    //单笔折扣
    procedure AgioToGods(id:string);virtual;
    //修改单价
    procedure PriceToGods(id:string);virtual;
    //输入跟踪号
    function GodsToLocusNo(id:string):boolean;virtual;
    //输入批号
    function GodsToBatchNo(id:string):boolean;virtual;
    //输入数量
    procedure GodsToAmount(id:string);virtual;

    //清除无效数据
    procedure ClearInvaid;virtual;
    //检测数据合法性
    procedure CheckInvaid;virtual;

    //检测是否是汇总字段
    function CheckSumField(FieldName:string):boolean;virtual;

    procedure AddRecord(AObj:TRecord_;UNIT_ID:string;Located:boolean=false;IsPresent:boolean=false);virtual;
    procedure UpdateRecord(AObj:TRecord_;UNIT_ID:string;pt:boolean=false);virtual;
    procedure DelRecord(AObj:TRecord_);virtual;
    procedure EraseRecord;virtual;

    procedure ReadFrom(DataSet:TDataSet);virtual;
    procedure CalcWriteTo(edtTable,DataSet:TDataSet;MyField:TField);virtual;
    procedure WriteTo(DataSet:TDataSet);virtual;

    function  FindColumn(FieldName:string):TColumnEh;
    procedure FocusColumn(FieldName: string);
    procedure FocusNextColumn;
    function GetSelectCell: TPoint;

    procedure NewOrder;virtual;
    procedure EditOrder;virtual;
    procedure DeleteOrder;virtual;
    procedure SaveOrder;virtual;
    procedure CancelOrder;virtual;
    procedure AuditOrder;virtual;
    procedure PrintOrder;virtual;
    procedure PreviewOrder;virtual;
    procedure PriorOrder;virtual;
    procedure NextOrder;virtual;
    procedure Open(id:string);virtual;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy;override;
    
    //单据状态
    property dbState:TDataSetState read FdbState write SetdbState;
    //是否允许重复货品
    property gRepeat:boolean read FgRepeat write SetgRepeat;
    property IsAudit:boolean read FIsAudit write SetIsAudit;
    property IsNull:boolean read GetIsNull;
    property Modifyed:boolean read FModifyed write SetModifyed;
    property TabSheet:TrzTabSheet read FTabSheet write SetTabSheet;
    property oid:string read Foid write Setoid;
    property cid:string read Getcid write Setcid;
    property Saved:boolean read FSaved write SetSaved;
    property InputFlag:integer read FInputFlag write SetInputFlag;
    property InputMode:integer read FInputMode write SetInputMode;
    property gid:string read Fgid write Setgid;
    property basInfo:TDataSet read GetbasInfo write SetbasInfo;
    property HasPrice:boolean read GetHasPrice;
    property CanAppend:boolean read FCanAppend write SetCanAppend;
    property isZero:boolean read FisZero write SetisZero;
    property IsDefault:boolean read FIsDefault write SetIsDefault;
  end;

implementation
uses uGlobal, uCtrlUtil,uShopGlobal, uShopUtil, uFnUtil, uExpression, uXDictFactory,
uframeDialogProperty, uframeSelectGoods, ufrmGoodsInfo, uframeListDialog, ufrmExcelFactory,ufrmGodsComPare;
{$R *.dfm}
var ExportForm:TframeOrderForm;

{ TframeOrderFrom }

procedure TframeOrderForm.AddRecord(AObj: TRecord_; UNIT_ID: string;Located:boolean=false;IsPresent:boolean=false);
var
  Pt:integer;
  r:boolean;
  lid:string;
begin
  if IsPresent then pt := 1 else pt := 0;
  if Located then
     begin
        if edtTable.FindField('LOCATION_ID')<>nil then
           lid := GetDefLocation else lid:='';
        if not gRepeat then
            begin
              if lid<>'' then
                 r := edtTable.Locate('GODS_ID;BATCH_NO;LOCATION_ID;UNIT_ID;IS_PRESENT;LOCUS_NO;BOM_ID',VarArrayOf([AObj.FieldbyName('GODS_ID').AsString,'#',lid,UNIT_ID,pt,null,null]),[])
              else
                 r := edtTable.Locate('GODS_ID;BATCH_NO;UNIT_ID;IS_PRESENT;LOCUS_NO;BOM_ID',VarArrayOf([AObj.FieldbyName('GODS_ID').AsString,'#',UNIT_ID,pt,null,null]),[]);
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
        if lid<>'' then
           edtTable.FieldByName('LOCATION_ID').AsString := lid; 
     end;
  edtTable.Edit;
  edtTable.FieldbyName('BARCODE').AsString := EncodeBarcode;
  InitPrice(AObj.FieldbyName('GODS_ID').AsString,UNIT_ID);
end;

constructor TframeOrderForm.Create(AOwner: TComponent);
var Column:TColumnEh;
  rs:TZQuery;
begin
  gRepeat := false;
  CanAppend := false;
  isZero := false;
  IsDefault := true;
  ExportForm := Self;
  inherited;
  Fcid := '';
  Initform(self);
  AObj := TRecord_.Create;
  dbState := dsBrowse;
  TabSheet := nil;
  fndGODS_ID.DataSet := Global.GetZQueryFromName('PUB_GOODSINFO');
  basInfo := fndGODS_ID.DataSet;
  edtTable.Close;
  edtTable.CreateDataSet;
  edtProperty.Close;
  edtProperty.CreateDataSet;
  InitRecord;
  InitGrid;
  FList := TStringList.Create;
  // 散装条码定义
  BulkiFlag := ShopGlobal.GetParameter('BUIK_FLAG');
  BulkId := StrtoIntDef(ShopGlobal.GetParameter('BUIK_ID'),5)+1;
  Bulk1Flag := StrtoIntDef(ShopGlobal.GetParameter('BUIK_ID1'),0);
  Bulk2Flag := StrtoIntDef(ShopGlobal.GetParameter('BUIK_ID2'),0);
  if Bulk1Flag=0 then
     Bulk1Len :=0
  else
     Bulk1Len := StrtoIntDef(ShopGlobal.GetParameter('BUIK_LEN1'),4)+1;
  if Bulk2Flag=0 then
     Bulk2Len :=0
  else
     Bulk2Len := StrtoIntDef(ShopGlobal.GetParameter('BUIK_LEN2'),4)+1;
  Bulk1Dec := StrtoIntDef(ShopGlobal.GetParameter('BUIK_DEC1'),2);
  Bulk2Dec := StrtoIntDef(ShopGlobal.GetParameter('BUIK_DEC2'),2);
  // end
  if StrtoIntDef(ShopGlobal.GetParameter('INPUT_MODE'),0) in [0,1] then
     begin
       InputMode := StrtoIntDef(ShopGlobal.GetParameter('INPUT_MODE'),0);
       InputFlag := 0;
     end
  else
     InputFlag := 0;
  fndGODS_ID.OnFilterRecord := GodsDropFilterRecord;
  BarCodeInfo := Global.GetZQueryFromName('PUB_BARCODE');

  Column := FindColumn('BATCH_NO');
  if Column<>nil then
     begin
       Column.Control := fndBATCH_NO;
       Column.OnBeforeShowControl := DBGridEh1BatchNoBeforeShowControl;
       Column.ReadOnly := false;
     end;
  Column := FindColumn('LOCATION_ID');
  if Column<>nil then
     begin
       Column.Control := fndLOCATION_ID;
       Column.OnBeforeShowControl := DBGridEh1LocationIdBeforeShowControl;
       Column.ReadOnly := false;
       rs := Global.GetZQueryFromName('PUB_LOCATION_INFO');
       rs.First;
       while not rs.Eof do
          begin
            Column.KeyList.Add(rs.FieldbyName('LOCATION_ID').AsString);
            Column.PickList.Add(rs.FieldbyName('LOCATION_NAME').AsString);  
            rs.Next;
          end;
     end;
end;

destructor TframeOrderForm.Destroy;
begin
  fndUNIT_ID.Properties.Items.Clear;
  Freeform(self);
  FList.Free;
  if TabSheet<>nil then
     begin
       if TabSheet.PageControl.ActivePageIndex>0 then
          TabSheet.PageControl.ActivePageIndex := TabSheet.PageControl.ActivePageIndex-1;
       Visible := false;
       Parent := nil;
       TabSheet.Free;
     end;
  AObj.Free;
  inherited;
end;

function TframeOrderForm.FindColumn(FieldName: string): TColumnEh;
var i:integer;
begin
  Result := nil;
  for i:=0 to DBGridEh1.Columns.Count -1 do
    begin
      if UpperCase(DBGridEh1.Columns[i].FieldName)=UpperCase(FieldName) then
         begin
           Result := DBGridEh1.Columns[i];
           Exit;
         end;
    end;
end;

procedure TframeOrderForm.FocusColumn(FieldName: string);
var i:integer;
begin
  for i:=0 to DBGridEh1.Columns.Count -1 do
    begin
      if UpperCase(DBGridEh1.Columns[i].FieldName)=UpperCase(FieldName) then
         begin
           DBGridEh1.Col := i;
           Exit;
         end;
    end;
end;

procedure TframeOrderForm.FocusNextColumn;
var i:Integer;
begin
  i:=DbGridEh1.Col;
  if (edtTable.RecordCount>edtTable.RecNo) and (DbGridEh1.Columns[i].Control=nil) then
     begin
       edtTable.Next;
       Exit;
     end;
  Inc(i);
  while True do
    begin
      if i>=DbGridEh1.Columns.Count then i:= 1;
      if (DbGridEh1.Columns[i].ReadOnly or not DbGridEh1.Columns[i].Visible) and (i<>1) then
         inc(i)
      else
         begin
           if Trim(edtTable.FieldbyName('GODS_ID').asString)='' then
              i := 1;
           if (i=1) and (Trim(edtTable.FieldbyName('GODS_ID').asString)<>'') then
              begin
                 edtTable.Next ;
                 if edtTable.Eof then
                    begin
                      InitRecord;
                    end;
                 DbGridEh1.SetFocus;
                 DbGridEh1.Col := 1 ;
              end
           else
              DbGridEh1.Col := i;
           Exit;
         end;
    end;
end;

procedure TframeOrderForm.InitRecord;
begin
  if dbState = dsBrowse then Exit;
  if edtTable.State in [dsEdit,dsInsert] then edtTable.Post;
  fndGODS_ID.Visible := false;
  edtTable.DisableControls;
  try
  edtTable.Last;
  if edtTable.IsEmpty or (edtTable.FieldbyName('GODS_ID').AsString <>'') then
    begin
      inc(RowID);
      edtTable.Append;
      edtTable.FieldByName('GODS_ID').Value := null;
      edtTable.FieldByName('IS_PRESENT').Value := 0;
      if edtTable.FindField('SEQNO')<> nil then
         edtTable.FindField('SEQNO').asInteger := RowID;
      edtTable.Post;
    end;
    DbGridEh1.Col := 1 ;
    if DBGridEh1.CanFocus and Visible and not edtInput.Focused and (dbState <> dsBrowse) then DBGridEh1.SetFocus;
  finally
    edtTable.EnableControls;
    edtTable.Edit;
  end;
end;
procedure TframeOrderForm.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var
  ARect:TRect;
  br:TBrush;
  pn:TPen;
  b,s:string;
begin
  br := TBrush.Create;
  br.Assign(DBGridEh1.Canvas.Brush);
  pn := TPen.Create;
  pn.Assign(DBGridEh1.Canvas.Pen);
  try
  if (Rect.Top = DBGridEh1.CellRect(DBGridEh1.Col, DBGridEh1.Row).Top) and (not
    (gdFocused in State) or not DBGridEh1.Focused) then
  begin
    DBGridEh1.Canvas.Brush.Color := clAqua;
//    DBGridEh1.Canvas.Font.Size := DBGridEh1.Canvas.Font.Size + 2;
//    DBGridEh1.Canvas.Font.Style :=[fsBold];
  end;
  DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
//  if (Column.FieldName = 'AMONEY') and (edtTable.FieldbyName('IS_PRESENT').AsString <> '1') and (edtTable.FieldbyName('GODS_ID').AsString<>'') then
{  if (Column.FieldName = 'AMONEY') and (edtTable.FieldbyName('GODS_ID').AsString<>'') then
    begin
      if (edtTable.FieldbyName('APRICE').AsFloat=0) then
      begin
        s := '赠';
        ARect := Rect;
        DbGridEh1.canvas.FillRect(ARect);
        DrawText(DbGridEh1.Canvas.Handle,pchar(s),length(s),ARect,DT_NOCLIP or DT_SINGLELINE or DT_CENTER);
      end;
    end;   }
  if Column.FieldName = 'SEQNO' then
    begin
      ARect := Rect;
      DbGridEh1.canvas.Brush.Color := $0000F2F2;
      DbGridEh1.canvas.FillRect(ARect);
      DrawText(DbGridEh1.Canvas.Handle,pchar(Inttostr(edtTable.RecNo)),length(Inttostr(edtTable.RecNo)),ARect,DT_NOCLIP or DT_SINGLELINE or DT_CENTER or DT_VCENTER);
    end;
  if ((gdSelected in State) or (gdFocused in State)) then
    begin
      ARect := Rect;
      DBGridEh1.Canvas.Pen.Color := clRed;
      DBGridEh1.Canvas.Pen.Width := 1;
      DBGridEh1.Canvas.Brush.Style := bsClear;
      DbGridEh1.canvas.Rectangle(ARect);
      stbHint.Caption := Column.Title.Hint;
    end;
  finally
    DBGridEh1.Canvas.Brush.Assign(br);
    DBGridEh1.Canvas.Pen.Assign(pn);
    br.Free;
    pn.Free;
  end;
end;

procedure TframeOrderForm.SetdbState(const Value: TDataSetState);
var Column:TColumnEh;
begin
  if Value <> dsBrowse then InitRecord;
  FdbState := Value;
  case Value of
  dsBrowse:lblState.Caption := '状态:浏览';
  dsEdit:lblState.Caption := '状态:修改';
  dsInsert:lblState.Caption := '状态:新增';
  end;
  SetFormEditStatus(self,Value);
  DBGridEh1.ReadOnly := (Value=dsBrowse);
  Column := FindColumn('GODS_CODE');
  if Column<>nil then Column.ReadOnly := true;
  if Assigned(TabSheet) then
  begin
    PostMessage(GetToolHandle,WM_STATUS_CHANGE,0,0);
  end;
end;

function TframeOrderForm.GetSelectCell: TPoint;
var P:TPoint;
  R:TRect;
begin
  R := DbGridEh1.CellRect(DbGridEh1.Col,DbGridEh1.Row);
  Result := DBGridEh1.ClientToScreen(Point(R.Left,R.Top));
  Result.Y := Result.Y + DbGridEh1.RowHeight+1;

end;

procedure TframeOrderForm.ClearInvaid;
var
  Field:TField;
  Controls:boolean;
  r:integer;
begin
  if edtTable.State in [dsEdit,dsInsert] then edtTable.Post;
  Field := edtTable.FindField('AMOUNT');
  Controls := edtTable.ControlsDisabled;
  r := edtTable.RecNo;
  edtTable.DisableControls;
  try
  edtTable.First;
  while not edtTable.Eof do
    begin
      if (edtTable.FieldByName('GODS_ID').AsString = '')
         or
         (not isZero and (Field<>nil) and (Field.AsFloat=0) )
      then
         edtTable.Delete
      else
         edtTable.Next;
    end;
  finally
    if r>0 then edtTable.RecNo := r;
    if not Controls then  edtTable.EnableControls;
  end;
end;

procedure TframeOrderForm.DBGridEh1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key=#13) then
     begin
       if (DBGridEh1.SelectedField<>nil) and (DBGridEh1.SelectedField.FieldName ='AMOUNT') and PropertyEnabled and (DBGridEh1.SelectedField.AsFloat=0) then
          PostMessage(Handle,WM_DIALOG_PULL,PROPERTY_DIALOG,0)
       else
          FocusNextColumn;
       Key := #0;
     end;
  inherited;

end;

procedure TframeOrderForm.DBGridEh1DrawFooterCell(Sender: TObject; DataCol,
  Row: Integer; Column: TColumnEh; Rect: TRect; State: TGridDrawState);
var R:TRect;
  s:string;
begin
  inherited;
  if Column.FieldName = 'GODS_NAME' then
     begin
       R.Left := Rect.Left;
       R.Top := Rect.Top ;
       R.Bottom := Rect.Bottom;
       if FindColumn('GODS_CODE')<>nil then
       begin
         if FindColumn('UNIT_ID')=nil then
            R.Right := Rect.Right + FindColumn('GODS_CODE').Width
         else
            R.Right := Rect.Right + FindColumn('GODS_CODE').Width+ FindColumn('UNIT_ID').Width;
       end
       else
       begin
         if FindColumn('UNIT_ID')=nil then
            R.Right := Rect.Right + FindColumn('GODS_CODE').Width
         else
            R.Right := Rect.Right + FindColumn('GODS_CODE').Width+ FindColumn('UNIT_ID').Width;
       end;
       DBGridEh1.Canvas.FillRect(R);
       s := XDictFactory.GetMsgStringFmt('frame.OrderFooterLabel','合 计 共%s笔',[Inttostr(edtTable.RecordCount)]);
       DBGridEh1.Canvas.Font.Style := [fsBold];
       DBGridEh1.Canvas.TextRect(R,(Rect.Right-Rect.Left-DBGridEh1.Canvas.TextWidth(s)) div 2,Rect.Top+2,s);
     end;

end;

procedure TframeOrderForm.DBGridEh1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var Cell: TGridCoord;
begin
  inherited;
  Cell := DBGridEh1.MouseCoord(X,Y);
  if Cell.Y > DBGridEh1.VisibleRowCount -2 then
     InitRecord;
end;

procedure TframeOrderForm.fndGODS_IDEnter(Sender: TObject);
begin
  inherited;
  fndGODS_ID.Properties.ReadOnly := DBGridEh1.ReadOnly;
end;

procedure TframeOrderForm.fndGODS_IDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=VK_RIGHT) and not fndGODS_ID.Edited then
     begin
       DBGridEh1.SetFocus;
       fndGODS_ID.Visible := false;
       FocusNextColumn;
     end;
  if (Key=VK_UP) and not fndGODS_ID.DropListed then
     begin
       DBGridEh1.SetFocus;
       fndGODS_ID.Visible := false;
       edtTable.Prior;
     end;
  if (Key=VK_DOWN) and (Shift=[]) and not fndGODS_ID.DropListed then
     begin
       if (edtTable.FieldByName('SEQNO').AsString<>'') and (edtTable.FieldByName('GODS_ID').AsString='') then
         fndGODS_ID.DropList
       else
       begin
         DBGridEh1.SetFocus;
         fndGODS_ID.Visible := false;
         edtTable.Next;
         if edtTable.Eof then
            PostMessage(Handle,WM_INIT_RECORD,0,0);
         if edtTable.FieldByName('GODS_ID').AsString <> '' then
            Key := 0
       end;
     end;
  inherited;

end;

procedure TframeOrderForm.fndGODS_IDKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key=#13 then
     begin
       Key := #0;
       if fndGODS_ID.AsString = '' then
          begin
            PostMessage(Handle,WM_DIALOG_PULL,ADD_GOODS_DIALOG,0);
            Exit;
          end;
       if edtTable.FieldbyName('GODS_ID').AsString = '' then
          begin
            fndGODS_ID.DropList;
            Exit;
          end;
       DBGridEh1.SetFocus;
       FocusNextColumn;
     end;

end;

procedure TframeOrderForm.fndGODS_IDSaveValue(Sender: TObject);
var AObj:TRecord_;
  rs:TZQuery;
  pt:boolean;
begin
  inherited;
  if not edtTable.Active then Exit;
  if edtTable.FieldbyName('GODS_ID').AsString=fndGODS_ID.AsString then exit;
  edtTable.DisableControls;
  try
  if edtTable.FieldbyName('GODS_ID').AsString <> '' then
     begin
       if edtTable.FieldByName('BOM_ID').AsString = '' then
       begin
         if MessageBox(Handle,pchar('是否把当前选中商品修改为"'+fndGODS_ID.Text+'('+fndGODS_ID.DataSet.FieldbyName('GODS_CODE').AsString+')"？'),'友情提示',MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2)<>6 then
            begin
              fndGODS_ID.Text := edtTable.FieldbyName('GODS_NAME').AsString;
              fndGODS_ID.KeyValue := edtTable.FieldbyName('GODS_ID').AsString;
              Exit;
            end;
       end
       else
       begin
          MessageBox(Handle,pchar('礼盒包装不能单商品修改，请删除重新扫码'),'友情提示',MB_OK+MB_ICONINFORMATION);
          fndGODS_ID.Text := edtTable.FieldbyName('GODS_NAME').AsString;
          fndGODS_ID.KeyValue := edtTable.FieldbyName('GODS_ID').AsString;
          Exit;
       end;
     end;
  if VarIsNull(fndGODS_ID.KeyValue) then
  begin
    EraseRecord;
  end
  else
  begin
    AObj := TRecord_.Create;
    try
      rs := Global.GetZQueryFromName('PUB_GOODSINFO');
      if rs.Locate('GODS_ID',fndGODS_ID.AsString,[]) then
      begin
        AObj.ReadField(edtTable);
        AObj.ReadFromDataSet(rs,false);
        AObj.FieldbyName('UNIT_ID').AsString := rs.FieldbyName('UNIT_ID').AsString;
        AObj.FieldbyName('IS_PRESENT').AsString := '0';
        AObj.FieldbyName('LOCUS_NO').AsString := '';
        AObj.FieldbyName('BATCH_NO').AsString := '#';
        if AObj.FindField('LOCATION_ID')<>nil then
           AObj.FieldbyName('LOCATION_ID').AsString := GetDefLocation;
        pt := false;

        if CheckRepeat(AObj,pt) then
           begin
             fndGODS_ID.Text := edtTable.FieldbyName('GODS_NAME').AsString;
             fndGODS_ID.KeyValue := edtTable.FieldbyName('GODS_ID').AsString;
             Raise Exception.Create(XDictFactory.GetMsgStringFmt('frame.GoodsRepeat','"%s"货品重复录入,请核对输入是否正确.',[edtTable.FieldbyName('GODS_NAME').AsString]));
           end;
        UpdateRecord(AObj,edtTable.FieldByName('UNIT_ID').AsString,pt);
      end
      else
        Raise Exception.Create(XDictFactory.GetMsgStringFmt('frame.NoFindGoodsInfo','在经营品牌中没找到"%s"',[fndGODS_ID.Text]));
    finally
      AObj.Free;
    end;
    if (edtTable.FindField('AMOUNT')<>nil) and (edtTable.FindField('AMOUNT').AsFloat=0) and IsDefault then
       begin
         if not PropertyEnabled then
            begin
              edtTable.FieldbyName('AMOUNT').AsFloat := 1;
              AMountToCalc(1);
            end
         else
            PostMessage(Handle,WM_DIALOG_PULL,PROPERTY_DIALOG,0);
       end;
  end;
  finally
    if DBGridEh1.CanFocus then DBGridEh1.SetFocus;
    edtTable.EnableControls;
  end;
//  FocusNextColumn;
end;

procedure TframeOrderForm.DBGridEh1DrawFouseRect(Sender: TObject);
begin
  inherited;
  stbHint.Caption := TColumnEh(Sender).Title.Hint;

end;

procedure TframeOrderForm.SetgRepeat(const Value: boolean);
begin
  FgRepeat := Value;
end;

procedure TframeOrderForm.DelRecord(AObj: TRecord_);
begin
  if not edtTable.IsEmpty then edtTable.Delete;
end;

procedure TframeOrderForm.EraseRecord;
var i:integer;
begin
  if edtTable.State = dsBrowse then edtTable.Edit;
  for i:=1 to edtTable.Fields.Count -1 do edtTable.Fields[i].Value := null;
  fndGODS_ID.Text := '';
  fndGODS_ID.KeyValue := null;
end;

procedure TframeOrderForm.fndGODS_IDAddClick(Sender: TObject);
begin
  inherited;
  //调添加商品
end;

function TframeOrderForm.DecodeBarcode(BarCode: string):integer;
function CheckDupBar(rs:TZQuery):boolean;
var
  r:integer;
begin
  result := true;
  r := 0;
  rs.First;
  while not rs.Eof do
    begin
      if rs.FieldByName('BARCODE').AsString=BarCode then
         begin
           inc(r);
         end;
      rs.Next;
    end;
  result := (r<>1);
end;
var
  rs:TZQuery;
  AObj:TRecord_;
  r,bulk:Boolean;
  uid:string;
  amt:real;
  mny:real;
  Pri:real;
begin
  result := 2;
  if BarCode='' then Exit;
  fndStr := BarCode;
  if (BulkiFlag<>'') and (copy(BarCode,1,length(BulkiFlag))=BulkiFlag) then
     begin
       vgds := copy(BarCode,length(BulkiFlag)+1,BulkId);
       vP1 := '#';
       vP2 := '#';
       vBtNo := '#';
       amt := 0;
       mny := 0;
       Pri := 0;
       case Bulk1Flag of
       1:begin // 单价
           Pri := StrtoFloatDef(copy(Barcode,length(BulkiFlag)+BulkId+1,Bulk1Len),0);
           if Bulk1Dec in [1,2,3] then
             Pri := Pri / Power(10,Bulk1Dec)
         end;
       2:begin // 金额
           mny := StrtoFloatDef(copy(Barcode,length(BulkiFlag)+BulkId+1,Bulk1Len),0);
           if Bulk1Dec in [1,2,3] then
             mny := mny / Power(10,Bulk1Dec)
         end;
       3:begin // 数量
           amt := StrtoFloatDef(copy(Barcode,length(BulkiFlag)+BulkId+1,Bulk1Len),0);
           if Bulk1Dec in [1,2,3] then
             amt := amt / Power(10,Bulk1Dec)
         end;
       end;
       case Bulk2Flag of
       1:begin // 单价
           Pri := StrtoFloatDef(copy(Barcode,length(BulkiFlag)+BulkId+Bulk1Len+1,Bulk2Len),0);
           if Bulk2Dec in [1,2,3] then
             Pri := Pri / Power(10,Bulk2Dec)
         end;
       2:begin // 金额
           mny := StrtoFloatDef(copy(Barcode,length(BulkiFlag)+BulkId+Bulk1Len+1,Bulk2Len),0);
           if Bulk2Dec in [1,2,3] then
             mny := mny / Power(10,Bulk2Dec)
         end;
       3:begin // 数量
           amt := StrtoFloatDef(copy(Barcode,length(BulkiFlag)+BulkId+Bulk1Len+1,Bulk2Len),0);
           if Bulk2Dec in [1,2,3] then
             amt := amt / Power(10,Bulk2Dec)
         end;
       end;
       bulk := true;
     end
  else
  begin
//  rs := TZQuery.Create(nil);
  try
    if InputMode=0 then
    begin
      rs := Global.GetZQueryFromName('PUB_BARCODE');
      rs.OnFilterRecord := BarcodeFilterRecord;
      rs.Filtered := true;
      //case Factor.iDbType of
      //0,3:rs.SQL.Text := 'select A.GODS_ID,A.PROPERTY_01,A.PROPERTY_02,A.UNIT_ID,A.BATCH_NO from VIW_BARCODE A where TENANT_ID=:TENANT_ID and A.BARCODE like ''%''+:BARCODE and A.COMM not in (''02'',''12'')';
      //1,4,5:rs.SQL.Text := 'select A.GODS_ID,A.PROPERTY_01,A.PROPERTY_02,A.UNIT_ID,A.BATCH_NO from VIW_BARCODE A where TENANT_ID=:TENANT_ID and A.BARCODE like ''%''||:BARCODE and A.COMM not in (''02'',''12'')';
      //end;
      //rs.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
      //rs.ParamByName('BARCODE').AsString := Barcode;
      //Factor.Open(rs);
    end
    else
      rs := nil;
      if not assigned(rs) or ((InputMode=0) and rs.IsEmpty) then
         begin
            //看看货号是否存在
            rs := Global.GetZQueryFromName('PUB_GOODSINFO');
            rs.Filtered := false;
            rs.OnFilterRecord := GodsInfoFilterRecord;
            rs.Filtered := true;
            //rs.Close;
            //rs.SQL.Text := 'select GODS_ID,UNIT_ID from VIW_GOODSINFO where COMM not in (''02'',''12'') and TENANT_ID=:TENANT_ID and GODS_CODE=:GODS_CODE';
            //rs.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
            //rs.ParamByName('GODS_CODE').AsString := Barcode;
            //Factor.Open(rs);
            if rs.IsEmpty then
               begin
                 Exit;
               end;
            if (rs.RecordCount > 1) and not TframeListDialog.FindDSDialog(self,rs,'GODS_CODE=货号,GODS_NAME=商品名称,NEW_OUTPRICE=标准售价',nil) then
               begin
                 fndStr := '';
                 result := 3;
                 Exit;
               end
            else
               begin
                 vgds := rs.FieldbyName('GODS_ID').AsString;
                 vP1 := '#';
                 vP2 := '#';
                 vBtNo := '#';
                 uid := rs.FieldbyName('UNIT_ID').asString;
               end;
         end
      else
         begin
            if (rs.RecordCount > 1) and CheckDupBar(RS) then
               begin
                  fndStr := '';
                  rs.first;
                  while not rs.eof do
                    begin
                      if fndStr<>'' then fndStr := fndStr+',';
                      fndStr := fndStr + ''''+rs.FieldbyName('GODS_ID').asString+'''';
                      rs.next;
                    end;
                  AObj := TRecord_.Create;
                  try
                    if not TframeListDialog.FindDialog(self,'select GODS_ID,GODS_CODE,GODS_NAME,NEW_OUTPRICE from VIW_GOODSINFO where TENANT_ID='+inttostr(Global.TENANT_ID)+' and GODS_ID in ('+fndStr+') and COMM not in (''02'',''12'')','GODS_CODE=货号,GODS_NAME=商品名称,NEW_OUTPRICE=标准售价',AObj) then
                       begin
                         fndStr := '';
                         result := 3;
                         Exit;
                       end
                    else
                       rs.Locate('GODS_ID',AObj.FieldbyName('GODS_ID').AsString,[]);
                  finally
                    AObj.free;
                  end;
               end;
            if result <> 3 then
               begin
                 vgds := rs.FieldbyName('GODS_ID').AsString;
                 vP1 := rs.FieldbyName('PROPERTY_01').AsString;
                 vP2 := rs.FieldbyName('PROPERTY_02').AsString;
                 if vP1='' then vP1 := '#';
                 if vP2='' then vP2 := '#';
                 uid := rs.FieldbyName('UNIT_ID').AsString;
                 vBtNo := rs.FieldbyName('BATCH_NO').AsString;
               end;
       end;
  finally
    if Assigned(rs) then
    begin
    rs.OnFilterRecord := nil;
    rs.filtered := false;
    end;
//    rs.Free;
  end;
  end;

  rs := Global.GetZQueryFromName('PUB_GOODSINFO');
  AObj := TRecord_.Create;
  try
    if bulk then
       begin
         if rs.Locate('GODS_CODE',vgds,[]) then
            AObj.ReadFromDataSet(rs)
         else
            Exit;
         uid := rs.FieldbyName('CALC_UNITS').asString;
       end
    else
       begin
         if rs.Locate('GODS_ID',vgds,[]) then
            AObj.ReadFromDataSet(rs)
         else
            Exit;
       end;
    result := 0;
    AddRecord(AObj,uid,true);
    if AObj.FieldbyName('GODS_ID').asString=edtTable.FieldbyName('GODS_ID').asString then
    begin
      edtTable.Edit;
      edtTable.FieldbyName('BATCH_NO').AsString := vBtNo;
      if not Bulk then
         WriteAmount(uid,vP1,vP2,1,true)
      else
         BulkAmount(uid,amt,pri,mny,true);
    end;
  finally
    AObj.Free;
  end;
  if result=0 then MessageBeep(0);
end;
procedure TframeOrderForm.AmountToCalc(Amount: Real);
var
  rs:TZQuery;
  AMoney,APrice,Agio_Rate,Agio_Money,SourceScale:Real;
  Field:TField;
begin
  if Locked then Exit;
  Locked := true;
  try
      if not (edtTable.State in [dsEdit,dsInsert]) then edtTable.Edit;
      rs := Global.GetZQueryFromName('PUB_GOODSINFO');
      if not rs.Locate('GODS_ID',edtTable.FieldByName('GODS_ID').AsString,[]) then Raise Exception.Create('经营商品中没找到“'+edtTable.FieldbyName('GODS_NAME').AsString+'”');  
      if edtTable.FieldByName('UNIT_ID').AsString=rs.FieldByName('CALC_UNITS').AsString then
         begin
          SourceScale := 1;
         end
      else
      if edtTable.FieldByName('UNIT_ID').AsString=rs.FieldByName('BIG_UNITS').AsString then
         begin
          SourceScale := rs.FieldByName('BIGTO_CALC').asFloat;
         end
      else
      if edtTable.FieldByName('UNIT_ID').AsString=rs.FieldByName('SMALL_UNITS').AsString then
         begin
          SourceScale := rs.FieldByName('SMALLTO_CALC').asFloat;
         end
      else
         begin
          SourceScale := 1;
         end;
      Field := edtTable.FindField('CALC_AMOUNT');
      if Field<>nil then
         begin
            Field.AsFloat := AMount * SourceScale;
         end;
      edtProperty.Filtered := false;
      edtProperty.Filter := 'SEQNO='+edtTable.FieldbyName('SEQNO').AsString;
      edtProperty.Filtered := true;
      try
        edtProperty.First;
        while not edtProperty.Eof do
          begin
            edtProperty.Edit;
            edtProperty.FieldByName('GODS_ID').AsString := edtTable.FieldByName('GODS_ID').AsString;
            edtProperty.FieldByName('UNIT_ID').AsString := edtTable.FieldByName('UNIT_ID').AsString;
            edtProperty.FieldByName('IS_PRESENT').AsString := edtTable.FieldByName('IS_PRESENT').AsString;
            edtProperty.FieldByName('BATCH_NO').AsString := edtTable.FieldByName('BATCH_NO').AsString;
            edtProperty.FieldByName('BOM_ID').AsString := edtTable.FieldByName('BOM_ID').AsString;
            edtProperty.FieldByName('LOCUS_NO').AsString := edtTable.FieldByName('LOCUS_NO').AsString;
            edtProperty.FieldByName('CALC_AMOUNT').AsFloat := edtProperty.FieldByName('AMOUNT').AsFloat * SourceScale;
            edtProperty.Post;
            edtProperty.Next;
          end;
      finally
        edtProperty.Filtered := false;
      end;
      Field := edtTable.FindField('APRICE');
      if Field=nil then Exit;
      Field.AsString := FormatFloat('#0.000',Field.AsFloat);
      //取单价
      APrice := Field.asFloat;
      //算金额
      AMoney := StrtoFloat(FormatFloat('#0.00',APrice * AMount));
      Field := edtTable.FindField('AMONEY');
      if Field<>nil then
         Field.AsString := FormatFloat('#0.00',AMoney);
      if edtTable.FindField('ORG_PRICE') = nil then
        begin
          //计算折扣
          Field := edtTable.FindField('AGIO_RATE');
          if Field<>nil then
             Agio_Rate := (Field.AsFloat / 100)
          else
             Agio_Rate := 1;
          //如果=0为不打折
          if Agio_Rate=0 then Agio_Rate := 1;

          Agio_Money := (AMoney/Agio_Rate) - AMoney;
        end
      else
        begin
          if edtTable.FindField('ORG_PRICE').AsFloat=0 then
             Agio_Money := 0
          else
             Agio_Money := edtTable.FindField('ORG_PRICE').AsFloat*Amount-AMoney;

          //计算折扣
          Field := edtTable.FindField('AGIO_RATE');
          if (Field<>nil) and (AMount<>0) then
             begin
                if edtTable.FindField('ORG_PRICE').AsFloat<>0 then
                   Field.AsString := formatFloat('#0.0',AMoney *100 /(edtTable.FindField('ORG_PRICE').AsFloat*Amount))
                else
                   Field.AsString := '100';
             end;
        end;
      Field := edtTable.FindField('AGIO_MONEY');
      if Field<>nil then
         Field.AsString := FormatFloat('#0.00',Agio_Money);

      Field := edtTable.FindField('CALC_MONEY');
      if Field<>nil then
         Field.AsString := FormatFloat('#0.00',AMoney) ;
      edtTable.Post;
      edtTable.Edit;
  finally
      Locked := false
  end;
end;

procedure TframeOrderForm.WriteAmount(UNIT_ID,PROPERTY_01,PROPERTY_02:string;Amt: real; Appended: boolean);
var b:boolean;
begin
  b := PropertyEnabled;
  if b and ((PROPERTY_01='#') and (PROPERTY_02='#')) then
     begin
       PostMessage(Handle,WM_DIALOG_PULL,PROPERTY_DIALOG,0);
       Exit;
     end;
  if (edtTable.FindField('AMOUNT')<>nil) then
  begin
    if not b then
    begin
      edtTable.Edit;
      if Appended then
         edtTable.FieldbyName('AMOUNT').AsFloat := edtTable.FieldbyName('AMOUNT').AsFloat + amt
      else
         edtTable.FieldbyName('AMOUNT').AsFloat := amt;
    end;
  end
  else
    Raise Exception.Create('AMOUNT字段没找到');
  if b then
     begin
       if edtProperty.Locate('SEQNO;PROPERTY_01;PROPERTY_02',VarArrayOf([edtTable.FieldbyName('SEQNO').AsInteger,PROPERTY_01,PROPERTY_02]),[]) then
         begin
           edtProperty.Edit;
           edtTable.Edit;
           if Appended then
              edtTable.FieldbyName('AMOUNT').AsFloat := edtTable.FieldbyName('AMOUNT').AsFloat + amt
           else
              edtTable.FieldbyName('AMOUNT').AsFloat := edtTable.FieldbyName('AMOUNT').AsFloat - edtProperty.FieldbyName('AMOUNT').AsFloat + amt;
         end else
         begin
           edtProperty.Append;
           edtTable.Edit;
           edtTable.FieldbyName('AMOUNT').AsFloat := edtTable.FieldbyName('AMOUNT').AsFloat + amt
         end;
       edtProperty.FieldByName('SEQNO').AsInteger := edtTable.FieldbyName('SEQNO').AsInteger;
       edtProperty.FieldByName('GODS_ID').AsString := edtTable.FieldbyName('GODS_ID').AsString;
       edtProperty.FieldByName('BOM_ID').AsString := edtTable.FieldbyName('BOM_ID').AsString;
       edtProperty.FieldByName('BATCH_NO').AsString := edtTable.FieldbyName('BATCH_NO').AsString;
       edtProperty.FieldByName('IS_PRESENT').AsString := edtTable.FieldbyName('IS_PRESENT').AsString;
       edtProperty.FieldByName('LOCUS_NO').AsString := edtTable.FieldbyName('LOCUS_NO').AsString;
       edtProperty.FieldByName('UNIT_ID').AsString := UNIT_ID;
       edtProperty.FieldByName('PROPERTY_01').AsString := PROPERTY_01;
       edtProperty.FieldByName('PROPERTY_02').AsString := PROPERTY_02;
       if Appended then
          edtProperty.FieldbyName('AMOUNT').AsFloat := edtProperty.FieldbyName('AMOUNT').AsFloat + amt
       else
          edtProperty.FieldbyName('AMOUNT').AsFloat := amt;
       edtProperty.Post;
     end;
  AMountToCalc(edtTable.FieldbyName('AMOUNT').AsFloat);
  edtTable.Post;
end;

procedure TframeOrderForm.BulkAmount(UNIT_ID:string;Amt, Pri, mny: real;Appended:boolean=false);
begin
   if PropertyEnabled then Raise Exception.Create(XDictFactory.GetMsgString('frame.NoSupportPropertyEnabled','散装商品不支持带颜色及尺码属性的商品...'));
   if edtTable.FieldbyName('UNIT_ID').AsString <> UNIT_ID then Raise Exception.Create(XDictFactory.GetMsgString('frame.NoSupportUnitConvert','散装商品不支持多单位转换...'));
   if Pri<>0 then
      begin
        if (edtTable.FindField('APRICE')<>nil) then
           begin
             edtTable.FieldbyName('APRICE').AsFloat := Pri;
           end;
      end;
   if amt<>0 then
      begin
        if (edtTable.FindField('AMOUNT')<>nil) then
           begin
             if Appended then
                edtTable.FieldbyName('AMOUNT').AsFloat := edtTable.FieldbyName('AMOUNT').AsFloat+amt
             else
                edtTable.FieldbyName('AMOUNT').AsFloat := amt;
             AMountToCalc(edtTable.FieldbyName('AMOUNT').AsFloat);
           end;
      end;
   if mny<>0 then
      begin
        if (edtTable.FindField('AMONEY')<>nil) then
           begin
             if Appended then
                edtTable.FieldbyName('AMONEY').AsFloat := edtTable.FieldbyName('AMONEY').AsFloat + mny
             else
                edtTable.FieldbyName('AMONEY').AsFloat := mny;
             BulkToCalc(edtTable.FieldbyName('AMONEY').AsFloat);
           end;
      end;
end;

procedure TframeOrderForm.UnitToCalc(UNIT_ID: string);
var AMount,SourceScale:Real;
    Field:TField;
    rs:TZQuery;
    u:integer;
begin
  if Locked then Exit;
  if UNIT_ID=edtTable.FieldbyName('UNIT_ID').AsString  then Exit;
  Locked := True;
  rs := Global.GetZQueryFromName('PUB_GOODSINFO'); 
  try
      if not rs.Locate('GODS_ID',edtTable.FieldByName('GODS_ID').AsString,[]) then Raise Exception.Create('经营商品中没找到“'+edtTable.FieldbyName('GODS_NAME').AsString+'”');  
      Field := edtTable.FindField('AMOUNT');
      if Field=nil then Exit;
      AMount := Field.asFloat;
      if not (edtTable.State in [dsEdit,dsInsert]) then edtTable.Edit;
      edtTable.FieldByName('UNIT_ID').AsString := UNIT_ID;
      edtTable.FieldbyName('BARCODE').AsString := EnCodeBarcode;
      if edtTable.FieldByName('UNIT_ID').AsString=rs.FieldByName('CALC_UNITS').AsString then
         begin
          SourceScale := 1;
         end
      else
      if edtTable.FieldByName('UNIT_ID').AsString=rs.FieldByName('BIG_UNITS').AsString then
         begin
          SourceScale := rs.FieldByName('BIGTO_CALC').asFloat;
         end
      else
      if edtTable.FieldByName('UNIT_ID').AsString=rs.FieldByName('SMALL_UNITS').AsString then
         begin
          SourceScale := rs.FieldByName('SMALLTO_CALC').asFloat;
         end
      else
         begin
          SourceScale := 1;
         end;
      Field := edtTable.FindField('CALC_AMOUNT');
      if Field<>nil then
         begin
            Field.AsFloat := AMount * SourceScale;
         end;
      edtProperty.Filtered := false;
      edtProperty.Filter := 'SEQNO='+edtTable.FieldbyName('SEQNO').AsString;
      edtProperty.Filtered := true;
      try
        edtProperty.First;
        while not edtProperty.Eof do
          begin
            edtProperty.Edit;
            edtProperty.FieldByName('GODS_ID').AsString := edtTable.FieldByName('GODS_ID').AsString;
            edtProperty.FieldByName('IS_PRESENT').AsString := edtTable.FieldByName('IS_PRESENT').AsString;
            edtProperty.FieldByName('BATCH_NO').AsString := edtTable.FieldByName('BATCH_NO').AsString;
            edtProperty.FieldByName('UNIT_ID').AsString := UNIT_ID;
            edtProperty.FieldByName('CALC_AMOUNT').AsFloat := edtProperty.FieldByName('AMOUNT').AsFloat * SourceScale;
            edtProperty.Post;
            edtProperty.Next;
          end;
      finally
        edtProperty.Filtered := false;
      end;
      if edtTable.FindField('APRICE')<>nil then
         begin
           InitPrice(edtTable.FieldByName('GODS_ID').asString,UNIT_ID);
           Locked := false;
           AMountToCalc(AMount);
         end;
  finally
     Locked := false;
  end;
end;

procedure TframeOrderForm.InitPrice(GODS_ID, UNIT_ID: string);
begin

end;

procedure TframeOrderForm.AMoneyToCalc(AMoney: Real);
var AMount,APrice,Agio_Rate,Agio_Money:Real;
    Field:TField;
begin
  if Locked then Exit;
  Locked := true;
  try
      if not (edtTable.State in [dsEdit,dsInsert]) then edtTable.Edit;
      Field := edtTable.FindField('AMONEY');
      if Field=nil then Exit;
      Field.AsString := FormatFloat('#0.00',AMoney);
      AMoney := Field.AsFloat;

      Field := edtTable.FindField('AMOUNT');
      if Field=nil then Exit;
      //取数量
      AMount := Field.asFloat;
      //单价
      if AMount =0 then
         APrice := 0
      else
         APrice := AMoney / AMount;
      Field := edtTable.FindField('APRICE');
      if Field<>nil then
         Field.AsString := FormatFloat('#0.000',APrice);

      if edtTable.FindField('ORG_PRICE')=nil then
        begin
          //计算折扣
          Field := edtTable.FindField('AGIO_RATE');
          if Field<>nil then
             Agio_Rate := (Field.AsFloat / 100)
          else
             Agio_Rate := 1;
          //如果=0为不打折
          if Agio_Rate=0 then Agio_Rate := 1;

          Agio_Money := (AMoney/Agio_Rate ) - AMoney;
        end
      else
        begin
          if edtTable.FindField('ORG_PRICE').AsFloat=0 then
             Agio_Money := 0
          else
             Agio_Money := edtTable.FindField('ORG_PRICE').AsFloat*Amount-AMoney;

          //计算折扣
          Field := edtTable.FindField('AGIO_RATE');
          if (Field<>nil) and (AMount<>0) then
             begin
                if edtTable.FindField('ORG_PRICE').AsFloat<>0 then
                   Field.AsString := formatFloat('#0.0',AMoney *100 /(edtTable.FindField('ORG_PRICE').AsFloat*Amount))
                else
                   Field.AsString := '100';
             end;
        end;
      Field := edtTable.FindField('AGIO_MONEY');
      if Field<>nil then
         Field.AsString := FormatFloat('#0.00',Agio_Money);

      Field := edtTable.FindField('CALC_MONEY');
      if Field<>nil then
         Field.AsString := FormatFloat('#0.00',AMoney) ;
      edtTable.Post;
      edtTable.Edit;
  finally
      Locked := false
  end;
end;

procedure TframeOrderForm.PriceToCalc(APrice: Real);
var AMount,AMoney,Agio_Rate,Agio_Money:Real;
    Field:TField;
begin
  if Locked then Exit;
  Locked := true;
  try
      if not (edtTable.State in [dsEdit,dsInsert]) then edtTable.Edit;
      Field := edtTable.FindField('APRICE');
      if Field=nil then Exit;
      Field.AsString := FormatFloat('#0.000',APrice);
      APrice := Field.AsFloat;

      Field := edtTable.FindField('AMOUNT');
      if Field=nil then Exit;
      //取数量
      AMount := Field.asFloat;
      //金额
      AMoney := StrtoFloat(FormatFloat('#0.00',AMount * APrice));
      Field := edtTable.FindField('AMONEY');
      if Field<>nil then
         Field.AsString := FormatFloat('#0.00',AMoney);

      if edtTable.FindField('ORG_PRICE')=nil then
        begin
          //计算折扣
          Field := edtTable.FindField('AGIO_RATE');
          if Field<>nil then
             Agio_Rate := (Field.AsFloat / 100)
          else
             Agio_Rate := 1;
          //如果=0为不打折
          if Agio_Rate=0 then Agio_Rate := 1;

          Agio_Money := (AMoney/Agio_Rate ) - AMoney;
        end
      else
        begin
          if edtTable.FindField('ORG_PRICE').AsFloat=0 then
             Agio_Money := 0
          else
             Agio_Money := edtTable.FindField('ORG_PRICE').AsFloat*Amount-AMoney;

          //计算折扣
          Field := edtTable.FindField('AGIO_RATE');
          if (Field<>nil) and (AMount<>0) then
             begin
                if edtTable.FindField('ORG_PRICE').AsFloat<>0 then
                   Field.AsString := formatFloat('#0.0',AMoney *100 /(edtTable.FindField('ORG_PRICE').AsFloat*Amount))
                else
                   Field.AsString := '100';
             end;
        end;
      Field := edtTable.FindField('AGIO_MONEY');
      if Field<>nil then
         Field.AsString := FormatFloat('#0.00',Agio_Money);

      Field := edtTable.FindField('CALC_MONEY');
      if Field<>nil then
         Field.AsString := FormatFloat('#0.00',AMoney) ;
      edtTable.Post;
      edtTable.Edit;
  finally
      Locked := false;
  end;
end;

procedure TframeOrderForm.edtInputKeyPress(Sender: TObject; var Key: Char);
var
  s:string;
  IsNumber,IsFind,isAdd:Boolean;
  amt:Real;
  AObj:TRecord_;
begin
  inherited;
  try
  if Key=#13 then
    begin
      if (dbState = dsBrowse) then Exit;
      s := trim(edtInput.Text);
      edtInput.SelectAll;
      if edtInput.CanFocus and not edtInput.Focused then edtInput.SetFocus;
      Key := #0;
      try
      if InputFlag=1 then //会员卡号
         begin
           WriteInfo(s);
           InputFlag := 0;
           DBGridEh1.Col := 1;
           edtInput.Text := '';
           Exit;
         end;
      if InputFlag=2 then //整单折扣
         begin
           if s<>'' then AgioInfo(s);
           InputFlag := 0;
           DBGridEh1.Col := 1;
           edtInput.Text := '';
           Exit;
         end;
      if InputFlag=3 then //单价
         begin
           if s<>'' then PriceToGods(s);
           InputFlag := 0;
           DBGridEh1.Col := 1;
           edtInput.Text := '';
           Exit;
         end;
      if InputFlag=4 then //折扣率
         begin
           if s<>'' then AgioToGods(s);
           InputFlag := 0;
           DBGridEh1.Col := 1;
           edtInput.Text := '';
           Exit;
         end;
      if InputFlag=5 then //单位
         begin
           InputFlag := 0;
           DBGridEh1.Col := 1;
           edtInput.Text := '';
           Exit;
         end;
      if InputFlag=6 then //赠品
         begin
           InputFlag := 0;
           DBGridEh1.Col := 1;
           edtInput.Text := '';
           Exit;
         end;
{      if InputFlag=7 then //物流跟踪号
         begin
           if s<>'' then if not GodsToLocusNo(s) then Exit;
           InputFlag := 0;
           DBGridEh1.Col := 1;
           edtInput.Text := '';
           Exit;
         end;
}         
      if InputFlag=8 then //商品批号
         begin
           if s<>'' then if not GodsToBatchNo(s) then Exit;
           InputFlag := 0;
           DBGridEh1.Col := 1;
           edtInput.Text := '';
           Exit;
         end;
      if InputFlag=9 then //数量输入
         begin
           if s<>'' then GodsToAmount(s);
           InputFlag := 0;
           DBGridEh1.Col := 1;
           edtInput.Text := '';
           Exit;
         end;
      isAdd := false;
      if s='' then
         begin
           fndStr := '';
           PostMessage(Handle,WM_DIALOG_PULL,FIND_GOODS_DIALOG,0);
           Exit;
         end;
      IsNumber := false;
      if s[1]='+' then
         begin
            Delete(s,1,1);
            isAdd := true;
         end
      else
      if s[1]='=' then
         begin
            isAdd := false;
            Delete(s,1,1);
            if FnString.IsNumberChar(s) then
               amt := StrtoFloatDef(s,0)
            else
               begin
                 try
                   amt := GetExpressionValue(s,nil);
                 except
                   Raise Exception.Create(XDictFactory.GetMsgStringFmt('frame.InvaildExpression','"%s"是无效计算公式.',[trim(edtInput.Text)]));
                 end;
               end;
            IsNumber := true;
         end ;
      if ((length(s) in [1,2,3,4]) and FnString.IsNumberChar(s)) or IsNumber then
         begin
             if trim(s)='' then Exit;
             if edtTable.FieldbyName('GODS_ID').asString='' then Exit;
             if not IsNumber then amt := StrtoFloatDef(s,0);
             if amt=0 then
                begin
                   AObj := TRecord_.Create;
                   try
                      AObj.ReadFromDataSet(edtTable);
                      DelRecord(AObj)
                   finally
                      AObj.Free;
                   end;
                end
             else
                begin
                  if PropertyEnabled then
                     begin
                       if (vgds = edtTable.FieldbyName('GODS_ID').AsString) and ((vP1<>'#') or (vP2<>'#')) then
                         WriteAmount(edtTable.FieldbyName('UNIT_ID').AsString,vP1,vP2,amt,isAdd)
                       else
                         PostMessage(Handle,WM_DIALOG_PULL,PROPERTY_DIALOG,0);
                     end
                  else
                     begin
                       WriteAmount(edtTable.FieldbyName('UNIT_ID').AsString,'#','#',amt,isAdd);
                     end;
                end;
            edtInput.Text := '';
         end
      else
         begin
           case DecodeBarCode(trim(s)) of
             1:begin
                PostMessage(Handle,WM_DIALOG_PULL,FIND_GOODS_DIALOG,1);
               end;
             2:begin
                if ShopGlobal.GetChkRight('32600001',2) and Assigned(fndGODS_ID.OnAddClick) and CanAppend and (MessageBox(Handle,'输入的条码或货号无效,是否新增一个新的商品?','友情提示...',MB_YESNO+MB_ICONQUESTION)=6) then
                   begin
                     fndGODS_ID.OnAddClick(nil);
                   end
                else
                   if not CanAppend then MessageBox(Handle,'输入的条码无效..','友情提示...',MB_OK+MB_ICONQUESTION);//PostMessage(Handle,WM_DIALOG_PULL,FIND_GOODS_DIALOG,1);
               end;
             3:begin
                 edtInput.Text := '';
                 Exit;
               end;
           else
              edtInput.Text := '';
           end;
         end;
      except
         edtInput.SelectAll;
         Raise;
      end;
    end;

    if Key='-' then
      begin
        if MessageBox(Handle,pchar('是否删除当前选择商品"'+edtTable.FieldbyName('GODS_NAME').asString+'"'),'友情提示...',MB_YESNO+MB_ICONQUESTION)<>6 then Exit;
        AObj := TRecord_.Create;
        try
           AObj.ReadFromDataSet(edtTable);
           DelRecord(AObj)
        finally
           AObj.Free;
        end;
        Key := #0;
      end;
  finally
     if edtInput.CanFocus and not edtInput.Focused then
        if edtInput.CanFocus and not edtInput.Focused then edtInput.SetFocus;
  end;
end;

function TframeOrderForm.PropertyEnabled: boolean;
var
  rs:TZQuery;
begin
  result := false;
  rs := Global.GetZQueryFromName('PUB_GOODSINFO');
  if rs.Locate('GODS_ID',edtTable.FieldbyName('GODS_ID').AsString,[]) then 
  result := not (
       ((rs.FieldbyName('SORT_ID7').AsString = '') or (rs.FieldbyName('SORT_ID7').AsString = '#'))
         and
       ((rs.FieldbyName('SORT_ID8').AsString = '') or (rs.FieldbyName('SORT_ID8').AsString = '#'))
       );
end;            

procedure TframeOrderForm.WMDialogPull(var Message: TMessage);
begin
  case Message.WParam of
  PROPERTY_DIALOG:OpenDialogProperty;
  BATCH_NO_DIALOG:;
  ADD_GOODS_DIALOG:;
  FIND_GOODS_DIALOG:
     begin
       if Message.LParam = 0 then fndStr := '';
       OpenDialogGoods;
     end;
  end;
end;

function TframeOrderForm.CheckRepeat(AObj: TRecord_;var pt:boolean): boolean;
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
           (edtTable.FieldbyName('UNIT_ID').AsString = AObj.FieldbyName('UNIT_ID').AsString)
           and
           (edtTable.FieldbyName('LOCUS_NO').AsString = AObj.FieldbyName('LOCUS_NO').AsString)
           and
           (edtTable.FieldbyName('BATCH_NO').AsString = AObj.FieldbyName('BATCH_NO').AsString)
           and
           (edtTable.FieldbyName('BOM_ID').AsString = AObj.FieldbyName('BOM_ID').AsString)
           and
           (edtTable.FieldbyName('SEQNO').AsInteger <> r)
        then
           begin
             if (edtTable.FindField('LOCATION_ID')=nil) then
                begin
                  inc(c);
                  break;
                end
             else
             if (edtTable.FieldbyName('LOCATION_ID').AsString = AObj.FieldbyName('LOCATION_ID').AsString) then
                begin
                  inc(c);
                  break;
                end;
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

procedure TframeOrderForm.OpenDialogProperty;
var
  AObj:TRecord_;
  fcsInput:boolean;
begin
  if edtTable.FieldbyName('GODS_ID').AsString = '' then Exit;
  if not PropertyEnabled then Exit;
  fcsInput := edtInput.Focused;
  AObj := TRecord_.Create;
  try
    AObj.ReadFromDataSet(edtTable);
    if TframeDialogProperty.ShowDialog(self,AObj,edtProperty,dbState) then
       begin
         if dbState = dsBrowse then Exit;
         if edtTable.State = dsBrowse then edtTable.Edit;
         edtTable.FieldbyName('AMOUNT').AsFloat := AObj.FieldbyName('AMOUNT').AsFloat;
         AMountToCalc(edtTable.FieldbyName('AMOUNT').AsFloat);
         if not edtInput.Focused then
            begin
              DBGridEh1.SetFocus;
              FocusNextColumn;
            end;
       end
    else
       begin
         if dbState = dsBrowse then Exit;
         if edtTable.State = dsBrowse then edtTable.Edit;
         edtTable.FieldbyName('AMOUNT').AsFloat := AObj.FieldbyName('AMOUNT').AsFloat;
       end;
  finally
    AObj.Free;
    if fcsInput then
       begin
         if edtInput.CanFocus and not edtInput.Focused then edtInput.SetFocus;
       end else DBGridEh1.SetFocus;
  end;
end;

procedure TframeOrderForm.SetIsAudit(const Value: boolean);
begin
  FIsAudit := Value;
  if Value then
     begin
        Image1.Visible := True;
     end
  else
     begin
        Image1.Visible := False;
     end;
  PostMessage(GetToolHandle,WM_STATUS_CHANGE,0,0);
end;

procedure TframeOrderForm.Open(id: string);
begin
  oid := id;
end;
procedure TframeOrderForm.InitGrid;
var
  rs:TZQuery;
  Column:TColumnEh;
begin
  inherited;
  Column := FindColumn('UNIT_ID');
  if Column<>nil then
  begin
  rs := Global.GetZQueryFromName('PUB_MEAUNITS');
  rs.First;
  while not rs.Eof do
    begin
      Column.KeyList.Add(rs.FieldbyName('UNIT_ID').AsString);
      Column.PickList.Add(rs.FieldbyName('UNIT_NAME').AsString);
      rs.Next;
    end;
  Column.ReadOnly := true;
  Column.Control := fndUNIT_ID;
  Column.OnBeforeShowControl := DBGridEh1Columns3BeforeShowControl;
  end;
  Column := FindColumn('IS_PRESENT');
  if Column<>nil then
  Column.ReadOnly := true;
end;
procedure TframeOrderForm.OpenDialogGoods;
var
  AObj:TRecord_;
  fcsInput:boolean;
begin
  fcsInput := edtInput.Focused;
  try
  with TframeSelectGoods.Create(self) do
    begin
      try
        MultiSelect := false;
        edtSearch.Text := fndStr;
        OnSave := AddFromDialog;
        if ShowModal=MROK then
           begin
             cdsList.first;
             while not cdsList.eof do
               begin
                 AObj := TRecord_.Create;
                 try
                   AObj.ReadFromDataSet(cdsList);
                   AddFromDialog(AObj);
                 finally
                   AObj.Free;
                 end;
                 cdsList.Next;
               end;
           end;
      finally
        free;
      end;
    end;
  finally
    if fcsInput then
       begin
         if edtInput.CanFocus and not edtInput.Focused then edtInput.SetFocus;
       end else DBGridEh1.SetFocus;
  end;
end;

procedure TframeOrderForm.AddFromDialog(AObj: TRecord_);
var basInfo:TZQuery;
begin
  basInfo := Global.GetZQueryFromName('PUB_GOODSINFO');
  if not basInfo.Locate('GODS_ID',AObj.FieldbyName('GODS_ID').AsString,[]) then Raise Exception.Create('经营商品中没找到"'+AObj.FieldbyName('GODS_NAME').AsString+'"');
  AddRecord(AObj,basInfo.FieldbyName('UNIT_ID').AsString,True);
  if (edtTable.FindField('AMOUNT')<>nil) then
     begin
       if not PropertyEnabled then
          begin
            edtTable.Edit;
            edtTable.FieldbyName('AMOUNT').AsFloat := edtTable.FieldbyName('AMOUNT').AsFloat+0;
            AMountToCalc(edtTable.FieldbyName('AMOUNT').AsFloat);
          end;
     end;
end;

procedure TframeOrderForm.fndGODS_IDFindClick(Sender: TObject);
begin
  inherited;
  fndGODS_ID.CloseList;
  fndGODS_ID.Visible := false;
  OpenDialogGoods;
end;

procedure TframeOrderForm.NewOrder;
begin

end;

procedure TframeOrderForm.SetTabSheet(const Value: TrzTabSheet);
begin
  FTabSheet := Value;
end;

function TframeOrderForm.GetIsNull: boolean;
begin
  ClearInvaid;
  result := edtTable.IsEmpty;
end;

procedure TframeOrderForm.Setoid(const Value: string);
begin
  Foid := Value;
end;

procedure TframeOrderForm.UpdateRecord(AObj: TRecord_; UNIT_ID: string;pt:boolean=false);
var Field:TField;
begin
  if edtTable.State = dsBrowse then
     begin
       if edtTable.FieldbyName('SEQNO').asString='' then
          InitRecord else edtTable.Edit;
     end;
  edtTable.FieldByName('GODS_ID').AsString := AObj.FieldbyName('GODS_ID').AsString;
  edtTable.FieldByName('GODS_NAME').AsString := AObj.FieldbyName('GODS_NAME').AsString;
  edtTable.FieldByName('GODS_CODE').AsString := AObj.FieldbyName('GODS_CODE').AsString;
  edtTable.FieldByName('UNIT_ID').AsString := AObj.FieldbyName('UNIT_ID').AsString;
  edtTable.FieldByName('IS_PRESENT').AsString := '0';
  edtTable.FieldbyName('BATCH_NO').AsString := '#';
  if edtTable.FindField('LOCATION_ID')<>nil then
     edtTable.FieldbyName('LOCATION_ID').AsString := GetDefLocation;
  edtTable.FieldbyName('BARCODE').AsString := EncodeBarcode;
  edtProperty.Filtered := false;
  edtProperty.Filter := 'SEQNO='+edtTable.FieldbyName('SEQNO').AsString;
  edtProperty.Filtered := true;
  try
    edtProperty.First;
    while not edtProperty.Eof do edtProperty.Delete;
  finally
    edtProperty.Filtered := false;
  end;
  InitPrice(AObj.FieldbyName('GODS_ID').AsString,edtTable.FieldByName('UNIT_ID').AsString);
  Field := edtTable.FindField('AMOUNT');
  if Field<>nil then
     begin
       if PropertyEnabled then
          begin
            edtTable.Edit;
            Field.AsFloat := 0;
          end;
       AMountToCalc(Field.AsFloat);
     end
end;

procedure TframeOrderForm.ReadFrom(DataSet: TDataSet);
var
  i:integer;
  r:boolean;
  hasLocation:boolean;
  lid:string;
begin
  hasLocation := (DataSet.FindField('LOCATION_ID')<>nil);
  edtProperty.Close;
  edtTable.Close;
  edtProperty.CreateDataSet;
  edtTable.CreateDataSet;
  edtTable.DisableControls;
  try
  RowID := 0;
  DataSet.First;
  while not DataSet.Eof do
    begin
      if hasLocation then
      begin
        if HasPrice then
           r := edtTable.Locate('GODS_ID;BATCH_NO;LOCATION_ID;UNIT_ID;BOM_ID;LOCUS_NO;IS_PRESENT;APRICE',
                VarArrayOf([DataSet.FieldbyName('GODS_ID').asString,
                          DataSet.FieldbyName('BATCH_NO').asString,DataSet.FieldbyName('LOCATION_ID').asString,
                          DataSet.FieldbyName('UNIT_ID').asString,
                          DataSet.FieldbyName('BOM_ID').Value,
                          DataSet.FieldbyName('LOCUS_NO').Value,
                          DataSet.FieldbyName('IS_PRESENT').asInteger,DataSet.FieldbyName('APRICE').AsCurrency]),[])
        else
           r := edtTable.Locate('GODS_ID;BATCH_NO;LOCATION_ID;UNIT_ID;BOM_ID;LOCUS_NO;IS_PRESENT',
                VarArrayOf([DataSet.FieldbyName('GODS_ID').asString,
                          DataSet.FieldbyName('BATCH_NO').asString,DataSet.FieldbyName('LOCATION_ID').asString,
                          DataSet.FieldbyName('UNIT_ID').asString,
                          DataSet.FieldbyName('BOM_ID').Value,
                          DataSet.FieldbyName('LOCUS_NO').Value,
                          DataSet.FieldbyName('IS_PRESENT').asInteger]),[]);
      end
      else
      begin
        if HasPrice then
           r := edtTable.Locate('GODS_ID;BATCH_NO;UNIT_ID;BOM_ID;LOCUS_NO;IS_PRESENT;APRICE',
                VarArrayOf([DataSet.FieldbyName('GODS_ID').asString,
                          DataSet.FieldbyName('BATCH_NO').asString,
                          DataSet.FieldbyName('UNIT_ID').asString,
                          DataSet.FieldbyName('BOM_ID').Value,
                          DataSet.FieldbyName('LOCUS_NO').Value,
                          DataSet.FieldbyName('IS_PRESENT').asInteger,DataSet.FieldbyName('APRICE').AsCurrency]),[])
        else
           r := edtTable.Locate('GODS_ID;BATCH_NO;UNIT_ID;BOM_ID;LOCUS_NO;IS_PRESENT',
                VarArrayOf([DataSet.FieldbyName('GODS_ID').asString,
                          DataSet.FieldbyName('BATCH_NO').asString,
                          DataSet.FieldbyName('UNIT_ID').asString,
                          DataSet.FieldbyName('BOM_ID').Value,
                          DataSet.FieldbyName('LOCUS_NO').Value,
                          DataSet.FieldbyName('IS_PRESENT').asInteger]),[]);
      end;
      if r then
      begin
        edtTable.Edit;
        for i:=0 to edtTable.Fields.Count -1 do
          begin
            if (edtTable.Fields[i].FieldName<>'SEQNO') and (DataSet.FindField(edtTable.Fields[i].FieldName)<>nil) then
            begin
              if CheckSumField(edtTable.Fields[i].FieldName) then
                edtTable.Fields[i].AsFloat := edtTable.Fields[i].AsFloat + DataSet.FieldbyName(edtTable.Fields[i].FieldName).AsFloat
              else
                edtTable.Fields[i].Value := DataSet.FieldbyName(edtTable.Fields[i].FieldName).Value;
            end;
          end;
        edtTable.Post;
      end
      else
      begin
        edtTable.Append;
        for i:=0 to edtTable.Fields.Count -1 do
          begin
             if DataSet.FindField(edtTable.Fields[i].FieldName)<>nil then
                edtTable.Fields[i].Value := DataSet.FieldbyName(edtTable.Fields[i].FieldName).Value;
          end;
        inc(RowID);
        edtTable.FieldbyName('SEQNO').AsInteger := RowID;
        edtTable.FieldbyName('BARCODE').AsString := EnCodeBarcode;
        if (edtTable.FindField('LOCATION_ID')<>nil) and (edtTable.FieldByName('LOCATION_ID').AsString='') then
           edtTable.FieldByName('LOCATION_ID').AsString := GetDefLocation;
        edtTable.Post;
      end;
      edtProperty.Append;
      for i:=0 to edtProperty.Fields.Count -1 do
        edtProperty.Fields[i].Value := DataSet.FieldbyName(edtProperty.Fields[i].FieldName).Value;
      edtProperty.FieldByName('SEQNO').AsInteger := edtTable.FieldbyName('SEQNO').AsInteger; 
      edtProperty.Post;
      DataSet.Next;
    end;
    edtTable.SortedFields := 'SEQNO';
  finally
    edtTable.EnableControls;
  end;
end;

procedure TframeOrderForm.WriteTo(DataSet: TDataSet);
var
  i,r:integer;
  bs:TZQuery;
  lc:boolean;
begin
  if DataSet.State in [dsEdit,dsInsert] then DataSet.Post;
  edtTable.DisableControls;
  try
  bs := Global.GetZQueryFromName('PUB_GOODSINFO');
  DataSet.First;
  while not DataSet.Eof do DataSet.Delete;
  edtTable.First;
  while not edtTable.Eof do
    begin
      if not bs.Locate('GODS_ID',edtTable.FieldbyName('GODS_ID').AsString,[]) then
         Raise Exception.Create(XDictFactory.GetMsgStringFmt('frame.NoFindGoodsInfo','在经营品牌中没找到"%s"',[edtTable.FieldbyName('GODS_NAME').AsString+'('+edtTable.FieldbyName('GODS_CODE').AsString+')']));
      if ((bs.FieldbyName('SORT_ID7').AsString = '') or (bs.FieldbyName('SORT_ID7').AsString = '#'))
         and
         ((bs.FieldbyName('SORT_ID8').AsString = '') or (bs.FieldbyName('SORT_ID8').AsString = '#'))
      then
         begin
           if not gRepeat then
           begin
             if HasPrice then
                lc := DataSet.Locate('GODS_ID;BATCH_NO;UNIT_ID;IS_PRESENT;LOCUS_NO,BOM_ID;APRICE',
                     VarArrayOf([edtTable.FieldbyName('GODS_ID').AsString,
                              edtTable.FieldbyName('BATCH_NO').AsString,
                              edtTable.FieldbyName('UNIT_ID').AsString,
                              edtTable.FieldbyName('LOCUS_NO').Value,
                              edtTable.FieldbyName('BOM_ID').Value,
                              edtTable.FieldbyName('IS_PRESENT').AsInteger,edtTable.FieldbyName('APRICE').AsCurrency]),[])
             else
                lc := DataSet.Locate('GODS_ID;BATCH_NO;UNIT_ID;IS_PRESENT;LOCUS_NO,BOM_ID',
                     VarArrayOf([edtTable.FieldbyName('GODS_ID').AsString,
                              edtTable.FieldbyName('BATCH_NO').AsString,
                              edtTable.FieldbyName('UNIT_ID').AsString,
                              edtTable.FieldbyName('IS_PRESENT').AsInteger,
                              edtTable.FieldbyName('LOCUS_NO').Value,
                              edtTable.FieldbyName('BOM_ID').Value
                              ]),[]);
             if lc then Raise Exception.Create(XDictFactory.GetMsgStringFmt('frame.GoodsRepeat','"%s"货品重复录入,请核对输入是否正确.',[edtTable.FieldbyName('GODS_NAME').AsString]));
           end;
           DataSet.Append;
           inc(r);
           for i:=0 to edtTable.Fields.Count -1 do
             begin
               if DataSet.FindField(edtTable.Fields[i].FieldName)<>nil then
                  DataSet.FieldbyName(edtTable.Fields[i].FieldName).Value := edtTable.Fields[i].Value;
             end;
           DataSet.FieldbyName('SEQNO').AsInteger := r;
           DataSet.FieldByName('PROPERTY_01').AsString := '#';
           DataSet.FieldByName('PROPERTY_02').AsString := '#';
           DataSet.Post;
         end
      else
         begin
           edtProperty.Filtered := false;
           edtProperty.Filter := 'SEQNO='+edtTable.FieldbyName('SEQNO').asString;
           edtProperty.Filtered := true;
           edtProperty.First;
           while not edtProperty.Eof do
             begin
               DataSet.Append;
               inc(r);
               for i:=0 to edtTable.Fields.Count -1 do
                  begin
                    if DataSet.FindField(edtTable.Fields[i].FieldName)<>nil then
                    begin
                      if not CheckSumField(edtTable.Fields[i].FieldName) then
                         DataSet.FieldbyName(edtTable.Fields[i].FieldName).Value := edtTable.Fields[i].Value
                      else
                         CalcWriteTo(edtTable,DataSet,edtProperty.FindField(edtTable.Fields[i].FieldName));
                    end;
                  end;
               DataSet.FieldbyName('SEQNO').AsInteger := r;
               DataSet.FieldByName('PROPERTY_01').AsString := edtProperty.FieldByName('PROPERTY_01').AsString;
               DataSet.FieldByName('PROPERTY_02').AsString := edtProperty.FieldByName('PROPERTY_02').AsString;
               DataSet.Post;
               edtProperty.Next;
             end;
         end;
      edtTable.Next;
    end;

  if DataSet.IsEmpty then Raise Exception.Create('不能保存一张空单..');
  finally
    edtTable.EnableControls;
  end;
end;

procedure TframeOrderForm.DeleteOrder;
begin

end;

procedure TframeOrderForm.EditOrder;
begin

end;

procedure TframeOrderForm.CancelOrder;
begin

end;

procedure TframeOrderForm.CheckInvaid;
var
  bs:TZQuery;
  r:integer;
  Controls:boolean;
begin
  if edtTable.State in [dsEdit,dsInsert] then edtTable.Post;
  bs := Global.GetZQueryFromName('PUB_GOODSINFO');
  r := edtTable.RecNo;
  Controls := edtTable.ControlsDisabled;
  edtTable.DisableControls;
  try
    edtTable.First;
    while not edtTable.eof do
      begin
        if not bs.Locate('GODS_ID',edtTable.FieldbyName('GODS_ID').AsString,[]) then Raise Exception.Create(edtTable.FieldbyName('GODS_NAME').asString+'在经营商品中没有找到.');
        if (bs.FieldByName('USING_BATCH_NO').AsString = '1') and (edtTable.FindField('BATCH_NO')<>nil) and (edtTable.FieldbyName('BATCH_NO').AsString='#') then Raise Exception.Create(edtTable.FieldbyName('GODS_NAME').asString+'商品必须输入商品批号。');
        if (bs.FieldByName('USING_LOCUS_NO').AsString = '1') and (edtTable.FindField('AMOUNT')<>nil) and (edtTable.FieldbyName('AMOUNT').AsCurrency<>edtTable.FieldbyName('AMOUNT').AsInteger) then Raise Exception.Create(edtTable.FieldbyName('GODS_NAME').asString+'商品不能输入小数的数量。');
        edtTable.Next;
      end;
    if r>0 then edtTable.RecNo := r;
  finally
    if not Controls then edtTable.EnableControls;
  end;
end;

procedure TframeOrderForm.SaveOrder;
begin

end;

procedure TframeOrderForm.CalcWriteTo(edtTable, DataSet: TDataSet;
  MyField: TField);
var
    AMoney,APrice,ACalcMoney,Agio_Rate,Agio_Money:Real;
    Field:TField;
begin
  if MyField=nil then Exit;
  DataSet.FieldByName(MyField.FieldName).asFloat := MyField.asFloat;
  if MyField.FieldName <> 'AMOUNT' then Exit;
  if Locked then Exit;
  Locked := true;
  try
      Field := edtTable.FindField('APRICE');
      if Field=nil then Exit;
      //取单价
      APrice := Field.asFloat;
      //算金额
      AMoney := APrice * MyField.AsFloat;
      Field := edtTable.FindField('AMONEY');
      if Field<>nil then
         DataSet.FieldByName('AMONEY').AsString := FormatFloat('#0.000',AMoney);
         
      if edtTable.FindField('ORG_PRICE') = nil then
        begin
          //计算折扣
          Field := edtTable.FindField('AGIO_RATE');
          if Field<>nil then
             Agio_Rate := (Field.AsFloat / 100)
          else
             Agio_Rate := 1;
          //如果=0为不打折
          if Agio_Rate=0 then Agio_Rate := 1;

          Agio_Money := (AMoney/Agio_Rate) - AMoney;
        end
      else
        begin
          if edtTable.FindField('ORG_PRICE').AsFloat=0 then
             Agio_Money := 0
          else
             Agio_Money := edtTable.FindField('ORG_PRICE').AsFloat*MyField.AsFloat-AMoney;

          //计算折扣
          Field := edtTable.FindField('AGIO_RATE');
          if (Field<>nil) and (MyField.AsFloat<>0) then
             begin
                if edtTable.FindField('ORG_PRICE').AsFloat<>0 then
                   DataSet.FindField('AGIO_RATE').AsString := formatFloat('#0.000',AMoney *100 /(edtTable.FindField('ORG_PRICE').AsFloat*MyField.AsFloat))
                else
                   DataSet.FindField('AGIO_RATE').AsString := '100';
             end;
        end;
        
      Field := DataSet.FindField('AGIO_MONEY');
      if Field<>nil then
         Field.AsString := FormatFloat('#0.000',Agio_Money);

      if edtTable.FieldByName('IS_PRESENT').AsInteger =1 then
         ACalcMoney := 0
      else
         ACalcMoney := AMoney;

      Field := DataSet.FindField('CALC_MONEY');
      if Field<>nil then
         Field.AsString := FormatFloat('#0.000',ACalcMoney) ;
  finally
      Locked := false
  end;
end;

procedure TframeOrderForm.AgioToCalc(Agio: Real);
var Agio_Rate:Real;
    Field:TField;
begin
  if Locked then Exit;
  Locked := true;
  try
      if not (edtTable.State in [dsEdit,dsInsert]) then edtTable.Edit;
      if edtTable.FindField('ORG_PRICE')<>nil then
        begin
          Field := edtTable.FindField('APRICE');
          if Field<>nil then
             begin
               if Agio=0 then
                  Agio_Rate := 1
               else
                  Agio_Rate := Agio / 100;
               Field.AsString := FormatFloat('#0.000',edtTable.FindField('ORG_PRICE').AsFloat * Agio_Rate);
               Locked := false;
               PriceToCalc(Field.asFloat);
             end;
        end;
  finally
      Locked := false
  end;
end;

procedure TframeOrderForm.PresentToCalc(Present: integer);
var
  Field:TField;
begin
  if edtTable.FindField('IS_PRESENT')=nil then Exit;
  edtTable.Edit;
  edtTable.FindField('IS_PRESENT').AsInteger := Present;
  Field := edtTable.FindField('APRICE');
  if Field=nil then Exit;
  if Present=1 then
     begin
       Field.AsFloat := 0;
       PriceToCalc(0);
     end
  else
     begin
       InitPrice(edtTable.FieldbyName('GODS_ID').AsString,edtTable.FieldbyName('UNIT_ID').AsString);
       PriceToCalc(edtTable.FieldbyName('APRICE').AsFloat);
     end;
  if edtTable.State in [dsInsert,dsEdit] then edtTable.Post;
  edtTable.Edit;
end;

procedure TframeOrderForm.AuditOrder;
begin

end;

procedure TframeOrderForm.PreviewOrder;
begin

end;

procedure TframeOrderForm.PrintOrder;
begin

end;

procedure TframeOrderForm.NextOrder;
begin

end;

procedure TframeOrderForm.PriorOrder;
begin

end;

procedure TframeOrderForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if not fndGODS_ID.Focused and not edtInput.Focused and not fndUNIT_ID.Focused and not DBGridEh1.Focused and fndBATCH_NO.Focused and fndLOCATION_ID.Focused then
     begin
       inherited;
     end;

end;

function TframeOrderForm.GetModifyed: boolean;
begin
  if edtTable.State in [dsEdit,dsInsert] then edtTable.Post;
  result := FModifyed;
end;

procedure TframeOrderForm.SetModifyed(const Value: boolean);
begin
  FModifyed := Value;
end;

procedure TframeOrderForm.edtTableBeforePost(DataSet: TDataSet);
begin
  inherited;
  FModifyed := true;
end;

procedure TframeOrderForm.edtTableAfterOpen(DataSet: TDataSet);
begin
  inherited;
  FModifyed := false;
end;

procedure TframeOrderForm.DBGridEh1Columns1BeforeShowControl(
  Sender: TObject);
begin
  inherited;
  fndGODS_ID.Text := edtTable.FieldbyName('GODS_NAME').AsString;
  fndGODS_ID.KeyValue := edtTable.FieldbyName('GODS_ID').AsString;
  fndGODS_ID.SaveStatus;
end;

procedure TframeOrderForm.DBGridEh1BatchNoBeforeShowControl(
  Sender: TObject);
begin
  BatchNoDropList;
end;

procedure TframeOrderForm.edtTableNewRecord(DataSet: TDataSet);
begin
  inherited;
  if not edtTable.ControlsDisabled then InitRecord;
end;

procedure TframeOrderForm.ConvertPresent;
begin
  if dbState = dsBrowse then Exit;
  if edtTable.FieldbyName('GODS_ID').AsString='' then Exit;
  if edtTable.FindField('IS_PRESENT')=nil then Exit;
  case edtTable.FieldbyName('IS_PRESENT').AsInteger of
  0:PresentToCalc(1)
//  1:PresentToCalc(2)
  else
     PresentToCalc(0);
  end;
end;

procedure TframeOrderForm.ConvertUnit;
var
  rs:TZQuery;
  uid:string;
begin
  if dbState = dsBrowse then Exit;
  if edtTable.FieldbyName('GODS_ID').AsString='' then Exit;
  rs := Global.GetZQueryFromName('PUB_GOODSINFO');
  if not rs.Locate('GODS_ID',edtTable.FieldByName('GODS_ID').AsString,[]) then Raise Exception.Create('经营商品中没找到“'+edtTable.FieldbyName('GODS_NAME').AsString+'”');
  if (edtTable.FieldByName('UNIT_ID').AsString = rs.FieldByName('CALC_UNITS').AsString) and (rs.FieldByName('SMALL_UNITS').AsString<>'') then
     begin
       uid := rs.FieldByName('SMALL_UNITS').AsString;
     end
  else
  if (edtTable.FieldByName('UNIT_ID').AsString = rs.FieldByName('CALC_UNITS').AsString) and (rs.FieldByName('BIG_UNITS').AsString<>'') then
     begin
       uid := rs.FieldByName('BIG_UNITS').AsString;
     end
  else
  if (edtTable.FieldByName('UNIT_ID').AsString = rs.FieldByName('SMALL_UNITS').AsString) and (rs.FieldByName('BIG_UNITS').AsString<>'') then
     begin
       uid := rs.FieldByName('BIG_UNITS').AsString;
     end
  else
     uid := rs.FieldByName('CALC_UNITS').AsString;
  if uid=edtTable.FieldByName('UNIT_ID').AsString then Exit;
  UnitToCalc(uid);
  fndUNIT_ID.Visible := false;
end;

procedure TframeOrderForm.Setcid(const Value: string);
begin
  Fcid := Value;
end;

function TframeOrderForm.Getcid: string;
begin
  if fcid='' then result := Global.Shop_Id else result := fcid;
end;

procedure TframeOrderForm.SetSaved(const Value: boolean);
begin
  FSaved := Value;
end;

procedure TframeOrderForm.DBGridEh1DblClick(Sender: TObject);
begin
  inherited;
  if edtTable.IsEmpty then Exit;
  if DBGridEh1.Columns[DBGridEh1.Col].FieldName='AMOUNT' then
     begin
       if PropertyEnabled then PostMessage(Handle,WM_DIALOG_PULL,PROPERTY_DIALOG,0);
     end;
  if DBGridEh1.Columns[DBGridEh1.Col].FieldName='UNIT_ID' then
     begin
       ConvertUnit;
     end;
end;

procedure TframeOrderForm.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key=VK_SHIFT then
    begin
      if edtTable.IsEmpty then Exit;
      if DBGridEh1.Columns[DBGridEh1.Col].FieldName='IS_PRESENT' then
         begin
           ConvertPresent;
         end;
      if DBGridEh1.Columns[DBGridEh1.Col].FieldName='UNIT_ID' then
         begin
           ConvertUnit;
       end;
    end;
  if DBGridEh1.Columns[DBGridEh1.Col].FieldName='AMOUNT' then
     begin
       if PropertyEnabled and not (Key in [VK_ESCAPE,VK_RETURN,VK_TAB,VK_LEFT,VK_RIGHT,VK_DOWN,VK_UP,VK_F6])
          then
             begin
               PostMessage(Handle,WM_DIALOG_PULL,PROPERTY_DIALOG,0);
               Key := 0;
             end;
     end;
end;

procedure TframeOrderForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Shift=[]) and (Key = VK_F2) then
     begin
       if edtInput.CanFocus and Visible and not edtInput.Focused then edtInput.SetFocus;
       InputFlag := 0;
       Exit;
     end;
  if (Shift=[]) and (Key = VK_F5) then
     begin
       if edtInput.CanFocus and Visible and not edtInput.Focused then edtInput.SetFocus;
       InputFlag := 1;
       Exit;
     end;
  if (Shift=[]) and (Key = VK_F6) then
     begin
       if edtInput.CanFocus and Visible and not edtInput.Focused then edtInput.SetFocus;
       InputFlag := 2;
       Exit;
     end;

  if (Shift=[]) and (Key = VK_F11) then
     begin
       ConvertUnit;
       InputFlag := 0;
       Exit;
     end;

  if (Shift=[]) and (Key = VK_F12) then
     begin
       if edtInput.CanFocus and Visible and not edtInput.Focused then edtInput.SetFocus;
       InputFlag := 3;
       Exit;
     end;

  if (Shift=[]) and (Key = VK_F4) then
     begin
       ConvertPresent;
       InputFlag := 0;
       Exit;
     end;

  if (Shift=[]) and (Key = VK_F3) then
     begin
       if edtInput.CanFocus and Visible and not edtInput.Focused then edtInput.SetFocus;
       InputFlag := 9;
       Exit;
     end;

//  if (Shift=[]) and (Key = VK_F7) then
//     begin
//       if edtInput.CanFocus and Visible then edtInput.SetFocus;
//       InputFlag := 7;
//       Exit;
//     end;

  if (Shift=[]) and (Key = VK_F8) then
     begin
       if edtInput.CanFocus and Visible and not edtInput.Focused then edtInput.SetFocus;
       InputFlag := 8;
       Exit;
     end;

  if (ssCtrl in Shift) and (Key in [ord('D'),ord('d')]) then
     begin
       if Assigned(TabSheet) then
       begin
         PostMessage(GetToolHandle,WM_EXEC_ORDER,0,1);
       end;
     end;
  if (ssCtrl in Shift) and (Key in [ord('I'),ord('i')]) then
     begin
       if Assigned(TabSheet) then
       begin
         PostMessage(GetToolHandle,WM_EXEC_ORDER,0,2);
       end;
     end;
  if (ssCtrl in Shift) and (Key in [ord('S'),ord('s')]) then
     begin
       if Assigned(TabSheet) then
       begin
         PostMessage(GetToolHandle,WM_EXEC_ORDER,0,0);
       end;
     end;
  if (ssCtrl in Shift) and (Key in [ord('Z'),ord('z')]) then
     begin
       if Assigned(TabSheet) then
       begin
         PostMessage(GetToolHandle,WM_EXEC_ORDER,0,7);
       end;
     end;
  if (ssCtrl in Shift) and (Key = VK_END) then
     begin
       if Assigned(TabSheet) then
       begin
         PostMessage(GetToolHandle,WM_EXEC_ORDER,0,4);
       end;
     end;
  if (ssCtrl in Shift) and (Key = VK_PRIOR) then
     begin
       if Assigned(TabSheet) then
       begin
         PostMessage(GetToolHandle,WM_EXEC_ORDER,0,5);
       end;
     end;
  if (ssCtrl in Shift) and (Key = VK_NEXT) then
     begin
       if Assigned(TabSheet) then
       begin
         PostMessage(GetToolHandle,WM_EXEC_ORDER,0,6);
       end;
     end;
  if (ssCtrl in Shift) and (Key = VK_F5) then
     begin
       if Assigned(TabSheet) then
       begin
         PostMessage(GetToolHandle,WM_EXEC_ORDER,0,8);
       end;
     end;
  if (ssCtrl in Shift) and (Key in [ord('P'),ord('p')]) then
     begin
       if Assigned(TabSheet) then
       begin
         PostMessage(GetToolHandle,WM_EXEC_ORDER,0,3);
       end;
     end;
  if (ssCtrl in Shift) and (ssShift in Shift) and (Key in [ord('P'),ord('p')]) then
     begin
       if Assigned(TabSheet) then
       begin
         PostMessage(GetToolHandle,WM_EXEC_ORDER,0,10);
       end;
     end;
  if (ssCtrl in Shift) and (Key in [ord('E'),ord('e')]) then
     begin
       if Assigned(TabSheet) then
       begin
         PostMessage(GetToolHandle,WM_EXEC_ORDER,0,11);
       end;
     end;

end;

procedure TframeOrderForm.WriteInfo(id: string);
begin
  InputFlag := 0;
end;

procedure TframeOrderForm.edtInputKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Shift = []) and(Key = VK_TAB) and (InputFlag=0) then
     begin
       if InputMode = 0 then InputMode := 1 else InputMode := 0;
       InputFlag := 0;
       Key := 0;
       Exit;
     end;
  try
  if trim(edtInput.Text)='' then
     begin
       if Key=VK_LEFT then
          begin
            while true do
              begin
                if DBGridEh1.Col > 1 then
                   DBGridEh1.Col := DBGridEh1.Col-1
                else
                   break;
                if DBGridEh1.Columns[DBGridEh1.Col].Visible then break
              end;
            if DBGridEh1.Columns[DBGridEh1.Col].FieldName = 'APRICE' then
               InputFlag := 3
            else
            if DBGridEh1.Columns[DBGridEh1.Col].FieldName = 'AGIO_RATE' then
               InputFlag := 4
            else
            if DBGridEh1.Columns[DBGridEh1.Col].FieldName = 'UNIT_ID' then
               InputFlag := 5
            else
            if DBGridEh1.Columns[DBGridEh1.Col].FieldName = 'AMOUNT' then
               InputFlag := 9
            else
            if DBGridEh1.Columns[DBGridEh1.Col].FieldName = 'IS_PRESENT' then
               InputFlag := 6
            else
//            if DBGridEh1.Columns[DBGridEh1.Col].FieldName = 'LOCUS_NO' then
//               InputFlag := 7
//            else
            if DBGridEh1.Columns[DBGridEh1.Col].FieldName = 'BATCH_NO' then
               InputFlag := 8
            else
               InputFlag := 0;
          end;
       if Key=VK_RIGHT then
          begin
            while true do
              begin
                if DBGridEh1.Col < (DBGridEh1.Columns.Count-1) then
                   DBGridEh1.Col := DBGridEh1.Col+1 else break;
                if DBGridEh1.Columns[DBGridEh1.Col].Visible then break
              end;
            if DBGridEh1.Columns[DBGridEh1.Col].FieldName = 'APRICE' then
               InputFlag := 3
            else
            if DBGridEh1.Columns[DBGridEh1.Col].FieldName = 'AGIO_RATE' then
               InputFlag := 4
            else
            if DBGridEh1.Columns[DBGridEh1.Col].FieldName = 'AMOUNT' then
               InputFlag := 9
            else
            if DBGridEh1.Columns[DBGridEh1.Col].FieldName = 'UNIT_ID' then
               InputFlag := 5
            else
            if DBGridEh1.Columns[DBGridEh1.Col].FieldName = 'IS_PRESENT' then
               InputFlag := 6
            else
//            if DBGridEh1.Columns[DBGridEh1.Col].FieldName = 'LOCUS_NO' then
//               InputFlag := 7
//            else
            if DBGridEh1.Columns[DBGridEh1.Col].FieldName = 'BATCH_NO' then
               InputFlag := 8
            else
               InputFlag := 0;
          end;
     end;

  if Key=VK_DOWN then
     begin
       edtTable.Next;
       if edtTable.Eof then PostMessage(Handle,WM_INIT_RECORD,0,0);
       if edtInput.CanFocus and not edtInput.Focused then edtInput.SetFocus;
     end;
  if (Key = VK_TAB) and (InputFlag=5) then
     begin
       ConvertUnit;
     end;
  if (Key = VK_TAB) and (InputFlag=6) then
     begin
       ConvertPresent;
     end;
  if Key=VK_UP then
     edtTable.Prior;
  if Key=VK_ESCAPE then
     begin
       if InputFlag<>0 then
          begin
            edtInput.Text := '';
            DBGridEh1.Col := 1;
            InputMode := StrtoIntDef(ShopGlobal.GetParameter('INPUT_MODE'),0);
            InputFlag := 0;
          end
       else
          PostMessage(GetToolHandle,WM_EXEC_ORDER,0,7);
     end;
  finally
     if edtInput.CanFocus and not edtInput.Focused then edtInput.SetFocus;
  end;
end;

procedure TframeOrderForm.SetInputFlag(const Value: integer);
begin
  FInputFlag := Value;
  case Value of
  0:begin
      case InputMode of
      0:begin
         lblInput.Caption := '条码输入';
         lblHint.Caption := '切换成“货号”输入按 tab 键  <F2>激活输入框';
        end;
      1:begin
         lblInput.Caption := '货号输入';
         lblHint.Caption := '切换成“条码”输入按 tab 键  <F2>激活输入框';
        end;
      2:begin
         InputFlag := 10;
        end;
      end;
      Exit;
    end;
  1:begin
      lblInput.Caption := '会员卡号';
      lblHint.Caption := '请输入完整的(会员卡号)后按“回车”';
    end;
  2:begin
      lblInput.Caption := '整单折扣';
      lblHint.Caption := '请输入整单折扣率(如:8折、85折)后按“回车”';
    end;
  3:begin
      lblInput.Caption := '修改单价';
      lblHint.Caption := '请直接输入单价后按“回车”';
    end;
  4:begin
      lblInput.Caption := '单笔折扣';
      lblHint.Caption := '请直接输入当前商品的折扣率(如:8折、85折)后按“回车”';
    end;
  5:begin
      lblInput.Caption := '单位切换';
      lblHint.Caption := '请按 tab 健进行单位转换';
    end;
  6:begin
      lblInput.Caption := '赠品/兑换';
      lblHint.Caption := '请按 tab 健进行"正常/赠品/兑换"转换';
    end;
  7:begin
      lblInput.Caption := '物流条码';
      lblHint.Caption := '请输入物流跟踪号后按“回车”';
    end;
  8:begin
      lblInput.Caption := '商品批号';
      lblHint.Caption := '请输入商品批号后按“回车”';
    end;
  9:begin
      lblInput.Caption := '数量输入';
      lblHint.Caption := '请输入商品批号后按“回车”';
    end;
  end;
  if not CheckInput then InputFlag := 0;
end;

procedure TframeOrderForm.AgioInfo(id: string);
var
  Field:TField;
  s:string;
begin
  s := trim(id);
  if length(s)=1 then s := s + '0';
  try
    StrToFloat(s);
  except
    Raise Exception.Create('输入的折扣率无效，请正确输入；如:9折录入 9'); 
  end;
  if StrToFloat(s)>100 then Raise Exception.Create('输入的折扣率过大，请确认是否输入正确');
  Field := edtTable.FindField('AGIO_RATE');
  if Field=nil then Exit;
  edtTable.First;
  while not edtTable.Eof do
    begin
      if edtTable.FieldbyName('GODS_ID').asString<>'' then
         begin
            AgioToGods(id);
         end;
      edtTable.Next;
    end;
end;

procedure TframeOrderForm.AgioToGods(id: string);
var
  Field:TField;
  s:string;
begin
  if edtTable.FieldbyName('GODS_ID').asString='' then Raise Exception.Create('请选择商品后再执行此操作');
  s := trim(id);
  if length(s)=1 then s := s + '0';
  try
    StrToFloat(s);
  except
    Raise Exception.Create('输入的折扣率无效，请正确输入；如:9折录入 9');
  end;
  if StrToFloat(s)>100 then Raise Exception.Create('输入的折扣率过大，请确认是否输入正确');
  Field := edtTable.FindField('AGIO_RATE');
  if Field=nil then Exit;
  edtTable.Edit;
  Field.AsFloat := StrToFloat(s);
  AgioToCalc(Field.AsFloat);
end;

procedure TframeOrderForm.PriceToGods(id: string);
var
  Field:TField;
  s:string;
begin
  if edtTable.FieldbyName('GODS_ID').asString='' then Raise Exception.Create('请选择商品后再执行此操作');
  s := trim(id);
  try
    StrToFloat(s);
  except
    Raise Exception.Create('输入的单价无效，请正确输入');
  end;
  if abs(StrToFloat(s))>99999999 then Raise Exception.Create('输入的单价过大，请确认是否输入正确');
  Field := edtTable.FindField('APRICE');
  if Field=nil then Exit;
  edtTable.Edit;
  Field.AsFloat := StrToFloat(s);
  PriceToCalc(Field.AsFloat);
end;

function TframeOrderForm.GetToolHandle: THandle;
var w:TWinControl;
begin
  result := 0;
  if Assigned(TabSheet) then
  begin
  w := TabSheet.Parent;
  while w<>nil do
    begin
      if w is TForm then
         begin
           result := w.Handle;
           Exit;
         end;
      w := w.Parent;
    end;
  end;
end;

procedure TframeOrderForm.edtInputExit(Sender: TObject);
begin
  inherited;
//  lblHint.Caption := '请按 [F2] 光标激活条码输入框...';
end;

procedure TframeOrderForm.fndGODS_IDExit(Sender: TObject);
begin
  inherited;
  if not fndGODS_ID.DropListed then fndGODS_ID.Visible := false;
end;

procedure TframeOrderForm.DBGridEh1Columns3BeforeShowControl(
  Sender: TObject);
var
  rs:TZQuery;
  us:TZQuery;
begin
  inherited;
  fndUNIT_ID.Tag := 1;
  try
  rs := Global.GetZQueryFromName('PUB_GOODSINFO');
  us := Global.GetZQueryFromName('PUB_MEAUNITS');
  fndUNIT_ID.Properties.Items.Clear;
  if rs.Locate('GODS_ID',edtTable.FieldbyName('GODS_ID').AsString,[]) then
     begin
       if us.Locate('UNIT_ID',rs.FieldbyName('CALC_UNITS').AsString,[]) then
          fndUNIT_ID.Properties.Items.AddObject(us.FieldbyName('UNIT_NAME').AsString,TObject(0));
       if us.Locate('UNIT_ID',rs.FieldbyName('SMALL_UNITS').AsString,[]) then
          fndUNIT_ID.Properties.Items.AddObject(us.FieldbyName('UNIT_NAME').AsString,TObject(1));
       if us.Locate('UNIT_ID',rs.FieldbyName('BIG_UNITS').AsString,[]) then
          fndUNIT_ID.Properties.Items.AddObject(us.FieldbyName('UNIT_NAME').AsString,TObject(2));
     end;
  if us.Locate('UNIT_ID',edtTable.FieldbyName('UNIT_ID').AsString,[]) then
     begin
       fndUNIT_ID.Properties.ReadOnly := false;
       fndUNIT_ID.ItemIndex := fndUNIT_ID.Properties.Items.IndexOf(us.FieldbyName('UNIT_NAME').AsString);
       fndUNIT_ID.Properties.ReadOnly := (dbState = dsBrowse);
     end;
  finally
     fndUNIT_ID.Tag := 0;
  end;
end;

procedure TframeOrderForm.fndUNIT_IDExit(Sender: TObject);
begin
  inherited;
  fndUNIT_ID.Visible := false;

end;

procedure TframeOrderForm.fndUNIT_IDEnter(Sender: TObject);
begin
  inherited;
  fndUNIT_ID.Properties.ReadOnly := DBGridEh1.ReadOnly;

end;

procedure TframeOrderForm.fndUNIT_IDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key=VK_RIGHT) then
     begin
       DBGridEh1.SetFocus;
       fndUNIT_ID.Visible := false;
       FocusNextColumn;
     end;
  if (Key=VK_LEFT) then
     begin
       DBGridEh1.SetFocus;
       fndUNIT_ID.Visible := false;
       DBGridEh1.Col := DBGridEh1.Col -1;
     end;
  if (Key=VK_UP) and (Shift=[]) and not fndUNIT_ID.DroppedDown then
     begin
       DBGridEh1.SetFocus;
       fndUNIT_ID.Visible := false;
       PostMessage(Handle,WM_PRIOR_RECORD,0,0);
     end;
  if (Key=VK_DOWN) and (Shift=[]) and not fndUNIT_ID.DroppedDown then
     begin
       DBGridEh1.SetFocus;
       fndUNIT_ID.Visible := false;
       PostMessage(Handle,WM_NEXT_RECORD,0,0);
     end;
  if Key=VK_SHIFT then
    begin
      if edtTable.IsEmpty then Exit;
      if DBGridEh1.Columns[DBGridEh1.Col].FieldName='IS_PRESENT' then
         begin
           ConvertPresent;
         end;
      if DBGridEh1.Columns[DBGridEh1.Col].FieldName='UNIT_ID' then
         begin
           ConvertUnit;
       end;
    end;

end;

procedure TframeOrderForm.fndUNIT_IDKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key=#13 then
     begin
       Key := #0;
       DBGridEh1.SetFocus;
       FocusNextColumn;
     end
  else
  if not fndUNIT_ID.DroppedDown then fndUNIT_ID.DroppedDown := true;
end;

procedure TframeOrderForm.fndUNIT_IDPropertiesChange(Sender: TObject);
var
  w:integer;
  rs:TZQuery;
begin
  inherited;
  if fndUNIT_ID.Tag = 1 then Exit;
  if fndUNIT_ID.ItemIndex < 0 then Exit;
  if not fndUNIT_ID.Visible then Exit;
  w := Integer(fndUNIT_ID.Properties.Items.Objects[fndUNIT_ID.ItemIndex]);
  rs := Global.GetZQueryFromName('PUB_GOODSINFO');
  if rs.Locate('GODS_ID',edtTable.FieldbyName('GODS_ID').AsString,[]) then
     begin
       edtTable.Edit;
       case w of
       0:UnitToCalc(rs.FieldbyName('CALC_UNITS').AsString);
       1:UnitToCalc(rs.FieldbyName('SMALL_UNITS').AsString);
       2:UnitToCalc(rs.FieldbyName('BIG_UNITS').AsString);
       end;
     end;
end;

procedure TframeOrderForm.Setgid(const Value: string);
begin
  Fgid := Value;
  lblCaption.Caption := '单号:'+Value;
end;

procedure TframeOrderForm.SetbasInfo(const Value: TDataSet);
begin
  FbasInfo := Value;
end;

function TframeOrderForm.IsKeyPress: boolean;
begin
  result := not fndGODS_ID.Focused and not edtInput.Focused and not fndUNIT_ID.Focused and not DBGridEh1.Focused;
end;

function TframeOrderForm.EnCodeBarcode: string;
var
  b:string;
  pbar:TZQuery;
begin
  pbar := Global.GetZQueryFromName('PUB_BARCODE');
  basInfo.Filtered := false;
  if basInfo.Locate('GODS_ID',edtTable.FieldbyName('GODS_ID').AsString,[]) then
     begin
       if (basInfo.FieldbyName('CALC_UNITS').asString=edtTable.FieldbyName('UNIT_ID').asString)
       then
          b := basInfo.FieldbyName('BARCODE').asString
       else
          begin
            if pbar.Locate('GODS_ID;UNIT_ID;PROPERTY_01;PROPERTY_02',VarArrayOf([edtTable.FieldbyName('GODS_ID').asString,edtTable.FieldbyName('UNIT_ID').asString,'#','#']),[]) then
               b := pbar.FieldbyName('BARCODE').asString
            else
               b := basInfo.FieldbyName('BARCODE').asString;
          end;
       //if (b='') and (basInfo.FieldbyName('BCODE').asString<>'') then
       //   b := GetBarCode(basInfo.FieldbyName('BCODE').asString,'#','#');
     end
  else
     b := '';
  result := b;
end;

procedure TframeOrderForm.edtTableAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if not edtTable.ControlsDisabled and edtTable.Eof and (edtTable.FieldbyName('GODS_ID').AsString<>'') then
     PostMessage(Handle,WM_INIT_RECORD,0,0);
end;

procedure TframeOrderForm.WMInitRecord(var Message: TMessage);
begin
  InitRecord;
end;

procedure TframeOrderForm.mnuDeleteGodsClick(Sender: TObject);
begin
  inherited;
  if DBGridEh1.ReadOnly then Exit;
  if dbState = dsBrowse then Exit;
  if not edtTable.IsEmpty and (MessageBox(Handle,pchar('确认删除"'+edtTable.FieldbyName('GODS_NAME').AsString+'"商品吗？'),pchar(Application.Title),MB_YESNO+MB_ICONQUESTION)=6) then
     begin
       fndGODS_ID.Visible := false;
       edtTable.Delete;
       DBGridEh1.SetFocus;
     end;
end;

procedure TframeOrderForm.IsPresentUpdateData(Sender: TObject;
  var Text: String; var Value: Variant; var UseText, Handled: Boolean);
var Field:TField;
begin
  Field := edtTable.FindField('IS_PRESENT');
  if Field=nil then Exit;
  try
    Field.Value := Value;
    PresentToCalc(Field.AsInteger)
  except
    Raise;
  end;
end;

function TframeOrderForm.GetHasPrice: boolean;
begin
  result := false; 
end;

procedure TframeOrderForm.mnuGodsPropertyClick(Sender: TObject);
begin
  inherited;
  if not edtTable.Active then exit;
  if edtTable.FieldByName('GODS_ID').AsString='' then exit;
  with TfrmGoodsInfo.Create(self) do
    begin
      try
        Open(edtTable.FieldByName('GODS_ID').AsString);
        ShowModal;
      finally
        free;
      end;
    end;

end;

procedure TframeOrderForm.SetCanAppend(const Value: boolean);
begin
  FCanAppend := Value;
end;

procedure TframeOrderForm.actCopyToNewClick(Sender: TObject);
begin
  inherited;
  if dbState = dsBrowse then Exit;
  if edtTable.IsEmpty then Exit;
  if DBGridEh1.ReadOnly then Exit;
  fndStr := edtTable.FieldbyName('GODS_ID').AsString;
  if Assigned(fndGODS_ID.OnAddClick) then
     fndGODS_ID.OnAddClick(fndGODS_ID);
end;

procedure TframeOrderForm.SetInputMode(const Value: integer);
begin
  FInputMode := Value;
end;

procedure TframeOrderForm.SetisZero(const Value: boolean);
begin
  FisZero := Value;
end;

procedure TframeOrderForm.WMNextRecord(var Message: TMessage);
begin
  if edtTable.Active then
    begin
      edtTable.Next;
      if edtTable.Eof then
         PostMessage(Handle,WM_INIT_RECORD,0,0);
    end;
end;

procedure TframeOrderForm.WMPriorRecord(var Message: TMessage);
begin
  if edtTable.Active then edtTable.Prior;
end;

procedure TframeOrderForm.uf(Sender: TObject);
var
  r,sr:integer;
begin
  inherited;
  if not edtTable.Active then Exit;
  if DBGridEh1.ReadOnly then Exit;
  if dbState = dsBrowse then Exit;
  if edtTable.State in [dsEdit,dsInsert] then edtTable.Post;
  if edtTable.FieldByName('GODS_ID').AsString = '' then Exit;
  r := edtTable.FieldbyName('SEQNO').AsInteger;
  edtTable.DisableControls;
  try
    edtTable.SortedFields := 'GODS_ID';
    edtTable.Filtered := false;
    edtTable.First;
    while not edtTable.Eof do
      begin
        if edtTable.FieldbyName('SEQNO').AsInteger>=r then
           begin
             edtTable.Edit;
             edtTable.FieldByName('SEQNO').AsInteger := edtTable.FieldByName('SEQNO').AsInteger + 1;
             edtTable.Post;
           end;
        edtTable.Next;
      end;
    edtProperty.Filtered := false;
    edtProperty.First;
    while not edtProperty.Eof do
      begin
        if edtProperty.FieldbyName('SEQNO').AsInteger>=r then
           begin
             edtProperty.Edit;
             edtProperty.FieldByName('SEQNO').AsInteger := edtProperty.FieldByName('SEQNO').AsInteger + 1;
             edtProperty.Post;
           end;
        edtProperty.Next;
      end;
    inc(RowID);
    edtTable.Append;
    edtTable.FieldByName('GODS_ID').Value := null;
    edtTable.FieldByName('IS_PRESENT').Value := 0;
    if edtTable.FindField('SEQNO')<> nil then
       edtTable.FindField('SEQNO').asInteger := r;
    edtTable.Post;
    edtTable.SortedFields := 'SEQNO';
    edtTable.Locate('SEQNO',r,[]); 
    edtTable.Edit;
    fndGODS_ID.KeyValue := null;
    fndGODS_ID.Text := '';
    DBGridEh1.Col := 1;
  finally
    edtTable.EnableControls;
  end;
end;

procedure TframeOrderForm.munAppendRowClick(Sender: TObject);
begin
  inherited;
  if DBGridEh1.ReadOnly then Exit;
  InitRecord;
end;

function TframeOrderForm.GetCostPrice(SHOP_ID, GODS_ID,
  BATCH_NO: string): real;
var
  rs:TZQuery;
  bs:TZQuery;
begin
  rs:=TZQuery.Create(nil);
  try
    rs.SQL.Text :=
      'select AMONEY,AMOUNT from ('+
      'select sum(AMONEY) as AMONEY,sum(AMOUNT) as AMOUNT from STO_STORAGE where TENANT_ID=:TENANT_ID and SHOP_ID=:SHOP_ID and GODS_ID=:GODS_ID and BATCH_NO=:BATCH_NO ) j where round(AMOUNT,3)<>0';
    rs.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
    rs.ParamByName('SHOP_ID').AsString := SHOP_ID;
    rs.ParamByName('GODS_ID').AsString := GODS_ID;
    rs.ParamByName('BATCH_NO').AsString := BATCH_NO;
    Factor.Open(rs);
    if rs.IsEmpty then
       begin
         bs := Global.GetZQueryFromName('PUB_GOODSINFO');
         if bs.Locate('GODS_ID',GODS_ID,[]) then
            result := bs.FieldbyName('NEW_INPRICE').AsFloat
         else
            Raise Exception.Create('没找到经营商品');
       end
    else
       result := rs.Fields[0].AsFloat/rs.Fields[1].AsFloat;
  finally
    rs.Free;
  end;
end;

function TframeOrderForm.GodsToBatchNo(id: string):boolean;
var
  rs,bs:TZQuery;
  AObj:TRecord_;
  r:boolean;
  pt:integer;
begin
  if edtTable.FieldByName('GODS_ID').AsString = '' then
     begin
       result := true;
       MessageBox(Handle,pchar('请输入商品后再输入批号.'),'友情提示...',MB_OK+MB_ICONINFORMATION);
       Exit;
     end;
  if id = '' then Raise Exception.Create('输入的批号无效'); 
  result := false;
  rs := TZQuery.Create(nil);
  AObj := TRecord_.Create;
  bs := Global.GetZQueryFromName('PUB_GOODSINFO'); 
  try
    rs.SQL.Text := 'select max(BATCH_NO) from STO_STORAGE where TENANT_ID='+inttostr(Global.TENANT_ID)+' and SHOP_ID='''+cid+''' and GODS_ID='''+edtTable.FieldbyName('GODS_ID').AsString+''' and BATCH_NO='''+id+'''';
    Factor.Open(rs);
    if rs.Fields[0].asString='' then
       begin
         //if not bs.Locate('GODS_ID',edtTable.FieldByName('GODS_ID').AsString,[]) then Raise Exception.Create('在经营品牌中没找到.');
         //if bs.FieldbyName('USING_BATCH_NO').asInteger<>1 then Raise Exception.Create('当前商品没有启用批号管制...');
         MessageBox(Handle,'当前门店没有此批号的商品,不能发货?','友情提示..',MB_OK+MB_ICONQUESTION);
         Exit;
       end;
    edtTable.Edit;
    edtTable.FieldbyName('BATCH_NO').asString := id;
    result := true;
  finally
    AObj.Free;
    rs.Free;
  end;
end;

procedure TframeOrderForm.GodsToAmount(id: string);
var
  Field:TField;
  s:string;
begin
  if edtTable.FieldbyName('GODS_ID').asString='' then Raise Exception.Create('请选择商品后再执行此操作');
  s := trim(id);
  try
    StrToFloat(s);
  except
    Raise Exception.Create('输入的数量无效，请正确输入');
  end;
  if abs(StrToFloat(s))>99999999 then Raise Exception.Create('输入的数量过大，请确认是否输入正确');
  Field := edtTable.FindField('AMOUNT');
  if Field=nil then Exit;
  edtTable.Edit;
  Field.AsFloat := StrToFloat(s);
  AmountToCalc(Field.AsFloat);
end;

function TframeOrderForm.CheckInput: boolean;
begin
  result := true;
end;

procedure TframeOrderForm.actLocusNoExecute(Sender: TObject);
begin
  inherited;
  if edtInput.CanFocus and Visible and not edtInput.Focused then edtInput.SetFocus;
  InputFlag := 7;
end;

procedure TframeOrderForm.actBatchNoExecute(Sender: TObject);
begin
  inherited;
  if DBGridEh1.ReadOnly then Exit;
  if edtInput.CanFocus and Visible and not edtInput.Focused then edtInput.SetFocus;
  InputFlag := 8;

end;

procedure TframeOrderForm.actUnitConvertExecute(Sender: TObject);
begin
  inherited;
  if DBGridEh1.ReadOnly then Exit;
  ConvertUnit;
end;

procedure TframeOrderForm.actIsPressentExecute(Sender: TObject);
begin
  inherited;
  if DBGridEh1.ReadOnly then Exit;
  if edtTable.FieldbyName('IS_PRESENT').AsInteger = 0 then
     PresentToCalc(1)
  else
     PresentToCalc(0);
end;

procedure TframeOrderForm.actIntegralExecute(Sender: TObject);
begin
  inherited;
  PresentToCalc(2);

end;

procedure TframeOrderForm.edtInputEnter(Sender: TObject);
begin
  inherited;
  edtInput.SelectAll;
  if myHKL>0 then
     ActivateKeyBoardLayOut(myHKL,KLF_ACTIVATE);
end;

procedure TframeOrderForm.CheckLowerPrice(aprc: Currency);
var
  rs:TZQuery;
begin
  rs := Global.GetZQueryFromName('PUB_GOODSINFO');
  if not rs.Locate('GODS_ID',edtTable.FieldbyName('GODS_ID').AsString,[]) then Raise Exception.Create('当前商品库中没找到此经营商品');
  if rs.FieldByName('NEW_LOWPRICE').AsCurrency > aprc then Raise Exception.Create('修改的价格不能低于当前商品最低售价,最低售价为:'+rs.FieldByName('NEW_LOWPRICE').AsString);
end;

procedure TframeOrderForm.BarcodeFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if length(fndStr)=6 then
     Accept := copy(DataSet.FieldbyName('BARCODE').AsString,length(DataSet.FieldbyName('BARCODE').AsString)-5,6)=fndStr
  else
     Accept := DataSet.FieldbyName('BARCODE').AsString=fndStr;
end;

procedure TframeOrderForm.GodsInfoFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept :=
    (pos(fndStr,DataSet.FieldbyName('GODS_CODE').AsString)>0)

end;

procedure TframeOrderForm.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if (Column.FieldName = 'IS_PRESENT') and (Column.Field.AsInteger<>0) then
     Background := clRed;
end;

procedure TframeOrderForm.SetIsDefault(const Value: boolean);
begin
  FIsDefault := Value;
end;

procedure TframeOrderForm.GodsDropFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept :=
    (pos(fndGODS_ID.Text,DataSet.FieldbyName('GODS_CODE').AsString)>0);
  if not Accept then
  Accept := (pos(lowercase(fndGODS_ID.Text),lowercase(DataSet.FieldbyName('GODS_SPELL').AsString))>0);
  if not Accept then
  Accept := (pos(fndGODS_ID.Text,DataSet.FieldbyName('BARCODE').AsString)>0);
{  if not Accept then
    begin
      BarcodeInfo.Filtered := false;
      BarcodeInfo.OnFilterRecord := BarcodeFilterRecord;
      fndStr := fndGODS_ID.Text;
      BarcodeInfo.Filtered := true;
      Accept := BarcodeInfo.IsEmpty;
    end; }
  if not Accept then
  Accept := (pos(fndGODS_ID.Text,DataSet.FieldbyName('GODS_NAME').AsString)>0);
end;

function TframeOrderForm.GodsToLocusNo(id: string): boolean;
begin

end;

procedure TframeOrderForm.Setrs(const Value: TZQuery);
begin
  Frs := Value;
end;

procedure TframeOrderForm.Excel1Click(Sender: TObject);
  function Check(Source, Dest: TDataSet; SFieldName,DFieldName: string): Boolean;
  var rs:TZQuery;
      Field:TField;
  begin
    if (SFieldName<>'') and (DFieldName<>'') then
      begin
        Result := False;

        // *******************单位********************
        if DFieldName = 'UNIT_ID' then
          begin
            if Source.FieldByName(SFieldName).AsString = '' then
              Raise Exception.Create('单位不能为空...');
          end;

        // *******************数量********************
        if DFieldName = 'AMOUNT' then
          begin
            if Source.FieldByName(SFieldName).AsString = '' then
              Raise Exception.Create('数量不能为空...')
            else
              begin
                try
                  StrToFloat(Source.FieldByName(SFieldName).AsString);
                except
                  Raise Exception.Create('数据格式错误...');
                end;
              end;
          end;

        // *******************赠品********************
        if DFieldName = 'IS_PRESENT' then
          begin
            if Source.FieldByName(SFieldName).AsString <> '' then
              begin
                rs := Global.GetZQueryFromName('PUB_PARAMS');
                if rs.Locate('CODE_NAME;TYPE_CODE',VarArrayOf([Trim(Source.FieldByName(SFieldName).AsString),'IS_PRESENT']),[]) then
                  Dest.FieldByName('IS_PRESENT').AsInteger := rs.FieldByName('CODE_ID').AsInteger
                else
                  Dest.FieldByName('IS_PRESENT').AsInteger := 0;
              end;
            Result := True;
            Exit;
          end;

        // *******************所属尺码********************
        {if DFieldName = 'PROPERTY_01' then
          begin
            if Source.FieldByName(SFieldName).AsString <> '' then
              begin
                rs := Global.GetZQueryFromName('PUB_SIZE_INFO');
                if rs.Locate('SIZE_NAME',Trim(Source.FieldByName(SFieldName).AsString),[]) then
                  Dest.FieldByName('PROPERTY_01').AsString := rs.FieldByName('SIZE_ID').AsString
                else
                  Raise Exception.Create('没找到"'+Source.FieldByName(SFieldName).AsString+'"对应的尺码代码...');
              end
            else
              Dest.FieldByName('PROPERTY_01').AsString := '#';
            Result := True;
            Exit;
          end;

        // *******************所属颜色********************
        if DFieldName = 'PROPERTY_02' then
          begin
            if Source.FieldByName(SFieldName).AsString <> '' then
              begin
                rs := Global.GetZQueryFromName('PUB_COLOR_INFO');
                if rs.Locate('COLOR_NAME',Trim(Source.FieldByName(SFieldName).AsString),[]) then
                  Dest.FieldByName('PROPERTY_02').AsString := rs.FieldByName('COLOR_ID').AsString
                else
                  Raise Exception.Create('没找到"'+Source.FieldByName(SFieldName).AsString+'"对应的颜色代码...');
              end
            else
              Dest.FieldByName('PROPERTY_02').AsString := '#';
            Result := True;
            Exit;
          end;}
      end
    else
      begin
        if (Dest.FieldByName('GODS_CODE').AsString = '') and (Dest.FieldByName('BARCODE').AsString = '') then
          begin
            // *******************条码********************
            if Dest.FieldByName('BARCODE').AsString = '' then
              Raise Exception.Create('条码不能为空...');
            // *******************货号********************
            if Dest.FieldByName('GODS_CODE').AsString = '' then
              Raise Exception.Create('货号不能为空...');
          end;

        //实入量
        Field := Dest.FindField('FNSH_AMOUNT');
        if (Field <> nil) and (Field.AsString <> '') then
          begin
            try
              StrToFloat(Field.AsString);
            except
              Raise Exception.Create('"实入量"数据格式错误...');
            end;
          end;
        //零售价
        Field := Dest.FindField('ORG_PRICE');
        if (Field <> nil) and (Field.AsString <> '') then
          begin
            try
              StrToFloat(Field.AsString);
            except
              Raise Exception.Create('"零售价"数据格式错误...');
            end;
          end;
        //销售额
        Field := Dest.FindField('RTL_MONEY');
        if (Field <> nil) and (Field.AsString <> '') then
          begin
            try
              StrToFloat(Field.AsString);
            except
              Raise Exception.Create('"销售额"数据格式错误...');
            end;
          end;
        //折扣金(让利金额)
        Field := Dest.FindField('AGIO_MONEY');
        if (Field <> nil) and (Field.AsString <> '') then
          begin
            try
              StrToFloat(Field.AsString);
            except
              Raise Exception.Create('"让利金额"数据格式错误...');
            end;
          end;          
      end;
  end;

  function FindFieldColumn(CdsCol: TDataSet): Boolean;
  begin
    Result := True;
    if not CdsCol.Locate('FieldName','GODS_NAME',[]) then
      begin
        Result := False;
        Raise Exception.Create('缺少"商品名称"字段!');
      end;
    if not CdsCol.Locate('FieldName','GODS_CODE',[]) then
      begin
        Result := False;
        Raise Exception.Create('缺少"货号"字段!');
      end;
    if not CdsCol.Locate('FieldName','BARCODE',[]) then
      begin
        Result := False;
        Raise Exception.Create('缺少"条码"字段!');
      end;
    if not CdsCol.Locate('FieldName','UNIT_ID',[]) then
      begin
        Result := False;
        Raise Exception.Create('缺少"单位"字段!');
      end;
  end;

  function SaveExcel(CdsExcel: TDataSet): Boolean;
  var rs,us,bs,tmp:TZQuery; i: integer;
    RecordObj:TRecord_;
    IsPt:Boolean;
    GID,P1,P2,ErrorInfo,str,RelationFlag:string;
    Field:TField;
  begin
    Result := False;
    rs := Global.GetZQueryFromName('PUB_GOODSINFO');
    us := Global.GetZQueryFromName('PUB_MEAUNITS');
    bs := Global.GetZQueryFromName('PUB_BARCODE');
    tmp := TZQuery.Create(nil);
    RecordObj := TRecord_.Create;
    try
      CdsExcel.First;
      while not CdsExcel.Eof do
        begin
          if (CdsExcel.FieldByName('BARCODE').AsString = '') and (CdsExcel.FieldByName('GODS_CODE').AsString = '') then
            begin
              CdsExcel.Next;
              Continue;
            end;
          //P1 := '#';
          //P2 := '#';
          //tmp.Close;
          //tmp.SQL.Text := 'select * from VIW_BARCODE where BARCODE='''+trim(cdsExcel.FieldByName('BARCODE').AsString)+''' and TENANT_ID='+IntToStr(Global.TENANT_ID);
          //Factor.Open(tmp);
          if bs.Locate('BARCODE',cdsExcel.FieldByName('BARCODE').AsString,[]) then
            begin
              GID := bs.FieldByName('GODS_ID').AsString;
              //P1 := tmp.FieldByName('PROPERTY_01').AsString;
              //P2 := tmp.FieldByName('PROPERTY_02').AsString;
            end
          else
            begin
              if rs.Locate('GODS_CODE',CdsExcel.FieldByName('GODS_CODE').AsString,[]) then
                 GID := rs.FieldByName('GODS_ID').AsString
              else
                 Raise Exception.Create(CdsExcel.FieldByName('GODS_CODE').AsString+'货号没有找到...');
            end;
          if rs.Locate('GODS_ID',GID,[]) then
            begin
              RecordObj.ReadFromDataSet(rs,False);
              if rs.FieldByName('RELATION_ID').AsString = '0' then
                RelationFlag := '2'
              else
                RelationFlag := '1';
              //tmp.Close;
              //tmp.SQL.Text := 'select * from VIW_GOODSPRICEEXT where GODS_CODE='''+GID+''' and TENANT_ID='+IntToStr(Global.TENANT_ID);
              //Factor.Open(tmp);
              //if not tmp.IsEmpty then
              //  begin
              //    GID := tmp.FieldByName('GODS_ID').AsString;
                  //P1 := tmp.FieldByName('SORT_ID7').AsString;
                  //P2 := tmp.FieldByName('SORT_ID8').AsString;

              //    RecordObj.ReadField(tmp);
              //    RecordObj.ReadFromDataSet(tmp,False);
              //  end
              //else
              //  begin
              //   MessageBox(Handle,Pchar(GID+'为无效货品编号'),'提示...',MB_OK+MB_ICONINFORMATION);
              //   cdsExcel.Next;
              //   Continue;
              //  end;
            end
          else
            begin
              Raise Exception.Create(CdsExcel.FieldByName('GODS_CODE').AsString+'货号没有找到...');
              //if not rs.Locate('GODS_CODE',GID,[]) then
              //RecordObj.ReadField(rs);
              //RecordObj.ReadFromDataSet(rs,False);
            end;
          if us.Locate('UNIT_NAME,RELATION_FLAG',VarArrayOf([CdsExcel.FieldByName('UNIT_ID').AsString,RelationFlag]),[]) then
            begin
              if us.FieldByName('UNIT_ID').AsString = RecordObj.FieldByName('CALC_UNITS').AsString then
                RecordObj.FieldByName('UNIT_ID').AsString := RecordObj.FieldByName('CALC_UNITS').AsString
              else if us.FieldByName('UNIT_ID').AsString = RecordObj.FieldByName('SMALL_UNITS').AsString then
                RecordObj.FieldByName('UNIT_ID').AsString := RecordObj.FieldByName('SMALL_UNITS').AsString
              else if us.FieldByName('UNIT_ID').AsString = RecordObj.FieldByName('BIG_UNITS').AsString then
                RecordObj.FieldByName('UNIT_ID').AsString := RecordObj.FieldByName('BIG_UNITS').AsString
              else
                begin
                  if Trim(ErrorInfo) = '' then
                    begin
                      if CdsExcel.FieldByName('BARCODE').AsString <> '' then
                        ErrorInfo := '商品条码为"'+CdsExcel.FieldByName('BARCODE').AsString+'"的单位"'+CdsExcel.FieldByName('UNIT_ID').AsString+'"为非法单位;'+#13#10
                      else
                        ErrorInfo := '商品货号为"'+CdsExcel.FieldByName('GODS_CODE').AsString+'"的单位"'+CdsExcel.FieldByName('UNIT_ID').AsString+'"为非法单位;'+#13#10;
                    end
                  else
                    begin
                      if CdsExcel.FieldByName('BARCODE').AsString <> '' then
                        ErrorInfo := ErrorInfo+'商品条码为"'+CdsExcel.FieldByName('BARCODE').AsString+'"的单位"'+CdsExcel.FieldByName('UNIT_ID').AsString+'"为非法单位;'+#13#10
                      else
                        ErrorInfo := ErrorInfo+'商品货号为"'+CdsExcel.FieldByName('GODS_CODE').AsString+'"的单位"'+CdsExcel.FieldByName('UNIT_ID').AsString+'"为非法单位;'+#13#10;
                    end;
                  Raise Exception.Create(ErrorInfo);
                end;
            end
          else
            begin
              ErrorInfo := '商品条码为"'+CdsExcel.FieldByName('BARCODE').AsString+'"的单位"'+CdsExcel.FieldByName('UNIT_ID').AsString+'"不存在';
              Raise Exception.Create(ErrorInfo);
            end;
          if CdsExcel.FieldByName('IS_PRESENT').AsInteger = 1 then
            IsPt := True
          else
            IsPt := False;
          ExportForm.AddRecord(RecordObj,RecordObj.FieldByName('UNIT_ID').AsString,True,IsPt);

          Field := CdsExcel.FindField('AMOUNT');     //数量
          if (Field <> nil) and (Field.AsString <> '') then
            begin
              ExportForm.edtTable.Edit;
              ExportForm.edtTable.FieldByName('AMOUNT').AsFloat := Field.AsFloat;
              ExportForm.edtTable.Post;
              ExportForm.AmountToCalc(Field.AsFloat);
            end;
          Field := CdsExcel.FindField('APRICE');     //单价
          if (Field <> nil) and (Field.AsString <> '') then
            begin
              ExportForm.edtTable.Edit;
              ExportForm.edtTable.FieldByName('APRICE').AsFloat := Field.AsFloat;
              ExportForm.edtTable.Post;
              ExportForm.PriceToCalc(Field.AsFloat);
            end;
          Field := CdsExcel.FindField('AGIO_RATE');   //折扣率
          if (Field <> nil) and (Field.AsString <> '') then
            begin
              ExportForm.edtTable.Edit;
              ExportForm.edtTable.FieldByName('AGIO_RATE').AsFloat := Field.AsFloat;
              ExportForm.edtTable.Post;
              ExportForm.AgioToCalc(Field.AsFloat);
            end;
          Field := CdsExcel.FindField('IS_PRESENT');   //赠品
          if (Field <> nil) and (Field.AsString <> '') then
            begin
              ExportForm.edtTable.Edit;
              ExportForm.edtTable.FieldByName('IS_PRESENT').AsFloat := Field.AsFloat;
              ExportForm.edtTable.Post;
              ExportForm.PresentToCalc(Field.AsInteger);
            end;


          Field := CdsExcel.FindField('FNSH_AMOUNT'); //实入量
          if (Field <> nil) and (Field.AsString <> '') and (Field.AsString <> '0') then
            begin
              ExportForm.edtTable.Edit;
              ExportForm.edtTable.FieldByName('FNSH_AMOUNT').AsFloat := Field.AsFloat;
              ExportForm.edtTable.Post;
            end;
          Field := CdsExcel.FindField('ORG_PRICE');  //零售价
          if (Field <> nil) and (Field.AsString <> '') and (Field.AsString <> '0') then
            begin
              ExportForm.edtTable.Edit;
              ExportForm.edtTable.FieldByName('ORG_PRICE').AsFloat := Field.AsFloat;
              ExportForm.edtTable.Post;
            end;
          Field := CdsExcel.FindField('RTL_MONEY');  //销售额
          if (Field <> nil) and (Field.AsString <> '') and (Field.AsString <> '0') then
            begin
              ExportForm.edtTable.Edit;
              ExportForm.edtTable.FieldByName('RTL_MONEY').AsFloat := Field.AsFloat;
              ExportForm.edtTable.Post;
            end;
          Field := CdsExcel.FindField('AGIO_MONEY'); //折扣金(让利金额)
          if (Field <> nil) and (Field.AsString <> '') and (Field.AsString <> '0') then
            begin
              ExportForm.edtTable.Edit;
              ExportForm.edtTable.FieldByName('AGIO_MONEY').AsFloat := Field.AsFloat;
              ExportForm.edtTable.Post;
            end;
          Field := CdsExcel.FindField('BATCH_NO');  //批号
          if (Field <> nil) and (Field.AsString <> '') and (Field.AsString <> '0') then
            begin
              ExportForm.edtTable.Edit;
              ExportForm.edtTable.FieldByName('BATCH_NO').AsString := Field.AsString;
              ExportForm.edtTable.Post;
            end;
          Field := CdsExcel.FindField('REMARK');    //备注
          if Field <> nil then
            begin
              ExportForm.edtTable.Edit;
              ExportForm.edtTable.FieldByName('REMARK').AsString := Field.AsString;
              ExportForm.edtTable.Post;
            end;
          CdsExcel.Next;
        end;
    finally
      tmp.Free;
      RecordObj.Free;
    end;
    Result := True;
  end;

var i:Integer;
    rs:TZQuery;
begin
  inherited;
  //if not edtTable.IsEmpty then Exit;
  //2011.09.25 Modif: if not (edtTable.State in [dsEdit,dsInsert])
  if not (dbState in [dsEdit,dsInsert]) then Raise Exception.Create('单据需在新增、修改、录入等状态下,才能使用导入功能！');
  for i := 0 to DBGridEh1.Columns.Count - 1 do
    begin
      if Trim(FieldsString) = '' then
        FieldsString := DBGridEh1.Columns[i].FieldName + '=' + DBGridEh1.Columns[i].Title.Caption
      else
        FieldsString := FieldsString + ',' + DBGridEh1.Columns[i].FieldName + '=' + DBGridEh1.Columns[i].Title.Caption;
      if Trim(FormatString) = '' then
        FormatString := IntToStr(i) + '=' + DBGridEh1.Columns[i].FieldName
      else
        FormatString := FormatString + ',' + IntToStr(i) + '=' + DBGridEh1.Columns[i].FieldName;
    end;
  rs:=TZQuery.Create(nil);
  rs.Data := edtTable.Data;
  rs.EmptyDataSet;
  try
    TfrmExcelFactory.ExcelFactory(rs,FieldsString,@Check,@SaveExcel,@FindFieldColumn,FormatString,1);
  finally
    rs.Free;
  end;
end;

function TframeOrderForm.CheckSumField(FieldName: string): boolean;
var s:string;
begin
  s := uppercase(FieldName);
  result := (s='AMOUNT') or (s='CALC_AMOUNT') or (s='AMONEY') or (s='CALC_MONEY') or (s='AGIO_MONEY') or
            (s='RCK_AMOUNT') or (s='PAL_AMOUNT') or (s='PAL_INAMONEY') or (s='PAL_OUTAMONEY') or (s='SHIP_AMOUNT') or (s='FNSH_AMOUNT');
end;

function TframeOrderForm.GetbasInfo: TDataSet;
begin
  result := FBasInfo;
  if not FBasInfo.Active then BasInfo := Global.GetZQueryFromName('PUB_GOODSINFO');  
end;

procedure TframeOrderForm.BulkToCalc(AMoney: Real);
var AMount,APrice,Agio_Rate,Agio_Money,SourceScale:currency;
    Field:TField;
    rs:TZQuery;
begin
  if Locked then Exit;
  Locked := true;
  try
      if not (edtTable.State in [dsEdit,dsInsert]) then edtTable.Edit;
      Field := edtTable.FindField('AMONEY');
      if Field=nil then Exit;
      Field.AsString := FormatFloat('#0.00',AMoney);
      AMoney := Field.AsFloat;

      Field := edtTable.FindField('APRICE');
      if Field<>nil then
         APrice := Field.AsFloat
      else
         APrice := 1;

      Field := edtTable.FindField('AMOUNT');
      if Field=nil then Exit;
      //取数量
      Field.AsString := formatFloat('#0.00',AMoney/APrice);
      Amount := Field.asFloat;
      rs := Global.GetZQueryFromName('PUB_GOODSINFO');
      if not rs.Locate('GODS_ID',edtTable.FieldByName('GODS_ID').AsString,[]) then Raise Exception.Create('经营商品中没找到“'+edtTable.FieldbyName('GODS_NAME').AsString+'”');  

      if edtTable.FieldByName('UNIT_ID').AsString=rs.FieldByName('CALC_UNITS').AsString then
         begin
          SourceScale := 1;
         end
      else
      if edtTable.FieldByName('UNIT_ID').AsString=rs.FieldByName('BIG_UNITS').AsString then
         begin
          SourceScale := rs.FieldByName('BIGTO_CALC').asFloat;
         end
      else
      if edtTable.FieldByName('UNIT_ID').AsString=rs.FieldByName('SMALL_UNITS').AsString then
         begin
          SourceScale := rs.FieldByName('SMALLTO_CALC').asFloat;
         end
      else
         begin
          SourceScale := 1;
         end;
         
      Field := edtTable.FindField('CALC_AMOUNT');
      if Field<>nil then
         begin
            Field.AsFloat := edtTable.FindField('AMOUNT').AsFloat * SourceScale;
         end;
      

      if edtTable.FindField('ORG_PRICE')=nil then
        begin
          //计算折扣
          Field := edtTable.FindField('AGIO_RATE');
          if Field<>nil then
             Agio_Rate := (Field.AsFloat / 100)
          else
             Agio_Rate := 1;
          //如果=0为不打折
          if Agio_Rate=0 then Agio_Rate := 1;

          Agio_Money := (AMoney/Agio_Rate ) - AMoney;
        end
      else
        begin
          if edtTable.FindField('ORG_PRICE').AsFloat=0 then
             Agio_Money := 0
          else
             Agio_Money := edtTable.FindField('ORG_PRICE').AsFloat*Amount-AMoney;

          //计算折扣
          Field := edtTable.FindField('AGIO_RATE');
          if (Field<>nil) and (AMount<>0) then
             begin
                if edtTable.FindField('ORG_PRICE').AsFloat<>0 then
                   Field.AsString := formatFloat('#0.0',AMoney *100 /(edtTable.FindField('ORG_PRICE').AsFloat*Amount))
                else
                   Field.AsString := '100';
             end;
        end;
      Field := edtTable.FindField('AGIO_MONEY');
      if Field<>nil then
         Field.AsString := FormatFloat('#0.00',Agio_Money);

      Field := edtTable.FindField('CALC_MONEY');
      if Field<>nil then
         Field.AsString := FormatFloat('#0.00',AMoney) ;
      edtTable.Post;
      edtTable.Edit;
  finally
      Locked := false
  end;
end;

procedure TframeOrderForm.FormCreate(Sender: TObject);
var
  i:integer;
  SetCol:TColumnEh;
begin
  inherited;
  //2013.01.16 xhh启用批号管理
  if ShopGlobal.GetParameter('USING_BATCH_NO')<>'1' then
  begin
    SetCol:=FindDBColumn(DBGridEh1,'BATCH_NO');
    if SetCol<>nil then SetCol.Free;
  end;
  //2013.01.16 xhh启用储位管理
  if ShopGlobal.GetParameter('USING_LOCATION')<>'1' then
  begin
    SetCol:=FindDBColumn(DBGridEh1,'LOCATION_ID');
    if SetCol<>nil then SetCol.Free;
  end;
end;

procedure TframeOrderForm.GodsCompareClick(Sender: TObject);
begin
  inherited;
  if GetDetail<>nil then
     TfrmGodsComPare.ShowDialog(self,GetDetail)
  else
     Raise Exception.Create('此模块不支持验货操作');
end;

function TframeOrderForm.GetDetail: TDataSet;
var
  i:integer;
begin
  result := nil;
  for i:=0 to self.ComponentCount-1 do
    begin
      if self.Components[i].Name = 'cdsDetail' then
         begin
           result := TDataSet(Components[i]);
           break;
         end;
    end;
end;

procedure TframeOrderForm.WriteNoAmount(UNIT_ID, PROPERTY_01,
  PROPERTY_02: string; Amt: real; Appended: boolean);
var b:boolean;
begin
  b := PropertyEnabled;
  if (edtTable.FindField('AMOUNT')<>nil) then
  begin
    if not b then
    begin
      edtTable.Edit;
      if Appended then
         edtTable.FieldbyName('AMOUNT').AsFloat := edtTable.FieldbyName('AMOUNT').AsFloat + amt
      else
         edtTable.FieldbyName('AMOUNT').AsFloat := amt;
    end;
  end
  else
    Raise Exception.Create('AMOUNT字段没找到');
  if b then
     begin
       if edtProperty.Locate('SEQNO;PROPERTY_01;PROPERTY_02',VarArrayOf([edtTable.FieldbyName('SEQNO').AsInteger,PROPERTY_01,PROPERTY_02]),[]) then
         begin
           edtProperty.Edit;
           edtTable.Edit;
           if Appended then
              edtTable.FieldbyName('AMOUNT').AsFloat := edtTable.FieldbyName('AMOUNT').AsFloat + amt
           else
              edtTable.FieldbyName('AMOUNT').AsFloat := edtTable.FieldbyName('AMOUNT').AsFloat - edtProperty.FieldbyName('AMOUNT').AsFloat + amt;
         end else
         begin
           edtProperty.Append;
           edtTable.Edit;
           edtTable.FieldbyName('AMOUNT').AsFloat := edtTable.FieldbyName('AMOUNT').AsFloat + amt
         end;
       edtProperty.FieldByName('SEQNO').AsInteger := edtTable.FieldbyName('SEQNO').AsInteger;
       edtProperty.FieldByName('GODS_ID').AsString := edtTable.FieldbyName('GODS_ID').AsString;
       edtProperty.FieldByName('BOM_ID').AsString := edtTable.FieldbyName('BOM_ID').AsString;
       edtProperty.FieldByName('BATCH_NO').AsString := edtTable.FieldbyName('BATCH_NO').AsString;
       edtProperty.FieldByName('IS_PRESENT').AsString := edtTable.FieldbyName('IS_PRESENT').AsString;
       edtProperty.FieldByName('LOCUS_NO').AsString := edtTable.FieldbyName('LOCUS_NO').AsString;
       edtProperty.FieldByName('UNIT_ID').AsString := UNIT_ID;
       edtProperty.FieldByName('PROPERTY_01').AsString := PROPERTY_01;
       edtProperty.FieldByName('PROPERTY_02').AsString := PROPERTY_02;
       if Appended then
          edtProperty.FieldbyName('AMOUNT').AsFloat := edtProperty.FieldbyName('AMOUNT').AsFloat + amt
       else
          edtProperty.FieldbyName('AMOUNT').AsFloat := amt;
       edtProperty.Post;
     end;
  AMountToCalc(edtTable.FieldbyName('AMOUNT').AsFloat);
  edtTable.Post;
end;

procedure TframeOrderForm.fndBATCH_NOEnter(Sender: TObject);
begin
  inherited;
  fndBATCH_NO.Properties.ReadOnly := DBGridEh1.ReadOnly;

end;

procedure TframeOrderForm.fndBATCH_NOExit(Sender: TObject);
begin
  inherited;
  if not fndBATCH_NO.DropListed then fndBATCH_NO.Visible := false;

end;

procedure TframeOrderForm.fndBATCH_NOKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key=VK_RIGHT) then
     begin
       DBGridEh1.SetFocus;
       fndBATCH_NO.Visible := false;
       FocusNextColumn;
     end;
  if (Key=VK_LEFT) then
     begin
       DBGridEh1.SetFocus;
       fndBATCH_NO.Visible := false;
       DBGridEh1.Col := DBGridEh1.Col -1;
     end;
  if (Key=VK_UP) and (Shift=[]) and not fndBATCH_NO.DropListed then
     begin
       DBGridEh1.SetFocus;
       fndBATCH_NO.Visible := false;
       PostMessage(Handle,WM_PRIOR_RECORD,0,0);
     end;
  if (Key=VK_DOWN) and (Shift=[]) and not fndBATCH_NO.DropListed then
     begin
       DBGridEh1.SetFocus;
       fndBATCH_NO.Visible := false;
       PostMessage(Handle,WM_NEXT_RECORD,0,0);
     end;
end;

procedure TframeOrderForm.fndBATCH_NOKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key=#13 then
     begin
       Key := #0;
       DBGridEh1.SetFocus;
       FocusNextColumn;
     end;

end;

procedure TframeOrderForm.fndBATCH_NOSaveValue(Sender: TObject);
begin
  inherited;
  if not fndBATCH_NO.Visible then Exit;
  if edtTable.FieldbyName('GODS_ID').AsString='' then Exit;
  edtTable.Edit;
  if fndBATCH_NO.AsString='' then
     edtTable.FieldByName('BATCH_NO').AsString := '#'
  else
     edtTable.FieldByName('BATCH_NO').AsString := fndBATCH_NO.AsString;

end;

procedure TframeOrderForm.fndBATCH_NOClearValue(Sender: TObject);
begin
  inherited;
  edtTable.Edit;
  edtTable.FieldByName('BATCH_NO').AsString := '#';
  fndBATCH_NO.Text := '#';
  fndBATCH_NO.KeyValue := '#';
end;

procedure TframeOrderForm.BatchNoDropList;
begin
  if GBATCH_NO<>edtTable.FieldbyName('GODS_ID').asString then
  begin
    cdsBatchNo.Close;
    cdsBatchNo.SQL.Text := 'select * from (select distinct BATCH_NO from STO_STORAGE where TENANT_ID=:TENANT_ID and GODS_ID=:GODS_ID and AMOUNT<>0) j order by BATCH_NO';
    cdsBatchNo.ParambyName('TENANT_ID').asInteger := Global.TENANT_ID;
    cdsBatchNo.ParambyName('GODS_ID').asString := edtTable.FieldbyName('GODS_ID').asString;
    Factor.Open(cdsBatchNo);
    GBATCH_NO := edtTable.FieldbyName('GODS_ID').asString;
  end;
  fndBATCH_NO.Text := edtTable.FieldbyName('BATCH_NO').AsString;
  fndBATCH_NO.KeyValue := edtTable.FieldbyName('BATCH_NO').AsString;
  fndBATCH_NO.SaveStatus;
end;

procedure TframeOrderForm.fndLOCATION_IDClearValue(Sender: TObject);
var
  rs:TZQuery;
begin
  inherited;
  rs := Global.GetZQueryFromName('CA_SHOP_INFO');
  edtTable.Edit;
  if rs.Locate('SHOP_ID',GetShopId,[]) then
     edtTable.FieldByName('LOCATION_ID').AsString := rs.FieldbyName('DEF_LOCATION_ID').AsString;
  if edtTable.FieldByName('LOCATION_ID').AsString='' then
     edtTable.FieldByName('LOCATION_ID').AsString := GetShopId+'00000000000000000000000';
  fndBATCH_NO.KeyValue := edtTable.FieldByName('LOCATION_ID').AsString;

  rs := Global.GetZQueryFromName('PUB_LOCATION_INFO');
  if rs.Locate('LOCATION_ID',edtTable.FieldByName('LOCATION_ID').AsString,[]) then
  fndBATCH_NO.Text := edtTable.FieldByName('LOCATION_NAME').AsString else
  fndBATCH_NO.Text := '默认储位';
end;

function TframeOrderForm.GetShopId: string;
begin
  result := '';
end;

procedure TframeOrderForm.fndLOCATION_IDEnter(Sender: TObject);
begin
  inherited;
  fndLOCATION_ID.Properties.ReadOnly := DBGridEh1.ReadOnly;

end;

procedure TframeOrderForm.fndLOCATION_IDExit(Sender: TObject);
begin
  inherited;
  if not fndLOCATION_ID.DropListed then fndLOCATION_ID.Visible := false;

end;

procedure TframeOrderForm.fndLOCATION_IDKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key=VK_RIGHT) then
     begin
       DBGridEh1.SetFocus;
       fndLOCATION_ID.Visible := false;
       FocusNextColumn;
     end;
  if (Key=VK_LEFT) then
     begin
       DBGridEh1.SetFocus;
       fndLOCATION_ID.Visible := false;
       DBGridEh1.Col := DBGridEh1.Col -1;
     end;
  if (Key=VK_UP) and (Shift=[]) and not fndLOCATION_ID.DropListed then
     begin
       DBGridEh1.SetFocus;
       fndLOCATION_ID.Visible := false;
       PostMessage(Handle,WM_PRIOR_RECORD,0,0);
     end;
  if (Key=VK_DOWN) and (Shift=[]) and not fndLOCATION_ID.DropListed then
     begin
       DBGridEh1.SetFocus;
       fndLOCATION_ID.Visible := false;
       PostMessage(Handle,WM_NEXT_RECORD,0,0);
     end;

end;

procedure TframeOrderForm.fndLOCATION_IDKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key=#13 then
     begin
       Key := #0;
       DBGridEh1.SetFocus;
       FocusNextColumn;
     end;

end;

procedure TframeOrderForm.DBGridEh1LocationIdBeforeShowControl(
  Sender: TObject);
begin
  LocationIdDropList;
end;

procedure TframeOrderForm.LocationIdDropList;
var
  rs:TZQuery;
begin
  rs := Global.GetZQueryFromName('PUB_LOCATION_INFO');
  if GLOCATION_ID<>GetShopId then
  begin
    cdsLocationInfo.Close;
    cdsLocationInfo.SQL.Text := 'select LOCATION_ID,LOCATION_NAME,LOCATION_SPELL from PUB_LOCATION_INFO where TENANT_ID=:TENANT_ID and SHOP_ID=:SHOP_ID order by LOCATION_ID';
    cdsLocationInfo.ParambyName('TENANT_ID').asInteger := Global.TENANT_ID;
    cdsLocationInfo.ParambyName('SHOP_ID').asString := GetShopId;
    Factor.Open(cdsLocationInfo);
    GBATCH_NO := GetShopId;
  end;
  fndLOCATION_ID.KeyValue := edtTable.FieldbyName('LOCATION_ID').AsString;
  if rs.Locate('LOCATION_ID',fndLOCATION_ID.AsString,[]) then
    fndLOCATION_ID.Text :=  rs.FieldbyName('LOCATION_NAME').AsString
  else
    fndLOCATION_ID.Text :=  edtTable.FieldbyName('LOCATION_ID').AsString;
  fndLOCATION_ID.SaveStatus;
end;

function TframeOrderForm.GetDefLocation: string;
var
  rs:TZQuery;
begin
  inherited;
  rs := Global.GetZQueryFromName('CA_SHOP_INFO');
  if rs.Locate('SHOP_ID',GetShopId,[]) then
     result := rs.FieldbyName('DEF_LOCATION_ID').AsString;
  if result='' then
     result := GetShopId+'00000000000000000000000';
end;

end.

