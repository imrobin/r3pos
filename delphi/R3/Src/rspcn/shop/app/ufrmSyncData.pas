unit ufrmSyncData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmWebDialogForm, ExtCtrls, RzPanel, RzForms, ComCtrls,
  StdCtrls, Buttons, RzBckgnd, jpeg, RzLabel;

const
  MSC_SET_MAX=WM_USER+1;
  MSC_SET_POSITION=WM_USER+2;
  MSC_SET_CAPTION=WM_USER+3;
  MSC_SET_CLOSE=WM_USER+4;

type
  TfrmSyncData = class(TfrmWebDialogForm)
    RzPanel1: TRzPanel;
    ProgressBar1: TProgressBar;
    Image2: TImage;
    label1: TRzLabel;
    procedure FormCreate(Sender: TObject);
  private
    FShowTitle: string;
    FPosition: integer;
    procedure SetShowTitle(const Value: string);
    procedure SetPosition(const Value: integer);
    procedure SetMax(const Value: integer);
    procedure WM_SetMax(var Message: TMessage); message MSC_SET_MAX;
    procedure WM_SetCaption(var Message: TMessage); message MSC_SET_CAPTION;
    procedure WM_SetPosition(var Message: TMessage); message MSC_SET_POSITION;
    procedure WM_SetClose(var Message: TMessage); message MSC_SET_CLOSE;
  public
    procedure ajustPostion;override;
    procedure ShowPostion(Postion:Integer;Caption:String);
    property ShowTitle:string read FShowTitle write SetShowTitle;
    property Position:integer read FPosition write SetPosition;
  end;

var GlobalProTitle:string;

implementation
uses
  uSyncFactory,uRspSyncFactory,uRtcSyncFactory;

{$R *.dfm}

procedure TfrmSyncData.ajustPostion;
begin
  inherited;
  RzPanel1.Left := (webForm.Width - RzPanel1.Width) div 2 -1;
  RzPanel1.Top  :=  227;
end;

procedure TfrmSyncData.SetPosition(const Value: integer);
begin
  if not Visible then Exit;
  FPosition := Value;
  ProgressBar1.Visible := True;
  ProgressBar1.Position := Value;
  Update;
end;

procedure TfrmSyncData.SetShowTitle(const Value: string);
var s:string;
begin
  if not Visible then Exit;
  s := '为了保障您的数据安全，系统正在备份...';//+Value;
  FShowTitle := s;
  Label1.Caption := s;
  Label1.Update;
  Update;
end;

procedure TfrmSyncData.ShowPostion(Postion: Integer; Caption: String);
begin
  BringToFront;
  ProgressBar1.Visible := True;
  ProgressBar1.Position := Postion;
  Label1.Caption := Caption;
  Label1.Update;
  Update;
end;

procedure TfrmSyncData.SetMax(const Value: integer);
begin
  ProgressBar1.Max := Value;
  Update;
end;

procedure TfrmSyncData.FormCreate(Sender: TObject);
begin
  inherited;
  SyncFactory.ProHandle := self.Handle;
  RspSyncFactory.ProHandle := self.Handle;
  RtcSyncFactory.ProHandle := self.Handle;
//  if FileExists(ExtractFilePath(Application.ExeName)+'built-in\images\flash.jpg') then
//     Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'built-in\images\flash.jpg');
end;

procedure TfrmSyncData.WM_SetCaption(var Message: TMessage);
begin
  SetShowTitle(GlobalProTitle);
end;

procedure TfrmSyncData.WM_SetMax(var Message: TMessage);
begin
  SetMax(Message.WParam);
end;

procedure TfrmSyncData.WM_SetPosition(var Message: TMessage);
begin
  SetPosition(Message.WParam);
end;

procedure TfrmSyncData.WM_SetClose(var Message: TMessage);
begin
  Close;
end;

initialization
  RegisterClass(TfrmSyncData);
finalization
  UnRegisterClass(TfrmSyncData);
end.
