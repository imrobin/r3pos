inherited frmMktRequReport: TfrmMktRequReport
  Left = 218
  Width = 986
  Height = 586
  Caption = #36153#29992#30003#35831#25253#34920
  PixelsPerInch = 96
  TextHeight = 12
  inherited bgPanel: TRzPanel
    Width = 978
    Height = 522
    inherited RzPanel2: TRzPanel
      Width = 968
      Height = 512
      inherited RzPage: TRzPageControl
        Width = 763
        Height = 506
        Color = clCream
        ParentColor = False
        FixedDimension = 25
        inherited TabSheet1: TRzTabSheet
          Color = clCream
          Caption = #37096#38376#36153#29992#30003#35831#27719#24635#34920
          inherited RzPanel3: TRzPanel
            Width = 761
            Height = 479
            inherited Panel4: TPanel
              Width = 751
              Height = 469
              inherited w1: TRzPanel
                Width = 751
                Height = 78
                object RzLabel2: TRzLabel
                  Left = 24
                  Top = 12
                  Width = 48
                  Height = 12
                  Alignment = taRightJustify
                  Caption = #30003#35831#26085#26399
                end
                object Label7: TLabel
                  Left = 24
                  Top = 34
                  Width = 48
                  Height = 12
                  Alignment = taRightJustify
                  Caption = #32771#26680#25351#26631
                end
                object RzLabel6: TRzLabel
                  Left = 168
                  Top = 12
                  Width = 12
                  Height = 12
                  Alignment = taRightJustify
                  Caption = #33267
                end
                object Label17: TLabel
                  Left = 287
                  Top = 34
                  Width = 48
                  Height = 12
                  Caption = #25152#23646#37096#38376
                end
                object Label18: TLabel
                  Left = 24
                  Top = 57
                  Width = 48
                  Height = 12
                  Caption = #23458#25143#20998#32452
                end
                object Label44: TLabel
                  Left = 287
                  Top = 57
                  Width = 48
                  Height = 12
                  Caption = #23458#25143#21517#31216
                end
                object btnOk: TRzBitBtn
                  Left = 509
                  Top = 40
                  Width = 67
                  Height = 30
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
                  TabOrder = 7
                  TextStyle = tsRaised
                  ThemeAware = False
                  ImageIndex = 12
                  NumGlyphs = 2
                  Spacing = 5
                end
                object fndP1_KPI_ID: TzrComboBoxList
                  Tag = -1
                  Left = 77
                  Top = 30
                  Width = 193
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
                  FilterFields = 'KPI_ID;KPI_NAME'
                  KeyField = 'KPI_ID'
                  ListField = 'KPI_NAME'
                  Columns = <
                    item
                      EditButtons = <>
                      FieldName = 'KPI_NAME'
                      Footers = <>
                      Title.Caption = #25351#26631#21517#31216
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
                  ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
                end
                object fndP1_DEPT_ID: TzrComboBoxList
                  Left = 340
                  Top = 30
                  Width = 156
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
                  FilterFields = 'DEPT_NAME;DEPT_SPELL'
                  KeyField = 'DEPT_ID'
                  ListField = 'DEPT_NAME'
                  Columns = <
                    item
                      EditButtons = <>
                      FieldName = 'DEPT_NAME'
                      Footers = <>
                      Title.Caption = #21517#31216
                    end>
                  DropWidth = 185
                  DropHeight = 180
                  ShowTitle = True
                  AutoFitColWidth = True
                  ShowButton = False
                  LocateStyle = lsDark
                  Buttons = []
                  DropListStyle = lsFixed
                  MultiSelect = False
                  RangeField = 'DEPT_TYPE'
                  RangeValue = '1'
                  ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
                end
                object fndP1_CUST_TYPE: TcxComboBox
                  Left = 77
                  Top = 52
                  Width = 73
                  Height = 20
                  ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                  Properties.DropDownListStyle = lsEditFixedList
                  Properties.Items.Strings = (
                    #34892#25919#22320#21306
                    #23458#25143#31561#32423
                    #23458#25143#20998#31867
                    #23458#25143#32676#20307)
                  TabOrder = 4
                end
                object fndP1_CUST_VALUE: TzrComboBoxList
                  Tag = -1
                  Left = 151
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
                  ShowButton = False
                  LocateStyle = lsDark
                  Buttons = [zbNew, zbClear, zbFind]
                  DropListStyle = lsFixed
                  MultiSelect = False
                end
                object fndP1_CLIENT_ID: TzrComboBoxList
                  Tag = -1
                  Left = 340
                  Top = 52
                  Width = 156
                  Height = 20
                  Properties.AutoSelect = False
                  Properties.Buttons = <
                    item
                      Default = True
                    end>
                  Properties.ReadOnly = False
                  TabOrder = 6
                  InGrid = False
                  KeyValue = Null
                  FilterFields = 'CLIENT_ID;CLIENT_CODE;CLIENT_NAME;CLIENT_SPELL'
                  KeyField = 'CLIENT_ID'
                  ListField = 'CLIENT_NAME'
                  Columns = <
                    item
                      EditButtons = <>
                      FieldName = 'CLIENT_NAME'
                      Footers = <>
                      Title.Caption = #21517#31216
                    end
                    item
                      EditButtons = <>
                      FieldName = 'CLIENT_SPELL'
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
                object P1_D1: TcxDateEdit
                  Left = 77
                  Top = 8
                  Width = 85
                  Height = 20
                  ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                  Properties.DateButtons = [btnToday]
                  TabOrder = 0
                end
                object P1_D2: TcxDateEdit
                  Left = 184
                  Top = 8
                  Width = 86
                  Height = 20
                  ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                  Properties.DateButtons = [btnToday]
                  TabOrder = 1
                end
                inline P1_DateControl: TfrmDateControl
                  Left = 286
                  Top = 8
                  Width = 170
                  Height = 20
                  TabOrder = 8
                end
              end
              inherited RzPanel7: TRzPanel
                Top = 78
                Width = 751
                Height = 391
                inherited DBGridEh1: TDBGridEh
                  Width = 747
                  Height = 387
                  FrozenCols = 3
                  TitleHeight = 22
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
                      FieldName = 'DEPT_NAME'
                      Footer.ValueType = fvtCount
                      Footers = <>
                      Title.Caption = #37096#38376#21517#31216
                      Width = 158
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'KPI_MNY'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #36820#21033#37329#39069
                      Width = 120
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'BUDG_MNY'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #24066#22330#36153#29992
                      Width = 120
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'AGIO_MNY'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #20215#26684#25903#25345
                      Width = 120
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'OTHR_MNY'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #20854#20182#37329#39069
                      Width = 120
                    end>
                end
              end
            end
          end
        end
        object TabSheet2: TRzTabSheet
          Color = clCream
          Caption = #22320#21306#36153#29992#30003#35831#27719#24635#34920
          object RzPanel8: TRzPanel
            Left = 0
            Top = 0
            Width = 761
            Height = 479
            Align = alClient
            BorderOuter = fsNone
            BorderWidth = 5
            TabOrder = 0
            object Panel1: TPanel
              Left = 5
              Top = 5
              Width = 751
              Height = 469
              Align = alClient
              BevelOuter = bvNone
              Color = clWhite
              TabOrder = 0
              object RzPanel19: TRzPanel
                Left = 0
                Top = 0
                Width = 751
                Height = 78
                Align = alTop
                BorderOuter = fsGroove
                BorderSides = [sdLeft, sdTop, sdRight]
                TabOrder = 0
                object Label3: TLabel
                  Left = 24
                  Top = 34
                  Width = 48
                  Height = 12
                  Alignment = taRightJustify
                  Caption = #32771#26680#25351#26631
                end
                object Label4: TLabel
                  Left = 24
                  Top = 57
                  Width = 48
                  Height = 12
                  Caption = #23458#25143#20998#32452
                end
                object Label5: TLabel
                  Left = 287
                  Top = 34
                  Width = 48
                  Height = 12
                  Caption = #25152#23646#37096#38376
                end
                object Label6: TLabel
                  Left = 287
                  Top = 57
                  Width = 48
                  Height = 12
                  Caption = #23458#25143#21517#31216
                end
                object RzLabel3: TRzLabel
                  Left = 24
                  Top = 12
                  Width = 48
                  Height = 12
                  Alignment = taRightJustify
                  Caption = #30003#35831#26085#26399
                end
                object RzLabel7: TRzLabel
                  Left = 168
                  Top = 12
                  Width = 12
                  Height = 12
                  Alignment = taRightJustify
                  Caption = #33267
                end
                object BtnDept: TRzBitBtn
                  Left = 510
                  Top = 41
                  Width = 67
                  Height = 30
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
                  TabOrder = 7
                  TextStyle = tsRaised
                  ThemeAware = False
                  ImageIndex = 12
                  NumGlyphs = 2
                  Spacing = 5
                end
                object fndP2_CUST_TYPE: TcxComboBox
                  Left = 77
                  Top = 52
                  Width = 73
                  Height = 20
                  ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                  Properties.DropDownListStyle = lsEditFixedList
                  Properties.Items.Strings = (
                    #34892#25919#22320#21306
                    #23458#25143#31561#32423
                    #23458#25143#20998#31867
                    #23458#25143#32676#20307)
                  TabOrder = 4
                end
                object fndP2_KPI_ID: TzrComboBoxList
                  Tag = -1
                  Left = 77
                  Top = 30
                  Width = 193
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
                  FilterFields = 'KPI_ID;KPI_NAME'
                  KeyField = 'KPI_ID'
                  ListField = 'KPI_NAME'
                  Columns = <
                    item
                      EditButtons = <>
                      FieldName = 'KPI_NAME'
                      Footers = <>
                      Title.Caption = #25351#26631#21517#31216
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
                  ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
                end
                object fndP2_CUST_VALUE: TzrComboBoxList
                  Tag = -1
                  Left = 151
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
                  ShowButton = False
                  LocateStyle = lsDark
                  Buttons = [zbNew, zbClear, zbFind]
                  DropListStyle = lsFixed
                  MultiSelect = False
                end
                object fndP2_CLIENT_ID: TzrComboBoxList
                  Tag = -1
                  Left = 340
                  Top = 52
                  Width = 156
                  Height = 20
                  Properties.AutoSelect = False
                  Properties.Buttons = <
                    item
                      Default = True
                    end>
                  Properties.ReadOnly = False
                  TabOrder = 6
                  InGrid = False
                  KeyValue = Null
                  FilterFields = 'CLIENT_ID;CLIENT_CODE;CLIENT_NAME;CLIENT_SPELL'
                  KeyField = 'CLIENT_ID'
                  ListField = 'CLIENT_NAME'
                  Columns = <
                    item
                      EditButtons = <>
                      FieldName = 'CLIENT_NAME'
                      Footers = <>
                      Title.Caption = #21517#31216
                    end
                    item
                      EditButtons = <>
                      FieldName = 'CLIENT_SPELL'
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
                object fndP2_DEPT_ID: TzrComboBoxList
                  Left = 340
                  Top = 30
                  Width = 156
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
                  FilterFields = 'DEPT_NAME;DEPT_SPELL'
                  KeyField = 'DEPT_ID'
                  ListField = 'DEPT_NAME'
                  Columns = <
                    item
                      EditButtons = <>
                      FieldName = 'DEPT_NAME'
                      Footers = <>
                      Title.Caption = #21517#31216
                    end>
                  DropWidth = 185
                  DropHeight = 180
                  ShowTitle = True
                  AutoFitColWidth = True
                  ShowButton = False
                  LocateStyle = lsDark
                  Buttons = []
                  DropListStyle = lsFixed
                  MultiSelect = False
                  RangeField = 'DEPT_TYPE'
                  RangeValue = '1'
                  ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
                end
                object P2_D1: TcxDateEdit
                  Left = 77
                  Top = 8
                  Width = 85
                  Height = 20
                  ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                  Properties.DateButtons = [btnToday]
                  TabOrder = 0
                end
                object P2_D2: TcxDateEdit
                  Left = 184
                  Top = 8
                  Width = 86
                  Height = 20
                  ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                  Properties.DateButtons = [btnToday]
                  TabOrder = 1
                end
                inline P2_DateControl: TfrmDateControl
                  Left = 288
                  Top = 8
                  Width = 170
                  Height = 20
                  TabOrder = 8
                end
              end
              object RzPanel20: TRzPanel
                Left = 0
                Top = 78
                Width = 751
                Height = 391
                Align = alClient
                BorderOuter = fsGroove
                Color = clWhite
                TabOrder = 1
                object DBGridEh2: TDBGridEh
                  Left = 2
                  Top = 2
                  Width = 747
                  Height = 387
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
                  TitleHeight = 22
                  UseMultiTitle = True
                  IsDrawNullRow = False
                  CurrencySymbol = #65509
                  DecimalNumber = 2
                  DigitalNumber = 12
                  OnDblClick = DBGridEh2DblClick
                  OnDrawColumnCell = DBGridEh1DrawColumnCell
                  OnGetCellParams = DBGridEh1GetCellParams
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
                      FieldName = 'CODE_NAME'
                      Footer.ValueType = fvtCount
                      Footers = <>
                      Title.Caption = #22320#21306#21517#31216
                      Width = 133
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'KPI_MNY'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #36820#21033#37329#39069
                      Width = 120
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'BUDG_MNY'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #24066#22330#36153#29992
                      Width = 120
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'AGIO_MNY'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #20215#26684#25903#25345
                      Width = 120
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'OTHR_MNY'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #20854#20182#37329#39069
                      Width = 120
                    end>
                end
              end
            end
          end
        end
        object TabSheet3: TRzTabSheet
          Color = clCream
          Caption = #23458#25143#36153#29992#30003#35831#27719#24635#34920
          object RzPanel13: TRzPanel
            Left = 0
            Top = 0
            Width = 761
            Height = 479
            Align = alClient
            BorderOuter = fsNone
            BorderWidth = 5
            TabOrder = 0
            object Panel3: TPanel
              Left = 5
              Top = 5
              Width = 751
              Height = 469
              Align = alClient
              BevelOuter = bvNone
              Color = clWhite
              TabOrder = 0
              object RzPanel11: TRzPanel
                Left = 0
                Top = 0
                Width = 751
                Height = 77
                Align = alTop
                BorderOuter = fsGroove
                BorderSides = [sdLeft, sdTop, sdRight]
                TabOrder = 0
                object Label9: TLabel
                  Left = 24
                  Top = 34
                  Width = 48
                  Height = 12
                  Alignment = taRightJustify
                  Caption = #32771#26680#25351#26631
                end
                object Label11: TLabel
                  Left = 24
                  Top = 57
                  Width = 48
                  Height = 12
                  Caption = #23458#25143#20998#32452
                end
                object Label12: TLabel
                  Left = 287
                  Top = 34
                  Width = 48
                  Height = 12
                  Caption = #25152#23646#37096#38376
                end
                object Label15: TLabel
                  Left = 287
                  Top = 57
                  Width = 48
                  Height = 12
                  Caption = #23458#25143#21517#31216
                end
                object RzLabel4: TRzLabel
                  Left = 168
                  Top = 12
                  Width = 12
                  Height = 12
                  Alignment = taRightJustify
                  Caption = #33267
                end
                object RzLabel5: TRzLabel
                  Left = 24
                  Top = 12
                  Width = 48
                  Height = 12
                  Alignment = taRightJustify
                  Caption = #30003#35831#26085#26399
                end
                object BtnKpi: TRzBitBtn
                  Left = 513
                  Top = 34
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
                  TabOrder = 7
                  TextStyle = tsRaised
                  ThemeAware = False
                  ImageIndex = 12
                  NumGlyphs = 2
                  Spacing = 5
                end
                object fndP3_CUST_TYPE: TcxComboBox
                  Left = 77
                  Top = 52
                  Width = 73
                  Height = 20
                  ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                  Properties.DropDownListStyle = lsEditFixedList
                  Properties.Items.Strings = (
                    #34892#25919#22320#21306
                    #23458#25143#31561#32423
                    #23458#25143#20998#31867
                    #23458#25143#32676#20307)
                  TabOrder = 4
                end
                object fndP3_KPI_ID: TzrComboBoxList
                  Tag = -1
                  Left = 77
                  Top = 30
                  Width = 193
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
                  FilterFields = 'KPI_ID;KPI_NAME'
                  KeyField = 'KPI_ID'
                  ListField = 'KPI_NAME'
                  Columns = <
                    item
                      EditButtons = <>
                      FieldName = 'KPI_NAME'
                      Footers = <>
                      Title.Caption = #25351#26631#21517#31216
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
                  ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
                end
                object fndP3_CUST_VALUE: TzrComboBoxList
                  Tag = -1
                  Left = 151
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
                  ShowButton = False
                  LocateStyle = lsDark
                  Buttons = [zbNew, zbClear, zbFind]
                  DropListStyle = lsFixed
                  MultiSelect = False
                end
                object fndP3_CLIENT_ID: TzrComboBoxList
                  Tag = -1
                  Left = 340
                  Top = 52
                  Width = 156
                  Height = 20
                  Properties.AutoSelect = False
                  Properties.Buttons = <
                    item
                      Default = True
                    end>
                  Properties.ReadOnly = False
                  TabOrder = 6
                  InGrid = False
                  KeyValue = Null
                  FilterFields = 'CLIENT_ID;CLIENT_CODE;CLIENT_NAME;CLIENT_SPELL'
                  KeyField = 'CLIENT_ID'
                  ListField = 'CLIENT_NAME'
                  Columns = <
                    item
                      EditButtons = <>
                      FieldName = 'CLIENT_NAME'
                      Footers = <>
                      Title.Caption = #21517#31216
                    end
                    item
                      EditButtons = <>
                      FieldName = 'CLIENT_SPELL'
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
                object fndP3_DEPT_ID: TzrComboBoxList
                  Left = 340
                  Top = 30
                  Width = 156
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
                  FilterFields = 'DEPT_NAME;DEPT_SPELL'
                  KeyField = 'DEPT_ID'
                  ListField = 'DEPT_NAME'
                  Columns = <
                    item
                      EditButtons = <>
                      FieldName = 'DEPT_NAME'
                      Footers = <>
                      Title.Caption = #21517#31216
                    end>
                  DropWidth = 185
                  DropHeight = 180
                  ShowTitle = True
                  AutoFitColWidth = True
                  ShowButton = False
                  LocateStyle = lsDark
                  Buttons = []
                  DropListStyle = lsFixed
                  MultiSelect = False
                  RangeField = 'DEPT_TYPE'
                  RangeValue = '1'
                  ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
                end
                object P3_D2: TcxDateEdit
                  Left = 184
                  Top = 8
                  Width = 86
                  Height = 20
                  ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                  Properties.DateButtons = [btnToday]
                  TabOrder = 1
                end
                object P3_D1: TcxDateEdit
                  Left = 77
                  Top = 8
                  Width = 85
                  Height = 20
                  ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                  Properties.DateButtons = [btnToday]
                  TabOrder = 0
                end
                inline P3_DateControl: TfrmDateControl
                  Left = 286
                  Top = 8
                  Width = 170
                  Height = 20
                  TabOrder = 8
                end
              end
              object RzPanel12: TRzPanel
                Left = 0
                Top = 77
                Width = 751
                Height = 392
                Align = alClient
                BorderOuter = fsGroove
                Color = clWhite
                TabOrder = 1
                object DBGridEh3: TDBGridEh
                  Left = 2
                  Top = 2
                  Width = 747
                  Height = 388
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
                  TitleHeight = 22
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
                      FieldName = 'CLIENT_NAME'
                      Footer.ValueType = fvtCount
                      Footers = <>
                      Title.Caption = #23458#25143#21517#31216
                      Width = 158
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'KPI_MNY'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #36820#21033#37329#39069
                      Width = 120
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'BUDG_MNY'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #24066#22330#36153#29992
                      Width = 120
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'AGIO_MNY'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #20215#26684#25903#25345
                      Width = 120
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'OTHR_MNY'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #20854#20182#37329#39069
                      Width = 120
                    end>
                end
              end
            end
          end
        end
        object TabSheet4: TRzTabSheet
          Color = clCream
          Caption = #25351#26631#36153#29992#30003#35831#27719#24635#34920
          object RzPanel6: TRzPanel
            Left = 0
            Top = 0
            Width = 753
            Height = 468
            Align = alClient
            BorderOuter = fsNone
            BorderWidth = 5
            TabOrder = 0
            object RzPanel9: TRzPanel
              Left = 5
              Top = 5
              Width = 743
              Height = 78
              Align = alTop
              Alignment = taRightJustify
              BorderOuter = fsGroove
              BorderSides = [sdLeft, sdTop, sdRight]
              TabOrder = 0
              object Label8: TLabel
                Left = 24
                Top = 34
                Width = 48
                Height = 12
                Alignment = taRightJustify
                Caption = #32771#26680#25351#26631
              end
              object Label10: TLabel
                Left = 24
                Top = 57
                Width = 48
                Height = 12
                Caption = #23458#25143#20998#32452
              end
              object Label13: TLabel
                Left = 287
                Top = 34
                Width = 48
                Height = 12
                Caption = #25152#23646#37096#38376
              end
              object Label14: TLabel
                Left = 287
                Top = 57
                Width = 48
                Height = 12
                Caption = #23458#25143#21517#31216
              end
              object RzLabel1: TRzLabel
                Left = 24
                Top = 12
                Width = 48
                Height = 12
                Alignment = taRightJustify
                Caption = #30003#35831#26085#26399
              end
              object RzLabel8: TRzLabel
                Left = 168
                Top = 12
                Width = 12
                Height = 12
                Alignment = taRightJustify
                Caption = #33267
              end
              object BtnClient: TRzBitBtn
                Left = 514
                Top = 41
                Width = 67
                Height = 30
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
                TabOrder = 7
                TextStyle = tsRaised
                ThemeAware = False
                ImageIndex = 12
                NumGlyphs = 2
                Spacing = 5
              end
              object fndP4_CUST_TYPE: TcxComboBox
                Left = 77
                Top = 52
                Width = 73
                Height = 20
                ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                Properties.DropDownListStyle = lsEditFixedList
                Properties.Items.Strings = (
                  #34892#25919#22320#21306
                  #23458#25143#31561#32423
                  #23458#25143#20998#31867
                  #23458#25143#32676#20307)
                TabOrder = 4
              end
              object fndP4_KPI_ID: TzrComboBoxList
                Tag = -1
                Left = 77
                Top = 30
                Width = 193
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
                FilterFields = 'KPI_ID;KPI_NAME'
                KeyField = 'KPI_ID'
                ListField = 'KPI_NAME'
                Columns = <
                  item
                    EditButtons = <>
                    FieldName = 'KPI_NAME'
                    Footers = <>
                    Title.Caption = #25351#26631#21517#31216
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
                ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
              end
              object fndP4_CUST_VALUE: TzrComboBoxList
                Tag = -1
                Left = 151
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
                ShowButton = False
                LocateStyle = lsDark
                Buttons = [zbNew, zbClear, zbFind]
                DropListStyle = lsFixed
                MultiSelect = False
              end
              object fndP4_CLIENT_ID: TzrComboBoxList
                Tag = -1
                Left = 340
                Top = 52
                Width = 156
                Height = 20
                Properties.AutoSelect = False
                Properties.Buttons = <
                  item
                    Default = True
                  end>
                Properties.ReadOnly = False
                TabOrder = 6
                InGrid = False
                KeyValue = Null
                FilterFields = 'CLIENT_ID;CLIENT_CODE;CLIENT_NAME;CLIENT_SPELL'
                KeyField = 'CLIENT_ID'
                ListField = 'CLIENT_NAME'
                Columns = <
                  item
                    EditButtons = <>
                    FieldName = 'CLIENT_NAME'
                    Footers = <>
                    Title.Caption = #21517#31216
                  end
                  item
                    EditButtons = <>
                    FieldName = 'CLIENT_SPELL'
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
              object fndP4_DEPT_ID: TzrComboBoxList
                Left = 340
                Top = 30
                Width = 156
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
                FilterFields = 'DEPT_NAME;DEPT_SPELL'
                KeyField = 'DEPT_ID'
                ListField = 'DEPT_NAME'
                Columns = <
                  item
                    EditButtons = <>
                    FieldName = 'DEPT_NAME'
                    Footers = <>
                    Title.Caption = #21517#31216
                  end>
                DropWidth = 185
                DropHeight = 180
                ShowTitle = True
                AutoFitColWidth = True
                ShowButton = False
                LocateStyle = lsDark
                Buttons = []
                DropListStyle = lsFixed
                MultiSelect = False
                RangeField = 'DEPT_TYPE'
                RangeValue = '1'
                ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
              end
              object P4_D1: TcxDateEdit
                Left = 77
                Top = 8
                Width = 85
                Height = 20
                ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                Properties.DateButtons = [btnToday]
                TabOrder = 0
              end
              object P4_D2: TcxDateEdit
                Left = 184
                Top = 8
                Width = 86
                Height = 20
                ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                Properties.DateButtons = [btnToday]
                TabOrder = 1
              end
              inline P4_DateControl: TfrmDateControl
                Left = 286
                Top = 8
                Width = 170
                Height = 20
                TabOrder = 8
              end
            end
            object RzPanel10: TRzPanel
              Left = 5
              Top = 83
              Width = 743
              Height = 380
              Align = alClient
              BorderOuter = fsGroove
              Color = clWhite
              TabOrder = 1
              object DBGridEh4: TDBGridEh
                Left = 2
                Top = 2
                Width = 739
                Height = 376
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
                TitleHeight = 22
                UseMultiTitle = True
                IsDrawNullRow = False
                CurrencySymbol = #65509
                DecimalNumber = 2
                DigitalNumber = 12
                OnDblClick = DBGridEh4DblClick
                OnDrawColumnCell = DBGridEh1DrawColumnCell
                OnGetCellParams = DBGridEh1GetCellParams
                OnGetFooterParams = DBGridEh4GetFooterParams
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
                    FieldName = 'KPI_NAME'
                    Footer.ValueType = fvtCount
                    Footers = <>
                    Title.Caption = #25351#26631#21517#31216
                    Width = 153
                  end
                  item
                    Alignment = taRightJustify
                    DisplayFormat = '#0.00'
                    EditButtons = <>
                    FieldName = 'KPI_MNY'
                    Footer.DisplayFormat = '#0.00'
                    Footer.ValueType = fvtSum
                    Footers = <>
                    Title.Caption = #36820#21033#37329#39069
                    Width = 120
                  end
                  item
                    Alignment = taRightJustify
                    DisplayFormat = '#0.00'
                    EditButtons = <>
                    FieldName = 'BUDG_MNY'
                    Footer.DisplayFormat = '#0.00'
                    Footer.ValueType = fvtSum
                    Footers = <>
                    Title.Caption = #24066#22330#36153#29992
                    Width = 120
                  end
                  item
                    Alignment = taRightJustify
                    DisplayFormat = '#0.00'
                    EditButtons = <>
                    FieldName = 'AGIO_MNY'
                    Footer.DisplayFormat = '#0.00'
                    Footer.ValueType = fvtSum
                    Footers = <>
                    Title.Caption = #20215#26684#25903#25345
                    Width = 120
                  end
                  item
                    Alignment = taRightJustify
                    DisplayFormat = '#0.00'
                    EditButtons = <>
                    FieldName = 'OTHR_MNY'
                    Footer.DisplayFormat = '#0.00'
                    Footer.ValueType = fvtSum
                    Footers = <>
                    Title.Caption = #20854#20182#37329#39069
                    Width = 120
                  end>
              end
            end
          end
        end
        object TabSheet5: TRzTabSheet
          Color = clCream
          Caption = #23458#25143#36153#29992#30003#35831#26126#32454#34920
          object RzPanel14: TRzPanel
            Left = 0
            Top = 0
            Width = 761
            Height = 479
            Align = alClient
            BorderOuter = fsNone
            BorderWidth = 5
            TabOrder = 0
            object Panel6: TPanel
              Left = 5
              Top = 5
              Width = 751
              Height = 469
              Align = alClient
              BevelOuter = bvNone
              Color = clWhite
              TabOrder = 0
              object RzPanel15: TRzPanel
                Left = 0
                Top = 0
                Width = 751
                Height = 100
                Align = alTop
                BorderOuter = fsGroove
                BorderSides = [sdLeft, sdTop, sdRight]
                TabOrder = 0
                object Label16: TLabel
                  Left = 24
                  Top = 34
                  Width = 48
                  Height = 12
                  Alignment = taRightJustify
                  Caption = #32771#26680#25351#26631
                end
                object Label19: TLabel
                  Left = 24
                  Top = 57
                  Width = 48
                  Height = 12
                  Caption = #23458#25143#20998#32452
                end
                object Label20: TLabel
                  Left = 287
                  Top = 57
                  Width = 48
                  Height = 12
                  Caption = #25152#23646#37096#38376
                end
                object Label21: TLabel
                  Left = 23
                  Top = 78
                  Width = 48
                  Height = 12
                  Caption = #23458#25143#21517#31216
                end
                object Label22: TLabel
                  Left = 287
                  Top = 78
                  Width = 48
                  Height = 12
                  Alignment = taRightJustify
                  Caption = #22635' '#25253' '#20154
                end
                object RzLabel9: TRzLabel
                  Left = 24
                  Top = 12
                  Width = 48
                  Height = 12
                  Alignment = taRightJustify
                  Caption = #30003#35831#26085#26399
                end
                object RzLabel10: TRzLabel
                  Left = 168
                  Top = 12
                  Width = 12
                  Height = 12
                  Alignment = taRightJustify
                  Caption = #33267
                end
                object BtnSaleSum: TRzBitBtn
                  Left = 479
                  Top = 60
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
                object fndP5_CUST_TYPE: TcxComboBox
                  Left = 77
                  Top = 52
                  Width = 73
                  Height = 20
                  ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                  Properties.DropDownListStyle = lsEditFixedList
                  Properties.Items.Strings = (
                    #34892#25919#22320#21306
                    #23458#25143#31561#32423
                    #23458#25143#20998#31867
                    #23458#25143#32676#20307)
                  TabOrder = 3
                end
                object fndP5_KPI_ID: TzrComboBoxList
                  Tag = -1
                  Left = 77
                  Top = 30
                  Width = 193
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
                  FilterFields = 'KPI_ID;KPI_NAME'
                  KeyField = 'KPI_ID'
                  ListField = 'KPI_NAME'
                  Columns = <
                    item
                      EditButtons = <>
                      FieldName = 'KPI_NAME'
                      Footers = <>
                      Title.Caption = #25351#26631#21517#31216
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
                  ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
                end
                object fndP5_CUST_VALUE: TzrComboBoxList
                  Tag = -1
                  Left = 151
                  Top = 52
                  Width = 119
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
                object fndP5_CLIENT_ID: TzrComboBoxList
                  Tag = -1
                  Left = 77
                  Top = 74
                  Width = 193
                  Height = 20
                  Properties.AutoSelect = False
                  Properties.Buttons = <
                    item
                      Default = True
                    end>
                  Properties.ReadOnly = False
                  TabOrder = 6
                  InGrid = False
                  KeyValue = Null
                  FilterFields = 'CLIENT_ID;CLIENT_CODE;CLIENT_NAME;CLIENT_SPELL'
                  KeyField = 'CLIENT_ID'
                  ListField = 'CLIENT_NAME'
                  Columns = <
                    item
                      EditButtons = <>
                      FieldName = 'CLIENT_NAME'
                      Footers = <>
                      Title.Caption = #21517#31216
                    end
                    item
                      EditButtons = <>
                      FieldName = 'CLIENT_SPELL'
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
                object fndP5_DEPT_ID: TzrComboBoxList
                  Left = 340
                  Top = 52
                  Width = 123
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
                  FilterFields = 'DEPT_NAME;DEPT_SPELL'
                  KeyField = 'DEPT_ID'
                  ListField = 'DEPT_NAME'
                  Columns = <
                    item
                      EditButtons = <>
                      FieldName = 'DEPT_NAME'
                      Footers = <>
                      Title.Caption = #21517#31216
                    end>
                  DropWidth = 185
                  DropHeight = 180
                  ShowTitle = True
                  AutoFitColWidth = True
                  ShowButton = False
                  LocateStyle = lsDark
                  Buttons = []
                  DropListStyle = lsFixed
                  MultiSelect = False
                  RangeField = 'DEPT_TYPE'
                  RangeValue = '1'
                  ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
                end
                object fndP5_GUIDE_USER: TzrComboBoxList
                  Tag = -1
                  Left = 340
                  Top = 74
                  Width = 123
                  Height = 20
                  Properties.AutoSelect = False
                  Properties.Buttons = <
                    item
                      Default = True
                    end>
                  Properties.ReadOnly = False
                  TabOrder = 7
                  InGrid = False
                  KeyValue = Null
                  FilterFields = 'USER_ID;USER_SPELL;USER_NAME'
                  KeyField = 'USER_ID'
                  ListField = 'USER_NAME'
                  Columns = <
                    item
                      EditButtons = <>
                      FieldName = 'USER_NAME'
                      Footers = <>
                      Title.Caption = #22995#21517
                    end
                    item
                      EditButtons = <>
                      FieldName = 'USER_SPELL'
                      Footers = <>
                      Title.Caption = #25340#38899#30721
                      Width = 20
                    end>
                  DropWidth = 185
                  DropHeight = 180
                  ShowTitle = True
                  AutoFitColWidth = True
                  ShowButton = False
                  LocateStyle = lsDark
                  Buttons = [zbClear]
                  DropListStyle = lsFixed
                  MultiSelect = False
                end
                object P5_D1: TcxDateEdit
                  Left = 77
                  Top = 8
                  Width = 85
                  Height = 20
                  ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                  Properties.DateButtons = [btnToday]
                  TabOrder = 0
                end
                object P5_D2: TcxDateEdit
                  Left = 184
                  Top = 8
                  Width = 86
                  Height = 20
                  ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                  Properties.DateButtons = [btnToday]
                  TabOrder = 1
                end
                inline P5_DateControl: TfrmDateControl
                  Left = 286
                  Top = 8
                  Width = 170
                  Height = 20
                  TabOrder = 9
                end
              end
              object RzPanel21: TRzPanel
                Left = 0
                Top = 100
                Width = 751
                Height = 369
                Align = alClient
                BorderOuter = fsGroove
                Color = clWhite
                TabOrder = 1
                object DBGridEh5: TDBGridEh
                  Left = 2
                  Top = 2
                  Width = 747
                  Height = 365
                  Align = alClient
                  AllowedOperations = []
                  BorderStyle = bsNone
                  Color = clWhite
                  Ctl3D = True
                  DataSource = dsadoReport5
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
                  TitleHeight = 22
                  UseMultiTitle = True
                  IsDrawNullRow = False
                  CurrencySymbol = #65509
                  DecimalNumber = 2
                  DigitalNumber = 12
                  OnDrawColumnCell = DBGridEh1DrawColumnCell
                  OnGetCellParams = DBGridEh1GetCellParams
                  OnGetFooterParams = DBGridEh5GetFooterParams
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
                      DisplayFormat = '0000-00-00'
                      EditButtons = <>
                      FieldName = 'REQU_DATE'
                      Footers = <>
                      Title.Caption = #22635#25253#26085#26399
                      Width = 59
                    end
                    item
                      EditButtons = <>
                      FieldName = 'GLIDE_NO'
                      Footer.ValueType = fvtCount
                      Footers = <>
                      Title.Caption = #21333#21495
                      Width = 94
                    end
                    item
                      EditButtons = <>
                      FieldName = 'CLIENT_NAME'
                      Footers = <>
                      Title.Caption = #23458#25143#21517#31216
                      Width = 145
                    end
                    item
                      EditButtons = <>
                      FieldName = 'KPI_NAME'
                      Footers = <>
                      Title.Caption = #32771#26680#25351#26631
                      Width = 128
                    end
                    item
                      EditButtons = <>
                      FieldName = 'REQU_YEAR'
                      Footers = <>
                      Title.Caption = #36153#29992#24180#24230
                    end
                    item
                      Alignment = taRightJustify
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'KPI_MNY'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #36820#21033#37329#39069
                      Width = 70
                    end
                    item
                      EditButtons = <>
                      FieldName = 'BUDG_MNY'
                      Footers = <>
                      Title.Caption = #24066#22330#36153#29992
                      Width = 70
                    end
                    item
                      EditButtons = <>
                      FieldName = 'AGIO_MNY'
                      Footers = <>
                      Title.Caption = #20215#26684#25903#25345
                      Width = 70
                    end
                    item
                      EditButtons = <>
                      FieldName = 'OTHR_MNY'
                      Footers = <>
                      Title.Caption = #20854#20182#37329#39069
                      Width = 70
                    end
                    item
                      EditButtons = <>
                      FieldName = 'REQU_TYPE'
                      Footers = <>
                      Title.Caption = #31867#22411
                      Width = 38
                    end
                    item
                      EditButtons = <>
                      FieldName = 'REMARK'
                      Footers = <>
                      Title.Caption = #22791#27880
                      Width = 166
                    end
                    item
                      EditButtons = <>
                      FieldName = 'REQU_USER_TEXT'
                      Footers = <>
                      Title.Caption = #22635#25253#20154
                      Width = 49
                    end
                    item
                      EditButtons = <>
                      FieldName = 'CHK_USER_TEXT'
                      Footers = <>
                      Title.Caption = #23457#26680#20154
                      Width = 52
                    end
                    item
                      EditButtons = <>
                      FieldName = 'CHK_DATE'
                      Footers = <>
                      Title.Caption = #23457#26680#26085#26399
                      Width = 70
                    end
                    item
                      EditButtons = <>
                      FieldName = 'CREA_USER_TEXT'
                      Footers = <>
                      Title.Caption = #25805#20316#20154
                      Width = 52
                    end
                    item
                      EditButtons = <>
                      FieldName = 'CREA_DATE'
                      Footers = <>
                      Title.Caption = #25805#20316#26102#38388
                      Width = 171
                    end>
                end
              end
            end
          end
        end
      end
      inherited PanelColumnS: TPanel
        Left = 766
        Height = 506
        inherited Panel2: TPanel
          Height = 463
          inherited RzPanel1: TRzPanel [3]
          end
          inherited Panel5: TPanel [4]
            Height = 348
            inherited rzShowColumns: TRzCheckList
              Height = 344
            end
          end
        end
      end
    end
  end
  inherited RzPanel4: TRzPanel
    Width = 978
    inherited Image3: TImage
      Width = 73
    end
    inherited Image14: TImage
      Left = 958
    end
    inherited Image1: TImage
      Left = 423
      Width = 535
    end
    inherited rzPanel5: TPanel
      inherited lblToolCaption: TRzLabel
        Width = 72
        Caption = #21830#21697#38144#21806#25253#34920
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
    Left = 173
    Top = 220
  end
  inherited adoReport1: TZQuery
    Left = 41
    Top = 321
  end
  object dsadoReport2: TDataSource [7]
    DataSet = adoReport2
    Left = 89
    Top = 354
  end
  object dsadoReport3: TDataSource [8]
    DataSet = adoReport3
    Left = 137
    Top = 354
  end
  object dsadoReport4: TDataSource [9]
    DataSet = adoReport4
    Left = 185
    Top = 354
  end
  object dsadoReport5: TDataSource [10]
    DataSet = adoReport5
    Left = 233
    Top = 354
  end
  object adoReport2: TZQuery [11]
    FieldDefs = <>
    CachedUpdates = True
    Params = <>
    Left = 89
    Top = 321
  end
  object adoReport3: TZQuery [12]
    FieldDefs = <>
    CachedUpdates = True
    Params = <>
    Left = 137
    Top = 321
  end
  object adoReport4: TZQuery [13]
    FieldDefs = <>
    CachedUpdates = True
    Params = <>
    Left = 185
    Top = 321
  end
  object adoReport5: TZQuery [14]
    FieldDefs = <>
    CachedUpdates = True
    Params = <>
    Left = 233
    Top = 321
  end
  inherited PrintDBGridEh1: TPrintDBGridEh
    Left = 112
    Top = 208
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
end
