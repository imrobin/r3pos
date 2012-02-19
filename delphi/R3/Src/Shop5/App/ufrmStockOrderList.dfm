inherited frmStockOrderList: TfrmStockOrderList
  Left = 409
  Top = 107
  Width = 868
  Height = 612
  Caption = #36827#36135#21333
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  inherited bgPanel: TRzPanel
    Width = 860
    Height = 548
    inherited RzPanel2: TRzPanel
      Width = 850
      Height = 538
      inherited RzPage: TRzPageControl
        Width = 844
        Height = 532
        FixedDimension = 25
        inherited TabSheet1: TRzTabSheet
          Caption = #36827#36135#21333#26597#35810
          inherited RzPanel3: TRzPanel
            Width = 842
            Height = 505
            inherited RzPanel1: TRzPanel
              Width = 832
              Height = 110
              object RzLabel2: TRzLabel
                Left = 33
                Top = 4
                Width = 48
                Height = 12
                Alignment = taRightJustify
                Caption = #36827#36135#26085#26399
              end
              object RzLabel3: TRzLabel
                Left = 200
                Top = 4
                Width = 12
                Height = 12
                Caption = #33267
              end
              object RzLabel4: TRzLabel
                Left = 33
                Top = 64
                Width = 48
                Height = 12
                Alignment = taRightJustify
                Caption = #20379' '#24212' '#21830
              end
              object RzLabel5: TRzLabel
                Left = 33
                Top = 84
                Width = 48
                Height = 12
                Alignment = taRightJustify
                Caption = #36827#36135#21333#21495
              end
              object Label1: TLabel
                Left = 201
                Top = 85
                Width = 120
                Height = 12
                Caption = #25903#25345#27169#22359','#36755#21518'4'#20301#26597#35810
                Font.Charset = GB2312_CHARSET
                Font.Color = clNavy
                Font.Height = -12
                Font.Name = #23435#20307
                Font.Style = []
                ParentFont = False
              end
              object Label40: TLabel
                Left = 33
                Top = 24
                Width = 48
                Height = 12
                Caption = #36827#36135#38376#24215
              end
              object Label3: TLabel
                Left = 33
                Top = 44
                Width = 48
                Height = 12
                Caption = #25152#23646#37096#38376
              end
              object D1: TcxDateEdit
                Left = 89
                Top = 0
                Width = 104
                Height = 20
                ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                Properties.DateButtons = [btnToday]
                TabOrder = 0
              end
              object D2: TcxDateEdit
                Left = 216
                Top = 0
                Width = 109
                Height = 20
                ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                Properties.DateButtons = [btnToday]
                TabOrder = 1
              end
              object fndCLIENT_ID: TzrComboBoxList
                Left = 89
                Top = 60
                Width = 236
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
              object fndSTOCK_ID: TcxTextEdit
                Left = 89
                Top = 80
                Width = 104
                Height = 20
                TabOrder = 3
                ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
              end
              object btnOk: TRzBitBtn
                Left = 504
                Top = 56
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
                TabOrder = 5
                TextStyle = tsRaised
                ThemeAware = False
                ImageIndex = 12
                NumGlyphs = 2
                Spacing = 5
              end
              object fndSTATUS: TcxRadioGroup
                Left = 344
                Top = -5
                Width = 145
                Height = 86
                ItemIndex = 0
                Properties.Columns = 2
                Properties.Items = <
                  item
                    Caption = #20840#37096
                  end
                  item
                    Caption = #24453#23457#26680
                  end
                  item
                    Caption = #24050#23457#26680
                  end
                  item
                    Caption = #26410#32467#36134
                  end
                  item
                    Caption = #24050#32467#36134
                  end>
                TabOrder = 4
                Caption = ''
              end
              object fndSHOP_ID: TzrComboBoxList
                Tag = -1
                Left = 89
                Top = 20
                Width = 236
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
              object fndDEPT_ID: TzrComboBoxList
                Left = 89
                Top = 40
                Width = 236
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
            end
            inherited DBGridEh1: TDBGridEh
              Top = 115
              Width = 832
              Height = 385
              Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              OnDblClick = DBGridEh1DblClick
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'SEQNO'
                  Footers = <>
                  Title.Caption = #24207#21495
                  Width = 30
                end
                item
                  EditButtons = <>
                  FieldName = 'GLIDE_NO'
                  Footers = <>
                  Title.Caption = #27969#27700#21495
                  Width = 85
                end
                item
                  DisplayFormat = '0000-00-00'
                  EditButtons = <>
                  FieldName = 'STOCK_DATE'
                  Footers = <>
                  Title.Caption = #36827#36135#26085#26399
                  Width = 68
                end
                item
                  EditButtons = <>
                  FieldName = 'CLIENT_NAME'
                  Footers = <>
                  Title.Caption = #20379#24212#21830
                  Width = 160
                end
                item
                  EditButtons = <>
                  FieldName = 'SHOP_ID_TEXT'
                  Footers = <>
                  Title.Caption = #38376#24215#21517#31216
                  Width = 120
                end
                item
                  EditButtons = <>
                  FieldName = 'GUIDE_USER_TEXT'
                  Footers = <>
                  Title.Caption = #39564#36135#21592
                  Width = 53
                end
                item
                  EditButtons = <>
                  FieldName = 'INVOICE_FLAG'
                  Footers = <>
                  Title.Caption = #31080#25454#31867#22411
                  Width = 54
                end
                item
                  EditButtons = <>
                  FieldName = 'AMOUNT'
                  Footers = <>
                  Title.Caption = #25968#37327
                  Width = 57
                end
                item
                  EditButtons = <>
                  FieldName = 'AMONEY'
                  Footers = <>
                  Title.Caption = #21512#35745#37329#39069
                  Width = 58
                end
                item
                  EditButtons = <>
                  FieldName = 'PAYM_MNY'
                  Footers = <>
                  Title.Caption = #24050#32467#31639
                  Width = 56
                end
                item
                  EditButtons = <>
                  FieldName = 'RECK_MNY'
                  Footers = <>
                  Title.Caption = #26410#32467#31639
                  Width = 57
                end
                item
                  EditButtons = <>
                  FieldName = 'LOCUS_STATUS_NAME'
                  Footers = <>
                  KeyList.Strings = (
                    '1'
                    '3')
                  PickList.Strings = (
                    #24453#25910#36135
                    #24050#25910#36135)
                  Title.Caption = #25910#36135#29366#24577
                  Width = 60
                end
                item
                  EditButtons = <>
                  FieldName = 'REMARK'
                  Footers = <>
                  Title.Caption = #22791#27880
                  Width = 143
                end
                item
                  EditButtons = <>
                  FieldName = 'CREA_USER_TEXT'
                  Footers = <>
                  Title.Caption = #21046#21333#21592
                end
                item
                  EditButtons = <>
                  FieldName = 'CREA_DATE'
                  Footers = <>
                  Title.Caption = #24405#20837#26102#38388
                  Width = 131
                end>
            end
          end
        end
      end
    end
  end
  inherited RzPanel4: TRzPanel
    Width = 860
    inherited Image3: TImage
      Left = 632
      Width = 0
    end
    inherited Image14: TImage
      Left = 840
    end
    inherited Image1: TImage
      Left = 632
      Width = 208
    end
    inherited rzPanel5: TPanel
      Left = 632
      inherited lblToolCaption: TRzLabel
        Caption = #24403#21069#20301#32622'->'#36827#36135#20837#24211
      end
    end
    inherited CoolBar1: TCoolBar
      Width = 612
      Bands = <
        item
          Break = False
          Control = ToolBar1
          FixedSize = True
          ImageIndex = -1
          MinHeight = 612
          Width = 36
        end>
      inherited ToolBar1: TToolBar
        Width = 612
        object ToolButton16: TToolButton
          Left = 518
          Top = 0
          Action = actfrmPayOrder
        end
        object ToolButton17: TToolButton
          Left = 561
          Top = 0
          Width = 8
          Caption = 'ToolButton17'
          ImageIndex = 14
          Style = tbsDivider
        end
        object ToolButton11: TToolButton
          Left = 569
          Top = 0
          Action = actExit
        end
      end
    end
  end
  inherited mmMenu: TMainMenu
    Left = 208
    Top = 144
  end
  inherited actList: TActionList
    inherited actInfo: TAction
      OnExecute = actInfoExecute
    end
    object actfrmPayOrder: TAction
      Caption = #20184#27454
      ImageIndex = 28
      OnExecute = actfrmPayOrderExecute
    end
  end
  inherited cdsList: TZQuery
    AfterScroll = cdsListAfterScroll
  end
  object frfStockOrder: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    OnGetValue = frfStockOrderGetValue
    OnUserFunction = frfStockOrderUserFunction
    Left = 416
    Top = 193
    ReportForm = {
      18000000321E0000180000FFFF01000100FFFFFFFFFF00010000340800007805
      00002400000012000000240000001200000000FFFF00000000FFFF0000000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200D60000000B004D61737465724461746131000201000000
      00A4000000F6020000130000003000050001000000000000000000FFFFFF1F00
      0000000C0066724442446174615365743100000000000000FFFF000000000002
      000000010000000000000001000000C800000014000000010000000000000200
      500100000700B7D6D7E9CDB7310002010000000019000000F60200006D000000
      3200100001000000000000000000FFFFFF1F000000001300696E7428285B5345
      514E4F5D2D31292F31352900000000000000FFFF000000000002000000010000
      000000000001000000C800000014000000010000000000000200370200000700
      B7D6D7E9BDC5310002010000000012010000F602000045000000300011000100
      0000000000000000FFFFFF1F0000000000000000000007000500626567696E0D
      1E0020696620436F756E74284D61737465724461746131293C3135207468656E
      0D060020626567696E0D260020202020666F7220693A3D436F756E74284D6173
      74657244617461312920746F20313420646F0D15002020202053686F7742616E
      64284368696C6431293B0D050020656E643B0D0300656E6400FFFF0000000000
      02000000010000000000000001000000C8000000140000000100000000000002
      009D02000006006368696C643100020100000000CC000000F602000013000000
      3000150001000000000000000000FFFFFF1F00000000000000000000000000FF
      FF000000000002000000010000000000000001000000C8000000140000000100
      000000000000002A03000006004D656D6F31380002001A020000A40000009C00
      00001300000001000F0001000000000000000000FFFFFF1F2E02000000000001
      000F005B52454D41524B5F44455441494C5D00000000FFFF0000000000020000
      0001000000000400CBCECCE5000A000000000000000000090000008600020000
      000000FFFFFF0000000002000000000000000000EA03000006004D656D6F3230
      000200F1000000A4000000D10000001300000001000F00010000000000000000
      00FFFFFF1F2E020000000000010042005B474F44535F4E414D455D205B50524F
      50455254595F30315F544558545D5B50524F50455254595F30325F544558545D
      205B49535F50524553454E545F544558545D00000000FFFF0000000000020000
      0001000000000400CBCECCE5000A000000000000000000080000008600020000
      000000FFFFFF00000000020000000000000000007404000005004D656D6F3900
      02007500000033000000E5000000120000000100020001000000000000000000
      FFFFFF1F2E02000000000001000D005B434C49454E545F4E414D455D00000000
      FFFF00000000000200000001000000000400CBCECCE5000A0000000000000000
      00080000008600020000000000FFFFFF0000000002000000000000000000FE04
      000006004D656D6F343000020088010000330000008B00000012000000010002
      0001000000000000000000FFFFFF1F2E02000000000001000C005B53544F434B
      5F444154455D00000000FFFF00000000000200000001000000000400CBCECCE5
      000A000000000000000000080000008600020000000000FFFFFF000000000200
      00000000000000008705000006004D656D6F3233000200C2010000A400000024
      0000001300000001000F0001000000000000000000FFFFFF1F2E020000000000
      01000B005B554E49545F4E414D455D00000000FFFF0000000000020000000100
      0000000400CBCECCE5000A0000000000000000000A0000008600020000000000
      FFFFFF00000000020000000000000000002306000005004D656D6F33000200E6
      010000A4000000340000001300000001000F0001000000000000000000FFFFFF
      1F2E02000000000001001F005B666F726D6174466C6F6174282723302E232327
      2C5B414D4F554E545D295D00000000FFFF000000000002000000010000000004
      00CBCECCE5000A000000000000000000090000008600020000000000FFFFFF00
      00000002000000000000000000AA06000006004D656D6F31320002002F000000
      3300000046000000120000000100000001000000000000000000FFFFFF1F2E02
      000000000001000900B9A920D3A620C9CC3A00000000FFFF0000000000020000
      0001000000000400CBCECCE5000A000000020000000000080000008600020000
      000000FFFFFF00000000020000000000000000002E07000006004D656D6F3133
      0002005B010000330000002D0000001200000001000000010000000000000000
      00FFFFFF1F2E02000000000001000600C8D5C6DAA3BA00000000FFFF00000000
      000200000001000000000400CBCECCE5000A0000000200000000000800000086
      00020000000000FFFFFF0000000002000000000000000000B407000006004D65
      6D6F3336000200F100000070000000D10000001600000001000F000100000000
      0000000000FFFFFF1F2E02000000000001000800C9CCC6B7C3FBB3C600000000
      FFFF00000000000200000001000000000400CBCECCE5000A0000000200000000
      000A0000008600020000000000FFFFFF00000000020000000000000000003608
      000006004D656D6F3337000200E601000070000000340000001600000001000F
      0001000000000000000000FFFFFF1F2E02000000000001000400CAFDC1BF0000
      0000FFFF00000000000200000001000000000400CBCECCE5000A000000020000
      0000000A0000008600020000000000FFFFFF0000000002000000000000000000
      B808000006004D656D6F3338000200C201000070000000240000001600000001
      000F0001000000000000000000FFFFFF1F2E02000000000001000400B5A5CEBB
      00000000FFFF00000000000200000001000000000400CBCECCE5000A00000002
      00000000000A0000008600020000000000FFFFFF000000000200000000000000
      00004C09000006004D656D6F3431000200310000002901000081000000120000
      000100000001000000000000000000FFFFFF1F2E02000000000001001600D6C6
      B5A5A3BA5B435245415F555345525F544558545D00000000FFFF000000000002
      00000001000000000400CBCECCE5000A00000002000000000008000000860002
      0000000000FFFFFF0000000002000000000000000000D009000006004D656D6F
      34350002001A020000700000009C0000001600000001000F0001000000000000
      000000FFFFFF1F2E02000000000001000600B1B82020D7A200000000FFFF0000
      0000000200000001000000000400CBCECCE5000A0000000200000000000A0000
      008600020000000000FFFFFF0000000002000000000000000000550A00000600
      4D656D6F353400020030000000A40000001B0000001300000001000F00010000
      00000000000000FFFFFF1F2E020000000000010007005B5345514E4F5D000000
      00FFFF00000000000200000001000000000400CBCECCE5000A00000000000000
      00000A0000008600020000000000FFFFFF0000000002000000000000000000D4
      0A000006004D656D6F353500020030000000700000001B000000160000000100
      0F0001000000000000000000FFFFFF1F2E020000000000010001004100000000
      FFFF00000000000200000001000000000400CBCECCE5000A0000000200000000
      000A0000008600020000000000FFFFFF0000000002000000000000000000550B
      000005004D656D6F370002004B00000070000000420000001600000001000F00
      01000000000000000000FFFFFF1F2E02000000000001000400BBF5BAC5000000
      00FFFF00000000000200000001000000000400CBCECCE5000A00000002000000
      00000A0000000100020000000000FFFFFF0000000002000000000000000000DD
      0B000005004D656D6F380002004B000000A4000000420000001300000001000F
      0001000000000000000000FFFFFF1F2E02000000000001000B005B474F44535F
      434F44455D00000000FFFF00000000000200000001000000000400CBCECCE500
      0A000000000000000000080000000100020000000000FFFFFF00000000020000
      00000000000000B40C000006004D656D6F3131000200A9010000120100000D01
      00001300000001000B0001000000000000000000FFFFFF1F2E02000000000001
      005900D7DCCAFDC1BFA3BA5B666F726D6174466C6F6174282723302E2323272C
      5B53544F434B5F414D545D295D20B1BED2B3D0A1BCC6A3BA5B666F726D617446
      6C6F6174282723302E2323272C73756D285B414D4F554E545D29295D00000000
      FFFF00000000000200000001000000000400CBCECCE5000A0000000000000000
      00090000008600020000000000FFFFFF0000000002000000000000000000370D
      000006004D656D6F31360002003000000012010000250000001300000001000E
      0001000000000000000000FFFFFF1F2E02000000000001000500BACFBCC63A00
      000000FFFF00000000000200000001000000000400CBCECCE5000A0000000200
      000000000A0000008600020000000000FFFFFF00000000020000000000000000
      00BA0D000006004D656D6F333200020013020000330000002800000012000000
      0100000001000000000000000000FFFFFF1F2E02000000000001000500B5A5BA
      C53A00000000FFFF00000000000200000001000000000400CBCECCE5000A0000
      00020000000000080000008600020000000000FFFFFF00000000020000000000
      00000000420E000006004D656D6F35380002003B020000330000007B00000012
      0000000100020001000000000000000000FFFFFF1F2E02000000000001000A00
      5B474C4944455F4E4F5D00000000FFFF00000000000200000001000000000400
      CBCECCE5000A000000000000000000000000008600020000000000FFFFFF0000
      000002000000000000000000D30E000005004D656D6F32000200300000001900
      000086020000180000000100000001000000000000000500FFFFFF1F2E020000
      000000010014005BC6F3D2B5C3FBB3C65DBDF8BBF5C8EBBFE2B5A500000000FF
      FF00000000000200000001000000000400CBCECCE50010000000020000000000
      0A0000008600020000000000FFFFFF0000000002000000000000000000690F00
      0006004D656D6F32340002005C0200001B0000007A0000000F00000001000000
      01000000000000000000FFFFFF1F2E02000000000001001800B5DA5B50414745
      235D2F5B544F54414C50414745535DD2B300000000FFFF000000000002000000
      01000000000400CBCECCE5000A00000000000000000009000000860002000000
      0000FFFFFF0000000002000000000000000000FB0F000005004D656D6F310002
      00F20000002801000080000000140000000100000001000000000000000000FF
      FFFF1F2E02000000000001001500C9F3BACBA3BA5B43484B5F555345525F5445
      58545D00000000010000000000000200000001000000000400CBCECCE5000A00
      0000020000000000080000008600020000000000FFFFFF000000000200000000
      00000000007910000006004D656D6F3433000200550000001201000054010000
      1300000001000A0001000000000000000000FFFFFF1F2E020000000000010000
      0000000000FFFF00000000000200000001000000000400CBCECCE5000A000000
      000000000000080000008600020000000000FFFFFF0000000002000000000000
      0000000011000006004D656D6F33310002002E00000047000000480000001200
      00000300000001000000000000000000FFFFFF1F2E02000000000001000900B5
      D820202020D6B73A00000000FFFF00000000000200000001000000000400CBCE
      CCE5000A000000020000000000080000000100020000000000FFFFFF00000000
      020000000000000000008711000006004D656D6F353000020074000000470000
      00E7000000120000000300020001000000000000000000FFFFFF1F2E02000000
      0000010009005B414444524553535D00000000FFFF0000000000020000000100
      0000000400CBCECCE5000A000000000000000000080000000100020000000000
      FFFFFF00000000020000000000000000000B12000006004D656D6F3536000200
      5B010000470000002D000000120000000300000001000000000000000000FFFF
      FF1F2E02000000000001000600B5E7BBB0A3BA00000000FFFF00000000000200
      000001000000000400CBCECCE5000A0000000200000000000800000001000200
      00000000FFFFFF00000000020000000000000000009412000006004D656D6F35
      3700020088010000470000008A00000012000000030002000100000000000000
      0000FFFFFF1F2E02000000000001000B005B4D4F56455F54454C455D00000000
      FFFF00000000000200000001000000000400CBCECCE5000A0000000000000000
      00080000000100020000000000FFFFFF00000000020000000000000000001613
      000006004D656D6F34320002008D00000070000000640000001600000001000F
      0001000000000000000000FFFFFF1F2E02000000000001000400CCF5C2EB0000
      0000FFFF00000000000200000001000000000400CBCECCE5000A000000020000
      0000000A0000000100020000000000FFFFFF0000000002000000000000000000
      9D13000006004D656D6F35390002008D000000A4000000640000001300000001
      000F0001000000000000000000FFFFFF1F2E020000000000010009005B424152
      434F44455D00000000FFFF00000000000200000001000000000400CBCECCE500
      0A000000000000000000080000000100020000000000FFFFFF00000000020000
      000000000000001914000006004D656D6F36310002001A020000CC0000009C00
      00001300000001000F0001000000000000000000FFFFFF1F2E02000000000000
      0000000000FFFF00000000000200000001000000000400CBCECCE5000A000000
      000000000000090000008600020000000000FFFFFF0000000002000000000000
      0000009514000006004D656D6F3632000200F1000000CC000000D10000001300
      000001000F0001000000000000000000FFFFFF1F2E0200000000000000000000
      00FFFF00000000000200000001000000000400CBCECCE5000A00000000000000
      0000080000008600020000000000FFFFFF000000000200000000000000000013
      15000006004D656D6F3633000200C2010000CC00000024000000130000000100
      0F0001000000000000000000FFFFFF1F2E0200000000000100000000000000FF
      FF00000000000200000001000000000400CBCECCE5000A000000000000000000
      0A0000008600020000000000FFFFFF00000000020000000000000000008F1500
      0006004D656D6F3634000200E6010000CC000000340000001300000001000F00
      01000000000000000000FFFFFF1F2E020000000000000000000000FFFF000000
      00000200000001000000000400CBCECCE5000A00000000000000000009000000
      8600020000000000FFFFFF00000000020000000000000000000D16000006004D
      656D6F363500020030000000CC0000001B0000001300000001000F0001000000
      000000000000FFFFFF1F2E0200000000000100000000000000FFFF0000000000
      0200000001000000000400CBCECCE5000A0000000000000000000A0000008600
      020000000000FFFFFF00000000020000000000000000008B16000006004D656D
      6F36360002004B000000CC000000420000001300000001000F00010000000000
      00000000FFFFFF1F2E0200000000000100000000000000FFFF00000000000200
      000001000000000400CBCECCE5000A0000000000000000000800000001000200
      00000000FFFFFF00000000020000000000000000000717000006004D656D6F36
      370002008D000000CC000000640000001300000001000F000100000000000000
      0000FFFFFF1F2E020000000000000000000000FFFF0000000000020000000100
      0000000400CBCECCE5000A000000000000000000080000000100020000000000
      FFFFFF0000000002000000000000000000E717000006004D656D6F3638000200
      C10200007F00000014000000140100000300000001000000000000000000FFFF
      FF1F2E020000000000080000000D0C00B0D7C1AAB4E6B8F9202020200D00000D
      15002020202020202020202020202020202020202020200D0C00BAECC1AACAD5
      BBF5B7BD20200D00000D18002020202020202020202020202020202020202020
      202020200D0800BBC6C1AAB2C6CEF100000000FFFF0000000000020000000100
      0000000400CBCECCE5000A000000020000000000000000000100020000000000
      FFFFFF00000000020000000000000000006A18000006004D656D6F3130000200
      130200004700000028000000120000000300000001000000000000000000FFFF
      FF1F2E02000000000001000500BDE1CBE33A00000000FFFF0000000000020000
      0001000000000400CBCECCE5000A000000020000000000080000000100020000
      000000FFFFFF0000000002000000000000000000FA18000006004D656D6F3135
      0002003B020000470000007B0000001200000003000200010000000000000000
      00FFFFFF1F2E020000000000010012005B534554544C455F434F44455F544558
      545D00000000FFFF00000000000200000001000000000400CBCECCE5000A0000
      00000000000000080000000100020000000000FFFFFF00000000020000000000
      000000008019000005004D656D6F340002002F0000005B000000440000001200
      00000300000001000000000000000000FFFFFF1F2E02000000000001000900CA
      D5BBF5B5A5CEBB3A00000000FFFF00000000000200000001000000000400CBCE
      CCE5000A000000020000000000080000000100020000000000FFFFFF00000000
      02000000000000000000081A000005004D656D6F36000200730000005B000000
      E9000000120000000300020001000000000000000000FFFFFF1F2E0200000000
      0001000B005B53484F505F4E414D455D00000000FFFF00000000000200000001
      000000000400CBCECCE5000A0000000000000000000800000001000200000000
      00FFFFFF00000000020000000000000000008B1A000006004D656D6F31370002
      00130200005B00000028000000120000000300000001000000000000000000FF
      FFFF1F2E02000000000001000500B1B8D7A23A00000000FFFF00000000000200
      000001000000000400CBCECCE5000A0000000200000000000800000001000200
      00000000FFFFFF0000000002000000000000000000111B000006004D656D6F31
      390002003B0200005B0000007B00000012000000030002000100000000000000
      0000FFFFFF1F2E020000000000010008005B52454D41524B5D00000000FFFF00
      000000000200000001000000000400CBCECCE5000A0000000000000000000800
      00000100020000000000FFFFFF0000000002000000000000000000971B000006
      004D656D6F323100020025020000290100003400000012000000010000000100
      0000000000000000FFFFFF1F2E02000000000001000800CAD5BBF5C8CBA3BA00
      000000010000000000000200000001000000000400CBCECCE5000A0000000200
      00000000080000008600020000000000FFFFFF00000000020000000000000000
      00131C000006004D656D6F32320002005A020000290100005C00000012000000
      0100020001000000000000000000FFFFFF1F2E02000000000000000000000001
      0000000000000200000001000000000400CBCECCE5000A000000020000000000
      080000008600020000000000FFFFFF0000000002000000000000000000A81C00
      0006004D656D6F32350002003100000041010000880100001200000003000000
      01000000000000000000FFFFFF1F2E02000000000001001600B4F2D3A1CAB1BC
      E43A5B444154455D205B54494D455D00000000FFFF0000000000020000000100
      0000000500417269616C000A0000000000000000000000000001000200000000
      00FFFFFF00000000020000000000000000002B1D000005004D656D6F35000200
      5C0100005B0000002D000000120000000300000001000000000000000000FFFF
      FF1F2E02000000000001000600B6A9B5A5BAC500000000FFFF00000000000200
      000001000000000400CBCECCE5000A0000000200000000000800000001000200
      00000000FFFFFF0000000002000000000000000000B81D000006004D656D6F31
      34000200890100005B0000008A00000012000000030002000100000000000000
      0000FFFFFF1F2E02000000000001000F005B474C4944455F4E4F5F46524F4D5D
      00000000FFFF00000000000200000001000000000400CBCECCE5000A00000000
      0000000000080000000100020000000000FFFFFF000000000200000000000000
      FEFEFF060000000A00205661726961626C6573000000000200736C0014006364
      735F436867426F64792E22534C30303030220002006A650014006364735F4368
      67426F64792E224A4530303030220004006B68796800000000040079687A6800
      0000000200647A000000000000000000000000FDFF0100000000}
  end
end
