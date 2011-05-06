inherited frmStkIndentOrderList: TfrmStkIndentOrderList
  Left = 196
  Top = 159
  Width = 868
  Height = 557
  Caption = #36827#36135#35746#21333
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  inherited bgPanel: TRzPanel
    Width = 852
    Height = 483
    inherited RzPanel2: TRzPanel
      Width = 842
      Height = 473
      inherited RzPage: TRzPageControl
        Width = 836
        Height = 467
        FixedDimension = 25
        inherited TabSheet1: TRzTabSheet
          Caption = #36827#36135#35746#36135#21333#26597#35810
          inherited RzPanel3: TRzPanel
            Width = 834
            Height = 440
            inherited RzPanel1: TRzPanel
              Width = 824
              Height = 115
              object RzLabel2: TRzLabel
                Left = 33
                Top = 4
                Width = 48
                Height = 12
                Alignment = taRightJustify
                Caption = #35746#36135#26085#26399
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
                Top = 65
                Width = 48
                Height = 12
                Alignment = taRightJustify
                Caption = #20379' '#24212' '#21830
              end
              object RzLabel5: TRzLabel
                Left = 33
                Top = 86
                Width = 48
                Height = 12
                Alignment = taRightJustify
                Caption = #35746#36135#21333#21495
              end
              object Label1: TLabel
                Left = 201
                Top = 87
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
                Caption = #35746#36135#38376#24215
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
                Top = 61
                Width = 236
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
              object fndINDE_ID: TcxTextEdit
                Left = 89
                Top = 82
                Width = 104
                Height = 20
                TabOrder = 5
                ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
              end
              object btnOk: TRzBitBtn
                Left = 560
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
                TabOrder = 7
                TextStyle = tsRaised
                ThemeAware = False
                ImageIndex = 12
                NumGlyphs = 2
                Spacing = 5
              end
              object fndSTATUS: TcxRadioGroup
                Left = 344
                Top = -5
                Width = 201
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
                    Caption = #26410#20837#24211
                  end
                  item
                    Caption = #24050#20837#24211
                  end
                  item
                    Caption = #24453#32467#31639
                  end
                  item
                    Caption = #24050#32467#31639
                  end>
                TabOrder = 6
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
                ShowButton = False
                LocateStyle = lsDark
                Buttons = []
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
            end
            inherited DBGridEh1: TDBGridEh
              Top = 120
              Width = 824
              Height = 315
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
                  FieldName = 'INDE_DATE'
                  Footers = <>
                  Title.Caption = #35746#36135#26085#26399
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
                  FieldName = 'ADVA_MNY'
                  Footers = <>
                  Title.Caption = #39044#20184#27454'|'#39044#20184#27454
                  Width = 60
                end
                item
                  EditButtons = <>
                  FieldName = 'PAYM_MNY'
                  Footers = <>
                  Title.Caption = #39044#20184#27454'|'#24050#32467#31639
                  Width = 58
                end
                item
                  EditButtons = <>
                  FieldName = 'RECK_MNY'
                  Footers = <>
                  Title.Caption = #39044#20184#27454'|'#26410#32467#31639
                  Width = 63
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
    Width = 852
    inherited Image1: TImage
      Left = 636
      Width = 196
    end
    inherited Image3: TImage
      Left = 636
      Width = 196
    end
    inherited Image14: TImage
      Left = 832
    end
    inherited rzPanel5: TPanel
      Left = 636
      inherited lblToolCaption: TRzLabel
        Caption = #24403#21069#20301#32622'->'#36827#36135#35746#21333
      end
    end
    inherited CoolBar1: TCoolBar
      Width = 616
      Bands = <
        item
          Break = False
          Control = ToolBar1
          FixedSize = True
          ImageIndex = -1
          MinHeight = 616
          Width = 48
        end>
      inherited ToolBar1: TToolBar
        Width = 616
        object ToolButton16: TToolButton
          Left = 522
          Top = 0
          Action = actfrmPayOrder
        end
        object ToolButton17: TToolButton
          Left = 565
          Top = 0
          Width = 8
          Caption = 'ToolButton17'
          ImageIndex = 14
          Style = tbsDivider
        end
        object ToolButton11: TToolButton
          Left = 573
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
      18000000391F0000180000FFFF01000100FFFFFFFFFF00010000340800007805
      00002400000012000000240000001200000000FFFF00000000FFFF0000000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200D60000000B004D61737465724461746131000201000000
      00A4000000F6020000130000003000050001000000000000000000FFFFFF1F00
      0000000C0066724442446174615365743100000000000000FFFF000000000002
      000000010000000000000001000000C800000014000000010000000000000200
      500100000700B7D6D7E9CDB7310002010000000019000000F60200006D000000
      3200100001000000000000000000FFFFFF1F000000001300696E7428285B5345
      514E4F5D2D31292F31362900000000000000FFFF000000000002000000010000
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
      000000000000003B03000006004D656D6F313400020019020000A40000003C00
      00001300000001000F0001000000000000000000FFFFFF1F2E02000000000001
      0020005B466F726D6174466C6F6174282723302E303023272C5B415052494345
      5D295D00000000FFFF00000000000200000001000000000400CBCECCE5000A00
      0000000000000000090000008600020000000000FFFFFF000000000200000000
      0000000000DC03000006004D656D6F313800020055020000A400000060000000
      1300000001000F0001000000000000000000FFFFFF1F2E020000000000010023
      005B666F726D6174466C6F6174282723302E3030272C5B43414C435F4D4F4E45
      595D295D00000000FFFF00000000000200000001000000000400CBCECCE5000A
      000000000000000000090000008600020000000000FFFFFF0000000002000000
      0000000000009C04000006004D656D6F3230000200F0000000A4000000D10000
      001300000001000F0001000000000000000000FFFFFF1F2E0200000000000100
      42005B474F44535F4E414D455D205B50524F50455254595F30315F544558545D
      5B50524F50455254595F30325F544558545D205B49535F50524553454E545F54
      4558545D00000000FFFF00000000000200000001000000000400CBCECCE5000A
      000000000000000000080000008600020000000000FFFFFF0000000002000000
      0000000000002605000005004D656D6F390002007400000033000000EF000000
      120000000100020001000000000000000000FFFFFF1F2E02000000000001000D
      005B434C49454E545F4E414D455D00000000FFFF000000000002000000010000
      00000400CBCECCE5000A000000000000000000080000008600020000000000FF
      FFFF0000000002000000000000000000AF05000006004D656D6F343000020091
      0100003300000093000000120000000100020001000000000000000000FFFFFF
      1F2E02000000000001000B005B494E44455F444154455D00000000FFFF000000
      00000200000001000000000400CBCECCE5000A00000000000000000008000000
      8600020000000000FFFFFF00000000020000000000000000003806000006004D
      656D6F3233000200C1010000A4000000240000001300000001000F0001000000
      000000000000FFFFFF1F2E02000000000001000B005B554E49545F4E414D455D
      00000000FFFF00000000000200000001000000000400CBCECCE5000A00000000
      00000000000A0000008600020000000000FFFFFF000000000200000000000000
      0000D406000005004D656D6F33000200E5010000A40000003400000013000000
      01000F0001000000000000000000FFFFFF1F2E02000000000001001F005B666F
      726D6174466C6F6174282723302E2323272C5B414D4F554E545D295D00000000
      FFFF00000000000200000001000000000400CBCECCE5000A0000000000000000
      00090000008600020000000000FFFFFF00000000020000000000000000005C07
      000006004D656D6F31320002002E000000330000004600000012000000010000
      0001000000000000000000FFFFFF1F2E02000000000001000A00B9A920D3A620
      C9CCA3BA00000000FFFF00000000000200000001000000000400CBCECCE5000A
      000000020000000000080000008600020000000000FFFFFF0000000002000000
      000000000000E007000006004D656D6F313300020064010000330000002B0000
      00120000000100000001000000000000000000FFFFFF1F2E0200000000000100
      0600C8D5C6DAA3BA00000000FFFF00000000000200000001000000000400CBCE
      CCE5000A000000020000000000080000008600020000000000FFFFFF00000000
      020000000000000000006208000006004D656D6F333400020019020000700000
      003C0000001600000001000F0001000000000000000000FFFFFF1F2E02000000
      000001000400B5A5BCDB00000000FFFF00000000000200000001000000000400
      CBCECCE5000A0000000200000000000A0000008600020000000000FFFFFF0000
      000002000000000000000000E808000006004D656D6F3336000200F000000070
      000000D10000001600000001000F0001000000000000000000FFFFFF1F2E0200
      0000000001000800C9CCC6B7C3FBB3C600000000FFFF00000000000200000001
      000000000400CBCECCE5000A0000000200000000000A00000086000200000000
      00FFFFFF00000000020000000000000000006A09000006004D656D6F33370002
      00E501000070000000340000001600000001000F0001000000000000000000FF
      FFFF1F2E02000000000001000400CAFDC1BF00000000FFFF0000000000020000
      0001000000000400CBCECCE5000A0000000200000000000A0000008600020000
      000000FFFFFF0000000002000000000000000000EC09000006004D656D6F3338
      000200C101000070000000240000001600000001000F00010000000000000000
      00FFFFFF1F2E02000000000001000400B5A5CEBB00000000FFFF000000000002
      00000001000000000400CBCECCE5000A0000000200000000000A000000860002
      0000000000FFFFFF0000000002000000000000000000820A000006004D656D6F
      3431000200300000002901000081000000120000000100000001000000000000
      000000FFFFFF1F2E02000000000001001800D6C6B5A5C8CBA3BA5B435245415F
      555345525F544558545D00000000FFFF00000000000200000001000000000400
      CBCECCE5000A000000020000000000080000008600020000000000FFFFFF0000
      000002000000000000000000040B000006004D656D6F34350002005502000070
      000000600000001600000001000F0001000000000000000000FFFFFF1F2E0200
      0000000001000400BDF0B6EE00000000FFFF0000000000020000000100000000
      0400CBCECCE5000A0000000200000000000A0000008600020000000000FFFFFF
      0000000002000000000000000000890B000006004D656D6F35340002002F0000
      00A40000001B0000001300000001000F0001000000000000000000FFFFFF1F2E
      020000000000010007005B5345514E4F5D00000000FFFF000000000002000000
      01000000000400CBCECCE5000A0000000000000000000A000000860002000000
      0000FFFFFF0000000002000000000000000000080C000006004D656D6F353500
      02002F000000700000001B0000001600000001000F0001000000000000000000
      FFFFFF1F2E020000000000010001004100000000FFFF00000000000200000001
      000000000400CBCECCE5000A0000000200000000000A00000086000200000000
      00FFFFFF0000000002000000000000000000890C000005004D656D6F37000200
      4A00000070000000420000001600000001000F0001000000000000000000FFFF
      FF1F2E02000000000001000400BBF5BAC500000000FFFF000000000002000000
      01000000000400CBCECCE5000A0000000200000000000A000000010002000000
      0000FFFFFF0000000002000000000000000000110D000005004D656D6F380002
      004A000000A4000000420000001300000001000F0001000000000000000000FF
      FFFF1F2E02000000000001000B005B474F44535F434F44455D00000000FFFF00
      000000000200000001000000000400CBCECCE5000A0000000000000000000800
      00000100020000000000FFFFFF0000000002000000000000000000ED0D000006
      004D656D6F3131000200E501000012010000D00000001300000001000B000100
      0000000000000000FFFFFF1F2E02000000000001005E00D7DCCAFDC1BFA3BA5B
      666F726D6174466C6F6174282723302E2323272C5B494E44455F414D545D295D
      20B1BED2B3D0A1BCC6A3BAA3A45B666F726D6174466C6F6174282723302E3030
      272C73756D285B43414C435F4D4F4E45595D29295D00000000FFFF0000000000
      0200000001000000000400CBCECCE5000A000000000000000000090000008600
      020000000000FFFFFF0000000002000000000000000000750E000006004D656D
      6F31360002002F000000120100004A0000001300000001000E00010000000000
      00000000FFFFFF1F2E02000000000001000A00BACFBCC6BDF0B6EEA3BA000000
      00FFFF00000000000200000001000000000400CBCECCE5000A00000002000000
      00000A0000008600020000000000FFFFFF0000000002000000000000000000F9
      0E000006004D656D6F333200020024020000330000002D000000120000000100
      000001000000000000000000FFFFFF1F2E02000000000001000600B5A5BAC5A3
      BA00000000FFFF00000000000200000001000000000400CBCECCE5000A000000
      020000000000080000008600020000000000FFFFFF0000000002000000000000
      000000810F000006004D656D6F35380002005102000033000000640000001200
      00000100020001000000000000000000FFFFFF1F2E02000000000001000A005B
      474C4944455F4E4F5D00000000FFFF00000000000200000001000000000400CB
      CECCE5000A000000000000000000000000008600020000000000FFFFFF000000
      00020000000000000000001010000005004D656D6F320002002F000000190000
      0086020000180000000100000001000000000000000500FFFFFF1F2E02000000
      0000010012005BC6F3D2B5C3FBB3C65DBDF8BBF5B6A9B5A500000000FFFF0000
      0000000200000001000000000400CBCECCE500100000000200000000000A0000
      008600020000000000FFFFFF0000000002000000000000000000A61000000600
      4D656D6F32340002005B0200001B0000007A0000000F00000001000000010000
      00000000000000FFFFFF1F2E02000000000001001800B5DA5B50414745235D2F
      5B544F54414C50414745535DD2B300000000FFFF000000000002000000010000
      00000400CBCECCE5000A000000000000000000090000008600020000000000FF
      FFFF00000000020000000000000000003C11000005004D656D6F31000200C800
      00002801000080000000140000000100000001000000000000000000FFFFFF1F
      2E02000000000001001900D1E9BBF5D4B1A3BA5B47554944455F555345525F54
      4558545D00000000010000000000000200000001000000000400CBCECCE5000A
      0000000200FFFFFF1F080000008600020000000000FFFFFF0000000002000000
      0000000000001112000006004D656D6F343300020079000000120100006D0100
      001300000001000A0001000000000000000000FFFFFF1F2E0200000000000100
      57005B536D616C6C546F426967285B666F726D6174466C6F6174282723302E30
      30272C5B494E44455F4D4E595D295D295D20A3A4A3BA5B666F726D6174466C6F
      6174282723302E303023272C5B494E44455F4D4E595D295D2000000000FFFF00
      000000000200000001000000000400CBCECCE5000A0000000000000000000800
      00008600020000000000FFFFFF00000000020000000000000000009812000006
      004D656D6F33310002002D000000470000004800000012000000030000000100
      0000000000000000FFFFFF1F2E02000000000001000900B5D820202020D6B73A
      00000000FFFF00000000000200000001000000000400CBCECCE5000A00000002
      0000000000080000000100020000000000FFFFFF000000000200000000000000
      00001F13000006004D656D6F35300002007300000047000000F1000000120000
      000300020001000000000000000000FFFFFF1F2E020000000000010009005B41
      4444524553535D00000000FFFF00000000000200000001000000000400CBCECC
      E5000A000000000000000000080000000100020000000000FFFFFF0000000002
      000000000000000000A313000006004D656D6F35360002006401000047000000
      2C000000120000000300000001000000000000000000FFFFFF1F2E0200000000
      0001000600B5E7BBB0A3BA00000000FFFF000000000002000000010000000004
      00CBCECCE5000A000000020000000000080000000100020000000000FFFFFF00
      000000020000000000000000002C14000006004D656D6F353700020091010000
      4700000092000000120000000300020001000000000000000000FFFFFF1F2E02
      000000000001000B005B4D4F56455F54454C455D00000000FFFF000000000002
      00000001000000000400CBCECCE5000A00000000000000000008000000010002
      0000000000FFFFFF0000000002000000000000000000AE14000006004D656D6F
      34320002008C00000070000000640000001600000001000F0001000000000000
      000000FFFFFF1F2E02000000000001000400CCF5C2EB00000000FFFF00000000
      000200000001000000000400CBCECCE5000A0000000200000000000A00000001
      00020000000000FFFFFF00000000020000000000000000003515000006004D65
      6D6F35390002008C000000A4000000640000001300000001000F000100000000
      0000000000FFFFFF1F2E020000000000010009005B424152434F44455D000000
      00FFFF00000000000200000001000000000400CBCECCE5000A00000000000000
      0000080000000100020000000000FFFFFF0000000002000000000000000000B1
      15000006004D656D6F363000020019020000CC0000003C000000130000000100
      0F0001000000000000000000FFFFFF1F2E020000000000000000000000FFFF00
      000000000200000001000000000400CBCECCE5000A0000000000000000000900
      00008600020000000000FFFFFF00000000020000000000000000002D16000006
      004D656D6F363100020055020000CC000000600000001300000001000F000100
      0000000000000000FFFFFF1F2E020000000000000000000000FFFF0000000000
      0200000001000000000400CBCECCE5000A000000000000000000090000008600
      020000000000FFFFFF0000000002000000000000000000A916000006004D656D
      6F3632000200F0000000CC000000D10000001300000001000F00010000000000
      00000000FFFFFF1F2E020000000000000000000000FFFF000000000002000000
      01000000000400CBCECCE5000A00000000000000000008000000860002000000
      0000FFFFFF00000000020000000000000000002717000006004D656D6F363300
      0200C1010000CC000000240000001300000001000F0001000000000000000000
      FFFFFF1F2E0200000000000100000000000000FFFF0000000000020000000100
      0000000400CBCECCE5000A0000000000000000000A0000008600020000000000
      FFFFFF0000000002000000000000000000A317000006004D656D6F3634000200
      E5010000CC000000340000001300000001000F0001000000000000000000FFFF
      FF1F2E020000000000000000000000FFFF000000000002000000010000000004
      00CBCECCE5000A000000000000000000090000008600020000000000FFFFFF00
      000000020000000000000000002118000006004D656D6F36350002002F000000
      CC0000001B0000001300000001000F0001000000000000000000FFFFFF1F2E02
      00000000000100000000000000FFFF00000000000200000001000000000400CB
      CECCE5000A0000000000000000000A0000008600020000000000FFFFFF000000
      00020000000000000000009F18000006004D656D6F36360002004A000000CC00
      0000420000001300000001000F0001000000000000000000FFFFFF1F2E020000
      0000000100000000000000FFFF00000000000200000001000000000400CBCECC
      E5000A000000000000000000080000000100020000000000FFFFFF0000000002
      0000000000000000001B19000006004D656D6F36370002008C000000CC000000
      640000001300000001000F0001000000000000000000FFFFFF1F2E0200000000
      00000000000000FFFF00000000000200000001000000000400CBCECCE5000A00
      0000000000000000080000000100020000000000FFFFFF000000000200000000
      0000000000FE19000006004D656D6F3638000200C00200006100000014000000
      2E0100000300000001000000000000000000FFFFFF1F2E02000000000007000E
      00B0D7C1AAA3BAB4E6B8F9202020200D00000D15002020202020202020202020
      202020202020202020200D0E00BAECC1AAA3BAB9A9D3A6C9CC20200D00000D18
      002020202020202020202020202020202020202020202020200D0A00BBC6C1AA
      A3BABDE1CBE300000000FFFF00000000000200000001000000000400CBCECCE5
      000A000000020000000000000000000100020000000000FFFFFF000000000200
      0000000000000000821A000006004D656D6F313000020024020000470000002C
      000000120000000300000001000000000000000000FFFFFF1F2E020000000000
      01000600BDE1CBE3A3BA00000000FFFF00000000000200000001000000000400
      CBCECCE5000A000000020000000000080000000100020000000000FFFFFF0000
      000002000000000000000000121B000006004D656D6F31350002005102000047
      00000064000000120000000300020001000000000000000000FFFFFF1F2E0200
      00000000010012005B534554544C455F434F44455F544558545D00000000FFFF
      00000000000200000001000000000400CBCECCE5000A00000000000000000008
      0000000100020000000000FFFFFF0000000002000000000000000000981B0000
      05004D656D6F34000200310000005B0000004400000012000000030000000100
      0000000000000000FFFFFF1F2E02000000000001000900CAD5BBF5C3C5B5EA3A
      00000000FFFF00000000000200000001000000000400CBCECCE5000A00000002
      0000000000080000000100020000000000FFFFFF000000000200000000000000
      0000201C000005004D656D6F36000200720000005B000000F300000012000000
      0300020001000000000000000000FFFFFF1F2E02000000000001000B005B5348
      4F505F4E414D455D00000000FFFF00000000000200000001000000000400CBCE
      CCE5000A000000000000000000080000000100020000000000FFFFFF00000000
      02000000000000000000A41C000006004D656D6F3137000200640100005B0000
      002C000000120000000300000001000000000000000000FFFFFF1F2E02000000
      000001000600B1B8D7A2A3BA00000000FFFF0000000000020000000100000000
      0400CBCECCE5000A000000020000000000080000000100020000000000FFFFFF
      00000000020000000000000000002A1D000006004D656D6F3139000200910100
      005B00000024010000120000000300020001000000000000000000FFFFFF1F2E
      020000000000010008005B52454D41524B5D00000000FFFF0000000000020000
      0001000000000400CBCECCE5000A000000000000000000080000000100020000
      000000FFFFFF0000000002000000000000000000AE1D000006004D656D6F3231
      0002001E020000390100002C0000001200000001000000010000000000000000
      00FFFFFF1F2E02000000000001000600B2C6CEF1A3BA00000000010000000000
      000200000001000000000400CBCECCE5000A0000000200FFFFFF1F0800000086
      00020000000000FFFFFF00000000020000000000000000002A1E000006004D65
      6D6F323200020053020000390100005C00000012000000010002000100000000
      0000000000FFFFFF1F2E02000000000000000000000001000000000000020000
      0001000000000400CBCECCE5000A0000000200FFFFFF1F080000008600020000
      000000FFFFFF0000000002000000000000000000BF1E000006004D656D6F3235
      0002003000000041010000880100001200000003000000010000000000000000
      00FFFFFF1F2E02000000000001001600B4F2D3A1CAB1BCE43A5B444154455D20
      5B54494D455D00000000FFFF0000000000020000000100000000050041726961
      6C000A000000000000000000000000000100020000000000FFFFFF0000000002
      00000000000000FEFEFF060000000A00205661726961626C6573000000000200
      736C0014006364735F436867426F64792E22534C30303030220002006A650014
      006364735F436867426F64792E224A4530303030220004006B68796800000000
      040079687A68000000000200647A000000000000000000000000FDFF01000000
      00}
  end
end
