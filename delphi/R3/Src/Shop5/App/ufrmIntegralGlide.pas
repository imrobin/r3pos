unit ufrmIntegralGlide;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uframeDialogForm, ActnList, Menus, RzTabs, ExtCtrls, RzPanel,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMemo, StdCtrls, RzButton,
  cxMaskEdit, cxDropDownEdit, DB, cxSpinEdit, ZAbstractRODataset, ZBase,
  ZAbstractDataset, ZDataset, RzRadChk;

type
  TfrmIntegralGlide = class(TframeDialogForm)
    Label1: TLabel;
    Bevel1: TBevel;
    edtGLIDE_INFO: TcxMemo;
    Label2: TLabel;
    Bevel2: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    edtIC_CARDNO: TcxTextEdit;
    edtCLIENT_NAME: TcxTextEdit;
    Label5: TLabel;
    edtINTEGRAL: TcxTextEdit;
    Label6: TLabel;
    edtACCU_INTEGRAL: TcxTextEdit;
    Label7: TLabel;
    edtPRICE_NAME: TcxTextEdit;
    Label8: TLabel;
    Label9: TLabel;
    edtINTEGRAL_FLAG: TcxComboBox;
    btnOK: TRzBitBtn;
    btnCancel: TRzBitBtn;
    Label10: TLabel;
    edtUSING_INTEGRAL: TcxSpinEdit;
    edtFLAG_AMT: TcxSpinEdit;
    cdsTable: TZQuery;
    labUnit: TLabel;
    Label11: TLabel;
    IsIc: TRzCheckBox;
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtFLAG_AMTPropertiesChange(Sender: TObject);
    procedure edtUSING_INTEGRALPropertiesChange(Sender: TObject);
    procedure edtINTEGRAL_FLAGPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cid:string;
    AObj:TRecord_;
    procedure InitCmb;
    procedure Open(CUST_ID:string);
    procedure MoneyToDeposit;
    class function IntegralGlide(AOwner:TForm;CUST_ID:string;_AObj:TRecord_):boolean;
  end;

implementation
uses uGlobal,uShopUtil,uDsUtil,ufrmBasic;
{$R *.dfm}

procedure TfrmIntegralGlide.btnCancelClick(Sender: TObject);
begin
  inherited;
  Close;
end;

class function TfrmIntegralGlide.IntegralGlide(AOwner: TForm;
  CUST_ID: string;_AObj:TRecord_): boolean;
begin
  with TfrmIntegralGlide.Create(AOwner) do
    begin
      try
        Open(CUST_ID);
        edtINTEGRAL_FLAG.ItemIndex := 0;
        edtGLIDE_INFO.Text:='积分兑换';
        result := (ShowModal=MROK);
        if result then
           _AObj.ReadFromDataSet(cdsTable); 
      finally
        free;
      end;
    end;
end;

procedure TfrmIntegralGlide.Open(CUST_ID: string);
var
  rs:TZQuery;
begin
  rs := TZQuery.Create(nil);
  try
    rs.SQL.Text :=
    'select j.CLIENT_ID,j.CLIENT_NAME,j.IC_CARDNO,j.ACCU_INTEGRAL,j.RULE_INTEGRAL,j.INTEGRAL,j.BALANCE,p.PRICE_NAME from VIW_CUSTOMER j '+
    'left outer join PUB_PRICEGRADE p on j.PRICE_ID=p.PRICE_ID and j.TENANT_ID=p.TENANT_ID where j.FLAG in (0,2) and j.TENANT_ID=:TENANT_ID and j.CLIENT_ID=:CLIENT_ID ';
    rs.Params.ParamByName('CLIENT_ID').AsString := CUST_ID;
    rs.Params.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
    Factor.Open(rs);
    AObj.ReadFromDataSet(rs);
    ReadFromObject(AObj,self);
  finally
    rs.Free;
  end;
end;

procedure TfrmIntegralGlide.FormCreate(Sender: TObject);
begin
  inherited;
  AObj := TRecord_.Create;
  dbState := dsEdit;
