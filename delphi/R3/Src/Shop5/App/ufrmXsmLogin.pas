unit ufrmXsmLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmBasic, ExtCtrls, RzPanel, ActnList, Menus, RzButton,
  cxControls, cxContainer, cxEdit, cxTextEdit, StdCtrls, jpeg, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TfrmXsmLogin = class(TfrmBasic)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    Image1: TImage;
    lblName: TLabel;
    lblPass: TLabel;
    edtPassword: TcxTextEdit;
    edtUsername: TcxTextEdit;
    cxBtnOk: TRzBitBtn;
    cxbtnCancel: TRzBitBtn;
    Label1: TLabel;
    edtUrl: TcxTextEdit;
    cdsUnion: TZQuery;
    procedure FormCreate(Sender: TObject);
    procedure cxBtnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxbtnCancelClick(Sender: TObject);
  private
    { Private declarations }
    //xsm_url,xsm_username,xsm_password :string;
  public
    { Public declarations }
    procedure ReadFrom;
    procedure WriteTo;
    procedure SetValue(ID,Value:String);
    class function XsmLogin:Boolean;
  end;

implementation
uses ZBase,ufnUtil,ufrmLogo,uGlobal,EncDec,uShopGlobal,uDsUtil,ufrmIEWebForm;
{$R *.dfm}

procedure TfrmXsmLogin.FormCreate(Sender: TObject);
begin
  inherited;
  xsm_url := ShopGlobal.GetParameter('XSM_URL');
  //if xsm_url='' then xsm_url := 'http://test.xinshangmeng.com/';
  xsm_username := ShopGlobal.GetParameter('XSM_USERNAME');
  //if xsm_username='' then xsm_username := 'testcusta20';
  xsm_password := DecStr(ShopGlobal.GetParameter('XSM_PASSWORD'),ENC_KEY);
  //if xsm_password='' then xsm_password := 'admin';
end;

procedure TfrmXsmLogin.ReadFrom;
begin
  cdsUnion.Close;
  cdsUnion.SQL.Text := 'select * from SYS_DEFINE where TENANT_ID='+IntToStr(Global.TENANT_ID)+' and DEFINE like ''%_'+Global.SHOP_ID+'''';
  Factor.Open(cdsUnion);
  if cdsUnion.Locate('DEFINE','XSM_URL_'+Global.SHOP_ID,[]) then
    edtUrl.Text := copy(cdsUnion.FieldbyName('VALUE').AsString,8,length(cdsUnion.FieldbyName('VALUE').AsString)-8);
  if cdsUnion.Locate('DEFINE','XSM_USERNAME_'+Global.SHOP_ID,[]) then
    edtUsername.Text := cdsUnion.FieldbyName('VALUE').AsString;
end;

procedure TfrmXsmLogin.SetValue(ID, Value: String);
begin
  if cdsUnion.Locate('DEFINE',ID,[]) then
    cdsUnion.Edit
  else
    cdsUnion.Append;
  cdsUnion.FieldByName('DEFINE').AsString := ID;
  cdsUnion.FieldByName('TENANT_ID').AsString := IntToStr(Global.TENANT_ID);
  cdsUnion.FieldByName('VALUE').AsString := Value;
  cdsUnion.FieldByName('VALUE_TYPE').AsString := '0';
  cdsUnion.Post;
end;

procedure TfrmXsmLogin.WriteTo;
begin
  SetValue('XSM_URL_'+Global.SHOP_ID,'http://'+Trim(edtUrl.Text)+'/');
  SetValue('XSM_USERNAME_'+Global.SHOP_ID,Trim(edtUsername.Text));
  SetValue('XSM_PASSWORD_'+Global.SHOP_ID,EncStr(Trim(edtPassword.Text),ENC_KEY));
end;

procedure TfrmXsmLogin.cxBtnOkClick(Sender: TObject);
begin
  inherited;
  if Trim(edtUrl.Text) = '' then
    begin
       edtUrl.SetFocus;
       Raise Exception.Create('���������˵�ַ��');
    end;
  if Trim(edtUsername.Text) = '' then
    begin
       edtUsername.SetFocus;
       Raise Exception.Create('�������û�����');
    end;
  if Trim(edtUsername.Text) = '' then
    begin
       edtUsername.SetFocus;
       Raise Exception.Create('���������롣');
    end;
  WriteTo;
  Factor.UpdateBatch(cdsUnion,'TSysDefine');
  ModalResult := MROK;
end;

class function TfrmXsmLogin.XsmLogin: Boolean;
begin
  with TfrmXsmLogin.Create(nil) do
    begin
      try
        if ShowModal = mrOk then
          begin
            xsm_url := 'http://'+Trim(edtUrl.Text)+'/';
            xsm_UserName := Trim(edtUsername.Text);
            xsm_Password := Trim(edtPassword.Text);
            Result := True;
          end
        else 
          Result := False;
      finally
        free;
      end;
    end;
end;

procedure TfrmXsmLogin.FormShow(Sender: TObject);
begin
  inherited;
  ReadFrom;
end;

procedure TfrmXsmLogin.cxbtnCancelClick(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
