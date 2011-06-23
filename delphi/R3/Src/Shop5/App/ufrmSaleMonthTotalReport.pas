unit ufrmSaleMonthTotalReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uframeBaseReport, PrnDbgeh, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ActnList, Menus, ComCtrls, ToolWin, RzLabel,
  jpeg, StdCtrls, RzLstBox, RzChkLst, ExtCtrls, Grids, DBGridEh, RzTabs,
  RzPanel,uReportFactory, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, RzButton, zBase, cxButtonEdit, zrComboBoxList,
  cxCalendar, zrMonthEdit;

type
  TfrmSaleMonthTotalReport = class(TframeBaseReport)
    Label3: TLabel;
    rptTemplate: TcxComboBox;
    btnNew: TRzBitBtn;
    btnEdit: TRzBitBtn;
    RzBitBtn1: TRzBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    Label16: TLabel;
    Label23: TLabel;
    fndP1_TYPE_ID: TcxComboBox;
    fndP1_UNIT_ID: TcxComboBox;
    fndP1_STAT_ID: TzrComboBoxList;
    fndP1_SORT_ID: TcxButtonEdit;
    fndP1_SHOP_TYPE: TcxComboBox;
    fndP1_SHOP_VALUE: TzrComboBoxList;
    RzLabel1: TRzLabel;
    RzLabel12: TRzLabel;
    actTemplate: TAction;
    Label21: TLabel;
    fndP1_SHOP_ID: TzrComboBoxList;
    btnDelete: TRzBitBtn;
    P1_D1: TzrMonthEdit;
    P1_D2: TzrMonthEdit;
    procedure btnNewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actFindExecute(Sender: TObject);
    procedure fndP1_SORT_IDKeyPress(Sender: TObject; var Key: Char);
    procedure fndP1_SORT_IDPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnEditClick(Sender: TObject);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure DBGridEh1GetFooterParams(Sender: TObject; DataCol,
      Row: Integer; Column: TColumnEh; AFont: TFont;
      var Background: TColor; var Alignment: TAlignment;
      State: TGridDrawState; var Text: String);
    procedure btnDeleteClick(Sender: TObject);
  private
    { Private declarations }
    sid1,srid1,SortName:string;
    function AddReportReport(TitleList: TStringList; PageNo: string): string; override; //添加Title
    function GetMaxMonth(E:integer):string;
    procedure CheckCalc(b, e:integer); //开始月份| 结束月份    
  public
    { Public declarations }
    Factory:TReportFactory;
    Lock:boolean;
    //按商品销售汇总表
    function  GetGodsSQL(chk:boolean=true): string;   //5555
    procedure Open(id:string);
    procedure load;
    procedure PrintBefore;override;
  end;


implementation

uses
  ufrmDefineReport,ufnUtil,uShopUtil,uCtrlUtil,udsUtil, uGlobal, ObjCommon,
  uShopGlobal, ufrmPrgBar, ufrmCostCalc;

{$R *.dfm}

procedure TfrmSaleMonthTotalReport.btnNewClick(Sender: TObject);
begin
  inherited;
  if TfrmDefineReport.AddReport(self,RF_DATA_SOURCE4,'3','4') then
     begin
       load;
     end;
end;

procedure TfrmSaleMonthTotalReport.load;
var
  rs:TZQuery;
  list:TStringList;
  w:string;
  i:integer;
begin
  rs := TZQuery.Create(nil);
  list := TStringList.Create;
  lock := true;
  try
    w := '';
    if not ((Global.UserID = 'admin') or (Global.UserID = 'system')) then
    begin
    list.CommaText := Global.Roles;
    for i:=0 to list.Count - 1 do
      begin
        if w<>'' then w := w + ' or ';
        w := w+''',''+ROLES+'','' like ''%,'+list[i]+',%''';
      end;
    if w <> '' then w := ' and ('+w+')';
    end;
    rs.Close;
    rs.SQL.Text := 'select REPORT_ID,REPORT_NAME from SYS_REPORT where TENANT_ID='+inttostr(Global.TENANT_ID)+' and REPORT_TYPE=''3'' and COMM not in (''02'',''12'') and REPORT_SOURCE=''4'' '+w;
    Factor.Open(rs);
    TdsItems.AddDataSetToItems(rs,rptTemplate.Properties.Items,'REPORT_NAME');
    if rptTemplate.Properties.Items.Count>0 then rptTemplate.ItemIndex := 0;
  finally
    lock := false;
    list.Free;
    rs.Free;
  end;
