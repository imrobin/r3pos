unit ufrmMMBasic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzForms, RzBckgnd, RzPanel,DbGridEh, RzBmpBtn, StdCtrls,
  jpeg,ufrmBasic, uRcFactory;

type
  TfrmMMBasic = class(TfrmBasic)
    bgk_tt: TRzPanel;
    bkg_bb: TRzPanel;
    bkg_01: TImage;
    RzPanel10: TRzPanel;
    bkg_03: TImage;
    RzPanel11: TRzPanel;
    bkg_04: TImage;
    bkg_top: TRzPanel;
    bkg_bottom: TRzPanel;
    RzSeparator3: TRzSeparator;
    bkg_f2: TRzBackground;
    bkg: TRzPanel;
    bkg_pnl: TRzPanel;
    RzFormShape1: TRzFormShape;
    RzSeparator1: TRzSeparator;
    bkg_f1: TRzBackground;
    formLogo: TImage;
    sysMinimized: TRzBmpButton;
    sysMaximized: TRzBmpButton;
    sysClose: TRzBmpButton;
    bkg_02: TImage;
    procedure sysCloseClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sysMaximizedClick(Sender: TObject);
    procedure sysMinimizedClick(Sender: TObject);
  private
    procedure OnEnterPress(CurrentForm: TForm; Key: Char);
    procedure WMNCHITTEST(var Msg: TWMNCHITTEST);  message WM_NCHITTEST;
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy;override;
    procedure LoadPic32;
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
  RzFormShape1.Enabled := not (WindowState = wsMaximized);
end;

procedure TfrmMMBasic.FormCreate(Sender: TObject);
begin
  BorderStyle := bsNone;
  bkg_01.Picture.Bitmap.TransparentColor := clFuchsia;
  bkg_01.Picture.Bitmap.TransparentMode := tmFixed;
  bkg_01.Picture.Bitmap.Transparent := true;
  bkg_02.Picture.Bitmap.TransparentColor := clFuchsia;
  bkg_02.Picture.Bitmap.TransparentMode := tmFixed;
  bkg_02.Picture.Bitmap.Transparent := true;
  bkg_03.Picture.Bitmap.TransparentColor := clFuchsia;
  bkg_03.Picture.Bitmap.TransparentMode := tmFixed;
  bkg_03.Picture.Bitmap.Transparent := true;
  bkg_04.Picture.Bitmap.TransparentColor := clFuchsia;
  bkg_04.Picture.Bitmap.TransparentMode := tmFixed;
  bkg_04.Picture.Bitmap.Transparent := true;
  bkg_f1.Anchors := [akTop,akRight];
  bkg_f1.Top := 2;
  bkg_f1.Left := bkg_top.Width - bkg_f1.Width;
  bkg_f1.Height := BKG_top.Height;
  sysClose.Left := bgk_tt.Width - sysClose.Width -0 ;
  RzFormShape1.Enabled := not (WindowState = wsMaximized);
  
  sysMaximized.Top := 0;
  sysMinimized.Top := 0;
  sysClose.Top := 0;

  if biMaximize in BorderIcons then
     begin
       sysMaximized.Left := sysClose.Left - sysMaximized.Width -1 ;
       sysMinimized.Left := sysMaximized.Left - sysMinimized.Width -1 ;
     end
  else
     begin
       sysMaximized.Visible := false;
       sysMinimized.Left := sysClose.Left - sysMinimized.Width -1 ;
     end;
  sysMinimized.Visible := (biMinimize in BorderIcons);

  
end;

procedure TfrmMMBasic.sysMaximizedClick(Sender: TObject);
begin
  if WindowState = wsMaximized then
     WindowState := wsNormal
  else
     WindowState := wsMaximized;
end;

procedure TfrmMMBasic.sysMinimizedClick(Sender: TObject);
begin
  WindowState := wsMinimized;
end;
constructor TfrmMMBasic.Create(AOwner: TComponent);
begin
  inherited;
  LoadPic32;
end;

destructor TfrmMMBasic.Destroy;
begin

  inherited;
end;

procedure TfrmMMBasic.LoadPic32;
var
  sflag:String;
begin
  sflag := 'm'+rcFactory.GetResString(1)+'_';
  //Top
  bkg_01.Picture.Graphic := rcFactory.GetBitmap(sflag + 'Basic_top_bkg_01');
  bkg_02.Picture.Graphic := rcFactory.GetBitmap(sflag + 'Basic_top_bkg_02');
  formLogo.Picture.Graphic := rcFactory.GetBitmap(sflag + 'Basic_top_formLogo');
  sysClose.Bitmaps.Up := rcFactory.GetBitmap(sflag + 'Basic_top_sysClose_Up');
  sysClose.Bitmaps.Hot := rcFactory.GetBitmap(sflag + 'Basic_top_sysClose_Hot');
  sysMinimized.Bitmaps.Up := rcFactory.GetBitmap(sflag + 'Basic_top_sysMinimized_Up');
  sysMinimized.Bitmaps.Hot := rcFactory.GetBitmap(sflag + 'Basic_top_sysMinimized_Hot');
  sysMaximized.Bitmaps.Up := rcFactory.GetBitmap(sflag + 'Basic_top_sysMaximized_Up');
  sysMaximized.Bitmaps.Hot := rcFactory.GetBitmap(sflag + 'Basic_top_sysMaximized_Hot');
  //bottom
  bkg_03.Picture.Graphic := rcFactory.GetBitmap(sflag + 'Basic_bottom_bkg_03');
  bkg_04.Picture.Graphic := rcFactory.GetBitmap(sflag + 'Basic_bottom_bkg_04');
end;

end.
