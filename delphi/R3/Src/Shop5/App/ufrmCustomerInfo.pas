unit ufrmCustomerInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uframeDialogForm, ActnList, Menus, RzTabs, ExtCtrls, RzPanel, RzButton,
  cxButtonEdit, zrComboBoxList, cxDropDownEdit, cxMaskEdit, DB, cxCalendar, zBase,
  cxTextEdit, cxControls, cxContainer, cxEdit, cxMemo, StdCtrls, RzLabel, uShopUtil,
  cxRadioGroup, Grids, DBGridEh,ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TfrmCustomerInfo = class(TframeDialogForm)
    Btn_Save: TRzBitBtn;
    Btn_Close: TRzBitBtn;
    labCUST_CODE: TRzLabel;
    RzLabel1: TRzLabel;
    labCUST_NAME: TRzLabel;
    RzLabel2: TRzLabel;
    labCUST_SPELL: TRzLabel;
    RzLabel4: TRzLabel;
    labIC_CARDNO: TRzLabel;
    RzLabel5: TRzLabel;
    RzPanel1: TRzPanel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel9: TRzLabel;
    RzLabel10: TRzLabel;
    RzLabel13: TRzLabel;
    cmbCUST_CODE: TcxTextEdit;
    cmbCUST_NAME: TcxTextEdit;
    cmbCUST_SPELL: TcxTextEdit;
    RzLabel14: TRzLabel;
    cmbPRICE_ID: TzrComboBoxList;
    RzLabel15: TRzLabel;
    cmbBIRTHDAY: TcxDateEdit;
    RzLabel16: TRzLabel;
    cmbMOVE_TELE: TcxTextEdit;
    RzLabel3: TRzLabel;
    RzLabel18: TRzLabel;
    cmbID_NUMBER: TcxTextEdit;
    RzLabel20: TRzLabel;
    cmbACCU_INTEGRAL: TcxTextEdit;
    RzLabel21: TRzLabel;
    cmbRULE_INTEGRAL: TcxTextEdit;
    RzLabel24: TRzLabel;
    cmbSND_DATE: TcxDateEdit;
    RzLabel27: TRzLabel;
    cmbEND_DATE: TcxDateEdit;
    RzLabel28: TRzLabel;
    cmbCON_DATE: TcxDateEdit;
    cmbREMARK: TcxMemo;
    labHOMEPAGE: TRzLabel;
    cmbSEX: TRadioGroup;
    TabSheet3: TRzTabSheet;
    DBGridEh1: TDBGridEh;
    dsGlide: TDataSource;
    TabSheet2: TRzTabSheet;
    TabSheet4: TRzTabSheet;
    dsCustomerData: TDataSource;
    dsDeposit: TDataSource;
    DBGridEh3: TDBGridEh;
    DBGridEh2: TDBGridEh;
    TabSheet5: TRzTabSheet;
    DBGridEh4: TDBGridEh;
    dsRenew: TDataSource;
    edtSORT_ID: TzrComboBoxList;
    RzLabel29: TRzLabel;
    RzLabel30: TRzLabel;
    adoGlide: TZQuery;
    adoCustomerData: TZQuery;
    adoDeposit: TZQuery;
    adoRenew: TZQuery;
    cdsTable: TZQuery;
    labIDN_TYPE: TRzLabel;
    edtIDN_TYPE: TcxComboBox;
    RzLabel12: TRzLabel;
    cmbIC_CARDNO: TcxTextEdit;
    cmbSHOP_ID: TzrComboBoxList;
    RzLabel22: TRzLabel;
    RzLabel11: TRzLabel;
    RzLabel23: TRzLabel;
    RzLabel25: TRzLabel;
    cmbINTEGRAL: TcxTextEdit;
    RzLabel17: TRzLabel;
    TabSheet6: TRzTabSheet;
    RzPanel3: TRzPanel;
    RzLabel19: TRzLabel;
    cmbOFFI_TELE: TcxTextEdit;
    cmbFAMI_ADDR: TcxTextEdit;
    labADDRESS: TRzLabel;
    edtREGION_ID: TzrComboBoxList;
    RzLabel26: TRzLabel;
    edtPOSTALCODE: TcxTextEdit;
    labPOSTALCODE: TRzLabel;
    labTELEPHONE2: TRzLabel;
    labMSN: TRzLabel;
    edtQQ: TcxTextEdit;
    edtMSN: TcxTextEdit;
    labEMAIL: TRzLabel;
    edtEMAIL: TcxTextEdit;
    edtFAMI_TELE: TcxTextEdit;
    RzLabel31: TRzLabel;
    labDEGREES: TRzLabel;
    edtDEGREES: TcxComboBox;
    RzLabel32: TRzLabel;
    edtMONTH_PAY: TcxComboBox;
    edtOCCUPATION: TcxComboBox;
    labOCCUPATION: TRzLabel;
    edtJOBUNIT: TcxTextEdit;
    labJOBUNIT: TRzLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Btn_CloseClick(Sender: TObject);
    procedure Btn_SaveClick(Sender: TObject);
    procedure edtCUST_NAMEPropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cmbPRICE_IDAddClick(Sender: TObject);
    procedure cmbPRICE_IDSaveValue(Sender: TObject);
    procedure RzPageChange(Sender: TObject);
    procedure cmbID_NUMBERKeyPress(Sender: TObject; var Key: Char);
    procedure cmbOFFI_TELEKeyPress(Sender: TObject; var Key: Char);
    procedure cmbRULE_INTEGRALKeyPress(Sender: TObject; var Key: Char);
    procedure cmbACCU_INTEGRALKeyPress(Sender: TObject; var Key: Char);
    procedure cmbINTEGRALKeyPress(Sender: TObject; var Key: Char);
    procedure cmbMOVE_TELEKeyPress(Sender: TObject; var Key: Char);
    procedure edtSORT_IDAddClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Aobj:TRecord_;
    Saved:Boolean;
    procedure SetdbState(const Value: TDataSetState); override;
    procedure WriteTo(AObj:TRecord_);
    procedure Open(code:string);
    procedure Append;
    procedure Edit(code:string);
    procedure Save;
    function  IsEdit(Aobj:TRecord_;cdsTable:TZQuery):Boolean;//判断会员档案是否有修改
    class function AddDialog(Owner:TForm;var _AObj:TRecord_):boolean;
    class function EditDialog(Owner:TForm;id:string;var _AObj:TRecord_):boolean;
  end;