end;

procedure TfrmSaleMonthTotalReport.Open(id: string);
begin
  Factory.Open(id,DBGridEh1);
  RefreshColumn;
end;

procedure TfrmSaleMonthTotalReport.FormCreate(Sender: TObject);
begin
  inherited;
  TDbGridEhSort.InitForm(self,false);
  P1_D1.asString := FormatDateTime('YYYYMM', date); //默认当月
  P1_D2.asString := FormatDateTime('YYYYMM', date); //默认当月
  
  Factory := TReportFactory.Create('4');
  Factory.DataSet := TZQuery.Create(nil);
  load;
  if ShopGlobal.GetProdFlag = 'E' then
    begin
      Label23.Caption := '仓库群组';
      Label21.Caption := '仓库名称';
    end;
  if Copy(Global.SHOP_ID,Length(Global.SHOP_ID)-3,Length(Global.SHOP_ID)) <> '0001' then
  begin
    fndP1_SHOP_ID.Properties.ReadOnly := False;
    fndP1_SHOP_ID.KeyValue := Global.SHOP_ID;
    fndP1_SHOP_ID.Text := Global.SHOP_NAME;
    SetEditStyle(dsBrowse,fndP1_SHOP_ID.Style);
    fndP1_SHOP_ID.Properties.ReadOnly := True;
  end;
  btnNew.Visible := (Global.UserId='system') or (Global.UserId='admin');
  btnEdit.Visible := (Global.UserId='system') or (Global.UserId='admin');
  btnDelete.Visible := (Global.UserId='system') or (Global.UserId='admin');
end;

procedure TfrmSaleMonthTotalReport.FormDestroy(Sender: TObject);
begin
  TDbGridEhSort.FreeForm(self);
  Factory.DataSet.Free;
  Factory.Free;
  inherited;

end;

procedure TfrmSaleMonthTotalReport.actFindExecute(Sender: TObject);
var strSql:string;
begin
  inherited;
  if rptTempLate.ItemIndex<0 then Exit;
  if Factory.DataSet.Active then Factory.DataSet.Close;
  strSql := GetGodsSQL;
  if strSql='' then Exit;
  TZQuery(Factory.DataSet).SQL.Text:= strSql;
  frmPrgBar.Show;
  frmPrgBar.Update;
  frmPrgBar.WaitHint := '准备数据源...';
  frmPrgBar.Precent := 0;
  try
    Factor.Open(TZQuery(Factory.DataSet));
    Open(TRecord_(rptTempLate.Properties.Items.Objects[rptTempLate.ItemIndex]).FieldbyName('REPORT_ID').AsString);
  finally
    frmPrgBar.Close;
  end;
end;

procedure TfrmSaleMonthTotalReport.fndP1_SORT_IDKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  sid1 := '';
  srid1 := '';
  fndP1_SORT_ID.Text := '';

end;

procedure TfrmSaleMonthTotalReport.fndP1_SORT_IDPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  if SelectGoodSortType(sid1,srid1,SortName) then
    fndP1_SORT_ID.Text:=SortName;

end;

procedure TfrmSaleMonthTotalReport.btnEditClick(Sender: TObject);
begin
  inherited;
  if rptTempLate.ItemIndex<0 then Exit;
  if TfrmDefineReport.EditReport(self,TRecord_(rptTempLate.Properties.Items.Objects[rptTempLate.ItemIndex]).FieldbyName('REPORT_ID').AsString,RF_DATA_SOURCE4) then
  begin
    load;
  end;
end;

function TfrmSaleMonthTotalReport.GetGodsSQL(chk: boolean): string;
var
  mx, UnitCalc: string;  //单位计算关系
  strSql,strWhere,GoodTab: widestring;
