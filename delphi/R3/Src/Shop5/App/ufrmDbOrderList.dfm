inherited frmDbOrderList: TfrmDbOrderList
  Left = 253
  Top = 179
  Width = 845
  Height = 536
  Caption = #35843#25320#21333
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  inherited bgPanel: TRzPanel
    Width = 837
    Height = 473
    inherited RzPanel2: TRzPanel
      Width = 827
      Height = 463
      inherited RzPage: TRzPageControl
        Width = 821
        Height = 457
        FixedDimension = 25
        inherited TabSheet1: TRzTabSheet
          Caption = #35843#25320#21333#26597#35810
          inherited RzPanel3: TRzPanel
            Width = 819
            Height = 430
            inherited RzPanel1: TRzPanel
              Width = 809
              Height = 102
              Caption = '.'
              object RzLabel2: TRzLabel
                Left = 33
                Top = 5
                Width = 48
                Height = 12
                Alignment = taRightJustify
                Caption = #35843#25320#26085#26399
              end
              object RzLabel3: TRzLabel
                Left = 200
                Top = 5
                Width = 12
                Height = 12
                Caption = #33267
              end
              object RzLabel4: TRzLabel
                Left = 33
                Top = 47
                Width = 48
                Height = 12
                Alignment = taRightJustify
                Caption = #35843#20837#38376#24215
              end
              object RzLabel5: TRzLabel
                Left = 33
                Top = 68
                Width = 48
                Height = 12
                Alignment = taRightJustify
                Caption = #35843#25320#21333#21495
              end
              object Label40: TLabel
                Left = 33
                Top = 26
                Width = 48
                Height = 12
                Caption = #35843#20986#38376#24215
              end
              object Label1: TLabel
                Left = 201
                Top = 69
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
              object D1: TcxDateEdit
                Left = 89
                Top = 1
                Width = 104
                Height = 20
                ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                Properties.DateButtons = [btnToday]
                TabOrder = 0
              end
              object D2: TcxDateEdit
                Left = 216
                Top = 1
                Width = 109
                Height = 20
                ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                Properties.DateButtons = [btnToday]
                TabOrder = 1
              end
              object btnOk: TRzBitBtn
                Left = 508
                Top = 60
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
                TabOrder = 4
                TextStyle = tsRaised
                ThemeAware = False
                ImageIndex = 12
                NumGlyphs = 2
                Spacing = 5
              end
              object fndSALES_ID: TcxTextEdit
                Left = 89
                Top = 65
                Width = 104
                Height = 20
                TabOrder = 2
                ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
              end
              object fndSTATUS: TcxRadioGroup
                Left = 344
                Top = -4
                Width = 145
                Height = 90
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
                    Caption = #26410#21040#36135
                  end
                  item
                    Caption = #24050#21040#36135
                  end>
                TabOrder = 3
                Caption = ''
              end
              object fndSHOP_ID: TzrComboBoxList
                Tag = -1
                Left = 89
                Top = 22
                Width = 236
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
                ShowButton = True
                LocateStyle = lsDark
                Buttons = [zbClear]
                DropListStyle = lsFixed
                MultiSelect = False
              end
              object fndCLIENT_ID: TzrComboBoxList
                Tag = -1
                Left = 89
                Top = 44
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
            end
            inherited DBGridEh1: TDBGridEh
              Top = 107
              Width = 809
              Height = 318
              FrozenCols = 1
              Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              OptionsEh = [dghFixed3D, dghFrozen3D, dghHighlightFocus, dghClearSelection]
              OnDblClick = DBGridEh1DblClick
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'SEQNO'
                  Footers = <>
                  Title.Caption = #24207#21495
                  Width = 29
                end
                item
                  EditButtons = <>
                  FieldName = 'GLIDE_NO'
                  Footers = <>
                  Title.Caption = #21333#21495
                  Width = 78
                end
                item
                  DisplayFormat = '0000-00-00'
                  EditButtons = <>
                  FieldName = 'SALES_DATE'
                  Footers = <>
                  Title.Caption = #35843#25320#26085#26399
                  Width = 67
                end
                item
                  EditButtons = <>
                  FieldName = 'SHOP_NAME'
                  Footers = <>
                  Title.Caption = #35843#20986#38376#24215
                  Width = 148
                end
                item
                  EditButtons = <>
                  FieldName = 'CLIENT_NAME'
                  Footers = <>
                  Title.Caption = #35843#20837#38376#24215
                  Width = 150
                end
                item
                  EditButtons = <>
                  FieldName = 'PLAN_DATE'
                  Footers = <>
                  Title.Caption = #21040#36135#26085#26399
                  Width = 63
                end
                item
                  EditButtons = <>
                  FieldName = 'GUIDE_USER_TEXT'
                  Footers = <>
                  Title.Caption = #36865#36135#21592
                  Width = 53
                end
                item
                  EditButtons = <>
                  FieldName = 'STOCK_USER_TEXT'
                  Footers = <>
                  Title.Caption = #39564#36135#21592
                  Width = 49
                end
                item
                  EditButtons = <>
                  FieldName = 'AMOUNT'
                  Footers = <>
                  Title.Caption = #25968#37327
                  Width = 54
                end
                item
                  EditButtons = <>
                  FieldName = 'AMONEY'
                  Footers = <>
                  Title.Caption = #38144#21806#39069
                  Width = 61
                end
                item
                  EditButtons = <>
                  FieldName = 'REMARK'
                  Footers = <>
                  Title.Caption = #22791#27880
                  Width = 98
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
                  Width = 119
                end>
            end
          end
        end
      end
    end
  end
  inherited RzPanel4: TRzPanel
    Width = 837
    inherited Image1: TImage
      Left = 581
      Width = 236
    end
    inherited Image3: TImage
      Left = 581
      Width = 236
    end
    inherited Image14: TImage
      Left = 817
    end
    inherited rzPanel5: TPanel
      Left = 581
      inherited lblToolCaption: TRzLabel
        Caption = #24403#21069#20301#32622'->'#35843#25320#20986#36135
      end
    end
    inherited CoolBar1: TCoolBar
      Width = 561
      Bands = <
        item
          Break = False
          Control = ToolBar1
          FixedSize = True
          ImageIndex = -1
          MinHeight = 561
          Width = 48
        end>
      inherited ToolBar1: TToolBar
        Width = 561
        object ToolButton17: TToolButton
          Left = 518
          Top = 0
          Action = actExit
        end
      end
    end
  end
  inherited mmMenu: TMainMenu
    Left = 200
    Top = 232
  end
  inherited actList: TActionList
    Left = 256
    Top = 216
    inherited actInfo: TAction
      OnExecute = actInfoExecute
    end
    object actReport: TAction
      Caption = #25253#34920
    end
  end
  inherited ppmReport: TPopupMenu
    AutoHotkeys = maManual
    inherited mnmFormer0: TMenuItem
      Caption = #40664#35748#34920#26679
    end
    inherited mnmFormer1: TMenuItem
      Caption = #33258#23450#20041#19968
    end
    inherited mnmFormer2: TMenuItem
      Caption = #33258#23450#20041#20108
    end
    inherited mnmFormer3: TMenuItem
      Caption = #33258#23450#20041#19977
    end
    inherited mnmFormer4: TMenuItem
      Caption = #33258#23450#20041#22235
    end
    inherited mnmFormer5: TMenuItem
      Caption = #33258#23450#20041#20116
    end
  end
  inherited cdsList: TZQuery
    SortedFields = 'GLIDE_NO'
    AfterScroll = cdsListAfterScroll
    IndexFieldNames = 'GLIDE_NO Asc'
  end
  object frfDBOrder: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    OnGetValue = frfDBOrderGetValue
    OnUserFunction = frfDBOrderUserFunction
    Left = 488
    Top = 201
    ReportForm = {
      18000000D81B0000180000FFFF01000100FFFFFFFFFF00010000340800007805
      00002400000012000000240000002400000000FFFF00000000FFFF0000000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200D60000000B004D61737465724461746131000201000000
      00BE000000F6020000130000003000050001000000000000000000FFFFFF1F00
      0000000C0066724442446174615365743100000000000000FFFF000000000002
      000000010000000000000001000000C800000014000000010000000000000200
      520100000700B7D6D7E9CDB7310002010000000019000000F60200006D000000
      3200100001000000000000000000FFFFFF1F000000001500494E5428285B5345
      514E4F5D2D3129202F2031352900000000000000FFFF00000000000200000001
      0000000000000001000000C80000001400000001000000000000020039020000
      0700B7D6D7E9BDC5310002010000000012010000F60200004A00000030001100
      01000000000000000000FFFFFF1F000000000000000000000700050062656769
      6E0D1E0020696620436F756E74284D61737465724461746131293C3134207468
      656E0D060020626567696E0D260020202020666F7220693A3D436F756E74284D
      617374657244617461312920746F20313320646F0D15002020202053686F7742
      616E64284368696C6431293B0D050020656E643B0D0300656E6400FFFF000000
      000002000000010000000000000001000000C800000014000000010000000000
      0002009F02000006006368696C643100020100000000E8000000F60200001300
      00003000150001000000000000000000FFFFFF1F000000000000000000000000
      00FFFF000000000002000000010000000000000001000000C800000014000000
      0100000000000000002203000006004D656D6F33320002002402000032000000
      27000000120000000100000001000000000000000000FFFFFF1F2E0200000000
      0001000500B5A5BAC53A00000000FFFF00000000000200000001000000000400
      CBCECCE5000A000000020000000000080000008600020000000000FFFFFF0000
      000002000000000000000000AF03000006004D656D6F31340002002E020000BE
      0000008C0000001300000001000F0001000000000000000000FFFFFF1F2E0200
      0000000001000F005B52454D41524B5F44455441494C5D00000000FFFF000000
      00000200000001000000000400CBCECCE5000A00000000000000000009000000
      8600020000000000FFFFFF00000000020000000000000000006F04000006004D
      656D6F3230000200EE000000BE000000F90000001300000001000F0001000000
      000000000000FFFFFF1F2E020000000000010042005B474F44535F4E414D455D
      205B50524F50455254595F30315F544558545D5B50524F50455254595F30325F
      544558545D205B49535F50524553454E545F544558545D00000000FFFF000000
      00000200000001000000000400CBCECCE5000A00000000000000000008000000
      8600020000000000FFFFFF0000000002000000000000000000F904000005004D
      656D6F390002007B00000032000000E400000012000000010002000100000000
      0000000000FFFFFF1F2E02000000000001000D005B434C49454E545F4E414D45
      5D00000000FFFF00000000000200000001000000000400CBCECCE5000A000000
      000000000000080000008600020000000000FFFFFF0000000002000000000000
      0000008305000006004D656D6F3430000200A901000032000000790000001200
      00000100020001000000000000000000FFFFFF1F2E02000000000001000C005B
      53414C45535F444154455D00000000FFFF000000000002000000010000000004
      00CBCECCE5000A000000000000000000080000008600020000000000FFFFFF00
      000000020000000000000000000C06000006004D656D6F3233000200E7010000
      BE000000200000001300000001000F0001000000000000000000FFFFFF1F2E02
      000000000001000B005B554E49545F4E414D455D00000000FFFF000000000002
      00000001000000000400CBCECCE5000A0000000000000000000A000000860002
      0000000000FFFFFF00000000020000000000000000009406000006004D656D6F
      35380002004D020000320000006D000000120000000100020001000000000000
      000000FFFFFF1F2E02000000000001000A005B474C4944455F4E4F5D00000000
      FFFF00000000000200000001000000000400CBCECCE5000A0000000000000000
      00000000008600020000000000FFFFFF00000000020000000000000000003007
      000005004D656D6F3300020007020000BE000000270000001300000001000F00
      01000000000000000000FFFFFF1F2E02000000000001001F005B666F726D6174
      666C6F6174282723302E2323272C5B414D4F554E545D295D00000000FFFF0000
      0000000200000001000000000400CBCECCE5000A000000000000000000090000
      008600020000000000FFFFFF0000000002000000000000000000BD0700000500
      4D656D6F32000200350000001900000085020000180000000100000001000000
      000000000500FFFFFF1F2E020000000000010010005BC6F3D2B5C3FBB3C65DB5
      F7B2A6B5A500000000FFFF00000000000200000001000000000400CBCECCE500
      100000000200000000000A0000008600020000000000FFFFFF00000000020000
      000000000000004408000006004D656D6F313200020035000000320000004600
      0000120000000100000001000000000000000000FFFFFF1F2E02000000000001
      000900B5F720C8EB20B7BD3A00000000FFFF0000000000020000000100000000
      0400CBCECCE5000A000000020000000000080000008600020000000000FFFFFF
      0000000002000000000000000000CB08000006004D656D6F3133000200620100
      003200000045000000120000000100000001000000000000000000FFFFFF1F2E
      02000000000001000900B5F7B2A6C8D5C6DA3A00000000FFFF00000000000200
      000001000000000400CBCECCE5000A0000000200000000000800000086000200
      00000000FFFFFF00000000020000000000000000004F09000006004D656D6F33
      340002002E020000700000008C0000001600000001000F000100000000000000
      0000FFFFFF1F2E02000000000001000600B1B82020D7A200000000FFFF000000
      00000200000001000000000400CBCECCE5000A0000000200000000000A000000
      8600020000000000FFFFFF0000000002000000000000000000D509000006004D
      656D6F3336000200EE00000070000000F90000001600000001000F0001000000
      000000000000FFFFFF1F2E02000000000001000800C9CCC6B7C3FBB3C6000000
      00FFFF00000000000200000001000000000400CBCECCE5000A00000002000000
      00000A0000008600020000000000FFFFFF000000000200000000000000000057
      0A000006004D656D6F3337000200070200007000000027000000160000000100
      0F0001000000000000000000FFFFFF1F2E02000000000001000400CAFDC1BF00
      000000FFFF00000000000200000001000000000400CBCECCE5000A0000000200
      000000000A0000008600020000000000FFFFFF00000000020000000000000000
      00D90A000006004D656D6F3338000200E7010000700000002000000016000000
      01000F0001000000000000000000FFFFFF1F2E02000000000001000400B5A5CE
      BB00000000FFFF00000000000200000001000000000400CBCECCE5000A000000
      0200000000000A0000008600020000000000FFFFFF0000000002000000000000
      000000AF0B000006004D656D6F32350002003500000012010000B10100001300
      000001000E0001000000000000000000FFFFFF1F2E02000000000001005800BA
      CFBCC6BDF0B6EEA3BA205B536D616C6C546F426967285B53414C455F4D4E595D
      295D2020A3A43A5B666F726D6174466C6F6174282723302E3030272C5B53414C
      455F4D4E595D295D20202020202020202020202020202000000000FFFF000000
      00000200000001000000000400CBCECCE5000A00000002000000000008000000
      8600020000000000FFFFFF0000000002000000000000000000330C000006004D
      656D6F3434000200590100002A01000027000000140000000100000001000000
      000000000000FFFFFF1F2E02000000000001000600CAD5BBF5A3BA0000000001
      0000000000000200000001000000000400CBCECCE5000A0000000200FFFFFF1F
      080000008600020000000000FFFFFF0000000002000000000000000000B80C00
      0006004D656D6F353400020035000000BE0000001B0000001300000001000F00
      01000000000000000000FFFFFF1F2E020000000000010007005B5345514E4F5D
      00000000FFFF00000000000200000001000000000400CBCECCE5000A00000000
      00000000000A0000008600020000000000FFFFFF000000000200000000000000
      0000370D000006004D656D6F353500020035000000700000001B000000160000
      0001000F0001000000000000000000FFFFFF1F2E020000000000010001004100
      000000FFFF00000000000200000001000000000400CBCECCE5000A0000000200
      000000000A0000008600020000000000FFFFFF00000000020000000000000000
      00B80D000005004D656D6F3700020050000000700000003E0000001600000001
      000F0001000000000000000000FFFFFF1F2E02000000000001000400BBF5BAC5
      00000000FFFF00000000000200000001000000000400CBCECCE5000A00000002
      00000000000A0000000100020000000000FFFFFF000000000200000000000000
      0000400E000005004D656D6F3800020050000000BE0000003E00000013000000
      01000F0001000000000000000000FFFFFF1F2E02000000000001000B005B474F
      44535F434F44455D00000000FFFF00000000000200000001000000000400CBCE
      CCE5000A000000000000000000080000000100020000000000FFFFFF00000000
      02000000000000000000D60E000006004D656D6F32340002007A020000190000
      0056000000120000000100000001000000000000000000FFFFFF1F2E02000000
      000001001800B5DA5B50414745235D2F5B544F54414C50414745535DD2B30000
      0000FFFF00000000000200000001000000000400CBCECCE5000A000000000000
      000000090000008600020000000000FFFFFF0000000002000000000000000000
      5D0F000006004D656D6F3236000200A801000046000000120100001200000001
      00020001000000000000000000FFFFFF1F2E020000000000010009005B414444
      524553535D00000000FFFF00000000000200000001000000000400CBCECCE500
      0A000000000000000000080000008600020000000000FFFFFF00000000020000
      00000000000000E40F000006004D656D6F323700020062010000460000004600
      0000120000000100000001000000000000000000FFFFFF1F2E02000000000001
      000900CBCDBBF5B5D8D6B73A00000000FFFF0000000000020000000100000000
      0400CBCECCE5000A000000020000000000080000008600020000000000FFFFFF
      00000000020000000000000000006D10000006004D656D6F32380002007B0000
      005B000000E5000000120000000100020001000000000000000000FFFFFF1F2E
      02000000000001000B005B4D4F56455F54454C455D00000000FFFF0000000000
      0200000001000000000400CBCECCE5000A000000000000000000080000008600
      020000000000FFFFFF0000000002000000000000000000F410000006004D656D
      6F3239000200350000005B000000460000001200000001000000010000000000
      00000000FFFFFF1F2E02000000000001000900C1AACFB5B5E7BBB03A00000000
      FFFF00000000000200000001000000000400CBCECCE5000A0000000200000000
      00080000008600020000000000FFFFFF00000000020000000000000000008711
      000005004D656D6F31000200370000002A0100007C0000001400000001000000
      01000000000000000000FFFFFF1F2E02000000000001001600D6C6B5A5A3BA5B
      435245415F555345525F544558545D0000000001000000000000020000000100
      0000000400CBCECCE5000A0000000200FFFFFF1F080000008600020000000000
      FFFFFF00000000020000000000000000000912000006004D656D6F3536000200
      8E00000070000000600000001600000001000F0001000000000000000000FFFF
      FF1F2E02000000000001000400CCF5C2EB00000000FFFF000000000002000000
      01000000000400CBCECCE5000A0000000200000000000A000000010002000000
      0000FFFFFF00000000020000000000000000009012000006004D656D6F353700
      02008E000000BE000000600000001300000001000F0001000000000000000000
      FFFFFF1F2E020000000000010009005B424152434F44455D00000000FFFF0000
      0000000200000001000000000400CBCECCE5000A000000000000000000080000
      000100020000000000FFFFFF00000000020000000000000000006A1300000600
      4D656D6F3539000200BE0200007E000000180000000A01000003000000010000
      00000000000000FFFFFF1F2E020000000000070000000D00000D0800B0D7C1AA
      B5F7B3F60D1E0020202020202020202020202020202020202020202020202020
      20202020200D0800BAECC1AAB5F7C8EB0D140020202020202020202020202020
      202020202020200D0800BBC6C1AAB2C6CEF100000000FFFF0000000000020000
      0001000000000400CBCECCE5000A000000020000000000000000000100020000
      000000FFFFFF0000000002000000000000000000E613000006004D656D6F3630
      0002002E020000E80000008C0000001300000001000F00010000000000000000
      00FFFFFF1F2E020000000000000000000000FFFF000000000002000000010000
      00000400CBCECCE5000A000000000000000000090000008600020000000000FF
      FFFF00000000020000000000000000006214000006004D656D6F3632000200EE
      000000E8000000F90000001300000001000F0001000000000000000000FFFFFF
      1F2E020000000000000000000000FFFF00000000000200000001000000000400
      CBCECCE5000A000000000000000000080000008600020000000000FFFFFF0000
      000002000000000000000000DE14000006004D656D6F3633000200E7010000E8
      000000200000001300000001000F0001000000000000000000FFFFFF1F2E0200
      00000000000000000000FFFF00000000000200000001000000000400CBCECCE5
      000A0000000000000000000A0000008600020000000000FFFFFF000000000200
      00000000000000005A15000006004D656D6F363400020007020000E800000027
      0000001300000001000F0001000000000000000000FFFFFF1F2E020000000000
      000000000000FFFF00000000000200000001000000000400CBCECCE5000A0000
      00000000000000090000008600020000000000FFFFFF00000000020000000000
      00000000D615000006004D656D6F363500020035000000E80000001B00000013
      00000001000F0001000000000000000000FFFFFF1F2E02000000000000000000
      0000FFFF00000000000200000001000000000400CBCECCE5000A000000000000
      0000000A0000008600020000000000FFFFFF0000000002000000000000000000
      5216000006004D656D6F363600020050000000E80000003E0000001300000001
      000F0001000000000000000000FFFFFF1F2E020000000000000000000000FFFF
      00000000000200000001000000000400CBCECCE5000A00000000000000000008
      0000000100020000000000FFFFFF0000000002000000000000000000D0160000
      06004D656D6F36370002008E000000E8000000600000001300000001000F0001
      000000000000000000FFFFFF1F2E0200000000000100000000000000FFFF0000
      0000000200000001000000000400CBCECCE5000A000000000000000000080000
      000100020000000000FFFFFF0000000002000000000000000000A71700000500
      4D656D6F35000200E701000012010000D40000001300000001000B0001000000
      000000000000FFFFFF1F2E02000000000001005A00D7DCCAFDC1BFA3BA5B666F
      726D6174666C6F6174282723302E2323272C5B53414C455F414D545D295D20B1
      BED2B3D0A1BCC6A3BA5B666F726D6174466C6F6174282723302E3023272C5B73
      756D285B414D4F554E545D295D295D00000000FFFF0000000000020000000100
      0000000400CBCECCE5000A000000000000000000090000000100020000000000
      FFFFFF00000000020000000000000000003A18000005004D656D6F3400020037
      0000004601000014010000120000000300000001000000000000000000FFFFFF
      1F2E02000000000001001600B4F2D3A1CAB1BCE43A5B444154455D205B54494D
      455D00000000FFFF00000000000200000001000000000400CBCECCE5000A0000
      00000000000000000000000100020000000000FFFFFF00000000020000000000
      00000000C218000005004D656D6F360002007D00000047000000E30000001200
      00000100020001000000000000000000FFFFFF1F2E02000000000001000B005B
      53484F505F4E414D455D00000000FFFF00000000000200000001000000000400
      CBCECCE5000A000000000000000000080000008600020000000000FFFFFF0000
      0000020000000000000000004919000006004D656D6F31370002003500000047
      00000046000000120000000100000001000000000000000000FFFFFF1F2E0200
      0000000001000900B5F720B3F620B7BD3A00000000FFFF000000000002000000
      01000000000400CBCECCE5000A00000002000000000008000000860002000000
      0000FFFFFF0000000002000000000000000000CD19000006004D656D6F313900
      0200C50000002A01000028000000140000000100000001000000000000000000
      FFFFFF1F2E02000000000001000600B7A2BBF5A3BA0000000001000000000000
      0200000001000000000400CBCECCE5000A0000000200FFFFFF1F080000008600
      020000000000FFFFFF0000000002000000000000000000541A000006004D656D
      6F3231000200620100005B000000440000001200000001000000010000000000
      00000000FFFFFF1F2E02000000000001000900B1B8A1A1A1A1D7A23A00000000
      FFFF00000000000200000001000000000400CBCECCE5000A0000000200000000
      00080000008600020000000000FFFFFF0000000002000000000000000000DA1A
      000006004D656D6F3335000200A80100005B0000001201000012000000010002
      0001000000000000000000FFFFFF1F2E020000000000010008005B52454D4152
      4B5D00000000FFFF00000000000200000001000000000400CBCECCE5000A0000
      00000000000000080000008600020000000000FFFFFF00000000020000000000
      000000005E1B000006004D656D6F3130000200EC0100002A0100002700000014
      0000000100000001000000000000000000FFFFFF1F2E02000000000001000600
      B3D0D4CBA3BA00000000010000000000000200000001000000000400CBCECCE5
      000A0000000200FFFFFF1F080000008600020000000000FFFFFF000000000200
      000000000000FEFEFF060000000A00205661726961626C657300000000020073
      6C0014006364735F436867426F64792E22534C30303030220002006A65001400
      6364735F436867426F64792E224A4530303030220004006B6879680000000004
      0079687A68000000000200647A000000000000000000000000FDFF0100000000}
  end
end
