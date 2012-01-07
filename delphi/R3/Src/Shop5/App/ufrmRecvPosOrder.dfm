inherited frmRecvPosOrder: TfrmRecvPosOrder
  Left = 361
  Top = 212
  Caption = #32564#27454#21333
  ClientHeight = 445
  ClientWidth = 656
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 12
  inherited bgPanel: TRzPanel
    Width = 656
    Height = 445
    BorderColor = clWhite
    inherited RzPage: TRzPageControl
      Top = 162
      Width = 646
      Height = 235
      BackgroundColor = clWhite
      Color = clWhite
      ParentBackgroundColor = False
      ParentColor = False
      FixedDimension = 20
      inherited TabSheet1: TRzTabSheet
        Color = clWhite
        Caption = #32564#27454#26126#32454
        inherited RzPanel2: TRzPanel
          Width = 642
          Height = 208
          BorderColor = clWhite
          Color = clWhite
          object DBGridEh1: TDBGridEh
            Left = 5
            Top = 5
            Width = 632
            Height = 198
            Align = alClient
            AllowedOperations = [alopUpdateEh]
            DataSource = DataSource1
            Flat = True
            FooterColor = clWindow
            FooterFont.Charset = GB2312_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -12
            FooterFont.Name = #23435#20307
            FooterFont.Style = []
            FooterRowCount = 1
            FrozenCols = 2
            ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
            OnDrawColumnCell = DBGridEh1DrawColumnCell
            Columns = <
              item
                Color = clBtnFace
                EditButtons = <>
                FieldName = 'SEQNO'
                Footers = <>
                ReadOnly = True
                Title.Caption = #24207#21495
                Width = 24
              end
              item
                Checkboxes = True
                EditButtons = <>
                FieldName = 'A'
                Footers = <>
                KeyList.Strings = (
                  '1'
                  '0')
                Title.Caption = #32564#27454
                Width = 23
                OnUpdateData = DBGridEh1Columns1UpdateData
              end
              item
                DisplayFormat = '0000-00-00'
                EditButtons = <>
                FieldName = 'ABLE_DATE'
                Footer.Value = #21512'   '#35745#65306
                Footer.ValueType = fvtStaticText
                Footers = <>
                ReadOnly = True
                Title.Caption = #32467#36134#26085#26399
                Width = 63
              end
              item
                EditButtons = <>
                FieldName = 'RECV_TYPE'
                Footers = <>
                ReadOnly = True
                Title.Caption = #31867#22411
                Width = 41
              end
              item
                EditButtons = <>
                FieldName = 'ACCT_INFO'
                Footers = <>
                ReadOnly = True
                Title.Caption = #25688#35201
                Width = 176
              end
              item
                DisplayFormat = '#0.00'
                EditButtons = <>
                FieldName = 'ACCT_MNY'
                Footer.ValueType = fvtSum
                Footers = <>
                ReadOnly = True
                Title.Caption = #32467#36134#24635#39069
              end
              item
                Alignment = taRightJustify
                DisplayFormat = '#0.00'
                EditButtons = <>
                FieldName = 'RECK_MNY'
                Footer.Alignment = taRightJustify
                Footer.ValueType = fvtSum
                Footers = <>
                ReadOnly = True
                Tag = 1
                Title.Caption = #26410#32564#37329#39069
                Width = 65
              end
              item
                Alignment = taRightJustify
                DisplayFormat = '#0.00'
                EditButtons = <>
                FieldName = 'RECV_MNY'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26412#27425#32564#27454
                Width = 63
                OnUpdateData = DBGridEh1Columns3UpdateData
              end
              item
                DisplayFormat = '#0.00'
                EditButtons = <>
                FieldName = 'BALA_MNY'
                Footer.ValueType = fvtSum
                Footers = <>
                ReadOnly = True
                Tag = 1
                Title.Caption = #32467#20313#24212#25910
              end
              item
                EditButtons = <>
                FieldName = 'SHOP_ID_TEXT'
                Footers = <>
                Title.Caption = #38144#21806#38376#24215
                Width = 113
              end>
          end
        end
      end
    end
    inherited btPanel: TRzPanel
      Top = 397
      Width = 646
      Height = 43
      BorderColor = clWhite
      Color = clWhite
      object btnOk: TRzBitBtn
        Left = 435
        Top = 11
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
        OnClick = btnOkClick
        NumGlyphs = 2
        Spacing = 5
      end
      object btnClose: TRzBitBtn
        Left = 528
        Top = 11
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
        OnClick = btnCloseClick
        NumGlyphs = 2
        Spacing = 5
      end
    end
    object Panel1: TPanel
      Left = 5
      Top = 5
      Width = 646
      Height = 157
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 2
      object Label1: TLabel
        Left = 182
        Top = 62
        Width = 48
        Height = 12
        Alignment = taRightJustify
        Caption = #32564#27454#24080#25143
      end
      object Label2: TLabel
        Left = 182
        Top = 84
        Width = 48
        Height = 12
        Alignment = taRightJustify
        Caption = #25910#25903#31185#30446
      end
      object Label6: TLabel
        Left = 446
        Top = 17
        Width = 48
        Height = 12
        Alignment = taRightJustify
        Caption = #32564#27454#26085#26399
      end
      object Label7: TLabel
        Left = 206
        Top = 129
        Width = 24
        Height = 12
        Alignment = taRightJustify
        Caption = #35828#26126
      end
      object Label3: TLabel
        Left = 182
        Top = 40
        Width = 48
        Height = 12
        Alignment = taRightJustify
        Caption = #32564#27454#26041#24335
      end
      object Label40: TLabel
        Left = 182
        Top = 16
        Width = 48
        Height = 12
        Caption = #32564#27454#38376#24215
      end
      object Label4: TLabel
        Left = 183
        Top = 107
        Width = 48
        Height = 12
        Alignment = taRightJustify
        Caption = #31080#25454#32534#21495
      end
      object Label5: TLabel
        Left = 446
        Top = 38
        Width = 48
        Height = 12
        Caption = #25152#23646#37096#38376
      end
      object Label9: TLabel
        Left = 447
        Top = 61
        Width = 48
        Height = 12
        Alignment = taRightJustify
        Caption = #31080#25454#32534#21495
      end
      object edtACCOUNT_ID: TzrComboBoxList
        Left = 236
        Top = 58
        Width = 120
        Height = 20
        Properties.AutoSelect = False
        Properties.Buttons = <
          item
            Default = True
          end>
        Properties.ReadOnly = True
        Properties.OnChange = edtACCOUNT_IDPropertiesChange
        TabOrder = 2
        InGrid = False
        KeyValue = Null
        FilterFields = 'ACCOUNT_ID;ACCT_NAME;ACCT_SPELL'
        KeyField = 'ACCOUNT_ID'
        ListField = 'ACCT_NAME'
        Columns = <
          item
            EditButtons = <>
            FieldName = 'ACCT_NAME'
            Footers = <>
            Title.Caption = #24080#25143#21517#31216
            Width = 60
          end>
        DropWidth = 157
        DropHeight = 180
        ShowTitle = True
        AutoFitColWidth = True
        OnAddClick = edtACCOUNT_IDAddClick
        ShowButton = True
        LocateStyle = lsDark
        Buttons = [zbNew]
        DropListStyle = lsFixed
        MultiSelect = False
      end
      object edtITEM_ID: TzrComboBoxList
        Left = 236
        Top = 80
        Width = 120
        Height = 20
        Properties.AutoSelect = False
        Properties.Buttons = <
          item
            Default = True
          end>
        Properties.ReadOnly = True
        Properties.OnChange = edtITEM_IDPropertiesChange
        TabOrder = 3
        InGrid = False
        KeyValue = Null
        FilterFields = 'CODE_NAME;CODE_SPELL'
        KeyField = 'CODE_ID'
        ListField = 'CODE_NAME'
        Columns = <
          item
            EditButtons = <>
            FieldName = 'CODE_NAME'
            Footers = <>
            Title.Caption = #24080#25143#21517#31216
            Width = 60
          end>
        DropWidth = 180
        DropHeight = 180
        ShowTitle = True
        AutoFitColWidth = True
        OnAddClick = edtITEM_IDAddClick
        ShowButton = True
        LocateStyle = lsDark
        Buttons = [zbNew]
        DropListStyle = lsFixed
        MultiSelect = False
      end
      object edtRECV_DATE: TcxDateEdit
        Left = 500
        Top = 13
        Width = 131
        Height = 20
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        Properties.OnChange = edtRECV_DATEPropertiesChange
        TabOrder = 6
      end
      object edtREMARK: TcxTextEdit
        Left = 236
        Top = 124
        Width = 301
        Height = 20
        Properties.OnChange = edtREMARKPropertiesChange
        TabOrder = 5
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
      object RzPanel4: TRzPanel
        Left = 8
        Top = 14
        Width = 153
        Height = 91
        BorderOuter = fsFlat
        BorderColor = clActiveCaption
        BorderShadow = clActiveCaption
        Color = clWhite
        FlatColor = clBlue
        TabOrder = 7
        object Shape1: TShape
          Left = 1
          Top = 33
          Width = 152
          Height = 1
          Pen.Color = clBlue
        end
        object lblCaption: TLabel
          Left = 11
          Top = 9
          Width = 85
          Height = 12
          Caption = #21333#21495':'#33258#21160#32534#21495
          Color = clWhite
          Font.Charset = GB2312_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Image1: TImage
          Left = 95
          Top = 39
          Width = 51
          Height = 43
          AutoSize = True
          Picture.Data = {
            07544269746D61706A1A0000424D6A1A00000000000036000000280000003300
            00002B0000000100180000000000341A0000C30E0000C30E0000000000000000
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FE0000FE0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000000000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FE0000DA4C52DC1820FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000000000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000FA0000E62E31EBC4C1FFFFFFF4BDBDF50000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000000000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000E71417E1
            8A8BFFFFFFB6BBFF635BFDFFFFFFEA3C41FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000000000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000F90000D85459FFFFF4EFFBFF4C41
            FB5A50F94436F8B2B3FFF0DAD5F10000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000000000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000F10000E5575AF2E8DFF9FFFF7770FF3426F8BBB7FCFFFFFF
            FFFFFF2A1AF7F5FFFFDD686DFF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00E41216EAB1AEFFFFFF9D9CFF2B1CF79891FBF8F7FEFFFFFFFFFFFFFFFFFF87
            7EFA847EFFFDF6EFE2070DFF0000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FB0000F01315DB8387FFFFFF
            C4CAFF392BF96C61FAFAFAFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF9FE3324
            F8EFFCFFF59E9CFA0000FF0000FF0000FF0000FF0000FF0000FF0000FF000000
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000EA0000E77679FEF3E4EDFCFF574CFB5347F9C6
            C2FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3ADFC554AFC
            FFFFFFEC1B1EFF0000FF0000FF0000FF0000FF0000FF0000FF0000000000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000FA0000E83133F0DDD9FBFFFF7E7BFF2B1BF7C1BCFCFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4B3DF8B8BBFFEC
            CCC9F10000FF0000FF0000FF0000FF0000FF0000FF0000000000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000F70000E72B2EE5
            A9A8FFFFFF9F9EFF3A2CF98981FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDCFD4639F9FDFFFFE056
            5BFF0000FF0000FF0000FF0000FF0000FF0000000000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000E70000E38A8BFFFFF6E2EDFF3324
            F8685EFADDDBFEFFFFFFFFFFFFFFFFFFF0EFFED9D5FCFFFFFFD1CFFDF1F0FEFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF675BFAA4A4FFF5DCD3EC0307
            FF0000FF0000FF0000FF0000FF0000000000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000EF0000EC5B5BF8FFFDE7F4FF574EFC3324F8E6E5FEFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9D7FD0000F5DBDAFDFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFF2313F7FFFFFFEE7A7BFF0000FF
            0000FF0000FF0000FF0000000000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000F600
            00DF3A3EF4CEC8FFFFFF7B74FF3A2BF7B0ABFCFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFCBC8FC1100F7FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA19BFC6A60FCFFFFFFE80000FF0000FF00
            00FF0000FF0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FC0000E71D1FE8B1AFFFFFFF
            B3B5FF2D1FF88E85FBFCFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBB6FC3426
            F81706F62E21F85043F84437F8493DF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF4537F9CBD2FFE9B6B6F30000FF0000FF0000
            FF0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000E40003F18483FFFFFDD3DBFF483CFA5F53F9E8
            E7FEFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFB0ABFCF2F1FED7D4FDA29CFCE3E1FD
            DCDAFDB3ADFC7F76FA4537F93C2DF9938BFBFFFFFEFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFBDB8FD5045FBFFFFFFE84247FF0000FF0000FF000000
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000F10000DE5354FEF8F0FCFFFF5E55FD3728F8DCD9FEFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF5447F97B72FAFFFFFFF7F5FE6155F96458F99E
            97FBD9D8FDFFFFFFB3AEFC7369FAFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF4A3CF8C2C6FFE9C7C5F80000FF0000FF0000000000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000F60000E3393DEF
            CBC6FCFFFF8883FF3021F9A9A3FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFEEEDFE1C0BF7E7E5FDE6E5FE877DFA8B82FA7D74FB3F31
            F82313F7776DFADDDBFDF9F8FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFAFAFF2616F7FFFFFFE75254FF0000FF0000000000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000DA0207F5AEAAFFFFFBC2C7FF2919
            F8827AFAEEEDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF837AFA5246F8FFFFFFF4F4FEFFFFFFFFFFFE6D62FA3D2FF8
            7D73FA0D00F7DAD5FDFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF8178FA8D88FFFBF6ECE70000FF0000000000FF0000FF0000FF0000FF
            0000FF0000FF0000E90D0FDE7E7FFFFFFFD5DCFF4035FC483BF8FFFFFEFFFFFF
            FFFFFFFFFFFFFFFFFEF9F9FEFFFFFFFFFFFFFFFFFFF1F0FEFFFFFFFFFFFFF9F8
            FEB1ABFCECEAFE3D2FF89790FB1E0FF7C1BCFD1606F74E41F8D9D6FDFFFFFFFF
            FFFEE2E1FE564AF95648F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF3C31F8E1EFFFF0A7A7FB0000000000FF0000FF0000FF0000FF0000F300
            00E05659FADCD1F7FFFF6156FB4235F8BFBBFCFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFC8C3FC5E54F9FFFFFEFFFFFFFBFBFF483AF8EDECFEFFFFFFFBFAFE6C61FA
            291AF8473AF82515F74235F9F5F5FED9D6FD9A93FC3628F7A099FB958DFB4033
            F88A82FAF6F4FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F77FD40
            48FFE0EDFFE65A5AF90000000000FF0000FF0000F90000D82B31FDDED5FAFFFF
            A09FFF2A1BF8AEA8FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF1707F6BDB9FDE0DDFE483BF81908F7675CF9FFFFFFFFFFFFFFFFFFE6E4FD5E
            51F90000F6A39CFBFFFFFFFDFDFEFFFFFFB6B0FC281AF76155F9DAD7FDFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0BCFE312CFF8F8EFFE59DA0E61D
            1EFE0000FF0000000000FB0000DE242CE69697FFFFFFB8B9FF3A2CFA6A60F9FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C95FB
            1100F74234F8C0BCFCFFFFFE0000F6C8C3FDFFFFFFFFFFFFFFFFFFFFFFFFA099
            FC1201F74F42F99088FB8077FA3A2BF8F0EFFE867DFA3F30F8FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFCECCFD544BFF5C5EFFE1ACC0F03324FE0000FF0000FF0000
            FF0000000000F70000EAA7A9FFFFFF5F5CFB544CF8E3E0FEFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDB8FDECECFDA49CFC2A1BF71908F6A4
            9DFBD8D5FD3122F83F32F84639F8FFFFFFFFFFFFFFFFFFE8E7FE5F53F90000F5
            5A4EF9FEFEFFE7E6FEF9F8FEFFFFFFE3E1FDDAD8FDFFFFFFFFFFFFFFFFFFFFFF
            FE625BFF4344FFC1CDFFE65248F90A03FF0000FF0000FF0000FF0000FF000000
            0000FF0000DB131AFBFFFF5C53FCBBB6FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF6F64FA0000F65F53F9FFFFFFB7B2FD0200F64032
            F8EDECFEE6E3FE1100F7B6B1FCE5E3FEFFFFFFDFDCFE9B94FBF8F8FF2819F8CF
            CBFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFE9189FD302FFFA18FE7
            FF8F76ED0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000000000FF00
            00FE0000DE9294E3F0FF2B1CF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF2F1FF2B1CF8CAC7FD7066FA4235F95E53F97A6FFAA8A2FB
            2C1CF8948DFBE4E2FD4538F8BDBAFDFFFFFFFFFFFFFFFFFF857DFA5448F9FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFBAB7FE3931FF8693FFDE94A3F5291CFF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000000000FF0000FF0000
            EA0F11F8ECE38E8BFF7369F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFA59FFB0000F5A59EFBFFFFFFB6B0FC0000F5584CF8FCFCFEFF
            FFFFF9F8FE5549F93021F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFDFDDFE534DFF534EFFE9D8E7E52219FD0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000000000FF0000FF0000FF0000E2
            5D60FFFFFF3325F9D7D5FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFEFEFE3223F79992FB574BF85548F97167FA5044F9FFFFFF9B94FB3B2D
            F7766CFAEFEDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFF675EFD4C
            51FFAB95DCFF6A54F00000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000000000FF0000FF0000FF0000F20000FDDD
            D5ADADFF6257F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFCBC7FD1706F7B1ABFCFFFFFFFFFFFFB0ABFC4A3CF95044F9E6E4FEFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA19CFE2824FFAEAEFEE37F7FF918
            0DFF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000000000FF0000FF0000FF0000FF0000D51B23FFFFFF
            4033F9C9C6FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1CD
            FDE1DFFDFFFFFFDCDAFE6A5EF93D2EF81000F6E5E4FEFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFBAB6FC4842FF6A67FBF7C6C2E90C04FE0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000000000FF0000FF0000FF0000FF0000FC0000E1B1B1DBE5FF35
            26F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9087FA3829F7
            8980FA2B1DF8968EFBFCFDFF6D62F9E5E4FDFFFFFFFFFFFFFFFFFFFFFFFFFAFA
            FF433AFF5E67FFBCACDBFF4131F70000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000000000FF0000FF0000FF0000FF0000FF0000E61B1FFFF7E57974FF867E
            FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2819F87166F9FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBEAFE7A73FD2C2EFFCBB3DC
            F8705AF60000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000000
            0000FF0000FF0000FF0000FF0000FF0000FE0000E37579EFFBFF3D30F9ECECFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F1FEFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF9A95FD403DFF9096FEF19894F10B05FC0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000000000FF00
            00FF0000FF0000FF0000FF0000FF0000EE0000FFFFF7908DFF746AFAFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFECECBFD3C36FF7774FFDCACB6FC1409FE0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000000000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000D54950FFFFFF3122F8DDDBFDFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0DEFD5B53FE53
            5EFFC59EC3FD604AF50000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000000000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000F40001EEBFBACDD3FF483CF9FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E77FE3431FFBABBF8EE6865FB08
            00FE0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000000000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000E22529FFFFF86158FCA29DFCFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFA09BFB3D39FF8C80F4F6B09CF70000FF0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000000000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000E0979AD7E2FF3526F8FFFFFFFFFFFFFFFFFFFFFFFFD9D7
            FD342EFF7689FFC797B0FB4435F60000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000EE0304FFFFFF7972FE8A81FBFFFFFFDFDEFE615AFF393AFFE6C1CA
            F43D30FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000DA6B70FFFFFF281BF8746FFB4B4DFFA69BEFF19080F50000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000000
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            EE0305F7D3CCBCCBFF858EFFD5848EFD1D12FC0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000000000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000DB
            3039F2BBB4F63123FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000000000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FE0000F400
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000000000}
          Transparent = True
        end
        object Label14: TLabel
          Left = 8
          Top = 48
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
      object edtPAYM_ID: TcxComboBox
        Left = 236
        Top = 36
        Width = 120
        Height = 20
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        Properties.DropDownListStyle = lsFixedList
        TabOrder = 1
      end
      object edtSHOP_ID: TzrComboBoxList
        Left = 236
        Top = 13
        Width = 120
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
        FilterFields = 'SHOP_NAME;SHOP_SPELL'
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
      object edtBILL_NO: TcxTextEdit
        Left = 236
        Top = 102
        Width = 180
        Height = 20
        Properties.OnChange = edtREMARKPropertiesChange
        TabOrder = 4
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
      object edtDEPT_ID: TzrComboBoxList
        Left = 500
        Top = 34
        Width = 131
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
      object cxTextEdit1: TcxTextEdit
        Left = 500
        Top = 56
        Width = 131
        Height = 20
        Properties.OnChange = edtREMARKPropertiesChange
        TabOrder = 9
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
    end
  end
  inherited mmMenu: TMainMenu
    Left = 96
  end
  inherited actList: TActionList
    Left = 112
    object actAddRecvAbleInfo: TAction
      Caption = #28155#21152#24212#32564#27454
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsDetail
    Left = 158
    Top = 225
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
