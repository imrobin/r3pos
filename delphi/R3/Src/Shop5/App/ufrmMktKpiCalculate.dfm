inherited frmMktKpiCalculate: TfrmMktKpiCalculate
  Left = 674
  Top = 303
  Width = 366
  Height = 237
  BorderIcons = [biSystemMenu]
  Caption = #32771#26680#35745#31639
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object RzPanel1: TRzPanel [0]
    Left = 0
    Top = 0
    Width = 358
    Height = 210
    Align = alClient
    BorderOuter = fsNone
    Color = clWhite
    TabOrder = 0
    object RzPanel2: TRzPanel
      Left = 0
      Top = 0
      Width = 358
      Height = 158
      Align = alClient
      BorderOuter = fsNone
      Color = clWhite
      TabOrder = 0
      object RzLabel4: TRzLabel
        Left = 46
        Top = 49
        Width = 48
        Height = 12
        Alignment = taRightJustify
        Caption = #32463' '#38144' '#21830
      end
      object RzLabel7: TRzLabel
        Left = 46
        Top = 18
        Width = 48
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        Caption = #24180'    '#24230
      end
      object ProgressBar1: TRzProgressBar
        Left = 41
        Top = 129
        Width = 280
        Height = 17
        BorderInner = fsFlatRounded
        BorderOuter = fsFlatRounded
        BorderWidth = 0
        InteriorOffset = 0
        PartsComplete = 0
        Percent = 0
        TotalParts = 0
      end
      object RzLabel1: TRzLabel
        Left = 46
        Top = 81
        Width = 48
        Height = 12
        Alignment = taRightJustify
        Caption = #25351'    '#26631
      end
      object labINFO: TLabel
        Left = 56
        Top = 112
        Width = 52
        Height = 12
        Caption = #20449#24687#25552#31034
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object fndCLIENT_ID: TzrComboBoxList
        Left = 102
        Top = 45
        Width = 215
        Height = 20
        Properties.AutoSelect = False
        Properties.Buttons = <
          item
            Default = True
          end>
        Properties.ReadOnly = False
        TabOrder = 0
        InGrid = False
        KeyValue = Null
        FilterFields = 'CLIENT_CODE;CLIENT_NAME;CLIENT_SPELL'
        KeyField = 'CLIENT_ID'
        ListField = 'CLIENT_NAME'
        Columns = <
          item
            EditButtons = <>
            FieldName = 'CLIENT_CODE'
            Footers = <>
            Title.Caption = #20195#30721
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'CLIENT_NAME'
            Footers = <>
            Title.Caption = #20379#24212#21830#21517#31216
            Width = 150
          end
          item
            EditButtons = <>
            FieldName = 'LINKMAN'
            Footers = <>
            Title.Caption = #32852#31995#20154
            Width = 70
          end
          item
            EditButtons = <>
            FieldName = 'TELEPHONE2'
            Footers = <>
            Title.Caption = #32852#31995#30005#35805
            Width = 70
          end
          item
            EditButtons = <>
            FieldName = 'LICENSE_CODE'
            Footers = <>
            Title.Caption = #35777#20214#21495
            Width = 70
          end
          item
            EditButtons = <>
            FieldName = 'ADDRESS'
            Footers = <>
            Title.Caption = #22320#22336
            Width = 150
          end>
        DropWidth = 236
        DropHeight = 180
        ShowTitle = True
        AutoFitColWidth = False
        ShowButton = True
        LocateStyle = lsDark
        Buttons = [zbClear]
        DropListStyle = lsFixed
        MultiSelect = False
      end
      object fndKPI_YEAR: TcxSpinEdit
        Left = 102
        Top = 14
        Width = 121
        Height = 20
        Properties.MaxValue = 2111.000000000000000000
        Properties.MinValue = 2011.000000000000000000
        TabOrder = 1
        Value = 2011
      end
      object fndKPI_ID: TzrComboBoxList
        Left = 102
        Top = 77
        Width = 215
        Height = 20
        Properties.AutoSelect = False
        Properties.Buttons = <
          item
            Default = True
          end>
        Properties.ReadOnly = False
        TabOrder = 2
        InGrid = False
        KeyValue = Null
        FilterFields = 'KPI_NAME'
        KeyField = 'KPI_ID'
        ListField = 'KPI_NAME'
        Columns = <
          item
            EditButtons = <>
            FieldName = 'KPI_NAME'
            Footers = <>
            Title.Caption = #21517'    '#31216
            Width = 230
          end>
        DropWidth = 236
        DropHeight = 180
        ShowTitle = True
        AutoFitColWidth = False
        ShowButton = False
        LocateStyle = lsDark
        Buttons = [zbClear]
        DropListStyle = lsFixed
        MultiSelect = False
      end
    end
    object RzPanel3: TRzPanel
      Left = 0
      Top = 158
      Width = 358
      Height = 52
      Align = alBottom
      BorderOuter = fsNone
      Color = clWhite
      TabOrder = 1
      object btnStart: TRzBitBtn
        Left = 190
        Top = 18
        Width = 67
        Height = 24
        Caption = #24320#22987
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
        OnClick = btnStartClick
        ImageIndex = 12
        NumGlyphs = 2
        Spacing = 5
      end
      object btnCancel: TRzBitBtn
        Left = 278
        Top = 18
        Width = 67
        Height = 24
        Caption = #21462#28040
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
        TabOrder = 1
        TextStyle = tsRaised
        ThemeAware = False
        OnClick = btnCancelClick
        ImageIndex = 12
        NumGlyphs = 2
        Spacing = 5
      end
    end
  end
  inherited mmMenu: TMainMenu
    Left = 408
    Top = 176
  end
  inherited actList: TActionList
    Left = 368
    Top = 176
  end
  object cdsHeader: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    Params = <>
    Left = 2
    Top = 148
  end
  object cdsDetail: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    Params = <>
    Left = 2
    Top = 180
  end
  object cdsKpiIndex: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    Params = <>
    Left = 33
    Top = 180
  end
  object cdsKpiOption: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    Params = <>
    Left = 64
    Top = 180
  end
end
