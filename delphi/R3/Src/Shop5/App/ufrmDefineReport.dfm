inherited frmDefineReport: TfrmDefineReport
  Left = 391
  Top = 171
  Caption = #25253#34920#26679#24335
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  inherited bgPanel: TRzPanel
    BorderColor = clWhite
    Color = clWhite
    inherited RzPage: TRzPageControl
      Top = 91
      Height = 251
      ActivePage = TabSheet2
      TabIndex = 1
      FixedDimension = 20
      inherited TabSheet1: TRzTabSheet
        Color = clWhite
        Caption = #34920#22836#34892
        inherited RzPanel2: TRzPanel
          Height = 224
          BorderColor = clWhite
          Color = clWhite
          object DBGridEh1: TDBGridEh
            Left = 5
            Top = 5
            Width = 446
            Height = 214
            Align = alClient
            AutoFitColWidths = True
            DataSource = CdsReportTemplate
            Flat = True
            FooterColor = clWindow
            FooterFont.Charset = GB2312_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -12
            FooterFont.Name = #23435#20307
            FooterFont.Style = []
            ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection]
            RowHeight = 17
            TabOrder = 0
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            TitleHeight = 16
            UseMultiTitle = True
            IsDrawNullRow = False
            CurrencySymbol = #65509
            DecimalNumber = 2
            DigitalNumber = 12
            OnDrawColumnCell = DBGridEh1DrawColumnCell
            Columns = <
              item
                Checkboxes = True
                EditButtons = <>
                FieldName = 'SEQNO'
                Footers = <>
                KeyList.Strings = (
                  '1'
                  '0')
                PickList.Strings = (
                  '0'
                  '1')
                Title.Caption = #24207#21495
                Title.Color = clWhite
                Width = 30
              end
              item
                EditButtons = <>
                FieldName = 'DISPLAY_NAME'
                Footers = <>
                Title.Caption = #26174#31034#21517#31216
                Title.Color = clWhite
                Width = 160
              end
              item
                EditButtons = <>
                FieldName = 'CELL_WIDTH'
                Footers = <>
                Title.Caption = #21015#23485
                Title.Color = clWhite
                Width = 40
              end
              item
                ButtonStyle = cbsEllipsis
                EditButtons = <>
                FieldName = 'FIELD_NAME_TEXT'
                Footers = <>
                ReadOnly = True
                Title.Caption = #25968#25454#23383#27573
                Title.Color = clWhite
                Width = 60
                OnEditButtonClick = DBGridEh1Columns2EditButtonClick
              end
              item
                AutoDropDown = True
                EditButtons = <>
                FieldName = 'SUM_TYPE'
                Footers = <>
                Title.Caption = #27719#24635#31867#22411
                Title.Color = clWhite
                Width = 35
                OnUpdateData = DBGridEh1Columns3UpdateData
              end
              item
                EditButtons = <>
                FieldName = 'INDEX_FLAG'
                Footers = <>
                Title.Caption = #25351#26631#31867#22411
                Title.Color = clWhite
                Width = 60
              end
              item
                Checkboxes = True
                EditButtons = <>
                FieldName = 'SUB_FLAG'
                Footers = <>
                KeyList.Strings = (
                  '2'
                  '1')
                Title.Caption = #26159#21542#23567#35745
                Title.Color = clWhite
                Width = 30
              end>
          end
          object RzPanel1: TRzPanel
            Left = 451
            Top = 5
            Width = 78
            Height = 214
            Align = alRight
            BorderOuter = fsNone
            Color = clWhite
            TabOrder = 1
            object BtnAdd: TRzBitBtn
              Left = 9
              Top = 17
              Width = 61
              Height = 26
              Caption = #26032#22686
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
              OnClick = BtnAddClick
              NumGlyphs = 2
              Spacing = 5
            end
            object BtnDelete: TRzBitBtn
              Left = 9
              Top = 49
              Width = 61
              Height = 26
              Caption = #21024#38500
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
              OnClick = BtnDeleteClick
              NumGlyphs = 2
              Spacing = 5
            end
            object BtnUpRow: TRzBitBtn
              Left = 25
              Top = 80
              Width = 30
              Height = 26
              Caption = #8593
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
              TabOrder = 2
              TextStyle = tsRaised
              ThemeAware = False
              OnClick = BtnUpRowClick
              NumGlyphs = 2
              Spacing = 5
            end
            object BtnNextRow: TRzBitBtn
              Left = 25
              Top = 135
              Width = 30
              Height = 26
              Caption = #8595
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
              TabOrder = 3
              TextStyle = tsRaised
              ThemeAware = False
              OnClick = BtnNextRowClick
              NumGlyphs = 2
              Spacing = 5
            end
            object BtnRightRow: TRzBitBtn
              Left = 44
              Top = 108
              Width = 30
              Height = 26
              Caption = #8594
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
              TabOrder = 4
              TextStyle = tsRaised
              ThemeAware = False
              OnClick = BtnRightRowClick
              NumGlyphs = 2
              Spacing = 5
            end
            object BtnLeftRow: TRzBitBtn
              Left = 5
              Top = 108
              Width = 30
              Height = 26
              Caption = #8592
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
              TabOrder = 5
              TextStyle = tsRaised
              ThemeAware = False
              OnClick = BtnLeftRowClick
              NumGlyphs = 2
              Spacing = 5
            end
            object btnSort: TRzBitBtn
              Left = 3
              Top = 165
              Width = 70
              Height = 26
              Caption = #23383#27573#25490#24207
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
              TabOrder = 6
              TextStyle = tsRaised
              ThemeAware = False
              OnClick = btnSortClick
              NumGlyphs = 2
              Spacing = 5
            end
          end
        end
      end
      object TabSheet2: TRzTabSheet
        Color = clWhite
        Caption = #25968#25454#34892
        object RzPanel5: TRzPanel
          Left = 0
          Top = 0
          Width = 534
          Height = 224
          Align = alClient
          BorderOuter = fsNone
          BorderColor = clWhite
          BorderWidth = 5
          Color = clWhite
          TabOrder = 0
          object RzPanel4: TRzPanel
            Left = 451
            Top = 5
            Width = 78
            Height = 214
            Align = alRight
            BorderOuter = fsNone
            Color = clWhite
            TabOrder = 0
            object BtnAdd1: TRzBitBtn
              Left = 11
              Top = 17
              Width = 61
              Height = 26
              Caption = #26032#22686
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
              OnClick = BtnAdd1Click
              NumGlyphs = 2
              Spacing = 5
            end
            object BtnDelete1: TRzBitBtn
              Left = 11
              Top = 49
              Width = 61
              Height = 26
              Caption = #21024#38500
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
              OnClick = BtnDelete1Click
              NumGlyphs = 2
              Spacing = 5
            end
            object BtnUpRow1: TRzBitBtn
              Left = 25
              Top = 80
              Width = 30
              Height = 26
              Caption = #8593
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
              TabOrder = 2
              TextStyle = tsRaised
              ThemeAware = False
              OnClick = BtnUpRow1Click
              NumGlyphs = 2
              Spacing = 5
            end
            object BtnDownRow1: TRzBitBtn
              Left = 25
              Top = 135
              Width = 30
              Height = 26
              Caption = #8595
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
              TabOrder = 3
              TextStyle = tsRaised
              ThemeAware = False
              OnClick = BtnDownRow1Click
              NumGlyphs = 2
              Spacing = 5
            end
            object BtnRightRow1: TRzBitBtn
              Left = 44
              Top = 108
              Width = 30
              Height = 26
              Caption = #8594
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
              TabOrder = 4
              TextStyle = tsRaised
              ThemeAware = False
              OnClick = BtnRightRow1Click
              NumGlyphs = 2
              Spacing = 5
            end
            object BtnLeftRow1: TRzBitBtn
              Left = 5
              Top = 108
              Width = 30
              Height = 26
              Caption = #8592
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
              TabOrder = 5
              TextStyle = tsRaised
              ThemeAware = False
              OnClick = BtnLeftRow1Click
              NumGlyphs = 2
              Spacing = 5
            end
          end
          object DBGridEh2: TDBGridEh
            Left = 5
            Top = 5
            Width = 446
            Height = 214
            Align = alClient
            DataSource = CdsReportTemplate1
            Flat = True
            FooterColor = clWindow
            FooterFont.Charset = GB2312_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -12
            FooterFont.Name = #23435#20307
            FooterFont.Style = []
            ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection]
            RowHeight = 17
            TabOrder = 1
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            TitleHeight = 16
            UseMultiTitle = True
            IsDrawNullRow = False
            CurrencySymbol = #65509
            DecimalNumber = 2
            DigitalNumber = 12
            OnCellClick = DBGridEh2CellClick
            OnDrawColumnCell = DBGridEh2DrawColumnCell
            Columns = <
              item
                Checkboxes = True
                EditButtons = <>
                FieldName = 'SEQNO'
                Footers = <>
                KeyList.Strings = (
                  '1'
                  '0')
                PickList.Strings = (
                  '0'
                  '1')
                Title.Caption = #24207#21495
                Title.Color = clWhite
                Width = 30
              end
              item
                EditButtons = <>
                FieldName = 'DISPLAY_NAME'
                Footers = <>
                Title.Caption = #26174#31034#21517#31216
                Title.Color = clWhite
                Width = 160
              end
              item
                EditButtons = <>
                FieldName = 'INDEX_FLAG'
                Footers = <>
                Title.Caption = #25351#26631#31867#22411
                Title.Color = clWhite
                Width = 80
              end>
          end
        end
      end
      object TabSheet3: TRzTabSheet
        Color = clWhite
        Caption = #35282#33394#26435#38480
        object RzPanel6: TRzPanel
          Left = 0
          Top = 0
          Width = 534
          Height = 224
          Align = alClient
          BorderOuter = fsNone
          BorderColor = clWhite
          Color = clWhite
          TabOrder = 0
          object DBGridEh3: TDBGridEh
            Left = 0
            Top = 0
            Width = 534
            Height = 224
            Align = alClient
            AllowedOperations = [alopUpdateEh]
            DataSource = RoleDs
            Flat = True
            FooterColor = clWindow
            FooterFont.Charset = GB2312_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -12
            FooterFont.Name = #23435#20307
            FooterFont.Style = []
            FrozenCols = 2
            ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            OptionsEh = [dghFixed3D, dghFrozen3D, dghHighlightFocus, dghClearSelection]
            RowHeight = 20
            TabOrder = 0
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            TitleHeight = 20
            UseMultiTitle = True
            IsDrawNullRow = False
            CurrencySymbol = #65509
            DecimalNumber = 2
            DigitalNumber = 12
            Columns = <
              item
                Checkboxes = True
                Color = clWhite
                EditButtons = <>
                FieldName = 'selflag'
                Footers = <>
                KeyList.Strings = (
                  '1'
                  '0')
                PickList.Strings = (
                  '0'
                  '1')
                Title.Caption = #36873#25321
                Title.Color = clWhite
                Width = 36
              end
              item
                EditButtons = <>
                FieldName = 'ROLE_NAME'
                Footers = <>
                Title.Caption = #35282#33394#21517#31216
                Title.Color = clWhite
                Width = 83
              end
              item
                EditButtons = <>
                FieldName = 'REMARK'
                Footers = <>
                Title.Caption = #25551#36848
                Title.Color = clWhite
                Width = 212
              end>
          end
        end
      end
    end
    inherited btPanel: TRzPanel
      BorderColor = clWhite
      Color = clWhite
      object btnSave: TRzBitBtn
        Left = 382
        Top = 9
        Width = 67
        Height = 26
        Caption = #20445#23384'(&S)'
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
        OnClick = btnSaveClick
        NumGlyphs = 2
        Spacing = 5
      end
      object btnExit: TRzBitBtn
        Left = 461
        Top = 9
        Width = 67
        Height = 26
        Caption = #21462#28040'(&C)'
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
        OnClick = btnExitClick
        NumGlyphs = 2
        Spacing = 5
      end
    end
    object RzPanel3: TRzPanel
      Left = 5
      Top = 5
      Width = 538
      Height = 86
      Align = alTop
      BorderOuter = fsNone
      Color = clWhite
      TabOrder = 2
      object Label7: TLabel
        Left = 3
        Top = 23
        Width = 80
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        Caption = #25253#34920#21517#31216
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 283
        Top = 23
        Width = 80
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        Caption = #25340#38899#30721
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 3
        Top = 50
        Width = 80
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        Caption = #25253#34920#31867#22411
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 283
        Top = 50
        Width = 80
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        Caption = #25968#25454#28304
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object RzLabel7: TRzLabel
        Left = 276
        Top = 23
        Width = 6
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        Caption = '*'
        Font.Charset = GB2312_CHARSET
        Font.Color = clMaroon
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object RzLabel1: TRzLabel
        Left = 492
        Top = 23
        Width = 6
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        Caption = '*'
        Font.Charset = GB2312_CHARSET
        Font.Color = clMaroon
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object edtREPORT_NAME: TcxTextEdit
        Left = 88
        Top = 19
        Width = 186
        Height = 20
        Properties.OnChange = edtREPORT_NAMEPropertiesChange
        TabOrder = 0
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
      object edtREPORT_SPELL: TcxTextEdit
        Left = 368
        Top = 19
        Width = 121
        Height = 20
        TabOrder = 1
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
      object edtREPORT_TYPE: TcxComboBox
        Left = 88
        Top = 46
        Width = 121
        Height = 20
        Enabled = False
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 2
      end
      object edtREPORT_SOURCE: TcxComboBox
        Left = 368
        Top = 46
        Width = 121
        Height = 20
        Enabled = False
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 3
      end
    end
  end
  inherited mmMenu: TMainMenu
    Left = 79
    Top = 356
  end
  inherited actList: TActionList
    Left = 113
    Top = 356
  end
  object DsReport: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    Params = <>
    Left = 46
    Top = 292
  end
  object DsReportTemplate: TZQuery
    SortedFields = 'CELL_COL;CELL_ROW'
    FieldDefs = <>
    AfterScroll = DsReportTemplateAfterScroll
    CachedUpdates = True
    Params = <>
    IndexFieldNames = 'CELL_COL Asc;CELL_ROW Asc'
    Left = 46
    Top = 356
  end
  object CdsReportTemplate: TDataSource
    DataSet = DsReportTemplate
    Left = 14
    Top = 356
  end
  object DsReportTemplate1: TZQuery
    SortedFields = 'CELL_ROW;CELL_COL'
    FieldDefs = <>
    CachedUpdates = True
    Params = <>
    IndexFieldNames = 'CELL_ROW Asc;CELL_COL Asc'
    Left = 46
    Top = 324
  end
  object CdsReportTemplate1: TDataSource
    DataSet = DsReportTemplate1
    Left = 14
    Top = 324
  end
  object RoleDs: TDataSource
    DataSet = RoleList
    Left = 188
    Top = 356
  end
  object RoleList: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    Params = <>
    Left = 150
    Top = 357
  end
end
