unit ufrmMktKpiResultList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uframeDialogForm, ActnList, Menus, RzTabs, ExtCtrls, RzPanel,
  RzButton, Grids, DBGridEh, cxMaskEdit, cxDropDownEdit, cxControls,
  cxContainer, cxEdit, cxTextEdit, StdCtrls, RzLabel, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TfrmMktKpiResultList = class(TframeDialogForm)
    DBGridEh1: TDBGridEh;
    btnClose: TRzBitBtn;
    RzPanel1: TRzPanel;
    lab_KPI_NAME: TRzLabel;
    lab_IDX_TYPE: TRzLabel;
    lab_KPI_DATA: TLabel;
    lab_KPI_CALC: TLabel;
    lab_KPI_TYPE: TLabel;
    edtKPI_NAME: TcxTextEdit;
    edtIDX_TYPE: TcxComboBox;
    edtKPI_DATA: TcxComboBox;
    edtKPI_CALC: TcxComboBox;
    edtKPI_TYPE: TcxComboBox;
    DsList: TDataSource;
    CdsList: TZQuery;
    procedure btnCloseClick(Sender: TObject);
    procedure edtKPI_DATAPropertiesChange(Sender: TObject);
    procedure edtIDX_TYPEPropertiesChange(Sender: TObject);
    procedure edtKPI_CALCPropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private
    DisplayPer:Boolean;
    KpiAgioFront,KpiAgioBack:String;
    FKpiData: String;
    FKpiCalc: String;
    FKpiType: String;
    FIdxType: String;
    FKpiName: String;
    FKpiYear: String;
    procedure SetKpiCalc(const Value: String);
    procedure SetKpiData(const Value: String);
    procedure SetKpiType(const Value: String);
    procedure SetIdxType(const Value: String);
    procedure SetKpiName(const Value: String);
    procedure ShowGrid;
    procedure SetKpiYear(const Value: String);
    { Private declarations }
  public
    { Public declarations }
    procedure Open(Id:String);
    procedure SaveInterfaceToFile;
    procedure LoadInterfaceFromFile;
    class function ShowDialog(Owner:TForm;Id,K_Name,K_Type,K_Data,K_Calc,I_Type:String):Boolean;
    property KpiType:String read FKpiType write SetKpiType;
    property KpiData:String read FKpiData write SetKpiData;
    property KpiCalc:String read FKpiCalc write SetKpiCalc;
    property IdxType:String read FIdxType write SetIdxType;
    property KpiYear:String read FKpiYear write SetKpiYear;
    property KpiName:String write SetKpiName;
  end;

implementation
uses uGlobal,uCtrlUtil, ufrmBasic, uDsUtil;
{$R *.dfm}

{ TfrmMktKpiResultList }

procedure TfrmMktKpiResultList.Open(Id: String);
begin
  CdsList.Close;
  CdsList.SQL.Text := 'select KPI_LV,SEQNO,KPI_RATE,KPI_AMT,('+FormatDateTime('YYYY',Date())+'*10000+KPI_DATE1) as KPI_DATE1,'+
  'case when KPI_DATE1>KPI_DATE2 then (('+KpiYear+'+1)*10000+KPI_DATE2) else ('+KpiYear+'*10000+KPI_DATE2) end as KPI_DATE2,'+
  'KPI_AGIO,FSH_VLE,KPI_MNY  from MKT_KPI_RESULT_LIST where TENANT_ID='+IntToStr(Global.TENANT_ID)+' and PLAN_ID='+QuotedStr(Id)+' order by KPI_LV,SEQNO';
  Factor.Open(CdsList);
end;

procedure TfrmMktKpiResultList.SetIdxType(const Value: String);
begin
  FIdxType := Value;
  edtIDX_TYPE.ItemIndex := TdsItems.FindItems(edtIDX_TYPE.Properties.Items,'CODE_ID',Value);
end;

procedure TfrmMktKpiResultList.SetKpiCalc(const Value: String);
begin
  FKpiCalc := Value;
  edtKPI_CALC.ItemIndex := TdsItems.FindItems(edtKPI_CALC.Properties.Items,'CODE_ID',Value);