begin
  result:='';
  if P1_D1.EditValue = null then Raise Exception.Create('销售月份条件不能为空');
  if P1_D2.EditValue = null then Raise Exception.Create('销售月份条件不能为空');
  if P1_D1.asString>P1_D2.asString then Raise Exception.Create('结束月份不能小于开始月份...');
  //过滤企业ID
  strWhere:=' and A.TENANT_ID='+inttoStr(Global.TENANT_ID)+' ';

  //月份日期:
  if (P1_D1.asString<>'') and (P1_D1.asString=P1_D2.asString) then
    strWhere:=strWhere+' and A.MONTH='+P1_D1.asString
  else if P1_D1.asString<P1_D2.asString then
    strWhere:=strWhere+' and A.MONTH>='+P1_D1.asString+' and A.MONTH<='+P1_D2.asString+' ';

  //门店所属行政区域|门店类型:
  if (fndP1_SHOP_VALUE.AsString<>'') then
  begin
    case fndP1_SHOP_TYPE.ItemIndex of
     0: strWhere:=strWhere+' and B.REGION_ID='''+fndP1_SHOP_VALUE.AsString+''' ';
     1: strWhere:=strWhere+' and B.SHOP_TYPE='''+fndP1_SHOP_VALUE.AsString+''' ';
    end;
  end;

  //商品指标:
  if (fndP1_STAT_ID.AsString <> '') and (fndP1_TYPE_ID.ItemIndex>=0) then
  begin
    case TRecord_(fndP1_TYPE_ID.Properties.Items.Objects[fndP1_TYPE_ID.ItemIndex]).FieldByName('CODE_ID').AsInteger of
     2:strWhere:=strWhere+' and C.SORT_ID2='''+fndP1_STAT_ID.AsString+''' ';
     3:strWhere:=strWhere+' and C.SORT_ID3='''+fndP1_STAT_ID.AsString+''' ';
     4:strWhere:=strWhere+' and C.SORT_ID4='''+fndP1_STAT_ID.AsString+''' ';
     5:strWhere:=strWhere+' and C.SORT_ID5='''+fndP1_STAT_ID.AsString+''' ';
     6:strWhere:=strWhere+' and C.SORT_ID6='''+fndP1_STAT_ID.AsString+''' ';
    end;
  end;

  //商品分类:
  if (trim(fndP1_SORT_ID.Text)<>'') and (trim(srid1)<>'') then
  begin
    GoodTab:='VIW_GOODSPRICE_SORTEXT';
    case Factor.iDbType of
     4: strWhere := strWhere+' and C.RELATION_ID='+srid1+' ';
     else
        strWhere := strWhere+' and C.RELATION_ID='''+srid1+''' ';
    end;
    if trim(sid1)<>'' then
      strWhere := strWhere+' and C.LEVEL_ID like '''+sid1+'%'' ';
  end else
    GoodTab:='VIW_GOODSPRICE';

  //门店条件
  if (fndP1_SHOP_ID.AsString<>'') then
    strWhere:=strWhere+' and A.SHOP_ID='''+fndP1_SHOP_ID.AsString+''' ';

  //计量单位换算:
  UnitCalc:=GetUnitTO_CALC(fndP1_UNIT_ID.ItemIndex,'C');
  //检测是否计算
  CheckCalc(strtoInt(P1_D1.asString),StrtoInt(P1_D2.asString));
  mx := GetMaxMonth(StrtoInt(P1_D2.asString));
  
  strSql :=
    'SELECT '+
    ' A.TENANT_ID '+
    ',A.GODS_ID,A.SHOP_ID,B.SHOP_NAME '+

    ',sum(case when A.MONTH='+P1_D1.asString+' then ORG_AMT*1.00/'+UnitCalc+' else 0 end) as ORG_AMT '+ //期初数量
    ',sum(case when A.MONTH='+P1_D1.asString+' then ORG_MNY else 0 end) as ORG_MNY '+   //进项金额<按当时进价>
    ',sum(case when A.MONTH='+P1_D1.asString+' then ORG_RTL else 0 end) as ORG_RTL '+   //可销售额<按零售价>
    ',sum(case when A.MONTH='+P1_D1.asString+' then ORG_CST else 0 end) as ORG_CST '+   //结存成本<移动加权成本>

    ',sum(STOCK_AMT*1.00/'+UnitCalc+') as STOCK_AMT '+   //进货数量
    ',sum(STOCK_MNY) as STOCK_MNY '+   //进货金额<末税>
    ',sum(STOCK_TAX) as STOCK_TAX '+   //进项税额
    ',isnull(sum(STOCK_MNY),0)+isnull(sum(STOCK_TAX),0) as STOCK_TTL '+  //进货金额


    ',sum(YEAR_STOCK_AMT*1.00/'+UnitCalc+') as YEAR_STOCK_AMT '+   //进货数量
    ',sum(YEAR_STOCK_MNY) as YEAR_STOCK_MNY '+   //进货金额<末税>
    ',sum(YEAR_STOCK_TAX) as YEAR_STOCK_TAX '+   //进项税额
    ',isnull(sum(YEAR_STOCK_MNY),0)+isnull(sum(YEAR_STOCK_TAX),0) as YEAR_STOCK_TTL '+  //进货金额


    ',sum(PRIOR_STOCK_AMT*1.00/'+UnitCalc+') as PRIOR_STOCK_AMT '+   //进货数量
    ',sum(PRIOR_STOCK_MNY) as PRIOR_STOCK_MNY '+   //进货金额<末税>
    ',sum(PRIOR_STOCK_TAX) as PRIOR_STOCK_TAX '+   //进项税额
    ',isnull(sum(PRIOR_STOCK_MNY),0)+isnull(sum(PRIOR_STOCK_TAX),0) as PRIOR_STOCK_TTL '+  //进货金额

    ',sum(SALE_AMT*1.00/'+UnitCalc+') as SALE_AMT '+   //销售数量
    ',sum(SALE_MNY) as SALE_MNY '+   //销售金额<末税>
    ',sum(SALE_TAX) as SALE_TAX '+   //销项税额
    ',isnull(sum(SALE_MNY),0)+isnull(sum(SALE_TAX),0) as SALE_TTL '+  //销售金额
    ',sum(SALE_CST) as SALE_CST '+   //销售成本
    ',sum(SALE_PRF) as SALE_PRF '+   //销售毛利
    ',case when sum(SALE_AMT)<>0 then cast(sum(SALE_PRF) as decimal(18,3))*1.00/cast(sum(SALE_AMT*1.00/'+UnitCalc+') as decimal(18,3)) else 0 end as SALE_AVGPRF '+ //单位毛利
    ',case when sum(SALE_MNY)<>0 then cast(sum(SALE_PRF) as decimal(18,3))*100.00/cast(sum(SALE_MNY) as decimal(18,3)) else 0 end as SALE_RATE '+ //毛利率

    ',sum(PRIOR_YEAR_AMT*1.00/'+UnitCalc+') as PRIOR_YEAR_AMT '+   //去年同期销售数量
    ',sum(PRIOR_YEAR_MNY) as PRIOR_YEAR_MNY '+   //去年同期销售金额<末税>
    ',sum(PRIOR_YEAR_TAX) as PRIOR_YEAR_TAX '+   //去年同期销项税额
    ',isnull(sum(PRIOR_YEAR_MNY),0)+isnull(sum(PRIOR_YEAR_TAX),0) as PRIOR_YEAR_TTL '+  //去年同期销售金额
    ',sum(PRIOR_YEAR_CST) as PRIOR_YEAR_CST '+   //去年同期销售成本
    ',isnull(sum(PRIOR_YEAR_MNY),0)-isnull(sum(PRIOR_YEAR_CST),0) as PRIOR_YEAR_PRF '+   //去年同期销售毛利

    ',sum(PRIOR_MONTH_AMT*1.00/'+UnitCalc+') as PRIOR_MONTH_AMT '+   //上月销售数量
    ',sum(PRIOR_MONTH_MNY) as PRIOR_MONTH_MNY '+   //上月销售金额<末税>
    ',sum(PRIOR_MONTH_TAX) as PRIOR_MONTH_TAX '+   //上月销项税额
    ',isnull(sum(PRIOR_MONTH_MNY),0)+isnull(sum(PRIOR_MONTH_TAX),0) as PRIOR_MONTH_TTL '+  //上月销售金额
    ',sum(PRIOR_MONTH_CST) as PRIOR_MONTH_CST '+   //上月销售成本
    ',isnull(sum(PRIOR_MONTH_MNY),0)-isnull(sum(PRIOR_MONTH_CST),0) as PRIOR_YEAR_PRF '+   //上月销售毛利

    ',sum(case when A.MONTH='+mx+' then BAL_AMT*1.00/'+UnitCalc+' else 0 end) as BAL_AMT '+ //结存数量
    ',sum(case when A.MONTH='+mx+' then BAL_MNY else 0 end) as BAL_MNY '+   //进项金额<按当时进价>
    ',sum(case when A.MONTH='+mx+' then BAL_RTL else 0 end) as BAL_RTL '+   //可销售额<按零售价>
    ',sum(case when A.MONTH='+mx+' then BAL_CST else 0 end) as BAL_CST '+   //结存成本<移动加权成本>
    'from RCK_GOODS_MONTH A,CA_SHOP_INFO B,'+GoodTab+' C '+                 
    ' where A.TENANT_ID=B.TENANT_ID and A.SHOP_ID=B.SHOP_ID and A.TENANT_ID=C.TENANT_ID and B.SHOP_ID=C.SHOP_ID and A.GODS_ID=C.GODS_ID '+ strWhere + ' '+
    'group by A.TENANT_ID,A.SHOP_ID,A.GODS_ID,B.SHOP_NAME ';

  strSql :=
    'select j.*,'+
    'r.BARCODE as CALC_BARCODE,r.GODS_CODE,r.GODS_NAME as GODS_ID_TEXT,''#'' as PROPERTY_01,''#'' as BATCH_NO,''#'' as PROPERTY_02,'+GetUnitID(fndP1_UNIT_ID.ItemIndex,'r')+' as UNIT_ID,'+
    'r.SORT_ID1,r.RELATION_ID as SORT_ID24,r.SORT_ID1 as SORT_ID21,r.SORT_ID1 as SORT_ID22,r.SORT_ID1 as SORT_ID23,r.SORT_ID2,r.SORT_ID3,r.SORT_ID4,r.SORT_ID5,r.SORT_ID6,r.SORT_ID7,r.SORT_ID8,r.SORT_ID9,r.SORT_ID10,'+
    'r.SORT_ID11,r.SORT_ID12,r.SORT_ID13,r.SORT_ID14,r.SORT_ID15,r.SORT_ID16,r.SORT_ID17,r.SORT_ID18,r.SORT_ID19,r.SORT_ID20 '+
    ' from ('+strSql+') j left outer join VIW_GOODSINFO r on j.TENANT_ID=r.TENANT_ID and j.GODS_ID=r.GODS_ID ';

  strSql :=
    'select ja.*,isnull(b.BARCODE,ja.CALC_BARCODE) as BARCODE,u.UNIT_NAME as UNIT_NAME from ('+strSql+') ja '+
    'left outer join (select * from VIW_BARCODE where TENANT_ID='+InttoStr(Global.TENANT_ID)+' and BARCODE_TYPE in (''0'',''1'',''2'')) b '+
    'on ja.TENANT_ID=b.TENANT_ID and ja.GODS_ID=b.GODS_ID and ja.BATCH_NO=b.BATCH_NO and ja.PROPERTY_01=b.PROPERTY_01 and ja.PROPERTY_02=b.PROPERTY_02 and ja.UNIT_ID=b.UNIT_ID '+
    'left outer join VIW_MEAUNITS u on ja.TENANT_ID=u.TENANT_ID and ja.UNIT_ID=u.UNIT_ID '+
    ' order by ja.GODS_CODE ';

  result:=ParseSQL(Factor.iDbType,strSql);
end;

procedure TfrmSaleMonthTotalReport.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if adoReport1.Fields[2].AsInteger = 1 then
     Background := $00E7E2E3;
end;

procedure TfrmSaleMonthTotalReport.DBGridEh1GetFooterParams(Sender: TObject;
  DataCol, Row: Integer; Column: TColumnEh; AFont: TFont;
  var Background: TColor; var Alignment: TAlignment; State: TGridDrawState;
  var Text: String);
begin
  inherited;
  if (Column.Field.Index>2) and not VarIsNull(Factory.Footer[Column.Field.Index-3].Value) and not VarIsClear(Factory.Footer[Column.Field.Index-3].Value) then
     Text := formatFloat(Column.Footer.DisplayFormat,Factory.Footer[Column.Field.Index-3].Value);
end;

procedure TfrmSaleMonthTotalReport.btnDeleteClick(Sender: TObject);
begin
  inherited;
  if rptTempLate.ItemIndex<0 then Exit;
  if TfrmDefineReport.DeleteReport(self,TRecord_(rptTempLate.Properties.Items.Objects[rptTempLate.ItemIndex]).FieldbyName('REPORT_ID').AsString,RF_DATA_SOURCE4) then
     begin
       load;
     end;

end;

procedure TfrmSaleMonthTotalReport.PrintBefore;
var
  ReStr: string;
  Title: TStringList;
begin
  inherited;
  PrintDBGridEh1.PageHeader.CenterText.Text := rptTemplate.Text;
  try
    Title:=TStringList.Create;
    AddReportReport(Title,'1');
    ReStr:=FormatReportHead(Title,1);
    PrintDBGridEh1.AfterGridText.Text := #13+'打印人:'+Global.UserName+'  打印时间:'+formatDatetime('YYYY-MM-DD HH:NN:SS',now());
    PrintDBGridEh1.SetSubstitutes(['%[whr]', ReStr]);
  finally
    Title.Free;
  end;
end;

function TfrmSaleMonthTotalReport.AddReportReport(TitleList: TStringList;
  PageNo: string): string;
var
  FindCmp1,FindCmp2: TComponent;
begin
  //日期
  FindCmp1:=FindComponent('P'+PageNo+'_D1');
  FindCmp2:=FindComponent('P'+PageNo+'_D2');
  if (FindCmp1<>nil) and (FindCmp2<>nil) and (FindCmp1 is TcxDateEdit) and (FindCmp2 is TcxDateEdit) and
     (TcxDateEdit(FindCmp1).Visible) and (TcxDateEdit(FindCmp2).Visible)  then
    TitleList.add('月份：'+P1_D1.Text+' 至 '+P1_D2.Text);

  inherited AddReportReport(TitleList,PageNo);
end;

procedure TfrmSaleMonthTotalReport.CheckCalc(b, e: integer);
var
  rs:TZQuery;
begin
  rs := TZQuery.Create(nil);
  try
    rs.SQL.Text := 'select count(*) from RCK_MONTH_CLOSE where TENANT_ID=:TENANT_ID and MONTH>=:END_MONTH';
    rs.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
    rs.ParamByName('END_MONTH').AsInteger := e;
    Factor.Open(rs);
    if rs.Fields[0].AsInteger=0 then
      TfrmCostCalc.TryCalcMthGods(self);
  finally
    rs.Free;
  end;
end;

function TfrmSaleMonthTotalReport.GetMaxMonth(E: integer): string;
var
  rs:TZQuery;
begin
  rs := TZQuery.Create(nil);
  try
    rs.SQL.Text := 'select max(MONTH) from RCK_GOODS_MONTH where TENANT_ID=:TENANT_ID and MONTH<=:END_MONTH';
    rs.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
    rs.ParamByName('END_MONTH').AsInteger := e;
    Factor.Open(rs);
    if rs.Fields[0].AsString='' then
       result := inttostr(e)
    else
       result := rs.Fields[0].AsString;
  finally
    rs.Free;
  end;
end;

end.
