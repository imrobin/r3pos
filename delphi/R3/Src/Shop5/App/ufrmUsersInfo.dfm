inherited frmUsersInfo: TfrmUsersInfo
  Left = 414
  Top = 170
  Caption = #29992#25143#26723#26696
  ClientHeight = 442
  ClientWidth = 529
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  inherited bgPanel: TRzPanel
    Width = 529
    Height = 442
    BorderColor = clWhite
    Color = clWhite
    object RzLabel1: TRzLabel [0]
      Left = 235
      Top = 10
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
    object lab_ACCOUNT: TRzLabel [1]
      Left = 7
      Top = 11
      Width = 100
      Height = 12
      Alignment = taRightJustify
      AutoSize = False
      Caption = #29992#25143#36134#21495
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object lab_USER_NAME: TRzLabel [2]
      Left = 7
      Top = 36
      Width = 100
      Height = 12
      Alignment = taRightJustify
      AutoSize = False
      Caption = #29992#25143#22995#21517
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object lab_USER_SPELL: TRzLabel [3]
      Left = 240
      Top = 36
      Width = 100
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
    object lab_SHOP_ID: TRzLabel [4]
      Left = 240
      Top = 91
      Width = 100
      Height = 12
      Alignment = taRightJustify
      AutoSize = False
      Caption = #25152#23646#38376#24215
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object lab_DUTY_IDS: TRzLabel [5]
      Left = 7
      Top = 91
      Width = 100
      Height = 12
      Alignment = taRightJustify
      AutoSize = False
      Caption = #32844#21153
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object RzLabel4: TRzLabel [6]
      Left = 235
      Top = 90
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
      Visible = False
    end
    object RzLabel13: TRzLabel [7]
      Left = 7
      Top = 64
      Width = 100
      Height = 12
      Alignment = taRightJustify
      AutoSize = False
      Caption = #24615#21035
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object RzLabel2: TRzLabel [8]
      Left = 235
      Top = 35
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
    object RzLabel3: TRzLabel [9]
      Left = 469
      Top = 89
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
    object RzLabel5: TRzLabel [10]
      Left = 247
      Top = 11
      Width = 100
      Height = 12
      AutoSize = False
      Caption = #20363#65306'zhangsan'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object RzLabel6: TRzLabel [11]
      Left = 240
      Top = 64
      Width = 100
      Height = 12
      Alignment = taRightJustify
      AutoSize = False
      Caption = #37096#38376
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object RzLabel9: TRzLabel [12]
      Left = 469
      Top = 63
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
    inherited RzPage: TRzPageControl
      Top = 120
      Width = 519
      Height = 285
      Align = alBottom
      BackgroundColor = clWhite
      ParentBackgroundColor = False
      TabOrder = 7
      FixedDimension = 20
      inherited TabSheet1: TRzTabSheet
        Color = clWhite
        inherited RzPanel2: TRzPanel
          Width = 515
          Height = 258
          BorderColor = clWhite
          Color = clWhite
          object lab_WORK_DATE: TRzLabel
            Left = 1
            Top = 41
            Width = 100
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            Caption = #20837#32844#26085#26399
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object lab_REMARK: TRzLabel
            Left = 1
            Top = 192
            Width = 100
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            Caption = #22791#27880
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object lab_POSTALCODE: TRzLabel
            Left = 49
            Top = 140
            Width = 52
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            Caption = #37038#25919#32534#30721
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object lab_OFFI_TELE: TRzLabel
            Left = 1
            Top = 66
            Width = 100
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            Caption = #21150#20844#30005#35805
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object lab_MOBILE: TRzLabel
            Left = 1
            Top = 91
            Width = 100
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            Caption = #31227#21160#30005#35805
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object lab_FAMI_TELE: TRzLabel
            Left = 234
            Top = 66
            Width = 100
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            Caption = #23478#24237#30005#35805
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object lab_FAMI_ADDR: TRzLabel
            Left = 1
            Top = 166
            Width = 100
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            Caption = #32852#31995#22320#22336
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object lab_EMAIL: TRzLabel
            Left = 1
            Top = 116
            Width = 100
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            Caption = #30005#23376#37038#31665
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object lab_DIMI_DATE: TRzLabel
            Left = 234
            Top = 41
            Width = 100
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            Caption = #31163#32844#26085#26399
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object labIDN_TYPE: TRzLabel
            Left = 1
            Top = 16
            Width = 100
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            Caption = #35777#20214#31867#22411
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object LabID_NUMBER: TRzLabel
            Left = 234
            Top = 16
            Width = 100
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            Caption = #35777#20214#21495#30721
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object RzLabel8: TRzLabel
            Left = 234
            Top = 91
            Width = 100
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'QQ'#21495#30721
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object Lab_MSN: TRzLabel
            Left = 234
            Top = 116
            Width = 100
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'MSN'
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object lab_MM: TRzLabel
            Left = 283
            Top = 140
            Width = 52
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'MM'
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object edtREMARK: TcxMemo
            Left = 106
            Top = 187
            Width = 355
            Height = 68
            TabOrder = 13
          end
          object edtPOSTALCODE: TcxTextEdit
            Left = 106
            Top = 136
            Width = 121
            Height = 20
            TabOrder = 10
          end
          object edtOFFI_TELE: TcxTextEdit
            Left = 106
            Top = 61
            Width = 121
            Height = 20
            TabOrder = 4
          end
          object edtMOBILE: TcxTextEdit
            Left = 106
            Top = 86
            Width = 121
            Height = 20
            TabOrder = 6
          end
          object edtFAMI_TELE: TcxTextEdit
            Left = 340
            Top = 61
            Width = 121
            Height = 20
            TabOrder = 5
          end
          object edtFAMI_ADDR: TcxTextEdit
            Left = 106
            Top = 162
            Width = 237
            Height = 20
            TabOrder = 12
          end
          object edtEMAIL: TcxTextEdit
            Left = 106
            Top = 111
            Width = 121
            Height = 20
            TabOrder = 8
          end
          object edtWORK_DATE: TcxDateEdit
            Left = 106
            Top = 36
            Width = 121
            Height = 20
            TabOrder = 2
          end
          object edtDIMI_DATE: TcxDateEdit
            Left = 340
            Top = 36
            Width = 121
            Height = 20
            TabOrder = 3
          end
          object edtID_NUMBER: TcxTextEdit
            Left = 340
            Top = 11
            Width = 121
            Height = 20
            Properties.OnChange = edt_USER_NAMEPropertiesChange
            TabOrder = 1
          end
          object edtQQ: TcxTextEdit
            Left = 340
            Top = 86
            Width = 121
            Height = 20
            Properties.OnChange = edt_USER_NAMEPropertiesChange
            TabOrder = 7
          end
          object edtMSN: TcxTextEdit
            Left = 340
            Top = 111
            Width = 121
            Height = 20
            Properties.OnChange = edt_USER_NAMEPropertiesChange
            TabOrder = 9
          end
          object edtIDN_TYPE: TcxComboBox
            Left = 106
            Top = 11
            Width = 121
            Height = 20
            TabOrder = 0
          end
          object edtMM: TcxTextEdit
            Left = 340
            Top = 136
            Width = 121
            Height = 20
            TabOrder = 11
          end
        end
      end
    end
    inherited btPanel: TRzPanel
      Top = 405
      Width = 519
      Height = 32
      BorderColor = clWhite
      Color = clWhite
      TabOrder = 8
      object Btn_Save: TRzBitBtn
        Left = 330
        Top = 5
        Width = 67
        Height = 26
        Anchors = [akTop, akRight]
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
        OnClick = Btn_SaveClick
        NumGlyphs = 2
        Spacing = 5
      end
      object Btn_Close: TRzBitBtn
        Left = 437
        Top = 5
        Width = 67
        Height = 26
        Anchors = [akTop, akRight]
        Caption = #20851#38381'(&C)'
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
        OnClick = Btn_CloseClick
        NumGlyphs = 2
        Spacing = 5
      end
    end
    object edtACCOUNT: TcxTextEdit
      Left = 113
      Top = 6
      Width = 121
      Height = 20
      TabOrder = 1
    end
    object edtUSER_NAME: TcxTextEdit
      Left = 113
      Top = 31
      Width = 121
      Height = 20
      Properties.OnChange = edt_USER_NAMEPropertiesChange
      TabOrder = 2
    end
    object edtUSER_SPELL: TcxTextEdit
      Left = 346
      Top = 31
      Width = 121
      Height = 20
      Enabled = False
      TabOrder = 0
    end
    object edtSHOP_ID: TzrComboBoxList
      Left = 346
      Top = 86
      Width = 121
      Height = 20
      Properties.AutoSelect = False
      Properties.Buttons = <
        item
          Default = True
        end>
      Properties.ReadOnly = True
      TabOrder = 6
      InGrid = False
      KeyValue = Null
      FilterFields = 'SHOP_NAME;SHOP_ID;SHOP_SPELL'
      KeyField = 'SHOP_ID'
      ListField = 'SHOP_NAME'
      Columns = <
        item
          AutoDropDown = True
          EditButtons = <>
          FieldName = 'SHOP_NAME'
          Footers = <>
          Title.Caption = #38376#24215#21517#31216
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'SEQ_NO'
          Footers = <>
          Title.Caption = #24207#21495
          Width = 30
        end>
      DropWidth = 176
      DropHeight = 130
      ShowTitle = True
      AutoFitColWidth = True
      ShowButton = True
      LocateStyle = lsDark
      Buttons = []
      DropListStyle = lsFixed
    end
    object edtDUTY_IDS: TzrComboBoxList
      Left = 113
      Top = 86
      Width = 121
      Height = 20
      Properties.AutoSelect = False
      Properties.Buttons = <
        item
          Default = True
        end>
      Properties.ReadOnly = True
      TabOrder = 5
      InGrid = False
      KeyValue = Null
      FilterFields = 'DUTY_NAME;DUTY_ID;DUTY_SPELL'
      KeyField = 'DUTY_ID'
      ListField = 'DUTY_NAME'
      Columns = <
        item
          EditButtons = <>
          FieldName = 'DUTY_NAME'
          Footers = <>
          Title.Caption = #32844#21153#21517#31216
          Width = 90
        end>
      DropWidth = 176
      DropHeight = 130
      ShowTitle = True
      AutoFitColWidth = True
      OnAddClick = edtDUTY_IDSAddClick
      ShowButton = True
      LocateStyle = lsDark
      Buttons = [zbNew]
      DropListStyle = lsFixed
    end
    object edtSEX: TRadioGroup
      Left = 114
      Top = 50
      Width = 150
      Height = 33
      Columns = 3
      Items.Strings = (
        #22899
        #30007
        #20445#23494)
      TabOrder = 3
    end
    object edtDEPT_ID: TzrComboBoxList
      Left = 346
      Top = 58
      Width = 121
      Height = 20
      Properties.AutoSelect = False
      Properties.Buttons = <
        item
          Default = True
        end>
      Properties.ReadOnly = True
      TabOrder = 4
      InGrid = False
      KeyValue = Null
      FilterFields = 'DEPT_ID;DEPT_NAME;DEPT_SPELL'
      KeyField = 'DEPT_ID'
      ListField = 'DEPT_NAME'
      Columns = <
        item
          EditButtons = <>
          FieldName = 'SEQ_NO'
          Footers = <>
          Title.Caption = #24207#21495
          Visible = False
          Width = 30
        end
        item
          AutoDropDown = True
          EditButtons = <>
          FieldName = 'DEPT_NAME'
          Footers = <>
          Title.Caption = #37096#38376#21517#31216
          Width = 90
        end
        item
          EditButtons = <>
          FieldName = 'DEPT_SEPLL'
          Footers = <>
          Title.Caption = #25340#38899#30721
          Visible = False
        end>
      DropWidth = 176
      DropHeight = 130
      ShowTitle = True
      AutoFitColWidth = True
      ShowButton = True
      LocateStyle = lsDark
      Buttons = []
      DropListStyle = lsFixed
    end
  end
  inherited mmMenu: TMainMenu
    Left = 488
    Top = 208
  end
  inherited actList: TActionList
    Left = 488
    Top = 240
  end
  object ADODataSet1: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    Params = <>
    Left = 488
    Top = 280
  end
  object cdsTable: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    Params = <>
    Left = 486
    Top = 168
  end
end