var
  frmCustomerInfo: TfrmCustomerInfo;

implementation
uses uDsUtil, uGlobal, uFnUtil,uShopGlobal,ufrmCodeInfo,ufrmPriceGradeInfo,
  Math;

{$R *.dfm}

{ TfrmCustomerInfo }

procedure TfrmCustomerInfo.Append;
var rs:TZQuery;
begin
  Open('');
  TabSheet2.TabVisible:=False;
  TabSheet3.TabVisible:=False;
  TabSheet4.TabVisible:=False;
  TabSheet5.TabVisible:=False;
  dbState := dsInsert;
  cmbCUST_CODE.Text := '自动编号..';
  cmbSND_DATE.Date := Global.SysDate;
  cmbSEX.ItemIndex := 0;
  cmbSHOP_ID.KeyValue := Global.SHOP_ID;
  cmbSHOP_ID.Text := Global.SHOP_NAME;
  edtSORT_ID.KeyValue:='#';
  edtSORT_ID.Text:='无';
  rs:=Global.GetZQueryFromName('PUB_PRICEGRADE');
  if (rs.RecordCount>0) and (rs.Locate('PRICE_NAME','普通会员',[])) then
  begin
    cmbPRICE_ID.KeyValue := rs.FieldByName('PRICE_ID').AsString;
    cmbPRICE_ID.Text := rs.FieldByName('PRICE_NAME').AsString;
  end;
  if cmbCUST_NAME.CanFocus and Visible then cmbCUST_NAME.SetFocus;
