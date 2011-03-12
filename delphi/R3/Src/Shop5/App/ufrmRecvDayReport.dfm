<<<<<<< .mine
inherited frmRecvDayReport: TfrmRecvDayReport
  Left = 187
  Top = 103
  Width = 999
  Height = 600
  Caption = #25910#27454#26085#25253#34920
  PixelsPerInch = 96
  TextHeight = 12
  inherited bgPanel: TRzPanel
    Width = 991
    Height = 543
    inherited RzPanel2: TRzPanel
      Width = 981
      Height = 533
      inherited RzPage: TRzPageControl
        Width = 776
        Height = 527
        Color = clCream
        ParentColor = False
        FixedDimension = 25
        inherited TabSheet1: TRzTabSheet
          Color = clCream
          Caption = #22320#21306#25910#27454#27719#24635#34920
          inherited RzPanel3: TRzPanel
            Width = 774
            Height = 500
            BorderColor = clBtnFace
            inherited Panel4: TPanel
              Width = 764
              Height = 490
              inherited w1: TRzPanel
                Width = 764
                Height = 65
                object RzLabel2: TRzLabel
                  Left = 24
                  Top = 14
                  Width = 48
                  Height = 12
                  Alignment = taRightJustify
                  Caption = #25910#27454#26085#26399
                end
                object RzLabel3: TRzLabel
                  Left = 171
                  Top = 14
                  Width = 12
                  Height = 12
                  Caption = #33267
                end
                object Label5: TLabel
                  Left = 24
                  Top = 36
                  Width = 48
                  Height = 12
                  Caption = #38376#24215#32676#32452
                end
                object P1_D1: TcxDateEdit
                  Left = 80
                  Top = 10
                  Width = 85
                  Height = 20
                  Properties.DateButtons = [btnToday]
                  TabOrder = 0
                end
                object P1_D2: TcxDateEdit
                  Left = 187
                  Top = 10
                  Width = 86
                  Height = 20
                  Properties.DateButtons = [btnToday]
                  TabOrder = 1
                end
                object btnOk: TRzBitBtn
                  Left = 322
                  Top = 21
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
                  TabOrder = 2
                  TextStyle = tsRaised
                  ThemeAware = False
                  ImageIndex = 12
                  NumGlyphs = 2
                  Spacing = 5
                end
                object fndP1_SHOP_TYPE: TcxComboBox
                  Left = 80
                  Top = 32
                  Width = 73
                  Height = 20
                  Properties.DropDownListStyle = lsEditFixedList
                  Properties.Items.Strings = (
                    #34892#25919#21306#22495
                    #31649#29702#32676#32452)
                  TabOrder = 3
                end
                object fndP1_SHOP_VALUE: TzrComboBoxList
                  Tag = -1
                  Left = 154
                  Top = 32
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
              end
              inherited RzPanel7: TRzPanel
                Top = 65
                Width = 764
                Height = 425
                inherited DBGridEh1: TDBGridEh
                  Width = 760
                  Height = 421
                  FrozenCols = 3
                  TitleHeight = 22
                  OnDblClick = DBGridEh1DblClick
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
                      FieldName = 'GROUP_ID'
                      Footers = <>
                      Title.Caption = #22320#21306#20195#30721
                      Width = 62
                    end
                    item
                      EditButtons = <>
                      FieldName = 'GROUP_NAME'
                      Footers = <>
                      Title.Caption = #22320#21306#21517#31216
                      Width = 153
                    end
                    item
                      EditButtons = <>
                      Footers = <>
                      Title.Caption = #25910#27454#21512#35745
                      Width = 72
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'PAY_A'
                      Footers = <>
                      Title.Caption = #20854#20013'|'#29616#37329
                      Width = 58
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'PAY_B'
                      Footers = <>
                      Title.Caption = #20854#20013'|'#38134#32852
                      Width = 58
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'PAY_C'
                      Footers = <>
                      Title.Caption = #20854#20013'|'#20648#20540#21345
                      Width = 58
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'PAY_D'
                      Footers = <>
                      Title.Caption = #20854#20013'|'#35760#36134
                      Width = 58
                    end
                    item
                      DisplayFormat = '#0.00%'
                      EditButtons = <>
                      FieldName = 'PAY_E'
                      Footers = <>
                      Title.Caption = #20854#20013'|'#31036#21367
                      Width = 58
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'PAY_F'
                      Footers = <>
                      Title.Caption = #20854#20013'|'#25903#31080
                      Width = 58
                    end
                    item
                      EditButtons = <>
                      FieldName = 'PAY_G'
                      Footers = <>
                      Title.Caption = #20854#20013'|'#23567#39069#25903#20184
                      Width = 58
                    end
                    item
                      EditButtons = <>
                      FieldName = 'PAY_H'
                      Footers = <>
                      Title.Caption = #20854#20013'|'
                      Width = 58
                    end
                    item
                      EditButtons = <>
                      FieldName = 'PAY_I'
                      Footers = <>
                      Title.Caption = #20854#20013'|'
                      Width = 58
                    end
                    item
                      EditButtons = <>
                      FieldName = 'PAY_J'
                      Footers = <>
                      Title.Caption = #20854#20013'|'
                      Width = 58
                    end
                    item
                      EditButtons = <>
                      Footers = <>
                      Title.Caption = #32564#38134#37329#39069
                    end
                    item
                      EditButtons = <>
                      Footers = <>
                      Title.Caption = #32467#20313#29616#37329
                      Width = 63
                    end>
                end
              end
            end
          end
        end
        object TabSheet2: TRzTabSheet
          Color = clCream
          Caption = #38376#24215#25910#27454#27719#24635#34920
          object RzPanel8: TRzPanel
            Left = 0
            Top = 0
            Width = 774
            Height = 500
            Align = alClient
            BorderOuter = fsNone
            BorderWidth = 5
            TabOrder = 0
            object Panel1: TPanel
              Left = 5
              Top = 5
              Width = 764
              Height = 490
              Align = alClient
              BevelOuter = bvNone
              Color = clWhite
              TabOrder = 0
              object RzPanel9: TRzPanel
                Left = 0
                Top = 0
                Width = 764
                Height = 65
                Align = alTop
                BorderOuter = fsGroove
                BorderSides = [sdLeft, sdTop, sdRight]
                Color = clWhite
                TabOrder = 0
                object RzLabel4: TRzLabel
                  Left = 24
                  Top = 14
                  Width = 48
                  Height = 12
                  Alignment = taRightJustify
                  Caption = #25910#27454#26085#26399
                end
                object RzLabel5: TRzLabel
                  Left = 170
                  Top = 14
                  Width = 12
                  Height = 12
                  Caption = #33267
                end
                object Label10: TLabel
                  Left = 24
                  Top = 35
                  Width = 48
                  Height = 12
                  Caption = #38376#24215#32676#32452
                end
                object P2_D1: TcxDateEdit
                  Left = 80
                  Top = 10
                  Width = 85
                  Height = 20
                  Properties.DateButtons = [btnToday]
                  TabOrder = 0
                end
                object P2_D2: TcxDateEdit
                  Left = 186
                  Top = 10
                  Width = 87
                  Height = 20
                  Properties.DateButtons = [btnToday]
                  TabOrder = 1
                end
                object fndP2_SHOP_VALUE: TzrComboBoxList
                  Tag = -1
                  Left = 154
                  Top = 31
                  Width = 119
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
                  Left = 302
                  Top = 17
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
                  TabOrder = 3
                  TextStyle = tsRaised
                  ThemeAware = False
                  ImageIndex = 12
                  NumGlyphs = 2
                  Spacing = 5
                end
                object fndP2_SHOP_TYPE: TcxComboBox
                  Left = 80
                  Top = 31
                  Width = 73
                  Height = 20
                  Properties.DropDownListStyle = lsEditFixedList
                  Properties.Items.Strings = (
                    #34892#25919#21306#22495
                    #31649#29702#32676#32452)
                  TabOrder = 4
                end
              end
              object RzPanel10: TRzPanel
                Left = 0
                Top = 65
                Width = 764
                Height = 425
                Align = alClient
                BorderOuter = fsGroove
                Color = clWhite
                TabOrder = 1
                object DBGridEh2: TDBGridEh
                  Left = 2
                  Top = 2
                  Width = 760
                  Height = 421
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
                      FieldName = 'GROUP_ID'
                      Footers = <>
                      Title.Caption = #38376#24215#20195#30721
                      Width = 62
                    end
                    item
                      EditButtons = <>
                      FieldName = 'GROUP_NAME'
                      Footers = <>
                      Title.Caption = #38376#24215#21517#31216
                      Width = 153
                    end
                    item
                      EditButtons = <>
                      Footers = <>
                      Title.Caption = #25910#27454#21512#35745
                      Width = 72
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'PAY_A'
                      Footers = <>
                      Title.Caption = #20854#20013'|'#29616#37329
                      Width = 58
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'PAY_B'
                      Footers = <>
                      Title.Caption = #20854#20013'|'#38134#32852
                      Width = 58
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'PAY_C'
                      Footers = <>
                      Title.Caption = #20854#20013'|'#20648#20540#21345
                      Width = 58
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'PAY_D'
                      Footers = <>
                      Title.Caption = #20854#20013'|'#35760#36134
                      Width = 58
                    end
                    item
                      DisplayFormat = '#0.00%'
                      EditButtons = <>
                      FieldName = 'PAY_E'
                      Footers = <>
                      Title.Caption = #20854#20013'|'#31036#21367
                      Width = 58
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'PAY_F'
                      Footers = <>
                      Title.Caption = #20854#20013'|'#25903#31080
                      Width = 58
                    end
                    item
                      EditButtons = <>
                      FieldName = 'PAY_G'
                      Footers = <>
                      Title.Caption = #20854#20013'|'#23567#39069#25903#20184
                      Width = 58
                    end
                    item
                      EditButtons = <>
                      FieldName = 'PAY_H'
                      Footers = <>
                      Title.Caption = #20854#20013'|'
                      Width = 58
                    end
                    item
                      EditButtons = <>
                      FieldName = 'PAY_I'
                      Footers = <>
                      Title.Caption = #20854#20013'|'
                      Width = 58
                    end
                    item
                      EditButtons = <>
                      FieldName = 'PAY_J'
                      Footers = <>
                      Title.Caption = #20854#20013'|'
                      Width = 58
                    end
                    item
                      EditButtons = <>
                      Footers = <>
                      Title.Caption = #32564#38134#37329#39069
                    end
                    item
                      EditButtons = <>
                      Footers = <>
                      Title.Caption = #32467#20313#29616#37329
                      Width = 63
                    end>
                end
              end
            end
          end
        end
        object TabSheet3: TRzTabSheet
          Color = clCream
          Caption = #27599#26085#25910#27454#27719#24635#34920
          object RzPanel6: TRzPanel
            Left = 0
            Top = 0
            Width = 774
            Height = 500
            Align = alClient
            BorderOuter = fsNone
            BorderWidth = 5
            TabOrder = 0
            object Panel3: TPanel
              Left = 5
              Top = 5
              Width = 764
              Height = 490
              Align = alClient
              BevelOuter = bvNone
              Color = clWhite
              TabOrder = 0
              object RzPanel11: TRzPanel
                Left = 0
                Top = 0
                Width = 764
                Height = 89
                Align = alTop
                BorderOuter = fsGroove
                BorderSides = [sdLeft, sdTop, sdRight]
                Color = clWhite
                TabOrder = 0
                object RzLabel6: TRzLabel
                  Left = 24
                  Top = 14
                  Width = 48
                  Height = 12
                  Alignment = taRightJustify
                  Caption = #25910#27454#26085#26399
                end
                object RzLabel7: TRzLabel
                  Left = 170
                  Top = 14
                  Width = 12
                  Height = 12
                  Caption = #33267
                end
                object Label11: TLabel
                  Left = 24
                  Top = 36
                  Width = 48
                  Height = 12
                  Caption = #38376#24215#32676#32452
                end
                object Label9: TLabel
                  Left = 24
                  Top = 58
                  Width = 48
                  Height = 12
                  Caption = #38376#24215#21517#31216
                end
                object P3_D1: TcxDateEdit
                  Left = 80
                  Top = 10
                  Width = 85
                  Height = 20
                  Properties.DateButtons = [btnToday]
                  TabOrder = 0
                end
                object P3_D2: TcxDateEdit
                  Left = 186
                  Top = 10
                  Width = 87
                  Height = 20
                  Properties.DateButtons = [btnToday]
                  TabOrder = 1
                end
                object RzBitBtn2: TRzBitBtn
                  Left = 294
                  Top = 41
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
                  TabOrder = 2
                  TextStyle = tsRaised
                  ThemeAware = False
                  ImageIndex = 12
                  NumGlyphs = 2
                  Spacing = 5
                end
                object fndP3_SHOP_VALUE: TzrComboBoxList
                  Tag = -1
                  Left = 154
                  Top = 32
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
                  Top = 32
                  Width = 73
                  Height = 20
                  Properties.DropDownListStyle = lsEditFixedList
                  Properties.Items.Strings = (
                    #34892#25919#21306#22495
                    #31649#29702#32676#32452)
                  TabOrder = 4
                end
                object fndP3_SHOP_ID: TzrComboBoxList
                  Tag = -1
                  Left = 80
                  Top = 54
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
                      FieldName = 'SHOP_ID'
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
                  Buttons = []
                  DropListStyle = lsFixed
                  MultiSelect = False
                end
              end
              object RzPanel12: TRzPanel
                Left = 0
                Top = 89
                Width = 764
                Height = 401
                Align = alClient
                BorderOuter = fsGroove
                Color = clWhite
                TabOrder = 1
                object DBGridEh3: TDBGridEh
                  Tag = 1
                  Left = 2
                  Top = 2
                  Width = 760
                  Height = 397
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
                      FieldName = 'GROUP_NAME'
                      Footers = <>
                      Title.Caption = #26085#26399
                      Width = 99
                    end
                    item
                      EditButtons = <>
                      Footers = <>
                      Title.Caption = #25910#27454#21512#35745
                      Width = 72
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'PAY_A'
                      Footers = <>
                      Title.Caption = #20854#20013'|'#29616#37329
                      Width = 58
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'PAY_B'
                      Footers = <>
                      Title.Caption = #20854#20013'|'#38134#32852
                      Width = 58
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'PAY_C'
                      Footers = <>
                      Title.Caption = #20854#20013'|'#20648#20540#21345
                      Width = 58
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'PAY_D'
                      Footers = <>
                      Title.Caption = #20854#20013'|'#35760#36134
                      Width = 58
                    end
                    item
                      DisplayFormat = '#0.00%'
                      EditButtons = <>
                      FieldName = 'PAY_E'
                      Footers = <>
                      Title.Caption = #20854#20013'|'#31036#21367
                      Width = 58
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'PAY_F'
                      Footers = <>
                      Title.Caption = #20854#20013'|'#25903#31080
                      Width = 58
                    end
                    item
                      EditButtons = <>
                      FieldName = 'PAY_G'
                      Footers = <>
                      Title.Caption = #20854#20013'|'#23567#39069#25903#20184
                      Width = 58
                    end
                    item
                      EditButtons = <>
                      FieldName = 'PAY_H'
                      Footers = <>
                      Title.Caption = #20854#20013'|'
                      Width = 58
                    end
                    item
                      EditButtons = <>
                      FieldName = 'PAY_I'
                      Footers = <>
                      Title.Caption = #20854#20013'|'
                      Width = 58
                    end
                    item
                      EditButtons = <>
                      FieldName = 'PAY_J'
                      Footers = <>
                      Title.Caption = #20854#20013'|'
                      Width = 58
                    end
                    item
                      EditButtons = <>
                      Footers = <>
                      Title.Caption = #32564#38134#37329#39069
                    end
                    item
                      EditButtons = <>
                      Footers = <>
                      Title.Caption = #32467#20313#29616#37329
                      Width = 63
                    end>
                end
              end
            end
          end
        end
        object TabSheet4: TRzTabSheet
          Color = clCream
          Caption = #25910#38134#21592#25910#27454#27719#24635#34920
          object RzPanel13: TRzPanel
            Left = 0
            Top = 0
            Width = 774
            Height = 500
            Align = alClient
            BorderOuter = fsNone
            BorderWidth = 5
            TabOrder = 0
            object Panel6: TPanel
              Left = 5
              Top = 5
              Width = 764
              Height = 490
              Align = alClient
              BevelOuter = bvNone
              Color = clWhite
              TabOrder = 0
              object RzPanel14: TRzPanel
                Left = 0
                Top = 0
                Width = 764
                Height = 89
                Align = alTop
                BorderOuter = fsGroove
                BorderSides = [sdLeft, sdTop, sdRight]
                Color = clWhite
                TabOrder = 0
                object RzLabel8: TRzLabel
                  Left = 24
                  Top = 14
                  Width = 48
                  Height = 12
                  Alignment = taRightJustify
                  Caption = #25910#27454#26085#26399
                end
                object RzLabel9: TRzLabel
                  Left = 171
                  Top = 14
                  Width = 12
                  Height = 12
                  Caption = #33267
                end
                object Label12: TLabel
                  Left = 24
                  Top = 35
                  Width = 48
                  Height = 12
                  Caption = #38376#24215#32676#32452
                end
                object Label3: TLabel
                  Left = 24
                  Top = 58
                  Width = 48
                  Height = 12
                  Caption = #38376#24215#21517#31216
                end
                object P4_D1: TcxDateEdit
                  Left = 80
                  Top = 10
                  Width = 85
                  Height = 20
                  Properties.DateButtons = [btnToday]
                  TabOrder = 0
                end
                object P4_D2: TcxDateEdit
                  Left = 187
                  Top = 10
                  Width = 86
                  Height = 20
                  Properties.DateButtons = [btnToday]
                  TabOrder = 1
                end
                object RzBitBtn3: TRzBitBtn
                  Left = 294
                  Top = 41
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
                  TabOrder = 2
                  TextStyle = tsRaised
                  ThemeAware = False
                  ImageIndex = 12
                  NumGlyphs = 2
                  Spacing = 5
                end
                object fndP4_SHOP_VALUE: TzrComboBoxList
                  Tag = -1
                  Left = 154
                  Top = 32
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
                  Top = 32
                  Width = 73
                  Height = 20
                  Properties.DropDownListStyle = lsEditFixedList
                  Properties.Items.Strings = (
                    #34892#25919#21306#22495
                    #31649#29702#32676#32452)
                  TabOrder = 4
                end
                object fndP4_SHOP_ID: TzrComboBoxList
                  Tag = -1
                  Left = 80
                  Top = 54
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
                      FieldName = 'SHOP_ID'
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
                  Buttons = []
                  DropListStyle = lsFixed
                  MultiSelect = False
                end
              end
              object RzPanel15: TRzPanel
                Left = 0
                Top = 89
                Width = 764
                Height = 401
                Align = alClient
                BorderOuter = fsGroove
                Color = clWhite
                TabOrder = 1
                object DBGridEh4: TDBGridEh
                  Left = 2
                  Top = 2
                  Width = 760
                  Height = 397
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
                  OnDrawColumnCell = DBGridEh1DrawColumnCell
                  OnGetCellParams = DBGridEh1GetCellParams
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
                      FieldName = 'GROUP_ID'
                      Footers = <>
                      Title.Caption = #24037#21495
                      Width = 62
                    end
                    item
                      EditButtons = <>
                      FieldName = 'GROUP_NAME'
                      Footers = <>
                      Title.Caption = #22995#21517
                      Width = 99
                    end
                    item
                      EditButtons = <>
                      Footers = <>
                      Title.Caption = #25910#27454#21512#35745
                      Width = 72
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'PAY_A'
                      Footers = <>
                      Title.Caption = #20854#20013'|'#29616#37329
                      Width = 58
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'PAY_B'
                      Footers = <>
                      Title.Caption = #20854#20013'|'#38134#32852
                      Width = 58
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'PAY_C'
                      Footers = <>
                      Title.Caption = #20854#20013'|'#20648#20540#21345
                      Width = 58
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'PAY_D'
                      Footers = <>
                      Title.Caption = #20854#20013'|'#35760#36134
                      Width = 58
                    end
                    item
                      DisplayFormat = '#0.00%'
                      EditButtons = <>
                      FieldName = 'PAY_E'
                      Footers = <>
                      Title.Caption = #20854#20013'|'#31036#21367
                      Width = 58
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'PAY_F'
                      Footers = <>
                      Title.Caption = #20854#20013'|'#25903#31080
                      Width = 58
                    end
                    item
                      EditButtons = <>
                      FieldName = 'PAY_G'
                      Footers = <>
                      Title.Caption = #20854#20013'|'#23567#39069#25903#20184
                      Width = 58
                    end
                    item
                      EditButtons = <>
                      FieldName = 'PAY_H'
                      Footers = <>
                      Title.Caption = #20854#20013'|'
                      Width = 58
                    end
                    item
                      EditButtons = <>
                      FieldName = 'PAY_I'
                      Footers = <>
                      Title.Caption = #20854#20013'|'
                      Width = 58
                    end
                    item
                      EditButtons = <>
                      FieldName = 'PAY_J'
                      Footers = <>
                      Title.Caption = #20854#20013'|'
                      Width = 58
                    end
                    item
                      EditButtons = <>
                      Footers = <>
                      Title.Caption = #32467#20313#38646#38065
                      Width = 60
                    end>
                end
              end
            end
          end
        end
      end
      inherited PanelColumnS: TPanel
        Left = 779
        Height = 527
        inherited Panel2: TPanel
          Height = 477
          inherited RzPanel1: TRzPanel [3]
          end
          inherited Panel5: TPanel [4]
            Height = 362
            inherited rzShowColumns: TRzCheckList
              Height = 358
            end
          end
        end
      end
    end
  end
  inherited RzPanel4: TRzPanel
    Width = 991
    inherited Image1: TImage
      Width = 476
    end
    inherited Image14: TImage
      Left = 982
    end
    inherited Image3: TImage
      Width = 476
    end
    inherited rzPanel5: TPanel
      inherited lblToolCaption: TRzLabel
        Width = 60
        Caption = #25910#27454#26085#25253#34920
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
  inherited PrintDBGridEh1: TPrintDBGridEh
    PageHeader.CenterText.Strings = (
      #25910#27454#27719#24635#34920)
    PageHeader.Font.Charset = GB2312_CHARSET
    PageHeader.Font.Height = -16
    PageHeader.Font.Name = #23435#20307
    PageHeader.Font.Style = [fsBold]
    BeforeGridText_Data = {
      7B5C727466315C616E73695C616E73696370673933365C64656666305C646566
      6C616E67313033335C6465666C616E676665323035327B5C666F6E7474626C7B
      5C66305C666E696C5C6663686172736574313334205C2763625C2763655C2763
      635C2765353B7D7B5C66315C666E696C5C6663686172736574313334204D5320
      53616E732053657269663B7D7D0D0A5C766965776B696E64345C7563315C7061
      72645C71725C6C616E67323035325C66305C6673323420255B7768725D5C6631
      5C66733136200D0A5C706172207D0D0A00}
  end
  inherited adoReport1: TZQuery
    Left = 41
    Top = 321
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
    Left = 89
    Top = 321
  end
  object adoReport3: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    Params = <>
    Left = 137
    Top = 321
  end
  object adoReport4: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    Params = <>
    Left = 185
    Top = 321
  end
end
=======
�
 TFRMRECVDAYREPORT 0jM  TPF0�TfrmRecvDayReportfrmRecvDayReportLeft� TopgWidth�HeightXCaption   6e>k�e�bh�PixelsPerInch`
TextHeight �TRzPanelbgPanelWidth�Height �TRzPanelRzPanel2Width�Height
 �TRzPageControlRzPageWidth HeightColorclCreamParentColorFixedDimension �TRzTabSheet	TabSheet1ColorclCreamCaption   0W:S6e>kGl;`h� �TRzPanelRzPanel3Width�Height�BorderColor	clBtnFace �TPanelPanel4Width�Height� �TRzPanelw1Width�HeightA TRzLabelRzLabel2LeftTopWidth0Height	AlignmenttaRightJustifyCaption   6e>k�eg  TRzLabelRzLabel3Left� TopWidthHeightCaption   �  TLabelLabel5LeftTop$Width0HeightCaption   蕗^��~  TcxDateEditP1_D1LeftPTop
WidthUHeightProperties.DateButtonsbtnToday TabOrder   TcxDateEditP1_D2Left� Top
WidthVHeightProperties.DateButtonsbtnToday TabOrder  	TRzBitBtnbtnOkLeftBTopWidthCHeight ActionactFindCaption   �g�ColorclSilverFont.CharsetGB2312_CHARSET
Font.ColorclBlackFont.Height�	Font.Name   �[SO
Font.StylefsBold HighlightColorj�� HotTrack	HotTrackColor��< HotTrackColorType
htctActual
ParentFontTextShadowColorclWhiteTextShadowDepthTabOrder	TextStyletsRaised
ThemeAware
ImageIndex	NumGlyphsSpacing  TcxComboBoxfndP1_SHOP_TYPELeftPTop WidthIHeightProperties.DropDownListStylelsEditFixedListProperties.Items.Strings   行政区域   管理群组 TabOrder  TzrComboBoxListfndP1_SHOP_VALUETag�Left� Top WidthwHeightProperties.AutoSelectProperties.ButtonsDefault	  Properties.ReadOnlyTabOrderInGridKeyValue FilterFieldsCODE_ID;CODE_NAME;CODE_SPELLKeyFieldCODE_ID	ListField	CODE_NAMEColumnsEditButtons 	FieldName	CODE_NAMEFooters Title.Caption   T�y EditButtons 	FieldNameCODE_IDFooters Title.Caption   �NxWidth  	DropWidth� 
DropHeight� 	ShowTitle	AutoFitColWidth	
ShowButtonLocateStylelsDarkButtonszbNewzbClearzbFind DropListStylelsFixedMultiSelect   �TRzPanelRzPanel7TopAWidth�Height� �	TDBGridEh	DBGridEh1Width�Height�
FrozenColsTitleHeight
OnDblClickDBGridEh1DblClickColumns	AlignmenttaCenterEditButtons 	FieldNameSEQNOFooters Title.Caption   �^�SWidth EditButtons 	FieldNameGROUP_IDFooters Title.Caption   0W:S�NxWidth> EditButtons 	FieldName
GROUP_NAMEFooters Title.Caption   0W:ST�yWidth�  EditButtons Footers Title.Caption   6e>kT��WidthH DisplayFormat#0.00EditButtons 	FieldNamePAY_AFooters Title.Caption   vQ-N| �sёWidth: DisplayFormat#0.00EditButtons 	FieldNamePAY_BFooters Title.Caption   vQ-N| ��T�Width: DisplayFormat#0.00EditButtons 	FieldNamePAY_CFooters Title.Caption   vQ-N| �P<PaSWidth: DisplayFormat#0.00EditButtons 	FieldNamePAY_DFooters Title.Caption   vQ-N| ��&�Width: DisplayFormat#0.00%EditButtons 	FieldNamePAY_EFooters Title.Caption   vQ-N| <ywSWidth: DisplayFormat#0.00EditButtons 	FieldNamePAY_FFooters Title.Caption   vQ-N| /ehyWidth: EditButtons 	FieldNamePAY_GFooters Title.Caption   vQ-N| \��/e�NWidth: EditButtons 	FieldNamePAY_HFooters Title.Caption   vQ-N| Width: EditButtons 	FieldNamePAY_IFooters Title.Caption   vQ-N| Width: EditButtons 	FieldNamePAY_JFooters Title.Caption   vQ-N| Width: EditButtons Footers Title.Caption   4��ё�� EditButtons Footers Title.Caption   �~YO�sёWidth?        TRzTabSheet	TabSheet2ColorclCreamCaption   蕗^6e>kGl;`h� TRzPanelRzPanel8Left Top WidthHeight�AlignalClientBorderOuterfsNoneBorderWidthTabOrder  TPanelPanel1LeftTopWidth�Height�AlignalClient
BevelOuterbvNoneColorclWhiteTabOrder  TRzPanelRzPanel9Left Top Width�HeightAAlignalTopBorderOuterfsGrooveBorderSidessdLeftsdTopsdRight ColorclWhiteTabOrder  TRzLabelRzLabel4LeftTopWidth0Height	AlignmenttaRightJustifyCaption   6e>k�eg  TRzLabelRzLabel5Left� TopWidthHeightCaption   �  TLabelLabel10LeftTop#Width0HeightCaption   蕗^��~  TcxDateEditP2_D1LeftPTop
WidthUHeightProperties.DateButtonsbtnToday TabOrder   TcxDateEditP2_D2Left� Top
WidthWHeightProperties.DateButtonsbtnToday TabOrder  TzrComboBoxListfndP2_SHOP_VALUETag�Left� TopWidthwHeightProperties.AutoSelectProperties.ButtonsDefault	  Properties.ReadOnlyTabOrderInGridKeyValue FilterFieldsCODE_ID;CODE_NAME;CODE_SPELLKeyFieldCODE_ID	ListField	CODE_NAMEColumnsEditButtons 	FieldName	CODE_NAMEFooters Title.Caption   T�y EditButtons 	FieldNameCODE_IDFooters Title.Caption   �NxWidth  	DropWidth� 
DropHeight� 	ShowTitle	AutoFitColWidth	
ShowButtonLocateStylelsDarkButtonszbNewzbClearzbFind DropListStylelsFixedMultiSelect  	TRzBitBtn	RzBitBtn1Left.TopWidthCHeight ActionactFindCaption   �g�ColorclSilverFont.CharsetGB2312_CHARSET
Font.ColorclBlackFont.Height�	Font.Name   �[SO
Font.StylefsBold HighlightColorj�� HotTrack	HotTrackColor��< HotTrackColorType
htctActual
ParentFontTextShadowColorclWhiteTextShadowDepthTabOrder	TextStyletsRaised
ThemeAware
ImageIndex	NumGlyphsSpacing  TcxComboBoxfndP2_SHOP_TYPELeftPTopWidthIHeightProperties.DropDownListStylelsEditFixedListProperties.Items.Strings   行政区域   管理群组 TabOrder   TRzPanel	RzPanel10Left TopAWidth�Height�AlignalClientBorderOuterfsGrooveColorclWhiteTabOrder 	TDBGridEh	DBGridEh2LeftTopWidth�Height�AlignalClientAllowedOperations BorderStylebsNoneColorclWhiteCtl3D	
DataSourcedsadoReport2Flat	Font.CharsetGB2312_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name   �[SO
Font.Style FooterColorclWhiteFooterFont.CharsetGB2312_CHARSETFooterFont.ColorclWindowTextFooterFont.Height�FooterFont.Name   �[SOFooterFont.Style FooterRowCount
FrozenColsImeName   �g�T�N{��eQ�lOptionsdgTitlesdgColumnResize
dgColLines
dgRowLinesdgTabsdgAlwaysShowSelectiondgConfirmDeletedgCancelOnExit 	OptionsEh
dghFixed3DdghHighlightFocusdghClearSelection ParentCtl3D
ParentFontReadOnly		RowHeightSumList.Active	TabOrder TitleFont.CharsetGB2312_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.Name   �[SOTitleFont.StylefsBold TitleHeightUseMultiTitle	IsDrawNullRowCurrencySymbol   ��DecimalNumberDigitalNumber
OnDblClickDBGridEh2DblClickOnDrawColumnCellDBGridEh1DrawColumnCellOnGetCellParamsDBGridEh1GetCellParamsColumns	AlignmenttaCenterEditButtons 	FieldNameSEQNOFooters Title.Caption   �^�SWidth EditButtons 	FieldNameGROUP_IDFooters Title.Caption   蕗^�NxWidth> EditButtons 	FieldName
GROUP_NAMEFooters Title.Caption   蕗^T�yWidth�  EditButtons Footers Title.Caption   6e>kT��WidthH DisplayFormat#0.00EditButtons 	FieldNamePAY_AFooters Title.Caption   vQ-N| �sёWidth: DisplayFormat#0.00EditButtons 	FieldNamePAY_BFooters Title.Caption   vQ-N| ��T�Width: DisplayFormat#0.00EditButtons 	FieldNamePAY_CFooters Title.Caption   vQ-N| �P<PaSWidth: DisplayFormat#0.00EditButtons 	FieldNamePAY_DFooters Title.Caption   vQ-N| ��&�Width: DisplayFormat#0.00%EditButtons 	FieldNamePAY_EFooters Title.Caption   vQ-N| <ywSWidth: DisplayFormat#0.00EditButtons 	FieldNamePAY_FFooters Title.Caption   vQ-N| /ehyWidth: EditButtons 	FieldNamePAY_GFooters Title.Caption   vQ-N| \��/e�NWidth: EditButtons 	FieldNamePAY_HFooters Title.Caption   vQ-N| Width: EditButtons 	FieldNamePAY_IFooters Title.Caption   vQ-N| Width: EditButtons 	FieldNamePAY_JFooters Title.Caption   vQ-N| Width: EditButtons Footers Title.Caption   4��ё�� EditButtons Footers Title.Caption   �~YO�sёWidth?        TRzTabSheet	TabSheet3ColorclCreamCaption   �k�e6e>kGl;`h� TRzPanelRzPanel6Left Top WidthHeight�AlignalClientBorderOuterfsNoneBorderWidthTabOrder  TPanelPanel3LeftTopWidth�Height�AlignalClient
BevelOuterbvNoneColorclWhiteTabOrder  TRzPanel	RzPanel11Left Top Width�HeightYAlignalTopBorderOuterfsGrooveBorderSidessdLeftsdTopsdRight ColorclWhiteTabOrder  TRzLabelRzLabel6LeftTopWidth0Height	AlignmenttaRightJustifyCaption   6e>k�eg  TRzLabelRzLabel7Left� TopWidthHeightCaption   �  TLabelLabel11LeftTop$Width0HeightCaption   蕗^��~  TLabelLabel9LeftTop:Width0HeightCaption   蕗^T�y  TcxDateEditP3_D1LeftPTop
WidthUHeightProperties.DateButtonsbtnToday TabOrder   TcxDateEditP3_D2Left� Top
WidthWHeightProperties.DateButtonsbtnToday TabOrder  	TRzBitBtn	RzBitBtn2Left&Top)WidthCHeight ActionactFindCaption   �g�ColorclSilverFont.CharsetGB2312_CHARSET
Font.ColorclBlackFont.Height�	Font.Name   �[SO
Font.StylefsBold HighlightColorj�� HotTrack	HotTrackColor��< HotTrackColorType
htctActual
ParentFontTextShadowColorclWhiteTextShadowDepthTabOrder	TextStyletsRaised
ThemeAware
ImageIndex	NumGlyphsSpacing  TzrComboBoxListfndP3_SHOP_VALUETag�Left� Top WidthwHeightProperties.AutoSelectProperties.ButtonsDefault	  Properties.ReadOnlyTabOrderInGridKeyValue FilterFieldsCODE_ID;CODE_NAME;CODE_SPELLKeyFieldCODE_ID	ListField	CODE_NAMEColumnsEditButtons 	FieldName	CODE_NAMEFooters Title.Caption   T�y EditButtons 	FieldNameCODE_IDFooters Title.Caption   �NxWidth  	DropWidth� 
DropHeight� 	ShowTitle	AutoFitColWidth	
ShowButtonLocateStylelsDarkButtonszbNewzbClearzbFind DropListStylelsFixedMultiSelect  TcxComboBoxfndP3_SHOP_TYPELeftPTop WidthIHeightProperties.DropDownListStylelsEditFixedListProperties.Items.Strings   行政区域   管理群组 TabOrder  TzrComboBoxListfndP3_SHOP_IDTag�LeftPTop6Width� HeightProperties.AutoSelectProperties.ButtonsDefault	  Properties.ReadOnlyTabOrderInGridKeyValue FilterFieldsSHOP_ID;SHOP_NAME;SHOP_SPELLKeyFieldSHOP_ID	ListField	SHOP_NAMEColumnsEditButtons 	FieldName	SHOP_NAMEFooters Title.Caption   T�y EditButtons 	FieldNameSHOP_IDFooters Title.Caption   �NxWidth  	DropWidth� 
DropHeight� 	ShowTitle	AutoFitColWidth	
ShowButtonLocateStylelsDarkButtons DropListStylelsFixedMultiSelect   TRzPanel	RzPanel12Left TopYWidth�Height�AlignalClientBorderOuterfsGrooveColorclWhiteTabOrder 	TDBGridEh	DBGridEh3TagLeftTopWidth�Height�AlignalClientAllowedOperations BorderStylebsNoneColorclWhiteCtl3D	
DataSourcedsadoReport3Flat	Font.CharsetGB2312_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name   �[SO
Font.Style FooterColorclWhiteFooterFont.CharsetGB2312_CHARSETFooterFont.ColorclWindowTextFooterFont.Height�FooterFont.Name   �[SOFooterFont.Style FooterRowCount
FrozenColsImeName   �g�T�N{��eQ�lOptionsdgTitlesdgColumnResize
dgColLines
dgRowLinesdgTabsdgAlwaysShowSelectiondgConfirmDeletedgCancelOnExit 	OptionsEh
dghFixed3DdghHighlightFocusdghClearSelection ParentCtl3D
ParentFontReadOnly		RowHeightSumList.Active	TabOrder TitleFont.CharsetGB2312_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.Name   �[SOTitleFont.StylefsBold TitleHeightUseMultiTitle	IsDrawNullRowCurrencySymbol   ��DecimalNumberDigitalNumber
OnDblClickDBGridEh3DblClickOnDrawColumnCellDBGridEh1DrawColumnCellOnGetCellParamsDBGridEh1GetCellParamsColumns	AlignmenttaCenterEditButtons 	FieldNameSEQNOFooters Title.Caption   �^�SWidth EditButtons 	FieldName
GROUP_NAMEFooters Title.Caption   �egWidthc EditButtons Footers Title.Caption   6e>kT��WidthH DisplayFormat#0.00EditButtons 	FieldNamePAY_AFooters Title.Caption   vQ-N| �sёWidth: DisplayFormat#0.00EditButtons 	FieldNamePAY_BFooters Title.Caption   vQ-N| ��T�Width: DisplayFormat#0.00EditButtons 	FieldNamePAY_CFooters Title.Caption   vQ-N| �P<PaSWidth: DisplayFormat#0.00EditButtons 	FieldNamePAY_DFooters Title.Caption   vQ-N| ��&�Width: DisplayFormat#0.00%EditButtons 	FieldNamePAY_EFooters Title.Caption   vQ-N| <ywSWidth: DisplayFormat#0.00EditButtons 	FieldNamePAY_FFooters Title.Caption   vQ-N| /ehyWidth: EditButtons 	FieldNamePAY_GFooters Title.Caption   vQ-N| \��/e�NWidth: EditButtons 	FieldNamePAY_HFooters Title.Caption   vQ-N| Width: EditButtons 	FieldNamePAY_IFooters Title.Caption   vQ-N| Width: EditButtons 	FieldNamePAY_JFooters Title.Caption   vQ-N| Width: EditButtons Footers Title.Caption   4��ё�� EditButtons Footers Title.Caption   �~YO�sёWidth?        TRzTabSheet	TabSheet4ColorclCreamCaption   6e��XT6e>kGl;`h� TRzPanel	RzPanel13Left Top Width�Height�AlignalClientBorderOuterfsNoneBorderWidthTabOrder  TPanelPanel6LeftTopWidth�Height�AlignalClient
BevelOuterbvNoneColorclWhiteTabOrder  TRzPanel	RzPanel14Left Top Width�HeightYAlignalTopBorderOuterfsGrooveBorderSidessdLeftsdTopsdRight ColorclWhiteTabOrder  TRzLabelRzLabel8LeftTopWidth0Height	AlignmenttaRightJustifyCaption   6e>k�eg  TRzLabelRzLabel9Left� TopWidthHeightCaption   �  TLabelLabel12LeftTop#Width0HeightCaption   蕗^��~  TLabelLabel3LeftTop:Width0HeightCaption   蕗^T�y  TcxDateEditP4_D1LeftPTop
WidthUHeightProperties.DateButtonsbtnToday TabOrder   TcxDateEditP4_D2Left� Top
WidthVHeightProperties.DateButtonsbtnToday TabOrder  	TRzBitBtn	RzBitBtn3Left&Top)WidthCHeight ActionactFindCaption   �g�ColorclSilverFont.CharsetGB2312_CHARSET
Font.ColorclBlackFont.Height�	Font.Name   �[SO
Font.StylefsBold HighlightColorj�� HotTrack	HotTrackColor��< HotTrackColorType
htctActual
ParentFontTextShadowColorclWhiteTextShadowDepthTabOrder	TextStyletsRaised
ThemeAware
ImageIndex	NumGlyphsSpacing  TzrComboBoxListfndP4_SHOP_VALUETag�Left� Top WidthwHeightProperties.AutoSelectProperties.ButtonsDefault	  Properties.ReadOnlyTabOrderInGridKeyValue FilterFieldsCODE_ID;CODE_NAME;CODE_SPELLKeyFieldCODE_ID	ListField	CODE_NAMEColumnsEditButtons 	FieldName	CODE_NAMEFooters Title.Caption   T�y EditButtons 	FieldNameCODE_IDFooters Title.Caption   �NxWidth  	DropWidth� 
DropHeight� 	ShowTitle	AutoFitColWidth	
ShowButtonLocateStylelsDarkButtonszbNewzbClearzbFind DropListStylelsFixedMultiSelect  TcxComboBoxfndP4_SHOP_TYPELeftPTop WidthIHeightProperties.DropDownListStylelsEditFixedListProperties.Items.Strings   行政区域   管理群组 TabOrder  TzrComboBoxListfndP4_SHOP_IDTag�LeftPTop6Width� HeightProperties.AutoSelectProperties.ButtonsDefault	  Properties.ReadOnlyTabOrderInGridKeyValue FilterFieldsSHOP_ID;SHOP_NAME;SHOP_SPELLKeyFieldSHOP_ID	ListField	SHOP_NAMEColumnsEditButtons 	FieldName	SHOP_NAMEFooters Title.Caption   T�y EditButtons 	FieldNameSHOP_IDFooters Title.Caption   �NxWidth  	DropWidth� 
DropHeight� 	ShowTitle	AutoFitColWidth	
ShowButtonLocateStylelsDarkButtons DropListStylelsFixedMultiSelect   TRzPanel	RzPanel15Left TopYWidth�Height�AlignalClientBorderOuterfsGrooveColorclWhiteTabOrder 	TDBGridEh	DBGridEh4LeftTopWidth�Height�AlignalClientAllowedOperations BorderStylebsNoneColorclWhiteCtl3D	
DataSourcedsadoReport4Flat	Font.CharsetGB2312_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name   �[SO
Font.Style FooterColorclWhiteFooterFont.CharsetGB2312_CHARSETFooterFont.ColorclWindowTextFooterFont.Height�FooterFont.Name   �[SOFooterFont.Style FooterRowCount
FrozenColsImeName   �g�T�N{��eQ�lOptionsdgTitlesdgColumnResize
dgColLines
dgRowLinesdgTabsdgAlwaysShowSelectiondgConfirmDeletedgCancelOnExit 	OptionsEh
dghFixed3DdghHighlightFocusdghClearSelection ParentCtl3D
ParentFontReadOnly		RowHeightSumList.Active	TabOrder TitleFont.CharsetGB2312_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.Name   �[SOTitleFont.StylefsBold TitleHeightUseMultiTitle	IsDrawNullRowCurrencySymbol   ��DecimalNumberDigitalNumberOnDrawColumnCellDBGridEh1DrawColumnCellOnGetCellParamsDBGridEh1GetCellParamsColumns	AlignmenttaCenterEditButtons 	FieldNameSEQNOFooters Title.Caption   �^�SWidth EditButtons 	FieldNameGROUP_IDFooters Title.Caption   �]�SWidth> EditButtons 	FieldName
GROUP_NAMEFooters Title.Caption   �YTWidthc EditButtons Footers Title.Caption   6e>kT��WidthH DisplayFormat#0.00EditButtons 	FieldNamePAY_AFooters Title.Caption   vQ-N| �sёWidth: DisplayFormat#0.00EditButtons 	FieldNamePAY_BFooters Title.Caption   vQ-N| ��T�Width: DisplayFormat#0.00EditButtons 	FieldNamePAY_CFooters Title.Caption   vQ-N| �P<PaSWidth: DisplayFormat#0.00EditButtons 	FieldNamePAY_DFooters Title.Caption   vQ-N| ��&�Width: DisplayFormat#0.00%EditButtons 	FieldNamePAY_EFooters Title.Caption   vQ-N| <ywSWidth: DisplayFormat#0.00EditButtons 	FieldNamePAY_FFooters Title.Caption   vQ-N| /ehyWidth: EditButtons 	FieldNamePAY_GFooters Title.Caption   vQ-N| \��/e�NWidth: EditButtons 	FieldNamePAY_HFooters Title.Caption   vQ-N| Width: EditButtons 	FieldNamePAY_IFooters Title.Caption   vQ-N| Width: EditButtons 	FieldNamePAY_JFooters Title.Caption   vQ-N| Width: EditButtons Footers Title.Caption   �~YO����Width<         �TPanelPanelColumnSLeftHeight �TPanelPanel2Height� �TRzPanelRzPanel1  �TPanelPanel5Heightj �TRzCheckListrzShowColumnsHeightf       �TRzPanelRzPanel4Width� �TImageImage1Width�  �TImageImage14Left�  �TImageImage3Width�  �TPanelrzPanel5 �TRzLabellblToolCaptionWidth<Caption   6e>k�e�bh�   TButtonButton1LeftTop WidthKHeightCaptionButton1TabOrderOnClickButton1Click   �	TMainMenummMenuLeft� Top�  �TActionListactListLeft� Top� �TActionactFind	OnExecuteactFindExecute   �TDataSourcedsadoReport1Left)Topb  �TPrintDBGridEhPrintDBGridEh1PageHeader.CenterText.Strings   收款汇总表 PageHeader.Font.CharsetGB2312_CHARSETPageHeader.Font.Height�PageHeader.Font.Name   �[SOPageHeader.Font.StylefsBold BeforeGridText_Data
�   {\rtf1\ansi\ansicpg936\deff0\deflang1033\deflangfe2052{\fonttbl{\f0\fnil\fcharset134 \'cb\'ce\'cc\'e5;}{\f1\fnil\fcharset134 MS Sans Serif;}}
\viewkind4\uc1\pard\qr\lang2052\f0\fs24 %[whr]\f1\fs16 
\par }
   �TZQuery
adoReport1Left)TopA  TDataSourcedsadoReport2DataSet
adoReport2LeftYTopb  TDataSourcedsadoReport3DataSet
adoReport3Left� Topb  TDataSourcedsadoReport4DataSet
adoReport4Left� Topb  TZQuery
adoReport2	FieldDefs CachedUpdates	Params LeftYTopA  TZQuery
adoReport3	FieldDefs CachedUpdates	Params Left� TopA  TZQuery
adoReport4	FieldDefs CachedUpdates	Params Left� TopA   >>>>>>> .r768
