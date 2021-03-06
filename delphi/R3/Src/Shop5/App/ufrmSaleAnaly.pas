unit ufrmSaleAnaly;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, ActnList, Menus,
  ComCtrls, ToolWin, StdCtrls, RzLabel, jpeg, ExtCtrls, RzTabs, RzPanel, cxEdit, 
  RzButton, cxButtonEdit, zrComboBoxList, cxDropDownEdit, cxCalendar, cxControls,
  cxContainer, cxTextEdit, cxMaskEdit, uframeBaseAnaly, TeEngine,
  Series, TeeProcs, Chart, cxMemo, cxRadioGroup,ZBase, zrMonthEdit,
  cxSpinEdit, ufrmDateControl;

type
  TfrmSaleAnaly = class(TframeBaseAnaly)
    RzLabel2: TRzLabel;
    Label5: TLabel;
    Label7: TLabel;
    fndP1_TYPE_ID: TcxComboBox;
    fndP1_SHOP_TYPE: TcxComboBox;
    P1_D1: TcxDateEdit;
    RzLabel3: TRzLabel;
    fndP1_SHOP_VALUE: TzrComboBoxList;
    fndP1_STAT_ID: TzrComboBoxList;
    P1_D2: TcxDateEdit;
    Label6: TLabel;
    Label31: TLabel;
    fndP1_GODS_ID: TzrComboBoxList;
    fndP1_SORT_ID: TcxButtonEdit;
    btnOk: TRzBitBtn;
    Pnl_Mm: TRzPanel;
    Pnl_Char: TRzPanel;
    Chart1: TChart;
    BarSeries1: TBarSeries;
    AnalyInfo: TcxMemo;
    RzTool: TRzPanel;
    RzPanel9: TRzPanel;
    RB_hour: TcxRadioButton;
    RB_week: TcxRadioButton;
    Label1: TLabel;
    RzPanel6: TRzPanel;
    RB_all: TcxRadioButton;
    RB_sale: TcxRadioButton;
    RB_batch: TcxRadioButton;
    Label3: TLabel;
    Label2: TLabel;
    Label32: TLabel;
    fndP1_DEPT_ID: TzrComboBoxList;
    fndP1_Sale_UNIT: TcxComboBox;
    Label4: TLabel;
    AnalyQry1: TZQuery;
    TabSheet2: TRzTabSheet;
    TabSheet3: TRzTabSheet;
    RzPanel1: TRzPanel;
    Panel1: TPanel;
    RzPnl2: TRzPanel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    fndP2_TYPE_ID: TcxComboBox;
    fndP2_SHOP_TYPE: TcxComboBox;
    fndP2_SHOP_VALUE: TzrComboBoxList;
    fndP2_STAT_ID: TzrComboBoxList;
    fndP2_SORT_ID: TcxButtonEdit;
    RzBitBtn1: TRzBitBtn;
    RzPanel10: TRzPanel;
    P2_RB_Money: TcxRadioButton;
    P2_RB_PRF: TcxRadioButton;
    fndP2_DEPT_ID: TzrComboBoxList;
    RzLabel1: TRzLabel;
    P2_D1: TcxDateEdit;
    RzLabel4: TRzLabel;
    P2_D2: TcxDateEdit;
    adoReport2: TZQuery;
    dsadoReport2: TDataSource;
    P2_RB_AMT: TcxRadioButton;
    RzPanel11: TRzPanel;
    Panel2: TPanel;
    RzPnl3: TRzPanel;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    fndP3_TYPE_ID: TcxComboBox;
    fndP3_SHOP_TYPE: TcxComboBox;
    fndP3_SHOP_VALUE: TzrComboBoxList;
    fndP3_STAT_ID: TzrComboBoxList;
    fndP3_SORT_ID: TcxButtonEdit;
    RzBitBtn2: TRzBitBtn;
    fndP3_DEPT_ID: TzrComboBoxList;
    P3_D1: TcxDateEdit;
    P3_D2: TcxDateEdit;
    adoReport3: TZQuery;
    dsadoReport3: TDataSource;
    Label11: TLabel;
    RzPanel8: TRzPanel;
    RB_SaleMoney: TcxRadioButton;
    RB_SaleMount: TcxRadioButton;
    RB_PRF: TcxRadioButton;
    CB_Color: TCheckBox;
    EdtvType: TcxComboBox;
    PnlSB2: TRzPanel;
    PnlS: TRzPanel;
    PnlSB3: TRzPanel;
    PnlSB: TRzPanel;
    SB2: TScrollBox;
    SB3: TScrollBox;
    Label17: TLabel;
    fndP2UNIT_ID: TcxComboBox;
    Label19: TLabel;
    fndP3UNIT_ID: TcxComboBox;
    Label20: TLabel;
    edtMoneyUnit: TcxComboBox;
    P1_DateControl: TfrmDateControl;
    P3_DateControl: TfrmDateControl;
    P2_DateControl: TfrmDateControl;
    Label21: TLabel;
    fndP2_SHOP_ID: TzrComboBoxList;
    Label22: TLabel;
    fndP3_SHOP_ID: TzrComboBoxList;
    Label23: TLabel;
    fndP1_SHOP_ID: TzrComboBoxList;
    procedure fndP1_SORT_IDKeyPress(Sender: TObject; var Key: Char);
    procedure fndP1_SORT_IDPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure RzPanel7Resize(Sender: TObject);
    procedure actFindExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RB_SaleMoneyClick(Sender: TObject);
    procedure fndP1_Sale_UNITPropertiesChange(Sender: TObject);
    procedure fndP2_SORT_IDKeyPress(Sender: TObject; var Key: Char);
    procedure fndP3_SORT_IDKeyPress(Sender: TObject; var Key: Char);
    procedure CB_ColorClick(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actPreviewExecute(Sender: TObject);
    procedure P2_RB_MoneyClick(Sender: TObject);
    procedure P2_RB_PRFClick(Sender: TObject);
    procedure P2_RB_AMTClick(Sender: TObject);
    procedure fndP3_SORT_IDPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure fndP2_SORT_IDPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    SORT_IDS: string;  //商品分类IDS
    SortName: string;  //商品分类名称
    sid1,sid2,sid3: string;        //商品分类ID
    srid1,srid2,srid3: string;     //商品供应链关系ID
    function  FormateStr(const InStr, Format: string): string;
    procedure AddFillChat1;
    function  GetMarketAnalySQL(vType: integer=0): string; //营销分析
    function  GetProfitAnalySQL(vType: integer=0): string; //盈利分析
    function  GetPotenAnalySQL(vType: integer=0): string;  //潜力分析
    procedure FreeFrameObj(vType: integer); //释放掉Frame对象
    procedure AddUnitItemList(SetUnitID: TcxComboBox; SetType: integer);
  public
    procedure SingleReportParams(ParameStr: string='');override; //简单报表调用参数
    procedure ShowFrameProfitAnaly; //盈利分析
    procedure ShowFramePotenAnaly;  //潜力分析
  end;

var
  frmSaleAnaly: TfrmSaleAnaly;

implementation

uses                                                   
  uGlobal,uFnUtil,uShopUtil, ObjCommon,ufrmProfitAnaly,ufrmPotenAnaly,
  uShopGlobal;

{$R *.dfm}

procedure TfrmSaleAnaly.fndP1_SORT_IDKeyPress(Sender: TObject; var Key: Char);
begin
  sid1 := '';
  srid1 := '';
  fndP1_SORT_ID.Text := '';
end;

procedure TfrmSaleAnaly.fndP1_SORT_IDPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if SelectGoodSortType(sid1,srid1,SortName) then
    fndP1_SORT_ID.Text:=SortName;
end;

procedure TfrmSaleAnaly.fndP2_SORT_IDPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  if SelectGoodSortType(sid2,srid2,SortName) then
    fndP2_SORT_ID.Text:=SortName;
end;

procedure TfrmSaleAnaly.fndP3_SORT_IDPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  if SelectGoodSortType(sid3,srid3,SortName) then
    fndP3_SORT_ID.Text:=SortName;
end;

procedure TfrmSaleAnaly.RzPanel7Resize(Sender: TObject);
begin
  inherited;
  Pnl_Char.Height:=Round((RzPanel7.Height-RzTool.Height) div 2);
end;

procedure TfrmSaleAnaly.actFindExecute(Sender: TObject);
var
  strSql: string;
begin
  if RzPage.ActivePage=TabSheet1 then
  begin //经营状况
    if adoReport1.Active then adoReport1.Close;
    strSql := GetMarketAnalySQL;
    if strSql='' then Exit;
    adoReport1.SQL.Text:= strSql;
    Factor.Open(adoReport1);
    AddFillChat1;
  end else
  if RzPage.ActivePage=TabSheet2 then
  begin //按潜力分析
    if adoReport2.Active then adoReport2.Close;
    strSql := GetProfitAnalySQL;
    if strSql='' then Exit;
    adoReport2.SQL.Text:= strSql;
    Factor.Open(adoReport2);
    ShowFrameProfitAnaly;
  end else
  if RzPage.ActivePage=TabSheet3 then
  begin //按盈利分析
    if adoReport3.Active then adoReport3.Close;
    strSql := self.GetPotenAnalySQL;
    if strSql='' then Exit;
    adoReport3.SQL.Text:= strSql;
    Factor.Open(adoReport3);
    ShowFramePotenAnaly;
  end;
end;

function TfrmSaleAnaly.GetMarketAnalySQL(vType: integer=0): string;
var
  TYPE_ID,SaleCnd,JoinStr,SALE_DATE_GODS: string;  //单位计算关系
  strSql,strWhere,GoodTab,SQLData: string;
begin
  if P1_D1.EditValue=null then Raise Exception.Create('开始日期不能为空！');
  if P1_D2.EditValue=null then Raise Exception.Create('截止日期不能为空！');
  SaleCnd:='';
  strWhere:='';

  //企业ID过滤
  SaleCnd:=' where TENANT_ID='+InttoStr(Global.TENANT_ID)+' ';
  //销售日期条件
  if P1_D1.Date=P1_D2.Date then
    SaleCnd:=SaleCnd+' and SALES_DATE='+FormatDatetime('YYYYMMDD',P1_D1.Date)+' '
  else if P1_D1.Date<P1_D2.Date then
    SaleCnd:=SaleCnd+' and SALES_DATE>='+FormatDatetime('YYYYMMDD',P1_D1.Date)+' and SALES_DATE<='+FormatDatetime('YYYYMMDD',P1_D2.Date)+' ';
  //部门条件
  if fndP1_DEPT_ID.AsString<>'' then
    SaleCnd:=SaleCnd+ShopGlobal.GetDeptID('DEPT_ID',fndP1_DEPT_ID.AsString);
  //门店条件:
  if fndP1_SHOP_ID.AsString<>'' then
    SaleCnd:=SaleCnd+' and SHOP_ID='''+fndP1_SHOP_ID.AsString+''' ';
  
  //单据类型:
  if RB_sale.Checked then
    SaleCnd:=SaleCnd+' and SALES_TYPE=4 '
  else if RB_batch.Checked then
    SaleCnd:=SaleCnd+' and SALES_TYPE=1 ';
  //商品名称:
  if trim(fndP1_GODS_ID.AsString)<>'' then
    SaleCnd:=SaleCnd+' and GODS_ID='''+fndP1_GODS_ID.AsString+''' ';

  if RB_hour.Checked then  //按小时间
    TYPE_ID:=ConStr('CREA_DATE','12','2')+' as TYPE_ID,'
  else if RB_week.Checked then //按星期
    TYPE_ID:=GetWeekID('SALES_DATE')+' as TYPE_ID,'; 

  //门店所属行政区域|门店类型:
  if (fndP1_SHOP_VALUE.AsString<>'') then
  begin
    case fndP1_SHOP_TYPE.ItemIndex of
      0:
       begin
         if FnString.TrimRight(trim(fndP1_SHOP_VALUE.AsString),2)='00' then //非末级区域
           strWhere:=strWhere+' and B.REGION_ID like '''+GetRegionId(fndP1_SHOP_VALUE.AsString)+'%'' '
         else
           strWhere:=strWhere+' and B.REGION_ID='''+fndP1_SHOP_VALUE.AsString+''' ';
       end;
      1: strWhere:=strWhere+' and B.SHOP_TYPE='''+fndP1_SHOP_VALUE.AsString+''' ';
    end;
  end;

  //商品指标:
  if (fndP1_STAT_ID.AsString <> '') and (fndP1_TYPE_ID.ItemIndex>=0) then
  begin
    if fndP1_STAT_ID.AsString <> '#' then
      strWhere:=strWhere+' and C.SORT_ID'+GetGodsSTAT_ID(fndP1_TYPE_ID)+'='''+fndP1_STAT_ID.AsString+''' ';
  end;

  //商品分类:
  if (trim(fndP1_SORT_ID.Text)<>'') and (trim(srid1)<>'') then
  begin
    GoodTab:='VIW_GOODSPRICE_SORTEXT';
    case Factor.iDbType of
     4: strWhere:=strWhere+' and C.RELATION_ID='+srid1+' ';
     else
        strWhere:=strWhere+' and C.RELATION_ID='''+srid1+''' ';
    end;
    if trim(sid1)<>'' then
      strWhere := strWhere+' and C.LEVEL_ID like '''+sid1+'%'' ';
  end else
    GoodTab:='VIW_GOODSPRICE';

  if vType=0 then //返回查询语句   
  begin
    //销售SQL
    SQLData:='select TENANT_ID,SHOP_ID,'+TYPE_ID+'GODS_ID,CALC_AMOUNT as SALE_AMT,(CALC_MONEY+AGIO_MONEY) as SALE_RTL,(NOTAX_MONEY-COST_MONEY) as SALE_PRF  from VIW_SALESDATA '+SaleCnd+' '+ShopGlobal.GetDataRight('SHOP_ID',1);
    strSql :=
      'SELECT A.TYPE_ID,sum(SALE_AMT) as SALE_AMT,sum(SALE_RTL) as SALE_RTL,sum(SALE_PRF) as SALE_PRF from '+ //销售额
      ' ('+SQLData+')A,CA_SHOP_INFO B,'+GoodTab+' C '+
      ' where A.TENANT_ID=B.TENANT_ID and A.SHOP_ID=B.SHOP_ID and A.TENANT_ID=C.TENANT_ID and A.SHOP_ID=C.SHOP_ID and A.GODS_ID=C.GODS_ID '+ strWhere + ' '+
      'group by A.TYPE_ID'; 
    Result :=  ParseSQL(Factor.iDbType,strSql);
  end else
  if vType=1 then
  begin
    JoinStr:=GetStrJoin(Factor.iDbType);
    case Factor.iDbType of
     0: SALE_DATE_GODS:='convert(varchar(8),A.SALES_DATE) '+JoinStr+' ''#'' '+JoinStr+' A.GODS_ID'; 
     1: SALE_DATE_GODS:='to_char(A.SALES_DATE) '+JoinStr+' ''#'' '+JoinStr+' A.GODS_ID';
     4: SALE_DATE_GODS:='ltrim(rtrim(char(A.SALES_DATE))) '+JoinStr+' ''#'' '+JoinStr+' A.GODS_ID';
     5: SALE_DATE_GODS:='cast(A.SALES_DATE as varchar(8))'+JoinStr+'''#'''+JoinStr+'A.GODS_ID';
     else
        SALE_DATE_GODS:='cast(A.SALES_DATE as varchar(8))'+JoinStr+'''#'''+JoinStr+'A.GODS_ID';
    end;

    //返回总单数
    strSql :=
      'select sum(A.SALE_RTL) as SALE_RTL,count(distinct A.SALES_ID) as BILLCOUNT,count(distinct A.SALES_DATE) as DayCOUNT,count(distinct A.GODS_ID) as PXCOUNT,'+
      ' count(distinct '+SALE_DATE_GODS+') as SALE_DATE_GODS_Count,count(distinct A.SALES_ID'+JoinStr+'''#'''+JoinStr+'A.GODS_ID) as SALE_ID_GODS_COUNT,0 as GODSCOUNT,0 as STORG_COUNT from '+
      ' (select TENANT_ID,SHOP_ID,SALES_ID,SALES_DATE,GODS_ID,(CALC_MONEY+AGIO_MONEY) as SALE_RTL from VIW_SALESDATA '+SaleCnd+' '+ShopGlobal.GetDataRight('SHOP_ID',1)+')A,CA_SHOP_INFO B,'+GoodTab+' C '+
      ' where A.TENANT_ID=B.TENANT_ID and A.SHOP_ID=B.SHOP_ID and A.TENANT_ID=C.TENANT_ID and A.GODS_ID=C.GODS_ID '+ strWhere +'  ';
    Result :=  ParseSQL(Factor.iDbType,strSql);
  end else
  if vType=2 then
  begin
    strSql :=
      'select count(distinct A.GODS_ID) as STORGCOUNT from STO_STORAGE A,CA_SHOP_INFO B,'+GoodTab+' C '+
      ' where A.TENANT_ID=B.TENANT_ID and A.SHOP_ID=B.SHOP_ID and A.TENANT_ID=C.TENANT_ID and A.GODS_ID=C.GODS_ID '+
      ' '+strWhere +' '+ShopGlobal.GetDataRight('A.SHOP_ID',1);
    Result :=  ParseSQL(Factor.iDbType,strSql);
  end;
end;


procedure TfrmSaleAnaly.AddFillChat1;
 Function GetPUBGodsCount: integer;
 var Rs: TZQuery;
 begin
   Rs:=Global.GetZQueryFromName('PUB_GOODSINFO');
   Rs.Filtered:=False;
   result:=Rs.RecordCount;
 end;
 Function GetStoreGodsCount: Integer;
 var Qry: TZQuery;
 begin
   try
     Qry:=TZQuery.Create(nil);
     Qry.Close;
     Qry.SQL.Text:=GetMarketAnalySQL(2);
     Factor.Open(Qry);
     result:=Qry.Fields[0].AsInteger;
   finally
     Qry.Free;
   end;
 end;
 procedure GetWhileMinMaxValue(const Rs: TZQuery; var vMin,vMax: integer);
 var MaxValue,MinValue: string;
 begin
   vMin:=0;
   vMax:=0;
   try
     Rs.First;
     MaxValue:=trim(Rs.fieldbyName('TYPE_ID').AsString);
     MinValue:=trim(Rs.fieldbyName('TYPE_ID').AsString);
     Rs.Next;
     while not Rs.Eof do
     begin
       if MinValue>trim(Rs.fieldbyName('TYPE_ID').AsString) then
         MinValue:=trim(Rs.fieldbyName('TYPE_ID').AsString);
       if MaxValue<trim(Rs.fieldbyName('TYPE_ID').AsString) then
         MaxValue:=trim(Rs.fieldbyName('TYPE_ID').AsString);
       Rs.Next;
     end;
     vMin:=StrtoInt(MinValue);
     vMax:=StrtoInt(MaxValue);
   finally
     Rs.First;
   end;
 end;
var
  CalcCount: Real;
  i,MaxLines,vMin,vMax: integer;
  xPoint,InStr,LefStr,MaxStr,TitleStr,MnyUnit: string;
  LStrList,RStrList,StrList: TStringList;
begin
  MnyUnit:=trim(fndP1_Sale_UNIT.Text);
  if fndP1_Sale_UNIT.ItemIndex=0 then CalcCount:=1.000 else CalcCount:=10000.000;
  Chart1.Series[0].Clear;
  AnalyInfo.Clear;
  if adoReport1.IsEmpty then Exit;
  GetWhileMinMaxValue(adoReport1,vMin,vMax);
  if RB_hour.Checked then
  begin
    for i:=vMin to vMax do   //只插入有数值段
    begin
      xPoint:=FormatFloat('00',i);
      if adoReport1.Locate('TYPE_ID',xPoint,[]) then
      begin
        if RB_SaleMount.Checked then
          Chart1.Series[0].Add(adoReport1.Fields[1].asFloat,xPoint+'时')
        else if RB_SaleMoney.Checked then
          Chart1.Series[0].Add(adoReport1.Fields[2].asFloat/CalcCount,xPoint+'时') 
        else
          Chart1.Series[0].Add(adoReport1.Fields[3].asFloat/CalcCount,xPoint+'时');
      end else
        Chart1.Series[0].Add(0,xPoint+'时');
    end;
  end else
  begin
    for i:=vMin to vMax do
    begin
      xPoint:=GetWeekName(i,'星期');
      if adoReport1.Locate('TYPE_ID',inttostr(i),[]) then
      begin   
        if RB_SaleMount.Checked then
          Chart1.Series[0].Add(adoReport1.Fields[1].asFloat,xPoint)
        else if RB_SaleMoney.Checked then
          Chart1.Series[0].Add(adoReport1.Fields[2].asFloat/CalcCount,xPoint)
        else
          Chart1.Series[0].Add(adoReport1.Fields[3].asFloat/CalcCount,xPoint);
      end else
        Chart1.Series[0].Add(0,xPoint);
    end;
  end;
  //Add Memo
  try
    //DayCount:=P1_D2.Date-P1_D1.Date;  //统计总天数
    LStrList:=TStringList.Create;
    RStrList:=TStringList.Create;
    StrList:=TStringList.Create;
    //添加
    LStrList.Clear;
    if RB_hour.Checked then   //时段
      LStrList.Add('          时段              销量              销售额            毛利              ')
    else
      LStrList.Add('          星期              销量              销售额            毛利              ');
                            
    //添加左侧的List
    if RB_hour.Checked then
    begin
      for i:=0 to 23 do
      begin
        xPoint:=FormatFloat('00',i);
        if adoReport1.Locate('TYPE_ID',xPoint,[]) then
        begin
          LStrList.Add('          '+FormateStr(xPoint+'时','                  ')
                                   +FormateStr(FormatFloat('#0.##',adoReport1.Fields[1].AsFloat),'                  ')
                                   +FormateStr(FormatFloat('#,##0.00',adoReport1.Fields[2].AsFloat/CalcCount)+MnyUnit,'                  ')
                                   +FormateStr(FormatFloat('#,##0.00',adoReport1.Fields[3].AsFloat/CalcCount)+MnyUnit,'              '));
        end else
        begin
          LStrList.Add('          '+FormateStr(xPoint+'时','                  ')
                                   +FormateStr('0','                  ')
                                   +FormateStr('0'+MnyUnit,'                  ')
                                   +FormateStr('0'+MnyUnit,'              '));
        end;
      end;
    end else
    begin
      for i:=0 to 6 do
      begin
        xPoint:=GetWeekName(i,'星期');
        if adoReport1.Locate('TYPE_ID',inttostr(i),[]) then
        begin
          LStrList.Add('          '+FormateStr(xPoint,'                  ')
                                   +FormateStr(FormatFloat('#0.##',adoReport1.Fields[1].asFloat),'                  ')
                                   +FormateStr(FormatFloat('#,##0.00',adoReport1.Fields[2].AsFloat/CalcCount)+MnyUnit,'                  ')
                                   +FormateStr(FormatFloat('#,##0.00',adoReport1.Fields[3].AsFloat/CalcCount)+MnyUnit,'              '));
        end else
        begin
          LStrList.Add('          '+FormateStr(xPoint,'                  ')
                                   +FormateStr('0','                  ')
                                   +FormateStr('0'+MnyUnit,'                  ')
                                   +FormateStr('0'+MnyUnit,'              '));
        end;
      end;
    end;

    //添加右侧
    AnalyQry1.Close;
    AnalyQry1.SQL.Text:=GetMarketAnalySQL(1);
    Factor.Open(AnalyQry1);
    AnalyQry1.Edit;
    AnalyQry1.FieldByName('GODSCOUNT').AsInteger:=GetPUBGodsCount;
    AnalyQry1.FieldByName('STORG_COUNT').AsInteger:=GetStoreGodsCount;
    AnalyQry1.Post;

    RStrList.Clear;
    // RStrList.Add('营业情况('+formatDatetime('YYYY-MM-DD',P1_D1.Date)+'至'+formatDatetime('YYYY-MM-DD',P1_D2.Date)+')');
    // RStrList.Add('');
    RStrList.Add('营业额:'+formatFloat('#,##0.00',AnalyQry1.Fields[0].asFloat/CalcCount)+MnyUnit);
    RStrList.Add('--------------------------------');
    if AnalyQry1.Fields[2].asInteger<>0 then
      RStrList.Add('日均营业额:'+formatFloat('#,##0.00',AnalyQry1.Fields[0].asFloat/(AnalyQry1.Fields[2].asInteger*CalcCount))+MnyUnit)
    else
      RStrList.Add('日均营业额:'+'0'+MnyUnit);
    RStrList.Add('--------------------------------');
    RStrList.Add('客单数:'+inttostr(AnalyQry1.Fields[1].asInteger)+'人次');
    RStrList.Add('--------------------------------');
    if AnalyQry1.Fields[2].asInteger<>0 then
      RStrList.Add('日均客单数:'+formatFloat('#0',AnalyQry1.Fields[1].asInteger/AnalyQry1.Fields[2].asInteger)+'人次')
    else
      RStrList.Add('日均客单数:'+'0人次');
    RStrList.Add('--------------------------------');
    RStrList.Add('品项数:'+inttostr(AnalyQry1.Fields[3].asInteger)+'个');
    RStrList.Add('--------------------------------');
    if AnalyQry1.Fields[2].asInteger<>0 then
      RStrList.Add('日均品项数:'+formatFloat('#0',AnalyQry1.Fields[4].asInteger/AnalyQry1.Fields[2].asInteger)+'个')
    else
      RStrList.Add('日均品项数:'+'0人次');
    RStrList.Add('--------------------------------');
    if AnalyQry1.Fields[1].asInteger<>0 then
      RStrList.Add('单客消费:'+formatFloat('#0',AnalyQry1.Fields[0].AsFloat/AnalyQry1.Fields[1].asInteger)+'元/人')
    else
      RStrList.Add('单客消费:'+'0元/人');
    RStrList.Add('--------------------------------');
    if AnalyQry1.Fields[1].asInteger<>0 then
      RStrList.Add('单客品项:'+formatFloat('#0',AnalyQry1.Fields[5].asInteger/AnalyQry1.Fields[1].asInteger)+'个/人')
    else
      RStrList.Add('单客品项:'+'0个/人');

    RStrList.Add('--------------------------------');
    RStrList.Add('经营品种数(现):'+formatFloat('#0',AnalyQry1.Fields[6].asInteger)+'种');
    RStrList.Add('--------------------------------');
    RStrList.Add('有效品种数:'+formatFloat('#0',AnalyQry1.Fields[7].asInteger)+'种');
    RStrList.Add('--------------------------------');
    if AnalyQry1.Fields[6].asInteger<>0 then
      RStrList.Add('有效品种率:'+formatFloat('#0.00',AnalyQry1.Fields[7].asInteger*100/AnalyQry1.Fields[6].asInteger)+'%')
    else
      RStrList.Add('有效品种率:'+formatFloat('#0.00',0)+'%');

    AnalyInfo.Lines.CommaText:=RStrList.CommaText;

    if LStrList.Count>RStrList.Count then MaxLines:= LStrList.Count
    else MaxLines:= RStrList.Count;

    //添加AnalyInfo
    StrList.Clear;
    for i:=0 to MaxLines do //循环
    begin
      LefStr:='';
      if i< LStrList.Count then LefStr:=LStrList.Strings[i];
      LefStr:=FormateStr(LefStr,'                                                                                                   ');

      if i< RStrList.Count then
        LefStr:=LefStr+RStrList.Strings[i]
      else
        LefStr:=LefStr;
      StrList.Add(LefStr);
    end;
    AnalyInfo.Clear;
    AnalyInfo.Lines.CommaText:=StrList.CommaText;
  finally
    LStrList.Free;
    RStrList.Free;
    StrList.Free;
  end;
end;

procedure TfrmSaleAnaly.FormCreate(Sender: TObject);
begin
  inherited;
  P1_D1.Date:=fnTime.fnStrtoDate(FormatDateTime('YYYY-MM-01', date));
  P1_D2.Date:=fnTime.fnStrtoDate(FormatDateTime('YYYY-MM-DD', date));
  P1_DateControl.StartDateControl := P1_D1;
  P1_DateControl.EndDateControl := P1_D2;
  fndP1_Sale_UNIT.ItemIndex:=0;   
  P2_D1.Date:=fnTime.fnStrtoDate(FormatDateTime('YYYY-MM-01', date));
  P2_D2.Date:=fnTime.fnStrtoDate(FormatDateTime('YYYY-MM-DD', date));
  P2_DateControl.StartDateControl := P2_D1;
  P2_DateControl.EndDateControl := P2_D2;
  P3_D1.Date:=fnTime.fnStrtoDate(FormatDateTime('YYYY-MM-01', date));
  P3_D2.Date:=fnTime.fnStrtoDate(FormatDateTime('YYYY-MM-DD', date));
  P3_DateControl.StartDateControl := P3_D1;
  P3_DateControl.EndDateControl := P3_D2;

  //默认第一分页
  if TabSheet2.TabVisible then
    RzPage.ActivePage:=TabSheet2
  else if TabSheet3.TabVisible then
    RzPage.ActivePage:=TabSheet3
  else if TabSheet1.TabVisible then
    RzPage.ActivePage:=TabSheet1;
  EdtvType.ItemIndex:=0;
  edtMoneyUnit.ItemIndex:=0;
  fndP2UNIT_ID.ItemIndex:=0;
  AddUnitItemList(fndP2UNIT_ID, 2);
  AddTongjiUnitList(fndP3UNIT_ID);
  SORT_IDS:=',SORT_ID1,SORT_ID2,SORT_ID3,SORT_ID4,SORT_ID5,SORT_ID6,SORT_ID7,SORT_ID8,SORT_ID9,SORT_ID10'+
            ',SORT_ID11,SORT_ID12,SORT_ID13,SORT_ID14,SORT_ID15,SORT_ID16,SORT_ID17,SORT_ID18,SORT_ID19,SORT_ID20';
end;

procedure TfrmSaleAnaly.RB_SaleMoneyClick(Sender: TObject);
begin
  inherited;
  fndP1_Sale_UNIT.Enabled:=((RB_SaleMoney.Checked) or (RB_PRF.Checked));
  AddFillChat1;
end;

procedure TfrmSaleAnaly.fndP1_Sale_UNITPropertiesChange(Sender: TObject);
begin
  inherited;
  AddFillChat1;
end;

function TfrmSaleAnaly.FormateStr(const InStr, Format: string): string;
var
  i,vLen: Integer;
begin
  vLen:=Length(Format)-Length(InStr);
  result:=InStr+StringOfChar(' ', vLen);
end;

function TfrmSaleAnaly.GetProfitAnalySQL(vType: integer): string; //盈利分析
var
  TYPE_ID,SaleCnd,JoinStr,UnitID,UnitName,GroupUnitName: string;  //单位计算关系
  strSql,strWhere,GoodTab,SQLData,UnitFields: string;
begin
  if P2_D1.EditValue=null then Raise Exception.Create('开始日期不能为空！');
  if P2_D2.EditValue=null then Raise Exception.Create('截止日期不能为空！');
  SaleCnd:='';
  strWhere:='';
  if P2_RB_AMT.Checked then //销量
  begin
    UnitID:='/C.UNIT_CALC';  //+GetUnitTO_CALC(fndP1UNIT_ID.ItemIndex,'C');
    UnitName:='C.UNITID';    //GetUnitID(fndP1UNIT_ID.ItemIndex,'C');
    GroupUnitName:=',C.UNITID';
    UnitFields:=',(case when '+GetUnitTO_CALC(fndP2UNIT_ID.ItemIndex,'')+'=0 then 1.000 '+
                      ' else '+GetUnitTO_CALC(fndP2UNIT_ID.ItemIndex,'')+' end) as UNIT_CALC '+
                ',('+GetUnitID(fndP2UNIT_ID.ItemIndex,'')+')as UNITID ';
  end else
  begin
    if fndP2UNIT_ID.ItemIndex=0 then
    begin
      UnitID:='';
      UnitName:='''元''';
    end else
    begin
      UnitID:='/10000.00';
      UnitName:='''万元''';
    end;
    case Factor.iDbType of
     0: GroupUnitName:='';
     else
        GroupUnitName:=','+UnitName;
    end;
  end;

  //企业ID过滤
  SaleCnd:=' and A.TENANT_ID='+InttoStr(Global.TENANT_ID)+' ';
  //销售日期条件
  if P2_D1.Date=P2_D2.Date then
    SaleCnd:=SaleCnd+' and A.SALES_DATE='+FormatDatetime('YYYYMMDD',P2_D1.Date)+' '
  else if P2_D1.Date<P2_D2.Date then
    SaleCnd:=SaleCnd+' and A.SALES_DATE>='+FormatDatetime('YYYYMMDD',P2_D1.Date)+' and A.SALES_DATE<='+FormatDatetime('YYYYMMDD',P2_D2.Date)+' ';
  //部门条件
  if fndP2_DEPT_ID.AsString<>'' then
    SaleCnd:=SaleCnd+ShopGlobal.GetDeptID('A.DEPT_ID',fndP2_DEPT_ID.AsString);  
  //门店所属行政区域|门店类型:
  if (fndP2_SHOP_VALUE.AsString<>'') then
  begin
    case fndP2_SHOP_TYPE.ItemIndex of
      0:
       begin
         if FnString.TrimRight(trim(fndP2_SHOP_VALUE.AsString),2)='00' then //非末级区域
           strWhere:=strWhere+' and B.REGION_ID like '''+GetRegionId(fndP2_SHOP_VALUE.AsString)+'%'' '
         else
           strWhere:=strWhere+' and B.REGION_ID='''+fndP2_SHOP_VALUE.AsString+''' ';
       end;
      1: strWhere:=strWhere+' and B.SHOP_TYPE='''+fndP2_SHOP_VALUE.AsString+''' ';
    end;
  end;
  //门店条件:
  if trim(fndP2_SHOP_ID.AsString)<>'' then
    strWhere:=strWhere+' and A.SHOP_ID='''+fndP2_SHOP_ID.AsString+''' ';
  
  //商品指标:
  if (fndP2_STAT_ID.AsString <> '') and (fndP2_TYPE_ID.ItemIndex>=0) then
  begin
    if fndP2_STAT_ID.AsString <> '#' then 
      strWhere:=strWhere+' and C.SORT_ID'+GetGodsSTAT_ID(fndP2_TYPE_ID)+'='''+fndP2_STAT_ID.AsString+''' ';
  end;

  //商品分类:
  if (trim(fndP2_SORT_ID.Text)<>'') and (trim(srid2)<>'') then
  begin
    GoodTab:='(select TENANT_ID,RELATION_ID,LEVEL_ID,GODS_ID,GODS_CODE,GODS_NAME'+SORT_IDS+UnitFields+' from VIW_GOODSINFO_SORTEXT where TENANT_ID='+InttoStr(Global.TENANT_ID)+')';
    case Factor.iDbType of
     4: strWhere:=strWhere+' and C.RELATION_ID='+srid2+' ';
     else
        strWhere:=strWhere+' and C.RELATION_ID='''+srid2+''' ';
    end;
    if trim(sid2)<>'' then
      strWhere := strWhere+' and C.LEVEL_ID like '''+sid2+'%'' ';
  end else
    GoodTab:='(select TENANT_ID,RELATION_ID,GODS_ID,GODS_CODE,GODS_NAME'+SORT_IDS+UnitFields+' from VIW_GOODSINFO where TENANT_ID='+InttoStr(Global.TENANT_ID)+')';

  if P2_RB_Money.Checked then  //销售额
    TYPE_ID:='(isnull(CALC_MONEY,0)+isnull(AGIO_MONEY,0))'
  else if P2_RB_PRF.Checked then //毛利
    TYPE_ID:='(isnull(NOTAX_MONEY,0)-isnull(COST_MONEY,0))'
  else if P2_RB_AMT.Checked then //销量
    TYPE_ID:='isnull(CALC_AMOUNT,0)';

  if P2_RB_AMT.Checked then //销量
  begin
    strSql :=
      'select tmp.*,unit.UNIT_NAME as UNIT_NAME from '+
      '(SELECT A.TENANT_ID as TENANT_ID,C.RELATION_ID as RELATION_ID,C.GODS_CODE as GODS_CODE,C.GODS_NAME as GODS_NAME,'+
       'sum('+TYPE_ID+UnitID+')as ANALYSUM,'+UnitName+' as UNIT_ID from '+
      ' VIW_SALESDATA A,CA_SHOP_INFO B,'+GoodTab+' C '+
      ' where A.TENANT_ID=B.TENANT_ID and A.SHOP_ID=B.SHOP_ID and A.TENANT_ID=C.TENANT_ID and A.GODS_ID=C.GODS_ID '+SaleCnd+
      ' '+strWhere +' '+ShopGlobal.GetDataRight('A.SHOP_ID',1)+
      ' group by A.TENANT_ID,C.RELATION_ID,C.GODS_CODE,C.GODS_NAME'+GroupUnitName+')tmp '+
      ' left outer join VIW_MEAUNITS unit on tmp.TENANT_ID=unit.TENANT_ID and tmp.UNIT_ID=unit.UNIT_ID '+
      'order by RELATION_ID asc,ANALYSUM desc ';
  end else
  begin
    strSql :=
      'select * from '+
      '(SELECT C.RELATION_ID as RELATION_ID,C.GODS_CODE as GODS_CODE,C.GODS_NAME as GODS_NAME,sum('+TYPE_ID+')'+UnitID+' as ANALYSUM,'+UnitName+' as UNIT_NAME from '+
      ' VIW_SALESDATA A,CA_SHOP_INFO B,'+GoodTab+' C '+
      ' where A.TENANT_ID=B.TENANT_ID and A.SHOP_ID=B.SHOP_ID and A.TENANT_ID=C.TENANT_ID and A.GODS_ID=C.GODS_ID '+SaleCnd+
      ' '+strWhere +' '+ShopGlobal.GetDataRight('A.SHOP_ID',1)+
      'group by C.RELATION_ID,C.GODS_CODE,C.GODS_NAME'+GroupUnitName+')tmp '+
      'order by RELATION_ID asc,ANALYSUM desc ';
  end;
  Result := ParseSQL(Factor.iDbType,strSql);
end;

function TfrmSaleAnaly.GetPotenAnalySQL(vType: integer): string;  //潜力分析
  function GetSumField(Qry:TZQuery; SumField1,SumField2: string): string;
  var
    Str,SubStr,MaxValue1,MaxValue2: string;
  begin
    result:='';
    Str:=',(case ';
    if Qry.IsEmpty then
    begin
      SubStr:='(case when ('+SumField1+'<0 and '+SumField2+'<0) then 1 when ('+SumField1+'>=0 and '+SumField2+'>=0) then 4 else 2 end)';
      Str:=Str+' when C.RELATION_ID=0 then '+SubStr+' ';
    end else
    begin
      Qry.First;
      while not Qry.Eof do
      begin
        MaxValue1:=FloatToStr(Qry.fieldbyName('SUM1').AsFloat*0.50);
        MaxValue2:=FloatToStr(Qry.fieldbyName('SUM2').AsFloat*0.50);
        SubStr:='(case when ('+SumField1+'<'+MaxValue1+' and '+SumField2+'<'+MaxValue2+') then 1 when ('+SumField1+'>='+MaxValue1+' and '+SumField2+'>='+MaxValue2+') then 4 else 2 end)';
        Str:=Str+' when C.RELATION_ID='+Qry.fieldbyName('RELATION_ID').AsString+' then '+SubStr+'  ';
        Qry.Next;
      end;
    end;
    Str:=Str+' else 2 end) as vType ';
    result:=Str;    
  end;
var
  Qry: TZQuery;
  SaleCnd,JoinStr,OrderBy,UnitID,AmtUnitID,MnyUnitID: string;  //单位计算关系
  FieldStr,MaxSQL,MaxValue1,MaxValue2: string;
  strSql,strWhere,GoodTab,SQLData,ShopCnd1,ShopCnd2: string;
begin
  result:='';
  SaleCnd:='';
  strWhere:='';
  if P3_D1.EditValue=null then Raise Exception.Create('开始日期不能为空！');
  if P3_D2.EditValue=null then Raise Exception.Create('截止日期不能为空！');
  if edtMoneyUnit.ItemIndex=0 then MnyUnitID:='' else  MnyUnitID:='/10000.0';
  AmtUnitID:='('+GetUnitTO_CALC(fndP3UNIT_ID.ItemIndex,'')+')';
  UnitID:=GetUnitID(fndP3UNIT_ID.ItemIndex,'');

  //企业ID过滤
  SaleCnd:=' and SAL.TENANT_ID='+InttoStr(Global.TENANT_ID)+' ';
  //销售日期条件
  if P3_D1.Date=P3_D2.Date then
    SaleCnd:=SaleCnd+' and SAL.SALES_DATE='+FormatDatetime('YYYYMMDD',P3_D1.Date)+' '
  else if P3_D1.Date<P3_D2.Date then
    SaleCnd:=SaleCnd+' and SAL.SALES_DATE>='+FormatDatetime('YYYYMMDD',P3_D1.Date)+' and SAL.SALES_DATE<='+FormatDatetime('YYYYMMDD',P3_D2.Date)+' ';
  //部门条件
  if fndP3_DEPT_ID.AsString<>'' then
    SaleCnd:=SaleCnd+ShopGlobal.GetDeptID('SAL.DEPT_ID',fndP3_DEPT_ID.AsString);
  //门店所属行政区域|门店类型:
  if (fndP3_SHOP_VALUE.AsString<>'') then
  begin
    case fndP3_SHOP_TYPE.ItemIndex of
      0:
       begin
         if FnString.TrimRight(trim(fndP3_SHOP_VALUE.AsString),2)='00' then //非末级区域
           strWhere:=strWhere+' and B.REGION_ID like '''+GetRegionId(fndP3_SHOP_VALUE.AsString)+'%'' '
         else
           strWhere:=strWhere+' and B.REGION_ID='''+fndP3_SHOP_VALUE.AsString+''' ';
       end;
      1: strWhere:=strWhere+' and B.SHOP_TYPE='''+fndP3_SHOP_VALUE.AsString+''' ';
    end;
  end;
  //商品指标:
  if (fndP3_STAT_ID.AsString <> '') and (fndP3_TYPE_ID.ItemIndex>=0) then
  begin
    if trim(fndP3_STAT_ID.AsString) <> '#' then
      strWhere:=strWhere+' and C.SORT_ID'+GetGodsSTAT_ID(fndP3_TYPE_ID)+'='''+fndP3_STAT_ID.AsString+''' ';
  end;
  //门店条件:
  if fndP3_SHOP_ID.AsString<>'' then
  begin
    ShopCnd1:=' and SAL.SHOP_ID='''+fndP3_SHOP_ID.AsString+''' ';
    ShopCnd2:=' and STO.SHOP_ID='''+fndP3_SHOP_ID.AsString+''' ';
  end;

  //商品分类:
  if (trim(fndP3_SORT_ID.Text)<>'') and (trim(srid3)<>'') then
  begin
    GoodTab:='(select TENANT_ID,RELATION_ID,LEVEL_ID,GODS_ID,GODS_CODE,GODS_NAME'+SORT_IDS+',(case when '+AmtUnitID+'=0 then 1.000 else '+AmtUnitID+' end) as AmtUnitID,'+UnitID+' as UnitID from VIW_GOODSINFO_SORTEXT where TENANT_ID='+InttoStr(Global.TENANT_ID)+')';
    case Factor.iDbType of
     4: strWhere:=strWhere+' and C.RELATION_ID='+srid3+' ';
     else
        strWhere:=strWhere+' and C.RELATION_ID='''+srid3+''' ';
    end;
    if trim(sid3)<>'' then
      strWhere := strWhere+' and C.LEVEL_ID like '''+sid3+'%'' ';
  end else
    GoodTab:='(select TENANT_ID,RELATION_ID,GODS_ID,GODS_CODE,GODS_NAME'+SORT_IDS+',(case when '+AmtUnitID+'=0 then 1.000 else '+AmtUnitID+' end) as AmtUnitID,'+UnitID+' as UnitID from VIW_GOODSINFO where TENANT_ID='+InttoStr(Global.TENANT_ID)+')';

  //分类取出Max(字段)
  case EdtvType.ItemIndex of
   0: FieldStr:=' max(MNY_SUM) as SUM1,max(PRF_SUM) as SUM2 ';   //销售额 毛利
   1: FieldStr:=' max(AMT_SUM) as SUM1,max(PRF_SUM) as SUM2 ';   //销量 、毛利
   2: FieldStr:=' max(AMT_SUM) as SUM1,max(MNY_SUM) as SUM2 ';   //销量 、销售额
  end;
  MaxSQL:=ParseSQL(Factor.iDbType,
    'select RELATION_ID,'+FieldStr+' from '+
    ' (SELECT C.RELATION_ID as RELATION_ID,C.GODS_CODE as GODS_CODE,C.GODS_NAME as GODS_NAME,'+
      'cast(sum(CALC_AMOUNT/C.AmtUnitID) as decimal(18,3)) as AMT_SUM,'+
      'cast((sum(isnull(CALC_MONEY,0)+isnull(AGIO_MONEY,0))'+MnyUnitID+') as decimal(18,3))as MNY_SUM,'+
      'cast((sum(isnull(NOTAX_MONEY,0)-isnull(COST_MONEY,0))'+MnyUnitID+') as decimal(18,3))as PRF_SUM '+
    '  from VIW_SALESDATA SAL,CA_SHOP_INFO B,'+GoodTab+' C '+
    '  where SAL.TENANT_ID=B.TENANT_ID and SAL.SHOP_ID=B.SHOP_ID and SAL.TENANT_ID=C.TENANT_ID and SAL.GODS_ID=C.GODS_ID '+SaleCnd+
    ' '+ strWhere+' '+ShopCnd1+' '+ShopGlobal.GetDataRight('SAL.SHOP_ID',1)+
    '  group by C.RELATION_ID,C.GODS_CODE,C.GODS_NAME)tmp '+
    ' group by RELATION_ID');
    
  //分类取出Max(字段)
  try
    Qry:=TZQuery.Create(nil);
    Qry.SQL.Text:=MaxSQL;
    Factor.Open(Qry);
    if Qry.Active then
    begin
      case EdtvType.ItemIndex of
       0: //销售额 毛利
        begin
          FieldStr:=GetSumField(Qry, 'sum(MNY_SUM'+MnyUnitID+')', 'sum(PRF_SUM'+MnyUnitID+')');
          OrderBy:='order by RELATION_ID asc,vType asc,PRF_SUM desc,MNY_SUM desc,AMT_SUM desc '
        end;
       1: //销售量 毛利
        begin
          FieldStr:=GetSumField(Qry, 'sum(AMT_SUM/C.AmtUnitID)', 'sum(PRF_SUM'+MnyUnitID+')');
          OrderBy:='order by RELATION_ID asc,vType asc,PRF_SUM desc,AMT_SUM desc,MNY_SUM desc'
        end;
       2: //销售量 销售额
        begin
          FieldStr:=GetSumField(Qry, 'sum(AMT_SUM/C.AmtUnitID)', 'sum(MNY_SUM'+MnyUnitID+')');
          OrderBy:='order by RELATION_ID asc,vType asc,MNY_SUM desc,AMT_SUM desc,PRF_SUM desc ';
        end;
      end;
    end;
  finally
    Qry.Free;
  end;

  //销售SQL
  SQLData:=
     'select STO.TENANT_ID,STO.SHOP_ID,STO.GODS_ID,SAL.CALC_AMOUNT as AMT_SUM,'+
     ' (isnull(SAL.CALC_MONEY,0)+isnull(SAL.AGIO_MONEY,0)) as MNY_SUM,'+
     ' (isnull(SAL.NOTAX_MONEY,0)-isnull(SAL.COST_MONEY,0)) as PRF_SUM '+
     ' from STO_STORAGE STO left outer join VIW_SALESDATA SAL '+
     'on STO.TENANT_ID=SAL.TENANT_ID and STO.SHOP_ID=SAL.SHOP_ID and STO.GODS_ID=SAL.GODS_ID '+
     ' where 1=1 '+SaleCnd+' '+ShopCnd2+' '+ShopGlobal.GetDataRight('STO.SHOP_ID',1); //' '+ShopGlobal.GetDataRight('SAL.SHOP_ID',1)

  if Factor.iDbType=0 then
  begin
    strSql :=
      'select tmp.*,unit.UNIT_NAME from '+
      '(SELECT A.TENANT_ID,C.RELATION_ID as RELATION_ID,C.GODS_CODE as GODS_CODE,C.GODS_NAME as GODS_NAME,'+
       'cast(sum(AMT_SUM/C.AmtUnitID) as decimal(18,3)) as AMT_SUM,'+
       'cast(sum(MNY_SUM)'+MnyUnitID+' as decimal(18,3))as MNY_SUM,'+
       'cast(sum(PRF_SUM)'+MnyUnitID+' as decimal(18,3))as PRF_SUM '+FieldStr+',C.UnitID as UNIT_ID '+
      ' from ('+SQLData+')A,CA_SHOP_INFO B,'+GoodTab+' C '+
      ' where A.TENANT_ID=B.TENANT_ID and A.SHOP_ID=B.SHOP_ID and A.TENANT_ID=C.TENANT_ID and '+
      ' A.GODS_ID=C.GODS_ID '+ strWhere + ' '+
      'group by A.TENANT_ID,C.RELATION_ID,C.GODS_CODE,C.GODS_NAME,C.UnitID)tmp '+
      ' left outer join VIW_MEAUNITS unit on tmp.TENANT_ID=unit.TENANT_ID and tmp.UNIT_ID=unit.UNIT_ID '+OrderBy;
  end else
  begin
    strSql :=
      'select tmp.*,unit.UNIT_NAME from '+
      '(SELECT A.TENANT_ID,C.RELATION_ID as RELATION_ID,C.GODS_CODE as GODS_CODE,C.GODS_NAME as GODS_NAME,'+
       'cast(sum(AMT_SUM/C.AmtUnitID) as decimal(18,3)) as AMT_SUM,'+
       'cast(sum(MNY_SUM)'+MnyUnitID+' as decimal(18,3))as MNY_SUM,'+
       'cast(sum(PRF_SUM)'+MnyUnitID+' as decimal(18,3))as PRF_SUM '+FieldStr+',UnitID as UNIT_ID '+
      ' from ('+SQLData+')A,CA_SHOP_INFO B,'+GoodTab+' C '+
      ' where A.TENANT_ID=B.TENANT_ID and A.SHOP_ID=B.SHOP_ID and A.TENANT_ID=C.TENANT_ID and '+
      ' A.GODS_ID=C.GODS_ID '+ strWhere + ' '+
      'group by A.TENANT_ID,C.RELATION_ID,C.GODS_CODE,C.GODS_NAME,C.UnitID)tmp '+
      ' left outer join VIW_MEAUNITS unit on tmp.TENANT_ID=unit.TENANT_ID and tmp.UNIT_ID=unit.UNIT_ID '+OrderBy;
  end;
  Result := ParseSQL(Factor.iDbType,strSql);
end;

procedure TfrmSaleAnaly.FreeFrameObj(vType: integer);
var
  i:integer;
  FindCmp: TComponent;
begin
  for i:=0 to 100 do
  begin
    if vType=1 then
    begin
      FindCmp:=FindComponent('frmProfitAnaly'+Inttostr(i));
      if (FindCmp<>nil) and (TWinControl(FindCmp).Parent=SB2) and (FindCmp is TfrmProfitAnaly)  then
      begin
        TfrmProfitAnaly(FindCmp).Free;
      end;

      FindCmp:=FindComponent('frmProfitAnalysplt'+Inttostr(i));
      if (FindCmp<>nil) and (TWinControl(FindCmp).Parent=SB2) and (FindCmp is TSplitter)  then
      begin
        TSplitter(FindCmp).Free;
      end;
    end else
    if vType=2 then
    begin
      FindCmp:=FindComponent('frmPotenAnaly'+Inttostr(i));
      if (FindCmp<>nil) and (TWinControl(FindCmp).Parent=SB3) and (FindCmp is TfrmPotenAnaly)  then
      begin
        TfrmPotenAnaly(FindCmp).Free;
      end;

      FindCmp:=FindComponent('frmPotenAnalysplt'+Inttostr(i));
      if (FindCmp<>nil) and (TWinControl(FindCmp).Parent=SB3) and (FindCmp is TSplitter)  then
      begin
        TSplitter(FindCmp).Free;
      end;
    end;
  end;
end;

procedure TfrmSaleAnaly.ShowFrameProfitAnaly;
  procedure ShowFrameDetail(Relation_ID, RelCount,vNo: integer; var vHeight: integer);
  var
    Spilt: TSplitter; frmAnaly: TfrmProfitAnaly; AnalyType: integer;
  begin
    if Relation_ID<>1000006 then //不是卷烟都创建分割栏
    begin
      Spilt:=TSplitter.Create(self); 
      Spilt.Name:='frmProfitAnalysplt'+InttoStr(vNo-1);
      Spilt.Parent:=SB2;
      Spilt.Height:=8;
      Spilt.Color:=clwhite;
      Spilt.Align:=alBottom;
      Spilt.Align:=alTop;
    end;
    try
      frmAnaly:=TfrmProfitAnaly.Create(self);
      frmAnaly.Name:='frmProfitAnaly'+InttoStr(vNo);
      frmAnaly.Parent:=SB2;
      frmAnaly.Align:=alBottom;
      frmAnaly.Align:=alTop;
      if P2_RB_Money.Checked then AnalyType:=1
      else if P2_RB_PRF.Checked then AnalyType:=2
      else if P2_RB_AMT.Checked then AnalyType:=3;
      frmAnaly.InitData(AnalyType,Relation_ID,adoReport2.Data);
      if vHeight=0 then vHeight:=frmAnaly.Height;
      if RelCount=1 then //只有一条
      begin
        frmAnaly.Align:=alClient;
      end else
      begin
        if (Relation_ID=1000006) and (RelCount * (frmAnaly.Height+8)-8>SB2.Height) then //第一次运行才进行设置
        begin
          SB2.Top:=0;
          SB2.Left:=0;
          SB2.Height:=(frmAnaly.Height+8)* RelCount-2;
        end else
        if (Relation_ID=1000006) and (RelCount * (frmAnaly.Height+8)-8<=SB2.Height) then //第一次运行才进行设置
        begin
          vHeight:=(SB2.Height-RelCount*8+8) div RelCount-2;
        end;
        frmAnaly.Height:=vHeight;
      end;
    except
      frmAnaly.Free;
    end;
  end;
var
  i,vHeight,vNo: integer;
  RelID: string;
  ReList: TStringList;
begin
  vNo:=1;
  vHeight:=0;
  //创建前释放上次创建
  FreeFrameObj(1);

  //卷烟放在第一栏：
  try
    ReList:=TStringList.Create;
    adoReport2.First;
    while not adoReport2.Eof do
    begin
      RelID:=trim(adoReport2.fieldbyName('RELATION_ID').AsString);
      if RelID<>'1000006' then
      begin
        if ReList.IndexOf(RelID)=-1 then
          ReList.Add(RelID);
      end;
      adoReport2.Next;
    end;
    //卷烟供应链:
    ShowFrameDetail(1000006, ReList.Count+1,vNo,vHeight);

    //非卷烟供应链
    for i:=0 to ReList.Count-1 do
    begin
      RelID:=trim(ReList.Strings[i]);
      if RelID = '1000006' then continue;
      Inc(vNo); //序号+1
      ShowFrameDetail(StrtoInt(RelID), ReList.Count+1, vNo,vHeight);
    end;
  finally
    ReList.Free;
  end;
end;

procedure TfrmSaleAnaly.ShowFramePotenAnaly;
  procedure ShowFrameDetail(Relation_ID, RelCount,vNo: integer; var vHeight: integer);
  var
    Spilt: TSplitter; frmPoten: TfrmPotenAnaly; AnalyType: integer;
  begin
    if Relation_ID<>1000006 then //不是卷烟都创建分割栏
    begin
      Spilt:=TSplitter.Create(self);
      Spilt.Name:='frmPotenAnalysplt'+InttoStr(vNo-1);
      Spilt.Parent:=SB3;
      Spilt.Height:=8;
      Spilt.Color:=clwhite;
      Spilt.Align:=alBottom;
      Spilt.Align:=alTop;
    end;
    try
      frmPoten:=TfrmPotenAnaly.Create(self);
      frmPoten.Name:='frmPotenAnaly'+InttoStr(vNo);
      frmPoten.Parent:=SB3;
      frmPoten.Align:=alBottom;
      frmPoten.Align:=alTop;
      frmPoten.InitData(Relation_ID,adoReport3.Data);
      if vHeight=0 then vHeight:=frmPoten.Height;
      if RelCount=1 then
      begin
        frmPoten.Align:=alClient;
      end else
      begin
        if (Relation_ID=1000006) and (RelCount * (frmPoten.Height+8)-8>SB3.Height) then //放在第一次执行语句
        begin
          {SB3.Align:=alNone;
          SB3.Top:=0;
          SB3.Left:=0;
          }
          SB3.Height:=(frmPoten.Height+8)* RelCount-2;
        end else
        if (Relation_ID=1000006) and (RelCount * (frmPoten.Height+8)-8<=SB3.Height) then //放在第一次执行语句
        begin
          vHeight:=(SB3.Height-RelCount*8+8) div RelCount-2;
        end;
        //在范围内调整 Fram高度
        frmPoten.Height:=vHeight;
      end;
    except
      frmPoten.Free;
    end;
  end;
var
  i,vHeight,vNo: integer;
  RelID: string;
  ReList: TStringList;
begin
  vNo:=1;
  vHeight:=0;
  //创建前释放上次创建
  FreeFrameObj(2);

  //卷烟放在第一栏：
  try
    ReList:=TStringList.Create;
    adoReport3.First;
    while not adoReport3.Eof do
    begin
      RelID:=trim(adoReport3.fieldbyName('RELATION_ID').AsString);
      if RelID<>'1000006' then
      begin
        if ReList.IndexOf(RelID)=-1 then
          ReList.Add(RelID);
      end;
      adoReport3.Next;
    end;
    //卷烟供应链:
    ShowFrameDetail(1000006,ReList.Count+1,vNo,vHeight);
    
    //非卷烟供应链
    for i:=0 to ReList.Count-1 do
    begin
      RelID:=trim(ReList.Strings[i]);
      if RelID = '1000006' then continue;
      Inc(vNo); //序号+1
      ShowFrameDetail(StrtoInt(RelID),ReList.Count+1,vNo,vHeight);
    end;
  finally
    ReList.Free;
  end;
end;    

procedure TfrmSaleAnaly.fndP2_SORT_IDKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  sid2 := '';
  srid2 := '';
  fndP2_SORT_ID.Text := '';
end;

procedure TfrmSaleAnaly.fndP3_SORT_IDKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  sid3 := '';
  srid3 := '';
  fndP3_SORT_ID.Text := '';
end;

procedure TfrmSaleAnaly.CB_ColorClick(Sender: TObject);
begin
  inherited;
  BarSeries1.ColorEachPoint:=CB_Color.Checked;
end;

procedure TfrmSaleAnaly.actPrintExecute(Sender: TObject);
begin
  inherited;
  //打印
  
end;

procedure TfrmSaleAnaly.actPreviewExecute(Sender: TObject);
begin
  inherited;
  //打印预览

  
end;

procedure TfrmSaleAnaly.SingleReportParams(ParameStr: string);
begin
  inherited;
  TabSheet1.PageIndex:=2;
  RzPage.ActivePage:=TabSheet2;
end;

procedure TfrmSaleAnaly.AddUnitItemList(SetUnitID: TcxComboBox; SetType: integer);
begin
  if SetType=1 then //数量单位
  begin
    AddTongjiUnitList(SetUnitID);
  end else
  if SetType=2 then //金额单位
  begin
    SetUnitID.Properties.Items.Clear;
    SetUnitID.Properties.Items.Add('元');
    SetUnitID.Properties.Items.Add('万元');
  end;
  SetUnitID.ItemIndex:=0;
end;

procedure TfrmSaleAnaly.P2_RB_MoneyClick(Sender: TObject);
begin
  inherited;
  AddUnitItemList(fndP2UNIT_ID, 2);
end;

procedure TfrmSaleAnaly.P2_RB_PRFClick(Sender: TObject);
begin
  inherited;
  AddUnitItemList(fndP2UNIT_ID, 2);
end;

procedure TfrmSaleAnaly.P2_RB_AMTClick(Sender: TObject);
begin
  inherited;
  AddUnitItemList(fndP2UNIT_ID, 1);
end;


end.