end;

procedure TfrmCustomerInfo.Edit(code: string);
begin
  Open(code);
  dbState := dsEdit;
end;

procedure TfrmCustomerInfo.Open(code: string);
var
  Params:TftParamList;
begin
  Params := TftParamList.Create(nil);
  try
    Params.ParamByName('CUST_ID').asString := code;
    Params.ParamByName('UNION_ID').AsString := '#';
    Params.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
    cdsTable.Close;
    Factor.Open(cdsTable,'TCustomer',Params);
    Aobj.ReadFromDataSet(cdsTable);
    ReadFromObject(Aobj,Self);
    cmbSHOP_ID.KeyValue := Aobj.FieldbyName('SHOP_ID').AsString;
    cmbSHOP_ID.Text := TdsFind.GetNameByID(Global.GetZQueryFromName('CA_SHOP_INFO'),'SHOP_ID','SHOP_NAME',Aobj.FieldbyName('SHOP_ID').AsString);
    cmbPRICE_ID.KeyValue := Aobj.FieldByName('PRICE_ID').AsString;
    cmbPRICE_ID.Text := TdsFind.GetNameByID(Global.GetZQueryFromName('PUB_PRICEGRADE'),'PRICE_ID','PRICE_NAME',Aobj.FieldByName('PRICE_ID').AsString);
    edtSORT_ID.KeyValue := Aobj.FieldbyName('SORT_ID').AsString;
    edtSORT_ID.Text := TdsFind.GetNameByID(Global.GetZQueryFromName('PUB_CLIENTSORT'),'CODE_ID','CODE_NAME',Aobj.FieldbyName('SORT_ID').AsString);
    cmbSEX.ItemIndex:=AObj.FieldByName('SEX').AsInteger;
    dbState := dsBrowse;
  finally
  Params.Free;
  end;
end;

procedure TfrmCustomerInfo.Save;
 procedure UpdateToGlobal(AObj:TRecord_);
   var Temp:TZQuery;
   begin
      Temp := Global.GetZQueryFromName('PUB_CUSTOMER');
      Temp.Filtered := false;
      if not Temp.Locate('CLIENT_ID',AObj.FieldByName('CUST_ID').AsString,[]) then
         Temp.Append
      else
         Temp.Edit;
      AObj.WriteToDataSet(Temp,false);
      Temp.Post;
   end;
var tmp,temp,temp1,tmp1:TZQuery;
    j:integer;
