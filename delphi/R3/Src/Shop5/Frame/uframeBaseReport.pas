
unit uframeBaseReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uframeToolForm, ActnList, Menus, ToolWin, ComCtrls, StdCtrls,
  RzLabel, RzTabs, ExtCtrls, RzPanel, RzButton, DB, RzBckgnd, CheckLst,
  RzLstBox, RzChkLst, RzCmboBx, Mask, RzEdit, Grids, DBGridEh, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, PrnDbgeh,
  DBGridEhImpExp,inifiles, jpeg, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, zrComboBoxList, ZBase, cxCalendar,zrMonthEdit,cxButtonEdit,
  cxRadioGroup, Buttons;

type
  TCalcFooter=class
  private
    FSecValue: string;
    FFirValue: string;
    FGridName: string;
    procedure SetFirValue(const Value: string);
    procedure SetGridName(const Value: string);
    procedure SetSecValue(const Value: string);
  public
    function CalcValue(CalcKind: integer): string; {==计算方式1:表示计算%Rate==}
    property GridName: string read FGridName write SetGridName;  {==计算的Grid=}
    property FirValue: string read FFirValue write SetFirValue;  {==第一个值==}
    property SecValue: string read FSecValue write SetSecValue;  {==第二个值==}
  end;
  
type                        
  TframeBaseReport = class(TframeToolForm)
    dsadoReport1: TDataSource;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    actFilter: TAction;
    actExport: TAction;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    actColumnVisible: TAction;
    ToolButton10: TToolButton;
    Panel4: TPanel;
    SaveDialog1: TSaveDialog;
    w1: TRzPanel;
    RzPanel7: TRzPanel;
    DBGridEh1: TDBGridEh;
    PanelColumnS: TPanel;
    Panel2: TPanel;
    Image5: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Panel5: TPanel;
    rzShowColumns: TRzCheckList;
    RzPanel1: TRzPanel;
    actPrior: TAction;
    ToolButton2: TToolButton;
    Label27: TLabel;
    actFindNext: TAction;
    adoReport1: TZQuery;
    PrintDBGridEh1: TPrintDBGridEh;
    procedure ActCloseExecute(Sender: TObject);
    procedure actColumnVisibleExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actPreviewExecute(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumnEh;  State: TGridDrawState);
    procedure rzShowColumnsChange(Sender: TObject; Index: Integer; NewState: TCheckBoxState);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure actExportExecute(Sender: TObject);
    procedure RzPageChange(Sender: TObject);
    procedure actPriorExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Excelxls1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormResize(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    RsRecvType:TZQuery; //应收账款类型
    RsAbleType:TZQuery; //应付账款类型
    FSumRecord:TRecord_;  //汇总记录值
    FAllRecord:TRecord_;  //汇总记录值
    procedure Dofnd_CUST_TYPEChange(Sender: TObject);   //客户群体OnChange
    procedure Dofnd_SHOP_TYPEChange(Sender: TObject);   //门店管理群组OnChange
    procedure Dofnd_TYPE_IDChange(Sender: TObject);     //商品统计指标OnChange
    procedure DoRBDate(Sender: TObject);   //暂时没用
    procedure DoCxDateOnCloseUp(Sender: TObject); //暂时没用
    function  GetHasChild: Boolean;
    function  GetGodsStateValue(DefineState: string='11111111111111111111'): string; //返回商品指标的启用情况
    function  GetUsedGodsMulti:Boolean; //是否启用多选
    function  CreateAndOpenTable(TabIdx:integer):Boolean; //创建并Open数据集
  public
    CalcFooter: TCalcFooter;
    PUB_CLIENT_ID: TZQuery;  //客户群体数据集
    PUB_KPI_ID: TZQuery;  //客户群体数据集

    constructor Create(AOwner: TComponent); override;
    function  GetDBGridEh: TDBGridEh;virtual;

    //得到市
    //返回字符的右侧子串
    function  RightStr(Str: string; vlen: integer): string;
    //返回指定控件名中数序号如: ('fndP3_D1','fndP'); 返回: 3;
    function  GetCmpNum(CmpName,BegName: string): string;

    {=======  2011.03.02 Add 双击TDBGridEh显示明细数据[复制查询条件值] =======}
    procedure Copy_ParamsValue(SrcList,DestList: TzrComboBoxList); overload;      //复制值TzrComboBoxList
    procedure Copy_ParamsValue(vType: string; SrcIdx,DestIdx: integer); overload; //复制门店管理群组:SHOP_TYPE;商品指标:TYPE_ID
    {=======  2012.09.25 Add 商品Gods_ID显示值  =======}
    procedure SetGodsIDValue(Fnd_Gods_ID:TzrComboBoxList;GodsID:string);

    {=======  2011.03.02 Add TDBGridEh =======}
    //添加Grid的列Column.KeyList,PickList;
    procedure AddDBGridEhColumnItems(Grid: TDBGridEh; rs: TDataSet; ColName,KeyID,ListName: string);
    //添加商品指标的ItemsList[SetFlag对应位数，1..20位，若为1表添加，若为0表不添加]
    procedure AddGoodSortTypeItems(GoodSortList: TcxComboBox; SetFlag: string='01111100000000000000');
    //动态设置商品指标的ItemsList: ItemsIdx对应商品表字段：SORT_IDX1..8
    procedure AddGoodSortTypeItemsList(Sender: TObject; SortTypeList: TzrComboBoxList);
    //添加统计单位Items
    procedure AddTongjiUnitList(TJUnit: TcxComboBox);
    //添加销售类型ItemsList: ItemsIdx: 对应：PUB_PARAMS.TYPE_CODE='TYPE_CODE'; AddAll:是否添加“全部”
    procedure AddCBxItemsList(SetCbx: TcxComboBox; TYPE_CODE: string; AddAll: Boolean=False);overload;
    //添加:PUB_CODE_INFO: ItemsIdx: 对应：PUB_CODE_INFO.CODE_TYPE='TYPE_CODE'; AddAll:是否添加“全部”
    procedure AddCBxItemsList(SetCbx: TcxComboBox; ItemsQry: TZQuery; AddAll: Boolean=False);overload;
    //返回年度选择，指定数据集添加
    procedure CopyItemsList(SrcCbx,DistCbx: TcxComboBox);

    //选择商品类别[带供应链] 返回名称[类别名称]
    function SelectGoodSortType(var SortID:string; var SortRelID: string; var SortName: string):Boolean;
    //不同数据库类型转换：输入字段名称，返回转化后表达式:
    function IntToVarchar(FieldName: string): string;
    //设置Page分页显示:（IsGroupReport是否分组[区域、门店]）
    procedure SetRzPageActivePage(IsGroupReport: Boolean=true);virtual; //

    {=======  2011.03.03 Add 商品统计单位换算关系   =======}
    //参数: CalcIdx: 0:默认(管理)单位; 1:计量单位;  2:小包装单位; 3:大包装单位;
    //参数: AliasTabName: 传入表的别名;  AliasFileName: 传入字段别名;
    function GetUnitID(CalcIdx: Integer;AliasTabName: string; AliasFileName: string=''): string; //返回统计单位UNIT_ID
    function GetUnitTO_CALC(CalcIdx: Integer;AliasTabName: string; AliasFileName: string=''): string; //返回统计单位换算关系
    //根据统计条件关联查询数据（参数以上的返回字段）
    function GetUnitIDCnd(CalcIdx: integer; AliasTabName: string): string;
    //根据输入PageNo作为控件的No进行搜索报表表头条件
    function AddReportReport(TitleList: TStringList; PageNo: string): string;virtual; //添加Title
    //参数说明:TitlStr标题的TitleList;  Cols排列列数 SplitCount 两列之间间隔空字符
    function FormatReportHead(TitleList: TStringList; Cols: integer): string;virtual;
    //判断最大结帐日期[传入]
    function  CheckAccDate(BegDate, EndDate: integer;ShopID: string=''):integer; //返回台帐表最大结帐日期
    procedure Do_REPORT_FLAGOnChange(Sender: TObject; Grid: TDBGridEh);
    procedure Do_REPORT_FLAGFooterSum(Sender: TObject; RsGrid: TDataSet; AryFields: Array of string); //2011.05.22 Add 计算分类汇总的FooterSum
    procedure LoadFormat;override;
    procedure PrintBefore;virtual;
    function  GetRowType:integer;virtual;
    //2011.04.22 Add 控制是否有查看成本价权限
    procedure SetNotShowCostPrice(SetGrid: TDBGridEh; AryFields: Array of String);
    procedure RefreshColumn; virtual;
    function  FindColumn(DBGrid:TDBGridEh;FieldName:string):TColumnEh;
    procedure CreateColumn(FieldName,TitleName:string;Index:Integer;ValueType:TFooterValueType=fvtNon;vWidth:Integer=70);
    procedure ClearSortMark;
    //2011.06.30 Am Add 导出Excel前表头
    function  DoBeforeExport: boolean; override;
    procedure SingleReportParams(ParameStr: string='');virtual; //简单报表调用参数
    //添加报表分组类型: RptType
    procedure AddReportTypeList(RptType: TcxComboBox);
    procedure DoGodsGroupBySort(DataSet: TZQuery; SORT_IDX,SORT_ID, SORT_NAME,OrderByField: string; SumFields,CalcFields: Array of String); //分组报表
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure GridGetFooterParamsValue(Sender: TObject; var Text: String);  //设置汇总列计算
    procedure DBGridTitleClick(GridDataSet: TZQuery; Column: TColumnEh); overload; //点列标题排序
    procedure DBGridTitleClick(GridDataSet: TZQuery; Column: TColumnEh; SetSORT_ID: string); overload;//点列标题排序
    function  GetRelation_ID(Relation_ID: string): string; //供应链排序
    function  GetGodsSTAT_ID(fndP_TYPE_ID: TcxComboBox): string;  //返回指标: CODE_ID

    //2011.09.21 Add 金额的格式方式:
    procedure SetGridColumnDisplayFormat(AryMnyFormat: Array of string);
    //2012.01.07 Add 取指标的数据
    procedure DoCreateKPIDataSet(IDX_TYPE_IDS: string='');
    //计算GridFooter.Value:
    procedure DoCalcGridFooterRate(SetGird: TDBGridEh; CalcCol: TColumnEh; FirCol,SecCol: string);
    //动态保存列
    procedure LoadGridColumnFormat(DBGridEh: TDBGridEh; vHeadName: string);virtual;
    procedure SaveGridColumnFormat(DBGridEh: TDBGridEh; vHeadName: string);virtual;
    //返回当前企业的经营商品所属企业:
    function GetGodsOwnerTenIds(CxFieldName: string; vType: integer=0): string;
    //2012.09.02创建DBGrid的Col列
    function CreateGridColForFIG(var SetGrid:TDBGridEh;const BegIdx:integer):Boolean; //服装版 创建颜色、尺码
    //2012.09.23返回商品条件
    function GetGodsIdsCnd(GodsIds,FieldName:string;CndStr:string='and'):string; //不包括and

    property USED_GODS_MULTI:Boolean read GetUsedGodsMulti;
    property HasChild: Boolean read GetHasChild;    //判断是否多门店
    property DBGridEh: TDBGridEh read GetDBGridEh;  //当前DBGridEh
    property SumRecord: TRecord_ read FSumRecord;  //汇总记录值
    property AllRecord: TRecord_ read FAllRecord;  //汇总记录值
  end;

implementation

uses
  uGlobal,uShopGlobal,uShopUtil,ufrmEhLibReport,uCtrlUtil,
  ufrmSelectGoodSort;

{$R *.dfm}

{ TCalcFooter }

function TCalcFooter.CalcValue(CalcKind: integer): string;
var
  CurValue: Real;  //当前值
  vFirValue: Real;
  vSecValue: Real;
begin
  case CalcKind of
   1://计算Rate:
    begin
      vFirValue:=StrToFloatDef(FirValue,0.00);
      vSecValue:=StrToFloatDef(SecValue,0.00);
      if vFirValue<>0 then
      begin
        CurValue:=Round((vSecValue/vFirValue)*10000)/100;
        result:=FloatToStr(CurValue)+'%';
      end else
        result:='0.00%';
    end;
   2: //计算价格:
    begin
              
    end;
  end;
end;

procedure TCalcFooter.SetFirValue(const Value: string);
begin
  FFirValue := Value;
end;

procedure TCalcFooter.SetGridName(const Value: string);
begin
  FGridName := Value;
end;

procedure TCalcFooter.SetSecValue(const Value: string);
begin
  if trim(FSecValue)<>trim(Value) then
  begin
    FFirValue:='';
    FSecValue:='';
  end;
  FSecValue := Value;
end;

procedure TframeBaseReport.ActCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TframeBaseReport.actColumnVisibleExecute(Sender: TObject);
begin
  inherited;
  PanelColumnS.Visible := Not PanelColumnS.Visible;
  if PanelColumnS.Visible then rzShowColumns.SetFocus;
end;

procedure TframeBaseReport.actPrintExecute(Sender: TObject);
begin
  if DBGridEh = nil then Exit;
  PrintBefore;
  PrintDBGridEh1.PageHeader.CenterText.Text:=Global.TENANT_NAME+trim(PrintDBGridEh1.PageHeader.CenterText.Text);
  DBGridEh.DataSource.DataSet.Filtered := false;
  PrintDBGridEh1.DBGridEh := DBGridEh;
  PrintDBGridEh1.Print;
end;

procedure TframeBaseReport.actPreviewExecute(Sender: TObject);
begin
  if DBGridEh = nil then Exit;
  PrintBefore;
  PrintDBGridEh1.PageHeader.CenterText.Text:=Global.TENANT_NAME+trim(PrintDBGridEh1.PageHeader.CenterText.Text);
  DBGridEh.DataSource.DataSet.Filtered := false;
  PrintDBGridEh1.DBGridEh := DBGridEh;
  with TfrmEhLibReport.Create(self) do
    begin
      try
        Preview(PrintDBGridEh1);
      finally
        free;
      end;
    end;
end;

procedure TframeBaseReport.PrintBefore;
begin

end;

procedure TframeBaseReport.LoadFormat;
begin
  inherited LoadFormat;
  RefreshColumn;
end;

procedure TframeBaseReport.RefreshColumn;
var i,n:Integer;
begin
  inherited;
  if DBGridEh=nil then Exit;
  rzShowColumns.Tag := 1;
  try
  rzShowColumns.Items.Clear;
  for i:=0 to DBGridEh.Columns.Count -1 do
    begin
      n := rzShowColumns.Items.AddObject(DBGridEh.Columns[i].Title.Caption,DBGridEh.Columns[i]);
      if DBGridEh.Columns[i].Visible then
         rzShowColumns.ItemState[n] := cbChecked
      else
         rzShowColumns.ItemState[n] := cbUnchecked;
      rzShowColumns.ItemEnabled[n] := (i>DBGridEh.FrozenCols-1);
    end;
  finally
    rzShowColumns.Tag := 0;
  end;
end;

procedure TframeBaseReport.CreateColumn(FieldName, TitleName: string;
  Index: Integer; ValueType: TFooterValueType; vWidth: Integer);
var
  Column:TColumnEh;
begin
  Column := DBGridEh.Columns.Add;
  Column.FieldName := FieldName;
  Column.Title.Caption := TitleName;
  Column.Width := 70;
  Column.Footer.ValueType := ValueType;
  Column.ReadOnly := true;
  if Index>=0 then Column.Index := Index;
end;

procedure TframeBaseReport.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
var ARect:TRect;
begin
  if TDBGridEh(Sender).DataSource.DataSet=nil then Exit;
  if not TDBGridEh(Sender).DataSource.DataSet.Active then Exit;

  if (Rect.Top = Column.Grid.CellRect(Column.Grid.Col, Column.Grid.Row).Top) and
     (not (gdFocused in State) or not Column.Grid.Focused) then
  begin
    Column.Grid.Canvas.Brush.Color := clAqua;   //选中颜色状态
  end;
  Column.Grid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  if Column.FieldName = 'SEQNO' then
  begin
    ARect := Rect;
    Column.Grid.canvas.FillRect(ARect);
    DrawText(Column.Grid.Canvas.Handle,pchar(Inttostr(Column.Grid.DataSource.DataSet.RecNo)),length(Inttostr(Column.Grid.DataSource.DataSet.RecNo)),ARect,DT_NOCLIP or DT_SINGLELINE or DT_CENTER or DT_VCENTER);
  end;
end;

procedure TframeBaseReport.ClearSortMark;
var i:integer;
begin
  DBGridEh.DataSource.DataSet.DisableControls;
  try
    for i:=0 to DBGridEh.Columns.Count -1 do
      DBGridEh.Columns[i].Title.SortMarker := smNoneEh;
  finally
    DBGridEh.DataSource.DataSet.EnableControls;
  end;
end;

procedure TframeBaseReport.rzShowColumnsChange(Sender: TObject;
  Index: Integer; NewState: TCheckBoxState);
begin
  inherited;
  if rzShowColumns.Tag = 1 then Exit;
  try
    if rzShowColumns.Items[Index]='' then Exit;
    TColumnEh(rzShowColumns.Items.Objects[Index]).Visible := (NewState = cbChecked);
    SaveFormat;
  except
  end;
end;

procedure TframeBaseReport.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if Column.FieldName = 'SEQNO' then
     Background := Column.Grid.FixedColor
  else
  case GetRowType of
  0:Background := clWhite;
  1:begin
     Background := $00D4D4D4;
     AFont.Style := [fsBold];
    end;
  2:Background := clBtnFace;
  3:begin
      Background := $00A5A5A5;
      AFont.Style := [fsBold];
    end;
  end;
end;

procedure TframeBaseReport.actExportExecute(Sender: TObject);
var Stream: TMemoryStream;
begin
  inherited;
  if DBGridEh=nil then Exit;
  if DBGridEh.DataSource=nil then Exit;
  if DBGridEh.DataSource.DataSet=nil then Exit;
  if not DBGridEh.DataSource.DataSet.Active then Exit;
  SaveDialog1.DefaultExt := '*.xls';
  SaveDialog1.Filter := 'Excel文档(*.xls)|*.xls|HTML文档(*.html)|*.html';
  if SaveDialog1.Execute then
  begin
    if FileExists(SaveDialog1.FileName) then
    begin
      if MessageBox(Handle, Pchar(SaveDialog1.FileName + '已经存在，是否覆盖它？'), Pchar(Application.Title), MB_YESNO + MB_ICONQUESTION) <> 6 then
        exit;
      DeleteFile(SaveDialog1.FileName);
    end;
    //导出Excel数据
    DoBeforeExport;
    Stream := TMemoryStream.Create;
    try
      Stream.Position := 0;
      if ExtractFileExt(SaveDialog1.FileName)='.xls' then
      begin
        with TDBGridEhExportAsXLS.Create do
        begin
          try
            DBGridEh := self.DBGridEh;
            ExportToStream(Stream, True);
          finally
            Free;
          end;
        end;
      end
      else
      begin
        with TDBGridEhExportAsHTML.Create do
        begin
          try
            DBGridEh := self.DBGridEh;
            ExportToStream(Stream, True);
          finally
            Free;
          end;
        end;
      end;
      Stream.SaveToFile(SaveDialog1.FileName);
    finally
      Stream.Free;
    end;
  end;
end;

function TframeBaseReport.GetDBGridEh: TDBGridEh;
var i:integer;
begin
  result := nil;
  for i:=0 to ComponentCount-1 do
    begin
      if Components[i].Name = 'DBGridEh'+inttostr(rzPage.ActivePageIndex+1) then
         begin
           result := TDBGridEh(Components[i]);
           break;
         end;
    end;
end;

procedure TframeBaseReport.RzPageChange(Sender: TObject);
begin
  inherited;
  RefreshColumn;
  LoadFormat;
end;

function TframeBaseReport.GetRowType: integer;
begin
  result := 0;
end;

procedure TframeBaseReport.actPriorExecute(Sender: TObject);
var i,MaxCount: integer;
begin
  inherited;
  MaxCount:=rzPage.ActivePageIndex;
  for i:=0 to MaxCount do
  begin
    if rzPage.ActivePageIndex=0 then Exit;
    if rzPage.Pages[MaxCount-1].TabVisible then
    begin
      rzPage.ActivePageIndex := MaxCount - 1;
      break;
    end;
  end;
end;

procedure TframeBaseReport.FormCreate(Sender: TObject);
var
  i,j:integer;
  F:TIniFile;
  CmpName,FName,vName,DefState: string;
  Cbx: TcxComboBox;
  Column:TColumnEh;
  Grid: TDBGridEh;
  SetCbx: TcxComboBox;
  SetQry: TZQuery;
begin
  inherited;
  //汇总记录值
  FSumRecord:=TRecord_.Create;
  FAllRecord:=TRecord_.Create;  //汇总记录值

  //初始化参数:
  for i:=0 to self.ComponentCount -1 do
  begin
    //初始化Cbx下拉选择Items
    if (Components[i] is TcxComboBox) then
    begin
      Cbx:=TcxComboBox(Components[i]);
      CmpName:=trim(UpperCase(Cbx.Name));
      FName:=copy(CmpName,1,4);
      if FName='FNDP' then
      begin
        if RightStr(CmpName,8)='_UNIT_ID' then    //统计单位
        begin
          AddTongjiUnitList(Cbx);
          Cbx.Properties.DropDownListStyle:=lsFixedList;
        end else
        if RightStr(CmpName,12)='_REPORT_FLAG' then  //统计类型
        begin
          DefState:=GetGodsStateValue;
          AddGoodSortTypeItems(Cbx,DefState);
          Cbx.ItemIndex:=0;
        end else
        if RightStr(CmpName,10)='_SHOP_TYPE' then //管理群组
        begin
          Cbx.Properties.OnChange:=Dofnd_SHOP_TYPEChange;
          Cbx.ItemIndex:=0;
          Cbx.Properties.DropDownListStyle:=lsFixedList;
        end else
        if RightStr(CmpName,10)='_CUST_TYPE' then //客户群体
        begin
          Cbx.Properties.OnChange:=Dofnd_CUST_TYPEChange;
          Cbx.ItemIndex:=0;
        end else
        if RightStr(CmpName,8)='_TYPE_ID' then //商品指标
        begin                          
          DefState:=GetGodsStateValue('11111111111111111111');
          AddGoodSortTypeItems(Cbx,DefState);
          Cbx.Properties.OnChange:=Dofnd_TYPE_IDChange;
          Cbx.ItemIndex:=0;
          Cbx.Properties.DropDownListStyle:=lsFixedList;
        end;
        if RightStr(CmpName,8)='_RPTTYPE' then //商品指标
        begin
          AddReportTypeList(Cbx);
          Cbx.ItemIndex:=0;
        end;
        if RightStr(CmpName,11)='_SALES_TYPE' then //销售类型
        begin
          AddCBxItemsList(Cbx,'IS_PRESENT',true);
          Cbx.ItemIndex:=0;
        end;
        if RightStr(CmpName,12)='_SALES_STYLE' then //销售类型
        begin
          SetQry:=Global.GetZQueryFromName('PUB_SALE_STYLE'); 
          AddCBxItemsList(Cbx,SetQry,true);
          Cbx.ItemIndex:=0;
        end;
      end;
    end;

    //设置TzrComboBoxList属性:
    if Components[i] is TzrComboBoxList then
    begin
      CmpName:=trim(UpperCase(TzrComboBoxList(Components[i]).Name));
      TzrComboBoxList(Components[i]).ShowButton:=true;
      TzrComboBoxList(Components[i]).Buttons:=[zbClear];
      //门店名称
      if (Copy(CmpName,1,4)='FNDP') and (RightStr(CmpName,8)='_SHOP_ID') then
      begin
        TzrComboBoxList(Components[i]).ShowButton:=true;
        TzrComboBoxList(Components[i]).Buttons:=[zbClear];
        if TzrComboBoxList(Components[i]).DropWidth< TzrComboBoxList(Components[i]).Width then
          TzrComboBoxList(Components[i]).DropWidth:=TzrComboBoxList(Components[i]).Width+20;
        TzrComboBoxList(Components[i]).DataSet:=Global.GetZQueryFromName('CA_SHOP_INFO');
      end;
      //部门名称
      if (Copy(CmpName,1,4)='FNDP') and (RightStr(CmpName,8)='_DEPT_ID') then
      begin
        TzrComboBoxList(Components[i]).ShowButton:=true;
        TzrComboBoxList(Components[i]).Buttons:=[zbClear];
        if TzrComboBoxList(Components[i]).DropWidth<TzrComboBoxList(Components[i]).Width then
          TzrComboBoxList(Components[i]).DropWidth:=TzrComboBoxList(Components[i]).Width+20;
        TzrComboBoxList(Components[i]).DataSet:=Global.GetZQueryFromName('CA_DEPT_INFO');
      end;
      //商品统计指标
      if (Copy(CmpName,1,4)='FNDP') and (RightStr(CmpName,11)='_SHOP_VALUE') then
      begin
        TzrComboBoxList(Components[i]).ShowButton:=true;
        TzrComboBoxList(Components[i]).Buttons:=[zbClear];
        if TzrComboBoxList(Components[i]).DropWidth< TzrComboBoxList(Components[i]).Width then
          TzrComboBoxList(Components[i]).DropWidth:=TzrComboBoxList(Components[i]).Width+20;
      end;
      if (Copy(CmpName,1,4)='FNDP') and (RightStr(CmpName,7)='_KPI_ID') then //考核指标
      begin
        TzrComboBoxList(Components[i]).ShowButton:=true;
        TzrComboBoxList(Components[i]).Buttons:=[zbClear];
        if TzrComboBoxList(Components[i]).DropWidth< TzrComboBoxList(Components[i]).Width then
          TzrComboBoxList(Components[i]).DropWidth:=TzrComboBoxList(Components[i]).Width+20;
        TzrComboBoxList(Components[i]).DataSet:=PUB_KPI_ID;
      end else
      //客户群体
      if (Copy(CmpName,1,4)='FNDP') and (RightStr(CmpName,11)='_CUST_VALUE') then
      begin
        TzrComboBoxList(Components[i]).ShowButton:=true;
        TzrComboBoxList(Components[i]).Buttons:=[zbClear];
        if TzrComboBoxList(Components[i]).DropWidth<TzrComboBoxList(Components[i]).Width then
          TzrComboBoxList(Components[i]).DropWidth:=TzrComboBoxList(Components[i]).Width+20;        
      end;
      //商品名称
      if (Copy(CmpName,1,4)='FNDP') and (RightStr(CmpName,8)='_GODS_ID') then
      begin
        TzrComboBoxList(Components[i]).ShowButton:=true;
        TzrComboBoxList(Components[i]).Buttons:=[zbClear];
        if TzrComboBoxList(Components[i]).DropWidth< TzrComboBoxList(Components[i]).Width then
          TzrComboBoxList(Components[i]).DropWidth:=TzrComboBoxList(Components[i]).Width+20;
        TzrComboBoxList(Components[i]).DataSet:=Global.GetZQueryFromName('PUB_GOODSINFO');
        if USED_GODS_MULTI then //多选
        begin
          TzrComboBoxList(Components[i]).MultiSelect:=true;
          TzrComboBoxList(Components[i]).SelectField:='A';
          Column:=TzrComboBoxList(Components[i]).Columns.Add;
          Column.FieldName:='A';                 
          Column.Title.Caption:='选择';
          Column.Checkboxes:=true;
          Column.ReadOnly:=False;
          Column.Index:=0;
          Column.Width:=44;
          Column.KeyList.Add('1');
          Column.KeyList.Add('0');
          Column.PickList.Add('0');
          Column.PickList.Add('1');
        end;
      end;
      //制单人
      if (Copy(CmpName,1,4)='FNDP') and (RightStr(CmpName,8)='_USER_ID') then
      begin
        TzrComboBoxList(Components[i]).ShowButton:=true;
        TzrComboBoxList(Components[i]).Buttons:=[zbClear];
        if TzrComboBoxList(Components[i]).DropWidth<TzrComboBoxList(Components[i]).Width then
          TzrComboBoxList(Components[i]).DropWidth:=TzrComboBoxList(Components[i]).Width+20;        
        TzrComboBoxList(Components[i]).DataSet:=Global.GetZQueryFromName('CA_USERS');
      end;
      //制单人
      if (Copy(CmpName,1,4)='FNDP') and (RightStr(CmpName,11)='_GUIDE_USER') then
      begin
        TzrComboBoxList(Components[i]).ShowButton:=true;
        TzrComboBoxList(Components[i]).Buttons:=[zbClear];
        if TzrComboBoxList(Components[i]).DropWidth<TzrComboBoxList(Components[i]).Width then
          TzrComboBoxList(Components[i]).DropWidth:=TzrComboBoxList(Components[i]).Width+20;
        TzrComboBoxList(Components[i]).DataSet:=Global.GetZQueryFromName('CA_USERS');
      end;
      //应收账款类型
      if (Copy(CmpName,1,4)='FNDP') and (RightStr(CmpName,10)='_RECV_TYPE') then
      begin
        if not Assigned(RsRecvType) then CreateAndOpenTable(1);
        TzrComboBoxList(Components[i]).ShowButton:=true;
        TzrComboBoxList(Components[i]).Buttons:=[zbClear];
        if TzrComboBoxList(Components[i]).DropWidth<TzrComboBoxList(Components[i]).Width then
          TzrComboBoxList(Components[i]).DropWidth:=TzrComboBoxList(Components[i]).Width+20;
        TzrComboBoxList(Components[i]).DataSet:=RsRecvType;
      end;
      //应付账款类型
      if (Copy(CmpName,1,4)='FNDP') and (RightStr(CmpName,10)='_ABLE_TYPE') then
      begin
        if not Assigned(RsAbleType) then CreateAndOpenTable(2);
        TzrComboBoxList(Components[i]).ShowButton:=true;
        TzrComboBoxList(Components[i]).Buttons:=[zbClear];
        if TzrComboBoxList(Components[i]).DropWidth<TzrComboBoxList(Components[i]).Width then
          TzrComboBoxList(Components[i]).DropWidth:=TzrComboBoxList(Components[i]).Width+20;
        TzrComboBoxList(Components[i]).DataSet:=RsAbleType;
      end;
    end;

    //设置颜色组、尺码组列是否显示
    if Components[i] is TDBGridEh then
    begin
      Column := FindColumn(TDBGridEh(Components[i]),'PROPERTY_01');
      if (Column<>nil) and (ShopGlobal.GetVersionFlag<>1) then
         Column.Free;
      Column := FindColumn(TDBGridEh(Components[i]),'PROPERTY_02');
      if (Column<>nil) and (ShopGlobal.GetVersionFlag<>1) then
         Column.Free;
      //DBGridEh设置为多表头
      if not TDBGridEh(Components[i]).UseMultiTitle then
        TDBGridEh(Components[i]).UseMultiTitle:=true;

      {
      Grid:=TDBGridEh(Components[i]);
      F := TIniFile.Create(ExtractFilePath(Application.ExeName)+'GridColumn.ini');
      //输出列：
      try
        for j:=0 to Grid.Columns.Count-1 do
        begin
          if trim(Grid.Columns[j].DisplayFormat)<>'' then
          begin
            F.WriteString(self.Name,Grid.Name+Grid.Columns[j].Title.Caption,''''+Grid.Name+'.'+Grid.Columns[j].FieldName+''',');
          end;
        end;
      finally
        F.Free;
      end;
      }
    end;
  end;
  if Width <= 1024 then PanelColumnS.Visible := false;
  RzPageChange(nil);
end;

procedure TframeBaseReport.Excelxls1Click(Sender: TObject);
begin
  inherited;
  actExportExecute(nil);
end;

procedure TframeBaseReport.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
//  if (Key=#13) and (DBGridEh<>nil) then
//     begin
//       if Assigned(DBGridEh.OnDblClick) then
//          DBGridEh.OnDblClick(DBGridEh);
//     end;
end;

procedure TframeBaseReport.FormResize(Sender: TObject);
begin
  inherited;
  if Width <= 800 then PanelColumnS.Visible := false;
end;

constructor TframeBaseReport.Create(AOwner: TComponent);
begin
  inherited;
  LoadFormRes(self);
end;

function TframeBaseReport.FindColumn(DBGrid: TDBGridEh;
  FieldName: string): TColumnEh;
var i:integer;
begin
  result := nil;
  for i:=0 to DBGrid.Columns.Count - 1 do
    begin
      if DBGrid.Columns[i].FieldName = FieldName then
         begin
           result := DBGrid.Columns[i];
           Exit;
         end;
    end;
end;

procedure TframeBaseReport.actFilterExecute(Sender: TObject);
begin
  inherited;
  //
end;

//宽度: 80个字节 最后一列不加格式，尽量靠右对齐
function TframeBaseReport.FormatReportHead(TitleList: TStringList; Cols: integer): string;
var
  spaceStr,str1: string;
  i,j: integer;
begin
  //中间间隔4个空格:
  result:='';
  for i:=0 to TitleList.Count-1 do
  begin
    if i mod Cols=0 then
    begin
      j:=i;
      if j<=TitleList.Count-1 then str1:=trim(TitleList.Strings[j]);    //1
      inc(j);
      if j<=TitleList.Count-1 then str1:=str1+trim(TitleList.Strings[j]); //2
      inc(j);
      if j<=TitleList.Count-1 then str1:=str1+trim(TitleList.Strings[j]); //3
      inc(j);
      if j<=TitleList.Count-1 then str1:=str1+trim(TitleList.Strings[j]); //4
      case length(str1) of
        1.. 50:  spaceStr:='                         ';
        51..60:  spaceStr:='                  ';
        61..75:  spaceStr:='            ';
        76..90:  spaceStr:='      ';
        else     spaceStr:=' ';
      end;
    end;
    if result='' then result:=trim(TitleList.Strings[i])
    else
    begin
      if (i mod Cols=0) and (i>=Cols) then
        result:=result+#13+trim(TitleList.Strings[i])
      else
        result:=result+spaceStr+trim(TitleList.Strings[i]);
    end;
  end;
end;

procedure TframeBaseReport.AddGoodSortTypeItemsList(Sender: TObject; SortTypeList: TzrComboBoxList);
var
  CodeID: string;
  ItemsIdx: integer;
  Cbx: TcxComboBox;
begin
  if (Sender is TcxComboBox) and (TcxComboBox(Sender).ItemIndex<>-1) then
  begin
    Cbx:=TcxComboBox(Sender);
    CodeID:=trim(TRecord_(Cbx.Properties.Items.Objects[Cbx.ItemIndex]).fieldbyName('CODE_ID').AsString);
    ItemsIdx:=StrtoIntDef(CodeID,0);
  end;
  if ItemsIdx<=0 then Exit;
  //清除上次选项
  SortTypeList.Text:='';
  SortTypeList.KeyValue:='';
  case ItemsIdx of
   3:
    begin
      SortTypeList.KeyField:='CLIENT_ID';
      SortTypeList.ListField:='CLIENT_NAME';
      SortTypeList.FilterFields:='CLIENT_ID;CLIENT_NAME;CLIENT_SPELL';
    end;
   else
    begin
      SortTypeList.KeyField:='SORT_ID';
      SortTypeList.ListField:='SORT_NAME';
      SortTypeList.FilterFields:='SORT_ID;SORT_NAME;SORT_SPELL';
    end;
  end;
  SortTypeList.Columns[0].FieldName:=SortTypeList.ListField;
  if SortTypeList.Columns.Count>1 then
    SortTypeList.Columns[1].FieldName:=SortTypeList.KeyField;
  case ItemsIdx of
   3: //主供应商;
    begin
      SortTypeList.RangeField:='';
      SortTypeList.RangeValue:='';
      SortTypeList.DataSet:=Global.GetZQueryFromName('PUB_CLIENTINFO');
    end;
   else
    begin
      SortTypeList.DataSet:=Global.GetZQueryFromName('PUB_GOODS_INDEXS');
      SortTypeList.RangeField:='SORT_TYPE';
      SortTypeList.RangeValue:=InttoStr(ItemsIdx);
    end;
  end;
end;


//添加商品指标的ItemsList[SetFlag对应位数，1..8位，若为1表添加，若为0表不添加]
procedure TframeBaseReport.AddGoodSortTypeItems(GoodSortList: TcxComboBox; SetFlag: string);
 procedure AddItems(Cbx: TcxComboBox; Rs: TZQuery; CodeID: string);
 var CurObj: TRecord_;
 begin
   if (not Rs.Active) or (Rs.IsEmpty) then Exit;
   Rs.First;
   while not Rs.Eof do
   begin
     if trim(Rs.FieldByName('CODE_ID').AsString)=trim(CodeID) then
     begin
       CurObj:=TRecord_.Create;
       CurObj.ReadFromDataSet(Rs);
       Cbx.Properties.Items.AddObject(CurObj.fieldbyName('CODE_NAME').AsString,CurObj);
       break;
     end;
     Rs.Next;
   end;
 end;
var
  Rs: TZQuery;
  i,InValue: integer;
begin
  try
    Rs:=Global.GetZQueryFromName('PUB_STAT_INFO');
    {Rs.Filtered:=False;
    Rs.Filter:=' TYPE_CODE=''SORT_TYPE'' ';
    Rs.Filtered:=true;}
    ClearCbxPickList(GoodSortList);  //清除节点及Object对象
    for i:=1 to length(SetFlag) do
    begin
      InValue:=StrtoIntDef(SetFlag[i],0);
      if InValue=1 then
        AddItems(GoodSortList, Rs, inttostr(i));
    end;
  finally
    Rs.Filtered:=False;
    Rs.Filter:='';
  end;
end;

procedure TframeBaseReport.AddDBGridEhColumnItems(Grid: TDBGridEh; rs: TDataSet; ColName,KeyID,ListName: string);
var SetCol: TColumnEh;
begin
  if (not rs.Active) or (rs.IsEmpty) then Exit;
  SetCol:=FindColumn(Grid,trim(ColName));
  if SetCol<>nil then
  begin
    SetCol.KeyList.Clear;
    SetCol.PickList.Clear;
    rs.First;
    while not rs.Eof do
    begin
      SetCol.KeyList.Add(rs.FieldbyName(KeyID).AsString);
      SetCol.PickList.Add(rs.FieldbyName(ListName).AsString);
      rs.Next;
    end;
  end;
end;

{===返回GoodInfo的统计[CalUNIT_ID][TabName表名，AliasFileName 字段别名]===}
function TframeBaseReport.GetUnitID(CalcIdx: Integer; AliasTabName, AliasFileName: string): string;
var
  AliasTab: string;
begin
  AliasTab:='';
  if trim(AliasTabName)<>'' then AliasTab:=AliasTabName+'.';
  case CalcIdx of
   0: result:='(case when '+AliasTab+'UNIT_ID is null then '+AliasTab+'CALC_UNITS else '+AliasTab+'UNIT_ID end) ';  //若[默认单位]为空则 取 [计量单位]
   1: result:=' '+AliasTab+'CALC_UNITS ';   //[计量单位]  不能为空
   2: result:='(case when '+AliasTab+'SMALL_UNITS is null then '+AliasTab+'CALC_UNITS else '+AliasTab+'SMALL_UNITS end) ';  //小包装单位
   3: result:='(case when '+AliasTab+'BIG_UNITS is null then '+AliasTab+'CALC_UNITS else '+AliasTab+'BIG_UNITS end) ';      //大包装单位
  end;
  if AliasFileName<>'' then
    result:=result+' as '+AliasFileName+' ';
end;

{===返回GoodInfo的统计换算关系[CalUNIT_ID][TabName表名，AliasFileName 字段别名]===}
function TframeBaseReport.GetUnitTO_CALC(CalcIdx: Integer; AliasTabName, AliasFileName: string): string;
var
  str,AliasTab,SmallCalc,BigCalc: string;
begin
  AliasTab:='';
  if trim(AliasTabName)<>'' then AliasTab:=AliasTabName+'.';
  SmallCalc:='case when isnull('+AliasTab+'SMALLTO_CALC,0)=0 then 1.000 else cast('+AliasTab+'SMALLTO_CALC*1.000 as decimal(18,3)) end';
  BigCalc  :='case when isnull('+AliasTab+'BIGTO_CALC,0)=0 then 1.000 else cast('+AliasTab+'BIGTO_CALC*1.000 as decimal(18,3)) end';

  str:=' case when '+AliasTab+'UNIT_ID='+AliasTab+'CALC_UNITS then 1.0 '+            //默认单位为 计量单位
            ' when '+AliasTab+'UNIT_ID='+AliasTab+'SMALL_UNITS then cast('+AliasTab+'SMALLTO_CALC*1.000 as decimal(18,3)) '+  //默认单位为 小单位
            ' when '+AliasTab+'UNIT_ID='+AliasTab+'BIG_UNITS then cast('+AliasTab+'BIGTO_CALC*1.000 as decimal(18,3)) '+      //默认单位为 大单位
            ' else 1.0 end ';

  case CalcIdx of 
   0: result:=' '+str+' ';       //默认单位
   1: result:=' 1.0 ';   //计量单位
   2: result:=' '+SmallCalc+' '; //小包装单位
   3: result:=' '+BigCalc+' ';   //大包装单位
  end;
  if AliasFileName<>'' then
    result:=result+' as '+AliasFileName+' ';
end;

function TframeBaseReport.GetUnitIDCnd(CalcIdx: integer;AliasTabName: string): string;
var
  AliasTab: string;
begin
  result:='';
  AliasTab:='';
  if trim(AliasTabName)<>'' then AliasTab:=AliasTabName+'.';
  case CalcIdx of
   0: result:='((case when isnull('+AliasTab+'UNIT_ID,'''')='''' then '+AliasTab+'CALC_UNITS else '+AliasTab+'UNIT_ID end)='+AliasTab+'BARCODE_UNIT_ID) ';  //若[默认单位]为空则 取 [计量单位]
   1: result:='('+AliasTab+'CALC_UNITS='+AliasTab+'.BARCODE_UNIT_ID) ';   //[计量单位]  不能为空
   2: result:='((case when isnull('+AliasTab+'SMALL_UNITS,'''')='''' then '+AliasTab+'CALC_UNITS else '+AliasTab+'SMALL_UNITS end)='+AliasTab+'BARCODE_UNIT_ID) ';  //小包装单位
   3: result:='((case when isnull('+AliasTab+'BIG_UNITS,'''')='''' then '+AliasTab+'CALC_UNITS else '+AliasTab+'BIG_UNITS end)='+AliasTab+'BARCODE_UNIT_ID) ';      //大包装单位
  end;
end;      

//添加统计单位Items
procedure TframeBaseReport.AddTongjiUnitList(TJUnit: TcxComboBox);
begin
  //按顺序添加[统计时取索引也是按此顺序]
  TJUnit.Properties.Items.Clear;
  TJUnit.Properties.Items.Add('默认单位');   
  TJUnit.Properties.Items.Add('计量单位');
  TJUnit.Properties.Items.Add('包装1');
  TJUnit.Properties.Items.Add('包装2');
  TJUnit.ItemIndex:=0;
end;

//添加销售类型ItemsList: ItemsIdx: 对应：PUB_PARAMS.TYPE_CODE='TYPE_CODE'; AddAll:是否添加“全部”
procedure TframeBaseReport.AddCBxItemsList(SetCbx: TcxComboBox; TYPE_CODE: string; AddAll: Boolean);
var
  Rs: TZQuery;
  CurObj: TRecord_;
begin
  ClearCbxPickList(SetCbx);
  Rs:=Global.GetZQueryFromName('PUB_PARAMS');
  try
    Rs.Filtered:=False;
    Rs.Filter:='TYPE_CODE='''+TYPE_CODE+''' ';
    Rs.Filtered:=true;
    if AddAll then  //添加全部
    begin
      CurObj:=TRecord_.Create;
      CurObj.ReadField(Rs);
      SetCbx.Properties.Items.AddObject('全部',CurObj);
    end;
    Rs.First;
    while not Rs.Eof do
    begin
      CurObj:=TRecord_.Create;
      CurObj.ReadFromDataSet(Rs);
      SetCbx.Properties.Items.AddObject(CurObj.fieldbyName('CODE_NAME').AsString,CurObj);
      Rs.Next;
    end;
  finally
    Rs.Filtered:=False;
    Rs.Filter:='';
  end;
end;

//添加:PUB_CODE_INFO: ItemsIdx: 对应：PUB_CODE_INFO.CODE_TYPE='TYPE_CODE'; AddAll:是否添加“全部”
procedure TframeBaseReport.AddCBxItemsList(SetCbx: TcxComboBox; ItemsQry: TZQuery; AddAll: Boolean=False);
var
  CurObj: TRecord_;
begin
  if ItemsQry.IsEmpty then Exit;
  ClearCbxPickList(SetCbx);
  if AddAll then  //添加全部
  begin
    CurObj:=TRecord_.Create;
    CurObj.ReadField(ItemsQry);
    SetCbx.Properties.Items.AddObject('全部',CurObj);
  end;
  ItemsQry.First;
  while not ItemsQry.Eof do
  begin
    CurObj:=TRecord_.Create;
    CurObj.ReadFromDataSet(ItemsQry);
    SetCbx.Properties.Items.AddObject(CurObj.fieldbyName('CODE_NAME').AsString,CurObj);
    ItemsQry.Next;
  end;
end;

function TframeBaseReport.SelectGoodSortType(var SortID:string; var SortRelID: string; var SortName: string):Boolean;
var
  rs:TRecord_;
begin
  result:=False;
  rs := TRecord_.Create;
  try
    if TfrmSelectGoodSort.FindDialog(self,rs) then
    begin
      SortID := rs.FieldbyName('LEVEL_ID').AsString;
      SortRelID := rs.FieldbyName('RELATION_ID').AsString;
      SortName := rs.FieldbyName('SORT_NAME').AsString;
      result:=true;
    end;
  finally
    rs.Free;
  end;
end;


function TframeBaseReport.RightStr(Str: string; vlen: integer): string;
var aLen: integer; 
begin
  aLen:=Length(Str);
  if aLen>vlen then
    result:=Copy(Str,alen-vlen+1,vlen)
  else
    result:=Str;   
end;

function TframeBaseReport.GetCmpNum(CmpName, BegName: string): string;
var i,PosIdx: integer; ReStr: string;
begin
  result:='';
  ReStr:='';
  PosIdx:=Pos(BegName,CmpName);
  if PosIdx=1 then //在第一位置
  begin
    for i:=PosIdx+length(BegName) to 100 do
    begin
      if CmpName[i] in ['0'..'9'] then 
        ReStr:=ReStr+CmpName[i]
      else
        break;
    end;
    result:=ReStr;    
  end;
end;

procedure TframeBaseReport.Dofnd_CUST_TYPEChange(Sender: TObject);
var
  i: integer;
  CmpName: string;
  FindCmp: TComponent;
  CustValueList: TzrComboBoxList;
begin
  if not assigned(PUB_CLIENT_ID) then
  begin
    PUB_CLIENT_ID:=TZQuery.Create(self);
    PUB_CLIENT_ID.Close;
    PUB_CLIENT_ID.SQL.Text:='select 0 as SEQ_NO,DEFINE as CODE_ID,VALUE as CODE_NAME from SYS_DEFINE where 1=2 ';
    Factor.Open(PUB_CLIENT_ID);
    PUB_CLIENT_ID.IndexFieldNames:='SEQ_NO';
    //添加：全部
    PUB_CLIENT_ID.Edit;
    PUB_CLIENT_ID.FieldByName('SEQ_NO').AsString:='1';
    PUB_CLIENT_ID.FieldByName('CODE_ID').AsString:='1';
    PUB_CLIENT_ID.FieldByName('CODE_NAME').AsString:='全部';
    PUB_CLIENT_ID.Post;
    //添加：企业客户
    PUB_CLIENT_ID.Append;
    PUB_CLIENT_ID.FieldByName('SEQ_NO').AsString:='2';
    PUB_CLIENT_ID.FieldByName('CODE_ID').AsString:='0';
    PUB_CLIENT_ID.FieldByName('CODE_NAME').AsString:='企业客户';
    PUB_CLIENT_ID.Post;
    //添加：会员
    PUB_CLIENT_ID.Append;
    PUB_CLIENT_ID.FieldByName('SEQ_NO').AsString:='3';
    PUB_CLIENT_ID.FieldByName('CODE_ID').AsString:='2';
    PUB_CLIENT_ID.FieldByName('CODE_NAME').AsString:='会员';
    PUB_CLIENT_ID.Post;
  end;

  CmpName:=GetCmpNum(TcxComboBox(Sender).Name,'fndP'); //返回控件Num
  if CmpName<>'' then
  begin
    CmpName:='fndP'+CmpName+'_CUST_VALUE';
    FindCmp:=self.FindComponent(CmpName);
    if (FindCmp<>nil) and (FindCmp is TzrComboBoxList) then
    begin
      CustValueList:=TzrComboBoxList(FindCmp);
      case TcxComboBox(Sender).ItemIndex of
       0:
        begin
          CustValueList.DataSet:=Global.GetZQueryFromName('PUB_REGION_INFO'); //行政区域 和客户分类
          CustValueList.KeyField:='CODE_ID';
          CustValueList.ListField:='CODE_NAME';
          CustValueList.FilterFields:='CODE_ID;CODE_NAME;CODE_SPELL';
          CustValueList.DropWidth:=170;
          CustValueList.DropHeight:=180;
        end;
       1:
        begin
          CustValueList.DataSet:=Global.GetZQueryFromName('PUB_PRICEGRADE');  //客户等级
          CustValueList.KeyField:='PRICE_ID';
          CustValueList.ListField:='PRICE_NAME';
          CustValueList.FilterFields:='PRICE_ID;PRICE_NAME;PRICE_SPELL';
          CustValueList.DropWidth:=CustValueList.Width+15;
          CustValueList.DropHeight:=120;
        end;
        2:
        begin
          CustValueList.DataSet:=Global.GetZQueryFromName('PUB_CLIENTSORT'); //行政区域 和客户分类
          CustValueList.KeyField:='CODE_ID';
          CustValueList.ListField:='CODE_NAME';
          CustValueList.FilterFields:='CODE_ID;CODE_NAME;CODE_SPELL';
          CustValueList.DropWidth:=150;
          CustValueList.DropHeight:=154;
        end;
        3:
        begin
          CustValueList.DataSet:=PUB_CLIENT_ID; //行政区域 和客户分类
          CustValueList.KeyField:='CODE_ID';
          CustValueList.ListField:='CODE_NAME';
          CustValueList.FilterFields:='CODE_ID;CODE_NAME';
          CustValueList.DropWidth:=CustValueList.Width+15;
          CustValueList.DropHeight:=120;
        end;
      end;
      CustValueList.Columns[0].FieldName:=CustValueList.ListField;
      if CustValueList.Columns.Count>1 then
      begin
        CustValueList.Columns[1].FieldName:=CustValueList.KeyField;
        CustValueList.Columns[1].Visible:=not((TcxComboBox(Sender).ItemIndex=1) or (TcxComboBox(Sender).ItemIndex=3));
      end;
      CustValueList.KeyValue:=null;
      CustValueList.Text:='';
    end;
  end;
end;

procedure TframeBaseReport.Dofnd_SHOP_TYPEChange(Sender: TObject);
var
  CmpName: string;
  FindCmp: TComponent;
begin
  CmpName:=GetCmpNum(TcxComboBox(Sender).Name,'fndP'); //返回控件Num
  if CmpName<>'' then
  begin
    CmpName:='fndP'+CmpName+'_SHOP_VALUE';
    FindCmp:=self.FindComponent(CmpName);
    if (FindCmp<>nil) and (FindCmp is TzrComboBoxList) then
    begin
      case TcxComboBox(Sender).ItemIndex of
       0: TzrComboBoxList(FindCmp).DataSet:=Global.GetZQueryFromName('PUB_REGION_INFO');
       1: TzrComboBoxList(FindCmp).DataSet:=Global.GetZQueryFromName('PUB_SHOP_TYPE');
      end;
      TzrComboBoxList(FindCmp).KeyValue:=null;
      TzrComboBoxList(FindCmp).Text:='';
    end;
  end;
end;

procedure TframeBaseReport.Dofnd_TYPE_IDChange(Sender: TObject);
  function FindGodsSortType(CmpName:string):TcxButtonEdit;
  var FindCmp:TComponent;
  begin
    result:=nil;
    FindCmp:=self.FindComponent(CmpName);
    if (FindCmp<>nil) and (FindCmp is TcxButtonEdit) then
      result:=TcxButtonEdit(FindCmp);
  end;
  function FindGodsStateList(CmpName:string):TzrComboBoxList;
  var FindCmp:TComponent;
  begin
    result:=nil;
    FindCmp:=self.FindComponent(CmpName);
    if (FindCmp<>nil) and (FindCmp is TzrComboBoxList) then
      result:=TzrComboBoxList(FindCmp);
  end;
var
  CmpName:string;
  CurObj:TRecord_;
  GodsSort:TcxButtonEdit;
  GodsStat:TzrComboBoxList;
begin
  CmpName:=GetCmpNum(TcxComboBox(Sender).Name,'fndP'); //返回控件Num
  if CmpName<>'' then
  begin
    GodsSort:=FindGodsSortType('fndP'+CmpName+'_SORT_ID');  //查找商品分类
    GodsStat:=FindGodsStateList('fndP'+CmpName+'_STAT_ID'); //查找指标控件
    if (GodsSort=nil) or (GodsStat=nil) then Exit;
    if TcxComboBox(Sender).ItemIndex=-1 then Exit;
    CurObj:=TRecord_(TcxComboBox(Sender).Properties.Items.Objects[TcxComboBox(Sender).ItemIndex]);
    if (CurObj<>nil)and(Trim(CurObj.FieldByName('CODE_ID').AsString)='1') then //商品分类
    begin
      GodsSort.Visible:=true;
      GodsStat.Visible:=False;
    end else
    begin
      GodsSort.Visible:=False;
      GodsStat.Visible:=True;
      AddGoodSortTypeItemsList(Sender,GodsStat);
    end;
  end;
end;

procedure TframeBaseReport.Copy_ParamsValue(SrcList, DestList: TzrComboBoxList);
begin
  if (SrcList<>nil) and (DestList<>nil) then
  begin
    DestList.KeyValue:=SrcList.KeyValue;
    DestList.Text:=SrcList.Text;
  end;
end;

//复制门店管理群组:SHOP_TYPE;  商品指标:TYPE_ID
procedure TframeBaseReport.Copy_ParamsValue(vType: string; SrcIdx,DestIdx: integer);
var
  SrcCmp,DestCmp: TComponent;
begin
  if vType='SHOP_TYPE' then
  begin
    //先复制群组类型
    SrcCmp:=FindComponent('fndP'+InttoStr(SrcIdx)+'_SHOP_TYPE');
    DestCmp:=FindComponent('fndP'+InttoStr(DestIdx)+'_SHOP_TYPE');
    if (SrcCmp<>nil) and (DestCmp<>nil) and (SrcCmp is TcxComboBox) and (DestCmp is TcxComboBox) then
    begin
      TcxComboBox(DestCmp).ItemIndex:=TcxComboBox(SrcCmp).ItemIndex;
    end;
    //复制群组选项值
    SrcCmp:=FindComponent('fndP'+InttoStr(SrcIdx)+'_SHOP_VALUE');
    DestCmp:=FindComponent('fndP'+InttoStr(DestIdx)+'_SHOP_VALUE');
    if (SrcCmp<>nil) and (DestCmp<>nil) and (SrcCmp is TzrComboBoxList) and (DestCmp is TzrComboBoxList) then
    begin
      TzrComboBoxList(DestCmp).KeyValue:=TzrComboBoxList(SrcCmp).KeyValue;
      TzrComboBoxList(DestCmp).Text:=TzrComboBoxList(SrcCmp).Text;
    end;
  end else
  if vType='TYPE_ID' then
  begin
    //先复制群组类型
    SrcCmp:=FindComponent('fndP'+InttoStr(SrcIdx)+'_TYPE_ID');
    DestCmp:=FindComponent('fndP'+InttoStr(DestIdx)+'_TYPE_ID');
    if (SrcCmp<>nil) and (DestCmp<>nil) and (SrcCmp is TcxComboBox) and (DestCmp is TcxComboBox) then
    begin
      TcxComboBox(DestCmp).ItemIndex:=TcxComboBox(SrcCmp).ItemIndex;
    end;
    //复制群组选项值
    SrcCmp:=FindComponent('fndP'+InttoStr(SrcIdx)+'_STAT_ID');
    DestCmp:=FindComponent('fndP'+InttoStr(DestIdx)+'_STAT_ID');
    if (SrcCmp<>nil) and (DestCmp<>nil) and (SrcCmp is TzrComboBoxList) and (DestCmp is TzrComboBoxList) then
    begin
      TzrComboBoxList(DestCmp).KeyValue:=TzrComboBoxList(SrcCmp).KeyValue;
      TzrComboBoxList(DestCmp).Text:=TzrComboBoxList(SrcCmp).Text;
    end;
  end;
end;

procedure TframeBaseReport.SetGodsIDValue(Fnd_Gods_ID: TzrComboBoxList; GodsID: string);
var
  GodsTab:TZQuery;
begin
  if not Assigned(Fnd_Gods_ID) then  Exit;
  GodsTab:=Global.GetZQueryFromName('PUB_GOODSINFO');
  if (GodsTab<>nil)and(not GodsTab.IsEmpty) then
  begin
    if GodsTab.Locate('GODS_ID',GodsID,[]) then
    begin
      Fnd_Gods_ID.KeyValue:=GodsID;
      Fnd_Gods_ID.Text:=GodsTab.FieldByName('GODS_NAME').AsString;
    end;    
  end;
end;

function TframeBaseReport.CheckAccDate(BegDate, EndDate: integer; ShopID: string): integer;
var
  str: string;
  rs:TZQuery;
begin
  rs := TZQuery.Create(nil);
  try
    str:='select max(CREA_DATE) as CREA_DATE from RCK_DAYS_CLOSE where TENANT_ID=:TENANT_ID ';
    if trim(ShopID)<>'' then str:=str+' and SHOP_ID=:SHOP_ID '; //过滤门店ID
    str:=str+' and CREA_DATE>=:CREA_DATE ';
    rs.SQL.Text :=str;
    rs.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
    if rs.Params.FindParam('SHOP_ID')<>nil then rs.ParamByName('SHOP_ID').AsString:= ShopID;
    if rs.Params.FindParam('CREA_DATE')<>nil then rs.ParamByName('CREA_DATE').AsInteger :=BegDate;
    Factor.Open(rs);
    if trim(rs.Fields[0].AsString)='' then
      result := BegDate-1
    else
      result := rs.Fields[0].AsInteger;
  finally
    rs.Free;
  end;
end;

procedure TframeBaseReport.Do_REPORT_FLAGOnChange(Sender: TObject; Grid: TDBGridEh);
var
  i: integer;
  Aobj: TRecord_;
  SetCol: TColumnEh;
  SetType: TFooterValueType; //汇总数据类型
begin
  if (Sender is TcxComboBox) and (TcxComboBox(Sender).ItemIndex<>-1) then
  begin
    Aobj:=TRecord_(TcxComboBox(Sender).Properties.Items.Objects[TcxComboBox(Sender).ItemIndex]);
    {
    SetCol:=FindColumn(Grid,'SORT_ID');
    if (Aobj<>nil) and (SetCol<>nil) then
    begin
      SetCol.Title.Caption:=Aobj.fieldbyName('CODE_NAME').AsString+'代码';
      SetCol.Width:=90;
      end;
    end;
    }
    //分类名称
    SetCol:=FindColumn(Grid,'SORT_NAME');
    if (Aobj<>nil) and (SetCol<>nil) then
    begin
      SetCol.Title.Caption:=Aobj.fieldbyName('CODE_NAME').AsString+'名称';
      SetCol.Width:=220;
    end;
  end;
end;

//2011.05.22 Add 计算分类汇总的FooterSum
procedure TframeBaseReport.Do_REPORT_FLAGFooterSum(Sender: TObject; RsGrid: TDataSet; AryFields: array of string);
var
  i: integer;
  FName: string;
begin
  if (Sender is TcxComboBox) and (TcxComboBox(Sender).ItemIndex<>-1) then
  begin
    if TRecord_(TcxComboBox(Sender).Properties.Items.Objects[TcxComboBox(Sender).ItemIndex]).FieldByName('CODE_ID').AsInteger<>1 then //分类[手工汇总]
      FSumRecord.Clear
    else
    begin
      FSumRecord.Clear;
      FSumRecord.ReadField(RsGrid);
      RsGrid.DisableControls;
      try
        RsGrid.First;
        while not RsGrid.Eof do
        begin
          if length(RsGrid.FieldByName('LEVEL_ID').AsString)=7 then
          begin
            for i:=Low(AryFields) to High(AryFields) do
            begin
              FName:=trim(AryFields[i]);
              FSumRecord.FieldByName(FName).AsFloat:=FSumRecord.FieldByName(FName).AsFloat+RsGrid.FieldByName(FName).AsFloat;
            end;
          end;
          RsGrid.Next;
        end;
        rsGrid.First;
      finally
        rsGrid.EnableControls;
      end;
    end;
  end;
end;

procedure TframeBaseReport.DoRBDate(Sender: TObject);
var
  CmpName: string;
  FindCmp: TComponent;
  CurRB: TcxRadioButton;
begin
  CurRB:=TcxRadioButton(Sender);
  if not CurRB.Checked then Exit;
  CmpName:=GetCmpNum(CurRB.Name,'fndP'); //返回控件Num
  if CmpName<>'' then
  begin
    CmpName:='P'+CmpName+'_D1';
    FindCmp:=FindComponent(CmpName);
    if (FindCmp<>nil) and (FindCmp is TcxDateEdit) then
    begin
      CmpName:=LowerCase(TcxRadioButton(Sender).Name);
      if pos('week',CmpName)>0 then
        TcxDateEdit(FindCmp).Date:=Date()-7
      else if pos('month',CmpName)>0 then
        TcxDateEdit(FindCmp).Date:=Date()-30
      else if pos('quarter',CmpName)>0 then
        TcxDateEdit(FindCmp).Date:=Date()-120
      else if pos('year',CmpName)>0 then
        TcxDateEdit(FindCmp).Date:=Date()-365;
    end;
  end;
end;

procedure TframeBaseReport.DoCxDateOnCloseUp(Sender: TObject);
var
  CmpNum: string;
  FindCmp: TComponent;
begin
  CmpNum:=GetCmpNum(TcxDateEdit(Sender).Name,'P'); //返回控件Num
  if CmpNum<>'' then
  begin
    FindCmp:=FindComponent('fndP'+CmpNum+'_week');
    if (FindCmp<>nil) and (FindCmp is TcxRadioButton) and (TcxRadioButton(FindCmp).Checked) then
      TcxRadioButton(FindCmp).Checked:=False;

    FindCmp:=FindComponent('fndP'+CmpNum+'_month');
    if (FindCmp<>nil) and (FindCmp is TcxRadioButton) and (TcxRadioButton(FindCmp).Checked) then
      TcxRadioButton(FindCmp).Checked:=False;

    FindCmp:=FindComponent('fndP'+CmpNum+'_quarter');
    if (FindCmp<>nil) and (FindCmp is TcxRadioButton) and (TcxRadioButton(FindCmp).Checked) then
      TcxRadioButton(FindCmp).Checked:=False;

    FindCmp:=FindComponent('fndP'+CmpNum+'_year');
    if (FindCmp<>nil) and (FindCmp is TcxRadioButton) and (TcxRadioButton(FindCmp).Checked) then
      TcxRadioButton(FindCmp).Checked:=False;
  end;
end;

function TframeBaseReport.AddReportReport(TitleList: TStringList; PageNo: string): string;
var
  i: integer;
  CmpName: string;
  Contrl: TWinControl;
  FindCmp1,FindCmp2: TComponent;
begin
  // 1、管理群组：
  FindCmp1:=FindComponent('fndP'+PageNo+'_SHOP_TYPE');
  FindCmp2:=FindComponent('fndP'+PageNo+'_SHOP_VALUE');
  if (FindCmp1<>nil) and (FindCmp1.Tag<>100) and (FindCmp2<>nil)and (FindCmp2.Tag<>100) and (FindCmp1 is TcxComboBox) and (FindCmp2 is TzrComboBoxList)  and (TcxComboBox(FindCmp1).Visible) and
     (TcxComboBox(FindCmp1).ItemIndex<>-1) and (TzrComboBoxList(FindCmp2).Visible) and (TzrComboBoxList(FindCmp2).AsString<>'')  then
  begin
    TitleList.add(TcxComboBox(FindCmp1).Text+'：'+TzrComboBoxList(FindCmp2).Text);
  end;

  //  2、客户分组
  FindCmp1:=FindComponent('fndP'+PageNo+'_CUST_TYPE');
  FindCmp2:=FindComponent('fndP'+PageNo+'_CUST_VALUE');
  if (FindCmp1<>nil) and (FindCmp1.Tag<>100) and (FindCmp2<>nil)and (FindCmp2.Tag<>100) and (FindCmp1 is TcxComboBox) and (FindCmp2 is TzrComboBoxList)  and (TcxComboBox(FindCmp1).Visible) and
     (TcxComboBox(FindCmp1).ItemIndex<>-1) and (TzrComboBoxList(FindCmp2).Visible) and (TzrComboBoxList(FindCmp2).AsString<>'')  then
  begin
    TitleList.add(TcxComboBox(FindCmp1).Text+'：'+TzrComboBoxList(FindCmp2).Text);
  end;
  //  2、考核指标分组
  FindCmp1:=FindComponent('fndP'+PageNo+'_KPI_ID');
  if (FindCmp1<>nil) and (FindCmp1.Tag<>100) and (FindCmp1 is TzrComboBoxList) and
     (TzrComboBoxList(FindCmp1).Visible) and (TzrComboBoxList(FindCmp1).AsString<>'')  then
  begin
    TitleList.add('考核指标：'+TzrComboBoxList(FindCmp1).Text);
  end;
  // 4、门店名称：
  FindCmp1:=FindComponent('fndP'+PageNo+'_SHOP_ID');
  if (FindCmp1<>nil)and (FindCmp1.Tag<>100) and (FindCmp1 is TzrComboBoxList) and (TzrComboBoxList(FindCmp1).AsString<>'') and (TzrComboBoxList(FindCmp1).Visible)  then
  begin
    TitleList.Add('门店名称：'+TzrComboBoxList(FindCmp1).Text);
  end;

  // 5、部门名称:
  FindCmp1:=FindComponent('fndP'+PageNo+'_DEPT_ID');
  if (FindCmp1<>nil)and (FindCmp1.Tag<>100) and (FindCmp1 is TzrComboBoxList) and (TzrComboBoxList(FindCmp1).AsString<>'') and (TzrComboBoxList(FindCmp1).Visible)  then
  begin
    TitleList.Add('部门名称：'+TzrComboBoxList(FindCmp1).Text);
  end;

  // 6、商品指标：
  FindCmp1:=FindComponent('fndP'+PageNo+'_TYPE_ID');
  FindCmp2:=FindComponent('fndP'+PageNo+'_STAT_ID');
  if (FindCmp1<>nil) and (FindCmp1.Tag<>100) and (FindCmp2<>nil)and (FindCmp2.Tag<>100) and (FindCmp1 is TcxComboBox) and (FindCmp2 is TzrComboBoxList) and (TcxComboBox(FindCmp1).Visible) and
     (TcxComboBox(FindCmp1).ItemIndex<>-1) and (TzrComboBoxList(FindCmp2).Visible) and (TzrComboBoxList(FindCmp2).AsString<>'') then
  begin
    TitleList.add(TcxComboBox(FindCmp1).Text+'：'+TzrComboBoxList(FindCmp2).Text);
  end;
  // 7、商品分类
  FindCmp1:=FindComponent('fndP'+PageNo+'_SORT_ID');
  if (FindCmp1<>nil)and (FindCmp1.Tag<>100) and (FindCmp1 is TcxButtonEdit) and (TcxButtonEdit(FindCmp1).Visible) and (TcxButtonEdit(FindCmp1).Text<>'') then
  begin
    TitleList.Add('商品分类：'+TcxButtonEdit(FindCmp1).Text);
  end;

  // 8、商品名称：
  FindCmp1:=FindComponent('fndP'+PageNo+'_GODS_ID');
  if (FindCmp1<>nil) and (FindCmp1.Tag<>100) and (FindCmp1 is TzrComboBoxList) and (TzrComboBoxList(FindCmp1).AsString<>'') and (TzrComboBoxList(FindCmp1).Visible)  then
  begin
    TitleList.Add('商品名称：'+TzrComboBoxList(FindCmp1).Text);
  end;

  // 9、销售类型
  FindCmp1:=FindComponent('fndP'+PageNo+'_SALES_TYPE');
  if (FindCmp1<>nil) and (FindCmp1.Tag<>100) and (FindCmp1 is TcxComboBox) and (TcxComboBox(FindCmp1).Visible) and (TcxComboBox(FindCmp1).ItemIndex>-1)  then
  begin
    TitleList.add('销售类型：'+TcxComboBox(FindCmp1).Text);
  end;

  //10、销售方式[继承类实现:订货方式或销售方式]
  {
  FindCmp1:=FindComponent('fndP'+PageNo+'_SALES_STYLE');
  if (FindCmp1<>nil) and (FindCmp1.Tag<>100) and (FindCmp1 is TcxComboBox) and (TcxComboBox(FindCmp1).Visible) and (TcxComboBox(FindCmp1).ItemIndex>-1)  then
  begin
    TitleList.add('销售方式：'+TcxComboBox(FindCmp1).Text);
  end;
  }

  //11、计量单位
  FindCmp1:=FindComponent('fndP'+PageNo+'_UNIT_ID');
  if (FindCmp1<>nil) and (FindCmp1.Tag<>100) and (FindCmp1 is TcxComboBox) and (TcxComboBox(FindCmp1).Visible) and (TcxComboBox(FindCmp1).ItemIndex<>-1) then
    TitleList.Add('统计单位：'+TcxComboBox(FindCmp1).Text);

  //12、业务员、导购员
  FindCmp1:=FindComponent('fndP'+PageNo+'_GUIDE_USER');
  if (FindCmp1<>nil) and (FindCmp1.Tag<>100) and (FindCmp1 is TzrComboBoxList) and (TzrComboBoxList(FindCmp1).Visible) and (TzrComboBoxList(FindCmp1).AsString<>'') then
  begin
    if ProductID = 'R3_RYC' then
      TitleList.Add('导购员：'+TzrComboBoxList(FindCmp1).Text)
    else
      TitleList.Add('业务员：'+TzrComboBoxList(FindCmp1).Text);
  end;

  //13、统计类型：
  FindCmp1:=FindComponent('fndP'+PageNo+'_RPTTYPE');
  if (FindCmp1<>nil) and (FindCmp1.Tag<>100) and (FindCmp1 is TcxComboBox) and (TcxComboBox(FindCmp1).Visible) and (TcxComboBox(FindCmp1).ItemIndex<>-1) then
  begin
    TitleList.add('统计类型：'+TcxComboBox(FindCmp1).Text);
  end;
  
  //13、客户名称
  FindCmp1:=FindComponent('fndP'+PageNo+'_CLIENT_ID');
  if (FindCmp1<>nil) and (FindCmp1.Tag<>100) and (FindCmp1 is TzrComboBoxList) and (TzrComboBoxList(FindCmp1).Visible) and (TzrComboBoxList(FindCmp1).Text<>'') then
  begin
    TitleList.add('客户名称：'+TzrComboBoxList(FindCmp1).Text);
  end;  
  
  //14、应收账款类型:
  FindCmp1:=FindComponent('fndP'+PageNo+'_RECV_TYPE');
  if (FindCmp1<>nil) and (FindCmp1.Tag<>100) and (FindCmp1 is TzrComboBoxList) and (TzrComboBoxList(FindCmp1).Visible) and (TzrComboBoxList(FindCmp1).AsString<>'') then
  begin
    TitleList.Add('应收账款类型：'+TzrComboBoxList(FindCmp1).Text)
  end;
  //15、应付账款类型:   
  FindCmp1:=FindComponent('fndP'+PageNo+'_ABLE_TYPE');
  if (FindCmp1<>nil) and (FindCmp1.Tag<>100) and (FindCmp1 is TzrComboBoxList) and (TzrComboBoxList(FindCmp1).Visible) and (TzrComboBoxList(FindCmp1).AsString<>'') then
  begin
    TitleList.Add('应收账款类型：'+TzrComboBoxList(FindCmp1).Text)
  end; 
  //16、单据类型:[全部命名规则]
  FindCmp1:=FindComponent('fndP'+PageNo+'_ALL');
  if (FindCmp1<>nil) and (FindCmp1 is TcxRadioButton) and (not TcxRadioButton(FindCmp1).Checked) then //所有:
  begin
    Contrl:=TcxRadioButton(FindCmp1).Parent;
    if (Contrl<>nil) and (Contrl.ControlCount>0) then  //根据[查询条件面板:Conrol 循环查询]
    begin
      for i:=0 to Contrl.ControlCount-1 do
      begin
        CmpName:=copy(trim(LowerCase(TComponent(Contrl.Controls[i]).Name)),1,5+length(PageNo));
        if (Contrl.Controls[i] is TcxRadioButton) and (TcxRadioButton(Contrl.Controls[i]).Checked) and (CmpName='fndp'+PageNo+'_') then
        begin
          TitleList.Add('单据类型：'+TcxRadioButton(Contrl.Controls[i]).Caption);
          Break;
        end;
      end;
    end;
  end;
end;

function TframeBaseReport.IntToVarchar(FieldName: string): string;
begin
  result:=trim(FieldName);
  case Factor.iDbType of
   0,5:
      result:='cast('+FieldName+' as varchar)';
   1: result:='to_char('+FieldName+')';
   3: result:='str('+FieldName+')';
   4: result:='ltrim(rtrim(char('+FieldName+')))';
  end;
end;

function TframeBaseReport.GetHasChild: Boolean;
begin
  result:=(ShopGlobal.GetZQueryFromName('CA_SHOP_INFO').RecordCount>1);
end;

procedure TframeBaseReport.SetRzPageActivePage(IsGroupReport: Boolean);
var i: integer;
begin
  if (IsGroupReport) and (RzPage.PageCount>1) then
  begin
    rzPage.Pages[0].TabVisible := HasChild and (Copy(Global.SHOP_ID,Length(Global.SHOP_ID)-3,Length(Global.SHOP_ID)) = '0001');
    rzPage.Pages[1].TabVisible := HasChild and (Copy(Global.SHOP_ID,Length(Global.SHOP_ID)-3,Length(Global.SHOP_ID)) = '0001');
  end;
  for i:=0 to rzPage.PageCount -1 do
  begin
    if rzPage.Pages[i].TabVisible then
    begin
      rzPage.ActivePageIndex:=i;
      Break;
    end;
  end;
end;

procedure TframeBaseReport.SetNotShowCostPrice(SetGrid: TDBGridEh; AryFields: array of String);
var
  i: integer;
  ColName: string;
  SetCol: TColumnEh;
begin
  for i:=Low(AryFields) to High(AryFields) do
  begin
    ColName:=trim(AryFields[i]);
    SetCol:=FindColumn(SetGrid, ColName);
    if SetCol<>nil then
      SetCol.Free;
  end;
  RefreshColumn;
end;

procedure TframeBaseReport.FormDestroy(Sender: TObject);
begin
  inherited;
  FSumRecord.Free;
end;

//2011.06.30 Am Add 导出Excel前表头
function TframeBaseReport.DoBeforeExport: boolean;
var
  i: integer;                      
  PageNo,CurStr: string;  //控件页码
  Str: WideString;
  TitleList: TStringList;
begin
  Str:='';
  try
    DBGridEh.DBGridHeader.Clear;
    DBGridEh.DBGridFooter.Clear;
    PageNo:=InttoStr(RzPage.ActivePageIndex+1);
    DBGridEh.DBGridTitle:=RzPage.ActivePage.Caption;
    //调用DBGridEh的Print来获取导出条件
    TitleList:=TStringList.Create;
    AddReportReport(TitleList, PageNo);
    for i:=0 to TitleList.Count-1 do
    begin
      CurStr:=trim(TitleList.Strings[i]);
      if (i>0) and (i mod 4=0) then  //4个条件换一行
        Str:=Str+#13+CurStr
      else
      begin
        if i=0 then
          Str:=CurStr
        else
          Str:=Str+'      '+CurStr;
      end;
    end;
  finally
    TitleList.Free;
  end;
  DBGridEh.DBGridHeader.Text:=Str;
  DBGridEh.DBGridFooter.Add(' '+#13+' 操作员：'+Global.UserName+'  导出时间：'+formatDatetime('YYYY-MM-DD HH:NN:SS',now()));
end;

procedure TframeBaseReport.SingleReportParams(ParameStr: string);
begin

end;

procedure TframeBaseReport.DoGodsGroupBySort(DataSet: TZQuery; SORT_IDX,SORT_ID,SORT_NAME,OrderByField: string; SumFields,CalcFields: Array of String);
 //取SortList:
 procedure SetSortList(InDataSet: TZQuery; SortList: TStringList);
 var i: integer; SortID: string;
 begin
   try
     SortList.Clear;
     InDataSet.First;
     while not InDataSet.Eof do
     begin
       SortID:=trim(InDataSet.fieldbyname(SORT_ID).AsString);
       if SortList.IndexOf(SortID)=-1 then
         SortList.Add(SortID);
       InDataSet.Next;
     end;
     //对于默认值:第一个若是"#"处理
     if (SortList.Count>0) and (trim(SortList.Strings[0])='#') then
     begin
       SortList.Delete(0);
       SortList.Add('#'); 
     end;
   finally
     InDataSet.First;
   end;
 end;
 procedure CalcValue(AObj: TRecord_); //计算汇总数据
 var i,Idx: integer; CalcField1,CalcField2,CalcValue: string; CalcCount: real;
 begin
   for i:=Low(CalcFields) to High(CalcFields) do
   begin
     CalcField2:=trim(CalcFields[i]);
     Idx:=Pos('=',CalcField2);
     CalcValue:=Copy(CalcField2,1,Idx-1);
     delete(CalcField2,1,Idx);
     Idx:=Pos('/',CalcField2);
     CalcField1:=Copy(CalcField2,1,Idx-1);
     delete(CalcField2,1,Idx);
     Idx:=Pos('*',CalcField2);
     if Idx>0 then
     begin
       CalcCount:=StrtoFloatDef(Copy(CalcField2,Idx+1,length(CalcField2)-Idx),1.0);
       CalcField2:=Copy(CalcField2,1,Idx-1);
     end else
       CalcCount:=1.0;

     if (AObj.FindField(CalcValue)<>nil) and (AObj.FindField(CalcField1)<>nil) and (AObj.FindField(CalcField2)<>nil) then
     begin
       if AObj.FindField(CalcField2).AsFloat<>0 then 
         AObj.FindField(CalcValue).AsFloat:=(AObj.FindField(CalcField1).AsFloat / AObj.FindField(CalcField2).AsFloat)*CalcCount;
     end;
   end;
 end;
 procedure CalcSum(AllObj, SortObj, tmpObj: TRecord_); //计算汇总数据
 var i: integer; FieldName: string;
 begin
   for i:=Low(SumFields) to High(SumFields) do
   begin
     FieldName:=trim(SumFields[i]);
     AllObj.FieldByName(FieldName).AsFloat:=AllObj.FieldByName(FieldName).AsFloat+tmpObj.FieldByName(FieldName).AsFloat;
     SortObj.FieldByName(FieldName).AsFloat:=SortObj.FieldByName(FieldName).AsFloat+tmpObj.FieldByName(FieldName).AsFloat;
   end;
   if SortObj.FindField(SORT_ID)<>nil then
   begin
     i:=StrtoIntDef(tmpObj.FieldByName(SORT_ID).AsString,0);
     if i>100000 then 
       SortObj.FieldByName(SORT_ID).AsString:=InttoStr(i+1);
   end;
 end;
 function GetSortName(SORT_ID: string): string; //返回小计名称:
 var SortRs: TZQuery;
 begin
   result:='未定义';
   case strtoInt(SORT_IDX) of
   0:
    begin
      if trim(SORT_ID)='0' then
        result:=defaultRelatin
      else
      begin
        SortRs:=Global.GetZQueryFromName('CA_RELATIONS');
        if SortRs<>nil then
        begin
          if SortRs.Locate('RELATION_ID',SORT_ID,[]) then
            result:=trim(SortRs.fieldbyName('RELATION_NAME').AsString);
        end;
      end;
    end;
   1:
    begin
      SortRs:=Global.GetZQueryFromName('PUB_GOODSSORT');
      if SortRs<>nil then
      begin
        if SortRs.Locate('SORT_ID',SORT_ID,[]) then
          result:=trim(SortRs.fieldbyName('SORT_NAME').AsString);
      end;
    end;
   3: 
    begin 
      SortRs:=Global.GetZQueryFromName('PUB_CLIENTINFO');
      if SortRs<>nil then
      begin
        if SortRs.Locate('CLIENT_ID',SORT_ID,[]) then
          result:=trim(SortRs.fieldbyName('CLIENT_NAME').AsString);
      end;
    end;
   else
    begin
      SortRs:=Global.GetZQueryFromName('PUB_GOODS_INDEXS');
      if SortRs<>nil then
      begin
        if SortRs.Locate('SORT_ID',SORT_ID,[]) then
          result:=trim(SortRs.fieldbyName('SORT_NAME').AsString);
      end;
    end;
   end;
 end;
var
  i,ORD_ID: integer;
  SID,str: string;
  Rs: TZQuery;
  SortList: TStringList;
  SortObj, tmpObj: TRecord_;
begin
  if StrToIntDef(SORT_IDX,0)=-1 then Exit;
  try
    Rs:=TZQuery.Create(nil);
    Rs.Data:=DataSet.Data;
    SortList:=TStringList.Create;
    SortObj:=TRecord_.Create;
    tmpObj:=TRecord_.Create;
    FAllRecord.Clear;
    FAllRecord.ReadField(DataSet);
    FAllRecord.FieldByName(SORT_NAME).AsString:=InttoStr(DataSet.RecordCount); //返回记录数
    SetSortList(Rs,SortList); //读取分类个数
    DataSet.EmptyDataSet;  //清空数据
    ORD_ID:=10000000;
    Rs.First;
    for i:=0 to SortList.Count-1 do  //逐个分类循环处理
    begin
      Inc(ORD_ID);
      SID:=trim(SortList.Strings[i]);
      SortObj.ReadField(DataSet);
      try
        Rs.Filtered:=False;
        Rs.Filter:='SORT_ID='''+SID+''' ';
        Rs.Filtered:=True;
        while not Rs.Eof do
        begin
          tmpObj.ReadFromDataSet(Rs);
          tmpObj.FieldByName(OrderByField).AsString:=IntToStr(ORD_ID);
          CalcSum(FAllRecord,SortObj,tmpObj); //计算汇总数据
          DataSet.Append;
          tmpObj.WriteToDataSet(DataSet);  //写入数据集
          if DataSet.State in [dsInsert,dsEdit] then DataSet.Post;
          Rs.Next;
        end;
      finally
        Rs.Filtered:=False;
        Rs.Filter:='';
      end;
      //插入当前SortID的汇总数
      CalcValue(SortObj); //计算汇总数据
      Inc(ORD_ID);
      SortObj.FieldByName(OrderByField).AsString:=IntToStr(ORD_ID);
      SortObj.FieldByName(SORT_NAME).AsString:='    '+GetSortName(SID);
      DataSet.Append; //插入总合计
      SortObj.WriteToDataSet(DataSet);  //写入数据集
      if DataSet.State in [dsInsert,dsEdit] then DataSet.Post;
      SortObj.Clear;
    end;
    //计算汇总数据
    if not DataSet.IsEmpty then CalcValue(FAllRecord);
  finally
    Rs.Free;
    SortList.Free;
    SortObj.Free;
    tmpObj.Free;
  end;
end;

procedure TframeBaseReport.AddReportTypeList(RptType: TcxComboBox);
var
  i: integer;
  CurObj: TRecord_;
  rs,StatInfo: TZQuery;
begin
  try
    rs:=TZQuery.Create(nil);
    rs.Close;
    rs.FieldDefs.Add('SORT_ID',ftInteger,0,true);
    rs.FieldDefs.Add('SORT_NAME',ftstring,50,true);
    rs.FieldDefs.Add('GROUP_NAME',ftstring,50,true);
    rs.CreateDataSet;
    //添加无分组
    rs.Append;
    rs.FieldByName('SORT_ID').AsInteger:=-1;
    rs.FieldByName('SORT_NAME').AsString:='无';
    rs.FieldByName('GROUP_NAME').AsString:='无';
    rs.Post;
    //供应链分组统计
    rs.Append;
    rs.FieldByName('SORT_ID').AsInteger:=0;
    rs.FieldByName('SORT_NAME').AsString:='供应链';
    rs.FieldByName('GROUP_NAME').AsString:='供应链';
    rs.Post;
    //货品分类分组统计
    {rs.Append;
    rs.FieldByName('SORT_ID').AsInteger:=1;
    rs.FieldByName('SORT_NAME').AsString:='商品分类';
    rs.FieldByName('GROUP_NAME').AsString:='商品分类分组统计';
    rs.Post;
    }
    StatInfo:=Global.GetZQueryFromName('PUB_STAT_INFO');
    StatInfo.First;
    while not StatInfo.Eof do
    begin
      rs.Append;
      rs.FieldByName('SORT_ID').AsString:=StatInfo.fieldbyName('CODE_ID').AsString;
      rs.FieldByName('SORT_NAME').AsString:=StatInfo.fieldbyName('CODE_NAME').AsString;
      rs.FieldByName('GROUP_NAME').AsString:=StatInfo.fieldbyName('CODE_NAME').AsString;
      rs.Post;
      StatInfo.Next;
    end;
    ClearCbxPickList(RptType);  //清除节点及Object对象
    rs.First;
    while not rs.Eof do
    begin
      CurObj:=TRecord_.Create;
      CurObj.ReadFromDataSet(rs);
      RptType.Properties.Items.AddObject(CurObj.fieldbyName('GROUP_NAME').AsString,CurObj);
      rs.Next;
    end;
  finally
    rs.Free;
  end;
end;

procedure TframeBaseReport.GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
var
  ORDER_ID: string;  //排序字段
  GodsCode: string;  //货号
  BarCode: string;   //条码
  ARect:TRect;
  GridDs: TDataSet;  //Grid数据集
begin
  if TDBGridEh(Sender).DataSource.DataSet=nil then Exit;
  if not TDBGridEh(Sender).DataSource.DataSet.Active then Exit;

  if (Rect.Top = Column.Grid.CellRect(Column.Grid.Col, Column.Grid.Row).Top) and
     (not (gdFocused in State) or not Column.Grid.Focused) then
  begin
    Column.Grid.Canvas.Brush.Color := clAqua;   //选中颜色状态
  end;
  Column.Grid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  if Column.FieldName = 'SEQNO' then
  begin
    ARect := Rect;
    DrawText(Column.Grid.Canvas.Handle,pchar(Inttostr(Column.Grid.DataSource.DataSet.RecNo)),length(Inttostr(Column.Grid.DataSource.DataSet.RecNo)),ARect,DT_NOCLIP or DT_SINGLELINE or DT_CENTER or DT_VCENTER);
  end;
  //初始化参数:
  GridDs:=TDBGridEh(Sender).DataSource.DataSet; //Grid数据集 
  if GridDs.FindField('ORDER_ID')<>nil then ORDER_ID:=GridDs.fieldbyName('ORDER_ID').AsString;
  if GridDs.FindField('GODS_CODE')<>nil then GodsCode:=GridDs.fieldbyName('GODS_CODE').AsString;
  if GridDs.FindField('BARCODE')<>nil then BarCode:=GridDs.fieldbyName('BARCODE').AsString;
  if (trim(Column.FieldName)<>'SEQNO') and (trim(ORDER_ID)<>'') and (trim(GodsCode)='') and (trim(BarCode)='') then
  begin
    TDBGridEh(Sender).Canvas.Brush.Color := $00E7E2E3; //$00A5A5A5;
    TDBGridEh(Sender).Canvas.Font.Style:=[fsBold];
    TDBGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

function TframeBaseReport.GetRelation_ID(Relation_ID: string): string;
begin
  case Factor.iDbType of
   0,1,4:
      result:='(case when '+Relation_ID+'=0 then 99999999 else 10000000+'+Relation_ID+' end)';
   5: result:='(case when '+Relation_ID+'=0 then 99999999 else 10000000+'+Relation_ID+' end)';
   else
      result:='(case when '+Relation_ID+'=0 then 99999999 else 10000000+'+Relation_ID+' end)';
  end;
end;

procedure TframeBaseReport.DBGridTitleClick(GridDataSet: TZQuery; Column: TColumnEh);
begin
  if Column.Field = nil then Exit;
  if (GridDataSet=nil) or (GridDataSet.IsEmpty) then Exit;
  case Column.Title.SortMarker of
    smNoneEh,smDownEh:     begin       Column.Title.SortMarker := smUpEh;       GridDataSet.SortedFields := Column.FieldName+' ASC';     end;    smUpEh:     begin       Column.Title.SortMarker := smDownEh;       GridDataSet.SortedFields := Column.FieldName+' DESC';     end;
  end;
end;


procedure TframeBaseReport.DBGridTitleClick(GridDataSet: TZQuery; Column: TColumnEh; SetSORT_ID: string);
begin
  if Column.Field = nil then Exit;
  if (GridDataSet=nil) or (GridDataSet.IsEmpty) then Exit;
  case Column.Title.SortMarker of
    smNoneEh,smDownEh:     begin       Column.Title.SortMarker := smUpEh;       GridDataSet.SortedFields := SetSORT_ID+' ASC;'+Column.FieldName+' ASC';     end;    smUpEh:     begin       Column.Title.SortMarker := smDownEh;       GridDataSet.SortedFields := SetSORT_ID+' ASC;'+Column.FieldName+' DESC';     end;
  end;
end;

function TframeBaseReport.GetGodsStateValue(DefineState: string): string;
var
  ReStr: string;
  PosIdx: integer;
  RsState: TZQuery;
begin
  ReStr:='00000000000000000000';
  RsState:=Global.GetZQueryFromName('PUB_STAT_INFO');
  RsState.First;
  while not RsState.Eof do
  begin
    PosIdx:=StrToIntDef(RsState.fieldbyName('CODE_ID').AsString,0);
    if PosIdx>0 then
    begin
      if ShopGlobal.GetVersionFlag=1 then  //服装版全部
        ReStr:=Copy(ReStr,1,PosIdx-1)+Copy(DefineState,PosIdx,1)+Copy(ReStr,PosIdx+1,20)
      else
      begin
        if (PosIdx<7) or (PosIdx>8) then
          ReStr:=Copy(ReStr,1,PosIdx-1)+Copy(DefineState,PosIdx,1)+Copy(ReStr,PosIdx+1,20)
      end;
    end;
    RsState.Next;
  end;
  result:=ReStr;
end;

function TframeBaseReport.GetGodsSTAT_ID(fndP_TYPE_ID: TcxComboBox): string;
var
  Aobj: TRecord_;
begin
  Aobj:=TRecord_(fndP_TYPE_ID.Properties.Items.Objects[fndP_TYPE_ID.ItemIndex]);
  result:=Aobj.FieldByName('CODE_ID').asString;
end;

//金额格式化的数组[Grid.ColumnName]组成
procedure TframeBaseReport.SetGridColumnDisplayFormat(AryMnyFormat: Array of string);
  function FindGrid(GridName: string): TDBGridEh;
  var Grid: TComponent;
  begin
    result:=nil;
    Grid:=FindComponent(GridName);
    if (Grid<>nil) and (Grid is TDBGridEh) then
      result:=TDBGridEh(Grid);
  end;
var
  i,Idx: integer;
  CurGrid: TDBGridEh;  //DBGridEh
  SetColumn: TColumnEh;
  CurName, CurGridName, NearGridName,ColName: string; //DBGridEh的名
begin
  CurGridName:='';
  NearGridName:='';
  for i:=Low(AryMnyFormat) to High(AryMnyFormat) do
  begin
    CurName:=trim(AryMnyFormat[i]);
    Idx:=Pos('.',CurName);
    ColName:=Copy(CurName,Idx+1,length(CurName)-Idx);
    CurGridName:=Copy(CurName,1,Idx-1);
    
    if NearGridName<>'' then
    begin
      if NearGridName<>CurGridName then
        CurGrid:=FindGrid(CurGridName);
    end else
    begin
      NearGridName:=CurGridName;
      CurGrid:=FindGrid(CurGridName);
    end;
    
    if CurGrid<>nil then
    begin
      SetColumn:=FindColumn(CurGrid, ColName);
      if SetColumn<>nil then
      begin
        SetColumn.DisplayFormat:='#,##0.00';
        SetColumn.Footer.DisplayFormat:='#,##0.00';
      end;
    end;
  end;
end;

procedure TframeBaseReport.CopyItemsList(SrcCbx, DistCbx: TcxComboBox);
var
  i: integer;
  ItemCap: string;
begin
  ClearCbxPickList(DistCbx);
  for i:=0 to SrcCbx.Properties.Items.Count-1 do
  begin
    ItemCap:=trim(SrcCbx.Properties.Items.Strings[i]);
    if SrcCbx.Properties.Items.Objects[i]<>nil then
      DistCbx.Properties.Items.AddObject(ItemCap,SrcCbx.Properties.Items.Objects[i]) 
    else
      DistCbx.Properties.Items.Add(ItemCap);
  end;
  if DistCbx.Properties.Items.Count>0 then DistCbx.ItemIndex:=0;
end;

procedure TframeBaseReport.DoCreateKPIDataSet(IDX_TYPE_IDS: string);
var
  Str: string;
begin
  if not Assigned(PUB_KPI_ID) then PUB_KPI_ID:=TZQuery.Create(self);
  if not PUB_KPI_ID.Active then
  begin
    Str:='select KPI_ID,KPI_NAME,IDX_TYPE from MKT_KPI_INDEX where TENANT_ID='+IntToStr(Global.TENANT_ID)+' ';
    if trim(IDX_TYPE_IDS)<>'' then
    begin
      if Pos(',',IDX_TYPE_IDS)>0 then
        Str:=Str+' and IDX_TYPE='''+IDX_TYPE_IDS+''')'
      else
        Str:=Str+' and IDX_TYPE in ('''+StringReplace(IDX_TYPE_IDS,',',''',''',[rfReplaceAll])+''')';
    end;
    PUB_KPI_ID.SQL.Text:=Str;
    Factor.Open(PUB_KPI_ID);
  end;
end;

procedure TframeBaseReport.DoCalcGridFooterRate(SetGird: TDBGridEh; CalcCol: TColumnEh; FirCol,SecCol: string);
var
  i: integer;
  FirstValue,SecondValue: real;
  FirstCol,SecondCol: TColumnEh;
begin
  FirstValue:=0;
  SecondValue:=0;
  FirstCol:=FindColumn(SetGird,FirCol);
  SecondCol:=FindColumn(SetGird,SecCol);
  if (FirstCol<>nil) and (SecondCol<>nil) then
  begin
    if (FirstCol.Footer.ValueType in [fvtSum,fvtCount]) and (SecondCol.Footer.ValueType in [fvtSum,fvtCount]) then
    begin
      FirstValue:=StrToFloatDef(FirstCol.Footer.Value,0.0);
      SecondValue:=StrToFloatDef(SecondCol.Footer.Value,0.0);
      if SecondValue<>0 then
        CalcCol.Footer.Value:=FloatToStr((FirstValue*100)/SecondValue)
      else
        CalcCol.Footer.Value:='0';
    end;
  end;
end;

procedure TframeBaseReport.GridGetFooterParamsValue(Sender: TObject; var Text: String);
var
  Idx: integer;
  CurValue: Real;
  DataSet: TDataSet;
begin
  DataSet:=TDBGridEh(Sender).DataSource.DataSet;
  if (DataSet<>nil) and (DataSet.Active) and (DataSet.RecordCount>1) then
  begin
    Idx:=Pos('%',Text);
    if Idx>0 then
    begin
      Text:=Copy(Text,1,Idx-1);
      CurValue:=StrToFloatDef(Text,0.00)/(DataSet.RecordCount*1.00);
      CurValue:=Round(CurValue*100)/100;
      Text:=FloatToStr(CurValue)+'%';
    end;
  end;
end;  

procedure TframeBaseReport.LoadGridColumnFormat(DBGridEh: TDBGridEh; vHeadName: string);
var
  F:TIniFile;
  i,c:integer;
  save:boolean;
  w:integer;
begin
  F := TIniFile.Create(ExtractFilePath(ParamStr(0))+'sft.'+Global.UserID);
  try
    if not DBGridEh.Enabled then Exit;
    save := DBGridEh.AutoFitColWidths;
    DBGridEh.AutoFitColWidths := false;
    w := DBGridEh.Columns.Count;
    for i:= DBGridEh.Columns.Count -1 downto 0 do
    begin
      if DBGridEh.Columns[i].FieldName='' then Continue;
      if (DBGridEh.FrozenCols+1) >= w then break;
      DBGridEh.Columns[i].Visible := F.ReadBool(vHeadName,DBGridEh.Columns[i].FieldName,DBGridEh.Columns[i].Visible);
      DBGridEh.Columns[i].Width := F.ReadInteger(vHeadName,DBGridEh.Columns[i].FieldName+'_WIDTH',DBGridEh.Columns[i].Width);
      if not DBGridEh.Columns[i].Visible then Dec(w);
    end;
    DBGridEh.AutoFitColWidths := save;
  finally
    try
      F.Free;
    except
    end;
  end;
end;

procedure TframeBaseReport.SaveGridColumnFormat(DBGridEh: TDBGridEh; vHeadName: string);
var
  F:TIniFile;
  i,c:integer;
begin
  F := TIniFile.Create(ExtractFilePath(ParamStr(0))+'sft.'+Global.UserID);
  try
    for i:= 0 to DBGridEh.Columns.Count -1 do
    begin
      if DBGridEh.Columns[i].FieldName='' then Continue;
      F.WriteBool(vHeadName,DBGridEh.Columns[i].FieldName,DBGridEh.Columns[i].Visible);
      F.WriteInteger(vHeadName,DBGridEh.Columns[i].FieldName+'_WIDTH',DBGridEh.Columns[i].Width);
      F.WriteInteger(vHeadName,DBGridEh.Columns[i].FieldName+'_INDEX',DBGridEh.Columns[i].Index);
    end;
  finally
    try
      F.Free;
    except
    end;
  end;

end;


function TframeBaseReport.GetGodsOwnerTenIds(CxFieldName: string; vType: integer=0): string;
var
  Rs: TZQuery;
  TenIds: string;
begin
  result:=' '+CxFieldName+'='+IntToStr(Global.TENANT_ID);
  try
    Rs:=TZQuery.Create(nil);
    Rs.SQl.Text:='select a.TENANT_ID as TEN_ID,b.TENANT_ID as TENANT_ID from CA_RELATIONS a,CA_RELATION b where a.RELATION_ID=b.RELATION_ID and a.RELATI_ID='+IntToStr(Global.TENANT_ID);
    Factor.Open(Rs);
    if Rs.IsEmpty then Exit;
    //循环取Tenant_ID进行组条件
    TenIds:=IntToStr(Global.TENANT_ID);
    Rs.First;
    while not Rs.Eof do
    begin
      case vType of
       0: TenIds:=TenIds+','+IntToStr(Rs.FieldByName('TENANT_ID').AsInteger);
       1: TenIds:=TenIds+','+IntToStr(Rs.FieldByName('TEN_ID').AsInteger);
      end;
      Rs.Next;
    end;
    result:=' '+CxFieldName+' in('+TenIds+')';
  finally
    Rs.Free;
  end;
end;

function TframeBaseReport.CreateGridColForFIG(var SetGrid: TDBGridEh;const BegIdx:integer): Boolean;
var
  RsList:TZQuery;
  SetCol:TColumnEh;
begin
  Result:=False;
  SetGrid.Columns.BeginUpdate;
  try
    //创建尺码列
    SetCol := SetGrid.Columns.Add;
    SetCol.FieldName:='PROPERTY_01';
    SetCol.Title.Caption:='尺码';
    SetCol.Width:=32;
    SetCol.Index:=BegIdx;
    SetCol.KeyList.Clear;
    SetCol.PickList.Clear;
    RsList:=Global.GetZQueryFromName('PUB_SIZE_INFO');
    if (RsList<>nil)and(not RsList.IsEmpty) then
    begin
      RsList.First;
      while not RsList.Eof do
      begin
        SetCol.KeyList.Add(trim(RsList.FieldByName('SIZE_ID').AsString));
        SetCol.PickList.Add(trim(RsList.FieldByName('SIZE_NAME').AsString));
        RsList.Next;
      end;
    end;
 
    //创建颜色列
    SetCol := SetGrid.Columns.Add;
    SetCol.FieldName:='PROPERTY_02';
    SetCol.Title.Caption:='颜色';
    SetCol.Width := 36;
    SetCol.Index := BegIdx+1;
    SetCol.KeyList.Clear;
    SetCol.PickList.Clear;
    RsList:=Global.GetZQueryFromName('PUB_COLOR_INFO');
    if (RsList<>nil)and(not RsList.IsEmpty) then
    begin
      RsList.First;
      while not RsList.Eof do
      begin
        SetCol.KeyList.Add(trim(RsList.FieldByName('COLOR_ID').AsString));
        SetCol.PickList.Add(trim(RsList.FieldByName('COLOR_NAME').AsString));
        RsList.Next;
      end;                    
    end;    
  finally
    SetGrid.Columns.EndUpdate;
  end;
end;

function TframeBaseReport.GetUsedGodsMulti: Boolean;
var
  CfgValue:string;
begin
  result:=False;
  CfgValue:=ShopGlobal.GetParameter('REPORT_GODS_MULTI');
  if trim(CfgValue)='1'  then
    result:=true;
end;

function TframeBaseReport.GetGodsIdsCnd(GodsIds,FieldName: string; CndStr:string): string;
var
  Ids:string;
begin
  result:='';
  Ids:=GodsIds;
  if Pos(',',GodsIds)>0 then //有多个
  begin
    Ids:=StringReplace(Ids,',',''',''',[rfReplaceAll]);
    result:=' '+CndStr+' '+FieldName+' in ('''+Ids+''')';
  end else
    result:=' '+CndStr+' '+FieldName+'='''+GodsIds+''' ';
end;

function TframeBaseReport.CreateAndOpenTable(TabIdx: integer): Boolean;
begin
  case TabIdx of
   1:
    begin
      RsRecvType:=TZQuery.Create(self); //应收账款类型
      RsRecvType.close;
      RsRecvType.SQL.Text:='select CODE_ID,CODE_NAME from PUB_PARAMS where TYPE_CODE=''RECV_TYPE'' ';
      Factor.Open(RsRecvType);
    end;
   2:
    begin
      RsAbleType:=TZQuery.Create(self); //应收账款类型
      RsAbleType.close;
      RsAbleType.SQL.Text:='select CODE_ID,CODE_NAME from PUB_PARAMS where TYPE_CODE=''ABLE_TYPE'' ';
      Factor.Open(RsAbleType);
    end;
  end;
end;

end.
