object frmTimer: TfrmTimer
  Left = 286
  Top = 277
  ActiveControl = edtMonthDay
  BorderStyle = bsDialog
  Caption = #20219#21153#35843#24230
  ClientHeight = 268
  ClientWidth = 417
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 12
  object RzPageControl1: TRzPageControl
    Left = 1
    Top = 2
    Width = 416
    Height = 266
    ActivePage = TabSheet1
    TabIndex = 0
    TabOrder = 0
    FixedDimension = 18
    object TabSheet1: TRzTabSheet
      Caption = #25191#34892#26102#38388
      object GroupBox2: TGroupBox
        Left = 95
        Top = 9
        Width = 308
        Height = 113
        Caption = #27599#22825
        TabOrder = 1
        object Label3: TLabel
          Left = 17
          Top = 27
          Width = 120
          Height = 12
          Caption = #27599'        '#22825#21457#29983#19968#27425
        end
        object edtDayIntrl: TcxSpinEdit
          Left = 37
          Top = 22
          Width = 40
          Height = 20
          TabOrder = 0
          Value = 1
        end
      end
      object GroupBox3: TGroupBox
        Left = 95
        Top = 9
        Width = 308
        Height = 113
        Caption = #27599#21608
        TabOrder = 2
        object Label5: TLabel
          Left = 26
          Top = 27
          Width = 114
          Height = 12
          Caption = #27599'        '#21608#21457#29983' '#22312
        end
        object edtWeekIntrl: TcxSpinEdit
          Left = 46
          Top = 22
          Width = 40
          Height = 20
          TabOrder = 0
          Value = 1
        end
        object edtWeek2: TcxCheckBox
          Left = 22
          Top = 52
          Width = 57
          Height = 21
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #21608#19968
          TabOrder = 1
        end
        object edtWeek3: TcxCheckBox
          Left = 82
          Top = 52
          Width = 58
          Height = 21
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #21608#20108
          TabOrder = 2
        end
        object edtWeek4: TcxCheckBox
          Left = 143
          Top = 52
          Width = 57
          Height = 21
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #21608#19977
          TabOrder = 3
        end
        object edtWeek5: TcxCheckBox
          Left = 204
          Top = 52
          Width = 57
          Height = 21
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #21608#22235
          TabOrder = 4
        end
        object edtWeek6: TcxCheckBox
          Left = 22
          Top = 78
          Width = 57
          Height = 21
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #21608#20116
          TabOrder = 5
        end
        object edtWeek7: TcxCheckBox
          Left = 82
          Top = 78
          Width = 58
          Height = 21
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #21608#20845
          TabOrder = 6
        end
        object edtWeek1: TcxCheckBox
          Left = 143
          Top = 78
          Width = 57
          Height = 21
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #21608#26085
          TabOrder = 7
        end
      end
      object edtTimerType: TRadioGroup
        Left = 9
        Top = 9
        Width = 79
        Height = 113
        Caption = #21457#29983#39057#29575
        Items.Strings = (
          #20851#38381
          #27599#22825
          #27599#21608
          #27599#26376)
        TabOrder = 0
        OnClick = edtTimerTypeClick
      end
      object GroupBox5: TGroupBox
        Left = 9
        Top = 130
        Width = 394
        Height = 71
        Caption = #27599#26085#21457#29983#39057#29575
        TabOrder = 3
        object Label1: TLabel
          Left = 25
          Top = 20
          Width = 72
          Height = 12
          Caption = #19968#27425#24615#21457#29983#20110
        end
        object Label2: TLabel
          Left = 25
          Top = 44
          Width = 156
          Height = 12
          Caption = #21608#26399#24615#21457#29983#38388#38548'        '#20998#38047
        end
        object dm1: TRadioButton
          Left = 8
          Top = 18
          Width = 13
          Height = 17
          Caption = 'RadioButton1'
          Checked = True
          TabOrder = 0
          TabStop = True
        end
        object dm2: TRadioButton
          Left = 8
          Top = 42
          Width = 13
          Height = 17
          Caption = 'RadioButton1'
          TabOrder = 1
        end
        object edtTime: TMaskEdit
          Left = 104
          Top = 16
          Width = 80
          Height = 20
          EditMask = '!90:00:00;1;_'
          MaxLength = 8
          TabOrder = 2
          Text = '00:00:00'
        end
        object edtTimeIntrl: TSpinEdit
          Left = 115
          Top = 40
          Width = 39
          Height = 21
          MaxValue = 0
          MinValue = 0
          TabOrder = 3
          Value = 0
        end
      end
      object cxBtnOk: TRzBitBtn
        Left = 209
        Top = 207
        Width = 81
        Height = 27
        Caption = #30830#23450
        Color = 15791348
        HighlightColor = 16026986
        HotTrack = True
        HotTrackColor = 3983359
        TabOrder = 4
        OnClick = cxBtnOkClick
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          0800000000000002000000000000000000000001000000000000000000003300
          00006600000099000000CC000000FF0000000033000033330000663300009933
          0000CC330000FF33000000660000336600006666000099660000CC660000FF66
          000000990000339900006699000099990000CC990000FF99000000CC000033CC
          000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
          0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
          330000333300333333006633330099333300CC333300FF333300006633003366
          33006666330099663300CC663300FF6633000099330033993300669933009999
          3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
          330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
          66006600660099006600CC006600FF0066000033660033336600663366009933
          6600CC336600FF33660000666600336666006666660099666600CC666600FF66
          660000996600339966006699660099996600CC996600FF99660000CC660033CC
          660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
          6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
          990000339900333399006633990099339900CC339900FF339900006699003366
          99006666990099669900CC669900FF6699000099990033999900669999009999
          9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
          990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
          CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
          CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
          CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
          CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
          CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
          FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
          FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
          FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
          FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
          000000808000800000008000800080800000C0C0C00080808000191919004C4C
          4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
          6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8180C
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E2DFE8E8E8E8E8E8E8E8E8E8E8E8E8181212
          0CE8E8E8E8E8E8E8E8E8E8E8E8E28181DFE8E8E8E8E8E8E8E8E8E8E818121212
          120CE8E8E8E8E8E8E8E8E8E8E281818181DFE8E8E8E8E8E8E8E8E81812121212
          12120CE8E8E8E8E8E8E8E8E2818181818181DFE8E8E8E8E8E8E8E81812120C18
          1212120CE8E8E8E8E8E8E8E28181DFE2818181DFE8E8E8E8E8E8E818120CE8E8
          181212120CE8E8E8E8E8E8E281DFE8E8E2818181DFE8E8E8E8E8E8180CE8E8E8
          E8181212120CE8E8E8E8E8E2DFE8E8E8E8E2818181DFE8E8E8E8E8E8E8E8E8E8
          E8E8181212120CE8E8E8E8E8E8E8E8E8E8E8E2818181DFE8E8E8E8E8E8E8E8E8
          E8E8E8181212120CE8E8E8E8E8E8E8E8E8E8E8E2818181DFE8E8E8E8E8E8E8E8
          E8E8E8E8181212120CE8E8E8E8E8E8E8E8E8E8E8E2818181DFE8E8E8E8E8E8E8
          E8E8E8E8E81812120CE8E8E8E8E8E8E8E8E8E8E8E8E28181DFE8E8E8E8E8E8E8
          E8E8E8E8E8E818120CE8E8E8E8E8E8E8E8E8E8E8E8E8E281DFE8E8E8E8E8E8E8
          E8E8E8E8E8E8E8180CE8E8E8E8E8E8E8E8E8E8E8E8E8E8E2DFE8E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
        NumGlyphs = 2
      end
      object cxbtnCancel: TRzBitBtn
        Left = 304
        Top = 207
        Width = 82
        Height = 27
        Cancel = True
        ModalResult = 2
        Caption = #21462#28040
        Color = 15791348
        HighlightColor = 16026986
        HotTrack = True
        HotTrackColor = 3983359
        TabOrder = 5
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          0800000000000002000000000000000000000001000000000000000000003300
          00006600000099000000CC000000FF0000000033000033330000663300009933
          0000CC330000FF33000000660000336600006666000099660000CC660000FF66
          000000990000339900006699000099990000CC990000FF99000000CC000033CC
          000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
          0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
          330000333300333333006633330099333300CC333300FF333300006633003366
          33006666330099663300CC663300FF6633000099330033993300669933009999
          3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
          330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
          66006600660099006600CC006600FF0066000033660033336600663366009933
          6600CC336600FF33660000666600336666006666660099666600CC666600FF66
          660000996600339966006699660099996600CC996600FF99660000CC660033CC
          660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
          6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
          990000339900333399006633990099339900CC339900FF339900006699003366
          99006666990099669900CC669900FF6699000099990033999900669999009999
          9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
          990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
          CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
          CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
          CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
          CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
          CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
          FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
          FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
          FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
          FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
          000000808000800000008000800080800000C0C0C00080808000191919004C4C
          4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
          6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8B46C6C6CE8
          E8E8E8E8B46C6C6CE8E8E8E2DFDFDFE8E8E8E8E8E2DFDFDFE8E8E8B49090906C
          E8E8E8B49090906CE8E8E8E2818181DFE8E8E8E2818181DFE8E8E8E8B4909090
          6CE8B49090906CE8E8E8E8E8E2818181DFE8E2818181DFE8E8E8E8E8E8B49090
          906C9090906CE8E8E8E8E8E8E8E2818181DF818181DFE8E8E8E8E8E8E8E8B490
          909090906CE8E8E8E8E8E8E8E8E8E28181818181DFE8E8E8E8E8E8E8E8E8E8B4
          9090906CE8E8E8E8E8E8E8E8E8E8E8E2818181DFE8E8E8E8E8E8E8E8E8E8B490
          909090906CE8E8E8E8E8E8E8E8E8E28181818181DFE8E8E8E8E8E8E8E8B49090
          906C9090906CE8E8E8E8E8E8E8E2818181DF818181DFE8E8E8E8E8E8B4909090
          6CE8B49090906CE8E8E8E8E8E2818181DFE8E2818181DFE8E8E8E8B49090906C
          E8E8E8B49090906CE8E8E8E2818181DFE8E8E8E2818181DFE8E8E8B4B4B4B4E8
          E8E8E8E8B4B4B4B4E8E8E8E2E2E2E2E8E8E8E8E8E2E2E2E2E8E8E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
        NumGlyphs = 2
      end
      object GroupBox4: TGroupBox
        Left = 95
        Top = 9
        Width = 308
        Height = 113
        Caption = #27599#26376
        TabOrder = 6
        object Label4: TLabel
          Left = 27
          Top = 27
          Width = 174
          Height = 12
          Caption = #27599#26376#30340'                '#21495#21457#29983' '
        end
        object Label6: TLabel
          Left = 27
          Top = 64
          Width = 210
          Height = 12
          Caption = #27599#26376#30340'                       '#21457#29983#22312
        end
        object rm1: TRadioButton
          Left = 12
          Top = 25
          Width = 15
          Height = 17
          Caption = 'rm1'
          Checked = True
          TabOrder = 0
          TabStop = True
        end
        object rm2: TRadioButton
          Left = 12
          Top = 62
          Width = 15
          Height = 17
          Caption = 'RadioButton1'
          TabOrder = 1
        end
        object edtMonthDay: TSpinEdit
          Left = 68
          Top = 23
          Width = 38
          Height = 21
          MaxValue = 31
          MinValue = 1
          TabOrder = 2
          Value = 1
        end
        object edtMonthEntr: TComboBox
          Left = 68
          Top = 60
          Width = 62
          Height = 20
          Style = csDropDownList
          ItemHeight = 12
          TabOrder = 3
          Items.Strings = (
            #31532#19968#21608
            #31532#20108#21608
            #31532#19977#21608
            #26368#21518#19968#21608)
        end
        object edtMonthWeek: TComboBox
          Left = 176
          Top = 60
          Width = 62
          Height = 20
          Style = csDropDownList
          ItemHeight = 12
          TabOrder = 4
          Items.Strings = (
            #26143#26399#19968
            #26143#26399#20108
            #26143#26399#19977
            #26143#26399#22235
            #26143#26399#20116
            #26143#26399#20845
            #26143#26399#22825)
        end
      end
      object GroupBox1: TGroupBox
        Left = 95
        Top = 9
        Width = 308
        Height = 113
        Caption = #20851#38381#29366#24577
        TabOrder = 7
        object Label7: TLabel
          Left = 12
          Top = 30
          Width = 186
          Height = 12
          Caption = #22312#20851#38381#29366#24577#19979#65292#23558#19981#25191#34892#20219#20309#25805#20316'.'
        end
      end
    end
  end
end