begin
  if trim(cmbCUST_CODE.Text)='' then
  begin
    if cmbCUST_CODE.CanFocus then cmbCUST_CODE.SetFocus;
    raise Exception.Create('会员号不能为空！');
  end;
  if trim(cmbCUST_NAME.Text)='' then
  begin
    if cmbCUST_NAME.CanFocus then cmbCUST_NAME.SetFocus;
    raise Exception.Create('会员姓名不能为空！');
  end;
  if trim(cmbCUST_SPELL.Text)='' then
  begin
    if cmbCUST_SPELL.CanFocus then cmbCUST_SPELL.SetFocus;
    raise Exception.Create('拼音码不能为空！');
  end;
  if trim(cmbSHOP_ID.AsString)='' then
  begin
    if cmbSHOP_ID.CanFocus then cmbSHOP_ID.SetFocus;
    raise Exception.Create('入会门店不能为空！');
  end;
  if cmbPRICE_ID.AsString='' then
  begin
    if cmbPRICE_ID.CanFocus then cmbPRICE_ID.SetFocus;
    raise Exception.Create('会员等级不能为空！');
  end;
  {if dbState=dsEdit then
  begin
    if AObj.FieldbyName('CUST_ID').AsString=cmbINTRODUCER.AsString then
    begin
      if cmbINTRODUCER.CanFocus then cmbINTRODUCER.SetFocus;
      raise Exception.Create('介绍人不能是自己!');
    end;
  end;}
  //会员检测开始
 if dbState = dsInsert then
  begin
     temp := Global.GetZQueryFromName('PUB_CUSTOMER');
     if temp.Locate('CLIENT_CODE',Trim(cmbCUST_CODE.Text),[]) then
       begin
          if cmbCUST_CODE.CanFocus then cmbCUST_CODE.SetFocus;
          raise Exception.Create('此会员号已经存在，不能重复！');
       end;
  end;

  if dbState = dsEdit then
  begin
    temp1:=Global.GetZQueryFromName('PUB_CUSTOMER');
    if temp1.Locate('CLIENT_CODE',Trim(cmbCUST_CODE.Text),[]) then
      begin
        if temp1.FieldByName('CLIENT_ID').AsString <> Aobj.FieldByName('CUST_ID').AsString then
          Raise Exception.Create('此会员号已经存在，不能重复！');
      end;
  end;
  if dbState=dsEdit then
  begin
    if StrToFloatDef(trim(cmbINTEGRAL.Text),0)>StrToFloatDef(trim(cmbACCU_INTEGRAL.Text),0) then
    begin
      cmbINTEGRAL.SetFocus;
      Raise Exception.Create('可用积分不能大于累积积分！');
    end;
  end;
  tmp1:=TZQuery.Create(nil);
  try
    tmp1.Close;
    tmp1.SQL.Text:='select PRICE_ID from PUB_PRICEGRADE where INTEGRAL<='+FloatToStr(StrToFloatDef(cmbACCU_INTEGRAL.Text,0))+' and INTEGRAL>=0 order by INTEGRAL desc limit 0,1';
    Factor.Open(tmp1);
    if (not tmp1.IsEmpty) and (cmbPRICE_ID.AsString<>tmp1.FieldByName('PRICE_ID').AsString) then
    begin
      if MessageBox(Handle,'累计积分与等级标准不符，是否继续保存？',pchar(Application.Title),MB_YESNO+MB_DEFBUTTON1+MB_ICONINFORMATION) <>6 then
        Exit;
    end;
  finally
    tmp1.Close;
  end;
  if dbState=dsInsert then
  begin
    if StrToFloatDef(trim(cmbINTEGRAL.Text),0)<>0 then
       cmbACCU_INTEGRAL.Text:=trim(cmbINTEGRAL.Text);
  end;
  if cmbCUST_NAME.Text<>cdsTable.FieldByName('CUST_NAME').AsString  then
  begin
    if dbState=dsEdit then
    begin
      tmp:=Global.GetZQueryFromName('PUB_CUSTOMER');
      if tmp.Locate('CLIENT_NAME',Trim(cmbCUST_NAME.Text),[]) then
        begin
          if tmp.FieldByName('CLIENT_ID').AsString <> cdsTable.FieldByName('CUST_ID').AsString then
            begin
              if cmbCUST_NAME.CanFocus then cmbCUST_NAME.SetFocus;
              MessageBox(handle,Pchar('提示:会员名称已经存在!'),Pchar(Caption),MB_OK);
            end;
        end;
    end;
    if dbState=dsInsert then
    begin
      tmp:=Global.GetZQueryFromName('PUB_CUSTOMER');
      tmp.Filtered:=False;
      tmp.First;
      while not tmp.Eof do
      begin
        if tmp.FieldByName('CLIENT_NAME').AsString=cmbCUST_NAME.Text then
        begin
          if cmbCUST_NAME.CanFocus then cmbCUST_NAME.SetFocus;
          MessageBox(handle,Pchar('提示:会员姓名已经存在!'),Pchar(Caption),MB_OK);
        end;
        tmp.Next;
      end;
    end;
  end;
  //会员检测结束

  WriteTo(Aobj);
  if not IsEdit(Aobj,cdsTable) then exit;
  if dbState = dsInsert then
    begin
      AObj.FieldbyName('CUST_ID').AsString := TSequence.NewId;
      Aobj.FieldByName('CREA_USER').AsString := Global.UserID;
      Aobj.FieldByName('CREA_DATE').AsString := FormatDateTime('YYYY-MM-DD',Global.SysDate);
      Aobj.FieldByName('TENANT_ID').AsInteger := Global.TENANT_ID;
      Aobj.FieldByName('IC_INFO').AsString := '企业卡';
      Aobj.FieldByName('UNION_ID').AsString := '#';
      Aobj.FieldByName('IC_STATUS').AsString := '0';
      Aobj.FieldByName('IC_TYPE').AsString := '0';
    end;
  if (AObj.FieldbyName('CUST_CODE').AsString='') or (AObj.FieldbyName('CUST_CODE').AsString='自动编号..') then
     AObj.FieldbyName('CUST_CODE').AsString :=  FnString.GetBarCode(TSequence.GetSequence('CLIENT_CODE',IntToStr(Global.TENANT_ID),'',6),8);
  Aobj.FieldByName('IC_CARDNO').AsString := AObj.FieldbyName('CUST_CODE').AsString;
  cdsTable.Edit;
  Aobj.WriteToDataSet(cdsTable);
  cdsTable.Post;
  if Factor.UpdateBatch(cdsTable,'TCustomer') then
    UpdateToGlobal(Aobj);
  dbState := dsBrowse;
  Saved := true;
