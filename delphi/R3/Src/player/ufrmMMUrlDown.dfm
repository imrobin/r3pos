object frmMMUrlDown: TfrmMMUrlDown
  Left = 261
  Top = 314
  BorderStyle = bsDialog
  Caption = #33410#30446#19979#36733
  ClientHeight = 123
  ClientWidth = 284
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 259
    Height = 68
    Shape = bsFrame
  end
  object RzProgressBar1: TRzProgressBar
    Left = 14
    Top = 44
    Width = 246
    Height = 17
    BorderOuter = fsFlatRounded
    BorderWidth = 0
    InteriorOffset = 0
    PartsComplete = 0
    Percent = 0
    TotalParts = 0
  end
  object RzLabel1: TRzLabel
    Left = 15
    Top = 23
    Width = 213
    Height = 12
    AutoSize = False
    Caption = #29366#24577'...'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object btnCancel: TRzBitBtn
    Left = 186
    Top = 81
    Width = 67
    Height = 24
    Caption = #19979#36733
    Color = clSilver
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    HighlightColor = 16026986
    HotTrack = True
    HotTrackColor = 3983359
    HotTrackColorType = htctActual
    ParentFont = False
    TextShadowColor = clWhite
    TextShadowDepth = 4
    TabOrder = 0
    TextStyle = tsRaised
    ThemeAware = False
    OnClick = btnCancelClick
    ImageIndex = 12
    NumGlyphs = 2
    Spacing = 5
  end
  object Timer1: TTimer
    Interval = 60000
    OnTimer = Timer1Timer
    Left = 72
    Top = 16
  end
  object IdHTTP1: TIdHTTP
    MaxLineAction = maException
    ReadTimeout = 0
    OnWork = IdHTTP1Work
    OnWorkBegin = IdHTTP1WorkBegin
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentType = 'text/html'
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 64
    Top = 72
  end
end