end;

procedure TfrmMktKpiResultList.SetKpiData(const Value: String);
begin
  FKpiData := Value;
  edtKPI_DATA.ItemIndex := TdsItems.FindItems(edtKPI_DATA.Properties.Items,'CODE_ID',Value);
end;

procedure TfrmMktKpiResultList.SetKpiName(const Value: String);
begin
  FKpiName := Value;
  edtKPI_NAME.Text := Value;
end;

procedure TfrmMktKpiResultList.SetKpiType(const Value: String);
begin
  FKpiType := Value;
  edtKPI_TYPE.ItemIndex := TdsItems.FindItems(edtKPI_TYPE.Properties.Items,'CODE_ID',Value);
end;

class function TfrmMktKpiResultList.ShowDialog(Owner: TForm; Id,
  K_Name,K_Type, K_Data, K_Calc, I_Type: String): Boolean;
begin
  with TfrmMktKpiResultList.Create(Owner) do
  begin
    try
      KpiName := K_Name;
      KpiType := K_Type;
      KpiData := K_Data;
      KpiCalc := K_Calc;
      IdxType := I_Type;
      Open(Id);
      ShowModal;
    finally
      Free;
    end;
  end;
end;

procedure TfrmMktKpiResultList.btnCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmMktKpiResultList.edtKPI_DATAPropertiesChange(
  Sender: TObject);
begin
  inherited;
  if edtKPI_DATA.ItemIndex in [0,1,2] then
  begin
     DBGridEh1.FieldColumns['KPI_AMT'].Free;
  end
  else
  begin
     DBGridEh1.FieldColumns['KPI_RATE'].Free;
  end;
end;

procedure TfrmMktKpiResultList.edtIDX_TYPEPropertiesChange(
  Sender: TObject);
begin
  inherited;
  if edtIDX_TYPE.ItemIndex = 0 then
     KpiAgioFront := '����'
  else if edtIDX_TYPE.ItemIndex = 1 then
     KpiAgioFront := '����'
  else if edtIDX_TYPE.ItemIndex = 2 then
     KpiAgioFront := '���';

  ShowGrid;
end;

procedure TfrmMktKpiResultList.ShowGrid;
begin
  if DisplayPer then
  begin
    DBGridEh1.FieldColumns['KPI_AGIO'].Title.Caption := KpiAgioFront + KpiAgioBack;
    DBGridEh1.FieldColumns['KPI_AGIO'].DisplayFormat := '#0%';
  end
  else
  begin
    DBGridEh1.FieldColumns['KPI_AGIO'].Title.Caption := KpiAgioFront + KpiAgioBack;
    DBGridEh1.FieldColumns['KPI_AGIO'].DisplayFormat := '';
  end;
end;

procedure TfrmMktKpiResultList.edtKPI_CALCPropertiesChange(
  Sender: TObject);
begin
  inherited;
  if edtKPI_CALC.ItemIndex in [0,3] then
  begin
     KpiAgioBack := 'ϵ��';
     DisplayPer := False;
  end
  else if edtKPI_CALC.ItemIndex in [1,2,4,5] then
  begin
     KpiAgioBack := '����';
     DisplayPer := True;
  end;
  ShowGrid;
end;

procedure TfrmMktKpiResultList.FormShow(Sender: TObject);
begin
  inherited;
  dbState := dsBrowse;
  DBGridEh1.PopupMenu :=nil; 
end;

procedure TfrmMktKpiResultList.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var ARect:TRect;
begin
  inherited;
  if (Rect.Top = DBGridEh1.CellRect(DBGridEh1.Col, DBGridEh1.Row).Top) and (not
    (gdFocused in State) or not DBGridEh1.Focused) then
  begin
    DBGridEh1.Canvas.Brush.Color := clAqua;
  end;
  DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TfrmMktKpiResultList.LoadInterfaceFromFile;
begin

end;

procedure TfrmMktKpiResultList.SaveInterfaceToFile;
begin

end;

procedure TfrmMktKpiResultList.SetKpiYear(const Value: String);
begin
  FKpiYear := Value;
end;

end.