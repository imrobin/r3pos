inherited frmKpiIndex: TfrmKpiIndex
  Left = 203
  Top = 114
  Width = 1008
  Height = 573
  Caption = #32771#26680#25351#26631#31649#29702
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  inherited bgPanel: TRzPanel
    Width = 992
    Height = 498
    inherited RzPanel2: TRzPanel
      Width = 982
      Height = 488
      inherited RzPage: TRzPageControl
        Width = 976
        Height = 482
        FixedDimension = 25
        inherited TabSheet1: TRzTabSheet
          inherited RzPanel3: TRzPanel
            Width = 974
            Height = 455
            object RzPanel1: TRzPanel
              Left = 5
              Top = 5
              Width = 964
              Height = 82
              Align = alTop
              BorderOuter = fsNone
              TabOrder = 0
              DesignSize = (
                964
                82)
              object Label3: TLabel
                Left = 21
                Top = 60
                Width = 65
                Height = 12
                Caption = #26597#35810#20851#20581#23383
                Font.Charset = GB2312_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #23435#20307
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label1: TLabel
                Left = 5
                Top = 47
                Width = 7
                Height = 12
                Font.Charset = GB2312_CHARSET
                Font.Color = clNavy
                Font.Height = -12
                Font.Name = #23435#20307
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Bevel1: TBevel
                Left = 162
                Top = 44
                Width = 803
                Height = 2
                Anchors = [akLeft, akTop, akRight]
              end
              object lab_IDX_TYPE: TRzLabel
                Left = -32
                Top = 13
                Width = 100
                Height = 12
                Alignment = taRightJustify
                AutoSize = False
                Caption = #25351#26631#31867#22411
                Font.Charset = GB2312_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = #23435#20307
                Font.Style = []
                ParentFont = False
              end
              object lab_KPI_TYPE: TLabel
                Left = 201
                Top = 13
                Width = 100
                Height = 12
                Alignment = taRightJustify
                AutoSize = False
                Caption = #32771#26680#31867#22411
                Font.Charset = GB2312_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = #23435#20307
                Font.Style = []
                ParentFont = False
              end
              object Label2: TLabel
                Left = 21
                Top = 38
                Width = 130
                Height = 12
                Caption = #25903#25345#65288#25351#26631#21517#31216#65289#26597#35810
                Font.Charset = GB2312_CHARSET
                Font.Color = clNavy
                Font.Height = -12
                Font.Name = #23435#20307
                Font.Style = [fsBold]
                ParentFont = False
              end
              object edtKey: TcxTextEdit
                Left = 90
                Top = 56
                Width = 203
                Height = 20
                TabOrder = 2
                ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
              end
              object btnOk: TRzBitBtn
                Left = 301
                Top = 54
                Width = 67
                Height = 24
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
              object fndIDX_TYPE: TcxComboBox
                Left = 74
                Top = 9
                Width = 121
                Height = 20
                Properties.DropDownListStyle = lsFixedList
                TabOrder = 0
              end
              object fndKPI_TYPE: TcxComboBox
                Left = 307
                Top = 9
                Width = 121
                Height = 20
                Properties.DropDownListStyle = lsFixedList
                TabOrder = 1
              end
            end
            object RzPanel6: TRzPanel
              Left = 5
              Top = 87
              Width = 964
              Height = 363
              Align = alClient
              BorderOuter = fsNone
              TabOrder = 1
              object DBGridEh1: TDBGridEh
                Left = 0
                Top = 0
                Width = 964
                Height = 363
                Align = alClient
                DataSource = Ds_KpiIndex
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
                Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                OptionsEh = [dghFixed3D, dghFrozen3D, dghHighlightFocus, dghClearSelection]
                ReadOnly = True
                RowHeight = 20
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
                OnGetCellParams = DBGridEh1GetCellParams
                Columns = <
                  item
                    EditButtons = <>
                    FieldName = 'SEQNO'
                    Footers = <>
                    Title.Caption = #24207#21495
                    Width = 35
                  end
                  item
                    EditButtons = <>
                    FieldName = 'KPI_NAME'
                    Footers = <>
                    Title.Caption = #25351#26631#21517#31216
                    Width = 150
                  end
                  item
                    EditButtons = <>
                    FieldName = 'UNIT_NAME'
                    Footers = <>
                    Title.Caption = #21333#20301
                    Width = 30
                  end
                  item
                    EditButtons = <>
                    FieldName = 'IDX_TYPE'
                    Footers = <>
                    Title.Caption = #25351#26631#31867#22411
                    Width = 100
                  end
                  item
                    EditButtons = <>
                    FieldName = 'KPI_TYPE'
                    Footers = <>
                    Title.Caption = #32771#26680#31867#22411
                    Width = 100
                  end
                  item
                    EditButtons = <>
                    FieldName = 'GOODS_SUM'
                    Footers = <>
                    Title.Caption = #21830#21697#25968
                    Width = 50
                  end
                  item
                    EditButtons = <>
                    FieldName = 'REMARK'
                    Footers = <>
                    Title.Caption = #22791'  '#27880
                    Width = 200
                  end>
              end
            end
          end
        end
      end
    end
  end
  inherited RzPanel4: TRzPanel
    Width = 992
    inherited Image3: TImage
      Left = 323
      Width = 629
    end
    inherited Image14: TImage
      Left = 972
    end
    inherited Image1: TImage
      Left = 952
    end
    inherited rzPanel5: TPanel
      Left = 323
    end
    inherited CoolBar1: TCoolBar
      Width = 303
      Bands = <
        item
          Break = False
          Control = ToolBar1
          FixedSize = True
          ImageIndex = -1
          MinHeight = 303
          Width = 48
        end>
      inherited ToolBar1: TToolBar
        Width = 303
        ButtonWidth = 43
        object Btn_Add: TToolButton
          Left = 0
          Top = 0
          Action = actNew
        end
        object Btn_Edit: TToolButton
          Left = 43
          Top = 0
          Action = actEdit
        end
        object Btn_Info: TToolButton
          Left = 86
          Top = 0
          Action = actInfo
        end
        object Btn_Delete: TToolButton
          Left = 129
          Top = 0
          Action = actDelete
        end
        object ToolButton5: TToolButton
          Left = 172
          Top = 0
          Width = 2
          Caption = 'ToolButton5'
          ImageIndex = 4
          Style = tbsDivider
        end
        object Btn_Print: TToolButton
          Left = 174
          Top = 0
          Action = actPrint
        end
        object Btn_Preview: TToolButton
          Left = 217
          Top = 0
          Action = actPreview
        end
        object Btn_Exit: TToolButton
          Left = 260
          Top = 0
          Action = actExit
        end
      end
    end
  end
  inherited mmMenu: TMainMenu
    Left = 200
    Top = 224
  end
  inherited actList: TActionList
    Left = 232
    Top = 224
    inherited actNew: TAction
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
      OnExecute = actInfoExecute
    end
  end
  object Cds_KpiIndex: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    Params = <>
    Left = 199
    Top = 256
  end
  object Ds_KpiIndex: TDataSource
    DataSet = Cds_KpiIndex
    Left = 233
    Top = 256
  end
  object PrintDBGridEh1: TPrintDBGridEh
    Options = []
    Page.BottomMargin = 2.000000000000000000
    Page.LeftMargin = 2.000000000000000000
    Page.RightMargin = 2.000000000000000000
    Page.TopMargin = 2.000000000000000000
    PageFooter.Font.Charset = DEFAULT_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -11
    PageFooter.Font.Name = 'MS Sans Serif'
    PageFooter.Font.Style = []
    PageHeader.Font.Charset = DEFAULT_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -11
    PageHeader.Font.Name = 'MS Sans Serif'
    PageHeader.Font.Style = []
    Units = MM
    Left = 264
    Top = 224
  end
end
