inherited frmJxcTotalReport: TfrmJxcTotalReport
  Top = 103
  Width = 959
  Height = 624
  Caption = #36827#38144#23384#32479#35745#34920
  PixelsPerInch = 96
  TextHeight = 12
  inherited bgPanel: TRzPanel
    Width = 951
    Height = 560
    inherited RzPanel2: TRzPanel
      Width = 941
      Height = 550
      inherited RzPage: TRzPageControl
        Width = 736
        Height = 544
        ActivePage = TabSheet4
        Color = clCream
        ParentColor = False
        TabIndex = 3
        FixedDimension = 25
        inherited TabSheet1: TRzTabSheet
          Color = clCream
          Caption = #22320#21306#36827#38144#23384#32479#35745#34920
          inherited RzPanel3: TRzPanel
            Width = 734
            Height = 517
            inherited Panel4: TPanel
              Width = 724
              Height = 507
              inherited w1: TRzPanel
                Width = 724
                Height = 78
                object RzLabel2: TRzLabel
                  Left = 24
                  Top = 12
                  Width = 48
                  Height = 12
                  Alignment = taRightJustify
                  Caption = #25152#23646#26376#20221
                end
                object RzLabel3: TRzLabel
                  Left = 171
                  Top = 12
                  Width = 12
                  Height = 12
                  Caption = #33267
                end
                object Label7: TLabel
                  Left = 24
                  Top = 56
                  Width = 48
                  Height = 12
                  Caption = #21830#21697#25351#26631
                end
                object Label8: TLabel
                  Left = 581
                  Top = 55
                  Width = 48
                  Height = 12
                  Anchors = [akTop, akRight]
                  Caption = #26174#31034#21333#20301
                end
                object Label5: TLabel
                  Left = 24
                  Top = 34
                  Width = 48
                  Height = 12
                  Caption = #38376#24215#32676#32452
                end
                object Label12: TLabel
                  Left = 290
                  Top = 56
                  Width = 48
                  Height = 12
                  Alignment = taRightJustify
                  Caption = #21830#21697#21517#31216
                end
                object btnOk: TRzBitBtn
                  Left = 480
                  Top = 40
                  Width = 67
                  Height = 32
                  Action = actFind
                  Caption = #26597#35810
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
                  TabOrder = 9
                  TextStyle = tsRaised
                  ThemeAware = False
                  ImageIndex = 12
                  NumGlyphs = 2
                  Spacing = 5
                end
                object fndP1_TYPE_ID: TcxComboBox
                  Left = 80
                  Top = 52
                  Width = 76
                  Height = 20
                  ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                  Properties.DropDownListStyle = lsEditFixedList
                  TabOrder = 4
                end
                object fndP1_UNIT_ID: TcxComboBox
                  Left = 631
                  Top = 51
                  Width = 80
                  Height = 20
                  Anchors = [akTop, akRight]
                  ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                  Properties.DropDownListStyle = lsEditFixedList
                  TabOrder = 8
                end
                object fndP1_STAT_ID: TzrComboBoxList
                  Tag = -1
                  Left = 156
                  Top = 52
                  Width = 119
                  Height = 20
                  Properties.AutoSelect = False
                  Properties.Buttons = <
                    item
                      Default = True
                    end>
                  Properties.ReadOnly = False
                  TabOrder = 5
                  InGrid = False
                  KeyValue = Null
                  FilterFields = 'CODE_ID;CODE_NAME;CODE_SPELL'
                  KeyField = 'CODE_ID'
                  ListField = 'CODE_NAME'
                  Columns = <
                    item
                      EditButtons = <>
                      FieldName = 'CODE_NAME'
                      Footers = <>
                      Title.Caption = #21517#31216
                    end
                    item
                      EditButtons = <>
                      FieldName = 'CODE_ID'
                      Footers = <>
                      Title.Caption = #20195#30721
                      Width = 20
                    end>
                  DropWidth = 185
                  DropHeight = 180
                  ShowTitle = True
                  AutoFitColWidth = True
                  ShowButton = True
                  LocateStyle = lsDark
                  Buttons = [zbClear]
                  DropListStyle = lsFixed
                  MultiSelect = False
                end
                object fndP1_SORT_ID: TcxButtonEdit
                  Left = 156
                  Top = 52
                  Width = 119
                  Height = 20
                  Properties.Buttons = <
                    item
                      Default = True
                      Kind = bkEllipsis
                    end>
                  Properties.ReadOnly = True
                  Properties.OnButtonClick = fndP1_SORT_IDPropertiesButtonClick
                  TabOrder = 6
                  OnKeyPress = fndP1_SORT_IDKeyPress
                end
                object P1_D1: TzrMonthEdit
                  Left = 80
                  Top = 8
                  Width = 76
                  Height = 20
                  Properties.Buttons = <
                    item
                      Default = True
                    end>
                  Properties.ReadOnly = False
                  TabOrder = 0
                  Text = '2010-01'
                  Year = 0
                  Month = 0
                  asString = '000000'
                  asFormatString = '0000-00'
                end
                object P1_D2: TzrMonthEdit
                  Left = 198
                  Top = 8
                  Width = 77
                  Height = 20
                  Properties.Buttons = <
                    item
                      Default = True
                    end>
                  Properties.ReadOnly = False
                  TabOrder = 1
                  Text = '2010-01'
                  Year = 0
                  Month = 0
                  asString = '000000'
                  asFormatString = '0000-00'
                end
                object fndP1_SHOP_TYPE: TcxComboBox
                  Left = 80
                  Top = 30
                  Width = 76
                  Height = 20
                  ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                  Properties.DropDownListStyle = lsEditFixedList
                  Properties.Items.Strings = (
                    #34892#25919#21306#22495
                    #31649#29702#32676#32452)
                  TabOrder = 2
                end
                object fndP1_SHOP_VALUE: TzrComboBoxList
                  Tag = -1
                  Left = 156
                  Top = 30
                  Width = 119
                  Height = 20
                  Properties.AutoSelect = False
                  Properties.Buttons = <
                    item
                      Default = True
                    end>
                  Properties.ReadOnly = False
                  TabOrder = 3
                  InGrid = False
                  KeyValue = Null
                  FilterFields = 'CODE_ID;CODE_NAME;CODE_SPELL'
                  KeyField = 'CODE_ID'
                  ListField = 'CODE_NAME'
                  Columns = <
                    item
                      EditButtons = <>
                      FieldName = 'CODE_NAME'
                      Footers = <>
                      Title.Caption = #21517#31216
                    end
                    item
                      EditButtons = <>
                      FieldName = 'CODE_ID'
                      Footers = <>
                      Title.Caption = #20195#30721
                      Width = 20
                    end>
                  DropWidth = 185
                  DropHeight = 180
                  ShowTitle = True
                  AutoFitColWidth = True
                  ShowButton = False
                  LocateStyle = lsDark
                  Buttons = [zbNew, zbClear, zbFind]
                  DropListStyle = lsFixed
                  MultiSelect = False
                end
                object fndP1_GODS_ID: TzrComboBoxList
                  Tag = 100
                  Left = 343
                  Top = 52
                  Width = 121
                  Height = 20
                  Properties.AutoSelect = False
                  Properties.Buttons = <
                    item
                      Default = True
                    end>
                  Properties.ReadOnly = False
                  TabOrder = 7
                  InGrid = True
                  KeyValue = Null
                  FilterFields = 'GODS_CODE;GODS_NAME;GODS_SPELL;BARCODE'
                  KeyField = 'GODS_ID'
                  ListField = 'GODS_NAME'
                  Columns = <
                    item
                      EditButtons = <>
                      FieldName = 'GODS_NAME'
                      Footers = <>
                      Title.Caption = #21830#21697#21517#31216
                      Width = 150
                    end
                    item
                      EditButtons = <>
                      FieldName = 'GODS_CODE'
                      Footers = <>
                      Title.Caption = #36135#21495
                      Width = 50
                    end
                    item
                      EditButtons = <>
                      FieldName = 'BARCODE'
                      Footers = <>
                      Title.Caption = #26465#30721
                      Width = 65
                    end>
                  DropWidth = 380
                  DropHeight = 250
                  ShowTitle = True
                  AutoFitColWidth = True
                  ShowButton = True
                  LocateStyle = lsDark
                  Buttons = [zbNew, zbFind]
                  DropListStyle = lsFixed
                  MultiSelect = False
                  ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
                end
              end
              inherited RzPanel7: TRzPanel
                Top = 78
                Width = 724
                Height = 429
                inherited DBGridEh1: TDBGridEh
                  Width = 720
                  Height = 425
                  FrozenCols = 3
                  OnDblClick = DBGridEh1DblClick
                  OnGetFooterParams = DBGridEh1GetFooterParams
                  Columns = <
                    item
                      Alignment = taCenter
                      EditButtons = <>
                      FieldName = 'SEQNO'
                      Footers = <>
                      Title.Caption = #24207#21495
                      Width = 30
                    end
                    item
                      EditButtons = <>
                      FieldName = 'REGION_ID'
                      Footers = <>
                      Title.Caption = #22320#21306#20195#30721
                      Width = 62
                    end
                    item
                      EditButtons = <>
                      FieldName = 'CODE_NAME'
                      Footer.ValueType = fvtCount
                      Footers = <>
                      Title.Caption = #22320#21306#21517#31216
                      Width = 156
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.###'
                      EditButtons = <>
                      FieldName = 'ORG_AMT'
                      Footer.DisplayFormat = '#0.###'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #26399#21021'|'#25968#37327
                      Width = 60
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'ORG_CST'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #26399#21021'|'#37329#39069
                      Width = 62
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'ORG_RTL'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #26399#21021'|'#21487#38144#21806#39069
                      Width = 60
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.###'
                      EditButtons = <>
                      FieldName = 'STOCK_AMT'
                      Footer.DisplayFormat = '#0.###'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #36827#36135'|'#25968#37327
                      Width = 61
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'STOCK_TTL'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #36827#36135'|'#36827#36135#37329#39069
                      Width = 69
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'STOCK_MNY'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #36827#36135'|'#26410#31246#37329#39069
                      Width = 68
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'STOCK_TAX'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #36827#36135'|'#36827#39033#31246#39069
                      Width = 59
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.###'
                      EditButtons = <>
                      FieldName = 'SALE_AMT'
                      Footer.DisplayFormat = '#0.###'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #38144#21806'|'#25968#37327
                      Width = 60
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'SALE_TTL'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #38144#21806'|'#38144#21806#37329#39069
                      Width = 76
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'SALE_MNY'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #38144#21806'|'#26410#31246#37329#39069
                      Width = 72
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'SALE_TAX'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #38144#21806'|'#38144#39033#31246#39069
                      Width = 67
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'SALE_CST'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #38144#21806'|'#25104#26412
                      Width = 72
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'SALE_PRF'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #38144#21806'|'#27611#21033
                      Width = 73
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00%'
                      EditButtons = <>
                      FieldName = 'SALE_RATE'
                      Footers = <>
                      Title.Caption = #38144#21806'|'#27611#21033#29575
                      Width = 52
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.###'
                      EditButtons = <>
                      FieldName = 'DBIN_AMT'
                      Footer.DisplayFormat = '#0.###'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #35843#20837'|'#25968#37327
                      Width = 60
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'DBIN_CST'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #35843#20837'|'#37329#39069
                      Width = 74
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.###'
                      EditButtons = <>
                      FieldName = 'DBOUT_AMT'
                      Footer.DisplayFormat = '#0.###'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #35843#20986'|'#25968#37327
                      Width = 60
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'DBOUT_CST'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #35843#20986'|'#37329#39069
                      Width = 74
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.###'
                      EditButtons = <>
                      FieldName = 'BAL_AMT'
                      Footer.DisplayFormat = '#0.###'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #26399#26410'|'#25968#37327
                      Width = 60
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'BAL_CST'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #26399#26410'|'#37329#39069
                      Width = 77
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'BAL_RTL'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #26399#26410'|'#21487#38144#21806#39069
                    end>
                end
              end
            end
          end
        end
        object TabSheet2: TRzTabSheet
          Color = clCream
          Caption = #38376#24215#36827#38144#23384#32479#35745#34920
          object RzPanel8: TRzPanel
            Left = 0
            Top = 0
            Width = 734
            Height = 517
            Align = alClient
            BorderOuter = fsNone
            BorderWidth = 5
            TabOrder = 0
            object Panel1: TPanel
              Left = 5
              Top = 5
              Width = 724
              Height = 507
              Align = alClient
              BevelOuter = bvNone
              Color = clWhite
              TabOrder = 0
              object RzPanel9: TRzPanel
                Left = 0
                Top = 0
                Width = 724
                Height = 78
                Align = alTop
                BorderOuter = fsGroove
                BorderSides = [sdLeft, sdTop, sdRight]
                TabOrder = 0
                DesignSize = (
                  724
                  78)
                object Label10: TLabel
                  Left = 24
                  Top = 34
                  Width = 48
                  Height = 12
                  Caption = #38376#24215#32676#32452
                end
                object RzLabel4: TRzLabel
                  Left = 24
                  Top = 12
                  Width = 48
                  Height = 12
                  Alignment = taRightJustify
                  Caption = #25152#23646#26376#20221
                end
                object RzLabel5: TRzLabel
                  Left = 171
                  Top = 12
                  Width = 12
                  Height = 12
                  Caption = #33267
                end
                object Label14: TLabel
                  Left = 24
                  Top = 56
                  Width = 48
                  Height = 12
                  Caption = #21830#21697#25351#26631
                end
                object Label15: TLabel
                  Left = 583
                  Top = 56
                  Width = 48
                  Height = 12
                  Anchors = [akTop, akRight]
                  Caption = #26174#31034#21333#20301
                end
                object Label6: TLabel
                  Left = 290
                  Top = 56
                  Width = 48
                  Height = 12
                  Alignment = taRightJustify
                  Caption = #21830#21697#21517#31216
                end
                object fndP2_SHOP_VALUE: TzrComboBoxList
                  Tag = -1
                  Left = 154
                  Top = 30
                  Width = 119
                  Height = 20
                  Properties.AutoSelect = False
                  Properties.Buttons = <
                    item
                      Default = True
                    end>
                  Properties.ReadOnly = False
                  TabOrder = 3
                  InGrid = False
                  KeyValue = Null
                  FilterFields = 'CODE_ID;CODE_NAME;CODE_SPELL'
                  KeyField = 'CODE_ID'
                  ListField = 'CODE_NAME'
                  Columns = <
                    item
                      EditButtons = <>
                      FieldName = 'CODE_NAME'
                      Footers = <>
                      Title.Caption = #21517#31216
                    end
                    item
                      EditButtons = <>
                      FieldName = 'CODE_ID'
                      Footers = <>
                      Title.Caption = #20195#30721
                      Width = 20
                    end>
                  DropWidth = 185
                  DropHeight = 180
                  ShowTitle = True
                  AutoFitColWidth = True
                  ShowButton = False
                  LocateStyle = lsDark
                  Buttons = [zbNew, zbClear, zbFind]
                  DropListStyle = lsFixed
                  MultiSelect = False
                end
                object RzBitBtn1: TRzBitBtn
                  Left = 476
                  Top = 40
                  Width = 67
                  Height = 32
                  Action = actFind
                  Caption = #26597#35810
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
                  TabOrder = 9
                  TextStyle = tsRaised
                  ThemeAware = False
                  ImageIndex = 12
                  NumGlyphs = 2
                  Spacing = 5
                end
                object fndP2_TYPE_ID: TcxComboBox
                  Left = 80
                  Top = 52
                  Width = 73
                  Height = 20
                  ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                  Properties.DropDownListStyle = lsEditFixedList
                  TabOrder = 4
                end
                object fndP2_UNIT_ID: TcxComboBox
                  Left = 632
                  Top = 52
                  Width = 80
                  Height = 20
                  Anchors = [akTop, akRight]
                  ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                  Properties.DropDownListStyle = lsEditFixedList
                  TabOrder = 8
                end
                object fndP2_STAT_ID: TzrComboBoxList
                  Tag = -1
                  Left = 154
                  Top = 52
                  Width = 119
                  Height = 20
                  Properties.AutoSelect = False
                  Properties.Buttons = <
                    item
                      Default = True
                    end>
                  Properties.ReadOnly = False
                  TabOrder = 5
                  InGrid = False
                  KeyValue = Null
                  FilterFields = 'CODE_ID;CODE_NAME;CODE_SPELL'
                  KeyField = 'CODE_ID'
                  ListField = 'CODE_NAME'
                  Columns = <
                    item
                      EditButtons = <>
                      FieldName = 'CODE_NAME'
                      Footers = <>
                      Title.Caption = #21517#31216
                    end
                    item
                      EditButtons = <>
                      FieldName = 'CODE_ID'
                      Footers = <>
                      Title.Caption = #20195#30721
                      Width = 20
                    end>
                  DropWidth = 185
                  DropHeight = 180
                  ShowTitle = True
                  AutoFitColWidth = True
                  ShowButton = True
                  LocateStyle = lsDark
                  Buttons = [zbClear]
                  DropListStyle = lsFixed
                  MultiSelect = False
                end
                object fndP2_SORT_ID: TcxButtonEdit
                  Left = 154
                  Top = 52
                  Width = 119
                  Height = 20
                  Properties.Buttons = <
                    item
                      Default = True
                      Kind = bkEllipsis
                    end>
                  Properties.ReadOnly = True
                  Properties.OnButtonClick = fndP2_SORT_IDPropertiesButtonClick
                  TabOrder = 6
                  OnKeyPress = fndP2_SORT_IDKeyPress
                end
                object P2_D2: TzrMonthEdit
                  Left = 197
                  Top = 8
                  Width = 76
                  Height = 20
                  Properties.Buttons = <
                    item
                      Default = True
                    end>
                  Properties.ReadOnly = False
                  TabOrder = 1
                  Text = '2010-01'
                  Year = 0
                  Month = 0
                  asString = '000000'
                  asFormatString = '0000-00'
                end
                object P2_D1: TzrMonthEdit
                  Left = 80
                  Top = 8
                  Width = 78
                  Height = 20
                  Properties.Buttons = <
                    item
                      Default = True
                    end>
                  Properties.ReadOnly = False
                  TabOrder = 0
                  Text = '2010-01'
                  Year = 0
                  Month = 0
                  asString = '000000'
                  asFormatString = '0000-00'
                end
                object fndP2_SHOP_TYPE: TcxComboBox
                  Left = 80
                  Top = 30
                  Width = 73
                  Height = 20
                  ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                  Properties.DropDownListStyle = lsEditFixedList
                  Properties.Items.Strings = (
                    #34892#25919#21306#22495
                    #31649#29702#32676#32452)
                  TabOrder = 2
                end
                object fndP2_GODS_ID: TzrComboBoxList
                  Tag = 100
                  Left = 343
                  Top = 52
                  Width = 121
                  Height = 20
                  Properties.AutoSelect = False
                  Properties.Buttons = <
                    item
                      Default = True
                    end>
                  Properties.ReadOnly = False
                  TabOrder = 7
                  InGrid = True
                  KeyValue = Null
                  FilterFields = 'GODS_CODE;GODS_NAME;GODS_SPELL;BARCODE'
                  KeyField = 'GODS_ID'
                  ListField = 'GODS_NAME'
                  Columns = <
                    item
                      EditButtons = <>
                      FieldName = 'GODS_NAME'
                      Footers = <>
                      Title.Caption = #21830#21697#21517#31216
                      Width = 150
                    end
                    item
                      EditButtons = <>
                      FieldName = 'GODS_CODE'
                      Footers = <>
                      Title.Caption = #36135#21495
                      Width = 50
                    end
                    item
                      EditButtons = <>
                      FieldName = 'BARCODE'
                      Footers = <>
                      Title.Caption = #26465#30721
                      Width = 65
                    end>
                  DropWidth = 380
                  DropHeight = 250
                  ShowTitle = True
                  AutoFitColWidth = True
                  ShowButton = True
                  LocateStyle = lsDark
                  Buttons = [zbNew, zbFind]
                  DropListStyle = lsFixed
                  MultiSelect = False
                  ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
                end
              end
              object RzPanel10: TRzPanel
                Left = 0
                Top = 78
                Width = 724
                Height = 429
                Align = alClient
                BorderOuter = fsGroove
                Color = clWhite
                TabOrder = 1
                object DBGridEh2: TDBGridEh
                  Left = 2
                  Top = 2
                  Width = 720
                  Height = 425
                  Align = alClient
                  AllowedOperations = []
                  BorderStyle = bsNone
                  Color = clWhite
                  Ctl3D = True
                  DataSource = dsadoReport2
                  Flat = True
                  Font.Charset = GB2312_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = #23435#20307
                  Font.Style = []
                  FooterColor = clWhite
                  FooterFont.Charset = GB2312_CHARSET
                  FooterFont.Color = clWindowText
                  FooterFont.Height = -12
                  FooterFont.Name = #23435#20307
                  FooterFont.Style = []
                  FooterRowCount = 1
                  FrozenCols = 3
                  ImeName = #26497#21697#20116#31508#36755#20837#27861
                  Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                  OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection]
                  ParentCtl3D = False
                  ParentFont = False
                  ReadOnly = True
                  RowHeight = 20
                  SumList.Active = True
                  TabOrder = 0
                  TitleFont.Charset = GB2312_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -12
                  TitleFont.Name = #23435#20307
                  TitleFont.Style = [fsBold]
                  TitleHeight = 30
                  UseMultiTitle = True
                  IsDrawNullRow = False
                  CurrencySymbol = #65509
                  DecimalNumber = 2
                  DigitalNumber = 12
                  OnDblClick = DBGridEh2DblClick
                  OnDrawColumnCell = DBGridEh1DrawColumnCell
                  OnGetFooterParams = DBGridEh2GetFooterParams
                  Columns = <
                    item
                      Alignment = taCenter
                      EditButtons = <>
                      FieldName = 'SEQNO'
                      Footers = <>
                      Title.Caption = #24207#21495
                      Width = 30
                    end
                    item
                      EditButtons = <>
                      FieldName = 'SHOP_CODE'
                      Footers = <>
                      Title.Caption = #38376#24215#20195#30721
                      Width = 62
                    end
                    item
                      EditButtons = <>
                      FieldName = 'SHOP_NAME'
                      Footer.ValueType = fvtCount
                      Footers = <>
                      Title.Caption = #38376#24215#21517#31216
                      Width = 153
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.###'
                      EditButtons = <>
                      FieldName = 'ORG_AMT'
                      Footer.DisplayFormat = '#0.###'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #26399#21021'|'#25968#37327
                      Width = 60
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'ORG_CST'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #26399#21021'|'#37329#39069
                      Width = 62
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'ORG_RTL'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #26399#21021'|'#21487#38144#21806#39069
                      Width = 60
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.###'
                      EditButtons = <>
                      FieldName = 'STOCK_AMT'
                      Footer.DisplayFormat = '#0.###'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #36827#36135'|'#25968#37327
                      Width = 61
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00#'
                      EditButtons = <>
                      FieldName = 'STOCK_TTL'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #36827#36135'|'#36827#36135#37329#39069
                      Width = 69
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'STOCK_MNY'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #36827#36135'|'#26410#31246#37329#39069
                      Width = 68
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00#'
                      EditButtons = <>
                      FieldName = 'STOCK_TAX'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #36827#36135'|'#36827#39033#31246#39069
                      Width = 59
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.###'
                      EditButtons = <>
                      FieldName = 'SALE_AMT'
                      Footer.DisplayFormat = '#0.###'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #38144#21806'|'#25968#37327
                      Width = 60
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00#'
                      EditButtons = <>
                      FieldName = 'SALE_TTL'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #38144#21806'|'#38144#21806#37329#39069
                      Width = 76
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00#'
                      EditButtons = <>
                      FieldName = 'SALE_MNY'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #38144#21806'|'#26410#31246#37329#39069
                      Width = 72
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00#'
                      EditButtons = <>
                      FieldName = 'SALE_TAX'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #38144#21806'|'#38144#39033#31246#39069
                      Width = 67
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00#'
                      EditButtons = <>
                      FieldName = 'SALE_CST'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #38144#21806'|'#25104#26412
                      Width = 72
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00#'
                      EditButtons = <>
                      FieldName = 'SALE_PRF'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #38144#21806'|'#27611#21033
                      Width = 73
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00%'
                      EditButtons = <>
                      FieldName = 'SALE_RATE'
                      Footers = <>
                      Title.Caption = #38144#21806'|'#27611#21033#29575
                      Width = 52
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.###'
                      EditButtons = <>
                      FieldName = 'DBIN_AMT'
                      Footer.DisplayFormat = '#0.###'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #35843#20837'|'#25968#37327
                      Width = 60
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00#'
                      EditButtons = <>
                      FieldName = 'DBIN_CST'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #35843#20837'|'#37329#39069
                      Width = 74
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.###'
                      EditButtons = <>
                      FieldName = 'DBOUT_AMT'
                      Footer.DisplayFormat = '#0.###'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #35843#20986'|'#25968#37327
                      Width = 60
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00#'
                      EditButtons = <>
                      FieldName = 'DBOUT_CST'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #35843#20986'|'#37329#39069
                      Width = 74
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.###'
                      EditButtons = <>
                      FieldName = 'BAL_AMT'
                      Footer.DisplayFormat = '#0.###'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #26399#26410'|'#25968#37327
                      Width = 60
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00#'
                      EditButtons = <>
                      FieldName = 'BAL_CST'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #26399#26410'|'#37329#39069
                      Width = 77
                    end
                    item
                      Alignment = taRightJustify
                      EditButtons = <>
                      FieldName = 'BAL_RTL'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #26399#26410'|'#21487#38144#21806#39069
                    end>
                end
              end
            end
          end
        end
        object TabSheet3: TRzTabSheet
          Color = clCream
          Caption = #20998#31867#36827#38144#23384#32479#35745#34920
          object RzPanel6: TRzPanel
            Left = 0
            Top = 0
            Width = 734
            Height = 517
            Align = alClient
            BorderOuter = fsNone
            BorderWidth = 5
            TabOrder = 0
            object Panel3: TPanel
              Left = 5
              Top = 5
              Width = 724
              Height = 507
              Align = alClient
              BevelOuter = bvNone
              Color = clWhite
              TabOrder = 0
              object RzPanel11: TRzPanel
                Left = 0
                Top = 0
                Width = 724
                Height = 78
                Align = alTop
                BorderOuter = fsGroove
                BorderSides = [sdLeft, sdTop, sdRight]
                TabOrder = 0
                DesignSize = (
                  724
                  78)
                object Label9: TLabel
                  Left = 24
                  Top = 56
                  Width = 48
                  Height = 12
                  Caption = #38376#24215#21517#31216
                end
                object RzLabel6: TRzLabel
                  Left = 24
                  Top = 12
                  Width = 48
                  Height = 12
                  Alignment = taRightJustify
                  Caption = #25152#23646#26376#20221
                end
                object RzLabel7: TRzLabel
                  Left = 172
                  Top = 12
                  Width = 12
                  Height = 12
                  Caption = #33267
                end
                object Label19: TLabel
                  Left = 285
                  Top = 35
                  Width = 48
                  Height = 12
                  Caption = #32479#35745#31867#22411
                end
                object Label20: TLabel
                  Left = 579
                  Top = 56
                  Width = 48
                  Height = 12
                  Anchors = [akTop, akRight]
                  Caption = #26174#31034#21333#20301
                end
                object Label11: TLabel
                  Left = 24
                  Top = 34
                  Width = 48
                  Height = 12
                  Caption = #38376#24215#32676#32452
                end
                object Label4: TLabel
                  Left = 284
                  Top = 56
                  Width = 48
                  Height = 12
                  Alignment = taRightJustify
                  Caption = #21830#21697#21517#31216
                end
                object fndP3_SHOP_ID: TzrComboBoxList
                  Tag = -1
                  Left = 80
                  Top = 52
                  Width = 193
                  Height = 20
                  Properties.AutoSelect = False
                  Properties.Buttons = <
                    item
                      Default = True
                    end>
                  Properties.ReadOnly = False
                  TabOrder = 5
                  InGrid = False
                  KeyValue = Null
                  FilterFields = 'SHOP_ID;SHOP_NAME;SHOP_SPELL'
                  KeyField = 'SHOP_ID'
                  ListField = 'SHOP_NAME'
                  Columns = <
                    item
                      EditButtons = <>
                      FieldName = 'SHOP_NAME'
                      Footers = <>
                      Title.Caption = #21517#31216
                    end
                    item
                      EditButtons = <>
                      FieldName = 'SEQ_NO'
                      Footers = <>
                      Title.Caption = #20195#30721
                      Width = 20
                    end>
                  DropWidth = 185
                  DropHeight = 180
                  ShowTitle = True
                  AutoFitColWidth = True
                  ShowButton = True
                  LocateStyle = lsDark
                  Buttons = [zbClear]
                  DropListStyle = lsFixed
                  MultiSelect = False
                end
                object RzBitBtn2: TRzBitBtn
                  Left = 480
                  Top = 40
                  Width = 67
                  Height = 32
                  Action = actFind
                  Caption = #26597#35810
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
                  TabOrder = 8
                  TextStyle = tsRaised
                  ThemeAware = False
                  ImageIndex = 12
                  NumGlyphs = 2
                  Spacing = 5
                end
                object fndP3_REPORT_FLAG: TcxComboBox
                  Left = 338
                  Top = 31
                  Width = 121
                  Height = 20
                  ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                  Properties.DropDownListStyle = lsEditFixedList
                  Properties.Items.Strings = (
                    #20027#20379#24212#21830
                    #21697#29260#21517#31216)
                  Properties.OnChange = fndP3_REPORT_FLAGPropertiesChange
                  TabOrder = 4
                end
                object fndP3_UNIT_ID: TcxComboBox
                  Left = 629
                  Top = 52
                  Width = 80
                  Height = 20
                  Anchors = [akTop, akRight]
                  ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                  Properties.DropDownListStyle = lsEditFixedList
                  TabOrder = 7
                end
                object P3_D2: TzrMonthEdit
                  Left = 196
                  Top = 8
                  Width = 77
                  Height = 20
                  Properties.Buttons = <
                    item
                      Default = True
                    end>
                  Properties.ReadOnly = False
                  TabOrder = 1
                  Text = '2010-01'
                  Year = 0
                  Month = 0
                  asString = '000000'
                  asFormatString = '0000-00'
                end
                object P3_D1: TzrMonthEdit
                  Left = 80
                  Top = 8
                  Width = 79
                  Height = 20
                  Properties.Buttons = <
                    item
                      Default = True
                    end>
                  Properties.ReadOnly = False
                  TabOrder = 0
                  Text = '2010-01'
                  Year = 0
                  Month = 0
                  asString = '000000'
                  asFormatString = '0000-00'
                end
                object fndP3_SHOP_VALUE: TzrComboBoxList
                  Tag = -1
                  Left = 154
                  Top = 30
                  Width = 119
                  Height = 20
                  Properties.AutoSelect = False
                  Properties.Buttons = <
                    item
                      Default = True
                    end>
                  Properties.ReadOnly = False
                  TabOrder = 3
                  InGrid = False
                  KeyValue = Null
                  FilterFields = 'CODE_ID;CODE_NAME;CODE_SPELL'
                  KeyField = 'CODE_ID'
                  ListField = 'CODE_NAME'
                  Columns = <
                    item
                      EditButtons = <>
                      FieldName = 'CODE_NAME'
                      Footers = <>
                      Title.Caption = #21517#31216
                    end
                    item
                      EditButtons = <>
                      FieldName = 'CODE_ID'
                      Footers = <>
                      Title.Caption = #20195#30721
                      Width = 20
                    end>
                  DropWidth = 185
                  DropHeight = 180
                  ShowTitle = True
                  AutoFitColWidth = True
                  ShowButton = False
                  LocateStyle = lsDark
                  Buttons = [zbNew, zbClear, zbFind]
                  DropListStyle = lsFixed
                  MultiSelect = False
                end
                object fndP3_SHOP_TYPE: TcxComboBox
                  Left = 80
                  Top = 30
                  Width = 73
                  Height = 20
                  ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                  Properties.DropDownListStyle = lsEditFixedList
                  Properties.Items.Strings = (
                    #34892#25919#21306#22495
                    #31649#29702#32676#32452)
                  TabOrder = 2
                end
                object fndP3_GODS_ID: TzrComboBoxList
                  Tag = 100
                  Left = 338
                  Top = 52
                  Width = 121
                  Height = 20
                  Properties.AutoSelect = False
                  Properties.Buttons = <
                    item
                      Default = True
                    end>
                  Properties.ReadOnly = False
                  TabOrder = 6
                  InGrid = True
                  KeyValue = Null
                  FilterFields = 'GODS_CODE;GODS_NAME;GODS_SPELL;BARCODE'
                  KeyField = 'GODS_ID'
                  ListField = 'GODS_NAME'
                  Columns = <
                    item
                      EditButtons = <>
                      FieldName = 'GODS_NAME'
                      Footers = <>
                      Title.Caption = #21830#21697#21517#31216
                      Width = 150
                    end
                    item
                      EditButtons = <>
                      FieldName = 'GODS_CODE'
                      Footers = <>
                      Title.Caption = #36135#21495
                      Width = 50
                    end
                    item
                      EditButtons = <>
                      FieldName = 'BARCODE'
                      Footers = <>
                      Title.Caption = #26465#30721
                      Width = 65
                    end>
                  DropWidth = 380
                  DropHeight = 250
                  ShowTitle = True
                  AutoFitColWidth = True
                  ShowButton = True
                  LocateStyle = lsDark
                  Buttons = [zbNew, zbFind]
                  DropListStyle = lsFixed
                  MultiSelect = False
                  ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
                end
              end
              object RzPanel12: TRzPanel
                Left = 0
                Top = 78
                Width = 724
                Height = 429
                Align = alClient
                BorderOuter = fsGroove
                Color = clWhite
                TabOrder = 1
                object DBGridEh3: TDBGridEh
                  Tag = 1
                  Left = 2
                  Top = 2
                  Width = 720
                  Height = 425
                  Align = alClient
                  AllowedOperations = []
                  BorderStyle = bsNone
                  Color = clWhite
                  Ctl3D = True
                  DataSource = dsadoReport3
                  Flat = True
                  Font.Charset = GB2312_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = #23435#20307
                  Font.Style = []
                  FooterColor = clWhite
                  FooterFont.Charset = GB2312_CHARSET
                  FooterFont.Color = clWindowText
                  FooterFont.Height = -12
                  FooterFont.Name = #23435#20307
                  FooterFont.Style = []
                  FooterRowCount = 1
                  FrozenCols = 3
                  ImeName = #26497#21697#20116#31508#36755#20837#27861
                  Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                  OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection]
                  ParentCtl3D = False
                  ParentFont = False
                  ReadOnly = True
                  RowHeight = 20
                  SumList.Active = True
                  TabOrder = 0
                  TitleFont.Charset = GB2312_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -12
                  TitleFont.Name = #23435#20307
                  TitleFont.Style = [fsBold]
                  TitleHeight = 30
                  UseMultiTitle = True
                  IsDrawNullRow = False
                  CurrencySymbol = #65509
                  DecimalNumber = 2
                  DigitalNumber = 12
                  OnDblClick = DBGridEh3DblClick
                  OnDrawColumnCell = DBGridEh1DrawColumnCell
                  OnGetCellParams = DBGridEh1GetCellParams
                  OnGetFooterParams = DBGridEh3GetFooterParams
                  Columns = <
                    item
                      Alignment = taCenter
                      EditButtons = <>
                      FieldName = 'SEQNO'
                      Footers = <>
                      Title.Caption = #24207#21495
                      Width = 30
                    end
                    item
                      EditButtons = <>
                      FieldName = 'SORT_NAME'
                      Footer.ValueType = fvtCount
                      Footers = <>
                      Title.Caption = #20998#31867#21517#31216
                      Width = 168
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.###'
                      EditButtons = <>
                      FieldName = 'ORG_AMT'
                      Footer.DisplayFormat = '#0.###'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #26399#21021'|'#25968#37327
                      Width = 60
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'ORG_CST'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #26399#21021'|'#37329#39069
                      Width = 62
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'ORG_RTL'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #26399#21021'|'#21487#38144#21806#39069
                      Width = 60
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.###'
                      EditButtons = <>
                      FieldName = 'STOCK_AMT'
                      Footer.DisplayFormat = '#0.###'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #36827#36135'|'#25968#37327
                      Width = 61
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'STOCK_TTL'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #36827#36135'|'#36827#36135#37329#39069
                      Width = 69
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'STOCK_MNY'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #36827#36135'|'#26410#31246#37329#39069
                      Width = 68
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'STOCK_TAX'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #36827#36135'|'#36827#39033#31246#39069
                      Width = 59
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.###'
                      EditButtons = <>
                      FieldName = 'SALE_AMT'
                      Footer.DisplayFormat = '#0.###'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #38144#21806'|'#25968#37327
                      Width = 60
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'SALE_TTL'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #38144#21806'|'#38144#21806#37329#39069
                      Width = 76
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'SALE_MNY'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #38144#21806'|'#26410#31246#37329#39069
                      Width = 72
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'SALE_TAX'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #38144#21806'|'#38144#39033#31246#39069
                      Width = 67
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'SALE_CST'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #38144#21806'|'#25104#26412
                      Width = 72
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'SALE_PRF'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #38144#21806'|'#27611#21033
                      Width = 73
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'SALE_RATE'
                      Footers = <>
                      Title.Caption = #38144#21806'|'#27611#21033#29575
                      Width = 52
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.###'
                      EditButtons = <>
                      FieldName = 'DBIN_AMT'
                      Footer.DisplayFormat = '#0.###'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #35843#20837'|'#25968#37327
                      Width = 60
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'DBIN_CST'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #35843#20837'|'#37329#39069
                      Width = 74
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.###'
                      EditButtons = <>
                      FieldName = 'DBOUT_AMT'
                      Footer.DisplayFormat = '#0.###'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #35843#20986'|'#25968#37327
                      Width = 60
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'DBOUT_CST'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #35843#20986'|'#37329#39069
                      Width = 74
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.###'
                      EditButtons = <>
                      FieldName = 'BAL_AMT'
                      Footer.DisplayFormat = '#0.###'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #26399#26410'|'#25968#37327
                      Width = 60
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'BAL_CST'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #26399#26410'|'#37329#39069
                      Width = 77
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'BAL_RTL'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #26399#26410'|'#21487#38144#21806#39069
                    end>
                end
              end
            end
          end
        end
        object TabSheet4: TRzTabSheet
          Color = clCream
          Caption = #21830#21697#36827#38144#23384#32479#35745#34920
          object RzPanel13: TRzPanel
            Left = 0
            Top = 0
            Width = 734
            Height = 517
            Align = alClient
            BorderOuter = fsNone
            BorderWidth = 5
            TabOrder = 0
            object Panel6: TPanel
              Left = 5
              Top = 5
              Width = 724
              Height = 507
              Align = alClient
              BevelOuter = bvNone
              Color = clWhite
              TabOrder = 0
              object RzPanel14: TRzPanel
                Left = 0
                Top = 0
                Width = 724
                Height = 99
                Align = alTop
                BorderOuter = fsGroove
                BorderSides = [sdLeft, sdTop, sdRight]
                TabOrder = 0
                DesignSize = (
                  724
                  99)
                object Label21: TLabel
                  Left = 24
                  Top = 56
                  Width = 48
                  Height = 12
                  Caption = #38376#24215#21517#31216
                end
                object RzLabel8: TRzLabel
                  Left = 24
                  Top = 12
                  Width = 48
                  Height = 12
                  Alignment = taRightJustify
                  Caption = #25152#23646#26376#20221
                end
                object RzLabel9: TRzLabel
                  Left = 175
                  Top = 12
                  Width = 12
                  Height = 12
                  Caption = #33267
                end
                object Label25: TLabel
                  Left = 24
                  Top = 78
                  Width = 48
                  Height = 12
                  Caption = #21830#21697#25351#26631
                end
                object Label26: TLabel
                  Left = 582
                  Top = 78
                  Width = 48
                  Height = 12
                  Anchors = [akTop, akRight]
                  Caption = #26174#31034#21333#20301
                end
                object Label3: TLabel
                  Left = 24
                  Top = 33
                  Width = 48
                  Height = 12
                  Caption = #38376#24215#32676#32452
                end
                object Label38: TLabel
                  Left = 290
                  Top = 56
                  Width = 48
                  Height = 12
                  Caption = #32479#35745#31867#22411
                end
                object Label30: TLabel
                  Left = 290
                  Top = 78
                  Width = 48
                  Height = 12
                  Alignment = taRightJustify
                  Caption = #21830#21697#21517#31216
                end
                object RzBitBtn3: TRzBitBtn
                  Left = 485
                  Top = 62
                  Width = 67
                  Height = 32
                  Action = actFind
                  Caption = #26597#35810
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
                  TabOrder = 11
                  TextStyle = tsRaised
                  ThemeAware = False
                  ImageIndex = 12
                  NumGlyphs = 2
                  Spacing = 5
                end
                object fndP4_TYPE_ID: TcxComboBox
                  Left = 80
                  Top = 74
                  Width = 73
                  Height = 20
                  ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                  Properties.DropDownListStyle = lsEditFixedList
                  TabOrder = 6
                end
                object fndP4_UNIT_ID: TcxComboBox
                  Left = 632
                  Top = 74
                  Width = 80
                  Height = 20
                  Anchors = [akTop, akRight]
                  ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                  Properties.DropDownListStyle = lsEditFixedList
                  TabOrder = 10
                end
                object fndP4_STAT_ID: TzrComboBoxList
                  Tag = -1
                  Left = 154
                  Top = 74
                  Width = 119
                  Height = 20
                  Properties.AutoSelect = False
                  Properties.Buttons = <
                    item
                      Default = True
                    end>
                  Properties.ReadOnly = False
                  TabOrder = 8
                  InGrid = False
                  KeyValue = Null
                  FilterFields = 'CODE_ID;CODE_NAME;CODE_SPELL'
                  KeyField = 'CODE_ID'
                  ListField = 'CODE_NAME'
                  Columns = <
                    item
                      EditButtons = <>
                      FieldName = 'CODE_NAME'
                      Footers = <>
                      Title.Caption = #21517#31216
                    end
                    item
                      EditButtons = <>
                      FieldName = 'CODE_ID'
                      Footers = <>
                      Title.Caption = #20195#30721
                      Width = 20
                    end>
                  DropWidth = 185
                  DropHeight = 180
                  ShowTitle = True
                  AutoFitColWidth = True
                  ShowButton = True
                  LocateStyle = lsDark
                  Buttons = [zbClear]
                  DropListStyle = lsFixed
                  MultiSelect = False
                end
                object fndP4_SORT_ID: TcxButtonEdit
                  Left = 154
                  Top = 74
                  Width = 119
                  Height = 20
                  Properties.Buttons = <
                    item
                      Default = True
                      Kind = bkEllipsis
                    end>
                  Properties.ReadOnly = True
                  Properties.OnButtonClick = fndP4_SORT_IDPropertiesButtonClick
                  TabOrder = 7
                  OnKeyPress = fndP4_SORT_IDKeyPress
                end
                object fndP4_SHOP_ID: TzrComboBoxList
                  Tag = -1
                  Left = 80
                  Top = 52
                  Width = 193
                  Height = 20
                  Properties.AutoSelect = False
                  Properties.Buttons = <
                    item
                      Default = True
                    end>
                  Properties.ReadOnly = False
                  TabOrder = 4
                  InGrid = False
                  KeyValue = Null
                  FilterFields = 'SHOP_ID;SHOP_NAME;SHOP_SPELL;SEQ_NO'
                  KeyField = 'SHOP_ID'
                  ListField = 'SHOP_NAME'
                  Columns = <
                    item
                      EditButtons = <>
                      FieldName = 'SHOP_NAME'
                      Footers = <>
                      Title.Caption = #21517#31216
                    end
                    item
                      EditButtons = <>
                      FieldName = 'SEQ_NO'
                      Footers = <>
                      Title.Caption = #20195#30721
                      Width = 20
                    end>
                  DropWidth = 185
                  DropHeight = 180
                  ShowTitle = True
                  AutoFitColWidth = True
                  ShowButton = True
                  LocateStyle = lsDark
                  Buttons = [zbClear]
                  DropListStyle = lsFixed
                  MultiSelect = False
                end
                object P4_D2: TzrMonthEdit
                  Left = 199
                  Top = 8
                  Width = 74
                  Height = 20
                  Properties.Buttons = <
                    item
                      Default = True
                    end>
                  Properties.ReadOnly = False
                  TabOrder = 1
                  Text = '2010-01'
                  Year = 0
                  Month = 0
                  asString = '000000'
                  asFormatString = '0000-00'
                end
                object P4_D1: TzrMonthEdit
                  Left = 80
                  Top = 8
                  Width = 81
                  Height = 20
                  Properties.Buttons = <
                    item
                      Default = True
                    end>
                  Properties.ReadOnly = False
                  TabOrder = 0
                  Text = '2010-01'
                  Year = 0
                  Month = 0
                  asString = '000000'
                  asFormatString = '0000-00'
                end
                object fndP4_SHOP_VALUE: TzrComboBoxList
                  Tag = -1
                  Left = 154
                  Top = 30
                  Width = 119
                  Height = 20
                  Properties.AutoSelect = False
                  Properties.Buttons = <
                    item
                      Default = True
                    end>
                  Properties.ReadOnly = False
                  TabOrder = 3
                  InGrid = False
                  KeyValue = Null
                  FilterFields = 'CODE_ID;CODE_NAME;CODE_SPELL'
                  KeyField = 'CODE_ID'
                  ListField = 'CODE_NAME'
                  Columns = <
                    item
                      EditButtons = <>
                      FieldName = 'CODE_NAME'
                      Footers = <>
                      Title.Caption = #21517#31216
                    end
                    item
                      EditButtons = <>
                      FieldName = 'CODE_ID'
                      Footers = <>
                      Title.Caption = #20195#30721
                      Width = 20
                    end>
                  DropWidth = 185
                  DropHeight = 180
                  ShowTitle = True
                  AutoFitColWidth = True
                  ShowButton = False
                  LocateStyle = lsDark
                  Buttons = [zbNew, zbClear, zbFind]
                  DropListStyle = lsFixed
                  MultiSelect = False
                end
                object fndP4_SHOP_TYPE: TcxComboBox
                  Left = 80
                  Top = 30
                  Width = 73
                  Height = 20
                  ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                  Properties.DropDownListStyle = lsEditFixedList
                  Properties.Items.Strings = (
                    #34892#25919#21306#22495
                    #31649#29702#32676#32452)
                  TabOrder = 2
                end
                object fndP4_RPTTYPE: TcxComboBox
                  Left = 345
                  Top = 52
                  Width = 121
                  Height = 20
                  ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                  Properties.DropDownListStyle = lsFixedList
                  Properties.Items.Strings = (
                    #38376#24215#36827#38144#23384#32479#35745#34920
                    #21830#21697#36827#38144#23384#32479#35745#34920
                    #32676#32452#36827#38144#23384#32479#35745#34920
                    #20379#24212#21830#36827#38144#23384#32479#35745#34920)
                  TabOrder = 5
                end
                object fndP4_GODS_ID: TzrComboBoxList
                  Tag = 100
                  Left = 345
                  Top = 74
                  Width = 121
                  Height = 20
                  Properties.AutoSelect = False
                  Properties.Buttons = <
                    item
                      Default = True
                    end>
                  Properties.ReadOnly = False
                  TabOrder = 9
                  InGrid = True
                  KeyValue = Null
                  FilterFields = 'GODS_CODE;GODS_NAME;GODS_SPELL;BARCODE'
                  KeyField = 'GODS_ID'
                  ListField = 'GODS_NAME'
                  Columns = <
                    item
                      EditButtons = <>
                      FieldName = 'GODS_NAME'
                      Footers = <>
                      Title.Caption = #21830#21697#21517#31216
                      Width = 150
                    end
                    item
                      EditButtons = <>
                      FieldName = 'GODS_CODE'
                      Footers = <>
                      Title.Caption = #36135#21495
                      Width = 50
                    end
                    item
                      EditButtons = <>
                      FieldName = 'BARCODE'
                      Footers = <>
                      Title.Caption = #26465#30721
                      Width = 65
                    end>
                  DropWidth = 380
                  DropHeight = 250
                  ShowTitle = True
                  AutoFitColWidth = True
                  ShowButton = True
                  LocateStyle = lsDark
                  Buttons = [zbNew, zbFind]
                  DropListStyle = lsFixed
                  MultiSelect = False
                  ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
                end
              end
              object RzPanel15: TRzPanel
                Left = 0
                Top = 99
                Width = 724
                Height = 408
                Align = alClient
                BorderOuter = fsGroove
                Color = clWhite
                TabOrder = 1
                object DBGridEh4: TDBGridEh
                  Tag = 1
                  Left = 2
                  Top = 2
                  Width = 720
                  Height = 404
                  Align = alClient
                  AllowedOperations = []
                  BorderStyle = bsNone
                  Color = clWhite
                  Ctl3D = True
                  DataSource = dsadoReport4
                  Flat = True
                  Font.Charset = GB2312_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = #23435#20307
                  Font.Style = []
                  FooterColor = clWhite
                  FooterFont.Charset = GB2312_CHARSET
                  FooterFont.Color = clWindowText
                  FooterFont.Height = -12
                  FooterFont.Name = #23435#20307
                  FooterFont.Style = []
                  FooterRowCount = 1
                  FrozenCols = 5
                  ImeName = #26497#21697#20116#31508#36755#20837#27861
                  Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                  OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection]
                  ParentCtl3D = False
                  ParentFont = False
                  ReadOnly = True
                  RowHeight = 20
                  SumList.Active = True
                  TabOrder = 0
                  TitleFont.Charset = GB2312_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -12
                  TitleFont.Name = #23435#20307
                  TitleFont.Style = [fsBold]
                  TitleHeight = 30
                  UseMultiTitle = True
                  IsDrawNullRow = False
                  CurrencySymbol = #65509
                  DecimalNumber = 2
                  DigitalNumber = 12
                  OnDrawColumnCell = DBGridEh4DrawColumnCell
                  OnGetFooterParams = DBGridEh4GetFooterParams
                  OnTitleClick = DBGridEh4TitleClick
                  Columns = <
                    item
                      Alignment = taCenter
                      EditButtons = <>
                      FieldName = 'SEQNO'
                      Footers = <>
                      Title.Caption = #24207#21495
                      Width = 30
                    end
                    item
                      EditButtons = <>
                      FieldName = 'GODS_NAME'
                      Footer.ValueType = fvtCount
                      Footers = <>
                      Title.Caption = #21830#21697#21517#31216
                      Width = 153
                    end
                    item
                      EditButtons = <>
                      FieldName = 'BARCODE'
                      Footers = <>
                      Title.Caption = #26465#30721
                      Width = 100
                    end
                    item
                      EditButtons = <>
                      FieldName = 'GODS_CODE'
                      Footers = <>
                      Title.Caption = #36135#21495
                      Width = 61
                    end
                    item
                      EditButtons = <>
                      FieldName = 'UNIT_NAME'
                      Footers = <>
                      Title.Caption = #21333#20301
                      Width = 27
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.###'
                      EditButtons = <>
                      FieldName = 'ORG_AMT'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #26399#21021'|'#25968#37327
                      Width = 60
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'ORG_CST'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #26399#21021'|'#37329#39069
                      Width = 62
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'ORG_RTL'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #26399#21021'|'#21487#38144#21806#39069
                      Width = 60
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.###'
                      EditButtons = <>
                      FieldName = 'STOCK_AMT'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #36827#36135'|'#25968#37327
                      Width = 61
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00#'
                      EditButtons = <>
                      FieldName = 'STOCK_TTL'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #36827#36135'|'#36827#36135#37329#39069
                      Width = 69
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'STOCK_MNY'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #36827#36135'|'#26410#31246#37329#39069
                      Width = 68
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00#'
                      EditButtons = <>
                      FieldName = 'STOCK_TAX'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #36827#36135'|'#36827#39033#31246#39069
                      Width = 59
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.###'
                      EditButtons = <>
                      FieldName = 'SALE_AMT'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #38144#21806'|'#25968#37327
                      Width = 60
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00#'
                      EditButtons = <>
                      FieldName = 'SALE_TTL'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #38144#21806'|'#38144#21806#37329#39069
                      Width = 76
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00#'
                      EditButtons = <>
                      FieldName = 'SALE_MNY'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #38144#21806'|'#26410#31246#37329#39069
                      Width = 72
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00#'
                      EditButtons = <>
                      FieldName = 'SALE_TAX'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #38144#21806'|'#38144#39033#31246#39069
                      Width = 67
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00#'
                      EditButtons = <>
                      FieldName = 'SALE_CST'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #38144#21806'|'#25104#26412
                      Width = 72
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00#'
                      EditButtons = <>
                      FieldName = 'SALE_PRF'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #38144#21806'|'#27611#21033
                      Width = 73
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00%'
                      EditButtons = <>
                      FieldName = 'SALE_RATE'
                      Footers = <>
                      Title.Caption = #38144#21806'|'#27611#21033#29575
                      Width = 52
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.###'
                      EditButtons = <>
                      FieldName = 'DBIN_AMT'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #35843#20837'|'#25968#37327
                      Width = 60
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00#'
                      EditButtons = <>
                      FieldName = 'DBIN_CST'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #35843#20837'|'#37329#39069
                      Width = 74
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.###'
                      EditButtons = <>
                      FieldName = 'DBOUT_AMT'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #35843#20986'|'#25968#37327
                      Width = 60
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00#'
                      EditButtons = <>
                      FieldName = 'DBOUT_CST'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #35843#20986'|'#37329#39069
                      Width = 74
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.###'
                      EditButtons = <>
                      FieldName = 'BAL_AMT'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #26399#26410'|'#25968#37327
                      Width = 60
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00#'
                      EditButtons = <>
                      FieldName = 'BAL_CST'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #26399#26410'|'#37329#39069
                      Width = 77
                    end
                    item
                      Alignment = taRightJustify
                      EditButtons = <>
                      FieldName = 'BAL_RTL'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #26399#26410'|'#21487#38144#21806#39069
                    end>
                end
              end
            end
          end
        end
      end
      inherited PanelColumnS: TPanel
        Left = 739
        Height = 544
        inherited Panel2: TPanel
          Height = 501
          inherited RzPanel1: TRzPanel [3]
          end
          inherited Panel5: TPanel [4]
            Height = 386
            inherited rzShowColumns: TRzCheckList
              Height = 382
            end
          end
        end
      end
    end
  end
  inherited RzPanel4: TRzPanel
    Width = 951
    inherited Image3: TImage
      Width = 12
    end
    inherited Image14: TImage
      Left = 931
    end
    inherited Image1: TImage
      Left = 362
      Width = 569
    end
    inherited rzPanel5: TPanel
      inherited lblToolCaption: TRzLabel
        Width = 72
        Caption = #36827#38144#23384#32479#35745#34920
      end
    end
  end
  inherited mmMenu: TMainMenu
    Left = 128
    Top = 400
  end
  inherited actList: TActionList
    Left = 192
    Top = 392
    inherited actFind: TAction
      OnExecute = actFindExecute
    end
  end
  inherited dsadoReport1: TDataSource
    Left = 41
    Top = 354
  end
  inherited SaveDialog1: TSaveDialog
    Left = 229
    Top = 228
  end
  inherited adoReport1: TZQuery
    Left = 41
    Top = 321
  end
  inherited PrintDBGridEh1: TPrintDBGridEh
    BeforeGridText_Data = {
      7B5C727466315C616E73695C616E73696370673933365C64656666305C646566
      6C616E67313033335C6465666C616E676665323035327B5C666F6E7474626C7B
      5C66305C666E696C5C6663686172736574313334205C2763625C2763655C2763
      635C2765353B7D7B5C66315C666E696C5C6663686172736574313334204D5320
      53616E732053657269663B7D7D0D0A5C766965776B696E64345C7563315C7061
      72645C6C616E67323035325C66305C6673323020255B7768725D5C66315C6673
      3136200D0A5C706172207D0D0A00}
    AfterGridText_Data = {
      7B5C727466315C616E73695C616E73696370673933365C64656666305C646566
      6C616E67313033335C6465666C616E676665323035327B5C666F6E7474626C7B
      5C66305C666E696C5C6663686172736574313334205C2763625C2763655C2763
      635C2765353B7D7B5C66315C666E696C5C6663686172736574313334204D5320
      53616E732053657269663B7D7D0D0A5C766965776B696E64345C7563315C7061
      72645C71725C66305C667332305C2762345C2766325C2764335C2761315C2763
      615C2762315C2762635C2765345C6C616E67323035325C66315C66733136200D
      0A5C706172207D0D0A00}
  end
  object dsadoReport2: TDataSource
    DataSet = adoReport2
    Left = 89
    Top = 354
  end
  object dsadoReport3: TDataSource
    DataSet = adoReport3
    Left = 137
    Top = 354
  end
  object dsadoReport4: TDataSource
    DataSet = adoReport4
    Left = 185
    Top = 354
  end
  object adoReport2: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    Params = <>
    Left = 90
    Top = 322
  end
  object adoReport3: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    Params = <>
    Left = 138
    Top = 322
  end
  object adoReport4: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    Params = <>
    Left = 186
    Top = 323
  end
end