end;

procedure TfrmCustomerInfo.FormCreate(Sender: TObject);
begin
  inherited;
  DBGridEh2.FieldColumns['COLORNAME'].Visible:=(CLVersion='FIG');
  DBGridEh2.FieldColumns['SIZENAME'].Visible:=(CLVersion='FIG');

  RzPage.ActivePageIndex := 0;
  cmbSHOP_ID.DataSet := Global.GetZQueryFromName('CA_SHOP_INFO');
  cmbPRICE_ID.DataSet := Global.GetZQueryFromName('PUB_PRICEGRADE');
  edtSORT_ID.DataSet := Global.GetZQueryFromName('PUB_CLIENTSORT');
  edtREGION_ID.DataSet := Global.GetZQueryFromName('PUB_REGION_INFO');
  AddCbxPickList(edtIDN_TYPE,'',Global.GetZQueryFromName('PUB_IDNTYPE_INFO'));
  AddCbxPickList(edtDEGREES,'',Global.GetZQueryFromName('PUB_DEGREES_INFO'));
  AddCbxPickList(edtMONTH_PAY,'',Global.GetZQueryFromName('PUB_MONTH_PAY_INFO'));
  AddCbxPickList(edtOCCUPATION,'',Global.GetZQueryFromName('PUB_OCCUPATION_INFO'));
  Aobj := TRecord_.Create;
end;

procedure TfrmCustomerInfo.FormDestroy(Sender: TObject);
begin
  inherited;
  Aobj.Free;
end;

procedure TfrmCustomerInfo.Btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmCustomerInfo.Btn_SaveClick(Sender: TObject);
var bl:Boolean;
    PRICE_ID,PRICE_NAME:string;
begin
  inherited;
  bl:=(dbState<>dsEdit);
  Save;
  If Saved and Assigned(OnSave) then OnSave(Aobj);
  If Saved and Assigned(OnSave) and bl then
  begin
    if MessageBox(Handle,'是否继续新增会员?',pchar(Application.Title),MB_YESNO+MB_ICONQUESTION)=6 then
    begin
      PRICE_ID:=cmbPRICE_ID.AsString;
      PRICE_NAME:=cmbPRICE_ID.Text;
      Append;
      cmbPRICE_ID.KeyValue:=PRICE_ID;
      cmbPRICE_ID.Text:=PRICE_NAME;
    end
    else
      ModalResult := MROK;
  end
  else
    ModalResult := MROK;
end;

procedure TfrmCustomerInfo.edtCUST_NAMEPropertiesChange(Sender: TObject);
begin
  inherited;
  cmbCUST_SPELL.Text := FnString.GetWordSpell(cmbCUST_NAME.Text);
end;

