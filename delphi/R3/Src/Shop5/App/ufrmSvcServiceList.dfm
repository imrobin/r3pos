inherited frmSvcServiceList: TfrmSvcServiceList
  Left = 307
  Top = 144
  Width = 908
  Height = 549
  Caption = #21806#21518#26381#21153
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  inherited bgPanel: TRzPanel
    Width = 892
    Height = 474
    inherited RzPanel2: TRzPanel
      Width = 882
      Height = 464
      inherited RzPage: TRzPageControl
        Width = 876
        Height = 458
        ActivePage = TabSheet2
        TabIndex = 1
        OnChange = RzPageChange
        FixedDimension = 25
        inherited TabSheet1: TRzTabSheet
          Caption = #38144#21806#35760#24405#26597#35810
          inherited RzPanel3: TRzPanel
            Width = 874
            Height = 431
            object RzPanel1: TRzPanel
              Left = 5
              Top = 5
              Width = 864
              Height = 421
              Align = alClient
              BorderInner = fsStatus
              BorderOuter = fsNone
              BorderWidth = 5
              TabOrder = 0
              object RzPanel6: TRzPanel
                Left = 6
                Top = 6
                Width = 852
                Height = 120
                Align = alTop
                BorderOuter = fsNone
                BorderColor = clWhite
                BorderWidth = 5
                Color = clWhite
                TabOrder = 0
                object Label3: TLabel
                  Left = 24
                  Top = 31
                  Width = 48
                  Height = 12
                  Caption = #38376#24215#21517#31216
                end
                object RzLabel2: TRzLabel
                  Left = 24
                  Top = 9
                  Width = 48
                  Height = 12
                  Alignment = taRightJustify
                  Caption = #38144#21806#26085#26399
                end
                object RzLabel3: TRzLabel
                  Left = 186
                  Top = 9
                  Width = 12
                  Height = 12
                  Caption = #33267
                end
                object Label2: TLabel
                  Left = 24
                  Top = 53
                  Width = 48
                  Height = 12
                  Caption = #23458#25143#21517#31216
                end
                object Label8: TLabel
                  Left = 267
                  Top = 31
                  Width = 48
                  Height = 12
                  Caption = #25152#23646#37096#38376
                end
                object RzLabel5: TRzLabel
                  Left = 24
                  Top = 75
                  Width = 48
                  Height = 12
                  Alignment = taRightJustify
                  Caption = #27969#27700#21333#21495
                end
                object Label6: TLabel
                  Left = 267
                  Top = 54
                  Width = 48
                  Height = 12
                  Alignment = taRightJustify
                  Caption = #38144#21806#26041#24335
                end
                object RzLabel8: TRzLabel
                  Left = 267
                  Top = 77
                  Width = 48
                  Height = 12
                  Alignment = taRightJustify
                  Caption = #21457' '#31080' '#21495
                end
                object Label25: TLabel
                  Left = 24
                  Top = 100
                  Width = 48
                  Height = 12
                  Caption = #21830#21697#25351#26631
                  Font.Charset = GB2312_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = #23435#20307
                  Font.Style = []
                  ParentFont = False
                end
                object Label1: TLabel
                  Left = 267
                  Top = 101
                  Width = 48
                  Height = 12
                  Caption = #21830#21697#21517#31216
                  Font.Charset = GB2312_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = #23435#20307
                  Font.Style = []
                  ParentFont = False
                end
                object P1_D1: TcxDateEdit
                  Left = 80
                  Top = 5
                  Width = 97
                  Height = 20
                  ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                  Properties.DateButtons = [btnToday]
                  TabOrder = 0
                end
                object P1_D2: TcxDateEdit
                  Left = 205
                  Top = 5
                  Width = 98
                  Height = 20
                  ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                  Properties.DateButtons = [btnToday]
                  TabOrder = 1
                end
                object btnOk: TRzBitBtn
                  Left = 576
                  Top = 90
                  Width = 67
                  Height = 27
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
                object fndP1_SHOP_ID: TzrComboBoxList
                  Tag = -1
                  Left = 80
                  Top = 27
                  Width = 183
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
                  ShowButton = True
                  LocateStyle = lsDark
                  Buttons = [zbClear]
                  DropListStyle = lsFixed
                  MultiSelect = False
                end
                object fndSTATUS: TcxRadioGroup
                  Left = 463
                  Top = 32
                  Width = 105
                  Height = 85
                  ItemIndex = 0
                  Properties.Items = <
                    item
                      Caption = #20840#37096
                    end
                    item
                      Caption = #26410#30331#35760
                    end
                    item
                      Caption = #37096#20998#30331#35760
                    end
                    item
                      Caption = #23436#25104#30331#35760
                    end>
                  TabOrder = 8
                  Caption = #29366#24577
                end
                object fndP1_CUST_ID: TzrComboBoxList
                  Left = 80
                  Top = 50
                  Width = 183
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
                      Title.Caption = #23458#25143#21517#31216
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
                  DropWidth = 296
                  DropHeight = 220
                  ShowTitle = True
                  AutoFitColWidth = False
                  ShowButton = True
                  LocateStyle = lsDark
                  Buttons = [zbClear]
                  DropListStyle = lsFixed
                  MultiSelect = False
                end
                object fndP1_DEPT_ID: TzrComboBoxList
                  Left = 323
                  Top = 27
                  Width = 135
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
                  ShowButton = True
                  LocateStyle = lsDark
                  Buttons = [zbClear]
                  DropListStyle = lsFixed
                  MultiSelect = False
                end
                object fndSALES_ID: TcxTextEdit
                  Left = 80
                  Top = 73
                  Width = 183
                  Height = 20
                  TabOrder = 6
                  ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                end
                object fndSALES_STYLE: TzrComboBoxList
                  Left = 323
                  Top = 50
                  Width = 135
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
                      Title.Caption = #23610#30721#32452
                      Width = 121
                    end>
                  DropWidth = 121
                  DropHeight = 120
                  ShowTitle = False
                  AutoFitColWidth = True
                  ShowButton = True
                  LocateStyle = lsDark
                  Buttons = [zbClear]
                  DropListStyle = lsFixed
                  MultiSelect = False
                end
                object fndINVOICE_NO: TcxTextEdit
                  Left = 323
                  Top = 73
                  Width = 135
                  Height = 20
                  TabOrder = 7
                  ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                end
                object edtGoods_Type: TcxComboBox
                  Left = 80
                  Top = 96
                  Width = 73
                  Height = 20
                  ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                  ParentFont = False
                  Properties.DropDownListStyle = lsEditFixedList
                  Properties.OnChange = edtGoods_TypePropertiesChange
                  TabOrder = 10
                end
                object edtGoods_ID: TzrComboBoxList
                  Tag = -1
                  Left = 154
                  Top = 96
                  Width = 109
                  Height = 20
                  ParentFont = False
                  Properties.AutoSelect = False
                  Properties.Buttons = <
                    item
                      Default = True
                    end>
                  Properties.ReadOnly = False
                  TabOrder = 11
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
                object edtGoodsName: TzrComboBoxList
                  Left = 323
                  Top = 97
                  Width = 135
                  Height = 20
                  TabStop = False
                  Properties.AutoSelect = False
                  Properties.Buttons = <
                    item
                      Default = True
                    end>
                  Properties.ReadOnly = False
                  TabOrder = 12
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
                  Buttons = [zbClear]
                  DropListStyle = lsFixed
                  MultiSelect = False
                  ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
                end
                object edtSORT_ID: TcxButtonEdit
                  Left = 154
                  Top = 96
                  Width = 109
                  Height = 20
                  Properties.Buttons = <
                    item
                      Default = True
                      Kind = bkEllipsis
                    end>
                  Properties.ReadOnly = True
                  Properties.OnButtonClick = edtSORT_IDPropertiesButtonClick
                  TabOrder = 13
                  OnKeyPress = edtSORT_IDKeyPress
                end
              end
              object Panel1: TPanel
                Left = 6
                Top = 126
                Width = 852
                Height = 289
                Align = alClient
                Caption = 'Panel1'
                TabOrder = 1
                object DBGridEh1: TDBGridEh
                  Left = 1
                  Top = 1
                  Width = 850
                  Height = 287
                  Align = alClient
                  AllowedOperations = [alopUpdateEh]
                  Color = clWhite
                  DataSource = DsSalesList
                  Flat = True
                  FooterColor = clWindow
                  FooterFont.Charset = GB2312_CHARSET
                  FooterFont.Color = clWindowText
                  FooterFont.Height = -12
                  FooterFont.Name = #23435#20307
                  FooterFont.Style = []
                  FooterRowCount = 1
                  FrozenCols = 1
                  ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                  Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                  OptionsEh = [dghFixed3D, dghFrozen3D, dghHighlightFocus, dghClearSelection]
                  RowHeight = 20
                  SumList.Active = True
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
                  OnDblClick = DBGridEh1DblClick
                  OnDrawColumnCell = DBGridEh1DrawColumnCell
                  Columns = <
                    item
                      Color = clBtnFace
                      EditButtons = <>
                      FieldName = 'SEQNO'
                      Footers = <>
                      Title.Caption = #24207#21495
                      Width = 29
                    end
                    item
                      EditButtons = <>
                      FieldName = 'GLIDE_NO'
                      Footer.Alignment = taRightJustify
                      Footer.Value = #21512'  '#35745':'
                      Footer.ValueType = fvtStaticText
                      Footers = <>
                      ReadOnly = True
                      Title.Caption = #21333#21495
                      Width = 100
                    end
                    item
                      DisplayFormat = '00000000'
                      EditButtons = <>
                      FieldName = 'INVOICE_NO'
                      Footers = <>
                      Title.Caption = #21457#31080#21495
                      Width = 80
                    end
                    item
                      DisplayFormat = '0000-00-00'
                      EditButtons = <>
                      FieldName = 'SALES_DATE'
                      Footers = <>
                      ReadOnly = True
                      Title.Caption = #38144#21806#26085#26399
                      Width = 67
                    end
                    item
                      EditButtons = <>
                      FieldName = 'GODS_NAME'
                      Footers = <>
                      Title.Caption = #21830#21697#21517#31216
                      Width = 150
                    end
                    item
                      EditButtons = <>
                      FieldName = 'CLIENT_NAME'
                      Footers = <>
                      ReadOnly = True
                      Title.Caption = #23458#25143#21517#31216
                      Width = 150
                    end
                    item
                      EditButtons = <>
                      FieldName = 'SHOP_ID_TEXT'
                      Footers = <>
                      ReadOnly = True
                      Title.Caption = #38376#24215#21517#31216
                      Width = 120
                    end
                    item
                      EditButtons = <>
                      FieldName = 'INVOICE_FLAG'
                      Footers = <>
                      ReadOnly = True
                      Title.Caption = #31080#25454#31867#22411
                      Visible = False
                      Width = 70
                    end
                    item
                      Alignment = taRightJustify
                      EditButtons = <>
                      FieldName = 'AMOUNT'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      ReadOnly = True
                      Title.Caption = #25968#37327
                      Width = 70
                    end
                    item
                      EditButtons = <>
                      FieldName = 'GUIDE_USER_TEXT'
                      Footers = <>
                      ReadOnly = True
                      Title.Caption = #23548#36141#21592
                      Width = 48
                    end
                    item
                      EditButtons = <>
                      FieldName = 'STATUS'
                      Footers = <>
                      Title.Caption = #29366#24577
                      Width = 66
                    end
                    item
                      EditButtons = <>
                      FieldName = 'REMARK'
                      Footers = <>
                      Title.Caption = #22791#27880
                      Width = 150
                    end
                    item
                      EditButtons = <>
                      FieldName = 'CREA_USER_TEXT'
                      Footers = <>
                      Title.Caption = #21046#21333#21592
                      Width = 44
                    end
                    item
                      EditButtons = <>
                      FieldName = 'CREA_DATE'
                      Footers = <>
                      Title.Caption = #24405#20837#26102#38388
                      Width = 145
                    end>
                end
              end
            end
          end
        end
        object TabSheet2: TRzTabSheet
          Caption = #26381#21153#35760#24405#26597#35810
          object RzPanel7: TRzPanel
            Left = 0
            Top = 0
            Width = 874
            Height = 431
            Align = alClient
            BorderInner = fsStatus
            BorderOuter = fsNone
            BorderWidth = 5
            TabOrder = 0
            object RzPanel8: TRzPanel
              Left = 6
              Top = 6
              Width = 862
              Height = 111
              Align = alTop
              BorderOuter = fsNone
              BorderColor = clWhite
              BorderWidth = 5
              Color = clWhite
              TabOrder = 0
              object RzLabel4: TRzLabel
                Left = 24
                Top = 8
                Width = 48
                Height = 12
                Alignment = taRightJustify
                Caption = #21463#29702#26085#26399
              end
              object RzLabel1: TRzLabel
                Left = 186
                Top = 8
                Width = 12
                Height = 12
                Caption = #33267
              end
              object Label4: TLabel
                Left = 24
                Top = 92
                Width = 48
                Height = 12
                Alignment = taRightJustify
                Caption = #21463' '#29702' '#20154
              end
              object Label17: TLabel
                Left = 24
                Top = 71
                Width = 48
                Height = 12
                Caption = #23458#25143#21517#31216
              end
              object RzLabel6: TRzLabel
                Left = 24
                Top = 50
                Width = 48
                Height = 12
                Alignment = taRightJustify
                Caption = #24207' '#21015' '#21495
              end
              object RzLabel7: TRzLabel
                Left = 203
                Top = 71
                Width = 36
                Height = 12
                Alignment = taRightJustify
                Caption = #23458#25143#21495
              end
              object Label30: TLabel
                Left = 24
                Top = 29
                Width = 48
                Height = 12
                Alignment = taRightJustify
                Caption = #21830#21697#21517#31216
              end
              object RzLabel9: TRzLabel
                Left = 203
                Top = 92
                Width = 36
                Height = 12
                Alignment = taRightJustify
                Caption = #21457#31080#21495
              end
              object D1: TcxDateEdit
                Left = 80
                Top = 4
                Width = 97
                Height = 20
                ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                Properties.DateButtons = [btnToday]
                TabOrder = 0
              end
              object D2: TcxDateEdit
                Left = 205
                Top = 4
                Width = 98
                Height = 20
                ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                Properties.DateButtons = [btnToday]
                TabOrder = 1
              end
              object RzBitBtn1: TRzBitBtn
                Left = 356
                Top = 82
                Width = 67
                Height = 26
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
              object fndCREA_USER: TzrComboBoxList
                Left = 80
                Top = 88
                Width = 118
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
                FilterFields = 'ACCOUNT;USER_NAME'
                KeyField = 'USER_ID'
                ListField = 'USER_NAME'
                Columns = <
                  item
                    EditButtons = <>
                    FieldName = 'ACCOUNT'
                    Footers = <>
                    Title.Caption = #24080#21495
                  end
                  item
                    EditButtons = <>
                    FieldName = 'USER_NAME'
                    Footers = <>
                    Title.Caption = #22995#21517
                    Width = 130
                  end>
                DropWidth = 180
                DropHeight = 150
                ShowTitle = True
                AutoFitColWidth = True
                ShowButton = True
                LocateStyle = lsDark
                Buttons = [zbClear]
                DropListStyle = lsFixed
                MultiSelect = False
              end
              object fndCLIENT_ID: TzrComboBoxList
                Left = 80
                Top = 67
                Width = 118
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
                    Title.Caption = #23458#25143#21517#31216
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
                DropWidth = 296
                DropHeight = 220
                ShowTitle = True
                AutoFitColWidth = False
                ShowButton = True
                LocateStyle = lsDark
                Buttons = [zbClear]
                DropListStyle = lsFixed
                MultiSelect = False
              end
              object fndSERIAL_NO: TcxTextEdit
                Left = 80
                Top = 46
                Width = 264
                Height = 20
                Properties.MaxLength = 50
                TabOrder = 3
                ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
              end
              object fndCLIENT_CODE: TcxTextEdit
                Left = 247
                Top = 67
                Width = 97
                Height = 20
                Properties.MaxLength = 30
                TabOrder = 5
                ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
              end
              object fndP2_GODS_ID: TzrComboBoxList
                Tag = 100
                Left = 80
                Top = 25
                Width = 223
                Height = 20
                Properties.AutoSelect = False
                Properties.Buttons = <
                  item
                    Default = True
                  end>
                Properties.ReadOnly = False
                TabOrder = 2
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
              object fndINVOICE_NO1: TcxTextEdit
                Left = 247
                Top = 88
                Width = 97
                Height = 20
                TabOrder = 7
                ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
              end
              object cxRadioButton1: TcxRadioButton
                Left = 312
                Top = 7
                Width = 73
                Height = 17
                Caption = #21463#29702#26085#26399
                Checked = True
                TabOrder = 9
                TabStop = True
                OnClick = cxRadioButton1Click
              end
              object cxRadioButton2: TcxRadioButton
                Left = 392
                Top = 7
                Width = 73
                Height = 17
                Caption = #24405#20837#26085#26399
                TabOrder = 10
                OnClick = cxRadioButton2Click
              end
            end
            object Panel2: TPanel
              Left = 6
              Top = 117
              Width = 862
              Height = 308
              Align = alClient
              Caption = 'Panel1'
              TabOrder = 1
              object DBGridEh2: TDBGridEh
                Left = 1
                Top = 1
                Width = 860
                Height = 306
                Align = alClient
                AllowedOperations = [alopUpdateEh]
                DataSource = DataSource2
                Flat = True
                FooterColor = clWindow
                FooterFont.Charset = GB2312_CHARSET
                FooterFont.Color = clWindowText
                FooterFont.Height = -12
                FooterFont.Name = #23435#20307
                FooterFont.Style = []
                FrozenCols = 1
                ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                OptionsEh = [dghFixed3D, dghFrozen3D, dghHighlightFocus, dghClearSelection]
                ReadOnly = True
                RowHeight = 20
                SumList.Active = True
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
                OnDblClick = actInfoExecute
                OnDrawColumnCell = DBGridEh2DrawColumnCell
                Columns = <
                  item
                    Color = clBtnFace
                    EditButtons = <>
                    FieldName = 'SEQ_NO'
                    Footers = <>
                    Title.Caption = #24207#21495
                    Width = 32
                  end
                  item
                    EditButtons = <>
                    FieldName = 'GLIDE_NO'
                    Footers = <>
                    Title.Caption = #38144#21806#21333#21495
                    Width = 108
                  end
                  item
                    DisplayFormat = '00000000'
                    EditButtons = <>
                    FieldName = 'INVOICE_NO'
                    Footers = <>
                    Title.Caption = #21457#31080#21495
                    Width = 80
                  end
                  item
                    EditButtons = <>
                    FieldName = 'GODS_NAME'
                    Footers = <>
                    Title.Caption = #21830#21697#21517#31216
                    Width = 148
                  end
                  item
                    EditButtons = <>
                    FieldName = 'CLIENT_ID_TEXT'
                    Footers = <>
                    Title.Caption = #23458#25143#21517#31216
                    Width = 158
                  end
                  item
                    EditButtons = <>
                    FieldName = 'CLIENT_CODE'
                    Footers = <>
                    Title.Caption = #23458#25143#21495
                    Width = 73
                  end
                  item
                    EditButtons = <>
                    FieldName = 'LINKMAN'
                    Footers = <>
                    Title.Caption = #32852#31995#20154
                    Width = 53
                  end
                  item
                    EditButtons = <>
                    FieldName = 'TELEPHONE'
                    Footers = <>
                    Title.Caption = #32852#31995#30005#35805
                    Width = 90
                  end
                  item
                    EditButtons = <>
                    FieldName = 'ADDRESS'
                    Footers = <>
                    Title.Caption = #23458#25143#22320#22336
                    Width = 219
                  end
                  item
                    EditButtons = <>
                    FieldName = 'SERIAL_NO'
                    Footers = <>
                    Title.Caption = #24207#21015#21495
                    Width = 207
                  end
                  item
                    Alignment = taRightJustify
                    DisplayFormat = '0000-00-00'
                    EditButtons = <>
                    FieldName = 'RECV_DATE'
                    Footers = <>
                    Title.Caption = #21463#29702#26085#26399
                    Width = 70
                  end
                  item
                    EditButtons = <>
                    FieldName = 'RECV_USER_TEXT'
                    Footers = <>
                    Title.Caption = #21463#29702#20154
                    Width = 49
                  end
                  item
                    DisplayFormat = '0000-00-00'
                    EditButtons = <>
                    FieldName = 'SRVR_DATE'
                    Footers = <>
                    Title.Caption = #22788#29702#26085#26399
                    Width = 80
                  end
                  item
                    EditButtons = <>
                    FieldName = 'SRVR_USER_TEXT'
                    Footers = <>
                    Title.Caption = #22788#29702#20154
                    Width = 57
                  end
                  item
                    EditButtons = <>
                    FieldName = 'CREA_USER_TEXT'
                    Footers = <>
                    Title.Caption = #21046#21333#21592
                    Width = 51
                  end
                  item
                    EditButtons = <>
                    FieldName = 'CREA_DATE'
                    Footers = <>
                    Title.Caption = #21046#21333#26102#38388
                    Width = 150
                  end>
              end
            end
          end
        end
      end
    end
  end
  inherited RzPanel4: TRzPanel
    Width = 892
    inherited Image3: TImage
      Left = 374
      Width = 478
    end
    inherited Image14: TImage
      Left = 872
    end
    inherited Image1: TImage
      Left = 852
    end
    inherited rzPanel5: TPanel
      Left = 374
    end
    inherited CoolBar1: TCoolBar
      Width = 354
      Bands = <
        item
          Break = False
          Control = ToolBar1
          FixedSize = True
          ImageIndex = -1
          MinHeight = 354
          Width = 48
        end>
      inherited ToolBar1: TToolBar
        Width = 354
        ButtonWidth = 43
        object ToolButton1: TToolButton
          Left = 0
          Top = 0
          Action = actNew
          Caption = #30331#35760
        end
        object ToolButton2: TToolButton
          Left = 43
          Top = 0
          Action = actEdit
        end
        object ToolButton3: TToolButton
          Left = 86
          Top = 0
          Action = actInfo
        end
        object ToolButton4: TToolButton
          Left = 129
          Top = 0
          Action = actDelete
        end
        object ToolButton5: TToolButton
          Left = 172
          Top = 0
          Width = 10
          Caption = 'ToolButton5'
          ImageIndex = 4
          Style = tbsDivider
        end
        object ToolButton6: TToolButton
          Left = 182
          Top = 0
          Action = actAudit
        end
        object ToolButton7: TToolButton
          Left = 225
          Top = 0
          Action = actPrint
        end
        object ToolButton8: TToolButton
          Left = 268
          Top = 0
          Action = actPreview
        end
        object ToolButton9: TToolButton
          Left = 311
          Top = 0
          Action = actExit
        end
      end
    end
  end
  inherited mmMenu: TMainMenu
    Left = 56
    Top = 240
  end
  inherited actList: TActionList
    Left = 88
    Top = 240
    inherited actNew: TAction
      Caption = #24320#31080
      OnExecute = actNewExecute
    end
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actEdit: TAction
      OnExecute = actEditExecute
    end
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
    inherited actPreview: TAction
      OnExecute = actPreviewExecute
    end
    inherited actFind: TAction
      OnExecute = actFindExecute
    end
    inherited actInfo: TAction
      Caption = #35814#32454
      OnExecute = actInfoExecute
    end
    inherited actAudit: TAction
      Visible = False
      OnExecute = actAuditExecute
    end
  end
  object DsSalesList: TDataSource
    DataSet = CdsSalesList
    Left = 109
    Top = 282
  end
  object CdsSalesList: TZQuery
    FieldDefs = <>
    AfterScroll = CdsSalesListAfterScroll
    CachedUpdates = True
    Params = <>
    Left = 79
    Top = 281
  end
  object DataSource2: TDataSource
    DataSet = cdsList
    Left = 429
    Top = 234
  end
  object cdsList: TZQuery
    FieldDefs = <>
    AfterScroll = cdsListAfterScroll
    CachedUpdates = True
    Params = <>
    Left = 399
    Top = 233
  end
  object PrintDBGridEh1: TPrintDBGridEh
    Options = [pghFitGridToPageWidth]
    Page.BottomMargin = 2.000000000000000000
    Page.LeftMargin = 2.000000000000000000
    Page.RightMargin = 0.500000000000000000
    Page.TopMargin = 2.000000000000000000
    PageFooter.Font.Charset = DEFAULT_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -11
    PageFooter.Font.Name = 'MS Sans Serif'
    PageFooter.Font.Style = []
    PageHeader.Font.Charset = ANSI_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -24
    PageHeader.Font.Name = #23435#20307
    PageHeader.Font.Style = [fsBold]
    Units = MM
    Left = 167
    Top = 282
    BeforeGridText_Data = {
      7B5C727466315C616E73695C616E73696370673933365C64656666305C646566
      6C616E67313033335C6465666C616E676665323035327B5C666F6E7474626C7B
      5C66305C666E696C5C6663686172736574313334205C2763625C2763655C2763
      635C2765353B7D7B5C66315C666E696C5C6663686172736574313334204D5320
      53616E732053657269663B7D7D0D0A5C766965776B696E64345C7563315C7061
      72645C6C616E67323035325C66305C6673323020255B5365636F6E645469746C
      655D5C66315C66733136200D0A5C706172207D0D0A00}
    AfterGridText_Data = {
      7B5C727466315C616E73695C616E73696370673933365C64656666305C646566
      6C616E67313033335C6465666C616E676665323035327B5C666F6E7474626C7B
      5C66305C666E696C5C6663686172736574313334205C2763625C2763655C2763
      635C2765353B7D7D0D0A5C766965776B696E64345C7563315C706172645C7172
      5C6C616E67323035325C66305C667332305C2762345C2766325C2764335C2761
      315C2763615C2762315C2762635C2765340D0A5C706172207D0D0A00}
  end
end
