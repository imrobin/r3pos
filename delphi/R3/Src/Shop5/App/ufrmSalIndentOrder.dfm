inherited frmSalIndentOrder: TfrmSalIndentOrder
  Left = 157
  Top = 153
  Width = 950
  Height = 552
  Caption = #38144#21806#35746#21333
  PixelsPerInch = 96
  TextHeight = 12
  inherited RzPanel1: TRzPanel
    Width = 934
    Height = 514
    inherited RzPanel2: TRzPanel
      Width = 924
      Height = 137
      TabStop = True
      object lblSTOCK_DATE: TLabel [0]
        Left = 562
        Top = 9
        Width = 48
        Height = 12
        Alignment = taRightJustify
        Caption = #35746#36135#26085#26399
      end
      object lblCLIENT_ID: TLabel [1]
        Left = 195
        Top = 9
        Width = 48
        Height = 12
        Alignment = taRightJustify
        Caption = #23458#25143#21517#31216
      end
      object Label2: TLabel [2]
        Left = 195
        Top = 114
        Width = 48
        Height = 12
        Alignment = taRightJustify
        Caption = #22791'    '#27880
      end
      object Label5: TLabel [3]
        Left = 563
        Top = 72
        Width = 48
        Height = 12
        Alignment = taRightJustify
        Caption = #31080#25454#31867#22411
      end
      object Label6: TLabel [4]
        Left = 404
        Top = 30
        Width = 36
        Height = 12
        Alignment = taRightJustify
        Caption = #23548#36141#21592
      end
      object Label40: TLabel [5]
        Left = 195
        Top = 30
        Width = 48
        Height = 12
        Caption = #35746#36135#38376#24215
      end
      object Label12: TLabel [6]
        Left = 195
        Top = 93
        Width = 48
        Height = 12
        Alignment = taRightJustify
        Caption = #36865#36135#22320#22336
      end
      object Label15: TLabel [7]
        Left = 195
        Top = 72
        Width = 48
        Height = 12
        Alignment = taRightJustify
        Caption = #32852#31995#30005#35805
      end
      object Label16: TLabel [8]
        Left = 405
        Top = 72
        Width = 36
        Height = 12
        Alignment = taRightJustify
        Caption = #32852#31995#20154
      end
      object Label17: TLabel [9]
        Left = 562
        Top = 30
        Width = 48
        Height = 12
        Alignment = taRightJustify
        Caption = #35746#36135#26041#24335
      end
      object Label13: TLabel [10]
        Left = 563
        Top = 51
        Width = 48
        Height = 12
        Alignment = taRightJustify
        Caption = #36865#36135#26085#26399
      end
      object Label11: TLabel [11]
        Left = 563
        Top = 93
        Width = 48
        Height = 12
        Alignment = taRightJustify
        Caption = #38144#39033#31246#29575
      end
      object Label22: TLabel [12]
        Left = 401
        Top = 50
        Width = 39
        Height = 12
        Caption = #39044#25910#27454
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel [13]
        Left = 195
        Top = 51
        Width = 48
        Height = 12
        Caption = #25152#23646#37096#38376
      end
      object Label14: TLabel [14]
        Left = 676
        Top = 93
        Width = 6
        Height = 12
        Alignment = taRightJustify
        Caption = '%'
      end
      inherited RzPanel4: TRzPanel
        Height = 107
        TabOrder = 14
        inherited Shape1: TShape
          Top = 33
        end
        inherited lblCaption: TLabel
          Left = 11
          Caption = #21333#21495':'#33258#21160#32534#21495
        end
        inherited Image1: TImage
          Left = 95
          Top = 39
        end
        inherited lblState: TLabel
          Left = 8
          Top = 48
        end
        object Label18: TLabel
          Left = 8
          Top = 78
          Width = 33
          Height = 12
          Caption = #29366#24577':'
          Font.Charset = GB2312_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
      end
      object edtCLIENT_ID: TzrComboBoxList
        Left = 251
        Top = 5
        Width = 263
        Height = 20
        Properties.AutoSelect = False
        Properties.Buttons = <
          item
            Default = True
          end>
        Properties.ReadOnly = True
        Properties.OnChange = edtCLIENT_IDPropertiesChange
        TabOrder = 0
        InGrid = False
        KeyValue = Null
        FilterFields = 'CLIENT_NAME;CLIENT_SPELL;CLIENT_CODE;LICENSE_CODE;TELEPHONE2'
        KeyField = 'CLIENT_ID'
        ListField = 'CLIENT_NAME'
        Columns = <
          item
            EditButtons = <>
            FieldName = 'CLIENT_CODE'
            Footers = <>
            Title.Caption = #23458#25143#21495
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
        DropWidth = 314
        DropHeight = 281
        ShowTitle = True
        AutoFitColWidth = False
        OnFindClick = edtCLIENT_IDFindClick
        OnAddClick = edtCLIENT_IDAddClick
        ShowButton = True
        LocateStyle = lsDark
        Buttons = [zbNew, zbFind]
        DropListStyle = lsFixed
        OnSaveValue = edtCLIENT_IDSaveValue
        MultiSelect = False
      end
      object edtINDE_DATE: TcxDateEdit
        Left = 619
        Top = 5
        Width = 121
        Height = 20
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 9
      end
      object edtREMARK: TcxTextEdit
        Left = 251
        Top = 110
        Width = 286
        Height = 20
        TabOrder = 8
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
      object edtINVOICE_FLAG: TcxComboBox
        Left = 619
        Top = 68
        Width = 121
        Height = 20
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        Properties.DropDownListStyle = lsFixedList
        Properties.OnChange = edtINVOICE_FLAGPropertiesChange
        TabOrder = 12
      end
      object edtGUIDE_USER: TzrComboBoxList
        Left = 448
        Top = 26
        Width = 89
        Height = 20
        Properties.AutoSelect = False
        Properties.Buttons = <
          item
            Default = True
          end>
        Properties.ReadOnly = True
        TabOrder = 2
        InGrid = False
        KeyValue = Null
        FilterFields = 'ACCOUNT;USER_NAME;USER_SPELL'
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
        OnAddClick = edtGUIDE_USERAddClick
        ShowButton = True
        LocateStyle = lsDark
        Buttons = [zbNew]
        DropListStyle = lsFixed
        MultiSelect = False
      end
      object edtTAX_RATE: TcxSpinEdit
        Left = 619
        Top = 89
        Width = 50
        Height = 20
        Properties.MaxValue = 100.000000000000000000
        Properties.ValueType = vtFloat
        TabOrder = 13
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
      object edtSEND_ADDR: TcxTextEdit
        Left = 251
        Top = 89
        Width = 286
        Height = 20
        TabOrder = 7
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        OnKeyDown = edtSEND_ADDRKeyDown
      end
      object edtTELEPHONE: TcxTextEdit
        Left = 251
        Top = 68
        Width = 131
        Height = 20
        TabOrder = 5
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        OnKeyDown = edtTELEPHONEKeyDown
      end
      object edtLINKMAN: TcxTextEdit
        Left = 448
        Top = 68
        Width = 89
        Height = 20
        TabOrder = 6
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        OnKeyDown = edtLINKMANKeyDown
      end
      object edtSALES_STYLE: TzrComboBoxList
        Left = 619
        Top = 26
        Width = 121
        Height = 20
        Properties.AutoSelect = False
        Properties.Buttons = <
          item
            Default = True
          end>
        Properties.ReadOnly = True
        TabOrder = 10
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
        OnAddClick = edtSALES_STYLEAddClick
        ShowButton = True
        LocateStyle = lsDark
        Buttons = [zbNew]
        DropListStyle = lsFixed
        MultiSelect = False
      end
      object edtPLAN_DATE: TcxDateEdit
        Left = 619
        Top = 47
        Width = 121
        Height = 20
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 11
      end
      object edtADVA_MNY: TcxTextEdit
        Left = 448
        Top = 47
        Width = 89
        Height = 20
        ParentFont = False
        Style.Font.Charset = GB2312_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -12
        Style.Font.Name = #23435#20307
        Style.Font.Style = [fsBold]
        TabOrder = 4
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
      object edtSHOP_ID: TzrComboBoxList
        Left = 251
        Top = 26
        Width = 131
        Height = 20
        Properties.AutoSelect = False
        Properties.Buttons = <
          item
            Default = True
          end>
        Properties.ReadOnly = False
        TabOrder = 1
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
            Title.Caption = #24207#21495
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
        OnSaveValue = edtSHOP_IDSaveValue
        MultiSelect = False
      end
      object edtDEPT_ID: TzrComboBoxList
        Left = 251
        Top = 47
        Width = 131
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
      end
      object RzBitBtn1: TRzBitBtn
        Left = 514
        Top = 5
        Width = 23
        Height = 20
        Caption = #35814
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
        TabOrder = 15
        TabStop = False
        TextStyle = tsRaised
        ThemeAware = False
        OnClick = RzBitBtn1Click
        NumGlyphs = 2
        Spacing = 5
      end
    end
    inherited RzPanel3: TRzPanel
      Top = 421
      Width = 924
      Height = 51
      TabOrder = 2
      object Label8: TLabel
        Left = 28
        Top = 8
        Width = 48
        Height = 12
        Alignment = taRightJustify
        Caption = #23457#26680#26085#26399
      end
      object Label9: TLabel
        Left = 204
        Top = 8
        Width = 48
        Height = 12
        Alignment = taRightJustify
        Caption = #23457#26680#29992#25143
      end
      object Label10: TLabel
        Left = 587
        Top = 32
        Width = 48
        Height = 12
        Alignment = taRightJustify
        Caption = #32047#35745#27424#27454
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 589
        Top = 8
        Width = 48
        Height = 12
        Caption = #26368#26032#24211#23384
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 394
        Top = 8
        Width = 48
        Height = 12
        Alignment = taRightJustify
        Caption = #32467#31639#31246#39069
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label19: TLabel
        Left = 193
        Top = 32
        Width = 60
        Height = 12
        Alignment = taRightJustify
        Caption = #24050#32467#31639#37329#39069
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 382
        Top = 32
        Width = 60
        Height = 12
        Alignment = taRightJustify
        Caption = #26410#32467#31639#37329#39069
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object edtCHK_DATE: TcxTextEdit
        Tag = 1
        Left = 83
        Top = 4
        Width = 99
        Height = 20
        TabOrder = 0
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
      object edtCHK_USER_TEXT: TcxTextEdit
        Tag = 1
        Left = 259
        Top = 4
        Width = 98
        Height = 20
        TabOrder = 1
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
      object fndRECK_MNY: TcxTextEdit
        Tag = 1
        Left = 641
        Top = 28
        Width = 99
        Height = 20
        ParentFont = False
        Style.Font.Charset = GB2312_CHARSET
        Style.Font.Color = clMaroon
        Style.Font.Height = -12
        Style.Font.Name = #23435#20307
        Style.Font.Style = [fsBold]
        TabOrder = 2
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
      object fndMY_AMOUNT: TcxTextEdit
        Tag = 1
        Left = 641
        Top = 4
        Width = 99
        Height = 20
        ParentFont = False
        Style.Font.Charset = GB2312_CHARSET
        Style.Font.Color = clMaroon
        Style.Font.Height = -12
        Style.Font.Name = #23435#20307
        Style.Font.Style = [fsBold]
        TabOrder = 3
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
      object edtTAX_MONEY: TcxTextEdit
        Tag = 1
        Left = 449
        Top = 4
        Width = 98
        Height = 20
        TabStop = False
        ParentFont = False
        Style.Font.Charset = GB2312_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -12
        Style.Font.Name = #23435#20307
        Style.Font.Style = [fsBold]
        TabOrder = 4
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
      object edtRECV_MNY: TcxTextEdit
        Tag = 1
        Left = 259
        Top = 28
        Width = 98
        Height = 20
        ParentFont = False
        Style.Font.Charset = GB2312_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -12
        Style.Font.Name = #23435#20307
        Style.Font.Style = [fsBold]
        TabOrder = 5
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
      object edtRECK_MNY: TcxTextEdit
        Tag = 1
        Left = 449
        Top = 28
        Width = 98
        Height = 20
        ParentFont = False
        Style.Font.Charset = GB2312_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -12
        Style.Font.Name = #23435#20307
        Style.Font.Style = [fsBold]
        TabOrder = 6
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
    end
    inherited DBGridEh1: TDBGridEh
      Top = 175
      Width = 924
      Height = 216
      TabOrder = 3
      Columns = <
        item
          EditButtons = <>
          FieldName = 'SEQNO'
          Footers = <>
          Title.Caption = #24207#21495
          Width = 31
        end
        item
          EditButtons = <>
          FieldName = 'GODS_NAME'
          Footers = <>
          Title.Caption = #21830#21697#21517#31216
          Title.Hint = #25903#25345' "'#36135#21495#12289#21830#21697#21517#31216#12289#25340#38899#30721'" '#26597#35810
          Width = 150
          Control = fndGODS_ID
          OnBeforeShowControl = DBGridEh1Columns1BeforeShowControl
        end
        item
          EditButtons = <>
          FieldName = 'GODS_CODE'
          Footers = <>
          ReadOnly = True
          Title.Caption = #36135#21495
          Width = 72
        end
        item
          EditButtons = <>
          FieldName = 'BARCODE'
          Footers = <>
          ReadOnly = True
          Title.Caption = #26465#30721
          Width = 95
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'UNIT_ID'
          Footers = <>
          Title.Caption = #21333#20301
          Title.Hint = #25353' "'#31354#26684#38190'(SPACE)" '#36827#34892#21333#20301#36716#25442
          Width = 41
        end
        item
          ButtonStyle = cbsEllipsis
          EditButtons = <>
          FieldName = 'AMOUNT'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #35746#36135#37327
          Width = 56
          OnEditButtonClick = DBGridEh1Columns4EditButtonClick
          OnUpdateData = DBGridEh1Columns4UpdateData
        end
        item
          EditButtons = <>
          FieldName = 'FNSH_AMOUNT'
          Footers = <>
          ReadOnly = True
          Title.Caption = #23454#21457#37327
          Width = 58
        end
        item
          EditButtons = <>
          FieldName = 'APRICE'
          Footers = <>
          Title.Caption = #21333#20215
          Width = 63
          OnUpdateData = DBGridEh1Columns5UpdateData
        end
        item
          EditButtons = <>
          FieldName = 'AMONEY'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #37329#39069
          Width = 83
          OnUpdateData = DBGridEh1Columns6UpdateData
        end
        item
          EditButtons = <>
          FieldName = 'BOND_MNY'
          Footer.DisplayFormat = '#0.00'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #20445#35777#37329
          Width = 80
          OnUpdateData = DBGridEh1Columns9UpdateData
        end
        item
          DisplayFormat = '#0%'
          EditButtons = <>
          FieldName = 'AGIO_RATE'
          Footers = <>
          Title.Caption = #25240#25187#29575
          Width = 52
          OnUpdateData = DBGridEh1Columns7UpdateData
        end
        item
          Alignment = taCenter
          Checkboxes = False
          EditButtons = <>
          FieldName = 'IS_PRESENT'
          Footers = <>
          KeyList.Strings = (
            '1'
            '0')
          ReadOnly = True
          Title.Caption = #36192#21697
          Title.Hint = #25353' "'#31354#26684#38190'(SPACE)" '#36827#34892#36192#21697#36716#25442
          Width = 36
        end
        item
          EditButtons = <>
          FieldName = 'REMARK'
          Footers = <>
          Title.Caption = #22791#27880
          Width = 140
        end>
    end
    inherited fndGODS_ID: TzrComboBoxList
      Left = 96
      Top = 203
    end
    inherited pnlBarCode: TRzPanel
      Top = 142
      Width = 924
    end
    inherited stbHint: TRzPanel
      Top = 472
      Width = 924
    end
    inherited rzHelp: TRzPanel
      Top = 496
      Width = 924
      Height = 13
    end
    inherited fndUNIT_ID: TcxComboBox
      Top = 208
    end
    inherited fndBATCH_NO: TzrComboBoxList
      TabOrder = 10
    end
    object pnlFEE: TPanel
      Left = 5
      Top = 391
      Width = 924
      Height = 30
      Align = alBottom
      BevelOuter = bvNone
      Color = clWindowFrame
      TabOrder = 8
      DesignSize = (
        924
        30)
      object Label20: TLabel
        Left = 28
        Top = 9
        Width = 48
        Height = 12
        Alignment = taRightJustify
        Caption = #20445' '#35777' '#37329
        Font.Charset = GB2312_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lblOTH1_MNY: TLabel
        Left = 214
        Top = 9
        Width = 30
        Height = 12
        Alignment = taRightJustify
        Caption = #36153#29992'1'
        Font.Charset = GB2312_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lblOTH2_MNY: TLabel
        Left = 350
        Top = 9
        Width = 30
        Height = 12
        Alignment = taRightJustify
        Caption = #36153#29992'2'
        Font.Charset = GB2312_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lblOTH3_MNY: TLabel
        Left = 486
        Top = 9
        Width = 30
        Height = 12
        Alignment = taRightJustify
        Caption = #36153#29992'3'
        Font.Charset = GB2312_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lblOTH4_MNY: TLabel
        Left = 622
        Top = 9
        Width = 30
        Height = 12
        Alignment = taRightJustify
        Caption = #36153#29992'2'
        Font.Charset = GB2312_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lblOTH5_MNY: TLabel
        Left = 758
        Top = 9
        Width = 30
        Height = 12
        Alignment = taRightJustify
        Caption = #36153#29992'3'
        Font.Charset = GB2312_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lblFeeOption: TLabel
        Left = 200
        Top = 9
        Width = 96
        Height = 12
        Caption = #28857#20987#35774#32622#20854#20182#36153#29992
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = [fsUnderline]
        ParentFont = False
        OnClick = lblFeeOptionClick
      end
      object Label21: TLabel
        Left = 835
        Top = 10
        Width = 66
        Height = 12
        Cursor = crHandPoint
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        Caption = #26597#30475#38468#20214'...'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = [fsUnderline]
        ParentFont = False
        OnClick = Label21Click
      end
      object edtBOND_MNY: TcxTextEdit
        Tag = 1
        Left = 83
        Top = 5
        Width = 99
        Height = 20
        TabStop = False
        ParentFont = False
        Style.Font.Charset = GB2312_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -12
        Style.Font.Name = #23435#20307
        Style.Font.Style = [fsBold]
        TabOrder = 0
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
      object edtOTH1_MNY: TcxTextEdit
        Left = 251
        Top = 5
        Width = 70
        Height = 20
        TabStop = False
        ParentFont = False
        Style.Font.Charset = GB2312_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -12
        Style.Font.Name = #23435#20307
        Style.Font.Style = [fsBold]
        TabOrder = 1
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
      object edtOTH2_MNY: TcxTextEdit
        Left = 387
        Top = 5
        Width = 74
        Height = 20
        TabStop = False
        ParentFont = False
        Style.Font.Charset = GB2312_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -12
        Style.Font.Name = #23435#20307
        Style.Font.Style = [fsBold]
        TabOrder = 2
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
      object edtOTH3_MNY: TcxTextEdit
        Left = 523
        Top = 5
        Width = 78
        Height = 20
        TabStop = False
        ParentFont = False
        Style.Font.Charset = GB2312_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -12
        Style.Font.Name = #23435#20307
        Style.Font.Style = [fsBold]
        TabOrder = 3
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
      object edtOTH4_MNY: TcxTextEdit
        Left = 659
        Top = 5
        Width = 74
        Height = 20
        TabStop = False
        ParentFont = False
        Style.Font.Charset = GB2312_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -12
        Style.Font.Name = #23435#20307
        Style.Font.Style = [fsBold]
        TabOrder = 4
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
      object edtOTH5_MNY: TcxTextEdit
        Left = 795
        Top = 5
        Width = 78
        Height = 20
        TabStop = False
        ParentFont = False
        Style.Font.Charset = GB2312_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -12
        Style.Font.Name = #23435#20307
        Style.Font.Style = [fsBold]
        TabOrder = 5
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
    end
  end
  inherited actList: TActionList
    inherited actBatchNo: TAction
      Visible = False
    end
    inherited actIsPressent: TAction
      Caption = #20999#25442'('#38144#21806'-'#36192#21697'-'#20817#25442')'
    end
    object actCustomer: TAction
      Caption = #36755#20837#20250#21592#21345#21495
      ShortCut = 116
      OnExecute = actCustomerExecute
    end
  end
  inherited PopupMenu1: TPopupMenu
    object N1: TMenuItem [5]
      Action = actCustomer
    end
    object N5: TMenuItem [9]
      Caption = #36755#20837#31036#30418
      ShortCut = 121
      OnClick = N5Click
    end
    object useLvlPrice: TMenuItem [10]
      Caption = #26723#20301#20419#38144
      ShortCut = 120
      OnClick = useLvlPriceClick
    end
    object N7: TMenuItem [11]
      Caption = '-'
    end
    object N8: TMenuItem [12]
      Caption = #29983#25104#25552#36135#21048
      OnClick = N8Click
    end
    object N6: TMenuItem [13]
      Caption = #25171#21360#25552#36135#21048
      OnClick = N6Click
    end
    object N2: TMenuItem
      Caption = #25972#21333#20986#24211
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #21333#31508#20986#24211
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
  end
  inherited edtTable: TZQuery
    FieldDefs = <
      item
        Name = 'SEQNO'
        DataType = ftInteger
      end
      item
        Name = 'GODS_ID'
        DataType = ftString
        Size = 36
      end
      item
        Name = 'BARCODE'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'GODS_CODE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'GODS_NAME'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'UNIT_ID'
        DataType = ftString
        Size = 36
      end
      item
        Name = 'BATCH_NO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'IS_PRESENT'
        DataType = ftInteger
      end
      item
        Name = 'LOCUS_NO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'BOM_ID'
        DataType = ftString
        Size = 36
      end
      item
        Name = 'AMOUNT'
        DataType = ftFloat
      end
      item
        Name = 'APRICE'
        DataType = ftFloat
      end
      item
        Name = 'AMONEY'
        DataType = ftFloat
      end
      item
        Name = 'COST_PRICE'
        DataType = ftFloat
      end
      item
        Name = 'ORG_PRICE'
        DataType = ftFloat
      end
      item
        Name = 'AGIO_RATE'
        DataType = ftFloat
      end
      item
        Name = 'AGIO_MONEY'
        DataType = ftFloat
      end
      item
        Name = 'POLICY_TYPE'
        DataType = ftInteger
      end
      item
        Name = 'BARTER_INTEGRAL'
        DataType = ftInteger
      end
      item
        Name = 'HAS_INTEGRAL'
        DataType = ftInteger
      end
      item
        Name = 'CALC_AMOUNT'
        DataType = ftFloat
      end
      item
        Name = 'CALC_MONEY'
        DataType = ftFloat
      end
      item
        Name = 'REMARK'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'FNSH_AMOUNT'
        DataType = ftFloat
      end
      item
        Name = 'BOND_MNY'
        DataType = ftFloat
      end>
    AfterScroll = edtTableAfterScroll
    AfterPost = edtTableAfterPost
  end
  inherited edtProperty: TZQuery
    FieldDefs = <
      item
        Name = 'SEQNO'
        DataType = ftInteger
      end
      item
        Name = 'GODS_ID'
        DataType = ftString
        Size = 36
      end
      item
        Name = 'GODS_CODE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'GODS_NAME'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'UNIT_ID'
        DataType = ftString
        Size = 36
      end
      item
        Name = 'BATCH_NO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'IS_PRESENT'
        DataType = ftInteger
      end
      item
        Name = 'LOCUS_NO'
        DataType = ftString
        Size = 36
      end
      item
        Name = 'BOM_ID'
        DataType = ftString
        Size = 36
      end
      item
        Name = 'PROPERTY_01'
        DataType = ftString
        Size = 36
      end
      item
        Name = 'PROPERTY_02'
        DataType = ftString
        Size = 36
      end
      item
        Name = 'CALC_AMOUNT'
        DataType = ftFloat
      end
      item
        Name = 'AMOUNT'
        DataType = ftFloat
      end>
  end
  object cdsHeader: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    Params = <>
    Left = 120
    Top = 192
  end
  object cdsDetail: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    Params = <>
    Left = 120
    Top = 224
  end
end
