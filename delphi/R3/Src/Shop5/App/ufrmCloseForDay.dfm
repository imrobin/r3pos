inherited frmCloseForDay: TfrmCloseForDay
  Left = 328
  Top = 230
  BorderStyle = bsNone
  Caption = #20132#29677#32467#36134
  ClientHeight = 266
  ClientWidth = 435
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object RzPanel1: TRzPanel [0]
    Left = 0
    Top = 0
    Width = 435
    Height = 266
    Align = alClient
    BorderInner = fsGroove
    BorderOuter = fsFlatRounded
    BorderColor = clTeal
    BorderWidth = 3
    Color = clDefault
    TabOrder = 0
    object RzPanel2: TRzPanel
      Left = 7
      Top = 205
      Width = 421
      Height = 54
      Align = alBottom
      BorderOuter = fsFlat
      Color = clDefault
      TabOrder = 0
      DesignSize = (
        421
        54)
      object Btn_Close: TRzBitBtn
        Left = 251
        Top = 15
        Width = 87
        Height = 26
        Anchors = [akTop, akRight]
        Caption = #31245#21518#32467#36134'(&C)'
        Color = clWhite
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        HighlightColor = clLime
        HotTrack = True
        HotTrackColor = 3983359
        HotTrackColorType = htctActual
        ParentFont = False
        TextShadowColor = clWhite
        TextShadowDepth = 4
        TabOrder = 0
        TextStyle = tsRaised
        ThemeAware = False
        OnClick = Btn_CloseClick
        Margin = 4
        NumGlyphs = 4
        Spacing = 5
      end
      object Btn_Save: TRzBitBtn
        Left = 95
        Top = 15
        Width = 87
        Height = 26
        Anchors = [akTop, akRight]
        Caption = #20132#29677#32467#36134'(&S)'
        Color = clWhite
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        HighlightColor = clLime
        HotTrack = True
        HotTrackColor = 3983359
        HotTrackColorType = htctActual
        ParentFont = False
        TextShadowColor = clWhite
        TextShadowDepth = 4
        TabOrder = 1
        TextStyle = tsRaised
        ThemeAware = False
        OnClick = Btn_SaveClick
        Margin = 4
        NumGlyphs = 4
        Spacing = 5
      end
    end
    object RzPanel4: TRzPanel
      Left = 7
      Top = 7
      Width = 421
      Height = 50
      Align = alTop
      BorderOuter = fsFlat
      Color = clDefault
      TabOrder = 1
      object Label5: TLabel
        Left = 226
        Top = 19
        Width = 52
        Height = 12
        Alignment = taRightJustify
        Caption = #32467#36134#26085#26399
        Font.Charset = GB2312_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 28
        Top = 19
        Width = 53
        Height = 12
        Alignment = taRightJustify
        Caption = #25910' '#38134' '#21592
        Font.Charset = GB2312_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object fndCLSE_DATE: TcxTextEdit
        Tag = 1
        Left = 284
        Top = 15
        Width = 105
        Height = 20
        Enabled = False
        ParentFont = False
        Style.Color = 14671839
        Style.Font.Charset = GB2312_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -12
        Style.Font.Name = #23435#20307
        Style.Font.Style = [fsBold]
        TabOrder = 0
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
      object fndCREA_USER: TcxTextEdit
        Tag = 1
        Left = 86
        Top = 15
        Width = 104
        Height = 20
        Enabled = False
        ParentFont = False
        Style.Color = 14671839
        Style.Font.Charset = GB2312_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -12
        Style.Font.Name = #23435#20307
        Style.Font.Style = [fsBold]
        TabOrder = 1
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
    end
    object RzPanel3: TRzPanel
      Left = 7
      Top = 57
      Width = 421
      Height = 148
      Align = alClient
      BorderOuter = fsFlat
      Color = clDefault
      TabOrder = 2
      object labPAY_A: TLabel
        Left = 28
        Top = 11
        Width = 52
        Height = 12
        Alignment = taRightJustify
        Caption = #29616#37329#25903#20184
        Font.Charset = GB2312_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object labPAY_B: TLabel
        Left = 28
        Top = 33
        Width = 52
        Height = 12
        Alignment = taRightJustify
        Caption = #29616#37329#25903#20184
        Font.Charset = GB2312_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object labPAY_C: TLabel
        Left = 28
        Top = 55
        Width = 52
        Height = 12
        Alignment = taRightJustify
        Caption = #29616#37329#25903#20184
        Font.Charset = GB2312_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object labPAY_D: TLabel
        Left = 28
        Top = 77
        Width = 52
        Height = 12
        Alignment = taRightJustify
        Caption = #29616#37329#25903#20184
        Font.Charset = GB2312_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCASH: TLabel
        Left = 225
        Top = 71
        Width = 95
        Height = 20
        Caption = #24403#26085#29616#37329':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clRed
        Font.Height = -20
        Font.Name = #40657#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object labPAY_E: TLabel
        Left = 28
        Top = 99
        Width = 52
        Height = 12
        Alignment = taRightJustify
        Caption = #29616#37329#25903#20184
        Font.Charset = GB2312_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object labPAY_F: TLabel
        Left = 28
        Top = 121
        Width = 52
        Height = 12
        Alignment = taRightJustify
        Caption = #29616#37329#25903#20184
        Font.Charset = GB2312_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object labPAY_G: TLabel
        Left = 28
        Top = 143
        Width = 52
        Height = 12
        Alignment = taRightJustify
        Caption = #29616#37329#25903#20184
        Font.Charset = GB2312_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object labPAY_H: TLabel
        Left = 28
        Top = 165
        Width = 52
        Height = 12
        Alignment = taRightJustify
        Caption = #29616#37329#25903#20184
        Font.Charset = GB2312_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object labPAY_I: TLabel
        Left = 28
        Top = 187
        Width = 52
        Height = 12
        Alignment = taRightJustify
        Caption = #29616#37329#25903#20184
        Font.Charset = GB2312_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object labPAY_J: TLabel
        Left = 28
        Top = 209
        Width = 52
        Height = 12
        Alignment = taRightJustify
        Caption = #29616#37329#25903#20184
        Font.Charset = GB2312_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object Bevel1: TBevel
        Left = 208
        Top = 10
        Width = 1
        Height = 128
      end
      object Label1: TLabel
        Left = 227
        Top = 11
        Width = 52
        Height = 12
        Alignment = taRightJustify
        Caption = #20854#20182#29616#37329
        Font.Charset = GB2312_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object labMNY: TLabel
        Left = 225
        Top = 100
        Width = 95
        Height = 20
        Caption = #24215#20869#20313#39069':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clRed
        Font.Height = -20
        Font.Name = #40657#20307
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object Label3: TLabel
        Left = 227
        Top = 35
        Width = 52
        Height = 12
        Alignment = taRightJustify
        Caption = #24448#26085#29616#37329
        Font.Charset = GB2312_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtPAY_A: TcxTextEdit
        Tag = 1
        Left = 86
        Top = 7
        Width = 104
        Height = 20
        Enabled = False
        ParentFont = False
        Style.Color = 14671839
        Style.Font.Charset = GB2312_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -12
        Style.Font.Name = #23435#20307
        Style.Font.Style = [fsBold]
        TabOrder = 0
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
      object edtPAY_B: TcxTextEdit
        Tag = 1
        Left = 86
        Top = 29
        Width = 104
        Height = 20
        Enabled = False
        ParentFont = False
        Style.Color = 14671839
        Style.Font.Charset = GB2312_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -12
        Style.Font.Name = #23435#20307
        Style.Font.Style = [fsBold]
        TabOrder = 1
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
      object edtPAY_C: TcxTextEdit
        Tag = 1
        Left = 86
        Top = 51
        Width = 104
        Height = 20
        Enabled = False
        ParentFont = False
        Style.Color = 14671839
        Style.Font.Charset = GB2312_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -12
        Style.Font.Name = #23435#20307
        Style.Font.Style = [fsBold]
        TabOrder = 2
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
      object edtPAY_D: TcxTextEdit
        Tag = 1
        Left = 86
        Top = 73
        Width = 104
        Height = 20
        Enabled = False
        ParentFont = False
        Style.Color = 14671839
        Style.Font.Charset = GB2312_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -12
        Style.Font.Name = #23435#20307
        Style.Font.Style = [fsBold]
        TabOrder = 3
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
      object edtPAY_E: TcxTextEdit
        Tag = 1
        Left = 86
        Top = 95
        Width = 104
        Height = 20
        Enabled = False
        ParentFont = False
        Style.Color = 14671839
        Style.Font.Charset = GB2312_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -12
        Style.Font.Name = #23435#20307
        Style.Font.Style = [fsBold]
        TabOrder = 4
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
      object edtPAY_F: TcxTextEdit
        Tag = 1
        Left = 86
        Top = 117
        Width = 104
        Height = 20
        Enabled = False
        ParentFont = False
        Style.Color = 14671839
        Style.Font.Charset = GB2312_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -12
        Style.Font.Name = #23435#20307
        Style.Font.Style = [fsBold]
        TabOrder = 5
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
      object edtPAY_G: TcxTextEdit
        Tag = 1
        Left = 86
        Top = 139
        Width = 104
        Height = 20
        Enabled = False
        ParentFont = False
        Style.Color = 14671839
        Style.Font.Charset = GB2312_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -12
        Style.Font.Name = #23435#20307
        Style.Font.Style = [fsBold]
        TabOrder = 6
        Visible = False
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
      object edtPAY_H: TcxTextEdit
        Tag = 1
        Left = 86
        Top = 161
        Width = 104
        Height = 20
        Enabled = False
        ParentFont = False
        Style.Color = 14671839
        Style.Font.Charset = GB2312_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -12
        Style.Font.Name = #23435#20307
        Style.Font.Style = [fsBold]
        TabOrder = 7
        Visible = False
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
      object edtPAY_I: TcxTextEdit
        Tag = 1
        Left = 86
        Top = 183
        Width = 104
        Height = 20
        Enabled = False
        ParentFont = False
        Style.Color = 14671839
        Style.Font.Charset = GB2312_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -12
        Style.Font.Name = #23435#20307
        Style.Font.Style = [fsBold]
        TabOrder = 8
        Visible = False
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
      object edtPAY_J: TcxTextEdit
        Tag = 1
        Left = 86
        Top = 205
        Width = 104
        Height = 20
        Enabled = False
        ParentFont = False
        Style.Color = 14671839
        Style.Font.Charset = GB2312_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -12
        Style.Font.Name = #23435#20307
        Style.Font.Style = [fsBold]
        TabOrder = 9
        Visible = False
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
      object edtRECV_MNY: TcxTextEdit
        Tag = 1
        Left = 285
        Top = 7
        Width = 104
        Height = 20
        Enabled = False
        ParentFont = False
        Style.Color = 14671839
        Style.Font.Charset = GB2312_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -12
        Style.Font.Name = #23435#20307
        Style.Font.Style = [fsBold]
        TabOrder = 10
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
      object edtHIS_MNY: TcxTextEdit
        Tag = 1
        Left = 285
        Top = 31
        Width = 104
        Height = 20
        Enabled = False
        ParentFont = False
        Style.Color = 14671839
        Style.Font.Charset = GB2312_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -12
        Style.Font.Name = #23435#20307
        Style.Font.Style = [fsBold]
        TabOrder = 11
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
    end
  end
  inherited mmMenu: TMainMenu
    Left = 40
    Top = 320
  end
  inherited actList: TActionList
    Left = 8
    Top = 320
  end
  object cdsTable: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    Params = <>
    Left = 183
    Top = 112
  end
end