end;

procedure TfrmIntegralGlide.FormDestroy(Sender: TObject);
begin
  AObj.Free;
  Freeform(Self);
  inherited;
end;

procedure TfrmIntegralGlide.btnOKClick(Sender: TObject);
var
  Params:TftParamList;
  str:string;
begin
  inherited;
  if edtINTEGRAL_FLAG.ItemIndex = -1 then Raise Exception.Create('对换方式不能为空.');
  if edtFLAG_AMT.Value = 0 then Raise Exception.Create('对换数量不能为零.');
  if edtUSING_INTEGRAL.Value = 0 then Raise Exception.Create('对换积分不能为零.');
  if trim(edtGLIDE_INFO.Text) = '' then Raise Exception.Create('摘要不能为空.');
  if edtINTEGRAL.Text='' then str:='0'
  else str:=edtINTEGRAL.Text;
  if StrToFloat(str)<StrToFloat(edtUSING_INTEGRAL.Text) then Raise Exception.Create('兑换积分不能大于可用积分!');
  Params := TftParamList.Create(nil);
  try
    Params.ParamByName('GLIDE_ID').asString := '';
    Params.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
    cdsTable.Close;
    Factor.Open(cdsTable,'TIntegralGlide',Params);
    cdsTable.Append;
    cdsTable.FieldByName('GLIDE_ID').AsString := TSequence.NewId;;
    cdsTable.FieldByName('TENANT_ID').AsInteger := Global.TENANT_ID;
    cdsTable.FieldByName('SHOP_ID').AsString := Global.SHOP_ID;
    cdsTable.FieldByName('IC_CARDNO').AsString := AObj.FieldbyName('IC_CARDNO').AsString;
    cdsTable.FieldByName('CLIENT_ID').AsString := AObj.FieldbyName('CLIENT_ID').AsString;
    cdsTable.FieldByName('CREA_DATE').AsInteger := StrToInt(FormatDateTime('YYYYMMDD',Date));
    cdsTable.FieldByName('CREA_USER').AsString := Global.UserID;
    cdsTable.FieldByName('INTEGRAL_FLAG').AsString := TRecord_(edtINTEGRAL_FLAG.Properties.Items.Objects[edtINTEGRAL_FLAG.ItemIndex]).FieldbyName('CODE_ID').AsString;
    cdsTable.FieldByName('GLIDE_INFO').AsString := Trim(edtGLIDE_INFO.Text);
    cdsTable.FieldByName('INTEGRAL').AsFloat := StrtoFloatDef(edtUSING_INTEGRAL.Text,0);
    cdsTable.FieldByName('GLIDE_AMT').AsFloat := StrtoFloatDef(edtFLAG_AMT.Text,0);
    cdsTable.Post;
    Factor.UpdateBatch(cdsTable,'TIntegralGlide',Params);
    if (IsIc.Checked) and (IsIc.Visible) then
      MoneyToDeposit;
    self.ModalResult := MROK;
  finally
    Params.Free;
  end;
end;

procedure TfrmIntegralGlide.FormShow(Sender: TObject);
begin
  inherited;
  edtINTEGRAL_FLAG.SetFocus;
  InitCmb;
  edtINTEGRAL_FLAG.ItemIndex := 0;
end;

procedure TfrmIntegralGlide.edtFLAG_AMTPropertiesChange(Sender: TObject);
begin
  inherited;
  if StrToFloatDef(edtFLAG_AMT.Value,0)<0 then
     edtFLAG_AMT.EditValue:='0';
  if (StrToFloatDef(edtUSING_INTEGRAL.Value,0)>0) and (StrToFloatDef(edtFLAG_AMT.Value,0)>0) then
    edtGLIDE_INFO.Text := IntToStr(edtUSING_INTEGRAL.Value)+' 积分兑换 '+IntToStr(edtFLAG_AMT.Value)+labUnit.Caption+copy(edtINTEGRAL_FLAG.Text,5,8);
end;

procedure TfrmIntegralGlide.edtUSING_INTEGRALPropertiesChange(
  Sender: TObject);
