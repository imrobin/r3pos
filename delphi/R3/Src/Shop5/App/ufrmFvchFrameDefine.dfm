inherited frmFvchFrameDefine: TfrmFvchFrameDefine
  Left = 563
  Top = 201
  Caption = #20973#35777#36873#39033
  ClientHeight = 394
  ClientWidth = 347
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  inherited bgPanel: TRzPanel
    Width = 347
    Height = 394
    BorderColor = clWhite
    Color = clWhite
    inherited RzPage: TRzPageControl
      Top = 71
      Width = 337
      Height = 278
      Align = alBottom
      TabIndex = -1
      FixedDimension = 20
      inherited TabSheet1: TRzTabSheet
        Color = clWhite
        TabVisible = False
        Caption = #39033#30446#36873#39033
        inherited RzPanel2: TRzPanel
          Width = 333
          Height = 274
          BorderColor = clWhite
          Color = clWhite
          object Label16: TLabel
            Left = 15
            Top = 8
            Width = 60
            Height = 12
            Caption = #25968#25454#36873#39033#65306
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object edtSORT_ID: TcxComboBox
            Left = 74
            Top = 4
            Width = 121
            Height = 20
            Properties.DropDownListStyle = lsFixedList
            Properties.OnChange = edtSORT_IDPropertiesChange
            TabOrder = 0
          end
          object RzPanel4: TRzPanel
            Left = 5
            Top = 24
            Width = 323
            Height = 245
            Align = alBottom
            BorderOuter = fsNone
            BorderColor = clWhite
            BorderWidth = 10
            Color = clWhite
            TabOrder = 3
            object DataTree: TRzCheckTree
              Left = 10
              Top = 10
              Width = 303
              Height = 225
              OnStateChange = DataTreeStateChange
              Align = alClient
              Font.Charset = GB2312_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              FrameVisible = True
              Indent = 19
              ParentFont = False
              ReadOnly = False
              RowSelect = True
              SelectionPen.Color = clBtnShadow
              StateImages = DataTree.CheckImages
              TabOrder = 0
            end
          end
          object edtIn: TcxRadioButton
            Left = 200
            Top = 6
            Width = 49
            Height = 17
            Caption = #21253#21547
            TabOrder = 1
          end
          object edtNotIn: TcxRadioButton
            Left = 248
            Top = 6
            Width = 65
            Height = 17
            Caption = #19981#21253#21547
            TabOrder = 2
          end
        end
      end
    end
    inherited btPanel: TRzPanel
      Top = 349
      Width = 337
      Color = clWhite
      object btnSave: TRzBitBtn
        Left = 171
        Top = 9
        Width = 67
        Height = 26
        Anchors = [akTop, akRight]
        Caption = #30830#23450'(&S)'
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
        OnClick = btnSaveClick
        NumGlyphs = 2
        Spacing = 5
      end
      object btnExit: TRzBitBtn
        Left = 258
        Top = 9
        Width = 67
        Height = 26
        Anchors = [akTop, akRight]
        Caption = #21462#28040'(&C)'
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
        OnClick = btnExitClick
        NumGlyphs = 2
        Spacing = 5
      end
    end
    object RzGroupBox1: TRzGroupBox
      Left = 8
      Top = 4
      Width = 331
      Height = 64
      Caption = #26126#32454#36873#39033
      Color = clWhite
      TabOrder = 2
      object edtDATAFLAG_1: TcxCheckBox
        Left = 7
        Top = 16
        Width = 49
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #20154#21592
        TabOrder = 0
      end
      object edtDATAFLAG_3: TcxCheckBox
        Left = 70
        Top = 16
        Width = 49
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #38376#24215
        TabOrder = 1
      end
      object edtDATAFLAG_2: TcxCheckBox
        Left = 138
        Top = 16
        Width = 49
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #37096#38376
        TabOrder = 2
      end
      object edtDATAFLAG_4: TcxCheckBox
        Left = 203
        Top = 16
        Width = 73
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #24448#26469#21333#20301
        TabOrder = 3
      end
      object edtDATAFLAG_5: TcxCheckBox
        Left = 7
        Top = 39
        Width = 54
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #19987#39033'1'
        TabOrder = 4
      end
      object edtDATAFLAG_7: TcxCheckBox
        Left = 138
        Top = 39
        Width = 54
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #19987#39033'3'
        TabOrder = 6
      end
      object edtDATAFLAG_6: TcxCheckBox
        Left = 70
        Top = 39
        Width = 54
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #19987#39033'2'
        TabOrder = 5
      end
      object edtDATAFLAG_8: TcxCheckBox
        Left = 203
        Top = 39
        Width = 54
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #19987#39033'4'
        TabOrder = 7
      end
      object edtDATAFLAG_9: TcxCheckBox
        Left = 273
        Top = 39
        Width = 54
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #19987#39033'5'
        TabOrder = 8
      end
    end
  end
  inherited mmMenu: TMainMenu
    Left = 8
    Top = 440
  end
  inherited actList: TActionList
    Left = 37
    Top = 440
  end
end