procedure TfrmCustomerInfo.SetdbState(const Value: TDataSetState);
begin
  inherited;
  RzLabel3.Visible:=True;
  RzLabel7.Visible:=True;
  RzLabel9.Visible:=True;
  RzLabel11.Visible:=True;
  RzLabel30.Visible:=True;
  Btn_Save.Visible := (value<>dsBrowse);
  cmbSEX.Enabled:=True;
  case dbState of
  dsInsert:Caption:='会员档案--(新增)';
  dsEdit:Caption:='会员档案--(修改)';
  else
    begin
      Caption:='会员档案';
      RzLabel3.Visible:=False;
      RzLabel7.Visible:=False;
      RzLabel9.Visible:=False;
      RzLabel11.Visible:=False;
      cmbSEX.Enabled:=False;
      RzLabel30.Visible:=False;      
    end;
  end;
end;

procedure TfrmCustomerInfo.FormShow(Sender: TObject);
begin
  inherited;
  cmbCUST_CODE.SelectAll;
  if cmbCUST_CODE.CanFocus then cmbCUST_CODE.SetFocus;
end;

function TfrmCustomerInfo.IsEdit(Aobj: TRecord_;
  cdsTable:TZQuery): Boolean;
var i:integer;
begin
  Result:=False;
  for i:=0 to cdsTable.FieldCount-1 do
  begin
    if AObj.Fields[i].AsString<>cdsTable.Fields[i].AsString then
    begin
      Result:=True;
      break;
    end;
  end;
end;
procedure TfrmCustomerInfo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var i:integer;
begin
  inherited;
  if dbState=dsBrowse then exit;
  if Application.Terminated then Exit;
  try
   if not((dbState = dsInsert) and (trim(cmbCUST_NAME.Text)='')) then
   begin
    WriteTo(AObj);
    if not IsEdit(Aobj,cdsTable) then Exit;
    i:=MessageBox(Handle,'会员档案有修改，是否保存修改信息？',pchar(Application.Title),MB_YESNOCANCEL+MB_DEFBUTTON1+MB_ICONINFORMATION);
    if i=6 then
       begin
         Save;
         if Saved and Assigned(OnSave) then OnSave(AObj);
       end;
    if i=2 then abort;
   end;
  except
    CanClose := false;
    Raise;
  end;
end;

procedure TfrmCustomerInfo.WriteTo(AObj: TRecord_);
begin
  WriteToObject(Aobj,self);
  if Trim(cmbINTEGRAL.Text)='' then AObj.FieldByName('INTEGRAL').AsString:='0';
  if Trim(cmbACCU_INTEGRAL.Text)='' then AObj.FieldByName('ACCU_INTEGRAL').AsString:='0';
  if Trim(cmbRULE_INTEGRAL.Text)='' then AObj.FieldByName('RULE_INTEGRAL').AsString:='0';
  AObj.FieldByName('SEX').AsInteger:=cmbSEX.ItemIndex;
  //AObj.FieldByName('INTRODUCER').AsString:=cmbINTRODUCER.AsString;
end;

class function TfrmCustomerInfo.AddDialog(Owner: TForm;
  var _AObj: TRecord_): boolean;
begin
  if not ShopGlobal.GetChkRight('300007') then Raise Exception.Create('你没有新增会员的权限,请和管理员联系.');
  with TfrmCustomerInfo.Create(Owner) do
  begin
    try
      Append;
      if ShowModal=MROK then
      begin
        AObj.CopyTo(_AObj);
        result :=True;
      end
      else
        result :=False;
    finally
      free;
    end;
  end;
end;

class function TfrmCustomerInfo.EditDialog(Owner: TForm; id: string;
  var _AObj: TRecord_): boolean;
begin
  if not ShopGlobal.GetChkRight('300008') then Raise Exception.Create('你没有修改会员的权限,请和管理员联系.');
  with TfrmCustomerInfo.Create(Owner) do
  begin
    try
      Edit(id);
      if ShowModal=MROK then
      begin
        AObj.CopyTo(_AObj);
        result :=True;
      end
      else
        result :=False;
    finally
      free;
    end;
  end;
