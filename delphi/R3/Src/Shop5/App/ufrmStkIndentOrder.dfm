inherited frmStkIndentOrder: TfrmStkIndentOrder
  Left = 326
  Top = 172
  Width = 846
  Height = 522
  Caption = #35746#36135#35746#21333
  PixelsPerInch = 96
  TextHeight = 12
  inherited RzPanel1: TRzPanel
    Width = 838
    Height = 495
    inherited RzPanel2: TRzPanel
      Width = 828
      Height = 96
      TabStop = True
      object lblSTOCK_DATE: TLabel [0]
        Left = 563
        Top = 9
        Width = 48
        Height = 12
        Caption = #35746#36135#26085#26399
      end
      object lblCLIENT_ID: TLabel [1]
        Left = 194
        Top = 9
        Width = 48
        Height = 12
        Caption = #20379' '#24212' '#21830
      end
      object Label1: TLabel [2]
        Left = 409
        Top = 30
        Width = 36
        Height = 12
        Caption = #25910#36135#21592
      end
      object Label2: TLabel [3]
        Left = 194
        Top = 72
        Width = 48
        Height = 12
        Caption = #22791'    '#27880
      end
      object Label5: TLabel [4]
        Left = 563
        Top = 51
        Width = 48
        Height = 12
        Caption = #31080#25454#31867#22411
      end
      object Label40: TLabel [5]
        Left = 194
        Top = 30
        Width = 48
        Height = 12
        Caption = #35746#36135#38376#24215
      end
      object Label13: TLabel [6]
        Left = 409
        Top = 51
        Width = 39
        Height = 12
        Caption = #39044#20184#27454
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel [7]
        Left = 563
        Top = 72
        Width = 48
        Height = 12
        Caption = #36827#39033#31246#29575
      end
      object Label11: TLabel [8]
        Left = 680
        Top = 72
        Width = 6
        Height = 12
        Caption = '%'
      end
      object Label3: TLabel [9]
        Left = 194
        Top = 51
        Width = 48
        Height = 12
        Caption = #25152#23646#37096#38376
      end
      object Label12: TLabel [10]
        Left = 564
        Top = 30
        Width = 48
        Height = 12
        Caption = #30003#35831#21333#21495
      end
      inherited RzPanel4: TRzPanel
        Top = 5
        Height = 84
        TabOrder = 9
        inherited Image1: TImage
          Left = 103
          Top = 31
        end
        inherited lblState: TLabel
          Top = 36
        end
        object Label18: TLabel
          Left = 6
          Top = 58
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
      object edtINDE_DATE: TcxDateEdit
        Left = 623
        Top = 5
        Width = 121
        Height = 20
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 6
      end
      object edtREMARK: TcxTextEdit
        Left = 250
        Top = 68
        Width = 287
        Height = 20
        TabOrder = 5
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
      object edtGUIDE_USER: TzrComboBoxList
        Left = 456
        Top = 26
        Width = 81
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
      object edtINVOICE_FLAG: TcxComboBox
        Left = 623
        Top = 47
        Width = 121
        Height = 20
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        Properties.DropDownListStyle = lsFixedList
        Properties.OnChange = edtINVOICE_FLAGPropertiesChange
        TabOrder = 7
      end
      object edtTAX_RATE: TcxSpinEdit
        Left = 623
        Top = 68
        Width = 51
        Height = 20
        Properties.MaxValue = 100.000000000000000000
        Properties.ValueType = vtFloat
        TabOrder = 8
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
      object edtCLIENT_ID: TzrComboBoxList
        Left = 250
        Top = 5
        Width = 264
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
        DropWidth = 290
        DropHeight = 281
        ShowTitle = True
        AutoFitColWidth = False
        OnAddClick = edtCLIENT_IDAddClick
        ShowButton = True
        LocateStyle = lsDark
        Buttons = [zbNew]
        DropListStyle = lsFixed
        OnSaveValue = edtCLIENT_IDSaveValue
        MultiSelect = False
      end
      object edtSHOP_ID: TzrComboBoxList
        Left = 250
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
        FilterFields = 'SEQ_NO;SHOP_NAME;SHOP_SPELL'
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
      object edtADVA_MNY: TcxTextEdit
        Left = 456
        Top = 47
        Width = 81
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
      object edtDEPT_ID: TzrComboBoxList
        Left = 250
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
        TabOrder = 10
        TabStop = False
        TextStyle = tsRaised
        ThemeAware = False
        OnClick = RzBitBtn1Click
        NumGlyphs = 2
        Spacing = 5
      end
      object edtDEMA_GLIDE_NO: TcxButtonEdit
        Left = 623
        Top = 26
        Width = 121
        Height = 20
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = edtDEMA_GLIDE_NOPropertiesButtonClick
        TabOrder = 11
      end
    end
    inherited RzPanel3: TRzPanel
      Top = 385
      Width = 828
      Height = 62
      TabOrder = 2
      object Label8: TLabel
        Left = 28
        Top = 15
        Width = 48
        Height = 12
        Alignment = taRightJustify
        Caption = #23457#26680#26085#26399
      end
      object Label9: TLabel
        Left = 204
        Top = 15
        Width = 48
        Height = 12
        Alignment = taRightJustify
        Caption = #23457#26680#29992#25143
      end
      object Label10: TLabel
        Left = 587
        Top = 39
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
      object Label6: TLabel
        Left = 587
        Top = 15
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
      object Label19: TLabel
        Left = 193
        Top = 39
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
        Top = 39
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
      object Label4: TLabel
        Left = 392
        Top = 15
        Width = 48
        Height = 12
        Alignment = taRightJustify
        Caption = #36827#39033#31246#39069
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
        Top = 11
        Width = 99
        Height = 20
        TabOrder = 0
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
      object edtCHK_USER_TEXT: TcxTextEdit
        Tag = 1
        Left = 259
        Top = 11
        Width = 98
        Height = 20
        TabOrder = 1
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
      object fndRECK_MNY: TcxTextEdit
        Tag = 1
        Left = 641
        Top = 34
        Width = 98
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
        Top = 11
        Width = 98
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
      object edtRECV_MNY: TcxTextEdit
        Tag = 1
        Left = 259
        Top = 35
        Width = 98
        Height = 20
        ParentFont = False
        Style.Font.Charset = GB2312_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -12
        Style.Font.Name = #23435#20307
        Style.Font.Style = [fsBold]
        TabOrder = 4
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
      object edtRECK_MNY: TcxTextEdit
        Tag = 1
        Left = 449
        Top = 35
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
      object edtTAX_MONEY: TcxTextEdit
        Tag = 1
        Left = 449
        Top = 11
        Width = 98
        Height = 20
        TabStop = False
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
      Top = 135
      Width = 828
      Height = 220
      TabOrder = 3
      OnCellClick = DBGridEh1CellClick
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
          Width = 153
          Control = fndGODS_ID
          OnBeforeShowControl = DBGridEh1Columns1BeforeShowControl
        end
        item
          EditButtons = <>
          FieldName = 'GODS_CODE'
          Footers = <>
          Title.Caption = #36135#21495
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'BARCODE'
          Footers = <>
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
          Width = 53
          OnEditButtonClick = DBGridEh1Columns4EditButtonClick
          OnUpdateData = DBGridEh1Columns4UpdateData
        end
        item
          EditButtons = <>
          FieldName = 'FNSH_AMOUNT'
          Footers = <>
          ReadOnly = True
          Title.Caption = #23454#20837#37327
          Width = 54
        end
        item
          EditButtons = <>
          FieldName = 'APRICE'
          Footers = <>
          Title.Caption = #35746#36135#20215
          Width = 56
          OnUpdateData = DBGridEh1Columns5UpdateData
        end
        item
          EditButtons = <>
          FieldName = 'AMONEY'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #37329#39069
          Width = 72
          OnUpdateData = DBGridEh1Columns6UpdateData
        end
        item
          EditButtons = <>
          FieldName = 'BOND_MNY'
          Footer.DisplayFormat = '#0.00'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #20445#35777#37329
          Width = 70
          OnUpdateData = DBGridEh1Columns9UpdateData
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'IS_PRESENT'
          Footers = <>
          KeyList.Strings = (
            '1'
            '0')
          PickList.Strings = (
            #26159
            #21542)
          ReadOnly = True
          Title.Caption = #36192#21697
          Title.Hint = #25353' "'#31354#26684#38190'(SPACE)" '#36827#34892#36192#21697#36716#25442
          Width = 39
          OnUpdateData = DBGridEh1Columns7UpdateData
        end
        item
          EditButtons = <>
          FieldName = 'ORG_PRICE'
          Footers = <>
          ReadOnly = True
          Title.Caption = #38646#21806#20215
          Width = 48
        end
        item
          EditButtons = <>
          FieldName = 'RTL_MONEY'
          Footer.ValueType = fvtSum
          Footers = <>
          ReadOnly = True
          Title.Caption = #38144#21806#39069
          Width = 68
        end
        item
          DisplayFormat = '#0%'
          EditButtons = <>
          FieldName = 'AGIO_RATE'
          Footers = <>
          ReadOnly = True
          Title.Caption = #25240#25187#29575
          Width = 45
        end
        item
          EditButtons = <>
          FieldName = 'AGIO_MONEY'
          Footer.ValueType = fvtSum
          Footers = <>
          ReadOnly = True
          Title.Caption = #35753#21033#37329#39069
          Width = 65
        end
        item
          EditButtons = <>
          FieldName = 'REMARK'
          Footers = <>
          Title.Caption = #22791#27880
          Width = 157
        end>
    end
    inherited fndGODS_ID: TzrComboBoxList
      Left = 536
      Top = 179
    end
    inherited pnlBarCode: TRzPanel
      Top = 101
      Width = 828
      Height = 34
    end
    inherited stbHint: TRzPanel
      Top = 447
      Width = 828
    end
    inherited rzHelp: TRzPanel
      Top = 471
      Width = 828
      Height = 19
    end
    inherited fndUNIT_ID: TcxComboBox
      Top = 176
    end
    object pnlFEE: TPanel
      Left = 5
      Top = 355
      Width = 828
      Height = 30
      Align = alBottom
      BevelOuter = bvNone
      Color = clWindowFrame
      TabOrder = 8
      DesignSize = (
        828
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
    end
  end
  inherited mmMenu: TMainMenu
    Left = 192
    Top = 192
  end
  inherited actList: TActionList
    Left = 248
    Top = 184
    inherited actLocusNo: TAction
      Visible = False
    end
    inherited actBatchNo: TAction
      Visible = False
    end
    object actPrintBarcode: TAction
      Caption = #25171#21360#26465#30721
      OnExecute = actPrintBarcodeExecute
    end
  end
  inherited PopupMenu1: TPopupMenu
    object N1: TMenuItem [2]
      Action = actPrintBarcode
    end
    object N2: TMenuItem [10]
      Caption = '-'
    end
    object N3: TMenuItem [11]
      Caption = #25972#21333#20837#24211
      OnClick = N3Click
    end
    object N4: TMenuItem [12]
      Caption = #21333#31508#20837#24211
      OnClick = N4Click
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
        Name = 'RTL_MONEY'
        DataType = ftFloat
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
        Name = 'AMOUNT'
        DataType = ftFloat
      end
      item
        Name = 'CALC_AMOUNT'
        DataType = ftFloat
      end>
    Left = 216
    Top = 264
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
  object DBSumList1: TDBSumList
    DataSet = edtTable
    ExternalRecalc = False
    SumCollection = <
      item
        FieldName = 'BOND_MNY'
        GroupOperation = goSum
      end>
    VirtualRecords = True
    Left = 360
    Top = 216
  end
end
