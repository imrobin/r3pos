unit ufrmMMBasic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzForms, RzBckgnd, RzPanel,DbGridEh, RzBmpBtn, StdCtrls;

type
  TfrmMMBasic = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    RzBackground2: TRzBackground;
    RzPanel3: TRzPanel;
    Image1: TImage;
    labType: TLabel;
    sysClose: TRzBmpButton;
    RzBackground3: TRzBackground;
    RzFormShape1: TRzFormShape;
    procedure sysCloseClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormResize(Sender: TObject);
  private
    procedure OnEnterPress(CurrentForm: TForm; Key: Char);
    procedure WMNCHITTEST(var Msg: TWMNCHITTEST);  message WM_NCHITTEST;
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmMMBasic.sysCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMMBasic.OnEnterPress(CurrentForm: TForm; Key: Char);
begin
  with CurrentForm do
  begin
    if (Key = #13) then
    begin
      if (ActiveControl=nil) or
         not ((ActiveControl.ClassNameIs('TcxCustomInnerMemo')) or
              (ActiveControl is TDbGridEh)
              )
      then
      begin
        SendMessage(handle, WM_NEXTDLGCTL, 0, 0);
        while (ActiveControl.ClassNameIs('TcxCustomInnerMemo')) do
           SendMessage(handle, WM_NEXTDLGCTL, 0, 0);
      end;
    end;
  end;
end;

procedure TfrmMMBasic.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#27 then
     Close
  else
     OnEnterPress(Self,Key);

end;

procedure TfrmMMBasic.WMNCHITTEST(var Msg: TWMNCHITTEST);
const
  cOffset = 10;
var
  vPoint: TPoint;
begin
  inherited;
  vPoint := ScreenToClient(Point(Msg.XPos, Msg.YPos));
  if PtInRect(Rect(0, 0, cOffset, cOffset), vPoint) then
    Msg.Result := HTTOPLEFT
  else if PtInRect(Rect(Width - cOffset, Height - cOffset, Width, Height), vPoint) then
    Msg.Result := HTBOTTOMRIGHT
  else if PtInRect(Rect(Width - cOffset, 0, Width, cOffset), vPoint) then
    Msg.Result := HTTOPRIGHT
  else if PtInRect(Rect(0, Height - cOffset, cOffset, Height), vPoint) then
    Msg.Result := HTBOTTOMLEFT
  else if PtInRect(Rect(cOffset, 0, Width - cOffset, cOffset), vPoint) then
    Msg.Result := HTTOP
  else if PtInRect(Rect(0, cOffset, cOffset, Height - cOffset), vPoint) then
    Msg.Result := HTLEFT
  else if PtInRect(Rect(Width - cOffset, cOffset, Width, Height - cOffset), vPoint) then
    Msg.Result := HTRIGHT
  else if PtInRect(Rect(cOffset, Height - cOffset, Width - cOffset, Height), vPoint) then
    Msg.Result := HTBOTTOM;
end;

procedure TfrmMMBasic.FormResize(Sender: TObject);
begin
  if WindowState = wsMaximized then
     SetBounds(Screen.WorkArealeft,Screen.WorkAreaTop,Screen.WorkAreaWidth,Screen.WorkAreaHeight);
end;

end.