end;

procedure TfrmCustomerInfo.cmbPRICE_IDAddClick(Sender: TObject);
var AObj:TRecord_;
begin
  inherited;
 AObj := TRecord_.Create;
  try
    if TfrmPriceGradeInfo.AddDialog(self,AObj) then
       begin
         cmbPRICE_ID.KeyValue := AObj.FieldbyName('PRICE_ID').asString;
         cmbPRICE_ID.Text := AObj.FieldbyName('PRICE_NAME').asString;
       end;
  finally
    AObj.Free;
  end;
end;

procedure TfrmCustomerInfo.cmbPRICE_IDSaveValue(Sender: TObject);
begin
  inherited;
  if (cmbPRICE_ID.AsString='') then
  begin
    if MessageBox(Handle,'没找到你想查找的会员等级是否新增一个？',pchar(Application.Title),MB_YESNO+MB_ICONQUESTION)<>6 then Exit;
    cmbPRICE_ID.OnAddClick(nil);
    Exit;
  end;
end;

procedure TfrmCustomerInfo.RzPageChange(Sender: TObject);
var
  Params:TftParamList;
begin
  inherited;
  if RzPage.ActivePageIndex=2 then
  begin
    Params := TftParamList.Create(nil);
    try
      Params.ParamByName('CUST_ID').asString :=cdsTable.FieldByName('CUST_ID').AsString;
      Params.ParamByName('USER_ID').asString :=Global.UserID;
      adoCustomerData.Close;
      Factor.Open(adoCustomerData,'TCustomerSalesData',Params);
    finally
      Params.Free;
    end;
  end;

  if RzPage.ActivePageIndex=3 then
  begin
    Params := TftParamList.Create(nil);
    try
      Params.ParamByName('CUST_ID').asString :=cdsTable.FieldByName('CUST_ID').AsString;
      adoGlide.Close;
      Factor.Open(adoGlide,'TSelectIntegralGlide',Params);
    finally
      Params.Free;
    end;
  end;

  if RzPage.ActivePageIndex=4 then
  begin
    Params := TftParamList.Create(nil);
    try
      Params.ParamByName('CUST_ID').asString :=cdsTable.FieldByName('CUST_ID').AsString;
      adoDeposit.Close;
      Factor.Open(adoDeposit,'TSelectDeposit',Params);
    finally
      Params.Free;
    end;
  end;

  if RzPage.ActivePageIndex=5 then
  begin
    Params := TftParamList.Create(nil);
    try
      Params.ParamByName('CUST_ID').asString :=cdsTable.FieldByName('CUST_ID').AsString;
      adoRenew.Close;
      Factor.Open(adoRenew,'TSelectRenew',Params);
    finally
      Params.Free;
    end;                                   
  end;
end;

procedure TfrmCustomerInfo.cmbID_NUMBERKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key>=#160 then Key:= #0;  
end;

procedure TfrmCustomerInfo.cmbOFFI_TELEKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key>=#160 then Key:= #0;
end;

procedure TfrmCustomerInfo.cmbRULE_INTEGRALKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key>=#160 then Key:= #0;
end;

procedure TfrmCustomerInfo.cmbACCU_INTEGRALKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key>=#160 then Key:= #0;
end;

procedure TfrmCustomerInfo.cmbINTEGRALKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key>=#160 then Key:= #0;
end;

procedure TfrmCustomerInfo.cmbMOVE_TELEKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key>=#160 then Key:= #0;
end;

procedure TfrmCustomerInfo.edtSORT_IDAddClick(Sender: TObject);
var Aobj:TRecord_;
begin
  inherited;
 AObj := TRecord_.Create;
  try
    if TfrmCodeInfo.AddDialog(self,AObj) then
       begin
         edtSORT_ID.KeyValue := AObj.FieldbyName('CODE_ID').asString;
         edtSORT_ID.Text := AObj.FieldbyName('CODE_NAME').asString;
       end;
  finally
    AObj.Free;
  end;
end;

end.
