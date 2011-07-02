object frmPotenAnaly: TfrmPotenAnaly
  Left = 0
  Top = 0
  Width = 1028
  Height = 236
  TabOrder = 0
  OnResize = FrameResize
  object Splitter1: TSplitter
    Left = 500
    Top = 0
    Width = 6
    Height = 236
    Color = clWhite
    ParentColor = False
  end
  object Pnl_Left: TPanel
    Left = 0
    Top = 0
    Width = 500
    Height = 236
    Align = alLeft
    BevelOuter = bvNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Panel1: TPanel
      Left = 0
      Top = 28
      Width = 500
      Height = 208
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 0
      object DBGridEh1: TDBGridEh
        Left = 1
        Top = 1
        Width = 498
        Height = 206
        Align = alClient
        AllowedOperations = []
        AutoFitColWidths = True
        BorderStyle = bsNone
        Color = clWhite
        Ctl3D = True
        DataSource = dsMaxAnaly
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
        HorzScrollBar.Visible = False
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
        VertScrollBar.VisibleMode = sbNeverShowEh
        IsDrawNullRow = False
        CurrencySymbol = #65509
        DecimalNumber = 2
        DigitalNumber = 12
        OnDrawColumnCell = DBGridEh1DrawColumnCell
        Columns = <
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'SEQNO'
            Footers = <>
            Title.Caption = #24207#21495
            Title.Color = clWhite
            Width = 30
          end
          item
            EditButtons = <>
            FieldName = 'GODS_CODE'
            Footers = <>
            Title.Caption = #36135#21495
            Title.Color = clWhite
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'GODS_NAME'
            Footers = <>
            Title.Caption = #21830#21697#21517#31216
            Title.Color = clWhite
            Width = 130
          end
          item
            DisplayFormat = '#0.###'
            EditButtons = <>
            FieldName = 'MNY_SUM'
            Footer.DisplayFormat = '#0.###'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #38144#21806#39069
            Title.Color = clWhite
            Width = 80
          end
          item
            DisplayFormat = '#0.###'
            EditButtons = <>
            FieldName = 'PRF_SUM'
            Footer.DisplayFormat = '#0.###'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #27611#21033
            Title.Color = clWhite
            Width = 65
          end
          item
            EditButtons = <>
            FieldName = 'AMT_SUM'
            Footer.DisplayFormat = '#0.##'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #38144#37327
            Title.Color = clWhite
            Width = 70
          end
          item
            EditButtons = <>
            FieldName = 'OrderNo'
            Footers = <>
            Title.Caption = #25490#21517
            Title.Color = clWhite
            Width = 32
          end>
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 500
      Height = 28
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object PnlTop1: TPanel
        Left = 0
        Top = 0
        Width = 409
        Height = 28
        Align = alClient
        BevelOuter = bvNone
        Caption = #21367#28895#21830#21697#65288#38144#21806#39069#65289#25490#21517
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object RightPnl: TPanel
        Left = 409
        Top = 0
        Width = 91
        Height = 28
        Align = alRight
        BevelOuter = bvNone
        Color = clWhite
        TabOrder = 1
        object Label1: TLabel
          Left = 5
          Top = 7
          Width = 12
          Height = 12
          Caption = #21069
        end
        object Label2: TLabel
          Left = 71
          Top = 7
          Width = 12
          Height = 12
          Caption = #21517
        end
        object edtMaxNo: TcxComboBox
          Left = 19
          Top = 4
          Width = 50
          Height = 19
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            '5'
            '6'
            '7'
            '8'
            '9'
            '10'
            '11'
            '12'
            '13'
            '14'
            '15'
            '16'
            '17'
            '18'
            '19'
            '20'
            '25'
            '30'
            '35'
            '40'
            '50'
            '80'
            '100')
          Properties.OnChange = edtOrderNoPropertiesChange
          Style.Font.Charset = GB2312_CHARSET
          Style.Font.Color = clRed
          Style.Font.Height = -11
          Style.Font.Name = #23435#20307
          Style.Font.Style = [fsBold]
          TabOrder = 0
          Text = '5'
        end
      end
    end
  end
  object Pnl_Right: TPanel
    Left = 506
    Top = 0
    Width = 522
    Height = 236
    Align = alClient
    BevelOuter = bvNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Panel4: TPanel
      Left = 0
      Top = 28
      Width = 522
      Height = 208
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 0
      object DBGridEh2: TDBGridEh
        Left = 1
        Top = 1
        Width = 520
        Height = 206
        Align = alClient
        AllowedOperations = []
        AutoFitColWidths = True
        BorderStyle = bsNone
        Color = clWhite
        Ctl3D = True
        DataSource = dsMinAnaly
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
        HorzScrollBar.Visible = False
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
        VertScrollBar.VisibleMode = sbNeverShowEh
        IsDrawNullRow = False
        CurrencySymbol = #65509
        DecimalNumber = 2
        DigitalNumber = 12
        OnDrawColumnCell = DBGridEh1DrawColumnCell
        Columns = <
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'SEQNO'
            Footers = <>
            Title.Caption = #24207#21495
            Title.Color = clWhite
            Width = 30
          end
          item
            EditButtons = <>
            FieldName = 'GODS_CODE'
            Footers = <>
            Title.Caption = #36135#21495
            Title.Color = clWhite
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'GODS_NAME'
            Footers = <>
            Title.Caption = #21830#21697#21517#31216
            Title.Color = clWhite
            Width = 130
          end
          item
            DisplayFormat = '#0.###'
            EditButtons = <>
            FieldName = 'MNY_SUM'
            Footer.DisplayFormat = '#0.###'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #38144#21806#39069
            Title.Color = clWhite
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'PRF_SUM'
            Footer.DisplayFormat = '#0.###'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #27611#21033
            Title.Color = clWhite
            Width = 65
          end
          item
            EditButtons = <>
            FieldName = 'AMT_SUM'
            Footer.DisplayFormat = '#0.##'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #21806#37327
            Title.Color = clWhite
            Width = 70
          end
          item
            EditButtons = <>
            FieldName = 'OrderNo'
            Footers = <>
            Title.Caption = #25490#21517
            Title.Color = clWhite
            Width = 32
          end>
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 522
      Height = 28
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object Panel5: TPanel
        Left = 434
        Top = 0
        Width = 88
        Height = 28
        Align = alRight
        BevelOuter = bvNone
        Color = clWhite
        TabOrder = 0
        object Label3: TLabel
          Left = 5
          Top = 7
          Width = 12
          Height = 12
          Caption = #21069
        end
        object Label4: TLabel
          Left = 70
          Top = 7
          Width = 12
          Height = 12
          Caption = #21517
        end
        object edtMinNo: TcxComboBox
          Left = 19
          Top = 4
          Width = 50
          Height = 19
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            '5'
            '6'
            '7'
            '8'
            '9'
            '10'
            '11'
            '12'
            '13'
            '14'
            '15'
            '16'
            '17'
            '18'
            '19'
            '20'
            '25'
            '30'
            '35'
            '40'
            '50'
            '80'
            '100')
          Properties.OnChange = edtMinNoPropertiesChange
          Style.Font.Charset = GB2312_CHARSET
          Style.Font.Color = clRed
          Style.Font.Height = -11
          Style.Font.Name = #23435#20307
          Style.Font.Style = [fsBold]
          TabOrder = 0
          Text = '5'
        end
      end
      object PnlTop2: TPanel
        Left = 94
        Top = 0
        Width = 340
        Height = 28
        Align = alClient
        BevelOuter = bvNone
        Caption = #21367#28895#21830#21697#65288#38144#21806#39069#65289#25490#21517
        Color = clWhite
        TabOrder = 1
      end
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 94
        Height = 28
        Align = alLeft
        BevelOuter = bvNone
        Color = clWhite
        TabOrder = 2
        object CB_NotSale: TcxCheckBox
          Left = -1
          Top = 5
          Width = 96
          Height = 21
          Properties.DisplayUnchecked = 'False'
          Properties.OnChange = CB_NotSalePropertiesChange
          Properties.Caption = #19981#26174#31034#26080#38144#21806
          TabOrder = 0
        end
      end
    end
  end
  object dsMaxAnaly: TDataSource
    DataSet = MaxAnaly
    Left = 33
    Top = 90
  end
  object adoReport: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    Params = <>
    Left = 32
    Top = 28
  end
  object MaxAnaly: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    Params = <>
    Left = 32
    Top = 60
  end
  object MinAnaly: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    Params = <>
    Left = 528
    Top = 28
  end
  object dsMinAnaly: TDataSource
    DataSet = MinAnaly
    Left = 529
    Top = 66
  end
end