begin
  inherited;
  if StrToFloatDef(edtUSING_INTEGRAL.Value,0)<0 then
     edtUSING_INTEGRAL.EditValue:='0';

  if (StrToFloatDef(edtUSING_INTEGRAL.Value,0)>0) and (StrToFloatDef(edtFLAG_AMT.Value,0)>0) then
    edtGLIDE_INFO.Text := IntToStr(edtUSING_INTEGRAL.Value)+' 积分兑换 '+IntToStr(edtFLAG_AMT.Value)+' '+labUnit.Caption+copy(edtINTEGRAL_FLAG.Text,5,8);
end;

procedure TfrmIntegralGlide.InitCmb;
var rs:TZQuery;
    Aobj_1:TRecord_;
begin
  ClearCbxPickList(edtINTEGRAL_FLAG);
  rs := TZQuery.Create(nil);
  try
    rs.SQL.Text := 'select CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP from PUB_PARAMS where TYPE_CODE=''INTEGRAL_FLAG'' and CODE_ID not in (''1'') ';
    Factor.Open(rs);
    rs.First;
    while not rs.Eof do
      begin
        Aobj_1 := TRecord_.Create;
        Aobj_1.ReadFromDataSet(rs);
        edtINTEGRAL_FLAG.Properties.Items.AddObject(rs.FieldByName('CODE_NAME').AsString,Aobj_1);
        rs.Next;
      end;
  finally
    rs.Free;
  end;
end;

procedure TfrmIntegralGlide.edtINTEGRAL_FLAGPropertiesChange(
  Sender: TObject);
begin
  inherited;
  edtGLIDE_INFO.Text := edtINTEGRAL_FLAG.Text;
  if edtINTEGRAL_FLAG.ItemIndex = 0 then
    begin
      labUnit.Caption := '张';
      Label9.Caption := '兑换礼券';
      IsIc.Visible := False;
    end
  else
    begin
      labUnit.Caption := '元';
      Label9.Caption := '兑换金额';
      IsIc.Visible := True;
    end;
  edtUSING_INTEGRALPropertiesChange(Sender);
end;

procedure TfrmIntegralGlide.MoneyToDeposit;
var rs:TZQuery;
    params:TftParamList;
begin
  rs := TZQuery.Create(nil);
  params := TftParamList.Create(nil);
  try
    params.ParamByName('GLIDE_ID').AsString := '';
    params.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
    Factor.Open(rs,'TDeposit',params);

    rs.Append;
    rs.FieldByName('GLIDE_ID').AsString :=TSequence.NewId;
    rs.FieldByName('IC_CARDNO').AsString := AObj.FieldbyName('IC_CARDNO').AsString;
    rs.FieldByName('TENANT_ID').AsInteger := Global.TENANT_ID;
    rs.FieldByName('SHOP_ID').AsString :=Global.SHOP_ID;
    rs.FieldByName('CLIENT_ID').AsString := AObj.FieldbyName('CLIENT_ID').AsString;
    rs.FieldByName('SALES_ID').AsString :='';
    rs.FieldByName('CREA_USER').AsString :=Global.UserID;
    rs.FieldByName('CREA_DATE').AsInteger :=StrToInt(FormatDateTime('YYYYMMDD',Date));
    rs.FieldByName('GLIDE_INFO').AsString := '现金转充值：'+edtFLAG_AMT.Text+'元';
    rs.FieldByName('IC_GLIDE_TYPE').AsString := '1';
    rs.FieldByName('GLIDE_MNY').AsFloat := StrtoFloatDef(edtFLAG_AMT.Text,0);
    rs.FieldByName('PAY_A').AsFloat := StrToFloatDef(edtFLAG_AMT.Text,0);
    rs.Post;

    if Factor.UpdateBatch(rs,'TDeposit',nil) then
    begin
      MessageBox(Handle,pchar('现金转充值成功!'),pchar(Application.Title),MB_OK);
    end;
    
  finally
    rs.Free;
    params.Free;
  end;
end;

end.
